/-
  M2_L5_step.lean — Paper M2, card S05: the fold and the drive on states
  (the step of the unfolded geometry).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and integer arithmetic of the proof of
  Proposition `prop:step` (write-up log, from M2-W069, as logged), with M0 the
  step of M1 and A = M0³ the map by which the fibre is joined to itself once
  round the time circle (M1 Corollary 7.8).

  * A = M0³ (`L5_A_is_M0_cubed`) and M0·A = A·M0 (`L5_M0_commutes_A`); M0 is
    symmetric (`L5_M0_symmetric`).
  * 1 and 2 are not multiples of 3, and 3 is (`L5_step_times`): the times L
    and 2L are not multiples of 3L, by hand.
  * On the half-lattice, written with doubled coordinates modulo two, M0
    leaves (0,0) in place and carries (1,0) to (0,1), (0,1) to (1,1) and
    (1,1) to (1,0) (`L5_corners`): P1 to itself, P2 → P3 → P4 → P2.  The
    permutation σ of the four corners used below is the one that this map
    gives, corner by corner (the first clause of `L5_cycle`); it has order
    three and moves P2, P3, P4 (`L5_cycle`).
  * Sign patterns on the four corners.  The pattern pulled back by the step
    has at P_i the sign at M0·P_i.  For the patterns with one sign −1, at
    P_k, k = 2, 3, 4: the pull-back of the pattern of P2 is that of P4, of
    P3 that of P2, of P4 that of P3; three pull-backs return each; none is
    carried to itself or to its negative, by one pull-back or by two; no two
    of the three are equal or opposite (`L5_patterns`).  Of the eight
    patterns with product −1, the ones carried to themselves are the two
    with the odd sign at P1 (`L5_fixed_patterns`).
  * In Z[φ], written a + bφ with φ² = φ + 1: φ² = 1 + φ and (2 − φ)(1 + φ) = 1,
    so φ⁻² = 2 − φ (`L5_phi_two`); M0(φ, 1) = φ²(φ, 1) (`L5_eigen_v1`) and
    M0(1, −φ) = φ⁻²(1, −φ) (`L5_eigen_v2`).
  * The exponents of the lengths, in units in which e^{κL} = φ² reads
    "L counts for one φ²": 2(s + c) + 2L = 2s exactly when c = −L
    (`L5_lengths`); −(s − L) − L = −s and (s − L) + L = s (`L5_coordinate`).
  * det(A − I) = −16 (`L5_det`), and integers a, b with (a, b)·(A − I) =
    (12a + 8b, 8a + 4b) = (0, 0) are both 0 (`L5_no_winding`).
  * In the integer model of the quaternions, with 2w = 1 + i + j + k:
    (2w)³ = −8 and (−2w)³ = 8 (`L5_w_cubed`); (−1)³ = −1, (−1)⁶ = 1 and
    1³ = 1 (`L5_six_steps`).

  What is not certified: the cited statements (Segal; Hatcher; Nicolaescu);
  M1's results; anything about continuity, exponentials, logarithms, real or
  complex numbers, bundles, lifts, sections or states: only the integer
  arithmetic written here is certified.
-/

namespace M2L5

/-- 2 × 2 integer matrices as (a, b, c, d) = [[a, b], [c, d]]. -/
abbrev Mat := Int × Int × Int × Int

def mmul (x y : Mat) : Mat :=
  let (a, b, c, d) := x
  let (e, f, g, h) := y
  (a * e + b * g, a * f + b * h, c * e + d * g, c * f + d * h)

def det (x : Mat) : Int :=
  let (a, b, c, d) := x
  a * d - b * c

def M0 : Mat := (2, 1, 1, 1)
def A : Mat := (13, 8, 8, 5)

theorem L5_A_is_M0_cubed : mmul (mmul M0 M0) M0 = A := by decide

theorem L5_M0_commutes_A : mmul M0 A = mmul A M0 := by decide

