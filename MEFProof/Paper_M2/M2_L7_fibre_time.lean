/-
  M2_L7_fibre_time.lean — Paper M2, card S14b: the fibre at every time, the
  join and the step.
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and integer content of Proposition
  `prop:fibretime` (write-up log M2-W118) and of its proof (M2-W125, which
  replaced M2-W120 at Decision Log P243, M2-W121 and M2-W122; `L7_twenty`,
  `L7_moved_thrice` and `L7_moved_signs` are named in no statement;
  `L7_moved_signs` holds by unfolding the definition of `moved`).

  * Over the integers, a matrix J = [[p, q], [r, s]] commutes with
    M0 = [[2, 1], [1, 1]] exactly when r = q and s = p − q (`L7_commutant`);
    the first entry of the square of [[p, q], [q, p − q]] is p·p + q·q
    (`L7_square_entry`), and p·p + q·q is not −1 (`L7_not_minus_one`).
  * M0 leaves the corner P1 in place and carries P2 to P3, P3 to P4 and P4 to
    P2, the corners being written as twice their coordinates modulo two
    (`L7_corners`).
  * For a divisor [a1, a2, a3, a4] on the corners, the moved divisor, which has
    at P_i the integer of the divisor at M0 P_i, is [a1, a3, a4, a2]. For the
    twenty divisors of flux three: the moved divisor has flux three
    (`L7_moved_flux`); moved three times, a divisor is itself
    (`L7_moved_thrice`); the signs (−1)^a of the moved divisor at P_i are those
    of the divisor at M0 P_i (`L7_moved_signs`); and 3P4 is moved to 3P3, 3P3
    to 3P2, 3P2 to 3P4 (`L7_chain`).
  * M0³ = [[13, 8], [8, 5]], and M0 commutes with it (`L7_cube`).

  What is not certified: anything for real entries (the hand step of the
  write-up log says it for them); anything about complex structures,
  coordinates, functions, sections, frames, holomorphy, the operator of
  M2-W105, the lifts as maps, the join or the step as maps: only the integer
  arithmetic and the finite lists written here.
  The theorems are named `L7_…` in the namespace `M2L7`; M1's own certificate
  M1_L7_onedrive has theorems named `L7_…` too, and they are other theorems.
-/

namespace M2L7

/-- A 2×2 integer matrix [[a, b], [c, d]] as a tuple. -/
abbrev Mat := Int × Int × Int × Int

def mul (A B : Mat) : Mat :=
  (A.1 * B.1 + A.2.1 * B.2.2.1, A.1 * B.2.1 + A.2.1 * B.2.2.2,
   A.2.2.1 * B.1 + A.2.2.2 * B.2.2.1, A.2.2.1 * B.2.1 + A.2.2.2 * B.2.2.2)

def M0 : Mat := (2, 1, 1, 1)

/-- J commutes with M0 exactly when r = q and s = p − q. -/
theorem L7_commutant (p q r s : Int) :
    mul M0 (p, q, r, s) = mul (p, q, r, s) M0 ↔ (r = q ∧ s = p - q) := by
  simp only [mul, M0, Prod.mk.injEq]
  omega

/-- The first entry of the square of [[p, q], [q, p − q]]. -/
theorem L7_square_entry (p q : Int) :
    (mul (p, q, q, p - q) (p, q, q, p - q)).1 = p * p + q * q := by
  simp [mul]

theorem sq_nonneg (p : Int) : 0 ≤ p * p := by
  rcases Int.le_total 0 p with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -p := Int.neg_nonneg_of_nonpos h
    have := Int.mul_nonneg h' h'
    rwa [Int.neg_mul_neg] at this

/-- p·p + q·q is not −1. -/
theorem L7_not_minus_one (p q : Int) : p * p + q * q ≠ -1 := by
  have h1 := sq_nonneg p
  have h2 := sq_nonneg q
  omega

/-- The corners P1..P4 as twice their coordinates. -/
def corners : List (Nat × Nat) := [(0, 0), (1, 0), (0, 1), (1, 1)]

/-- M0 on a corner, modulo two. -/
def step (c : Nat × Nat) : Nat × Nat := ((2 * c.1 + c.2) % 2, (c.1 + c.2) % 2)

theorem L7_corners : corners.map step = [(0, 0), (0, 1), (1, 1), (1, 0)] := by decide

/-- The moved divisor: at P_i the integer of the divisor at M0 P_i. -/
def moved (a : List Nat) : List Nat :=
  [a.getD 0 0, a.getD 2 0, a.getD 3 0, a.getD 1 0]

def divisors : List (List Nat) :=
  (List.range 4).flatMap fun a =>
  (List.range 4).flatMap fun b =>
  (List.range 4).flatMap fun c =>
  (List.range 4).filterMap fun e =>
    if a + b + c + e = 3 then some [a, b, c, e] else none

def flux (a : List Nat) : Nat := a.foldl (· + ·) 0

def sgn (a : Nat) : Int := if a % 2 = 0 then 1 else -1

theorem L7_twenty : divisors.length = 20 := by decide

theorem L7_moved_flux : divisors.all (fun a => flux (moved a) == 3) = true := by decide

theorem L7_moved_thrice : divisors.all (fun a => moved (moved (moved a)) == a) = true := by
  decide

/-- The signs of the moved divisor at P1..P4 are those of the divisor at
    M0 P1 = P1, M0 P2 = P3, M0 P3 = P4, M0 P4 = P2. -/
theorem L7_moved_signs :
    divisors.all (fun a =>
      (moved a).map sgn == [sgn (a.getD 0 0), sgn (a.getD 2 0), sgn (a.getD 3 0), sgn (a.getD 1 0)])
      = true := by
  decide

theorem L7_chain :
    moved [0, 0, 0, 3] = [0, 0, 3, 0] ∧ moved [0, 0, 3, 0] = [0, 3, 0, 0]
      ∧ moved [0, 3, 0, 0] = [0, 0, 0, 3] := by
  decide

theorem L7_cube :
    mul M0 (mul M0 M0) = (13, 8, 8, 5) ∧ mul M0 (13, 8, 8, 5) = mul (13, 8, 8, 5) M0 := by
  decide

end M2L7
