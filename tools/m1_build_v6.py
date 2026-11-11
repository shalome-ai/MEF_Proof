#!/usr/bin/env python3
"""Build the working draft of M1 with six axioms from canon v5.0 (Decision Log P42-P47).
  python3 tools/m1_build_v6.py canon/M1/superseded/Paper_M1_Five_Axioms_v5.tex canon/M1/superseded/Paper_M1_Six_Axioms_v6.tex
Every edit must match exactly once.  Canon is not touched.

Scope (P43(1), P44-P47; papers/M1/SIXTH_AXIOM_MINIMALITY.md): the sixth axiom, made formal for the shape in three
clauses (a), (b), (c) that replace the four criteria of Definition 3.2; trace three stated both ways, with
Proposition 4.5 new; overall size has no meaning; the remnant of Proposition 8.2 at l.844 removed; one sentence
on Goedel in the outlook, tagged [M].  No proof of v5.0 is changed and no theorem of v5.0 is renumbered."""
import sys
t = open(sys.argv[1], encoding="utf-8").read()
log = []
def sub(old, new, what):
    global t
    assert t.count(old) == 1, (t.count(old), what, old[:70])
    t = t.replace(old, new); log.append(what)

# ---- header, title, abstract, section 1 ---------------------------------------------------
sub("% Paper M1 — Five axioms and their minimal geometry\n% Base paper of the Master Equation Framework series.  v5.0, canon, 10 Nov 2026\n% (five axioms; the fifth in two clauses; Decision Log P19, P23, P31-P39).  Supersedes v2 (canon/M1/superseded/).",
    "% Paper M1 — Six axioms and their minimal geometry\n% Base paper of the Master Equation Framework series.  v6.0, canon, 11 Nov 2026\n% (six axioms; the sixth carries minimality; Decision Log P42-P47).  Built from v5.0 by tools/m1_build_v6.py.  Supersedes v5.0 (canon/M1/superseded/; Decision Log P54).",
    "header")
sub(r"\title{Five axioms and their minimal geometry}", r"\title{Six axioms and their minimal geometry}", "title")
sub(r"\date{10 November 2026 (v5.0, canon)}", r"\date{11 November 2026 (v6.0)}", "date")
sub("We begin from five characteristics of the universe that need no instrument to recognise: it is aware of itself and closes on itself; it grows and decays; the order of its events matters; it never stands still; and what is seen of it is less than what is there. Taken as axioms on a compact Riemannian geometry $(T\\times\\Sigma)\\times F$, each behavioural word given its meaning in a numbered definition, and with a lexicographic notion of minimality, they force a unique geometry.",
    "We begin from six characteristics of the universe that need no instrument to recognise: it closes on itself; it grows and decays; the order of its events matters; it never stands still; what is seen of it is less than what is there; and it is one thing. Taken as axioms on a compact Riemannian geometry $(T\\times\\Sigma)\\times F$, each behavioural word given its meaning in a numbered definition, they force a unique geometry. The sixth axiom carries minimality.",
    "abstract")
sub(r"\section{What is observed, and the five axioms}", r"\section{What is observed, and the six axioms}", "section 1 title")
sub("and from them we state five axioms. From the five axioms, and a principle of choosing the simplest geometry that satisfies them, we derive in this paper",
    "and from them we state six axioms. From the six axioms we derive in this paper", "l.58")
sub("Five things are apparent to anyone.", "Six things are apparent to anyone.", "l.62")
sub("and what is seen does not by itself say what it is the shadow of.\n",
    "and what is seen does not by itself say what it is the shadow of.\n\n"
    "A baby sees everything as one thing, and that one thing is everything. There are no labels, no categorisations, no judgements. They don't see their parents or their environment as separate from them. They exist, and all that exists is them.\n",
    "sixth observation (the PI's words, P43(1))")
