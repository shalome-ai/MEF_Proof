# Clause (a): does M1 supply "no mirror" and "time has a direction"?

**11 November 2026.** Directed by the PI (Decision Log P61; protocol agreed, "agreed, run the protocol"). The question: clause (a) of Definition 3.2 selects trace three because it is the only trace with one drive "up to a relabelling of the torus that keeps its orientation" (M1 v6.2 l.262; Proposition 4.5). Is that hypothesis supplied by the axioms?

**Disclosure.** The wanted answer was that the axioms supply it, since that keeps the ruling of P55 as it stands. The protocol and the rule for the conclusion (Part C) were fixed and shown to the PI before anything was run. Sections 1 and 2 below were written before the blind check returned.

**Read:** M1 v6.2 ll.169–236 (Definitions 2.3 to 2.9), 262, 404, 406–434 (Proposition 4.5), 436–528 (the fibre, the corner algebras), 700–716 (the twist, Definition 7.4), 808–826 (Corollary 7.7), 828–880 (Corollary 7.8).

## 1. Part A: counting (CHECKED, `checks/orientation_time_check.py`)

Classes of hyperbolic matrices of SL₂(ℤ) of trace t, for t = 3 to 60, under four notions of "the same drive". Two methods (cycles of reduced forms; brute force for t ≤ 8) agree.

| Notion | Mirror relabellings | Backwards counts as the same | Traces with exactly one drive |
|---|---|---|---|
| N1 | no | no | 3 |
| N2 | no | yes | 3, 4, 5, 9, 21 |
| N3 | yes | no | 3, 4, 5, 9, 21 |
| N4 | yes | yes | 3, 4, 5, 9, 21 |

**Result.** Trace three is singled out only under N1. The hypothesis has two parts and needs both: (H1) a mirror relabelling does not make two drives the same; (H2) a drive and the same drive run backwards are not the same. The paper states H1. H2 is implicit in its wording ("a relabelling of the torus": reversing time is not a relabelling of the torus) and is not stated.

At traces 4, 5, 9 and 21 there are exactly two drives under N1, and each is at once the mirror image and the time-reverse of the other.

## 2. Part B: what M1 puts on the torus and on time (the architect's table, written before the blind check)

| # | Structure | Where | A mirror of the torus | Time run backwards | Derived or convention |
|---|---|---|---|---|---|
| 1 | The fold z ↦ −z | Prop 5.5, l.492 | unchanged: −1 commutes with every relabelling (CHECKED, trivial) | unchanged | derived |
| 2 | The four corners and their algebras | Prop 5.6, l.512; l.404 | unchanged: a mirror permutes the corners as some non-mirror relabelling does (GL₂ and SL₂ have the same image modulo 2), and which corner carries which unit "is a convention" (READ) | unchanged: the direction of the three-cycle "is a convention with no invariant content" (READ, l.404) | the labelling is a convention |
| 3 | The corner signs | Cor 7.7, l.808 | unchanged, as 2: the three patterns "are one pattern at three successive steps" (READ) | unchanged | — |
| 4 | The flux three of the twist | l.706; Def 7.4 | unchanged: the complex structure on E is auxiliary, "the counts below do not depend on which such complex structure is taken" (READ), and the mirror of one is another for which the fold is z ↦ −z; the structure of a twist is its flux and corner signs, on which maps act "through the corners" | unchanged | — |
| 5 | The drive's element on spinors, cube +1 | Cor 7.8 (v6.2) | unchanged: composing the assignment with a mirror keeps the image group, and the mirror image of M₀ has trace three, so is conjugate to M₀ in SL₂(ℤ) (Thm 4.2) and has an element of the same cube (ARGUED) | unchanged: the inverse has cube +1 | — |
| 6 | The handedness of the multiplication table, IJ = K, as a structure on F | Def 2.7, l.211 | **changed by a mirror of the torus alone**: the structure fixes an orientation of F (its structure group Sp(2)Sp(1) is connected: ARGUED), and a mirror of one factor alone reverses it. **Not determined** whether a symmetry of the whole of F exists that mirrors the torus and compensates on the base | not determined | Def 2.7 is a numbered choice (the fifth), a reading of A3, not the axiom's words |
| 7 | The flow of the drive | Def 2.9, l.229 | — | **not determined**: a flow has a direction, and the product of the fibre algebra is taken "in the order in which they occur in time" (Def 2.5); but the text nowhere says that the reversed flow is a different geometry, and the reversed algebra is again the quaternions | — |
| 8 | The exchange of growth and decay | Def 2.4(iii), l.187; Lemma 5.1, l.441 | — | **not determined**, and it bears the other way: M1 has a symmetry ι that it calls "composition run backwards" on the algebra. On the torus ι is z ↦ −z, which commutes with the drive and does not turn it into its inverse | derived (A2) |

