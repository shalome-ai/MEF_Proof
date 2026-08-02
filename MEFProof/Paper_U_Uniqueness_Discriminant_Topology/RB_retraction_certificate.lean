/-
  RB_retraction_certificate.lean — Lean 4 (Mathlib)
  Work package RB: the adiabatic truncation and the retraction lemma.

  WHAT THIS CERTIFICATE PROVES (rational/decidable layer only):
  (1) A discrete heat step on the 4-cycle (the minimal closed-base
      surrogate) with rational eigendata: the step fixes constants,
      preserves the mean, and satisfies the EXACT energy-drop
      identity
        E(u) − E(Su) = (3/4)(u₀−u₂)² + (3/4)(u₁−u₃)² + (u₀−u₁+u₂−u₃)²,
      whence monotone decay of the base Dirichlet energy — the
      rational core of Lemma rb:heat — with the explicit mode
      contraction factors (1, 1/2, 1/2, 0).
  (2) Fibrewise σ-evenness is preserved by any base-averaging kernel
      (the formal core of the evenness clause of rb:heat) and by
      fibrewise-constant shifts (the evenness clause of rb:jensen).
  (3) The transversality dimension arithmetic of Proposition rb:stab
      route (ii): a 2-sphere generically misses a codimension-three
      locus (2 − 3 < 0); its 3-dimensional homotopy trace generically
      meets it in isolated points (3 − 3 = 0). The mechanism and the
      obstruction are the same count.

  WHAT THIS CERTIFICATE DOES NOT PROVE:
  the continuum heat semigroup statements (convergence at rate
  λ₁(B)); the Jensen inequality for the exponential (convexity of
  exp is outside rational scope); the measure-comparability constant
  of rb:quasi; the colimit identity; Proposition rb:stab itself.
-/
import Mathlib

namespace RB

/- ------------------------------------------------------------------
   §1  The discrete heat step on the 4-cycle: exact rational layer
   ------------------------------------------------------------------ -/

/-- One explicit Euler step of the graph heat flow on the 4-cycle,
    step size 1/4: w_i = u_i/2 + (u_{i+1} + u_{i-1})/4. -/
def step0 (u0 u1 u2 u3 : ℚ) : ℚ := u0 / 2 + (u1 + u3) / 4
def step1 (u0 u1 u2 u3 : ℚ) : ℚ := u1 / 2 + (u2 + u0) / 4
def step2 (u0 u1 u2 u3 : ℚ) : ℚ := u2 / 2 + (u3 + u1) / 4
def step3 (u0 u1 u2 u3 : ℚ) : ℚ := u3 / 2 + (u0 + u2) / 4

/-- The base Dirichlet energy on the 4-cycle. -/
def dirichlet (u0 u1 u2 u3 : ℚ) : ℚ :=
  (u1 - u0) ^ 2 + (u2 - u1) ^ 2 + (u3 - u2) ^ 2 + (u0 - u3) ^ 2

/-- The step fixes constants (base-constant profiles are flow fixed
    points). -/
theorem step_fixes_constants (c : ℚ) :
    step0 c c c c = c ∧ step1 c c c c = c
      ∧ step2 c c c c = c ∧ step3 c c c c = c := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> · simp only [step0, step1, step2, step3]; ring

/-- The step preserves the mean (mass conservation of the flow). -/
theorem step_preserves_mean (u0 u1 u2 u3 : ℚ) :
    step0 u0 u1 u2 u3 + step1 u0 u1 u2 u3
      + step2 u0 u1 u2 u3 + step3 u0 u1 u2 u3
      = u0 + u1 + u2 + u3 := by
  simp only [step0, step1, step2, step3]; ring

/-- **The exact energy-drop identity.** The decrease of the Dirichlet
    energy in one step is the displayed sum of squares — an identity,
    not an estimate. -/
theorem energy_drop_identity (u0 u1 u2 u3 : ℚ) :
    dirichlet u0 u1 u2 u3
      - dirichlet (step0 u0 u1 u2 u3) (step1 u0 u1 u2 u3)
          (step2 u0 u1 u2 u3) (step3 u0 u1 u2 u3)
      = (3 / 4) * (u0 - u2) ^ 2 + (3 / 4) * (u1 - u3) ^ 2
          + (u0 - u1 + u2 - u3) ^ 2 := by
  unfold dirichlet step0 step1 step2 step3; ring

