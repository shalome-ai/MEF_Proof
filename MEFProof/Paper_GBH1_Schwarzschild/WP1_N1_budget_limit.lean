/-
  WP1_N1_budget_limit.lean — G-BH-1R / Node N1 CERT target
  ---------------------------------------------------------

  Status: CERT-pending — delivered for independent PI local compile
  (Lean 4 + Mathlib), per the established project pattern.

  Map to the .tex:
    winding_exponents / budget_sum / budget_sumsq_saturated
        — the interior data sit on the budget surface (Lemma
          "Interior consistency" + Proposition "Budget recovery").
    scale_out
        — the tau-dependence factors out of the constraint (the
          "scale-out lemma" cited in the proof).
    constraint_iff_budget
        — the (Sum p)^2 − Sum p^2 = s form is equivalent to the
          canonical budget form  Sum p^2 = 1 − s  given Sum p = 1
          (the "equivalence lemma").
    saturation_forces_flat / saturation_forces_slope_zero
        — 4D saturation forces the eight internal exponents and the
          slope term to vanish termwise (the "saturation lemma"; the
          rigidity no-go restated for the reduced system).
-/

import Mathlib

namespace MEF.GBH1R

open Finset

/-! ### The winding-lift exponent data
    Effective 11-vector: (p_r, p_Ω, p_Ω) ⊕ 0^8
    with (p_r, p_Ω) = (−1/3, 2/3).  We carry the 4D triple and the
    8 internal exponents separately, matching the split used by the
    companion theorem `internal_no_go`. -/

def pr : Rat := -1/3
def pOm : Rat := 2/3

/-- 4D exponent sum: p_r + 2 p_Ω = 1. -/
theorem budget_sum_4d : pr + pOm + pOm = 1 := by
  unfold pr pOm; norm_num

/-- 4D exponent square-sum: p_r² + 2 p_Ω² = 1 (saturation). -/
theorem budget_sumsq_4d : pr^2 + pOm^2 + pOm^2 = 1 := by
  unfold pr pOm; norm_num

/-- With the eight internal exponents frozen at zero, the full
    11-vector satisfies both budget sums at the saturated point:
    Σ p = 1 and Σ p² = 1 (i.e. eq:budget with s = ζ q̃² = 0). -/
theorem budget_saturated (pint : Fin 8 → Rat)
    (hfrozen : ∀ i, pint i = 0) :
    (pr + pOm + pOm) + (univ.sum fun i => pint i) = 1 ∧
    (pr^2 + pOm^2 + pOm^2) + (univ.sum fun i => (pint i)^2) = 1 := by
  have h1 : (univ.sum fun i => pint i) = 0 :=
    Finset.sum_eq_zero (fun i _ => hfrozen i)
  have h2 : (univ.sum fun i => (pint i)^2) = 0 :=
    Finset.sum_eq_zero (fun i _ => by rw [hfrozen i]; ring)
  constructor
  · rw [h1, budget_sum_4d]; ring
  · rw [h2, budget_sumsq_4d]; ring

/-! ### Scale-out lemma
    For power-law data β_i = p_i ln τ the constraint carries an
    overall τ⁻²: at the rational level, dividing every slope by a
    common non-zero factor t scales the constraint combination
    (Σp)² − Σp² by 1/t².  This is the algebraic content of "the
    τ-dependence factors out". Stated for the 4D triple plus a
    generic internal 8-vector. -/

theorem scale_out (a b c : Rat) (pint : Fin 8 → Rat) (t : Rat)
    (ht : t ≠ 0) :
    ((a/t + b/t + c/t) + univ.sum fun i => pint i / t)^2
      - ((a/t)^2 + (b/t)^2 + (c/t)^2
          + univ.sum fun i => (pint i / t)^2)
    = (((a + b + c) + univ.sum fun i => pint i)^2
      - (a^2 + b^2 + c^2 + univ.sum fun i => (pint i)^2)) / t^2 := by
  have hsum : (univ.sum fun i => pint i / t) = (univ.sum fun i => pint i) / t := by
    rw [Finset.sum_div]
  have hsq : (univ.sum fun i => (pint i / t)^2) = (univ.sum fun i => (pint i)^2) / t^2 := by
    rw [Finset.sum_div]
    exact Finset.sum_congr rfl (fun i _ => by field_simp)
  rw [hsum, hsq]
  ring

/-! ### Equivalence lemma
    Given Σp = 1, the raw constraint form (Σp)² − Σp² = s is
    equivalent to the canonical budget form Σp² = 1 − s.
    (s stands for ζ q̃² ≥ 0; non-negativity is not needed here.) -/

theorem constraint_iff_budget (P S2 s : Rat) (hP : P = 1) :
    (P^2 - S2 = s) ↔ (S2 = 1 - s) := by
  subst hP
  constructor <;> intro h <;> linarith

/-! ### Saturation lemma (the no-go, restated for the reduced system)
    If the 4D exponents are the winding values (−1/3, 2/3, 2/3) and
    the full 11-vector satisfies eq:budget with s = ζ q̃² ≥ 0, then
    every internal exponent vanishes and s = 0: the interior boundary
    data sit exactly on the budget surface and admit no internal
    excitation and no dilaton slope. -/

theorem internal_sumsq_nonpos (pint : Fin 8 → Rat) (s : Rat)
    (hs : 0 ≤ s)
    (hsq : (pr ^ 2 + pOm ^ 2 + pOm ^ 2)
        + (univ.sum fun i => (pint i) ^ 2) = 1 - s) :
    (univ.sum fun i => (pint i)^2) ≤ 0 := by
  have h4 : pr^2 + pOm^2 + pOm^2 = 1 := budget_sumsq_4d
  linarith [hsq, h4, hs]

theorem saturation_forces_flat (pint : Fin 8 → Rat) (s : Rat)
    (hs : 0 ≤ s)
    (hsq : (pr ^ 2 + pOm ^ 2 + pOm ^ 2)
        + (univ.sum fun i => (pint i) ^ 2) = 1 - s) :
    ∀ i, pint i = 0 := by
  intro i
  have hle := internal_sumsq_nonpos pint s hs hsq
  have hnn : ∀ j ∈ univ, (0:Rat) ≤ (pint j)^2 :=
    fun j _ => sq_nonneg _
  have hz : (univ.sum fun j => (pint j)^2) = 0 :=
    le_antisymm hle (Finset.sum_nonneg hnn)
  have := (Finset.sum_eq_zero_iff_of_nonneg hnn).mp hz i (mem_univ i)
  exact pow_eq_zero_iff (n := 2) (by norm_num) |>.mp this

theorem saturation_forces_slope_zero (pint : Fin 8 → Rat) (s : Rat)
    (hs : 0 ≤ s)
    (hsq : (pr ^ 2 + pOm ^ 2 + pOm ^ 2)
        + (univ.sum fun i => (pint i) ^ 2) = 1 - s) :
    s = 0 := by
  have hflat := saturation_forces_flat pint s hs hsq
  have hz : (univ.sum fun j => (pint j)^2) = 0 :=
    Finset.sum_eq_zero (fun j _ => by rw [hflat j]; ring)
  have h4 : pr^2 + pOm^2 + pOm^2 = 1 := budget_sumsq_4d
  linarith [hsq, hz, h4]

end MEF.GBH1R
