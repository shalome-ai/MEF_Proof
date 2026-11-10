# M2 — step audit under CLAUDE.md §§2a–2c (begun 10 November 2026)

**Scope of this first part:** M2 Theorem 4.1 (kL = Nπ) and Corollary 4.2 (ζ = 12π), starting with the normalisation κ₂² = 2/L, as the PI directed (Decision Log P23(d)). The rest of M2, and M1, are still to be audited.

Statuses: **CANON** (a result of M1, by printed number) · **VERIFIED REF** · **CHECKED** (script named, or elementary and shown) · **DECLARED** (a reading, normalisation or assumption, named) · **ASSERTED** (stated without derivation in the text) · **GAP** (does not follow as written) · **RECALLED**.

**Read for this audit (body text):** `canon/M2/M2_WP4_warp_exponent.tex` ll.11–286 (all of M2 §4); `canon/M2/M2_WP3_master_equation.tex` ll.13–204, 315–374; `sources/Paper2_Sequestering_v7.tex` ll.173–219, 322–504 (the derivation M2 reproduces); `registers/Decision_Log.md` Q5, Q13–Q16. **Not available:** the file `M2_WP4_zeta_reproduction_findings.md` named in Decision Log Q13 ("Paper 2 §4 is not reproduced as [R] (Findings 1–4)"); it is not in the repository.

---

## 1. Where the derivation comes from

M2 §4 is, step for step and largely word for word, Paper 2 §4 (compare M2 ll.158–253 with Paper 2 ll.354–477). The differences are the rigour tags and the framing of the two-dimensional action: Paper 2 declares it as an axiom ("the reduction itself … is not re-derived here", Paper 2 ll.201–206); M2 calls it the base restriction of the Master Equation, "of the form" obtained from the warped-product curvature (M2 `M2_WP3` ll.319–330), tagged [D].

The Decision Log records two things about this route. Q13 (8 Nov 2026) ruled that a *new* derivation of ζ = 12π be pursued before M2 was frozen, a holonomy statement and "not a BPS kink", because Paper 2 §4 "is not reproduced as [R]". Q16 then records "the jump 2k = κ₂²Nπ is exact". The M2 text carries the kink route. The findings that led to Q13 are not in the repository, so this audit starts from the texts alone.

## 2. The chain, step by step

