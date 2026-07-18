/-
  O1_certificate.lean — Lean 4 (Mathlib)
  Work package O1: exactness of the stratification — the c₀-only retreat.

  WHAT THIS CERTIFICATE PROVES (finite counting layer only):
  (1) The partition-counting core of Theorem o1:czero: over ANY finite
      critical set carrying an index labelling and a symmetric/broken
      labelling, if every non-symmetric point has index ≥ 1
      (Hypothesis B) and the symmetric index-0 count is exactly one
      (Hypothesis U), then the total index-0 count is exactly one.
  (2) The concrete 12-point target model: index multiset
      {0, 2,2,2, 4,4,4,4, 6,6,6, 8} has index-0 count 1 and per-index
      counts matching the Betti vector (1,0,3,0,4,0,3,0,1).

  WHAT THIS CERTIFICATE DOES NOT PROVE:
  Hypothesis B (index cost of symmetry breaking) or Hypothesis U
  (symmetric uniqueness at index zero) — these are statements about
  the second variation of ω on a Banach manifold and are outside
  decidable scope. The certificate discharges only the bookkeeping
  that turns the two hypotheses into c₀ = 1.
-/
import Mathlib

namespace O1

open Finset

/- ------------------------------------------------------------------
   §1  The partition-counting theorem
   ------------------------------------------------------------------ -/

variable {P : Type*} [Fintype P]

/-- **c₀-only counting.** If every non-symmetric critical point has
    index ≥ 1, and exactly one symmetric critical point has index 0,
    then exactly one critical point has index 0. -/
theorem c0_only (idx : P → ℕ) (sym : P → Bool)
    (hbreak : ∀ p, sym p = false → 1 ≤ idx p)
    (hsymuniq : (univ.filter (fun p => sym p = true ∧ idx p = 0)).card = 1) :
    (univ.filter (fun p => idx p = 0)).card = 1 := by
  have hset : (univ.filter (fun p => idx p = 0))
      = (univ.filter (fun p => sym p = true ∧ idx p = 0)) := by
    ext p
    simp only [mem_filter, mem_univ, true_and]
    constructor
    · intro h0
      refine ⟨?_, h0⟩
      cases hsp : sym p with
      | false =>
          exfalso
          have h1 := hbreak p hsp
          omega
      | true => rfl
    · exact fun h => h.2
  rw [hset]
  exact hsymuniq

/-- Monotone consequence recorded separately: under Hypothesis B
    alone, the index-0 count is bounded by the symmetric index-0
    count (uniqueness transfers; existence needs no hypothesis). -/
theorem c0_le_sym (idx : P → ℕ) (sym : P → Bool)
    (hbreak : ∀ p, sym p = false → 1 ≤ idx p) :
    (univ.filter (fun p => idx p = 0)).card
      ≤ (univ.filter (fun p => sym p = true ∧ idx p = 0)).card := by
  apply card_le_card
  intro p hp
  simp only [mem_filter, mem_univ, true_and] at hp ⊢
  refine ⟨?_, hp⟩
  cases hsp : sym p with
  | false =>
      exfalso
      have h1 := hbreak p hsp
      omega
  | true => rfl

/- ------------------------------------------------------------------
   §2  The concrete 12-point target model
   ------------------------------------------------------------------ -/

/-- The index multiset of the target critical structure:
    one minimum, then saddles of index 2, 4, 6, 8 with
    multiplicities 3, 4, 3, 1. -/
def idxModel : Fin 12 → ℕ := ![0, 2, 2, 2, 4, 4, 4, 4, 6, 6, 6, 8]

theorem model_c0 :
    (univ.filter (fun p => idxModel p = 0)).card = 1 := by decide

theorem model_c2 :
    (univ.filter (fun p => idxModel p = 2)).card = 3 := by decide

theorem model_c4 :
    (univ.filter (fun p => idxModel p = 4)).card = 4 := by decide

theorem model_c6 :
    (univ.filter (fun p => idxModel p = 6)).card = 3 := by decide

theorem model_c8 :
    (univ.filter (fun p => idxModel p = 8)).card = 1 := by decide

theorem model_all_even :
    ∀ p, idxModel p % 2 = 0 := by decide

theorem model_saddles_ge_two :
    ∀ p, idxModel p ≠ 0 → 2 ≤ idxModel p := by decide

end O1
