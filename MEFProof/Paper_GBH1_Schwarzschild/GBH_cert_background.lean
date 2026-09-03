/-
  GBH_cert_background.lean — rational layer of the background solution
  (Wave 1, node N3; Proposition prop:background)
  -----------------------------------------------------------------
  Certifies the blockwise closure of the static product as a solution
  of the twelve-dimensional Einstein equation at the fixed value
  Λ = 1 − 3/R₃², with F Ricci-flat and the background stress
  8πG·(ρ̄, p̄_±, p̄_z, p̄_s, p̄_F) = (0, 0, −2, 2/R₃², 0).

  Conventions (units 8πG_eff = 1; y := 1/R₃² symbolic rational):
    Ricci eigenvalues (orthonormal frame):
      T-leg 0 · Sol ± legs 0 · Sol z-leg −2 · S³ legs 2y · F legs 0.
    Scalar curvature  R  = −2 + 6y.
    Λ                 Λ  = 1 − 3y  ( = −R/2 ).
    Einstein legs     G_AA = Ric_AA − (R/2)·g_AA,  g_TT = −1,
                      g_ii = +1.
    Field equation    G_AA = T̄_AA + Λ·g_AA  on each leg.

  Each theorem below is one leg of the field equation, as a rational
  identity in y; `background_closure` conjoins all five.  The NEC
  witness records G(k,k) = −2 on the null direction e_T + e_z
  (Remark rem:nec): Ric_TT + Ric_zz = −2, independent of y and Λ.

  Status: CERT-pending — for PI local compile (Lean 4 + Mathlib).
-/

import Mathlib

set_option linter.style.whitespace false
set_option linter.style.show false

namespace SchwarzschildLift.Background

/-- Scalar curvature of the product: R = −2 + 6y, as the trace of the
    Ricci eigenvalues over the twelve legs (sign of the T-leg carried
    by g^{TT} = −1; the T-eigenvalue is 0, so the trace is the spatial
    sum): 0·(T) + 0 + 0 + (−2) + 3·(2y) + 5·0 = −2 + 6y. -/
theorem scalar_curvature (y : Rat) :
    (0:Rat) + 0 + 0 + (-2) + 3*(2*y) + 5*0 = -2 + 6*y := by ring

/-- Λ is minus half the scalar curvature: 1 − 3y = −(−2 + 6y)/2. -/
theorem lambda_is_minus_half_R (y : Rat) :
    (1:Rat) - 3*y = -(-2 + 6*y)/2 := by ring

/-- T-leg: G_TT = R/2 (since Ric_TT = 0, g_TT = −1) equals
    T̄_TT + Λ·g_TT = 0 + (1 − 3y)·(−1).  Both sides: −1 + 3y. -/
theorem leg_T (y : Rat) :
    (0:Rat) - ((-2 + 6*y)/2)*(-1) = 0 + (1 - 3*y)*(-1) := by ring

/-- Sol ± legs: G = 0 − R/2 equals 0 + Λ.  Both sides: 1 − 3y. -/
theorem leg_sol_horizontal (y : Rat) :
    (0:Rat) - (-2 + 6*y)/2 = 0 + (1 - 3*y) := by ring

/-- Sol z-leg: G = −2 − R/2 equals p̄_z + Λ = −2 + (1 − 3y).
    Both sides: −1 − 3y. -/
theorem leg_sol_fibre (y : Rat) :
    (-2:Rat) - (-2 + 6*y)/2 = -2 + (1 - 3*y) := by ring

/-- S³ legs: G = 2y − R/2 equals p̄_s + Λ = 2y + (1 − 3y).
    Both sides: 1 − y. -/
theorem leg_sphere (y : Rat) :
    2*y - (-2 + 6*y)/2 = 2*y + (1 - 3*y) := by ring

/-- F legs (Ricci-flat): G = 0 − R/2 equals 0 + Λ. -/
theorem leg_F (y : Rat) :
    (0:Rat) - (-2 + 6*y)/2 = 0 + (1 - 3*y) := by ring

/-- The five block equations close simultaneously: the static product
    with Λ = 1 − 3y and the displayed background stress is a solution
    on every leg (Proposition prop:background). -/
theorem background_closure (y : Rat) :
    ((0:Rat) - ((-2 + 6*y)/2)*(-1) = 0 + (1 - 3*y)*(-1)) ∧
    ((0:Rat) - (-2 + 6*y)/2 = 0 + (1 - 3*y)) ∧
    ((-2:Rat) - (-2 + 6*y)/2 = -2 + (1 - 3*y)) ∧
    (2*y - (-2 + 6*y)/2 = 2*y + (1 - 3*y)) ∧
    ((0:Rat) - (-2 + 6*y)/2 = 0 + (1 - 3*y)) :=
  ⟨leg_T y, leg_sol_horizontal y, leg_sol_fibre y, leg_sphere y, leg_F y⟩

/-- NEC witness (Remark rem:nec): on the null direction e_T + e_z the
    Einstein tensor equals the Ricci sum Ric_TT + Ric_zz = 0 + (−2)
    = −2, independently of y — the Λ and R/2 terms drop on a null
    vector.  Hence 8πG·T̄(k,k) = −2 is forced. -/
theorem nec_witness : (0:Rat) + (-2) = -2 := by norm_num

/-- The forced violation is Λ-independent: for every Λ, the null
    contraction of Λ·g vanishes (g(k,k) = −1 + 1 = 0), so the
    required T̄(k,k) is unchanged. -/
theorem nec_lambda_independent (lam : Rat) :
    lam * ((-1) + 1) = 0 := by ring

end SchwarzschildLift.Background
