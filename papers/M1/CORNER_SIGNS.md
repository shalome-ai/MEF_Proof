# M1 Corollary 7.4 (the corner signs) tested against the drive

**10 November 2026.** Directed by the PI: "test against Cor 7.4". The test was named in `LIFT_SIGN.md` §6 as the first place the condition "symmetries act on i, j, k only through what they do to the corners" could fail.

**Disclosure.** The wanted outcome (period three) was known to me. The script's protocol was fixed before it ran; the steps were given to a blind checker without the target.

**Read:** M1 v2.1 ll.426–442 (Prop 7.3, Cor 7.4 and proofs), l.464 (the eight corner functions), l.602 (the dictionary). **Computed:** `checks/corner_sign_check.py`.

## 1. The test asked for: passed

Every symmetry of the torus that leaves all four corners in place leaves every sign pattern unchanged (CHECKED; blind check C4: follows). The signs of Cor 7.4 are attached to corners and move only when corners move. So Cor 7.4 does not break the condition of `LIFT_SIGN.md`.

## 2. What the test found besides

M1's proof of Cor 7.4 says the Atiyah–Bott input "selects the refinement class". That class has four members (CHECKED; blind check C1–C3: follows):

| Pattern at P₁ P₂ P₃ P₄ | Odd one out | After one circuit of the drive | Returns after |
|---|---|---|---|
| + + + − (M1's, "(−1)^{mn}") | P₄ | + − + + | **3 circuits** |
| + + − + | P₃ | + + + − | 3 |
| + − + + | P₂ | + + − + | 3 |
| + − − − (the same as − + + + with the other overall sign) | **P₁** | unchanged | 1 |

1. **M1's argument does not select its own formula.** It selects the class of four; "(−1)^{mn}", with P₄ the odd one out, is a further choice the proof does not supply. The corollary is tagged [R]; the choice within the class is not [R]. (Blind check C2: follows. It adds that the overall sign is a convention, so the content is *which corner is the odd one out*.)
2. **The drive moves M1's pattern.** It carries the odd corner P₄ → P₂ → P₃ → P₄, and the pattern is back after three circuits and not before. Exactly one pattern is left alone by the drive: the one whose odd corner is P₁, the corner the drive fixes. M1 knows the first half: "the drive fixes P₁; the lift distinguishes P₄; these are different structures … and the drive permutes the lift's sectors" (l.602). It does not draw the consequence.
3. **The consequence, with the blind check's qualification.** On a shape whose time circle is one circuit of the drive, P₂, P₃, P₄ lie on one closed curve, and a sign cannot change along a curve. So M1's pattern cannot be the sign of *one fold lifted over the whole one-circuit shape* (blind check C5: sound, given that the lifted fold is one global object). Three readings remain, and M1 does not choose:
   - **(a)** the odd corner is P₁. One circuit suffices. But this contradicts M1's dictionary (P₄ = C_k carries the −1) and M2's use of it.
   - **(b)** the odd corner is one of the three cycled corners, as M1 says, and the lifted fold is one object on the whole shape. Then **the time circle must be three circuits of the drive** (three suffice; six are not needed: blind check Q1).
   - **(c)** M1's statement holds only at one moment of time; the lifted fold is not one object over the whole shape, and which corner is odd is "a label at a base time" that turns as time goes round.
4. **In the language of spin structures** (blind check C8; the correspondence is RECALLED and not verified against a reference): the three patterns the drive cycles are the three even spin structures of the torus, and the invariant one is the odd structure. Any drive of odd trace cycles the three and fixes the one.

## 3. What this does to the ζ count

The closure sentence needed in `papers/M2/ZETA_LEAD.md` was: time returns the shape with everything it carries. For the quaternions the blind check's objection was that an algebra turned on each circuit is still a closed structure, so nothing in M1 forced three circuits. **The corner sign is a harder case of the same thing, and it is M1's own.** Under reading (b), M1's Spin^c structure exists on the shape only if time is three circuits of the drive. That is the missing sentence as a consequence of M1's corollary and dictionary, provided the lifted fold is taken to be one object on the whole shape.

So the three in "π × four corners × three" has, for the first time today, a candidate ground inside M1: **the odd corner of the Spin^c lift is a cycled corner, and it takes three circuits to come home.** This is the PI's "the twist still contributes" (record §12) and "needs 3 spins to get back to unity" (record §17) in M1's own terms.

**It is not established.** It rests on choosing (b) over (a) and (c), and neither M1 nor the blind check decides that. And (a) is the simpler structure: minimality, applied naively, would take it.

## 4. Proposed corrections to M1 (not applied)

- Cor 7.4: the [R] content is "the pattern is one of the four refinements, product −1". Which corner is odd is a choice and must be stated as one, with its reason.
- l.602 and the paragraph after Prop 5.6: say what the drive does to the pattern (period three), and which of (a), (b), (c) is meant.
- If (b): the time circle T is three circuits of the drive, and every statement of M1 and M2 that uses "one circuit" as the period of time (M2's ζ "per half-period" among them) has to be re-read.

## 5. Failure tests

- For (b): if the lifted fold need not be one object on the whole shape, (c) holds and nothing forces three circuits.
- For the choice of odd corner: M1 ties C_k to P₄ by the lift (l.602). If the physics of M2 onwards never uses *which* corner is odd, (a) is available and the three disappears from this route.
- Not checked: M1's Atiyah–Bott claim "(−1)^d for odd determinant class" itself. Cited, not read. It is entered as owing in the step audit.