sub(r"\subsection{The five axioms}\label{sec:fouraxioms}", r"\subsection{The six axioms}\label{sec:fouraxioms}", "subsection title")
sub("We take these five observations as axioms", "We take these six observations as axioms", "l.76")
sub("The same shadow can be describing two different objects, and a single object can have multiple shadows.\n\\end{axiom}\n",
    "The same shadow can be describing two different objects, and a single object can have multiple shadows.\n\\end{axiom}\n\n"
    "\\begin{axiom}[oneness]\\label{ax:A6}\nThere is only one thing, and that one thing is everything.\n\\end{axiom}\n",
    "Axiom 6")
sub("shadow carries the thing and what is seen of it. That no cycle",
    "shadow carries the thing and what is seen of it; oneness carries the world of the baby. That no cycle", "l.98a")
sub("It says also how the hidden part shows: one thing in several shadows, and several things in one.",
    "It says also how the hidden part shows: one thing in several shadows, and several things in one. The sixth differs again. It says nothing of how the universe behaves or of how it is seen; it says that there is nothing besides it, and it is in this axiom that minimality is placed: the geometry is the least that is required to make sense of what is observed (Section~\\ref{sec:minimal}).",
    "l.98b")
sub("The result is that the five axioms, together with a stated principle of minimality, force a unique geometry:",
    "The result is that the six axioms force a unique geometry:", "l.114")
sub("Section~\\ref{sec:axioms} turns the five sentences into mathematics,", "Section~\\ref{sec:axioms} turns the first five sentences into mathematics,", "l.121a")
sub("Section~\\ref{sec:minimal} defines minimality.",
    "Section~\\ref{sec:minimal} does the same for the sixth, in three clauses that are three further numbered choices, and defines minimality.", "l.121b")
sub(r"\section{The five axioms as mathematics}\label{sec:axioms}", r"\section{The first five axioms as mathematics}\label{sec:axioms}", "section 2 title")

# ---- overall size (P45(3), P46(2)) ----------------------------------------------------------
sub("One quantity is not constrained by any axiom: the overall size of the shape. The definition of minimality in the next section is made independent of size, and the final theorem states the size, with the aspect ratio of the internal fibre, as the input the axioms do not supply.",
    "The overall size of the shape is not among the things to be fixed: under the sixth axiom, taken up in the next section, there is nothing outside the shape against which its size could be measured, and only proportions within it have a meaning. One proportion is not derived in this paper, the aspect ratio of the internal fibre, and the final theorem states it as its declared input.",
    "l.231 size")

# ---- section 3: the sixth axiom made formal (P45, P46, P47) ---------------------------------
OLD_3 = r"""\section{Minimality}\label{sec:minimal}

\begin{definition}[modulus]\label{def:modulus}"""
NEW_3 = r"""\section{The sixth axiom as mathematics: minimality}\label{sec:minimal}

The sentence is: \emph{there is only one thing, and that one thing is everything}.

``Everything'' is read as everything that can be observed or spoken of. The axiom is not read as saying that the one thing contains all that could exist, and it does not say what, if anything, lies beyond what can be spoken of.

For a shape the sentence is given three meanings. Each is a choice of meaning and not a consequence of the words, and they are the seventh, eighth and ninth choices of this paper.

The first: nothing is left to be chosen. If the shape had a dial that could sit at different settings, something would have to set it, and there is nothing else to set it. If the axioms allowed several versions of one piece of the shape that no relabelling carries into one another, something would have to pick one, and there is nothing else to pick.

The second: nothing is in the shape that is not needed. It carries no object, a twisting line, a larger structure, a loop, that the other five axioms do not call for.

The third: what is needed is least. The shape is the least that is required to make sense of what is observed.

One thing follows without a choice. With only one thing there is no ruler outside it. The overall size of the shape is a comparison with a second thing, and there is none: it has no meaning. A metre, a second or any other unit names a comparison between two things inside the shape, and only such proportions mean anything.

\begin{definition}[modulus]\label{def:modulus}"""
sub(OLD_3, NEW_3, "section 3 opening")

