/-
Certificate 6 (Theorem: signed count equals absolute count).
The arithmetic implication of the index theorem: if all odd Betti
numbers vanish, the signed Euler characteristic equals the absolute
Betti count -- there are no cancellations. The geometric inputs (the
cellular decomposition and the vanishing itself) are external
theorems cited in the prose; this certificate machine-checks the
implication, in full generality (any Betti sequence, any range),
not merely at statement level.
Unconditional; zero `sorry`.
-/
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Algebra.Order.BigOperators.Group.Finset
set_option linter.style.whitespace false
set_option linter.style.show false
namespace BettiParity

open Finset

/-- **Signed = absolute.** For any Betti sequence b : ℕ → ℤ with
vanishing odd part, the alternating sum equals the plain sum over any
initial range. -/
theorem signed_eq_absolute (b : ℕ → ℤ)
    (hodd : ∀ j, b (2 * j + 1) = 0) (N : ℕ) :
    ∑ j ∈ range N, (-1 : ℤ) ^ j * b j = ∑ j ∈ range N, b j := by
  apply Finset.sum_congr rfl
  intro j _
  rcases Nat.even_or_odd j with ⟨k, hk⟩ | ⟨k, hk⟩
  · -- even j: the sign is +1
    subst hk
    rw [show k + k = 2 * k by omega, pow_mul]
    norm_num
  · -- odd j: the term vanishes on both sides
    subst hk
    rw [hodd k, mul_zero]

/-- Corollary in the form used in the prose: under odd vanishing, the
Euler characteristic (alternating sum) is a sum of non-negative terms
whenever the Betti numbers are non-negative. -/
theorem chi_nonneg (b : ℕ → ℤ) (hodd : ∀ j, b (2 * j + 1) = 0)
    (hpos : ∀ j, 0 ≤ b j) (N : ℕ) :
    0 ≤ ∑ j ∈ range N, (-1 : ℤ) ^ j * b j := by
  rw [signed_eq_absolute b hodd N]
  exact Finset.sum_nonneg (fun j _ => hpos j)

end BettiParity
