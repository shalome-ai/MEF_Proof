# Whole-paper reader's report on `papers/M1/build_v7/passE.tex` (M1 v7.0, after Pass E)

**What was read.** The brief `papers/M1/build_v7/WHOLE_PAPER_READER_BRIEF.md` (whole); `papers/M1/build_v7/passE.tex` ll.1–1240 (whole; the Lean listings pulled in at ll.1191–1206 are not part of the check and were not read); `papers/M1/WRITE_LOG.md` ll.1–544 (whole; 43 entries, 35 active, 8 retired: W002, W011, W014, W018, W022, W033, W039, W042); `papers/M1/build_v7/COMPOSED.md` (whole). No other file was read, nothing was edited, nothing was run except a line count of the log, and the web was not searched. This file is the one file created, at the coordinator's direction.

**Conventions.** "l.N" is a line of `passE.tex`. Numbers of definitions and propositions (for example "Definition 2.7", "Proposition 5.6") are counted by me from the `\newtheorem` counter in the source; the file was not compiled, so the label is given with each. The "Rests on" lines of the log cite lines of canon v6.3 and of the Decision Log, which I was not to read; for (iii) I found each cited passage in `passE.tex` by its words, and a ground that is a ruling of the PI is reported as "not readable here". Where a term is ordinary mathematics with no defining line in the paper (surface, triangulation, manifold, homogeneous space, stabiliser), I say so and do not count it against (ii); where a term is the paper's own and has no defining line, I answer NOT SURE or NO.

---

## PART A. The thirty-five active entries

### A1. M1-W001 (a step keeps the handedness; the Fibonacci matrix is not a step)
- (i) l.308, whole and word for word.
- (ii) **NOT SURE.** Defined before it: "step", l.302 "One application of this map is a \emph{step} of the drive."; "internal piece", l.150 "$F$ is an internal piece"; $\Ttwo=\R^{2}/\Z^{2}$, l.302. The term the statement turns on, "the handedness that Definition~\ref{def:levels} fixes on the internal piece", has no defining line: Definition 2.7 (`def:levels`, l.214) reads "at the tangent level, as an almost-quaternionic structure on $M$, a rank-three subbundle of $\operatorname{End}(TM)$ locally spanned by anticommuting almost-complex structures $I,J,K$ with $IJ=K$ … whose restriction to $F$ carries the full algebra" and contains neither "handedness" nor "orientation". The only line that says the definition fixes one is l.481, after l.308: "Definition~\ref{def:levels} fixes a handedness on the internal piece, but it is one of the numbered choices".
  Question: which words of Definition 2.7 fix a handedness on the internal piece?
- (iii) **YES.** Definition 2.7 stands at l.214; the sentence the entry quotes from canon stands at l.481; the step and its matrix at l.302 ("an element $M\in\mathrm{SL}_{2}(\Z)$ with trace $t$"); $M_{0}=F^{2}$ at l.418 and l.422; certificate `L1_Fib_not_SL2` at l.428. The PI's ground (that a step keeps the handedness) is not readable here; the paper prints it as a plain assertion at l.308 and does not call it declared or a choice.
- (iv) **YES.** l.302 already writes "$M\in\mathrm{SL}_{2}(\Z)$" one paragraph before l.308 gives the ground for it. l.418 (Theorem 4.3) agrees: "$F$ itself, having determinant $-1$ and trace $1$, is not an element of $\mathrm{SL}_{2}(\Z)$: $M_{0}$ is the least power of $F$ that is."

### A2. M1-W003 (four fixed points; $\chi(X)=2\chi(X/\iota)-4$; the torus)
- (i) ll.574, 576, 578, 580, 582, 584, 586, 588 (one sentence to a line, in the proof of Proposition 5.5, `prop:surface`).
- (ii) **NOT SURE.** "carries a handedness" and "keeps the handedness": no defining line (see A1). "handle": no defining line anywhere in the paper; it is used at l.277 "the least number of handles" and l.584 "the torus $\Ttwo$, which has one handle". "$\chi$": first used at l.580 with no words; "Euler characteristic" is first named at l.676. "involution": l.193 "An involution is a symmetry that undoes itself when applied twice, like a reflection." The statement opens with a fresh "Let $X$ be a compact connected surface without boundary that carries a handedness, and let $\iota$ be an involution of $X$ that keeps the handedness"; neither hypothesis is in the statement of the proposition (ll.546–548). That the fold keeps the handedness is said only after the conclusion of l.588, at l.598: "An involution of a surface with isolated fixed points is a half-turn near each of them, so it preserves orientation." "an involution of $X$" at l.574 is not said to be continuous (see C-4b).
  Question: is l.598 the ground of "keeps the handedness" at l.574, and if so should it stand before l.574 and in the same words?
- (iii) **YES.** Clause (c) with the handles, l.277 "the fibre of $F$ carrying the drive has the least dimension and, at that dimension, the least number of handles"; Definition 2.7, l.214 (for handedness, with the reservation of A1); "exactly four isolated fixed points", ll.546, 554 and l.605 "That $\iota$ has exactly four isolated fixed points is Proposition~\ref{prop:corners} read geometrically"; that the fibre is a surface, l.572.
- (iv) **NOT SURE.** The lines after it reach the same place by another route and in other words: l.600 "For the torus the quotient $Q$ is then an orbifold with $k$ cone points of order two and $0=\chi(\Ttwo)=2(\chi(Q)-k/2)$, so $Q$ is a sphere with four cone points, the orbifold $(2,2,2,2)$, which is unique \cite{Thurston}; its double cover by the torus is unique, and $\iota$ is inversion." ("orbifold", "cone points of order two" are not words of W003); l.602 "Inversion of $T^{n}$ has $2^{n}$ fixed points (\texttt{L2\_two\_torsion}), so four corners agree with $n=2$."; l.667 "Four corners, the number forced by the algebra, select $n=2$." W003 says the torus is reached "Under clause~(c)"; l.667 says four corners "select $n=2$".
  Question: is the torus selected by clause (c) (l.588) or by the corner count (l.667, and the table row at l.1144)?

### A3. M1-W004 (the flow moves the fibre that carries the drive and nothing else)
- (i) l.306.
- (ii) **YES**, with one term noted: "the fibre of $F$ that carries the drive" is introduced by use and has no defining line (l.202 "operations on the fibres of $F$"; l.225 "the base over which $F$ sits"; l.277; l.302 "Let the fibre of $F$ carrying the drive be a torus"); see A9. "The flow of Definition~\ref{def:A4}": l.237.
- (iii) **YES.** Definition 2.9 (`def:A4`) at l.237; "the fibre of $F$ carrying the drive" at l.302. The PI's ruling is not readable here.
- (iv) **NOT SURE.** The neighbouring lines use it as stated: l.240 "the drive is what time does to the internal piece as it goes round"; l.304. But the statement says "This is a choice and is not derived", and the paper's own lists of its choices do not contain it: l.244 lists six choices and the tenth; l.1083 "Its hypotheses are the six axioms, the readings of Section~\ref{sec:axioms} and the three of Section~\ref{sec:minimal}, and one declared input"; l.1086 names "Definitions~\ref{def:A5}, \ref{def:A1}, \ref{def:A2}(i), \ref{def:levels} and~\ref{def:orbits}" and the tenth choice; l.248 says "Every result below that depends on one of these says so."
  Question: are the choices declared outside the numbered list (l.306; l.310; l.510 "this is read as"; l.790 "that its phase is not recorded is a choice and is not derived"; l.1007 "a choice of what the clause is applied to") hypotheses of Theorem 8.1, and should its statement name them?

