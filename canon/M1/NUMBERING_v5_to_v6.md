# M1: numbering of v5.0 against v6.0 (11 November 2026)

For every place that cites M1 by number. v5.0 is `canon/M1/superseded/Paper_M1_Five_Axioms_v5.tex`; the map from v2 to v5.0 is `NUMBERING_v2_to_v5.md`. v6.0 is built from v5.0 by `tools/m1_build_v6.py` (51 edits).

| v5.0 | v6.0 | |
|---|---|---|
| five axioms | six: Axiom 6 (oneness) | new (Decision Log P42) |
| §2 "The axioms as mathematics" | §2 "The first five axioms as mathematics" | Definitions 2.1 to 2.9 keep their numbers |
| §3 "Minimality"; Definition 3.1 (modulus) | §3 "The sixth axiom as mathematics: minimality"; Definition 3.1 | unchanged |
| Definition 3.2 (minimal), four criteria (1) to (4) | Definition 3.2 (oneness, formal; minimal), three clauses (a), (b), (c) | restated (P45, P46, P49) |
| criterion (1), no unforced datum | clause (a) for a dial; clause (b) for an object (twisting line, structure group, class of loops) | |
| criterion (2), least entropy | clause (c) | |
| criterion (3), arithmetic {2, 3} | not a clause; an output (§8) | |
| criterion (4), least dimension, least fundamental group | clause (c) for the dimension; clause (b) for the class of loops | |
| Theorems 4.2, 4.3; Proposition 4.4 | unchanged | |
| — | Proposition 4.5 (one drive at trace three only) | new; no Lean certificate |
| Sections 5 to 7 | unchanged in number and in proof | "criterion" becomes "clause" |
| Theorem 8.1 | Theorem 8.1 | restated: six axioms; overall size has no meaning; the aspect ratio of the fibre is the one declared input |
| six numbered choices | nine | the six of v5.0, and clauses (a), (b), (c) of Definition 3.2 as the seventh, eighth and ninth |
| Certificates L1–L4 and L6, 58 theorems | the same | |

## v6.0 against v6.1 (11 November 2026; Decision Log P55, P56)

v6.1 is `Paper_M1_Six_Axioms_v6_1.tex`, built from v6.0 (`superseded/Paper_M1_Six_Axioms_v6.tex`) by `tools/m1_build_v6_1.py` (20 edits). No result is renumbered.

| v6.0 | v6.1 |
|---|---|
| trace three: clause (c) stated first, clause (a) "makes the same selection" | clause (a) makes the selection; clause (c) agrees (§3, §4.2, Theorem 8.1, the table of §8) |
| Proposition 4.5 without a certificate | certificate `M1_L7_onedrive.lean`, eight theorems, cited in the proof |
| Proposition 7.3: "Spin^c is the least such structure"; the proof's sentence on the larger structure groups, uncited | "A Spin^c structure exists, and clause (b) admits no structure group larger than is needed"; no claim about the larger groups |
| Gödel's theorem named | the first incompleteness theorem stated and cited (Verified References V-25) |
| five certificates, 58 theorems; 40 pp. | six certificates, 66 theorems; 42 pp. |
