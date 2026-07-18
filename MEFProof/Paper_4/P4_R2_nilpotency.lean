/-
================================================================
P4_R2_nilpotency.lean
================================================================
Paper 4, Step 3 certificate (R2, thm:bftate + cor:nilpotent).

Same abstract setting as P4_R1_eigenspace.lean: an involution
s : P → P with s ∘ s = id, integer-valued sections, Tate operators
N = 1 + σ* and D = 1 − σ*.

Certified statements:
  (1) DN_zero, ND_zero : D ∘ N = 0 and N ∘ D = 0 — the alternating
      Tate complex is a complex.  (Extends the D∘N = 0 content of
      Sec4_Tate_Cohomology.lean to the abstract setting, adding
      the N∘D direction, which is the one the corollary's proof
      route traverses: the image of D is σ-odd and the next map of
      the alternating complex is N.)
  (2) image_D_odd    : σ*(D f) = −(D f) — im D lies in the odd
      sector (no hypothesis on s needed beyond the definition).
  (3) image_D_ker_N  : N (D f) = 0 — im D ⊆ ker N.
  (4) transport      : the conditional structure of
      ξ = 𝓘⁻¹ ∘ ½D pinned with the period-map transport as a NAMED
      HYPOTHESIS: for any g representing 𝓘(ξ ẑ), i.e. any g with
      2·g = D f pointwise, g is σ-odd and N g = 0.  This is the
      certificate-level form of cor:nilpotent — nilpotency
      transports through the isomorphism because the transported
      image is odd and N-killed.  The analytic period map 𝓘 itself
      is not a Lean object; its defining property enters as the
      single hypothesis h : ∀ p, 2 * g p = D f p.

Status target: CERT (statements (1)–(3) unconditional; (4)
conditional on the one named hypothesis, visible in the
signature).  Core Lean 4.15.0, no Mathlib, no axioms, no `sorry`.
Build:  lean P4_R2_nilpotency.lean
================================================================
-/

namespace P4R2

variable {P : Type} (s : P → P)

def sigmaStar (f : P → Int) : P → Int := fun p => f (s p)

def N (f : P → Int) : P → Int := fun p => f p + f (s p)

def D (f : P → Int) : P → Int := fun p => f p - f (s p)

/-- (1a) D ∘ N = 0 : the Tate sequence is a complex. -/
theorem DN_zero (hs : ∀ p, s (s p) = p) (f : P → Int) :
    ∀ p, D s (N s f) p = 0 := by
  intro p
  simp [D, N, hs p]
  omega

/-- (1b) N ∘ D = 0 : the other composite of the alternating
    complex, the one traversed by cor:nilpotent. -/
theorem ND_zero (hs : ∀ p, s (s p) = p) (f : P → Int) :
    ∀ p, N s (D s f) p = 0 := by
  intro p
  simp [N, D, hs p]
  omega

/-- (2) The image of D lies in the σ-odd sector. -/
theorem image_D_odd (hs : ∀ p, s (s p) = p) (f : P → Int) :
    ∀ p, sigmaStar s (D s f) p = -(D s f p) := by
  intro p
  simp [sigmaStar, D, hs p]
  omega

/-- (3) im D ⊆ ker N (restatement of (1b) as a kernel
    membership). -/
theorem image_D_ker_N (hs : ∀ p, s (s p) = p) (f : P → Int) :
    ∀ p, N s (D s f) p = 0 :=
  ND_zero s hs f

/-- (4) Conditional transport (cor:nilpotent, certificate form).
    Hypothesis h is the defining property of the period-map
    transport 𝓘(ξ ẑ) = ½ D ẑ, at the doubled (division-free)
    level: 2·g = D f pointwise.  Conclusion: the transported
    object g is σ-odd and killed by the next Tate map — the
    geometric content of ξ² = 0. -/
theorem transport (hs : ∀ p, s (s p) = p) (f g : P → Int)
    (h : ∀ p, 2 * g p = D s f p) :
    (∀ p, g (s p) = -(g p)) ∧ (∀ p, N s g p = 0) := by
  constructor
  · intro p
    have h1 := h p
    have h2 := h (s p)
    have h3 : D s f (s p) = -(D s f p) := by
      simp [D, hs p]; omega
    simp [D] at h1 h2 h3
    omega
  · intro p
    have h1 := h p
    have h2 := h (s p)
    have h3 : D s f (s p) = -(D s f p) := by
      simp [D, hs p]; omega
    simp [D] at h1 h2 h3
    simp [N]
    omega

/-- Smallest case worked by hand: on a two-point orbit {a, b} with
    the swap involution, D of the indicator of a is (1, −1), N of
    it is (1, 1), and N (D ·) = 0 explicitly. -/
theorem two_point_example :
    ∀ p : Bool, N (fun b => !b) (D (fun b => !b)
      (fun b => if b then 1 else 0)) p = 0 := by
  intro p
  cases p <;> simp [N, D]

end P4R2
