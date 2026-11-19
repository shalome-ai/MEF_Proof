#!/usr/bin/env python3
"""Card S14b2b: the four quotations of M1 v7.3 in entry M2-W150 (in the place of M2-W139) are substrings
of the lines of M1 that its mark names (ll.829, 829, 921, 923), and the one
quotation in entry M2-W145 of what was said after Proposition `prop:timedir`
agrees with entry M2-W134 in the words named below.

Reads canon/M1/Paper_M1_Six_Axioms_v7_3.tex and papers/M2/WRITE_LOG.md.
Usage, from the repository root:  python3 papers/M2/checks/S14b2b_quotes.py
"""
import re, sys
M1 = open("canon/M1/Paper_M1_Six_Axioms_v7_3.tex", encoding="utf-8").read().split("\n")
LOG = open("papers/M2/WRITE_LOG.md", encoding="utf-8").read()
def stmt(num):
    m = re.search(r"### %s · active\n- \*\*Statement \(as it will be printed\):\*\*\n```tex\n(.*?)\n```" % num, LOG, re.S)
    return m.group(1)
bad = 0
for num, lines in (("M2-W150", [829, 829, 921, 923]),):
    q = re.findall(r"``(.*?)''", stmt(num), re.S)
    for quote, n in zip(q, lines):
        ok = quote in M1[n - 1]
        print(("ok   " if ok else "FAIL ") + "%s, l.%d: %s..." % (num, n, quote[:50])); bad += (not ok)
    if len(q) != len(lines):
        print("FAIL %s: %d quotations" % (num, len(q))); bad += 1
# words that M2-W145 takes from M2-W134
for words in (r"the multipliers of Proposition~\ref{prop:fibre}(iv), taken at each time,",
              r"continuous in the time",
              r"how they carry the derivative in $s$ in the frame $1$ of one of the five divisors to that of another"):
    ok = words in stmt("M2-W134") and words in stmt("M2-W145")
    print(("ok   " if ok else "FAIL ") + "M2-W134 and M2-W145: %s..." % words[:50]); bad += (not ok)
# each clause of M2-W145 that copies a part of M2-W140 stands in M2-W140
P = stmt("M2-W140")
for words in (r"$m_{D}$ is a continuous function with no zero on $Y$ away from the corner circles",
              r"ultiplication by $m_{D}$ in the frames $1$ is an isomorphism of $\mathcal{O}_{Y}(D)$ onto $\mathcal{O}_{Y}(3P_{4})$ that covers the identity of $Y$",
              r"the lift with two states on the pillowcase to the lift with two states on the pillowcase",
              r"n isomorphism of $\mathcal{O}_{Y}(D)$ onto $\mathcal{O}_{Y}(3P_{4})$ that covers the identity of $Y$ and carries sections differentiable along the fibre to such sections and $\bar\partial$ to $\bar\partial$ is multiplication by $c\,m_{D}$, for a continuous function $c$ with no zero that depends on the time alone",
              r"is one of the functions of Proposition~\ref{prop:timedir}(v) for $D$ exactly when",
              r"is one of them for $3P_{4}$",
              r"here is no function $c$ of the time alone, with no zero and with a continuous derivative, for which multiplication by $c\,m_{D}$ carries $(\partial_{s}f)\cdot1$ to $\bigl(\partial_{s}(c\,m_{D}f)\bigr)\cdot1$ for every section $f\cdot1$"):
    ok = words in P and words in stmt("M2-W145")
    print(("ok   " if ok else "FAIL ") + "M2-W140 and M2-W145: %s..." % words[:50]); bad += (not ok)
print("FAILED: %d" % bad if bad else "all quotations pass")
sys.exit(1 if bad else 0)
