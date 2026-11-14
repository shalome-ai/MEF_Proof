"""v7.1 -> v7.2 (Decision Log P173-P175): one naming of the corners throughout; the glossary.
Every edit is named and matches once.  Every glossary entry is copied from the body of the
paper by exact match (the script fails if the words are not there)."""
import re,sys
src='canon/M1/superseded/Paper_M1_Six_Axioms_v7_1.tex' if len(sys.argv)<2 else sys.argv[1]
out='papers/M1/build_v7/v7_2.tex' if len(sys.argv)<3 else sys.argv[2]
t=open(src,encoding='utf-8').read()
def rep(a,b):
    global t
    assert t.count(a)==1,(t.count(a),a[:70]); t=t.replace(a,b)
# --- the corners, one naming (P174, P175)
rep(r"$P_{3}=C_{i}$ (the $\omega$ half-period); $P_{2}=C_{j}$ (the $\psi$ half-period);", r"$P_{2}=C_{i}$ (the $\psi$ half-period); $P_{3}=C_{j}$ (the $\omega$ half-period);")
rep(r"and their algebras are $\C_{j},\C_{i},\C_{k}$ (Appendix~\ref{app:labels})", r"and their algebras are $\C_{i},\C_{j},\C_{k}$ (Appendix~\ref{app:labels})")
rep(r"The assignment of $j$ and $k$ between $P_{2}$ and $P_{3}$", r"The assignment of $i$ and $j$ between $P_{2}$ and $P_{3}$")
body=t   # the glossary copies from the text as it now stands
G=[
('geometry', r"A \emph{geometry} here is a smooth shape, of some number of dimensions, on which lengths and angles can be measured, and which is allowed to have a few isolated sharp points (cone points, like the tip of a paper cone).", r"Section~\ref{sec:A5}"),
('the pieces $T$, $\Sigma$, $F$', r"$T$ is a one-dimensional piece carrying time, $\Sigma$ is a piece carrying space, and $F$ is an internal piece", r"Definition~\ref{def:A5}"),
('shadow', r"the image under $\pi$ of a point or of a subset of $M$ being its \emph{shadow}", r"Definition~\ref{def:A5}"),
('warp', r"the size of one piece depends on where one is in another, the way the circles of latitude on a globe shrink towards the poles", r"Section~\ref{sec:A2}"),
('involution', r"An involution is a symmetry that undoes itself when applied twice, like a reflection.", r"Section~\ref{sec:A2}"),
('fibre algebra $\mathcal{A}$', r"The \emph{fibre algebra} $\mathcal{A}$ of a geometry is the collection of operations on the fibres of $F$, with the product of two operations being the result of doing one and then the other, in the order in which they occur in time.", r"Definition~\ref{def:fibrealg}"),
('realised', r"A homogeneous space $G/H$ formed from the symmetry group $G$ of the fibre algebra and the stabiliser $H$ of a structure selected on it is \emph{realised} by the geometry: it appears as a factor of the base over which $F$ sits.", r"Definition~\ref{def:orbits}"),
('symmetry (of the fibre algebra)', r"A symmetry here is a map of the imaginary units that keeps their length and is not asked to keep their products", r"Definition~\ref{def:orbits}"),
('modulus', r"A \emph{modulus} of a geometry satisfying A1--A5 is a continuous parameter of its structure data (the lengths, with the warp of Definition~\ref{def:A2} and its rate $\kappa$, the complex and $\Spinc$ structures, the orbifold data, the flux integers) that the six axioms and the readings of this paper leave free, taken modulo diffeomorphism and overall scale.", r"Definition~\ref{def:modulus}"),
('minimal', r"A geometry satisfying A1--A5 satisfies A6, and is called \emph{minimal}, if it is selected by the following three clauses.", r"Definition~\ref{def:minimal}"),
('the same (of two geometries)', r"Two geometries satisfying A1--A5 are \emph{the same} when a relabelling carries one to the other", r"Definition~\ref{def:same}"),
('relabelling', r"a one-to-one map of the one shape onto the other, smooth in both directions away from the cone points", r"Definition~\ref{def:same}"),
('unique', r"A geometry of a given kind is \emph{unique} when any two of that kind are the same.", r"Definition~\ref{def:same}"),
('step (of the drive)', r"One application of this map is a \emph{step} of the drive.", r"Section~\ref{sec:drive}"),
('Fibonacci matrix $F$; $M_{0}$', r"The Fibonacci matrix $F=\bigl(\begin{smallmatrix}1&1\\1&0\end{smallmatrix}\bigr)$ has determinant $-1$: it reverses the handedness and is not a step. Its square $M_{0}=F^{2}=\bigl(\begin{smallmatrix}2&1\\1&1\end{smallmatrix}\bigr)$ has determinant $(-1)^{2}=+1$ and is the least power of $F$ that is a step.", r"Section~\ref{sec:drive}"),
('quarter-turn $S$', r"the quarter-turn $S=\bigl(\begin{smallmatrix}0&1\\-1&0\end{smallmatrix}\bigr)$", r"the proof of Theorem~\ref{thm:drive}"),
('anti-involution', r"a real-linear map with $(ab)^{*}=b^{*}a^{*}$ and $(a^{*})^{*}=a$ for all $a,b$", r"Lemma~\ref{lem:norm}"),
('norm form $N$', r"$N(a)=aa^{*}=a^{*}a=x^{2}-u^{2}$ is real", r"Lemma~\ref{lem:norm}"),
('unit group (of $\R\oplus\R u$)', r"the unit group of $\R\oplus\R u$ is the curve $\{x+yu:\,x^{2}-u^{2}y^{2}=1\}$ in the plane with coordinates $(x,y)$", r"Lemma~\ref{lem:norm}"),
('$Q_{8}$; $V$; $\Ad_{u}$', r"$V=\{\mathrm{id},\Ad_{i},\Ad_{j},\Ad_{k}\}$ with $\Ad_{u}(q)=uqu^{-1}$", r"Proposition~\ref{prop:corners}, where $Q_{8}=\{\pm1,\pm i,\pm j,\pm k\}$"),
('the fold $\iota$', r"on which $\iota$ is inversion $z\mapsto-z$", r"Proposition~\ref{prop:surface}"),
('$w$; $\Ad_{w}$', r"the order-three inner automorphism $\Ad_{w}$, $w=\tfrac12(1+i+j+k)$", r"Proposition~\ref{prop:collapse}"),
('the algebra at a point', r"let the algebra at a point be the subalgebra of $\Hquat$ fixed by those of the fold and one step of the drive that leave the point in place", r"Proposition~\ref{prop:collapse}"),
('pillowcase', r"The quotient $\Ttwo/\iota$ is the pillowcase orbifold: a sphere with four cone points of cone angle $\pi$, the unique closed Euclidean two-orbifold of signature $(2,2,2,2)$.", r"Theorem~\ref{thm:fibre}"),
('covering torus $E$', r"Let $E$ be the covering torus of the pillowcase with a complex structure for which the fold is $\iota(z)=-z$, and let $P_{1},\dots,P_{4}$ be the four corners.", r"Section~\ref{sec:twist}"),
('twist of the fibre; flux', r"A \emph{twist of the fibre} of \emph{flux} $d\geq1$ is the line $\mathcal{O}(D)$ on $E$ of a divisor $D=\sum a_{i}P_{i}$ on the corners, with $a_{i}\geq0$ and $\sum a_{i}=d$.", r"Definition~\ref{def:states}"),
('half-turn twist', r"A twist of flux zero is a flat line with holonomy $\pm1$: the trivial one, or one of the three \emph{half-turn twists}.", r"Definition~\ref{def:states}"),
('state at rest', r"A \emph{state at rest} is a holomorphic section of the twist: for $d\geq1$, a function $f$ on the covering torus $E$ whose poles are bounded by $D$.", r"Definition~\ref{def:states}"),
('first lift; second lift (of the fold)', r"The fold acts on states at rest by $f(z)\mapsto f(-z)$ or by $f(z)\mapsto-f(-z)$, its two lifts, called here the first and the second.", r"Definition~\ref{def:states}"),
('state on the pillowcase', r"A \emph{state on the pillowcase}, for a given lift, is a state at rest that the lift leaves unchanged.", r"Definition~\ref{def:states}"),
('corner sign', r"The \emph{corner sign} of the twist at $P_{i}$ is $(-1)^{a_{i}}$, the action of the first lift on the fibre of $\mathcal{O}(D)$ there.", r"Definition~\ref{def:states}"),
('odd corner', r"A corner is \emph{odd} if its sign differs from that of the other three.", r"Definition~\ref{def:states}"),
('structure (of a twist)', r"The \emph{structure} of a twist is its flux together with its corner signs up to the overall sign or, for flux zero, its holonomy.", r"Definition~\ref{def:states}"),
('tags \\rigR, \\rigD, \\rigM', r"Rigour is tagged \rigR\ (proved, or a cited classical theorem), \rigD\ (derived under a stated reading) and \rigM\ (motivated).", r"Section~\ref{sec:results}"),
]
miss=[g[0] for g in G if g[1] not in body]
assert not miss,miss
items=''.join("\\item[%s] ``%s'' (%s)\n\n"%(a,b.rstrip('.') if False else b,c) for a,b,c in G)
gloss=r"""\section{Names and glossary}\label{app:labels}

% GLOSSARY: begin (Decision Log P173--P175; every entry under "Terms" is copied word for word from the body of the paper by papers/M1/build_v7/edits_v7_2.py)
This appendix fixes the names used in this paper. The four corners are named first. The terms follow: each entry gives the term, the words of this paper that define it, copied as they stand, and the place where they stand. A later paper of the series carries this glossary, keeps its names, and adds the terms it introduces.

\subsection*{The four corners}

"""
rep("\\section{The labelling of the corners}\\label{app:labels}\n\n",gloss)
tail=r"""
\subsection*{Terms}

\begin{description}[style=nextline,leftmargin=1.5em,itemsep=2pt]
"""+items+r"""\end{description}
% GLOSSARY: end

"""
rep("\\begin{thebibliography}{99}",tail+"\\begin{thebibliography}{99}")
rep("v7.1, canon, 14 Nov 2026 (Decision Log P173):","v7.2, canon, 14 Nov 2026 (Decision Log P175): v7.1 with one naming of the corners throughout (Appendix B brought into line with the proof of Proposition 5.6) and the glossary of Appendix B.  v7.1 (Decision Log P173):")
rep("\\date{14 November 2026 (v7.1)}","\\date{14 November 2026 (v7.2)}")
open(out,'w',encoding='utf-8').write(t)
print(len(G),'glossary entries; written',out)
