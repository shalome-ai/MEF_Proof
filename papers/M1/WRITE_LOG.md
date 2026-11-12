# M1 — write-up log

**What this is (CLAUDE.md §10; Decision Log P107).** The mathematics of the paper, one statement to an entry, in the words in which it will be printed. The first draft of the paper is the active entries, verbatim. The Decision Log keeps the PI's words and the process; this log keeps the mathematics. Opened 12 November 2026; it starts with J2 of the audit of Theorem 8.1.

**Rules.**
- An entry is written at the moment the PI confirms a read-back, not afterwards from memory. Before each commit: every item confirmed since the last commit has its entry.
- One statement to an entry, in full, with every hypothesis. Nothing is summarised.
- Before an entry goes in, it is read against every active entry of this log. If it contradicts one, the PI decides which stands, usually the newer. The other is marked **retired**: it is kept and never deleted, and every entry that rests on it is flagged.
- The second pass on the paper adds connecting English and corrects grammar and punctuation. It does not change a logged statement: `python3 tools/writelog_check.py M1 <paper.tex>` checks that every active statement is in the paper word for word (gate 8).

**Format of an entry.**

    ### M1-W001 · active
    - **Statement (as it will be printed):**
    ```tex
    (the statement, in TeX, whole)
    ```
    - **Rests on:** (axiom, clause, earlier entry, verified reference)
    - **Mark:** READ (file, line) / CHECKED (script or hand computation) / DECLARED
    - **Failure test:** (what would show it false)
    - **Confirmed:** Decision Log Pnn, with the date
    - **Retires / retired by:** (entry numbers, or none)

The heading line carries the status: `· active` or `· retired`. The next number is **M1-W017**.

## Entries