### A4. M1-W005 (the step is the linear map of its matrix)
- (i) l.310.
- (ii) **YES.** "step", l.302; $\mathrm{SL}_{2}(\Z)$, l.302, l.308.
- (iii) **YES.** l.237 "carries a smooth flow $\varphi_{t}$" for "asks only for a smooth flow"; l.302; M1-W001 at l.308.
- (iv) **NOT SURE**, on the same ground as A3 (iv): "That the step is the linear one is a choice and is not derived", and the choice is in none of the lists at ll.244, 1083, 1086. Otherwise the lines round it use it as stated (l.302 "acts on $\Ttwo$ by its return map, an element $M\in\mathrm{SL}_{2}(\Z)$"; l.313 "A4 holds for the return map $M$").

### A5. M1-W006 (Definition of A4)
- (i) l.237.
- (ii) **YES.** "topological entropy" has no formal definition; l.234 gives it in words: "The mathematical measure of genuine change is \emph{entropy} of the flow: it is positive when two points that start close are driven apart".
- (iii) **YES.** The fourth axiom at l.95 "The universe is in constant change; it never stands still." The words the entry says leave are gone: no "measure zero", no "typical" in l.234, l.319 ("contradicting Definition~\ref{def:A4}"), l.323.
- (iv) **YES.** l.234 "``Never stands still'' means the flow has no fixed points"; l.319 "every point is periodic and the entropy vanishes, contradicting Definition~\ref{def:A4}"; l.323 "the induced flow on the mapping torus has no fixed points".

