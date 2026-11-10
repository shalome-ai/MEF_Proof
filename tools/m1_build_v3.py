#!/usr/bin/env python3
"""Build papers/M1/Paper_M1_Five_Axioms_v3.tex from canon/M1/Paper_M1_Four_Axioms_v2.tex.
Usage: build_m1_v3.py <v2.tex> <v3.tex>.  Every edit must match exactly once."""
import sys
t = open(sys.argv[1], encoding="utf-8").read()
log = []
def sub(old, new, what):
    global t
    assert t.count(old) == 1, (t.count(old), what, old[:70])
    t = t.replace(old, new); log.append(what)

sub("% Paper M1 — Four axioms and their minimal geometry\n% Base paper of the Master Equation Framework series.  Draft v1, 7 Nov 2026.",
    "% Paper M1 — Five axioms and their minimal geometry\n% Base paper of the Master Equation Framework series.  v3 WORKING DRAFT, 10 Nov 2026\n% (the fifth axiom added; Decision Log P19, P23, P25, P26).  Not canon.",
    "header")
sub(r"\title{Four axioms and their minimal geometry}", r"\title{Five axioms and their minimal geometry}", "title")
sub(r"\date{8 November 2026 (v2.1)}", r"\date{10 November 2026 (v3, working draft)}", "date")
sub("We begin from four characteristics of the universe that need no instrument to recognise: it is aware of itself and closes on itself; it grows and decays; the order of its events matters; it never stands still.",
    "We begin from five characteristics of the universe that need no instrument to recognise: it is aware of itself and closes on itself; it grows and decays; the order of its events matters; it never stands still; and what is seen of it is less than what is there.",
    "abstract: five characteristics")
sub(r"\section{What is observed, and the four axioms}", r"\section{What is observed, and the five axioms}", "section 1 title")
sub("and from them we state four axioms. From the four axioms, and a principle",
    "and from them we state five axioms. From the five axioms, and a principle", "l.52")
sub("Four things are apparent to anyone.", "Five things are apparent to anyone.", "l.56")
sub("What has been done cannot be undone by doing it again in another order.\n",
    "What has been done cannot be undone by doing it again in another order.\n\n"
    "A thing and its shadow are not the same. A shadow on the ground tells a good deal about what casts it, but not everything: the shadow is flat and the thing is not, and the shadow does not say what the thing is made of. Two quite different things can cast the same shadow, and one thing casts very different shadows as the light moves round it. Whatever is seen is seen from somewhere, and it is less than what is there.\n",
    "fifth observation")
sub(r"\subsection{The four axioms}\label{sec:fouraxioms}", r"\subsection{The five axioms}\label{sec:fouraxioms}", "subsection title")
sub("We take these four observations as axioms", "We take these five observations as axioms", "l.68")
sub("The universe is in constant change; it never stands still.\n\\end{axiom}\n",
    "The universe is in constant change; it never stands still.\n\\end{axiom}\n\n"
    "\\begin{axiom}[shadow]\\label{ax:A5}\nWe can see the shadow, but the shadow is missing information about what it is a shadow of.\n\\end{axiom}\n",
    "Axiom 5")
sub("drive carries the weather and the mountains. That no cycle repeats exactly is not a fifth axiom but a consequence of the first and the fourth together, as Section~\\ref{sec:drive} shows.",
    "drive carries the weather and the mountains; shadow carries the fact that we see from where we stand, and see less than there is. That no cycle repeats exactly is not a further axiom but a consequence of the first and the fourth together, as Section~\\ref{sec:drive} shows.",
    "l.86")
sub("The result is that the four axioms, together with", "The result is that the five axioms, together with", "l.102")
sub("turns the four sentences into mathematics, at a level intended to be followed by a first-year mathematics graduate, and isolates as numbered definitions the four points at which",
    "turns the five sentences into mathematics, at a level intended to be followed by a first-year mathematics graduate, and isolates as numbered definitions the six points at which", "l.109")
sub(r"\section{The four axioms as mathematics}", r"\section{The five axioms as mathematics}", "section 2 title")
sub("and $F$ is an internal piece that is not directly seen.",
    "and $F$ is an internal piece that is not directly seen. That the internal piece is not directly seen is the fifth axiom at work before it has been stated: the shape is larger than what is seen of it, and Section~\\ref{sec:A5} says what follows.",
    "l.121")
