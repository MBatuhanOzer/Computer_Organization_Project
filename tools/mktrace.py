"""Dinamik iz -> trace.csv (Asama 4a) ve calisan instruction listesi (Asama 3 ve 5).

Once programi debugger'da (Windows SDK cdb.exe) main'den itibaren tek adim yurutur ve her
instruction'dan hemen once register durumunu listings/steps_<TAG>.txt'ye yazar; sonra bu
kaydi isler. --no-capture ile var olan kayit yeniden kullanilir.

Girdi:
  listings/steps_<TAG>.txt   her satir, bir instruction calismadan HEMEN ONCEKI register
                             durumu (rip=... rax=... ... rsp=... efl=...).
  listings/objdump_<TAG>.txt adres -> instruction metni
  listings/c2asm_<TAG>.txt   adres -> C satiri

Cikti:
  trace.csv (O0) / trace_O1.csv  sira,RW,adres_hex,boyut,c_satiri,stack_mi  (her veri erisimi bir satir)
  listings/exec_<TAG>.csv    sira,adres,c_satiri,instruction,mem      (her calisan instruction bir satir)

Etkin adres, instruction'in bellek operandi ve o anki register degerlerinden hesaplanir.
RIP-relative operandlarda objdump'in yorumundaki hedef adres kullanilir. push/pop/call/ret
ortulu stack erisimi olarak sayilir. Instruction fetch'ler veri izi degildir (yonerge s.2).

Kullanim:  python tools/mktrace.py O0            (O1, O0_v2 de olur)
           python tools/mktrace.py O0 --no-capture
"""
import os
import re
import subprocess
import sys
from pathlib import Path

ARGS = [a for a in sys.argv[1:] if not a.startswith("--")]
TAG = ARGS[0] if ARGS else "O0"
CAPTURE = "--no-capture" not in sys.argv
CDB = Path(os.environ.get("ProgramFiles(x86)", r"C:\Program Files (x86)")) / \
    "Windows Kits" / "10" / "Debuggers" / "x64" / "cdb.exe"
STEPS = 2200                                   # main'in calistirdigi instruction sayisindan fazla
ROOT = Path(__file__).resolve().parent.parent
LST = ROOT / "listings"
BUILD = "build-od" if TAG.startswith("O0") else "build-o1"
EXE = "rle_v2" if TAG.endswith("_v2") else "rle"
SIZE = {"byte": 1, "word": 2, "dword": 4, "qword": 8}
RMW = {"add", "sub", "and", "or", "xor", "shl", "shr", "sar", "inc", "dec", "neg", "not"}
REG64 = {"eax": "rax", "ecx": "rcx", "edx": "rdx", "ebx": "rbx", "esi": "rsi", "edi": "rdi",
         "esp": "rsp", "ebp": "rbp"}


def capture():
    """Debugger'da main'den tek adim yurut; her adimdan once register'lari yaz."""
    exe = ROOT / BUILD / f"{EXE}.exe"
    regs = "rip,rax,rbx,rcx,rdx,rsi,rdi,rsp,rbp,r8,r9,r10,r11,efl"
    cmd = (f"bu {EXE}!main; g; .for (r $t0=0; @$t0 < {STEPS}; r $t0=@$t0+1) "
           f"{{ r {regs}; t }}; q")
    out = subprocess.run([str(CDB), "-c", cmd, str(exe)], capture_output=True, text=True,
                         errors="replace").stdout
    lines = [l for l in out.splitlines() if l.startswith("rip=")]
    (LST / f"steps_{TAG}.txt").write_text("\n".join(lines) + "\n", encoding="ascii")
    print(f"steps_{TAG}.txt: {len(lines)} satir")


def load_objdump():
    ins = {}
    for raw in (LST / f"objdump_{TAG}.txt").read_text(encoding="utf-8", errors="replace").splitlines():
        m = re.match(r"^\s*([0-9a-f]+):\s+((?:[0-9a-f]{2} )+)\s*(\S+)\s*(.*)$", raw)
        if m:
            ins[int(m.group(1), 16)] = (len(m.group(2).split()), m.group(3), m.group(4).strip())
    return ins


def load_lines():
    lines = {}
    for raw in (LST / f"c2asm_{TAG}.txt").read_text(encoding="utf-8").splitlines():
        m = re.match(r"^\s+(\d+|-)\s+0x([0-9A-F]+)\s", raw)
        if m:
            lines[int(m.group(2), 16)] = m.group(1)
    return lines


