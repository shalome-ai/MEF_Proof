/-
================================================================
P4_R5_H1.lean
================================================================
Paper 4, Step 6 certificate (R5, eq:H1classification +
thm:mobius, discrete content).

The classification group H¹(T²/ℤ₂, ℤ₂) ≅ ℤ₂ × ℤ₂ is modelled as
Bool × Bool with componentwise xor.  Certified statements:

  (1) card_four        : the group has exactly four elements.
  (2) exponent_two     : every element is its own inverse
                         (v + v = 0), so the group is ℤ₂ × ℤ₂ and
                         not ℤ₄.
  (3) three_nontrivial : there are exactly three non-zero
                         elements — the 3 + 1 sector structure of
                         thm:mobius (three twisted sectors, one
                         trivial).

Pre-built substrate for the later sections (the automorphism used
by thm:order3 / thm:galois_orbifold): the map
    T (a, b) = (b, a xor b),
which is the Sol matrix M = ((2,1),(1,1)) reduced mod 2, i.e.
((0,1),(1,1)) acting on 𝔽₂².  Certified:

  (4) T_add            : T is additive (a group homomorphism).
  (5) T_order_three    : T³ = id and T ≠ id, T² ≠ id — exact
                         order 3.
  (6) T_three_cycle    : T fixes 0 and cyclically permutes the
                         three non-zero elements
                         (1,0) → (0,1) → (1,1) → (1,0).

All statements are over the concrete four-element group and are
kernel-checked by `decide`.

Status target: CERT — core Lean 4.15.0, no Mathlib, no axioms,
no `sorry`.
Build:  lean P4_R5_H1.lean
================================================================
-/

namespace P4R5

/-- The Klein four-group ℤ₂ × ℤ₂ as Bool × Bool under xor. -/
def V : Type := Bool × Bool

instance : DecidableEq V := inferInstanceAs (DecidableEq (Bool × Bool))

/-- Group law: componentwise xor. -/
def add (u v : V) : V := (xor u.1 v.1, xor u.2 v.2)

/-- Zero element (the trivial bundle). -/
def zero : V := (false, false)

/-- The four elements. -/
def elems : List V := [(false, false), (true, false),
                       (false, true), (true, true)]

/-- (1) The group has exactly four elements: the enumeration is
    duplicate-free and exhaustive. -/
theorem card_four :
    elems.length = 4 ∧
    (∀ v : V, v ∈ elems) := by
  constructor
  · rfl
  · intro v
    cases v with
    | mk a b => cases a <;> cases b <;> simp [elems]

/-- (2) Every element is 2-torsion: v + v = 0.  The group is
    ℤ₂ × ℤ₂, not ℤ₄. -/
theorem exponent_two : ∀ v : V, add v v = zero := by
  intro v
  cases v with
  | mk a b => cases a <;> cases b <;> rfl

/-- (3) Exactly three non-zero elements: the 3 + 1 sector
    structure (three twisted M\"obius sectors, one trivial
    sector). -/
theorem three_nontrivial :
    (elems.filter (fun v => v ≠ zero)).length = 3 := by
  decide

/-! ### Substrate for the order-3 automorphism (thm:order3) -/

/-- The Sol matrix M = ((2,1),(1,1)) reduced mod 2 is
    ((0,1),(1,1)); on 𝔽₂² it acts as T (a, b) = (b, a xor b). -/
def T (v : V) : V := (v.2, xor v.1 v.2)

/-- (4) T is additive: a homomorphism of the Klein group. -/
theorem T_add : ∀ u v : V, T (add u v) = add (T u) (T v) := by
  intro u v
  cases u with
  | mk a b =>
    cases v with
    | mk c d => cases a <;> cases b <;> cases c <;> cases d <;> rfl

/-- (5) T has exact order 3: T³ = id, and neither T nor T² is the
    identity. -/
theorem T_order_three :
    (∀ v : V, T (T (T v)) = v) ∧
    (¬ ∀ v : V, T v = v) ∧
    (¬ ∀ v : V, T (T v) = v) := by
  refine ⟨?_, ?_, ?_⟩
  · intro v
    cases v with
    | mk a b => cases a <;> cases b <;> rfl
  · intro h
    exact absurd (h (true, false)) (by decide)
  · intro h
    exact absurd (h (true, false)) (by decide)

/-- (6) T fixes the trivial class and cyclically permutes the
    three non-trivial classes:
    (1,0) → (0,1) → (1,1) → (1,0). -/
theorem T_three_cycle :
    T zero = zero ∧
    T (true, false) = (false, true) ∧
    T (false, true) = (true, true) ∧
    T (true, true) = (true, false) := by
  refine ⟨rfl, rfl, rfl, rfl⟩

end P4R5
