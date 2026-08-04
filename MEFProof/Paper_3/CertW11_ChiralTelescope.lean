/- CERT-W11: the telescoping arithmetic of lem:telescope, and with it
   the spectral spine of thm:shadow-computed (core Lean, no Mathlib).
   The link towers are taken doubled to clear denominators:
   2μ⁺_m = 2m + 3 and 2μ⁻_m = -2m + 1, m ∈ ℕ.
   Certifies: the pairing 2μ⁺_m = -(2μ⁻_{m+2}) for every m, hence
   equality of squares term by term; that the pairing m ↦ m + 2
   misses exactly the indices {0, 1} of the negative tower; that the
   two survivors carry the doubled values ±1, i.e. squared eigenvalue
   1/4 — the quarter exponent; that no positive-tower square equals
   1/4; and the smallest case (2μ⁺₀)² = 9 = (2μ⁻₂)² worked by hand in
   the paper. Together with the strict monotonicity of the exponents
   (2k+1)²/4 (CERT-W1 `exponent_identity`; N1/R9 of the v1 suite),
   this is the spine of thm:shadow-computed: the exponent 1/4 is
   attained only at the surviving doublet. The heat-trace evaluation,
   the period integral, and its differentiation are human-audited
   analytic steps with cited termini, outside scope. -/

/-- Doubled towers: 2μ⁺_m = 2m + 3, 2μ⁻_m = -2m + 1. -/
def dplus (m : Nat) : Int := 2 * m + 3

def dminus (m : Nat) : Int := -(2 * m) + 1

/-- The chiral pairing: μ⁺_m = -μ⁻_{m+2} for every m ≥ 0. -/
theorem pairing (m : Nat) : dplus m = - dminus (m + 2) := by
  simp [dplus, dminus]; omega

/-- Hence squares agree term by term. -/
theorem pairing_sq (m : Nat) :
    dplus m * dplus m = dminus (m + 2) * dminus (m + 2) := by
  rw [pairing m]
  simp [Int.neg_mul, Int.mul_neg]

/-- The pairing exhausts the negative tower except exactly {0, 1}. -/
theorem survivors (n : Nat) : (∀ m : Nat, n ≠ m + 2) ↔ n < 2 := by
  constructor
  · intro h
    rcases Nat.lt_or_ge n 2 with hlt | hge
    · exact hlt
    · exact absurd (by omega : n = (n - 2) + 2) (h (n - 2))
  · intro h m
    omega

/-- The two survivors carry doubled values +1 and -1: the squared
    eigenvalue is 1/4 in both cases. -/
theorem survivor_values :
    dminus 0 = 1 ∧ dminus 1 = -1 ∧
    dminus 0 * dminus 0 = 1 ∧ dminus 1 * dminus 1 = 1 := by decide

/-- No positive-tower square equals the survivor square: for every m,
    (2μ⁺_m)² ≥ 9 > 1. -/
theorem no_quarter_in_plus (m : Nat) : 9 ≤ dplus m * dplus m := by
  have h3 : (3 : Int) ≤ dplus m := by simp [dplus]; omega
  have h0 : (0 : Int) ≤ 3 := by omega
  calc (9 : Int) = 3 * 3 := by omega
    _ ≤ dplus m * dplus m := Int.mul_le_mul h3 h3 h0 (by omega)

/-- The smallest case, worked by hand in the paper:
    (2μ⁺₀)² = 9 = (2μ⁻₂)². -/
theorem smallest_case :
    dplus 0 * dplus 0 = 9 ∧ dminus 2 * dminus 2 = 9 := by decide

#print axioms pairing
#print axioms pairing_sq
#print axioms survivors
#print axioms survivor_values
#print axioms no_quarter_in_plus
#print axioms smallest_case
