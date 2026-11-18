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
