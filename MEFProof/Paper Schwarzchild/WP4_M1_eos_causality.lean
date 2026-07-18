/-
  WP4_M1_eos_causality.lean — G-BH-1R / Node M1 CERT target
  ----------------------------------------------------------
  The algebraic layer of Proposition (Structural properties of the
  crossover form) in WP4_M1_eos_properties.tex: causality with a
  strict gap, monotonicity, energy conditions, exact crossover
  continuity, and the C^1 kink, for the declared interpolating
  equation of state

      p/rho  = 1 - (2/3) x,      c_s^2 = 1 - (4/9) x,
      x = (rho_*/rho)^(1/3) in (0, 1]  on  rho >= rho_*.

  Everything is stated in the rational variable x, matching the
  MEF.BlackHoleCluster house style (Q-decidable; norm_num / nlinarith;
  no transcendental content).  The one calculus statement of the .tex,
  clause (i) dp/drho = c_s^2, is a one-line differentiation flagged as
  PI-executable apparatus and is deliberately NOT restated here in
  Real.rpow form; this file certifies the inequality layer that the
  two-point problem consumes.

  Scope guard: these are properties OF the declared [M] crossover
  form.  Nothing here evidences the form; the grades of eq:eos and
  rho_* are untouched.

  Status: CERT-pending — delivered for independent PI local compile
  (Lean 4 + Mathlib), per the established project pattern.

  Map to the .tex:
    csq_causal_gap        — clause (ii): 5/9 <= c_s^2 < 1 on (0,1]
    csq_strict_sublum     — clause (ii): subluminal iff x > 0
    csq_monotone          — clause (iii): c_s^2 decreasing in x
    pratio_bounds         — clause (iii): 1/3 <= p/rho < 1
    pratio_monotone       — clause (iii): p/rho decreasing in x
    energy_conditions     — clause (iv): 0 < p <= rho on the branch
    crossover_continuity  — clause (v): p/rho = 1/3 exactly at x = 1
    crossover_kink        — clause (v): c_s^2 jump = 2/9 > 0, both
                            one-sided values causal
-/

import Mathlib

namespace MEF.GBH1R

/-- Sound speed squared of the crossover form, in the variable
    x = (rho_*/rho)^(1/3). -/
def csq (x : Rat) : Rat := 1 - (4/9) * x

/-- Pressure ratio p/rho of the crossover form. -/
def pratio (x : Rat) : Rat := 1 - (2/3) * x

/-- Radiation-branch sound speed squared (below the crossover). -/
def csqRad : Rat := 1/3

/-! ### Clause (ii): causality with a strict gap -/

/-- On the branch x ∈ (0,1]: 5/9 ≤ c_s² < 1.  The lower bound is
    attained exactly at the crossover x = 1; the luminal bound is
    approached only as x → 0 (rho → ∞). -/
theorem csq_causal_gap (x : Rat) (h0 : 0 < x) (h1 : x ≤ 1) :
    (5:Rat)/9 ≤ csq x ∧ csq x < 1 := by
  unfold csq
  constructor <;> nlinarith

/-- Strict subluminality is equivalent to positive x: the flow is
    strictly subluminal at every finite density. -/
theorem csq_strict_sublum (x : Rat) : csq x < 1 ↔ 0 < x := by
  unfold csq
  constructor <;> intro h <;> nlinarith

/-! ### Clause (iii): monotonicity and pressure bounds -/

/-- c_s² is (weakly) decreasing in x, i.e. increasing in rho. -/
theorem csq_monotone (x₁ x₂ : Rat) (h : x₁ ≤ x₂) :
    csq x₂ ≤ csq x₁ := by
  unfold csq; nlinarith

/-- On the branch: 1/3 ≤ p/rho < 1 — the pressure ratio runs from the
    radiation value at the crossover towards the stiff value, never
    leaving the interval. -/
theorem pratio_bounds (x : Rat) (h0 : 0 < x) (h1 : x ≤ 1) :
    (1:Rat)/3 ≤ pratio x ∧ pratio x < 1 := by
  unfold pratio
  constructor <;> nlinarith

/-- p/rho is (weakly) decreasing in x, i.e. increasing in rho. -/
theorem pratio_monotone (x₁ x₂ : Rat) (h : x₁ ≤ x₂) :
    pratio x₂ ≤ pratio x₁ := by
  unfold pratio; nlinarith

/-! ### Clause (iv): energy conditions -/

/-- With rho > 0 on the branch, 0 < p ≤ rho: NEC, WEC, SEC, DEC all
    hold, DEC saturated only in the stiff limit x → 0. -/
theorem energy_conditions (x rho : Rat) (h0 : 0 < x) (h1 : x ≤ 1)
    (hr : 0 < rho) :
    0 < pratio x * rho ∧ pratio x * rho ≤ rho := by
  have hb := pratio_bounds x h0 h1
  constructor
  · nlinarith [hb.1]
  · nlinarith [hb.2]

/-! ### Clause (v): crossover regularity -/

/-- Continuity: at the crossover x = 1 the interpolating form meets
    the radiation branch exactly, p/rho = 1/3. -/
theorem crossover_continuity : pratio 1 = 1/3 := by
  unfold pratio; norm_num

/-- The C¹ kink: the one-sided sound speeds at the crossover are 5/9
    (from the stiff side) and 1/3 (radiation side); the jump is 2/9,
    strictly positive, and both one-sided values are causal. -/
theorem crossover_kink :
    csq 1 = 5/9 ∧ csq 1 - csqRad = 2/9 ∧
    csqRad < 1 ∧ csq 1 < 1 := by
  unfold csq csqRad
  norm_num

end MEF.GBH1R
