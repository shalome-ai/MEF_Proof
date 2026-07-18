/-
================================================================
P4_R6_microstate.lean
================================================================
Paper 4, Step 8 certificate (R6: eq:holonomyphase, the squared
pairing eq:squaredpairing, lem:telescoping, eq:cornersum), under
Ruling 7(a).

The analytic steps of the section (heat kernel, Mellin/Eichler
integral, differentiation of the improper integral) are external
analysis and are not Lean objects here; what the section rests on
arithmetically is certified:

  (1) holonomy_phases : (−1)^{3mn} = (−1)^{mn} on {0,1}², with
      phases (+1, +1, +1, −1) at the four corners and product −1
      (the Atiyah–Bott signature for degree 3) — eq:holonomyphase.
  (2) bracket_two     : the holonomy-weighted corner bracket
      (+1) + (+1) + (+1) + (−1) = 2 — the 3+1 structure at trace
      level (eq:cornersum; rem:holonomyprefactor).
  (3) squared_pairing : with eigenvalues doubled to clear
      denominators (2μ_m⁺ = 2m + 3, 2μ_m⁻ = −2m + 1, over ℤ),
      (2μ_m⁺)² = (2μ_{m+2}⁻)² for ALL m — the chiral pairing
      eq:squaredpairing, proved in general.
  (4) survivors       : the two unmatched modes are m = 0, 1 of
      the negative tower, both with doubled square 1 (undoubled:
      1/4), and every doubled square of the positive tower is
      ≥ 9 — so the survivors lie strictly below the paired range
      and the telescoping leaves exactly the doublet, coefficient
      2 (lem:telescoping's constant −2e^{−t/4} per corner).
  (5) telescoping_list : finite-window certification of the
      cancellation as a list identity — the negative-tower squared
      list to depth N + 2 equals [1, 1] followed by the
      positive-tower squared list to depth N (checked at N = 8 by
      kernel computation).
  (6) corner_total    : bracket × per-corner coefficient:
      2 · (−2) = −4 (eq:cornersumresult).

Status target: CERT — core Lean 4.15.0, no Mathlib, no axioms,
no `sorry`.
Build:  lean P4_R6_microstate.lean
================================================================
-/

namespace P4R6

/-! ### (1)–(2) Holonomy phases and the corner bracket -/

/-- The corner phase (−1)^{mn} as an integer, m, n ∈ {0, 1}. -/
def phase (m n : Int) : Int := (-1) ^ (m * n).toNat

/-- eq:holonomyphase at the four corners: (−1)^{3mn} = (−1)^{mn},
    with values (+1, +1, +1, −1); the product of the four local
    actions is −1. -/
theorem holonomy_phases :
    ((-1 : Int) ^ ((3 * (0*0) : Int)).toNat = phase 0 0 ∧
     (-1 : Int) ^ ((3 * (1*0) : Int)).toNat = phase 1 0 ∧
     (-1 : Int) ^ ((3 * (0*1) : Int)).toNat = phase 0 1 ∧
     (-1 : Int) ^ ((3 * (1*1) : Int)).toNat = phase 1 1) ∧
    (phase 0 0 = 1 ∧ phase 1 0 = 1 ∧ phase 0 1 = 1 ∧
     phase 1 1 = -1) ∧
    phase 0 0 * phase 1 0 * phase 0 1 * phase 1 1 = -1 := by
  decide

/-- eq:cornersum bracket: the holonomy-weighted corner sum is
    3 · (+1) + 1 · (−1) = 2 — the 3+1 structure at trace level. -/
theorem bracket_two :
    phase 0 0 + phase 1 0 + phase 0 1 + phase 1 1 = 2 := by
  decide

/-! ### (3) The chiral pairing, in general -/

/-- Doubled positive-chirality eigenvalue: 2μ_m⁺ = 2m + 3. -/
def muPlus2 (m : Nat) : Int := 2 * (m : Int) + 3

/-- Doubled negative-chirality eigenvalue: 2μ_m⁻ = −2m + 1. -/
def muMinus2 (m : Nat) : Int := -(2 * (m : Int)) + 1

/-- eq:squaredpairing, proved for all m: the m-th positive mode
    and the (m+2)-th negative mode have equal squares, indeed
    2μ_m⁺ = −(2μ_{m+2}⁻). -/
theorem squared_pairing (m : Nat) :
    muPlus2 m = -(muMinus2 (m + 2)) ∧
    muPlus2 m * muPlus2 m = muMinus2 (m + 2) * muMinus2 (m + 2) := by
  constructor
  · unfold muPlus2 muMinus2
    push_cast
    omega
  · have h : muPlus2 m = -(muMinus2 (m + 2)) := by
      unfold muPlus2 muMinus2
      push_cast
      omega
    rw [h, Int.neg_mul_neg]

/-! ### (4) The survivors -/

/-- The two unmatched negative-tower modes, m = 0 and m = 1, have
    doubled eigenvalues +1 and −1: both squares equal 1 (the
    undoubled square 1/4 — the exponent of e^{−t/4}). -/
theorem survivors :
    muMinus2 0 = 1 ∧ muMinus2 1 = -1 ∧
    muMinus2 0 * muMinus2 0 = 1 ∧
    muMinus2 1 * muMinus2 1 = 1 := by
  decide

/-- Every positive-tower doubled square is at least 9: the
    survivors (square 1) lie strictly below the paired range, so
    no positive mode cancels them. -/
theorem positive_tower_bound (m : Nat) :
    9 ≤ muPlus2 m * muPlus2 m := by
  unfold muPlus2
  have h3 : (3 : Int) ≤ 2 * (m : Int) + 3 := by omega
  have h0 : (0 : Int) ≤ 3 := by omega
  calc (9 : Int) = 3 * 3 := by omega
    _ ≤ (2 * (m : Int) + 3) * 3 := Int.mul_le_mul_of_nonneg_right h3 h0
    _ ≤ (2 * (m : Int) + 3) * (2 * (m : Int) + 3) :=
        Int.mul_le_mul_of_nonneg_left h3 (by omega)

/-! ### (5) Finite-window telescoping as a list identity -/

/-- Positive-tower doubled squares to depth N. -/
def plusList (N : Nat) : List Int :=
  (List.range N).map (fun m => muPlus2 m * muPlus2 m)

/-- Negative-tower doubled squares to depth N. -/
def minusList (N : Nat) : List Int :=
  (List.range N).map (fun m => muMinus2 m * muMinus2 m)

/-- lem:telescoping at window N = 8: the negative-tower list to
    depth 10 is exactly [1, 1] followed by the positive-tower list
    to depth 8 — every positive mode cancels the mode two steps up
    the negative tower, leaving precisely the doublet. -/
theorem telescoping_list :
    minusList 10 = [1, 1] ++ plusList 8 := by
  decide

/-! ### (6) The corner total -/

/-- eq:cornersumresult: bracket × per-corner coefficient,
    2 · (−2) = −4. -/
theorem corner_total :
    (phase 0 0 + phase 1 0 + phase 0 1 + phase 1 1) * (-2) = -4 := by
  decide

end P4R6
