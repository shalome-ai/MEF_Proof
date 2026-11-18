# M2 — write-up log

**What this is (CLAUDE.md §10).** The mathematics of the paper, one statement to an entry, in the words in which it will be printed. The paper is assembled from the active entries, word for word, by `tools/Paper_assembly_protocol.md`. The Decision Log keeps the PI's words and the process; this log keeps the mathematics. Opened 18 November 2026 (Decision Log P183), with no entry.

**Rules.**
- Every sentence that states mathematics is an entry: each definition, each statement, and each step of a proof. Nothing mathematical is written for the first time when the paper is assembled; where that cannot be avoided, the sentence is a composed sentence of the assembly protocol, marked as such and shown to the PI.
- An entry is written at the moment the PI confirms a read-back, not afterwards from memory. A step of a proof that is CHECKED or READ and brings in no new reading is entered at the moment it is checked, its "Confirmed" line saying that it was checked and not read back, and the PI is told in plain English what was entered; where it is in doubt whether a step brings in a reading, it is read back. Before each commit: every item confirmed or checked since the last commit has its entry.
- One statement to an entry, in full, with every hypothesis. Nothing is summarised.
- A printed statement says no more than was checked. Whatever an entry's mark says is not shown, or not claimed, goes into the read-back, before the PI confirms.
- Before an entry goes in, it is read against every active entry of this log. If it contradicts one, the PI decides which stands, usually the newer. The other is marked **retired**: it is kept and never deleted, and every entry that rests on it is flagged.
- A term is defined at its first use. The entry that defines it is copied at once into `papers/M2/GLOSSARY.md` and into M2's section of the Definitions Register.
- No pass of the assembly protocol changes a logged statement: `python3 tools/writelog_check.py M2 <paper.tex>` checks that every active statement is in the paper word for word (gate 8).

**Format of an entry.**

    ### M2-W001 · active
    - **Statement (as it will be printed):**
    ```tex
    (the statement, in TeX, whole)
    ```
    - **Place:** `<section key> <number>` (see "The Place line" below), then, after a semicolon, in words what it follows or replaces
    - **Step:** (the work package of `papers/M2/DAG.md` that produced it)
    - **Rests on:** (axiom, clause, result of M1 v7.3 by printed number and label, earlier entry, verified reference)
    - **Mark:** READ (file, line) / CHECKED (a script in `papers/M2/checks/`, a Lean certificate, or a hand computation in full) / DECLARED (a reading or a choice, said as such)
    - **Tag:** [R] / [D] / [M] / [G], where the entry is a statement that carries one
    - **Failure test:** (what would show it false)
    - **Confirmed:** Decision Log Pnn, with the date; or "checked, not read back", with the date
    - **Retires / retired by:** (entry numbers, or none)

The heading line carries the status: `· active` or `· retired`. The next number is **M2-W020**.

**The Place line** *(proposed by the architect, 18 November 2026; one of the two points the assembly protocol leaves to be settled; confirmed by the PI, 18 November 2026, Decision Log P187).* The line begins with a section key and a number, for example `states 030`. The section keys, in the order of the paper, are: `front` (the title and the abstract), `intro`, `m1`, `states`, `conditions`, `minimal`, `warp`, `supply`, `select`, `theorem`, `checks`, `outlook`, `ack` (the acknowledgements), `lean`, `glossary`, `bib` (the bibliography). Within a section the entries are printed in the order of their numbers. Numbers are given in tens, so that an entry agreed later can be placed between two earlier ones without renumbering. Pass A is made by a script that sorts the active entries by section key, in the order above, and then by number. A retired entry keeps its Place line. A change to the list of section keys is presentation and is made here, at the head of this log, and nowhere else.

