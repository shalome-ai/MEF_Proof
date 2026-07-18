/-
  C1_c1L_anchoring.lean
  Paper XXII / Paper 3 — consolidation node C1.
  Arithmetic core of the companion note "The Determinant Line is O(3)".

  Blocks:
    A. Chern polynomial of T CP²: the expansion (1+X)^3 and its
       degree-1 and degree-2 coefficients (both 3), plus the binomial
       hand-check.
    B. Adjunction sign bookkeeping: c₁(K) = −c₁(T), c₁(L) = −c₁(K).
    C. The Spin^c congruence does not force the value 3: parity of the
       admissible classes, and the non-forcing witness (1 and 3 share a
       parity yet differ).
    D. Hypercharge phase arithmetic: ΔY = 1 and the exact relative
       boundary phase W(Y_u) = −W(Y_d).
    E. Tower uniformity: the stage-wise canonical family 2n+1 fails
       pullback compatibility; a compatible family is constant; the
       anchor c₁ = 3 forces the constant family 3; the Spin^c parity
       persists at every stage.

  The certificate covers arithmetic only. Geometric inputs (the Euler
  sequence, the canonical Kähler Spin^c structure L = K⁻¹, the
  restriction e*h = h of the hyperplane class) and the construction
  inputs of §3 of the note (base holonomy π, the quantum-1/c
  dictionary) are cited in the note, not formalised.

  Build: Lean 4 with Mathlib (`import Mathlib`). All goals should be
  accomplished with no `sorry`.
-/
import Mathlib

open Polynomial

namespace C1

/-! ### Block A — Chern polynomial of T CP² -/

/-- The total Chern polynomial of `T CP²` from the Euler sequence:
`(1+X)^3` expanded. The cubic term dies in `ℤ[h]/(h³)`; the expansion
itself is a polynomial identity and is certified as such. -/
theorem chern_poly_expand :
    ((1 + X : Polynomial ℤ)) ^ 3 = 1 + 3 * X + 3 * X ^ 2 + X ^ 3 := by
  ring

/-- `c₁(T CP²) = 3`: the degree-1 coefficient of `(1+X)^3`. -/
theorem c1_coeff : (((1 + X : Polynomial ℤ)) ^ 3).coeff 1 = 3 := by
  rw [chern_poly_expand]
  simp [coeff_add, coeff_one, coeff_X, coeff_X_pow, mul_comm]

/-- `c₂(T CP²) = 3`: the degree-2 coefficient of `(1+X)^3`. -/
theorem c2_coeff : (((1 + X : Polynomial ℤ)) ^ 3).coeff 2 = 3 := by
  rw [chern_poly_expand]
  simp [coeff_add, coeff_one, coeff_X, coeff_X_pow, mul_comm]

/-- Hand check, binomial form: the two coefficients are `C(3,1)`... -/
theorem choose_31 : Nat.choose 3 1 = 3 := by decide

/-- ... and `C(3,2)`; the latter is also `χ(CP²) = 3`, the Euler
characteristic seen through the top Chern class. -/
theorem choose_32 : Nat.choose 3 2 = 3 := by decide

/-! ### Block B — adjunction sign bookkeeping -/

/-- `c₁(T CP²) = 3` (input to the bookkeeping, from Block A). -/
def c1T : ℤ := 3

/-- The canonical bundle is the determinant of the cotangent bundle:
`c₁(K) = −c₁(T)`. -/
def c1K : ℤ := -c1T

/-- The canonical Kähler Spin^c determinant line is the anticanonical
bundle: `c₁(L) = −c₁(K)`. -/
def c1L : ℤ := -c1K

theorem c1K_eq : c1K = -3 := by norm_num [c1K, c1T]

theorem c1L_eq : c1L = 3 := by norm_num [c1L, c1K, c1T]

/-! ### Block C — the congruence does not force the value -/

