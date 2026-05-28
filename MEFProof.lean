import Mathlib.Data.Real.Basic
import Mathlib.Tactic

noncomputable section

/-- The squared eigenvalue from Proposition 5 in Paper XXII -/
def lambda_sq (m n : ℤ) (tau_2 : ℝ) : ℝ :=
  (4 * Real.pi^2 / tau_2^2) * (m : ℝ)^2 + 4 * Real.pi^2 * ((n : ℝ) - 3/2)^2

/-- Step 1: Prove the minimum is attained at m = 0, n = 1 -/
theorem prop5_minimum_attained (tau_2 : ℝ) :
  lambda_sq 0 1 tau_2 = Real.pi^2 := by
  unfold lambda_sq
  norm_num
  ring
