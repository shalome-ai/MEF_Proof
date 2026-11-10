#!/usr/bin/env python3
"""Build papers/M1/Paper_M1_Five_Axioms_v4.tex from canon/M1/Paper_M1_Four_Axioms_v2.tex.
Usage: m1_build_v4.py <v2.tex> <v4.tex>.  Every edit must match exactly once.

Scope (Decision Log P32): the fifth axiom integrated as the warrant for the family
M = (T x Sigma) x F, and nothing else.  Sections 3 to 8 are changed only where they count
the axioms.  Second pass: the time circle (P28). Proposition 8.2 stays, with its stationarity conditions as a declared assumption."""
import sys
t = open(sys.argv[1], encoding="utf-8").read()
log = []
def sub(old, new, what):
    global t
    assert t.count(old) == 1, (t.count(old), what, old[:70])
    t = t.replace(old, new); log.append(what)

# ---- header, title, abstract, section 1 ------------------------------------------------
sub("% Paper M1 — Four axioms and their minimal geometry\n% Base paper of the Master Equation Framework series.  Draft v1, 7 Nov 2026.",
    "% Paper M1 — Five axioms and their minimal geometry\n% Base paper of the Master Equation Framework series.  v4.3 WORKING DRAFT, 10 Nov 2026\n% (the fifth axiom integrated, with its two clauses; Decision Log P19, P23, P31, P33, P34).  Not canon.",
    "header")
sub(r"\title{Four axioms and their minimal geometry}", r"\title{Five axioms and their minimal geometry}", "title")
sub(r"\date{8 November 2026 (v2.1)}", r"\date{10 November 2026 (v4, working draft)}", "date")
sub("We begin from four characteristics of the universe that need no instrument to recognise: it is aware of itself and closes on itself; it grows and decays; the order of its events matters; it never stands still.",
    "We begin from five characteristics of the universe that need no instrument to recognise: it is aware of itself and closes on itself; it grows and decays; the order of its events matters; it never stands still; and what is seen of it is less than what is there.",
    "abstract: five characteristics")
sub(r"\section{What is observed, and the four axioms}", r"\section{What is observed, and the five axioms}", "section 1 title")
sub("and from them we state four axioms. From the four axioms, and a principle",
    "and from them we state five axioms. From the five axioms, and a principle", "l.52")
sub("Four things are apparent to anyone.", "Five things are apparent to anyone.", "l.56")
sub("What has been done cannot be undone by doing it again in another order.\n",
    "What has been done cannot be undone by doing it again in another order.\n\n"
    "A thing and its shadow are not the same. A shadow on the ground tells a good deal about what casts it, but not everything: the shadow is flat and the thing is not. Two quite different things can cast the same shadow, and one thing can cast quite different shadows. What is seen of the world is of this kind. There is more to the world than the part of it that is seen, and what is seen does not by itself say what it is the shadow of.\n",
    "fifth observation")
sub(r"\subsection{The four axioms}\label{sec:fouraxioms}", r"\subsection{The five axioms}\label{sec:fouraxioms}", "subsection title")
sub("We take these four observations as axioms", "We take these five observations as axioms", "l.68")
sub("The universe is in constant change; it never stands still.\n\\end{axiom}\n",
    "The universe is in constant change; it never stands still.\n\\end{axiom}\n\n"
    "\\begin{axiom}[shadow]\\label{ax:A5}\nWe can see the shadow, but the shadow is missing information about what it is a shadow of. The same shadow can be describing two different objects, and a single object can have multiple shadows.\n\\end{axiom}\n",
    "Axiom 5")
sub("drive carries the weather and the mountains. That no cycle repeats exactly is not a fifth axiom but a consequence of the first and the fourth together, as Section~\\ref{sec:drive} shows.",
    "drive carries the weather and the mountains; shadow carries the thing and what is seen of it. That no cycle repeats exactly is not a further axiom but a consequence of the first and the fourth together, as Section~\\ref{sec:drive} shows. The fifth axiom differs in kind from the other four. They say how the universe behaves; it says that the universe has a part that is seen and a part that is not, and it is in those terms that the other four are made precise. It says also how the hidden part shows: one thing in several shadows, and several things in one.",
    "l.86")
sub("The result is that the four axioms, together with", "The result is that the five axioms, together with", "l.102")
sub("turns the four sentences into mathematics, at a level intended to be followed by a first-year mathematics graduate, and isolates as numbered definitions the four points at which",
    "turns the five sentences into mathematics, at a level intended to be followed by a first-year mathematics graduate, and isolates as numbered definitions the six points at which", "l.109")

# ---- section 2: the fifth axiom formalised first ----------------------------------------
sub(r"\section{The four axioms as mathematics}", r"\section{The five axioms as mathematics}", "section 2 title")
sub("We do this one axiom at a time, in words first and symbols second,",
    "We do this one axiom at a time, the fifth first because the other four are stated in its terms, in words first and symbols second,", "l.113")

