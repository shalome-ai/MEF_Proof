/-
================================================================
WitnessGeodesic.lean
================================================================
Certificate 10 (the admissible pair is a geodesic space).

Certificate 9 (Witness.lean) constructs, for each period p > 0, the
pillowcase P p as the quotient of the torus T p = AddCircle p ×
AddCircle p (product metric of the two circles) by the sign
involution, with the orbit distance, and proves it to be a compact
metric space with corner gap p/2. The setting of the paper asks in
addition that the ambient space be a *length space*: the distance
between two points is the infimum of the lengths of continuous
paths joining them.

This file proves the stronger *geodesic* property directly: for all
a, b : P p there is a path γ : ℝ → P p with γ 0 = a, γ 1 = b and

  dist (γ s) (γ t) = |s − t| · dist a b   for all s, t ∈ [0, 1].

Every partition sum of such a path telescopes to dist a b, so the
distance is realised by the length of a path; in particular (P p, d)
is a length space. The proof follows the prose: a constant-speed
geodesic on each circle (via a norm-attaining real lift), the pair
of them on the product (maximum metric), and the projection to the
quotient, where the upper bound is the 1-Lipschitz property of the
quotient map and the lower bound is the triangle inequality of the
certified quotient metric.

Unconditional; zero `sorry`. Builds on YML.Witness (frozen).
Compiled against Lean 4.29.1 / Mathlib v4.29.1.
================================================================
-/
import YML.Witness

set_option linter.unusedSectionVars false
set_option linter.style.whitespace false
set_option linter.style.show false

noncomputable section
namespace WitnessGeodesic

open Witness Set

variable (p : ℝ) [hp : Fact (0 < p)]

/-! ### A constant-speed geodesic on the circle -/

/-- Every element of `AddCircle p` has a real lift of absolute value
equal to its norm. -/
theorem exists_lift_norm (d : AddCircle p) :
    ∃ r : ℝ, ((r : ℝ) : AddCircle p) = d ∧ |r| = ‖d‖ := by
  obtain ⟨x₀, rfl⟩ := QuotientAddGroup.mk_surjective d
  refine ⟨x₀ - round (p⁻¹ * x₀) * p, ?_, ?_⟩
  · rw [QuotientAddGroup.eq]
    rw [AddSubgroup.mem_zmultiples_iff]
    exact ⟨round (p⁻¹ * x₀), by simp [zsmul_eq_mul]⟩
  · rw [AddCircle.norm_eq]

/-- The norm of the class of a real number of absolute value at most
`p/2` is that absolute value. -/
theorem norm_coe_of_le_half {x : ℝ} (hx : |x| ≤ p / 2) :
    ‖((x : ℝ) : AddCircle p)‖ = |x| := by
  have hp0 : p ≠ 0 := ne_of_gt hp.out
  rw [AddCircle.norm_coe_eq_abs_iff p hp0]
  rwa [abs_of_pos hp.out]

/-- **Circle geodesic.** Two points of the circle are joined by a
path of constant speed equal to their distance. -/
theorem circle_geodesic (x y : AddCircle p) :
    ∃ γ : ℝ → AddCircle p, γ 0 = x ∧ γ 1 = y ∧
      ∀ s t, s ∈ Icc (0:ℝ) 1 → t ∈ Icc (0:ℝ) 1 →
        dist (γ s) (γ t) = |s - t| * dist x y := by
  obtain ⟨r, hr, hrn⟩ := exists_lift_norm p (y - x)
  have hr_half : |r| ≤ p / 2 := by
    rw [hrn]
    have := AddCircle.norm_le_half_period p (x := y - x) (ne_of_gt hp.out)
    rwa [abs_of_pos hp.out] at this
  refine ⟨fun t => x + (((t * r : ℝ)) : AddCircle p), ?_, ?_, ?_⟩
  · simp
  · simp [hr]
  · intro s t hs ht
    have hst : |s - t| ≤ 1 := by
      rcases hs with ⟨hs0, hs1⟩; rcases ht with ⟨ht0, ht1⟩
      rw [abs_le]; constructor <;> linarith
    have key : ((s * r : ℝ) : AddCircle p) - ((t * r : ℝ) : AddCircle p)
        = (((s - t) * r : ℝ) : AddCircle p) := by
      rw [← AddCircle.coe_sub]; ring_nf
    rw [dist_eq_norm, add_sub_add_left_eq_sub, key, norm_coe_of_le_half p]
    · rw [abs_mul, hrn, dist_eq_norm, ← norm_neg, neg_sub]
    · rw [abs_mul]
      calc |s - t| * |r| ≤ 1 * |r| := by
              exact mul_le_mul_of_nonneg_right hst (abs_nonneg r)
        _ = |r| := one_mul _
        _ ≤ p / 2 := hr_half

