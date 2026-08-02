/-
================================================================
YM_L1_corner_distinctness.lean
================================================================
Certificate for YM-L1 (statement register R-1):
On the torus T² = ℝ²/ℤ², the involution σ : (x,y) ↦ (-x,-y) has
exactly four fixed points — the 2-torsion points
(0,0), (1/2,0), (0,1/2), (1/2,1/2) — and they are pairwise distinct.

Status target: CERT (unconditional — no hypotheses beyond
Lean/Mathlib, zero `sorry`).

Claim (c) of register R-1 (logical priority over the quaternionic
layer) is witnessed structurally: this file contains no reference
to quaternions, Sp(1), SU(2), SU(3), or any gauge group.

Model: the circle is Mathlib's `AddCircle (1 : ℝ) = ℝ ⧸ ℤ`; the
torus is the product of two copies. This is the object of the
prose statement itself, not a substitute model.
================================================================
-/
import Mathlib.Topology.Instances.AddCircle.Defs

noncomputable section
namespace YML1

open AddCircle

/-- The circle ℝ/ℤ. -/
abbrev S : Type := AddCircle (1 : ℝ)

/-- The torus T² = (ℝ/ℤ)². -/
abbrev T : Type := S × S

/-- The involution σ(x,y) = (-x,-y). -/
def sigma (q : T) : T := (-q.1, -q.2)

/-- The four corner points. -/
def c00 : T := (((0 : ℝ) : S), ((0 : ℝ) : S))
def c10 : T := ((((1 : ℝ)/2 : ℝ) : S), ((0 : ℝ) : S))
def c01 : T := (((0 : ℝ) : S), (((1 : ℝ)/2 : ℝ) : S))
def c11 : T := ((((1 : ℝ)/2 : ℝ) : S), (((1 : ℝ)/2 : ℝ) : S))

/-! ### Single-circle facts -/

/-- An integer is zero on the circle. -/
theorem int_coe_eq_zero (m : ℤ) : (((m : ℝ)) : S) = ((0 : ℝ) : S) := by
  have h : (((m : ℝ)) : S) = 0 :=
    (AddCircle.coe_eq_zero_iff (1 : ℝ)).mpr ⟨m, by rw [zsmul_eq_mul, mul_one]⟩
  rw [h, show ((0 : ℝ) : S) = 0 by simp]

/-- 1/2 is not zero on the circle. -/
theorem half_ne_zero : (((1 : ℝ)/2 : ℝ) : S) ≠ ((0 : ℝ) : S) := by
  intro h
  have h0 : (((1 : ℝ)/2 : ℝ) : S) = 0 := by simpa using h
  rw [AddCircle.coe_eq_zero_iff] at h0
  obtain ⟨n, hn⟩ := h0
  rw [zsmul_eq_mul, mul_one] at hn
  have h2 : ((2 * n : ℤ) : ℝ) = 1 := by push_cast; linarith
  have h3 : (2 * n : ℤ) = 1 := by exact_mod_cast h2
  omega

