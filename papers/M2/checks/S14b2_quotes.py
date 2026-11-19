#!/usr/bin/env python3
"""Card S14b2: the three quotations of M1 v7.3 in entry M2-W137 (in the place of M2-W127) are substrings
of the lines of M1 that its mark names (ll.287, 704, 187), and the one
quotation of M1 in entry M2-W135 (in the place of M2-W129) is a substring of l.704.

Reads canon/M1/Paper_M1_Six_Axioms_v7_3.tex and papers/M2/WRITE_LOG.md.
Usage, from the repository root:  python3 papers/M2/checks/S14b2_quotes.py
"""
import re, sys
M1 = open("canon/M1/Paper_M1_Six_Axioms_v7_3.tex", encoding="utf-8").read().split("\n")
LOG = open("papers/M2/WRITE_LOG.md", encoding="utf-8").read()
def stmt(num):
    m = re.search(r"### %s · active\n- \*\*Statement \(as it will be printed\):\*\*\n```tex\n(.*?)\n```" % num, LOG, re.S)
    return m.group(1)
bad = 0
for num, lines in (("M2-W137", [287, 704, 187]), ("M2-W135", [704])):
    q = re.findall(r"``(.*?)''", stmt(num), re.S)
    for quote, n in zip(q, lines):
        ok = quote in M1[n - 1]
        print(("ok   " if ok else "FAIL ") + "%s, l.%d: %s..." % (num, n, quote[:50])); bad += (not ok)
    if len(q) != len(lines):
        print("FAIL %s: %d quotations" % (num, len(q))); bad += 1
print("FAILED: %d" % bad if bad else "all quotations pass")
sys.exit(1 if bad else 0)