sub("and that is the first of the four choices this section records.", "and that is the first of the choices this section records.", "l.133")
sub("Clause~(i) is the second of the four choices:", "Clause~(i) is the second of the choices:", "l.145")
sub("shrink toward the poles", "shrink towards the poles", "l.139 towards")

SHADOW = r"""
\subsection{Shadow}\label{sec:A5}

The sentence is: \emph{we can see the shadow, but the shadow is missing information about what it is a shadow of}.

For a shape, the sentence says three things. First, there is a place we see from. We are part of the shape; we see along the pieces that carry time and space, and the internal piece is not seen directly. We also persist: we are here after each circuit of time, so the place we see from is a point of the internal piece that the drive returns to itself. Second, what reaches us of the internal piece is its shadow: what is left of a thing in the whole shape when its position in the internal piece is forgotten. Forgetting loses information, so two different things in the whole shape can leave the same shadow, and one thing can leave different shadows. Third, the other way about: whatever we see is the shadow of something in the whole shape, and the whole shape is regular even where the shadow looks broken.

\begin{definition}[shadow, formal]\label{def:A5}
A geometry satisfies A5 if: (i) there is a point $o$ of the fibre of $F$, returned to itself by the drive of A4 after each circuit of $T$, from which observation is made, and what is observed is the image of what is on $M$ under the projection $\pi\colon M\to T\times\Sigma$ that forgets the internal piece; (ii) the growth law of A2 lies on the piece of $F$ that carries the involution of Definition~\ref{def:A2}(iii), and on no other: no length measured on $T\times\Sigma$, or on the base over which that piece sits, depends on position in it; (iii) every thing observed, including what appears singular in $T\times\Sigma$, is the image under $\pi$ of a thing on $M$ that is regular.
\end{definition}

The projection $\pi$ is not one-to-one, since the internal piece is not a point: that is the loss of information the sentence speaks of, and it is a consequence of clause~(i), not a further condition. Clause~(iii) says that something regular lies above every shadow; it does not say that it is the only thing that could. In this paper the shape is fixed by the five axioms and the principle of minimality, and not by its shadow.

Clauses~(i) and~(ii) are the fifth and sixth of the choices this section records. Clause~(i) says where we stand, and the reason for it is in the sentence itself: a shadow is seen from somewhere, and an observer who is still there after each circuit must sit where the drive brings it back. Section~\ref{sec:drive} finds that the drive returns exactly one point of the fibre to itself, so the place is not a choice among several. Clause~(ii) says where the growth law lies. Definition~\ref{def:A2} asks for a warp on one piece entering the lengths of another and does not say which; it already places the involution on ``the warped piece'', and Section~\ref{sec:fibre} finds that the piece carrying the involution is the torus that folds to the pillowcase. The fifth axiom adds that the warp is there and nowhere else. The reason is physical, and we give it in words since this paper has no forces in it: gravity is the curvature of the whole twelve-dimensional shape and reaches everywhere in it, which is why it is weak; the other forces are carried by the base and are local to it, and the growth law does not touch them. \rigD
"""
sub("and shows that the gentlest such flow is the Fibonacci drive of Section~\\ref{sec:numbers}.\n",
    "and shows that the gentlest such flow is the Fibonacci drive of Section~\\ref{sec:numbers}.\n" + SHADOW, "new subsection Shadow")

sub("The four sentences have been turned into four conditions, and in doing so four choices were made and numbered:",
    "The five sentences have been turned into five conditions, and in doing so six choices were made and numbered:", "l.191a")
sub("and that the sphere of alternatives is part of the shape (Definition~\\ref{def:orbits}). Every result below",
    "that the sphere of alternatives is part of the shape (Definition~\\ref{def:orbits}); that we see from a point the drive returns to itself (Definition~\\ref{def:A5}(i)); and that the growth law lies on the folded piece and nowhere else (Definition~\\ref{def:A5}(ii)). Every result below", "l.191b")
sub("Nothing in the four conditions mentions", "Nothing in the five conditions mentions", "l.191c")

