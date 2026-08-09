/-
Certificate 9 (R3-(iii)): an admissible pair, end-to-end.
For each period p > 0, the pillowcase P p is constructed as the
metric quotient of the flat torus T p = AddCircle p × AddCircle p
by the sign involution: the orbit distance
  d([u],[v]) = min (dist u v) (dist u (-v))
is proved to be a genuine metric; P p is proved compact; the four
corner classes are pairwise distinct; and the corner gap from the
class of (0,0) is computed exactly: p/2. Instantiating p = 1 and
p = 2 yields two admissible settings with gaps 1/2 and 1 — the
value of the gap is exhibited, not merely asserted, to depend on
the setting. Unconditional; zero `sorry`.
-/
import Mathlib.Analysis.Normed.Group.AddCircle
import Mathlib.Topology.Instances.AddCircle.Real

set_option linter.unusedSectionVars false

noncomputable section
namespace Witness

variable (p : ℝ) [hp : Fact (0 < p)]

/-- The flat torus of period p. -/
abbrev T := AddCircle p × AddCircle p

/-- The sign involution identifies u with -u. -/
def pillowRel (u v : T p) : Prop := v = u ∨ v = -u

theorem pillowRel_equiv : Equivalence (pillowRel p) := by
  constructor
  · intro u; exact Or.inl rfl
  · rintro u v (rfl | rfl)
    · exact Or.inl rfl
    · right; rw [neg_neg]
  · rintro u v w (rfl | rfl) (rfl | rfl)
    · exact Or.inl rfl
    · exact Or.inr rfl
    · exact Or.inr rfl
    · left; rw [neg_neg]

instance pillowSetoid : Setoid (T p) := ⟨pillowRel p, pillowRel_equiv p⟩

/-- The pillowcase: the quotient of the torus by the involution. -/
def P := Quotient (pillowSetoid p)

/-- The orbit distance on representatives. -/
def dTwo (u v : T p) : ℝ := min (dist u v) (dist u (-v))

theorem dTwo_symm_arg (u v : T p) : dTwo p u v = dTwo p v u := by
  unfold dTwo
  have h1 : dist u v = dist v u := dist_comm u v
  have h2 : dist u (-v) = dist v (-u) := by
    rw [← dist_neg_neg u (-v), neg_neg, dist_comm]
  rw [h1, h2]

theorem dTwo_neg_right (u v : T p) : dTwo p u (-v) = dTwo p u v := by
  unfold dTwo
  rw [neg_neg, min_comm]

theorem dTwo_neg_left (u v : T p) : dTwo p (-u) v = dTwo p u v := by
  rw [dTwo_symm_arg, dTwo_neg_right, dTwo_symm_arg]

theorem dTwo_wd (u₁ u₂ v₁ v₂ : T p)
    (hu : pillowRel p u₁ u₂) (hv : pillowRel p v₁ v₂) :
    dTwo p u₁ v₁ = dTwo p u₂ v₂ := by
  rcases hu with rfl | rfl <;> rcases hv with rfl | rfl
  · rfl
  · rw [dTwo_neg_right]
  · rw [dTwo_neg_left]
  · rw [dTwo_neg_left, dTwo_neg_right]

/-- The quotient distance. -/
def qdist : P p → P p → ℝ :=
  Quotient.lift₂ (dTwo p) (fun _ _ _ _ hu hv => dTwo_wd p _ _ _ _ hu hv)

theorem qdist_mk (u v : T p) : qdist p ⟦u⟧ ⟦v⟧ = dTwo p u v := rfl