OLD_32 = r"""\begin{definition}[minimal]\label{def:minimal}
Among geometries satisfying A1--A5, $M$ is \emph{minimal} if it is selected by the following criteria applied in order, each used only to break ties left by the previous ones: (1) parametric: $M$ has no modulus; (2) dynamical: one step of the drive of $M$ (Section~\ref{sec:drive}) has the least positive topological entropy; (3) arithmetic: the topological integers of $F$ (its Euler characteristic, its flux quanta) lie in $\{2^{a}3^{b}\}$, the prime five entering only through the drive; (4) dimensional: $M$ has least total dimension, and then least $\lvert\pi_{1}(\Sigma)\rvert$.
\end{definition}

Criterion~(1) is the statement that a geometry with a dial would admit two universes differing only by that dial. Criterion~(2) selects the gentlest drive that still drives; it is of the same character as the last clause of~(4), the smallest fundamental group, and both express the instinct that the geometry carries no unforced structure. Criterion~(3) is a filter whose content is shown in Section~\ref{sec:theorem} to be an output of the selection rather than an input. Overall scale is exempt by construction."""
NEW_32 = r"""\begin{definition}[oneness, formal; minimal]\label{def:minimal}
A geometry satisfying A1--A5 satisfies A6, and is called \emph{minimal}, if it is selected by the following three clauses applied in order, each applied among the geometries that the previous ones leave:

(a) nothing is left to be chosen: $M$ has no modulus, and the step of its drive (Section~\ref{sec:drive}) is the only one of its trace, up to a relabelling of the torus that keeps its orientation;

(b) nothing is present that is not needed: $M$ carries no object, whether a twisting line, a structure group larger than is needed, or a class of loops, that A1--A5 do not require;

(c) what is needed is least: one step of the drive of $M$ has the least positive topological entropy; $M$ has the least total dimension; the twist of its fibre has the least flux; and its time circle has the least number of steps.
\end{definition}

Clause~(a) is the statement that a geometry with a dial would admit two universes differing only by that dial, with nothing to say which is the one. A clause of this kind can exclude and cannot pick: it is applied at the two points at which the first five axioms leave a datum unselected among equals, the setting of a dial and the class of a drive among those of one trace. Clause~(b) removes what nothing forces. Clause~(c) selects the gentlest drive that still drives, the fewest dimensions, the least flux and the shortest time circle; the quantities to which it applies are the four it names, and it is applied after clause~(b), so that it does not replace a structure that needs no further object by one with a smaller integer. On the drive clauses (a) and~(c) make the same selection (Section~\ref{sec:drive}). That the topological integers of the geometry lie in $\{2^{a}3^{b}\}$, the prime five entering only through the drive, is not a clause: Section~\ref{sec:theorem} shows it to be an output. Overall size is not a modulus and is not selected: it has no meaning."""
sub(OLD_32, NEW_32, "Definition 3.2 and the paragraph after it")

# ---- the drive: both routes (P44) -----------------------------------------------------------
sub("Criterion~(2) of Definition~\\ref{def:minimal}, which is applied to the step, selects the least entropy, hence the least $\\lvert t\\rvert>2$, which is $t=3$ (certificate \\texttt{L1\\_trace3\\_min}). The content of the section is that this selection is unique.",
    "Clause~(c) of Definition~\\ref{def:minimal}, which is applied to the step, selects the least entropy, hence the least $\\lvert t\\rvert>2$. The trace is taken positive. This is an input and not a selection: $-M$ is $M$ followed by $z\\mapsto-z$, which Section~\\ref{sec:fibre} finds to be the fold, so that $M$ and $-M$ have the same entropy and are the same map of the folded fibre. The least trace is then $t=3$ (certificate \\texttt{L1\\_trace3\\_min}). The content of the section is that this selection is unique, and that clause~(a) makes the same selection: trace three is the only trace at which there is one drive and not several (Proposition~\\ref{prop:onedrive}).",
    "l.267")
sub("larger, as criterion~(2) requires it to be,", "larger, as clause~(c) requires it to be,", "l.341")