def load_steps():
    steps, prev = [], None
    for raw in (LST / f"steps_{TAG}.txt").read_text(encoding="ascii", errors="replace").splitlines():
        if not raw.startswith("rip="):
            continue
        regs = {k: int(v, 16) for k, v in re.findall(r"(\w+)=([0-9a-f]+)", raw)}
        if prev is not None and regs == prev:      # ilk adim debugger'da iki kez yazilir
            continue
        steps.append(regs)
        prev = regs
    return steps


def ea(ops, regs, rip_next):
    m = re.search(r"\[([^\]]+)\]", ops)
    expr = m.group(1).replace(" ", "")
    c = re.search(r"#\s*0x([0-9a-f]+)", ops)
    if expr.startswith("rip") and c:
        return int(c.group(1), 16)
    total = 0
    for term in re.findall(r"[+-]?[^+-]+", expr):
        sign = -1 if term.startswith("-") else 1
        term = term.lstrip("+-")
        if "*" in term:
            a, b = term.split("*")
            scale, reg = (int(a), b) if a.isdigit() else (int(b), a)
            total += sign * scale * regs[REG64.get(reg, reg)]
        elif term.startswith("0x"):
            total += sign * int(term, 16)
        elif term == "rip":
            total += sign * rip_next
        else:
            total += sign * regs[REG64.get(term, term)]
    return total & 0xFFFFFFFFFFFFFFFF


def accesses(mn, ops, regs, length, rip):
    """[(R/W, adres, boyut)] -- bu instruction'in veri erisimleri."""
    rsp = regs["rsp"]
    if mn in ("push", "call"):
        return [("W", rsp - 8, 8)]
    if mn in ("pop", "ret"):
        return [("R", rsp, 8)]
    if mn == "lea" or "ptr" not in ops:
        return []
    size = SIZE[re.search(r"(byte|word|dword|qword) ptr", ops).group(1)]
    a = ea(ops, regs, rip + length)
    dest_mem = re.match(r"^(byte|word|dword|qword) ptr", ops) is not None
    if not dest_mem:
        return [("R", a, size)]
    if mn in ("cmp", "test"):
        return [("R", a, size)]
    if mn in RMW:
        return [("R", a, size), ("W", a, size)]
    return [("W", a, size)]


def main():
    if CAPTURE:
        capture()
    ins, lines, steps = load_objdump(), load_lines(), load_steps()
    main_ret = max(a for a, (_, mn, _) in ins.items() if mn == "ret")
    trace, execlog, n = [], [], 0
    for regs in steps:
        rip = regs["rip"]
        if rip not in ins:
            continue
        length, mn, ops = ins[rip]
        n += 1
        acc = accesses(mn, ops, regs, length, rip)
        line = lines.get(rip, "-")
        for rw, a, size in acc:
            stack = 1 if (a >> 32) == 0 else 0          # stack 0x0015xxxx, veri 0x1400xxxxx
            trace.append((rw, a, size, line, stack))
        mem = " ".join(f"{rw}:0x{a:X}/{s}" for rw, a, s in acc)
        execlog.append((n, rip, line, f"{mn} {ops}".split("#")[0].strip(), mem))
        if rip == main_ret:
            break

    name = "trace.csv" if TAG == "O0" else f"trace_{TAG}.csv"   # tutanak: trace.csv (-O0)
    with open(ROOT / name, "w", encoding="utf-8", newline="\n") as f:
        f.write("sira,RW,adres_hex,boyut,c_satiri,stack_mi\n")
        for i, (rw, a, size, line, stack) in enumerate(trace, 1):
            f.write(f"{i},{rw},0x{a:X},{size},{line},{stack}\n")
    with open(LST / f"exec_{TAG}.csv", "w", encoding="utf-8", newline="\n") as f:
        f.write("sira,adres,c_satiri,instruction,veri_erisimi\n")
        for n_, rip, line, text, mem in execlog:
            f.write(f'{n_},0x{rip:X},{line},"{text}",{mem}\n')

    st = sum(t[4] for t in trace)
    print(f"{TAG}: {len(execlog)} instruction, {len(trace)} veri erisimi "
          f"(R {sum(t[0] == 'R' for t in trace)}, W {sum(t[0] == 'W' for t in trace)}, "
          f"stack {st}, stack disi {len(trace) - st})")


if __name__ == "__main__":
    main()