theorem L5_M0_symmetric : M0.2.1 = M0.2.2.1 := by decide

/-- L and 2L are not multiples of 3L; 3L is. -/
theorem L5_step_times : 1 % 3 ≠ 0 ∧ 2 % 3 ≠ 0 ∧ 3 % 3 = 0 := by decide

/-- M0 on the half-lattice: the corner (m/2, n/2) is written (m, n) with
    m, n modulo two. -/
def corner (c : Nat × Nat) : Nat × Nat := ((2 * c.1 + c.2) % 2, (c.1 + c.2) % 2)

theorem L5_corners :
    corner (0, 0) = (0, 0) ∧ corner (1, 0) = (0, 1) ∧ corner (0, 1) = (1, 1)
      ∧ corner (1, 1) = (1, 0) := by
  decide

/-- The corners P1, P2, P3, P4 as 0, 1, 2, 3; the step carries P_i to P_{σ i}. -/
def σ : Fin 4 → Fin 4
  | 0 => 0
  | 1 => 2
  | 2 => 3
  | 3 => 1

/-- The doubled coordinates of the corners P1, P2, P3, P4. -/
def coords : Fin 4 → Nat × Nat
  | 0 => (0, 0)
  | 1 => (1, 0)
  | 2 => (0, 1)
  | 3 => (1, 1)

/-- σ is the permutation that M0 gives on the corners; it has order three,
    leaves P1 in place and moves P2, P3, P4. -/
theorem L5_cycle :
    (∀ i : Fin 4, corner (coords i) = coords (σ i))
      ∧ (∀ i : Fin 4, σ (σ (σ i)) = i) ∧ σ 0 = 0
      ∧ (∀ i : Fin 4, i ≠ 0 → σ i ≠ i ∧ σ (σ i) ≠ i) := by
  decide

/-- A sign pattern on the four corners: `true` for +1, `false` for −1. -/
abbrev Pattern := Bool × Bool × Bool × Bool

def at_ (p : Pattern) : Fin 4 → Bool
  | 0 => p.1
  | 1 => p.2.1
  | 2 => p.2.2.1
  | 3 => p.2.2.2

/-- The pattern pulled back by the step: at P_i, the sign at P_{σ i}. -/
def pull (p : Pattern) : Pattern := (at_ p (σ 0), at_ p (σ 1), at_ p (σ 2), at_ p (σ 3))

def neg (p : Pattern) : Pattern := (!p.1, !p.2.1, !p.2.2.1, !p.2.2.2)

/-- One sign −1, at P2, at P3, at P4. -/
def odd2 : Pattern := (true, false, true, true)
def odd3 : Pattern := (true, true, false, true)
def odd4 : Pattern := (true, true, true, false)

theorem L5_patterns :
    pull odd2 = odd4 ∧ pull odd3 = odd2 ∧ pull odd4 = odd3
      ∧ pull (pull (pull odd2)) = odd2 ∧ pull (pull (pull odd3)) = odd3
      ∧ pull (pull (pull odd4)) = odd4
      ∧ pull odd2 ≠ odd2 ∧ pull odd2 ≠ neg odd2
      ∧ pull odd3 ≠ odd3 ∧ pull odd3 ≠ neg odd3
      ∧ pull odd4 ≠ odd4 ∧ pull odd4 ≠ neg odd4
      ∧ pull (pull odd2) ≠ odd2 ∧ pull (pull odd2) ≠ neg odd2
      ∧ pull (pull odd3) ≠ odd3 ∧ pull (pull odd3) ≠ neg odd3
      ∧ pull (pull odd4) ≠ odd4 ∧ pull (pull odd4) ≠ neg odd4
      ∧ odd2 ≠ odd3 ∧ odd2 ≠ neg odd3 ∧ odd2 ≠ odd4 ∧ odd2 ≠ neg odd4
      ∧ odd3 ≠ odd4 ∧ odd3 ≠ neg odd4 := by
  and_intros <;> decide

