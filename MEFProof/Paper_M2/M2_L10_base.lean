/-
  M2_L10_base.lean — Paper M2, card S14c: the base and the whole geometry.
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the counts used in Proposition `prop:wholesupply`
  (write-up log M2-W154), part (i), and two further counts that no
  entry uses (`L10_types_sum`, `L10_rank`).

  * The base, the projective plane (real dimension 4) with the sphere (real
    dimension 2), has complex dimension 3 (`L10_base_dim`).
  * The number of ways of taking q of 3 things is 1, 3, 3, 1 for q = 0, 1,
    2, 3 and 0 for q = 4: the ranks of the forms of type (0,q) of the base,
    and that there is none of type (0,4) (`L10_types`).
  * These ranks add up to 8 (`L10_types_sum`).
  * With rank 2 along the fibre and rank 4 on time and space, the product of
    the three ranks is 64 = 2^6, and 6 is half of 12 (`L10_rank`).

  What is NOT certified: that the forms of type (0,q) have these ranks (it is
  the standard count, taken in the text); the operator of the base itself;
  that it does not depend on a basis; that it commutes with the fold, with
  the multipliers and with the lifts of the step. These are hand steps of
  the proof (M2-W160, M2-W156, M2-W161).
-/

namespace M2L10

/-- `choose n k`: the number of ways of taking `k` of `n` things. -/
def choose : Nat → Nat → Nat
  | _, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, k + 1 => choose n k + choose n (k + 1)

theorem L10_base_dim : 4 / 2 + 2 / 2 = 3 := by decide

theorem L10_types :
    [choose 3 0, choose 3 1, choose 3 2, choose 3 3, choose 3 4] = [1, 3, 3, 1, 0] := by
  decide

theorem L10_types_sum : choose 3 0 + choose 3 1 + choose 3 2 + choose 3 3 = 8 := by decide

theorem L10_rank : 2 * 4 * 8 = 64 ∧ 64 = 2 ^ 6 ∧ 12 / 2 = 6 := by decide

end M2L10
