# Error log B: the check of Pass B (M1 v7.0)

**13 November 2026.** Pass B is `papers/M1/build_v7/passB.tex`, made by `python3 tools/m1_build_v7_0.py B` from `passA.tex` and `edits_B.py` (33 named edits, each matching once: 30 that fix the errors of log A by deleting or copying, with eight composed sentences marked in the text and listed in `COMPOSED.md`, and 3 that change the name of the version). The same script checks and the same `CHECK_BRIEF.md` as for Pass A; a fresh reader again, given `CHECK_BRIEF.md`, `CLAUDE.md`, `passB.tex`, `WRITE_LOG.md` and `RULINGS_LIST.md` and nothing else: not Pass A, not log A, not `COMPOSED.md`. Line numbers are of `passB.tex` and are a help only.

## Part 1. By script and by compiling (kinds 1, 4 undefined references, 5)

| Kind | Check | Result |
|---|---|---|
| 1 | `python3 tools/writelog_check.py M1 papers/M1/build_v7/passB.tex` | "35 active, 8 retired; 0 failing". **No error.** |
| 4 (undefined references) | gate 1 | none. **No error.** |
| 5 | gate 1, XeLaTeX three passes | PASS, 46 pages. **No error.** |

Gate 2 PASS; gate 5 PASS; gate 3 the same two items as canon v6.3. **Recorded, the architect's slip while making the pass, found by looking at the text and corrected by remaking the pass before the reader was launched:** the comment line that ends COMPOSED 3 was at first followed on the same line by the rest of its paragraph, which TeX would then not have printed; the gates did not catch it.

## Part 2. By the fresh reader

The reader's report is copied whole, unedited, in the appendix; its findings are B-1 to B-7. Each was verified against `passB.tex` and against the entry or register item named.

| # | Kind | Offending sentence begins | Architect | In log A? | Introduced by Pass B? |
|---|---|---|---|---|---|
| B-1 | 4 | "…isolates as numbered definitions the six points at which a behavioural word has to be given a mathematical meaning." | **REJECTED**, as A-2 and for the same reason: the numbered definitions of Section 2 that carry a choice are still six | yes, A-2 (rejected there) | no |
| B-2 | 2 | "The symbol $\times_{w}$ records that the product is warped, as the second axiom requires." | verified: M1-W025's "Retires" line says canon l.127 "from 'The symbol $\times_{w}$ records'" is reworded with it, and Corpus Errors 34(b) says the new version "must not read as though they agree"; with M1-W026 the growth of the second axiom is between time and the fibre, and the display's $\times_{w}$ is between the base and the pillowcase | **no.** Reader A reported the sentence after it (A-1, rejected on 34(b)) and filed 34(b) under "register items that fit none of the kinds" | no: the sentence is canon's, unchanged in A and B. **The first check missed it** |
| B-3 | 2 | "If a $\Spinc$ structure selects one unit $i$, its stabiliser is $U(1)$ and the orbit of $i$ is $\mathrm{Sp}(1)/U(1)=\Stwo$." | verified: P92 owes "the rewording of ll.677, 685, 661"; M1-W035 says the rewording of canon l.661 is for the build; Corpus Errors 32(a). No confirmed sentence supplies words for it | **no.** Reader A filed it under "register items that fit none of the kinds" | no: canon's sentence, unchanged. **The first check classed it otherwise, and the architect held it for the end report** |
| B-4 | 2 (in doubt) | "…a reader who does not take clause~(c) has dimension twelve, flux three and three steps as the least admissible values and not as the only ones…" | verified: Corpus Errors 33(e); M1-W010 puts the fibre's dimension and handles under clause (c) | **no.** Reader A filed it under "register items that fit none of the kinds" | no: canon's sentence, unchanged. As B-3 |
| B-5 | 4 (in doubt) | "Among geometries $(T\times\Sigma)\times F$ satisfying A1--A5 under the readings of Definitions~\ref{def:A5}, \ref{def:A1}, \ref{def:A2}(i), \ref{def:levels} and~\ref{def:orbits}…" | not rejected: the theorem's list of readings does not name the tenth choice, on which P92 says Theorem 8.1 rests; HANDOVER_BUILD §5 names "the theorem's list at l.967" among the places that count the choices. It is a list and not a count, and what the hypotheses of the theorem name is not the architect's to settle | **no.** Reader A noted it under "register items that fit none of the kinds" ("it is a list and not a count") | no: canon's words, unchanged. As B-3 |
| B-6 | 2 | "The alternative that compactness excludes is the split algebra $M_{2}(\R)$, which carries the same $\pm1,\pm i,\pm j,\pm k$ pattern…" | **REJECTED.** The "Retires" line of M1-W017 says canon l.471 is "reworded with it" and names no words; no confirmed sentence stands in its place or contradicts it, as the reader says; no word that a ruling removed is in it (33(f) names ll.449, 455, 458, 467) | no (reader A: "register items", no removed word in it) | no |
| B-7 | 2 (3 in doubt) | "\emph{Compact and split corners.} On $\C_{u}=\R\oplus\R u$ the norm is…" to "A1 excludes the second picture at every corner, and with it every zero-divisor." | **REJECTED**, as B-6; and "at every corner" stands after the corners are counted, where the ground of 33(f) is that the word was used before they are counted (reader A judged the same) | no (reader A: "register items") | no |

