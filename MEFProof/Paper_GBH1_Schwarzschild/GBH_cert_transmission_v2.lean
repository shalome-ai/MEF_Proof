/-
  GBH_cert_transmission_v2.lean — rational layer of the repaired
  transmission estimate (Wave 1, node N1/N2)
  -----------------------------------------------------------------
  Supersedes H5_transmission_bound.lean FOR THE STANDALONE PAPER:
  the Kretschmann route (Weyl gap 2/11; composite constant 2592/275)
  is retired — the invariant-based lower bound is false in Lorentzian
  signature (VSI counterexamples) — and the certified content is now
  the coefficient algebra of the uu-trace-reversal bound, the
  frame-component floor, additivity over stress components, and the
  exclusion dichotomy.  Namespace carries no framework identifier
  (concealment register).

  Map to the .tex (GBH_v3_Wave1_sections.tex):
    trace_reverse_coeff   — (D−3)/(D−2) at D = 12 equals 9/10;
                            8·(9/10) = 36/5 (the 36π/5 of eq:bound,
                            π symbolic in the .tex).
    lambda_coeff          — 2/(D−2) at D = 12 equals 1/5.
    uu_source_lower       — ρ ≥ 0 and Σp ≥ 0 give the trace-reversed
                            uu-source ≥ (9/10)·8ρ (rational layer of
                            eq:bound-genD; Λ handled additively).
    frame_floor           — |Σ_{i=1..11} a_i| ≤ 11·max|a_i|:
                            the frame-component floor eq:frame-floor
                            at D = 12 (R_uu is a sum of 11 frame
                            components).
    additive_lower        — linearity: bounded companions shift the
                            floor by a constant (eq:additive).
    linear_monotone       — the floor is monotone in ρ (linear form;
                            replaces the retired quadratic
                            bound_monotone).
    stiff_diverges        — s/t² exceeds any threshold at an explicit
                            rational witness (carried over verbatim,
                            still the Corollary's engine).
    exclusion_dichotomy   — bounded s/t² across small t forces s = 0
                            (carried over verbatim).

  Status: CERT-pending — for PI local compile (Lean 4 + Mathlib),
  per the established workflow. Watch-point unchanged from the H5
  file: the stiff_diverges calc block is Mathlib-version-sensitive.
-/

import Mathlib

namespace SchwarzschildLift.Transmission

/-! ### Coefficients of the uu-bound at D = 12 -/

/-- (D−3)/(D−2) at D = 12 equals 9/10, and 8·(9/10) = 36/5:
    the rational part of the coefficient 36π/5 in eq:bound. -/
theorem trace_reverse_coeff :
    ((12:Rat)-3)/(12-2) = 9/10 ∧ (8:Rat)*(9/10) = 36/5 := by
  norm_num

/-- 2/(D−2) at D = 12 equals 1/5: the Λ-coefficient of eq:bound. -/
theorem lambda_coeff : (2:Rat)/(12-2) = 1/5 := by
  norm_num

/-- With 0 ≤ Σp, the trace-reversed uu-source dominates (9/10)·8ρ
    (rational layer of eq:bound-genD; the hypothesis 0 ≤ ρ is not
    needed for this inequality and is not assumed). -/
theorem uu_source_lower (rho psum : Rat) (hp : 0 ≤ psum) :
    (9:Rat)/10 * (8*rho) ≤ 8*(rho*(9/10) + psum/10) := by
  nlinarith

/-! ### The frame-component floor (eq:frame-floor at D = 12) -/

/-- A sum of eleven terms is bounded by eleven times the largest
    modulus: |Σ a_i| ≤ 11·C whenever each |a_i| ≤ C.  Applied in the
    .tex with a_i = R_{uiui}: the frame floor sup|R| ≥ |R_uu|/11. -/
theorem frame_floor (a : Fin 11 → Rat) (C : Rat)
    (hC : ∀ i, |a i| ≤ C) :
    |∑ i, a i| ≤ 11 * C := by
  calc |∑ i, a i| ≤ ∑ i, |a i| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _i : Fin 11, C := Finset.sum_le_sum (fun i _ => hC i)
    _ = 11 * C := by simp [Finset.sum_const, mul_comm]

/-! ### Additivity over stress components (eq:additive) -/

/-- Linearity of the uu-source: if the divergent component contributes
    at least (36/5)·ρc and the companions (background + bounded matter
    + Λ term) contribute at least −C₀, the total is bounded below by
    (36/5)·ρc − C₀. Rational skeleton of Lemma lem:additive. -/
theorem additive_lower (rhoc C0 comp : Rat)
    (hcomp : -C0 ≤ comp) :
    (36:Rat)/5 * rhoc - C0 ≤ 36/5 * rhoc + comp := by
  linarith

/-- The floor is monotone in the density (linear form): larger ρ,
    larger uu-floor. Replaces the retired quadratic monotonicity. -/
theorem linear_monotone (K r1 r2 : Rat) (hK : 0 ≤ K) (h : r1 ≤ r2) :
    K * r1 ≤ K * r2 := by
  exact mul_le_mul_of_nonneg_left h hK

/-! ### Divergence witness and the exclusion dichotomy
    (carried over from the superseded certificate; these are the
    algebraic core of Corollary cor:saturation and are unaffected by
    the retirement of the Kretschmann route). -/

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

/-! ### Escape-rate arithmetic (Lemma lem:escape, rational layer) -/

/-- The lapse inequality: for t > 0, (1/(3t))² ≤ 1 + 1/(9t²) —
    the rational core of |Ṫ| ≥ 1/(3τ) in lem:escape. -/
theorem escape_lapse (t : Rat) (ht : 0 < t) :
    (1/(3*t))^2 ≤ 1 + 1/(9*t^2) := by
  have h9 : (0:Rat) < 9*t^2 := by positivity
  have : (1/(3*t))^2 = 1/(9*t^2) := by
    field_simp
    ring
  rw [this]
  linarith

/-- Divergence of the escape rate: 1/(3t) exceeds any threshold B ≥ 0
    at the explicit witness t = 1/(3(B+1)). -/
theorem escape_diverges (B : Rat) (hB : 0 ≤ B) :
    ∃ t : Rat, 0 < t ∧ B < 1/(3*t) := by
  refine ⟨1/(3*(B+1)), by positivity, ?_⟩
  have hpos : (0:Rat) < 3*(B+1) := by linarith
  have : (1:Rat)/(3*(1/(3*(B+1)))) = B + 1 := by
    field_simp
  rw [this]
  linarith

end SchwarzschildLift.Transmission
