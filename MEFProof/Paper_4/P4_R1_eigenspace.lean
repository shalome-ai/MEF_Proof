/-
================================================================
P4_R1_eigenspace.lean
================================================================
Paper 4, Step 2 certificate (R1, Mock Eigenspace Theorem,
thm:eigenspace).

Setting: an arbitrary point set P carrying an involution
s : P → P (s ∘ s = id), and integer-valued functions f : P → ℤ
representing sections. The pullback is (σ* f) p = f (s p).

To avoid division by 2 (working over ℤ), the eigenspace split is
certified at the doubled level through the Tate operators
    N f = f + σ* f   (twice the even projector P⁺)
    D f = f − σ* f   (twice the odd projector  P⁻),
matching the paper's identity D(ẑ) = 2g* exactly.

Certified statements:
  (1) even_N     : σ*(N f) = N f            (N f is σ-even)
  (2) odd_D      : σ*(D f) = −(D f)         (D f is σ-odd)
  (3) resolution : N f + D f = 2 f          (P⁺ + P⁻ = id, doubled)
  (4) unique     : the doubled decomposition is unique — if g is
                   even, h is odd and g + h = 2f pointwise, then
                   g = N f and h = D f pointwise.

Status target: CERT — core Lean 4.15.0, no Mathlib, no axioms,
no `sorry`.  Substrate relation: extends the function-space setup
of Sec4_Tate_Cohomology.lean (there over a Mathlib torus quotient;
here abstract, which strengthens the statement — the split needs
only σ² = id).
Build:  lean P4_R1_eigenspace.lean
================================================================
-/

namespace P4R1

variable {P : Type} (s : P → P)

/-- Pullback along the involution: (σ* f) p = f (s p). -/
def sigmaStar (f : P → Int) : P → Int := fun p => f (s p)

/-- Tate norm N = 1 + σ* (twice the even projector). -/
def N (f : P → Int) : P → Int := fun p => f p + f (s p)

/-- Tate difference D = 1 − σ* (twice the odd projector). -/
def D (f : P → Int) : P → Int := fun p => f p - f (s p)

/-- (1) N f is σ-even: σ*(N f) = N f. -/
theorem even_N (hs : ∀ p, s (s p) = p) (f : P → Int) :
    ∀ p, sigmaStar s (N s f) p = N s f p := by
  intro p
  simp [sigmaStar, N, hs p]
  omega

/-- (2) D f is σ-odd: σ*(D f) = −(D f). -/
theorem odd_D (hs : ∀ p, s (s p) = p) (f : P → Int) :
    ∀ p, sigmaStar s (D s f) p = -(D s f p) := by
  intro p
  simp [sigmaStar, D, hs p]
  omega

/-- (3) Resolution of the identity at the doubled level:
    N f + D f = 2 f. -/
theorem resolution (f : P → Int) :
    ∀ p, N s f p + D s f p = 2 * f p := by
  intro p
  simp [N, D]
  omega

/-- (4) Uniqueness of the doubled eigenspace decomposition:
    if g is σ-even, h is σ-odd, and g + h = 2 f pointwise, then
    g = N f and h = D f pointwise.  (This is the content of
    "the mock decomposition IS the eigenspace decomposition":
    any even/odd splitting of ẑ agrees with (P⁺ẑ, P⁻ẑ).
    Involutivity of s is not required for uniqueness. -/
theorem unique (f g h : P → Int)
    (hg : ∀ p, g (s p) = g p)
    (hh : ∀ p, h (s p) = -(h p))
    (hsum : ∀ p, g p + h p = 2 * f p) :
    (∀ p, g p = N s f p) ∧ (∀ p, h p = D s f p) := by
  constructor
  · intro p
    have h1 := hsum p
    have h2 := hsum (s p)
    rw [hg p, hh p] at h2
    simp [N]
    omega
  · intro p
    have h1 := hsum p
    have h2 := hsum (s p)
    rw [hg p, hh p] at h2
    simp [D]
    omega

/-- Smallest case worked by hand: on the four-point 2-torsion set
    (Bool × Bool) with the trivial involution restricted there
    (negation fixes 2-torsion pointwise), every function is even
    and the odd doubled part vanishes. -/
theorem two_torsion_fixed (f : Bool × Bool → Int) :
    ∀ p, D (fun q => q) f p = 0 := by
  intro p
  simp [D]

end P4R1