**The text that is not mathematics** *(proposed by the architect, 18 November 2026; the second of the two points; confirmed by the PI, 18 November 2026, Decision Log P187).* The title, the abstract, the headings, the plain-English openings that `tools/PAPER_FORMAT.md` asks for, and the linking sentences are kept in `papers/M2/PLAIN_TEXT.md`, one piece to an item, each with a Place line of the same form, so that the same script puts them in. They are written by the architect in package N1 of the DAG, after the mathematics is logged. A piece of that file states no mathematics and makes no claim of its own: where a plain-English opening says what a result is, it says it by pointing to the entry, and if it has to state mathematics, that sentence is first made an entry of this log and confirmed like any other. The bibliography is made by script from M2's section of `registers/Verified_References.md`, and the glossary appendix from M1's Appendix B and `papers/M2/GLOSSARY.md`. A fresh reader checks that no piece of `PLAIN_TEXT.md` states mathematics that is not in an entry. The PI is shown the abstract and the plain-English openings at the end, with the composed sentences if there are any.

## Entries

### M2-W001 · active
- **Statement (as it will be printed):**
```tex
M1 defines a state at rest, and defines it on the fibre alone (M1, Definition~7.4): ``A \emph{state at rest} is a holomorphic section of the twist: for $d\geq1$, a function $f$ on the covering torus $E$ whose poles are bounded by $D$.''
```
- **Place:** `states 010`; the first sentence of the section on states
- **Step:** S03
- **Rests on:** M1 v7.3, Definition 7.4 (`def:states`)
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.834; the quotation cut by script; that the definition is on the fibre alone: ll.829–840, where the twist, the states and the lifts are all on the covering torus $E$ of the pillowcase)
- **Tag:** none
- **Failure test:** a line of M1 v7.3 that defines a state at rest elsewhere than on the fibre.
- **Confirmed:** Decision Log P189, 18 November 2026 (the read-back of S03, its sentence 1)
- **Retires / retired by:** none

### M2-W002 · active
- **Statement (as it will be printed):**
```tex
M1 does not define a state that is not at rest, and it does not define a state of the whole geometry.
```
- **Place:** `states 020`; after M2-W001
- **Step:** S03
- **Rests on:** M1 v7.3, whole
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, ll.1–1322, read whole twice in chat C1; its glossary, ll.1229–1293, has of states only "state at rest" and "state on the pillowcase")
- **Tag:** none
- **Failure test:** a line of M1 v7.3 that defines a state that is not at rest, or a state of the whole geometry.
- **Confirmed:** Decision Log P189, 18 November 2026 (the read-back of S03, its sentence 2)
- **Retires / retired by:** none

### M2-W003 · active
- **Statement (as it will be printed):**
```tex
M1 places a spinor bundle over the whole geometry. ``The fibre algebra acts on the geometry at two levels: at the spinor level, on a spinor bundle over $M$'' (M1, Definition~2.7). ``The spinor bundle of Definition~2.7 is the complex spinor bundle'' (M1, Section~2.4; it is the tenth choice of M1). ``Under Definition~2.7 a spinor bundle exists on $M$.'' and ``Since $w_{2}(\CPtwo)=h\bmod2\neq0$, no spin structure exists on a geometry whose base contains $\CPtwo$, and spinors exist only through a $\Spinc$ structure, whose determinant line satisfies $c_{1}(L)\equiv w_{2}\pmod2$ and is therefore odd.'' (M1, Proposition~7.3).
```
- **Place:** `states 030`; after M2-W002
- **Step:** S03
- **Rests on:** M1 v7.3, Definition 2.7 (`def:levels`), the paragraph after it in Section 2.4 (the tenth choice), Proposition 7.3 (`prop:spinc`)
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, ll.214, 219–221, 806; the quotations cut by script)
- **Tag:** none in the quoted words; Proposition 7.3 is tagged [D] in M1
- **Failure test:** the quoted words do not stand at those lines of M1 v7.3.
- **Confirmed:** Decision Log P189, 18 November 2026 (the read-back of S03, its sentence 3)
- **Retires / retired by:** none

