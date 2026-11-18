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

The heading line carries the status: `· active` or `· retired`. The next number is **M2-W052**.

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
- **Rests on:** M2-W020 (in place of M2-W009, retired; flagged at P195: the statement is unchanged), M2-W010, M2-W011 (its proof); M1 v7.3, Proposition 7.3 (`prop:spinc`), Section 7.4, first paragraph, Proposition 7.9 (`prop:S3`)
- **Mark:** CHECKED (the proof, M2-W009 to M2-W011); the integers READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.806, "$L=K^{-1}=\Oline{3}$"; l.827, "On $\Stwo$ the canonical structure has the integer two"; l.1058, $\Sigma=S^{3}$). Not shown here: that such a structure exists (M2-W012). M1 names its integers at l.827 on $\CPtwo\times\Stwo\times\Ttwo$ and not on this product: that the structure of the geometry gives one on this product with these integers is not shown here (card S04c puts the pieces together)
- **Tag:** [D]: the first sentence is proved from cited theorems; the integers are results of M1 tagged [D]
- **Failure test:** two different $\Spinc$ structures on $\CPtwo\times\Stwo\times S^{3}$ whose determinant lines have the integers three and two; or an error in a cited statement (V-M2-1 to V-M2-4).
- **Confirmed:** Decision Log P191, 18 November 2026 (sentence 2)
- **Retires / retired by:** none

### M2-W009 · retired
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
- **Retires / retired by:** retired by M2-W020 (Decision Log P195, 18 November 2026)

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
- **Rests on:** M2-W020 (in place of M2-W009, retired; flagged at P195: the statement is unchanged), M2-W010
- **Mark:** CHECKED (a hand computation, in full as written: by M2-W010 the two differ by one class $a$, and the first Chern classes differ by $2a$; they are equal, so $2a=0$; by M2-W009 the group is $\Z\oplus\Z$, where $2a=0$ gives $a=0$; the action is free, so the structures are the same)
- **Tag:** none (a step of a proof)
- **Failure test:** as M2-W008.
- **Confirmed:** Decision Log P191, 18 November 2026 (sentence 5)
- **Retires / retired by:** none

