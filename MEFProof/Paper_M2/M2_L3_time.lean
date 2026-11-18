/-
  M2_L3_time.lean — Paper M2, card S04c: along time (the covering torus
  carried round the time circle).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and integer arithmetic of the proof of
  Proposition `prop:time` (write-up log from M2-W041 on, as logged), with
  A = M0³ the map by which the fibre is joined to itself once round the time
  circle (M1 Corollary 7.8).

  * A = M0³ = [[13, 8], [8, 5]] with M0 = [[2, 1], [1, 1]] (`L3_A_is_M0_cubed`);
    det A = 1 (`L3_A_det_one`); A is symmetric (`L3_A_symmetric`).
  * A carries each corner C_{m,n} = (m/2, n/2) to itself modulo Z²: (A − I)(m, n)
    has even entries for m, n ∈ {0, 1} (`L3_A_fixes_corners`).
  * A commutes with the fold v ↦ −v on integer vectors (`L3_A_commutes_fold`);
    on the torus this is the same linear identity, checked by hand.
  * The completed square 13·(13a² + 16ab + 5b²) = (13a + 8b)² + b² over the
    integers (`L3_A_completed_square`): the arithmetic behind "A is positive
    definite", used by hand for real vectors.
  * In Z[φ], written a + bφ with φ² = φ + 1: φ⁶ = 5 + 8φ (`L3_phi_six`),
    (13 − 8φ)(5 + 8φ) = 1, so φ⁻⁶ = 13 − 8φ (`L3_phi_inv_six`); A(φ, 1) =
    φ⁶(φ, 1) (`L3_eigen_v1`) and A(1, −φ) = φ⁻⁶(1, −φ) (`L3_eigen_v2`), where
    (1, −φ) = S(φ, 1) with S the quarter-turn of M1; det[(φ, 1), (1, −φ)] =
    −(2 + φ) (`L3_orientation`), negative since φ > 0 (by hand).
  * The integer step of the even logarithm: an integer μ with 4μ = 0 is 0
    (`L3_four_mu`); and the linear bookkeeping of the shift θψ ↦ θψ + 1 in
    η(−θ) − η(θ) − 4πi(μθψ + νθω), over the integers (`L3_shift`), the
    quantities in the proof being complex and the identity the same, checked
    by hand.

  What is not certified: the cited theorems (Hatcher, Proposition 1.33;
  Segal, Proposition (1.3) and the clutching statement); M1's results;
  anything about continuity, exponentials, logarithms, real or complex
  numbers, bundles or lifts: only the integer arithmetic written here, and
  the arithmetic of Z[φ] as pairs of integers, is certified.
-/

namespace M2L3

/-- 2 × 2 integer matrices as (a, b, c, d) = [[a, b], [c, d]]. -/
structure Mat where
  a : Int
  b : Int
  c : Int
  d : Int
deriving DecidableEq, Repr

def Mat.mul (P Q : Mat) : Mat :=
  ⟨P.a * Q.a + P.b * Q.c, P.a * Q.b + P.b * Q.d, P.c * Q.a + P.d * Q.c, P.c * Q.b + P.d * Q.d⟩

def Mat.det (P : Mat) : Int := P.a * P.d - P.b * P.c

def M0 : Mat := ⟨2, 1, 1, 1⟩
def A : Mat := ⟨13, 8, 8, 5⟩

theorem L3_A_is_M0_cubed : (M0.mul M0).mul M0 = A := by decide

theorem L3_A_det_one : A.det = 1 := by decide

theorem L3_A_symmetric : A.b = A.c := by decide

/-- (A − I)(m, n) has even entries for m, n ∈ {0, 1}: A leaves each corner (m/2, n/2) in place mod Z². -/
theorem L3_A_fixes_corners :
    ([0, 1] : List Int).all (fun m => ([0, 1] : List Int).all fun n =>
      ((A.a - 1) * m + A.b * n) % 2 == 0 && (A.c * m + (A.d - 1) * n) % 2 == 0) = true := by
  decide

/-- A(−v) = −(Av). -/
theorem L3_A_commutes_fold (x y : Int) :
    13 * (-x) + 8 * (-y) = -(13 * x + 8 * y) ∧ 8 * (-x) + 5 * (-y) = -(8 * x + 5 * y) := by
  omega

/-- The completed square behind the positive definiteness of A. -/
theorem L3_A_completed_square (x y : Int) :
    13 * (13 * x * x + 16 * x * y + 5 * y * y) = (13 * x + 8 * y) * (13 * x + 8 * y) + y * y := by
  grind

/-- Z[φ]: the pair (a, b) stands for a + bφ, with φ² = φ + 1. -/
def gmul (p q : Int × Int) : Int × Int :=
  (p.1 * q.1 + p.2 * q.2, p.1 * q.2 + p.2 * q.1 + p.2 * q.2)

def gpow (p : Int × Int) : Nat → Int × Int
  | 0 => (1, 0)
  | n + 1 => gmul (gpow p n) p

def phi : Int × Int := (0, 1)

theorem L3_phi_six : gpow phi 6 = (5, 8) := by decide

theorem L3_phi_inv_six : gmul (13, -8) (5, 8) = (1, 0) := by decide

def gadd (p q : Int × Int) : Int × Int := (p.1 + q.1, p.2 + q.2)
def gsc (n : Int) (p : Int × Int) : Int × Int := (n * p.1, n * p.2)

/-- A acting on a vector with entries in Z[φ]. -/
def Aact (v : (Int × Int) × (Int × Int)) : (Int × Int) × (Int × Int) :=
  (gadd (gsc A.a v.1) (gsc A.b v.2), gadd (gsc A.c v.1) (gsc A.d v.2))

/-- v₁ = (φ, 1), the eigenvector of M0 for φ² up to its length. -/
def v1 : (Int × Int) × (Int × Int) := ((0, 1), (1, 0))
/-- v₂ = S v₁ = (1, −φ), S(a, b) = (b, −a) the quarter-turn of M1. -/
def v2 : (Int × Int) × (Int × Int) := ((1, 0), (0, -1))

theorem L3_v2_is_S_v1 : v2 = (v1.2, gsc (-1) v1.1) := by decide

theorem L3_eigen_v1 : Aact v1 = (gmul (5, 8) v1.1, gmul (5, 8) v1.2) := by decide

theorem L3_eigen_v2 : Aact v2 = (gmul (13, -8) v2.1, gmul (13, -8) v2.2) := by decide

/-- det[v₁, v₂] = −(2 + φ). -/
theorem L3_orientation : gadd (gmul v1.1 v2.2) (gsc (-1) (gmul v1.2 v2.1)) = (-2, -1) := by decide

/-- An integer μ with 4μ = 0 is 0. -/
theorem L3_four_mu (μ : Int) (h : 4 * μ = 0) : μ = 0 := by omega

/-- The shift θψ ↦ θψ + 1 changes H − P − 4(μθψ + νθω) by −4μ (integer stand-ins:
    H for η(−θ), P for η(θ), which do not change under the shift, η having period one). -/
theorem L3_shift (H P μ ν t1 t2 : Int) :
    (H - P - 4 * (μ * (t1 + 1) + ν * t2)) = (H - P - 4 * (μ * t1 + ν * t2)) - 4 * μ := by
  grind

end M2L3
