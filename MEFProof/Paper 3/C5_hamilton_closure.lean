/-
  C5_hamilton_closure.lean — Paper XXII / Paper 3, consolidation node C5.
  Component arithmetic of "The Hamilton Product Generates a Real Scalar".
  Blocks: the pure-imaginary product decomposition (real part = −dot,
  imaginary part = cross); the non-closure witness; the Re ⊕ Im splitting;
  pure-imaginary unit squares. Build: Lean 4 + Mathlib, no `sorry`.
-/
import Mathlib

namespace C5

/-- Real part of a product of pure imaginaries: −(p·q). -/
theorem im_mul_re (p q : Quaternion ℝ) (hp : p.re = 0) (hq : q.re = 0) :
    (p * q).re = -(p.imI * q.imI + p.imJ * q.imJ + p.imK * q.imK) := by
  simp [Quaternion.mul_re, hp, hq]
  ring

/-- First cross-product component. -/
theorem im_mul_imI (p q : Quaternion ℝ) (hp : p.re = 0) (hq : q.re = 0) :
    (p * q).imI = p.imJ * q.imK - p.imK * q.imJ := by
  simp [Quaternion.mul_imI, hp, hq]
  ring

/-- Second cross-product component. -/
theorem im_mul_imJ (p q : Quaternion ℝ) (hp : p.re = 0) (hq : q.re = 0) :
    (p * q).imJ = p.imK * q.imI - p.imI * q.imK := by
  simp [Quaternion.mul_imJ, hp, hq]
  ring

/-- Third cross-product component. -/
theorem im_mul_imK (p q : Quaternion ℝ) (hp : p.re = 0) (hq : q.re = 0) :
    (p * q).imK = p.imI * q.imJ - p.imJ * q.imI := by
  simp [Quaternion.mul_imK, hp, hq]
  ring

/-- The imaginary unit `i`. -/
def qI : Quaternion ℝ := ⟨0, 1, 0, 0⟩

/-- Non-closure witness: `i·i` has non-zero real part. -/
theorem im_not_closed :
    ∃ p q : Quaternion ℝ, p.re = 0 ∧ q.re = 0 ∧ (p * q).re ≠ 0 := by
  refine ⟨qI, qI, rfl, rfl, ?_⟩
  simp [Quaternion.mul_re, qI]

/-- The splitting q = Re q + Im q. -/
theorem re_im_decomp (q : Quaternion ℝ) :
    q = (⟨q.re, 0, 0, 0⟩ : Quaternion ℝ) + ⟨0, q.imI, q.imJ, q.imK⟩ := by
  ext <;> simp

/-- Pure-imaginary units square to −1. -/
theorem pure_unit_sq (p : Quaternion ℝ) (hp : p.re = 0)
    (hn : p.imI ^ 2 + p.imJ ^ 2 + p.imK ^ 2 = 1) : p * p = -1 := by
  rw [Quaternion.ext_iff]
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp [Quaternion.mul_re, hp]
    nlinarith [hn]
  · simp [Quaternion.mul_imI, hp]
    ring
  · simp [Quaternion.mul_imJ, hp]
    ring
  · simp [Quaternion.mul_imK, hp]
    ring

/-- The sign convention is immaterial: (−p)² = p². -/
theorem neg_sq (p : Quaternion ℝ) : (-p) * (-p) = p * p := by ring

end C5
