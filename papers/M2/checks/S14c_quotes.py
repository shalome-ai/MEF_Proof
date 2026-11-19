#!/usr/bin/env python3
"""Card S14c: the four quotations of M1 v7.3 in entry M2-W151 are substrings of
the lines of M1 that its mark names (ll.1058, 792, 827, 732), and the clauses
that entry M2-W158 copies stand in the entries it credits them to.

Reads canon/M1/Paper_M1_Six_Axioms_v7_3.tex and papers/M2/WRITE_LOG.md.
Usage, from the repository root:  python3 papers/M2/checks/S14c_quotes.py
"""
import re, sys
M1 = open("canon/M1/Paper_M1_Six_Axioms_v7_3.tex", encoding="utf-8").read().split("\n")
LOG = open("papers/M2/WRITE_LOG.md", encoding="utf-8").read()
def stmt(num):
    m = re.search(r"### %s · active\n- \*\*Statement \(as it will be printed\):\*\*\n```tex\n(.*?)\n```" % num, LOG, re.S)
    return m.group(1)
bad = 0
q = re.findall(r"``(.*?)''", stmt("M2-W151"), re.S)
lines = [1058, 792, 827, 732]
for quote, n in zip(q, lines):
    ok = quote in M1[n - 1]
    print(("ok   " if ok else "FAIL ") + "M2-W151, l.%d: %s..." % (n, quote[:50])); bad += (not ok)
if len(q) != len(lines):
    print("FAIL M2-W151: %d quotations" % len(q)); bad += 1
for src, words in (
    ("M2-W146", r"of space, of the base,"),
    ("M2-W146", r"of the unfolded geometry as a whole"),
    ("M2-W154", r"made from the complex structures of $\CPtwo$ and of $\Stwo$ and from the exterior derivative on $B$, and no length enters it"),
    ("M2-W106", r"and $D$"),
    ("M2-W118", r"is the only complex structure on the tangent planes of the fibre that keeps the lengths"),
    ("M2-W118", r"on the fibre at $s$ and the handedness of $(\theta_{\psi},\theta_{\omega})$"),
    ("M2-W128", r"has length one"),
    ("M2-W154", r"the lift of the step $(\tau^{-1})^{*}\otimes\nu_{D}$"),
    ("M2-W154", r"a continuous function with no zero"),
    ("M2-W154", r"that depends on the time and on the point of space alone"),
    ("M2-W126", r"The constants $1$ and $-1$ are"),
):
    ok = words in stmt(src) and words in stmt("M2-W158")
    print(("ok   " if ok else "FAIL ") + "%s and M2-W158: %s..." % (src, words[:60])); bad += (not ok)
print("FAILED" if bad else "all checks passed"); sys.exit(1 if bad else 0)