OLD_21 = r"""\subsection{The shapes we consider}

A \emph{geometry} here is a smooth shape, of some number of dimensions, on which lengths and angles can be measured, and which is allowed to have a few isolated sharp points (cone points, like the tip of a paper cone). We write it as a product of three pieces,
\begin{equation}\label{eq:family}
M \;=\; (T \times \Sigma) \times F ,
\end{equation}
where $T$ is a one-dimensional piece carrying time, $\Sigma$ is a piece carrying space, and $F$ is an internal piece that is not directly seen. A product of pieces means, as for a rectangle made of two intervals, that a point of $M$ is a point of each piece at once. Writing $M$ this way is only a way of naming the pieces: the way lengths are measured may tie the pieces together, and the second axiom will insist that it does.
"""
NEW_21 = r"""\subsection{Shadow, and the shapes we consider}\label{sec:A5}

The axiom has two sentences: \emph{we can see the shadow, but the shadow is missing information about what it is a shadow of}; and \emph{the same shadow can be describing two different objects, and a single object can have multiple shadows}.

For a shape the first sentence says two things. There is more to the shape than the part along which we see: besides time and space it has a part that is not directly seen. And what is seen is what is left of the whole when that part is forgotten, the way the shadow of a solid thing on the ground is what is left of it when its height is forgotten. This is clause~(i) of the definition below.

The second sentence names the two ways in which a shadow fails to tell what casts it, and each becomes a clause. That a single object can have multiple shadows is clause~(ii). That the same shadow can be describing two different objects is clause~(iii).

A \emph{geometry} here is a smooth shape, of some number of dimensions, on which lengths and angles can be measured, and which is allowed to have a few isolated sharp points (cone points, like the tip of a paper cone).

\begin{definition}[shadow, formal]\label{def:A5}
A geometry satisfies A5 if (i) it is a product of three pieces,
\begin{equation}\label{eq:family}
M \;=\; (T \times \Sigma) \times F ,
\end{equation}
where $T$ is a one-dimensional piece carrying time, $\Sigma$ is a piece carrying space, and $F$ is an internal piece, and what is seen is the image of $M$ under the projection
\[
\pi\colon M\to T\times\Sigma,\qquad \pi(t,x,f)=(t,x),
\]
that forgets $F$, the image under $\pi$ of a point or of a subset of $M$ being its \emph{shadow}; and

(ii) the structure carried by the internal piece is not carried to itself by one step of the drive of the fourth axiom, so that what is seen of one thing is not the same at every step; and

(iii) the internal piece has at least two independent states at rest with the same shadow: states that differ only in the internal piece.
\end{definition}

Clauses (ii) and~(iii) are the two halves of the axiom's second sentence, taken in turn. The words \emph{step} and \emph{state at rest} are made exact where they are used, in Sections~\ref{sec:drive} and~\ref{sec:base} (Definition~\ref{def:states}), and it is there that the two clauses do their work (Proposition~\ref{prop:twist}).

A product of pieces means, as for a rectangle made of two intervals, that a point of $M$ is a point of each piece at once. Writing $M$ this way is only a way of naming the pieces. The way lengths are measured may tie the pieces together, and the second axiom will insist that it does; and the internal piece may be carried round time by a map of itself, as Section~\ref{sec:drive} finds. That the part along which we see is time and space, and that seeing is the projection $\pi$, is the first of the six choices this section records. That an object, in clauses (ii) and~(iii), is a state of the internal piece at rest, and its shadow what is left of it when the internal piece is forgotten, is the second.

\begin{remark}[what the shadow loses]\label{rem:loss}
The projection $\pi$ is onto, and it is one-to-one only if $F$ is a single point: if $f\neq f'$ are two points of $F$, then $(t,x,f)$ and $(t,x,f')$ are different points of $M$ with the same shadow $(t,x)$. The internal piece of a geometry satisfying the other four axioms is more than a point: Theorem~\ref{thm:dim} shows that it has dimension at least eight. In every such geometry, therefore, a point of $M$ is not determined by its shadow. This is the second half of the sentence, and it is a consequence and not a further assumption. The axiom does not say that the whole can be recovered from the shadow. \rigD
\end{remark}

The fifth axiom is what the other four stand on. Closure will be asked of each of the three pieces; the growth law will be a tie between pieces; the order axiom will speak of operations on $F$; and the drive will be a flow on $T$ together with $F$. None of these can be stated for a shape that has not first been divided into pieces, and in this paper it is the fifth axiom that makes the division, into what is seen and what is not. It also constrains the shape: its second and third clauses fix the twist of the internal fibre (Section~\ref{sec:base}).
"""
sub(OLD_21, NEW_21, "section 2.1 becomes the formalisation of A5")

sub("we ask for more, a loop that is topologically stuck, and that is the first of the four choices this section records.",
    "we ask for more, a loop that is topologically stuck, and that is the third of the six choices.", "l.133 choice count")
sub("Clause~(i) is the second of the four choices:", "Clause~(i) is the fourth of the six choices:", "l.145 choice count")
sub("and these are the third and fourth choices.", "and these are the fifth and sixth choices.", "l.163 choice count")
sub("That is the fourth choice, and it is what produces", "That is the sixth choice, and it is what produces", "l.175 choice count")
sub("The four sentences have been turned into four conditions, and in doing so four choices were made and numbered: that self-reference means",
    "The five sentences have been turned into five conditions, and in doing so six choices were made and numbered: that what is seen is the image of the whole under the projection onto time and space (Definition~\\ref{def:A5}(i)); that an object is a state of the internal piece at rest, and its shadow what is left of it when the internal piece is forgotten (Definition~\\ref{def:A5}(ii),~(iii)); that self-reference means",
    "l.191 the choices listed")
