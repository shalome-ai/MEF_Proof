/-
================================================================
P4_R3_antiinvariant.lean
================================================================
Paper 4, Step 4 certificate (R3, thm:twisted).

The theorem's proof has one external input and one finite
computation.  The EXTERNAL INPUT (named, not certified here) is
Kawasaki's orbifold index theorem: H*(T²/ℤ₂, L_σ) is the
σ-anti-invariant subspace of H*(T², ℂ).  The COMPUTATION, certified
here over ℤ (the integral lattice of the rational cohomology,
which suffices since the σ*-action is defined over ℤ), is the
eigenspace decomposition of H*(T²) under the induced action
    σ* = +1 on H⁰ = ℤ·1
    σ* = −1 on H¹ = ℤ·dz ⊕ ℤ·dz̄     (σ*(dz) = −dz)
    σ* = +1 on H² = ℤ·(dz ∧ dz̄)     ((−dz)∧(−dz̄) = dz∧dz̄).

Certified statements (anti-invariant = {v : σ* v = −v};
invariant = {v : σ* v = v}):
  (1) H0_anti_trivial : in degree 0 the anti-invariants vanish.
  (2) H1_all_anti     : in degree 1 every class is anti-invariant.
  (3) H1_inv_trivial  : in degree 1 the invariants vanish.
  (4) H2_anti_trivial : in degree 2 the anti-invariants vanish.
  (5) H2_sign         : the degree-2 action is the product of the
      two degree-1 signs: (−1)·(−1) = +1, certified on the wedge
      representative.
Hence the anti-invariant dimensions are (0, 2, 0) and the
invariant dimensions (1, 0, 1) — the (dim H¹ = 2)-dimensional
shadow sector and the (1,0,1) holomorphic sector of thm:twisted.

Status target: CERT for the computation, conditional on the named
external input (Kawasaki), which enters only in the paper's prose,
never as a Lean axiom.  Core Lean 4.15.0, no Mathlib, no axioms,
no `sorry`.
Build:  lean P4_R3_antiinvariant.lean
================================================================
-/

namespace P4R3

/-- Degree-0 action: σ* = id on H⁰(T²) = ℤ. -/
def sigma0 (v : Int) : Int := v

/-- Degree-1 action: σ*(dz) = −dz, σ*(dz̄) = −dz̄ on
    H¹(T²) = ℤ² (coordinates: coefficients of dz, dz̄). -/
def sigma1 (v : Int × Int) : Int × Int := (-v.1, -v.2)

/-- Degree-2 action: σ*(dz ∧ dz̄) = (−dz) ∧ (−dz̄) = dz ∧ dz̄ on
    H²(T²) = ℤ. -/
def sigma2 (v : Int) : Int := v

/-- (1) Degree 0: the anti-invariant subspace is zero. -/
theorem H0_anti_trivial (v : Int) (h : sigma0 v = -v) : v = 0 := by
  simp [sigma0] at h
  omega

/-- (2) Degree 1: every class is anti-invariant — the full H¹ is
    the shadow sector, of rank 2. -/
theorem H1_all_anti (v : Int × Int) : sigma1 v = (-v.1, -v.2) := rfl

/-- (3) Degree 1: the invariant subspace is zero. -/
theorem H1_inv_trivial (v : Int × Int) (h : sigma1 v = v) :
    v = (0, 0) := by
  simp [sigma1] at h
  have h1 : -v.1 = v.1 := congrArg Prod.fst h
  have h2 : -v.2 = v.2 := congrArg Prod.snd h
  have : v.1 = 0 := by omega
  have : v.2 = 0 := by omega
  cases v
  simp_all

/-- (4) Degree 2: the anti-invariant subspace is zero. -/
theorem H2_anti_trivial (v : Int) (h : sigma2 v = -v) : v = 0 := by
  simp [sigma2] at h
  omega

/-- (5) The degree-2 sign is the product of the degree-1 signs:
    the wedge of two sign-reversed generators is sign-preserved,
    certified on the coefficient of dz ∧ dz̄ under
    (a·dz) ∧ (b·dz̄) ↦ ab. -/
theorem H2_sign (a b : Int) : (-a) * (-b) = a * b :=
  Int.neg_mul_neg a b

/-- Smallest case worked by hand: the generator dz itself
    (coefficients (1,0)) is anti-invariant and non-zero. -/
theorem dz_anti_nonzero :
    sigma1 (1, 0) = (-(1 : Int), 0) ∧ ((1 : Int), (0 : Int)) ≠ (0, 0) := by
  constructor
  · rfl
  · simp

end P4R3