### M2-W012 · retired
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
- **Retires / retired by:** retired by M2-W021 (Decision Log P195, 18 November 2026)

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
- **Rests on:** Verified References V-M2-2, V-M2-4; M2-W020 (in place of M2-W009, retired; flagged at P195: the statement is unchanged)
- **Mark:** verified references, READ at source (V-M2-2, V-M2-4); the count CHECKED (`papers/M2/checks/S04_degree_two.py`, part (2); that $\CPtwo\times\Stwo\times S^{3}$ has no cohomology in degree one is its part (1); certificate `MEFProof/Paper_M2/M2_L1_degree_two.lean`, theorems `L1_unfolded_degree_one`, `L1_unfolded_degree_two`, `L1_unfolded_sources`, `L1_unfolded_no_mixed_term` and `L1_base_space_degree_one`, written in chat C3c, P203, which certify the count of ranks only); the groups of the circle by the hand steps of M2-W009 at $n=1$ (since P195, of M2-W020, which replaces M2-W009 and has the same hand steps; noted after chat C3b's fresh reader, P200). It agrees with M1's sentence (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.827: "one integer for each factor, with no mixed term"), which is not used as the ground
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
- **Place:** `states 160`; after the proof of Proposition `prop:unfolded` (M2-W015) and, since chat C3b, after the definition M2-W022 at `states 155`
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

### M2-W020 · active
- **Statement (as it will be printed):**
```tex
The cohomology groups of $\CPtwo$ with integer coefficients are $\Z$ in degrees $0$, $2$ and $4$ and zero in every other degree \cite[Theorem~3.19]{Hatcher}, and those of the sphere $S^{n}$, $n\geq1$, are $\Z$ in degrees $0$ and $n$ and zero in every other degree \cite[Corollaries~2.14 and~3.3]{Hatcher}. Each is finitely generated and free, so by the K\"unneth formula \cite[Theorem~3.15]{Hatcher}, applied twice, the second cohomology group of $\CPtwo\times\Stwo\times S^{3}$ is $\Z\oplus\Z$, one summand from $\CPtwo$ and one from $\Stwo$; the sphere $S^{3}$ adds nothing in degree two.
```
- **Place:** `states 090`; the first step of the proof of Proposition `prop:basespace` (M2-W008), in the place of M2-W009, which it replaces
- **Step:** S04 (a correction after the fresh reader's check, P193)
- **Rests on:** Verified References V-M2-2, V-M2-3, V-M2-4
- **Mark:** verified references, READ at source (V-M2-2 to V-M2-4); the degree-two count CHECKED (`papers/M2/checks/S04_degree_two.py`, part (1); certificate `MEFProof/Paper_M2/M2_L1_degree_two.lean`, theorems `L1_base_space_degree_one`, `L1_base_space_degree_two`, `L1_base_space_sources`, `L1_base_space_total`, written in chat C3c, P203, which certify the count of ranks only). Hand steps, in full: (i) Theorem 3.19 at $n=2$ gives the ring $\Z[\alpha]/(\alpha^{3})$ with $\alpha$ of degree two, whose groups are $\Z$ in degrees $0,2,4$, spanned by $1,\alpha,\alpha^{2}$, and zero otherwise; (ii) Corollary 2.14 gives the reduced homology of $S^{n}$, $n\geq1$: $\Z$ in degree $n$ and zero otherwise; the unreduced homology has $\Z$ more in degree $0$, the sphere being connected; none of these groups has torsion, so by Corollary 3.3 each cohomology group is the homology group of the same degree. The hypothesis of Theorem 3.15 that the factors are CW complexes is not restated in the entry: Hatcher gives the cell structures (Example 0.3, the sphere; Example 0.6, complex projective space; the locations found by search, the examples not read through), and says of the hypothesis that it "will be shown to be unnecessary in §4.1" (p.216)
- **Tag:** none (a step of a proof)
- **Failure test:** a class of degree two on $\CPtwo\times\Stwo\times S^{3}$ outside those two summands, or torsion in that group.
- **Confirmed:** Decision Log P195, 18 November 2026 (the corrected wording, its item 1: "$n\geq1$" added; no other word changed)
- **Retires / retired by:** retires M2-W009

### M2-W021 · active
- **Statement (as it will be printed):**
```tex
Proposition~\ref{prop:basespace} speaks of the $\Spinc$ structure, and so of the spinor bundle as a bundle. That a $\Spinc$ structure with these integers exists is taken from M1 (Proposition~7.3 and Section~7.4) and is not shown here. Nothing is said here of the lengths, of how a state is differentiated, of the fibre and its four cone points, or of time.
```
- **Place:** `states 120`; after the proof of Proposition `prop:basespace`, in the place of M2-W012, which it replaces
- **Step:** S04 (a correction after the fresh reader's check, P193)
- **Rests on:** M2-W008; M1 v7.3, Proposition 7.3 (`prop:spinc`), Section 7.4, first paragraph
- **Mark:** READ (M2-W008 as logged; `canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, l.806, "A $\Spinc$ structure exists" and "$L=K^{-1}=\Oline{3}$"; l.827, "On $\Stwo$ the canonical structure has the integer two"). M1 says these of the geometry and of $\CPtwo\times\Stwo\times\Ttwo$; that the structure of the geometry gives one on $\CPtwo\times\Stwo\times S^{3}$ with these integers is not shown (card S04c)
- **Tag:** none
- **Failure test:** a sentence of M2-W008, M2-W020, M2-W010 or M2-W011 that speaks of the lengths, of differentiation, of the fibre or of time, or that proves existence.
- **Confirmed:** Decision Log P195, 18 November 2026 (item 2: the middle sentence changed; no other word)
- **Retires / retired by:** retires M2-W012

### M2-W022 · active
- **Statement (as it will be printed):**
```tex
\begin{definition}[lift of the fold]\label{def:lift}
Let $E$ be the covering torus of M1, Section~7.4, with a complex structure for which the fold is $\iota(z)=-z$, as there, and with the flat metric $\lvert\mathrm{d}z\rvert^{2}$ of that structure, and let $N$ be a complex line bundle on $E$. A \emph{lift of the fold} to $N$ is a continuous map $\lambda\colon N\to N$ that carries the fibre of $N$ over each point $p$ of $E$ to the fibre over $\iota(p)$, is linear on each fibre, and applied twice is the identity. At a corner $P_{i}$, which the fold leaves in place, $\lambda$ acts on the fibre over $P_{i}$ as multiplication by a number whose square is $1$; this number, $+1$ or $-1$, is the \emph{sign} of $\lambda$ at $P_{i}$. The spinor bundle of the $\Spinc$ structure that $N$ defines on $E$ is $\Lambda^{0,*}\otimes N$ \cite[Proposition~1.4.25]{Nicolaescu}, and the \emph{lift of the fold} to it that $\lambda$ defines is $\iota^{*}\otimes\lambda$, where $\iota^{*}$ is the pull-back of functions and $(0,1)$-forms by the fold, as in M1, Section~7.4 ($\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$). That a lift of the fold to the spinor bundle of the fibre is of this form is a reading and is not derived: it is the third choice of this paper. Clause~(b) of M1, Definition~3.2, is its ground: it brings in no object that M1 does not have.
\end{definition}
```
- **Place:** `states 155`; after the proof of Proposition `prop:unfolded` (M2-W015) and before M2-W016, which is the first use of the term
- **Step:** S04b
- **Rests on:** M1 v7.3, Section 7.4 (the covering torus $E$; the fold on the untwisted spinors), Definition 7.4 (`def:states`, its two lifts), Definition 3.2 clause (b); M2-W005 (the gloss of clause (b)); Verified References V-M2-5, V-M2-6; Minimality M2-3
- **Mark:** DECLARED (a reading and a numbered choice, the third of M2; confirmed by the PI by read-back). READ: `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.829 ("Let $E$ be the covering torus of the pillowcase with a complex structure for which the fold is $\iota(z)=-z$"); l.843 ("on the untwisted spinors of the fibre, the functions and the $(0,1)$-forms on $E$, the fold acts by $+1$ and by $-1$ at every corner alike, since $\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$"); l.834 (M1's two lifts, $f(z)\mapsto f(-z)$ and $f(z)\mapsto-f(-z)$; that each applied twice is the identity is a hand step, $f(-(-z))=f(z)$, and is not said at l.834: corrected after the fresh reader's check, P200); l.275 (clause (b); "it brings in no object that M1 does not have" is the entry's gloss of the clause, in the words of M2-W005). Verified reference V-M2-6 (Nicolaescu, Proposition 1.4.25, and Definition 1.4.3 for its setting). **The hypotheses of the cited Proposition 1.4.25** ("$(M,g,J)$ is an almost Kähler manifold … $L\to M$ is a Hermitian line bundle"; added after the fresh reader's check, P200): that $E$ with $\lvert\mathrm{d}z\rvert^{2}$ and its complex structure is almost Kähler is a hand step written in full in the mark of M2-W024; that $N$ need not be given a Hermitian metric for what is used here is **an identification step**: the source defines $\sigma\otimes L$ for every $L$ in $\mathrm{Pic}^{\infty}(M)$, "the space of isomorphism classes of smooth complex line bundles over $M$" (p.5), giving $L$ by an $S^{1}$-cocycle (p.42), which is a Hermitian metric (p.10: "If $L$ has a $U(1)$-structure (i.e. is equipped with a Hermitian metric) then the gluing maps belong to $S^{1}$"), and the Hermitian metric and the connection $B$ of Proposition 1.4.25 enter its Dirac operator, which is not used here; that every complex line bundle carries a Hermitian metric is not stated in the cited sources and is not claimed. Hand steps: a linear map of a line that applied twice is the identity is multiplication by $+1$ or $-1$; $\iota$ is its own inverse, so that the pull-back $\iota^{*}$ carries the forms over $p$ to the forms over $\iota(p)$; $z\mapsto-z$ keeps $\lvert\mathrm{d}z\rvert^{2}$. **An identification step** (CLAUDE.md §5): the source's "$S_{\sigma_L}=\Omega^{0,*}(L)$" is read as "the spinor bundle of $\sigma_L$ is $\Lambda^{0,*}\otimes L$" (the note to V-M2-6). Not shown and not claimed: that the spinor bundle obtained does not depend on which complex structure of $E$ is taken (M1 l.829 says so of the counts; along time the lengths of the fibre vary, M1 Proposition 5.8: card S04c); that a lift of the fold to the spinor bundle of the fibre gives one to the spinor bundle of the whole geometry (card S04c)
- **Tag:** none: a definition; the choice in it is declared
- **Failure test:** a later step of M2 that needs the fold to act on the functions and the $(0,1)$-forms of $E$ otherwise than by the pull-back; or that needs the lifts of the fold to be holomorphic; or that needs a lift which applied twice is not the identity.
- **Confirmed:** Decision Log P199, 18 November 2026 (the read-back of S04b, its item 1, with Minimality M2-3)
- **Retires / retired by:** none

### M2-W023 · active
- **Statement (as it will be printed):**
```tex
\begin{proposition}[the bundle over the pillowcase]\label{prop:pillowcase}
Let $E$ be as in Definition~\ref{def:lift}. On $E$ there is exactly one $\Spinc$ structure whose determinant line has the integer six; its spinor bundle is $\Lambda^{0,*}\otimes N$ for a line $N$ of degree three, any two such lines are isomorphic, and the twist $\mathcal{O}(D)$ of a divisor $D$ of flux three on the corners (M1, Definition~7.4) is one. (i) A lift of the fold to $N$ exists. (ii) For every lift of the fold to $N$ the product of its signs at the four corners is $-1$. (iii) Two lifts $\lambda$, $\lambda'$ of the fold to $N$ with the same sign at each corner are carried one to the other by an isomorphism $\phi$ of $N$ to itself that covers the identity of $E$: $\phi\lambda\phi^{-1}=\lambda'$; two with different signs at some corner are not. Up to such isomorphisms there are exactly eight lifts, one for each choice of four signs whose product is $-1$. (iv) For each divisor $D$ of flux three on the corners, of the first and the second lift of M1, Definition~7.4, the one for which the fibre has two states on the pillowcase has the sign $-1$ at the odd corner and $+1$ at the other three; with the naming of M1, Corollary~7.7, under which the odd corner is $P_{4}$, its signs at $P_{1},P_{2},P_{3},P_{4}$ are $+1,+1,+1,-1$. Over the fibre, therefore, the flux, the lift and the corner signs of M1 determine the spinor bundle with its lift of the fold up to isomorphism: nothing is left free in it. \rigD
\end{proposition}
```
- **Place:** `states 190`; after M2-W018, whose point it closes
- **Step:** S04b
- **Rests on:** M2-W022; M2-W024 to M2-W026, M2-W034 to M2-W038 and M2-W032 (its proof; M2-W034 to M2-W038 in place of M2-W027 to M2-W031, retired; flagged at P200: the statement is unchanged); M1 v7.3, Section 7.4, Definition 7.4 (`def:states`), Lemma 7.5(b) (`lem:states`), Proposition 7.6 (`prop:twist`), Corollary 7.7 (`cor:lift`), the proof of Proposition 5.5 (`prop:surface`, l.590), Appendix B (the corners by position); Verified References V-M2-1, V-M2-2, V-M2-4 to V-M2-7
- **Mark:** CHECKED (the proof, M2-W024 to M2-W026, M2-W034 to M2-W038, M2-W032; certificate `MEFProof/Paper_M2/M2_L2_pillowcase.lean`; script `papers/M2/checks/S04b_lift_signs.py`); READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex` ll.590, 827, 832–836, 846, 878, 932, 936, 1217). Not shown here: anything of the holomorphic structure of the twist, of the lengths, or of how a state is differentiated; that the result does not depend on which complex structure of $E$ is taken; the spinor bundle of the whole geometry; time and the drive (M2-W033). M1 takes the corner signs "up to one overall sign" (l.836; Corollary 7.7, l.932); (iv) gives the signs of the lift with two states for every divisor: an addition to M1's text and not a contradiction of it; no proof of M1 changes
- **Tag:** [D]: proved from cited theorems and from results of M1, among them Proposition 7.6 and Corollary 7.7, tagged [D] in M1
- **Failure test:** two lifts of the fold to a line of degree three on $E$ with the same four signs that no isomorphism covering the identity carries one to the other; a lift whose four signs have the product $+1$; a divisor of flux three on the corners for which the lift with two states has another pattern of signs; or an error in a cited statement (V-M2-1, V-M2-2, V-M2-4 to V-M2-7) or in M1, Lemma 7.5(b).
- **Confirmed:** Decision Log P199, 18 November 2026 (the read-back of S04b, its item 2)
- **Retires / retired by:** none

### M2-W024 · active
- **Statement (as it will be printed):**
```tex
By the groups of the circle and the K\"unneth formula, as in the proof of Proposition~\ref{prop:unfolded} \cite[Corollaries~2.14 and~3.3, Theorem~3.15]{Hatcher}, the second cohomology group of $E=S^{1}\times S^{1}$ with integer coefficients is $\Z$, in which $2a=0$ gives $a=0$; so two $\Spinc$ structures on $E$ whose determinant lines have the same first Chern class are the same \cite[Proposition~1]{Gompf1997}. With its complex structure $J$ and the metric $\lvert\mathrm{d}z\rvert^{2}$, $E$ is almost K\"ahler, its two-form being closed since $E$ has dimension two \cite[Definition~1.4.3]{Nicolaescu}. For a line $N$ on $E$ the structure $\sigma_{c}\otimes N$, where $\sigma_{c}$ is the structure induced by $J$, has spinor bundle $\Lambda^{0,*}\otimes N$ and determinant line $K_{E}^{-1}\otimes N^{2}$ \cite[Proposition~1.4.25]{Nicolaescu}, whose first Chern class is that of $K_{E}^{-1}$ plus twice that of $N$ \cite[p.~42]{Nicolaescu}. The canonical line $K_{E}$ is trivial, $\mathrm{d}z$ being a section of it with no zero, so that the integer of the determinant line of $\sigma_{c}\otimes N$ is twice the degree of $N$. The structure with the integer six is therefore $\sigma_{c}\otimes N$ for a line $N$ of degree three, and the twist $\mathcal{O}(D)$ of a divisor of flux three on the corners is such a line (M1, Section~7.4 and Definition~7.4).
```
- **Place:** `states 200`; the first step of the proof of Proposition `prop:pillowcase` (M2-W023)
- **Step:** S04b
- **Rests on:** Verified References V-M2-1, V-M2-2, V-M2-4, V-M2-5, V-M2-6; M2-W014, M2-W015 (the same argument with the base and space); M2-W020 (the hand steps for the groups of the circle) and M2-W010 (the identification of the source's $c_{1}(s)$ with the determinant line); M1 v7.3, Section 7.4, first paragraph, Definition 7.4
- **Mark:** verified references, READ at source (V-M2-1, V-M2-2, V-M2-4 to V-M2-6). READ: `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.827 ("the canonical structure has zero on the torus"; "A twist of the fibre by a line of degree $d$ on the torus multiplies the determinant line by the square of that line, so that the integer on the torus becomes $2d$"), l.832 (a twist of flux $d$ is the line of a divisor of degree $d$, as in the mark of M2-W015). Hand steps: $H^{2}(S^{1}\times S^{1};\Z)=H^{1}\otimes H^{1}=\Z$ from the groups of the circle (the hand steps of M2-W020 at $n=1$) and Theorem 3.15; multiplication by $i$ is a rotation by a quarter-turn, so $J$ keeps $\lvert\mathrm{d}z\rvert^{2}$ and $(E,\lvert\mathrm{d}z\rvert^{2},J)$ is almost Hermitian; its two-form $\omega$ has $\mathrm{d}\omega=0$, a three-form on a manifold of dimension two; $\mathrm{d}z$ is invariant under the translations of the lattice and so is a section of $K_{E}$ with no zero, whence $c_{1}(K_{E}^{-1})=0$ (as M1 l.827 has it); existence of the structure with the integer six: $\sigma_{c}\otimes\mathcal{O}(D)$. **Identification steps** (CLAUDE.md §5): Gompf's spin$^{c}$ structures (classifying maps) and Nicolaescu's (cocycles) are taken as one notion, as M2-W010 takes Gompf's $c_{1}(s)$ for M1's determinant line (the notes to V-M2-1 and V-M2-5); "the integer" of a line on $E$ is its first Chern class in $H^{2}(E;\Z)=\Z$, its degree
- **Tag:** none (a step of a proof)
- **Failure test:** two different $\Spinc$ structures on $E$ whose determinant lines have the integer six; or a line of degree three $N$ for which $\sigma_{c}\otimes N$ does not have the integer six; or an error in a cited statement.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** none

### M2-W025 · active
- **Statement (as it will be printed):**
```tex
Two lines $N$ and $N'$ of degree three on $E$ are isomorphic. By the step above, $\sigma_{c}\otimes N$ and $\sigma_{c}\otimes N'$ are the same structure; the lines act freely on the $\Spinc$ structures by $(\sigma,L)\mapsto\sigma\otimes L$ \cite[Proposition~1.3.15]{Nicolaescu}, and $\sigma_{c}\otimes N'=(\sigma_{c}\otimes N)\otimes(N'\otimes N^{-1})$, so that $N'\otimes N^{-1}$ is trivial and $N'$ is isomorphic to $N$.
```
- **Place:** `states 210`; the second step of the proof of Proposition `prop:pillowcase`
- **Step:** S04b
- **Rests on:** M2-W024; Verified Reference V-M2-5
- **Mark:** verified reference, READ at source (V-M2-5: the statement; the source leaves the proof of freeness to the reader). Hand steps, in full: $(\sigma\otimes L)\otimes L'=\sigma\otimes(L\otimes L')$, from the cocycle description of the action (the source, p.42: $\sigma\otimes L$ is given by $[h_{\alpha\beta},z_{\alpha\beta}\zeta_{\alpha\beta}]$); a free action has $\sigma\otimes L=\sigma$ only for $L$ trivial; with $\sigma=\sigma_{c}\otimes N$ and $L=N'\otimes N^{-1}$ this gives $N'\otimes N^{-1}$ trivial; then $N'\cong N'\otimes N^{-1}\otimes N\cong N$
- **Tag:** none (a step of a proof)
- **Failure test:** two lines of degree three on $E$ that are not isomorphic; or an error in the cited statement.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** none

### M2-W026 · active
- **Statement (as it will be printed):**
```tex
(i). The fold leaves each corner in place, so it carries a divisor $D$ on the corners to itself, and the first lift of M1, Definition~7.4, $f(z)\mapsto f(-z)$, is a lift of the fold to $\mathcal{O}(D)$ in the sense of Definition~\ref{def:lift}. Its sign at $P_{i}$ is the corner sign $(-1)^{a_{i}}$ of M1, Definition~7.4, and the sign of the second lift, $f(z)\mapsto-f(-z)$, is $-(-1)^{a_{i}}$.
```
- **Place:** `states 220`; the third step of the proof of Proposition `prop:pillowcase`
- **Step:** S04b
- **Rests on:** M2-W022; M1 v7.3, Definition 7.4 (`def:states`); the proof of Proposition 5.5 (`prop:surface`), for the fixed points of the fold
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.590: "$z\mapsto-z$ fixes exactly the four points with $2z\in\Z^{2}$"; l.834: "The fold acts on states at rest by $f(z)\mapsto f(-z)$ or by $f(z)\mapsto-f(-z)$, its two lifts, called here the first and the second"; l.836: "The \emph{corner sign} of the twist at $P_{i}$ is $(-1)^{a_{i}}$, the action of the first lift on the fibre of $\mathcal{O}(D)$ there"). CHECKED by hand, in full: near $P_{i}$, with $z_{i}=z-P_{i}$, the fold is $z_{i}\mapsto-z_{i}$ (since $2P_{i}$ lies in the lattice), and $z_{i}^{-a_{i}}$ is a frame of $\mathcal{O}(D)$ there; $f\mapsto f\circ\iota$ carries it to $(-z_{i})^{-a_{i}}=(-1)^{a_{i}}z_{i}^{-a_{i}}$, so that the map is continuous, linear on each fibre, carries the fibre over $p$ to the fibre over $\iota(p)$, and applied twice is the identity; away from the corners the frame is $1$ and is carried to $1$; the second lift is the first followed by multiplication by $-1$ on each fibre, and so is a lift of the fold too, with the sign $-(-1)^{a_{i}}$ (added after the fresh reader's check, P200). **An identification step:** M1's lift, defined on states at rest, is taken as the map of the line that M1 itself takes it to be at l.836 ("the action of the first lift on the fibre of $\mathcal{O}(D)$")
- **Tag:** none (a step of a proof)
- **Failure test:** a divisor on the corners that the fold does not carry to itself; or a corner at which the first lift does not act by $(-1)^{a_{i}}$.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** none

### M2-W027 · retired
- **Statement (as it will be printed):**
```tex
Let $\lambda$ and $\lambda'$ be lifts of the fold to a line $N$. For $v\neq0$ in the fibre over $p$, $\lambda'(v)=g(p)\,\lambda(v)$ for a number $g(p)\neq0$ that does not depend on $v$, and $g\colon E\to\C\setminus\{0\}$ is continuous; applying $\lambda'$ twice gives $g(\iota(p))\,g(p)=1$. At a corner $P_{i}$ the sign of $\lambda'$ is $g(P_{i})$ times that of $\lambda$. An isomorphism $\phi$ of $N$ to itself that covers the identity of $E$ is multiplication by a continuous $h\colon E\to\C\setminus\{0\}$, and $\phi\lambda\phi^{-1}$ is the lift whose function, in the place of $g$, is $h(\iota(p))/h(p)$; at a corner this is $1$. So $\phi\lambda\phi^{-1}$ has the signs of $\lambda$, and two lifts with different signs at some corner are not carried one to the other: this is the second sentence of (iii).
```
- **Place:** `states 230`; the fourth step of the proof of Proposition `prop:pillowcase`
- **Step:** S04b
- **Rests on:** M2-W022
- **Mark:** CHECKED by hand, in full: $\lambda(v)$ and $\lambda'(v)$ lie in the fibre over $\iota(p)$, a line, and $\lambda(v)\neq0$, so $\lambda'(v)=g(p)\lambda(v)$, and by linearity $g(p)$ does not depend on $v$; in local frames over neighbourhoods of $p$ and $\iota(p)$ the two maps are continuous functions with no zero, and $g$ is their ratio; $\lambda'(\lambda'(v))=g(\iota(p))\,\lambda(g(p)\lambda(v))=g(\iota(p))\,g(p)\,\lambda(\lambda(v))=g(\iota(p))\,g(p)\,v$, which is $v$; at a corner $\iota(P_{i})=P_{i}$; a linear isomorphism of a line is a non-zero number, continuous in $p$ by local frames; for $v$ over $p$, $\phi\lambda\phi^{-1}(v)=h(\iota(p))\,h(p)^{-1}\lambda(v)$
- **Tag:** none (a step of a proof)
- **Failure test:** an isomorphism covering the identity that changes the sign of a lift at a corner.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** retired by M2-W034 (Decision Log P200, 18 November 2026)

### M2-W028 · retired
- **Statement (as it will be printed):**
```tex
Write $E=\R^{2}/\Z^{2}$ with coordinates $(x,y)$, so that the fold is $(x,y)\mapsto(-x,-y)$ and the corners are $C_{m,n}=(\tfrac m2,\tfrac n2)$, $m,n\in\{0,1\}$ (M1, Appendix~B), and read $g$ on $\R^{2}$. The plane $\R^{2}$ is convex, so it is path-connected, locally path-connected and has trivial fundamental group \cite[Example~1.4]{Hatcher}, and by the lifting criterion \cite[Proposition~1.33]{Hatcher} for the covering $s\mapsto(\cos2\pi s,\sin2\pi s)$ of the circle \cite[p.~29]{Hatcher} there is a continuous $\theta\colon\R^{2}\to\R$ with $g/\lvert g\rvert=e^{2\pi i\theta}$. So $g=e^{\Psi}$ with $\Psi=\log\lvert g\rvert+2\pi i\theta$ continuous. Since $g$ has period one in $x$ and in $y$, the differences $\Psi(x+1,y)-\Psi(x,y)$ and $\Psi(x,y+1)-\Psi(x,y)$ are continuous with values in $2\pi i\Z$, and so are constants $2\pi i\mu$ and $2\pi i\nu$; then $\psi=\Psi-2\pi i(\mu x+\nu y)$ has period one in each variable, and $g=e^{2\pi i(\mu x+\nu y)}e^{\psi}$.
```
- **Place:** `states 240`; the fifth step of the proof of Proposition `prop:pillowcase`
- **Step:** S04b
- **Rests on:** M2-W027; Verified Reference V-M2-7; M1 v7.3, Appendix B (the corners by position)
- **Mark:** verified reference, READ at source (V-M2-7: Proposition 1.33, p.61; the covering of the circle, p.29; Example 1.4, p.27). READ: `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.1217 (the corners $P_{1}=(0,0)$, $P_{2}=(\tfrac12,0)$, $P_{3}=(0,\tfrac12)$, $P_{4}=(\tfrac12,\tfrac12)$); l.932 ($C_{m,n}=(\tfrac m2,\tfrac n2)$). Hand steps, in full: a real-linear map of $\R^{2}$ that carries $\Z^{2}$ to the lattice of $E$ identifies $\R^{2}/\Z^{2}$ with $E$ and carries $(x,y)\mapsto(-x,-y)$ to $z\mapsto-z$; open discs are convex, so $\R^{2}$ is locally path-connected; the lifting criterion applies to $g/\lvert g\rvert\colon\R^{2}\to S^{1}$ because $\pi_{1}(\R^{2})=0$; $\log\lvert g\rvert$ is continuous since $\lvert g\rvert>0$; $e^{\Psi(x+1,y)}=e^{\Psi(x,y)}$ gives a difference in $2\pi i\Z$; a continuous map from the connected $\R^{2}$ into the discrete $2\pi i\Z$ is constant; $\psi(x+1,y)=\Psi(x,y)+2\pi i\mu-2\pi i\mu(x+1)-2\pi i\nu y=\psi(x,y)$, and the same in $y$
- **Tag:** none (a step of a proof)
- **Failure test:** a continuous $g\colon\R^{2}/\Z^{2}\to\C\setminus\{0\}$ not of the form $e^{2\pi i(\mu x+\nu y)}e^{\psi}$ with $\mu,\nu$ integers and $\psi$ continuous of period one; or an error in the cited statements.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** retired by M2-W035 (Decision Log P200, 18 November 2026)

### M2-W029 · retired
- **Statement (as it will be printed):**
```tex
The condition $g(\iota(p))\,g(p)=1$ gives $e^{\psi(-x,-y)+\psi(x,y)}=1$, so that $\psi(-x,-y)+\psi(x,y)$ is continuous with values in $2\pi i\Z$, and is a constant $2\pi i\ell$. A corner $C_{m,n}$ and its image under the fold differ by a point of $\Z^{2}$, so that $2\psi(C_{m,n})=2\pi i\ell$, and $g(C_{m,n})=e^{\pi i(\mu m+\nu n)}e^{\pi i\ell}=(-1)^{\mu m+\nu n+\ell}$. The product of the four values is $(-1)^{2\mu+2\nu+4\ell}=1$, and the four are all $1$ exactly when $\mu$, $\nu$ and $\ell$ are even (certificates \texttt{L2\_corner\_values}, \texttt{L2\_corner\_values\_all\_even}).
```
- **Place:** `states 250`; the sixth step of the proof of Proposition `prop:pillowcase`
- **Step:** S04b
- **Rests on:** M2-W027, M2-W028
- **Mark:** CHECKED (certificate `MEFProof/Paper_M2/M2_L2_pillowcase.lean`, theorems `L2_corner_values`, `L2_corner_values_all_even`; script `papers/M2/checks/S04b_lift_signs.py`, part (2)); hand steps, in full: $g(-x,-y)\,g(x,y)=e^{-2\pi i(\mu x+\nu y)}e^{\psi(-x,-y)}e^{2\pi i(\mu x+\nu y)}e^{\psi(x,y)}$; $\R^{2}$ is connected; $-C_{m,n}=C_{m,n}-(m,n)$ and $\psi$ has period one, so $\psi(-C_{m,n})=\psi(C_{m,n})$; $e^{2\pi i(\mu m/2+\nu n/2)}=e^{\pi i(\mu m+\nu n)}$; the four exponents $\ell$, $\mu+\ell$, $\nu+\ell$, $\mu+\nu+\ell$ add to $2\mu+2\nu+4\ell$
- **Tag:** none (a step of a proof)
- **Failure test:** values of $\mu$, $\nu$, $\ell$ for which the four exponents add to an odd number, or are all even without $\mu$, $\nu$, $\ell$ being even.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** retired by M2-W036 (Decision Log P200, 18 November 2026)

### M2-W030 · retired
- **Statement (as it will be printed):**
```tex
If the four values are all $1$, then $\mu$, $\nu$ and $\ell$ are even; $h=e^{-\pi i(\mu x+\nu y)}e^{-\psi/2}$ then has period one in each variable (\texttt{L2\_even\_half}), and $h(-x,-y)/h(x,y)=e^{2\pi i(\mu x+\nu y)}e^{\psi(x,y)}e^{-\pi i\ell}=g(x,y)$ (\texttt{L2\_h\_exponent}). Multiplication by $h$ is then an isomorphism $\phi$ of $N$ to itself that covers the identity of $E$, and $\phi\lambda\phi^{-1}$ is the lift whose function is $h(\iota(p))/h(p)=g(p)$, that is $\lambda'$. This proves the first sentence of (iii) for two lifts to one line.
```
- **Place:** `states 260`; the seventh step of the proof of Proposition `prop:pillowcase`
- **Step:** S04b
- **Rests on:** M2-W027, M2-W028, M2-W029
- **Mark:** CHECKED (certificate, theorems `L2_h_exponent`, `L2_even_half`; script, part (3), a numerical check at sample points); hand steps, in full: $\mu=2k$ gives $e^{-\pi i\mu(x+1)}=e^{-\pi i\mu x}e^{-2\pi ik}=e^{-\pi i\mu x}$, and the same for $\nu$; $\psi$ has period one; $h(-x,-y)/h(x,y)=e^{2\pi i(\mu x+\nu y)}e^{(\psi(x,y)-\psi(-x,-y))/2}$ and $\psi(-x,-y)=2\pi i\ell-\psi(x,y)$ give $e^{2\pi i(\mu x+\nu y)}e^{\psi(x,y)}e^{-\pi i\ell}$, and $e^{-\pi i\ell}=1$ for $\ell$ even; $h$ is continuous with no zero; by M2-W027, $\phi\lambda\phi^{-1}$ is the lift with the function $h(\iota(p))/h(p)$, and a lift is fixed by its function relative to $\lambda$
- **Tag:** none (a step of a proof)
- **Failure test:** two lifts of the fold to one line with the same four signs that no multiplication by a continuous function with no zero carries one to the other.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** retired by M2-W037 (Decision Log P200, 18 November 2026)

### M2-W031 · retired
- **Statement (as it will be printed):**
```tex
(ii), and the rest of (iii). By (i), the first lift of M1 is a lift of the fold to $\mathcal{O}(D)$, and the product of its signs is $(-1)^{d}=-1$ (M1, the proof of Corollary~7.7; certificate \texttt{L2\_product\_minus\_one}); every other lift of the fold to $\mathcal{O}(D)$ has at $P_{i}$ the sign $g(P_{i})$ times this one, and the product of the four $g(P_{i})$ is $1$. An isomorphism of lines that covers the identity of $E$ carries a lift of the fold to a lift with the same signs, and every line of degree three is isomorphic to $\mathcal{O}(D)$. So every lift of the fold to a line of degree three has the product $-1$, and two such lifts with the same signs, on two lines of degree three, are carried one to the other. Over the twenty divisors of flux three on the corners the first and the second lifts have, between them, all eight patterns of four signs with product $-1$ (certificate \texttt{L2\_eight\_patterns}): up to isomorphism there are exactly eight lifts.
```
- **Place:** `states 270`; the eighth step of the proof of Proposition `prop:pillowcase`
- **Step:** S04b
- **Rests on:** M2-W025 to M2-W030; M1 v7.3, the proof of Corollary 7.7 (`cor:lift`)
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.936: "The product of the corner signs of $\mathcal{O}(D)$ is $\prod_{i}(-1)^{a_{i}}=(-1)^{d}$"); CHECKED (certificate, theorems `L2_twenty_divisors`, `L2_product_minus_one`, `L2_eight_patterns`; script, part (1)); hand steps, in full: for an isomorphism $\psi\colon N\to N'$ covering the identity and a lift $\lambda'$ of the fold to $N'$, $\psi^{-1}\lambda'\psi$ is a lift of the fold to $N$, and at a corner the two act on lines by the same number; two lifts on $N$ and $N'$ with the same signs give, through $\psi$, two lifts on $N$ with the same signs, which M2-W030 carries one to the other; there are $2^{4}/2=8$ patterns of four signs with product $-1$
- **Tag:** none (a step of a proof)
- **Failure test:** a lift of the fold to a line of degree three whose four signs have the product $+1$; or a pattern of four signs with product $-1$ that no lift has.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** retired by M2-W038 (Decision Log P200, 18 November 2026)

### M2-W032 · active
- **Statement (as it will be printed):**
```tex
(iv). For a divisor $D$ of flux three on the corners, under the first lift the number of states on the pillowcase is $1+\sum_{i}\lfloor a_{i}/2\rfloor$, and under the second it is $d$ less that number, with $d=3$ (M1, Lemma~7.5(b)); exactly one of the two has two states (certificate \texttt{L2\_one\_lift\_two\_states}). Over the twenty divisors, that lift has the sign $-1$ at the odd corner and $+1$ at the other three (\texttt{L2\_one\_odd\_corner}, \texttt{L2\_two\_state\_signs}); with the odd corner at $P_{4}$ its signs at $P_{1},P_{2},P_{3},P_{4}$ are $+1,+1,+1,-1$ (\texttt{L2\_odd\_at\_P4}), which is $(-1)^{mn}$ at $C_{m,n}$ (\texttt{L2\_mn\_pattern}). By (iii), and since any two lines of degree three are isomorphic, the spinor bundle with this lift of the fold is the same, up to isomorphism, whichever divisor with its odd corner at $P_{4}$ is taken.
```
- **Place:** `states 280`; the last step of the proof of Proposition `prop:pillowcase`
- **Step:** S04b
- **Rests on:** M2-W025, M2-W026, M2-W038 (in place of M2-W031, retired; flagged at P200: the statement is unchanged); M1 v7.3, Definition 7.4 (`def:states`; the odd corner), Lemma 7.5(b) (`lem:states`), Proposition 7.6 (`prop:twist`), Corollary 7.7 (`cor:lift`)
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.846: "(b) Under the first lift the number of states on the pillowcase is $1+\sum_{i}\lfloor a_{i}/2\rfloor$; under the second it is $d$ less that number"; l.836: "A corner is \emph{odd} if its sign differs from that of the other three"; l.878: "For that lift the fibre has two states on the pillowcase"; l.932: "Naming the corners so that it is $P_{4}$, the sign at $C_{m,n}=(\tfrac m2,\tfrac n2)$ is $(-1)^{mn}$, up to one overall sign"); CHECKED (certificate, theorems `L2_one_lift_two_states`, `L2_one_odd_corner`, `L2_two_state_signs`, `L2_odd_at_P4`, `L2_mn_pattern`; script, part (1); the count of M1 Lemma 7.5(b) taken as given, as M1's certificate `L6` does). Hand step: an isomorphism $\phi$ of lines covering the identity with $\phi\lambda\phi^{-1}=\lambda'$ gives $\mathrm{id}\otimes\phi$ on $\Lambda^{0,*}\otimes N$, which carries $\iota^{*}\otimes\lambda$ to $\iota^{*}\otimes\lambda'$
- **Tag:** none (a step of a proof)
- **Failure test:** a divisor of flux three on the corners for which both lifts, or neither, have two states, or for which the lift with two states has another pattern of signs.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04b, its item 4; Decision Log P199)
- **Retires / retired by:** none

### M2-W033 · active
- **Statement (as it will be printed):**
```tex
The lift of the fold through which a state over the fibre is read (the second choice of this paper) is taken here to be the lift of Proposition~\ref{prop:pillowcase}(iv), which is the lift of M1, Proposition~7.6, for which the fibre has two states on the pillowcase; M1 takes it so for the states at rest. Proposition~\ref{prop:pillowcase} speaks of the fibre alone, of the spinor bundle as a bundle, and of one complex structure of $E$. Nothing is said here of the holomorphic structure of the twist, of the lengths, of how a state is differentiated, of the spinor bundle of the whole geometry over the fibre, or of time and the drive.
```
- **Place:** `states 290`; after the proof of Proposition `prop:pillowcase` (M2-W032)
- **Step:** S04b
- **Rests on:** M2-W016, M2-W023; M1 v7.3, Proposition 7.6 (`prop:twist`)
- **Mark:** DECLARED (the first sentence carries a reading: which lift M2-W016's "a lift" is; confirmed by the PI by read-back); READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.878: "the states of clause~(iii) being states on the pillowcase for one of the two lifts of the fold … For that lift the fibre has two states on the pillowcase"); the rest READ against M2-W022 to M2-W032 as logged (and, after P200, against M2-W034 to M2-W038, which replace M2-W027 to M2-W031 with no change to what they prove)
- **Tag:** none
- **Failure test:** a later step of M2 that needs a state over the fibre which the lift of M1, Proposition 7.6, does not leave unchanged but another lift does; or a sentence of M2-W022 to M2-W026, M2-W032 or M2-W034 to M2-W038 that speaks of the holomorphic structure of the twist, of the lengths, of differentiation, of the whole geometry, or of time. The points left are taken up by cards S04c (time; the whole geometry; the complex structure along time) and S14 (differentiation), and are closed in M2.
- **Confirmed:** Decision Log P199, 18 November 2026 (the read-back of S04b, its item 3)
- **Retires / retired by:** none

### M2-W034 · active
- **Statement (as it will be printed):**
```tex
Let $\lambda$ and $\lambda'$ be lifts of the fold to a line $N$. For $v\neq0$ in the fibre over $p$, $\lambda'(v)=\gamma(p)\,\lambda(v)$ for a number $\gamma(p)\neq0$ that does not depend on $v$, and $\gamma\colon E\to\C\setminus\{0\}$ is continuous; applying $\lambda'$ twice gives $\gamma(\iota(p))\,\gamma(p)=1$. At a corner $P_{i}$ the sign of $\lambda'$ is $\gamma(P_{i})$ times that of $\lambda$. An isomorphism $\phi$ of $N$ to itself that covers the identity of $E$ is multiplication by a continuous $\beta\colon E\to\C\setminus\{0\}$, and $\phi\lambda\phi^{-1}$ is the lift whose function, in the place of $\gamma$, is $\beta(\iota(p))/\beta(p)$; at a corner this is $1$. So $\phi\lambda\phi^{-1}$ has the signs of $\lambda$, and two lifts with different signs at some corner are not carried one to the other: this is the last clause of the first sentence of (iii).
```
- **Place:** `states 230`; the fourth step of the proof of Proposition `prop:pillowcase`, in the place of M2-W027, which it replaces
- **Step:** S04b (a correction after the fresh reader's check, P200)
- **Rests on:** M2-W022
- **Mark:** CHECKED by hand, in full: $\lambda(v)$ and $\lambda'(v)$ lie in the fibre over $\iota(p)$, a line, and $\lambda(v)\neq0$, so $\lambda'(v)=\gamma(p)\lambda(v)$, and by linearity $\gamma(p)$ does not depend on $v$; in local frames over neighbourhoods of $p$ and $\iota(p)$ the two maps are continuous functions with no zero, and $\gamma$ is their ratio; $\lambda'(\lambda'(v))=\gamma(\iota(p))\,\lambda(\gamma(p)\lambda(v))=\gamma(\iota(p))\,\gamma(p)\,\lambda(\lambda(v))=\gamma(\iota(p))\,\gamma(p)\,v$, which is $v$; at a corner $\iota(P_{i})=P_{i}$; a linear isomorphism of a line is a non-zero number, continuous in $p$ by local frames; for $v$ over $p$, $\phi\lambda\phi^{-1}(v)=\beta(\iota(p))\,\beta(p)^{-1}\lambda(v)$. Changed from M2-W027: "the second sentence of (iii)" becomes "the last clause of the first sentence of (iii)", which is what M2-W023 has (fresh reader, P200); the letters $g$, $h$ become $\gamma$, $\beta$, so that the proof does not use M1's letter $h$ (the hyperplane class, quoted in M2-W003). Nothing else changed
- **Tag:** none (a step of a proof)
- **Failure test:** an isomorphism covering the identity that changes the sign of a lift at a corner.
- **Confirmed:** checked, not read back, 18 November 2026 (a correction of the checked step M2-W027; the PI told in plain English in the closing report of chat C3b; Decision Log P200)
- **Retires / retired by:** retires M2-W027

### M2-W035 · active
- **Statement (as it will be printed):**
```tex
Write $E=\R^{2}/\Z^{2}$ with the coordinates $(\theta_{\psi},\theta_{\omega})$ of M1, Appendix~B, so that the fold is $(\theta_{\psi},\theta_{\omega})\mapsto(-\theta_{\psi},-\theta_{\omega})$ and the corners are $C_{m,n}=(\tfrac m2,\tfrac n2)$, $m,n\in\{0,1\}$ (M1, Appendix~B and Corollary~7.7), and read $\gamma$ on $\R^{2}$. The plane $\R^{2}$ is convex, so it is path-connected and locally path-connected and has trivial fundamental group \cite[Example~1.4]{Hatcher}, and by the lifting criterion \cite[Proposition~1.33]{Hatcher} for the covering $s\mapsto(\cos2\pi s,\sin2\pi s)$ of the circle \cite[p.~29]{Hatcher} there is a continuous $\xi\colon\R^{2}\to\R$ with $\gamma/\lvert\gamma\rvert=e^{2\pi i\xi}$. So $\gamma=e^{\zeta}$ with $\zeta=\log\lvert\gamma\rvert+2\pi i\xi$ continuous. Since $\gamma$ has period one in $\theta_{\psi}$ and in $\theta_{\omega}$, the differences $\zeta(\theta_{\psi}+1,\theta_{\omega})-\zeta(\theta_{\psi},\theta_{\omega})$ and $\zeta(\theta_{\psi},\theta_{\omega}+1)-\zeta(\theta_{\psi},\theta_{\omega})$ are continuous with values in $2\pi i\Z$, and so are constants $2\pi i\mu$ and $2\pi i\nu$; then $\eta=\zeta-2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})$ has period one in each variable, and $\gamma=e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta}$.
```
- **Place:** `states 240`; the fifth step of the proof of Proposition `prop:pillowcase`, in the place of M2-W028, which it replaces
- **Step:** S04b (a correction after the fresh reader's check, P200)
- **Rests on:** M2-W034; Verified Reference V-M2-7; M1 v7.3, Appendix B (the corners by position, in the coordinates $(\theta_{\psi},\theta_{\omega})$), Corollary 7.7 (the name $C_{m,n}$)
- **Mark:** verified reference, READ at source (V-M2-7: Proposition 1.33, p.61; the covering of the circle, p.29; Example 1.4, p.27). READ: `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.1217 ("The four corners are named by position, $P_{1}=(0,0)$, $P_{2}=(\tfrac12,0)$, $P_{3}=(0,\tfrac12)$, $P_{4}=(\tfrac12,\tfrac12)$ in coordinates $(\theta_{\psi},\theta_{\omega})$"); l.932 ("$C_{m,n}=(\tfrac m2,\tfrac n2)$"). Hand steps, in full: a real-linear map of $\R^{2}$ that carries $\Z^{2}$ to the lattice of $E$ identifies $\R^{2}/\Z^{2}$ with $E$ and carries $(\theta_{\psi},\theta_{\omega})\mapsto(-\theta_{\psi},-\theta_{\omega})$ to $z\mapsto-z$; a convex set is path-connected, the segment between two of its points lying in it; open discs are convex, so $\R^{2}$ is locally path-connected; the lifting criterion applies to $\gamma/\lvert\gamma\rvert\colon\R^{2}\to S^{1}$ because $\pi_{1}(\R^{2})=0$; $\log\lvert\gamma\rvert$ is continuous since $\lvert\gamma\rvert>0$; $e^{\zeta(\theta_{\psi}+1,\theta_{\omega})}=e^{\zeta(\theta_{\psi},\theta_{\omega})}$ gives a difference in $2\pi i\Z$; a continuous map from the connected $\R^{2}$ into the discrete $2\pi i\Z$ is constant; $\eta(\theta_{\psi}+1,\theta_{\omega})=\zeta(\theta_{\psi},\theta_{\omega})+2\pi i\mu-2\pi i\mu(\theta_{\psi}+1)-2\pi i\nu\theta_{\omega}=\eta(\theta_{\psi},\theta_{\omega})$, and the same in $\theta_{\omega}$. Changed from M2-W028 (fresh reader, P200): the name $C_{m,n}$ is credited to Corollary 7.7 as well as Appendix B; the coordinates are M1's $(\theta_{\psi},\theta_{\omega})$ in place of $(x,y)$, which M1 Proposition 5.8 uses for other coordinates; the letters $\theta$, $\Psi$, $\psi$ become $\xi$, $\zeta$, $\eta$, so as not to meet M1's $\theta_{\psi}$; path-connectedness is a hand step of its own. Nothing else changed
- **Tag:** none (a step of a proof)
- **Failure test:** a continuous $\gamma\colon\R^{2}/\Z^{2}\to\C\setminus\{0\}$ not of the form $e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta}$ with $\mu,\nu$ integers and $\eta$ continuous of period one; or an error in the cited statements.
- **Confirmed:** checked, not read back, 18 November 2026 (a correction of the checked step M2-W028; the PI told in plain English in the closing report of chat C3b; Decision Log P200)
- **Retires / retired by:** retires M2-W028

