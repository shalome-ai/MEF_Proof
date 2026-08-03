import Mathlib.Data.Real.Basic
import Mathlib.Tactic

noncomputable section

/--
Paper 3, Proposition 7.13 (The lowest eigenvalue is $\pi$); also Lemmas 7.11
and 7.12.
Statement: the lowest eigenvalue of the Spin^c Dirac operator on (T^2, tau = i*tau_2)
with determinant line bundle L = O(3) equals pi, independently of tau_2 > 0.
Proven below as `prop5_min_eigenvalue_is_pi` (and in squared form as `prop5_min_is_pi_sq`).
The minimum pi^2 is attained on the m=0 tower at n in {1,2}; all m != 0 states lie
strictly above it (`prop5_strict_inequality`).
The eigenvalue formula (line ~13) is the standard Spin^c torus spectrum [Friedrich 2000];
it is an input here, not a claim of this file.
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
/-- m = 0 tower: winding term vanishes, bound is the pure n-mode bound. -/
theorem prop5_m_zero_bound (n : ℤ) (tau_2 : ℝ) :
    lambda_sq 0 n tau_2 ≥ Real.pi ^ 2 := by
  have hn1 : ((n : ℝ) - 3 / 2) ^ 2 ≥ 1 / 4 := n_mode_bound n
  have hpi : (0 : ℝ) < Real.pi ^ 2 := by positivity
  have key : lambda_sq 0 n tau_2 = 4 * Real.pi ^ 2 * ((n : ℝ) - 3 / 2) ^ 2 := by
    unfold lambda_sq; push_cast; ring     -- (…/τ₂²)*0² collapses to 0
  rw [key]; nlinarith [hn1, hpi]          -- may need a mul_nonneg hint

/-- Global lower bound over all (m, n) — the real content of "π² is the minimum". -/
theorem prop5_global_lower_bound (m n : ℤ) (tau_2 : ℝ) (htau : tau_2 > 0) :
    lambda_sq m n tau_2 ≥ Real.pi ^ 2 := by
  rcases eq_or_ne m 0 with hm | hm
  · subst hm; exact prop5_m_zero_bound n tau_2
  · exact le_of_lt (prop5_strict_inequality m n tau_2 hm htau)

/-- Proposition 6.3, fully stated: π² is the least element of the squared spectrum. -/
theorem prop5_min_is_pi_sq (tau_2 : ℝ) (htau : tau_2 > 0) :
    IsLeast (Set.range fun mn : ℤ × ℤ => lambda_sq mn.1 mn.2 tau_2) (Real.pi ^ 2) := by
  refine ⟨⟨(0, 1), prop5_minimum_attained tau_2⟩, ?_⟩
  rintro x ⟨⟨m, n⟩, rfl⟩
  exact prop5_global_lower_bound m n tau_2 htau
/-- The eigenvalue itself: λ = √(λ²). -/
def lambda (m n : ℤ) (tau_2 : ℝ) : ℝ := Real.sqrt (lambda_sq m n tau_2)

/-- Proposition 6.3 exactly as stated: the lowest eigenvalue equals π for every τ₂ > 0. -/
theorem prop5_min_eigenvalue_is_pi (tau_2 : ℝ) (htau : tau_2 > 0) :
    IsLeast (Set.range fun mn : ℤ × ℤ => lambda mn.1 mn.2 tau_2) Real.pi := by
  have hlb := (prop5_min_is_pi_sq tau_2 htau).2
  constructor
  · -- π is attained at (0,1): √(λ²) = √(π²) = π
    refine ⟨(0, 1), ?_⟩
    change Real.sqrt (lambda_sq 0 1 tau_2) = Real.pi
    rw [prop5_minimum_attained tau_2, Real.sqrt_sq Real.pi_pos.le]
  · -- π is a lower bound: π² ≤ λ² ⟹ π ≤ √(λ²)
    rintro x ⟨⟨m, n⟩, rfl⟩
    change Real.pi ≤ Real.sqrt (lambda_sq m n tau_2)
    have hge : Real.pi ^ 2 ≤ lambda_sq m n tau_2 := hlb ⟨(m, n), rfl⟩
    calc Real.pi = Real.sqrt (Real.pi ^ 2) := (Real.sqrt_sq Real.pi_pos.le).symm
      _ ≤ Real.sqrt (lambda_sq m n tau_2) := Real.sqrt_le_sqrt hge

/-! ### Axiom footprint -/

#print axioms prop5_min_eigenvalue_is_pi
#print axioms prop5_min_is_pi_sq
#print axioms n_mode_bound