/-! ### The torus: product of two circle geodesics -/

/-- **Torus geodesic.** In the product (maximum) metric, the pair of
circle geodesics is a constant-speed geodesic. -/
theorem torus_geodesic (u v : T p) :
    ∃ γ : ℝ → T p, γ 0 = u ∧ γ 1 = v ∧
      ∀ s t, s ∈ Icc (0:ℝ) 1 → t ∈ Icc (0:ℝ) 1 →
        dist (γ s) (γ t) = |s - t| * dist u v := by
  obtain ⟨γ₁, h₁0, h₁1, h₁⟩ := circle_geodesic p u.1 v.1
  obtain ⟨γ₂, h₂0, h₂1, h₂⟩ := circle_geodesic p u.2 v.2
  refine ⟨fun t => (γ₁ t, γ₂ t), ?_, ?_, ?_⟩
  · ext <;> simp [h₁0, h₂0]
  · ext <;> simp [h₁1, h₂1]
  · intro s t hs ht
    simp only [Prod.dist_eq]
    rw [h₁ s t hs ht, h₂ s t hs ht, mul_max_of_nonneg _ _ (abs_nonneg _)]

/-! ### The pillowcase: projection of a torus geodesic -/

/-- The quotient map does not increase distances. -/
theorem dist_qmk_le (x y : T p) : dist (qmk p x) (qmk p y) ≤ dist x y := by
  have h := (qmk_lipschitz p).dist_le_mul x y
  simpa using h

/-- The two representatives of a class have the same image. -/
theorem qmk_neg (v : T p) : qmk p (-v) = qmk p v :=
  Quotient.sound (Or.inr (by rw [neg_neg]))

/-- The class distance is attained on some pair of representatives. -/
theorem exists_rep_dist (u v : T p) :
    ∃ w : T p, qmk p w = qmk p v ∧ dist (qmk p u) (qmk p v) = dist u w := by
  change ∃ w : T p, qmk p w = qmk p v ∧ dTwo p u v = dist u w
  unfold dTwo
  rcases le_total (dist u v) (dist u (-v)) with h | h
  · exact ⟨v, rfl, min_eq_left h⟩
  · exact ⟨-v, qmk_neg p v, min_eq_right h⟩

