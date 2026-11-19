/-
  M2_L9_five_time.lean — Paper M2, card S14b2b: the five divisors together in
  time.
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and integer content of the proof of
  Proposition `prop:fivetime` (write-up log M2-W140; its proof M2-W147 and
  M2-W148, which replaced M2-W141 and M2-W142 at Decision Log P251).

  * A divisor on the corners is a list [a1, a2, a3, a4] of integers. With the
    divisors of ℘ − e_k (2P_k − 2P_1, k = 2, 3, 4) and of ℘′
    (P_2 + P_3 + P_4 − 3P_1) written in by hand from the write-up log
    (M2-W113):
    - adding the corner P_k to the corners P_1, P_2, P_3, P_4, as points
      (m/2, n/2) with m, n modulo 2, exchanges P_1 with P_k and the other two
      corners with one another (`L9_translate`);
    - the divisor of ℘ − e_k moved by that exchange, added to the divisor of
      ℘ − e_k, is zero (`L9_product_zero`);
    - twice the divisor of ℘′, less the divisors of ℘ − e_2, ℘ − e_3 and
      ℘ − e_4, is zero (`L9_square_zero`);
    - twice the divisor P_1 + P_2 + P_3 − 3P_4 is the sum of the divisors of
      ℘ − e_2 and ℘ − e_3 less three times that of ℘ − e_4
      (`L9_fifth_square`).
  * The identity (2(k+1)+1)² = (2(k+1)−1)² + 8(k+1) of whole numbers
    (`L9_shell`), which the count 8(k + 1) of the integer points (m, n) with
    max(|m|, |n|) = k + 1 uses; the count itself is not certified; and (k+1)·k ≤ (k+1)²
    (`L9_tail`), which is what the comparison 1/(k+1)² ≤ 1/k − 1/(k+1) uses.
  * The arithmetic of the constant of one bound, as integers:
    4·1 + 4·3 + 2·3 + 1 = 23 and 2·23 = 46 (`L9_const`).

  What is not certified: anything for real or complex numbers; anything about
  functions, series, convergence, limits, derivatives, lattices, sections,
  frames, the join or isomorphisms: only the integer arithmetic and the
  finite lists written here. That the lists are the divisors of the functions
  named is M2-W113 and is not certified. The hand steps of the write-up log
  say the rest.
-/

namespace M2L9

/-- A divisor on the four corners, [a1, a2, a3, a4]. -/
abbrev Div := List Int

def add (d e : Div) : Div := List.zipWith (· + ·) d e
def smul (c : Int) (d : Div) : Div := d.map (c * ·)
def zero : Div := [0, 0, 0, 0]

/-- The divisor of ℘ − e_k, k = 2, 3, 4: 2P_k − 2P_1 (from M2-W113). -/
def wpe : Nat → Div
  | 2 => [-2, 2, 0, 0]
  | 3 => [-2, 0, 2, 0]
  | 4 => [-2, 0, 0, 2]
  | _ => zero

/-- The divisor of ℘′: P_2 + P_3 + P_4 − 3P_1 (from M2-W113). -/
def wpd : Div := [-3, 1, 1, 1]

/-- The corners as points (m/2, n/2), m, n modulo 2: P1, P2, P3, P4. -/
def corner : Nat → Nat × Nat
  | 1 => (0, 0)
  | 2 => (1, 0)
  | 3 => (0, 1)
  | _ => (1, 1)

def index (c : Nat × Nat) : Nat :=
  if c = (0, 0) then 1 else if c = (1, 0) then 2 else if c = (0, 1) then 3 else 4

/-- The corner that P_i + P_k is. -/
def shift (k i : Nat) : Nat :=
  index (((corner i).1 + (corner k).1) % 2, ((corner i).2 + (corner k).2) % 2)

theorem L9_translate :
    [1, 2, 3, 4].map (shift 2) = [2, 1, 4, 3] ∧
    [1, 2, 3, 4].map (shift 3) = [3, 4, 1, 2] ∧
    [1, 2, 3, 4].map (shift 4) = [4, 3, 2, 1] := by decide

/-- A divisor moved by the exchange of `L9_translate` for the corner P_k. -/
def moved (k : Nat) (d : Div) : Div :=
  [1, 2, 3, 4].map (fun i => d.getD (shift k i - 1) 0)

theorem L9_product_zero :
    [2, 3, 4].all (fun k => add (moved k (wpe k)) (wpe k) == zero) = true := by
  decide

theorem L9_square_zero :
    add (smul 2 wpd) (smul (-1) (add (wpe 2) (add (wpe 3) (wpe 4)))) = zero := by
  decide

theorem L9_fifth_square :
    smul 2 [1, 1, 1, -3] = add (wpe 2) (add (wpe 3) (smul (-3) (wpe 4))) := by
  decide

theorem L9_shell (k : Nat) :
    (2 * (k + 1) + 1) * (2 * (k + 1) + 1)
      = (2 * (k + 1) - 1) * (2 * (k + 1) - 1) + 8 * (k + 1) := by
  have h : 2 * (k + 1) - 1 = 2 * k + 1 := by omega
  rw [h]
  have e1 : (2 * (k + 1) + 1) * (2 * (k + 1) + 1) = 4 * (k * k) + 12 * k + 9 := by
    simp only [Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.one_mul]
    have : 2 * k * (2 * k) = 4 * (k * k) := by
      rw [Nat.mul_mul_mul_comm]
    omega
  have e2 : (2 * k + 1) * (2 * k + 1) = 4 * (k * k) + 4 * k + 1 := by
    simp only [Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.one_mul]
    have : 2 * k * (2 * k) = 4 * (k * k) := by
      rw [Nat.mul_mul_mul_comm]
    omega
  rw [e1, e2]; omega

theorem L9_tail (k : Nat) : (k + 1) * k ≤ (k + 1) * (k + 1) :=
  Nat.mul_le_mul_left (k + 1) (Nat.le_succ k)

theorem L9_const : 4 * 1 + 4 * 3 + 2 * 3 + 1 = 23 ∧ 2 * 23 = 46 := by decide

end M2L9
