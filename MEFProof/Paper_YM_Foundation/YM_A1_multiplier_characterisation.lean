/-
================================================================
YM_A1_multiplier_characterisation.lean  (module YML.YM_A1a)
================================================================
Certificate 6a′ (Step 6, Ruling A(b), 12 Jul 2026):
the conditional analytic characterisation of the alternation.

Per eq:K2def (Paper XI v5, §7), the level-2 generalised
Kloosterman sum at modulus c = 2 has a single unit h = 1 (with
h·h̄ ≡ −1 (mod 2) giving h̄ = 1), so
    K₂(n, −1; 2) = ν̄(γ₁,₂) · e^{πi(n−1)} ,
where ν̄(γ₁,₂) is the (conjugated) multiplier-system value at the
sole group element. THIS FILE PROVES the characterisation:

    K₂(n, −1; 2) = (−1)ⁿ for all n ≥ 1   ⟺   ν̄(γ₁,₂) = −1 .

Status: CERT — the characterisation itself is unconditional
(a rigorous computation from eq:K2def); the corpus identity
Rule 5 follows from it CONDITIONALLY on the single named
hypothesis ν̄(γ₁,₂) = −1. The multiplier system ν is recorded
nowhere in the corpus; this certificate converts that gap into
exactly one testable value. It does not upgrade Rule 5's [D]
(ledger v14, row "Five arithmetic selection rules").

Per Ruling B this file imports nothing from, and is imported by
nothing in, the 6b certificate (YML.YM_A1b).

Build: inside a Mathlib checkout (tag v4.15.0):
  lake env sh -c 'LEAN_PATH="$LEAN_PATH:$PWD" lean YML/YM_A1a.lean'
================================================================
-/
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

noncomputable section
namespace YMA1a
open Complex Real

/-- The level-2 generalised Kloosterman sum at modulus 2, per
eq:K2def: single unit h = 1, multiplier value ν̄ = ν̄(γ₁,₂) left
as a parameter (it is recorded nowhere in the corpus). -/
def K2c2 (nubar : ℂ) (n : ℕ) : ℂ :=
  nubar * Complex.exp (Real.pi * I * ((n : ℂ) - 1))

/-- The exponential factor evaluates to −(−1)ⁿ for n ≥ 1 —
the (correct) content of the computation that Paper XVII v5
line 485 performed for the WRONG object (the classical sum). -/
theorem exp_eval (n : ℕ) (h : 1 ≤ n) :
    Complex.exp (Real.pi * I * ((n : ℂ) - 1)) = -((-1) ^ n) := by
  obtain ⟨m, rfl⟩ := Nat.exists_eq_add_of_le h
  have h1 : ((1 + m : ℕ) : ℂ) - 1 = (m : ℂ) := by push_cast; ring
  rw [h1, show Real.pi * I * (m : ℂ) = (m : ℂ) * (Real.pi * I) by ring,
     Complex.exp_nat_mul, Complex.exp_pi_mul_I]
  rw [pow_add, pow_one]
  ring

/-- **6a′ (the characterisation).** The corpus identity
K₂(n,−1;2) = (−1)ⁿ holds for all n ≥ 1 if and only if the
multiplier value ν̄(γ₁,₂) equals −1. -/
theorem characterisation (nubar : ℂ) :
    (∀ n : ℕ, 1 ≤ n → K2c2 nubar n = (-1) ^ n) ↔ nubar = -1 := by
  constructor
  · intro h
    have h1 := h 1 le_rfl
    simp only [K2c2] at h1
    rw [exp_eval 1 le_rfl] at h1
    simpa using h1
  · intro h n hn
    simp only [K2c2, h, exp_eval n hn]
    ring

/-- Contrapositive content of DISC-1, on the record: with trivial
multiplier (the classical sum), the value is (−1)^{n+1}, NOT
(−1)ⁿ — the two objects genuinely differ. -/
theorem classical_sum_differs (n : ℕ) (hn : 1 ≤ n) :
    K2c2 1 n = -((-1) ^ n) := by
  simp only [K2c2, one_mul]
  exact exp_eval n hn

end YMA1a
