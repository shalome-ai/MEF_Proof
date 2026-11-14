"""v7.2 -> v7.3 (Decision Log P177): the PI's sentence after Proposition 7.6; the glossary remade so
that each entry stands alone, in the order of first use.  Every quotation is copied from the body
by exact match (the script fails otherwise)."""
import re,sys
src=sys.argv[1] if len(sys.argv)>1 else 'canon/M1/superseded/Paper_M1_Six_Axioms_v7_2.tex'
out=sys.argv[2] if len(sys.argv)>2 else 'papers/M1/build_v7/v7_3.tex'
t=open(src,encoding='utf-8').read()
def rep(a,b):
    global t
    assert t.count(a)==1,(t.count(a),a[:70]); t=t.replace(a,b)
# --- the PI's sentence (M1-W062)
rep(r"are the same integer, but this paper does not derive one from the other.", r"are the same integer, but this paper does not derive one from the other. There may be a relationship, but that has not been found in this paper.")
i0=t.index(r'\subsection*{Terms}'); i1=t.index('% GLOSSARY: end')
body=t[:t.index(r'\section{Names and glossary}')]
# (term, [quotations], place, note or '')
G=[
('geometry',[r"A \emph{geometry} here is a smooth shape, of some number of dimensions, on which lengths and angles can be measured, and which is allowed to have a few isolated sharp points (cone points, like the tip of a paper cone)."],r"Section~\ref{sec:A5}",''),
('the pieces $T$, $\Sigma$, $F$; the geometry $M$',[r"$T$ is a one-dimensional piece carrying time, $\Sigma$ is a piece carrying space, and $F$ is an internal piece"],r"Definition~\ref{def:A5}",r"The geometry is their product, $M=(T\times\Sigma)\times F$, equation~\eqref{eq:family}."),
('shadow; the projection $\pi$',[r"the image under $\pi$ of a point or of a subset of $M$ being its \emph{shadow}"],r"Definition~\ref{def:A5}",r"Here $\pi\colon M\to T\times\Sigma$, $\pi(t,x,f)=(t,x)$, is the projection that forgets $F$."),
('warp',[r"the size of one piece depends on where one is in another, the way the circles of latitude on a globe shrink towards the poles"],r"Section~\ref{sec:A2}",''),
('involution',[r"An involution is a symmetry that undoes itself when applied twice, like a reflection."],r"Section~\ref{sec:A2}",''),
('fibre algebra $\mathcal{A}$',[r"The \emph{fibre algebra} $\mathcal{A}$ of a geometry is the collection of operations on the fibres of $F$, with the product of two operations being the result of doing one and then the other, in the order in which they occur in time."],r"Definition~\ref{def:fibrealg}",r"The internal piece is a base with a fibre over it: in the geometry derived, $F=\text{base}\times\Ttwo/\Ztwo$ (Remark~\ref{rem:split})."),
('quaternions $\Hquat$; the units $i,j,k$',[r"the quaternions, the four-dimensional number system with units $1,i,j,k$ and $i^{2}=j^{2}=k^{2}=ijk=-1$, in which $ij=k$ but $ji=-k$"],r"Section~\ref{sec:A3}",''),
('realised',[r"A homogeneous space $G/H$ formed from the symmetry group $G$ of the fibre algebra and the stabiliser $H$ of a structure selected on it is \emph{realised} by the geometry: it appears as a factor of the base over which $F$ sits."],r"Definition~\ref{def:orbits}",r"A symmetry is defined in the next entry."),
('symmetry (of the fibre algebra)',[r"A symmetry here is a map of the imaginary units that keeps their length and is not asked to keep their products"],r"Definition~\ref{def:orbits}",''),
('drive',[r"A geometry satisfies A4 if $T\times F$ carries a smooth flow $\varphi_{t}$ with no fixed points and positive topological entropy.",r"the drive is what time does to the internal piece as it goes round"],r"Definition~\ref{def:A4} and Section~\ref{sec:A4}",''),
('modulus',[r"A \emph{modulus} of a geometry satisfying A1--A5 is a continuous parameter of its structure data (the lengths, with the warp of Definition~\ref{def:A2} and its rate $\kappa$, the complex and $\Spinc$ structures, the orbifold data, the flux integers) that the six axioms and the readings of this paper leave free, taken modulo diffeomorphism and overall scale."],r"Definition~\ref{def:modulus}",r"Flux is defined below, under ``twist of the fibre; flux''."),
('minimal',[r"A geometry satisfying A1--A5 satisfies A6, and is called \emph{minimal}, if it is selected by the following three clauses."],r"Definition~\ref{def:minimal}",r"The three clauses are (a), (b) and (c) of that definition."),
('the same (of two geometries); relabelling',[r"Two geometries satisfying A1--A5 are \emph{the same} when a relabelling carries one to the other: a one-to-one map of the one shape onto the other, smooth in both directions away from the cone points"],r"Definition~\ref{def:same}",r"The conditions the map must meet follow in that definition."),
('unique',[r"A geometry of a given kind is \emph{unique} when any two of that kind are the same."],r"Definition~\ref{def:same}",''),
('fibre torus $\Ttwo$; step (of the drive)',[r"The drive of A4 acts on $\Ttwo$ by its return map, an element $M\in\mathrm{SL}_{2}(\Z)$ with trace $t$. One application of this map is a \emph{step} of the drive."],r"Section~\ref{sec:drive}",r"Here $\Ttwo=\R^{2}/\Z^{2}$ is the fibre of $F$ carrying the drive. The letter $M$ names this map in Section~\ref{sec:drive} and the geometry elsewhere; which is meant is clear from its place."),
('Fibonacci matrix $F$; $M_{0}$',[r"The Fibonacci matrix $F=\bigl(\begin{smallmatrix}1&1\\1&0\end{smallmatrix}\bigr)$ has determinant $-1$: it reverses the handedness and is not a step. Its square $M_{0}=F^{2}=\bigl(\begin{smallmatrix}2&1\\1&1\end{smallmatrix}\bigr)$ has determinant $(-1)^{2}=+1$ and is the least power of $F$ that is a step."],r"Section~\ref{sec:drive}",r"The handedness is the one that Definition~\ref{def:levels} fixes on the internal piece. The letter $F$ also names the internal piece; which is meant is clear from its place."),
('quarter-turn $S$',[r"the quarter-turn $S=\bigl(\begin{smallmatrix}0&1\\-1&0\end{smallmatrix}\bigr)$"],r"the proof of Theorem~\ref{thm:drive}",''),
('anti-involution $a\mapsto a^{*}$',[r"Let $\mathcal{A}$ be an associative real algebra with unit $1\neq0$, and let $\iota$ act on it as an anti-involution $a\mapsto a^{*}$ (the algebraic image of exchanging growth and decay: composition run backwards): a real-linear map with $(ab)^{*}=b^{*}a^{*}$ and $(a^{*})^{*}=a$ for all $a,b$."],r"Lemma~\ref{lem:norm}",''),
('norm form $N$',[r"Then every $a\in\mathcal{A}$ is $x+u$ with $x$ real and $u^{*}=-u$; for every such $u$ the square $u^{2}$ is real; and $N(a)=aa^{*}=a^{*}a=x^{2}-u^{2}$ is real."],r"Lemma~\ref{lem:norm}",''),
('unit group (of $\R\oplus\R u$)',[r"For $u\neq0$ with $u^{*}=-u$ the elements $1$ and $u$ are linearly independent, and the unit group of $\R\oplus\R u$ is the curve $\{x+yu:\,x^{2}-u^{2}y^{2}=1\}$ in the plane with coordinates $(x,y)$."],r"Lemma~\ref{lem:norm}",''),
('$Q_{8}$; $\C_{i},\C_{j},\C_{k}$; $V$; $\Ad_{u}$',[r"The subalgebras of $\Hquat$ generated by a single unit of $Q_{8}=\{\pm1,\pm i,\pm j,\pm k\}$ are $\R$, $\C_{i}$, $\C_{j}$, $\C_{k}$, in bijection with $Q_{8}/\{\pm1\}\cong\Z_{2}\times\Z_{2}$: there are exactly four. The group of inner automorphisms by units, $V=\{\mathrm{id},\Ad_{i},\Ad_{j},\Ad_{k}\}$ with $\Ad_{u}(q)=uqu^{-1}$, is the same Klein four-group."],r"Proposition~\ref{prop:corners}",''),
('the fold $\iota$',[r"there is a symmetry of the shape that swaps $\kappa$ for $-\kappa$, and applied twice it is an involution $\iota$ of the warped piece",r"Section~\ref{sec:fibre} will find that it is the fold that halves the internal piece and, on the algebra of the next axiom, the operation of conjugation",r"Under clause~(c) of Definition~\ref{def:minimal} the fibre is the torus $\Ttwo$, on which $\iota$ is inversion $z\mapsto-z$ and the drive is a hyperbolic element of $\mathrm{SL}_{2}(\Z)$."],r"Definition~\ref{def:A2}, Section~\ref{sec:A2} and Proposition~\ref{prop:surface}",r"Here $\kappa$ is the constant rate of the growth law of Definition~\ref{def:A2}, and $\Ttwo=\R^{2}/\Z^{2}$ is the fibre of $F$ carrying the drive; the drive and clause~(c) are defined below."),
('$w$; $\Ad_{w}$; the algebra at a point',[r"let the algebra at a point be the subalgebra of $\Hquat$ fixed by those of the fold and one step of the drive that leave the point in place, the local form of $\iota$ being conjugation at the drive-fixed corner and the inner automorphism by the surviving unit at the three cycled corners, and the drive acting as the order-three inner automorphism $\Ad_{w}$, $w=\tfrac12(1+i+j+k)$"],r"Proposition~\ref{prop:collapse}",r"The surviving unit at a cycled corner is the unit of its algebra: $i$ at $P_{2}$, $j$ at $P_{3}$, $k$ at $P_{4}$."),
('pillowcase',[r"The quotient $\Ttwo/\iota$ is the pillowcase orbifold: a sphere with four cone points of cone angle $\pi$, the unique closed Euclidean two-orbifold of signature $(2,2,2,2)$."],r"Theorem~\ref{thm:fibre}",''),
('covering torus $E$',[r"Let $E$ be the covering torus of the pillowcase with a complex structure for which the fold is $\iota(z)=-z$, and let $P_{1},\dots,P_{4}$ be the four corners."],r"Section~\ref{sec:twist}",''),
('twist of the fibre; flux',[r"A \emph{twist of the fibre} of \emph{flux} $d\geq1$ is the line $\mathcal{O}(D)$ on $E$ of a divisor $D=\sum a_{i}P_{i}$ on the corners, with $a_{i}\geq0$ and $\sum a_{i}=d$."],r"Definition~\ref{def:states}",''),
('half-turn twist',[r"A twist of flux zero is a flat line with holonomy $\pm1$: the trivial one, or one of the three \emph{half-turn twists}."],r"Definition~\ref{def:states}",''),
('state at rest',[r"A \emph{state at rest} is a holomorphic section of the twist: for $d\geq1$, a function $f$ on the covering torus $E$ whose poles are bounded by $D$."],r"Definition~\ref{def:states}",''),
('first lift; second lift (of the fold)',[r"The fold acts on states at rest by $f(z)\mapsto f(-z)$ or by $f(z)\mapsto-f(-z)$, its two lifts, called here the first and the second."],r"Definition~\ref{def:states}",''),
('state on the pillowcase',[r"A \emph{state on the pillowcase}, for a given lift, is a state at rest that the lift leaves unchanged."],r"Definition~\ref{def:states}",''),
('corner sign',[r"The \emph{corner sign} of the twist at $P_{i}$ is $(-1)^{a_{i}}$, the action of the first lift on the fibre of $\mathcal{O}(D)$ there."],r"Definition~\ref{def:states}",''),
('odd corner',[r"A corner is \emph{odd} if its sign differs from that of the other three."],r"Definition~\ref{def:states}",''),
('structure (of a twist)',[r"The \emph{structure} of a twist is its flux together with its corner signs up to the overall sign or, for flux zero, its holonomy."],r"Definition~\ref{def:states}",''),
]
for g in G:
    for q in g[1]: assert q in body,(g[0],q[:60])
