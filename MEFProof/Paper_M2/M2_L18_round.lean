/-
  M2_L18_round.lean — Paper M2, chat C14, card T3b (Decision Log P303): the
  matrix once round the time circle, proved, and the finite part of the list
  of candidates with a rule along time.
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and the integer parts.

  * The two names of a point.  A = M₀³ = [[13, 8], [8, 5]] and
    Q = [[5, −8], [−8, 13]] are inverse to each other (`L18_inverse`), and
    the two entries of Q off the diagonal are even (`L18_even`).
  * The numbers of the two thirds of a period.  With q₁₁ = 5, q₂₁ = −8,
    q₁₂ = −8, q₂₂ = 13: −q₁₁q₂₁ = 40 = 6·6 + 4 and −q₁₂q₂₂ = 104 = 6·17 + 2,
    so that the two numbers of the proof are the cube roots of one ζ² and ζ;
    and, for the maps U and V of the proof, whose cubes are the identity,
    the exponents 5, −8, 13 and the products 40, 104 reduce modulo three to
    2, 1, 1 and 1, 2 (`L18_residues`).
  * The matrix.  Writing an entry ζ^e by its exponent e modulo three, the
    table [[0, 1, 1], [2, 2, 1], [2, 1, 2]] of the matrix 𝒞 obeys the two
    rules of the proof,
        e(k, m) = e(k, m−1) + 2m − k − 1,    e(k+1, m) = e(k, m−1) + m + 1,
    for all k and m modulo three (`L18_rules`); and the table made from the
    two rules alone, begun with e(0, 0) = 0, is that table (`L18_table`).
  * The list.  The fourteen numbers of a candidate with a rule along time
    fall into four groups of four, four, five and one, by whether the form
    has dz̄ and by its sign under the lift of the fold (`L18_groups`); the
    twelve old terms and the three new ones are fifteen, and the eleven old
    forms and the three new ones fourteen (`L18_count`).
  * The ladder.  For n < 16, twice the sum of n−1−k over k from 0 to n−1 is
    n(n−1) (`L18_ladder`).

  What is not certified: that the series are carried as the proof says (the
  calculus is in the write-up log, by hand, and in
  `papers/M2/checks/T3b_candidates.py`, numerically and, for the algebra of
  the operation along the fibre, exactly); the rank fourteen of the fifteen
  terms (exact, in the script); and no statement about solutions.
-/

namespace MEFProof.Paper_M2.L18

def mul2 (a b : List (List Int)) : List (List Int) :=
  match a, b with
  | [[a11, a12], [a21, a22]], [[b11, b12], [b21, b22]] =>
      [[a11 * b11 + a12 * b21, a11 * b12 + a12 * b22], [a21 * b11 + a22 * b21, a21 * b12 + a22 * b22]]
  | _, _ => []

def A : List (List Int) := [[13, 8], [8, 5]]
def Q : List (List Int) := [[5, -8], [-8, 13]]

theorem L18_inverse : mul2 A Q = [[1, 0], [0, 1]] ∧ mul2 Q A = [[1, 0], [0, 1]] := by decide

theorem L18_even : (-8 : Int) % 2 = 0 := by decide

theorem L18_residues :
    (-(5 * (-8)) : Int) = 6 * 6 + 4 ∧ (-((-8) * 13) : Int) = 6 * 17 + 2
    ∧ (5 : Int) % 3 = 2 ∧ (-8 : Int) % 3 = 1 ∧ (13 : Int) % 3 = 1
    ∧ (-(5 * (-8)) : Int) % 3 = 1 ∧ (-((-8) * 13) : Int) % 3 = 2 := by decide

/-- the exponents of the matrix once round, modulo three -/
def E (k m : Nat) : Nat :=
  match k % 3, m % 3 with
  | 0, 0 => 0 | 0, 1 => 1 | 0, 2 => 1
  | 1, 0 => 2 | 1, 1 => 2 | 1, 2 => 1
  | 2, 0 => 2 | 2, 1 => 1 | _, _ => 2

/-- the two rules, with every index and exponent kept non-negative by adding threes -/
def rule1 (k m : Nat) : Bool := E k m % 3 == (E k (m + 2) + 2 * m + 2 * k + 2) % 3
def rule2 (k m : Nat) : Bool := E (k + 1) m % 3 == (E k (m + 2) + m + 1) % 3

theorem L18_rules :
    (List.range 3).all (fun k => (List.range 3).all (fun m => rule1 k m && rule2 k m)) = true := by decide

/-- the table made from the two rules alone, begun with the exponent 0 at (0, 0) -/
def row0 : List Nat := [0, (0 + 2 * 1 + 2 * 0 + 2) % 3, ((0 + 2 * 1 + 2 * 0 + 2) % 3 + 2 * 2 + 2 * 0 + 2) % 3]
def next (r : List Nat) : List Nat :=
  [(r.getD 2 0 + 0 + 1) % 3, (r.getD 0 0 + 1 + 1) % 3, (r.getD 1 0 + 2 + 1) % 3]

theorem L18_table :
    row0 = [0, 1, 1] ∧ next row0 = [2, 2, 1] ∧ next (next row0) = [2, 1, 2]
    ∧ next (next (next row0)) = row0 := by decide

/-- a form of the display: has it dz̄, and is it left unchanged (true) or reversed by the lift of the fold -/
def forms : List (Bool × Bool) :=
  [ (false, true), (false, true), (false, true), (false, true),      -- ψ′, d_Σψ′, d_Bψ′, 𝒯ψ′
    (false, false), (false, false), (false, false), (false, false),  -- ψ″, d_Σψ″, d_Bψ″, 𝒯ψ″
    (true, true), (true, true), (true, true), (true, true), (true, true),  -- dz̄∧ψ″, dz̄∧d_Σψ″, dz̄∧d_Bψ″, dz̄∧𝒯ψ″, dz̄∧δψ′
    (true, false) ]                                                  -- dz̄∧δψ″

theorem L18_groups :
    (forms.filter (fun f => f == (false, true))).length = 4
    ∧ (forms.filter (fun f => f == (false, false))).length = 4
    ∧ (forms.filter (fun f => f == (true, true))).length = 5
    ∧ (forms.filter (fun f => f == (true, false))).length = 1
    ∧ forms.length = 14 := by decide

theorem L18_count : 12 + 3 = 15 ∧ 11 + 3 = 14 := by decide

def ladder (n : Nat) : Nat := ((List.range n).map (fun k => n - 1 - k)).foldl (· + ·) 0

theorem L18_ladder : (List.range 16).all (fun n => 2 * ladder n == n * (n - 1)) = true := by decide

end MEFProof.Paper_M2.L18