### M2-W004 · active
- **Statement (as it will be printed):**
```tex
M1 links the states at rest to spinors, and as motivation only (M1, Section~7.4): ``For the canonical $\Spinc$ structure the states at rest are the harmonic spinors of the fibre. We use this as motivation for the definition of a state, and the counts below do not depend on it.''
```
- **Place:** `states 040`; after M2-W003
- **Step:** S03
- **Rests on:** M1 v7.3, Section 7.4, the paragraph after Definition 7.4
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.843; the quotation cut by script)
- **Tag:** none
- **Failure test:** the quoted words do not stand at l.843 of M1 v7.3; or a result of M1 whose proof uses them as more than motivation.
- **Confirmed:** Decision Log P189, 18 November 2026 (the read-back of S03, its sentence 4)
- **Retires / retired by:** none

### M2-W005 · active
- **Statement (as it will be printed):**
```tex
\begin{definition}[state of the geometry]\label{def:state}
A \emph{state} of the geometry is a section of the spinor bundle of M1, Definition~2.7, over $\Mtwelve$. That a state, which M1 defines at rest on the fibre, and a spinor, on which M1 lets the fibre algebra act, are one kind of thing is a choice and is not derived: it is the first choice of this paper. M1 uses it as motivation; here it is a reading. Clause~(b) of M1, Definition~3.2, is its ground: the definition brings in no object that M1 does not have.
\end{definition}
```
- **Place:** `states 050`; after M2-W004
- **Step:** S03
- **Rests on:** M2-W001 to M2-W004; M1 v7.3, Definition 2.7, Definition 3.2 clause (b); Minimality M2-1
- **Mark:** DECLARED (a reading and a numbered choice, the first of M2; confirmed by the PI by read-back). Not shown and not claimed: which spinor bundle it is and what is left free in it (card S04); that the states at rest of M1, Definition 7.4, are states in this sense (card S21); what it is for a state of the geometry to be at rest (card S11)
- **Tag:** none: a definition; the choice in it is declared
- **Failure test:** a later step of M2 that needs a state which is not a section of that bundle; or card S21 finding that the states at rest of M1, Definition 7.4, are not states in this sense; or a later step that needs spinors that are not complex (M1's own test, `papers/M2/M1_failure_tests.md`, M1-W035).
- **Confirmed:** Decision Log P189, 18 November 2026 (the read-back of S03, its sentence 5)
- **Retires / retired by:** none

### M2-W006 · active
- **Statement (as it will be printed):**
```tex
What it is for a state of the geometry to be at rest is not said in Definition~\ref{def:state}. On the fibre a state at rest is as M1, Definition~7.4, has it. That the states at rest of M1, Definition~7.4, are states in the sense of Definition~\ref{def:state} is not shown here.
```
- **Place:** `states 060`; after M2-W005
- **Step:** S03
- **Rests on:** M2-W001, M2-W004, M2-W005
- **Mark:** READ (M2-W005 as logged; M1 v7.3, l.843, where the link is motivation only)
- **Tag:** none
- **Failure test:** a sentence of M2-W005 that says what it is for a state of the geometry to be at rest, or a proof in this section that the states at rest of M1, Definition 7.4, are states in the sense of M2-W005. The two points are taken up by cards S11 and S21 and are closed in M2.
- **Confirmed:** Decision Log P189, 18 November 2026 (the read-back of S03, its sentence 6)
- **Retires / retired by:** none

### M2-W007 · active
- **Statement (as it will be printed):**
```tex
By M1, Proposition~7.3, spinors exist on the geometry only through a $\Spinc$ structure. The spinor bundle of M1, Definition~2.7, is therefore the spinor bundle of a $\Spinc$ structure on the geometry, and to say which bundle a state is a section of is to say which $\Spinc$ structure that is.
```
- **Place:** `states 070`; after M2-W006
- **Step:** S04
- **Rests on:** M1 v7.3, Proposition 7.3 (`prop:spinc`), Definition 2.7 (`def:levels`); M2-W005
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.806: "spinors exist only through a $\Spinc$ structure"; l.214 for the spinor bundle of Definition 2.7, "on a spinor bundle over $M$"; "on the geometry" is the entry's, M1 having "on a geometry whose base contains $\CPtwo$"); the step "therefore" is the architect's reading, confirmed by the PI by read-back. Not claimed: that a $\Spinc$ structure has only one spinor bundle
- **Tag:** none
- **Failure test:** a later step of M2 that needs a state which is a section of a bundle belonging to no $\Spinc$ structure of the geometry.
- **Confirmed:** Decision Log P191, 18 November 2026 (the read-back of S04, part 1, its sentence 1, and the reading in it)
- **Retires / retired by:** none

### M2-W008 · active
- **Statement (as it will be printed):**
```tex
\begin{proposition}[the base and space]\label{prop:basespace}
A $\Spinc$ structure on $\CPtwo\times\Stwo\times S^{3}$ is determined by the first Chern class of its determinant line, which is two integers, one on $\CPtwo$ and one on $\Stwo$. For the integers of M1, three on $\CPtwo$ (M1, Proposition~7.3) and two on $\Stwo$ (M1, Section~7.4), there is at most one such structure: over the base and over space M1 leaves nothing free in the $\Spinc$ structure. \rigD
\end{proposition}
```
- **Place:** `states 080`; after M2-W007
- **Step:** S04
- **Rests on:** M2-W009, M2-W010, M2-W011 (its proof); M1 v7.3, Proposition 7.3 (`prop:spinc`), Section 7.4, first paragraph, Proposition 7.9 (`prop:S3`)
- **Mark:** CHECKED (the proof, M2-W009 to M2-W011); the integers READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.806, "$L=K^{-1}=\Oline{3}$"; l.827, "On $\Stwo$ the canonical structure has the integer two"; l.1058, $\Sigma=S^{3}$). Not shown here: that such a structure exists (M2-W012). M1 names its integers at l.827 on $\CPtwo\times\Stwo\times\Ttwo$ and not on this product: that the structure of the geometry gives one on this product with these integers is not shown here (card S04c puts the pieces together)
- **Tag:** [D]: the first sentence is proved from cited theorems; the integers are results of M1 tagged [D]
- **Failure test:** two different $\Spinc$ structures on $\CPtwo\times\Stwo\times S^{3}$ whose determinant lines have the integers three and two; or an error in a cited statement (V-M2-1 to V-M2-4).
- **Confirmed:** Decision Log P191, 18 November 2026 (sentence 2)
- **Retires / retired by:** none