/-- The Spin^c congruence admits `1` as well as `3`: the two classes
share a parity yet differ, so the congruence alone cannot select the
value three. -/
theorem congruence_not_forcing :
    (1 : ℤ) % 2 = (3 : ℤ) % 2 ∧ (1 : ℤ) ≠ 3 := by
  norm_num

/-- Every odd class satisfies the congruence: `2k+1 ≡ 3 (mod 2)` for
all integers `k`. -/
theorem all_odd_admissible (k : ℤ) : (2 * k + 1) % 2 = (3 : ℤ) % 2 := by
  omega

/-! ### Block D — hypercharge phase arithmetic -/

/-- The boundary Wilson phase of a hypercharge-`Y` sector:
`W(Y) = exp(iπY)` (base holonomy `π`, an input of the construction). -/
noncomputable def W (Y : ℝ) : ℂ :=
  Complex.exp ((Y * Real.pi : ℝ) * Complex.I)

/-- Up-type right-handed hypercharge. -/
noncomputable def Yu : ℝ := 2 / 3

/-- Down-type right-handed hypercharge. -/
noncomputable def Yd : ℝ := -(1 / 3)

/-- `ΔY = Y_u − Y_d = 1`. -/
theorem deltaY : Yu - Yd = 1 := by
  norm_num [Yu, Yd]

/-- The exact relative boundary phase: `W(Y_u) = −W(Y_d)`, i.e.
`e^{iπΔY} = −1`, depending only on `ΔY = 1`. -/
theorem relative_phase : W Yu = -W Yd := by
  have hY : Yu * Real.pi = Yd * Real.pi + Real.pi := by
    have h1 : Yu = Yd + 1 := by norm_num [Yu, Yd]
    rw [h1]; ring
  unfold W
  rw [hY, Complex.ofReal_add, add_mul, Complex.exp_add,
    Complex.exp_pi_mul_I]
  ring

/-! ### Block E — tower uniformity -/

/-- Pullback compatibility of a family of Chern integers `c : ℕ → ℤ`
indexed by the tower stage: under `e*h_{n+1} = h_n` (cited input) the
bundle condition `e* c₁(L_{n+1}) = c₁(L_n)` reads `c (n+1) = c n`. -/
def Compatible (c : ℕ → ℤ) : Prop := ∀ n, c (n + 1) = c n

/-- The stage-wise canonical family on `CP^{2n}`: `c₁(K⁻¹) = 2n + 1`. -/
def canonicalFamily (n : ℕ) : ℤ := 2 * n + 1

/-- The stage-wise canonical family fails compatibility at every stage:
`2n + 3 ≠ 2n + 1`. Stated at stage 1, the anchor stage. -/
theorem canonical_fails : ¬ Compatible canonicalFamily := by
  intro h
  have h1 := h 1
  simp only [canonicalFamily] at h1
  omega

/-- A compatible family is constant. -/
theorem compatible_const {c : ℕ → ℤ} (h : Compatible c) :
    ∀ n, c n = c 0 := by
  intro n
  induction n with
  | zero => rfl
  | succ k ih => rw [h k, ih]

/-- Anchored uniqueness: a compatible family whose stage-1 value is 3
equals 3 at every stage. -/
theorem anchored_unique {c : ℕ → ℤ} (h : Compatible c) (h1 : c 1 = 3) :
    ∀ n, c n = 3 := by
  have h0 : c 0 = 3 := by rw [← h 0]; exact h1
  intro n
  rw [compatible_const h n, h0]

/-- Spin^c parity persistence: the uniform value 3 has the same parity
as the stage-`n` canonical value `2n + 1` at every stage, so the
congruence `c₁(L) ≡ w₂ (mod 2)` holds all the way up the tower. -/
theorem uniform_admissible (n : ℕ) :
    ((2 * (n : ℤ) + 1) % 2) = (3 : ℤ) % 2 := by
  omega

/-! ### Block F — holonomy quantisation and the order-six phase structure -/

