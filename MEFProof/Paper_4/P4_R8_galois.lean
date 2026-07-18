/-
================================================================
P4_R8_galois.lean
================================================================
Paper 4, Step 9 certificate (R8: prop:galois inputs +
thm:galoisorbifold, discrete content).

The field theory of prop:galois (splitting fields, the Galois
correspondence) is external; its arithmetic INPUTS and the
theorem's group-combinatorial content are certified.

  (1) arithmetic inputs (prop:galois): 5, 6 and 30 are squarefree
      and none is a perfect square; 5 ≠ 6 — the hypotheses of the
      linear-disjointness argument, kernel-checked.
  (2) subgroup count: the Klein group V = ℤ₂ × ℤ₂ (Bool × Bool
      under xor, as in P4_R5_H1.lean) has exactly three order-2
      subgroups, {0, v} for the three non-zero v, each closed
      under the group law — the combinatorial skeleton of the
      three intermediate fields.
  (3) Aut(V) ≅ S₃: an additive endomorphism of V is determined by
      the images of the basis e₁ = (1,0), e₂ = (0,1); exactly six
      choices give automorphisms, and all six are additive and
      bijective — the full permutation group of the three
      non-trivial elements.
  (4) equivariance pinning (the uniqueness clause of
      thm:galoisorbifold): of the six automorphisms, exactly
      three commute with the order-3 element T (the centraliser
      ⟨T⟩), and exactly three intertwine T with T² = T⁻¹; the two
      classes partition Aut(V).  An equivariant identification is
      therefore pinned up to the two 3-cycle orientations.

All checks are kernel `decide` over the concrete four-element
group and the explicit six-element automorphism list.

Status target: CERT — core Lean 4.15.0, no Mathlib, no axioms,
no `sorry`.
Build:  lean P4_R8_galois.lean
================================================================
-/

namespace P4R8

/-! ### (1) Arithmetic inputs to prop:galois -/

/-- n is squarefree in the bounded, kernel-checkable sense: no
    d ≥ 2 with d² dividing n. -/
def squarefree (n : Nat) : Bool :=
  (List.range (n + 1)).all
    (fun d => decide (d < 2) || decide (n % (d * d) ≠ 0))

/-- Bounded perfect-square test. -/
def isSquare (n : Nat) : Bool :=
  (List.range (n + 1)).any (fun r => r * r == n)

/-- 5, 6, 30 squarefree; none a perfect square; 5 ≠ 6.  These are
    the arithmetic hypotheses of the linear-disjointness argument
    in prop:galois (6/5 is not a rational square because 5·6 = 30
    is squarefree and greater than 1). -/
theorem arithmetic_inputs :
    squarefree 5 = true ∧ squarefree 6 = true ∧
    squarefree 30 = true ∧
    isSquare 5 = false ∧ isSquare 6 = false ∧
    isSquare 30 = false ∧ (5 ≠ 6) := by
  decide

/-! ### The Klein group, as in P4_R5_H1.lean -/

abbrev V := Bool × Bool

def add (u v : V) : V := (xor u.1 v.1, xor u.2 v.2)

def zero : V := (false, false)

def elems : List V := [(false, false), (true, false),
                       (false, true), (true, true)]

/-- The order-3 automorphism (the reduction M̄ of the matrix M,
    certified in P4_R5_H1.lean and P4_R7_sol.lean). -/
def T (v : V) : V := (v.2, xor v.1 v.2)

/-! ### (2) Exactly three order-2 subgroups -/

/-- The subset {0, v} is closed under the group law. -/
def pairClosed (v : V) : Bool :=
  (add v v == zero) && (add zero v == v) && (add v zero == v)

/-- Each of the three non-zero elements spans an order-2 subgroup
    {0, v}, and there are exactly three such: the skeleton of the
    three intermediate quadratic fields. -/
theorem three_subgroups :
    (elems.filter (fun v => (v != zero) && pairClosed v)).length
      = 3 := by
  decide

/-! ### (3) Aut(V) ≅ S₃ via basis images -/

/-- The additive extension of the basis assignment
    e₁ ↦ p.1, e₂ ↦ p.2. -/
def ext (p : V × V) (v : V) : V :=
  add (if v.1 then p.1 else zero) (if v.2 then p.2 else zero)

/-- The six basis assignments with independent non-zero images:
    ordered pairs of distinct non-zero elements. -/
def autoList : List (V × V) :=
  [((true, false), (false, true)),
   ((true, false), (true, true)),
   ((false, true), (true, false)),
   ((false, true), (true, true)),
   ((true, true), (true, false)),
   ((true, true), (false, true))]

def isAdditive (p : V × V) : Bool :=
  elems.all (fun u => elems.all
    (fun v => ext p (add u v) == add (ext p u) (ext p v)))

def isBijective (p : V × V) : Bool :=
  elems.all (fun u => elems.any (fun v => ext p v == u))

/-- All six candidates are additive bijections — Aut(V) has (at
    least, and by determination on the basis exactly) the six
    elements of S₃, the full permutation group of the three
    non-trivial classes. -/
theorem six_automorphisms :
    autoList.all (fun p => isAdditive p && isBijective p)
      = true ∧
    autoList.length = 6 := by
  constructor
  · decide
  · rfl

/-! ### (4) The equivariance pinning -/

def commutesT (p : V × V) : Bool :=
  elems.all (fun v => ext p (T v) == T (ext p v))

def intertwinesTinv (p : V × V) : Bool :=
  elems.all (fun v => ext p (T v) == T (T (ext p v)))

/-- Exactly three automorphisms commute with T (the centraliser
    ⟨T⟩ of the 3-cycle), exactly three intertwine T with
    T² = T⁻¹ (the opposite orientation), and the two classes
    partition Aut(V): an equivariant identification is unique up
    to the two 3-cycle orientations —
    Aut(ℤ/3ℤ) ≅ ℤ/2ℤ, the uniqueness clause of
    thm:galoisorbifold. -/
theorem equivariance_pinning :
    (autoList.filter commutesT).length = 3 ∧
    (autoList.filter intertwinesTinv).length = 3 ∧
    autoList.all
      (fun p => xor (commutesT p) (intertwinesTinv p)) = true := by
  refine ⟨?_, ?_, ?_⟩
  · decide
  · decide
  · decide

end P4R8
