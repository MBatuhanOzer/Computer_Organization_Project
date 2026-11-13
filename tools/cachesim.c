// CMPE3209 Stage 4: data cache simulator
// Write-through + write-allocate, LRU replacement, set-associative (direct / n-way / fully).
//
// Usage: cachesim <trace.csv> <size> <line> <ways> [-v N] [-s]
//   ways = 0   fully associative (one set holding every line)
//   -v N       print the first N references in detail (to compare with the hand simulation)
//   -s         print the cache state after the -v window and at the end
// Without arguments it runs the personal configuration on trace.csv, looked up in the current
// folder and then one level up (project root, or build-od/ when started from Visual Studio):
//   cachesim trace.csv 256 16 4 -v 30 -s
//
// Address fields use the low 32 bits of each address (64-bit ISA, assignment section 4a):
//   word = addr[w-1:0], set = addr[w+d-1:w], tag = addr[31:w+d]
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned int u32;
typedef int s32;
typedef unsigned long long u64;

#define MAX_LINES 1024
#define MAX_REFS  100000

typedef struct {
    s32 valid;
    u32 tag;
    u64 last_use;                 // LRU timestamp: larger = more recently used
} Line;

typedef struct {
    char rw;
    u64 addr;
    s32 size;
} Ref;

static Ref refs[MAX_REFS];
static Line cache[MAX_LINES];
static u32 seen_block[MAX_REFS];  // blocks ever loaded, to tell compulsory from conflict/capacity misses
static s32 seen_count = 0;

static s32 log2u(u32 x)
{
    s32 n = 0;
    while ((1u << n) < x) { n++; }
    return n;
}

static s32 was_seen(u32 block)
{
    for (s32 i = 0; i < seen_count; i++) {
        if (seen_block[i] == block) {
            return 1;
        }
    }
    return 0;
}

static s32 load_trace(const char *path)
{
    FILE *f = fopen(path, "r");
    if (!f) {
        perror(path);
        exit(1);
    }
    char buf[256];
    s32 n = 0;
    if (!fgets(buf, sizeof buf, f)) {              // header line
        fclose(f);
        return 0;
    }
    while (fgets(buf, sizeof buf, f) && n < MAX_REFS) {
        s32 seq, size;
        char rw;
        u64 addr;
        if (sscanf(buf, "%d,%c,0x%llx,%d", &seq, &rw, &addr, &size) == 4) {
            refs[n].rw = rw;
            refs[n].addr = addr;
            refs[n].size = size;
            n++;
        }
    }
    fclose(f);
    return n;
}

static void print_state(s32 sets, s32 ways, s32 tag_shift, s32 set_shift)
{
    printf("  %-4s %-4s %-5s %-10s %-10s %s\n", "set", "way", "valid", "tag", "block", "LRU (0 = most recent)");
    for (s32 s = 0; s < sets; s++) {
        for (s32 w = 0; w < ways; w++) {
            Line *ln = &cache[s * ways + w];
            if (!ln->valid) {
                printf("  %-4d %-4d %-5d %-10s %-10s %s\n", s, w, 0, "-", "-", "-");
                continue;
            }
            s32 rank = 0;                          // how many valid lines in this set are newer
            for (s32 o = 0; o < ways; o++) {
                Line *other = &cache[s * ways + o];
                if (other->valid && other->last_use > ln->last_use) {
                    rank++;
                }
            }
            u32 block_addr = (ln->tag << tag_shift) | ((u32)s << set_shift);
            printf("  %-4d %-4d %-5d 0x%-8X 0x%-8X %d\n", s, w, 1, ln->tag, block_addr, rank);
        }
    }
}