sub("Nothing in the four conditions mentions", "Nothing in the five conditions mentions", "l.191 conditions")
sub("the size of one piece depends on where one is in another, the way the circles of latitude on a globe shrink toward the poles.",
    "the size of one piece depends on where one is in another, the way the circles of latitude on a globe shrink towards the poles.", "l.139 lint: towards")

# ---- sections 3 to 9: the count of axioms only -------------------------------------------
sub("A \\emph{modulus} of a geometry satisfying A1--A4 is", "A \\emph{modulus} of a geometry satisfying A1--A5 is", "l.196")
sub("Among geometries satisfying A1--A4, $M$ is \\emph{minimal}", "Among geometries satisfying A1--A5, $M$ is \\emph{minimal}", "l.200")
sub("Under Definition~\\ref{def:levels} a geometry satisfying A1--A4 has dimension",
    "Under Definition~\\ref{def:levels} a geometry satisfying A1--A5 has dimension", "l.369")
sub("Its hypotheses are the four axioms, the four readings of Section~\\ref{sec:axioms},",
    "Its hypotheses are the five axioms, the six readings of Section~\\ref{sec:axioms},", "l.488")
sub("satisfying A1--A4 under the readings of Definitions~\\ref{def:A1}, \\ref{def:A2}(i), \\ref{def:levels} and~\\ref{def:orbits},",
    "satisfying A1--A5 under the readings of Definitions~\\ref{def:A5}, \\ref{def:A1}, \\ref{def:A2}(i), \\ref{def:levels} and~\\ref{def:orbits},", "l.491")
sub("A4 with criterion~(2) gives the drive (Theorem~\\ref{thm:drive}).",
    "A5 gives the family $(T\\times\\Sigma)\\times F$ in which the other four axioms are stated (Definition~\\ref{def:A5}) and, through its clauses (ii) and~(iii), the twist of the fibre and the corner signs (Proposition~\\ref{prop:twist}, Corollary~\\ref{cor:lift}). A4 with criterion~(2) gives the drive (Theorem~\\ref{thm:drive}).",
    "l.499 proof: what A5 gives")
sub("The deflationary reading. The theorem asserts uniqueness among minimal realisations under the stated readings;",
    "The deflationary reading. The fifth axiom enters the theorem twice: as the division of the shape into the part that is seen and the part that is not, and, through its two further clauses, as the twist of the fibre. The second rests on a reading, that an object is a state of the internal piece at rest and that its shadow is what is left when the internal piece is forgotten. A reader who does not take that reading keeps the division and loses Proposition~\\ref{prop:twist} and Corollaries~\\ref{cor:lift} and~\\ref{cor:timecircle}. The theorem asserts uniqueness among minimal realisations under the stated readings;",
    "deflationary reading: the role of A5")
sub("is now a theorem of four behavioural axioms and a minimality principle,",
    "is now a theorem of five axioms and a minimality principle,", "l.560")
sub("with its coupling to the coherence field, from the same four axioms on the geometry derived here;",
    "with its coupling to the Coherent Field, from the same axioms on the geometry derived here;", "l.562")

# ======================= SECOND PASS (P28 time circle; P29 Prop 8.2 leaves M1) ===========
sub(r"\date{10 November 2026 (v4, working draft)}", r"\date{10 November 2026 (v4.3, working draft)}", "date v4.1")

# ---- the step; criterion (2) applied to the step (Minimality M1-7) ------------------------
sub("(2) dynamical: the drive of $M$ has the least positive topological entropy;",
    "(2) dynamical: one step of the drive of $M$ (Section~\\ref{sec:drive}) has the least positive topological entropy;",
    "Def 3.2: criterion (2) per step")
sub("The drive of A4 acts on $\\Ttwo$ by its return map, an element $M\\in\\mathrm{SL}_{2}(\\Z)$ with trace $t$.",
    "The drive of A4 acts on $\\Ttwo$ by its return map, an element $M\\in\\mathrm{SL}_{2}(\\Z)$ with trace $t$. One application of this map is a \\emph{step} of the drive. Whether one circuit of the time circle is one step or several is not assumed in this section; Corollary~\\ref{cor:timecircle} settles it.",
    "l.209: the step")
sub("Criterion~(2) of Definition~\\ref{def:minimal} selects the least entropy, hence",
    "Criterion~(2) of Definition~\\ref{def:minimal}, which is applied to the step, selects the least entropy, hence", "l.221")
sub("is the Sol torus bundle $S^{1}_{\\Sol}$ with this monodromy. \\rigR",
    "is the Sol torus bundle $S^{1}_{\\Sol}$ with this map as its step. \\rigR", "Thm 4.2: step, not monodromy")

sub("The time factor is the Sol torus bundle whose monodromy is the square of the Fibonacci matrix, so that the golden ratio is its growth rate;",
    "The time factor is the Sol torus bundle whose drive is, at each step, the square of the Fibonacci matrix, so that the golden ratio is its growth rate, and whose time circle is three steps;",
    "abstract: step and time circle")