/-- Equivariance quantises the flat boundary holonomy: `z² = 1 ⟹ z = ±1`
(Lemma on the flat holonomy; the selection of `−1` by the odd
determinant class is geometric and lives in the note). -/
theorem holonomy_quantised (z : ℂ) (h : z * z = 1) : z = 1 ∨ z = -1 :=
  mul_self_eq_one_iff.mp h

/-- The centre is trivial on the full determinant: `3 · (2π/3) = 2π`. -/
theorem L_full_phase_trivial :
    (3 : ℝ) * (2 * Real.pi / 3) = 2 * Real.pi := by ring

/-- The half-determinant phase: `(3/2) · (2π/3) = π` — a sign per centre
element, because `c₁(L^{1/2}) = (3/2)h` is half of `c₁(L) = 3h`. -/
theorem Lhalf_phase :
    (3 / 2 : ℝ) * (2 * Real.pi / 3) = Real.pi := by ring

/-- The elementary composite phase `e^{iπ/3}`. -/
noncomputable def zeta6 : ℂ :=
  Complex.exp ((Real.pi / 3 : ℝ) * Complex.I)

/-- The composite phase on a Spin^c section in the conjugate fundamental:
`ζ₃⁻¹ · e^{iπ} = e^{iπ/3}`. -/
theorem composite_phase :
    Complex.exp ((-(2 * Real.pi / 3) : ℝ) * Complex.I) *
      Complex.exp ((Real.pi : ℝ) * Complex.I) = zeta6 := by
  rw [zeta6, ← Complex.exp_add]
  congr 1
  push_cast
  ring

/-- `zeta6` has order dividing six: `(e^{iπ/3})⁶ = 1`. -/
theorem zeta6_pow_six : zeta6 ^ 6 = 1 := by
  rw [zeta6, ← Complex.exp_nat_mul]
  have h : ((6 : ℕ) : ℂ) * (((Real.pi / 3 : ℝ) : ℂ) * Complex.I) =
      2 * (Real.pi : ℂ) * Complex.I := by
    push_cast
    ring
  rw [h]
  exact Complex.exp_two_pi_mul_I

/-- No smaller positive power of `zeta6` equals one: the order is exactly
six. Uses `Complex.exp_eq_one_iff`; the arithmetic reduces to `k = 6n`
with `1 ≤ k ≤ 5`, impossible. -/
theorem zeta6_pow_ne_one {k : ℕ} (h1 : 1 ≤ k) (h2 : k ≤ 5) :
    zeta6 ^ k ≠ 1 := by
  rw [zeta6, ← Complex.exp_nat_mul, Complex.exp_eq_one_iff]
  rintro ⟨n, hn⟩
  -- take imaginary parts: k·π/3 = n·2π over ℝ
  have hre : (k : ℝ) * (Real.pi / 3) = (n : ℝ) * (2 * Real.pi) := by
    have h' := congrArg Complex.im hn
    simp [Complex.mul_im, Complex.mul_re, Complex.I_im, Complex.I_re,
      Complex.ofReal_im, Complex.ofReal_re] at h'
    push_cast at h' ⊢
    linarith [h']
  have hπ : Real.pi ≠ 0 := Real.pi_ne_zero
  have hk6 : (k : ℝ) * Real.pi = (6 * (n : ℝ)) * Real.pi := by
    ring_nf at hre ⊢
    linarith [hre]
  have hkn : (k : ℝ) = 6 * (n : ℝ) := mul_right_cancel₀ hπ hk6
  have hkz : (k : ℤ) = 6 * n := by exact_mod_cast hkn
  omega

/-- The Chinese-remainder decomposition `ℤ/6 ≅ ℤ/2 × ℤ/3` — the additive
form of `μ₆ ≅ μ₂ × μ₃`. -/
noncomputable def z6_iso : ZMod 6 ≃+* ZMod 2 × ZMod 3 :=
  ZMod.chineseRemainder (by decide)

end C1