### M2-W009 · active
- **Statement (as it will be printed):**
```tex
The cohomology groups of $\CPtwo$ with integer coefficients are $\Z$ in degrees $0$, $2$ and $4$ and zero in every other degree \cite[Theorem~3.19]{Hatcher}, and those of the sphere $S^{n}$ are $\Z$ in degrees $0$ and $n$ and zero in every other degree \cite[Corollaries~2.14 and~3.3]{Hatcher}. Each is finitely generated and free, so by the K\"unneth formula \cite[Theorem~3.15]{Hatcher}, applied twice, the second cohomology group of $\CPtwo\times\Stwo\times S^{3}$ is $\Z\oplus\Z$, one summand from $\CPtwo$ and one from $\Stwo$; the sphere $S^{3}$ adds nothing in degree two.
```
- **Place:** `states 090`; the first step of the proof of Proposition `prop:basespace` (M2-W008)
- **Step:** S04
- **Rests on:** Verified References V-M2-2, V-M2-3, V-M2-4
- **Mark:** verified references, READ at source (V-M2-2 to V-M2-4); the degree-two count CHECKED (`papers/M2/checks/S04_degree_two.py`, part (1)). Hand steps, in full: (i) Theorem 3.19 at $n=2$ gives the ring $\Z[\alpha]/(\alpha^{3})$ with $\alpha$ of degree two, whose groups are $\Z$ in degrees $0,2,4$, spanned by $1,\alpha,\alpha^{2}$, and zero otherwise; (ii) Corollary 2.14 gives the reduced homology of $S^{n}$, $n\geq1$: $\Z$ in degree $n$ and zero otherwise; the unreduced homology has $\Z$ more in degree $0$, the sphere being connected; none of these groups has torsion, so by Corollary 3.3 each cohomology group is the homology group of the same degree. The hypothesis of Theorem 3.15 that the factors are CW complexes is not restated in the entry: Hatcher gives the cell structures (Example 0.3, the sphere; Example 0.6, complex projective space; the locations found by search, the examples not read through), and says of the hypothesis that it "will be shown to be unnecessary in §4.1" (p.216). **The statement has "the sphere $S^{n}$" with no condition on $n$; it holds for $n\geq1$ (fresh reader, P193): corrected wording put to the PI**
- **Tag:** none (a step of a proof)
- **Failure test:** a class of degree two on $\CPtwo\times\Stwo\times S^{3}$ outside those two summands, or torsion in that group.
- **Confirmed:** Decision Log P191, 18 November 2026 (sentence 3)
- **Retires / retired by:** none