/-- Monotone decay: one heat step never increases the base Dirichlet
    energy (the rational core of Lemma rb:heat). -/
theorem energy_monotone (u0 u1 u2 u3 : ℚ) :
    dirichlet (step0 u0 u1 u2 u3) (step1 u0 u1 u2 u3)
        (step2 u0 u1 u2 u3) (step3 u0 u1 u2 u3)
      ≤ dirichlet u0 u1 u2 u3 := by
  have h := energy_drop_identity u0 u1 u2 u3
  nlinarith [sq_nonneg (u0 - u2), sq_nonneg (u1 - u3),
             sq_nonneg (u0 - u1 + u2 - u3)]

/- Mode contraction factors: the step acts on the mean mode by 1, on
   the two slow oscillation modes by 1/2, and annihilates the
   alternating mode — the rational eigendata (1, 1/2, 1/2, 0). -/

theorem mode_mean :
    step0 1 1 1 1 = 1 ∧ step1 1 1 1 1 = 1
      ∧ step2 1 1 1 1 = 1 ∧ step3 1 1 1 1 = 1 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> · simp only [step0, step1, step2, step3]; norm_num

theorem mode_slow_a :
    step0 1 0 (-1) 0 = 1 / 2 ∧ step1 1 0 (-1) 0 = 0
      ∧ step2 1 0 (-1) 0 = -(1 / 2) ∧ step3 1 0 (-1) 0 = 0 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> · simp only [step0, step1, step2, step3]; norm_num

theorem mode_slow_b :
    step0 0 1 0 (-1) = 0 ∧ step1 0 1 0 (-1) = 1 / 2
      ∧ step2 0 1 0 (-1) = 0 ∧ step3 0 1 0 (-1) = -(1 / 2) := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> · simp only [step0, step1, step2, step3]; norm_num

theorem mode_alternating_killed :
    step0 1 (-1) 1 (-1) = 0 ∧ step1 1 (-1) 1 (-1) = 0
      ∧ step2 1 (-1) 1 (-1) = 0 ∧ step3 1 (-1) 1 (-1) = 0 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> · simp only [step0, step1, step2, step3]; norm_num

/- ------------------------------------------------------------------
   §2  Fibrewise σ-evenness survives base averaging and shifts
   ------------------------------------------------------------------ -/

variable {β F : Type*} [Fintype β] (s : F → F)

/-- Fibrewise σ-evenness of a base-modulated profile. -/
def FibrewiseEven (Φ : β → F → ℚ) : Prop :=
  ∀ b x, Φ b (s x) = Φ b x

/-- Any base-averaging kernel (heat step included) preserves
    fibrewise σ-evenness: the flow acts on the base argument, the
    involution on the fibre argument, and the two commute. -/
theorem fibrewiseEven_baseAverage (w : β → β → ℚ) (Φ : β → F → ℚ)
    (hΦ : FibrewiseEven s Φ) :
    FibrewiseEven s (fun b x => ∑ b', w b b' * Φ b' x) := by
  intro b x
  show (∑ b', w b b' * Φ b' (s x)) = ∑ b', w b b' * Φ b' x
  exact Finset.sum_congr rfl fun b' _ => by rw [hΦ b' x]

/-- Fibrewise-constant shifts (the area renormalisation of rb:jensen)
    preserve fibrewise σ-evenness. -/
theorem fibrewiseEven_shift (c : β → ℚ) (Φ : β → F → ℚ)
    (hΦ : FibrewiseEven s Φ) :
    FibrewiseEven s (fun b x => Φ b x + c b) := by
  intro b x
  show Φ b (s x) + c b = Φ b x + c b
  rw [hΦ b x]

/- ------------------------------------------------------------------
   §3  The transversality dimension count of rb:stab, route (ii)
   ------------------------------------------------------------------ -/

/-- A 2-sphere generically misses a codimension-three locus, while
    its 3-dimensional homotopy trace generically meets it in isolated
    points: the linking mechanism and the retraction obstruction are
    the same count. -/
theorem transversality_count :
    (2 : ℤ) - 3 < 0 ∧ (3 : ℤ) - 3 = 0 := by decide

end RB
