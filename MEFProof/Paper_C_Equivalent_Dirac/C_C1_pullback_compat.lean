/-
  C_C1_pullback_compat.lean
  Paper C — certificate C1 (node C7 discharge).

  Line bundles on CP^{2n} are classified by their degree in
  H^2(CP^{2n}; Z) ≅ Z, and pullback along a degree-one (linear)
  embedding e : CP^{2n} ↪ CP^{2(n+1)} acts on degrees as the identity.
  A tower of twists is therefore a sequence k : Nat → Int of degrees
  (index n ↔ stage n+1), and pullback compatibility e* L_{n+1} ≅ L_n
  is the condition  k (n+1) = k n  for every n.

  Certified statements:
  (1) compatible_iff_constant : a family is pullback-compatible iff
      it equals its base value at every stage.
  (2) constant_compatible / constant_odd : the constant family of any
      odd degree is compatible and odd at every stage.
  (3) canonicalTower_* : the canonical instance, constant degree 3.
  (4) unique_compatible_extension : a compatible family is determined
      by its base value; with base value 3 it is identically 3.
  (5) stagewise_canonical_not_compatible : the stagewise anticanonical
      family — degree 2n+1 on CP^{2n}, i.e. 2n+3 under index n ↔
      stage n+1 — is NOT pullback-compatible.
  (6) stagewise_canonical_odd : that family is nonetheless odd at
      every stage; compatibility, not parity, is what fails.

  Lean 4.15.0, core only. No axioms, no sorry.
-/

namespace PaperC.C1

/-- Pullback compatibility of a degree family along degree-one embeddings. -/
def Compatible (k : Nat → Int) : Prop :=
  ∀ n : Nat, k (n + 1) = k n

/-- Oddness of a degree family at every stage. -/
def OddFamily (k : Nat → Int) : Prop :=
  ∀ n : Nat, ∃ m : Int, k n = 2 * m + 1

/-- (1) A family is compatible iff it is constant. -/
theorem compatible_iff_constant (k : Nat → Int) :
    Compatible k ↔ ∀ n, k n = k 0 := by
  constructor
  · intro h n
    induction n with
    | zero => rfl
    | succ n ih =>
        rw [h n]
        exact ih
  · intro h n
    rw [h (n + 1), h n]

/-- (2a) Any constant family is compatible. -/
theorem constant_compatible (c : Int) : Compatible (fun _ => c) := by
  intro n
  rfl

/-- (2b) The constant family of odd degree is odd at every stage. -/
theorem constant_odd (m : Int) : OddFamily (fun _ => 2 * m + 1) := by
  intro n
  exact ⟨m, rfl⟩

/-- (3) The canonical instance: the constant family of degree 3,
    the anticanonical degree of the base stage CP^2. -/
def canonicalTower : Nat → Int := fun _ => 3

theorem canonicalTower_compatible : Compatible canonicalTower :=
  constant_compatible 3

theorem canonicalTower_odd : OddFamily canonicalTower := by
  intro n
  exact ⟨1, rfl⟩

/-- (4) Uniqueness of the compatible extension of the canonical base
    twist: a compatible family with base value 3 is identically 3. -/
theorem unique_compatible_extension (k : Nat → Int)
    (hc : Compatible k) (h0 : k 0 = 3) : ∀ n, k n = 3 := by
  intro n
  rw [(compatible_iff_constant k).mp hc n, h0]

/-- The stagewise anticanonical family: degree 2n+1 on CP^{2n};
    with index n ↔ stage n+1 this is degree 2n+3. -/
def stagewiseCanonical : Nat → Int := fun n => 2 * (n : Int) + 3

/-- (5) The stagewise anticanonical family is not pullback-compatible. -/
theorem stagewise_canonical_not_compatible :
    ¬ Compatible stagewiseCanonical := by
  intro h
  have h0 := h 0
  simp only [stagewiseCanonical] at h0
  omega

/-- (6) …although it is odd at every stage: parity is not what fails. -/
theorem stagewise_canonical_odd : OddFamily stagewiseCanonical := by
  intro n
  refine ⟨(n : Int) + 1, ?_⟩
  simp only [stagewiseCanonical]
  omega

end PaperC.C1