| # | Step (M2 line) | Status | What the audit finds |
|---|---|---|---|
| Z1 | The base system is S₂ = ∫√g₂ [R₂/2κ₂² − ½\|F\|² − V(a)] (ll.150–154) | **DECLARED** ([D] in M2) | Obtained "of the form"; the reduction is not carried out in M2. In two dimensions the R₂ term is a topological number by Gauss–Bonnet, so the displayed action contains no derivative of *a* and no term coupling *a* to F: *a* enters only through V(a) |
| Z2 | The energy "admits a completion of the square once V(a) balances the geometric bulk terms": E ∝ ∫√g₂ (∂a ± (κ₂²/2)\|F\|/√g₂)² (ll.162–168) | **ASSERTED**; as I read it a **GAP** | No derivation in M2 or in Paper 2. The square contains (∂a)² and a cross term ∂a·\|F\|; neither is present in the action of Z1, and tuning a potential V(a) cannot create them. M2 tags the first-order equation "[R] (as a theorem of [the base system])". I cannot derive it from Z1 |
| Z3 | Flux quantisation; N units at the corner P₁: F = Nπ δ(θ_ψ)δ(θ_ω)/√g₂ (ll.185–193) | **DECLARED** (placement, [D] in M2) + **CHECKED** arithmetic | The fundamental-domain count is certified (`L5_FD_check`). That the flux is a point source at one corner is M2's [D] reading |
| Z4 | Between the walls ∂a = −k, constant (ll.198–205) | **DECLARED** ("the boundary condition of the construction", [D]) | Not derived from the first-order equation: where F vanishes that equation gives ∂a = 0, not −k. The constant slope is put in |
| Z5 | The kink: [∂a]₀ = −(κ₂²/2)∫_{−ε}^{ε} (\|F\|/√g₂) dθ = −κ₂²Nπ (ll.206–211) | **GAP** — does not follow as written | **CHECKED** (`checks/kink_check.py`, K3): with the F of Z3, the integral over θ_ω alone leaves a factor δ(θ_ψ); it is not a number, and it is not the same at every point of the wall. And the prefactor (κ₂²/2)·Nπ has become κ₂²·Nπ with no step that supplies the factor 2. A point source in two dimensions is of codimension two; a jump in slope across a line needs a source spread along that line |
| Z6 | The same kink is −2k, so 2k = κ₂²Nπ (ll.212–216) | follows from Z4 and Z5 | Inherits Z4 (declared) and Z5 (gap). `L5_balance` certifies only the algebra "if 2kL = 2Nπ then kL = Nπ" |
| Z7 | **κ₂² = 2/L** (ll.220–233) | **DECLARED** as a normalisation ([D] in M2); **no derivation exists in either text** | One sentence: "the normalisation connecting the deficit angles to the length of the domain fixes" it. M2 says a derivation "would upgrade it to [R]; not supplied here" and defers it. **Sensitivity, CHECKED (K5): with κ₂² = c/L the result is kL = (c/2)Nπ.** c = 1 gives 6π; c = 2 gives 12π; c = 4 gives 24π. Nothing in the text selects c = 2 other than the sentence quoted. Separately, κ₂² appears in Z1 as the coefficient of R₂; I have not found a units assignment in which it is both that coefficient and equal to 2/L, but I have not proved there is none |
| Z8 | kL = Nπ (l.242) | follows from Z6 and Z7 | Inherits Z4, Z5, Z7 |
| Z9 | N = χ(K₈) = 12 by "tadpole cancellation" (ll.79–99) | **ASSERTED** ([D] in M2) | "The gravitational contribution to the tadpole is the Euler density … the flux contribution … must balance it." No tadpole equation is derived for this theory in M1 or M2. Tadpole conditions of this kind are known in string compactifications (RECALLED; there the Euler characteristic enters divided by 24), and the statement here is by analogy. χ(K₈) = 12 itself is CANON (M1 Thm 7.6) |
| Z10 | The coupling ζ of the field equation *is* this exponent: a = −ζΦ with Φ falling by one unit across the half-period (ll.130–146) | **DECLARED** ("the definition of the normalisation of Φ on the base", [D]) | This is what makes the 12D coupling and the 2D exponent "one number". It is a normalisation of Φ, not a derived equality |
| Z11 | ζ = 12π (l.247) | follows from Z8, Z9, Z10 | Inherits everything above. `L5_zeta` certifies 3·2·2·x = 12x |

## 3. What the chain establishes, as I read it

Granting every declared and asserted step, the algebra from Z6 onward is right and is certified. But the number 12π is the product of four inputs, none of which is derived in M2:

1. a first-order equation that does not follow from the displayed action (Z2);
2. an evaluation of the kink that does not follow from the stated flux density (Z5);
3. a normalisation κ₂² = 2/L with a free constant in it (Z7), on which the answer depends linearly;
4. a flux number N = χ taken from a tadpole condition that is not derived (Z9);

and the identification of that number with the coupling of the field equation is a fifth, by normalisation of Φ (Z10).

**The value 12π was known from the earlier corpus before M2 was written** (Decision Log Q5: "ζ = 12π is derived — canonical site Paper 2"). With a free constant at Z7 and a declared slope at Z4, the derivation as written cannot be said to produce 12π; it is compatible with 12π. This is the pattern CLAUDE.md §2b was written for. I cannot say from the text whether the constants were chosen to reach the number or were arrived at independently; the text does not let anyone tell, and that is the finding.

**What is not in question.** χ(K₈) = 12 and the deficit π at each corner are theorems of M1 (Thms 5.7, 7.6). The form of the Master Equation (M2 Thm 3.1) does not depend on the value of ζ. What is in question is the claim that the coupling equals 12π, and with it everything downstream that uses the number.

**First hypothesis, per CLAUDE.md §2:** that my reading is wrong somewhere, in particular at Z2 (a completion I have not seen) and Z5 (a convention for the integral I have not understood). An independent blind check of the bare steps was commissioned before this file was written; its verdicts go in §5.