## Count of log B, and the stop rule

| | Log A | Log B |
|---|---|---|
| Kinds 1, 5, undefined references | 0 | 0 |
| Reader's findings | 29 | 7 |
| Rejected | 2 | 3 |
| **Count** | **27** | **4** |
| Errors of log B that were not in log A | | **4: B-2, B-3, B-4, B-5** |

Every one of the 27 errors of log A is gone from Pass B: the reader's list "Items of the list found already met" names each place, and none of A-3 to A-29 is among its findings.

**The first stop rule fires** (`tools/Paper_assembly_protocol.md`: "If log B has more errors than log A, or an error that was not in log A: stop and tell the PI. The rule is applied as written."). Log B has fewer errors than log A, and it holds four that were not in log A. **None was introduced by Pass B:** each offending sentence is canon v6.3's, unchanged in Pass A and in Pass B. B-2 the first reader missed, reporting the sentence beside it. B-3, B-4 and B-5 the first reader saw and filed under "register items still standing that fit none of the three kinds", and the architect held them there for the end report; the second reader, on the same brief, filed them as errors. **Pass C is not begun.**

## Not errors, and held

The reader's lists B ("Register items still standing that fit none of the three kinds") and D ("Other") are not counted. Its D.12 is right and is already disclosed in `COMPOSED.md`: the second sentence of the statement of Proposition 5.5 is joined from the words of M1-W003 and canon's and carries no COMPOSED mark. Its D.13 concerns two confirmed sentences (M1-W030 keeps "the two orbits are not realised", the words M1-W043 dropped from the row above it); it is for the PI in the end report, a confirmed entry not being changed by the architect.

## Pass C (after the PI's direction, Decision Log P165)

The PI directed Pass C and the fixing of B-3, B-4 and B-5; the PI's words on B-2 open "my musings:" and are returned as a read-back, the sentence being left as canon has it (P165). `passC.tex` is made by `python3 tools/m1_build_v7_0.py C` from `passB.tex` and `edits_C.py` (4 named edits).

**Script checks on Pass C:** gate 8, "35 active, 8 retired; 0 failing"; gate 1 PASS (46 pages, no undefined reference); gates 2, 4, 5 PASS; gate 3 the two items of canon v6.3.

**A fresh reader, item by item** (given `passC.tex` and, to tell a confirmed sentence, the write-up log; the four offending sentences and what was reported of each; no expected answer):

| # | Verdict of the reader | What stands there now |
|---|---|---|
| B-2 | **still there, word for word** | "The symbol $\times_{w}$ records that the product is warped, as the second axiom requires." **Closed at the PI's word (Decision Log P166, "(a)"): the two sentences of canon l.127 stand as canon has them** |
| B-3 | gone; what was reported no longer holds | COMPOSED 10: "If one unit $i$ is selected, its stabiliser is $U(1)$ and the orbit of $i$ is $\mathrm{Sp}(1)/U(1)=\Stwo$." |
| B-4 | changed; what was reported no longer holds | COMPOSED 9 in the list: "the torus $\Ttwo$ as the fibre of $F$ carrying the drive," |
| B-5 | changed; what was reported no longer holds | COMPOSED 11 after the list of definitions: "and the tenth choice," |

