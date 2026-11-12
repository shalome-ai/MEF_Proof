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

The heading line carries the status: `· active` or `· retired`. The next number is **M1-W010**.

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

### M1-W002 · active
- **Statement (as it will be printed):**
```tex
(c) what is needed is least: one step of the drive of $M$ has the least positive topological entropy; $M$ has the least total dimension; the fibre of $F$ carrying the drive has the least number of handles; the twist of its fibre has the least flux; and its time circle has the least number of steps.
```
- **Rests on:** the sixth axiom, third meaning (canon v6.3 l.253: "The third: what is needed is least."); the PI's ruling that the least number of handles belongs to clause (c) (Decision Log P110). It replaces clause (c) of Definition 3.2 as printed at canon v6.3 l.268, adding the item on handles and changing nothing else.
- **Mark:** DECLARED (a clause of a definition; one of the paper's numbered choices of meaning).
- **Failure test:** a later paper that needs a fibre with more handles than the least; or a case in which the items of clause (c) cannot all be least at once.
- **Confirmed:** Decision Log P110, 12 November 2026.
- **Retires / retired by:** none in this log (it supersedes canon v6.3 l.268 when the new version is built).

### M1-W003 · active
- **Statement (as it will be printed):**
```tex
Let $X$ be a compact connected surface without boundary that carries a handedness, and let $\iota$ be an involution of $X$ that keeps the handedness and has exactly four fixed points, each isolated. Then $X/\iota$ is a compact connected surface without boundary. Take a triangulation of $X/\iota$ having the images of the four fixed points among its vertices: every cell of it is the image of two cells of $X$, except those four vertices, each of which is the image of one. Hence $\chi(X)=2\chi(X/\iota)-4$. Since $\chi(X/\iota)\le2$, with equality only when $X/\iota$ is a sphere, $\chi(X)\le0$: $X$ is not a sphere, and $\chi(X)=0$ exactly when $X/\iota$ is a sphere. A compact connected surface without boundary that carries a handedness and has $\chi=0$ is the torus $\Ttwo$, which has one handle, and every other such surface with $\chi<0$ has more than one. The torus $\Ttwo=\R^{2}/\Z^{2}$ carries such an involution: $z\mapsto-z$ fixes exactly the four points with $2z\in\Z^{2}$. Under clause~(c) of Definition~\ref{def:minimal} the fibre is therefore the torus.
```
- **Rests on:** M1-W002 (clause (c), least number of handles); Definition 2.7 (the handedness of the internal piece, canon v6.3 l.442); the hypothesis "exactly four isolated fixed points" (canon v6.3 ll.501, 516; audit row T4(iii), not part of J2); that the fibre is a surface (audit item J5, not taken here).
- **Mark:** CHECKED by hand: the count $2(V-4)+4-2E+2F=2\chi(X/\iota)-4$; the four fixed points of $z\mapsto-z$. Taken as known and **not read at source** (to be entered in Verified References before the paper prints them): that $X/\iota$ is a surface and has such a triangulation; that a compact connected surface without boundary has $\chi\le2$ with equality only for the sphere; that the orientable ones are classified by the number of handles $g$ with $\chi=2-2g$. The count does not use Bredon's formula (V-21, PARTIAL); it agrees with it (canon v6.3 l.593).
- **Failure test:** a closed surface other than the torus, with no more handles, carrying an involution with exactly four isolated fixed points; or a later paper that needs a fibre with more handles.
- **Confirmed:** Decision Log P110, 12 November 2026.
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
