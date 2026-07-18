/-
================================================================
P4_R7_sol.lean
================================================================
Paper 4, Step 7 certificate (R7: prop:commute, thm:threecycle,
prop:golden, thm:orderthree, cor:autbundle).

The matrix M = ((2,1),(1,1)) ∈ SL(2, ℤ) acts on ℤ-pairs by
Mact (a, b) = (2a + b, a + b).  Certified statements:

  (1) det_trace      : det M = 1 and tr M = 3 (hyperbolic:
                       tr > 2).
  (2) commute        : Mact (−v) = −(Mact v) — M commutes with
                       σ = −id, so it descends to the pillowcase
                       (prop:commute).
  (3) three_cycle    : the descended action on the four 2-torsion
                       points.  A half-lattice point (a/2, b/2) is
                       represented by its numerator pair
                       (a, b) ∈ {0,1}²; the action mod ℤ² is the
                       numerator action mod 2.  Certified: P₁ is
                       fixed and P₂ → P₃ → P₄ → P₂ — the exact
                       evaluations of thm:threecycle's proof.
  (4) golden algebra : in ℤ[√5], with x = a + b√5 encoded as
                       (a, b) and (a,b)·(c,d) = (ac + 5bd, ad+bc):
        (4a) 2φ = 1 + √5 satisfies the doubled fixed-point
             equation x² = 2x + 4  (i.e. τ² = τ + 1, cleared of
             denominators) — and so does 2φ̄ = 1 − √5;
        (4b) the multiplier: (2φ)⁴ = 8·(7 + 3√5), certifying
             φ⁴ = (7 + 3√5)/2;
        (4c) the eigenvalue check: y = 2φ² = 3 + √5 satisfies
             y² = 6y − 4, the doubled characteristic equation
             λ² − 3λ + 1 = 0 of M — so φ² is an eigenvalue of M.
  (5) order_three    : M̄ = M mod 2 = ((0,1),(1,1)) satisfies
                       M̄³ = I, M̄ ≠ I, M̄² ≠ I over 𝔽₂ (entries
                       mod 2), and λ² + λ + 1 has no root in 𝔽₂.
  (6) consistency    : the mod-2 matrix action coincides with the
                       map T (a, b) = (b, a xor b) certified in
                       P4_R5_H1.lean — the bundle-lattice and
                       2-torsion actions are the same
                       (cor:autbundle at the level of the acting
                       map).

Status target: CERT — core Lean 4.15.0, no Mathlib, no axioms,
no `sorry`.
Build:  lean P4_R7_sol.lean
================================================================
-/

namespace P4R7

/-! ### The matrix and its integer action -/

/-- M = ((2,1),(1,1)) acting on integer pairs. -/
def Mact (v : Int × Int) : Int × Int := (2 * v.1 + v.2, v.1 + v.2)

/-- (1) det M = 2·1 − 1·1 = 1 and tr M = 3. -/
theorem det_trace : (2 * 1 - 1 * 1 : Int) = 1 ∧ (2 + 1 : Int) = 3 := by
  decide

/-- (2) prop:commute — M is linear, so it commutes with negation
    and descends to T²/ℤ₂. -/
theorem commute (v : Int × Int) :
    Mact (-v.1, -v.2) = (-(Mact v).1, -(Mact v).2) := by
  simp [Mact]
  omega

/-! ### (3) thm:threecycle — the half-lattice evaluations -/

/-- Numerator action: a half-lattice point (a/2, b/2) maps under M
    to ((2a+b)/2, (a+b)/2); equivalence mod ℤ² is congruence of
    numerators mod 2. -/
def MactMod2 (v : Nat × Nat) : Nat × Nat :=
  ((2 * v.1 + v.2) % 2, (v.1 + v.2) % 2)

/-- The four evaluations worked by hand in the proof of
    thm:threecycle: P₁ = (0,0) fixed; P₂ = (1,0) → P₃ = (0,1);
    P₃ → P₄ = (1,1); P₄ → P₂. -/
theorem three_cycle :
    MactMod2 (0, 0) = (0, 0) ∧
    MactMod2 (1, 0) = (0, 1) ∧
    MactMod2 (0, 1) = (1, 1) ∧
    MactMod2 (1, 1) = (1, 0) := by
  decide

/-- The permutation has order 3 on the orbit: three applications
    return each non-trivial point to itself. -/
theorem three_cycle_order :
    MactMod2 (MactMod2 (MactMod2 (1, 0))) = (1, 0) ∧
    MactMod2 (MactMod2 (MactMod2 (0, 1))) = (0, 1) ∧
    MactMod2 (MactMod2 (MactMod2 (1, 1))) = (1, 1) := by
  decide

/-! ### (4) prop:golden — the ℤ[√5] algebra, denominators cleared -/