### M2-W010 · active
- **Statement (as it will be printed):**
```tex
The $\Spinc$ structures on an oriented manifold, when there is one, are acted on freely and transitively by its second cohomology group with integer coefficients, and the action of a class $a$ adds $2a$ to the first Chern class of the determinant line \cite[Proposition~1]{Gompf1997}.
```
- **Place:** `states 100`; the second step of the proof of Proposition `prop:basespace`
- **Step:** S04
- **Rests on:** Verified References V-M2-1
- **Mark:** verified reference, READ at source (V-M2-1: Gompf, Proposition 1, with its setting and its proof, pp.43–45, and Examples 2(b), p.46, for oriented manifolds and their tangent bundles). Two steps of identification, said here: (i) the proposition is stated for a bundle over a CW complex; that it holds for an oriented manifold through its tangent bundle is Gompf's Examples 2(b), p.46; (ii) Gompf's $c_{1}(s)$ is the first Chern class of the line bundle $L$ of the structure (proof, p.45: "$c_{1}(s,\hat\tau)=c_{1}(L,\tau_{L})$"); that this $L$ is what M1 calls the determinant line is not Gompf's wording; Nicolaescu has the same fact with $\det(\sigma)$ (note to V-M2-1)
- **Tag:** none (a step of a proof)
- **Failure test:** the cited proposition does not say this of the tangent bundle of an oriented manifold.
- **Confirmed:** Decision Log P191, 18 November 2026 (sentence 4)
- **Retires / retired by:** none

### M2-W011 · active
- **Statement (as it will be printed):**
```tex
Two $\Spinc$ structures on $\CPtwo\times\Stwo\times S^{3}$ whose determinant lines have the same first Chern class therefore differ by a class $a$ with $2a=0$, and in $\Z\oplus\Z$ that is $a=0$: they are the same structure.
```
- **Place:** `states 110`; the last step of the proof of Proposition `prop:basespace`
- **Step:** S04
- **Rests on:** M2-W009, M2-W010
- **Mark:** CHECKED (a hand computation, in full as written: by M2-W010 the two differ by one class $a$, and the first Chern classes differ by $2a$; they are equal, so $2a=0$; by M2-W009 the group is $\Z\oplus\Z$, where $2a=0$ gives $a=0$; the action is free, so the structures are the same)
- **Tag:** none (a step of a proof)
- **Failure test:** as M2-W008.
- **Confirmed:** Decision Log P191, 18 November 2026 (sentence 5)
- **Retires / retired by:** none

