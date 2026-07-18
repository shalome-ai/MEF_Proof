/-
================================================================
YM_P1_identification.lean  (module YML.YM_P1)
================================================================
Conditional certificate for YM-P1 (statement register R-3):
claim (ii) of prop:gauge-transfer — Δ is the mass of the lowest
non-vacuum one-particle state of the reduced theory 𝒯.

Status target: CERT (CONDITIONAL). The certificate machine-checks
the CONDITIONAL STRUCTURE: the three hypotheses of the frozen
register list — and exactly those three — are encoded as named
fields, and the conclusion is derived from them. It does NOT
prove the hypotheses, and it does NOT upgrade the [D]
classification: an unconditional certificate corresponds to [R]
content; this conditional certificate corresponds to [D] content
with its conditions named.

Hypothesis list (= register R-3, restricted per R-5 to claim (ii)):
  hM6  — 𝓜-6: level degeneracies m(n) = d_odd(n)   [Paper XX §5, axiom]
  hM8  — 𝓜-8: the Spinᶜ twist activates the q-spectrum with level
         spacing equal to the internal separation Δ [Paper XX §5, axiom]
  hSR  — spectral reading of thm:index: d_odd(n) counts one-particle
         states of 𝒯 at mass level n, so the non-vacuum one-particle
         masses are exactly the levels n ≥ 1 with d_odd(n) ≠ 0
d_odd itself is NOT a hypothesis: it is defined arithmetically
(count of odd divisors) and its needed value d_odd(1) = 1 is proved.

FINDING (reported per SOW Step 3 acceptance): the formalisation
forces ONE input beyond the frozen three into the open — the
lower-bound direction needs 0 ≤ Δ. In the prose this is supplied by
claim (i); here it is an explicit argument `hΔpos`, and the master
certificate (YM-P2) DISCHARGES it from the geometry (YM-L1 + YM-L2)
rather than assuming it. The dependence (ii) ← (i) is thereby made
visible instead of silent.

No reference to any gauge group appears in this file.

Build: inside a Mathlib checkout (tag v4.15.0):
  lake env sh -c 'LEAN_PATH="$LEAN_PATH:$PWD" lean YML/YM_P1.lean'
================================================================
-/
import Mathlib.NumberTheory.Divisors
import Mathlib.Analysis.SpecialFunctions.Pow.Real

noncomputable section
namespace YMP1

/-- The odd-divisor count d_odd(n), defined arithmetically. -/
def dodd (n : ℕ) : ℕ := ((Nat.divisors n).filter (fun d => Odd d)).card

/-- The smallest case, worked by machine: d_odd(1) = 1. -/
theorem dodd_one : dodd 1 = 1 := by decide

/-- The identification hypotheses, exactly the frozen three. -/
structure IdentificationData where
  /-- the internal spectral separation between the vacuum corner and
      the first excited corner orbit (geometric input; positive by
      YM-L2 when instantiated — assumed here, discharged in YM-P2) -/
  Δ : ℝ
  /-- level degeneracies of the reduced theory -/
  m : ℕ → ℕ
  /-- 𝓜-6 (hypothesis 1): m(n) = d_odd(n) -/
  hM6 : ∀ n, m n = dodd n
  /-- one-particle mass assignment of 𝒯 at level n -/
  mass : ℕ → ℝ
  /-- 𝓜-8 (hypothesis 2): the activated q-spectrum is Δ-spaced -/
  hM8 : ∀ n, mass n = n * Δ
  /-- the set of masses of non-vacuum one-particle states of 𝒯 -/
  massSet : Set ℝ
  /-- spectral reading of thm:index (hypothesis 3): the non-vacuum
      one-particle masses are exactly the occupied levels n ≥ 1 -/
  hSR : massSet = { x | ∃ n : ℕ, 1 ≤ n ∧ m n ≠ 0 ∧ x = mass n }

/-- **YM-P1 (conditional identification).** Under the three
hypotheses, Δ is the least element of the set of non-vacuum
one-particle masses of 𝒯 — i.e. Δ IS the mass of the lowest
non-vacuum one-particle state. -/
theorem identification (D : IdentificationData) (hΔpos : 0 ≤ D.Δ) :
    IsLeast D.massSet D.Δ := by
  constructor
  · -- membership: level 1 is occupied (d_odd(1) = 1) and has mass Δ
    rw [D.hSR]
    refine ⟨1, le_refl 1, ?_, ?_⟩
    · rw [D.hM6, dodd_one]; exact one_ne_zero
    · rw [D.hM8]; simp
  · -- lower bound: every occupied level n ≥ 1 has mass nΔ ≥ Δ
    rintro x hx
    rw [D.hSR] at hx
    obtain ⟨n, h1, _, rfl⟩ := hx
    rw [D.hM8]
    calc D.Δ = 1 * D.Δ := (one_mul _).symm
    _ ≤ n * D.Δ := by
        apply mul_le_mul_of_nonneg_right _ hΔpos
        exact_mod_cast h1

end YMP1