OLD_45 = "the orientation is a convention with no invariant content (Appendix~\\ref{app:labels}).\n"
NEW_45 = OLD_45 + r"""
\begin{proposition}[one drive at trace three only]\label{prop:onedrive}
For every integer $t\geq4$ the matrix $A_{t}=\bigl(\begin{smallmatrix}t&-1\\1&0\end{smallmatrix}\bigr)$ of trace $t$ is not conjugate in $\mathrm{SL}_{2}(\Z)$ to its inverse, so that there are at least two classes of trace $t$. At $t=3$ there is one class (Theorem~\ref{thm:drive}). Among positive traces, and under relabellings of the torus that keep its orientation, trace three is therefore the only one at which the drive is a single object, and clause~(a) of Definition~\ref{def:minimal} selects it. \rigR
\end{proposition}

\begin{proof}
$A_{t}^{-1}=\bigl(\begin{smallmatrix}0&1\\-1&t\end{smallmatrix}\bigr)$.

Let $P=\bigl(\begin{smallmatrix}p&q\\r&s\end{smallmatrix}\bigr)$ be an integer matrix with $PA_{t}=A_{t}^{-1}P$.

Comparing entries gives $r=tp+q$ and $s=-p$, so that $\det P=-(p^{2}+tpq+q^{2})$.

The two matrices are therefore conjugate in $\mathrm{SL}_{2}(\Z)$ exactly when $p^{2}+tpq+q^{2}=-1$ has a solution in integers.

Suppose it has one.

Then $pq<0$, since otherwise the left side is not negative.

The equation is unchanged when the signs of $p$ and $q$ are both reversed and when the two are exchanged, so we may write $p=x$ and $q=-y$ with $x\geq y\geq1$ and $x^{2}-txy+y^{2}=-1$, and take such a pair with $x+y$ least.

If $x>y$, the second root of $X^{2}-tyX+(y^{2}+1)$ is $x'=ty-x=(y^{2}+1)/x$, a positive integer, and $x'\leq(y^{2}+1)/(y+1)\leq y$.

Then $(y,x')$ is a pair of the same kind with a smaller sum, which contradicts the choice.

So $x=y$, and $x^{2}(2-t)=-1$ gives $x=1$ and $t=3$.

For $t\geq4$ there is no solution.

The hypothesis on the relabellings is used: $P=\bigl(\begin{smallmatrix}1&0\\t&-1\end{smallmatrix}\bigr)$ has determinant $-1$ and satisfies $PA_{t}=A_{t}^{-1}P$ for every $t$, so that under relabellings that reverse the orientation the drive is conjugate to its inverse at every trace and the argument selects nothing.
\end{proof}
"""
sub(OLD_45, NEW_45, "Proposition 4.5 (new)")

# ---- criteria renamed to clauses where they are used ----------------------------------------
sub("Criterion~(4) of Definition~\\ref{def:minimal} selects the least dimension;", "Clause~(c) of Definition~\\ref{def:minimal} selects the least dimension;", "l.449")
sub("under criterion~(4) of Definition~\\ref{def:minimal} its dimension is twelve.", "under clause~(c) of Definition~\\ref{def:minimal} its dimension is twelve.", "l.543")
sub("Criterion~(4) takes the least total dimension, and a larger block", "Clause~(c) takes the least total dimension, and a larger block", "l.551")
sub("together with the exemption of overall scale in Definition~\\ref{def:minimal}.", "together with the absence of an overall scale (Section~\\ref{sec:minimal}).", "l.621")
sub("$\\Spinc$ is the least such structure. The structure induced", "$\\Spinc$ is the least such structure, and clause~(b) of Definition~\\ref{def:minimal} admits no larger one. The structure induced", "l.629a")
sub("excluded by criterion~(1) of Definition~\\ref{def:minimal} as an unforced datum.", "excluded by clause~(b): the twisting line is an object that nothing requires.", "l.629b")
sub("That the least flux is taken is a minimal choice, of the same character as criterion~(1). The twisting line that criterion~(1) removes in Proposition~\\ref{prop:spinc} is a line on $\\CPtwo$ that nothing forces; the twist of the fibre is forced by the fifth axiom.",
    "That the least flux is taken is clause~(c) of Definition~\\ref{def:minimal}. The twisting line that clause~(b) removes in Proposition~\\ref{prop:spinc} is a line on $\\CPtwo$ that nothing forces; the twist of the fibre is forced by the fifth axiom, and clause~(c) takes the least of it.", "l.750")
