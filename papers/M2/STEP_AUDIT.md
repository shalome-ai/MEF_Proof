# M2 — step audit

**What this is (CLAUDE.md §5).** For each work package, a table that marks every step: verified reference, CHECKED, READ, DECLARED or GAP; the red-flag hits at the steps consumed; what would show the result false. Statements are named by their write-up log numbers and are not restated here. Opened 18 November 2026 (Decision Log P189).

## S03 · A state of the geometry (chat C1, 18 November 2026; Decision Log P189)

| Entry | What kind of step | Mark | Source | Note |
|---|---|---|---|---|
| M2-W001 | a statement of what M1 defines, with a quotation | READ | M1 v7.3 l.834; ll.829–840 for "on the fibre alone" | quotation cut by script |
| M2-W002 | a statement of what M1 does not define | READ | M1 v7.3 ll.1–1322, read whole twice; glossary ll.1229–1293 | a negative read over the whole paper; it fails on one line of M1 that defines either |
| M2-W003 | four quotations | READ | M1 v7.3 ll.214, 219, 806 | quotations cut by script |
| M2-W004 | a quotation | READ | M1 v7.3 l.843 | quotation cut by script |
| M2-W005 | the definition; the identification of a state with a spinor | DECLARED | the PI's read-back, P189; Minimality M2-1 | **the identification step** (CLAUDE.md §5): no certificate checks it; it is a declared choice, the first of M2. Not shown: which bundle (S04); agreement with M1 Definition 7.4 at rest (S21); "at rest" for the whole geometry (S11) |
| M2-W006 | a statement of what M2-W005 does not say | READ | M2-W005; M1 v7.3 l.843 | |

**GAP:** none within the step. **Owed inside M2 by named cards:** S04, S11, S21, as the note on M2-W005 says.

