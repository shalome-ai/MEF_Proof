# Consequences of ruling (b): the time circle is three steps of the drive

**10 November 2026.** Directed by the PI: "work through the consequences of (b)". Ruling (b) is Decision Log P28: the odd corner of the Spin^c lift is a cycled corner, and the lifted fold is one structure on the whole shape. By `CORNER_SIGNS.md` §2 the structure then closes only on a time circle of three steps of the drive.

**Two words are needed, and M1 and M2 have only one.** M2 says "per circuit" for one application of the drive (`M2_WP2` l.161). Under (b) that is not once round time. Below: a **step** is one application of the drive M₀; the **time circle** is three steps. (Proposed for the Definitions Register; not entered.)

**How this was done.** Every line of M1 v2.1 and of the M2 work-package files containing "period", "circuit", "cycle", "entropy", "orbit parameter" or "mapping torus" was listed and the passages read (lines cited). Numbers: `checks/three_circuits_check.py`. **Not blind-checked.** Verdicts are item by item; the synthesis is the PI's.

## A. What does not change

| # | Result | Where | Why unchanged |
|---|---|---|---|
| A1 | The drive is M₀, trace three, least entropy | M1 Thm 4.2, Thm 4.3 | a statement about one step; see C1 for the wording it now needs |
| A2 | The corner three-cycle; the corner algebras ℝ, ℂ_i, ℂ_j, ℂ_k | M1 Prop 4.4, Prop 5.6 | statements about one step |
| A3 | The fibre, the dimension, the base, Spin^c forced | M1 Thm 5.7, Thm 6.1, §7 | do not mention the period of time |
| A4 | Closure and drive as formal conditions | M1 Def 2.1, Def 2.7 | a longer time circle is still a circle; the flow still has no fixed points and positive entropy |
| A5 | The Sol metric and its rate κ = log φ² | `M2_WP2` ll.28–44 | the metric is the same at every step; only the range of s is now three steps |
| A6 | The exchange τ = (S, s ↦ −s) is well defined | `M2_WP2` ll.95–110 | needs S M₀ⁿ S⁻¹ = M₀⁻ⁿ; true for n = 3 (CHECKED) |
| A7 | The orbit average and the uncorrelated zero | `M2_WP5` ll.55–90 | a limit over many steps; M₀³ is ergodic as M₀ is |
| A8 | Time is the orbit parameter of the flow | M2 Def (fifth reading), `M2_WP0` ll.30–36 | unchanged in content |

## B. What (b) settles

| # | Item | Before | Under (b) |
|---|---|---|---|
| B1 | The closure sentence needed for the ζ count (`ZETA_LEAD.md`: "time returns the shape with what it carries") | an added hypothesis | a consequence of M1 Cor 7.4 with (b) |
| B2 | The quaternions' i, j, k | turned by a third each step; "back after three" only if the names are kept | back at the end of every time circle, since the drive's turn cubed is the identity (M1 l.346, CHECKED) |
| B3 | Why P₁ is counted three times | open | P₁'s curve runs the whole time circle, three steps, like the other three corners' |
| B4 | M1's choice of (−1)^{mn} among the four patterns | unstated choice inside an [R] corollary | cycled (P28), and the one cycled pattern the exchange τ leaves alone. M2 already has the fact: "τ fixes P₁ and P₄ and exchanges P₂ and P₃ (`L5_tau_corners`)" (`M2_WP4` ll.259–262, READ) |
| B5 | The count for ζ | 4π per step; "three steps" a choice | deficit × length over the time circle: four corner curves × three steps × π = 12π, in units of one step's length |

## C. What has to change or be decided

**C1. M1's second minimality criterion needs its object named.** Criterion (2) takes "the least entropy" (M1 l.221). Under (b) there are two things it could be applied to, and they give different answers (CHECKED):

| Applied to | Selected | Entropy | Corners |
|---|---|---|---|
| one step of the drive (M1 as written) | M₀, trace 3; the time circle is then three steps, return map M₀³ of trace 18 | 2 log φ = 0.962 per step; 6 log φ = 2.887 per time circle | three cycled |
| the return map of the whole time circle, required to leave the structure in place | trace 6, for example [[5,2],[2,1]]; it is not a square or a cube of anything | 1.763 per time circle | **none cycled** |

