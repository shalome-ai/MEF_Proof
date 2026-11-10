# M1 rewrite — items 17 and 20 tested as one statement

**PARKED (10 November 2026, Decision Log P32).** Item 17 is struck from the M1 assumption list: it concerns Φ_QC, which is not in M1. This note is kept as a record; its three questions are not carried forward and nothing in it is a premise of the rewrite.

**10 November 2026.** Work package agreed by the PI (assumptions 1–6 of this session; Decision Log P31). Tested inside M1's own terms only: canon v2 (`canon/M1/Paper_M1_Four_Axioms_v2.tex`), the axioms, and the PI's rulings. The note of 22 February, the block-matrix form and chapter 8 are not used (P31). M2 is not used as a premise (island rule).

**Check script:** `papers/M1/checks/growth_law_check.py` (C1–C13, all pass; plain Python, exact arithmetic in ℚ(√5)). **Red-flag scan:** `tools/redflags.py` on M1 ll.100–275 and 314–325: no hit at a step consumed here (the hits are "by hand" at ll.90, 109, 234 and forward references at ll.161, 191, none in Def 2.2 or Thm 4.2). **Not blind-checked.** Verdicts are item by item; the synthesis is the PI's.

## The terms, as defined

| Term | Defining text | Where |
|---|---|---|
| growth law (A2, formal) | "(i) at least one product in (2) is a warped product, with a smooth function w on one piece, ∇w ≠ 0, entering the lengths measured on another; (ii) along the warping direction dw/ds = κw for a constant κ ≠ 0, so that w = w₀e^{κs}; (iii) there is an involution ι of the warped piece with ι*κ = −κ" | M1 Def 2.2, l.142 |
| the pieces | "M = (T × Σ) × F … T a one-dimensional piece carrying time, Σ a piece carrying space, F an internal piece"; "only a way of naming the pieces" | M1 ll.117–121 |
| closure (A1, formal) | "T, Σ and F are compact, connected and without boundary" | M1 Def 2.1, l.130 |
| drive M₀ | the return map of the flow of A4 on the torus, ((2,1),(1,1)); eigenvalues φ^{±2} | M1 Def 2.7 l.183; Thm 4.2 l.226 |
| fold ι | "the fold that halves the internal piece"; inversion z ↦ −z | M1 l.145; Prop 5.5 l.317 |
| step | one application of M₀ (proposed, not banked) | `CONSEQUENCES_OF_B.md` l.5 |
| item 17 (P30) | the size of ℂP² × S² varies with Φ_QC, that is, with position on the pillowcase | Decision Log P30 |
| item 20 (PI) | the growth law of A2 and the drive's stretch are "one structure" | record §21 |

## Verdicts

| # | Question | Verdict | Status |
|---|---|---|---|
| T1 | Does the drive's stretch satisfy Def 2.2(i)? | **Yes in substance; the wording does not fit.** The length factor is a function of time entering the lengths of the torus: ds² + e^{−2κs}du² + e^{2κs}dv², u and v the two eigen-directions of M₀. But w = e^{κs} is not a single-valued function on the time circle (w(s+1)/w(s) = φ²); it closes only through the gluing by M₀. "A smooth function w on one piece" and "a product in (2)" are therefore not literally true of it: the piece T × F is the glued (mapping-torus) one, which M1 l.121 allows ("only a way of naming the pieces") but Def 2.2(i) does not say | CHECKED C1–C3, C6 |
| T2 | Does it satisfy Def 2.2(ii)? | **Yes, exactly.** dw/ds = κw with κ = log φ² = 0.962424 per step, constant | CHECKED C4 |
| T3 | Does it satisfy Def 2.2(iii)? | **Yes, but not with the fold.** Both signs occur at once (w on one direction, 1/w on the other). The map of the torus that exchanges them is the quarter-turn S = ((0,1),(−1,0)): S carries the stretched direction to the squeezed one. The fold z ↦ −z keeps each direction and commutes with M₀; it does not exchange κ and −κ. S² is the fold; S has order four on the torus and order two (an involution) on the pillowcase; S M₀ S⁻¹ = M₀⁻¹ (`L1_conj_M0_inv`) | CHECKED C7–C9 |
| T4 | Can a single-valued function of position on the pillowcase satisfy Def 2.2(ii)? | **No, not smoothly.** A smooth positive function on a closed piece has a maximum, where its derivative is zero; dw/ds = κw with κ ≠ 0 fails there. The fold-symmetric function that is exponential on each half, e^{−κ\|t\|}, has a jump in slope along two lines (t = 0 and t = L), so it is not the "smooth function" of Def 2.2(i) | CHECKED C12; the maximum argument by hand, here in full |
| T5 | Is "the size of ℂP² × S² varies with position on the pillowcase" (17) the same statement as "the drive stretches the torus along time" (20)? | **Not as M1 stands. Two things differ, and only the first has a bridge.** See below | by reading, with C5, C13 |