# order of first use: the position of each entry's first quotation in the body
pos=[body.index(g[1][0]) for g in G]
G=[g for _,g in sorted(zip(pos,G),key=lambda z:z[0])]   # the order of first use
def item(g):
    qs=' \\ldots\\ '.join("``%s''"%q for q in g[1])
    return "\\item[%s] %s (%s)%s\n\n"%(g[0],qs,g[2],(' '+g[3]) if g[3] else '')
terms=r"""\subsection*{Terms}

The terms stand in the order in which the paper first defines them. A sentence after the brackets, where there is one, says what a symbol or a word in the quoted words stands for, or where it is defined.

\begin{description}[style=nextline,leftmargin=1.5em,itemsep=2pt]
"""+''.join(item(g) for g in G)+"\\end{description}\n"
t=t[:i0]+terms+t[i1:]
# names: the axioms and the tags, beside the corners
rep("\\subsection*{Terms}\n","\\subsection*{The axioms and the tags}\n\nThe six axioms of Section~\\ref{sec:fouraxioms} are cited as A1 to A6: closure (A1), growth and decay (A2), order (A3), drive (A4), shadow (A5), oneness (A6). ``Rigour is tagged \\rigR\\ (proved, or a cited classical theorem), \\rigD\\ (derived under a stated reading) and \\rigM\\ (motivated).'' (Section~\\ref{sec:results})\n\n\\subsection*{Terms}\n")
rep("v7.2, canon, 14 Nov 2026 (Decision Log P175):","v7.3, canon, 14 Nov 2026 (Decision Log P177): v7.2 with the PI's sentence after Proposition 7.6 and the glossary remade so that each entry stands alone, in the order of first use.  v7.2 (Decision Log P175):")
rep("\\date{14 November 2026 (v7.2)}","\\date{14 November 2026 (v7.3)}")
open(out,'w',encoding='utf-8').write(t)
print(len(G),'terms; written',out)
