// Name: Mehmet Batuhan Ozer
// Student Number: 5001230025
// Gorev G5: Run-length Encoding (RLE)
// Personalized parameters: N = 24, R = 2, B = 0

#define N 24                      // 24 + (D2 mod 25) = 24 + (25 mod 25)
#define R 2                       // 2 + (SID mod 3) = 2 + 0
#define B 0                       // task definition

typedef unsigned int u32;         // 32-bit unsigned
typedef int s32;                  // 32-bit signed

const int SID = 1230025;          // Y6: last 9 digits of 5001230025 (exceeds 2^31-1). Kept as const int exactly as the assignment specifies; s32 is a typedef of int anyway.

s32 v[N];                         // Y1: Original input array (global, 3 passes)
s32 enc[N];                       // RLE Encoded Array
s32 dec[N];                       // Decoded Array (Must be the same as the original array after decoding)

s32 enc_len = 0;                  // Y7: number of runs produced
s32 ratio_x100 = 0;               // Y7: 100 * enc_len / N
s32 decode_ok = 0;                // Y7: 1 if dec[] matches v[]

// Y3: takes a parameter, returns a value. Encodes v[0..n-1] into enc[], returns the run count
s32 rle_encode(s32 n)
{
    s32 i = 0;
    s32 k = 0;
    while (i < n) {                          // Y1: 2nd pass over v
        s32 run = 1;
        while (i + run < n && v[i + run] == v[i]) { run++; }   // Y2: conditional branch
        enc[k] = (v[i] << 8) | run;          // Y4: shift and OR, Y5: store
        k++;
        i += run;                            // Y4: addition
    }
    return k;
}

// Y3: takes a parameter, returns a value. Expands enc[0..len-1] into dec[], returns element count
s32 rle_decode(s32 len)
{
    s32 o = 0;
    for (s32 j = 0; j < len; j++) {
        s32 value = enc[j] >> 8;             // Y4: shift
        s32 run = enc[j] & 0xFF;             // Y4: AND
        for (s32 t = 0; t < run; t++) {
            dec[o++] = value;                // Y5: store
        }
    }
    return o;
}

int main(void)
{
    // LCG input generation: x0 = SID, x = 1664525*x + 1013904223 (mod 2^32)
    u32 x = (u32)SID;                        // Y6: SID seeds the generator
    for (s32 i = 0; i < N; i++) {            // Y1: 1st pass over v
        x = 1664525u * x + 1013904223u;      // Unsigned 32-bit overflow is defined behaviour in C so it gives mod 2^32 automatically
        v[i] = (s32)((x >> 16) % R) + B;     // Y5: store to array
    }
    enc_len = rle_encode(N);              // Y3: parameterised call, value returned
    s32 out = rle_decode(enc_len);      // Y3: parameterised call, value returned
    ratio_x100 = (100 * enc_len) / N;       // Y4: multiplication
    decode_ok = (out == N);
    for (s32 i = 0; i < N; i++) {           // Y1: 3rd pass over v
        if (dec[i] != v[i]) {               // Y2: conditional branch
            decode_ok = 0;
        }
    }
    return 0;
}