### A6. M1-W007 (the points that return are the rational ones)
- (i) ll.325, 327, 329 (the last three lines of the proof of Proposition 4.1, `prop:hyp`).
- (ii) **YES.** "steps of $M$": l.302, and l.310 for the step as the map $x\mapsto Mx \bmod \Z^{2}$.
- (iii) **YES.** M1-W005 at l.310; M1-W001 at l.308.
- (iv) **NOT SURE.** The statement of the proposition is l.313 "A4 holds for the return map $M$ if and only if $\lvert t\rvert>2$", and Definition 2.9 (l.237) has no clause on periodic points; the three cases of the proof end at l.323, and no sentence of the proof says what ll.325–329 are a step towards. No proof of ll.325–329 is printed (the entry's mark puts the hand proof in a file I was not to read), under a proposition tagged \rigR. The one line that may rest on it is l.106 "That no cycle repeats exactly is not a further axiom but a consequence of the first and the fourth together, as Section~\ref{sec:drive} shows."
  Question: which statement of the paper is W007 a step of, and is its proof to be printed?

### A7. M1-W008 (the drive commutes with the fold)
- (i) ll.590, 592, 594, 596.
- (ii) **YES.** "the folded fibre $\Ttwo/\iota$": l.127 "the fibre, folded in half by the growth-and-decay exchange"; "the fold": l.193 "it is the fold that halves the internal piece", l.546 "the fold $\iota$"; isolated fixed points, l.546.
- (iii) **YES.** l.127 verbatim; l.187 "there is a symmetry of the shape that swaps $\kappa$ for $-\kappa$"; l.334 "are the same map of the folded fibre"; the hypothesis of isolated fixed points at ll.546, 554.
- (iv) **YES.** It is a conclusion inside the proof of Proposition 5.5 that the statement of the proposition (ll.546–548) does not contain; ll.598–602 do not use it; it is used silently where the drive permutes the fixed points of $\iota$ (l.610, l.616).

### A8. M1-W009 (the map round time is a whole number of steps)
- (i) l.304.
- (ii) **YES.** l.175 "Time, in particular, is a circle"; l.302 "step".
- (iii) **YES.** Every line the entry quotes stands: l.175; l.163 "the internal piece may be carried round time by a map of itself, as Section~\ref{sec:drive} finds"; l.240 "the drive is what time does to the internal piece as it goes round"; l.302 "One application of this map is a \emph{step} of the drive. Whether one circuit of the time circle is one step or several is not assumed in this section; Corollary~\ref{cor:timecircle} settles it."; l.958 "once round $T$ the fibre is glued to itself by a power of the drive, the number of steps in $T$"; M1-W004 at l.306.
- (iv) **YES.** l.302 says nearly the same thing two lines earlier; the two do not differ in meaning.

### A9. M1-W010 (clause (c))
- (i) l.277.
- (ii) **NOT SURE.** "handles": no defining line in the paper. "the fibre of $F$ carrying the drive": no defining line at or before l.277 (see A3). "flux", "twist of its fibre": defined later, l.830; "step", "time circle … number of steps": later, l.302 and l.950. l.161 says of two such words "The words \emph{step} and \emph{state at rest} are made exact where they are used".
  Question: should "handle" and "the fibre of $F$ carrying the drive" each have a defining line?
- (iii) **YES.** l.262 "The third: what is needed is least."
- (iv) **YES.** Each item is used in its words: entropy, l.334 "Clause~(c), which is applied to the step, agrees: the least entropy" and l.1007; total dimension, l.716 "Clause~(c) takes the least total dimension"; dimension of the fibre, l.572; handles, l.588; flux, l.927 "That the least flux is taken is clause~(c)"; steps, l.968.

### A10. M1-W012 (the opening of Definition 3.2; the order of priority)
- (i) l.271.
- (ii) **YES.**
- (iii) **YES.** The reason the entry quotes from canon now stands in composed sentence 4, l.282. The three places where the paper says two clauses select alike stand: l.284 "On the drive clause~(a) makes the selection, and clause~(c) agrees with it"; l.479 "In every one of the four counts the least trace with a single drive is three"; l.978 "Clause~(b) makes the same selection when every symmetry of the torus, and not only the fold and the drive, is given an element; that every symmetry is given one is a hypothesis of this paragraph."
- (iv) **NOT SURE.** l.282 uses "prevails" as the statement does. But the statement says a geometry "is selected by the following three clauses", and l.280 says of clause (a) "A clause of this kind can exclude and cannot pick", while l.284 and l.334 say "clause~(a) makes the selection" and l.448 "the clause selects it".
  Question: does clause (a) select (ll.271, 284, 334, 448) or only exclude (l.280)?

### A11. M1-W013 (no fibre of dimension less than two; the fibre is a surface)
- (i) ll.554, 556, 558, 560, 562, 564, 566, 568, 570, 572; its first sentence stands also at l.546, as the hypotheses of Proposition 5.5.
- (ii) **YES.** Every hypothesis is in its first sentence. "manifold", "open arc", "increasing or decreasing" are ordinary terms with no defining line.
- (iii) **YES.** Clause (c), least dimension, l.277; four isolated fixed points, l.546 and l.605; the four fixed points of $z\mapsto-z$, l.586.
- (iv) **YES.** l.570 gives the example at dimension two, and l.572 draws the conclusion in the words of clause (c).

### A12. M1-W015 (A1 read as compact unit groups; division algebra)
- (i) ll.510, 512.
- (ii) **NOT SURE.** $u^{*}$, $N$ and "the unit group of $\R\oplus\R u$" are those of Lemma 5.1 (l.492), but neither l.510 nor the statement of Proposition 5.2 (l.504 "Under A1, A2 and A3 the fibre algebra is the quaternions.") says so. The lemma has three hypotheses: "an associative real algebra with unit $1\neq0$"; "let $\iota$ act on it as an anti-involution"; "Suppose its fixed elements are exactly the real multiples of $1$." The proof of Proposition 5.2 says only (l.508) "By Definition~\ref{def:fibrealg} $\mathcal{A}$ is finite-dimensional and associative." I searched the whole file: no line says that the fibre algebra has a unit, that $\iota$ acts on the fibre algebra as an anti-involution, or that the elements it fixes are exactly the real multiples of $1$. The nearest lines are l.193 "on the algebra of the next axiom, the operation of conjugation", the parenthesis of l.492, and l.534 "Let $\iota$ act on $\Hquat$ as conjugation" (after the algebra is known to be $\Hquat$).
  Question: where does the paper say that the fibre algebra meets the three hypotheses of Lemma 5.1?
- (iii) **YES.** M1-W017 at l.492; Definition 2.3 (`def:A1`) at l.178 "$T$, $\Sigma$ and $F$ are compact, connected and without boundary"; the step by Frobenius at l.514.
- (iv) **NOT SURE.** l.501 and l.516 use it as stated. The worked case keeps a word the statement does not have: l.643 "A1 excludes the second picture at every corner, and with it every zero-divisor." (heading at l.637 "Compact and split corners"); the statement speaks of "every $u\neq0$ of $\mathcal{A}$ with $u^{*}=-u$", not of corners.
  Question: is "at every corner" at l.643 meant as "for every $u\neq0$ with $u^{*}=-u$"?

### A13. M1-W016 (Definition 2.7: the two levels)
- (i) l.214.
- (ii) **YES** for the terms (l.211 for spinors; l.217 for the almost-complex and quaternionic structures). How the algebra acts at the spinor level is not in the statement; see C-5.
- (iii) **YES.** l.211 "The order axiom will be read as saying that the non-commutative algebra is the algebra of the shape's own tangent directions and spinors". The word "Clifford" is nowhere in `passE.tex`.
- (iv) **NO.** Lines of the paper give the definition words it does not contain. "handedness": l.287 "the handedness that Definition~\ref{def:levels} fixes on the internal piece"; l.308; l.481. "with its four corners": l.720 "A3 places the full algebra with its four corners on $F$ (Definition~\ref{def:levels})." And l.714 "The time--space block $T\times\Sigma$ carries the quaternionic structure with the drive along $T$", where the definition speaks of $M$ and of the restriction to $F$.
  Question: as A1.

### A14. M1-W017 (Lemma 5.1, the norm form)
- (i) l.492.
- (ii) **YES.** Every hypothesis and term is in the statement ("anti-involution" is defined in it). "the unit group of $\R\oplus\R u$ is the curve $\{x+yu:\,x^{2}-u^{2}y^{2}=1\}$" stands as an assertion; "unit group" has no other defining line (l.639 "the unit group $N=1$ is the circle $U(1)$").
- (iii) **YES.** l.193; l.534; the worked case ll.637–643, which computes $N(x+yu)=x^{2}-u^{2}y^{2}$.
- (iv) **NOT SURE.** The proof (composed sentence 5, l.497) follows the statement clause by clause, except that it gives no line for "the unit group of $\R\oplus\R u$ is the curve". Separately, the parenthesis of the statement says of $\iota$ "(the algebraic image of exchanging growth and decay: composition run backwards)", and l.127 says "the fibre, folded in half by the growth-and-decay exchange"; but l.190 says "there is a symmetry of the shape that swaps $\kappa$ for $-\kappa$, and applied twice it is an involution $\iota$", and l.702 "Applied twice it is $(s,x,y)\mapsto(s,-x,-y)$, the fold $\iota$."
  Question: is $\iota$ the exchange of growth and decay (ll.127, 492) or the exchange applied twice (ll.190, 702)?

### A15. M1-W019 (Proposition 7.2, the projective plane)
- (i) l.790.
- (ii) **NOT SURE.** "the tenth choice": ll.219–221. "complex-valued unit": ll.219, 225. No defining line: "corner data" ("so that the corner data take values in $\C\otimes\ImH\cong\C^{3}$"); $h$ (first used here in "$c_{1}=3h$", then l.796 "in $\Z[h]/(h^{3})$"); $U(1)$, $U(2)$, $SU(3)$ and how $U(1)\times U(2)$ sits in $U(3)$ (ordinary terms). The last sentence, "Under Definition~\ref{def:orbits} it is a factor of the base", needs "a structure selected" (l.225); the statement does not say that a complex line is one, nor what selects it (C-6c).
  Question: what are "the corner data", and what is $h$?
- (iii) **YES.** The tenth choice, l.219; Definition 2.8, l.225; l.264 "The overall size of the shape is a comparison with a second thing, and there is none: it has no meaning."; l.778 "$u^{2}=-\lvert u\rvert^{2}$"; l.780 "The three corner units are an orthonormal frame". "Hermitian", "scale-freeness" and "the $\Spinc$ phase" are nowhere in the file.
- (iv) **NOT SURE.** The proof (ll.794–798) covers $\chi=3$ and $c(T\CPtwo)=(1+h)^{3}$ and ends "This proposition is the least direct of the section and is tagged accordingly." It has no sentence for "$\CPtwo=U(3)/(U(1)\times U(2))=SU(3)/U(2)$" and none for the last sentence of the statement. Elsewhere the paper speaks of the unit, not of a direction, as selected: l.804 "the almost-complex structure of A3's selected unit".
  Question: is the last sentence of the statement meant to follow from Definition 2.8 with $G=U(3)$ and $H=U(1)\times U(2)$, and where is that said?

### A16. M1-W020 (the base is $\CPtwo\times\Stwo$ and nothing further)
- (i) ll.1068, 1070, 1072 (proof of Theorem 7.10, `thm:base`).
- (ii) **YES** for its terms. It supposes that two structures and no more are selected; see C-6b.
- (iii) **YES.** Definition 2.8, l.225; Proposition 7.1, l.770; Proposition 7.2, l.790; clause (b), l.275, verbatim "$M$ carries no object, whether a twisting line, a structure group larger than is needed, or a class of loops, that A1--A5 do not require"; l.755 "$\dim(\text{base})=6$"; l.758 "the split is uniquely $(3,6)$"; M1-W012, l.271.
- (iv) **YES.** l.1066 "Propositions … supply the factors."; l.1062; l.1110.

### A17. M1-W021 (Definition 2.8, orbits are realised)
- (i) l.225.
- (ii) **NOT SURE.** "a structure selected on it" has no defining line: the paper does not say what a structure on the fibre algebra is, nor what it is for one to be selected (C-6). "the base over which $F$ sits" is introduced by use (l.127 "the base over which the fibre sits"). "complex-valued units": l.219, just before.
  Question: what is "a structure selected on" the fibre algebra?
- (iii) **YES.** l.228 "That is the sixth choice"; l.244 "that the sphere of alternatives is part of the shape (Definition~\ref{def:orbits})"; l.228 "The quaternions have a symmetry group, the rotations of the three imaginary units $i,j,k$ among themselves."; "piece" at ll.146, 163; l.778.
- (iv) **NOT SURE.** The statement makes a symmetry of the real units "a real-linear map" that "keeps their length and is not asked to keep their products". The lines that use it name a smaller group: l.228 "the rotations of the three imaginary units"; l.770 "the inner automorphisms $\Ad_{g}$, $g\in\mathrm{Sp}(1)$, act transitively through $\mathrm{Sp}(1)\to SO(3)$"; l.772 "the orbit of $i$ is $\mathrm{Sp}(1)/U(1)=\Stwo$". l.228 also says "picks out one unit" where the statement says "a structure selected".
  Question: for the real units, is the group $G$ of Definition 2.8 every length-keeping real-linear map (l.225), or the rotations (ll.228, 770)?

### A18. M1-W023 (the reading of Definition 2.1(iii))
- (i) l.838.
- (ii) **YES.** "states on the pillowcase", "lift of the fold": l.832; "shadow": l.154 and l.163 "its shadow what is left of it when the internal piece is forgotten"; Definition 2.1(iii): l.158.
- (iii) **YES.** M1-W024 at l.832; the second choice at l.163, verbatim; l.158; l.876 "the states of clause~(iii) being states on the pillowcase for one of the two lifts of the fold".
- (iv) **YES.** l.161; l.876; l.1161 "with two states on the pillowcase and one removed by the fold". The bare word "state(s)" at ll.844(a), 854, 886, 890, 921 means a state at rest on $E$.

### A19. M1-W024 (state at rest; state on the pillowcase)
- (i) l.832.
- (ii) **YES.** "twist", $D$: l.830; "covering torus $E$": l.827; "the pillowcase": l.676.
- (iii) **YES.** l.676 "The quotient $\Ttwo/\iota$ is the pillowcase orbifold"; l.127; l.302 "Let the fibre of $F$ carrying the drive be a torus $\Ttwo=\R^{2}/\Z^{2}$"; l.758 "$F=\text{base}\times\Ttwo/\Ztwo$"; l.827 "Let $E$ be the covering torus of the pillowcase"; M1-W003 at l.588; M1-W008 at l.590.
- (iv) **YES.** "The fibre" is the torus at l.588 and the pillowcase in the abstract (l.55 "the internal fibre is the pillowcase orbifold") and in the title of Theorem 5.7 (l.675); the statement's "the fibre before it is folded" and "the fibre folded" cover both.

### A20. M1-W025 (Definition 2.4, growth and decay)
- (i) l.190.
- (ii) **YES.** "warped product" is defined in clause (i); "involution" at l.193. "a symmetry of the shape that swaps $\kappa$ for $-\kappa$" has no formal definition; its one instance is l.702.
- (iii) **YES.** The second axiom, l.87; l.187, three quotations verbatim; l.193 "Clause~(i) is the fourth of the choices".
- (iv) **NOT SURE.** l.127 says "The symbol $\times_{w}$ records that the product is warped, as the second axiom requires. Which of the two pieces is scaled, and by a function on which, is not fixed in this paper: nothing derived here depends on it". Clause (i) speaks of "at least one product in~\eqref{eq:family}", that is, in $(T\times\Sigma)\times F$; the $\times_{w}$ of (1.1) (l.125) stands inside $F$, between $\CPtwo\times\Stwo$ and $\Ttwo/\Ztwo$; and Proposition 5.8 (l.702) puts the growth "on $T$ together with the fibre" and concludes "The geometry therefore satisfies A2." l.187 still has "and so $w=w_{0}e^{\kappa s}$".
  Question: is the warp of l.702 the $\times_{w}$ of (1.1) and "the warp of Definition~\ref{def:A2}" of l.267, when l.127 says it is not fixed in this paper and that nothing derived depends on it?

### A21. M1-W026 (Proposition 5.8, the geometry satisfies A2)
- (i) l.702.
- (ii) **YES.** $M_{0}$, $\phi$: ll.308, 339; the quarter-turn $S$: l.355 and in the statement; the fold: l.546; "step": l.302.
- (iii) **YES.** M1-W025 at l.190; M1-W009, W005, W001, W004 at ll.304, 310, 308, 306; l.339 for the eigenvalues $\phi^{\pm2}$ and "the Sol torus bundle"; l.381 "$SM_{0}S^{-1}=M_{0}^{-1}$ (\texttt{L1\_conj\_M0\_inv})"; l.127; l.193; l.827 "the fold is $\iota(z)=-z$".
- (iv) **NOT SURE.** No proof follows the proposition (l.703 closes it and Section 6 begins); the hand check of the entry's mark is not printed. Its last sentence rests on clause (iii) of l.190, "there is a symmetry of the shape", while the map given is of $T$ together with the fibre, and l.291 says "that it carries every datum of $\Mtwelve$ to itself is not shown here". l.291 uses "the lengths" of this proposition four hundred lines before it.
  Question: does "a symmetry of the shape" in Definition 2.4(iii) ask for a map of the whole geometry carrying every datum, which l.291 says is not shown, or only for the map of l.702?

### A22. M1-W027 (Definition 3.1, modulus)
- (i) l.267.
- (ii) **YES**, with terms defined later: "$\Spinc$ structures" (l.804), "orbifold data" (l.676), "flux integers" (l.830).
- (iii) **YES.** M1-W025 at l.190, M1-W026 at l.702, M1-W028 at l.1090. "energy" and "stationarity" are nowhere in the file.
- (iv) **YES.** l.273 "$M$ has no modulus"; l.284 "Overall size is not a modulus"; l.287 "the structure data of Definition~\ref{def:modulus}"; l.1059; l.1121.

### A23. M1-W028 (the one declared input)
- (i) l.1090, in the statement of Theorem 8.1.
- (ii) **NOT SURE.** "held fixed" has no defining line, and the paper nowhere lists "the continuous data of the geometry that this paper does not derive". Continuous data that the paper names without deriving: l.127 (the warp of $\times_{w}$); l.695 "periods $(L_{\psi},L_{\omega})$"; l.702 "$L$ the length of one step"; l.827 "The counts below do not depend on which such complex structure is taken."
  Question: which continuous data are meant, and what is it for them to be held fixed?
- (iii) **YES.** M1-W026 at l.702, M1-W027 at l.267. "aspect ratio" survives only at l.1188 "The certificate of the earlier version on the aspect ratio is not part of this paper."; "declared sector" is nowhere.
- (iv) **YES.** l.1083 "and one declared input"; l.1121 (composed 8) repeats its words and adds the failure test; l.1123 "The overall size is not an input".

### A24. M1-W029 (Proposition 5.6, the corner algebras)
- (i) l.610.
- (ii) **NO.** The statement defines the algebra at a point as "the subalgebra of $\Hquat$ fixed by those of the fold and one step of the drive that leave the point in place, $\iota$ acting as conjugation and the drive as the order-three inner automorphism $\Ad_{w}$", and concludes "$\C_{i}$, $\C_{j}$, $\C_{k}$ at the three other fixed points of $\iota$". The proof reaches that conclusion by a hypothesis the statement does not contain, l.618: "the local form of $\iota$ at such a point is the inner automorphism by the surviving unit, and its fixed subalgebra is the corresponding complex line." By the paper's own l.616, "the subalgebra fixed by conjugation is $\R$".
  Question: is the hypothesis of l.618 to be written into the statement of Proposition 5.6?
- (iii) **YES.** The worked line stands at l.670 "moved by $\iota$ to $(\tfrac23,0)$ and by $M_{0}$ to $(\tfrac23,\tfrac13)$"; the four corners at l.524 and l.605; clause (b) at l.275. "stabiliser" is nowhere in Section 5 (it stands at ll.225, 772, 782, 980 in other senses); "$\langle\iota,M_{0}\rangle$", "generic" and "Definition~\ref{def:A4}(iii)" are nowhere.
- (iv) **NO.** l.627 says "The reading in the statement, that the local form of $\iota$ is conjugation at the drive-fixed corner and the inner automorphism by the surviving unit at the three cycled corners"; the statement (l.610) has "$\iota$ acting as conjugation" and nothing on the three cycled corners. l.614 and l.623 use the statement's own words. Two further points: no line of the proof says that one step of $M_{0}$ leaves no point other than $P_{1}$ in place (see B6); and l.620 has "$\C_{i}\mapsto\C_{j}\mapsto\C_{k}$ exactly as $P_{2}\to P_{3}\to P_{4}$" while l.670 and l.1210 have $P_{2}=C_{j}$, $P_{3}=C_{i}$, $P_{4}=C_{k}$ (see "Noticed in passing", 1).

### A25. M1-W030 (table row: other six-dimensional bases)
- (i) l.1148.
- (ii) **YES.** "realised": l.225; "orbit": l.224 (title), l.772.
- (iii) **YES.** M1-W020 at ll.1068–1072; Definition 2.8; clause (b), l.275.
- (iv) **YES.** It agrees with the rows beside it (l.1147, l.1149).

### A26. M1-W031 (Remark 6.2, where the quaternionic structure carries information)
- (i) ll.729–731.
- (ii) **YES**, with things used before their place: the factors $\CPtwo$ and $\Stwo$ (derived in Section 7; named at l.125) and "$\CPtwo$ is not spin" (l.804). $\Lambda^{2}_{+}$ has no defining line (ordinary).
- (iii) **YES.** Every line the entry quotes stands: l.214; l.714 "The time--space block $T\times\Sigma$ carries the quaternionic structure with the drive along $T$"; l.722 "On a four-manifold every oriented Riemannian structure is almost-quaternionic, since $\mathrm{Sp}(1)\mathrm{Sp}(1)=SO(4)$ and the triple $I,J,K$ is all of $\Lambda^{2}_{+}$: A3 would carry no information on $F$"; l.610 ("$\Hquat$ at every other point"); l.804; l.810; l.818 "The $\Stwo$ factor is spin and the pillowcase is flat, so neither obstructs"; l.758; l.1074.
- (iv) **NOT SURE.** The remark says "A single such structure on the eight-dimensional internal piece is not constructed here" and "is assumed here and is not shown". The lines beside it speak as though $F$ carried one: l.724 "So $F$ has quaternionic dimension at least two"; l.758 "with $T\times\Sigma$ and $F=\text{base}\times\Ttwo/\Ztwo$ both quaternionic". The remark also passes from "The fibre algebra itself is realised on the pillowcase factor" to "The quaternionic structure therefore carries information in exactly one place, the pillowcase", where "the quaternionic structure" of l.214 is a structure on tangent vectors and the pillowcase has two dimensions.
  Question: do ll.724 and 758 ("both quaternionic") rest on the assumption that Remark 6.2 declares, and should they say so?

### A27. M1-W032 (Definition 3.3, the same geometry; unique)
- (i) ll.286–288.
- (ii) **NOT SURE.** No defining line: "the direction of time"; "the handedness that Definition~\ref{def:levels} fixes" (A1); "kind" in "A geometry of a given kind"; and the list "every datum … the factors, the discrete data and the structure data" is not closed ("discrete datum" is used at ll.127, 1083, undefined). "cone points": l.143.
  Question: what is a geometry "of a given kind", and what is "the direction of time" of a geometry?
- (iii) **YES.** All the paper's lines that the entry quotes stand: l.258; l.273; l.280; l.336 "a single object up to relabelling the torus"; l.264; l.143; l.481; ll.146–154; l.1083 "its conclusion names every factor and every discrete datum of the geometry"; M1-W027, W028.
- (iv) **NOT SURE.** l.291 uses it in its words. Elsewhere "relabelling" is used more widely than the definition allows: l.474 "under relabellings that reverse the orientation"; l.1127 "a reader who allows relabellings that reverse orientation". The proof of Theorem 8.1 (ll.1102–1116) does not use the definition (C-2a).
  Question: is "relabelling" at ll.474 and 1127 the relabelling of Definition 3.3, which keeps the handedness?

### A28. M1-W034 (Remark 3.4, mirror image and run backwards)
- (i) l.291.
- (ii) **NOT SURE.** Defined only later: the quarter-turn $S$ (l.355), $M_{0}$ (l.308), "the lengths" (l.702), "the corner signs" (l.834). No defining line for "the mirror image of a geometry" or "a geometry run backwards"; l.280 has both for a step only.
  Question: should the remark stand after the things it names, or point to them?
- (iii) **YES.** M1-W032 at l.287; l.381; l.947 "The pattern $(-1)^{mn}$ is the one of the three that the quarter-turn $S$, as written in Theorem~\ref{thm:drive}, leaves in place: $S$ fixes $P_{1}$ and $P_{4}$ and exchanges $P_{2}$ and $P_{3}$."; l.702. Of the sentence of canon the entry quotes, the first half stands at l.481 ("it does not say whether the whole geometry has a symmetry that mirrors the torus") and the second half ("and the definitions use a direction of time without saying …") is no longer in the file, as the entry says.
- (iv) **NOT SURE.** l.481 says "The fold, the corners and their algebras, the corner signs, the flux of the twist and the element of the drive on spinors, as this paper defines them, are each carried to themselves by a mirror of the torus and by the reversal of the drive". That list is longer than the remark's "the step, the lengths and the corner signs", it speaks of other maps ("a mirror of the torus", "the reversal of the drive"), and no line gives a ground for it.
  Question: are the maps of l.481 those of l.291, and what is the ground of l.481's list?

### A29. M1-W035 (the tenth choice: complex spinors)
- (i) l.219.
- (ii) **NOT SURE.** "data of the fibre algebra carried by spinors" has no defining line. $\ImH$ and the three imaginary units are those of the quaternions, described at l.209 before the algebra is shown to be $\Hquat$ (l.504).
  Question: what are "data of the fibre algebra carried by spinors"?
- (iii) **YES** for M1-W016 (l.214). The sentence of canon the entry cites for part (b) ("that complexification is forced, which is Proposition~\ref{prop:spinc}'s statement that spinor-valued data are complex") is not in `passE.tex`; "complexification" is nowhere, and Proposition 7.3 (l.804) has no such statement. The PI's ruling is not readable here.
- (iv) **YES.** l.221 (composed 2); l.225 "for the complex-valued units"; l.246 (composed 3); l.790 "(the tenth choice)"; l.1088. One count no longer fits: l.129 "isolates as numbered definitions the six points at which a behavioural word has to be given a mathematical meaning", where Section 2 now has seven choices (l.221).

### A30. M1-W036 (the integer two on $\Stwo$)
- (i) l.825 (three sentences, from "On $\Stwo$ the canonical structure has the integer two." to "which clause~(b) of Definition~\ref{def:minimal} removes.").
- (ii) **NOT SURE.** "the canonical structure": ll.804, 816; "the integer": earlier in l.825 "carries three independent integers"; "twisting line": l.804. The statement asserts "The sphere is the complex projective line"; the sphere here is the sphere of units of Proposition 7.1 (l.770), and no line of the paper gives it a complex structure. The coordinate $z$ is not introduced.
  Question: what in the paper gives the sphere of units the complex structure by which it is the complex projective line?
- (iii) **YES.** l.825 "The determinant line of a $\Spinc$ structure therefore carries three independent integers, odd on $\CPtwo$ and even on the other two, and the canonical structure has zero on the torus"; l.1031 "The canonical structure has $L=K^{-1}=\Oline{3}$ and no further datum"; l.804 "the twisting line is an object that nothing requires"; clause (b), l.275.
- (iv) **YES.** The same paragraph has "even on the other two"; l.1096 lists "the integer two on $\Stwo$"; ll.820, 1051 say "even".

### A31. M1-W037 (table row $D\not\equiv0\ (4)$)
- (i) l.1138. (ii) **YES.** (iii) **YES**: Theorem 6.1, l.708, "Under Definition~\ref{def:levels}", printed \rigD. (iv) **YES**: l.743 "no almost-quaternionic structure on $M$".

### A32. M1-W038 (table row $D=4$, $D=8$)
- (i) l.1139. (ii) **YES**: "quaternionic dimension" at ll.724, 735. (iii) **YES**: l.708 (\rigD); ll.722, 724, 726; the first sentence of l.730. (iv) **YES**.

### A33. M1-W040 (table row $T^{n}$, $n\neq2$, as fibre)
- (i) l.1144. (ii) **YES.** (iii) **YES**: Proposition 5.5, ll.545–551, printed \rigD; `L2_two_torsion` at l.602; four fixed points, l.546.
- (iv) **NOT SURE.** The row's reason is "$2^{n}\neq4$ corners"; the proof of the proposition it cites reaches the torus by clause (c) (ll.572, 588), and the corner count stands there only as l.602 "so four corners agree with $n=2$". Question: as A2 (iv).

### A34. M1-W041 (table row $T^{4}/\Z_{2}$, K3)
- (i) l.1145. (ii) **YES** ("K3" and "$T^{4}/\Z_{2}$" have no defining line; ordinary). (iii) **YES**: Proposition 5.3, l.524, \rigR; Theorem 6.1, l.708, \rigD. (iv) **YES**.

### A35. M1-W043 (table row: spin bases)
- (i) l.1147. (ii) **YES.** (iii) **YES**: M1-W020 at ll.1068–1072; M1-W021 at l.225; M1-W019 with M1-W035 at ll.790, 219; M1-W030 at l.1148. (iv) **YES**.

---

## PART B. The twelve composed sentences

### B1. Composed 1, l.1096: "the integer two on $\Stwo$,"
- Joins: the list of discrete data in the statement of Theorem 8.1, between "determinant line $\Oline{3}$," (l.1094) and "$\chi(\Keight)=12$" (l.1098).
- Terms defined: **NOT SURE.** "the integer" stands bare; its meaning is in l.825 "The determinant line of a $\Spinc$ structure therefore carries three independent integers".
- Anything no other sentence says: **NO.** l.825 "On $\Stwo$ the canonical structure has the integer two." But the proof of the theorem has no clause for it, though l.1083 says "the proof is written so that each clause points to the section that forces it"; l.1110 names "$L=\Oline{3}$" only, and Theorem 7.10 (l.1062) does not state the integer.
  Question: should the proof of Theorem 8.1 point to l.825 for this datum?

### B2. Composed 2, l.221: "This is the tenth choice of this paper, and the seventh of this section."
- Joins: M1-W035 (l.219) to "(the tenth choice)" at l.790 and to the count at l.256 "they are the seventh, eighth and ninth choices of this paper".
- Terms defined: **YES.**
- Anything no other sentence says: **YES.** No other sentence says which choice is the tenth, nor that it is the seventh of Section 2. It is printed before l.228 "That is the sixth choice", and l.129 still says "the six points".

### B3. Composed 3, l.246: "; and that the spinor bundle of Definition~\ref{def:levels} is the complex spinor bundle, and data of the fibre algebra carried by spinors are complex-valued."
- Joins: the list of choices at l.244 to M1-W035.
- Terms defined: **NOT SURE**, as A29 (ii).
- Anything no other sentence says: **NO.** l.219 "The spinor bundle of Definition~\ref{def:levels} is the complex spinor bundle, and data of the fibre algebra carried by spinors are complex-valued". By its place it comes under l.248 "Every result below that depends on one of these says so."

### B4. Composed 4, l.282: "Clause~(b) prevails over clause~(c), so that clause~(c) does not replace a structure that needs no further object by one with a smaller integer."
- Joins: l.271 "and clause~(b) over clause~(c)" to the paragraph after Definition 3.2.
- Terms defined: **NOT SURE.** "a structure that needs no further object" and "one with a smaller integer" have no defining line; the case in view seems to be ll.1031–1037 ("each requiring a twisting line $E=\Oline{\mp1}$: a further object, which clause~(b) removes").
- Anything no other sentence says: **YES.** The first half is l.271. The reason, "so that clause~(c) does not replace a structure that needs no further object by one with a smaller integer", is in no other sentence. None of the quantities of clause (c) at l.277 is the integer of a determinant line.
  Question: to which quantity of clause (c) does "a smaller integer" refer?

### B5. Composed 5, l.497 (the proof of Lemma 5.1)
- Joins: the statement of Lemma 5.1 (l.492) to its ground.
- Terms defined: **YES**, all in the lemma.
- Anything no other sentence says: **YES**; it is the proof, and its steps stand nowhere else (the worked case, l.637, has only "$N(x+yu)=x^{2}-u^{2}y^{2}$"). Clause by clause it covers: $a=x+u$; $u^{2}$ real; $N(a)=aa^{*}=a^{*}a=x^{2}-u^{2}$; the independence of $1$ and $u$; when the curve is compact; both directions of the "if and only if". It has no step for "the unit group of $\R\oplus\R u$ is the curve".

### B6. Composed 6, l.623: "A point that neither the fold nor one step of the drive leaves in place has nothing fixed and carries $\Hquat$."
- Joins: the proof of Proposition 5.6 to the last clause of its statement, "and $\Hquat$ at every other point" (l.610).
- Terms defined: **YES.**
- Anything no other sentence says: **NOT SURE.** In substance it says what l.610 says. But the statement says "every other point" (other than the four fixed points of $\iota$), and the sentence speaks of points that neither map leaves in place; that the two are the same needs that one step of $M_{0}$ leaves no point but $P_{1}$ in place, and no line of the paper says so. The nearest is l.1176 "$\det(M_{0}-I)=-1$ (not used in the text)".
  Question: where does the paper say that one step of the drive leaves only $P_{1}$ in place?

### B7. Composed 7, l.670 ("\emph{The algebra at a point.} …")
- Joins: the worked cases of Section 5.5 to Proposition 5.6.
- Terms defined: **YES** ($\Fix$, conj, $\Ad_{w}$; "left in place" from l.610).
- Anything no other sentence says: **YES**, one thing: the example "a point such as $(\tfrac13,0)$ is moved by $\iota$ to $(\tfrac23,0)$ and by $M_{0}$ to $(\tfrac23,\tfrac13)$, is left in place by neither, and carries $\Hquat$". The rest is said elsewhere: for $P_{1}$, l.616; for the assignment "$\C_{j},\C_{i},\C_{k}$", l.1210. It gives $P_{2},P_{3},P_{4}$ as "left in place by $\iota$" with complex lines as their algebras, on the reading of l.618 (A24).

### B8. Composed 8, l.1121
- Joins: M1-W028 (l.1090) to its failure test.
- Terms defined: **NOT SURE**: "held fixed", as A23 (ii).
- Anything no other sentence says: **YES.** "is the one declared input of the theorem" is l.1090. New: "it would fail if a continuous datum of the geometry that this paper does not derive were not held fixed, and the geometry would then not meet clause~(a)."

### B9. Composed 9, l.1125: "the torus $\Ttwo$ as the fibre of $F$ carrying the drive,"
- Joins: the list at l.1123–1127 of what a reader who does not take clause (c) has.
- Terms defined: **YES**, subject to A9 on "the fibre of $F$ carrying the drive".
- Anything no other sentence says: **NO.** l.588 "Under clause~(c) of Definition~\ref{def:minimal} the fibre is therefore the torus."; l.277. The sentence it stands in calls the items "the least admissible values"; the torus is not a value.

### B10. Composed 10, l.772: "If one unit $i$ is selected, its stabiliser is $U(1)$ and the orbit of $i$ is $\mathrm{Sp}(1)/U(1)=\Stwo$."
- Joins: the first and last sentences of Proposition 7.1.
- Terms defined: **NOT SURE**: "is selected" (C-6); "stabiliser" is given at l.782 "The stabiliser of $i$ in $\mathrm{Sp}(1)$ is $\{e^{i\theta}\}$".
- Anything no other sentence says: **NO.** l.782 "The stabiliser of $i$ in $\mathrm{Sp}(1)$ is $\{e^{i\theta}\}$, and $\mathrm{Sp}(1)/U(1)$ is the Hopf quotient $S^{3}\to\Stwo$."; l.228 "If something in the geometry picks out one unit, say $i$". The sentence is conditional and does not say that a unit is selected.

### B11. Composed 11, l.1088: "and the tenth choice,"
- Joins: the readings named in the hypotheses of Theorem 8.1.
- Terms defined: **YES** (l.221).
- Anything no other sentence says: **NO.** l.1083 "Its hypotheses are the six axioms, the readings of Section~\ref{sec:axioms} and the three of Section~\ref{sec:minimal}"; l.221 makes the tenth choice one of Section 2; l.790.

### B12. Composed 12, l.548
- Joins: the hypotheses of Proposition 5.5 (l.546) to its conclusion.
- Terms defined: **NOT SURE.** "a hyperbolic element of $\mathrm{SL}_{2}(\Z)$" has no defining line; the nearest are the title of l.312 "A4 is hyperbolicity" with l.313 "$\lvert t\rvert>2$", and l.336 "hyperbolic trace".
- Anything no other sentence says: **NOT SURE.** "the fibre is the torus": l.588. "$\iota$ is inversion": l.600 "and $\iota$ is inversion". "the drive is a hyperbolic element of $\mathrm{SL}_{2}(\Z)$": no sentence of the proof of the proposition (ll.554–602) says it; it is ll.308, 310, 313 of Section 4, of which l.302 says "nothing in the present section is used there".
  Question: on what does the clause on the drive in the statement of Proposition 5.5 rest, given l.302?

---

## PART C. What the paper says on the points of the brief

### Point 2 (from J7)

**C-2a. That the proof of Theorem 8.1 delivers each datum up to a relabelling of M1-W032.** **CLAIMED in the statement; the proof is SILENT.** The statement, l.1090: "the geometry that satisfies A6 in the sense of Definition~\ref{def:minimal}, the minimal geometry, is unique and is"; "unique" is that of l.287 "A geometry of a given kind is \emph{unique} when any two of that kind are the same." The proof (ll.1102–1116) says what gives each datum and nowhere has "relabelling", "the same" or Definition 3.3. l.1119: "The theorem asserts uniqueness among minimal realisations under the stated readings". Lines in the body that speak datum by datum of what is left unfixed: l.336 "a single object up to relabelling the torus"; l.445 "the orientation is a convention with no invariant content"; l.600 "which is unique \cite{Thurston}; its double cover by the torus is unique"; l.827 "The counts below do not depend on which such complex structure is taken."; l.834 "The four signs are taken up to one overall sign."; l.947 "nothing distinguishes the three but the step at which one starts"; l.1210 "it is a convention and carries no content". None of them names Definition 3.3.
Question: where does the proof show that any two minimal geometries are joined by a relabelling of Definition 3.3?

**C-2b. That the definition applied to the step alone is the count of clause (a).** **SILENT.** Clause (a), l.273: "two steps being counted as the same when a relabelling of the torus that keeps its orientation carries one to the other, and only then"; l.280 "The way of counting drives is part of the clause". Definition 3.3, l.287. No line says that the one, applied to the step, is the other. l.291 ("are therefore other geometries") ties mirror image and running backwards to Definition 3.3 and does not speak of the count.

**C-2c. That the quarter-turn with time run backwards carries every datum of $\Mtwelve$ to itself.** **DECLARED as not shown**, l.291: "For $\Mtwelve$ run backwards, the quarter-turn $S$ of the fibre carries the step, the lengths and the corner signs to themselves, since $SM_{0}S^{-1}=M_{0}^{-1}$; that it carries every datum of $\Mtwelve$ to itself is not shown here." No failure test stands at that line. Other lines: l.702; l.947; and l.481 (quoted at A28 (iv)), which claims more data "carried to themselves … by the reversal of the drive" and gives no ground.

**C-2d. That the mirror image of $\Mtwelve$ is or is not $\Mtwelve$.** **Not claimed either way; DECLARED open, with a failure test.** l.291: "The mirror image of a geometry, and a geometry run backwards, are therefore other geometries, unless a relabelling of Definition~\ref{def:same} carries the one to the other. … Whether the geometry has a symmetry that mirrors the torus is not shown here." l.280: "Neither part is derived from the first five axioms; both are declared here". l.481: "it does not say whether the whole geometry has a symmetry that mirrors the torus. The count would fail if the geometry had such a symmetry, or if a later paper had to count a state and the same state run backwards as one." l.1127: "a reader who allows relabellings that reverse orientation has the drive by clause~(c) alone".

### Point 3 (from J3 and J4)

**C-3a. That the theorem claims existence.** **NOT SURE.** The statement (l.1090) has "is unique and is" followed by the display; neither "exists" nor "there is" is said of the geometry. Other lines: l.122 "the six axioms force a unique geometry"; l.1119 "The theorem asserts uniqueness among minimal realisations under the stated readings; it does not assert that a non-minimal geometry … fails the first five axioms."; l.1161 "The geometry~\eqref{eq:M12} is now a theorem of six axioms". Lines that say $\Mtwelve$ meets an axiom: for A2, l.702 "The geometry therefore satisfies A2."; for the dimension, l.726 "$D=12$ is admissible". No line says in terms that $\Mtwelve$ satisfies A1, A3, A4, A5 or A6.
Question: does "is unique and is" claim that $\Mtwelve$ exists and meets the six axioms, and where is each axiom shown for it?

**C-3b. That the almost-quaternionic structure exists on the whole of $\Mtwelve$.** **DECLARED and not shown**, l.730: "That the structure exists on the whole of $\Mtwelve$, which Theorem~\ref{thm:dim} requires of any geometry satisfying A1--A5, is assumed here and is not shown." Also l.730: "A single such structure on the eight-dimensional internal piece is not constructed here … the grouping is a choice, and that no grouping works is not shown." The paper gives no failure test for it. The statement of Theorem 8.1 does not name it: l.1083 "and one declared input"; l.1090 "which is its one declared input"; l.1121 "the one declared input of the theorem", each said of the continuous data.
Question: is the assumption of l.730 a second declared input of Theorem 8.1?

**C-3c. That nothing else on the fibre is free.** **SILENT**, after a search of the whole file. No line says that the lengths of l.702 are the only ones meeting Definition 2.4, nor that nothing else on the fibre is free. What the paper has is the declared input with its failure test, l.1090 and l.1121; l.273 "$M$ has no modulus"; l.827 "The counts below do not depend on which such complex structure is taken."; l.695 "periods $(L_{\psi},L_{\omega})$".

### Point 4 (from J5)

**C-4a. Clause (c) is used at Theorem 6.1 before any use of clause (b); no line says clause (b) would not select differently.** **SILENT.** The rule of order, l.271. Clause (c) is used at l.572 and l.588 (the fibre), l.708 "under clause~(c) of Definition~\ref{def:minimal} its dimension is twelve" and l.716. The first use of clause (b) in the derivation is l.804 (Proposition 7.3); then ll.825, 978, 1000, 1056, 1070. The paper says that two clauses agree at three places only: the drive, (a) and (c), l.284 and l.334; the time circle, (b) and (c), l.950 "clauses (b) and~(c) of Definition~\ref{def:minimal} select it" and l.978; the base, l.1072 "the dimension that Remark~\ref{rem:split} leaves for it". No line says that clause (b) would not select differently at Theorem 6.1 or at Proposition 5.5. Related: l.726 "$D=16,20,\dots$ are admissible and excluded by least dimension".

**C-4b. M1-W003 says "an involution of $X$" and does not say that it is continuous.** **SILENT at the sentence; said of the fold elsewhere.** l.574: "let $\iota$ be an involution of $X$ that keeps the handedness and has exactly four fixed points, each isolated": no "continuous". The hypotheses of the proposition, l.546 and l.554: "let the fold $\iota$ be a continuous involution of $X$". l.193: "An involution is a symmetry that undoes itself when applied twice, like a reflection." l.574 opens with a new "Let" and does not say that its $\iota$ is that of l.554.

### Point 5 (from J9): how the fibre algebra acts on spinors

**SILENT on how; partly DECLARED.** Definition 2.7, l.214, says only "at the spinor level, on a spinor bundle over $M$". The lines that speak of elements on spinors:
- l.219 "data of the fibre algebra carried by spinors are complex-valued".
- l.627 "but the lift acts on spinors and the reading acts on the algebra, and the identification of the one with the other is a definition rather than a computation. We state it as such." (DECLARED, no failure test).
- l.657 "Which of the two elements the drive is on spinors is settled in Corollary~\ref{cor:timecircle}: it is $-w$."
- l.841 "One fact about spinors is used, in Corollary~\ref{cor:lift}: on the untwisted spinors of the fibre, the functions and the $(0,1)$-forms on $E$, the fold acts by $+1$ and by $-1$ at every corner alike, since $\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$."
- l.930 "the lift of $\iota$ to the spinors of the fibre acts at the four corners by signs whose product is $-1$".
- l.950 "On spinors the drive is then the element $-w$, of cube $+1$, and not $w$, of cube $-1$".
- ll.970–978 "It remains to say which of the two elements $w$ and $-w$ … the drive is on spinors. … The first five axioms allow both. … that every symmetry is given one is a hypothesis of this paragraph." (DECLARED as a hypothesis, no failure test).
- l.984 "An assignment of unit quaternions to the symmetries of the torus is therefore a pair $(s,u)$".
- l.481 "the element of the drive on spinors, as this paper defines them".
No line says how a unit quaternion, or the fibre algebra, acts on a spinor.

### Point 6 (from J6)

**C-6a. That the meaning of "symmetry" in Definition 2.8 is provisional.** **SILENT.** l.225 gives the meaning as part of the definition, with no word of reservation; "provisional" is nowhere in the file. Nearest: l.1127 "The readings are definitions, not results: a reader who takes Definition~\ref{def:orbits} in its fibrewise form, under which the sphere of units exists over each point but is not a factor, will not obtain Propositions~\ref{prop:S2} and~\ref{prop:CP2}"; that is about "realised", not "symmetry". l.228 calls the group "the rotations" (A17 (iv)).

**C-6b. That a unit and a complex direction are the only structures selected.** **SILENT.** l.1068 "Definition~\ref{def:orbits} calls for two factors of the base, $\Stwo$ (Proposition~\ref{prop:S2}) and $\CPtwo$ (Proposition~\ref{prop:CP2})"; l.1070 "Clause~(b) of Definition~\ref{def:minimal} admits no further factor: it would be an object that A1--A5 do not require." No line says that no other structure is selected. Other things the paper fixes on the algebra: the four subalgebras, l.524; conjugation, l.534; $w$ and $\Ad_{w}$, l.610. The paper gives no failure test.

**C-6c. What selects the complex direction.** **SILENT.** l.790 "The geometry records the direction of a complex-valued unit and not the unit … Under Definition~\ref{def:orbits} it is a factor of the base." It does not say what selects a direction, nor that a direction is "a structure selected". For the unit the paper is conditional: l.228 "If something in the geometry picks out one unit, say $i$"; l.772 "If one unit $i$ is selected"; l.804 has "the almost-complex structure of A3's selected unit", and no line says what selects it.

---

## RECALLED (brought from memory, read in none of the three files, and used for no answer above)

1. That the ordinary meaning of "unit group" of an algebra is its group of invertible elements, which is why A14 (ii) notes that the lemma's sentence on the unit group works as a definition.
2. That the length-keeping real-linear maps of $\R^{3}$ form $O(3)$ and that this group also carries any unit to any other; mentioned only to place the question of A17 (iv), not to answer it.
3. That an almost-quaternionic structure on a manifold determines an orientation of it; mentioned only as a possible sense of "the handedness that Definition 2.7 fixes" (A1), which the paper does not state.

## Noticed in passing (one sentence each, not pursued)

1. The assignment of units to corners is not the same at every place: l.620 "$\C_{i}\mapsto\C_{j}\mapsto\C_{k}$ exactly as $P_{2}\to P_{3}\to P_{4}$"; l.670 and l.1210 give $P_{2}=C_{j}$, $P_{3}=C_{i}$, $P_{4}=C_{k}$; and l.1210 calls the convention "The assignment of $j$ and $k$ between $P_{2}$ and $P_{3}$", where its own dictionary puts $j$ and $i$ there.
2. l.388 says "any $A\in\mathrm{SL}_{2}(\Z)$ of trace three is $SM_{0}S^{-1}$ for some $S$" and l.396 "In each case $\det S=1$ and $SAS^{-1}=M_{0}$"; I multiplied out the first instance (l.392) and it meets l.396, so the two lines put the conjugation in opposite directions.
3. Several letters carry two or more meanings: $M$ (the geometry, ll.148, 273, 277; the matrix of the step, l.302); $F$ (the internal piece, l.150; the Fibonacci matrix, ll.308, 418); $S$ (the quarter-turn, l.355; a general conjugator, ll.388–396); $w$ (the warp factor, l.190; the quaternion, l.610; a coordinate, l.825; the subscript of $\times_{w}$ and of $Q_{w}$); $E$ (a twisting line, ll.804, 1037; the covering torus, l.827); $D$ (the dimension, l.712; a divisor, l.830); $L$ (the determinant line, l.804; the length of a step, l.702); $d$ (the flux, l.830; the element of the drive, l.984); $i$ (the quaternion unit; the point of the upper half-plane, l.980).
4. Four entries of the bibliography have no `\cite` in the body: `AtiyahBott` (l.1213), `Franks1970` (l.1215), `FranksNewhouse` (l.1216), `Kawasaki1978` (l.1224); l.1174 still names "Franks" and "Atiyah--Bott" among the classical theorems "named in file headers".
5. l.129 says Section 2 "isolates as numbered definitions the six points", while l.221 makes the choice of l.219 "the seventh of this section", and it is not a numbered definition.
6. Proposition 4.1 (l.313) says "A4 holds for the return map $M$", where Definition 2.9 (l.237) is a condition on a geometry and a flow on $T\times F$; the passage from the map to the flow is the one clause of l.323 "the induced flow on the mapping torus has no fixed points", and "mapping torus" has no defining line.
7. The label of Section 1.2 is `sec:fouraxioms` (l.78) under the heading "The six axioms"; and l.106 says "The fifth axiom differs in kind from the other four", "it is in those terms that the other four are made precise".

No counter-example was looked for, and no judgement is given on whether any statement of the paper is true.
