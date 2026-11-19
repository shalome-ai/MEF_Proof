/-
  M2_L6_fibre.lean — Paper M2, card S14 (first part): the fibre at one time.
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and integer content of part (iv) of
  Proposition `prop:fibre` (write-up log M2-W106; its proof M2-W107, M2-W113,
  M2-W114 and M2-W110; M2-W113 and M2-W114 replace M2-W108 and M2-W109,
  retired at Decision Log P239).

  * The twenty divisors D = a1 P1 + a2 P2 + a3 P3 + a4 P4 of flux three on the
    corners (M1 Definition 7.4), and for each the lift with two states on the
    pillowcase and its signs, defined as in M2_L2_pillowcase (the count of M1
    Lemma 7.5(b) taken as given).
  * Exactly five of the twenty have, for the lift with two states, the signs
    +1, +1, +1, −1: 3P4, 2P3+P4, 2P2+P4, P1+P2+P3 and 2P1+P4, in the order of
    the list (`L6_five`); for P1+P2+P3 that lift is the second lift, for the
    other four the first (`L6_which_lift`).
  * The four lists `g2`, `g3`, `g4`, `h` are written in by hand from M2-W113,
    which makes them from the cited source (Whittaker and Watson, §20.32), as
    the divisors of ℘ − e2, ℘ − e3, ℘ − e4 and ℘′ : 2Pk − 2P1 and
    P2 + P3 + P4 − 3P1. Each has degree zero
    (`L6_degree_zero`).
  * For each of the five divisors D, the integer identity
      D − 3P4 = c2·g2 + c3·g3 + c4·g4 + ch·h
    with the coefficients of the multiplier that M2-W114 names
    (1; (℘−e3)/(℘−e4); (℘−e2)/(℘−e4); ℘′/(℘−e4)²; 1/(℘−e4))
    (`L6_multipliers`); the coefficient ch of the odd function ℘′ is odd
    exactly when the lift with two states is the second lift (`L6_parity`).

  What is not certified: that ℘ − ek and ℘′ have these divisors, that ℘ is
  even and ℘′ odd (the cited source); M1's Lemma 7.5(b); anything about
  functions, sections, frames, holomorphy, the operator of M2-W105 or the
  lifts as maps: only the count and the integer arithmetic written here.
  The theorems are named `L6_…` in the namespace `M2L6`; M1's own certificate
  M1_L6_twist has theorems named `L6_…` too, and they are other theorems.
-/

namespace M2L6

/-- (−1)^a as an integer. -/
def sgn (a : Nat) : Int := if a % 2 = 0 then 1 else -1

/-- The divisors of flux three on the four corners, as lists [a1, a2, a3, a4]. -/
def divisors : List (List Nat) :=
  (List.range 4).flatMap fun a =>
  (List.range 4).flatMap fun b =>
  (List.range 4).flatMap fun c =>
  (List.range 4).filterMap fun e =>
    if a + b + c + e = 3 then some [a, b, c, e] else none

/-- Signs of the first lift at P1..P4 (M1 Definition 7.4). -/
def firstSigns (a : List Nat) : List Int := a.map sgn

/-- Signs of the second lift: the negatives. -/
def secondSigns (a : List Nat) : List Int := (firstSigns a).map (fun s => -s)

/-- States on the pillowcase under the first lift (M1 Lemma 7.5(b), taken as given). -/
def statesFirst (a : List Nat) : Nat := 1 + (a.map (· / 2)).foldl (· + ·) 0

/-- The signs of the lift with two states. -/
def chosen (a : List Nat) : List Int :=
  if statesFirst a = 2 then firstSigns a else secondSigns a

/-- The divisors whose lift with two states has the signs +1, +1, +1, −1. -/
def five : List (List Nat) := divisors.filter (fun a => chosen a == [1, 1, 1, -1])

theorem L6_twenty : divisors.length = 20 := by decide

theorem L6_five :
    five = [[0, 0, 0, 3], [0, 0, 2, 1], [0, 2, 0, 1], [1, 1, 1, 0], [2, 0, 0, 1]] := by
  decide

/-- For which of the five the lift with two states is the first lift. -/
theorem L6_which_lift :
    five.map (fun a => statesFirst a == 2) = [true, true, true, false, true] := by
  decide

/-- The divisors of ℘ − e2, ℘ − e3, ℘ − e4 and ℘′, written in by hand from M2-W113. -/
def g2 : List Int := [-2, 2, 0, 0]
def g3 : List Int := [-2, 0, 2, 0]
def g4 : List Int := [-2, 0, 0, 2]
def h : List Int := [-3, 1, 1, 1]

def total (l : List Int) : Int := l.foldl (· + ·) 0

theorem L6_degree_zero : [g2, g3, g4, h].map total = [0, 0, 0, 0] := by decide

/-- c2·g2 + c3·g3 + c4·g4 + ch·h, corner by corner. -/
def comb (c2 c3 c4 ch : Int) : List Int :=
  (List.range 4).map fun i =>
    c2 * g2.getD i 0 + c3 * g3.getD i 0 + c4 * g4.getD i 0 + ch * h.getD i 0

/-- D − 3P4, corner by corner. -/
def minus3P4 (a : List Nat) : List Int :=
  (List.range 4).map fun i => (a.getD i 0 : Int) - (if i = 3 then 3 else 0)

/-- The coefficients (c2, c3, c4, ch) of the five multipliers of M2-W114, in the order of `five`. -/
def coeffs : List (Int × Int × Int × Int) :=
  [(0, 0, 0, 0), (0, 1, -1, 0), (1, 0, -1, 0), (0, 0, -2, 1), (0, 0, -1, 0)]

theorem L6_multipliers :
    (five.zip coeffs).all (fun p =>
      minus3P4 p.1 == comb p.2.1 p.2.2.1 p.2.2.2.1 p.2.2.2.2) = true := by
  decide

/-- The coefficient of ℘′ is odd exactly when the lift with two states is the second. -/
theorem L6_parity :
    (five.zip coeffs).all (fun p =>
      (p.2.2.2.2 % 2 == 1) == !(statesFirst p.1 == 2)) = true := by
  decide

end M2L6
