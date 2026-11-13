"""C satiri -> assembly -> adres eslemesi (Asama 2a).

listings/asm_<TAG>.s       derleyici ciktisi: her instruction grubu "# main.c:NN" ile isaretli,
                            ama adres yok.
listings/objdump_<TAG>.txt linklenmis exe: gercek adres ve byte'lar var, C satiri yok.

Iki liste ayni instruction dizisidir (ayni object kodun iki gorunumu). Fonksiyon fonksiyon
sirayla eslenir ve her instruction'in mnemonic'i karsilastirilir; tutmazsa script durur.
Cikti: listings/c2asm_<TAG>.txt

Kullanim:  python tools/c2asm.py O0
"""
import re
import sys
from pathlib import Path

TAG = sys.argv[1] if len(sys.argv) > 1 else "O0"
ROOT = Path(__file__).resolve().parent.parent
LST = ROOT / "listings"
BUILD = "build-od" if TAG.startswith("O0") else "build-o1"
EXE = "rle_v2" if TAG.endswith("_v2") else "rle"
FUNCS = ("rle_encode", "rle_decode", "main")


def parse_asm(path):
    """{func: [(c_line, mnemonic, text)]} -- directive ve etiketler atlanir."""
    out, func, line = {}, None, None
    for raw in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = re.match(r"^(\w+):", raw)
        if m and m.group(1) in FUNCS:
            func, line = m.group(1), None
            out[func] = []
            continue
        if func is None:
            continue
        m = re.search(r"#\s*main(?:_v2)?\.c:(\d+)", raw)
        if m and raw.lstrip().startswith(".cv_loc"):
            line = int(m.group(1))
            continue
        if raw.lstrip().startswith(".seh_endproc"):
            func = None
            continue
        if not raw.startswith("\t") or raw.lstrip().startswith(("."  , "#")):
            continue
        text = raw.split("#")[0].strip()
        if text:
            out[func].append((line, text.split()[0], re.sub(r"\s+", " ", text)))
    return out


def parse_objdump(path, starts):
    """{func: [(addr, bytes, mnemonic, text)]} -- int3/nop dolgusu atlanir."""
    rows = []
    for raw in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = re.match(r"^\s*([0-9a-f]+):\s+((?:[0-9a-f]{2} )+)\s*(\S+)\s*(.*)$", raw)
        if not m:
            continue
        addr, mn = int(m.group(1), 16), m.group(3)
        if mn == "int3" or mn.startswith("nop"):
            continue
        rows.append((addr, m.group(2).strip(), mn, (mn + " " + m.group(4)).strip()))
    order = sorted(starts.items(), key=lambda kv: kv[1])
    out = {}
    for i, (f, a) in enumerate(order):
        b = order[i + 1][1] if i + 1 < len(order) else 1 << 64
        out[f] = [r for r in rows if a <= r[0] < b]
    return out


def map_starts(path):
    starts = {}
    for raw in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = re.match(r"^\s*0001:[0-9a-f]+\s+(\w+)\s+([0-9a-f]{16})\s", raw)
        if m and m.group(1) in FUNCS:
            starts[m.group(1)] = int(m.group(2), 16)
    return starts


def main():
    build = BUILD
    starts = map_starts(ROOT / BUILD / f"{EXE}.map")
    asm = parse_asm(LST / f"asm_{TAG}.s")
    obj = parse_objdump(LST / f"objdump_{TAG}.txt", starts)

    out = [f"# C satiri -> assembly -> adres  ({TAG}, {build}/{EXE}.exe)",
           "# sutunlar: C satiri | adres | byte'lar | instruction", ""]
    for f in sorted(asm, key=lambda k: starts.get(k, 0)):
        a, o = asm[f], obj.get(f, [])
        if len(a) != len(o):
            sys.exit(f"{f}: asm {len(a)} instruction, objdump {len(o)} -- esleme yapilamadi")
        out.append(f"<{f}>  @ 0x{starts[f]:X}")
        for (line, amn, _), (addr, byts, omn, otext) in zip(a, o):
            if amn != omn:
                sys.exit(f"{f} @ 0x{addr:X}: asm '{amn}' != objdump '{omn}'")
            tag = f"{line:>3}" if line else "  -"
            out.append(f"  {tag}  0x{addr:X}  {byts:<30} {otext}")
        out.append("")
    dst = LST / f"c2asm_{TAG}.txt"
    dst.write_text("\n".join(out) + "\n", encoding="utf-8")
    print(f"{dst.name}: {sum(len(v) for v in asm.values())} instruction eslendi")


if __name__ == "__main__":
    main()