# ---- the sign of the lift left open (LIFT_SIGN.md) ----------------------------------------
sub("$\\Ad_{w}$ cycles $i\\to j\\to k\\to i$ and $w^{3}=-1$. This is the algebraic image",
    "$\\Ad_{w}$ cycles $i\\to j\\to k\\to i$ and $w^{3}=-1$. The automorphism $\\Ad_{w}$ is the same for $w$ and for $-w$, and $(-w)^{3}=+1$; the text uses only the automorphism, and which of the two elements the drive is is left open. The one place at which it bears on this paper is the number of steps in the time circle (Corollary~\\ref{cor:timecircle}). This is the algebraic image",
    "l.346: the sign of the lift, open point stated")

# ---- the aspect ratio is not fixed in M1 ---------------------------------------------------



# ---- Cor 7.4 restated; the time circle (P28) -----------------------------------------------
OLD_COR = r"""\begin{corollary}[the corner lift]\label{cor:lift}
With $c_{1}(L)$ odd the lift of $\iota$ to the spinor bundle acts at the corner $C_{m,n}=(\tfrac m2,\tfrac n2)$ by the sign $(-1)^{mn}$: three corners carry $+1$ and one carries $-1$, with product $-1$, the Atiyah--Bott fixed-point index $(-1)^{d}$ for odd determinant class \cite{AtiyahBott}. For even $L$ the product would be $+1$. \rigR
\end{corollary}

\begin{proof}
The eight functions $(\Z_{2})^{2}\to\Z_{2}$ vanishing at the origin split into the four characters, with product $+1$, and the four quadratic refinements of the intersection pairing, with product $-1$; the Atiyah--Bott input selects the refinement class for odd $d$. The sign table is \texttt{L4\_four\_corner\_product}.
\end{proof}
"""
NEW_COR = r"""\subsection{The twist of the fibre}\label{sec:twist}

Proposition~\ref{prop:spinc} fixes the determinant line on $\CPtwo$ and says nothing of the fibre. The second cohomology of $\CPtwo\times\Stwo\times\Ttwo$ is one integer for each factor, with no mixed term, because the first cohomology of $\CPtwo\times\Stwo$ vanishes \cite{Hatcher}. The determinant line of a $\Spinc$ structure therefore carries three independent integers, odd on $\CPtwo$ and even on the other two, and the canonical structure has zero on the torus. A twist of the fibre by a line of degree $d$ on the torus multiplies the determinant line by the square of that line, so that the integer on the torus becomes $2d$. Whether the fibre is twisted, and by how much, is decided by the fifth axiom.

Let $E$ be the covering torus of the pillowcase with a complex structure for which the fold is $\iota(z)=-z$, and let $P_{1},\dots,P_{4}$ be the four corners. The counts below do not depend on which such complex structure is taken.

\begin{definition}[flux and states]\label{def:states}
A \emph{twist of the fibre} of \emph{flux} $d\geq1$ is the line $\mathcal{O}(D)$ on $E$ of a divisor $D=\sum a_{i}P_{i}$ on the corners, with $a_{i}\geq0$ and $\sum a_{i}=d$. A twist of flux zero is a flat line with holonomy $\pm1$: the trivial one, or one of the three \emph{half-turn twists}.

A \emph{state of the fibre at rest} is a holomorphic section of the twist: for $d\geq1$, a function $f$ on $E$ whose poles are bounded by $D$. The fold acts on states by $f(z)\mapsto f(-z)$ or by $f(z)\mapsto-f(-z)$, its two lifts, called here the first and the second. A \emph{state on the pillowcase}, for a given lift, is a state that the lift leaves unchanged. Which lift is called the first depends on the divisor chosen for a line, and the statements below speak of one lift or the other.

The \emph{corner sign} of the twist at $P_{i}$ is $(-1)^{a_{i}}$, the action of the first lift on the fibre of $\mathcal{O}(D)$ there. The four signs are taken up to one overall sign. A corner is \emph{odd} if its sign differs from that of the other three.

The \emph{structure} of a twist is its flux together with its corner signs up to the overall sign or, for flux zero, its holonomy. It is this that clause~(ii) of Definition~\ref{def:A5} speaks of. The drive is not a holomorphic map of $E$; it acts on structures through its action on the corners.

Two states of the fibre at rest have the same shadow: they differ only in the internal piece. This is the reading of Definition~\ref{def:A5}(iii).
\end{definition}

For the canonical $\Spinc$ structure the states at rest are the harmonic spinors of the fibre. We use this as motivation for the definition of a state, and the counts below do not depend on it. One fact about spinors is used, in Corollary~\ref{cor:lift}: on the untwisted spinors of the fibre, the functions and the $(0,1)$-forms on $E$, the fold acts by $+1$ and by $-1$ at every corner alike, since $\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$. The corner signs of the spinors, up to the overall sign, are therefore those of the twist.

\begin{lemma}[states, the fold and the drive]\label{lem:states}
Let $D$ be a divisor of degree $d\geq1$ on the corners. (a) There are exactly $d$ linearly independent states. (b) Under the first lift the number of states on the pillowcase is $1+\sum_{i}\lfloor a_{i}/2\rfloor$; under the second it is $d$ less that number. (c) The corner signs are carried to themselves by one step of the drive if and only if the four are alike or the odd one is at $P_{1}$; otherwise they return after three steps and not before. (d) A half-turn twist has no state at rest, and the drive carries the three half-turn twists round a cycle of three. \rigR
\end{lemma}

\begin{proof}
(b) An even elliptic function is a rational function of the Weierstrass function $\wp$ \cite{WhittakerWatson}, that is, a function on the quotient sphere $E/\iota$, and its order at a corner is twice its order at the image point. An even state is therefore a function on the sphere with a pole of order at most $\lfloor a_{i}/2\rfloor$ at the image of $P_{i}$. Such functions form a space of dimension $1+\sum_{i}\lfloor a_{i}/2\rfloor$, by partial fractions.

(a) The first lift is an involution of the states, so every state is the sum of an even state and an odd one; the second lift keeps the odd ones. An odd state is $\wp'$ times an even function $g$, and $\wp'$ has a triple pole at $P_{1}$ and a simple zero at each of $P_{2},P_{3},P_{4}$ \cite{WhittakerWatson}. So $g$ is a function on the sphere with a pole of order at most $\lceil a_{i}/2\rceil$ at the image of $P_{i}$ for $i=2,3,4$, and of order at most $\lceil a_{1}/2\rceil-2$ at the image of $P_{1}$, a negative bound meaning a zero of at least that order. Such functions form a space of dimension $\sum_{i}\lceil a_{i}/2\rceil-1$. The two dimensions add up to $\sum_{i}a_{i}=d$.

(c) The drive fixes $P_{1}$ and cycles $P_{2}\to P_{3}\to P_{4}$ (Proposition~\ref{prop:threecycle}). A pattern with all four signs alike, or with the odd sign at $P_{1}$, is unchanged. A pattern with one odd sign at a cycled corner, or with two signs of each kind, is moved, and returns when the corners do (\texttt{L6\_fixed\_patterns}, \texttt{L6\_return\_three}).

(d) A section of a line of degree zero has no zeros, so it trivialises the line; a half-turn twist is not trivial, its holonomy being $-1$ on some loop, so it has no section. The three half-turn twists are the three non-trivial characters of the lattice modulo two, which the drive permutes as it permutes the three cycled corners.
\end{proof}

\begin{proposition}[the twist of the fibre]\label{prop:twist}
Let the fibre satisfy clauses (ii) and~(iii) of Definition~\ref{def:A5}, the states of clause~(iii) being states on the pillowcase for one of the two lifts of the fold, and let the flux be the least that does so. Then the flux is three. The corner signs are three alike and one odd, and the odd corner is one of the three that the drive cycles. For that lift the fibre has two states on the pillowcase, and the fold removes a third.

Taken singly, clause~(ii) is met with least flux by a half-turn twist of flux zero, for which the fibre has no state at rest; and clause~(iii) is met with least flux by flux two with the four corner signs alike, a structure the drive leaves in place. \rigD
\end{proposition}

\begin{proof}
Flux zero. The trivial line is carried to itself by the drive and fails clause~(ii). A half-turn twist meets clause~(ii) and has no state (Lemma~\ref{lem:states}(d)), so it fails clause~(iii).

Flux one. There is one state (Lemma~\ref{lem:states}(a)). Clause~(iii) fails (\texttt{L6\_flux\_one}).

Flux two. For $D=2P_{i}$ the first lift keeps two states and the corner signs are alike. For $D=P_{i}+P_{j}$ with $i\neq j$ each lift keeps one state (Lemma~\ref{lem:states}(b)). Clause~(iii) therefore forces $D=2P_{i}$, whose structure, with the four corner signs alike, the drive leaves in place (Lemma~\ref{lem:states}(c)). Clause~(ii) fails (\texttt{L6\_flux\_two}).

Flux three. For $D=3P_{i}$ and for $D=2P_{i}+P_{j}$ the first lift keeps two states and removes one; for $D=P_{i}+P_{j}+P_{k}$ the second lift does. Clause~(iii) holds in every case. The corner signs have one odd corner: $P_{i}$, $P_{j}$ and the fourth corner respectively. Clause~(ii) holds exactly when the odd corner is not $P_{1}$ (Lemma~\ref{lem:states}(c)). The case analysis is certified, taking the count of Lemma~\ref{lem:states}(b) as given (\texttt{L6\_flux\_three\_states}, \texttt{L6\_flux\_three\_one\_odd}, \texttt{L6\_flux\_three\_cycled}, \texttt{L6\_least\_flux}).

The single clauses are the cases of flux zero and flux two above.
\end{proof}

\emph{The smallest case, by hand.} Take $D=3P_{4}$, and write $\wp$ for the Weierstrass function of $E$ and $e_{4}=\wp(P_{4})$. The three states are $1$, $1/(\wp-e_{4})$ and $\wp'/(\wp-e_{4})^{2}$. The first two are even and the third is odd. The corner signs are $(+,+,+,-)$ (\texttt{L6\_smallest\_case}).

Three remarks. That the least flux is taken is a minimal choice, of the same character as criterion~(1). The twisting line that criterion~(1) removes in Proposition~\ref{prop:spinc} is a line on $\CPtwo$ that nothing forces; the twist of the fibre is forced by the fifth axiom. And the flux three found here and the three of $c_{1}(\CPtwo)$ are the same integer, but this paper does not derive one from the other.

\begin{corollary}[the corner lift]\label{cor:lift}
With the twist of Proposition~\ref{prop:twist} the lift of $\iota$ to the spinors of the fibre acts at the four corners by signs whose product is $-1$: one corner carries the sign opposite to that of the other three, and it is one of the three corners cycled by the drive. Naming the corners so that it is $P_{4}$, the sign at $C_{m,n}=(\tfrac m2,\tfrac n2)$ is $(-1)^{mn}$, up to one overall sign. For an even flux the product would be $+1$. \rigD
\end{corollary}

\begin{proof}
The product of the corner signs of $\mathcal{O}(D)$ is $\prod_{i}(-1)^{a_{i}}=(-1)^{d}$ (\texttt{L6\_corner\_product}), and the untwisted spinors contribute the same sign at every corner. The rest is Proposition~\ref{prop:twist}.

The eight functions $(\Z_{2})^{2}\to\Z_{2}$ vanishing at the origin split into the four characters, with product $+1$, and the four quadratic refinements of the intersection pairing, with product $-1$. An even flux gives a character and an odd flux a refinement. The sign table is \texttt{L4\_four\_corner\_product}.
\end{proof}

That the odd corner is a cycled one is clause~(ii) of the fifth axiom at work. With the odd corner at $P_{1}$ the drive would leave the structure in place, and one thing would have one shadow.

Among the three cycled corners there is nothing further to choose. The three patterns are one pattern at three successive steps, and to name one of them is to say which step is called the first. The pattern $(-1)^{mn}$ is the one of the three that the quarter-turn $S$, as written in Theorem~\ref{thm:drive}, leaves in place: $S$ fixes $P_{1}$ and $P_{4}$ and exchanges $P_{2}$ and $P_{3}$. The quarter-turns $M_{0}SM_{0}^{-1}$ and $M_{0}^{-1}SM_{0}$ leave the other two patterns in place in the same way, which is the same statement: nothing distinguishes the three but the step at which one starts.

\begin{corollary}[the time circle]\label{cor:timecircle}
With the corner signs of Corollary~\ref{cor:lift}, the signs are carried to themselves by $n$ steps of the drive if and only if three divides $n$. The lifted fold being one structure on the whole geometry, the time circle $T$ is a whole number of steps divisible by three. We take the least, three, the corner signs being counted up to one overall sign. Once round $T$ the fibre is then glued to itself by $M_{0}^{3}=\bigl(\begin{smallmatrix}13&8\\8&5\end{smallmatrix}\bigr)$, of trace eighteen, which leaves every corner in place. \rigD
\end{corollary}

\begin{proof}
One step moves the odd corner from $P_{4}$ to $P_{2}$, a second from $P_{2}$ to $P_{3}$, a third from $P_{3}$ to $P_{4}$ (Proposition~\ref{prop:threecycle}). The reduction of $M_{0}$ modulo two has order three (\texttt{L1\_M0\_mod2\_order3}), so the pattern returns after three steps and not before.

Time is a circle (Definition~\ref{def:A1}), and the time factor is the torus bundle whose step is $M_{0}$ (Theorem~\ref{thm:drive}): once round $T$ the fibre is glued to itself by a power of the drive, the number of steps in $T$. A structure defined on the whole geometry, carried once round the time circle, returns to itself; that the lifted fold is such a structure is the hypothesis of the statement. The number of steps in $T$ is therefore a multiple of three.

$M_{0}^{3}=F^{6}$ has the entries $(13,8,8,5)$ (\texttt{L1\_Fib\_powers}) and is the identity modulo two.

What is forced is divisibility by three. That the least multiple is taken is a minimal choice of the same character as the last clause of criterion~(4). It supposes that the corner signs are counted up to one overall sign, as in Corollary~\ref{cor:lift}. If the overall sign of the lift is counted as well, the open point of Section~\ref{sec:fibre-worked} enters: with the drive lifted as $w$, three steps return the pattern with the overall sign reversed, since $w^{3}=-1$, and six steps would be needed; with $-w$ three suffice.
\end{proof}

Two things follow. First, the numbers attached to the drive in Section~\ref{sec:drive} are numbers per step: the stretch is $\phi^{2}$ and the entropy $2\log\phi$ per step, and they are $\phi^{6}$ and $6\log\phi$ once round the time circle.

Second, criterion~(2) is applied to the step and not to the map once round the time circle. The map once round is a power of the step and is not chosen separately. That the criterion is applied to the step is a choice of what the criterion is applied to, and is recorded as such.
"""
sub(OLD_COR, NEW_COR, "new section 7.4 (the twist of the fibre: Def, Lemma, Prop); Cor 7.4 now rests on it; Cor (the time circle)")