## 4. Red-flag scan (gate 7), and a limit of the scanner

`tools/redflags.py` gives 4 hits on M2 §4 (287 lines) and 2 on Paper 2 ll.322–504. That is low, and it is misleading: the three weakest steps are phrased as "admits a completion … once V(a) balances", "the normalisation … fixes", and "exactly", none of which the scanner looks for. The scanner needs those patterns added (assertion verbs with no derivation: "admits", "fixes", "is fixed by", "exactly", "once … is tuned/balances"). Until then a low count is not evidence of soundness; this audit was done by reading.

## 5. Independent blind check (measure 3) — done 10 November 2026

**How it was run.** A fresh sub-agent was given the two-dimensional action and the ten bare steps (Z2–Z9 and Z11 above, with Z1 as the setting), in neutral notation, with no file access and no mention of the series or of what result was wanted. It was told to find what does not follow.

**Its verdict in one line:** "the chain does not derive k L = 12π. The number is the product of three inserted normalisations … and one unexplained factor of 2."

| Step | Blind verdict | Agrees with §2? | My re-check |
|---|---|---|---|
| Z2 (square) | does not follow: the action has no derivative of A and no A–F coupling; in two dimensions the curvature term is a constant, so κ² enters no equation of motion | yes | by reading the action; Gauss–Bonnet in 2D is standard |
| first-order equation | does not follow even granting the square; **and it has no non-trivial solution on the pillowcase**: its left side integrates to zero over a period, its right side is ≤ 0 | goes further than §2 | **CHECKED** (`kink_check.py` B3; elementary) |
| Z3 (flux density) | the "check" fails: the origin is one point of the cover, so the cover carries N/2, not N; a delta-localised flux does not solve the source-free Maxwell equation in two dimensions | goes further | first part **CHECKED** (B1); the Maxwell statement not checked by me |
| Z4 (constant slope) | does not follow: with F = 0 the equation gives zero slope; the profile also needs an opposite kink at the far wall, with no source | yes, and further | **CHECKED** (B3) |
| Z5 (kink) | does not follow, three errors: a δ(θ_ψ) remains; **integrating a first-order equation gives a jump in A, not in its slope**; the factor 2 is unaccounted | yes; the second error I had missed | **CHECKED** (K3, B2) |
| Z7 (κ₂² = 2/L) | does not follow: Gauss–Bonnet is scale-invariant and contains neither a length nor κ²; an independent normalisation, dimensionally inconsistent with the action | yes, and stronger on the units | sensitivity **CHECKED** (K5); the units argument read and agreed, not scripted |
| Z8 | algebra follows; **"the π is … the flux normalisation, not the deficit angle; the deficit angle never enters the computation"** | new | **CHECKED** by reading: the π of the result enters at Z3, in F = Nπ δδ |
| Z9 (tadpole) | an analogy, not a derivation; the known conditions carry χ/24 and a quadratic flux term, which would give 1/2, not 12 | yes | RECALLED by both; reference not verified |

**Its list of free normalisations.** Each multiplies the result linearly, and nothing in the chain fixes any of them: κ₂² = c/L; the strength of the flux density; the factor ½ dropped at the kink; the coefficient inside the square; and N = c·χ.

**What it says is established:** "Only the conditional arithmetic: if the slope jump … is −κ²Nπ, and κ² = 2/L, and N = 12, then kL = 12π."

**Standing of this check.** It is model output, as mine is. Where its points are elementary I have re-checked them by computation (marked above). Its recollection of the string-theory tadpole condition matches mine and is unverified. The two readings were made independently and agree on every step; on three points the blind check found more than I had.

## 6. Position after the audit