### M2-W036 · active
- **Statement (as it will be printed):**
```tex
The condition $\gamma(\iota(p))\,\gamma(p)=1$ gives $e^{\eta(-\theta_{\psi},-\theta_{\omega})+\eta(\theta_{\psi},\theta_{\omega})}=1$, so that $\eta(-\theta_{\psi},-\theta_{\omega})+\eta(\theta_{\psi},\theta_{\omega})$ is continuous with values in $2\pi i\Z$, and is a constant $2\pi i\ell$. A corner $C_{m,n}$ and its image under the fold differ by a point of $\Z^{2}$, so that $2\eta(C_{m,n})=2\pi i\ell$, and $\gamma(C_{m,n})=e^{\pi i(\mu m+\nu n)}e^{\pi i\ell}=(-1)^{\mu m+\nu n+\ell}$. The product of the four values is $(-1)^{2\mu+2\nu+4\ell}=1$, and the four are all $1$ exactly when $\mu$, $\nu$ and $\ell$ are even (the arithmetic of the exponents is certified in \texttt{L2\_corner\_values} and \texttt{L2\_corner\_values\_all\_even}).
```
- **Place:** `states 250`; the sixth step of the proof of Proposition `prop:pillowcase`, in the place of M2-W029, which it replaces
- **Step:** S04b (a correction after the fresh reader's check, P200)
- **Rests on:** M2-W034, M2-W035
- **Mark:** CHECKED (certificate `MEFProof/Paper_M2/M2_L2_pillowcase.lean`, theorems `L2_corner_values`, `L2_corner_values_all_even`, which certify the parity of the four exponents as written here and not their derivation from $\gamma$; script `papers/M2/checks/S04b_lift_signs.py`, part (2)); hand steps, in full: $\gamma(-\theta_{\psi},-\theta_{\omega})\,\gamma(\theta_{\psi},\theta_{\omega})=e^{-2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta(-\theta_{\psi},-\theta_{\omega})}e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta(\theta_{\psi},\theta_{\omega})}$; $\R^{2}$ is connected; $-C_{m,n}=C_{m,n}-(m,n)$ and $\eta$ has period one, so $\eta(-C_{m,n})=\eta(C_{m,n})$; $e^{2\pi i(\mu m/2+\nu n/2)}=e^{\pi i(\mu m+\nu n)}$; the four exponents $\ell$, $\mu+\ell$, $\nu+\ell$, $\mu+\nu+\ell$ add to $2\mu+2\nu+4\ell$. Changed from M2-W029: the letters of M2-W034 and M2-W035; the certificates are said to certify the arithmetic of the exponents (fresh reader, P200). Nothing else changed
- **Tag:** none (a step of a proof)
- **Failure test:** values of $\mu$, $\nu$, $\ell$ for which the four exponents add to an odd number, or are all even without $\mu$, $\nu$, $\ell$ being even.
- **Confirmed:** checked, not read back, 18 November 2026 (a correction of the checked step M2-W029; the PI told in plain English in the closing report of chat C3b; Decision Log P200)
- **Retires / retired by:** retires M2-W029