sub("and it is the odd determinant class that puts the lift in the refinement class.",
    "and it is the odd flux of the fibre that puts the lift in the refinement class (Proposition~\\ref{prop:twist}).", "worked case: the eight corner functions")

# ---- Theorem 8.1 ---------------------------------------------------------------------------
sub("the minimality principle of Section~\\ref{sec:minimal}, and one declared input;",
    "the minimality principle of Section~\\ref{sec:minimal}, one declared input and one declared assumption;", "l.488 hypotheses")
sub("with the overall scale stabilised by a declared sector, the minimal geometry",
    "with the overall scale stabilised by a declared sector and the stationarity conditions of Proposition~\\ref{prop:moduli} assumed, the minimal geometry", "Thm 8.1: the declared assumption named")
sub("with monodromy $\\bigl(\\begin{smallmatrix}2&1\\\\1&1\\end{smallmatrix}\\bigr)$, determinant line",
    "with step $\\bigl(\\begin{smallmatrix}2&1\\\\1&1\\end{smallmatrix}\\bigr)$ and a time circle of three steps, flux three on the fibre with one odd corner (Proposition~\\ref{prop:twist}), determinant line", "Thm 8.1 statement: step and time circle")
sub("The moduli are treated in Proposition~\\ref{prop:moduli}.",
    "Corollaries~\\ref{cor:lift} and~\\ref{cor:timecircle} give the time circle. The moduli are treated in Proposition~\\ref{prop:moduli}.", "Thm 8.1 proof")


