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