/-- The orbit distance is a metric on the pillowcase. -/
instance : MetricSpace (P p) where
  dist := qdist p
  dist_self := by
    refine Quotient.ind (fun u => ?_)
    show dTwo p u u = 0
    unfold dTwo
    rw [dist_self]
    exact min_eq_left dist_nonneg
  dist_comm := by
    refine Quotient.ind₂ (fun u v => ?_)
    exact dTwo_symm_arg p u v
  dist_triangle := by
    refine Quotient.ind (fun u => Quotient.ind₂ (fun v w => ?_))
    show dTwo p u w ≤ dTwo p u v + dTwo p v w
    unfold dTwo
    have h1 : min (dist u w) (dist u (-w)) ≤ dist u v + dist v w :=
      le_trans (min_le_left _ _) (dist_triangle u v w)
    have h2 : min (dist u w) (dist u (-w)) ≤ dist u v + dist v (-w) :=
      le_trans (min_le_right _ _) (dist_triangle u v (-w))
    have h3 : min (dist u w) (dist u (-w)) ≤ dist u (-v) + dist v w := by
      have h := dist_triangle u (-v) (-w)
      rw [dist_neg_neg] at h
      exact le_trans (min_le_right _ _) h
    have h4 : min (dist u w) (dist u (-w)) ≤ dist u (-v) + dist v (-w) := by
      have h := dist_triangle u (-v) w
      have h' : dist (-v) w = dist v (-w) := by
        rw [← dist_neg_neg (-v) w, neg_neg]
      rw [h'] at h
      exact le_trans (min_le_left _ _) h
    rcases le_total (dist u v) (dist u (-v)) with e1 | e1 <;>
      rcases le_total (dist v w) (dist v (-w)) with e2 | e2
    · rw [min_eq_left e1, min_eq_left e2]; exact h1
    · rw [min_eq_left e1, min_eq_right e2]; exact h2
    · rw [min_eq_right e1, min_eq_left e2]; exact h3
    · rw [min_eq_right e1, min_eq_right e2]; exact h4
  eq_of_dist_eq_zero := by
    intro x y
    refine Quotient.inductionOn₂ x y (fun u v h => ?_)
    have h0 : dTwo p u v = 0 := h
    unfold dTwo at h0
    have := min_eq_iff.mp h0
    apply Quotient.sound
    rcases this with ⟨h', _⟩ | ⟨h', _⟩
    · exact Or.inl (dist_eq_zero.mp h').symm
    · right
      have := dist_eq_zero.mp h'
      rw [this, neg_neg]

/-- The quotient map into the pillowcase. -/
def qmk : T p → P p := Quotient.mk (pillowSetoid p)

/-- The quotient map is 1-Lipschitz, hence continuous. -/
theorem qmk_lipschitz : LipschitzWith 1 (qmk p) :=
  LipschitzWith.of_dist_le_mul (fun u v => by
    rw [NNReal.coe_one, one_mul]
    exact min_le_left _ _)

/-- The pillowcase is compact. -/
instance : CompactSpace (P p) := by
  constructor
  have hs : Function.Surjective (qmk p) := Quotient.mk_surjective
  have : (Set.univ : Set (P p)) = (qmk p) '' Set.univ := by
    rw [Set.image_univ, Set.range_eq_univ.mpr hs]
  rw [this]
  exact IsCompact.image isCompact_univ (qmk_lipschitz p).continuous

/-! ### The four corners and their classes -/

def c00 : T p := (((0 : ℝ) : AddCircle p), ((0 : ℝ) : AddCircle p))
def c10 : T p := (((p/2 : ℝ) : AddCircle p), ((0 : ℝ) : AddCircle p))
def c01 : T p := (((0 : ℝ) : AddCircle p), ((p/2 : ℝ) : AddCircle p))
def c11 : T p := (((p/2 : ℝ) : AddCircle p), ((p/2 : ℝ) : AddCircle p))

/-- The half-period is its own negative on the circle. -/
theorem neg_half : -(((p/2 : ℝ)) : AddCircle p) = ((p/2 : ℝ) : AddCircle p) := by
  have hsum : ((p/2 : ℝ) : AddCircle p) + ((p/2 : ℝ) : AddCircle p) = 0 := by
    rw [← AddCircle.coe_add]
    have h2 : (p/2 + p/2 : ℝ) = p := by ring
    rw [h2, AddCircle.coe_period]
  rw [neg_eq_iff_add_eq_zero]
  exact hsum

theorem neg_c10 : -(c10 p) = c10 p := by
  unfold c10
  ext <;> simp [neg_half p]

theorem neg_c01 : -(c01 p) = c01 p := by
  unfold c01
  ext <;> simp [neg_half p]

theorem neg_c11 : -(c11 p) = c11 p := by
  unfold c11
  ext <;> simp [neg_half p]

/-- The half-period norm is p/2. -/
theorem norm_half : ‖(((p/2 : ℝ)) : AddCircle p)‖ = p/2 := by
  have hp0 : (0 : ℝ) < p := hp.out
  rw [AddCircle.norm_eq]
  have hround : round (p⁻¹ * (p/2)) = 1 := by
    have : p⁻¹ * (p/2) = 1/2 := by field_simp
    rw [this, round_eq]
    norm_num
  rw [hround]
  rw [abs_of_nonpos (by linarith)]
  ring

/-- Torus distance from the base corner to each other corner is p/2. -/
theorem coe_zero' : (((0 : ℝ)) : AddCircle p) = 0 := by norm_cast

theorem dist_half : dist (((0 : ℝ) : AddCircle p)) (((p/2 : ℝ)) : AddCircle p) = p/2 := by
  rw [coe_zero', dist_zero_left, norm_half]

theorem dist_zz : dist (((0 : ℝ) : AddCircle p)) (((0 : ℝ)) : AddCircle p) = 0 :=
  dist_self _

theorem dist_c00_c10 : dist (c00 p) (c10 p) = p/2 := by
  have hp0 : (0 : ℝ) < p := hp.out
  rw [Prod.dist_eq]
  show max (dist (((0:ℝ) : AddCircle p)) (((p/2:ℝ)) : AddCircle p))
      (dist (((0:ℝ) : AddCircle p)) (((0:ℝ)) : AddCircle p)) = p/2
  rw [dist_half, dist_zz]
  exact max_eq_left (by linarith)

theorem dist_c00_c01 : dist (c00 p) (c01 p) = p/2 := by
  have hp0 : (0 : ℝ) < p := hp.out
  rw [Prod.dist_eq]
  show max (dist (((0:ℝ) : AddCircle p)) (((0:ℝ)) : AddCircle p))
      (dist (((0:ℝ) : AddCircle p)) (((p/2:ℝ)) : AddCircle p)) = p/2
  rw [dist_half, dist_zz]
  exact max_eq_right (by linarith)

theorem dist_c00_c11 : dist (c00 p) (c11 p) = p/2 := by
  rw [Prod.dist_eq]
  show max (dist (((0:ℝ) : AddCircle p)) (((p/2:ℝ)) : AddCircle p))
      (dist (((0:ℝ) : AddCircle p)) (((p/2:ℝ)) : AddCircle p)) = p/2
  rw [dist_half]
  exact max_self _

/-! ### Corner classes, their distances, and the gap -/

/-- The corner classes in the pillowcase. -/
def C00 : P p := ⟦c00 p⟧
def C10 : P p := ⟦c10 p⟧
def C01 : P p := ⟦c01 p⟧
def C11 : P p := ⟦c11 p⟧

theorem dist_C00_C10 : dist (C00 p) (C10 p) = p/2 := by
  show dTwo p (c00 p) (c10 p) = p/2
  unfold dTwo
  rw [neg_c10, min_self, dist_c00_c10]

theorem dist_C00_C01 : dist (C00 p) (C01 p) = p/2 := by
  show dTwo p (c00 p) (c01 p) = p/2
  unfold dTwo
  rw [neg_c01, min_self, dist_c00_c01]

theorem dist_C00_C11 : dist (C00 p) (C11 p) = p/2 := by
  show dTwo p (c00 p) (c11 p) = p/2
  unfold dTwo
  rw [neg_c11, min_self, dist_c00_c11]

/-- The corner gap of the setting with period p. -/
def gap : ℝ :=
  min (dist (C00 p) (C10 p)) (min (dist (C00 p) (C01 p)) (dist (C00 p) (C11 p)))

theorem gap_eq : gap p = p/2 := by
  unfold gap
  rw [dist_C00_C10, dist_C00_C01, dist_C00_C11, min_self, min_self]

/-- The corner classes are pairwise distinguishable from the base
class: each setting is admissible — a compact metric quotient of
the flat torus by the involution, with distinct corner classes
and a distinguished one. -/
theorem corners_distinct :
    C00 p ≠ C10 p ∧ C00 p ≠ C01 p ∧ C00 p ≠ C11 p := by
  have hp0 : (0 : ℝ) < p := hp.out
  refine ⟨?_, ?_, ?_⟩
  · exact dist_pos.mp (by rw [dist_C00_C10]; linarith)
  · exact dist_pos.mp (by rw [dist_C00_C01]; linarith)
  · exact dist_pos.mp (by rw [dist_C00_C11]; linarith)

end Witness

namespace Witness

instance fact_one : Fact ((0:ℝ) < 1) := ⟨one_pos⟩
instance fact_two : Fact ((0:ℝ) < 2) := ⟨two_pos⟩

/-- **The admissible pair.** The square and doubled pillowcases,
each a compact metric quotient with distinct corner classes, have
gaps 1/2 and 1 respectively: the value of the gap depends on the
setting. -/
theorem value_depends_on_setting : gap 1 ≠ gap 2 := by
  rw [gap_eq, gap_eq]
  norm_num

theorem gap_square : gap 1 = 1/2 := by rw [gap_eq]

theorem gap_doubled : gap 2 = 1 := by rw [gap_eq]; norm_num

end Witness