The second has lower entropy per time circle and has no three-cycle at all. *[Correction, 10 Nov 2026, second session: the sentence that follows is wrong, the architect's error, found by the blind check of M1 v4.1 (`STEP_AUDIT.md` §7a). A map that is the identity modulo two preserves every sign pattern, and a return map need only preserve the pattern, which a trace-four map can. What stands is that the return map is a power of the step.]* **It is excluded by the ruling itself** ("it is a cycled corner"), not by minimality. So M1 must say that criterion (2) is applied to the step, and that the time circle is the least number of steps on which the structure closes. This is a choice of the kind the Minimality Register exists for; an entry is proposed below.

**C2. The geometry has period one step; the twist has period three.** The Sol metric looks the same after each step (moving one step along time and applying the drive is a symmetry of the metric). The corner sign pattern is not the same after one step. So the shape has a three-fold symmetry of its metric which its Spin^c structure does not share. The three positions of the twist relative to the metric are the "three phases" of `CORNER_SIGNS.md` §6. Nothing in M1 or M2 mentions this. Whether these are the three generations is not shown (record §13, §18).

**C3. Numbers that are "per circuit" in M2 are per step.** `M2_WP2` l.161: "the drive stretches the fibre torus by φ² per circuit". Per time circle it is φ⁶ ≈ 17.94. The exponent 2 ln φ banked in P17 is per step; per time circle it is 6 ln φ. The texts need the two words.

**C4. The points returned.** Per step the drive returns three points of the pillowcase (one corner, two ordinary). Over the time circle the return map returns eighteen (four corners, fourteen ordinary) (CHECKED). Any count that used "three returned points" (`ZETA_COUNT.md`, `FACTOR_OF_TWO.md` §3, already withdrawn) is about a step, not the time circle.

**C5. ζ is now an angle along time, and M2 says it is a growth exponent across the pillowcase. These are different objects.** M2: ζ is "the exponent by which the warp of A2 falls across a half-period of the base" (`M2_WP3` l.80), the half-period being a length L of the pillowcase (`M2_WP4` ll.14–35, 222–245), and CLAUDE.md §5 repeats it ("ζ = 12π is the warp exponent per half-period"). The count under (b): ζ is the angle missing at the corners, taken along the corner curves over the time circle. And the only growth exponent the shape has along time is the Sol one, which over the time circle is 6 log φ ≈ 2.89, not 12π. So under (b):
- M2's reading of ζ as the warp exponent is not supported by the count (M2's derivation of it was already found not to hold, `papers/M2/STEP_AUDIT.md`);
- "ζ is the warp exponent and the coupling of Φ, one number" (CLAUDE.md §5) has to be re-read: the count gives an angle, and no statement yet connects that angle to the coupling of Φ.
This is the open item "why the coupling of Φ is this quantity", sharpened: it must connect an angle accumulated at the corners over the time circle to the coefficient of T^Φ.

**C6. The unit of length.** The count is 12π × (the length of one step along time). ζ is a pure number. M2's Sol metric has ds² with one step of unit length (`M2_WP2` l.33: the gluing is at s = 1), which would make the count 12π exactly; but that unit is a convention of the coordinates until something fixes the length of a step against the size of the pillowcase. M2 notes the same gap from the other side: "the ratio of the two rates is a pure number of the geometry with no input" (`M2_WP2` ll.163–165).

**C7. The sign of the lift is not settled by (b).** Over the time circle a spinor carried by the drive comes back with (±w)³ = ∓1. (b) makes the lifted *fold* one structure on the time circle; it does not say whether spinors are periodic or antiperiodic round time. `LIFT_SIGN.md` stands as it is. It matters because Φ_QC = ω|ψ − ψ̄|² is of odd degree in ψ: with the sign −1, Φ_QC would return to minus itself after one time circle. Flagged; not worked out.

**C8. M1 Prop 8.2 (the moduli).** The quanta (Q_c, Q_w) = (3, 6) are chosen as "the least odd and the least even quanta compatible with Proposition 7.3 and with one unit per corner-cycled sector" (M1 l.533). That clause uses the three cycled corners. Under (b) the cycled corners are three phases of one structure over the time circle, so "one unit per corner-cycled sector" needs to be re-read; and Prop 8.2 is already owed a re-reading under the unwarped base (P26). Not attempted here.

**C9. Text of M1.** Cor 7.4: state that the Atiyah–Bott input gives the class of four patterns, and that (−1)^{mn} is the choice "cycled, and unchanged by the exchange". Appendix l.602: say that the pattern returns after three steps and that the time circle is three steps. §2 Def 2.1 or a new definition: say what the time circle is. These go into the next M1 version with the fifth axiom; not applied.

## D. Proposed register entries (not banked)

- **Minimality Register, M1-x:** *Choice space:* what criterion (2) (least entropy) is applied to: the step of the drive, or the return map of the time circle. *Option taken:* the step (M1 as written; forced by P28, since the other option has no cycled corner). *Criterion:* P28. *Failure test:* if the return map of trace 6 in the class of [[5,2],[2,1]] admits the Spin^c structure with a distinguished corner and everything else M1 derives, the three-cycle, and with it the three, is not forced.
- **Definitions Register:** *step* (one application of the drive M₀); *time circle* (the circle T; three steps); *circuit* marked COLLISION in M2 (used for a step).
- **Future-Mx / audit list:** C5, C6, C7, C8 as open items of the M1–M2 audit.

## E. Where ζ stands after (b)

ζ = π (the angle missing at a corner, M1 Thm 5.7) × 4 (corners, Prop 5.3) × 3 (steps in the time circle, Cor 7.4 with P28). Each factor now has a source in M1 or a ruling. Open: C5 (why this angle is the coupling of Φ), C6 (the unit), C7 (the sign). Until C5 is closed this is a count that gives the right number with every factor sourced, and not a derivation of the coupling.