# the unique fixed point, after the three-cycle proposition's proof
sub("The proposition is used in Section~\\ref{sec:fibre} to assign the corner algebras.",
    "The drive returns no other point of the torus to itself. A point $x$ with $M_{0}x\\equiv x$ satisfies $(M_{0}-I)x\\in\\Z^{2}$, and $\\det(M_{0}-I)=(2-1)(1-1)-1\\cdot1=-1$, so $M_{0}-I$ is invertible over the integers and $x\\in\\Z^{2}$: the only such point is $P_{1}$ (\\texttt{L1\\_one\\_fixed\\_point}). This is the place we see from (Definition~\\ref{def:A5}(i)). \\rigR\n\n"
    "The proposition is used in Section~\\ref{sec:fibre} to assign the corner algebras.", "unique fixed point")

# one thing, three shadows: after the paragraph following Prop 5.6
REMARK = r"""
\begin{remark}[one thing, three shadows]\label{rem:three-shadows}
Proposition~\ref{prop:collapse} says more than that three corners carry three complex lines. The drive carries the line at one cycled corner to the line at the next, $\Ad_{w}\colon\C_{i}\to\C_{j}\to\C_{k}$, with the points: the three are one corner and its line, moved round a cycle of three. Seen from the place the drive leaves fixed (Definition~\ref{def:A5}(i)), that one thing is met at three places in each cycle and leaves three shadows. Under the fifth axiom the three are therefore one thing seen three times, and not three things. What those three shadows are in the physics, and why exactly three kinds of matter are observed, is a statement about matter, which this paper does not contain; here we record only that the geometry has one object where an observer counts three. \rigD\ (reading: Definition~\ref{def:A5})
\end{remark}
"""
sub("The labelling of which cycled corner carries which unit is a convention and is fixed once in Appendix~\\ref{app:labels}.\n",
    "The labelling of which cycled corner carries which unit is a convention and is fixed once in Appendix~\\ref{app:labels}.\n" + REMARK, "remark three shadows")

sub("Its hypotheses are the four axioms, the four readings of Section~\\ref{sec:axioms},",
    "Its hypotheses are the five axioms, the six readings of Section~\\ref{sec:axioms},", "l.488")
sub("satisfying A1--A4 under the readings of Definitions~\\ref{def:A1}, \\ref{def:A2}(i), \\ref{def:levels} and~\\ref{def:orbits},",
    "satisfying A1--A5 under the readings of Definitions~\\ref{def:A1}, \\ref{def:A2}(i), \\ref{def:levels}, \\ref{def:orbits} and~\\ref{def:A5}(i),~(ii),", "l.491")
sub("The moduli are treated in Proposition~\\ref{prop:moduli}. The primes:",
    "A5 gives the place we see from, $P_{1}$, the one point the drive returns to itself (Proposition~\\ref{prop:threecycle} and the paragraph after it), and puts the growth law on the pillowcase alone (Definition~\\ref{def:A5}(ii)). The moduli are treated in Proposition~\\ref{prop:moduli}. The primes:", "l.499")
sub("with its coupling to the coherence field, from the same four axioms on the geometry derived here;",
    "with its coupling to the Coherent Field, from the same axioms on the geometry derived here;", "l.562")
sub("Five files, Lean 4.15.0, core library only, no Mathlib, no author axioms, zero \\texttt{sorry}; forty-nine theorems.",
    "Five files, core library only, no Mathlib, no author axioms, zero \\texttt{sorry}; fifty theorems.", "appendix count")
sub("and $F\\notin\\mathrm{SL}_{2}(\\Z)$.\n", "and $F\\notin\\mathrm{SL}_{2}(\\Z)$; $\\det(M_{0}-I)=-1$, so the drive returns one point only to itself.\n", "appendix L1 description")

sub("frame=single,framesep=4pt,xleftmargin=2pt,extendedchars=true}",
    "frame=single,framesep=4pt,xleftmargin=5pt,xrightmargin=5pt,extendedchars=true}", "listing frames inside the text block (P15(b))")
open(sys.argv[2], "w", encoding="utf-8").write(t)
print(len(log), "edits:"); print("; ".join(log))
