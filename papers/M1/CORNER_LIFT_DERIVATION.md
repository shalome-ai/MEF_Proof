# M1 Corollary 7.4: the attempt to derive the product of the corner signs

**10 November 2026.** Directed by the PI ("yes attempt"), after the reading of Atiyah–Bott showed that the paper does not contain the statement Corollary 7.4 cites it for (`registers/Verified_References.md` V-7).

**Result in one line.** The derivation does not give M1's statement. For the structure M1 constructs, the product of the four corner signs is +1, not −1; a pattern with one odd corner needs something M1 does not have: a twist of the fibre's spinors by a line of odd degree on the torus.

**Disclosure.** The wanted outcome (product −1) was known to me. The steps were given to a blind checker without it; its verdicts are in §4. **Check script:** `checks/corner_lift_check.py` (K1–K8, all pass).

Under CLAUDE.md §2 the first hypothesis is that my reading of the corollary is wrong. I therefore report the computation and the reading, and have changed nothing in the paper.

## 1. What is being computed

M1 Cor 7.4 (v2 ll.436–442): "With c₁(L) odd the lift of ι to the spinor bundle acts at the corner C_{m,n} by the sign (−1)^{mn}: three corners carry +1 and one carries −1, with product −1 … For even L the product would be +1." Here ι is the fold z ↦ −z of the torus (M1 l.317), the corners are its four fixed points (M1 Prop 4.4), and L is the determinant line of the Spin^c structure, which M1 takes to be the canonical one, L = K⁻¹ = 𝒪(3), with the oddness coming from ℂP² ("the S² factor is spin and the pillowcase is flat, so neither obstructs", M1 l.433).

A "corner sign" is the action of the lifted fold on the fibre of the spinor bundle at a corner, relative to its action at P₁. For a spin structure this is Atiyah–Bott's ε(P, f̂) ε(Q, f̂), which depends on f alone (V-7, READ). For a Spin^c structure it is taken for lifts whose square is a constant.

## 2. The steps

| # | Step | Status |
|---|---|---|
| D1 | A spin structure on the torus is a character χ of the lattice: the spin frame bundle is (ℝ² × Spin(2))/Λ, with λ acting by (x, g) ↦ (x + λ, χ(λ) g). Four of them | standard; blind check: correctly stated |
| D2 | The fold lifts to every one of them as (x, g) ↦ (−x, α g), α over the half-turn | **CHECKED** by hand (descent: χ(λ)χ(−λ) = 1) and K1 |
| D3 | At the corner λ/2 the lift acts by χ(λ) α. So the corner signs relative to P₁ are (1, χ(e₁), χ(e₂), χ(e₁)χ(e₂)) | **CHECKED** by hand and K2; agrees with Atiyah–Bott Prop 8.45 (the class of the spin structure on the loop of class λ) |
| D4 | **For a spin structure the corner signs are a character: all equal, or two and two. Their product is +1. One odd corner never occurs** | **CHECKED** K2, K3 |
| D5 | The canonical Spin^c structure of the complex torus has spinors (functions) ⊕ ((0,1)-forms); the fold acts by +1 and −1 on these at every corner alike. Relative signs all +1 | **CHECKED** by hand, K4. Blind check: true for the natural (pull-back) lift; other lifts of the same structure give the two-and-two patterns; **no lift gives one odd corner** |
| D6 | A line bundle N of degree one with an invariant section vanishing once, at P₄ (the theta function θ₃: even, one zero at (1+τ)/2): the fold acts by +1 at the three corners where the section is not zero and by −1 at P₄. Signs (+, +, +, −), product −1 | **CHECKED**: the argument by hand; evenness, quasi-periodicity and the zero of θ₃ numerically (K5) |
| D7 | Spinors twisted by Nⁿ (determinant line of degree 2n on the torus): product of the corner signs (−1)ⁿ; for n odd the four patterns, one for each χ, are exactly the four with one odd corner | **CHECKED** K6, K7 |
| D8 | Every case is of this form, so: **product of the corner signs = (−1)ⁿ, n = half the degree of the determinant line on the covering torus** | follows from D1–D7 for holomorphic lifts; the classification step uses two standard facts **RECALLED** (the fold acts as inversion on degree-zero line bundles; the descent of an equivariant line bundle to the quotient). The blind check cross-checked the parity by the holomorphic Lefschetz formula in three cases |
| D9 | On a product B × torus with the fold acting on the torus only, and a determinant line pulled back from B: the corner signs are those of the case n = 0. **Product +1, whatever the parity of c₁(L) on B** | follows from D4, D5, D8. Blind check: "No: a three-and-one pattern cannot be produced … c₁(L) odd on B contributes nothing" |
| D10 | Under the drive: the all-equal pattern is fixed and the three two-and-two patterns are cycled with period three; for n odd the pattern with odd corner P₁ is fixed and the other three are cycled with period three | **CHECKED** K8 |

