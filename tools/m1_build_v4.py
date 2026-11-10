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
    "% Paper M1 — Five axioms and their minimal geometry\n% Base paper of the Master Equation Framework series.  v4 WORKING DRAFT, 10 Nov 2026\n% (the fifth axiom integrated; Decision Log P19, P23, P31, P32).  Not canon.",
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
    "A thing and its shadow are not the same. A shadow on the ground tells a good deal about what casts it, but not everything: the shadow is flat and the thing is not, and two quite different things can cast the same shadow. What is seen of the world is of this kind. There is more to the world than the part of it that is seen, and what is seen does not by itself say what it is the shadow of.\n",
    "fifth observation")
sub(r"\subsection{The four axioms}\label{sec:fouraxioms}", r"\subsection{The five axioms}\label{sec:fouraxioms}", "subsection title")
sub("We take these four observations as axioms", "We take these five observations as axioms", "l.68")
sub("The universe is in constant change; it never stands still.\n\\end{axiom}\n",
    "The universe is in constant change; it never stands still.\n\\end{axiom}\n\n"
    "\\begin{axiom}[shadow]\\label{ax:A5}\nWe can see the shadow, but the shadow is missing information about what it is a shadow of.\n\\end{axiom}\n",
    "Axiom 5")
sub("drive carries the weather and the mountains. That no cycle repeats exactly is not a fifth axiom but a consequence of the first and the fourth together, as Section~\\ref{sec:drive} shows.",
    "drive carries the weather and the mountains; shadow carries the thing and what is seen of it. That no cycle repeats exactly is not a further axiom but a consequence of the first and the fourth together, as Section~\\ref{sec:drive} shows. The fifth axiom differs in kind from the other four. They say how the universe behaves; it says that the universe has a part that is seen and a part that is not, and it is in those terms that the other four are made precise.",
    "l.86")
sub("The result is that the four axioms, together with", "The result is that the five axioms, together with", "l.102")
sub("turns the four sentences into mathematics, at a level intended to be followed by a first-year mathematics graduate, and isolates as numbered definitions the four points at which",
    "turns the five sentences into mathematics, at a level intended to be followed by a first-year mathematics graduate, and isolates as numbered definitions the five points at which", "l.109")

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

The sentence is: \emph{we can see the shadow, but the shadow is missing information about what it is a shadow of}.

For a shape the sentence says two things. First, there is more to the shape than the part along which we see: besides time and space it has a part that is not directly seen. Second, what is seen is what is left of the whole when that part is forgotten, the way the shadow of a solid thing on the ground is what is left of it when its height is forgotten.

A \emph{geometry} here is a smooth shape, of some number of dimensions, on which lengths and angles can be measured, and which is allowed to have a few isolated sharp points (cone points, like the tip of a paper cone).

\begin{definition}[shadow, formal]\label{def:A5}
A geometry satisfies A5 if it is a product of three pieces,
\begin{equation}\label{eq:family}
M \;=\; (T \times \Sigma) \times F ,
\end{equation}
where $T$ is a one-dimensional piece carrying time, $\Sigma$ is a piece carrying space, and $F$ is an internal piece, and what is seen is the image of $M$ under the projection
\[
\pi\colon M\to T\times\Sigma,\qquad \pi(t,x,f)=(t,x),
\]
that forgets $F$. The image under $\pi$ of a point or of a subset of $M$ is its \emph{shadow}.
\end{definition}

A product of pieces means, as for a rectangle made of two intervals, that a point of $M$ is a point of each piece at once. Writing $M$ this way is only a way of naming the pieces: the way lengths are measured may tie the pieces together, and the second axiom will insist that it does. That the part along which we see is time and space, and that seeing is the projection $\pi$, is the first of the five choices this section records.