## 3. Part C: the conclusion, by the rule fixed beforehand

- **H1 (no mirror): not supplied.** Seven of the eight structures are blind to a mirror. The one that is not, Definition 2.7, is a numbered choice and not an axiom, and the text does not determine whether the whole geometry has a symmetry that mirrors the torus.
- **H2 (time has a direction): not supplied.** The definitions use a direction of time and do not say that the reversed universe is another universe.
- By the rule, the hypothesis stays declared, and the paper should state both of its parts. At present it states one.

**What does not change.** Trace three. If either part fails, clause (a) leaves traces 3, 4, 5, 9, 21, and clause (c), least entropy, takes three. What changes is the ground: under the PI's ruling P55 clause (a) is the ground, and that ruling stands only with H1 and H2 declared.

**Failure tests.** For H1: a symmetry of the geometry of M1 that mirrors the fibre torus. For H2: a later paper in which a state and its time-reverse are identified.

## 4. The blind check (returned after sections 1 to 3 were written)

A fresh sub-agent was given the four notions, the quoted definitions and the questions, without the architect's verdicts and without the wanted answer. Its script is `checks/orientation_time_blind.py` (three methods, traces 3 to 30).

- **Part A: agrees.** N1 gives {3}; N2, N3 and N4 give {3, 4, 5, 9, 21}. It adds that N2 and N3 are different relations with the same list (they differ at traces 15 and 27).
- **What the counts rest on.** That every merge is a true equivalence is CHECKED, so "exactly one class" under N2, N3, N4 is CHECKED outright. That distinct cycles are distinct classes rests on Gauss's theory of reduced forms, RECALLED by the checker; for M1 the only use of a lower bound is "at least two classes at every trace t ≥ 4 under N1", which is Proposition 4.5 with its Lean certificate.
- **Part B: agrees on every verdict**, with three points the architect's table did not have:
  1. Structure 4 (flux): unchanged as the paper defines it; but the text does not say whether E has an orientation fixed independently of the complex structure, and if it had, the sign of the flux would see a mirror.
  2. Structure 6 (IJ = K): that it orients F holds only if the tangent directions of F are carried to themselves by I, J, K, which "whose restriction to F carries the full algebra" does not say in so many words.
  3. Structure 5 (the element of cube +1): a stronger argument than the architect's. M₀ lies in the commutator subgroup of SL₂(ℤ), which every mirror and inversion preserve, and the commutator subgroup of the group of twelve has order three, so the cube is +1 for every admissible assignment.
- **Part C: agrees.** Both H1 and H2 are needed; at trace three all four counts are one, so the hypotheses matter only for excluding 4, 5, 9 and 21.
- **Missing from the text, in the checker's words:** "a notion of isomorphism of geometries", that is, M1 does not say when two geometries are the same.

**Step audit.**

| Step | Statement | Status |
|---|---|---|
| R1 | The four counts, traces 3 to 60 | CHECKED, two scripts, five methods between them |
| R2 | Trace three is singled out only under N1; both H1 and H2 are needed | CHECKED |
| R3 | Structures 1 to 5 are blind to a mirror and to time reversal | READ and ARGUED; blind check agrees |
| R4 | Structure 6 sees a mirror of the torus alone | ARGUED, conditional (point 2 above); a numbered choice, not an axiom |
| R5 | Whether the whole geometry has a symmetry that mirrors the torus | **GAP: not determined by M1** |
| R6 | Whether the reversed universe is another universe | **GAP: not determined by M1**; M1 has no definition of when two geometries are the same |
| R7 | Conclusion: H1 and H2 are not supplied by M1 as written; they stay declared, and the paper should state both | follows from R2–R6 by the rule fixed beforehand |
