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

The heading line carries the status: `· active` or `· retired`. The next number is **M2-W007**.

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
