/-
  M2_L2_pillowcase.lean — Paper M2, card S04b: the bundle over the pillowcase.
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and arithmetic content of the proof of
  Proposition `prop:pillowcase` (write-up log M2-W023; its proof M2-W024 to
  M2-W026, M2-W034 to M2-W038 and M2-W032; M2-W034 to M2-W038 replace M2-W027
  to M2-W031, retired at Decision Log P200).

  * The twenty divisors D = a1 P1 + a2 P2 + a3 P3 + a4 P4 of flux three on the
    corners (a_i ≥ 0, Σ a_i = 3; M1 Definition 7.4).
  * For each, the signs at the corners of the first lift, (−1)^{a_i}, and of
    the second lift, their negatives (M1 Definition 7.4): the product is −1 for
    both (`L2_product_minus_one`).
  * With the count of states of M1 Lemma 7.5(b) taken as given (first lift:
    1 + Σ ⌊a_i/2⌋; second lift: 3 less that number), exactly one of the two
    lifts has two states (`L2_one_lift_two_states`); the twist has exactly one
    odd corner (`L2_one_odd_corner`); the lift with two states has the sign −1
    at the odd corner and +1 at the other three (`L2_two_state_signs`); with
    the odd corner at P4 its signs at P1, P2, P3, P4 are +1, +1, +1, −1
    (`L2_odd_at_P4`), which is (−1)^{mn} at C_{m,n} (`L2_mn_pattern`).
  * The sign patterns of the two lifts over the twenty divisors are exactly
    the eight patterns of four signs with product −1 (`L2_eight_patterns`).
  * The parity of the exponents of the corner values of
    γ = e^{2πi(μθψ+νθω)} e^{η}, η(−·)+η(·) = 2πiℓ (M2-W036): the four
    exponents ℓ, μ+ℓ, ν+ℓ, μ+ν+ℓ, written in by hand from M2-W036 and not
    derived here from γ, add to an even number (`L2_corner_values`), and are
    all even exactly when μ, ν and ℓ are (`L2_corner_values_all_even`).
  * A linear identity over the integers that has the shape of the exponent
    bookkeeping of the isomorphism β = e^{−πi(μθψ+νθω)} e^{−η/2} of M2-W037,
    doubled so that no half appears (`L2_iso_exponent`): in M2-W037 the
    quantities are complex numbers, and the identity used there is the same
    linear identity, checked by hand; and that an even μ is twice an integer
    (`L2_even_half`), from which the period of β follows by hand.

  What is not certified: the cited theorems (Gompf, Proposition 1; Nicolaescu,
  Proposition 1.3.15, Definition 1.4.3, Proposition 1.4.25; Hatcher,
  Corollaries 2.14 and 3.3, Theorem 3.15, Proposition 1.33, Example 1.4);
  M1's Lemma 7.5(b), whose count is taken as given, as M1's certificate
  M1_L6_twist does; that every γ with γ(−z)γ(z) = 1 has the exponential form
  (the lifting criterion); the corner values themselves, the period of β, and
  anything about continuity, exponentials or complex numbers: only the
  integer arithmetic written here is certified.
-/

namespace M2L2

/-- (−1)^a as an integer. -/
def sgn (a : Nat) : Int := if a % 2 = 0 then 1 else -1

/-- The product of a list of integers. -/
def prod (l : List Int) : Int := l.foldl (· * ·) 1

/-- The divisors of flux three on the four corners, as lists [a1, a2, a3, a4]. -/
def divisors : List (List Nat) :=
  (List.range 4).flatMap fun a =>
  (List.range 4).flatMap fun b =>
  (List.range 4).flatMap fun c =>
  (List.range 4).filterMap fun e =>
    if a + b + c + e = 3 then some [a, b, c, e] else none

/-- Signs of the first lift at P1..P4 (M1 Definition 7.4: the corner sign (−1)^{a_i}). -/
def firstSigns (a : List Nat) : List Int := a.map sgn

/-- Signs of the second lift, f(z) ↦ −f(−z): the negatives. -/
def secondSigns (a : List Nat) : List Int := (firstSigns a).map (fun s => -s)

/-- States on the pillowcase under the first lift (M1 Lemma 7.5(b), taken as given). -/
def statesFirst (a : List Nat) : Nat := 1 + (a.map (· / 2)).foldl (· + ·) 0

/-- Under the second lift: 3 less that number (flux d = 3). -/
def statesSecond (a : List Nat) : Nat := 3 - statesFirst a

/-- The lift with two states. -/
def chosen (a : List Nat) : List Int :=
  if statesFirst a = 2 then firstSigns a else secondSigns a

