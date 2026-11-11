#!/usr/bin/env python3
"""Build M1 v6.3 from v6.2 (Decision Log P61-P64).
  python3 tools/m1_build_v6_3.py canon/M1/superseded/Paper_M1_Six_Axioms_v6_2.tex canon/M1/Paper_M1_Six_Axioms_v6_3.tex
Every edit must match exactly once.

Scope: clause (a) of Definition 3.2 states its way of counting drives in full.  Two steps are the same when a
relabelling of the torus that keeps its orientation carries one to the other, and only then: a mirror image is
another step, and a step run backwards is another step.  Both parts are declared and neither is derived
(papers/M1/ORIENTATION_AND_TIME.md; PI ruling P63).  No result is renumbered.
Also, typesetting only (P65): three symbols in the Lean listings that printed as blanks are now printed.
"""
import sys
src, dst = sys.argv[1], sys.argv[2]
s = open(src, encoding="utf-8").read()
n = 0
def sub(old, new):
    global s, n
    c = s.count(old)
    assert c == 1, f"{c} matches for: {old[:70]!r}"
    s = s.replace(old, new); n += 1

sub("v6.2, canon, 11 Nov 2026", "v6.3, canon, 11 Nov 2026")
sub("v6.2 built from v6.1 by tools/m1_build_v6_2.py (Decision Log P58, P60).  Supersedes v6.1, v6.0 and v5.0 (canon/M1/superseded/).",
    "v6.3 built from v6.2 by tools/m1_build_v6_3.py (Decision Log P61-P64).  Supersedes v6.2, v6.1, v6.0 and v5.0 (canon/M1/superseded/).")
sub(r"\date{11 November 2026 (v6.2)}", r"\date{11 November 2026 (v6.3)}")

sub(r"is the only one of its trace, up to a relabelling of the torus that keeps its orientation;",
    r"is the only one of its trace, two steps being counted as the same when a relabelling of the torus that keeps its orientation carries one to the other, and only then;")

sub(r"the setting of a dial and the class of a drive among those of one trace.",
    r"the setting of a dial and the class of a drive among those of one trace. The way of counting drives is part of the clause, and it has two parts: the mirror image of a step is another step, and a step run backwards is another step, unless a relabelling that keeps the orientation carries the one to the other. Neither part is derived from the first five axioms; both are declared here, and Section~\ref{sec:drive} shows that both are needed.")

sub(r"Among positive traces, and under relabellings of the torus that keep its orientation, trace three is therefore the only one at which the drive is a single object, and clause~(a) of Definition~\ref{def:minimal} selects it. \rigR",
    r"Among positive traces, and with drives counted as in clause~(a) of Definition~\ref{def:minimal}, trace three is therefore the only one at which the drive is a single object, and the clause selects it. \rigR")

sub(r"so that under relabellings that reverse the orientation the drive is conjugate to its inverse at every trace and the argument selects nothing.",
    r"so that under relabellings that reverse the orientation the drive is conjugate to its inverse at every trace and the argument selects nothing." + "\n\n" +
    r"The other part of the count is used as well: if a step and its inverse are counted as one, $A_{t}$ and $A_{t}^{-1}$ are one drive at every trace, with no relabelling at all.")

sub(r"""\end{proof}

\section{The fibre}\label{sec:fibre}""",
r"""\end{proof}

The two parts of the count of clause~(a) are thus both needed, and a computation shows how much rests on them. Counting the classes of each trace up to sixty by the cycles of reduced forms \cite{Gauss1801}, in four ways, gives the following. With mirror images counted as different and a step run backwards counted as different, trace three alone has a single drive. If either is counted as the same, or both, the traces $3$, $4$, $5$, $9$ and $21$ each have a single drive; at the last four the two drives of the first count are mirror images of each other and are also each other run backwards. In every one of the four counts the least trace with a single drive is three, so that the drive of the theorem does not depend on the count; what depends on it is whether clause~(a) or clause~(c) is the ground.

The first five axioms do not supply either part. The fold, the corners and their algebras, the corner signs, the flux of the twist and the element of the drive on spinors, as this paper defines them, are each carried to themselves by a mirror of the torus and by the reversal of the drive; Definition~\ref{def:levels} fixes a handedness on the internal piece, but it is one of the numbered choices, and it does not say whether the whole geometry has a symmetry that mirrors the torus; and the definitions use a direction of time without saying that the geometry run backwards is another geometry. The count would fail if the geometry had such a symmetry, or if a later paper had to count a state and the same state run backwards as one.

\section{The fibre}\label{sec:fibre}""")

# typesetting only (P65): three symbols of the Lean listings that the listing font lacks are set from the mathematics font
sub(r"xleftmargin=5pt,xrightmargin=5pt,extendedchars=true}",
    r"xleftmargin=5pt,xrightmargin=5pt,extendedchars=true}" + "\n" +
    r"\usepackage{newunicodechar}" + "\n" +
    r"\newunicodechar{∣}{\ensuremath{\mid}}\newunicodechar{∤}{\ensuremath{\nmid}}\newunicodechar{𝒪}{\ensuremath{\mathcal{O}}}")

open(dst, "w", encoding="utf-8").write(s)
print(f"{n} edits applied; written {dst}")