int main(int argc, char **argv)
{
    char *defaults[] = { argv[0], "trace.csv", "256", "16", "4", "-v", "30", "-s" };
    if (argc == 1) {
        FILE *probe = fopen("trace.csv", "r");
        if (probe) {
            fclose(probe);
        } else {
            defaults[1] = "../trace.csv";
        }
        argc = 8;
        argv = defaults;
    }
    if (argc < 5) {
        fprintf(stderr, "usage: cachesim <trace.csv> <size> <line> <ways> [-v N] [-s]\n");
        return 1;
    }
    const char *path = argv[1];
    s32 size = atoi(argv[2]);
    s32 line = atoi(argv[3]);
    s32 ways = atoi(argv[4]);
    s32 verbose = 0;
    s32 show_state = 0;
    for (s32 i = 5; i < argc; i++) {
        if (strcmp(argv[i], "-v") == 0 && i + 1 < argc) {
            verbose = atoi(argv[++i]);
        } else if (strcmp(argv[i], "-s") == 0) {
            show_state = 1;
        }
    }

    s32 lines = size / line;
    if (ways == 0) {
        ways = lines;                              // fully associative
    }
    s32 sets = lines / ways;
    s32 word_bits = log2u((u32)line);
    s32 set_bits = log2u((u32)sets);
    s32 set_shift = word_bits;
    s32 tag_shift = word_bits + set_bits;

    s32 n = load_trace(path);
    memset(cache, 0, sizeof cache);

    s32 hits = 0, misses = 0, mem_writes = 0, mem_reads = 0, crossing = 0;
    u64 clock = 0;

    printf("cache: %d byte, line %d byte, %d-way, %d set(s), %d line(s)  |  fields: tag %d, set %d, word %d bit\n",
           size, line, ways, sets, lines, 32 - tag_shift, set_bits, word_bits);
    if (verbose > 0) {
        printf("%-4s %-2s %-12s %-10s %-4s %-5s %-5s %-12s %s\n",
               "#", "RW", "address", "tag", "set", "word", "H/M", "evicted", "block seen before?");
    }

    for (s32 i = 0; i < n; i++) {
        u32 a = (u32)(refs[i].addr & 0xFFFFFFFFu);
        u32 word = a & ((1u << word_bits) - 1u);
        u32 set = (a >> set_shift) & ((1u << set_bits) - 1u);
        u32 tag = a >> tag_shift;
        u32 block = a >> word_bits;
        if (word + (u32)refs[i].size > (u32)line) {
            crossing++;                            // would touch two lines; never happens in our traces
        }

        Line *base = &cache[set * ways];
        s32 hit_way = -1;
        for (s32 w = 0; w < ways; w++) {
            if (base[w].valid && base[w].tag == tag) {
                hit_way = w;
                break;
            }
        }

        char evicted[32] = "-";
        s32 seen_before = was_seen(block);
        clock++;
        if (hit_way >= 0) {
            hits++;
            base[hit_way].last_use = clock;
        } else {
            misses++;
            mem_reads++;                           // line fill (also on write miss: write-allocate)
            s32 victim = 0;
            for (s32 w = 0; w < ways; w++) {
                if (!base[w].valid) {
                    victim = w;
                    break;
                }
                if (base[w].last_use < base[victim].last_use) {
                    victim = w;
                }
            }
            if (base[victim].valid) {
                u32 old_block_addr = (base[victim].tag << tag_shift) | (set << set_shift);
                snprintf(evicted, sizeof evicted, "0x%X", old_block_addr);
            }
            base[victim].valid = 1;
            base[victim].tag = tag;
            base[victim].last_use = clock;
            if (!seen_before && seen_count < MAX_REFS) {
                seen_block[seen_count++] = block;
            }
        }
        if (refs[i].rw == 'W') {
            mem_writes++;                          // write-through: every store also goes to memory
        }

        if (i < verbose) {
            printf("%-4d %-2c 0x%-10llX 0x%-8X %-4u %-5u %-5s %-12s %s\n",
                   i + 1, refs[i].rw, (unsigned long long)refs[i].addr, tag, set, word,
                   hit_way >= 0 ? "H" : "M", evicted,
                   hit_way >= 0 ? "-" : (seen_before ? "evet" : "hayir"));
        }
        if (show_state && i + 1 == verbose) {
            printf("cache state after reference %d:\n", verbose);
            print_state(sets, ways, tag_shift, set_shift);
        }
    }

    if (show_state) {
        printf("cache state at end:\n");
        print_state(sets, ways, tag_shift, set_shift);
    }
    printf("refs %d  hits %d  misses %d  H %.4f  mem_reads(line fills) %d  mem_writes %d",
           n, hits, misses, n ? (double)hits / n : 0.0, mem_reads, mem_writes);
    if (crossing) {
        printf("  WARNING: %d line-crossing refs", crossing);
    }
    printf("\n");
    return 0;
}