# ---- Section 8.3: Proposition 8.2 stays (PI, 10 Nov 2026); its stationarity conditions are the declared assumption
sub("The stationarity conditions themselves are the Euler--Lagrange equations of the energy and enter as hypotheses here; their derivation belongs to the sequel.",
    "The stationarity conditions themselves are the Euler--Lagrange equations of the energy. They are not derived in this paper: they enter as a declared assumption, the one named in Theorem~\\ref{thm:main}. The assumption would be shown false by a derivation of the Euler--Lagrange equations of the energy functional that gives different conditions, or conditions that leave the aspect ratio free; the selection made in this paper would then have to be revisited at criterion~(1).",
    "Prop 8.2 proof: the stationarity conditions as the declared assumption, with its failure test")
sub("the corner lift has product $-1$ (Corollary~\\ref{cor:lift}); the aspect ratio",
    "the corner lift has product $-1$ (Corollary~\\ref{cor:lift}); the time circle is three steps of the drive (Corollary~\\ref{cor:timecircle}); the aspect ratio", "l.560: the time circle")

# ---- appendices ----------------------------------------------------------------------------
sub("Five files, Lean 4.15.0, core library only, no Mathlib, no author axioms, zero \\texttt{sorry}; forty-nine theorems.",
    "Six files, Lean 4.15.0, core library only, no Mathlib, no author axioms, zero \\texttt{sorry}; sixty-one theorems.", "appendix count")