sub("That the least multiple is taken is a minimal choice of the same character as the last clause of criterion~(4).", "That the least multiple is taken is clause~(c) of Definition~\\ref{def:minimal}.", "l.791")
sub("Second, criterion~(2) is applied to the step and not to the map once round the time circle. The map once round is a power of the step and is not chosen separately. That the criterion is applied to the step is a choice of what the criterion is applied to, and is recorded as such.",
    "Second, the entropy of clause~(c) is that of the step and not of the map once round the time circle. The map once round is a power of the step and is not chosen separately. That the clause is applied to the step is a choice of what the clause is applied to, and is recorded as such.", "l.800")
sub("a discrete choice which criterion~(1) removes.", "a further object, which clause~(b) removes.", "l.830")
sub("Through $\\Stwo$, which is spin, $Q_{w}$ is even, and the least even quantum compatible with one canonical unit $c_{1}(K^{-1}_{S^{2}})=2$ per sector is a multiple of two.",
    "Through $\\Stwo$, which is spin, $Q_{w}$ is even.", "l.844 remnant of Proposition 8.2 removed")
sub("The last clause of criterion~(4) takes the least fundamental group, the trivial one; and a closed,",
    "Clause~(b) of Definition~\\ref{def:minimal} admits no class of loops that nothing requires, and the loop of Definition~\\ref{def:A1} is supplied by the time circle: the fundamental group of $\\Sigma$ is trivial; and a closed,", "l.849")
sub("The quotients of the sphere by $\\Z_{2}$ and $\\Z_{3}$ pass criteria (1)--(3) and are removed only by the least-$\\pi_{1}$ clause, which is recorded as the reason; a stronger principle, that the geometry carries no unforced topology, would remove them without the clause and is not adopted.",
    "The quotients of the sphere by $\\Z_{2}$ and $\\Z_{3}$ have no modulus and are removed only by clause~(b), which is recorded as the reason: their loops are topology that no axiom requires.", "l.852")

# ---- the theorem ----------------------------------------------------------------------------
sub("Its hypotheses are the five axioms, the six readings of Section~\\ref{sec:axioms}, the minimality principle of Section~\\ref{sec:minimal}, and one declared input;",
    "Its hypotheses are the six axioms, the six readings of Section~\\ref{sec:axioms} and the three of Section~\\ref{sec:minimal}, and one declared input;", "l.870")
sub("with the overall scale and the aspect ratio of the fibre held by a declared sector, the minimal geometry in the sense of Definition~\\ref{def:minimal} is unique and is",
    "with the aspect ratio of the fibre held by a declared sector, the geometry that satisfies A6 in the sense of Definition~\\ref{def:minimal}, the minimal geometry, is unique and is", "l.873")
sub("A4 with criterion~(2) gives the drive (Theorem~\\ref{thm:drive}).", "A4 with clauses (a) and~(c) gives the drive (Theorem~\\ref{thm:drive}, Proposition~\\ref{prop:onedrive}).", "l.883")
sub("A1--A4 with criterion~(4) give the fibre,", "A1--A4 with clause~(c) give the fibre,", "l.885")
sub("A3 with criterion~(4) gives dimension twelve", "A3 with clause~(c) gives dimension twelve", "l.887")
sub("$L=\\Oline{3}$ by criterion~(1), and $\\Sigma=S^{3}$ by criterion~(4) (Theorem~\\ref{thm:base}).", "$L=\\Oline{3}$ and $\\Sigma=S^{3}$ by clause~(b) (Theorem~\\ref{thm:base}).", "l.889")
sub("Corollaries~\\ref{cor:lift} and~\\ref{cor:timecircle} give the time circle.", "Corollaries~\\ref{cor:lift} and~\\ref{cor:timecircle} give the time circle, of the least number of steps by clause~(c), as the least flux of the twist is.", "l.891")
sub("Criterion~(3) therefore removes nothing that the other criteria had not removed, and is an output.",
    "No clause of Definition~\\ref{def:minimal} speaks of these primes: that the topological integers lie in $\\{2^{a}3^{b}\\}$, the prime five entering only through the drive, is an output.", "l.895")