### M2-W037 · active
- **Statement (as it will be printed):**
```tex
If the four values are all $1$, then $\mu$, $\nu$ and $\ell$ are even; $\beta=e^{-\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{-\eta/2}$ then has period one in each variable, and $\beta(-\theta_{\psi},-\theta_{\omega})/\beta(\theta_{\psi},\theta_{\omega})=e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta(\theta_{\psi},\theta_{\omega})}e^{-\pi i\ell}=\gamma(\theta_{\psi},\theta_{\omega})$ (the arithmetic of the exponents is certified in \texttt{L2\_even\_half} and \texttt{L2\_iso\_exponent}). Multiplication by $\beta$ is then an isomorphism $\phi$ of $N$ to itself that covers the identity of $E$, and $\phi\lambda\phi^{-1}$ is the lift whose function is $\beta(\iota(p))/\beta(p)=\gamma(p)$, that is $\lambda'$. This proves the first clause of (iii) for two lifts to one line.
```
- **Place:** `states 260`; the seventh step of the proof of Proposition `prop:pillowcase`, in the place of M2-W030, which it replaces
- **Step:** S04b (a correction after the fresh reader's check, P200)
- **Rests on:** M2-W034, M2-W035, M2-W036
- **Mark:** CHECKED (certificate, theorems `L2_iso_exponent`, a linear identity over the integers of the same shape as the identity of the exponents used here, which are complex, and `L2_even_half`; script, part (3), a numerical check at sample points); hand steps, in full: $\mu=2k$ gives $e^{-\pi i\mu(\theta_{\psi}+1)}=e^{-\pi i\mu\theta_{\psi}}e^{-2\pi ik}=e^{-\pi i\mu\theta_{\psi}}$, and the same for $\nu$; $\eta$ has period one; $\beta(-\theta_{\psi},-\theta_{\omega})/\beta(\theta_{\psi},\theta_{\omega})=e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{(\eta(\theta_{\psi},\theta_{\omega})-\eta(-\theta_{\psi},-\theta_{\omega}))/2}$ and $\eta(-\theta_{\psi},-\theta_{\omega})=2\pi i\ell-\eta(\theta_{\psi},\theta_{\omega})$ give $e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta(\theta_{\psi},\theta_{\omega})}e^{-\pi i\ell}$, and $e^{-\pi i\ell}=1$ for $\ell$ even; $\beta$ is continuous with no zero; by M2-W034, $\phi\lambda\phi^{-1}$ is the lift with the function $\beta(\iota(p))/\beta(p)$, and a lift is fixed by its function relative to $\lambda$. Changed from M2-W030 (fresh reader, P200): "the first sentence of (iii)" becomes "the first clause of (iii)", the last clause being M2-W034; the certificates are said to certify the arithmetic of the exponents; the letters of M2-W034 to M2-W036; the theorem `L2_h_exponent` is renamed `L2_iso_exponent`. Nothing else changed
- **Tag:** none (a step of a proof)
- **Failure test:** two lifts of the fold to one line with the same four signs that no multiplication by a continuous function with no zero carries one to the other.
- **Confirmed:** checked, not read back, 18 November 2026 (a correction of the checked step M2-W030; the PI told in plain English in the closing report of chat C3b; Decision Log P200)
- **Retires / retired by:** retires M2-W030