### M1-W001 · active
- **Statement (as it will be printed):**
```tex
A step of the drive keeps the handedness that Definition~\ref{def:levels} fixes on the internal piece: as a map of $\Ttwo=\R^{2}/\Z^{2}$ it preserves orientation, and its matrix $M$ has determinant $+1$, so that $M\in\mathrm{SL}_{2}(\Z)$. The Fibonacci matrix $F=\bigl(\begin{smallmatrix}1&1\\1&0\end{smallmatrix}\bigr)$ has determinant $-1$: it reverses the handedness and is not a step. Its square $M_{0}=F^{2}=\bigl(\begin{smallmatrix}2&1\\1&1\end{smallmatrix}\bigr)$ has determinant $(-1)^{2}=+1$ and is the least power of $F$ that is a step.
```
- **Rests on:** Definition 2.7 (`def:levels`; canon v6.3 l.442: "Definition 2.7 fixes a handedness on the internal piece, but it is one of the numbered choices"); the ground stated by the PI that a step of the drive keeps that handedness (Decision Log P109); canon v6.3 l.277 (the step and its matrix) and l.379 ($M_{0}=F^{2}$).
- **Mark:** DECLARED: that a step of the drive keeps the handedness (the PI's ground, P109). CHECKED by hand: $\det F=1\cdot0-1\cdot1=-1$; $F^{2}=\bigl(\begin{smallmatrix}2&1\\1&1\end{smallmatrix}\bigr)$; $\det F^{2}=2\cdot1-1\cdot1=1$; a whole-number matrix acts on $\R^{2}/\Z^{2}$ preserving orientation exactly when its determinant is positive, and an invertible one has determinant $\pm1$. READ: canon v6.3 l.389 names the certificate `L1_Fib_not_SL2` for the determinants and traces (the Lean file not read this session).
- **Failure test:** a geometry meeting Definition 2.7 whose drive reverses the handedness of the fibre.
- **Confirmed:** Decision Log P109, 12 November 2026.
- **Retires / retired by:** none.

### M1-W002 · retired
- **Statement (as it will be printed):**
```tex
(c) what is needed is least: one step of the drive of $M$ has the least positive topological entropy; $M$ has the least total dimension; the fibre of $F$ carrying the drive has the least number of handles; the twist of its fibre has the least flux; and its time circle has the least number of steps.
```
- **Rests on:** the sixth axiom, third meaning (canon v6.3 l.253: "The third: what is needed is least."); the PI's ruling that the least number of handles belongs to clause (c) (Decision Log P110). It replaces clause (c) of Definition 3.2 as printed at canon v6.3 l.268, adding the item on handles and changing nothing else.
- **Mark:** DECLARED (a clause of a definition; one of the paper's numbered choices of meaning).
- **Failure test:** a later paper that needs a fibre with more handles than the least; or a case in which the items of clause (c) cannot all be least at once.
- **Confirmed:** Decision Log P110 (the clause) and P115 (the read-back R1 in words), 12 November 2026.
- **Retires / retired by:** retired by M1-W010 (Decision Log P116, 12 November 2026): clause (c) gains the item on the dimension of the fibre. Kept as the record of clause (c) as it stood after P110. Entries that rest on it: M1-W003, flagged there.

### M1-W003 · active
- **Statement (as it will be printed):**
```tex
Let $X$ be a compact connected surface without boundary that carries a handedness, and let $\iota$ be an involution of $X$ that keeps the handedness and has exactly four fixed points, each isolated. Then $X/\iota$ is a compact connected surface without boundary. Take a triangulation of $X/\iota$ having the images of the four fixed points among its vertices: every cell of it is the image of two cells of $X$, except those four vertices, each of which is the image of one. Hence $\chi(X)=2\chi(X/\iota)-4$. Since $\chi(X/\iota)\le2$, with equality only when $X/\iota$ is a sphere, $\chi(X)\le0$: $X$ is not a sphere, and $\chi(X)=0$ exactly when $X/\iota$ is a sphere. A compact connected surface without boundary that carries a handedness and has $\chi=0$ is the torus $\Ttwo$, which has one handle, and every other such surface with $\chi<0$ has more than one. The torus $\Ttwo=\R^{2}/\Z^{2}$ carries such an involution: $z\mapsto-z$ fixes exactly the four points with $2z\in\Z^{2}$. Under clause~(c) of Definition~\ref{def:minimal} the fibre is therefore the torus.
```
- **Flag (P116):** M1-W002, on which this entry rested, is retired by M1-W010. This entry now rests on M1-W010, which keeps the item on handles ("at that dimension, the least number of handles"), and on M1-W011 for the fibre being a surface. The statement is unchanged.
- **Flag (P118):** M1-W011 is retired by M1-W013. For the fibre being a surface this entry now rests on M1-W013. The statement is unchanged. Noted by the fresh reader and not acted on: this statement says "an involution of $X$" and does not say that it is continuous.
- **Rests on:** M1-W010 (clause (c), least number of handles; formerly M1-W002); Definition 2.7 (the handedness of the internal piece, canon v6.3 l.442); the hypothesis "exactly four isolated fixed points" (canon v6.3 ll.501, 516; audit row T4(iii), not part of J2); that the fibre is a surface (M1-W013, formerly M1-W011; when this entry was written, audit item J5, not then taken).
- **Mark:** CHECKED by hand: the count $2(V-4)+4-2E+2F=2\chi(X/\iota)-4$; the four fixed points of $z\mapsto-z$. Taken as known and **not read at source** (to be entered in Verified References before the paper prints them): that $X/\iota$ is a surface and has such a triangulation; that a compact connected surface without boundary has $\chi\le2$ with equality only for the sphere; that the orientable ones are classified by the number of handles $g$ with $\chi=2-2g$. The count does not use Bredon's formula (V-21, PARTIAL); it agrees with it (canon v6.3 l.593).
- **Failure test:** a closed surface other than the torus, with no more handles, carrying an involution with exactly four isolated fixed points; or a later paper that needs a fibre with more handles.
- **Confirmed:** Decision Log P110 (the clause) and P115 (the read-back R1 in words), 12 November 2026.
- **Retires / retired by:** none in this log (with it the hypothesis "Anosov" and the citation of Franks leave Proposition 5.5, canon v6.3 ll.501, 505, 513, when the new version is built).

### M1-W004 · active
- **Statement (as it will be printed):**
```tex
The flow of Definition~\ref{def:A4} moves the fibre of $F$ that carries the drive and nothing else of the internal piece: on the rest of $F$ it is the identity. No axiom asks the drive to move more. This is a choice and is not derived.
```
- **Rests on:** Definition 2.9 (canon v6.3 l.232); canon v6.3 l.277 ("the fibre of $F$ carrying the drive"); the PI's ruling (Decision Log P111).
- **Mark:** DECLARED. Two things are not in this entry and are not claimed by it: (1) that the choice is minimal under Definition 3.2 (R3 as confirmed says "taken because it is the least"; P111 records that the architect did not confirm this and that its ground in Definition 3.2 is open); (2) that Definition 2.9, as M1-W006 has it, is met by such a flow: this is Proposition 4.1 (canon v6.3 ll.280–290), whose entropy rests on V-23, not read.
- **Failure test:** an axiom or a later paper that needs the drive to move a point of the internal piece outside the fibre that carries it. (P111 has it as confirmed: "an axiom or a later paper that needs the drive to move a point of ℂP² × S²". The wording here is the architect's, made so as not to name the base where the paper has not yet derived it.)
- **Confirmed:** Decision Log P111, 12 November 2026.
- **Retires / retired by:** none.

### M1-W005 · active
- **Statement (as it will be printed):**
```tex
The step of the drive is taken to be the linear map of its matrix: for $M\in\mathrm{SL}_{2}(\Z)$ it is the map $x\mapsto Mx \bmod \Z^{2}$ of $\Ttwo=\R^{2}/\Z^{2}$. Definition~\ref{def:A4} asks only for a smooth flow. That the step is the linear one is a choice and is not derived.
```
- **Rests on:** Definition 2.9 (canon v6.3 l.232); canon v6.3 l.277; M1-W001 (the determinant); the PI's ruling (Decision Log P112).
- **Mark:** DECLARED. (Corrected before commit, the architect's error: the statement as first entered also said "and maps of the torus that are not linear move its loops by the same matrix", which is RECALLED and unread; the clause is removed.)
- **Failure test:** an axiom or a later paper that needs a step of the drive which no relabelling of the torus carries to the linear map of its matrix.
- **Confirmed:** Decision Log P112, 12 November 2026.
- **Retires / retired by:** none.

### M1-W006 · active
- **Statement (as it will be printed):**
```tex
A geometry satisfies A4 if $T\times F$ carries a smooth flow $\varphi_{t}$ with no fixed points and positive topological entropy.
```
- **Rests on:** the fourth axiom (canon v6.3 l.95: "The universe is in constant change; it never stands still."); the PI's ruling that M1 does not speak of measure (Decision Log P113). It replaces Definition 2.9 as printed at canon v6.3 l.232, removing "and a set of periodic points of measure zero" and changing nothing else. With it: canon l.229 loses "typical" and "of measure zero"; l.286 "contradicting two clauses of Definition 2.9" becomes "contradicting Definition 2.9"; l.290 loses "which have measure zero".
- **Mark:** DECLARED (a definition; one of the paper's numbered choices of meaning). READ: canon v6.3 ll.286, 288 exclude $\lvert t\rvert<2$ and $\lvert t\rvert=2$ by vanishing entropy, so Proposition 4.1 does not use the clause removed.
- **Failure test:** a result of M1 whose proof uses the measure clause of Definition 2.9.
- **Confirmed:** Decision Log P113, 12 November 2026.
- **Retires / retired by:** none in this log (it supersedes canon v6.3 l.232 when the new version is built).

### M1-W007 · active
- **Statement (as it will be printed):**
```tex
Let $M\in\mathrm{SL}_{2}(\Z)$ have trace $t$ with $\lvert t\rvert>2$. A point of $\Ttwo=\R^{2}/\Z^{2}$ is carried back to itself by some number $n\ge1$ of steps of $M$ if and only if both its coordinates are rational. No other point of the torus ever returns.
```
- **Rests on:** M1-W005 (the step is the linear map of its matrix); M1-W001 (the determinant).
- **Mark:** CHECKED by hand in full: `STEP_AUDIT.md` §11.11, hand proof (ii). It replaces the citation of Katok–Hasselblatt for the periodic points at canon v6.3 l.290 (V-23, not read); the entropy $\log\lvert\lambda\rvert$ in the same line stays on that unread source and is not part of this entry.
- **Failure test:** a point of the torus with an irrational coordinate that a hyperbolic $M\in\mathrm{SL}_{2}(\Z)$ returns to itself; or a rational point that never returns.
- **Confirmed:** Decision Log P113, 12 November 2026.
- **Retires / retired by:** none.

### M1-W008 · active
- **Statement (as it will be printed):**
```tex
The drive is a map of the folded fibre $\Ttwo/\iota$. A one-to-one continuous map $f$ of $\Ttwo$ that gives a map of $\Ttwo/\iota$ carries each pair $\{x,\iota x\}$ to such a pair, so that $f(\iota x)$ is $f(x)$ or $\iota f(x)$. Where $\iota x\neq x$ it is not $f(x)$, since $f$ is one-to-one, and so $f(\iota x)=\iota f(x)$. The fixed points of $\iota$ are isolated, and by continuity $f\iota=\iota f$ on the whole of $\Ttwo$: the drive commutes with the fold.
```
- **Rests on:** canon v6.3 l.127 ("the fibre, folded in half by the growth-and-decay exchange, is a pillowcase"), l.187 (the symmetry that swaps $\kappa$ for $-\kappa$), l.295 ("are the same map of the folded fibre"); the hypothesis that the fixed points of $\iota$ are isolated (canon v6.3 ll.501, 516).
- **Mark:** READ (the lines above) for "the drive is a map of the folded fibre"; CHECKED by hand in full for the step from there to $f\iota=\iota f$ (the statement is the computation).
- **Failure test:** a line of M1 or a later paper under which the drive is a map of the unfolded torus that does not carry folded pairs to folded pairs.
- **Confirmed:** Decision Log P114, 12 November 2026.
- **Retires / retired by:** none (with it "commuting with $\iota$" is no longer a hypothesis of Proposition 5.5, canon v6.3 l.501).

### M1-W009 · active
- **Statement (as it will be printed):**
```tex
Time is a circle, and the internal piece is carried round it by a map of itself. That map is a whole number of applications of one map, the step of the drive; how many is settled by Corollary~\ref{cor:timecircle}.
```
- **Rests on:** canon v6.3 l.175 ("Time, in particular, is a circle: there is no first moment and no last."); l.163 ("the internal piece may be carried round time by a map of itself, as Section 4 finds"); l.235 ("the drive is what time does to the internal piece as it goes round"); l.277 ("One application of this map is a step of the drive. Whether one circuit of the time circle is one step or several is not assumed in this section; Corollary~\ref{cor:timecircle} settles it."); l.845 ("once round $T$ the fibre is glued to itself by a power of the drive, the number of steps in $T$"). M1-W004 for what the map does to the rest of the internal piece.
- **Mark:** READ (the lines above).
- **Failure test:** a line of M1 or a later paper under which the internal piece is carried round time by maps that are not powers of one map.
- **Confirmed:** Decision Log P114, 12 November 2026.
- **Retires / retired by:** none.

### M1-W010 · active
- **Statement (as it will be printed):**
```tex
(c) what is needed is least: one step of the drive of $M$ has the least positive topological entropy; $M$ has the least total dimension; the fibre of $F$ carrying the drive has the least dimension and, at that dimension, the least number of handles; the twist of its fibre has the least flux; and its time circle has the least number of steps.
```
- **Rests on:** the sixth axiom, third meaning (canon v6.3 l.253: "The third: what is needed is least."); the PI's ruling that the least dimension of the fibre is an item of clause (c) of its own, and not a consequence of the least total dimension (Decision Log P116); the PI's ruling on handles (P110), carried from M1-W002. It replaces clause (c) of Definition 3.2 as printed at canon v6.3 l.268, adding the two items on the fibre and changing nothing else.
- **Mark:** DECLARED (a clause of a definition; one of the paper's numbered choices of meaning).
- **Failure test:** a later paper that needs a fibre of more than two dimensions, or needs the fibre's dimension to follow from the total; a later paper that needs a fibre with more handles than the least (carried from M1-W002); or a case in which the items of clause (c) cannot all be least at once.
- **Confirmed:** Decision Log P116, 12 November 2026.
- **Retires / retired by:** retires M1-W002 (it supersedes canon v6.3 l.268 when the new version is built; with it "the fewest dimensions" and "the quantities to which it applies are the four it names" at canon l.271 are reworded).

### M1-W011 · retired
- **Statement (as it will be printed):**
```tex
Let the fibre $X$ of $F$ carrying the drive be compact, connected and without boundary, and let the fold $\iota$ be an involution of $X$ with exactly four fixed points, each isolated. If $X$ is a point, $\iota$ has one fixed point. If $X$ is a circle and $\iota$ fixes a point $p$, then $\iota$ maps the open arc $X\setminus\{p\}$ to itself; if it is increasing there it is the identity, since $\iota(x)>x$ would give $x=\iota(\iota(x))>\iota(x)$, and its fixed points are not isolated; if it is decreasing it fixes exactly one point of the arc; so $\iota$ has no fixed point or exactly two. No such $X$ has dimension less than two, and the torus $\Ttwo$ with $z\mapsto-z$ is one of dimension two. Under clause~(c) of Definition~\ref{def:minimal} the fibre is a surface.
```
- **Rests on:** M1-W010 (clause (c), least dimension of the fibre); the hypothesis of the statement that the fibre $X$ is compact, connected and without boundary (canon v6.3 l.178 says this of $T$, $\Sigma$ and $F$, and l.501 says "compact and connected" of $X$; that the fibre of $F$ is without boundary is said of $X$ in no line of canon and is a hypothesis here, not a citation); the hypothesis "exactly four isolated fixed points" (canon v6.3 ll.501, 516; audit row T4(iii), not part of J5); for the torus, the four fixed points of $z\mapsto-z$ (canon v6.3 ll.511, 572).
- **Mark:** CHECKED by hand in full (the statement is the computation): a point; the circle, by the open arc. In the circle argument two steps are used as evident and are part of the hand check: a one-to-one continuous map of an open arc onto itself is increasing or decreasing; a decreasing one fixes exactly one point (the difference $\iota(x)-x$ is decreasing and changes sign). Taken as known and **not read at source** (to be entered in Verified References before the paper prints it): that a compact connected one-dimensional manifold without boundary is a circle. **Found by a fresh reader after the PI confirmed the statement, and not yet corrected in it (the architect's wording was incomplete; a corrected statement is put to the PI and, if confirmed, is a new entry that retires this one):** the statement uses and does not state that $\iota$ is continuous and that $X$ is a manifold (a connected one of dimension zero being a point); in the increasing case it writes only $\iota(x)>x$, the case $\iota(x)<x$ being the same step mirrored; and "no fixed point or exactly two" leaves out the identity, which is excluded because its fixed points are not isolated. The reader found each written step correct.
- **Failure test:** a compact connected piece without boundary, of dimension less than two, carrying an involution with exactly four isolated fixed points; or a later paper that needs a fibre of more than two dimensions.
- **Confirmed:** Decision Log P116, 12 November 2026.
- **Retires / retired by:** retired by M1-W013 (Decision Log P118, 12 November 2026), which states the hypotheses and the two half-steps this statement left unstated; the argument and the conclusion are unchanged. Kept as the record of the statement the PI confirmed in P116. Entries that rest on it: M1-W003, flagged there. (When this entry was written: none; with it the sentence of canon v6.3 l.513 that begins "Clause~(c) of Definition~\ref{def:minimal} selects the least dimension;" is replaced when the new version is built).

### M1-W012 · active
- **Statement (as it will be printed):**
```tex
A geometry satisfying A1--A5 satisfies A6, and is called \emph{minimal}, if it is selected by the following three clauses. Each is applied wherever the derivation reaches a datum of which it speaks. Where two clauses would select differently, clause~(a) prevails over clause~(b), and clause~(b) over clause~(c).
```
- **Rests on:** the PI's ruling that "applied in order" is an order of priority (Decision Log P117); canon v6.3 l.271 ("it is applied after clause (b), so that it does not replace a structure that needs no further object by one with a smaller integer"), which is the paper's own reason for clause (b) before clause (c). It replaces the opening sentence of Definition 3.2 as printed at canon v6.3 l.262 and changes none of the three clauses.
- **Mark:** DECLARED (the opening of a definition). READ, for the places at which the paper says that two clauses select alike: canon v6.3 l.271 ("On the drive clause (a) makes the selection, and clause (c) agrees with it"), l.440 ("In every one of the four counts the least trace with a single drive is three"), l.865 ("Clause (b) makes the same selection when every symmetry of the torus, and not only the fold and the drive, is given an element; that every symmetry is given one is a hypothesis of this paragraph"). Not in this entry and not claimed by it: that at Theorem 6.1, where clause (c) is used before any use of clause (b), clause (b) would not select differently; no line of canon says so, and the point is carried to J3 (P117). The paper gives no reason for clause (a) before clause (b), and no place where the two meet was found.
- **Failure test:** a place in M1 or in a later paper where two clauses select differently and the lower one was followed.
- **Confirmed:** Decision Log P117, 12 November 2026.
- **Retires / retired by:** none in this log (it supersedes canon v6.3 l.262 when the new version is built; "it is applied after clause (b)" at l.271 is reworded with it).

### M1-W013 · active
- **Statement (as it will be printed):**
```tex
Let the fibre $X$ of $F$ carrying the drive be a compact connected manifold without boundary, and let the fold $\iota$ be a continuous involution of $X$ with exactly four fixed points, each isolated. If $X$ has dimension zero it is a point, and $\iota$ has one fixed point. If $X$ has dimension one it is a circle. Suppose $\iota$ fixes a point $p$ of it. Then $\iota$ maps the open arc $X\setminus\{p\}$ to itself, one-to-one and continuously, and so is increasing or decreasing there. If it is increasing it is the identity, since $\iota(x)>x$ would give $x=\iota(\iota(x))>\iota(x)$ and $\iota(x)<x$ would give $x=\iota(\iota(x))<\iota(x)$; its fixed points are then not isolated, which the hypothesis excludes. If it is decreasing it fixes exactly one point of the arc, and $\iota$ has exactly two fixed points. So $\iota$ has no fixed point or exactly two, and not four. No such $X$ has dimension less than two, and the torus $\Ttwo$ with $z\mapsto-z$ is one of dimension two. Under clause~(c) of Definition~\ref{def:minimal} the fibre is a surface.
```
- **Rests on:** M1-W010 (clause (c), least dimension of the fibre); the hypotheses of the statement that the fibre $X$ is a compact connected manifold without boundary and that the fold $\iota$ is continuous (canon v6.3 l.178 says "compact, connected and without boundary" of $T$, $\Sigma$ and $F$, and l.501 says "compact and connected" of $X$; that the fibre is a manifold without boundary and the fold continuous are hypotheses here, not citations); the hypothesis "exactly four isolated fixed points" (canon v6.3 ll.501, 516; audit row T4(iii), not part of J5); for the torus, the four fixed points of $z\mapsto-z$ (canon v6.3 ll.511, 572).
- **Mark:** CHECKED by hand in full (the statement is the computation): dimension zero; dimension one, by the open arc. Two steps are used as evident and are part of the hand check: a one-to-one continuous map of an open arc to itself is increasing or decreasing; a decreasing one that maps the arc onto itself fixes exactly one point (the difference $\iota(x)-x$ is decreasing and changes sign). Taken as known and **not read at source** (to be entered in Verified References before the paper prints them): that a compact connected one-dimensional manifold without boundary is a circle; that a connected manifold of dimension zero is a point. The statement is that of M1-W011 with what the fresh reader found unstated written in (continuity; manifold; the case $\iota(x)<x$; the identity excluded by the hypothesis); the argument and the conclusion are those of M1-W011. This entry was not itself checked by a fresh reader.
- **Failure test:** a compact connected manifold without boundary, of dimension less than two, carrying a continuous involution with exactly four isolated fixed points; or a later paper that needs a fibre of more than two dimensions.
- **Confirmed:** Decision Log P118, 12 November 2026.
- **Retires / retired by:** retires M1-W011 (with it the sentence of canon v6.3 l.513 that begins "Clause~(c) of Definition~\ref{def:minimal} selects the least dimension;" is replaced when the new version is built).

### M1-W014 · active
- **Statement (as it will be printed):**
```tex
Let $\mathcal{A}$ be an associative real algebra with unit, and let $\iota$ act on it as an anti-involution $a\mapsto a^{*}$ (the algebraic image of exchanging growth and decay: composition run backwards) whose fixed elements are exactly the real multiples of $1$. Then every $a\in\mathcal{A}$ is $x+u$ with $x$ real and $u^{*}=-u$; for every such $u$ the square $u^{2}$ is real; and $N(a)=aa^{*}=a^{*}a=x^{2}-u^{2}$ is real. Moreover $N(a)>0$ for every $a\neq0$ if and only if, for every $u\neq0$ with $u^{*}=-u$, the unit group $\{x+yu:\,x^{2}-u^{2}y^{2}=1\}$ of $\R\oplus\R u$ is compact.
```
- **Rests on:** the PI's rulings that the flip leaves the ordinary numbers alone and reverses every other direction of the algebra (R7) and that closure is asked of every reversed direction, no table being assumed (R8-(i)) (Decision Log P119); canon v6.3 l.193 ("on the algebra of the next axiom, the operation of conjugation"), l.489 ("Let $\iota$ act on $\Hquat$ as conjugation $q\mapsto\bar q$"), ll.546–550 (the worked case, which computes $N(x+yu)=x^{2}-u^{2}y^{2}$ on every line). It replaces Lemma 5.1 as printed at canon v6.3 l.449; its tag is \rigR. The hypothesis that $\mathcal{A}$ has a unit is written in here; canon l.209 says "finite-dimensional" and "associative" and does not say it.
- **Mark:** CHECKED by hand in full: with $x=(a+a^{*})/2$ and $u=(a-a^{*})/2$, $x^{*}=x$, so $x$ is real, and $u^{*}=-u$; $(u^{2})^{*}=u^{*}u^{*}=(-u)(-u)=u^{2}$, so $u^{2}$ is fixed and therefore real; $x$ is real and commutes with $u$, so $aa^{*}=(x+u)(x-u)=x^{2}-u^{2}$ and $a^{*}a=(x-u)(x+u)=x^{2}-u^{2}$; the set $x^{2}-u^{2}y^{2}=1$ in the plane of $(x,y)$ is an ellipse if $u^{2}<0$, the two lines $x=\pm1$ if $u^{2}=0$ and a hyperbola if $u^{2}>0$, so it is compact exactly when $u^{2}<0$; if $u^{2}<0$ for every $u\neq0$ with $u^{*}=-u$ then $N(a)=x^{2}-u^{2}>0$ unless $x=0$ and $u=0$; conversely $N(u)=-u^{2}>0$ gives $u^{2}<0$. DECLARED: that $\iota$ acts on the fibre algebra as such an anti-involution (the reading of canon l.449's parenthesis; audit row T4(i); its numbering is J10 and is not taken here). **Found by a fresh reader after the PI confirmed the statement, and not corrected in it (the architect's wording was incomplete; a corrected statement is put to the PI and, if confirmed, is a new entry that retires this one):** the statement uses and does not state that $a\mapsto a^{*}$ is real-linear (the hand check takes $(a\pm a^{*})/2$ and $a^{*}=x^{*}+u^{*}$), "anti-involution" being defined neither here nor in canon; smaller, that $1\neq0$, so that the real numbers sit in $\mathcal{A}$; that for $u\neq0$ with $u^{*}=-u$ the elements $1$ and $u$ are independent (if $u=r\cdot1$ then $u^{*}=u$, so $u=-u=0$), so that $x+yu$ is a plane with coordinates $(x,y)$; and that "compact" is said of the unit group as a subset of that plane. The reader found each written step correct.
- **Failure test:** an associative real algebra with unit and an anti-involution fixing exactly the real multiples of $1$ in which some $u^{2}$, $u^{*}=-u$, is not real, or in which $N>0$ fails although every such unit group is compact; a later paper that needs the flip to leave some direction other than the ordinary numbers unchanged.
- **Confirmed:** Decision Log P119 (R7 in the PI's words; R8-(i) taken by the architect from the PI's choice "Q2 becomes (i) not (ii)") and P121 (the wording, word for word), 12 November 2026.
- **Retires / retired by:** none in this log (it supersedes canon v6.3 l.449 and its proof, ll.453–455, when the new version is built; canon ll.458, 471 and 546–552, which speak of "corners" and of the split quaternions, are reworded with it).

### M1-W015 · active
- **Statement (as it will be printed):**
```tex
A1 requires every factor to close, and this is read as asking that the unit group of $\R\oplus\R u$ be compact for every $u\neq0$ of $\mathcal{A}$ with $u^{*}=-u$. By Lemma~\ref{lem:norm}, $N(a)>0$ for every $a\neq0$, and $a\cdot a^{*}/N(a)=a^{*}/N(a)\cdot a=1$: every non-zero element of $\mathcal{A}$ has an inverse, and $\mathcal{A}$ is a division algebra.
```
- **Rests on:** M1-W014; Definition 2.3 (canon v6.3 l.178: "$T$, $\Sigma$ and $F$ are compact, connected and without boundary"); the PI's ruling that closure is asked of every reversed direction (R8-(i), Decision Log P119). It replaces the sentence of the proof of Proposition 5.2 at canon v6.3 l.467. The statement of Proposition 5.2 (l.461) and the step by Frobenius (l.469; Verified References V-15, READ per `STEP_AUDIT.md` l.283) are unchanged.
- **Mark:** DECLARED: that A1's closure of the pieces is read as compactness of the unit group of every such line (audit row T4(ii); its numbering is J10 and is not taken here). CHECKED by hand: $a\cdot a^{*}/N(a)=N(a)/N(a)=1$ and $a^{*}/N(a)\cdot a=N(a)/N(a)=1$, $N(a)=aa^{*}=a^{*}a$ being a real number by M1-W014. Noted by the fresh reader and not acted on: the sentence uses $*$ and $N$ without saying that they are those of the anti-involution of A2 (canon l.467 has "the norm form of A2's anti-involution").
- **Failure test:** a reversed direction of the fibre algebra whose line the closure of A1 does not reach; a later paper that needs a fibre algebra with a non-zero element that has no inverse.
- **Confirmed:** Decision Log P119 (R8-(i), taken by the architect from the PI's choice "Q2 becomes (i) not (ii)") and P121 (the wording, word for word), 12 November 2026.
- **Retires / retired by:** none in this log (it supersedes canon v6.3 l.467 when the new version is built; "the corner fibres included" at ll.458, 467 goes with it).

### M1-W016 · active
- **Statement (as it will be printed):**
```tex
The fibre algebra acts on the geometry at two levels: at the spinor level, on a spinor bundle over $M$; and at the tangent level, as an almost-quaternionic structure on $M$, a rank-three subbundle of $\operatorname{End}(TM)$ locally spanned by anticommuting almost-complex structures $I,J,K$ with $IJ=K$ (the local form of the coefficient bundle of \cite{Salamon1982}), whose restriction to $F$ carries the full algebra.
```
- **Rests on:** the third axiom as read at canon v6.3 l.211 ("the non-commutative algebra is the algebra of the shape's own tangent directions and spinors"); the PI's ruling that the phrase "as the algebra generated by the Clifford action" is removed (Decision Log P120). It replaces Definition 2.7 as printed at canon v6.3 l.214, removing those words and changing nothing else.
- **Mark:** DECLARED (a definition; the fifth numbered choice of the paper). READ: the phrase removed occurs once in canon v6.3, at l.214; the spinor half of the definition is used at l.693 ("Under Definition 2.7 a spinor bundle exists on $M$") and canon speaks of elements acting on spinors at ll.536, 566, 728, 837 (l.536 calls the identification of the lift on spinors with the reading on the algebra "a definition rather than a computation"; l.865 states as a hypothesis "that every symmetry is given one"; ll.566 and 728 state no hypothesis); the tangent half at ll.442, 607, 611, 619. Not in this entry and not claimed by it: how the fibre algebra acts on spinors, or that the quaternion relations hold there (`COMMUTANT_LEAD.md` §4: through the Clifford action, on one tangent space, they do not; CHECKED). The tenth choice (P92: the spinor bundle is the complex spinor bundle) is not written into this entry; it has no entry yet.
- **Failure test:** a result of M1 whose proof uses the removed phrase; a later paper that needs the fibre algebra to be the algebra the Clifford action generates.
- **Confirmed:** Decision Log P120 and P121 (the wording), 12 November 2026.
- **Retires / retired by:** none in this log (it supersedes canon v6.3 l.214 when the new version is built).