The same reader checked the markers: twelve pairs `% COMPOSED n: begin` / `end`, each marker alone on its line, each pair matched, the numbers 1 to 12 once each.

Pass C held one error of log B, B-2, left standing until the PI confirmed the read-back; **the PI confirmed that the sentence stands (P166), so Pass C holds no open error of log B.** Under the protocol Pass C is not read afresh for kinds 2 and 3.

---

## Appendix: the reader's report on Pass B, whole and unedited

**Files read (each whole, from disk):** `papers/M1/build_v7/CHECK_BRIEF.md` (48 lines); `CLAUDE.md` (97 lines); `papers/M1/build_v7/passB.tex` (1158 lines, ll.1–1158); `papers/M1/WRITE_LOG.md` (544 lines); `papers/M1/build_v7/RULINGS_LIST.md` (429 lines). No other file was opened; grep was run on `passB.tex` only. Nothing was edited. Every statement below is READ at the line given; I judged no mathematics.

Line numbers are of `passB.tex`. "List" means `RULINGS_LIST.md`; "index" means its Part 2.

---

## A. Findings (kinds 2, 3, 4)

**1. Kind 4.** (l.129)
> "Section~\ref{sec:axioms} turns the first five sentences into mathematics, at a level intended to be followed by a first-year mathematics graduate, and isolates as numbered definitions the six points at which a behavioural word has to be given a mathematical meaning."

- Measured against: M1-W035 ("It is the tenth choice, which M1-W019 names") and the index ("The places that count the choices: ll.129, 163, 181, 193, 211, 223, 239, 247, 964 … The tenth choice is 'the seventh of Section 2'").
- Reason: the section now records seven choices (the pass itself says at l.221 "the seventh of this section"); "six" was taken out at ll.163, 181, 193, 244 and 1009 but stands here.

**2. Kind 2.** (l.127)
> "The symbol $\times_{w}$ records that the product is warped, as the second axiom requires."

- Measured against: M1-W025, Retires line: "canon l.127, from 'The symbol $\times_{w}$ records', is reworded with it"; Corpus Errors 34(b): "the prose there … and the displays at ll.125 and 969 pair different pieces, and the new version must not read as though they agree"; M1-W026 mark: the growth of the second axiom "sits between time and the fibre torus".
- Reason: the sentence is unchanged from v6.3 and still reads the $\times_{w}$ of the display as the warp the second axiom requires.
- In doubt, same paragraph: "Which of the two pieces is scaled, and by a function on which, is not fixed in this paper: nothing derived here depends on it, and it is fixed where the warp is given its law, with the field equation."
  - 34(b) as amended says this sentence "stands as to K₈".
  - It keeps "by a function on which", where M1-W025 took "a smooth function $w$ on one piece" out of Definition 2.4.
  - It stands beside Proposition `prop:A2` (M1-W026), which gives the rate in this paper.
  - I could not decide whether the Retires line or the amended 34(b) governs it.

**3. Kind 2.** (l.706, statement of Proposition `prop:S2`)
> "If a $\Spinc$ structure selects one unit $i$, its stabiliser is $U(1)$ and the orbit of $i$ is $\mathrm{Sp}(1)/U(1)=\Stwo$."

- Measured against: Corpus Errors 32(a): "Propositions 7.1–7.3 each take a hypothesis from another … Closed by a numbered choice (P92 …); the wording stands in v6.3 until the new version"; index: "ll.661, 677, 681, 685: 'If a Spin^c structure selects one unit' … (M1-W019, M1-W035; P92; 32(a) …)"; M1-W035: "the rewording of canon ll.661, 677, 685 that P92 owes, are for the build".
- Reason: the list names these words as changed by the tenth choice, and they stand unchanged. No confirmed sentence supplies words for this place.

**4. Kind 2 (in doubt: incomplete rather than contradicted).** (l.1045)
> "The three clauses of Definition~\ref{def:minimal} are readings of the sixth axiom and its words do not force them: a reader who does not take clause~(c) has dimension twelve, flux three and three steps as the least admissible values and not as the only ones, and a reader who allows relabellings that reverse orientation has the drive by clause~(c) alone."

