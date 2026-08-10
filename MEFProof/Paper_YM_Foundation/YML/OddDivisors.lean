/-
Certificate 7 (Proposition: Appell central coefficients).
The central (y⁰) coefficient of the level-two Appell sum
μ(τ,z) = Σ_{n≥1} qⁿ/((1-yqⁿ)(1-y⁻¹qⁿ)) at qᵐ counts the pairs
(n,a) with n ≥ 1, a ≥ 0 and n(2a+1) = m -- equivalently, the odd
divisors of m. This certificate machine-checks (i) the identity
pairCount m = d_odd m for ALL m ≥ 1, via the explicit bijection
d = 2a+1 with inverse (n,a) = (m/d, (d-1)/2), and (ii) the
coefficient table to q¹⁵ by decidable evaluation. The
geometric-series expansion step from μ to pairCount is a two-line
manipulation carried in the prose.
Unconditional; zero `sorry`.
-/
import Mathlib.NumberTheory.Divisors

namespace OddDivisors

open Finset

/-- The odd-divisor count d_odd(m). -/
def dodd (m : ℕ) : ℕ := ((Nat.divisors m).filter (fun d => Odd d)).card

/-- The coefficient count: pairs (n,a), n ≥ 1, a ≥ 0, with
n(2a+1) = m. Ranges suffice since n ≤ m and (d-1)/2 ≤ m for m ≥ 1. -/
def pairCount (m : ℕ) : ℕ :=
  (((range (m + 1)) ×ˢ (range (m + 1))).filter
    (fun p => 1 ≤ p.1 ∧ p.1 * (2 * p.2 + 1) = m)).card

/-- **The identity, in general.** For all m ≥ 1, the coefficient count
equals the odd-divisor count. -/
theorem pairCount_eq_dodd (m : ℕ) (hm : 1 ≤ m) :
    pairCount m = dodd m := by
  unfold pairCount dodd
  apply Finset.card_nbij' (fun p => 2 * p.2 + 1)
    (fun d => (m / d, (d - 1) / 2))
  · -- forward map lands in the odd divisors
    rintro ⟨n, a⟩ hp
    simp only [Finset.mem_coe, mem_filter, mem_product, mem_range] at hp
    obtain ⟨⟨-, -⟩, hn1, hprod⟩ := hp
    simp only [Finset.mem_coe, mem_filter, Nat.mem_divisors]
    exact ⟨⟨⟨n, by rw [Nat.mul_comm]; exact hprod.symm⟩, by omega⟩,
           ⟨a, rfl⟩⟩
  · -- inverse map lands in the pair set
    intro d hd
    simp only [Finset.mem_coe, mem_filter, Nat.mem_divisors] at hd
    obtain ⟨⟨hdvd, hm0⟩, hodd⟩ := hd
    have hd1 : 1 ≤ d := Nat.one_le_iff_ne_zero.mpr (by rintro rfl; simp at hodd)
    have hdle : d ≤ m := Nat.le_of_dvd (by omega) hdvd
    have hq1 : 1 ≤ m / d := Nat.one_le_div_iff (by omega) |>.mpr hdle
    have hqle : m / d ≤ m := Nat.div_le_self m d
    have hdodd : d % 2 = 1 := Nat.odd_iff.mp hodd
    simp only [Finset.mem_coe, mem_filter, mem_product, mem_range]
    refine ⟨⟨by omega, by omega⟩, hq1, ?_⟩
    rw [show 2 * ((d - 1) / 2) + 1 = d by omega]
    exact Nat.div_mul_cancel hdvd
  · -- left inverse
    rintro ⟨n, a⟩ hp
    simp only [Finset.mem_coe, mem_filter, mem_product, mem_range] at hp
    obtain ⟨⟨-, -⟩, hn1, hprod⟩ := hp
    have hpos : 0 < 2 * a + 1 := by omega
    have hdiv : m / (2 * a + 1) = n := by
      rw [← hprod, Nat.mul_div_cancel _ hpos]
    simp only [Prod.mk.injEq]
    exact ⟨hdiv, by omega⟩
  · -- right inverse
    intro d hd
    simp only [Finset.mem_coe, mem_filter, Nat.mem_divisors] at hd
    have hdodd : d % 2 = 1 := Nat.odd_iff.mp hd.2
    have hd1 : 1 ≤ d := by omega
    dsimp only
    omega

/-- **The table to q¹⁵**, by decidable evaluation. -/
theorem table :
    (List.range 15).map (fun i => dodd (i + 1)) =
    [1, 1, 2, 1, 2, 2, 2, 1, 3, 2, 2, 2, 2, 2, 4] := by decide

/-- The smallest case, restated: d_odd(1) = 1. -/
theorem dodd_one : dodd 1 = 1 := by decide

/-- Strict positivity to q¹⁵, by decidable evaluation, accompanying
the one-line general proof in the prose. -/
theorem positive_to_fifteen : ∀ m ∈ List.range 15, 1 ≤ dodd (m + 1) := by
  decide

end OddDivisors