\begin{remark}[what the shadow loses]\label{rem:loss}
The projection $\pi$ is onto, and it is one-to-one only if $F$ is a single point: if $f\neq f'$ are two points of $F$, then $(t,x,f)$ and $(t,x,f')$ are different points of $M$ with the same shadow $(t,x)$. The internal piece of a geometry satisfying the other four axioms is more than a point: Theorem~\ref{thm:dim} shows that it has dimension at least eight. In every such geometry, therefore, a point of $M$ is not determined by its shadow. This is the second half of the sentence, and it is a consequence and not a further assumption. The axiom does not say that the whole can be recovered from the shadow. \rigD
\end{remark}

The fifth axiom is what the other four stand on. Closure will be asked of each of the three pieces; the growth law will be a tie between pieces; the order axiom will speak of operations on $F$; and the drive will be a flow on $T$ together with $F$. None of these can be stated for a shape that has not first been divided into pieces, and in this paper it is the fifth axiom that makes the division, into what is seen and what is not.
"""
sub(OLD_21, NEW_21, "section 2.1 becomes the formalisation of A5")

sub("we ask for more, a loop that is topologically stuck, and that is the first of the four choices this section records.",
    "we ask for more, a loop that is topologically stuck, and that is the second of the five choices.", "l.133 choice count")
sub("Clause~(i) is the second of the four choices:", "Clause~(i) is the third of the five choices:", "l.145 choice count")
sub("and these are the third and fourth choices.", "and these are the fourth and fifth choices.", "l.163 choice count")
sub("That is the fourth choice, and it is what produces", "That is the fifth choice, and it is what produces", "l.175 choice count")
sub("The four sentences have been turned into four conditions, and in doing so four choices were made and numbered: that self-reference means",
    "The five sentences have been turned into five conditions, and in doing so five choices were made and numbered: that what is seen is the image of the whole under the projection onto time and space (Definition~\\ref{def:A5}); that self-reference means",
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
    "Its hypotheses are the five axioms, the five readings of Section~\\ref{sec:axioms},", "l.488")
sub("satisfying A1--A4 under the readings of Definitions~\\ref{def:A1}, \\ref{def:A2}(i), \\ref{def:levels} and~\\ref{def:orbits},",
    "satisfying A1--A5 under the readings of Definitions~\\ref{def:A5}, \\ref{def:A1}, \\ref{def:A2}(i), \\ref{def:levels} and~\\ref{def:orbits},", "l.491")
sub("A4 with criterion~(2) gives the drive (Theorem~\\ref{thm:drive}).",
    "A5 gives the family $(T\\times\\Sigma)\\times F$ in which the other four axioms are stated (Definition~\\ref{def:A5}); it selects nothing within the family. A4 with criterion~(2) gives the drive (Theorem~\\ref{thm:drive}).",
    "l.499 proof: what A5 gives")
sub("The deflationary reading. The theorem asserts uniqueness among minimal realisations under the stated readings;",
    "The deflationary reading. The fifth axiom enters the theorem once, as the division of the shape into the part that is seen and the part that is not; every selection within that division is made by the other four axioms and by minimality. The theorem asserts uniqueness among minimal realisations under the stated readings;",
    "deflationary reading: the role of A5")
sub("is now a theorem of four behavioural axioms and a minimality principle,",
    "is now a theorem of five axioms and a minimality principle,", "l.560")
sub("with its coupling to the coherence field, from the same four axioms on the geometry derived here;",
    "with its coupling to the Coherent Field, from the same axioms on the geometry derived here;", "l.562")

# ======================= SECOND PASS (P28 time circle; P29 Prop 8.2 leaves M1) ===========
sub(r"\date{10 November 2026 (v4, working draft)}", r"\date{10 November 2026 (v4.1, working draft)}", "date v4.1")

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
NEW_COR = r"""\begin{corollary}[the corner lift]\label{cor:lift}
With $c_{1}(L)$ odd the lift of $\iota$ to the spinor bundle acts at the four corners by signs whose product is $-1$, the Atiyah--Bott fixed-point index $(-1)^{d}$ for odd determinant class \cite{AtiyahBott}: one corner carries the sign opposite to that of the other three. For even $L$ the product would be $+1$. \rigR

