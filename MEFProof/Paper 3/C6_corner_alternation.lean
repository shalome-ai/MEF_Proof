/-
  C6_corner_alternation.lean — Paper XXII / Paper 3, consolidation node C6.
  Arithmetic core of "Corner Separation, and the Sign of a Full Period".
  Blocks: half-period lattice bounds (corner separation); quaternion unit
  squares and convention-freeness; the (−1)ⁿ alternation.
  Build: Lean 4 + Mathlib, no `sorry`.
-/
import Mathlib

namespace C6

/-- A half-period cannot be lattice-translated below half a period:
`(1/2 + m)² ≥ 1/4` for every integer `m`. -/
theorem half_period_bound (m : ℤ) : ((1 : ℝ) / 2 + m) ^ 2 ≥ 1 / 4 := by
  rcases le_or_lt 0 m with h | h
  · have hm : (0 : ℝ) ≤ m := by exact_mod_cast h
    nlinarith [hm]
  · have hm : (m : ℝ) ≤ -1 := by exact_mod_cast Int.lt_iff_add_one_le.mp h
    nlinarith [hm]

/-- Adjacent-corner squared distance is at least (half-period)². -/
theorem adjacent_distance_sq (m n : ℤ) :
    ((1 : ℝ) / 2 + m) ^ 2 + (n : ℝ) ^ 2 ≥ 1 / 4 := by
  have h1 := half_period_bound m
  nlinarith [sq_nonneg ((n : ℝ))]

/-- The bound is attained at m = n = 0. -/
theorem attained : ((1 : ℝ) / 2 + (0 : ℤ)) ^ 2 + ((0 : ℤ) : ℝ) ^ 2 = 1 / 4 := by
  norm_num

/-- Diagonal-corner squared distance is at least twice as large. -/
theorem diagonal_distance_sq (m n : ℤ) :
    ((1 : ℝ) / 2 + m) ^ 2 + ((1 : ℝ) / 2 + n) ^ 2 ≥ 1 / 2 := by
  have h1 := half_period_bound m
  have h2 := half_period_bound n
  linarith

/-- The imaginary units. -/
def qI : Quaternion ℝ := ⟨0, 1, 0, 0⟩
def qJ : Quaternion ℝ := ⟨0, 0, 1, 0⟩
def qK : Quaternion ℝ := ⟨0, 0, 0, 1⟩

theorem qI_sq : qI * qI = -1 := by
  rw [Quaternion.ext_iff]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> simp [qI, Quaternion.mul_re,
    Quaternion.mul_imI, Quaternion.mul_imJ, Quaternion.mul_imK]

theorem qJ_sq : qJ * qJ = -1 := by
  rw [Quaternion.ext_iff]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> simp [qJ, Quaternion.mul_re,
    Quaternion.mul_imI, Quaternion.mul_imJ, Quaternion.mul_imK]

theorem qK_sq : qK * qK = -1 := by
  rw [Quaternion.ext_iff]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> simp [qK, Quaternion.mul_re,
    Quaternion.mul_imI, Quaternion.mul_imJ, Quaternion.mul_imK]

/-- The sign convention is immaterial: (−u)² = u². -/
theorem neg_sq (u : Quaternion ℝ) : (-u) * (-u) = u * u := by ring

/-- General pure-imaginary unit square (mirrors the C5 certificate;
restated so this file is standalone). -/
theorem pure_unit_sq (p : Quaternion ℝ) (hp : p.re = 0)
    (hn : p.imI ^ 2 + p.imJ ^ 2 + p.imK ^ 2 = 1) : p * p = -1 := by
  rw [Quaternion.ext_iff]
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp [Quaternion.mul_re, hp]
    nlinarith [hn]
  · simp [Quaternion.mul_imI, hp]
    ring
  · simp [Quaternion.mul_imJ, hp]
    ring
  · simp [Quaternion.mul_imK, hp]
    ring

/-- Even winding: (−1)ⁿ = 1. -/
theorem alternation_even {n : ℕ} (h : Even n) : ((-1 : ℤ)) ^ n = 1 :=
  h.neg_one_pow

/-- Odd winding: (−1)ⁿ = −1. -/
theorem alternation_odd {n : ℕ} (h : Odd n) : ((-1 : ℤ)) ^ n = -1 :=
  h.neg_one_pow

end C6