- Measured against: Corpus Errors 33(e): "the list of what a reader loses without clause (c) names dimension twelve, flux three and three steps, and not the fibre"; M1-W010: "the fibre of $F$ carrying the drive has the least dimension and, at that dimension, the least number of handles"; index, under "Changed by an entry".
- Reason: clause (c) now carries the fibre (M1-W003 and M1-W013 end "Under clause~(c) …"), and the sentence still lists three things without it.

**5. Kind 4 (in doubt).** (l.1012, the words of the theorem outside the confirmed clause M1-W028)
> "Among geometries $(T\times\Sigma)\times F$ satisfying A1--A5 under the readings of Definitions~\ref{def:A5}, \ref{def:A1}, \ref{def:A2}(i), \ref{def:levels} and~\ref{def:orbits}, with the continuous data of the geometry that this paper does not derive held fixed, which is its one declared input, the geometry that satisfies A6 in the sense of Definition~\ref{def:minimal}, the minimal geometry, is unique and is"

- Measured against: index ("The places that count the choices: … and the theorem's list at l.967"); M1-W035 ("It is the tenth choice"); l.1009 of the pass ("Its hypotheses are the six axioms, the readings of Section~\ref{sec:axioms} …").
- Reason: the five definitions listed cover six of the seven readings of Section 2. The tenth choice (l.219) is in no numbered definition and is not in the list. Whether it should be is not mine to say.

**6. Kind 2 (by a Retires line; which words is not said).** (l.502)
> "The alternative that compactness excludes is the split algebra $M_{2}(\R)$, which carries the same $\pm1,\pm i,\pm j,\pm k$ pattern with non-compact unit groups on two of its three imaginary lines."

- Measured against: M1-W017, Retires line: "canon ll.458, 471 and 546–552 are reworded with it"; index: "ll.453–455, 458, 471, 546–552: … the split quaternions (M1-W017, M1-W015; 33(f))".
- Reason: this is canon l.471 unchanged. The entry says it is reworded and does not say how; I found no confirmed sentence it contradicts.

**7. Kind 2 (same Retires line), with Kind 3 in doubt for "corner".** (ll.581–587, canon ll.546–552, unchanged)
> "\emph{Compact and split corners.} On $\C_{u}=\R\oplus\R u$ the norm is $N(x+yu)=x^{2}-u^{2}y^{2}$."
> "For $u=i$, $N=x^{2}+y^{2}$ and the unit group $N=1$ is the circle $U(1)$."
> "In the split algebra $M_{2}(\R)$, with $j^{2}=+1$, $N=x^{2}-y^{2}$ on $\C_{j}$ and the unit group is the hyperbola $\{x^{2}-y^{2}=1\}$, non-compact; the element $1+j$ has $N=0$ and no inverse."
> "A1 excludes the second picture at every corner, and with it every zero-divisor."

- Measured against: M1-W017 Retires line (as in 6); M1-W015: "this is read as asking that the unit group of $\R\oplus\R u$ be compact for every $u\neq0$ of $\mathcal{A}$ with $u^{*}=-u$" and its Retires line "'the corner fibres included' at ll.458, 467 goes with it"; Corpus Errors 33(f).
- Reason: the entry says these lines are reworded and they are not. "At every corner" in the last sentence is the wording M1-W015 replaced by "every $u\neq0$ … with $u^{*}=-u$".
- Doubt: 33(f) gives as its ground that "corner" was "said before the corners are counted", and this passage stands after they are counted.

---

## B. Register items still standing that fit none of the three kinds

