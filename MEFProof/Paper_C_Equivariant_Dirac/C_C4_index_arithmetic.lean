/-
  C_C4_index_arithmetic.lean

  Certificate C4 for the paper "Equivariant Dirac traces and the
  geometric realisation of a decorated hyperfinite factor".

  Content certified (finite arithmetic bookkeeping only):

  * four_pow                : 4^n = 2^n * 2^n.
  * averaging_cleared       : the denominator-cleared averaging count,
                              Sum_g L(g) = ind_orb * |G_n|, in the form
                              2 N 4^n = 2^(n+1) N 2^n.
  * stage_identity_cleared  : the denominator-cleared stage identity
                              (Theorem 4.7 of the paper): for all corner
                              counts s, 2 s N 4^n = 2^(n+1) N s 2^n.
  * deckSum_eq              : the recursive group-sum bookkeeping: each
                              torus factor contributes L(e) + L(sigma)
                              = 0 + 4 to the product, so the deck-group
                              sum equals 2 N 4^n.
  * foldr_vanishes,
    term_vanishes           : a Lefschetz term vanishes whenever any
                              coordinate of the deck element is the
                              identity (the factor 0).
  * foldr_replicate,
    full_term               : the full deck involution contributes
                              exactly 2 N 4^n.
  * dyadic_realised,
    dyadic_in_range         : the value-set claim of Corollary 4.9:
                              m / 2^j = (m 2^j) / 4^j, in cleared form,
                              with the range bound.
  * frozen_total_pos        : the frozen-variant totals 2^(n+1) of
                              Remark 2.6 are positive at every stage.

  The analytic inputs (the index theorem, the weak closure) are NOT
  certified here and no such claim is made; see the scope remarks in
  the paper's appendix.

  Lean 4.29.1, core only. No imports, no axioms, no sorry.
-/

namespace PaperC.C4

/-- `4^n = 2^n * 2^n`. -/
theorem four_pow (n : Nat) : 4 ^ n = 2 ^ n * 2 ^ n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    calc 4 ^ (n + 1) = 4 ^ n * 4 := Nat.pow_succ ..
      _ = (2 ^ n * 2 ^ n) * (2 * 2) := by rw [ih]
      _ = (2 ^ n * 2) * (2 ^ n * 2) := Nat.mul_mul_mul_comm ..
      _ = 2 ^ (n + 1) * 2 ^ (n + 1) := by rw [Nat.pow_succ]

/-- Denominator-cleared averaging count:
    `Sum_g L(g) = ind_orb * |G_n|`, i.e. `2 N 4^n = (2^(n+1) N) 2^n`. -/
theorem averaging_cleared (n N : Nat) :
    2 * N * 4 ^ n = 2 ^ (n + 1) * N * 2 ^ n := by
  rw [four_pow, Nat.pow_succ]
  simp [Nat.mul_comm, Nat.mul_left_comm, Nat.mul_assoc]

/-- Denominator-cleared stage identity (Theorem 4.7 of the paper):
    `s * ind_w = ind_orb * s * 4^{-n}` becomes, after multiplying
    through by `2^n * 4^n`,  `2 s N 4^n = (2^(n+1) N) s 2^n`. -/
theorem stage_identity_cleared (s n N : Nat) :
    2 * s * N * 4 ^ n = 2 ^ (n + 1) * N * s * 2 ^ n := by
  rw [four_pow, Nat.pow_succ]
  simp [Nat.mul_comm, Nat.mul_left_comm, Nat.mul_assoc]

/-- One torus factor contributes `L(e) + L(sigma) = 0 + 4` to the
    deck-group sum. -/
def factorSum : Nat := 0 + 4

/-- The deck-group sum over `(Z_2)^n`, computed recursively: the sum
    over the last coordinate distributes as a factor `L(e) + L(sigma)`. -/
def deckSum (N : Nat) : Nat → Nat
  | 0     => 2 * N
  | n + 1 => factorSum * deckSum N n

/-- The deck-group sum equals `2 N 4^n`. -/
theorem deckSum_eq (N n : Nat) : deckSum N n = 2 * N * 4 ^ n := by
  induction n with
  | zero => simp [deckSum]
  | succ n ih =>
    rw [deckSum, ih, Nat.pow_succ]
    simp [factorSum, Nat.mul_comm, Nat.mul_left_comm, Nat.mul_assoc]

/-- The product of torus-factor Lefschetz numbers along a deck element,
    encoded as a list of booleans (`true` = the involution, `false` =
    the identity). -/
def lefschetzProduct (g : List Bool) : Nat :=
  g.foldr (fun b acc => (if b then 4 else 0) * acc) 1

/-- The product vanishes whenever any coordinate is the identity. -/
theorem foldr_vanishes (g : List Bool) (h : false ∈ g) :
    lefschetzProduct g = 0 := by
  induction g with
  | nil => cases h
  | cons b t ih =>
    cases h with
    | head => simp [lefschetzProduct]
    | tail _ ht =>
      have h0 : lefschetzProduct t = 0 := ih ht
      simp [lefschetzProduct] at h0 ⊢
      simp [h0]

/-- The full Lefschetz term of a deck element. -/
def lefschetzTerm (N : Nat) (g : List Bool) : Nat :=
  2 * N * lefschetzProduct g

/-- A Lefschetz term vanishes whenever any coordinate of the deck
    element is the identity. -/
theorem term_vanishes (N : Nat) (g : List Bool) (h : false ∈ g) :
    lefschetzTerm N g = 0 := by
  simp [lefschetzTerm, foldr_vanishes g h]

/-- The product along the full deck involution is `4^n`. -/
theorem foldr_replicate (n : Nat) :
    lefschetzProduct (List.replicate n true) = 4 ^ n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [List.replicate_succ]
    show 4 * lefschetzProduct (List.replicate n true) = 4 ^ (n + 1)
    rw [ih, Nat.pow_succ, Nat.mul_comm]

/-- The full deck involution contributes exactly `2 N 4^n`. -/
theorem full_term (N n : Nat) :
    lefschetzTerm N (List.replicate n true) = 2 * N * 4 ^ n := by
  simp [lefschetzTerm, foldr_replicate]

/-- The value-set identity of Corollary 4.9, cleared of denominators:
    `m / 2^j = (m 2^j) / 4^j` becomes `m * 4^j = (m * 2^j) * 2^j`. -/
theorem dyadic_realised (m j : Nat) :
    m * 4 ^ j = (m * 2 ^ j) * 2 ^ j := by
  rw [four_pow, Nat.mul_assoc]

/-- The realising numerator stays in range: `m ≤ 2^j` gives
    `m 2^j ≤ 4^j`. -/
theorem dyadic_in_range (m j : Nat) (h : m ≤ 2 ^ j) :
    m * 2 ^ j ≤ 4 ^ j := by
  rw [four_pow]
  exact Nat.mul_le_mul_right (2 ^ j) h

/-- The frozen-variant totals `2^(n+1)` of Remark 2.6 are positive at
    every stage. -/
theorem frozen_total_pos (n : Nat) : 0 < 2 ^ (n + 1) :=
  Nat.pow_pos (by decide)

end PaperC.C4
