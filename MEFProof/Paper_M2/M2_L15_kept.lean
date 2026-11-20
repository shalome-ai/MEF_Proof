/-
  M2_L15_kept.lean — Paper M2, card T4a: the candidates that the maps keep
  (chat C11).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the integer part of card T4a.

  * The vector fields e₁, e₂, e₃ that left translation makes from i, j, k on
    the unit quaternions are q ↦ qi, qj, qk; as linear maps of ℝ⁴ their
    matrices `m1`, `m2`, `m3` are antisymmetric (`L15_antisym`: the fields are
    tangent to the spheres and are derivatives of rotations) and have trace
    zero (`L15_trace`).
  * q ↦ q(uv − vu) for u, v among i, j, k: the matrices satisfy
    m_b m_a − m_a m_b = 2 m_c for (a, b, c) = (1,2,3), (2,3,1), (3,1,2)
    (`L15_brackets`), which is [e₁,e₂] = 2e₃ and its cyclic images.
  * (−i)² = −1 in the Gaussian integers (`L15_minus_i_sq`).
  * The quarter-turn S fixes the corners P₁ and P₄ and exchanges P₂ and P₃,
    the corners written with doubled coordinates modulo 2 (`L15_S_corners`).
  * Of the divisors a₁P₁+a₂P₂+a₃P₃+a₄P₄ of flux three whose corner signs are
    +,+,+,− there are five; three have a₂ = a₃, and exchanging a₂ and a₃
    carries each of the other two to the other (`L15_divisors`).

  What is not certified: that the matrices are the fields named; the passage
  from the commutator of the matrices, taken in the order m_b m_a − m_a m_b,
  to the bracket of the fields; that an antisymmetric matrix gives a field
  tangent to the spheres and a family of rotations; the forms,
  the maps A, ρ and Φ_R, and the formulas of part (ii); the integrals over the
  sphere and part (iii); anything about bundles, sections or smoothness.
  Those parts are by hand in the write-up log (M2-W203 to M2-W205), with the
  script `papers/M2/checks/T4a_kept.py`.
-/
namespace MEFProof.Paper_M2.L15

abbrev Mat := List (List Int)

/-- Row j holds the coefficients of q₀..q₃ in the j-th component of q·u. -/
def m1 : Mat := [[0, -1, 0, 0], [1, 0, 0, 0], [0, 0, 0, 1], [0, 0, -1, 0]]   -- q ↦ qi
def m2 : Mat := [[0, 0, -1, 0], [0, 0, 0, -1], [1, 0, 0, 0], [0, 1, 0, 0]]   -- q ↦ qj
def m3 : Mat := [[0, 0, 0, -1], [0, 0, 1, 0], [0, -1, 0, 0], [1, 0, 0, 0]]   -- q ↦ qk

def entry (m : Mat) (i j : Nat) : Int := (m.getD i []).getD j 0

def transpose (m : Mat) : Mat :=
  (List.range 4).map (fun i => (List.range 4).map (fun j => entry m j i))

def neg (m : Mat) : Mat := m.map (fun r => r.map (fun x => -x))

def mul (a b : Mat) : Mat :=
  (List.range 4).map (fun i => (List.range 4).map (fun j =>
    ((List.range 4).map (fun k => entry a i k * entry b k j)).foldl (· + ·) 0))

def sub (a b : Mat) : Mat := List.zipWith (List.zipWith (· - ·)) a b
def twice (a : Mat) : Mat := a.map (fun r => r.map (fun x => 2 * x))
def trace (m : Mat) : Int := ((List.range 4).map (fun i => entry m i i)).foldl (· + ·) 0

theorem L15_antisym :
    transpose m1 = neg m1 ∧ transpose m2 = neg m2 ∧ transpose m3 = neg m3 := by decide

theorem L15_trace : trace m1 = 0 ∧ trace m2 = 0 ∧ trace m3 = 0 := by decide

theorem L15_brackets :
    sub (mul m2 m1) (mul m1 m2) = twice m3 ∧
    sub (mul m3 m2) (mul m2 m3) = twice m1 ∧
    sub (mul m1 m3) (mul m3 m1) = twice m2 := by decide

/-- Gaussian integers as pairs (re, im). -/
def gmul (x y : Int × Int) : Int × Int := (x.1 * y.1 - x.2 * y.2, x.1 * y.2 + x.2 * y.1)

theorem L15_minus_i_sq : gmul (0, -1) (0, -1) = (-1, 0) := by decide

/-- The corners with doubled coordinates modulo 2: P₁ = (0,0), P₂ = (1,0),
    P₃ = (0,1), P₄ = (1,1); S(x, y) = (y, −x). -/
def S (p : Int × Int) : Int × Int := (p.2 % 2, (-p.1) % 2)

theorem L15_S_corners :
    S (0, 0) = (0, 0) ∧ S (1, 0) = (0, 1) ∧ S (0, 1) = (1, 0) ∧ S (1, 1) = (1, 1) := by decide

/-- (a₁, a₂, a₃, a₄) with entries 0..3. -/
def all4 : List (Nat × Nat × Nat × Nat) :=
  (List.range 4).flatMap (fun a => (List.range 4).flatMap (fun b =>
    (List.range 4).flatMap (fun c => (List.range 4).map (fun d => (a, b, c, d)))))

/-- Flux three with the corner signs +,+,+,−: a₄ odd and the others even, or
    a₄ even and the others odd. -/
def good (t : Nat × Nat × Nat × Nat) : Bool :=
  let (a, b, c, d) := t
  (a + b + c + d == 3) &&
  ((d % 2 == 1 && a % 2 == 0 && b % 2 == 0 && c % 2 == 0) ||
   (d % 2 == 0 && a % 2 == 1 && b % 2 == 1 && c % 2 == 1))

def five : List (Nat × Nat × Nat × Nat) := all4.filter good

def swap23 (t : Nat × Nat × Nat × Nat) : Nat × Nat × Nat × Nat :=
  let (a, b, c, d) := t
  (a, c, b, d)

theorem L15_divisors :
    five = [(0, 0, 0, 3), (0, 0, 2, 1), (0, 2, 0, 1), (1, 1, 1, 0), (2, 0, 0, 1)] ∧
    five.filter (fun t => swap23 t == t) = [(0, 0, 0, 3), (1, 1, 1, 0), (2, 0, 0, 1)] ∧
    swap23 (0, 0, 2, 1) = (0, 2, 0, 1) ∧ swap23 (0, 2, 0, 1) = (0, 0, 2, 1) := by decide

end MEFProof.Paper_M2.L15
