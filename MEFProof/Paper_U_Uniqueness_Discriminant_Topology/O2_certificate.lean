/-
  O2_certificate.lean — Lean 4 (Mathlib)
  Work package O2: per-stratum existence beyond the constant stratum.

  WHAT THIS CERTIFICATE PROVES (finite arithmetic layer only):
  (1) The termwise squeeze — the combinatorial heart of the lacunary
      principle: if c i ≥ b i termwise and the totals agree, then
      c i = b i termwise. (This is the step "the Morse inequalities
      admit no slack" in Paper 5's thm:count and in cor. o2:perfect.)
  (2) The Betti instantiation: b = (1,0,3,0,4,0,3,0,1) has vanishing
      odd entries, total 12, alternating total 12 (signed = unsigned),
      and any count vector c dominating b with total 12 satisfies
      c = b — in particular c₀ = 1 and c₂ = 3, c₄ = 4, c₆ = 3, c₈ = 1
      (the eleven non-constant critical points of prop. o2:exist).

  WHAT THIS CERTIFICATE DOES NOT PROVE:
  the Morse inequalities themselves (Palais–Smale, C², nondegeneracy —
  Hypothesis o2:ps), or L-P0. The certificate discharges the
  arithmetic that those hypotheses feed.
-/
import Mathlib

namespace O2

open Finset

/- ------------------------------------------------------------------
   §1  The termwise squeeze
   ------------------------------------------------------------------ -/

/-- **Lacunary squeeze.** Termwise domination with equal totals forces
    termwise equality. -/
theorem termwise_squeeze {n : ℕ} (b c : Fin n → ℕ)
    (hle : ∀ i, b i ≤ c i) (hsum : ∑ i, b i = ∑ i, c i) :
    ∀ i, b i = c i := by
  by_contra h
  push_neg at h
  obtain ⟨j, hj⟩ := h
  have hlt : b j < c j := lt_of_le_of_ne (hle j) hj
  have hstrict : ∑ i, b i < ∑ i, c i :=
    Finset.sum_lt_sum (fun i _ => hle i) ⟨j, Finset.mem_univ j, hlt⟩
  omega

/- ------------------------------------------------------------------
   §2  The Betti instantiation
   ------------------------------------------------------------------ -/

/-- The Betti vector of K₈. -/
def b : Fin 9 → ℕ := ![1, 0, 3, 0, 4, 0, 3, 0, 1]

theorem odd_betti_vanish : b 1 = 0 ∧ b 3 = 0 ∧ b 5 = 0 ∧ b 7 = 0 := by
  decide

theorem total_twelve : ∑ i, b i = 12 := by decide

/-- Signed equals unsigned when the odd entries vanish:
    Σ(−1)^i bᵢ = Σ bᵢ = 12 = χ(K₈). -/
theorem alternating_total :
    (∑ i : Fin 9, (-1 : ℤ) ^ (i : ℕ) * (b i : ℤ)) = 12 := by decide

/-- **Perfection.** Any critical-count vector dominating the Betti
    vector with total twelve equals it termwise. -/
theorem perfection (c : Fin 9 → ℕ)
    (hle : ∀ i, b i ≤ c i) (h12 : ∑ i, c i = 12) :
    ∀ i, c i = b i := by
  intro i
  exact (termwise_squeeze b c hle (total_twelve.trans h12.symm) i).symm

/-- The uniqueness entry: c₀ = 1. -/
theorem c0_eq_one (c : Fin 9 → ℕ)
    (hle : ∀ i, b i ≤ c i) (h12 : ∑ i, c i = 12) :
    c 0 = 1 := by
  rw [perfection c hle h12 0]
  decide

/-- The existence entries of prop. o2:exist: the eleven non-constant
    critical points, index by index. -/
theorem existence_entries (c : Fin 9 → ℕ) (hle : ∀ i, b i ≤ c i) :
    3 ≤ c 2 ∧ 4 ≤ c 4 ∧ 3 ≤ c 6 ∧ 1 ≤ c 8 :=
  ⟨le_trans (by decide) (hle 2),
   le_trans (by decide) (hle 4),
   le_trans (by decide) (hle 6),
   le_trans (by decide) (hle 8)⟩

theorem eleven_nonconstant : (3 : ℕ) + 4 + 3 + 1 = 11 := by decide

end O2