- **33(h); index "l.116 against l.892"** (l.116): "It enters through the drive, as the rate at which the gentlest possible everlasting change stretches what it acts on (Section~\ref{sec:drive})." Against l.935 "the stretch is $\phi^{2}$ … per step". Changed by no ruling. Note: the confirmed M1-W026 also has "eigenvalue $\phi^{2}$" and "$e^{\kappa L}=\phi^{2}$"; if that counts as one thing given two values, this is kind 2.
- **34(i)** (l.163): "The way lengths are measured may tie the pieces together, and the second axiom will insist that it does; and the internal piece may be carried round time by a map of itself, as Section~\ref{sec:drive} finds."
- **32(k), second part** (l.166): "The internal piece of a geometry satisfying the other four axioms is more than a point: Theorem~\ref{thm:dim} shows that it has dimension at least eight."
- **32(l)** (l.380 against l.388): "The theorem asserts that any $A\in\mathrm{SL}_{2}(\Z)$ of trace three is $SM_{0}S^{-1}$ for some $S$." against "In each case $\det S=1$ and $SAS^{-1}=M_{0}$; …".
- **32(i)** (l.562; l.571 acknowledges it): "The points $P_{2},P_{3},P_{4}$ are fixed by $\iota$ and permuted by $M_{0}$; the local form of $\iota$ at such a point is the inner automorphism by the surviving unit, and its fixed subalgebra is the corresponding complex line." The confirmed statement M1-W029 keeps "$\iota$ acting as conjugation".
- **32(j)** (l.564): "The drive carries the lines with the points: $\Ad_{w}$ sends $i\mapsto j\mapsto k\mapsto i$ (certificate \texttt{L2\_Ad\_w\_cycles}, with $(2w)^{3}=-8$ giving order three, \texttt{L2\_w\_cubed}), so $\Ad_{w}\Ad_{i}\Ad_{w}^{-1}=\Ad_{j}$ and $\C_{i}\mapsto\C_{j}\mapsto\C_{k}$ exactly as $P_{2}\to P_{3}\to P_{4}$." Against l.614 (COMPOSED 7) "their algebras are $\C_{j},\C_{i},\C_{k}$" and Appendix B, l.1128.
- **32(n)**, names used for two things:
  - "$F$": the internal piece (l.150) and the Fibonacci matrix (l.304, which is the confirmed M1-W001, and l.410).
  - "$M$": the manifold (l.148) and "an element $M\in\mathrm{SL}_{2}(\Z)$" (l.298).
  - "the time factor": "$T$ is a one-dimensional piece carrying time" (l.150) against "the time factor of a minimal geometry is the Sol torus bundle" (l.331; also ll.55, 888).
  - The torus twice in the display, ll.123–126 (index).
- **34(b), the displays** (ll.125, 1014): the $\times_{w}$ between the base and $\Ttwo/\Ztwo$ stands; the list says its placement is owed by M2.
- **Index "ll.615, 943"** (ll.656, 986): "… the block has dimension four, that of $\Hquat^{\times}=\R_{>0}\times S^{3}$ (Section~\ref{sec:base} fixes $\Sigma$)." and "So $\Sigma=S^{3}=\mathrm{Sp}(1)$, the unit quaternions, and the block is modelled on $\Hquat^{\times}=\R_{>0}\times S^{3}$."
- **Index "l.295"** (l.326): "This is an input and not a selection: $-M$ is $M$ followed by $z\mapsto-z$, …".
- **Index "l.992 … products only"** (l.1045): "… will not obtain Propositions~\ref{prop:S2} and~\ref{prop:CP2}, and the base is then determined among products only."
- **Index "Appendix A and the bibliography"**:
  - l.1092: "Classical theorems (Franks, Frobenius, Thurston, Latimer--MacDuffee, Lawson--Michelsohn, Salamon, Atiyah--Bott) are named in file headers and are never Lean axioms; …".
  - ll.1133–1134: `\bibitem{Franks1970}` and `\bibitem{FranksNewhouse}` remain.
  - By grep, "Franks" occurs in the pass only at ll.1092, 1133, 1134; no `\cite` of either remains.
