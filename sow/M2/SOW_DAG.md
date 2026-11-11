# M2 — SOW and DAG

**Paper:** M2, the field equation on the geometry of M1. **Opened:** 11 November 2026. **Structure agreed by the PI:** Decision Log P74. **Cites only:** M1 v6.3 (`canon/M1/Paper_M1_Six_Axioms_v6_3.tex`) and external peer-reviewed results entered in Verified References.

This file is a plan. It holds no result. Line numbers are those of canon M1 v6.3.

## Rulings and directions the plan rests on
| # | What | Source |
|---|---|---|
| R1 | M2 is derived from M1 and external peer-reviewed results; the old corpus and the PI's earlier texts are compared with afterwards | Rulings in Force §2 |
| R2 | The start in five steps: a plan, each step checked against canon before it is a premise | P69 |
| R3 | The list of unfixed continuous data is the eight rows of N0 | P71 |
| R4 | A small movement is a small change of the shape itself, modulo diffeomorphism and overall scale | P72 |
| R5 | The three odd places in M1 are noted and carried; no change to M1 now | P74 |
| R7 | The integer of the determinant line on S² is owed; the vector-field lead is withdrawn; M2 from M1 v6.3 alone, the PI asked where a reading has to be chosen | P77; P78 |
| R8 | The field is on the shape, satisfies all six axioms at once, and creates the growth and decay | P79 |
| R9 | The growth runs along time; a circuit later the shape is larger by a fixed factor and is the same shape; what grows as time advances, (a) space or (b) time and space together, is an unknown for the equation. M1 is not changed | P81; P84 |
| R10 | The integer of the determinant line on S² is two: M1's rule applied, no further twisting line | P85 |
| R6 | For M2 the sixth axiom speaks of a shape and one field; N3 says what the field is. ω does not enter M1; the musing on ω is withdrawn | P76; P75 |

**Flagged, not resolved (P76):** step 4 of P69 has the functional "built from the shape alone"; with R6 the one object is the shape with its field, and whether the field is itself built from the shape is not ruled.

## Assumptions
| # | Assumption | Source | Standing |
|---|---|---|---|
| A1 | The eight rows of N0 are the complete list of continuous data M1 leaves unfixed | architect's reading of M1 ll.1–1105 | Independent check returned: all eight rows found independently; amendments confirmed (P77) |
| A2 | The unknowns of the field equation are among the eight rows | none | **UNVERIFIED — guess**; N1 settles it |
| A3 | The functional M1 names (ll.258, 992) is the one whose stationarity is the equation of M2 | P69 step 3 | An identification; M1 does not say so; step audit |
| A4 | The functional is built from the shape and the one field, and from nothing else | P69 step 4 with P76 | PI's direction; the tension between "the shape alone" and the field is flagged in P76 |
| A5 | Stationary means no change to first order under small movements | P69 step 5 | RECALLED; N2 |
| A6 | The start is independent of the withdrawn M2 | — | **Not shown** (P69 flag iii, P70(3)); step audit |

## Nodes
| Node | Work | Depends on | Closes when | Status |
|---|---|---|---|---|
| **N0** | The list of continuous data M1 leaves unfixed | canon M1 | List confirmed by the PI; independent check of completeness | List confirmed (P71, P74); independent check returned; amendments confirmed (P77) |
| **N1** | What varies, and when two geometries are the same | N0, R4 | A definition, in M2, of the space of shapes the movements run over and of sameness; each of the eight rows placed as an unknown, as fixed by another row, or as no datum | drafted: `papers/M2/N1_what_varies.md`, for the PI |
| **N2** | Outside results read at source: what a state is (spinors of a complex structure), the counts of states, the calculus of variations | — | The theorems used are read at source and proposed for Verified References | sources read as far as the PI can supply them (`papers/M2/N2_sources.md` §§8–9); three items to be closed by hand or declared; the calculus of variations not yet started |
| **N3** | What the one field is (P76, P79); the functional, built from the shape and the field and nothing else. First half drafted: `papers/M2/N3_field_and_functional.md` (the field, what it means for it to satisfy each axiom, the requirements on the functional). The functional itself is not chosen | N1 | The functional stated; the identification with M1 ll.258, 992 entered in the step audit; every choice entered in the Minimality Register before its tag | open |
| **N4** | The stationarity conditions: the field equation | N2, N3 | The equation derived, hypotheses named | open |
| **N5** | What the equation fixes | N4 | The warp's law (owed by M1 l.127): what grows as time advances, candidates (a) and (b) of P84, and its rate; the flat shape of the fibre (M1 l.992); the proportions of the pieces | open |
| **N6** | Whether a modulus survives | N5 | Clause (a) of M1 Def 3.2 met or shown to fail; a failure test for every banked result | open |
| **N7** | Step audit, independent checks, certificates, gates 1–7 | N3–N6 | `papers/M2/STEP_AUDIT.md` complete; `MEFProof/Paper_M2/` builds | open |
| **N8** | Comparison with the sealed material and the canonical form of the Master Equation | N7 recorded | A consistency check, not a test | sealed until N7 |

```
N0 ──► N1 ──► N3 ──► N4 ──► N5 ──► N6 ──► N7 ──► N8
                     ▲
                 N2 ─┘
```

## N0 — the list (all READ; confirmed P71, row 1 reworded P74)
| # | Datum | What M1 says | Lines |
|---|---|---|---|
| 1 | The flat shape of the fibre, two parameters, and how it is carried round time. M1 names one parameter, the aspect ratio τ₂ = L_ω/L_ψ | "the one continuous datum of the fibre … which this paper does not fix"; the declared input, "held by a declared sector" | 602, 239, 967, 992 |
| 2 | The warp: which piece is scaled, and by a function on which | "not fixed in this paper … fixed where the warp is given its law, with the field equation" | 127; 190 |
| 3 | The warp's constants κ and w₀ | κ is "a constant κ≠0" with no value; w₀ has none | 190 |
| 4 | The relative sizes of T, S³, CP², S² and the fibre | Nothing; only proportions have meaning, and one is named as not derived | 239, 255 |
| 5 | The metric on each piece | Nothing; no metric is written | 55, 143 |
| 6 | The length of the time circle and the parametrisation of the flow | Only the return map and the count of steps are fixed | 232, 277, 837 |
| 7 | The almost-quaternionic structure as a subbundle; the spinor bundle and the Clifford action (P77) | Existence required; which one is not said | 214 |
| 8 | The connections and the Hermitian metrics on the Spin^c line and on the twist, and the forms that carry the flux (P77) | Only the integers are fixed | 693–703, 717, 934–938 |

Not a datum: overall size (ll.255, 271). Fixed by M1: every piece, the twist and the integers the theorem names (ll.967–971).

**Amended after the independent check (P77):** rows 7 and 8 widened as shown. **Owed (P77), now ruled to be two (P85):** one whole number is not stated in M1, the integer of the determinant line on S², of which M1 says only "even" (ll.707, 712, 938, 971).

## What M2 owes M1
- The warp's law (l.127).
- The functional M1 names and does not define (ll.258, 992).
- The discharge of M1's declared input, or the statement that it fails (l.992).

## Failure tests fixed before any derivation
- If the stationarity conditions leave any row of N0 free, modulo diffeomorphism and overall scale, the geometry does not meet clause (a) and M1's theorem loses its declared input (M1 l.992).
- If the functional needs an ingredient that is not built from the shape, A4 fails.
- If no functional built from the shape has M1's geometry as a stationary point, steps 3–4 of P69 fail.