sub("and $F\\notin\\mathrm{SL}_{2}(\\Z)$.\n", "and $F\\notin\\mathrm{SL}_{2}(\\Z)$; $\\det(M_{0}-I)=-1$ (not used in the text).\n", "appendix L1 description")



sub("these are different structures and distinguish different corners, and the drive permutes the lift's sectors.",
    "these are different structures and distinguish different corners. The drive carries the lift's odd corner $P_{4}\\to P_{2}\\to P_{3}\\to P_{4}$, so that the sign pattern returns after three steps and the time circle is three steps (Corollary~\\ref{cor:timecircle}); the dictionary gives the pattern at the step called the first.",
    "Appendix B l.602")

sub("specialisation at $(3,6)$ to $6u^{3}+u^{2}-72u-4=0$.\n\n",
    "specialisation at $(3,6)$ to $6u^{3}+u^{2}-72u-4=0$.\n\n\\texttt{M1\\_L6\\_twist.lean} (Section~\\ref{sec:twist}): for the thirty-five divisors of flux at most three on the four corners, with the count of states of Lemma~\\ref{lem:states}(b) taken as given: the product of the corner signs is $(-1)^{d}$; the patterns the drive leaves in place; flux one fails clause~(iii); flux two cannot meet both clauses; flux three meets clause~(iii) always, has one odd corner, and meets clause~(ii) exactly when that corner is not $P_{1}$; the least flux meeting both is three; the case $D=3P_{4}$.\n\n", "appendix: L6 description")
sub("The five files follow verbatim.", "The six files follow verbatim.", "appendix: six files")
sub("\\lstinputlisting{M1_lean/M1_L5_vacuum.lean}\n", "\\lstinputlisting{M1_lean/M1_L5_vacuum.lean}\n\n\\subsection*{\\texttt{M1\\_L6\\_twist.lean} --- the twist of the fibre}\n\\lstinputlisting{M1_lean/M1_L6_twist.lean}\n", "appendix: L6 listing")
sub("\\bibitem{Witten1981}", "\\bibitem{WhittakerWatson} E.~T. Whittaker and G.~N. Watson, \\emph{A Course of Modern Analysis}, 3rd ed., Cambridge University Press, 1920, \\S\\S20.21, 20.32, 20.51.\n\\bibitem{Witten1981}", "bibliography: Whittaker and Watson")
# abstract and outlook
sub("and the geometry carries a $\\Spinc$ structure with determinant line $\\Oline{3}$.",
    "and the geometry carries a $\\Spinc$ structure with determinant line $\\Oline{3}$. The fifth axiom fixes the twist of the internal fibre: three units of flux and one odd corner.", "abstract: the twist of the fibre")
