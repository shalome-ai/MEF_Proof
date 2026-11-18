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

**After the check (P194, P195):** M2-W009, M2-W012 and M2-W017 are retired; M2-W020, M2-W021 and M2-W019 replace them, each with the corrected mark that its row above describes. **GAP:** none within what is stated. **Not shown, said in the marks of M2-W008 and M2-W013:** that the structure of the geometry gives, on each of the two products, a structure with M1's integers (card S04c). **Owed inside M2 by named cards:** S04b (that M1's flux, lift and corner signs determine the bundle over the pillowcase; that a lift of the fold to the spinor bundle exists); S04c (along time); and, as before, S11 and S21.

**Red flags** (`python3 tools/redflags.py canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, 18 hits in the file). At the lines this step uses: l.834, "the statements below speak of one lift or the other" (a forward reference, in the definition from which M2-W016 quotes another sentence; M2-W017 quotes the statement that names the lift). No hit at ll.678, 806, 827, 878, 1058. The external sources were read as extracted text and were not scanned.

**Failure tests:** on each entry.

**Blind:** nothing outside the card and the cited sources was looked at. The card's line "Blind" stands as drawn.

**Checks:** the script `papers/M2/checks/S04_degree_two.py` passes. The two quotations of M1 in M2-W016 and M2-W017 were checked by word-for-word search of the source file. A fresh reader's check of these records: see Decision Log P193.

**May use (DAG rule 4):** the step used Definition 2.7, Proposition 7.3, Section 7.4 (first paragraph), Definition 7.4, Proposition 7.6, Proposition 7.9 and Theorem 5.7, all named on its card; clause (b) of Definition 3.2 by rule 6 of the plan; and the external sources V-M2-1 to V-M2-4, entered first. Not used: Proposition 5.8 and Remark 6.2.

**References of M1 found not read** (reported to the PI, not pursued): rows V-22 and V-32 of Verified References, which M1 Proposition 7.3 and Section 7.4 rest on, are marked "NOT READ". V-M2-1 now gives, read at source, the statement M1 uses at l.818 on the structures and the line $E$.

## S04b · The bundle over the pillowcase (chat C3b, 18 November 2026; Decision Log P198, P199)

| Entry | What kind of step | Mark | Source | Note |
|---|---|---|---|---|
| M2-W022 | the definition of a lift of the fold, and of its sign at a corner | DECLARED; M1's lines READ; verified reference | the PI's read-back, P199; Minimality M2-3; M1 v7.3 ll.829, 834, 843, 275; V-M2-6 | **an identification step** (CLAUDE.md §5): the source's $S_{\sigma_L}=\Omega^{0,*}(L)$ read as the spinor bundle $\Lambda^{0,*}\otimes L$. The third choice of M2; its alternatives are in the Minimality row. Not claimed: independence of the complex structure of $E$; extension to the whole geometry (S04c) |
| M2-W023 | the statement | CHECKED by its proof; M1's lines READ | M2-W024 to M2-W026, M2-W034 to M2-W038, M2-W032; certificate `MEFProof/Paper_M2/M2_L2_pillowcase.lean`; script `checks/S04b_lift_signs.py`; M1 v7.3 ll.827, 832–836, 846, 878, 932, 936 | (iv) gives the signs of the lift with two states where M1 has "up to one overall sign" (ll.836, 932): an addition, not a contradiction |
| M2-W024 | one $\Spinc$ structure with the integer six; its spinors | verified references; hand steps | V-M2-1, V-M2-2, V-M2-4, V-M2-5, V-M2-6; M1 v7.3 ll.827, 832 | **two identification steps**, said in the mark: Gompf's and Nicolaescu's spin$^{c}$ structures taken as one notion; "the integer" of a line taken as its first Chern class. $E$ almost Kähler and $K_{E}$ trivial are hand steps in full |
| M2-W025 | two lines of degree three are isomorphic | verified reference; hand steps | V-M2-5 | the source states freeness and leaves its proof to the reader. Hatcher's *Vector Bundles and K-Theory*, Proposition 3.10, which states the same fact, was read and is not cited, being a posted draft (P198) |
| M2-W026 | (i): M1's first lift is a lift of the fold; its signs | READ; CHECKED by hand | M1 v7.3 ll.590, 834, 836 | **an identification step**: M1's lift, defined on states at rest, taken as the map of the line that M1 itself takes it to be at l.836; the local frame computation is in the mark |
| M2-W027 | two lifts differ by a function $g$; signs are kept by isomorphisms | CHECKED by hand | M2-W022 | in full in the mark. **Retired, P200; replaced by M2-W034** (it named the clause it proves as "the second sentence of (iii)") |
| M2-W028 | $g$ in exponential form | verified reference; hand steps | V-M2-7; M1 v7.3 ll.932, 1217 | **Retired, P200; replaced by M2-W035** (it credited the name $C_{m,n}$ to Appendix B alone, and its coordinates $(x,y)$ are the letters of other coordinates in M1 Proposition 5.8) |
| M2-W029 | the four corner values of $g$ | CHECKED (Lean; script (2)); hand steps | `L2_corner_values`, `L2_corner_values_all_even` | **Retired, P200; replaced by M2-W036** (letters) |
| M2-W030 | same signs give an isomorphism | CHECKED (Lean; script (3), numerical at sample points); hand steps | `L2_h_exponent` (now `L2_iso_exponent`), `L2_even_half` | **Retired, P200; replaced by M2-W037** ("the first sentence of (iii)" for its first clause; its printed parentheses read as certifying more than the integer arithmetic) |
| M2-W031 | (ii) and the count of eight | READ; CHECKED (Lean; script (1)) | M1 v7.3 l.936; `L2_twenty_divisors`, `L2_product_minus_one`, `L2_eight_patterns` | **Retired, P200; replaced by M2-W038** (the letter $g$ of M2-W027) |
| M2-W034 | as M2-W027, in its place | CHECKED by hand | M2-W022 | in full in the mark; "the last clause of the first sentence of (iii)"; letters $\gamma$, $\beta$ |
| M2-W035 | as M2-W028, in its place | verified reference; hand steps | V-M2-7; M1 v7.3 ll.932, 1217 | M1's coordinates $(\theta_{\psi},\theta_{\omega})$; $C_{m,n}$ credited to Appendix B and Corollary 7.7; path-connectedness a hand step of its own. The proof of the lifting criterion was not read; its statement and setting were |
| M2-W036 | as M2-W029, in its place | CHECKED (Lean; script (2)); hand steps | `L2_corner_values`, `L2_corner_values_all_even` | the certificates certify the parity of the exponents as written, not their derivation from $\gamma$ |
| M2-W037 | as M2-W030, in its place | CHECKED (Lean; script (3), numerical at sample points); hand steps | `L2_iso_exponent`, `L2_even_half` | the Lean theorems certify a linear identity over the integers of the shape of the exponent identity, and that an even integer is twice an integer; the exponentials, the complex quantities and continuity are hand steps |
| M2-W038 | as M2-W031, in its place | READ; CHECKED (Lean; script (1)) | M1 v7.3 l.936; `L2_twenty_divisors`, `L2_product_minus_one`, `L2_eight_patterns` | |
| M2-W032 | (iv): the lift with two states | READ; CHECKED (Lean; script (1)) | M1 v7.3 ll.836, 846, 878, 932; `L2_one_lift_two_states`, `L2_one_odd_corner`, `L2_two_state_signs`, `L2_odd_at_P4`, `L2_mn_pattern` | the count of M1 Lemma 7.5(b) is taken as given, as M1's certificate `M1_L6_twist` takes it |
| M2-W033 | which lift M2-W016 reads states through; what is not said | DECLARED; READ | the PI's read-back, P199; M1 v7.3 l.878 | **an identification step**: M2-W016's "a lift" taken to be the lift of M1 Proposition 7.6, as M1 takes it for the states at rest |

**After the check (P200):** M2-W027 to M2-W031 are retired and replaced by M2-W034 to M2-W038, each with the change its row above describes; M2-W023 and M2-W032, which rested on them, are flagged and unchanged. **GAP:** none within what is stated. **Not shown, said in the marks of M2-W022, M2-W023 and M2-W033:** that the bundle with its lift does not depend on which complex structure of $E$ is taken, and how it goes along time and into the whole geometry (card S04c); the holomorphic structure and differentiation (card S14). **The point M2-W018 marks as not shown** (that M1's flux, lift and corner signs determine the bundle over the pillowcase) is closed by M2-W023 over the fibre, at the level of the bundle. **Owed inside M2 by named cards:** S04c, S05, S11, S14, S21.

**Red flags** (`python3 tools/redflags.py canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, 18 hits in the file). At the lines this step uses: l.829, "The counts below do not depend on which such complex structure is taken" (a forward reference; M2-W022 quotes the sentence before it, and its mark says that independence of the complex structure is not claimed in M2); l.834, "the statements below speak of one lift or the other" (a forward reference; M2-W032 settles which lift is meant in Proposition 7.6 for every divisor); l.843, "up to the overall sign" and "the counts below do not depend on it" (M2-W022 uses the sentence between them, on the fold's action on the untwisted spinors); l.838, "up to the overall sign" (the structure of a twist; M2-W023(iv) gives the signs of the lift with two states). No hit at ll.275, 590, 827, 832, 836, 846, 878, 932, 936, 1217. The outside passages the step consumed (Nicolaescu pp.42, 55–56, 77, 81–82; Hatcher pp.27, 29, 61), cut from the extracted text into a scratch file and scanned: no hit.

**Failure tests:** on each entry.

**Blind:** nothing outside the card and the cited sources was looked at. The card's line "Blind" stands as drawn.

**Checks:** the script `papers/M2/checks/S04b_lift_signs.py` passes (parts (1) to (3)). The certificate `MEFProof/Paper_M2/M2_L2_pillowcase.lean` (twelve theorems, `L2_h_exponent` renamed `L2_iso_exponent` at P200; core Lean 4.29.1, no Mathlib, no `sorry`, no `axiom`, no `native_decide`) compiles standalone (`lean`, with `LEAN_PATH` unset) and by `lake build MEFProof.Paper_M2.M2_L2_pillowcase`; its import line is in `MEFProof.lean`. The three confirmed statements M2-W022, M2-W023 and M2-W033 were compared by script with the text of the read-back: identical. The glossary entries were cut by script from M2-W022.

**May use (DAG rule 4):** the step used Theorem 5.7 (through M2-W016), Section 7.4 from its second paragraph to the paragraph after Definition 7.4, Lemma 7.5, Proposition 7.6, Corollary 7.7 with its proof, M2-W014 to M2-W016 and M2-W018 (within the card's range M2-W013 to M2-W016; M2-W014 and M2-W015 in M2-W024, the same argument as the proof of Proposition `prop:unfolded`), V-M2-1, V-M2-2, V-M2-4, and the new references V-M2-5 to V-M2-7, entered first; M1's Definition 3.2 clause (b) by rule 6 of the plan, as in S03 and S04. **Beyond the card's line:** the proof of Proposition 5.5 at l.590 (that $z\mapsto-z$ fixes exactly the four corners) and Appendix B at l.1217 (the corners by position); and, found by the fresh reader (P200), Section 7.4, its first paragraph, at l.827 (the card names that section from its second paragraph; M2-W023 and M2-W024 read l.827, as M2-W015 does) and the entries M2-W010 and M2-W020 (used in the mark of M2-W024 for an identification and for hand steps; the card names M2-W005, M2-W007, M2-W013 to M2-W016, M2-W018, M2-W019). All were used before the card was amended, against rule 4 of the plan, which asks that the PI be told first: the architect's fault, reported in the closing report. They give facts that the card's own lines also carry (Section 7.4, l.829, "the four corners"; Corollary 7.7, l.932, $C_{m,n}=(\tfrac m2,\tfrac n2)$), and the card is amended in this chat to name them (DAG §5, S04b).
