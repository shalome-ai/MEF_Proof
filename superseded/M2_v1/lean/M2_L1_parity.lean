/-!
# M2 — Certificate L1: the parity algebra of ψ, ω and Φ_QC (Section 2 / WP2)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.

Model. The field ψ has real part x = Re ψ and imaginary part y = Im ψ. The
involution ι of A2 acts on ψ by conjugation (M1 Prop 5.4/5.6), so on (x, y)
it acts as (x, −y). A real monomial in the two components is (x^a)(y^b)
with natural exponents (a, b). Under ι it picks up the sign (−1)^b.

Certified:
* `L1_iota_sign`      — the ι-sign of (a, b) is +1 iff b is even;
* `L1_vanish_Im`      — (x^a)(y^b) vanishes on the locus y = 0 (ψ = ψ̄) for all x
                         iff b ≥ 1;
* `L1_vanish_Re`      — (x^a)(y^b) vanishes on the locus x = 0 (ψ = −ψ̄, ω = 0)
                         for all y iff a ≥ 1;
* `L1_degree_bound`   — any ι-even monomial vanishing on both loci has degree ≥ 3;
* `L1_degree_three`   — degree 3 forces (a, b) = (1, 2), i.e. (Re ψ)(Im ψ)²,
                         the monomial of ω(ψ − ψ̄)² up to a real constant;
* `L1_table_*`        — the parity table: ω = 2 Re ψ even; ψ − ψ̄ = 2i Im ψ odd;
                         (ψ − ψ̄)² even; Φ_QC = ω(ψ − ψ̄)² even.

The two vanishing conditions are inputs of the theorem, not outputs: ω = 0 at
ψ = −ψ̄ is the PI ruling R1 (M2 §2); Φ_QC = 0 at ψ = ψ̄ is the motivated
condition of M2 §2 (no held distinction, no coupling). The certificate shows
that, given both, parity and minimal degree determine the monomial uniquely.
-/

namespace M2L1

/-- The ι-sign of the monomial x^a y^b: +1 if b even, −1 if b odd. -/
def iotaSign (b : Nat) : Int := if b % 2 = 0 then 1 else -1

theorem L1_iota_sign (b : Nat) : iotaSign b = 1 ↔ b % 2 = 0 := by
  unfold iotaSign
  split
  · simp_all
  · constructor
    · intro h; cases h
    · intro h; contradiction

/-- Evaluation of the monomial over ℕ (vanishing is a statement about zeros). -/
def ev (a b x y : Nat) : Nat := x ^ a * y ^ b

theorem zero_pow_of_pos {n : Nat} (h : 0 < n) : (0:Nat) ^ n = 0 := by
  cases n with
  | zero => cases h
  | succ k => simp [Nat.pow_succ]

/-- x^a y^b vanishes at y = 0 for every x iff b ≥ 1. -/
theorem L1_vanish_Im (a b : Nat) : (∀ x, ev a b x 0 = 0) ↔ 1 ≤ b := by
  constructor
  · intro h
    cases b with
    | zero => have := h 1; simp [ev] at this
    | succ k => omega
  · intro hb x
    simp [ev, zero_pow_of_pos hb]

/-- x^a y^b vanishes at x = 0 for every y iff a ≥ 1. -/
theorem L1_vanish_Re (a b : Nat) : (∀ y, ev a b 0 y = 0) ↔ 1 ≤ a := by
  constructor
  · intro h
    cases a with
    | zero => have := h 1; simp [ev] at this
    | succ k => omega
  · intro ha y
    simp [ev, zero_pow_of_pos ha]

/-- ι-even and vanishing on both loci forces degree a + b ≥ 3. -/
theorem L1_degree_bound (a b : Nat)
    (heven : b % 2 = 0) (ha : 1 ≤ a) (hb : 1 ≤ b) : 3 ≤ a + b := by
  omega

/-- At the minimal degree 3 the exponents are (1, 2): the monomial (Re ψ)(Im ψ)². -/
theorem L1_degree_three (a b : Nat)
    (heven : b % 2 = 0) (ha : 1 ≤ a) (hb : 1 ≤ b) (hdeg : a + b = 3) :
    a = 1 ∧ b = 2 := by
  omega

/-- Uniqueness packaged: the set of admissible (a, b) of degree 3 is {(1, 2)}. -/
theorem L1_unique (a b : Nat) :
    (b % 2 = 0 ∧ 1 ≤ a ∧ 1 ≤ b ∧ a + b = 3) ↔ (a = 1 ∧ b = 2) := by
  constructor
  · intro h; omega
  · intro h; omega

/-! ### The parity table -/

/-- ω = 2 Re ψ ∼ (a, b) = (1, 0): ι-even. -/
theorem L1_table_omega : iotaSign 0 = 1 := by decide
/-- ψ − ψ̄ = 2i Im ψ ∼ (0, 1): ι-odd. -/
theorem L1_table_odd : iotaSign 1 = -1 := by decide
/-- (ψ − ψ̄)² ∼ (0, 2): ι-even. -/
theorem L1_table_odd_sq : iotaSign 2 = 1 := by decide
/-- Φ_QC = ω(ψ − ψ̄)² ∼ (1, 2): ι-even. -/
theorem L1_table_PhiQC : iotaSign 2 = 1 := by decide
/-- ι-sign is multiplicative in the Im-exponent: sign(b₁ + b₂) = sign b₁ · sign b₂. -/
theorem L1_sign_mul (b₁ b₂ : Nat) : iotaSign (b₁ + b₂) = iotaSign b₁ * iotaSign b₂ := by
  unfold iotaSign
  by_cases h1 : b₁ % 2 = 0 <;> by_cases h2 : b₂ % 2 = 0 <;> simp [h1, h2] <;> omega

end M2L1
