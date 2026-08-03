import Mathlib.Tactic

/-!
# N3 — Dimension-twelve arithmetic

Paper 3 (JGP), Theorem 7.3 (Dimension-twelve simultaneity), leg (i).

Leg (i) of the theorem rests on the Atiyah–Bott–Shapiro periodicity
of Clifford modules: Cl(0,12) ≅ ℍ(32), with the Clifford-quaternionic
dimensions being n ≡ 4 (mod 8) and twelve the first non-trivial case
(dimension four being strict-QK-viable).

The isomorphism Cl(0,12) ≅ ℍ(32) itself is the cited input
[Atiyah–Bott–Shapiro 1964]; Mathlib support for this specific
periodicity instance is uncertain and no attempt is made to formalise
it here. What this file certifies is the arithmetic skeleton the
theorem's phrasing consumes:

* 12 ≡ 4 (mod 8) — twelve lies in the Clifford-quaternionic residue
  class;
* twelve is the FIRST case of that class strictly above four — the
  "first non-trivial case" clause;
* the dimension bookkeeping of the periodicity factorisation
  Cl(0,12) ≅ Cl(0,4) ⊗ Cl(0,8) ≅ ℍ(2) ⊗ ℝ(16) ≅ ℍ(32):
  real dimensions 2⁴ · 2⁸ = 2¹², with dim_ℝ ℍ(2) = 16 = 2⁴,
  dim_ℝ ℝ(16) = 256 = 2⁸, and dim_ℝ ℍ(32) = 4 · 32² = 4096 = 2¹².
-/

/-- Twelve lies in the Clifford-quaternionic residue class:
    12 ≡ 4 (mod 8). -/
theorem n3_twelve_mod_eight : 12 % 8 = 4 := by decide

/-- Twelve is the first member of the class strictly above four:
    any n with n ≡ 4 (mod 8) and n > 4 satisfies n ≥ 12. Together
    with `n3_twelve_mod_eight` this is the "first non-trivial case"
    clause of Theorem 7.5(i). -/
theorem n3_first_nontrivial (n : ℕ) (h : n % 8 = 4) (h4 : 4 < n) :
    12 ≤ n := by omega

/-- Dimension four itself is in the class (the strict-QK-viable
    case excluded by "non-trivial"). -/
theorem n3_four_in_class : 4 % 8 = 4 := by decide

/-- dim_ℝ ℍ(2) = 4 · 2² = 16 = 2⁴ = dim_ℝ Cl(0,4). -/
theorem n3_dim_H2 : 4 * 2^2 = 2^4 := by norm_num

/-- dim_ℝ ℝ(16) = 16² = 256 = 2⁸ = dim_ℝ Cl(0,8). -/
theorem n3_dim_R16 : 16^2 = 2^8 := by norm_num

/-- The tensor factorisation matches at the dimension level:
    2⁴ · 2⁸ = 2¹². -/
theorem n3_dim_tensor : 2^4 * 2^8 = 2^12 := by norm_num

/-- dim_ℝ ℍ(32) = 4 · 32² = 4096 = 2¹² = dim_ℝ Cl(0,12): the target
    algebra of the periodicity has exactly the Clifford dimension. -/
theorem n3_dim_H32 : 4 * 32^2 = 2^12 := by norm_num

/-- Assembled statement: the arithmetic skeleton of
    Theorem 7.5, leg (i). -/
theorem n3_dim12_arithmetic :
    12 % 8 = 4 ∧
    (∀ n : ℕ, n % 8 = 4 → 4 < n → 12 ≤ n) ∧
    4 * 2^2 = 2^4 ∧ 16^2 = 2^8 ∧ 2^4 * 2^8 = 2^12 ∧ 4 * 32^2 = 2^12 :=
  ⟨n3_twelve_mod_eight, n3_first_nontrivial,
   n3_dim_H2, n3_dim_R16, n3_dim_tensor, n3_dim_H32⟩

/-! ### Axiom footprint -/

#print axioms n3_dim12_arithmetic
#print axioms n3_twelve_mod_eight
