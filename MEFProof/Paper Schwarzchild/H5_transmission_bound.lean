/-
  H5_transmission_bound.lean — arithmetic skeleton of the H5 lemma
  -----------------------------------------------------------------
  Machine-checks the rational layer of Lemma (Pointwise curvature
  transmission) in H5_selection_lemma.tex, in the MEF.BlackHoleCluster
  house style (Q-decidable; norm_num / nlinarith; transcendentals
  excluded — pi is carried symbolically in the .tex and never asserted
  here; the certified content is the rational coefficient algebra and
  the divergence monotonicity).

  Map to the .tex:
    weyl_gap_coefficient    — Step 1: 4/(D-2) - 2D/((D-1)(D-2))
      = 2/(D-1), evaluated at D = 12: = 2/11.
    trace_reverse_coeff     — Step 2: (D-3)/(D-2) at D = 12 = 9/10.
    composite_constant      — Step 3: (2/11)*(8*(9/10))^2 = 2592/275
    (the pi^2 factor rides outside; the .tex
    display K >= (2592 pi^2/275) G^2 rho^2
    carries it symbolically).
    bound_monotone          — the lower bound is monotone in rho:
    divergence of rho forces divergence of
      the bound (the analytic limit statement
     lives in the .tex; here: unboundedness
                              transfer at the rational level).
    stiff_diverges          — for any s > 0 the stiff density s/t^2
                              exceeds any threshold for small t
                              (rational witness form).
    exclusion_dichotomy     — s*t^{-2} bounded by B for all admissible
                              small t forces s = 0 (the Corollary's
                              algebraic core, stated contrapositively
                              with an explicit witness).

  Status: CERT-pending — delivered for independent PI local compile
  (Lean 4 + Mathlib), alongside WP1_N1_budget_limit.lean and
  WP4_M1_eos_causality.lean.
-/

import Mathlib

namespace MEF.GBH1R

/-! ### Step 1: the Weyl-gap coefficient at D = 12 -/

/-- 4/(D−2) − 2D/((D−1)(D−2)) = 2/(D−1) at D = 12: both sides = 2/11. -/
theorem weyl_gap_coefficient :
    (4:Rat)/(12-2) - 2*12/((12-1)*(12-2)) = 2/(12-1) ∧
    (2:Rat)/(12-1) = 2/11 := by
  norm_num

/-! ### Step 2: the trace-reversal coefficient at D = 12 -/

/-- (D−3)/(D−2) at D = 12 equals 9/10. -/
theorem trace_reverse_coeff : ((12:Rat)-3)/(12-2) = 9/10 := by
  norm_num

/-- With componentwise 0 ≤ p_i and ρ ≥ 0, the trace-reversed uu-source
    is bounded below by (9/10)·(8ρ) in units of π G_eff (rational
    layer: the coefficient inequality). -/
theorem uu_source_lower (rho psum : Rat)
    (hp : 0 ≤ psum) :
    (9:Rat)/10 * (8*rho) ≤ 8*(rho*(9/10) + psum/10) := by
  nlinarith

/-! ### Step 3: the composite constant -/

/-- (2/11)·(8·(9/10))² = 2592/275 — the rational part of the bound
    K ≥ (2592 π²/275) G² ρ². -/
theorem composite_constant :
    (2:Rat)/11 * (8*(9/10))^2 = 2592/275 := by
  norm_num

/-! ### Divergence transfer -/

/-- The bound C·ρ² is monotone in ρ ≥ 0: larger density, larger
    curvature floor. -/
theorem bound_monotone (C r1 r2 : Rat) (hC : 0 < C) (h0 : 0 ≤ r1) (h : r1 ≤ r2) :
    C * r1^2 ≤ C * r2^2 := by
  -- gcongr (Generalized Congruence) automatically applies monotonicity rules
  -- across multiplications and exponents when the base elements are positive.
  gcongr

/-- Stiff divergence witness: for any s > 0 and any threshold B ≥ 0,
    the density s/t² exceeds B at the explicit rational witness
    t = min(1, s/(B+s)) — no limit machinery needed. -/
theorem stiff_diverges (s B : Rat) (hs : 0 < s) (hB : 0 ≤ B) :
    ∃ t : Rat, 0 < t ∧ t ≤ 1 ∧ B < s/t^2 := by
  refine ⟨min 1 (s/(B+s)), ?_, min_le_left _ _, ?_⟩
  · have h1 : (0:Rat) < s/(B+s) := by positivity
    exact lt_min one_pos h1
  · have hden : (0:Rat) < B + s := by linarith
    have hle : min 1 (s/(B+s)) ≤ s/(B+s) := min_le_right _ _
    have hpos : (0:Rat) < min 1 (s/(B+s)) := by
      have h1 : (0:Rat) < s/(B+s) := by positivity
      exact lt_min one_pos h1
    have hsq : (min 1 (s/(B+s)))^2 ≤ (s/(B+s))^2 := by nlinarith [hle, hpos]
    have hsqpos : (0:Rat) < (min 1 (s/(B+s)))^2 := by positivity
    have key : B * (s/(B+s))^2 < s := by
      rw [div_pow]
      rw [mul_div_assoc']
      rw [div_lt_iff₀ (by positivity)]
      -- Bypass nlinarith by manually providing the expanded positive difference
      have h_pos : 0 < s * B^2 + B * s^2 + s^3 := by positivity
      have h_eq : s * B^2 + B * s^2 + s^3 = s * (B + s)^2 - B * s^2 := by ring
      linarith
    have h_bound : B * (min 1 (s/(B+s)))^2 < s :=
      lt_of_le_of_lt (by nlinarith [hsq, hB]) key
    calc B = B * (min 1 (s/(B+s)))^2 / (min 1 (s/(B+s)))^2 := by field_simp
         _ < s / (min 1 (s/(B+s)))^2 := by gcongr

/-- The Corollary's algebraic core, contrapositive form: if the stiff
    density s/t² is bounded by B across arbitrarily small t (here:
    at every rational witness), then s = 0. -/
theorem exclusion_dichotomy (s B : Rat) (hs : 0 ≤ s) (hB : 0 ≤ B)
    (hbound : ∀ t : Rat, 0 < t → t ≤ 1 → s/t^2 ≤ B) : s = 0 := by
  by_contra hne
  have hspos : 0 < s := lt_of_le_of_ne hs (Ne.symm hne)
  obtain ⟨t, ht0, ht1, hgt⟩ := stiff_diverges s B hspos hB
  exact absurd (hbound t ht0 ht1) (not_le.mpr hgt)

end MEF.GBH1R
