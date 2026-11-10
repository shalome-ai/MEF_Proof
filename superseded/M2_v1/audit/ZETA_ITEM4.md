# Item 4: can the corner angle over the time circle be the coupling of Φ?

**10 November 2026.** Directed by the PI: "take item 4 - if that is a dead end then we have to stop and I have to re-think."

Item 4 (`papers/M1/CONSEQUENCES_OF_B.md` C5): connect the count 12π (π at each corner × four corners × three steps of the drive) to the coefficient ζ of T^Φ in the Master Equation.

**Read:** `M2_WP3` ll.60–125, 165–190, 318–374 (the equation, the action, the relation a = −ζΦ); the PI's block-matrix form `TPhi_12x12_elements.tex` ll.30–75, 190–206, 350–370. **Computed:** by hand, shown below; the steps were given to a blind checker without the target, and its additions were re-derived here.

## Verdict

**As posed, it is a dead end.** The Master Equation with the action M2 gives it cannot turn the corner angle into ζ. The count 12π stands as a count of M1's shape; nothing in the equation makes it the coupling.

## Why, step by step

| # | Step | Status |
|---|---|---|
| 1 | In the action ζ multiplies the square of the gradient of Φ: −ζ⟨∇Φ, ∇Φ⟩ (`M2_WP3` l.92) | READ |
| 2 | **A number in front of a squared gradient has no value until the size of Φ is fixed.** Replace Φ by cΦ and ζ becomes ζ/c². Only ζ × (size of Φ)² means anything. M2 says ζ "is never absorbed into a redefinition of the field" (l.186); that is a convention, and it needs a stated unit for Φ to have content | CHECKED (one line); blind check agrees |
| 3 | The corners do appear in the gravitational action. The curvature concentrated at a cone point is twice its missing angle, so the four corners over the time circle contribute 2 × 12π × (length of a step) to the curvature term. The count is exactly half the corners' share of the Einstein–Hilbert action | CHECKED (Gauss–Bonnet: 4 × 2π = 8π = 4π·χ); blind check agrees |
| 4 | Taking the trace of the Master Equation: curvature = ζ × |∇Φ|² + smooth terms. So the equation does relate curvature to ζ and the gradient of Φ | CHECKED; blind check agrees |
| 5 | **But the two sides cannot meet at a corner.** The corner's curvature sits at a point. The squared gradient of a field of finite energy cannot sit at a point | blind check E8; re-derived |
| 6 | **The full equation forbids it on the pillowcase.** There the curvature is the same in every direction, while ζ ∂Φ ∂Φ points along one direction only. They can be equal only if both vanish | blind check; re-derived |
| 7 | **With no potential, Φ must be constant.** On a closed shape a single-valued Φ obeying its own equation has zero total gradient energy | blind check; re-derived (integrate Φ□Φ by parts) |
| 8 | **Read on the covering torus, the corners have no curvature at all.** The torus is flat; the fold only identifies points | blind check E9. This is the PI's own statement that the shape is smooth above and the cones are in the shadow |
| 9 | Forcing the match anyway, on simple profiles for Φ, gives 7.39π, 2.17π, or a number depending on a free length. Not 12π. (12π would need the pillowcase's sides in the ratio 3, where M1 Prop 8.2 has 1.8466.) | CHECKED; computed before comparing |

## What this says, plainly

1. **The count and the coupling are different kinds of thing.** The count is geometry of M1's shape (an angle at the corners along time). ζ in the equation is the strength with which the gradient of Φ bends the shape, and its value is tied to the unit in which Φ is measured. No derivation of "ζ = 12π" is possible, by this route or any other, until the series says what one unit of Φ is.
2. **An angle at a corner is produced by a source sitting on the corner, not by a field spread over the shape.** In the standard relation (RECALLED by the blind check, not verified here: the cosmic-string relation) the angle equals the gravitational constant times the tension on the corner, and ζ does not enter.
3. **Every sourced factor found today stays found:** π per corner, four corners, three steps (P28), the period-three twist, the choice inside Cor 7.4, the two meanings of "circuit". Those are findings about M1 and M2 whatever ζ turns out to be.
4. **What was not tried, deliberately.** Adjusting the pillowcase's shape, the length of a step, or the profile of Φ until 12π comes out. Each is available, each would work, and each would be the fitting the rules of 10 November exist to stop.

## What a re-think would have to supply (questions, not proposals)

- **What is one unit of Φ_QC?** Φ_QC = ω|ψ − ψ̄|² inherits its size from ψ. Is there a statement in the PI's account that fixes the size of ψ, or the range of Φ (for instance: it runs from 0 to 1; or it is an angle that closes after a given amount)?
- **Is ζ = 12π a derived number in the PI's account, or the name of the shape's count carried into the equation?** The note of 22 February and the block-matrix form state it; neither derives it (block-matrix form l.54, READ).
- **Do the corners of the pillowcase carry curvature in the twelve-dimensional shape or not?** If not (smooth above), the angle 12π lives only in the shadow, and then it would be the fifth axiom, not the equation in twelve dimensions, that brings it in.

## Failure test of this verdict

The verdict fails if the action is not the one M2 writes: for instance if Φ is not a single-valued field (an angle), if a term sits on the corners, or if the potential V is such that Φ has a fixed range. Each of those is a change to M2's action and would have to come from the PI's account.

---

## After the PI's three answers (10 November 2026)

PI (record §19): (1) Φ_QC runs from 0 to 1; (2) the second question is a dead end; (3) Papers III and III Addendum deal with the cones in the four corners.

**Read for this section** (body text; the corpus is read, never cited): Paper III V16 ll.281–330 (warped pillowcase metric, the four conical fixed points, the corner algebras), ll.471–560 (the 4D-smooth lift); Paper III Addendum v11 ll.171–250 (corner architecture, the four-corner table), ll.324–400 (cross-wall dilaton, the Sol flow), ll.459–548 (the base quantum π/12), ll.1186–1215 (cone deficits in the 4D shadow), ll.1405–1430 and 1467–1480 (the 12D metric and the warp). **Not read:** the rest of both papers. Red-flag scan run on the Addendum (39 hits in the file; those at the passages used are noted below).

### What the two papers say (READ)

| # | Statement | Where |
|---|---|---|
| R1 | The pillowcase carries a warp: ds² = dω² + e^{2A(ω)}dψ², A = −k_ω ω, with k_ω L_ω = 12π, "the warp budget ζ = 12π is the topological invariant χ(K₈)·π", citing Paper I and its Addendum | Paper III ll.283–291 |
| R2 | The four corners are "conical fixed points of T²/ℤ₂"; two are at ω = 0 (called UV) and two at ω = L_ω/2 (called IR). K₈ is called "an orbifold with π-deficit conical singularities" | Paper III ll.293–303; Addendum l.1128 (that line seen in a search listing only) |
| R3 | In the twelve-dimensional metric the pillowcase part is dθ_ψ² + e^{2ζΦ_QC}dθ_ω²: **ζ multiplies Φ_QC in the exponent of the warp.** Spacetime carries no warp; the warp acts on ℂP² × S² and on the ω-direction of the pillowcase | Addendum ll.1411–1417 |
| R4 | At the far corners the exponent is A = −k_ω L_ω/2 = −ζ/2 = −6π | Addendum l.1475 |
| R5 | A second kind of cone: "The 'cone' has a singular tip in 4D but is smooth in higher dimensions"; these are "projection artefacts of smooth higher-dim geodesic flows" on S¹_Sol × S³, and the lepton mixing angles are their deficits | Addendum ll.1190–1192 |
| R6 | The formula for that deficit is marked "Motivated": "A formal proof … from the explicit metric is open; the form is supported by empirical match" | Addendum l.1205. **Red flag: agreement with a known target** |
| R7 | The Spin^c lift of the fold has the corner pattern {0, 0, 0, π}, "a σ-fixed-point asymmetry rather than a translation accumulation" | Addendum l.467. This is M1 Cor 7.4's + + + − |
| R8 | A phase quantum π/12 per half-period, from "a ℤ₂₄ cyclic structure", 24 = 4 × 6, where the paper itself says the 4 and the 6 are multiplied and not combined as orders of a group would be | Addendum ll.496–510. **Red flag: a choice of how to combine, with the answer known** |

### What the PI's answer (1) does

With Φ_QC running from 0 to 1 and R3, **ζ is the whole exponent of the warp across the pillowcase.** That is a statement about the shape, with a unit, and the objection "ζ has no value until the size of Φ is fixed" (step 2 above) is met.

It does not by itself connect the two roles of ζ. In R3, ζ is an exponent in the metric. In the Master Equation, ζ is the coefficient of T^Φ. That these are one number was the handover's "Φ_QC is the warp seen from 4D", which was adopted unchecked on 8 November and withdrawn (CLAUDE.md §2). I have not rebuilt on it.

### What the two papers do and do not supply

1. **They use 12π; they do not derive it.** R1 sends the reader to Paper I and its Addendum, which is the one derivation already audited (`STEP_AUDIT.md` §§1–7) and found not to hold.
2. **They answer the third question of this note for the corpus:** the corners of the pillowcase are conical in K₈ (R2). So the corpus does not take the "flat on the covering torus" reading (step 8), and the corners' curvature is there to be accounted for.
3. **They hold two kinds of cone apart, and the PI's sentence "singular in 4D, smooth above" belongs to the second** (R5): cones in the four-dimensional shadow of smooth motion on S¹_Sol × S³. The corners of the pillowcase (R2) are the first kind. Whether the second kind is the shadow of the first is not said in what was read.
4. **R7 confirms today's finding from the corpus side:** the corner pattern is a property of the fixed points, not something accumulated by moving along the pillowcase.
5. **R8 is a count of the kind the blind checks rejected today** (two numbers multiplied because the product is wanted). Noted; nothing is built on it.

### Where this leaves ζ: one equation

After (1), and with ruling P28, there are two definite statements about the pillowcase:

- **The corpus (R1, R3, R4):** the warp grows or decays across the pillowcase by a total exponent ζ. This is a *growth*: the corpus uses it as one, in factors such as e^{−6π}.
- **Today's count:** the angle missing at the corners, taken along the corner curves over the time circle, is 12π. This is a *turning*.

**ζ = 12π would follow from one equation: the total growth exponent of the warp equals the total turning at the corners.** Nothing read today states or derives that equation. M1's first axiom is about turning (closing); its second is about growth and decay. So the equation, if it holds, is a statement tying the first axiom to the second, and that is where the re-think has to look. The only growth exponent M1 and M2 actually derive is the drive's, 2 log φ per step, and it is not 12π or a simple fraction of it.

**Not done:** no attempt to produce that equation by construction.