Which corner is the odd one is not fixed by the index. We take it to be one of the three corners cycled by the drive, and name the corners so that the sign at $C_{m,n}=(\tfrac m2,\tfrac n2)$ is $(-1)^{mn}$: the odd corner is $P_{4}$. \rigD
\end{corollary}

\begin{proof}
The eight functions $(\Z_{2})^{2}\to\Z_{2}$ vanishing at the origin split into the four characters, with product $+1$, and the four quadratic refinements of the intersection pairing, with product $-1$; the Atiyah--Bott input selects the refinement class for odd $d$. The sign table is \texttt{L4\_four\_corner\_product}.

The class has four members, one for each corner as the odd one, the overall sign being a convention. The index does not choose among them.
\end{proof}

The second sentence of the corollary is a reading and not a computation, and it is not the option that minimality would take. The drive fixes $P_{1}$ and cycles the other three corners (Proposition~\ref{prop:threecycle}). It therefore leaves in place the pattern whose odd corner is $P_{1}$, and it carries each of the other three patterns to the next: the odd corner moves $P_{4}\to P_{2}\to P_{3}\to P_{4}$. The pattern with odd corner $P_{1}$ is the simpler structure, since the drive does nothing to it. We take a cycled corner, as a declared reading, and state it here as such.

Among the three cycled corners there is nothing further to choose. The three patterns are one pattern at three successive steps, and to name one of them is to say which step is called the first. The pattern $(-1)^{mn}$ is the one of the three that the quarter-turn $S$, as written in Theorem~\ref{thm:drive}, leaves in place: $S$ fixes $P_{1}$ and $P_{4}$ and exchanges $P_{2}$ and $P_{3}$. The quarter-turns $M_{0}SM_{0}^{-1}$ and $M_{0}^{-1}SM_{0}$ leave the other two patterns in place in the same way, which is the same statement: nothing distinguishes the three but the step at which one starts.

\begin{corollary}[the time circle]\label{cor:timecircle}
Under the reading of Corollary~\ref{cor:lift} the corner signs are carried to themselves by $n$ steps of the drive if and only if three divides $n$. The lifted fold being one structure on the whole geometry, the time circle $T$ is a whole number of steps divisible by three. We take the least, three. Once round $T$ the fibre is then carried to itself by $M_{0}^{3}=\bigl(\begin{smallmatrix}13&8\\8&5\end{smallmatrix}\bigr)$, of trace eighteen, which leaves every corner in place. \rigD
\end{corollary}

\begin{proof}
One step moves the odd corner from $P_{4}$ to $P_{2}$, a second from $P_{2}$ to $P_{3}$, a third from $P_{3}$ to $P_{4}$ (Proposition~\ref{prop:threecycle}). The reduction of $M_{0}$ modulo two has order three (\texttt{L1\_M0\_mod2\_order3}), so the pattern returns after three steps and not before.

A structure defined on the whole geometry, carried once round the time circle, returns to itself. The number of steps in $T$ is therefore a multiple of three.

$M_{0}^{3}=F^{6}$ has the entries $(13,8,8,5)$ (\texttt{L1\_Fib\_powers}) and is the identity modulo two.

What is forced is divisibility by three. That the least multiple is taken is a minimal choice of the same character as the last clause of criterion~(4). It supposes that the corner signs are counted up to one overall sign, as in Corollary~\ref{cor:lift}. If the overall sign of the lift is counted as well, the open point of Section~\ref{sec:fibre-worked} enters: with the drive lifted as $w$, three steps return the pattern with the overall sign reversed, since $w^{3}=-1$, and six steps would be needed; with $-w$ three suffice.
\end{proof}

Two things follow. First, the numbers attached to the drive in Section~\ref{sec:drive} are numbers per step: the stretch is $\phi^{2}$ and the entropy $2\log\phi$ per step, and they are $\phi^{6}$ and $6\log\phi$ once round the time circle.

