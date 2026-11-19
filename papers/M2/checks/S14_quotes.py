#!/usr/bin/env python3
"""Card S14, first part: the quotations of M1 v7.3 in entry M2-W104 are
substrings of the lines of M1 that its mark names (ll.834, 832), and the two
quotations of M2-W112 are substrings of row V-M2-6 of Verified References.

Reads canon/M1/Paper_M1_Six_Axioms_v7_3.tex, papers/M2/WRITE_LOG.md and the one
row V-M2-6 of registers/Verified_References.md (found by its first cell).
Usage, from the repository root:  python3 papers/M2/checks/S14_quotes.py
"""
import re, sys
M1 = open("canon/M1/Paper_M1_Six_Axioms_v7_3.tex", encoding="utf-8").read().split("\n")
LOG = open("papers/M2/WRITE_LOG.md", encoding="utf-8").read()
def stmt(num):
    m = re.search(r"### %s · active\n- \*\*Statement \(as it will be printed\):\*\*\n```tex\n(.*?)\n```" % num, LOG, re.S)
    return m.group(1)
bad = 0
q = re.findall(r"``(.*?)''", stmt("M2-W104"), re.S)
for quote, n in zip(q, [834, 832]):
    ok = quote in M1[n - 1]
    print(("ok   " if ok else "FAIL ") + "M2-W104, l.%d: %s..." % (n, quote[:50])); bad += (not ok)
if len(q) != 2:
    print("FAIL M2-W104: %d quotations" % len(q)); bad += 1
row = [l for l in open("registers/Verified_References.md", encoding="utf-8") if l.startswith("| V-M2-6 |")][0]
q = re.findall(r"``(.*?)''", stmt("M2-W112"), re.S)
for quote in q:
    ok = quote in row
    print(("ok   " if ok else "FAIL ") + "M2-W112, V-M2-6: " + quote); bad += (not ok)
if len(q) != 2:
    print("FAIL M2-W112: %d quotations" % len(q)); bad += 1
print("FAILED: %d" % bad if bad else "all quotations pass")
sys.exit(1 if bad else 0)
