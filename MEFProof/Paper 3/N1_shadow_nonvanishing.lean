import Mathlib.Data.Real.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

set_option linter.unusedVariables false

/-!
# N1 — Non-vanishing witness for the Shadow–Torsion Correspondence

Paper 3 (JGP), Theorem 3.2 (Shadow–torsion correspondence), clause (iv).

The canonical proof argues by contradiction: if the shadow extraction
commuted with the Swann pullback, Leray injectivity would force
ξ_{1/2}[T_{U(1)}] = 0. The contradiction is supplied by the
non-vanishing of the shadow
    g(τ) = Σ_{n ≥ 1} (−1)^n · n · q^{n²/4},
whose coefficient at the exponent 1/4 is −1 ≠ 0.

This file certifies the finite core of that witness:
* the exponent map n ↦ n²/4 is injective on n ≥ 1 (no cancellation
  between distinct modes is possible — each exponent is hit once);
* the exponent 1/4 is attained by n = 1 and by no other n ≥ 1;
* the contribution of n = 1 is (−1)^1 · 1 = −1, which is non-zero.

The identification of g as the shadow of the equivariant elliptic
genus is the content of Theorem 3.2 itself and of the surrounding
analytic setup; it is an input here, not a claim of this file.
-/

/-- The exponent of the k-th mode of the shadow: e(n) = n²/4, over ℚ. -/
def n1_exponent (n : ℕ) : ℚ := (n : ℚ)^2 / 4

/-- The signed coefficient of the n-th mode: c(n) = (−1)^n · n, over ℤ. -/
def n1_coeff (n : ℕ) : ℤ := (-1 : ℤ)^n * n

/-- Distinct modes carry distinct exponents: the exponent map is
    injective on n ≥ 1, so no cancellation between different modes can
    occur at any single power of q. -/
theorem n1_exponents_injective {m n : ℕ} (hm : 1 ≤ m) (hn : 1 ≤ n)
    (h : n1_exponent m = n1_exponent n) : m = n := by
  unfold n1_exponent at h
  have hsq : (m : ℚ)^2 = (n : ℚ)^2 := by
    field_simp at h
    exact_mod_cast h
  have hsq' : m^2 = n^2 := by exact_mod_cast hsq
  exact Nat.pow_left_injective (by norm_num) hsq'

/-- The exponent 1/4 is attained exactly once: for n ≥ 1,
    e(n) = 1/4 if and only if n = 1. -/
theorem n1_unique_contributor (n : ℕ) (hn : 1 ≤ n) :
    n1_exponent n = 1/4 ↔ n = 1 := by
  constructor
  · intro h
    unfold n1_exponent at h
    have hsq : (n : ℚ)^2 = 1 := by field_simp at h; exact_mod_cast h
    have hsq' : n^2 = 1 := by exact_mod_cast hsq
    nlinarith [hsq']
  · intro h; subst h; unfold n1_exponent; norm_num

/-- The leading coefficient of the shadow — the contribution of the
    unique mode at exponent 1/4 — is exactly −1. -/
theorem n1_leading_coeff : n1_coeff 1 = -1 := by
  unfold n1_coeff; norm_num

/-- The witness: the leading coefficient is non-zero. This is the
    fact consumed by step (iv) of the proof of Theorem 3.2. -/
theorem n1_witness_nonzero : n1_coeff 1 ≠ 0 := by
  rw [n1_leading_coeff]; norm_num

/-- Assembled statement: there is exactly one mode with exponent 1/4
    among n ≥ 1, and its coefficient is −1 ≠ 0. Hence the q^{1/4}
    Fourier coefficient of g equals −1: the shadow is non-zero. -/
theorem n1_shadow_nonvanishing :
    (∀ n : ℕ, 1 ≤ n → (n1_exponent n = 1/4 ↔ n = 1)) ∧
    n1_coeff 1 = -1 ∧ n1_coeff 1 ≠ 0 :=
  ⟨n1_unique_contributor, n1_leading_coeff, n1_witness_nonzero⟩
