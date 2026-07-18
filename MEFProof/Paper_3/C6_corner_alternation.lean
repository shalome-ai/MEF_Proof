/-
  C6_corner_alternation.lean — Paper XXII / Paper 3, consolidation node C6.
  Arithmetic core of "Corner Separation, and the Sign of a Full Period".
  Blocks: half-period lattice bounds (corner separation); quaternion unit
  squares and convention-freeness; the (−1)ⁿ alternation.
  Build: Lean 4 + Mathlib, no `sorry`.
-/
import Mathlib

namespace C6

/- A half-period cannot be lattice-translated below half a period:
   `(1/2 + m)² ≥ 1/4` for every integer `m`. -/
theorem half_period_bound (m : ℤ) : ((1 : ℝ) / 2 + m) ^ 2 ≥ 1 / 4 := by
  have h : 0 ≤ m ∨ m < 0 := by omega
  rcases h with h | h
  · have hm : (0 : ℝ) ≤ m := by exact_mod_cast h
    nlinarith [hm]
  · have hm : (m : ℝ) ≤ -1 := by
      have h_le : m ≤ -1 := by omega
      exact_mod_cast h_le
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
  ext <;> simp [qI] <;> rfl

theorem qJ_sq : qJ * qJ = -1 := by
  ext <;> simp [qJ] <;> rfl

theorem qK_sq : qK * qK = -1 := by
  ext <;> simp [qK] <;> rfl

/- The sign convention is immaterial: (-u)² = u². -/
theorem neg_sq (u : Quaternion ℝ) : (-u) * (-u) = u * u := by simp

/- General pure-imaginary unit square (mirrors the C5 certificate;
restated so this file is standalone). -/
theorem pure_unit_sq (p : Quaternion ℝ) (hp : p.re = 0)
    (hn : p.imI ^ 2 + p.imJ ^ 2 + p.imK ^ 2 = 1) : p * p = -1 := by
  -- Swap -1 for an explicit structure so the imaginary parts are exactly `0` (not `-0`)
  have h_neg_one : (-1 : Quaternion ℝ) = ⟨-1, 0, 0, 0⟩ := by ext <;> simp <;> rfl
  rw [h_neg_one]
  ext
  · simp [hp]
    nlinarith [hn]
  · simp [hp]
    ring
  · simp [hp]
    ring
  · simp [hp]
    ring

/-- Even winding: (−1)ⁿ = 1. -/
theorem alternation_even {n : ℕ} (h : Even n) : ((-1 : ℤ)) ^ n = 1 :=
  h.neg_one_pow

/-- Odd winding: (−1)ⁿ = −1. -/
theorem alternation_odd {n : ℕ} (h : Odd n) : ((-1 : ℤ)) ^ n = -1 :=
  h.neg_one_pow

end C6