/-- ℤ[√5]: x = a + b√5 encoded as (a, b). -/
abbrev Zs5 := Int × Int

def mul (x y : Zs5) : Zs5 :=
  (x.1 * y.1 + 5 * x.2 * y.2, x.1 * y.2 + x.2 * y.1)

def smul (n : Int) (x : Zs5) : Zs5 := (n * x.1, n * x.2)

def addZ (x y : Zs5) : Zs5 := (x.1 + y.1, x.2 + y.2)

/-- (4a) The doubled fixed-point equation: with x = 2φ = 1 + √5,
    x² = 2x + 4, which is τ² − τ − 1 = 0 cleared of denominators;
    the conjugate 2φ̄ = 1 − √5 satisfies the same equation. -/
theorem golden_fixed_point :
    mul (1, 1) (1, 1) = addZ (smul 2 (1, 1)) (4, 0) ∧
    mul (1, -1) (1, -1) = addZ (smul 2 (1, -1)) (4, 0) := by
  decide

/-- (4b) The multiplier: (2φ)⁴ = 56 + 24√5 = 8·(7 + 3√5),
    certifying φ⁴ = (7 + 3√5)/2. -/
theorem golden_multiplier :
    mul (mul (1, 1) (1, 1)) (mul (1, 1) (1, 1)) = (56, 24) ∧
    smul 8 (7, 3) = (56, 24) := by
  decide

/-- (4c) The eigenvalue check: y = 2φ² = 3 + √5 satisfies
    y² = 6y − 4, the characteristic equation λ² − 3λ + 1 = 0 of M
    with denominators cleared — φ² is an eigenvalue of M (and by
    conjugation so is φ⁻² = (3 − √5)/2). -/
theorem golden_eigenvalue :
    mul (3, 1) (3, 1) = addZ (smul 6 (3, 1)) (-4, 0) ∧
    mul (3, -1) (3, -1) = addZ (smul 6 (3, -1)) (-4, 0) := by
  decide

/-! ### (5) thm:orderthree — the mod-2 reduction -/

/-- 2×2 matrices over 𝔽₂ as Bool-quadruples ((a,b),(c,d)) with
    xor-addition arithmetic; multiplication is the usual matrix
    product over 𝔽₂ (and = xor, or... implemented via Bool). -/
abbrev F2 := Bool

def f2mul (x y : F2) : F2 := x && y
def f2add (x y : F2) : F2 := xor x y

structure Mat2 where
  a : F2
  b : F2
  c : F2
  d : F2
deriving DecidableEq

def matmul (X Y : Mat2) : Mat2 :=
  ⟨f2add (f2mul X.a Y.a) (f2mul X.b Y.c),
   f2add (f2mul X.a Y.b) (f2mul X.b Y.d),
   f2add (f2mul X.c Y.a) (f2mul X.d Y.c),
   f2add (f2mul X.c Y.b) (f2mul X.d Y.d)⟩

/-- M̄ = M mod 2 = ((0,1),(1,1)). -/
def Mbar : Mat2 := ⟨false, true, true, true⟩

def Id2 : Mat2 := ⟨true, false, false, true⟩

/-- (5) M̄ has exact order 3 in GL(2, 𝔽₂). -/
theorem order_three :
    matmul Mbar (matmul Mbar Mbar) = Id2 ∧
    Mbar ≠ Id2 ∧
    matmul Mbar Mbar ≠ Id2 := by
  decide

/-- The characteristic polynomial λ² + λ + 1 of M̄ has no root in
    𝔽₂ (irreducibility over 𝔽₂): evaluated with 𝔽₂ arithmetic at
    both elements it is 1, not 0. -/
theorem charpoly_irreducible :
    f2add (f2add (f2mul false false) false) true = true ∧
    f2add (f2add (f2mul true true) true) true = true := by
  decide

/-! ### (6) cor:autbundle — consistency with the bundle-lattice
    action -/

/-- The map T of P4_R5_H1.lean, restated. -/
def T (v : Bool × Bool) : Bool × Bool := (v.2, xor v.1 v.2)

/-- Matrix action of M̄ on column vectors over 𝔽₂. -/
def MbarAct (v : Bool × Bool) : Bool × Bool :=
  (f2add (f2mul Mbar.a v.1) (f2mul Mbar.b v.2),
   f2add (f2mul Mbar.c v.1) (f2mul Mbar.d v.2))

/-- (6) The mod-2 matrix action of M equals T pointwise: the
    2-torsion permutation of thm:threecycle and the bundle-lattice
    automorphism of cor:autbundle are the same map. -/
theorem action_is_T : ∀ v : Bool × Bool, MbarAct v = T v := by
  intro v
  cases v with
  | mk a b => cases a <;> cases b <;> rfl

end P4R7
