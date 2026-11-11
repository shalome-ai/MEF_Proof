#!/usr/bin/env python3
"""Build M1 v6.1 from v6.0 (Decision Log P55, P56).
  python3 tools/m1_build_v6_1.py canon/M1/superseded/Paper_M1_Six_Axioms_v6.tex canon/M1/superseded/Paper_M1_Six_Axioms_v6_1.tex
Every edit must match exactly once.

Scope: (1) clause (a), one drive, is the ground of trace three and clause (c), least entropy, agrees (P55);
(2) Proposition 4.5 cites its new certificate M1_L7_onedrive.lean; (3) Goedel's theorem is cited (V-25);
(4) the uncited sentence on larger structure groups in Proposition 7.3 is reworded so that no reference is needed.
No result is renumbered.
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

# label
sub("v6.0, canon, 11 Nov 2026", "v6.1, canon, 11 Nov 2026")
sub("Supersedes v5.0 (canon/M1/superseded/; Decision Log P54).",
    "v6.1 built from v6.0 by tools/m1_build_v6_1.py (Decision Log P55, P56).  Supersedes v6.0 and v5.0 (canon/M1/superseded/).")
sub(r"\date{11 November 2026 (v6.0)}", r"\date{11 November 2026 (v6.1)}")

# (1) the ground of trace three
sub(r"On the drive clauses (a) and~(c) make the same selection (Section~\ref{sec:drive}).",
    r"On the drive clause~(a) makes the selection, and clause~(c) agrees with it (Section~\ref{sec:drive}).")
sub(r"Clause~(c) of Definition~\ref{def:minimal}, which is applied to the step, selects the least entropy, hence the least $\lvert t\rvert>2$. The trace is taken positive.",
    r"Clause~(a) of Definition~\ref{def:minimal} makes the selection: trace three is the only trace at which there is one drive and not several (Theorem~\ref{thm:drive}, Proposition~\ref{prop:onedrive}). The trace is taken positive.")
sub(r"The least trace is then $t=3$ (certificate \texttt{L1\_trace3\_min}). The content of the section is that this selection is unique, and that clause~(a) makes the same selection: trace three is the only trace at which there is one drive and not several (Proposition~\ref{prop:onedrive}).",
    r"Clause~(c), which is applied to the step, agrees: the least entropy is that of the least $\lvert t\rvert>2$, which is $t=3$ (certificate \texttt{L1\_trace3\_min}). The content of the section is that there is one drive of trace three, and that at every larger trace there is more than one.")
sub(r"A4 with clauses (a) and~(c) gives the drive (Theorem~\ref{thm:drive}, Proposition~\ref{prop:onedrive}).",
    r"A4 with clause~(a) gives the drive, and clause~(c) agrees (Theorem~\ref{thm:drive}, Proposition~\ref{prop:onedrive}).")
sub(r"trace $\geq4$ & least entropy; several drives &", r"trace $\geq4$ & several drives; least entropy &")

# (2) Proposition 4.5 and its certificate
sub(r"so that $\det P=-(p^{2}+tpq+q^{2})$.",
    r"so that $\det P=-(p^{2}+tpq+q^{2})$ (certificate \texttt{L7\_det\_of\_intertwiner}).")
sub(r"So $x=y$, and $x^{2}(2-t)=-1$ gives $x=1$ and $t=3$.",
    r"So $x=y$, and $x^{2}(2-t)=-1$ gives $x=1$ and $t=3$ (\texttt{L7\_trace3\_solution}).")
sub("For $t\\geq4$ there is no solution.\n",
    "For $t\\geq4$ there is no solution (\\texttt{L7\\_descent}, \\texttt{L7\\_no\\_int\\_solution}, \\texttt{L7\\_not\\_conj\\_inverse}).\n")
sub(r"satisfies $PA_{t}=A_{t}^{-1}P$ for every $t$, so that",
    r"satisfies $PA_{t}=A_{t}^{-1}P$ for every $t$ (\texttt{L7\_flip}), so that")

# (4) Proposition 7.3: no claim about the larger structure groups
sub(r"$\Spinc$ is the least such structure, and clause~(b) of Definition~\ref{def:minimal} admits no larger one.",
    r"A $\Spinc$ structure exists, and clause~(b) of Definition~\ref{def:minimal} admits no structure group larger than is needed.")
sub(r"Among $\mathrm{Spin}\subset\Spinc\subset\mathrm{Spin}^{h}\subset\cdots$, $\Spinc$ has the least structure group lifting a non-zero $w_{2}$, and the larger ones reduce to it when $w_{2}$ lifts integrally.",
    r"A $\Spinc$ structure therefore suffices. A larger structure group, such as that of a $\mathrm{Spin}^{h}$ structure, is not needed, and clause~(b) does not admit it.")

# (3) Goedel
sub(r"Together they resemble G\"odel's incompleteness theorem.",
    r"Together they resemble G\"odel's first incompleteness theorem, that a consistent formal system in which a certain amount of arithmetic can be carried out leaves statements it can neither prove nor disprove \cite{Godel1931}. The theorem is about formal systems and is not applied here.")
sub(r"\bibitem{GriffithsHarris}",
    "\\bibitem{Godel1931} K. G\\\"odel, \\\"Uber formal unentscheidbare S\\\"atze der Principia Mathematica und verwandter Systeme I, \\emph{Monatsh. Math. Phys.} 38 (1931) 173--198.\n\\bibitem{GriffithsHarris}")

# appendix
sub(r"Five files, Lean 4.15.0, core library only, no Mathlib, no author axioms, zero \texttt{sorry}; fifty-eight theorems. The files were compiled independently on two toolchains,",
    r"Six files, core library only, no Mathlib, no author axioms, zero \texttt{sorry}; sixty-six theorems. The sixth file, \texttt{M1\_L7\_onedrive.lean}, was written for Lean 4.29.1, the toolchain of the author's Lean project, uses its core tactics \texttt{grind} and \texttt{push\_cast}, and was compiled on that toolchain only. The first five, with fifty-eight theorems, were written for Lean 4.15.0 and were compiled independently on two toolchains,")
sub(r"with identical results; no proof depends on the default simplifier set", r"with identical results; no proof of theirs depends on the default simplifier set")
sub("The five files follow verbatim.",
    r"\texttt{M1\_L7\_onedrive.lean} (Proposition~\ref{prop:onedrive}): an integer matrix carrying $A_{t}$ to its inverse has determinant $-(p^{2}+tpq+q^{2})$; for $t\geq4$ the equation $p^{2}+tpq+q^{2}=-1$ has no solution in integers, by the descent of the proof, so that no such matrix has determinant one; the solution $(1,-1)$ at $t=3$; the matrix of determinant $-1$ that carries $A_{t}$ to its inverse for every $t$." + "\n\nThe six files follow verbatim.")
sub("\\lstinputlisting{M1_lean/M1_L6_twist.lean}\n",
    "\\lstinputlisting{M1_lean/M1_L6_twist.lean}\n\n\\subsection*{\\texttt{M1\\_L7\\_onedrive.lean} --- one drive at trace three only}\n\\lstinputlisting{M1_lean/M1_L7_onedrive.lean}\n")

open(dst, "w", encoding="utf-8").write(s)
print(f"{n} edits applied; written {dst}")