sub("it does not assert that a non-minimal geometry, one of dimension sixteen or with a lens-space spatial factor, fails the axioms, and it does not derive the overall scale or the aspect ratio of the fibre. That these two are fixed is the declared input of the theorem; it would fail if the stationarity conditions of the geometry's energy left either free, and the geometry would then not meet criterion~(1).",
    "it does not assert that a non-minimal geometry, one of dimension sixteen or with a lens-space spatial factor, fails the first five axioms, and it does not derive the aspect ratio of the fibre. That this proportion is fixed is the declared input of the theorem; it would fail if the stationarity conditions of the geometry's energy left it free, and the geometry would then not meet clause~(a). The overall size is not an input: under the sixth axiom it has no meaning. The three clauses of Definition~\\ref{def:minimal} are readings of the sixth axiom and its words do not force them: a reader who does not take clause~(c) has dimension twelve, flux three and three steps as the least admissible values and not as the only ones, and a reader who allows relabellings that reverse orientation has the drive by clause~(c) alone.",
    "l.898 deflationary reading")
sub("$D=16,20,\\dots$ & least dimension & Definition~\\ref{def:minimal}(4) & \\rigD\\\\", "$D=16,20,\\dots$ & least dimension & Definition~\\ref{def:minimal}(c) & \\rigD\\\\", "table: dimension")
sub("trace $\\geq4$ & least entropy; trace three unique & Theorem~\\ref{thm:drive} & \\rigR\\\\", "trace $\\geq4$ & least entropy; several drives & Thm.~\\ref{thm:drive}, Prop.~\\ref{prop:onedrive} & \\rigR\\\\", "table: trace")
sub("$S^{3}/\\Z_{2}$, $S^{3}/\\Z_{3}$ & least $\\lvert\\pi_{1}(\\Sigma)\\rvert$ & Proposition~\\ref{prop:S3} & \\rigD\\\\", "$S^{3}/\\Z_{2}$, $S^{3}/\\Z_{3}$ & loops that nothing requires & Proposition~\\ref{prop:S3} & \\rigD\\\\", "table: S3")
sub("bases with moduli: $\\CPtwo\\times T^{2}$, $T^{6}$ & criterion (1) & Definition~\\ref{def:minimal} & \\rigR\\\\", "bases with moduli: $\\CPtwo\\times T^{2}$, $T^{6}$ & clause (a) & Definition~\\ref{def:minimal} & \\rigR\\\\", "table: moduli")

# ---- outlook --------------------------------------------------------------------------------
sub("is now a theorem of five axioms and a minimality principle,", "is now a theorem of six axioms,", "l.932")
sub("are the variables in which that equation is written.\n",
    "are the variables in which that equation is written.\n\n"
    "The sixth axiom gives that nothing is absolute: there is no ruler outside the one thing. The fifth gives that the view from inside is incomplete: what is seen does not determine what is there (Remark~\\ref{rem:loss}). Together they resemble G\\\"odel's incompleteness theorem. The resemblance is recorded here and nothing is derived from it. \\rigM\n",
    "outlook: the resemblance to Goedel (P47)")

import re
body = t.split("\\begin{thebibliography}")[0]
for left in ("riterion", "Five axioms", "minimality principle", "principle of minimality"):
    assert left not in body, ("left over", left, body.count(left))
assert not re.search(r"(?<!other )(?<!first )five axioms", body), "left over: five axioms"
open(sys.argv[2], "w", encoding="utf-8").write(t)
print(f"{len(log)} edits applied; written {sys.argv[2]}")