### M2-W038 · active
- **Statement (as it will be printed):**
```tex
(ii), and the rest of (iii). By (i), the first lift of M1 is a lift of the fold to $\mathcal{O}(D)$, and the product of its signs is $(-1)^{d}=-1$ (M1, the proof of Corollary~7.7; certificate \texttt{L2\_product\_minus\_one}); every other lift of the fold to $\mathcal{O}(D)$ has at $P_{i}$ the sign $\gamma(P_{i})$ times this one, and the product of the four $\gamma(P_{i})$ is $1$. An isomorphism of lines that covers the identity of $E$ carries a lift of the fold to a lift with the same signs, and every line of degree three is isomorphic to $\mathcal{O}(D)$. So every lift of the fold to a line of degree three has the product $-1$, and two such lifts with the same signs, on two lines of degree three, are carried one to the other. Over the twenty divisors of flux three on the corners the first and the second lifts have, between them, all eight patterns of four signs with product $-1$ (certificate \texttt{L2\_eight\_patterns}): up to isomorphism there are exactly eight lifts.
```
- **Place:** `states 270`; the eighth step of the proof of Proposition `prop:pillowcase`, in the place of M2-W031, which it replaces
- **Step:** S04b (a correction after the fresh reader's check, P200)
- **Rests on:** M2-W025, M2-W026, M2-W034 to M2-W037; M1 v7.3, the proof of Corollary 7.7 (`cor:lift`)
- **Mark:** READ (`canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.936: "The product of the corner signs of $\mathcal{O}(D)$ is $\prod_{i}(-1)^{a_{i}}=(-1)^{d}$"); CHECKED (certificate, theorems `L2_twenty_divisors`, `L2_product_minus_one`, `L2_eight_patterns`; script, part (1)); hand steps, in full: for an isomorphism $\Phi\colon N\to N'$ covering the identity and a lift $\lambda'$ of the fold to $N'$, $\Phi^{-1}\lambda'\Phi$ is a lift of the fold to $N$, and at a corner the two act on lines by the same number; two lifts on $N$ and $N'$ with the same signs give, through $\Phi$, two lifts on $N$ with the same signs, which M2-W037 carries one to the other; there are $2^{4}/2=8$ patterns of four signs with product $-1$. Changed from M2-W031: $g$ becomes $\gamma$, as in M2-W034; in the mark the isomorphism of lines is $\Phi$ (the mark of M2-W031 had $\psi$). Nothing else changed
- **Tag:** none (a step of a proof)
- **Failure test:** a lift of the fold to a line of degree three whose four signs have the product $+1$; or a pattern of four signs with product $-1$ that no lift has.
- **Confirmed:** checked, not read back, 18 November 2026 (a correction of the checked step M2-W031; the PI told in plain English in the closing report of chat C3b; Decision Log P200)
- **Retires / retired by:** retires M2-W031

### M2-W039 · active
- **Statement (as it will be printed):**
```tex
\begin{definition}[the covering torus carried round time]\label{def:time}
Let $E=\R^{2}/\Z^{2}$ be the covering torus of Definition~\ref{def:lift}, written with the coordinates $(\theta_{\psi},\theta_{\omega})$ of M1, Appendix~B, as in the proof of Proposition~\ref{prop:pillowcase}, let $s$ be the length along the time circle $T$ and $L$ the length of one step, as in M1, Proposition~5.8, and let $M_{0}^{3}$ act on $E$ by the linear map of its matrix (M1, Section~4.1). The time circle is three steps long, and ``Once round $T$ the fibre is then glued to itself by $M_{0}^{3}=\bigl(\begin{smallmatrix}13&8\\8&5\end{smallmatrix}\bigr)$, of trace eighteen, which leaves every corner in place.'' (M1, Corollary~7.8). The \emph{covering torus carried round time} is the space $Y$ of the pairs $(p,s)$, $p\in E$, $s\in\R$, in which $(p,s+3L)$ and $(M_{0}^{3}p,s)$ are one point. The fold acts on $Y$ by $(p,s)\mapsto(\iota(p),s)$, and it leaves in place exactly the points of the four \emph{corner circles}, $\{(P_{i},s)\colon s\in\R\}$ for $i=1,\dots,4$. A \emph{lift of the fold} to a complex line bundle $N_{Y}$ on $Y$ is a continuous map $\lambda_{Y}\colon N_{Y}\to N_{Y}$ that carries the fibre of $N_{Y}$ over each point $y$ of $Y$ to the fibre over the image of $y$ under the fold, is linear on each fibre, and applied twice is the identity. On each corner circle $\lambda_{Y}$ acts on every fibre as multiplication by one and the same number, $+1$ or $-1$, the \emph{sign} of $\lambda_{Y}$ on that circle.
\end{definition}
```
- **Place:** `states 300`; after M2-W033, the first entry of S04c
- **Step:** S04c
- **Rests on:** M2-W022 (the covering torus $E$; a lift of the fold), M2-W035 ($E$ written with M1's coordinates); M1 v7.3, Section 4.1 (the step; the linear map), Proposition 5.8 (`prop:A2`; $s$, $L$, the join), Corollary 7.8 (`cor:timecircle`; three steps; $M_{0}^{3}$ leaves every corner in place), Appendix B (the coordinates $(\theta_{\psi},\theta_{\omega})$)
- **Mark:** A definition, confirmed by read-back; no numbered choice (it writes out M1's own construction: "the internal piece is carried round it by a map of itself", l.304; "the fibre at $s+L$ being joined to the fibre at $s$ by the step", l.704; l.952, the whole sentence quoted in the statement). READ: `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.302 ("The drive of A4 acts on $\Ttwo$ by its return map … One application of this map is a \emph{step} of the drive."), l.304, l.310 ("for $M\in\mathrm{SL}_{2}(\Z)$ it is the map $x\mapsto Mx \bmod \Z^{2}$ of $\Ttwo=\R^{2}/\Z^{2}$"), l.704 ("Let $s$ be the length along $T$ and $L$ the length of one step."; "The lengths agree across the join if and only if $e^{\kappa L}=\phi^{2}$."), l.952 (the sentence quoted, cut by script from the line), l.1217 (the coordinates). CHECKED: certificate `MEFProof/Paper_M2/M2_L3_time.lean`, `L3_A_is_M0_cubed`, `L3_A_fixes_corners`, `L3_A_commutes_fold`; script `papers/M2/checks/S04c_time.py`, parts (1) and (4). Hand steps, in full: the fold is well defined on $Y$, since $\iota(M_{0}^{3}p)=-M_{0}^{3}p=M_{0}^{3}(-p)=M_{0}^{3}\iota(p)$, $M_{0}^{3}$ being linear, so that the images $(\iota(p),s+3L)$ and $(\iota(M_{0}^{3}p),s)=(M_{0}^{3}\iota(p),s)$ of two points that are one are one; two pairs $(p,s)$, $(p',s)$ with the same $s$ are one point only if $p=p'$, so $(\iota(p),s)$ is $(p,s)$ exactly when $\iota(p)=p$, that is $2p\in\Z^{2}$, the four corners; $M_{0}^{3}P_{i}=P_{i}$ modulo $\Z^{2}$, so $\{(P_{i},s)\}$ is carried to itself by the joining and is a circle of length $3L$; at a point the fold leaves in place, $\lambda_{Y}$ is a linear map of a line whose square is the identity, so it is multiplication by $+1$ or $-1$; in a local frame it is a continuous function with these values, so it is constant on the connected corner circle. **An identification step** (CLAUDE.md §5): M1 does not say in words which point of the fibre at $s+L$ is joined to which point of the fibre at $s$; with $(p,s+L)$ and $(M_{0}p,s)$ one point, the lengths agree across the join exactly when $e^{\kappa L}=\phi^{2}$ ($M_{0}$ multiplies the coordinate along $v_{1}$ by $\phi^{2}$ and that along $v_{2}$ by $\phi^{-2}$), which is M1's condition (a hand step: a vector $u$ at $s+L$ has the squared length $e^{2\kappa(s+L)}u_{1}^{2}+e^{-2\kappa(s+L)}u_{2}^{2}$, and $M_{0}u$ at $s$ has $e^{2\kappa s}\phi^{4}u_{1}^{2}+e^{-2\kappa s}\phi^{-4}u_{2}^{2}$, $u_{1},u_{2}$ its components along $v_{1},v_{2}$; they agree for every $u$ exactly when $e^{2\kappa L}=\phi^{4}$); three joins give $(p,s+3L)$ and $(M_{0}^{3}p,s)$. Script part (4) checks the one-step agreement and its three-step consequence at sample points (the one-step check added after the fresh reader's check, P204). With the other direction $Y$ would be glued by $M_{0}^{-3}$; what would then change is not examined (corrected after the fresh reader's check, P204, which found that the mark said more than was checked)
- **Tag:** none: a definition
- **Failure test:** a point of $Y$ off the four corner circles that the fold leaves in place; a lift of the fold to a line on $Y$ that acts on a corner circle by more than one number; or a line of M1 under which the fibre once round the time circle is joined to itself otherwise than by $M_{0}^{3}$ or its inverse.
- **Confirmed:** Decision Log P203, 18 November 2026 (the read-back of S04c; the PI: "I confirm the four entries and the readings. proceed")
- **Retires / retired by:** none

### M2-W040 · active
- **Statement (as it will be printed):**
```tex
\begin{definition}[the spinor bundle of the fibre carried round time]\label{def:spinortime}
A \emph{family of complex structures carried round time} is, for each $s$, a complex structure $J_{s}$ on $E$ as in Definition~\ref{def:lift}, with a coordinate $z_{s}$ linear in $(\theta_{\psi},\theta_{\omega})$ and depending continuously on $s$, such that $M_{0}^{3}$ is holomorphic from $(E,J_{s+3L})$ to $(E,J_{s})$. For such a family, and for a line $N_{Y}$ on $Y$ with a lift of the fold $\lambda_{Y}$, the \emph{spinor bundle of the fibre carried round time} is the bundle on $Y$ whose fibre over $(p,s)$ is that of $\Lambda^{0,*}_{J_{s}}\otimes N_{Y}$, the spinor bundle of Definition~\ref{def:lift} for $J_{s}$, the $(0,1)$-forms at $(M_{0}^{3}p,s)$ and at $(p,s+3L)$ being joined by the pull-back by $M_{0}^{3}$; its \emph{lift of the fold} is $\iota^{*}\otimes\lambda_{Y}$.
\end{definition}
```
- **Place:** `states 310`; after M2-W039
- **Step:** S04c
- **Rests on:** M2-W022 (the spinor bundle $\Lambda^{0,*}\otimes N$ of the fibre and its lift $\iota^{*}\otimes\lambda$), M2-W039
- **Mark:** A definition, confirmed by read-back; no numbered choice: at each time it is the spinor bundle of M2-W022 for $J_{s}$, and the $(0,1)$-forms of the fibre are joined round time as the geometry joins the fibre (by the pull-back by $M_{0}^{3}$). Hand steps, in full: a linear map holomorphic from $J_{s+3L}$ to $J_{s}$ carries, by pull-back, the $(0,1)$-forms of $J_{s}$ at $M_{0}^{3}p$ to $(0,1)$-forms of $J_{s+3L}$ at $p$ (the pull-back of $\mathrm{d}\bar z_{s}$ is $\mathrm{d}(\bar z_{s}\circ M_{0}^{3})$, a multiple of $\mathrm{d}\bar z_{s+3L}$, M2-W048); the $(0,1)$-forms of $J_{s}$ at $(p,s)$, $s\in\R$, make a continuous line in the complex cotangent bundle of $E$ pulled back to $E\times\R$, $J_{s}$ being continuous in $s$, and the joining gives a line on $Y$; the fold commutes with $M_{0}^{3}$ (M2-W039), so $\iota^{*}$ commutes with the pull-back by $M_{0}^{3}$ and $\iota^{*}\otimes\lambda_{Y}$ is well defined on $Y$, carries the fibre over $y$ to that over the image of $y$ under the fold, and applied twice is the identity. That M1's lengths give such a family is shown in M2-W048. Not claimed: that this bundle is the restriction of the spinor bundle of the whole geometry (card S04d), or the spinor bundle of a $\Spinc$ structure on $Y$
- **Tag:** none: a definition
- **Failure test:** a later step of M2 that needs the $(0,1)$-forms of the fibre joined round time otherwise than by the pull-back by $M_{0}^{3}$, or complex structures of the fibre that are not linear in $(\theta_{\psi},\theta_{\omega})$.
- **Confirmed:** Decision Log P203, 18 November 2026 (the read-back of S04c; the PI: "I confirm the four entries and the readings. proceed")
- **Retires / retired by:** none

### M2-W041 · active
- **Statement (as it will be printed):**
```tex
\begin{proposition}[along time]\label{prop:time}
Let $Y$ be as in Definition~\ref{def:time}. (i) For every line $N$ of degree three on $E$ and every lift $\lambda$ of the fold to $N$, there is a line $N_{Y}$ on $Y$ with a lift of the fold $\lambda_{Y}$ whose restriction to the fibre over $s=0$ is $N$ with $\lambda$; the sign of $\lambda_{Y}$ on the corner circle of $P_{i}$ is the sign of $\lambda$ at $P_{i}$. (ii) Two lines on $Y$ with lifts of the fold, whose restrictions to the fibre over $s=0$ are lines of degree three with lifts that have the same sign at each corner, are carried one to the other by an isomorphism that covers the identity of $Y$ and carries the one lift to the other. (iii) For every complex structure $J$ of $E$ as in Definition~\ref{def:lift}, with a coordinate linear in $(\theta_{\psi},\theta_{\omega})$, the spinor bundle $\Lambda^{0,*}_{J}\otimes N$ with $\iota^{*}\otimes\lambda$ is carried to $N\oplus N$ with $\lambda\oplus(-\lambda)$ by an isomorphism covering the identity of $E$; and for every family of complex structures carried round time, of which the lengths of M1, Proposition~5.8, give one, the spinor bundle of the fibre carried round time, with its lift of the fold, is carried to $N_{Y}\oplus N_{Y}$ with $\lambda_{Y}\oplus(-\lambda_{Y})$ by an isomorphism covering the identity of $Y$. Along time, therefore, the flux, the lift of the fold of Proposition~\ref{prop:pillowcase}(iv) and the step of M1 determine the spinor bundle of the fibre carried round time, with its lift of the fold, up to isomorphism, whichever such complex structures are taken: nothing is left free in it. \rigD
\end{proposition}
```
- **Place:** `states 320`; after M2-W040
- **Step:** S04c
- **Rests on:** M2-W039, M2-W040; M2-W043 to M2-W046, M2-W048, M2-W050, M2-W051 (its proof; M2-W050 and M2-W051 in place of M2-W042 and M2-W047, retired; flagged at P204: the statement is unchanged); M2-W022, M2-W023 (`prop:pillowcase`), M2-W024 (a twist of flux three is a line of degree three); M1 v7.3, Section 4.1, Theorem 4.2 (`thm:drive`), Proposition 5.8 (`prop:A2`), Corollary 7.8 (`cor:timecircle`), Appendix B; Verified References V-M2-7, V-M2-8
- **Mark:** CHECKED (the proof, M2-W043 to M2-W046, M2-W048, M2-W050, M2-W051; certificate `MEFProof/Paper_M2/M2_L3_time.lean`, fourteen theorems, which certify the finite and integer arithmetic only; script `papers/M2/checks/S04c_time.py`, parts (1) to (6)); confirmed by read-back. Not shown here: how the step acts on a state, or the element of the drive on spinors, M1 Corollary 7.8 being cited for it only to say that it is not addressed (card S05; the isomorphisms of the statement may change the joining by a factor, M2-W049); the base and space and the spinor bundle of the whole geometry (card S04d); complex structures of the fibre that are not linear in $(\theta_{\psi},\theta_{\omega})$; the holomorphic structure of the twist; how a state is differentiated (card S14). M1 says of the counts that they "do not depend on which such complex structure is taken" (l.829); (iii) says it of the bundle with its lift: an addition, not a contradiction
- **Tag:** [D]: proved from cited theorems (V-M2-7, V-M2-8) and from results of M1 and M2, among them M1 Proposition 5.8 and Corollary 7.8 and M2's Proposition `prop:pillowcase`, tagged [D]
- **Failure test:** two lines on $Y$ with lifts of the fold, of degree three on the fibre with the same signs, that no isomorphism covering the identity of $Y$ carries one to the other; a line of degree three on $E$ with a lift of the fold that is the restriction of no line on $Y$ with a lift; a family of complex structures carried round time whose $(0,1)$-forms are not a trivial line with the fold acting by $-1$; or an error in a cited statement (V-M2-7, V-M2-8) or in M2-W023.
- **Confirmed:** Decision Log P203, 18 November 2026 (the read-back of S04c; the PI: "I confirm the four entries and the readings. proceed")
- **Retires / retired by:** none

### M2-W042 · retired
- **Statement (as it will be printed):**
```tex
Let $D=\sum a_{i}P_{i}$ be a divisor on the corners and $\lambda$ the first or the second lift on $\mathcal{O}(D)$, as in step~(i) of the proof of Proposition~\ref{prop:pillowcase}. Away from the corners $1$ is a frame of $\mathcal{O}(D)$, and near $P_{i}$, with $z_{i}=z-P_{i}$, so is $z_{i}^{-a_{i}}$, as there. The map $M_{0}^{3}$ leaves $P_{i}$ in place (M1, Corollary~7.8), and near $P_{i}$ it acts on $z_{i}$ as on the plane. The function $\rho_{i}=z_{i}/M_{0}^{3}z_{i}$ on a small punctured disc about $P_{i}$ depends only on the direction of $z_{i}$, is unchanged by $z_{i}\mapsto-z_{i}$, and has a continuous logarithm $\log\rho_{i}$ that is unchanged by $z_{i}\mapsto-z_{i}$: $M_{0}^{3}$ is symmetric with the positive eigenvalues $\phi^{6}$ and $\phi^{-6}$ (M1, Theorem~4.2), so that each $(1-t)I+tM_{0}^{3}$, $0\leq t\leq1$, is invertible, and the lifting criterion \cite[Proposition~1.33]{Hatcher}, applied on the convex set of the pairs $(t,\alpha)$, $\alpha$ the angle of $z_{i}$, gives a logarithm of $z_{i}/((1-t)z_{i}+tM_{0}^{3}z_{i})$ that is constant at $t=0$ and whose change once round in $\alpha$ is therefore $0$ for every $t$. Let $\epsilon_{i}$ be continuous, $1$ near $P_{i}$, $0$ outside a small disc about $P_{i}$ and unchanged by the fold. The map of the pull-back $(M_{0}^{3})^{*}\mathcal{O}(D)$, whose fibre over $p$ is that of $\mathcal{O}(D)$ over $M_{0}^{3}p$, to $\mathcal{O}(D)$ that is multiplication by $e^{-\sum_{i}a_{i}\epsilon_{i}\log\rho_{i}}$ in the frames $1$ carries the frame $(M_{0}^{3}z_{i})^{-a_{i}}$ to $z_{i}^{-a_{i}}$ near $P_{i}$, and so is an isomorphism covering the identity of $E$; it carries the pull-back of $\lambda$ to $\lambda$, since the multiplier is unchanged by the fold.
```
- **Place:** `states 330`; the first step of the proof of Proposition `prop:time` (M2-W041)
- **Step:** S04c
- **Rests on:** M2-W026 (the frames of $\mathcal{O}(D)$; the first and second lifts as lifts of the fold); M1 v7.3, Theorem 4.2 (`thm:drive`; the eigenvalues), Corollary 7.8 (`cor:timecircle`; the corners left in place); Verified Reference V-M2-7
- **Mark:** READ: `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.339 ("its eigenvalues are $\phi^{\pm2}$"), l.952 ("which leaves every corner in place"); M2-W026 as logged. Verified reference V-M2-7 (Proposition 1.33, the covering $\R\to S^{1}$, convex sets). CHECKED: certificate `L3_A_is_M0_cubed`, `L3_A_symmetric`, `L3_A_completed_square`, `L3_A_fixes_corners`, `L3_A_commutes_fold`; script parts (1), (2) and (5) (the winding of $z/M_{0}^{3}z$ is $0$, and it is unchanged by $z\mapsto-z$, for four flat complex structures and three of the lengths). Hand steps, in full: the eigenvalues of $M_{0}^{3}$ are the cubes $\phi^{\pm6}$ of those of $M_{0}$; $M_{0}^{3}$ is symmetric, so $v\cdot M_{0}^{3}v>0$ for $v\neq0$ (also $13(13a^{2}+16ab+5b^{2})=(13a+8b)^{2}+b^{2}$), and $v\cdot((1-t)I+tM_{0}^{3})v=(1-t)\lvert v\rvert^{2}+t\,v\cdot M_{0}^{3}v>0$, so $(1-t)I+tM_{0}^{3}$ is invertible for $0\leq t\leq1$; $M_{0}^{3}P_{i}=P_{i}$ modulo $\Z^{2}$, so for $p$ near $P_{i}$, $M_{0}^{3}p-P_{i}\equiv M_{0}^{3}(p-P_{i})$, and with $z$ linear in $(\theta_{\psi},\theta_{\omega})$ the map acts on $z_{i}$ by a real-linear map of $\C$; $\rho_{i}(re^{i\alpha})=e^{i\alpha}/M_{0}^{3}e^{i\alpha}$ does not depend on $r$, and $\rho_{i}(-z_{i})=\rho_{i}(z_{i})$ by linearity; the function $(t,\alpha)\mapsto e^{i\alpha}/((1-t)e^{i\alpha}+tM_{0}^{3}e^{i\alpha})$ is continuous with no zero on the convex set $[0,1]\times\R$, which is path-connected, locally path-connected and has trivial fundamental group, so by Proposition 1.33 its quotient by its absolute value lifts through $s\mapsto(\cos2\pi s,\sin2\pi s)$, and it has a continuous logarithm $G(t,\alpha)$; $G(0,\alpha)$ is continuous with values in $2\pi i\Z$, so constant; $G(t,\alpha+2\pi)-G(t,\alpha)$ is continuous with values in $2\pi i\Z$ on a connected set, so constant, and it is $0$ at $t=0$; so $\alpha\mapsto G(1,\alpha)$ has period $2\pi$ and gives the logarithm $\log\rho_{i}$ on the punctured disc; $\log\rho_{i}(\alpha+\pi)-\log\rho_{i}(\alpha)$ is a constant $2\pi ik$, and applied twice it gives $4\pi ik=0$, so $k=0$; $\epsilon_{i}$ may be taken as a function of $\lvert z_{i}\rvert$, $1$ for $\lvert z_{i}\rvert\leq r/2$, $0$ for $\lvert z_{i}\rvert\geq r$ and linear between, with $r$ so small that the four discs are disjoint and $M_{0}^{3}$ carries the disc of radius $r$ into the set where the frame $z_{i}^{-a_{i}}$ stands; it is unchanged by the fold, which near $P_{i}$ is $z_{i}\mapsto-z_{i}$ (M2-W026); the pull-back of the frame $z_{i}^{-a_{i}}$ at $p$ is $(M_{0}^{3}z_{i})^{-a_{i}}$ times the pull-back of the frame $1$, and where $\epsilon_{i}=1$ the multiplier is $\rho_{i}^{-a_{i}}$, which carries it to $(M_{0}^{3}z_{i})^{-a_{i}}(M_{0}^{3}z_{i}/z_{i})^{a_{i}}=z_{i}^{-a_{i}}$; in the local frames the map is multiplication by a continuous function with no zero, so it is an isomorphism, its inverse being multiplication by the reciprocal; the first lift carries the frame $1$ over $p$ to the frame $1$ over $\iota(p)$, the second to $-1$ (M2-W026), and the pull-back of either carries the pulled-back frame $1$ over $p$ to that over $\iota(p)$, since $M_{0}^{3}\iota=\iota M_{0}^{3}$; the multiplier takes the same value at $p$ and at $\iota(p)$
- **Tag:** none (a step of a proof)
- **Failure test:** a divisor on the corners for which no isomorphism covering the identity of $E$ carries the pull-back of $\mathcal{O}(D)$ by $M_{0}^{3}$, with the pull-back of its first or second lift, to $\mathcal{O}(D)$ with that lift; or a winding of $z_{i}/M_{0}^{3}z_{i}$ other than $0$; or an error in the cited statement.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04c; Decision Log P203)
- **Retires / retired by:** retired by M2-W050 (Decision Log P204, 18 November 2026)

### M2-W043 · active
- **Statement (as it will be printed):**
```tex
(i). Let $N$ be a line of degree three on $E$ and $\lambda$ a lift of the fold to $N$. By Proposition~\ref{prop:pillowcase}(ii) and~(iii) and their proof, $N$ with $\lambda$ is carried to $\mathcal{O}(D)$ with its first or its second lift, for a divisor $D$ of flux three on the corners, by an isomorphism covering the identity of $E$ that carries lift to lift; with the step above there is therefore a continuous map $\Phi\colon N\to N$ that carries the fibre over each $p$ linearly and one-to-one onto the fibre over $M_{0}^{3}p$, with $\Phi\lambda=\lambda\Phi$. The line $N_{Y}$ is made from $N\times\R$ by taking $(v,s+3L)$ and $(\Phi(v),s)$ as one point, with $\lambda_{Y}(v,s)=(\lambda(v),s)$; it is a line on $Y$ \cite[p.~131]{Segal1968}, $\lambda_{Y}$ is a lift of the fold to it, its restriction to the fibre over $s=0$ is $N$ with $\lambda$, and its sign on the corner circle of $P_{i}$ is the sign of $\lambda$ at $P_{i}$.
```
- **Place:** `states 340`; the second step of the proof of Proposition `prop:time`
- **Step:** S04c
- **Rests on:** M2-W050 (in place of M2-W042, retired; flagged at P204: the statement is unchanged); M2-W023 (ii), (iii), M2-W038 (the eight patterns; two lifts with the same signs on two lines of degree three); M2-W039; Verified Reference V-M2-8
- **Mark:** READ: M2-W023 and M2-W038 as logged. Verified reference V-M2-8 (the clutching of G-vector bundles, p.131). Hand steps, in full: by M2-W023(ii) the signs of $\lambda$ have the product $-1$; by M2-W038 some $\mathcal{O}(D)$, $D$ of flux three on the corners, with its first or second lift, has the same four signs, and an isomorphism $\Xi\colon N\to\mathcal{O}(D)$ covering the identity carries $\lambda$ to that lift; with $\Psi$ the isomorphism of M2-W050 (M2-W042 before P204), which carries the fibre of $\mathcal{O}(D)$ over $M_{0}^{3}p$ to that over $p$, $\Phi=\Xi^{-1}\Psi^{-1}\Xi$ is continuous, carries the fibre over $p$ linearly and one-to-one onto that over $M_{0}^{3}p$, and commutes with $\lambda$; $(v,s+3L)$ and $(\Phi(v),s)$ lie over $(p,s+3L)$ and $(M_{0}^{3}p,s)$, which are one point of $Y$; $\lambda_{Y}$ is well defined since $\Phi\lambda=\lambda\Phi$, linear on fibres, covers the fold of $Y$, and applied twice is the identity; at $(P_{i},0)$ it is $\lambda$ at $P_{i}$, and by M2-W039 its sign is the same along the corner circle. $\lambda_{Y}$ is continuous since $\lambda$ is and the quotient map $N\times\R\to N_{Y}$ is open onto its image near each point. **Identification steps** (added after the fresh reader's check, P204, which found them only in M2-W044 and in the note to V-M2-8): a line with a lift of the fold is a G-vector bundle for the group $G$ of order two whose element other than the identity is the fold (V-M2-8, p.129); the line made from $N\times\R$ is the bundle that the clutching statement gives when $Y$ is cut into the images of $E\times[0,3L/2]$ and $E\times[3L/2,3L]$, which meet in the fibres over $s=3L/2$ and $s=0$, the bundles $N\times[0,3L/2]$ and $N\times[3L/2,3L]$ being matched by the identity over $s=3L/2$ and by $\Phi$ over $s=0$; the hypotheses of the statement: the two pieces are compact (images of $E\times[0,3L/2]$ and $E\times[3L/2,3L]$, $E$ being compact), and they are G-subspaces, the fold acting on each fibre; the two bundles are G-vector bundles with the lift $\lambda$ on each fibre, and the matching maps are G-isomorphisms, since the identity and $\Phi$ commute with $\lambda$
- **Tag:** none (a step of a proof)
- **Failure test:** a line of degree three on $E$ with a lift of the fold for which no such $\Phi$ exists; or an error in the cited statement.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04c; Decision Log P203)
- **Retires / retired by:** none

### M2-W044 · active
- **Statement (as it will be printed):**
```tex
Let $N'_{Y}$ be a line on $Y$ with a lift of the fold $\lambda'_{Y}$, and $N'$ with $\lambda'$ its restriction to the fibre over $s=0$. A line with a lift of the fold is a $G$-vector bundle \cite[p.~129]{Segal1968}, for the group $G$ of order two whose element other than the identity is the fold, acting on $E\times[0,3L]$ by $(p,s)\mapsto(\iota(p),s)$. The maps $(p,s)\mapsto(p,s)$ and $(p,s)\mapsto(p,0)$ of the compact $E\times[0,3L]$ are joined by the maps $(p,s)\mapsto(p,(1-t)s)$, $0\leq t\leq1$, each of which commutes with the fold, so that the pull-back of $N'_{Y}$ to $E\times[0,3L]$, with its lift, is carried to $N'\times[0,3L]$ with $\lambda'$ by an isomorphism covering the identity that carries lift to lift \cite[Proposition~(1.3)]{Segal1968}. Through it the fibres over $(p,3L)$ and $(M_{0}^{3}p,0)$, which are one in $N'_{Y}$, give a map $\Phi'\colon N'\to N'$ as in the step above, with $\Phi'\lambda'=\lambda'\Phi'$, and $N'_{Y}$ with $\lambda'_{Y}$ is carried to the line made from $N'$, $\lambda'$ and $\Phi'$ as in the step above.
```
- **Place:** `states 350`; the third step of the proof of Proposition `prop:time`
- **Step:** S04c
- **Rests on:** M2-W039, M2-W043; Verified Reference V-M2-8
- **Mark:** Verified reference V-M2-8 (Proposition (1.3), in the setting "G is a compact group", and the definition of a G-vector bundle, p.129), READ at source. **Identification steps** (CLAUDE.md §5; the note to V-M2-8): a line with a lift of the fold is a G-vector bundle of rank one for the group of order two, the lift being the action of its element other than the identity; "G-homotopic G-maps" is read as maps joined by a homotopy each of whose stages is a G-map. Hand steps, in full: a group of order two is compact; $E\times[0,3L]$ is compact; the map $q\colon E\times[0,3L]\to Y$ commutes with the fold, so the pull-back of $N'_{Y}$ by $q$, with the pull-back of $\lambda'_{Y}$, is a G-vector bundle; each map $(p,s)\mapsto(p,(1-t)s)$ commutes with the fold; at $t=0$ it is the identity, and the pull-back by the map at $t=1$ has over $(p,s)$ the fibre of $N'_{Y}$ over $(p,0)$, that is $N'\times[0,3L]$ with $\lambda'$; let $\Theta$ be the isomorphism Segal's proposition gives; $q(p,3L)=q(M_{0}^{3}p,0)$, so the fibres of the pull-back over $(p,3L)$ and $(M_{0}^{3}p,0)$ are one fibre of $N'_{Y}$, and $\Phi'(v)=\Theta_{(M_{0}^{3}p,0)}\Theta_{(p,3L)}^{-1}(v)$ carries the fibre of $N'$ over $p$ linearly and one-to-one onto that over $M_{0}^{3}p$, is continuous in $p$, and commutes with $\lambda'$ since $\Theta$ carries lift to lift; $\Theta$ then passes to the quotients, and gives an isomorphism of $N'_{Y}$ onto the line made from $N'$, $\lambda'$ and $\Phi'$ that covers the identity of $Y$ and carries lift to lift
- **Tag:** none (a step of a proof)
- **Failure test:** a line on $Y$ with a lift of the fold that no isomorphism covering the identity of $Y$ carries to a line made from its restriction to the fibre over $s=0$ and a map as in M2-W043; or an error in the cited statement.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04c; Decision Log P203)
- **Retires / retired by:** none

### M2-W045 · active
- **Statement (as it will be printed):**
```tex
Let $\Phi$ and $\Phi'$ be two maps as in step~(i) for the same $N$ and $\lambda$. Then $\Phi'(v)=\beta(M_{0}^{3}p)\,\Phi(v)$ for $v$ over $p$, with $\beta\colon E\to\C\setminus\{0\}$ continuous, and $\Phi'\lambda=\lambda\Phi'$ gives $\beta(\iota(p))=\beta(p)$. As in the proof of Proposition~\ref{prop:pillowcase}, $\beta=e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta}$ with $\mu,\nu$ integers and $\eta$ continuous of period one in each variable. Then $\eta(-\theta_{\psi},-\theta_{\omega})-\eta(\theta_{\psi},\theta_{\omega})-4\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})$ is continuous with values in $2\pi i\Z$, so it is constant, and it is $0$ at $(0,0)$; adding $1$ to $\theta_{\psi}$ changes it by $-4\pi i\mu$, so that $\mu=0$, and in the same way $\nu=0$. So $\beta=e^{\eta}$, with $\eta(-\theta_{\psi},-\theta_{\omega})=\eta(\theta_{\psi},\theta_{\omega})$.
```
- **Place:** `states 360`; the fourth step of the proof of Proposition `prop:time`
- **Step:** S04c
- **Rests on:** M2-W043; M2-W035 (the form of a continuous function on $E$ with no zero)
- **Mark:** READ: M2-W035 as logged (its argument uses only that the function is continuous on $E$, with no zero, and so of period one on $\R^{2}$). CHECKED: certificate `L3_four_mu`, `L3_shift` (the integer arithmetic of the shift); script part (6). Hand steps, in full: $\Phi'(v)$ and $\Phi(v)$ lie in the fibre over $M_{0}^{3}p$, a line, and $\Phi(v)\neq0$ for $v\neq0$, so $\Phi'(v)=\beta(M_{0}^{3}p)\Phi(v)$ with $\beta(M_{0}^{3}p)$ not depending on $v$, by linearity, continuous by local frames; $M_{0}^{3}$ is one-to-one onto $E$, so $\beta$ is defined on the whole of $E$; $\Phi'\lambda(v)=\beta(M_{0}^{3}\iota(p))\lambda\Phi(v)$ and $\lambda\Phi'(v)=\beta(M_{0}^{3}p)\lambda\Phi(v)$, and $M_{0}^{3}\iota=\iota M_{0}^{3}$, so $\beta\circ\iota=\beta$; with $\beta=e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta}$, $\beta(-\theta_{\psi},-\theta_{\omega})=\beta(\theta_{\psi},\theta_{\omega})$ gives that the exponential of the quantity of the statement is $1$; the quantity is continuous on the connected $\R^{2}$ with values in $2\pi i\Z$, so constant, and at $(0,0)$ it is $0$; $\eta$ has period one, so adding $1$ to $\theta_{\psi}$ changes the quantity by $-4\pi i\mu$ alone, which is $0$, so $4\mu=0$ and $\mu=0$; the same with $\theta_{\omega}$ and $\nu$; then $\eta(-\theta_{\psi},-\theta_{\omega})=\eta(\theta_{\psi},\theta_{\omega})$
- **Tag:** none (a step of a proof)
- **Failure test:** a continuous $\beta\colon E\to\C\setminus\{0\}$ with $\beta\circ\iota=\beta$ of the form $e^{2\pi i(\mu\theta_{\psi}+\nu\theta_{\omega})}e^{\eta}$ with $\mu$ or $\nu$ not $0$.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04c; Decision Log P203)
- **Retires / retired by:** none

### M2-W046 · active
- **Statement (as it will be printed):**
```tex
(ii). Let $N_{Y}$ with $\lambda_{Y}$ and $N'_{Y}$ with $\lambda'_{Y}$ be as in~(ii), and $N$ with $\lambda$ the restriction of the first to the fibre over $s=0$. By the step above but one, each is carried to the line made from its restriction and a map as in step~(i); by Proposition~\ref{prop:pillowcase}(iii) and its proof, the restriction of the second is carried to $N$ with $\lambda$ by an isomorphism covering the identity of $E$ that carries lift to lift, and through it its map becomes one for $N$ and $\lambda$. It is therefore enough that the lines made from $N$, $\lambda$ and two maps $\Phi$ and $\Phi'$ be carried one to the other. By the step above $\Phi'(v)=e^{\eta(M_{0}^{3}p)}\Phi(v)$ for $v$ over $p$, with $\eta$ unchanged by the fold, and the map that sends $(v,s)$, $v$ over $p$ and $0\leq s\leq3L$, to $(e^{(1-s/3L)\eta(p)}v,s)$ does it: at $s=3L$ it is the identity and at $s=0$ it is multiplication by $e^{\eta(q)}$ on the fibre over $q$, so that it respects the joining; it covers the identity of $Y$, and it carries lift to lift, since $\eta(\iota(p))=\eta(p)$.
```
- **Place:** `states 370`; the fifth step of the proof of Proposition `prop:time`
- **Step:** S04c
- **Rests on:** M2-W043 to M2-W045; M2-W023 (iii), M2-W038
- **Mark:** READ: M2-W023 and M2-W038 as logged. Hand steps, in full: the restrictions of the two lines to the fibre over $s=0$ are lines of degree three with lifts with the same signs, so by M2-W038 an isomorphism $\Xi'$ covering the identity of $E$ carries the second, with its lift, to the first; if $\Phi'_{0}$ is a map as in M2-W043 for the second, $\Xi'\Phi'_{0}\Xi'^{-1}$ is one for $N$ and $\lambda$, and $\Xi'\times\mathrm{id}$ carries the line made with $\Phi'_{0}$ to the line made with it, lift to lift; for the map $\Theta(v,s)=(e^{(1-s/3L)\eta(p)}v,s)$ from the line made with $\Phi$ to the line made with $\Phi'$: in the first, $(v,3L)$ and $(\Phi(v),0)$ are one point; $\Theta(v,3L)=(v,3L)$, which in the second is the point $(\Phi'(v),0)=(e^{\eta(M_{0}^{3}p)}\Phi(v),0)$; $\Theta(\Phi(v),0)=(e^{\eta(M_{0}^{3}p)}\Phi(v),0)$, the same point; so $\Theta$ is well defined on the line on $Y$; it is linear and one-to-one on each fibre, with continuous inverse $(v,s)\mapsto(e^{-(1-s/3L)\eta(p)}v,s)$; $\eta(\iota(p))=\eta(p)$ gives $\Theta(\lambda(v),s)=(\lambda(e^{(1-s/3L)\eta(p)}v),s)$, that is $\lambda_{Y}\Theta=\Theta\lambda_{Y}$
- **Tag:** none (a step of a proof)
- **Failure test:** as M2-W041, its item (ii).
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04c; Decision Log P203)
- **Retires / retired by:** none

### M2-W047 · retired
- **Statement (as it will be printed):**
```tex
(iii), on a fibre. Let $J$ be a complex structure of $E$ as in Definition~\ref{def:lift}, with a coordinate $z$ linear in $(\theta_{\psi},\theta_{\omega})$. Then $\mathrm{d}\bar z$ is a $(0,1)$-form with no zero, and $\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$ (Definition~\ref{def:lift}). On a surface the $(0,*)$-forms are the functions and the $(0,1)$-forms, so the map that sends $1\otimes v+\mathrm{d}\bar z\otimes w$ to $(v,w)$ carries $\Lambda^{0,*}_{J}\otimes N$ to $N\oplus N$; it covers the identity of $E$ and carries $\iota^{*}\otimes\lambda$ to $\lambda\oplus(-\lambda)$.
```
- **Place:** `states 380`; the sixth step of the proof of Proposition `prop:time`
- **Step:** S04c
- **Rests on:** M2-W022 (the spinor bundle $\Lambda^{0,*}\otimes N$ and its lift $\iota^{*}\otimes\lambda$; $\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$)
- **Mark:** READ: M2-W022 as logged ("$\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$", which it quotes from M1 Section 7.4). Hand steps, in full: a coordinate $z$ linear in $(\theta_{\psi},\theta_{\omega})$ is a coordinate of $J$ near every point, its differential being the same at every point, so $\mathrm{d}\bar z$ is a $(0,1)$-form on the whole of $E$ with no zero; $\iota(z)=-z$ gives $\iota^{*}\mathrm{d}\bar z=\mathrm{d}(-\bar z)=-\mathrm{d}\bar z$; on a surface $\Lambda^{0,*}=\Lambda^{0,0}\oplus\Lambda^{0,1}$, $\Lambda^{0,0}$ being the functions, and $\Lambda^{0,1}$ a line spanned at each point by $\mathrm{d}\bar z$; $(\iota^{*}\otimes\lambda)(1\otimes v+\mathrm{d}\bar z\otimes w)=1\otimes\lambda(v)+(-\mathrm{d}\bar z)\otimes\lambda(w)$, which the map sends to $(\lambda(v),-\lambda(w))$
- **Tag:** none (a step of a proof)
- **Failure test:** a complex structure of $E$ with a coordinate linear in $(\theta_{\psi},\theta_{\omega})$ whose $(0,1)$-forms have no section without a zero, or on which the fold does not act by $-1$.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04c; Decision Log P203)
- **Retires / retired by:** retired by M2-W051 (Decision Log P204, 18 November 2026)

### M2-W048 · active
- **Statement (as it will be printed):**
```tex
(iii), along time. Let $J_{s}$, with coordinates $z_{s}$, be a family of complex structures carried round time. Since $M_{0}^{3}$ is linear and holomorphic from $J_{s+3L}$ to $J_{s}$, $z_{s}\circ M_{0}^{3}=\delta(s)\,z_{s+3L}$ for a number $\delta(s)\neq0$, continuous in $s$, and the pull-back by $M_{0}^{3}$ carries $\mathrm{d}\bar z_{s}$ at $(M_{0}^{3}p,s)$ to $\overline{\delta(s)}\,\mathrm{d}\bar z_{s+3L}$ at $(p,s+3L)$. By the lifting criterion \cite[Proposition~1.33]{Hatcher} on $\R$, $\overline{\delta(s)}=e^{\log\overline{\delta}(s)}$ with $\log\overline{\delta}$ continuous; with $\Delta(s)=(s/3L)\log\overline{\delta}(0)$ for $0\leq s\leq3L$ and $\Delta(s+3L)=\Delta(s)+\log\overline{\delta}(s)$ for every $s$, the form $e^{\Delta(s)}\mathrm{d}\bar z_{s}$ is a section with no zero of the $(0,1)$-forms carried round time, and the fold carries it to its negative. As in (iii) on a fibre, the spinor bundle of the fibre carried round time, with its lift of the fold, is then carried to $N_{Y}\oplus N_{Y}$ with $\lambda_{Y}\oplus(-\lambda_{Y})$. The lengths of M1, Proposition~5.8, give a family with $\delta=1$: with $x$ and $y$ the coordinates there along $v_{1}$ and $v_{2}$, $z_{s}=e^{-\kappa s}y+ie^{\kappa s}x$ keeps the handedness, has $\lvert\mathrm{d}z_{s}\rvert^{2}=e^{2\kappa s}\mathrm{d}x^{2}+e^{-2\kappa s}\mathrm{d}y^{2}$, the lengths at $s$, and $z_{s}\circ M_{0}^{3}=z_{s+3L}$, since $M_{0}^{3}$ multiplies $x$ by $\phi^{6}$ and $y$ by $\phi^{-6}$ and $e^{3\kappa L}=\phi^{6}$.
```
- **Place:** `states 390`; the last step of the proof of Proposition `prop:time`
- **Step:** S04c
- **Rests on:** M2-W040, M2-W051 (in place of M2-W047, retired; flagged at P204: the statement is unchanged); M1 v7.3, Section 4.1 (l.308, the handedness); M1 v7.3, Theorem 4.2 (`thm:drive`; the eigenvalues), Proposition 5.8 (`prop:A2`; $v_{1}$, $v_{2}$, $x$, $y$, the lengths, $e^{\kappa L}=\phi^{2}$); Verified Reference V-M2-7
- **Mark:** READ: `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.308 ("A step of the drive keeps the handedness that Definition~\ref{def:levels} fixes on the internal piece: as a map of $\Ttwo=\R^{2}/\Z^{2}$ it preserves orientation, and its matrix $M$ has determinant $+1$"), l.704 ("Let $v_{1}$ be a unit eigenvector of $M_{0}$ with eigenvalue $\phi^{2}$, let $v_{2}=Sv_{1}$ … and let $x,y$ be the coordinates on the fibre $\Ttwo=\R^{2}/\Z^{2}$ along $v_{1},v_{2}$"; "$\mathrm{d}s^{2}+e^{2\kappa s}\mathrm{d}x^{2}+e^{-2\kappa s}\mathrm{d}y^{2}$"; "if and only if $e^{\kappa L}=\phi^{2}$"), l.339 (the eigenvalues $\phi^{\pm2}$). Verified reference V-M2-7 (on $\R$, which is convex). CHECKED: certificate `L3_phi_six`, `L3_phi_inv_six`, `L3_v2_is_S_v1`, `L3_eigen_v1`, `L3_eigen_v2`, `L3_orientation`; script parts (3) and (4). Hand steps, in full: $z_{s}\circ M_{0}^{3}$ is linear in $(\theta_{\psi},\theta_{\omega})$ and holomorphic for $J_{s+3L}$, and a function linear over the reals and holomorphic for $J_{s+3L}$ is a constant multiple of $z_{s+3L}$; $\delta(s)\neq0$ since $M_{0}^{3}$ is one-to-one; $\delta$ is continuous since $z_{s}$ and $z_{s+3L}$ are; the pull-back is $\mathrm{d}(\bar z_{s}\circ M_{0}^{3})=\overline{\delta(s)}\,\mathrm{d}\bar z_{s+3L}$; $\Delta$ is continuous, both definitions giving $\log\overline{\delta}(0)$ at $s=3L$; at the point $(p,s+3L)=(M_{0}^{3}p,s)$ the pull-back of $e^{\Delta(s)}\mathrm{d}\bar z_{s}$ is $e^{\Delta(s)}\overline{\delta(s)}\,\mathrm{d}\bar z_{s+3L}=e^{\Delta(s+3L)}\mathrm{d}\bar z_{s+3L}$, so the form is one section on $Y$; $\iota^{*}$ carries it to its negative, as in M2-W047; the map $1\otimes v+e^{\Delta(s)}\mathrm{d}\bar z_{s}\otimes w\mapsto(v,w)$ is as in M2-W047. The lengths: $v_{1}$ is a multiple of $(\phi,1)$ and $v_{2}=Sv_{1}$ the same multiple of $(1,-\phi)$, and $\det[(\phi,1),(1,-\phi)]=-(2+\phi)<0$, so that $(y,x)$, and not $(x,y)$, is ordered with the handedness of $(\theta_{\psi},\theta_{\omega})$, and $z_{s}=e^{-\kappa s}y+ie^{\kappa s}x$ keeps the handedness; $\lvert\mathrm{d}z_{s}\rvert^{2}=e^{-2\kappa s}\mathrm{d}y^{2}+e^{2\kappa s}\mathrm{d}x^{2}$, the lengths of l.704 on the fibre at $s$; $M_{0}^{3}$ is symmetric with $M_{0}^{3}v_{1}=\phi^{6}v_{1}$ and $M_{0}^{3}v_{2}=\phi^{-6}v_{2}$, so $x\circ M_{0}^{3}=\phi^{6}x$ and $y\circ M_{0}^{3}=\phi^{-6}y$ ($x(p)$ and $y(p)$ being the components of $p$ along the orthonormal $v_{1}$, $v_{2}$); $e^{3\kappa L}=(e^{\kappa L})^{3}=\phi^{6}$; so $z_{s}\circ M_{0}^{3}=e^{-\kappa(s+3L)}y+ie^{\kappa(s+3L)}x=z_{s+3L}$, $M_{0}^{3}$ is holomorphic from $J_{s+3L}$ to $J_{s}$, and $\delta=1$; $z_{s}$ is linear in $(\theta_{\psi},\theta_{\omega})$ and continuous in $s$. The direction of the join is that of M2-W039. **Identification steps** (added after the fresh reader's check, P204): l.308 ties the handedness to the orientation of $\R^{2}/\Z^{2}$ but does not say which of the two orders of $(\theta_{\psi},\theta_{\omega})$ it is; it is taken here as the order $(\theta_{\psi},\theta_{\omega})$; with the other order, $\bar z_{s}$ serves in place of $z_{s}$, and $\bar z_{s}\circ M_{0}^{3}=\bar z_{s+3L}$ follows from $z_{s}\circ M_{0}^{3}=z_{s+3L}$ by conjugation, so that $\delta=1$ again; and M1's "the coordinates on the fibre … along $v_{1},v_{2}$" (l.704) are read as the components in the basis $(v_{1},v_{2})$, which is orthonormal ($v_{1}$ a unit vector and $v_{2}=Sv_{1}$ its quarter-turn)
- **Tag:** none (a step of a proof)
- **Failure test:** a family of complex structures carried round time whose $(0,1)$-forms have no section on $Y$ without a zero; or, with the lengths of M1 Proposition 5.8, $z_{s}\circ M_{0}^{3}\neq z_{s+3L}$.
- **Confirmed:** checked, not read back, 18 November 2026 (the PI told in plain English in the read-back of S04c; Decision Log P203)
- **Retires / retired by:** none

### M2-W049 · active
- **Statement (as it will be printed):**
```tex
Proposition~\ref{prop:time} speaks of the fibre carried round time, of the spinor bundle as a bundle, and of it up to isomorphism. An isomorphism covering the identity of $Y$ may change by a factor how the fibre over $s+3L$ is joined to the fibre over $s$; the proposition therefore says nothing of how the step acts on a state, or of the element of the drive on spinors (M1, Corollary~7.8). Nothing is said here of the base and space, of the spinor bundle of the whole geometry, of the holomorphic structure of the twist, or of how a state is differentiated.
```
- **Place:** `states 400`; after the proof of Proposition `prop:time` (M2-W048), the last entry of S04c
- **Step:** S04c
- **Rests on:** M2-W039 to M2-W048 and M2-W050, M2-W051 (M2-W042 and M2-W047 retired at P204; flagged: the statement is unchanged); M1 v7.3, Corollary 7.8 (`cor:timecircle`)
- **Mark:** READ against M2-W039 to M2-W048 as logged (and, after P204, against M2-W050 and M2-W051, which replace M2-W042 and M2-W047 with no change to what they prove); M1 Corollary 7.8 is cited only to say that the element of the drive on spinors is not addressed (card S04c's line "May use" amended for it after the fresh reader's check, P204); confirmed by read-back. It carries no reading: it says what the proposition does not say. That an isomorphism may change the joining by a factor: the map of M2-W046 changes the joining by $e^{\eta}$, and a constant factor $c\neq0$ is so changed by $\eta=\log c$
- **Tag:** none
- **Failure test:** a sentence of M2-W039 to M2-W048 that speaks of how the step acts on a state, of the element of the drive on spinors, of the base and space, of the spinor bundle of the whole geometry, of the holomorphic structure of the twist, or of differentiation. The points left are taken up by cards S04d (the whole geometry), S05 (how the step acts on a state) and S14 (differentiation), and are closed in M2.
- **Confirmed:** Decision Log P203, 18 November 2026 (the read-back of S04c; the PI: "I confirm the four entries and the readings. proceed")
- **Retires / retired by:** none

### M2-W050 · active
- **Statement (as it will be printed):**
```tex
Let $D=\sum a_{i}P_{i}$ be a divisor on the corners and $\lambda$ the first or the second lift on $\mathcal{O}(D)$, as in step~(i) of the proof of Proposition~\ref{prop:pillowcase}. Away from the corners the constant $1$ is a frame of $\mathcal{O}(D)$, and near $P_{i}$, with $z_{i}=z-P_{i}$, so is $z_{i}^{-a_{i}}$. The map $M_{0}^{3}$ leaves $P_{i}$ in place (M1, Corollary~7.8), and near $P_{i}$ it acts on $z_{i}$ as on the plane. The function $\rho_{i}=z_{i}/M_{0}^{3}z_{i}$ on a small punctured disc about $P_{i}$ depends only on the direction of $z_{i}$, is unchanged by $z_{i}\mapsto-z_{i}$, and has a continuous logarithm $\log\rho_{i}$ that is unchanged by $z_{i}\mapsto-z_{i}$: $M_{0}^{3}$ is symmetric with the positive eigenvalues $\phi^{6}$ and $\phi^{-6}$ (M1, Theorem~4.2), so that each $(1-t)I+tM_{0}^{3}$, $0\leq t\leq1$, is invertible, and the lifting criterion \cite[Proposition~1.33]{Hatcher}, applied on the convex set of the pairs $(t,\alpha)$, $\alpha$ the angle of $z_{i}$, gives a logarithm of $z_{i}/((1-t)z_{i}+tM_{0}^{3}z_{i})$ that is constant at $t=0$ and whose change once round in $\alpha$ is therefore $0$ for every $t$. Let $\epsilon_{i}$ be continuous, $1$ near $P_{i}$, $0$ outside a small disc about $P_{i}$ and unchanged by the fold. The map of the pull-back $(M_{0}^{3})^{*}\mathcal{O}(D)$, whose fibre over $p$ is that of $\mathcal{O}(D)$ over $M_{0}^{3}p$, to $\mathcal{O}(D)$ that is multiplication by $e^{-\sum_{i}a_{i}\epsilon_{i}\log\rho_{i}}$ in the frames $1$ carries the frame $(M_{0}^{3}z_{i})^{-a_{i}}$ to $z_{i}^{-a_{i}}$ near $P_{i}$, and so is an isomorphism covering the identity of $E$; it carries the pull-back of $\lambda$ to $\lambda$, since the multiplier is unchanged by the fold.
```
- **Place:** `states 330`; the first step of the proof of Proposition `prop:time` (M2-W041), in the place of M2-W042, which it replaces
- **Step:** S04c (a correction after the fresh reader's check, P204)
- **Rests on:** M2-W026 (the frames of $\mathcal{O}(D)$; the first and second lifts as lifts of the fold); M1 v7.3, Theorem 4.2 (`thm:drive`; the eigenvalues), Corollary 7.8 (`cor:timecircle`; the corners left in place); Verified Reference V-M2-7
- **Mark:** READ: `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` l.339 ("its eigenvalues are $\phi^{\pm2}$"), l.952 ("which leaves every corner in place"); M2-W026 as logged. Verified reference V-M2-7 (Proposition 1.33, the covering $\R\to S^{1}$, convex sets). CHECKED: certificate `L3_A_is_M0_cubed`, `L3_A_symmetric`, `L3_A_completed_square`, `L3_A_fixes_corners`, `L3_A_commutes_fold`; script parts (1), (2) and (5) (the winding of $z/M_{0}^{3}z$ is $0$, and it is unchanged by $z\mapsto-z$, for four flat complex structures and three of the lengths). Hand steps, in full: the eigenvalues of $M_{0}^{3}$ are the cubes $\phi^{\pm6}$ of those of $M_{0}$; $M_{0}^{3}$ is symmetric, so $v\cdot M_{0}^{3}v>0$ for $v\neq0$ (the identity $13(13a^{2}+16ab+5b^{2})=(13a+8b)^{2}+b^{2}$ behind it is certified over the integers only, `L3_A_completed_square`; for real vectors it is this hand step), and $v\cdot((1-t)I+tM_{0}^{3})v=(1-t)\lvert v\rvert^{2}+t\,v\cdot M_{0}^{3}v>0$, so $(1-t)I+tM_{0}^{3}$ is invertible for $0\leq t\leq1$; $M_{0}^{3}P_{i}=P_{i}$ modulo $\Z^{2}$, so for $p$ near $P_{i}$, $M_{0}^{3}p-P_{i}\equiv M_{0}^{3}(p-P_{i})$, and with $z$ linear in $(\theta_{\psi},\theta_{\omega})$ the map acts on $z_{i}$ by a real-linear map of $\C$; $\rho_{i}(re^{i\alpha})=e^{i\alpha}/M_{0}^{3}e^{i\alpha}$ does not depend on $r$, and $\rho_{i}(-z_{i})=\rho_{i}(z_{i})$ by linearity; the function $(t,\alpha)\mapsto e^{i\alpha}/((1-t)e^{i\alpha}+tM_{0}^{3}e^{i\alpha})$ is continuous with no zero on the convex set $[0,1]\times\R$, which is path-connected, locally path-connected and has trivial fundamental group, so by Proposition 1.33 its quotient by its absolute value lifts through $s\mapsto(\cos2\pi s,\sin2\pi s)$, and it has a continuous logarithm $G(t,\alpha)$; $G(0,\alpha)$ is continuous with values in $2\pi i\Z$, so constant; $G(t,\alpha+2\pi)-G(t,\alpha)$ is continuous with values in $2\pi i\Z$ on a connected set, so constant, and it is $0$ at $t=0$; so $\alpha\mapsto G(1,\alpha)$ has period $2\pi$ and gives the logarithm $\log\rho_{i}$ on the punctured disc; $\log\rho_{i}(\alpha+\pi)-\log\rho_{i}(\alpha)$ is a constant $2\pi ik$, and applied twice it gives $4\pi ik=0$, so $k=0$; $\epsilon_{i}$ may be taken as a function of $\lvert z_{i}\rvert$, $1$ for $\lvert z_{i}\rvert\leq r/2$, $0$ for $\lvert z_{i}\rvert\geq r$ and linear between, with $r$ so small that the four discs are disjoint and $M_{0}^{3}$ carries the disc of radius $r$ into the set where the frame $z_{i}^{-a_{i}}$ stands; it is unchanged by the fold, which near $P_{i}$ is $z_{i}\mapsto-z_{i}$ (M2-W026); the pull-back of the frame $z_{i}^{-a_{i}}$ at $p$ is $(M_{0}^{3}z_{i})^{-a_{i}}$ times the pull-back of the frame $1$, and where $\epsilon_{i}=1$ the multiplier is $\rho_{i}^{-a_{i}}$, which carries it to $(M_{0}^{3}z_{i})^{-a_{i}}(M_{0}^{3}z_{i}/z_{i})^{a_{i}}=z_{i}^{-a_{i}}$; in the local frames the map is multiplication by a continuous function with no zero, so it is an isomorphism, its inverse being multiplication by the reciprocal; the first lift carries the frame $1$ over $p$ to the frame $1$ over $\iota(p)$, the second to $-1$ (M2-W026), and the pull-back of either carries the pulled-back frame $1$ over $p$ to that over $\iota(p)$, since $M_{0}^{3}\iota=\iota M_{0}^{3}$; the multiplier takes the same value at $p$ and at $\iota(p)$; the frames: the constant function $1$ is a section of $\mathcal{O}(D)$ with no zero away from the corners, and near $P_{i}$ the sections are the functions with a pole of order at most $a_{i}$ at $P_{i}$, of which $z_{i}^{-a_{i}}$ is one with no zero, as the mark of M2-W026 has it. Changed from M2-W042 (fresh reader, P204): "as there", which pointed to the statement of M2-W026, where the frames are not printed (they are in its mark), is removed and the frames are said in the sentence itself; the mark says that `L3_A_completed_square` is over the integers only. Nothing else changed
- **Tag:** none (a step of a proof)
- **Failure test:** a divisor on the corners for which no isomorphism covering the identity of $E$ carries the pull-back of $\mathcal{O}(D)$ by $M_{0}^{3}$, with the pull-back of its first or second lift, to $\mathcal{O}(D)$ with that lift; or a winding of $z_{i}/M_{0}^{3}z_{i}$ other than $0$; or an error in the cited statement.
- **Confirmed:** checked, not read back, 18 November 2026 (a correction of the checked step M2-W042; the PI told in plain English in the closing report of chat C3c; Decision Log P204)
- **Retires / retired by:** retires M2-W042

### M2-W051 · active
- **Statement (as it will be printed):**
```tex
(iii), on a fibre. Let $J$ be a complex structure of $E$ as in Definition~\ref{def:lift}, with a coordinate $z$ linear in $(\theta_{\psi},\theta_{\omega})$. Then $\mathrm{d}\bar z$ is a $(0,1)$-form with no zero, and $\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$ (Definition~\ref{def:lift}). On a surface the $(0,*)$-forms are the functions and the $(0,1)$-forms, so the map that sends $1\otimes v+\mathrm{d}\bar z\otimes v'$ to $(v,v')$ carries $\Lambda^{0,*}_{J}\otimes N$ to $N\oplus N$; it covers the identity of $E$ and carries $\iota^{*}\otimes\lambda$ to $\lambda\oplus(-\lambda)$.
```
- **Place:** `states 380`; the sixth step of the proof of Proposition `prop:time`, in the place of M2-W047, which it replaces
- **Step:** S04c (a correction after the fresh reader's check, P204)
- **Rests on:** M2-W022 (the spinor bundle $\Lambda^{0,*}\otimes N$ and its lift $\iota^{*}\otimes\lambda$; $\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$)
- **Mark:** READ: M2-W022 as logged ("$\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$", which it quotes from M1 Section 7.4). Hand steps, in full: a coordinate $z$ linear in $(\theta_{\psi},\theta_{\omega})$ is a coordinate of $J$ near every point, its differential being the same at every point, so $\mathrm{d}\bar z$ is a $(0,1)$-form on the whole of $E$ with no zero; $\iota(z)=-z$ gives $\iota^{*}\mathrm{d}\bar z=\mathrm{d}(-\bar z)=-\mathrm{d}\bar z$; on a surface $\Lambda^{0,*}=\Lambda^{0,0}\oplus\Lambda^{0,1}$, $\Lambda^{0,0}$ being the functions, and $\Lambda^{0,1}$ a line spanned at each point by $\mathrm{d}\bar z$; $(\iota^{*}\otimes\lambda)(1\otimes v+\mathrm{d}\bar z\otimes v')=1\otimes\lambda(v)+(-\mathrm{d}\bar z)\otimes\lambda(v')$, which the map sends to $(\lambda(v),-\lambda(v'))$. Changed from M2-W047 (fresh reader, P204): the letter $w$ for an element of a fibre becomes $v'$, $w$ being M1's letter for the element of which the drive on spinors is $-w$ (M1, Corollary 7.8), the element M2-W049 speaks of. Nothing else changed
- **Tag:** none (a step of a proof)
- **Failure test:** a complex structure of $E$ with a coordinate linear in $(\theta_{\psi},\theta_{\omega})$ whose $(0,1)$-forms have no section without a zero, or on which the fold does not act by $-1$.
- **Confirmed:** checked, not read back, 18 November 2026 (a correction of the checked step M2-W047; the PI told in plain English in the closing report of chat C3c; Decision Log P204)
- **Retires / retired by:** retires M2-W047
