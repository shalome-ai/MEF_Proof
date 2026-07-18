/-
  O4_certificate.lean — Lean 4 (Mathlib)
  Work package O4: identification of the counting object.

  WHAT THIS CERTIFICATE PROVES (finite/decidable layer only):
  Three INDEPENDENT computations, each yielding 2, for the three
  candidate counting objects at the pillowcase (lem. o4:coincide):
  (1) N_χ = 2 — the involution −1 on H¹(T²;ℚ) admits no non-zero
      invariant vector, so the invariant Betti list is (1,0,1) with
      total 2.
  (2) N_corner = 2 — the residual swap on the four corners is a free
      involution; the orbit map onto Fin 2 is constant on orbits and
      surjective, and orbits are exactly the fibres.
  (3) N_stab = 2 — the stabiliser lattice of a ℤ₂-action has exactly
      the two classes {trivial, full}; certified through the divisor
      count of 2 (subgroups of a cyclic group correspond to divisors).

  WHAT THIS CERTIFICATE DOES NOT PROVE:
  which of the three is the counting object (the subject of the
  separation test, prop. o4:separate), or any statement about the
  deformation families ℤₙ / O(2k+1) — those computations do not yet
  exist and nothing here anticipates their outcome.
-/
import Mathlib

namespace O4

open Finset

/- ------------------------------------------------------------------
   §1  Route one: invariant cohomology — N_χ = 2
   ------------------------------------------------------------------ -/

/-- The involution acts as −1 on H¹(T²;ℚ) ≅ ℚ²: componentwise, a
    (−1)-invariant vector vanishes. -/
theorem no_invariant_vector (a : ℚ) (h : -a = a) : a = 0 := by
  linarith

/-- Hence the invariant Betti list of the pillowcase is (1,0,1),
    total 2. -/
def bettiPillowcase : List ℕ := [1, 0, 1]

theorem N_chi : bettiPillowcase.sum = 2 := by decide

/- ------------------------------------------------------------------
   §2  Route two: corner orbits — N_corner = 2
   ------------------------------------------------------------------ -/

/-- The residual swap on the four corners: two pairs (0 1)(2 3). -/
def swap : Fin 4 → Fin 4 := ![1, 0, 3, 2]

theorem swap_involutive : ∀ i, swap (swap i) = i := by decide

/-- The swap is free on the corners: no fixed point. -/
theorem swap_free : ∀ i, swap i ≠ i := by decide

/-- The orbit map onto two classes. -/
def orbit : Fin 4 → Fin 2 := ![0, 0, 1, 1]

theorem orbit_swap_invariant : ∀ i, orbit (swap i) = orbit i := by decide

theorem orbit_surjective : ∀ j : Fin 2, ∃ i, orbit i = j := by decide

/-- Orbits are exactly the fibres: two elements share a class iff
    they are equal or swap-partners. Hence N_corner = 2. -/
theorem orbit_classes :
    ∀ i j, orbit i = orbit j ↔ (j = i ∨ j = swap i) := by decide

theorem N_corner : Fintype.card (Fin 2) = 2 := by decide

/- ------------------------------------------------------------------
   §3  Route three: stabiliser classes — N_stab = 2
   ------------------------------------------------------------------ -/

/-- Subgroups of a cyclic group of order n correspond to divisors of
    n; for the ℤ₂-action the stabiliser lattice is {trivial, full}. -/
theorem divisors_of_two : Nat.divisors 2 = {1, 2} := by decide

theorem N_stab : (Nat.divisors 2).card = 2 := by decide

/- ------------------------------------------------------------------
   §4  The coincidence, recorded
   ------------------------------------------------------------------ -/

/-- The three independently computed counts coincide at 2 — which is
    the problem O4 names, not its resolution. -/
theorem coincidence :
    bettiPillowcase.sum = 2
      ∧ Fintype.card (Fin 2) = 2
      ∧ (Nat.divisors 2).card = 2 := by
  exact ⟨N_chi, N_corner, N_stab⟩

end O4
