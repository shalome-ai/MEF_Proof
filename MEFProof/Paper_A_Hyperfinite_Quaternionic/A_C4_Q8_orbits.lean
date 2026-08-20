/-
  A_C4_Q8_orbits.lean  —  Paper A certificate C4.
  Q₈ = {±1, ±i, ±j, ±k} is encoded on Fin 8:
    0 ↦ 1,  1 ↦ −1,  2 ↦ i,  3 ↦ −i,  4 ↦ j,  5 ↦ −j,  6 ↦ k,  7 ↦ −k.
  Generators of G = V × Z acting on Q₈:
    adI = Ad_i (fixes ±1, ±i; negates j, k),
    adJ = Ad_j (fixes ±1, ±j; negates i, k),
    neg = the central antipodal map q ↦ −q.
  Statements certified:
    (1) reach q q' ↔ q' = q ∨ q' = neg q
        — every G-orbit is exactly the antipodal pair {q, −q};
    (2) neg q ≠ q for all q — each orbit has degree exactly 2;
    (3) the four representatives 0, 2, 4, 6 are pairwise non-equivalent
        — there are exactly four orbits;
    (4) conj (= Θ|_{Q₈}, inversion) fixes exactly {±1} — the
        distinguished orbit (Paper A §4);
    (5) without the antipodal generator, 1 and −1 are NOT connected:
        the group ⟨Ad_i, Ad_j, conj⟩ gives five orbits, not four
        (the essential-central-factor remark, Paper A §4).
  Lean 4.29.1, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC4

abbrev Q8 := Fin 8

/-- Antipodal map q ↦ −q : swaps within each pair. -/
def neg : Q8 → Q8
  | 0 => 1 | 1 => 0 | 2 => 3 | 3 => 2
  | 4 => 5 | 5 => 4 | 6 => 7 | 7 => 6

/-- Ad_i : fixes ±1, ±i; negates ±j, ±k. -/
def adI : Q8 → Q8
  | 0 => 0 | 1 => 1 | 2 => 2 | 3 => 3
  | 4 => 5 | 5 => 4 | 6 => 7 | 7 => 6

/-- Ad_j : fixes ±1, ±j; negates ±i, ±k. -/
def adJ : Q8 → Q8
  | 0 => 0 | 1 => 1 | 2 => 3 | 3 => 2
  | 4 => 4 | 5 => 5 | 6 => 7 | 7 => 6

/-- Θ|_{Q₈} : quaternionic conjugation, i.e. inversion q ↦ q̄ = q⁻¹.
    Fixes ±1; negates the imaginary units. -/
def conj : Q8 → Q8
  | 0 => 0 | 1 => 1 | 2 => 3 | 3 => 2
  | 4 => 5 | 5 => 4 | 6 => 7 | 7 => 6

/-- Reachability under the full group G = ⟨Ad_i, Ad_j, neg⟩. -/
inductive reach : Q8 → Q8 → Prop
  | refl (q : Q8) : reach q q
  | stepI {q r : Q8} : reach q r → reach q (adI r)
  | stepJ {q r : Q8} : reach q r → reach q (adJ r)
  | stepN {q r : Q8} : reach q r → reach q (neg r)

/-- Reachability under V × ⟨conj⟩ only (no antipodal generator). -/
inductive reach' : Q8 → Q8 → Prop
  | refl (q : Q8) : reach' q q
  | stepI {q r : Q8} : reach' q r → reach' q (adI r)
  | stepJ {q r : Q8} : reach' q r → reach' q (adJ r)
  | stepC {q r : Q8} : reach' q r → reach' q (conj r)

-- Elementary facts, all by finite check.
theorem adI_pair : ∀ q : Q8, adI q = q ∨ adI q = neg q := by decide
theorem adJ_pair : ∀ q : Q8, adJ q = q ∨ adJ q = neg q := by decide
theorem neg_neg : ∀ q : Q8, neg (neg q) = q := by decide
theorem neg_ne : ∀ q : Q8, neg q ≠ q := by decide

/-- (1)  The G-orbit of q is exactly {q, −q}. -/
theorem reach_iff (q r : Q8) : reach q r ↔ (r = q ∨ r = neg q) := by
  constructor
  · intro h
    induction h with
    | refl => exact Or.inl rfl
    | stepI h ih =>
      rcases ih with h1 | h1 <;> rcases adI_pair _ with h2 | h2
      · exact Or.inl (h2.trans h1)
      · exact Or.inr (by rw [h2, h1])
      · exact Or.inr (h2.trans h1)
      · exact Or.inl (by rw [h2, h1, neg_neg])
    | stepJ h ih =>
      rcases ih with h1 | h1 <;> rcases adJ_pair _ with h2 | h2
      · exact Or.inl (h2.trans h1)
      · exact Or.inr (by rw [h2, h1])
      · exact Or.inr (h2.trans h1)
      · exact Or.inl (by rw [h2, h1, neg_neg])
    | stepN h ih =>
      rcases ih with h1 | h1
      · exact Or.inr (by rw [h1])
      · exact Or.inl (by rw [h1, neg_neg])
  · intro h
    rcases h with h | h
    · rw [h]; exact reach.refl q
    · rw [h]; exact reach.stepN (reach.refl q)

/-- (3)  The four blocks are pairwise distinct orbits. -/
theorem four_orbits :
    ¬ reach 0 2 ∧ ¬ reach 0 4 ∧ ¬ reach 0 6 ∧
    ¬ reach 2 4 ∧ ¬ reach 2 6 ∧ ¬ reach 4 6 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;>
    (intro h; rcases (reach_iff _ _).mp h with h1 | h1 <;> simp [neg] at h1)

/-- (4)  The Θ-fixed subset of Q₈ is exactly {±1}: the distinguished orbit. -/
theorem conj_fixed : ∀ q : Q8, conj q = q ↔ (q = 0 ∨ q = 1) := by decide

/-- Θ preserves every orbit (it maps each antipodal pair to itself). -/
theorem conj_pair : ∀ q : Q8, conj q = q ∨ conj q = neg q := by decide

/-- (5)  Without the central factor: nothing in ⟨Ad_i, Ad_j, conj⟩ moves 1,
    so 1 and −1 lie in different orbits and the decomposition has five
    orbits, not four. -/
theorem one_isolated_without_centre : ¬ reach' 0 1 := by
  have hfix : ∀ r : Q8, reach' 0 r → r = 0 := by
    intro r h
    induction h with
    | refl => rfl
    | stepI h ih => rw [ih]; decide
    | stepJ h ih => rw [ih]; decide
    | stepC h ih => rw [ih]; decide
  intro h
  have := hfix 1 h
  simp at this

#print axioms reach_iff
#print axioms four_orbits
#print axioms conj_fixed
#print axioms one_isolated_without_centre

end AC4
