/-
  A3_chain_core.lean
  ─────────────────────────────────────────────────────────────────────────
  Machine-checked algebraic core of the A3/Hodge reduction chain, Nodes
  B / C-b′ / C′, plus the N0 χ_y identities folded in for completeness.
  Status: CERT-pending (PI local compile outstanding).

  ── DECLARED-INPUT BOUNDARY (analytic layer, NOT formalised) ──
    (i)   Bourguignon–Gauduchon conformal eigenvalue variation (EXT);
    (ii)  unfolding chain rule on the fixed-area slice; envelope theorem
          for the Dyson–Mehta minimisation (EXT);
    (iii) Palais' principle of symmetric criticality (EXT, 1979);
    (iv)  the σ-lift conjugation phase e^{−2ik·a} on momentum states —
          this file certifies the PARITY of the exponents, which is the
          whole content of the sign ε_a;
    (v)   cross-note declared inputs with their own certificates:
          ca_projected_density_const (Ca_constant_critical.lean),
          the N2b ground-sector lemmas (GBH4_N2b_ground_sector.lean).

  ── LEAN ↔ STATEMENT CORRESPONDENCE ──
    a3_kernel_decouple        Lemma (kernel decoupling): λ = 0 kills δλ
    a3_normalisation_indep    Lemma (normalisation independence)
    a3_unshifted_parity       Lemma (ε core): 2m is even
    a3_shifted_parity         Lemma (ε core): 2n − 3 is odd — the odd-c₁
                              mechanism breaking V₄ → ℤ₂
    a3_chiY_factor            χ_y = (1 − y + y²)(1 − y)²
    a3_chiY_neg_one           χ_{y=−1} = 12 = χ(K₈)
    a3_chiY_one               χ_{y=+1} = 0 = signature
    a3_chiY_serre             y⁴ χ(1/y) = χ(y)  (palindrome)
    a3_base_signed_unsigned   Σb(B) = 6 = χ(B) (diagonal diamond instance)
    a3_assembly               6 × 2 = 12 = 3·2·2
    a3_profile_sum            1+3+4+3+1 = 12
  ── OFFLINE BUILD ── Lean 4 + mathlib; conservative tactics.
  ─────────────────────────────────────────────────────────────────────────
-/

import Mathlib

namespace Paper3.A3ChainCore
/-! ### Node B core -/

/-- Kernel decoupling: the Bourguignon–Gauduchon variation −ζ·λ·I vanishes
identically when λ = 0 — zero modes contribute nothing, for every coupling
ζ and every overlap integral I. -/
theorem a3_kernel_decouple (zeta I : ℝ) : -zeta * (0 : ℝ) * I = 0 := by
  ring

/-- Normalisation independence: for any smooth reshaping with F′ ≠ 0 the
first-variation condition F′·δ = 0 is equivalent to δ = 0 — identical
critical sets. -/
theorem a3_normalisation_indep (F' d : ℝ) (h : F' ≠ 0) :
    F' * d = 0 ↔ d = 0 := by
  constructor
  · intro hd
    rcases mul_eq_zero.mp hd with h' | h'
    · exact absurd h' h
    · exact h'
  · intro hd; rw [hd, mul_zero]

/-! ### C-b′ core — the parity of the conjugation exponents

The lifted-translation conjugation phase on the shifted momentum lattice is
e^{iπ·(exponent)}; the sign ε_a is +1 iff the exponent is even. The two
exponents are 2m (unshifted direction) and 2n − 3 (shifted direction): the
former is always even, the latter always odd — the latter BECAUSE c₁ = 3 is
odd. This is the entire arithmetic content of the breaking V₄ → ℤ₂. -/

theorem a3_unshifted_parity (m : ℤ) : ∃ k : ℤ, 2 * m = 2 * k :=
  ⟨m, rfl⟩

theorem a3_shifted_parity (n : ℤ) : ∃ k : ℤ, 2 * n - 3 = 2 * k + 1 :=
  ⟨n - 2, by ring⟩

/-! ### C′ / N0 core — χ_y identities and the assembly arithmetic -/

/-- χ_y(K₈) with the coefficients (1, −3, 4, −3, 1). -/
def chiY (y : ℝ) : ℝ := 1 - 3 * y + 4 * y ^ 2 - 3 * y ^ 3 + y ^ 4

theorem a3_chiY_factor (y : ℝ) :
    chiY y = (1 - y + y ^ 2) * (1 - y) ^ 2 := by
  unfold chiY; ring

theorem a3_chiY_neg_one : chiY (-1) = 12 := by
  unfold chiY; norm_num

theorem a3_chiY_one : chiY 1 = 0 := by
  unfold chiY; norm_num

/-- Serre-duality palindrome: y⁴ · χ(1/y) = χ(y) for y ≠ 0. -/
theorem a3_chiY_serre (y : ℝ) (hy : y ≠ 0) :
    y ^ 4 * chiY (1 / y) = chiY y := by
  unfold chiY
  field_simp
  ring

/-- Diagonal-diamond instance on the base B = ℂP² × S²: the alternating
(signed) Betti sum equals the plain (unsigned) sum equals 6, because the
odd entries are zero. -/
theorem a3_base_signed_unsigned :
    (1 - 0 + 2 - 0 + 2 - 0 + 1 : ℤ) = 1 + 0 + 2 + 0 + 2 + 0 + 1 ∧
    (1 + 0 + 2 + 0 + 2 + 0 + 1 : ℤ) = 6 := by
  constructor <;> norm_num

/-- The assembly: base multiplicity × fibre Euler characteristic = 12 =
the factor product 3·2·2. -/
theorem a3_assembly : (6 : ℤ) * 2 = 12 ∧ (3 : ℤ) * 2 * 2 = 12 := by
  constructor <;> norm_num

/-- The full K₈ Betti profile sums to 12. -/
theorem a3_profile_sum : (1 + 3 + 4 + 3 + 1 : ℤ) = 12 := by
  norm_num

end Paper3.A3ChainCore

/-! ### Axiom footprint -/

#print axioms Paper3.A3ChainCore.a3_kernel_decouple
#print axioms Paper3.A3ChainCore.a3_normalisation_indep
#print axioms Paper3.A3ChainCore.a3_base_signed_unsigned
#print axioms Paper3.A3ChainCore.a3_assembly
