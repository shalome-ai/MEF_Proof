#!/usr/bin/env python3
"""Card S13: every quotation of M1 v7.3 in entries M2-W099 to M2-W103 of the
write-up log is a substring of the line of M1 that the entry's mark names.

Reads canon/M1/Paper_M1_Six_Axioms_v7_3.tex and papers/M2/WRITE_LOG.md, nothing
else. A quotation is the text between `` and '' in the statement. Before the
comparison M1's cross-references on the named lines are printed as M1's printed
numbers (presentation), by the table below. Usage, from the repository root:
  python3 papers/M2/checks/S13_quotes.py
"""
import re, sys
M1 = open("canon/M1/Paper_M1_Six_Axioms_v7_3.tex", encoding="utf-8").read().split("\n")
LOG = open("papers/M2/WRITE_LOG.md", encoding="utf-8").read()
REFS = {r"\eqref{eq:family}": "(2)", r"Definition~\ref{def:A2}": "Definition~2.4"}
LINES = {"M2-W099": [704], "M2-W100": [704, 704], "M2-W101": [190],
         "M2-W102": [267, 1092], "M2-W103": [127]}
def line(n):
    t = M1[n - 1]
    for a, b in REFS.items():
        t = t.replace(a, b)
    return t
bad = 0
for num, lines in LINES.items():
    m = re.search(r"### %s · active\n- \*\*Statement \(as it will be printed\):\*\*\n```tex\n(.*?)\n```" % num, LOG, re.S)
    if not m:
        print(num, "NOT FOUND"); bad += 1; continue
    quotes = re.findall(r"``(.*?)''", m.group(1), re.S)
    if len(quotes) != len(lines):
        print(num, "quotations:", len(quotes), "lines named:", len(lines)); bad += 1; continue
    for q, n in zip(quotes, lines):
        ok = q in line(n)
        bad += not ok
        print("%s l.%d %s  %s" % (num, n, "OK  " if ok else "FAIL", q[:70]))
sys.exit(1 if bad else 0)