**Red flags** (`python3 tools/redflags.py canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, 18 hits in the file). At the lines this step uses: l.843, "up to the overall sign" (in a sentence the step does not quote) and "the counts below do not depend on it" (a forward reference; it is the sentence M2-W004 quotes, and it says that M1 does not rest on the link); l.834, "the statements below speak of one lift or the other" (not quoted). No hit at ll.214, 219, 806.

**Failure tests:** on each entry.

**Blind:** nothing outside the step's card was looked at. The card's line "Blind" stands as drawn.

**Checks:** the quotations are substrings of M1 v7.3 cut by `papers/M2/checks/m1_quote.py` (its functions `join`, `cut`, `printed`). A fresh reader's check of these records was not run (P189).

**May use (DAG rule 4):** the step used Definition 2.1, Definition 2.7 with the tenth choice, Definition 7.4 with the paragraph after it, and Proposition 7.3, all named on its card; and clause (b) of Definition 3.2 by rule 6 of the plan.

## S04 · Where states live: the base, space, the fibre before it is folded, and the fold read (chat C3, 18 November 2026; Decision Log P191, P192)

| Entry | What kind of step | Mark | Source | Note |
|---|---|---|---|---|
| M2-W007 | which bundle is which structure | READ, with a reading | M1 v7.3 l.806; the PI's read-back, P191 | **an identification step** (CLAUDE.md §5): from M1's sentence on how spinors exist to "the spinor bundle is that of a structure of that kind". No certificate checks it. Not claimed: that such a structure has only one spinor bundle |
| M2-W008 | the statement (base and space) | CHECKED by its proof; integers READ | M2-W009 to M2-W011; M1 v7.3 ll.806, 827, 1058 | existence not shown (M2-W012) |
| M2-W009 | the groups of the factors and of the product | verified reference; CHECKED by script and by hand | V-M2-2, V-M2-3, V-M2-4; `checks/S04_degree_two.py` (1) | the proofs of the cited statements were not read; the statements were, at source. The hand steps from the cited statements to the groups are in the entry's mark. The statement lacks "$n\geq1$": corrected wording put to the PI |
| M2-W010 | the action of the second cohomology group | verified reference | V-M2-1 (statement, setting and proof read, pp.43–45) | **two identification steps**, said in the entry's mark: the source's proposition is for a bundle over a CW complex, and its Examples 2(b), p.46, give oriented manifolds through their tangent bundles; the source's $c_{1}(s)$ is that of the line bundle of the structure, here called the determinant line as M1 calls it |
| M2-W011 | the conclusion | CHECKED by hand | M2-W009, M2-W010 | in full in the entry's mark |
| M2-W012 | what is not said | READ | M2-W008; M1 v7.3 ll.806, 827 | the integer two is Section 7.4 and not Proposition 7.3: corrected wording put to the PI |
| M2-W013 | the statement (with the fibre before it is folded) | CHECKED by its proof; integers READ | M2-W014, M2-W015; M1 v7.3 ll.806, 827, 832, 878, 1058 | checked, not read back; the integer six is a hand step from two lines of M1 |
| M2-W014 | the groups with the torus | verified reference; CHECKED | V-M2-2, V-M2-4; `checks/S04_degree_two.py` (2) | agrees with M1 l.827, which is not the ground |
| M2-W015 | the integer on the torus; the conclusion | READ; CHECKED by hand | M1 v7.3 ll.827, 878; M2-W010, M2-W014 | |
| M2-W016 | the fold: a state over the folded fibre | DECLARED; the quotation READ | the PI's read-back, P192; Minimality M2-2; M1 v7.3 ll.834, 678, 275 | **an identification step**: M1's rule for states at rest is taken for every state. The second choice of M2; its alternatives are in the Minimality row |
| M2-W017 | a quotation | READ | M1 v7.3 l.878 | the quotation exact; **its lead-in says more than l.878** (the hypotheses of Proposition 7.6 are not quoted; the lift's signs on spinors are Corollary 7.7). **Retired, P194; replaced by M2-W019** |
| M2-W019 | a quotation, in place of M2-W017 (retired, P194) | READ | M1 v7.3 ll.878, 836 | the whole first paragraph of the statement of Proposition 7.6, with its hypotheses, checked by script against l.878; the last sentence from l.836. No lead-in of M2's own. No red-flag hit at l.878 or l.836 (scan run again in chat C3b) |
| M2-W018 | what is not shown | READ | M2-W013 to M2-W017, M2-W019 | rests on M2-W019 in place of M2-W017; its statement is unchanged |

**GAP:** none within what is stated, with the three corrections of wording above pending. **Not shown, said in the marks of M2-W008 and M2-W013:** that the structure of the geometry gives, on each of the two products, a structure with M1's integers (card S04c). **Owed inside M2 by named cards:** S04b (that M1's flux, lift and corner signs determine the bundle over the pillowcase; that a lift of the fold to the spinor bundle exists); S04c (along time); and, as before, S11 and S21.

**Red flags** (`python3 tools/redflags.py canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, 18 hits in the file). At the lines this step uses: l.834, "the statements below speak of one lift or the other" (a forward reference, in the definition from which M2-W016 quotes another sentence; M2-W017 quotes the statement that names the lift). No hit at ll.678, 806, 827, 878, 1058. The external sources were read as extracted text and were not scanned.

**Failure tests:** on each entry.

**Blind:** nothing outside the card and the cited sources was looked at. The card's line "Blind" stands as drawn.

**Checks:** the script `papers/M2/checks/S04_degree_two.py` passes. The two quotations of M1 in M2-W016 and M2-W017 were checked by word-for-word search of the source file. A fresh reader's check of these records: see Decision Log P193.

**May use (DAG rule 4):** the step used Definition 2.7, Proposition 7.3, Section 7.4 (first paragraph), Definition 7.4, Proposition 7.6, Proposition 7.9 and Theorem 5.7, all named on its card; clause (b) of Definition 3.2 by rule 6 of the plan; and the external sources V-M2-1 to V-M2-4, entered first. Not used: Proposition 5.8 and Remark 6.2.

**References of M1 found not read** (reported to the PI, not pursued): rows V-22 and V-32 of Verified References, which M1 Proposition 7.3 and Section 7.4 rest on, are marked "NOT READ". V-M2-1 now gives, read at source, the statement M1 uses at l.818 on the structures and the line $E$.
