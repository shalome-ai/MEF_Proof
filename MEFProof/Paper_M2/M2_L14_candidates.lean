/-
  M2_L14_candidates.lean — Paper M2, card T3: the candidates of order zero and
  of order one (chat C10).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite bookkeeping of card T3.

  * The twelve terms ψ, ψ′, ψ″, d_Σψ, d_Σψ′, d_Σψ″, d_Bψ, d_Bψ′, d_Bψ″,
    ∂̄_Fψ, ∂̄_Fψ′, ∂̄_Fψ″ are written on eleven forms (`terms`), and each of
    the eleven forms is written as an integer combination of the twelve terms
    (`slots`); the second followed by the first is the identity on the eleven
    (`L14_terms_from_slots`): the twelve terms span the space of the eleven.
  * With the signs of the lift of the fold on the eleven forms, +1 on ψ′ and
    −1 on ψ″, unchanged by d_Σ and d_B and reversed by δ, the eleven fall into
    four groups of 3, 3, 4 and 1: the conditions (I) to (IV) (`L14_groups`).
  * Over the eight choices of which of the three numbers of order zero are
    zero, the conditions on (ψ′, ψ″) are exactly four (`L14_order_zero`).

  What is not certified: that the terms are the forms named; the action of the
  fold; the degrees and the induction of part (iii); that the eleven numbers
  are determined; anything about bundles, sections or smoothness.  Those parts
  are by hand in the write-up log (M2-W188, M2-W189).
-/
namespace MEFProof.Paper_M2.L14

/-- The eleven forms, in this order:
    0 ψ′, 1 ψ″, 2 d_Σψ′, 3 d_Σψ″, 4 d_Bψ′, 5 d_Bψ″ (no dz̄);
    6 ψ″, 7 d_Σψ″, 8 d_Bψ″, 9 δψ′, 10 δψ″ (the coefficient of dz̄). -/
def unit (i : Nat) : List Int := (List.range 11).map (fun j => if j = i then 1 else 0)

def addv (a b : List Int) : List Int := List.zipWith (· + ·) a b
def subv (a b : List Int) : List Int := List.zipWith (· - ·) a b

/-- The twelve terms on the eleven forms: ψ = ψ′ + dz̄∧ψ″,
    X(dz̄∧u) = −dz̄∧Xu for X = d_Σ, d_B, and ∂̄_Fu = dz̄∧δu. -/
def terms : List (List Int) :=
  [ addv (unit 0) (unit 6),   -- ψ
    unit 0,                   -- ψ′
    unit 1,                   -- ψ″
    subv (unit 2) (unit 7),   -- d_Σψ
    unit 2,                   -- d_Σψ′
    unit 3,                   -- d_Σψ″
    subv (unit 4) (unit 8),   -- d_Bψ
    unit 4,                   -- d_Bψ′
    unit 5,                   -- d_Bψ″
    unit 9,                   -- ∂̄_Fψ
    unit 9,                   -- ∂̄_Fψ′
    unit 10 ]                 -- ∂̄_Fψ″

def tunit (i : Nat) : List Int := (List.range 12).map (fun j => if j = i then 1 else 0)

/-- Each of the eleven forms as an integer combination of the twelve terms. -/
def slots : List (List Int) :=
  [ tunit 1, tunit 2, tunit 4, tunit 5, tunit 7, tunit 8,
    subv (tunit 0) (tunit 1),   -- dz̄∧ψ″ = ψ − ψ′
    subv (tunit 4) (tunit 3),   -- dz̄∧d_Σψ″ = d_Σψ′ − d_Σψ
    subv (tunit 7) (tunit 6),   -- dz̄∧d_Bψ″ = d_Bψ′ − d_Bψ
    tunit 9, tunit 11 ]

def smulv (n : Int) (a : List Int) : List Int := a.map (n * ·)

/-- The combination of the rows of `m` with the coefficients `c`. -/
def comb (c : List Int) (m : List (List Int)) : List Int :=
  (List.zipWith smulv c m).foldl addv (unit 11)

theorem L14_terms_from_slots :
    slots.map (fun c => comb c terms) = (List.range 11).map unit := by decide

/-- (part, sign of the lift of the fold): part 0 has no dz̄, part 1 is the
    coefficient of dz̄. -/
def signs : List (Nat × Int) :=
  [ (0, 1), (0, -1), (0, 1), (0, -1), (0, 1), (0, -1),
    (1, -1), (1, -1), (1, -1), (1, -1), (1, 1) ]

def count (g : Nat × Int) : Nat := (signs.filter (· == g)).length

theorem L14_groups :
    count (0, 1) = 3 ∧ count (0, -1) = 3 ∧ count (1, -1) = 4 ∧ count (1, 1) = 1 ∧
    signs.length = 11 := by decide

/-- For numbers a₀, a₁, a₂ of order zero, given by whether each is not zero:
    (ψ′ = 0 is asked, ψ″ = 0 is asked). -/
def cond (a0 a1 a2 : Bool) : Bool × Bool := (a0, a1 || a2)

def allConds : List (Bool × Bool) :=
  [false, true].flatMap fun a0 => [false, true].flatMap fun a1 =>
    [false, true].map fun a2 => cond a0 a1 a2

theorem L14_order_zero :
    allConds.eraseDups.length = 4 ∧
    (∀ c ∈ [(false, false), (true, false), (false, true), (true, true)], c ∈ allConds) := by
  decide

end MEFProof.Paper_M2.L14
