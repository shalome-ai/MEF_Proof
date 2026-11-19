#!/usr/bin/env python3
"""Card S14b: the two quotations of M1 v7.3 in entry M2-W116 are substrings of
the lines of M1 that its mark names (ll.829, 838), and the two glossary entries
made from M2-W117 are substrings of its statement.

Reads canon/M1/Paper_M1_Six_Axioms_v7_3.tex, papers/M2/WRITE_LOG.md and
papers/M2/GLOSSARY.md.
Usage, from the repository root:  python3 papers/M2/checks/S14b_quotes.py
"""
import re, sys
M1 = open("canon/M1/Paper_M1_Six_Axioms_v7_3.tex", encoding="utf-8").read().split("\n")
LOG = open("papers/M2/WRITE_LOG.md", encoding="utf-8").read()
def stmt(num):
    m = re.search(r"### %s · active\n- \*\*Statement \(as it will be printed\):\*\*\n```tex\n(.*?)\n```" % num, LOG, re.S)
    return m.group(1)
bad = 0
q = re.findall(r"``(.*?)''", stmt("M2-W116"), re.S)
for quote, n in zip(q, [829, 838]):
    ok = quote in M1[n - 1]
    print(("ok   " if ok else "FAIL ") + "M2-W116, l.%d: %s..." % (n, quote[:50])); bad += (not ok)
if len(q) != 2:
    print("FAIL M2-W116: %d quotations" % len(q)); bad += 1
flat = " ".join(stmt("M2-W117").split())
n = 0
for line in open("papers/M2/GLOSSARY.md", encoding="utf-8"):
    if line.rstrip().endswith("· M2-W117"):
        n += 1
        words = line.split(' · "', 1)[1].rsplit('" · M2-W117', 1)[0]
        ok = " ".join(words.split()) in flat
        print(("ok   " if ok else "FAIL ") + "glossary entry from M2-W117: %s..." % words[:50]); bad += (not ok)
if n != 2:
    print("FAIL: %d glossary entries from M2-W117" % n); bad += 1
print("FAILED: %d" % bad if bad else "all quotations pass")
sys.exit(1 if bad else 0)