1. **M2 Theorem 4.1 and Corollary 4.2 are not established by the derivation in M2 §4.** What is certified (`M2_L5_warp`) is the arithmetic that follows once the kink, the normalisation and the flux number are granted.
2. The five inputs of §3 are each either asserted or declared, and at least four of the steps do not follow as written (the square; the first-order equation's solvability; the kink; the normalisation).
3. The π in "12π" comes from the flux normalisation, not from the cone deficit, contrary to the statement of Theorem 4.1 ("the factor π is the deficit angle at the cone point").
4. Not affected: χ(K₈) = 12 and the deficit π at each corner (M1); the form of the Master Equation (M2 Thm 3.1), in which ζ is a coupling constant whose value this section was to supply.
5. Affected: every statement that uses the *value* ζ = 12π. In M2 itself: the abstract, §1, Cor 4.2, §4.8 (direction), §5.4 (the sign of ω on "the solutions of §4"), and the certificate descriptions. In the series: the Minimality Register entries M2-6 and M2-8, the ledger rows for §§bps–gb and Thm warp-exponent, and CLAUDE.md §5 ("ζ = 12π is the warp exponent per half-period and the coupling of Φ, one number").

**For the PI.** Under CLAUDE.md §2c the options are: (a) find a derivation of the value of ζ that survives a step audit and a blind check, written blind to the target; (b) state ζ in M2 as a constant of the theory whose value is a declared assumption, with its failure test, until (a) is done. What M2 may not do is carry the present derivation at [R].

---

## 7. Paper I Addendum §3 read (10 November 2026), and the term "kink"

**Read in full:** `sources/Paper_I_Addendum_v3.tex` ll.884–1102 (§3, "The π-per-Flux-Unit Result: Reduced 2D BPS Equation"). The PI directed this reading: ζ "is in Paper I Addendum Section 3".

**It is the same chain.** The Addendum's §3 has the same steps in the same order as Paper 2 §4 and M2 §4, with θ_ψ as the transverse coordinate where Paper 2 has θ_ω (the difference ruled on in Decision Log Q15):

| Step | Addendum line | Its own tag |
|---|---|---|
| the 2D action, "after integrating out the internal 6D fibre and 4D spacetime" | l.918 | [D] |
| the square, "by tuning V(A) to balance the geometric bulk terms (the Randall–Sundrum fine-tuning)" | ll.931–943 | [D] |
| the first-order equation | l.950 | [R] |
| the flux density Nπ δ(θ_ψ)δ(θ_ω)/√g₂ | l.964 | [D]; its verification [R] |
| the slope −k between the fixed points | l.981 | [D] |
| the kink, by integrating the first-order equation across [−ε, +ε] | ll.989–997 | [D] |
| κ₂² = 2/L_ψ, "the geometric normalisation connecting the deficit angles to the domain length rigidly fixes" | ll.1025–1028 | [D] |
| kL = Nπ | l.1047 | [R]; the section is classified "Rigorous" |

So the audit of §2 and the blind check of §5 apply to this text as they stand. Five of its steps carry the Addendum's own tag [D], and the conclusion is tagged [R].

**How the section describes its own origin** (ll.886–892): "The identification ζ = 12π relies on χ(K₈) = 12 units of quantised flux, each contributing exactly π to the warp exponent. This π-per-flux-unit correspondence was originally presented as a heuristic matching to the deficit angle at the orbifold fixed points. This section derives it rigorously". The value was in use before this derivation was written.

**The term "kink", from the texts** (Definitions Register): a discrete jump in the *derivative* of the warp exponent at a point. "Each unit of flux contributes a discrete kink of exactly κ₂²π to the derivative of A" (Addendum ll.996–997); "the jump in the derivative at the origin is [∂A]₀ = A′(0⁺) − A′(0⁻) = −k − (+k) = −2k" (ll.1034–1038). Paper 2 ll.418–424 and M2 `M2_WP4` ll.211–213 say the same. The companion statement the Addendum gives for it is the Israel junction condition ΔA′ = −κ²λ (l.1062).

**The finding at Z5, restated in the defined term.** The definition is consistent across the three texts and I am using it as they do. The difficulty is not in the word but in the line that produces the kink: eq. (kink) obtains a jump in ∂A by integrating, across the point, an equation whose left side is ∂A. Integrating ∂A across the point gives A(ε) − A(−ε), the change in A; a jump in ∂A comes from integrating an equation whose left side is the second derivative. The Addendum's own consistency check (i) names such an equation: the junction condition ΔA′ = −κ²λ. On that reading the *statement* intended at this step may well be a junction condition of the second-order equations, and what does not hold up is the route written down for it (a first-order equation from a completed square). That is for the PI to say; I report what the lines say.