### M2-W012 · active
- **Statement (as it will be printed):**
```tex
Proposition~\ref{prop:basespace} speaks of the $\Spinc$ structure, and so of the spinor bundle as a bundle. That a $\Spinc$ structure with these integers exists is M1, Proposition~7.3, and is not shown again here. Nothing is said here of the lengths, of how a state is differentiated, of the fibre and its four cone points, or of time.
```
- **Place:** `states 120`; after the proof of Proposition `prop:basespace`
- **Step:** S04
- **Rests on:** M2-W008; M1 v7.3, Proposition 7.3 (`prop:spinc`)
- **Mark:** READ (M2-W008 as logged; `canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.806, "A $\Spinc$ structure exists"). **"with these integers" is credited to Proposition 7.3 alone; the integer two is at l.827, Section 7.4 (fresh reader, P193): corrected wording put to the PI**
- **Tag:** none
- **Failure test:** a sentence of M2-W008 to M2-W011 that speaks of the lengths, of differentiation, of the fibre or of time, or that proves existence.
- **Confirmed:** Decision Log P191, 18 November 2026 (sentence 6)
- **Retires / retired by:** none

### M2-W013 · active
- **Statement (as it will be printed):**
```tex
\begin{proposition}[the base, space and the fibre before it is folded]\label{prop:unfolded}
A $\Spinc$ structure on $\CPtwo\times\Stwo\times S^{3}\times\Ttwo$ is determined by the first Chern class of its determinant line, which is three integers, one on $\CPtwo$, one on $\Stwo$ and one on $\Ttwo$. For the integers of M1, three on $\CPtwo$ (M1, Proposition~7.3), two on $\Stwo$ and, for a twist of the fibre of flux three, six on $\Ttwo$ (M1, Section~7.4 and Proposition~7.6), there is at most one such structure. \rigD
\end{proposition}
```
- **Place:** `states 130`; after M2-W012
- **Step:** S04
- **Rests on:** M2-W014, M2-W015 (its proof); M1 v7.3, Proposition 7.3 (`prop:spinc`), Section 7.4, first paragraph, Proposition 7.6 (`prop:twist`), Proposition 7.9 (`prop:S3`)
- **Mark:** CHECKED (the proof, M2-W014 and M2-W015); the integers READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, ll.806, 827, 832, 878, and l.1058 for $\Sigma=S^{3}$). Not shown here: that such a structure exists; that the structure of the geometry gives one on this product with these integers (as M2-W008); anything of the fibre folded (the pillowcase and its four cone points) or of time
- **Tag:** [D]: the first sentence is proved from cited theorems; the integers are results of M1 tagged [D]
- **Failure test:** two different $\Spinc$ structures on $\CPtwo\times\Stwo\times S^{3}\times\Ttwo$ whose determinant lines have the integers three, two and six; or an error in a cited statement (V-M2-1 to V-M2-4).
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English; Decision Log P191)
- **Retires / retired by:** none

### M2-W014 · active
- **Statement (as it will be printed):**
```tex
The cohomology groups of the circle $S^{1}$ with integer coefficients are $\Z$ in degrees $0$ and $1$ and zero in every other degree \cite[Corollaries~2.14 and~3.3]{Hatcher}, and $\Ttwo=S^{1}\times S^{1}$. By the K\"unneth formula \cite[Theorem~3.15]{Hatcher} and the groups found in the proof of Proposition~\ref{prop:basespace}, the second cohomology group of $\CPtwo\times\Stwo\times S^{3}\times\Ttwo$ is $\Z\oplus\Z\oplus\Z$, one summand from each of $\CPtwo$, $\Stwo$ and $\Ttwo$: there is no mixed term, since $\CPtwo\times\Stwo\times S^{3}$ has no cohomology in degree one.
```
- **Place:** `states 140`; the first step of the proof of Proposition `prop:unfolded` (M2-W013)
- **Step:** S04
- **Rests on:** Verified References V-M2-2, V-M2-4; M2-W009
- **Mark:** verified references, READ at source (V-M2-2, V-M2-4); the count CHECKED (`papers/M2/checks/S04_degree_two.py`, part (2); that $\CPtwo\times\Stwo\times S^{3}$ has no cohomology in degree one is its part (1)); the groups of the circle by the hand steps of M2-W009 at $n=1$. It agrees with M1's sentence (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.827: "one integer for each factor, with no mixed term"), which is not used as the ground
- **Tag:** none (a step of a proof)
- **Failure test:** a class of degree two on $\CPtwo\times\Stwo\times S^{3}\times\Ttwo$ outside those three summands, or torsion in that group.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English; Decision Log P191)
- **Retires / retired by:** none

### M2-W015 · active
- **Statement (as it will be printed):**
```tex
The integer on $\Ttwo$ is $2d$ for a twist of the fibre of flux $d$ (M1, Section~7.4), and the flux is three (M1, Proposition~7.6): it is six. Two $\Spinc$ structures whose determinant lines have the same three integers differ by a class $a$ with $2a=0$ \cite[Proposition~1]{Gompf1997}, and in $\Z\oplus\Z\oplus\Z$ that is $a=0$: they are the same structure.
```
- **Place:** `states 150`; the last step of the proof of Proposition `prop:unfolded`
- **Step:** S04
- **Rests on:** M2-W010, M2-W014; M1 v7.3, Section 7.4, first paragraph, Definition 7.4 (`def:states`), Proposition 7.6 (`prop:twist`)
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.827: "A twist of the fibre by a line of degree $d$ on the torus … the integer on the torus becomes $2d$"; l.832 (Definition 7.4), where a twist of flux $d$ is the line of a divisor of degree $d$, so that "degree $d$" at l.827 is "flux $d$"; l.878: "Then the flux is three."); CHECKED (a hand computation, in full as written: $2\cdot3=6$; the rest as M2-W011 with $\Z\oplus\Z\oplus\Z$ for $\Z\oplus\Z$)
- **Tag:** none (a step of a proof)
- **Failure test:** as M2-W013.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English; Decision Log P191)
- **Retires / retired by:** none

### M2-W016 · active
- **Statement (as it will be printed):**
```tex
The fibre of the geometry is the pillowcase, the torus $\Ttwo$ folded (M1, Theorem~5.7), and M1 passes from the torus to the pillowcase by a lift of the fold: ``A \emph{state on the pillowcase}, for a given lift, is a state at rest that the lift leaves unchanged.'' (M1, Definition~7.4). The same is taken here for a state of the geometry: over the fibre, a state is a section over the covering torus that a lift of the fold to the spinor bundle leaves unchanged. This is a reading and is not derived: it is the second choice of this paper. Clause~(b) of M1, Definition~3.2, is its ground: it brings in no object that M1 does not have.
```
- **Place:** `states 160`; after the proof of Proposition `prop:unfolded` (M2-W015)
- **Step:** S04
- **Rests on:** M1 v7.3, Theorem 5.7 (`thm:fibre`), Definition 7.4 (`def:states`), Definition 3.2 clause (b); M2-W005; Minimality M2-2
- **Mark:** DECLARED (a reading and a numbered choice, the second of M2; confirmed by the PI by read-back). The quotation READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.834; exact, checked by a word-for-word search; l.678 for the pillowcase as the torus folded; clause (b) at l.275: "nothing is present that is not needed: $M$ carries no object … that A1--A5 do not require"; "it brings in no object that M1 does not have" is the entry's gloss of the clause, in the words of M2-W005). Not shown and not claimed: that a lift of the fold to the spinor bundle of the whole geometry exists; that the data of M1 determine it (M2-W018; card S04b)
- **Tag:** none: a reading; the choice in it is declared
- **Failure test:** a later step of M2 that needs a state which the lifted fold does not leave unchanged; or card S21 finding that the states on the pillowcase of M1, Definition 7.4, are not states in this sense. M1's own test stands beside it (`papers/M2/M1_failure_tests.md`, M1-W024): a later paper that needs the states of the fibre to be counted on the covering torus and not on the pillowcase.
- **Confirmed:** Decision Log P192, 18 November 2026 (the read-back of the fold, its sentence 1, and the reading in it)
- **Retires / retired by:** none

### M2-W017 · retired
- **Statement (as it will be printed):**
```tex
M1 fixes the lift and its signs at the four corners: ``The corner signs are three alike and one odd, and the odd corner is one of the three that the drive cycles. For that lift the fibre has two states on the pillowcase, and the fold removes a third.'' (M1, Proposition~7.6).
```
- **Place:** `states 170`; after M2-W016
- **Step:** S04
- **Rests on:** M1 v7.3, Proposition 7.6 (`prop:twist`)
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.878; the quotation exact, checked by a word-for-word search). **The lead-in says more than l.878 (fresh reader, P193):** the quoted words are the conclusion of Proposition 7.6 under its hypotheses, which are not quoted; "that lift" is "one of the two lifts of the fold"; the corner signs are those of the twist (l.836), and the signs of the lift on spinors are Corollary 7.7. Corrected wording put to the PI
- **Tag:** none in the sentence; Proposition 7.6 is tagged [D] in M1
- **Failure test:** the quoted words do not stand at l.878 of M1 v7.3.
- **Confirmed:** Decision Log P192, 18 November 2026 (sentence 2)
- **Retires / retired by:** retired by M2-W019 (Decision Log P194, 18 November 2026). Rests on it and is flagged: M2-W018 (its statement does not quote this entry and is unchanged; it now rests on M2-W019)

### M2-W018 · active
- **Statement (as it will be printed):**
```tex
Proposition~\ref{prop:unfolded} speaks of the torus before it is folded. That the flux, the lift and the corner signs of M1 determine the spinor bundle over the pillowcase with its four cone points, so that nothing is left free there, is not shown in it. Nothing is said yet of time.
```
- **Place:** `states 180`; after M2-W017
- **Step:** S04
- **Rests on:** M2-W013, M2-W016, M2-W019 (in place of M2-W017, retired; flagged at P194: the statement is unchanged)
- **Mark:** READ (M2-W013 to M2-W017 as logged; M2-W019 as logged, which has the hypotheses of M1, Proposition 7.6, where M2-W017 had a lead-in)
- **Tag:** none
- **Failure test:** a sentence of M2-W013 to M2-W017 that shows it, or that speaks of time. The two points are taken up by cards S04b and S04c and are closed in M2.
- **Confirmed:** Decision Log P192, 18 November 2026 (sentence 3)
- **Retires / retired by:** none

### M2-W019 · active
- **Statement (as it will be printed):**
```tex
M1, Proposition~7.6, has: ``Let the fibre satisfy clauses (ii) and~(iii) of Definition~2.1, the states of clause~(iii) being states on the pillowcase for one of the two lifts of the fold, and let the flux be the least that does so. Then the flux is three. The corner signs are three alike and one odd, and the odd corner is one of the three that the drive cycles. For that lift the fibre has two states on the pillowcase, and the fold removes a third.'' The corner signs are those of the twist (M1, Definition~7.4).
```
- **Place:** `states 170`; after M2-W016, in the place of M2-W017, which it replaces
- **Step:** S04 (the correction of M2-W017 that chat C3 put to the PI, P193; entered in chat C3b)
- **Rests on:** M1 v7.3, Proposition 7.6 (`prop:twist`), Definition 7.4 (`def:states`)
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.878: the quotation is the whole first paragraph of the statement of Proposition 7.6, checked by script to be the line itself with M1's cross-reference `\ref{def:A5}` printed as its number, 2.1; l.836 for the last sentence: "The \emph{corner sign} of the twist at $P_{i}$ is $(-1)^{a_{i}}$"). Not quoted: the second paragraph of the statement of Proposition 7.6 (l.880, the two clauses taken singly). Not said here: the signs of the lift on spinors, which are M1, Corollary 7.7
- **Tag:** none in the sentence; Proposition 7.6 is tagged [D] in M1
- **Failure test:** the quoted words do not stand at l.878 of M1 v7.3; or the corner signs of Proposition 7.6 are not those that Definition 7.4 defines for the twist.
- **Confirmed:** Decision Log P194, 18 November 2026 (the wording given by the PI; READ against M1, no new reading)
- **Retires / retired by:** retires M2-W017