## 3. What this says about Corollary 7.4

1. **The counting in M1 is right.** Four of the eight corner functions have product +1 (the characters) and four have product −1 (one odd corner). D4 and D7 identify them: the characters are what a spin structure gives, and the others are what a twist of odd degree on the torus gives.
2. **M1's criterion for which class occurs is not right as written.** M1 says the class is decided by whether c₁(L) is odd, with the oddness coming from ℂP². By D8 it is decided by the parity of n, half the degree of the determinant line **on the torus**. The two are different numbers.
3. **For the structure M1 selects, n = 0.** M1 takes the canonical Spin^c structure, L = K⁻¹, and the canonical line of the flat torus is trivial; M1's criterion (1) excludes any further twisting line as an unforced datum (Prop 7.3). So by D9 the product is +1 and no corner is odd.
4. **What would give M1's statement:** an odd number of units of the determinant line's flux through the covering torus divided by two, that is, a twisting line of odd degree on the torus (half-odd-integer degree on the pillowcase). M1 does not state or derive one.

## 4. Blind check

A fresh sub-agent was given eleven steps and the quoted Atiyah–Bott criterion, with no file access and no word of the wanted outcome. It confirmed D2–D4, D6, D7, D9's product statement and D10 by its own hand computation. Its corrections, all adopted above:
- D5: "all four equal" holds for the natural lift; the lift-independent statement is "product +1, never one odd corner".
- D8: the classification needs "holomorphic, or with an invariant connection"; the conclusion survives.
- "Corner sign" needed a definition for Spin^c structures (now in §1).
- "Period three" is a statement about the patterns, not about M₀, which has infinite order.

## 5. What it touches

- **Corollary 7.4**: its first sentence ("product −1 … for odd determinant class", tagged [R]) is not supported by its citation and, on this computation, does not hold for the structure M1 constructs.
- **Decision Log P28 and Corollary 7.5** (the odd corner is a cycled corner; the time circle is three steps): these start from a pattern with one odd corner.
- **A fact that may matter for that, stated without proposal (D10, CHECKED):** with no odd twist there are still patterns that the drive cycles with period three, namely the three two-and-two patterns, which belong to the three spin structures of the torus other than the one the drive leaves alone.
- M2 uses the corner lift (`M2_WP4`, `L5_tau_corners`); not examined here.

## 6. Failure tests

- This computation is wrong if the fold of M1 does not act on the torus alone (for instance if it also acts on ℂP² × S²), or if M1's spinor bundle on the fibre is not the restriction of a Spin^c structure of the product with determinant line trivial along the torus.
- It is beside the point if "the lift of ι to the spinor bundle" in Cor 7.4 means something other than the action on the fibres at the fixed points.

## 7. For the PI

Which is meant: (a) the structure M1 constructs, in which case the corner signs have product +1 and Cor 7.4, P28 and Cor 7.5 need to be re-read; or (b) a structure with an odd twist on the torus, in which case M1 has to say where that twist comes from.

## 8. Where the −1 came from: the corpus (read 10 November 2026, at the PI's direction)

