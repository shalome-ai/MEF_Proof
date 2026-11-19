/-
  M2_L8_time_direction.lean — Paper M2, card S14b2: the direction of time, one
  divisor at a time.
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and integer content of Proposition
  `prop:timedir` (write-up log M2-W128) and of its proof (M2-W135 and
  M2-W136, which replaced M2-W129 and M2-W130 at Decision Log P247;
  `L8_five` and `L8_five_among` are named in no statement).

  * There are twenty divisors [a1, a2, a3, a4] of flux three on the corners
    (`L8_twenty`), and each has a corner with a_i ≠ 0 (`L8_some_corner`).
  * For the five divisors 3P4, 2P1 + P4, 2P2 + P4, 2P3 + P4 and P1 + P2 + P3
    the corners with a_i ≠ 0 are P4; P1 and P4; P2 and P4; P3 and P4; and
    P1, P2 and P3 (`L8_five`); each of the five is among the twenty
    (`L8_five_among`).
  * With integers in the place of the real numbers: for z = u + iv written as
    the pair (u, v), with the derivatives −k·u of u and k·v of v, the pair of
    the derivatives is −k times the pair (u, −v) of the conjugate (`L8_dz`);
    the factor that the power −a brings down, times −k, is a·k
    (`L8_frame_factor`).

  What is not certified: anything for real or complex numbers; anything about
  lengths, vector fields, complex structures, coordinates, functions,
  sections, frames, limits, derivatives, the join or the step as maps: only
  the integer arithmetic and the finite lists written here. The hand steps of
  the write-up log say the rest.
-/

namespace M2L8

/-- A divisor on the four corners, [a1, a2, a3, a4]. -/
abbrev Div := Nat × Nat × Nat × Nat

def flux (d : Div) : Nat := d.1 + d.2.1 + d.2.2.1 + d.2.2.2

/-- The divisors with every a_i at most three and flux three. -/
def divisors : List Div :=
  (List.range 4).flatMap fun a =>
  (List.range 4).flatMap fun b =>
  (List.range 4).flatMap fun c =>
  ((List.range 4).map fun d => (a, b, c, d)).filter fun d => flux d == 3

/-- The corners, numbered 1 to 4, at which the divisor is not 0. -/
def support (d : Div) : List Nat :=
  ([(1, d.1), (2, d.2.1), (3, d.2.2.1), (4, d.2.2.2)].filter
    fun p => p.2 != 0).map fun p => p.1

theorem L8_twenty : divisors.length = 20 := by decide

theorem L8_some_corner : divisors.all (fun d => !(support d).isEmpty) = true := by
  decide

def five : List Div :=
  [(0, 0, 0, 3), (2, 0, 0, 1), (0, 2, 0, 1), (0, 0, 2, 1), (1, 1, 1, 0)]

theorem L8_five :
    five.map support = [[4], [1, 4], [2, 4], [3, 4], [1, 2, 3]] := by decide

theorem L8_five_among : five.all (fun d => divisors.contains d) = true := by
  decide

/-- The pair of the derivatives of (u, v) is −k times the conjugate pair. -/
theorem L8_dz (k u v : Int) : (-k * u, k * v) = (-k * u, -k * -v) := by
  rw [Int.neg_mul_neg]

/-- The factor of the power −a, times −k, is a·k. -/
theorem L8_frame_factor (a k : Int) : -a * -k = a * k := by
  rw [Int.neg_mul_neg]

end M2L8
