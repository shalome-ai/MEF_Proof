# M2 — step audit

Opened 11 November 2026. No result is banked. This file holds, so far, only the entries that had to be made before any derivation.

## Entries made before derivation
| # | Entry | Mark | Source |
|---|---|---|---|
| 0.1 | The five steps of the start were proposed by a session that had read the rows of 8 November and knew that the withdrawn M2 also varied a functional. The start is **not shown to be independent** of the withdrawn paper | DECLARED | P69 flag (iii); P70(3) |
| 0.2 | The functional M1 names at ll.258 and 992 is identified with the functional whose stationarity is the equation of M2. M1 does not say so | DECLARED (identification) | P69 flag (i) |
| 0.3 | "Stationary means that small movements make no difference to first order" | GAP — RECALLED, not read at source | P69 flag (ii); SOW node N2 |
| 0.4 | The list of unfixed data (SOW N0) is complete | Independent check returned (below); amendments confirmed by the PI (P77). Completeness is as good as two independent readings; it is not proved | P71 |
| 0.6 | For M2 the sixth axiom speaks of a shape and one field | DECLARED (confirmed reading); numbered choice of M2 | P76 |
| 0.7 | The field is something on the shape that satisfies all six axioms at once, and it creates the growth and decay | DECLARED (confirmed readings); conflict with M1 ll.187, 193 flagged, not resolved | P79 |
| 0.8 | The object on M1's shape on which the closing-up, the fold, the quaternions, the drive and the shadow all act is the state, that is, the spinor of the shape, no longer required to be at rest | DECLARED (identification, the architect's; not ruled). Ground: M1's second numbered choice, an object is a state of the internal piece (l.163), with ll.214, 719, 725, 837, 847. Against: M1 uses "states are harmonic spinors" as motivation only (l.728); the quaternions act at the tangent level too (l.214) | P79 |
| 0.9 | The growth runs along time; a circuit later the shape is larger by a fixed factor and is the same shape; what grows, (a) or (b), is an unknown for the equation | DECLARED (confirmed readings) | P81, P84 |
| 0.10 | The swap of growth and decay acts on the whole shape at once: the fold on the internal piece, time run backwards with conjugation on the block of time and space | DECLARED (the architect's; not ruled). M1 uses the swap on the internal piece only | P84 |
| 0.11 | Nine requirements on any functional, fixed before a functional is looked at (`N3_field_and_functional.md` §4) | DECLARED; Q4 is a test set by M1 | P84 |
| 0.5 | A small movement is a change of the shape, modulo diffeomorphism and overall scale | DECLARED (confirmed reading) | P72 |

## Red-flag scan
`python3 tools/redflags.py canon/M1/Paper_M1_Six_Axioms_v6_3.tex`, 11 November 2026: 16 hits (ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 twice, 806, 1049).

Hits at lines consumed by N0: l.239 ("every result below") and l.714 ("the counts below"), both forward references in prose; neither carries a step. The other hits are at lines N0 does not consume. To be re-entered for each later node.

## Hand computations kept (CHECKED)
- **The warp on a closed piece (M1 ll.178, 190).** w smooth on a compact piece without boundary attains its maximum at a point p with ∇w(p) = 0. If dw/ds = κw along the warping direction with one constant κ≠0, then κw(p) = 0, so the maximum of w is 0; likewise the minimum; so w ≡ 0, against ∇w ≠ 0.
- **Shape parameters of a flat torus (M1 l.602).** A lattice in the plane has four real parameters; rotation removes one and overall scale one; two remain.
- **No flat shape is kept by the drive (M1 ll.344, 723).** If a positive-definite g had M₀ᵀgM₀ = cg, determinants give c² = 1, so c = 1 and M₀ would lie in the orthogonal group of g, with eigenvalues of modulus one. Its eigenvalues are φ^{±2}.

## Step tables
None yet. A table is written here for each load-bearing result before it is banked (CLAUDE.md §5).

## Independent check of N0 (returned 11 November 2026)
A fresh sub-agent was given canon M1 v6.3 and the question "list every continuous datum the paper leaves unfixed", and not the list. It read ll.1–1105 and nothing else (not `mef_macros.tex`, not the Lean files).

**Agreement.** It found every one of the eight rows independently: the aspect ratio and the second parameter of the torus; the warp, κ, w₀; the relative sizes; that no metric is written on any piece; the length of the time circle and the flow; the almost-quaternionic structure; the connections. It also reached, independently, the three odd places of P74 and the reading of l.239.

**What it found that the list did not have** (each re-read or re-computed by the architect before entry here):
| # | Finding | Mark | Proposed |
|---|---|---|---|
| a | **A whole number is not stated: the integer of the determinant line on S².** M1 says only "even" (ll.707, 712, 938); the theorem names O(3) on CP² and flux three on the fibre and gives no value on S² (l.971) | READ | Amend "every whole number is fixed" (step 1 of P69; the architect's report of step 1 was wrong to repeat it) |
| b | Row 7 should include the spinor bundle and the Clifford action (l.214) | READ | Extend row 7 |
| c | Row 8 should include the Hermitian metrics on the Spin^c line and on the twist, and the forms that carry the flux (ll.693, 717, 934–938) | READ | Extend row 8 |
| d | The measure for which the periodic points have "measure zero" is not named (ll.229, 232, 290) | READ | Note; not a row |
| e | Cross terms between the pieces are not excluded (l.163) | READ | Already inside row 5; named as a supposition in N1 §4 |

**Further odd places in M1 it reported** (first hypothesis in each: the reading is wrong):
| # | Place | Mark |
|---|---|---|
| f | Def 2.3(iii), l.190: "ι*κ = −κ" for "a constant κ". The pull-back of a constant is the same constant, so κ = 0, against κ ≠ 0 | CHECKED (one line) |
| g | Def 2.3(i), l.190, asks for a warped product "in (2.1)", which has two products, T×Σ and (T×Σ)×F; the display (l.125) writes both plain and puts the warp inside F | READ |
| h | "The base over which F sits" (ll.209, 220) against F = base × fibre, dim F = 8 (ll.617, 650). Wording | READ |
| i | The elimination table excludes bases with moduli by clause (a) with tag [R] (l.1013), while the functional that defines a modulus is not defined (l.258), and the fibre torus keeps its own shape parameter by a declared input | READ |
| j | The worked example of a trivial stabiliser, l.578. The point (1/3, 0) is fixed by ι∘M₀²: M₀² = (5 3; 3 2), M₀²(1/3, 0) = (5/3, 1) ≡ (2/3, 0), and ι sends that to (1/3, 0). Every rational point is periodic (l.290), so none has trivial stabiliser. By the rule of Prop 5.6 (l.521) the algebra at (1/3, 0) is then what conjugation composed with Ad_w² fixes: a + v with −Rv = v, R a turn of order three, which has no eigenvalue −1, so v = 0 and the algebra is ℝ, not ℍ | CHECKED |
| k | The block "modelled on ℝ_{>0} × S³" (ll.615, 943) against a compact time circle (l.178) | READ |

Not taken from the report: its statements marked RECALLED (the homology of a mapping torus, the Sol metric, Hopf manifolds, Abel's theorem). They are used nowhere.

## N3, opened 11 November 2026: writing "creates growth and decay"
Nothing banked. Two hand computations, both CHECKED, and one observation that is **not adopted**.

**1. With M1's Definition 2.3 as written, the growth function cannot be given point by point by a field on the pillowcase.** Suppose the growth function w is a function on the fibre with the fold as the involution ι of Def 2.3(iii) (M1 ll.190, 193), so that w∘ι is w with κ replaced by −κ: w·(w∘ι) is constant. A field on the pillowcase is a field on the torus that the lifted fold leaves unchanged (M1 l.719). Any quantity made from it point by point that the lift does not change, such as the norm N = aa* (M1 ll.449, 453), is then unchanged by ι. If w were such a quantity, w∘ι = w, so w² is constant, so ∇w = 0, against Def 2.3(i). So either the growth function is not on the fibre, or ι of Def 2.3(iii) is not the fold, or "creates" is not point by point. This is the same knot as P74(i), P74(ii) and f, g above.

**2. M1 already contains a second growth and decay, with its own exchange.** One step of the drive stretches one direction of the fibre by φ² and squeezes the other by φ⁻² (M1 ll.300, 892): after n steps e^{±(2 log φ)n}, the law of natural growth with rate 2 log φ per step and both signs. The quarter-turn S = (0 1; −1 0) satisfies SM₀S⁻¹ = M₀⁻¹ (M1 ll.320, 342). If M₀v = λv then M₀⁻¹(Sv) = SM₀S⁻¹Sv = λSv, so M₀(Sv) = λ⁻¹Sv: **S carries the growing direction to the decaying one.** S² = −1 (M1 l.869), which is the fold: so S is of order four on the torus and **an involution of the pillowcase**. S does not commute with the drive, it inverts it: it is a symmetry of the fibre carried round time only together with running time backwards. M1 says of the exchange of growth and decay that it is "composition run backwards" (l.449). And by M1's Proposition 4.6 a relabelling that keeps orientation and carries the step to its inverse **exists at trace three and at no larger trace**.

**Observation, not adopted.** Read with 2, Definition 2.3 would say: the warped piece is the pillowcase; the warping direction is time; κ is the rate of the drive; the involution that exchanges κ and −κ is S, of which the fold is the square. On that reading P74(i), P74(ii), f and the objection of N1 §7 do not arise. **Against it:** M1 says in terms that ι is the fold (ll.193, 501) and gives ι exactly four fixed points (l.501), where S on the pillowcase fixes two corners and exchanges two (l.834); M1's display puts the warp between the base and the fibre (l.125); and it would make the second axiom's growth and the fourth axiom's drive one thing, which M1 keeps apart. It is an identification of the kind CLAUDE.md §5 warns of, made after the knot was seen. It is put to the PI as a question and is a premise of nothing.

## N3: the two-growth readings examined (11 November 2026; P80)
The PI declined the one-growth reading ("Merging axiom 2 and 4 is an error"). The readings below keep the second axiom's growth apart from the drive. Nothing is adopted.

**R-a. As M1's display has it: the growth is between the base and the fibre, the swap is the fold (M1 ll.125, 193).** Fails as written, by two computations already kept above: a growth function on a closed piece cannot have one constant rate (P74(i)); and a function on the pillowcase is the same on both sides of the fold, so the fold cannot turn its growth into decay (computation 1 of "N3, opened").

**R-b. The growth is in the block of time and space, which M1 says is "modelled on ℍ^× = ℝ_{>0} × S³" (M1 ll.615, 943).** CHECKED by hand:
- Every non-zero quaternion is q = r·u with r > 0 and u of norm one. Its inverse is q⁻¹ = r⁻¹·ū, since uū = 1. So **the inversion of ℍ^× is the reciprocal on ℝ_{>0} together with conjugation on S³**, and (ab)⁻¹ = b⁻¹a⁻¹: it runs composition backwards.
- With r = e^{κs}: dr/ds = κr, the law of natural growth; inversion sends s to −s, that is κ to −κ.
- The flat lengths of ℍ are dr² + r²·(lengths on S³): S³ is scaled by the function r of the other coordinate. That is a warped product inside T × Σ.
- Against Definition 2.3 (M1 l.190): (i) a product of (2.1), namely T × Σ, is warped, by a function on one piece entering the lengths of another: met. (ii) dw/ds = κw along the warping direction: met, with w = r. (iii) an involution of the warped piece that exchanges κ and −κ: met, the warped piece being S³ and the involution conjugation.
- With M1's own words: ι is "inversion" on the torus (l.501), "conjugation" on ℍ (l.489), and "composition run backwards" (l.449). Inversion of a group is all three: z ↦ −z on the torus, q ↦ q⁻¹ on ℍ^×.
- It does not touch the drive: the drive acts on the fibre, this growth on the block of time and space.

**What R-b leaves open.** Time is a circle (M1 l.178), and r is not the same after one circuit: it is multiplied by λ = e^{κL}. The growth closes on itself only if a shape and the same shape with its block of time and space λ times larger count as the same. M1 says overall size has no meaning (l.255); but this is the size of one block against the internal piece, which is a proportion, unless the internal piece grows with it. Not settled. The number κL would be a datum for the equation to fix. M1's display (l.125) puts the warp elsewhere, and M1 says the swap "is the fold that halves the internal piece" (l.193); under R-b the fold is the same inversion seen on the fibre, which M1 does not say. **R-b was found after the knot was seen; it is an identification (CLAUDE.md §5) and is a premise of nothing.**

**R-c. The growth is the state's own law (the PI's musing of P80, translated; not a ruling).** "How that state changes is Axiom 2": the rate of change of the state is given by the state itself. This is not a reading of M1: M1's fourth numbered choice puts the growth in the geometry and "not of something placed on it" (ll.187, 193). It would be a change to M1.

### Corrections to the entry on R-b (the architect's wording was wrong in two places)
1. **"Conflict" was the wrong word.** R-b contradicts nothing in M1. M1 leaves the place of the warp to M2 and says that nothing it derives depends on it (l.127); the swap stays the fold on the fibre and conjugation on the quaternions, as M1 has it (ll.193, 449, 501); the growth law and its rate are used in no proof of M1. R-b is a reading of a point M1 leaves open and an addition to what M1 says. No proof, no finding and no part of the shape changes, and M1 is not edited (PI: "We should not go back and change M1").
2. **"Clause (ii) met, with w = r" did not say in which measure of time.** Write s for the coordinate round the time circle, in which the swap is s ↦ −s, and r = e^{κs}. Then dr/ds = κr, as clause (ii) asks. But the flat lengths of the quaternions, dr² + r²·(S³), are in this coordinate e^{2κs}·(κ²ds² + (S³)): time's own lengths grow together with space. A second form, ds² + e^{2κs}·(S³), has space alone growing. The two are different shapes. Both put the warp between time and space; which of them R-b means is **not settled**.

### The two forms with the warp between time and space, compared (discussion with the PI; nothing adopted)
s is the coordinate round the time circle, r = e^{κs}, (S³) the lengths on the unit sphere of quaternions.

**Form a: space alone grows.** Lengths ds² + e^{2κs}·(S³). A length of time is unchanged; the radius of space is e^{κs}. The ratio of the size of space to a fixed length of time grows.

**Form b: time and space grow together.** Lengths e^{2κs}·(κ²ds² + (S³)). CHECKED: with r = e^{κs}, dr = κr·ds, so this is dr² + r²·(S³), the flat lengths of the quaternions written as size and direction. So:
- the block of time and space is flat: it is the quaternions without the origin;
- every length in the block, of time as of space, is multiplied by the same factor as time advances, so every proportion inside the block stays as it is;
- the growth shows only against the internal piece, which does not grow;
- one circuit of time multiplies every length of the block by λ = e^{κL}.

**The swap in form b.** CHECKED: for quaternions d(q⁻¹) = −q⁻¹·dq·q⁻¹, so the length of d(q⁻¹) is that of dq divided by |q|². The inverse therefore carries the lengths r²·(κ²ds² + (S³)) to r⁻²·(κ²ds² + (S³)): the growing form to the decaying form, κ to −κ. It is a swap of the two forms and not a symmetry of either.

**The swap in form a.** s ↦ −s with conjugation on S³ carries ds² + e^{2κs}·(S³) to ds² + e^{−2κs}·(S³). The same.

**M1's wording.** "The block has dimension four, that of ℍ^× = ℝ_{>0} × S³" (l.615) and "the block is modelled on ℍ^×" (l.943). Form b is ℍ^× with its own lengths. M1 says no more than that.

**Blindness (CLAUDE.md §5), recorded at the PI's remark of this date.** The PI gave as a reason for form a that the universe is observed to expand. A reading chosen for that reason is chosen with the target in view. If form a is taken, the expansion of space is an input of M2 and cannot later be counted as something M2 derives.

**Forms b and c compared (CHECKED).** Write (K) for the lengths of the internal piece and (B) = κ²ds² + (S³). Form b is e^{2κs}·(B) + (K). Form c, with the whole internal piece shrinking as time advances, is (B) + e^{−2κs}·(K). Then b = e^{2κs}·c: at each moment the two have every proportion in common, and they differ only by a change of unit that depends on the time. They are not the same lengths (in b the block is flat, in c it is a cylinder), so whether they count as one shape depends on whether a unit may be chosen afresh at each moment. M1 says only that overall size has no meaning (l.255); it does not say whether that holds moment by moment. Not settled.