- **Index "l.681"** (l.726): "The three coordinate lines $[1{:}0{:}0],[0{:}1{:}0],[0{:}0{:}1]$ are the units; the maximal torus of $U(3)$ fixes exactly these, and the Lefschetz count gives $\chi=3$ (\texttt{L4\_chi\_counts})." The index names "the maximal torus of U(3)" among lines changed by M1-W019 and M1-W035. No Part 1 item names it, and M1-W019's mark cites l.681 as READ for the count. I found nothing it contradicts.
- **Index "l.290's entropy"** (l.319): "… $M$ is Anosov, its entropy is $\log\lvert\lambda\rvert>0$, and the induced flow on the mapping torus has no fixed points \cite{KatokHasselblatt}." "Anosov" here is in the proof of Proposition `prop:hyp`; the ruling of 33(b) names Proposition 5.5 only, so I read it as outside the ruling.
- **Index "l.209 … does not say it has a unit"** (ll.209, 496): "By Definition~\ref{def:fibrealg} $\mathcal{A}$ is finite-dimensional and associative." M1-W017 has "with unit $1\neq0$" as a hypothesis.
- **Index "l.161 above all"** (l.161): "The words \emph{step} and \emph{state at rest} are made exact where they are used, in Sections~\ref{sec:drive} and~\ref{sec:base} (Definition~\ref{def:states}), and it is there that the two clauses do their work (Proposition~\ref{prop:twist})." Definition `def:states` now defines "state at rest" (M1-W024) and carries the pillowcase reading (M1-W023); I found no contradiction.
- **35(a)**: "unique" stands at ll.55, 122, 1012 and "uniqueness" at l.1041, now with Definition `def:same` (M1-W032) behind it.
- **34(c)**: the list says "Open". A2 is shown (Proposition `prop:A2`, l.641). That the almost-quaternionic structure exists on the whole shape is printed as "assumed here and is not shown" (M1-W031, l.670), with no failure test in the printed text.
- **Index, elimination table, "the 'Where' columns of rows E8 and E9"** (ll.1062–1063): these columns are inside the confirmed rows M1-W040 and M1-W041 ("the first three columns are copied unchanged"). Not reportable. What was owed there is in a file I was not given.

---

## C. Items of the list found already met

- 32(a), CP² half: "the $\Spinc$ line of Proposition 7.3 below" is gone; M1-W019 at l.722.
- 32(b), 33(k): the sentence naming the two readings is gone; l.1045 ends "is tagged \rigD".
- 32(c), 33(b): "Anosov", "commuting with $\iota$" and the citation of Franks are gone from Proposition `prop:surface`; M1-W013, M1-W003, M1-W008 at ll.536–540.
- 32(d), 33(d): M1-W012 at l.271, M1-W010 at l.277; "the four it names" and "applied after clause (b)" gone (COMPOSED 4, l.282).
- 32(e), 33(i), 33(l): M1-W021 at l.225 ("a factor of the base"); M1-W020 at l.998.
- 32(f), 33(f), for ll.449, 453–455, 458, 467: M1-W017 at l.480; proof is COMPOSED 5; l.489 loses "the corner fibres included"; M1-W015 at l.498.
- 32(g), 34(h), 36(a)–(c): rows at ll.1056, 1057, 1062, 1063 are \rigD; M1-W043 at l.1065; M1-W030 at l.1066; "trace $\geq4$" keeps \rigR at l.1060.
- 32(h); index "ll.300, 409": Theorem `thm:drive` (l.331) and Proposition `prop:onedrive` (l.440) are as canon, with \rigR.
- 32(k), first part; 34(g): "Definition 2.9(iii)", "generic" and "stabiliser" are gone at ll.554, 558, 567 (COMPOSED 6) and 614 (COMPOSED 7). The remaining "stabiliser" (ll.225, 706, 714, 910) is the stabiliser in a group, outside the ruling.
- 32(m), 33(n), 33(o): M1-W024 at l.762; M1-W023 at l.768.
- 32(o), 33(g): M1-W016 at l.214; "Clifford" does not occur.
- 33(a): l.234 loses "typical … of measure zero"; M1-W006 at l.237; l.315 has "contradicting Definition~\ref{def:A4}"; l.319 loses "which have measure zero"; M1-W007 at l.321.
- 33(c): M1-W009, M1-W004, M1-W001, M1-W005 at ll.300–306.
- 33(j): "Hermitian" does not occur; "phase" occurs only in M1-W019.
- 33(m): l.228 ends "of Section~\ref{sec:base}."
- 34(a): M1-W025 at l.190.
- 34(d): M1-W027 at l.267; "functional", "energy", "stationar" do not occur.
- 34(e): the aspect-ratio sentence is gone from l.248; M1-W028 at l.1012; "sector" does not occur; l.1041 loses "does not derive the aspect ratio"; failure sentence is COMPOSED 8.
- 34(f): l.639 ends "the corners are separated by the periods." (but see Other, 6).
- 35(a): Definition `def:same` at l.286.
- 35(b): l.473 loses the clause on time run backwards; M1-W034 at l.291; the mirror point stays with its failure sentence.
- Index, canon l.525: l.558 has the wording of M1-W029.
- Index, row E7: l.1061 reads "non-compact unit groups".
- Index, counts: "six" is gone at ll.163, 181, 193, 244, 1009; ll.211, 228, 256 agree with COMPOSED 2 (l.221) and COMPOSED 3 (l.246).
- Index, "The integer two on S²": M1-W036 at l.755; COMPOSED 1 at l.1018.
- M1-W026 (l.642), M1-W031 (l.669), M1-W035 (l.219), M1-W037 (l.1056), M1-W038 (l.1057), M1-W040 (l.1062), M1-W041 (l.1063): each present.

