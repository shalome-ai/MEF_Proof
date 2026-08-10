/-
Certificate 8, Part C — EXTENSION (wave 5 build; per amendment A1).
(C1) universal relative alternation; (C2) the explicit sign
character of Γ₀(2), with χ(γ₁,₂) = −1. Compiled against
Lean 4.15.0 / Mathlib v4.15.0.
-/
import Mathlib.Algebra.Ring.Parity
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

noncomputable section
namespace TransitParityExt

open Complex Real

def K2c2 (nubar : ℂ) (n : ℕ) : ℂ :=
  nubar * Complex.exp (Real.pi * I * ((n : ℂ) - 1))

theorem exp_eval' (n : ℕ) (h : 1 ≤ n) :
    Complex.exp (Real.pi * I * ((n : ℂ) - 1)) = -((-1) ^ n) := by
  obtain ⟨m, rfl⟩ := Nat.exists_eq_add_of_le h
  have h1 : ((1 + m : ℕ) : ℂ) - 1 = (m : ℂ) := by push_cast; ring
  rw [h1, show Real.pi * I * (m : ℂ) = (m : ℂ) * (Real.pi * I) by ring,
     Complex.exp_nat_mul, Complex.exp_pi_mul_I]
  rw [pow_add, pow_one]
  ring

/-- **(C1) Universal relative alternation.** -/
theorem relative_alternation (nubar : ℂ) (h0 : nubar ≠ 0)
    (n : ℕ) (hn : 1 ≤ n) :
    K2c2 nubar n / K2c2 nubar 1 = (-1) ^ (n - 1) := by
  have hK1 : K2c2 nubar 1 = nubar := by
    simp [K2c2]
  have hpow : -((-1 : ℂ) ^ n) = (-1) ^ (n - 1) := by
    conv_lhs => rw [show n = (n - 1) + 1 from (Nat.succ_pred_eq_of_pos hn).symm]
    rw [pow_succ]; ring
  rw [hK1, K2c2, exp_eval' n hn, mul_comm, mul_div_assoc, div_self h0,
      mul_one, hpow]

/-- An element of Γ₀(2): integer matrix, determinant one, even
lower-left entry (recorded as 2·c₂). -/
structure Gamma02 where
  a : ℤ
  b : ℤ
  c2 : ℤ
  d : ℤ
  hdet : a * d - b * (2 * c2) = 1

def gmul (x y : Gamma02) : Gamma02 where
  a := x.a * y.a + x.b * (2 * y.c2)
  b := x.a * y.b + x.b * y.d
  c2 := x.c2 * y.a + x.d * y.c2
  d := (2 * x.c2) * y.b + x.d * y.d
  hdet := by
    have hx := x.hdet
    have hy := y.hdet
    have key : (x.a * y.a + x.b * (2 * y.c2)) * ((2 * x.c2) * y.b + x.d * y.d)
        - (x.a * y.b + x.b * y.d) * (2 * (x.c2 * y.a + x.d * y.c2))
        = (x.a * x.d - x.b * (2 * x.c2)) * (y.a * y.d - y.b * (2 * y.c2)) := by
      ring
    rw [key, hx, hy]; norm_num

/-- Diagonal entries of Γ₀(2) elements are odd. -/
theorem odd_ad (x : Gamma02) : Odd x.a ∧ Odd x.d := by
  have hC : x.b * (2 * x.c2) = 2 * (x.b * x.c2) := by ring
  have h : x.a * x.d = 2 * (x.b * x.c2) + 1 := by
    have hd := x.hdet; linarith
  have hmod : (x.a * x.d) % 2 = 1 := by omega
  exact Int.odd_mul.mp (Int.odd_iff.mpr hmod)

theorem odd_a (x : Gamma02) : Odd x.a := (odd_ad x).1

theorem odd_d (x : Gamma02) : Odd x.d := (odd_ad x).2

/-- The sign character χ(γ) = (−1)^{c/2}, encoded by parity of c₂. -/
def chi (g : Gamma02) : ℤ := if Even g.c2 then 1 else -1

/-- Parity additivity of the half-entry under multiplication. -/
theorem c2_parity (x y : Gamma02) :
    ((gmul x y).c2) % 2 = (x.c2 + y.c2) % 2 := by
  have hay : y.a % 2 = 1 := Int.odd_iff.mp (odd_a y)
  have hdx : x.d % 2 = 1 := Int.odd_iff.mp (odd_d x)
  have h1 : (x.c2 * y.a) % 2 = x.c2 % 2 := by
    rw [Int.mul_emod, hay, mul_one, Int.emod_emod_of_dvd _ dvd_rfl]
  have h2 : (x.d * y.c2) % 2 = y.c2 % 2 := by
    rw [Int.mul_emod, hdx, one_mul, Int.emod_emod_of_dvd _ dvd_rfl]
  show (x.c2 * y.a + x.d * y.c2) % 2 = (x.c2 + y.c2) % 2
  omega

/-- **(C2) The sign character is multiplicative.** -/
theorem chi_mul (x y : Gamma02) :
    chi (gmul x y) = chi x * chi y := by
  have hev : Even ((gmul x y).c2) ↔ Even (x.c2 + y.c2) := by
    rw [Int.even_iff, Int.even_iff, c2_parity]
  rcases Int.even_or_odd x.c2 with hx | hx <;>
    rcases Int.even_or_odd y.c2 with hy | hy
  · have : Even ((gmul x y).c2) := hev.mpr (hx.add hy)
    simp [chi, this, hx, hy]
  · have hodd : ¬ Even ((gmul x y).c2) := by
      rw [hev, Int.even_add]
      simp [Int.not_even_iff_odd.mpr hy, hx]
    simp [chi, hodd, hx, Int.not_even_iff_odd.mpr hy]
  · have hodd : ¬ Even ((gmul x y).c2) := by
      rw [hev, Int.even_add]
      simp [Int.not_even_iff_odd.mpr hx, hy]
    simp [chi, hodd, hy, Int.not_even_iff_odd.mpr hx]
  · have : Even ((gmul x y).c2) := by
      rw [hev, Int.even_add]
      simp [Int.not_even_iff_odd.mpr hx, Int.not_even_iff_odd.mpr hy]
    simp [chi, this, Int.not_even_iff_odd.mpr hx, Int.not_even_iff_odd.mpr hy]

def gamma12 : Gamma02 where
  a := 1
  b := -1
  c2 := 1
  d := -1
  hdet := by norm_num

/-- χ(γ₁,₂) = −1. -/
theorem chi_gamma12 : chi gamma12 = -1 := by
  have : ¬ Even (gamma12.c2) := by
    exact Int.not_even_iff_odd.mpr ⟨0, by norm_num [gamma12]⟩
  simp [chi, this]

end TransitParityExt