/-- **Certificate 10 (the pillowcase is a geodesic space).** For all
`a b : P p` there is a path from `a` to `b` along which the distance
grows at constant speed `dist a b`. Every partition sum of such a
path telescopes to `dist a b`, so the distance is realised by the
length of a path: `(P p, dist)` is a length space. -/
theorem geodesic (a b : P p) :
    ∃ γ : ℝ → P p, γ 0 = a ∧ γ 1 = b ∧
      ∀ s t, s ∈ Icc (0:ℝ) 1 → t ∈ Icc (0:ℝ) 1 →
        dist (γ s) (γ t) = |s - t| * dist a b := by
  refine Quotient.inductionOn₂ a b (fun u v => ?_)
  change ∃ γ : ℝ → P p, γ 0 = qmk p u ∧ γ 1 = qmk p v ∧
      ∀ s t, s ∈ Icc (0:ℝ) 1 → t ∈ Icc (0:ℝ) 1 →
        dist (γ s) (γ t) = |s - t| * dist (qmk p u) (qmk p v)
  obtain ⟨w, hw, hD⟩ := exists_rep_dist p u v
  obtain ⟨γ, hγ0, hγ1, hγ⟩ := torus_geodesic p u w
  set D := dist (qmk p u) (qmk p v) with hDdef
  have hD0 : 0 ≤ D := dist_nonneg
  refine ⟨fun t => qmk p (γ t), by simp [hγ0], by simp [hγ1, hw], ?_⟩
  intro s t hs ht
  -- upper bound: the quotient map is 1-Lipschitz
  have upper : dist (qmk p (γ s)) (qmk p (γ t)) ≤ |s - t| * D := by
    calc dist (qmk p (γ s)) (qmk p (γ t)) ≤ dist (γ s) (γ t) := dist_qmk_le p _ _
      _ = |s - t| * dist u w := hγ s t hs ht
      _ = |s - t| * D := by rw [hD]
  -- the two end segments, also bounded above through the torus
  have h0 : (0:ℝ) ∈ Icc (0:ℝ) 1 := ⟨le_refl 0, zero_le_one⟩
  have h1 : (1:ℝ) ∈ Icc (0:ℝ) 1 := ⟨zero_le_one, le_refl 1⟩
  have end_s : dist (qmk p u) (qmk p (γ s)) ≤ s * D := by
    calc dist (qmk p u) (qmk p (γ s)) = dist (qmk p (γ 0)) (qmk p (γ s)) := by rw [hγ0]
      _ ≤ dist (γ 0) (γ s) := dist_qmk_le p _ _
      _ = |0 - s| * dist u w := hγ 0 s h0 hs
      _ = s * D := by rw [hD, zero_sub, abs_neg, abs_of_nonneg hs.1]
  have end_t : dist (qmk p (γ t)) (qmk p v) ≤ (1 - t) * D := by
    calc dist (qmk p (γ t)) (qmk p v) = dist (qmk p (γ t)) (qmk p (γ 1)) := by rw [hγ1, hw]
      _ ≤ dist (γ t) (γ 1) := dist_qmk_le p _ _
      _ = |t - 1| * dist u w := hγ t 1 ht h1
      _ = (1 - t) * D := by
          rw [hD, abs_sub_comm, abs_of_nonneg (by linarith [ht.2] : (0:ℝ) ≤ 1 - t)]
  have end_s' : dist (qmk p u) (qmk p (γ t)) ≤ t * D := by
    calc dist (qmk p u) (qmk p (γ t)) = dist (qmk p (γ 0)) (qmk p (γ t)) := by rw [hγ0]
      _ ≤ dist (γ 0) (γ t) := dist_qmk_le p _ _
      _ = |0 - t| * dist u w := hγ 0 t h0 ht
      _ = t * D := by rw [hD, zero_sub, abs_neg, abs_of_nonneg ht.1]
  have end_t' : dist (qmk p (γ s)) (qmk p v) ≤ (1 - s) * D := by
    calc dist (qmk p (γ s)) (qmk p v) = dist (qmk p (γ s)) (qmk p (γ 1)) := by rw [hγ1, hw]
      _ ≤ dist (γ s) (γ 1) := dist_qmk_le p _ _
      _ = |s - 1| * dist u w := hγ s 1 hs h1
      _ = (1 - s) * D := by
          rw [hD, abs_sub_comm, abs_of_nonneg (by linarith [hs.2] : (0:ℝ) ≤ 1 - s)]
  -- lower bound: triangle inequality in the quotient metric
  have tri : D ≤ dist (qmk p u) (qmk p (γ s)) + dist (qmk p (γ s)) (qmk p (γ t))
      + dist (qmk p (γ t)) (qmk p v) := by
    calc D = dist (qmk p u) (qmk p v) := rfl
      _ ≤ dist (qmk p u) (qmk p (γ t)) + dist (qmk p (γ t)) (qmk p v) := dist_triangle _ _ _
      _ ≤ (dist (qmk p u) (qmk p (γ s)) + dist (qmk p (γ s)) (qmk p (γ t)))
            + dist (qmk p (γ t)) (qmk p v) := by
          gcongr; exact dist_triangle _ _ _
  have tri' : D ≤ dist (qmk p u) (qmk p (γ t)) + dist (qmk p (γ t)) (qmk p (γ s))
      + dist (qmk p (γ s)) (qmk p v) := by
    calc D = dist (qmk p u) (qmk p v) := rfl
      _ ≤ dist (qmk p u) (qmk p (γ s)) + dist (qmk p (γ s)) (qmk p v) := dist_triangle _ _ _
      _ ≤ (dist (qmk p u) (qmk p (γ t)) + dist (qmk p (γ t)) (qmk p (γ s)))
            + dist (qmk p (γ s)) (qmk p v) := by
          gcongr; exact dist_triangle _ _ _
  apply le_antisymm upper
  rcases le_total s t with hst | hst
  · -- s ≤ t : |s - t| = t - s
    rw [abs_sub_comm, abs_of_nonneg (by linarith : (0:ℝ) ≤ t - s)]
    nlinarith [tri, end_s, end_t]
  · -- t ≤ s : |s - t| = s - t
    rw [abs_of_nonneg (by linarith : (0:ℝ) ≤ s - t)]
    have hc : dist (qmk p (γ t)) (qmk p (γ s)) = dist (qmk p (γ s)) (qmk p (γ t)) :=
      dist_comm _ _
    rw [hc] at tri'
    nlinarith [tri', end_s', end_t']

/-- The geodesic of `geodesic` is Lipschitz on `[0, 1]`, hence
continuous there: it is a continuous path in the sense of the
length-space definition. -/
theorem geodesic_continuousOn (a b : P p) :
    ∃ γ : ℝ → P p, γ 0 = a ∧ γ 1 = b ∧ ContinuousOn γ (Icc (0:ℝ) 1) ∧
      ∀ s t, s ∈ Icc (0:ℝ) 1 → t ∈ Icc (0:ℝ) 1 →
        dist (γ s) (γ t) = |s - t| * dist a b := by
  obtain ⟨γ, h0, h1, h⟩ := geodesic p a b
  refine ⟨γ, h0, h1, ?_, h⟩
  have hL : LipschitzOnWith ⟨dist a b, dist_nonneg⟩ γ (Icc (0:ℝ) 1) := by
    apply LipschitzOnWith.of_dist_le_mul
    intro s hs t ht
    rw [h s t hs ht, Real.dist_eq, NNReal.coe_mk, mul_comm]
  exact hL.continuousOn

/-! ### The two admissible settings of the paper -/

instance fact_one : Fact ((0:ℝ) < 1) := ⟨one_pos⟩
instance fact_two : Fact ((0:ℝ) < 2) := ⟨two_pos⟩

/-- The unit-period pillowcase is a geodesic space. -/
theorem geodesic_square (a b : P 1) :
    ∃ γ : ℝ → P 1, γ 0 = a ∧ γ 1 = b ∧
      ∀ s t, s ∈ Icc (0:ℝ) 1 → t ∈ Icc (0:ℝ) 1 →
        dist (γ s) (γ t) = |s - t| * dist a b :=
  geodesic 1 a b

/-- The doubled-period pillowcase is a geodesic space. -/
theorem geodesic_doubled (a b : P 2) :
    ∃ γ : ℝ → P 2, γ 0 = a ∧ γ 1 = b ∧
      ∀ s t, s ∈ Icc (0:ℝ) 1 → t ∈ Icc (0:ℝ) 1 →
        dist (γ s) (γ t) = |s - t| * dist a b :=
  geodesic 2 a b

end WitnessGeodesic
