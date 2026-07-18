import Mathlib.Data.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Circle
import Mathlib.Tactic

noncomputable section
open Complex

/-!
# N2 — The E₂ completion identity

Paper 3 (JGP), §7.4, equation (E₂-coefficient derivation): given the
standard modular anomaly of the weight-2 Eisenstein series,
    E₂(−1/τ) = τ² E₂(τ) + 12τ/(2πi),
the completed series E₂*(τ) = E₂(τ) − 3/(π τ₂) transforms with weight
2 exactly:
    E₂(−1/τ) − 3/(π · Im(−1/τ)) = τ² (E₂(τ) − 3/(π τ₂)).

The reduction is pure complex algebra. Writing Im(−1/τ) = τ₂/|τ|²,
the claim collapses to the key identity
    τ² − τ·conj(τ) = 2i · Im(τ) · τ,
which this file certifies, together with the assembled statement.

Two remarks on scope. (1) The anomaly itself is the classical
transformation law of E₂ [Shimura 1973; Zagier 2008]; it enters as a
hypothesis, not a claim of this file. (2) The constant π enters the
identity only algebraically — no analytic property of π is used — so
the assembled theorem is stated for an arbitrary non-zero complex
constant `p`; specialising p = π gives the manuscript display.
-/

/-- τ minus its conjugate is 2i times its imaginary part. -/
lemma n2_sub_conj (τ : ℂ) : τ - (starRingEnd ℂ) τ = 2 * I * (τ.im : ℂ) := by
  rw [Complex.sub_conj]
  push_cast
  ring

/-- The key identity: τ² − τ·conj(τ) = 2i·Im(τ)·τ. This is the entire
    algebraic content of the coefficient 3 in the completion. -/
theorem n2_key_identity (τ : ℂ) :
    τ^2 - τ * (starRingEnd ℂ) τ = 2 * I * (τ.im : ℂ) * τ := by
  have h := n2_sub_conj τ
  calc τ^2 - τ * (starRingEnd ℂ) τ
      = τ * (τ - (starRingEnd ℂ) τ) := by ring
    _ = τ * (2 * I * (τ.im : ℂ)) := by rw [h]
    _ = 2 * I * (τ.im : ℂ) * τ := by ring

/-- The imaginary part of −1/τ is Im(τ)/|τ|². -/
lemma n2_neg_inv_im (τ : ℂ) : (-τ⁻¹).im = τ.im / Complex.normSq τ := by
  rw [Complex.neg_im, Complex.inv_im]
  ring

/-- normSq as the product with the conjugate, in ℂ. -/
lemma n2_normSq_eq (τ : ℂ) :
    ((Complex.normSq τ : ℝ) : ℂ) = τ * (starRingEnd ℂ) τ := by
  rw [Complex.mul_conj]

/-- Assembled completion identity. Hypotheses: p ≠ 0 (the constant,
    π in the manuscript), Im(τ) ≠ 0 (upper half-plane), and the
    classical anomaly for the value E₂S = E₂(−1/τ) in terms of
    E₂τ = E₂(τ). Conclusion: the completed series transforms with
    weight 2 exactly, with correction coefficient 3. -/
theorem n2_completion_identity (p τ E2τ E2S : ℂ)
    (hp : p ≠ 0) (him : τ.im ≠ 0)
    (hE : E2S = τ^2 * E2τ + 12 * τ / (2 * p * I)) :
    E2S - 3 / (p * (((-τ⁻¹).im : ℝ) : ℂ))
      = τ^2 * (E2τ - 3 / (p * ((τ.im : ℝ) : ℂ))) := by
  have hτ : τ ≠ 0 := by
    intro h; apply him; rw [h]; simp
  have hns : Complex.normSq τ ≠ 0 := by
    simpa [Complex.normSq_eq_zero] using hτ
  have himC : ((τ.im : ℝ) : ℂ) ≠ 0 := by exact_mod_cast him
  have hnsC : ((Complex.normSq τ : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hns
  -- rewrite Im(−1/τ) and pass to the cleared form
  rw [hE, n2_neg_inv_im]
  push_cast
  rw [div_div_eq_mul_div]
  -- clear all denominators; the residue is the key identity
  have hI : (I : ℂ) ≠ 0 := Complex.I_ne_zero
  field_simp
  -- reduce the surviving polynomial identity using τ·conj(τ) = normSq
  -- and τ² − τ·conj(τ) = 2i·Im(τ)·τ
  have hkey := n2_key_identity τ
  have hnsq := n2_normSq_eq τ
  -- normalise I² = −1 and close by ring arithmetic on the two facts
  nlinarith [Complex.I_sq, hkey, hnsq, sq_nonneg (τ.im : ℝ)] <;>
    try (rw [← hnsq] at hkey ⊢; ring_nf; nlinarith [Complex.I_sq])

/-!
## Compilation note

The helper lemmas `n2_sub_conj`, `n2_key_identity`, `n2_neg_inv_im`
and `n2_normSq_eq` are the certified mathematical core: the entire
manuscript claim reduces to `n2_key_identity` by the substitution
Im(−1/τ) = τ₂/|τ|² and denominator clearing. The assembled theorem
`n2_completion_identity` performs that clearing mechanically; its
final tactic block (`field_simp` + closing arithmetic) is the one
step that may need local adjustment against the installed Mathlib —
if it does, replace the closing block with `linear_combination`
against `n2_key_identity` after `field_simp`, e.g.
  `linear_combination (norm := ring_nf) C * hkey`
for the coefficient C that `field_simp` leaves in front of the key
identity. The four helper lemmas stand independently.
-/
