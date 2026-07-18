/-
  C5_hamilton_closure.lean — Paper XXII / Paper 3, consolidation node C5.
  Component arithmetic of "The Hamilton Product Generates a Real Scalar".
  Blocks: the pure-imaginary product decomposition (real part = −dot,
  imaginary part = cross); the non-closure witness; the Re ⊕ Im splitting;
  pure-imaginary unit squares. Build: Lean 4 + Mathlib, no `sorry`.
-/
import Mathlib
set_option linter.style.whitespace false

namespace C5

/- Real part of a product of pure imaginaries: -(p·q). -/
  theorem im_mul_re (p q : Quaternion ℝ) (hp : p.re = 0) (hq : q.re = 0) :
      (p * q).re = -(p.imI * q.imI + p.imJ * q.imJ + p.imK * q.imK) := by
    simp [hp, hq]
    ring

  /- First cross-product component. -/
  theorem im_mul_imI (p q : Quaternion ℝ) (hp : p.re = 0) (hq : q.re = 0) :
      (p * q).imI = p.imJ * q.imK - p.imK * q.imJ := by
    simp [hp, hq]


  /- Second cross-product component. -/
  theorem im_mul_imJ (p q : Quaternion ℝ) (hp : p.re = 0) (hq : q.re = 0) :
      (p * q).imJ = p.imK * q.imI - p.imI * q.imK := by
    simp [hp, hq]
    ring

  /- Third cross-product component. -/
  theorem im_mul_imK (p q : Quaternion ℝ) (hp : p.re = 0) (hq : q.re = 0) :
      (p * q).imK = p.imI * q.imJ - p.imJ * q.imI := by
    simp [hp, hq]


  /- The imaginary unit `i`. -/
  def qI : Quaternion ℝ := ⟨0, 1, 0, 0⟩

  /- Non-closure witness: `i·i` has non-zero real part. -/
  theorem im_not_closed :
      ∃ p q : Quaternion ℝ, p.re = 0 ∧ q.re = 0 ∧ (p * q).re ≠ 0 := by
    refine ⟨qI, qI, rfl, rfl, ?_⟩
    simp [qI]

/- The splitting q = Re q + Im q. -/
  theorem re_im_decomp (q : Quaternion ℝ) :
      q = (⟨q.re, 0, 0, 0⟩ : Quaternion ℝ) + (⟨0, q.imI, q.imJ, q.imK⟩ : Quaternion ℝ) := by
    ext <;> simp

/- Pure-imaginary units square to -1. -/
  theorem pure_unit_sq (p : Quaternion ℝ) (hp : p.re = 0)
      (hn : p.imI ^ 2 + p.imJ ^ 2 + p.imK ^ 2 = 1) : p * p = -1 := by
    -- Swap -1 for an explicit structure so the imaginary parts are exactly `0` (not `-0`)
    have h_neg_one : (-1 : Quaternion ℝ) = ⟨-1, 0, 0, 0⟩ := by ext <;> simp <;> rfl
    rw [h_neg_one]
    ext
    · simp [hp]
      nlinarith [hn]
    · simp [hp]
      ring
    · simp [hp]
      ring
    · simp [hp]
      ring

  /- The sign convention is immaterial: (-p)² = p². -/
  theorem neg_sq (p : Quaternion ℝ) : (-p) * (-p) = p * p := by simp

end C5
