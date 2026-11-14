# The flux three of the fibre and the three of c₁(ℂP²): an attempt to derive one from the other

14 November 2026, at the PI's direction (Decision Log P175: "Item 3 attempt the derivation now"). Lines are of `canon/M1/Paper_M1_Six_Axioms_v7_1.tex` (the passages are unchanged in v7.2). **Outcome: not derived from M1 as it stands. One lead is recorded; it is not a premise and enters no paper.** No counter-example was looked for.

**Disclosed before anything else (CLAUDE.md §5, "Blind").** The target was in view throughout: both numbers are known to be three. Nothing below can therefore count as a blind derivation, and any reading introduced here would be a reading introduced after the target was seen.

## 1. What the sentence says, and the two things "the same integer" can mean

The paper, after Proposition 7.6 (l.929): "And the flux three found here and the three of $c_{1}(\CPtwo)$ are the same integer, but this paper does not derive one from the other."

- *Equal in value.* Both are 3. This needs no proof.
- *One fact.* One forces the other, so that they could not have come out different. This is what a derivation would show.

## 2. Where each three comes from in the paper (READ)

**The three of $c_{1}(\CPtwo)$.** Proposition 7.2 (l.792): the units are complex-valued, "the corner data take values in $\C\otimes\ImH\cong\C^{3}$"; "The space of complex lines in $\C^{3}$ is $\CPtwo$ … its tangent bundle has $c_{1}=3h$". Its proof (l.798): "$c(T\CPtwo)=(1+h)^{3}=1+3h+3h^{2}$". The exponent is the number of coordinates of $\C^{3}$, that is, the number of imaginary units $i,j,k$. **This three is the number of imaginary units of the quaternions.**

**The flux three.** Proposition 7.6 (ll.877–919), by cases: flux one has "one state" and clause (iii) of Definition 2.1 fails; flux two meets clause (iii) only with $D=2P_{i}$, "whose structure, with the four corner signs alike, the drive leaves in place", and clause (ii) fails; flux three meets both. Read together: clause (iii) asks for two states for one lift of the fold, which needs flux at least two; at flux two the two states come only with all four corner signs alike; one more unit of flux makes one corner odd, which is what the drive can move. **This three is two, the "at least two" of clause (iii), and one more for the odd corner.** The number of imaginary units does not enter the count: the cases use the four corners, the two lifts of the fold, and that the drive fixes one corner and moves the others.

## 3. What the paper says about the two integers together (READ)

Section 7.4 (l.827): "The second cohomology of $\CPtwo\times\Stwo\times\Ttwo$ is one integer for each factor, with no mixed term, because the first cohomology of $\CPtwo\times\Stwo$ vanishes … The determinant line of a $\Spinc$ structure therefore carries three independent integers". And: "Whether the fibre is twisted, and by how much, is decided by the fifth axiom."

So in M1 as written the integer on $\CPtwo$ and the flux on the fibre are independent data of the determinant line; the first is fixed by Proposition 7.3 (clause (b)) and the second by the fifth axiom with clause (c). **No statement of M1 ties one to the other, and no chain of M1's own statements was found that does.** That is the result of the attempt.

## 4. A lead (recorded; not a premise; enters no paper)

Two things in the paper line up, and with one further reading the two threes would be one number counted twice.

(a) READ: Lemma 7.5(a), "There are exactly $d$ linearly independent states." At flux three there are three states at rest on the covering torus; the worked case (ll.921–925) gives them for $D=3P_{4}$ as "$1$, $1/(\wp-e_{4})$ and $\wp'/(\wp-e_{4})^{2}$. The first two are even and the third is odd." The fold therefore acts on the three states with signs $(+,+,-)$.

(b) READ: Section 5.5 (l.647), "$\Ad_{i}q=iqi^{-1}=-iqi=a+bi-cj-dk$": the inner automorphism by a unit acts on the three imaginary units with signs $(+,-,-)$. Proposition 5.6 has the fold act at a cycled corner as "the inner automorphism by the surviving unit".

(c) CHECKED by hand: $(+,+,-)$ and $(+,-,-)$ are the same pattern up to one overall sign (two alike, one different), and the overall sign is the choice between the two lifts of the fold (Definition 7.4: the second lift is minus the first).

**The reading that would make them one fact, which the paper does not make:** that the space of states at rest of the fibre *is* the space $\C\otimes\ImH$ of complex-valued imaginary units. Under it the number of states equals the number of units, so the flux, which equals the number of states (Lemma 7.5(a)), is three because there are three imaginary units, and $c_{1}(\CPtwo)=3$ for the same reason.

**Why it is only a lead.** (i) It is an identification ("this object is that one"), the step CLAUDE.md §5 names as the weak point, and it is introduced after the target was seen. (ii) It would be a new numbered choice of the paper, the PI's to make or not. (iii) It would give the flux by a second route (the number of units) beside the paper's route (the fifth axiom, least flux); that the two routes agree at three would then be a check, but under the reading the flux would no longer be "decided by the fifth axiom" alone, which changes what Proposition 7.6 claims. (iv) The drive is not checked: the paper says "The drive is not a holomorphic map of $E$; it acts on structures through its action on the corners", so how it would act on the three states, and whether as the three-cycle of the units, is not established here.

## 5. RECALLED (not read at source; nothing above rests on these; they enter no paper or register)

- A line of degree $d\ge3$ on a torus embeds it, by its $d$ independent sections, in the projective space of dimension $d-1$; this is $\CPtwo$ exactly when $d=3$.
- A smooth curve of degree $d$ in $\CPtwo$ has genus $(d-1)(d-2)/2$, so it is a torus exactly when $d=3$; such a cubic is the zero set of a section of the anticanonical line $\Oline{3}$.

If these were verified they would say that a torus sits in a projective plane as a curve of degree three, the three of $c_{1}$. They concern a torus inside $\CPtwo$; in M1 the fibre is not inside the base, so they do not by themselves derive anything about $M_{12}$.

## 6. What would show the outcome wrong

A chain of statements of M1 v7, each READ or CHECKED, from $c_{1}(\CPtwo)=3h$ to the least flux of Proposition 7.6, or the other way, that uses no reading the paper does not already make.
