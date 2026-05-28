import Mathlib.Data.Real.Basic
import Mathlib.Tactic

noncomputable section

/--
PAPER XXII: The Almost-Quaternionic Mock Modular Correspondence
Proposition 5 (Second Rigidity Witness)
Statement: The squared eigenvalue of the Spin Dirac operator on (T^2, tau = i*tau_2)
with determinant line bundle L = O(3) attains a minimum of pi^2 at m=0, n=1,
and is strictly greater than pi^2 for all non-zero winding numbers m.
-/
def lambda_sq (m n : ℤ) (tau_2 : ℝ) : ℝ :=
  (4 * Real.pi^2 / tau_2^2) * (m : ℝ)^2 + 4 * Real.pi^2 * ((n : ℝ) - 3/2)^2

/-- Step 1: Prove the minimum is exactly pi^2 at m = 0, n = 1. -/
theorem prop5_minimum_attained (tau_2 : ℝ) :
  lambda_sq 0 1 tau_2 = Real.pi^2 := by
  unfold lambda_sq
  norm_num
  ring

/-- Helper Lemma: The discrete n-mode distance is bounded below by 1/4. -/
lemma n_mode_bound (n : ℤ) : ((n : ℝ) - 3/2)^2 ≥ 1/4 := by
  -- 'omega' is a powerful tactic that solves integer logic (n <= 1 or n >= 2)
  have h : n ≤ 1 ∨ 2 ≤ n := by omega
  rcases h with h_le | h_ge
  · have hn : (n : ℝ) ≤ 1 := by exact_mod_cast h_le
    have hd : (n : ℝ) - 3/2 ≤ -1/2 := by linarith
    nlinarith
  · have hn : (n : ℝ) ≥ 2 := by exact_mod_cast h_ge
    have hd : (n : ℝ) - 3/2 ≥ 1/2 := by linarith
    nlinarith

/-- Step 2: For any non-zero winding number m, the eigenvalue is strictly > pi^2 -/
theorem prop5_strict_inequality (m n : ℤ) (tau_2 : ℝ) (hm : m ≠ 0) (htau : tau_2 > 0) :
  lambda_sq m n tau_2 > Real.pi^2 := by
  unfold lambda_sq
  -- Bound the n term using our helper lemma
  have hn1 : ((n : ℝ) - 3/2)^2 ≥ 1/4 := n_mode_bound n
  have hpi : Real.pi^2 > 0 := by positivity
  have hn2 : 4 * Real.pi^2 * ((n : ℝ) - 3/2)^2 ≥ Real.pi^2 := by nlinarith
  -- Bound the m term (positivity tactic automatically handles squares and fractions)
  have hm_cast : (m : ℝ) ≠ 0 := by exact_mod_cast hm
  have hm2 : (4 * Real.pi^2 / tau_2^2) * (m : ℝ)^2 > 0 := by positivity
  -- Combine the bounds to prove the strict inequality
  linarith