/-- A point of the circle is fixed by negation iff it is 0 or 1/2. -/
theorem neg_eq_self_iff (x : S) :
    -x = x ↔ x = ((0 : ℝ) : S) ∨ x = (((1 : ℝ)/2 : ℝ) : S) := by
  refine QuotientAddGroup.induction_on x (fun r => ?_)
  constructor
  · intro h
    -- from -↑r = ↑r deduce ↑(r + r) = 0
    have hneg : ((-r : ℝ) : S) = ((r : ℝ) : S) := by
      rw [AddCircle.coe_neg]; exact h
    have h0 : ((r + r : ℝ) : S) = 0 := by
      have := sub_eq_zero.mpr hneg.symm
      rw [← AddCircle.coe_sub] at this
      simpa [sub_neg_eq_add] using this
    rw [AddCircle.coe_eq_zero_iff] at h0
    obtain ⟨n, hn⟩ := h0
    rw [zsmul_eq_mul, mul_one] at hn
    rcases Int.even_or_odd n with ⟨m, hm⟩ | ⟨m, hm⟩
    · -- n = m + m  ⇒  r = m  ⇒  x = 0
      left
      have hr : r = (m : ℝ) := by
        have : ((m : ℝ) + (m : ℝ)) = r + r := by
          rw [← hn, hm]; push_cast; ring
        linarith
      rw [hr]; exact int_coe_eq_zero m
    · -- n = 2m + 1  ⇒  r = m + 1/2  ⇒  x = 1/2
      right
      have hr : r = (m : ℝ) + 1/2 := by
        have : ((2 * m + 1 : ℤ) : ℝ) = r + r := by rw [← hn, hm]
        push_cast at this; linarith
      have : ((r - 1/2 : ℝ) : S) = ((0 : ℝ) : S) := by
        rw [show (r - 1/2 : ℝ) = (m : ℝ) by rw [hr]; ring]
        exact int_coe_eq_zero m
      have h5 : ((r : ℝ) : S) - (((1:ℝ)/2 : ℝ) : S) = 0 := by
        rw [← AddCircle.coe_sub]; simpa using this
      exact sub_eq_zero.mp h5
  · rintro (h | h)
    · rw [h]; simp
    · rw [h]
      have : ((-((1:ℝ)/2) : ℝ) : S) = (((1:ℝ)/2 : ℝ) : S) := by
        have : ((-((1:ℝ)/2) - (1:ℝ)/2 : ℝ) : S) = ((0 : ℝ) : S) := by
          rw [show (-((1:ℝ)/2) - (1:ℝ)/2 : ℝ) = ((-1 : ℤ) : ℝ) by push_cast; ring]
          exact int_coe_eq_zero (-1)
        have h5 : ((-((1:ℝ)/2) : ℝ) : S) - (((1:ℝ)/2 : ℝ) : S) = 0 := by
          rw [← AddCircle.coe_sub]; simpa using this
        exact sub_eq_zero.mp h5
      rw [← AddCircle.coe_neg] at *
      exact this

/-! ### The torus theorems -/

/-- **Classification.** The fixed-point set of σ is exactly the four
corner points. -/
theorem fixed_iff (q : T) :
    sigma q = q ↔ q = c00 ∨ q = c10 ∨ q = c01 ∨ q = c11 := by
  obtain ⟨x, y⟩ := q
  have hx := neg_eq_self_iff x
  have hy := neg_eq_self_iff y
  simp only [sigma, Prod.mk.injEq, c00, c10, c01, c11]
  constructor
  · rintro ⟨h1, h2⟩
    rcases hx.mp h1 with rfl | rfl <;> rcases hy.mp h2 with rfl | rfl <;> tauto
  · rintro (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩) <;>
      exact ⟨hx.mpr (by tauto), hy.mpr (by tauto)⟩

/-- Each corner is fixed. -/
theorem corners_fixed :
    sigma c00 = c00 ∧ sigma c10 = c10 ∧ sigma c01 = c01 ∧ sigma c11 = c11 :=
  ⟨(fixed_iff c00).mpr (by tauto), (fixed_iff c10).mpr (by tauto),
   (fixed_iff c01).mpr (by tauto), (fixed_iff c11).mpr (by tauto)⟩

/-- **Distinctness.** The four corners are pairwise distinct. -/
theorem corners_pairwise_distinct :
    c00 ≠ c10 ∧ c00 ≠ c01 ∧ c00 ≠ c11 ∧
    c10 ≠ c01 ∧ c10 ≠ c11 ∧ c01 ≠ c11 :=
  ⟨fun h => half_ne_zero (congrArg Prod.fst h).symm,
   fun h => half_ne_zero (congrArg Prod.snd h).symm,
   fun h => half_ne_zero (congrArg Prod.fst h).symm,
   fun h => half_ne_zero (congrArg Prod.fst h),
   fun h => half_ne_zero (congrArg Prod.snd h).symm,
   fun h => half_ne_zero (congrArg Prod.fst h).symm⟩

/-- **Summary (YM-L1).** σ has exactly the four corners as fixed
points, and they are pairwise distinct. -/
theorem YM_L1 :
    (∀ q : T, sigma q = q ↔ q = c00 ∨ q = c10 ∨ q = c01 ∨ q = c11) ∧
    (c00 ≠ c10 ∧ c00 ≠ c01 ∧ c00 ≠ c11 ∧
     c10 ≠ c01 ∧ c10 ≠ c11 ∧ c01 ≠ c11) :=
  ⟨fixed_iff, corners_pairwise_distinct⟩

end YML1