**Read:** Paper XIX in full (ll.1–1241); Paper XXII ll.540–600 (the lemma and its proof); Paper XV ll.395–432; Paper XVI ll.1040–1050, 1108–1118; Paper 1 (CKM v0) ll.1070–1100; Paper I Appendix A ll.205–258 and the headings and citations of Appendix B; the old ledger v22 ll.80, 158. Searched, not read in full: every file of `sources/` for the corner-sign formula and for Atiyah–Bott.

1. **The corpus derives the −1 from a line bundle of degree three on the torus itself.** Paper XV l.413: "Let L → T²/ℤ₂ be a complex line bundle with first Chern class c₁(L) = 3h, where h is the positive generator of H²(T², ℤ). (The integer 3 is anchored by the hypercharge quantisation identified in Paper XVI §5 and Paper XXII §6.3; it enters here as an external datum.)" Paper XXII's lemma (ll.556–595) takes the curvature F = 2πi·3·dx∧dy on the torus, the symmetric gauge, and the lattice transition functions, and obtains the phase exp(iπ·3·mn) = (−1)^{mn} at the corner (m/2, n/2), product (−1)³ = −1. The old ledger records it so: "(degree-3 case)" (l.80) and "with c₁(L) = 3 as a stated datum" (l.158).
2. **That computation and the one in §2 above agree.** A line of degree d on the torus gives the corner signs (−1)^{d·mn}: D6 is the case d = 1, D7 the general case, and d = 3 is odd. So the corpus's −1 is right **for its datum**: three units of the Spin^c line's flux through the covering torus.
3. **What M1 changed.** M1 does not carry that datum. It takes L = K⁻¹ = 𝒪(3) with h the hyperplane class of ℂP² and says "the pillowcase is flat, so neither obstructs" (l.433); its criterion (1) excludes a further twisting line. It then asserts the corner signs from "the odd determinant class" and cites Atiyah–Bott for "(−1)^d". The phrase comes from the corpus's closing remark ("consistent with the Atiyah–Bott fixed-point index theorem for an involution on a degree-3 line bundle over a torus", Paper XXII l.565), where d is the degree **on the torus**. In M1 the three sits on ℂP² and nothing puts it on the torus. **The departure is M1's**: it kept the conclusion and dropped the datum the conclusion rests on.
4. **Paper I.** It contains no statement of the corner pattern and cites nothing for it; it does not cite Atiyah–Bott at all. What it has (Appendix A ll.219–236; Appendix B l.319) is the half-angle lift: the fold lifts to spinors as e^{iπ/2}, J² = −1, from the spin double cover, the same at every corner.
5. **Paper XIX.** It does not derive the corner signs. It shows the corpus's standing picture: the Spin^c structure is "defined by the line bundle L with c₁(L) = 3h, h ∈ H²(ℂP², ℤ) the hyperplane class" (l.357), and the same 𝒪(3) is the twist of "the Spin^c spinor bundle over the pillowcase fibre T²/ℤ₂ (twist L = 𝒪(3) per Paper XVI §3.2)" (l.689; also ll.375, 1104). So the corpus uses the one integer three in both places. Its 3 + 1 structure of the corners is P₁ against {P₂, P₃, P₄}, "P₁ fixed under the Sol monodromy and {P₂, P₃, P₄} permuted cyclically" (l.1102; ll.451, 462).
6. **One point the corpus leaves loose.** Paper XV has the spinors twisted by L^{1/2} with L of degree three on the torus, and computes the phase of L. The one-odd-corner pattern needs the line whose lift multiplies the spinor lift to have odd degree on the torus (D8). Which line that is, L or its square root, is not stated uniformly.

**What M1 needs, on this reading.** Corollary 7.4 is true with the corpus's datum and unsupported without it. M1 has to state that the Spin^c line carries an odd number (three) of units through the fibre torus, as a derived step if the axioms give it, or as a declared reading with its failure test. Its present justification ("odd determinant class", Atiyah–Bott) should go. P28 and Corollary 7.5 then stand on that datum.
