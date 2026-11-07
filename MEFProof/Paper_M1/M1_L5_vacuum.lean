/-!
# M1 — Certificate L5: no continuous modulus (Section 8)
Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.
Certified: the elimination of the overall scale x from the two stationarity
conditions to the single ratio constraint, and its specialisation at flux
quanta (Q_c, Q_w) = (3, 6) to the integer cubic 6u³ + u² − 72u − 4 = 0 in
u = τ₂².  (The stationarity conditions themselves are the Euler–Lagrange
equations of the flux-plus-curvature energy; they enter as hypotheses.)
-/

/-- From Q_w² = 2ux(6u+1) and Q_c² u = 2x(18u+1) the scale x is eliminated:
    Q_w² (18u+1) = Q_c² u² (6u+1). -/
theorem L5_ratio (u x Qw Qc : Int)
    (h1 : Qw*Qw = 2*u*x*(6*u+1)) (h2 : Qc*Qc*u = 2*x*(18*u+1)) :
    Qw*Qw*(18*u+1) = Qc*Qc*u*u*(6*u+1) := by
  rw [h1, h2]; ac_rfl

/-- Polynomial expansion used below: 9u·u·(6u+1) = 54·u³ + 9·u². -/
theorem L5_expand (u : Int) : 9*u*u*(6*u+1) = 54*(u*u*u) + 9*(u*u) := by
  have h1 : 9*u*u*(6*u+1) = 9*u*u*(6*u) + 9*u*u*1 := Int.mul_add _ _ _
  have h2 : 9*u*u*(6*u) = 54*(u*u*u) := by
    have : (9:Int)*u*u*(6*u) = (9*6)*(u*u*u) := by ac_rfl
    rw [this]; rfl
  have h3 : 9*u*u*1 = 9*(u*u) := by
    have : (9:Int)*u*u*1 = 9*(u*u) := by ac_rfl
    exact this
  rw [h1, h2, h3]

/-- With (Q_c, Q_w) = (3, 6) the ratio constraint is the cubic. -/
theorem L5_cubic (u : Int) :
    36*(18*u+1) = 9*u*u*(6*u+1) ↔ 6*(u*u*u) + u*u - 72*u - 4 = 0 := by
  have e := L5_expand u
  rw [e]
  constructor <;> intro h <;> omega