/-- The product of the four signs is −1: an odd number of `false`. -/
def prodMinus (p : Pattern) : Bool := xor (xor p.1 p.2.1) (xor p.2.2.1 p.2.2.2)

def allPatterns : List Pattern :=
  [true, false].flatMap fun a => [true, false].flatMap fun b =>
    [true, false].flatMap fun c => [true, false].map fun d => (a, b, c, d)

theorem L5_fixed_patterns :
    (allPatterns.filter prodMinus).length = 8
      ∧ (allPatterns.filter fun p => prodMinus p && pull p == p)
          = [(true, false, false, false), (false, true, true, true)] := by
  decide

/-- Z[φ] as pairs (a, b) = a + bφ, with φ² = φ + 1. -/
def gmul (p q : Int × Int) : Int × Int :=
  (p.1 * q.1 + p.2 * q.2, p.1 * q.2 + p.2 * q.1 + p.2 * q.2)

def gadd (p q : Int × Int) : Int × Int := (p.1 + q.1, p.2 + q.2)
def gsc (n : Int) (p : Int × Int) : Int × Int := (n * p.1, n * p.2)

def phi : Int × Int := (0, 1)

/-- φ² = 1 + φ and (2 − φ)(1 + φ) = 1. -/
theorem L5_phi_two : gmul phi phi = (1, 1) ∧ gmul (2, -1) (1, 1) = (1, 0) := by decide

/-- M0 acting on a vector with entries in Z[φ]. -/
def M0act (v : (Int × Int) × (Int × Int)) : (Int × Int) × (Int × Int) :=
  (gadd (gsc 2 v.1) v.2, gadd v.1 v.2)

/-- v₁ = (φ, 1) and v₂ = S v₁ = (1, −φ), up to their length. -/
def v1 : (Int × Int) × (Int × Int) := ((0, 1), (1, 0))
def v2 : (Int × Int) × (Int × Int) := ((1, 0), (0, -1))

theorem L5_eigen_v1 : M0act v1 = (gmul (1, 1) v1.1, gmul (1, 1) v1.2) := by decide

theorem L5_eigen_v2 : M0act v2 = (gmul (2, -1) v2.1, gmul (2, -1) v2.2) := by decide

/-- The exponent of the lengths after the map (p, s) ↦ (M0 p, s + c), against
    the exponent before it: they agree exactly when c = −L. -/
theorem L5_lengths (s c L : Int) : 2 * (s + c) + 2 * L = 2 * s ↔ c = -L := by
  constructor <;> intro h <;> omega

theorem L5_coordinate (s L : Int) : -(s - L) - L = -s ∧ (s - L) + L = s := by
  constructor <;> omega

theorem L5_det : det (13 - 1, 8, 8, 5 - 1) = -16 := by decide

theorem L5_no_winding (a b : Int) (h1 : 12 * a + 8 * b = 0) (h2 : 8 * a + 4 * b = 0) :
    a = 0 ∧ b = 0 := by
  constructor <;> omega

/-- Integer quaternions (a, b, c, d) = a + bi + cj + dk. -/
abbrev Quat := Int × Int × Int × Int

def qmul (p q : Quat) : Quat :=
  let (a, b, c, d) := p
  let (e, f, g, h) := q
  (a * e - b * f - c * g - d * h,
   a * f + b * e + c * h - d * g,
   a * g - b * h + c * e + d * f,
   a * h + b * g - c * f + d * e)

theorem L5_w_cubed :
    qmul (qmul (1, 1, 1, 1) (1, 1, 1, 1)) (1, 1, 1, 1) = (-8, 0, 0, 0)
      ∧ qmul (qmul (-1, -1, -1, -1) (-1, -1, -1, -1)) (-1, -1, -1, -1) = (8, 0, 0, 0) := by
  decide

theorem L5_six_steps : (-1 : Int) ^ 3 = -1 ∧ (-1 : Int) ^ 6 = 1 ∧ (1 : Int) ^ 3 = 1 := by
  decide

end M2L5
