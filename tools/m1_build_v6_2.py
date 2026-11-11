#!/usr/bin/env python3
"""Build M1 v6.2 from v6.1 (Decision Log P58, P60).
  python3 tools/m1_build_v6_2.py canon/M1/superseded/Paper_M1_Six_Axioms_v6_1.tex canon/M1/superseded/Paper_M1_Six_Axioms_v6_2.tex
Every edit must match exactly once.

Scope: the sign of the lift.  The drive's element on spinors is -w, of cube +1, and the time circle is three
steps, by clauses (b) and (c) of Definition 3.2 (PI ruling P58), in Corollary 7.8; the presentation of SL(2,Z)
is cited to Serre (Verified References V-26).  No result is renumbered.
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

sub("v6.1, canon, 11 Nov 2026", "v6.2, canon, 11 Nov 2026")
sub("v6.1 built from v6.0 by tools/m1_build_v6_1.py (Decision Log P55, P56).  Supersedes v6.0 and v5.0 (canon/M1/superseded/).",
    "v6.2 built from v6.1 by tools/m1_build_v6_2.py (Decision Log P58, P60).  Supersedes v6.1, v6.0 and v5.0 (canon/M1/superseded/).")
sub(r"\date{11 November 2026 (v6.1)}", r"\date{11 November 2026 (v6.2)}")

sub(r"the text uses only the automorphism, and which of the two elements the drive is is left open.",
    r"this section uses only the automorphism. Which of the two elements the drive is on spinors is settled in Corollary~\ref{cor:timecircle}: it is $-w$.")

sub(r"We take the least, three, the corner signs being counted up to one overall sign.",
    r"We take the least, three. On spinors the drive is then the element $-w$, of cube $+1$, and not $w$, of cube $-1$, for which six steps would be needed: clauses (b) and~(c) of Definition~\ref{def:minimal} select it.")

sub(r"""It supposes that the corner signs are counted up to one overall sign, as in Corollary~\ref{cor:lift}.

If the overall sign of the lift is counted as well, the open point of Section~\ref{sec:fibre-worked} enters: with the drive lifted as $w$, three steps return the pattern with the overall sign reversed, since $w^{3}=-1$, and six steps would be needed; with $-w$ three suffice.
""",
r"""It remains to say which of the two elements $w$ and $-w$ of Section~\ref{sec:fibre-worked} the drive is on spinors.

With $w$, three steps return the corner signs with the overall sign reversed, since $w^{3}=-1$, and six steps are needed; with $-w$ three suffice, since $(-w)^{3}=+1$.

The first five axioms allow both.

Clause~(c) takes the least number of steps, which is three, and with it $-w$.

Clause~(b) makes the same selection when every symmetry of the torus, and not only the fold and the drive, is given an element; that every symmetry is given one is a hypothesis of this paragraph.

The group $\mathrm{SL}_{2}(\Z)$ acts on the upper half-plane, the stabiliser of the point $i$ is cyclic of order four and that of $e^{\pi i/3}$ cyclic of order six, and $\mathrm{SL}_{2}(\Z)$ is the amalgam of the two over their common subgroup of order two \cite{Serre}.

The quarter-turn $S$ fixes $i$ and has order four; $U=\bigl(\begin{smallmatrix}0&1\\-1&1\end{smallmatrix}\bigr)$ sends $z$ to $1/(1-z)$, fixes $e^{\pi i/3}$ and has order six; and $S^{2}=U^{3}=-1$.

An assignment of unit quaternions to the symmetries of the torus is therefore a pair $(s,u)$ with $s^{4}=1$ and $s^{2}=u^{3}$, and it gives the drive the element $d=u^{-1}s^{-1}u^{-2}s^{-1}$, since $M_{0}=U^{-1}S^{-1}U^{-2}S^{-1}$.

We ask that the assignment move the three lines $\C_{i},\C_{j},\C_{k}$ as the symmetry moves the corners $P_{2},P_{3},P_{4}$ (Proposition~\ref{prop:collapse}), with no condition on signs.

$S$ exchanges $P_{2}$ and $P_{3}$, so $s$ is one of the four elements $(\pm i\pm j)/\sqrt2$, and $s^{2}=-1$.

$U$ cycles the three corners, so $u$ covers one of the four rotations of order three that cycle the three lines, and of the two elements covering a rotation one has cube $-1$: there are four choices of $u$, of the form $\tfrac12(1\pm i\pm j\pm k)$.

There are thus sixteen assignments, all in the binary octahedral group of order forty-eight.

Direct multiplication, carried out exactly in $\Q(\sqrt2)$ and repeated independently, gives two families of eight.

In the first $d^{3}=+1$, and $s$ and $u$ generate a group of order twelve; a symmetry that leaves every corner in place then leaves $i,j,k$ in place.

In the second $d^{3}=-1$, and $s$ and $u$ generate the whole group of order forty-eight.

The larger group is an object that nothing requires, and clause~(b) removes it.

Six steps is thus a consistent alternative that the sixth axiom declines, and not an impossibility.
""")

sub("\\bibitem{Satake}", "\\bibitem{Serre} J.-P. Serre, \\emph{Trees}, Springer, 1980, Chapter~I, \\S4.2, Example~(c).\n\\bibitem{Satake}")

open(dst, "w", encoding="utf-8").write(s)
print(f"{n} edits applied; written {dst}")