---

## D. Other (could not decide; one sentence each)

1. **Bare "state".** Outside Definition `def:states`, "state(s)" is used for what M1-W024 now names "state at rest" (ll.771, 774(a), 780, 784, 786, 816, 820, 826, 828, 836, 851, 1102); M1-W024 changed two such uses inside the definition and the list says only that these lines are "read again", so I could not decide whether they are kind 3.
2. **l.771.** "For the canonical $\Spinc$ structure the states at rest are the harmonic spinors of the fibre." says "the fibre" where M1-W024 separates the torus $E$ from the folded fibre; not decided.
3. **l.187.** "… and so $w=w_{0}e^{\kappa s}$" keeps $w_{0}$, which M1-W025 took out of Definition 2.4 ("$w_{0}$ leaves"); I read it as outside the ruling, since 34(a) and M1-W025 name l.190 only and M1-W025 quotes l.187 as its ground.
4. **ll.466 and 1045.** "relabellings that reverse the orientation" is used where Definition `def:same` (M1-W032) makes a relabelling keep the handedness; M1-W032's own mark notes this as "noted … and not acted on", so I did not decide it.
5. **l.473.** "The fold, the corners and their algebras, the corner signs … are each carried to themselves by a mirror of the torus and by the reversal of the drive" stands beside M1-W034 at l.291 ("that it carries every datum of $\Mtwelve$ to itself is not shown here"); whether the two can both be said I could not decide.
6. **l.639.** "In the covering torus with periods $(L_{\psi},L_{\omega})$ any two distinct corners are at distance at least $\tfrac12\min(L_{\psi},L_{\omega})$" still gives the fibre two periods beside the lengths of M1-W026; whether 34(f) reaches these words I could not decide.
7. **l.240.** "The strong form of the drive … is not assumed; Section~\ref{sec:drive} derives it" stands beside M1-W005 ("That the step is the linear one is a choice and is not derived"); not decided.
8. **ll.118, 127, 240, 409–410.** These call the drive "the Fibonacci drive" or "two steps of the Fibonacci recursion", beside M1-W001 ("it reverses the handedness and is not a step"); a use of "step" for two things, not decided.
9. **l.736.** "The structure induced by the almost-complex structure of A3's selected unit" keeps a "selected unit" like that of finding 3; the list does not name this line.
10. **ll.55, 129, 133.** These say each choice is given "in a numbered definition", while the tenth choice (l.219) is a paragraph; whether that is kind 4 I could not decide.
11. **ll.504 and 1096.** "positive-definiteness" and "positive-definite" are said of $N(q)=q\bar q$ on $\Hquat$ for the certificate; 33(f) names the phrase at canon l.455 only, so I read both as outside the ruling.
12. **l.532.** The second sentence of the statement of Proposition `prop:surface` ("Under clause~(c) of Definition~\ref{def:minimal} the fibre is the torus $\Ttwo$, on which $\iota$ is inversion $z\mapsto-z$ and the drive is a hyperbolic element of $\mathrm{SL}_{2}(\Z)$. \rigD") is neither a confirmed sentence nor canon l.501 as the list quotes it, and it carries no COMPOSED mark; it reads as joined from M1-W003's last words and canon's.
13. **Two confirmed sentences, M1-W030 and M1-W043.** M1-W030 (l.1066) prints "the two orbits are not realised" for a row that includes $\CPtwo\times T^{2}$; these are the words M1-W043 dropped from the row above when it retired M1-W042, for the reason given in M1-W042's mark.
14. **l.1032.** The proof line "A3 with Definition~\ref{def:orbits} gives $\Stwo$ and $\CPtwo$ …" names neither the tenth choice (M1-W019) nor the integer two on $\Stwo$ that the statement now lists; not a kind I could assign.
