/-
Certificate 3 (Proposition: conditional identification) — AMENDED
(wave 2: conversion constant κ added per ruling R2; conclusion is
now IsLeast massSet (κ·Δ)).
CONDITIONAL: the certificate machine-checks the conditional
structure — the three class hypotheses (A1)–(A3), and exactly
those three, are encoded as named fields, and the conclusion is
derived from them. It does not prove the hypotheses.
  hA1 — (A1): level degeneracies m(n) = d_odd(n)
  hA2 — (A2): the mass at level n equals n·κ·Δ
  hA3 — (A3): d_odd(n) counts one-particle states at level n
κ is a field of the data with positivity a named hypothesis
(hκpos), matching the class definition, in which κ is a datum of
the reduction. d_odd itself is NOT a hypothesis: it is defined
arithmetically and its needed value d_odd(1) = 1 is proved.
FINDING (made visible rather than silent): the lower-bound
direction needs 0 ≤ Δ. In the prose this is supplied by the
positivity lemma; here it is an explicit argument `hΔpos`, and the
master certificate (Certificate 4) discharges it from the
geometry.
No reference to any gauge group appears in this file.
STATUS: source amended this wave; local compile pending (recorded
in the wave log; no compile claim is made here).
-/
import Mathlib.NumberTheory.Divisors
import Mathlib.Analysis.SpecialFunctions.Pow.Real
set_option linter.style.whitespace false
set_option linter.style.show false
noncomputable section
namespace Identification

/-- The odd-divisor count d_odd(n), defined arithmetically. -/
def dodd (n : ℕ) : ℕ := ((Nat.divisors n).filter (fun d => Odd d)).card

/-- The smallest case, worked by machine: d_odd(1) = 1. -/
theorem dodd_one : dodd 1 = 1 := by decide

/-- The identification hypotheses, exactly the three of the class,
together with the class data Δ and κ. -/
structure IdentificationData where
  /-- the internal spectral separation between the distinguished
      corner and the nearest remaining corner (geometric input;
      positive by the gap lemma when instantiated — assumed here,
      discharged in Certificate 4) -/
  Δ : ℝ
  /-- the conversion constant of the reduction (class datum) -/
  κ : ℝ
  /-- positivity of the conversion constant (class datum) -/
  hκpos : 0 < κ
  /-- level degeneracies of the reduced theory -/
  m : ℕ → ℕ
  /-- (A1): m(n) = d_odd(n) -/
  hA1 : ∀ n, m n = dodd n
  /-- one-particle mass assignment at level n -/
  mass : ℕ → ℝ
  /-- (A2): the activated spectrum is κΔ-spaced -/
  hA2 : ∀ n, mass n = n * (κ * Δ)
  /-- the set of masses of non-vacuum one-particle states -/
  massSet : Set ℝ
  /-- (A3): the non-vacuum one-particle masses are exactly the
      occupied levels n ≥ 1 -/
  hA3 : massSet = { x | ∃ n : ℕ, 1 ≤ n ∧ m n ≠ 0 ∧ x = mass n }

/-- **Conditional identification.** Under the three hypotheses, κ·Δ
is the least element of the set of non-vacuum one-particle
masses. -/
theorem identification (D : IdentificationData) (hΔpos : 0 ≤ D.Δ) :
    IsLeast D.massSet (D.κ * D.Δ) := by
  have hκΔ : 0 ≤ D.κ * D.Δ := mul_nonneg (le_of_lt D.hκpos) hΔpos
  constructor
  · -- membership: level 1 is occupied (d_odd(1) = 1) and has mass κΔ
    rw [D.hA3]
    refine ⟨1, le_refl 1, ?_, ?_⟩
    · rw [D.hA1, dodd_one]; exact one_ne_zero
    · rw [D.hA2]; simp
  · -- lower bound: every occupied level n ≥ 1 has mass n·κΔ ≥ κΔ
    rintro x hx
    rw [D.hA3] at hx
    obtain ⟨n, h1, _, rfl⟩ := hx
    rw [D.hA2]
    calc D.κ * D.Δ = 1 * (D.κ * D.Δ) := (one_mul _).symm
    _ ≤ n * (D.κ * D.Δ) := by
        apply mul_le_mul_of_nonneg_right _ hκΔ
        exact_mod_cast h1

end Identification