Second, criterion~(2) is applied to the step and not to the map once round the time circle. The map once round is a power of the step and is not chosen separately. That the criterion is applied to the step is a choice of what the criterion is applied to, and is recorded as such.
"""
sub(OLD_COR, NEW_COR, "Cor 7.4 restated; Cor 7.5 (the time circle) and its two consequences")

# ---- Theorem 8.1 ---------------------------------------------------------------------------
sub("the minimality principle of Section~\\ref{sec:minimal}, and one declared input;",
    "the minimality principle of Section~\\ref{sec:minimal}, the reading of Corollary~\\ref{cor:lift}, one declared input and one declared assumption;", "l.488 hypotheses")
sub("with the overall scale stabilised by a declared sector, the minimal geometry",
    "with the overall scale stabilised by a declared sector and the stationarity conditions of Proposition~\\ref{prop:moduli} assumed, the minimal geometry", "Thm 8.1: the declared assumption named")
sub("with monodromy $\\bigl(\\begin{smallmatrix}2&1\\\\1&1\\end{smallmatrix}\\bigr)$, determinant line",
    "with step $\\bigl(\\begin{smallmatrix}2&1\\\\1&1\\end{smallmatrix}\\bigr)$ and a time circle of three steps under the reading of Corollary~\\ref{cor:lift}, determinant line", "Thm 8.1 statement: step and time circle")
sub("The moduli are treated in Proposition~\\ref{prop:moduli}.",
    "Corollaries~\\ref{cor:lift} and~\\ref{cor:timecircle} give the time circle. The moduli are treated in Proposition~\\ref{prop:moduli}.", "Thm 8.1 proof")


# ---- Section 8.3: Proposition 8.2 stays (PI, 10 Nov 2026); its stationarity conditions are the declared assumption
sub("The stationarity conditions themselves are the Euler--Lagrange equations of the energy and enter as hypotheses here; their derivation belongs to the sequel.",
    "The stationarity conditions themselves are the Euler--Lagrange equations of the energy. They are not derived in this paper: they enter as a declared assumption, the one named in Theorem~\\ref{thm:main}. The assumption would be shown false by a derivation of the Euler--Lagrange equations of the energy functional that gives different conditions, or conditions that leave the aspect ratio free; the selection made in this paper would then have to be revisited at criterion~(1).",
    "Prop 8.2 proof: the stationarity conditions as the declared assumption, with its failure test")
sub("the determinant line is odd and the corner lift has product $-1$ (Corollary~\\ref{cor:lift}); the aspect ratio",
    "the determinant line is odd and the corner lift has product $-1$ (Corollary~\\ref{cor:lift}); the time circle is three steps of the drive (Corollary~\\ref{cor:timecircle}); the aspect ratio", "l.560: the time circle")

# ---- appendices ----------------------------------------------------------------------------
sub("Five files, Lean 4.15.0, core library only, no Mathlib, no author axioms, zero \\texttt{sorry}; forty-nine theorems.",
    "Five files, Lean 4.15.0, core library only, no Mathlib, no author axioms, zero \\texttt{sorry}; fifty theorems.", "appendix count")
sub("and $F\\notin\\mathrm{SL}_{2}(\\Z)$.\n", "and $F\\notin\\mathrm{SL}_{2}(\\Z)$; $\\det(M_{0}-I)=-1$ (not used in the text).\n", "appendix L1 description")



sub("these are different structures and distinguish different corners, and the drive permutes the lift's sectors.",
    "these are different structures and distinguish different corners. The drive carries the lift's odd corner $P_{4}\\to P_{2}\\to P_{3}\\to P_{4}$, so that the sign pattern returns after three steps and the time circle is three steps (Corollary~\\ref{cor:timecircle}); the dictionary gives the pattern at the step called the first.",
    "Appendix B l.602")

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
