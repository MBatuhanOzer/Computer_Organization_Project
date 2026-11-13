"""Asama 5a: dinamik instruction dagilimi, CPI, sure, MIPS, bellek etkisi ve Amdahl.

Girdi: listings/exec_<TAG>.csv (tools/mktrace.py ciktisi) ve cache simulatorunun H degeri.
CPI_i, f, T1, T2, Nc yonergedeki VARSAYIMSAL model degerleridir (olcum degil).

Sinif kurali (her instruction tek sinifa girer, sirayla):
  1. branch/jump : j*, call, ret                       (kontrol akisi)
  2. carpma      : imul, mul, idiv, div                 (modelde bolme sinifi yok; carpmaya sayilir)
  3. store       : bellege yazan her instruction (push dahil)
  4. load        : bellekten okuyan her instruction (pop dahil)
  5. ALU         : geri kalan her sey (mov reg, lea, cdq, sete, movsxd ... )

Kullanim:  python tools/perf.py
"""
import csv
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CPI = {"ALU": 1, "carpma": 3, "load": 1, "store": 1, "branch": 2}
F_GHZ = 1.5
TAU_NS = 1.0 / F_GHZ
T1, T2, NC = 1, 25, 6
PARALLEL_LINES = {"64", "65", "66", "68"}      # dogrulama dongusu (main, s.64-68)


def klass(text, mem):
    mn = text.split()[0]
    if mn.startswith("j") or mn in ("call", "ret"):
        return "branch"
    if mn in ("imul", "mul", "idiv", "div"):
        return "carpma"
    if "W:" in mem:
        return "store"
    if "R:" in mem:
        return "load"
    return "ALU"


def hit_ratio(trace):
    exe = ROOT / "build-od" / "cachesim.exe"
    out = subprocess.run([str(exe), str(ROOT / trace), "256", "16", "4"],
                         capture_output=True, text=True).stdout.strip().splitlines()[-1]
    f = dict(zip(out.split()[0::2], out.split()[1::2]))
    return int(f["hits"]), int(f["refs"])


def analyse(tag, trace):
    rows = list(csv.DictReader(open(ROOT / "listings" / f"exec_{tag}.csv", encoding="utf-8")))
    counts = {k: 0 for k in CPI}
    nrefs = 0
    par_cycles_mem = 0.0
    hits, refs = hit_ratio(trace)
    H = hits / refs
    Ts = H * T1 + (1 - H) * (T1 + T2)
    for r in rows:
        c = klass(r["instruction"], r["veri_erisimi"])
        counts[c] += 1
        n = r["veri_erisimi"].count(":")
        nrefs += n
        if r["c_satiri"] in PARALLEL_LINES:
            par_cycles_mem += CPI[c] + n * Ts
    Ic = len(rows)
    cpi = sum(CPI[k] * counts[k] for k in CPI) / Ic
    m = nrefs / Ic
    T = Ic * cpi * TAU_NS
    T_nocache = Ic * (cpi + m * T2) * TAU_NS
    T_cache = Ic * (cpi + m * Ts) * TAU_NS
    f = par_cycles_mem / (Ic * (cpi + m * Ts))
    return dict(tag=tag, counts=counts, Ic=Ic, cpi=cpi, m=m, nrefs=nrefs, H=H, Ts=Ts,
                T=T, mips=F_GHZ * 1000 / cpi, T_nocache=T_nocache, T_cache=T_cache, f=f)


def main():
    o0 = analyse("O0", "trace.csv")
    o1 = analyse("O1", "trace_O1.csv")
    print(f"{'':22}{'-O0':>12}{'-O1':>12}")
    for k in CPI:
        print(f"{k + ' (CPI=' + str(CPI[k]) + ')':22}{o0['counts'][k]:>12}{o1['counts'][k]:>12}")
    for key, fmt in (("Ic", "{:d}"), ("cpi", "{:.4f}"), ("T", "{:.1f} ns"), ("mips", "{:.1f}"),
                     ("nrefs", "{:d}"), ("m", "{:.4f}"), ("H", "{:.4f}"), ("Ts", "{:.4f} cyc"),
                     ("T_nocache", "{:.1f} ns"), ("T_cache", "{:.1f} ns"), ("f", "{:.4f}")):
        print(f"{key:22}{fmt.format(o0[key]):>12}{fmt.format(o1[key]):>12}")
    print()
    print(f"speedup -O0 -> -O1 (cache var)   : {o0['T_cache'] / o1['T_cache']:.3f}")
    print(f"speedup cache yok -> var (-O0)   : {o0['T_nocache'] / o0['T_cache']:.3f}")
    f = o0["f"]
    print(f"Amdahl (-O0, f={f:.4f}): Nc={NC} -> {1 / ((1 - f) + f / NC):.4f},  Nc->inf -> {1 / (1 - f):.4f}")


if __name__ == "__main__":
    main()