sub("the determinant line is odd and the corner lift has product $-1$ (Corollary~\\ref{cor:lift});",
    "the determinant line is odd; the fibre carries three units of flux, with two states on the pillowcase and one removed by the fold (Proposition~\\ref{prop:twist}); the corner lift has product $-1$ (Corollary~\\ref{cor:lift});", "outlook: the twist of the fibre")

# ---- abstract rewritten to stay within 200 words (CLAUDE.md section 9), same content plus the twist of the fibre
_a = t.index("\\begin{abstract}") + len("\\begin{abstract}"); _b = t.index("\\end{abstract}")
t = t[:_a] + "\n" + r"""A unified theory must explain what is observed. We begin from five characteristics of the universe that need no instrument to recognise: it is aware of itself and closes on itself; it grows and decays; the order of its events matters; it never stands still; and what is seen of it is less than what is there. Taken as axioms on a compact Riemannian geometry $(T\times\Sigma)\times F$, each behavioural word given its meaning in a numbered definition, and with a lexicographic notion of minimality, they force a unique geometry. The time factor is the Sol torus bundle whose step is the square of the Fibonacci matrix, and a three-step time circle; the internal fibre is the pillowcase orbifold, its four cone points carrying the subalgebras $\R,\C_i,\C_j,\C_k$ of the quaternions; the dimension is twelve; the base is $\CPtwo\times\Stwo$, with $\Spinc$ determinant line $\Oline{3}$. The fifth axiom fixes the twist of the fibre: three units of flux and one odd corner. The constants $\pi$, $e$, $\phi$ and the primes two, three and five are outputs. Witten's minimal gauge manifold is recovered as a corollary. The principal consequence is that the twelve-dimensional manifold of the programme is derived rather than postulated.""" + "\n" + t[_b:]; log.append("abstract: within 200 words, with the twist of the fibre")

# ---- typesetting (PI, 10 Nov 2026): line spacing above 1.1 throughout; listings unchanged ---
sub("\\usepackage[hidelinks]{hyperref}\n", "\\usepackage[hidelinks]{hyperref}\n\\linespread{1.2}\n\\setlength{\\parskip}{3pt plus 1pt}\n", "line spacing 1.2, small paragraph skip")
sub("\\lstset{basicstyle=\\ttfamily\\footnotesize,", "\\lstset{basicstyle=\\linespread{1}\\ttfamily\\footnotesize,", "listings keep single spacing")

# ---- template ---------------------------------------------------------------------------
sub("frame=single,framesep=4pt,xleftmargin=2pt,extendedchars=true}",
    "frame=single,framesep=4pt,xleftmargin=5pt,xrightmargin=5pt,extendedchars=true}", "listing frames inside the text block (P15(b))")
# ---- typesetting (PI, 10 Nov 2026, second request): each step of a proof or worked case on its own line ---
# In Sections 4 to 8, inside proofs and worked-case paragraphs, start a new line at each sentence end
# (a full stop followed by a space and a capital letter, "$" or "\"), never inside mathematics.
import re
def split_sentences(block):
    out, depth, i, n = [], 0, 0, len(block)
    math = False
    while i < n:
        c = block[i]
        if c == "\\" and i + 1 < n:                      # skip escaped characters and \[ \]
            if block[i+1] in "[(": math = True
            if block[i+1] in "])": math = False
            out.append(block[i:i+2]); i += 2; continue
        if c == "$": math = not math
        if (c == "." and not math and i + 2 < n and block[i+1] == " "
                and (block[i+2].isupper() or block[i+2] in "$\\")
                and not block[max(0, i-4):i].endswith(("Prop", "Thm", "resp", " cf", "i.e", "e.g"))):
            out.append(".\n\n"); i += 2; continue
        out.append(c); i += 1
    return "".join(out)
a = t.index("\\section{The drive}"); b = t.index("\\section{Applications and outlook}")
body = t[a:b]
nsplit = [0]
def do_proof(m):
    new = split_sentences(m.group(2)); nsplit[0] += new.count(".\n\n") - m.group(2).count(".\n\n")
    return m.group(1) + new + m.group(3)
body = re.sub(r"(\\begin\{proof\}\n)(.*?)(\n\\end\{proof\})", do_proof, body, flags=re.S)
def do_case(m):
    new = split_sentences(m.group(0)); nsplit[0] += new.count(".\n\n") - m.group(0).count(".\n\n")
    return new
body = re.sub(r"(?m)^\\emph\{[^}]*\.\} .*$", do_case, body)       # worked cases: paragraphs opening with \emph{Title.}
t = t[:a] + body + t[b:]
sub("\\linespread{1.2}\n", "\\linespread{1.2}\n\\setlength{\\emergencystretch}{4em}\n\\usepackage{etoolbox}\n\\AtBeginEnvironment{proof}{\\setlength{\\parindent}{0pt}\\setlength{\\parskip}{5pt plus 1pt}}\n", "proof steps set flush left with space between them")
log.append(f"line breaks: {nsplit[0]} new lines at sentence ends in the proofs and worked cases of Sections 4 to 8")

open(sys.argv[2], "w", encoding="utf-8").write(t)
print(len(log), "edits:"); print("; ".join(log))