/-- The corners whose sign under the first lift differs from that of the other three
    (M1 Definition 7.4: the odd corner). -/
def oddCorners (a : List Nat) : List Nat :=
  let s := firstSigns a
  (List.range 4).filter fun i => (s.filter (· == s.getD i 0)).length == 1

/-- The pattern −1 at corner i, +1 at the other three. -/
def oddPattern (i : Nat) : List Int := (List.range 4).map fun j => if j = i then -1 else 1

theorem L2_twenty_divisors : divisors.length = 20 := by decide

theorem L2_product_minus_one :
    divisors.all (fun a => prod (firstSigns a) == -1 && prod (secondSigns a) == -1) = true := by
  decide

theorem L2_one_lift_two_states :
    divisors.all (fun a => (statesFirst a == 2) != (statesSecond a == 2)) = true := by
  decide

theorem L2_one_odd_corner :
    divisors.all (fun a => (oddCorners a).length == 1) = true := by
  decide

theorem L2_two_state_signs :
    divisors.all (fun a => (oddCorners a).all (fun i => chosen a == oddPattern i)) = true := by
  decide

/-- With the odd corner at P4 (index 3), the lift with two states has signs +1, +1, +1, −1. -/
theorem L2_odd_at_P4 :
    divisors.all (fun a => !(oddCorners a == [3]) || chosen a == [1, 1, 1, -1]) = true := by
  decide

/-- The corners C_{m,n}, in the order P1 = C00, P2 = C10, P3 = C01, P4 = C11 (M1 Appendix B). -/
def cornersMN : List (Nat × Nat) := [(0, 0), (1, 0), (0, 1), (1, 1)]

theorem L2_mn_pattern : cornersMN.map (fun p => sgn (p.1 * p.2)) = [1, 1, 1, -1] := by
  decide

/-- All patterns of four signs. -/
def allPatterns : List (List Int) :=
  [1, -1].flatMap fun s1 => [1, -1].flatMap fun s2 =>
  [1, -1].flatMap fun s3 => [1, -1].map fun s4 => [s1, s2, s3, s4]

/-- The patterns of four signs with product −1. -/
def productMinusOne : List (List Int) := allPatterns.filter (fun s => prod s == -1)

/-- The patterns met: both lifts over the twenty divisors. -/
def patternsMet : List (List Int) := divisors.flatMap fun a => [firstSigns a, secondSigns a]

theorem L2_eight_patterns :
    productMinusOne.length = 8 ∧
    patternsMet.all (fun s => productMinusOne.contains s) = true ∧
    productMinusOne.all (fun s => patternsMet.contains s) = true := by
  decide

/-- The exponents of γ at the four corners, in units of πi, as M2-W036 has them:
    μm + νn + ℓ at C_{m,n}. Their sum is even. -/
theorem L2_corner_values (μ ν ℓ : Int) :
    (ℓ + (μ + ℓ) + (ν + ℓ) + (μ + ν + ℓ)) % 2 = 0 := by
  omega

/-- All four corner values are 1 exactly when μ, ν and ℓ are even. -/
theorem L2_corner_values_all_even (μ ν ℓ : Int) :
    (ℓ % 2 = 0 ∧ (μ + ℓ) % 2 = 0 ∧ (ν + ℓ) % 2 = 0 ∧ (μ + ν + ℓ) % 2 = 0) ↔
    (μ % 2 = 0 ∧ ν % 2 = 0 ∧ ℓ % 2 = 0) := by
  constructor
  · intro h; omega
  · intro h; omega

/-- A linear identity of the shape of the exponent bookkeeping of β (M2-W037), over the
    integers: there A stands for πi(μθψ+νθω), P for η(θψ,θω), Q for η(−θψ,−θω) and
    B for πiℓ, with P + Q = 2B, all complex; twice the exponent of β(−·)/β(·) is
    (2A − Q) − (−2A − P), and twice the exponent of γ e^{−πiℓ} is 2(2A + P − B).
    Here only the integer case is certified. -/
theorem L2_iso_exponent (A P Q B : Int) (hPQ : P + Q = 2 * B) :
    (2 * A - Q) - (-2 * A - P) = 2 * (2 * A + P - B) := by
  omega

/-- An even integer is twice an integer (used by hand in M2-W037: for μ even, e^{−πiμ} = 1). -/
theorem L2_even_half (μ : Int) (h : μ % 2 = 0) : ∃ k : Int, μ = 2 * k :=
  ⟨μ / 2, by omega⟩

end M2L2