### T5 in detail

**(a) Where the function lives: the pillowcase (17) or time (20).** These can be one statement if position on the pillowcase is carried by time, that is, if what item 17 calls Φ_QC moves round the pillowcase with the drive (item 10 of the assumption list, agreed). Then a quantity depending on position, followed along the flow, is a function of time, and T4's obstruction does not arise: the function is not asked to be single-valued on the pillowcase. Two points for the PI:
- **Φ_QC is not an object of M1.** It is defined in M2. M1 can state items 10 and 17 only in terms of position on the pillowcase and the drive; the name Φ_QC cannot appear in M1 except as a forward remark that derives nothing.
- This bridge is a reading, to be declared and tagged; nothing in M1 v2 states it.

**(b) What is scaled: ℂP² × S² (17) or the torus (20).** Here M1 has no bridge.
- The drive scales the two directions of the torus by w and 1/w; the area of the torus does not change (det M₀ = 1; C5). So even for the torus it is the shape that varies along time, not the size.
- On the sphere of units the drive acts as the cycle i → j → k (M1 Prop 5.6, l.329), a rotation of order three, which leaves the radius unchanged (C13).
- M1 v2 has no formula in which a length on ℂP² × S² depends on anything. Its only sentence connecting the two is l.533, "R_w, R_c the radii of S² and ℂP² tied by the warp to the two periods", inside Prop 8.2, which leaves M1 (item 28, agreed) and which states the tie without deriving it.

**So: item 20 holds in M1's terms (T1–T3). Item 17 does not follow from it in M1, and is not the same statement, unless a tie between the size of ℂP² × S² and the lengths of the torus is supplied.** I have not constructed one. Whether the tie of l.533 is that statement, as a declared reading with a failure test, is for the PI.

## What T3 touches in M1 (reported as a reading, not acted on)

M1 identifies the involution of A2(iii) with the fold in four places: l.145 ("it is the fold that halves the internal piece"), l.279 ("the algebraic image of exchanging growth and decay: composition run backwards"), l.317 ("the warped fibre X of A2 … with the involution ι having exactly four isolated fixed points"), l.329. If the growth law is the drive's stretch, the map that exchanges growth and decay is S, the fold is its square, and S fixes two points of the pillowcase (P₁ and P₄) and exchanges P₂ and P₃ (C10, C11), where the fold on the torus has four fixed points.

Under CLAUDE.md §2 the first hypothesis is that my reading is wrong, so I report it and stop:
- The four corners are not at risk from this by themselves: M1 Prop 5.4 (l.299) counts them from the algebra, without ι.
- What is at risk is the sentence that derives the fold from A2. If the fold is S², its source is the growth-and-decay exchange applied twice, and the text of ll.145, 279, 317 would need to say so.
- "Composition run backwards" (l.279) is literally true of S (S M₀ S⁻¹ = M₀⁻¹) and not of the fold (which commutes with M₀). READ and CHECKED C8, C9.
- S alone is not a symmetry of the glued piece T × F; it is one together with the reversal of time. That is a statement about M1's own objects; that M2 later calls the pair τ is not used here.

## Failure tests

- T1–T3 fail if M1's growth law is required to be a single-valued function on a closed piece: then by T4 there is no smooth growth law at all and Def 2.2 has no model.
- The reading in T5(a) fails if position on the pillowcase is not carried by the drive (for instance if the object in question sits at P₁, which the drive fixes).
- A tie as in T5(b), once stated, fails if it makes the size of ℂP² × S² single-valued on the pillowcase and exponential (T4), or if it is inconsistent with the area of the torus being constant (C5).

## For the PI

1. T3: is the exchange of growth and decay the quarter-turn (with the fold as its square), or is my reading of Def 2.2(iii) wrong?
2. T5(a): M1 cannot name Φ_QC. Is "position on the pillowcase, carried round by the drive" the M1 form of items 10 and 17?
3. T5(b): what ties the size of ℂP² × S² to the torus? M1 has only l.533, underived.
