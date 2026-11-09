# Corpus Errors and Inconsistencies — findings from the Mx build (delta to `Corpus_Errors_and_Inconsistencies_Register_v2.md`)

*Entries found while building M2, 8 Nov 2026. Numbering continues the PI's register (its last entry is 11). Entry 15 was withdrawn on the day (see note). PI banks.*

## 13. M1 v2 — refinement of the identification of A2's involution (found 8 Nov 2026, M2 build)

**What.** M1 identifies A2(iii)'s involution ι with the fold z ↦ −z of the fibre torus and conjugation on the algebra (M1 §2.2 text after Def 2.2; Prop 5.6; Thm 5.7). The fold is rotation by π: it is central (commutes with M₀), orientation-preserving, and does not exchange the stable and unstable directions of the drive — so it cannot send κ to −κ on the Sol block. The operation that does is the flow reversal τ: (x, s) ↦ (Sx, −s) with S the quarter-turn, SM₀S⁻¹ = M₀⁻¹ (M1's own `L1_conj_M0_inv`), and **τ² = fold** (`M2_L4_handedness.lean`: `L4_S_sq_fold`, `L4_swap_lines`, `L4_involution_det`).

**Status of M1's statement.** Correct on the pillowcase T²/{±1}, where τ² is trivial and τ is an involution; a refinement on the covering torus, where τ has order four and M1's "ι" is its square. Not an error in any M1 result (no M1 theorem uses more than the fold's action on the pillowcase and the corner lift), but the sentence "the involution ι is the fold" should read "the involution ι is the flow reversal τ, whose square is the fold".

**Consequences noted.** τ fixes exactly the corners P₁ and P₄ on the pillowcase (solutions of Sx ≡ ±x), i.e. the drive-fixed corner and the corner carrying the −1 lift — consistent with M1 Cor 7.4 and App. B without further input. Consistent with the corpus's quarter-turn Spin^c holonomy e^{iπ/2} on the ω-cycle (fossil site Paper I App A → Paper 1 `lem:quarterlift`).

**Proposed action.** One-sentence erratum in M1 v3 (§2.2 and Prop 5.6 remark); M2 states the refinement in its §2 (handedness subsection) and tags it [D]. PI to adjudicate.

## 14. `mef_macros.tex` line 20 — forbidden ω name in a comment (found 8 Nov 2026)

`\newcommand{\consciousness}{\omega} % consciousness coherence field`. Comment carries a forbidden form (ω doc §6a). The macro is unused in M1/M2. Proposed: delete macro and comment at next macros revision.


## 15. (withdrawn) Master Equation display
Withdrawn 8 Nov 2026: it rested on the architect's error of treating the 4D radion of the warp as Φ_QC; the Master Equation is twelve-dimensional and Φ_QC is a dilaton on M₁₂. No ledger action.


---

## 16. Direction of the warp exponent — Paper 2 (θ_ω) vs Paper I Addendum (θ_ψ) (found 8 Nov 2026)

**What.** Paper 2 §4 states k_ωL_ω = Nπ with the profile along θ_ω ("the warped direction θ_ω", l.339, no reason given) and builds on it: L_ω = ζ/k_ω = 12π (§6.2), L_ψ = L_ω/τ₂, Planck closure §6.4; ledger banks L_ω = 12π. The Addendum §3 (fossil, superseded by Paper 2 per ledger l.1008) derives kL_ψ = Nπ with A = −k|θ_ψ|, anchored to the wall structure: Q-wall {θ_ψ = 0}, AQ-wall {θ_ψ = L_ψ/2} (Addendum §2.2; photon paper Thm 19.1, ledger l.739). Neither paper derives the direction; the Addendum's is tied to where the sectors sit, Paper 2's is asserted.

**Resolution (PI ruling Q15).** The exponent is direction-blind (κ₂² = 2/L per direction makes kL = Nπ either way) and τ-symmetric: M2's sheet exchange τ swaps P₂ ↔ P₃ (the ψ- and ω-half-periods), so a θ_ψ profile for ψ is a θ_ω profile for ψ̄. The two papers describe the two sheets; the labelling is the j/k convention of M1 App. B. The aspect ratio τ₂ is where the choice is physical. **Action:** Paper 2 and the ledger's "L_ω = 12π" to carry the reading "half-period transverse to the ψ-wall, in the sheet called ψ"; Planck closure's τ₂ factors to be re-read under that convention when the sequestering paper of the series is built. No numerical change to ζ.


## 17. Paper 6 (τ₂) l.84 — forbidden ω name (found 8 Nov 2026)
"ω is the consciousness coherence field" — forbidden form per ω doc §6a; replace with "the Coherent Information Field". Also: Paper 6's R-τ8 (Λ₁₂ = 0 axiom) is superseded in the Mx series by M2-6 (Λ₁₂ by solvability), to be tested in M7.

## 18. Wall picture vs τ (found 8 Nov 2026)
The corpus's "disjoint support" (ψ on the Q-wall {θ_ψ = 0}, ψ̄ on the AQ-wall {θ_ψ = L_ψ/2}) is the fold's geometry; M2's sheet exchange τ maps the Q-wall through P₁ to the wall {θ_ω = 0} through P₁ (τ swaps P₂ ↔ P₃). M2 states the two sheets as τ-images (Q15); the "disjoint support" sentence must be re-expressed in τ's terms wherever it is consumed (Paper 6, the Addendum's zero-mode sections, F-58's proof), or the two pictures will read as contradicting.
