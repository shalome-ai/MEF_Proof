/-!
# M1 — Certificate L3: dimension twelve and the split (Section 6)
Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.
External inputs named, never Lean axioms: Salamon 1982 (almost-quaternionic
structures live in dimension 4n); the identity Sp(1)Sp(1) = SO(4).
-/

/-- The time–space block T × Σ is the quaternions: dimension 4.
    With D = 4 + dim F and F of quaternionic dimension m ≥ 2 (A3 non-vacuous
    on F), D ≥ 12; every D ≡ 0 (mod 4) below 12 fails. -/
theorem L3_dim_ge_twelve (D m : Nat) (h4 : 4 ∣ D) (hF : D = 4 + 4*m) (hm : m ≥ 2) : D ≥ 12 := by
  omega

/-- Dimensions 4 ≤ D ≤ 11 all fail: either 4 ∤ D, or D ∈ {4, 8} where
    F has quaternionic dimension 0 or 1. -/
theorem L3_below_twelve (D : Nat) (hlo : 4 ≤ D) (hhi : D ≤ 11) :
    ¬ (4 ∣ D) ∨ D = 4 ∨ D = 8 := by
  rcases (show D = 4 ∨ D = 5 ∨ D = 6 ∨ D = 7 ∨ D = 8 ∨ D = 9 ∨ D = 10 ∨ D = 11 by omega)
    with h | h | h | h | h | h | h | h <;> subst h <;> decide

/-- Dimension 12 is admissible: 4 ∣ 12 and F has quaternionic dimension 2. -/
theorem L3_twelve_ok : 4 ∣ 12 ∧ 12 = 4 + 4*2 := by decide

/-- Within D = 12 the split dim Σ + dim B = 9 with T × Σ quaternionic
    (dim Σ + 1 ≡ 0 mod 4), B × T²/ℤ₂ quaternionic (dim B + 2 ≡ 0 mod 4), and
    F = B × T²/ℤ₂ of quaternionic dimension ≥ 2 (dim B + 2 ≥ 8, the same
    condition that excludes D = 8), has the unique solution (3, 6).
    Without the last hypothesis (7, 2) also satisfies the congruences — a
    fact this certificate surfaced; it is excluded by A3 on F. -/
theorem L3_split_three_six (s b : Nat)
    (hsum : s + b = 9) (hs : (s + 1) % 4 = 0) (hb : (b + 2) % 4 = 0)
    (hs1 : s ≥ 1) (hF : b + 2 ≥ 8) : s = 3 ∧ b = 6 := by
  have hs' : s = 3 ∨ s = 7 := by omega
  rcases hs' with h | h
  · subst h; exact ⟨rfl, by omega⟩
  · subst h; exfalso; omega

/-- The excluded alternative, recorded: (7, 2) meets the congruences and sum. -/
theorem L3_seven_two_meets_congruences : (7 + 2 = 9) ∧ ((7 + 1) % 4 = 0) ∧ ((2 + 2) % 4 = 0) ∧ ¬ (2 + 2 ≥ 8) := by decide

/-- Euler characteristic of the internal factor: χ(ℂP²)·χ(S²)·χ(T²/ℤ₂) = 3·2·2 = 12,
    and the dimension identity 1 + 3 + 8 = 12. -/
theorem L3_chi_K8 : 3 * 2 * 2 = 12 ∧ 1 + 3 + 8 = 12 := by decide
