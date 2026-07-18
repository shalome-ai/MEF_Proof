/-
================================================================
YM_L2_positivity.lean  (module YML.YM_L2)
================================================================
Certificate for YM-L2 (statement register R-2):
distinct points of a metric space are at strictly positive
distance; instantiated at the four corner points delivered by
YM-L1, giving Δ > 0 for the corner gap.

Status target: CERT (unconditional — zero `sorry`).

Formalisation note (stated once, per SOW risk note 1 and the
register's Step 2 rule): the certificate is proved at
METRIC-SPACE level — strictly weaker machinery than Hopf–Rinow
and strictly sufficient for the claim as used. The prose retains
the Hopf–Rinow citation as the Riemannian-geometric source: K₈
compact with continuous Riemannian metric induces a metric space
structure on K₈, and `ι` below is the (injective) inclusion of
the pillowcase fibre into K₈ carrying that induced distance.

No reference to quaternions, Sp(1), SU(2), SU(3), or any gauge
group appears in this file.

Build: place YM-L1's file at YML/YM_L1.lean inside a Mathlib
checkout (tag v4.15.0) and run
  lake env sh -c 'LEAN_PATH="$LEAN_PATH:$PWD" lean YML/YM_L2.lean'
================================================================
-/
import YML.YM_L1

noncomputable section
namespace YML2
open YML1

/-- Distinct points of a metric space are at strictly positive
distance. (Metric-space form of the positivity step.) -/
theorem dist_pos_of_ne {X : Type*} [MetricSpace X] {a b : X}
    (h : a ≠ b) : 0 < dist a b :=
  dist_pos.mpr h

/-- The minimum of three positive reals is positive. -/
theorem min₃_pos {a b c : ℝ} (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    0 < min a (min b c) :=
  lt_min ha (lt_min hb hc)

section Embedding

variable {K : Type*} [MetricSpace K]
variable (ι : T → K)

/-- All six pairwise corner distances in `K` are positive. -/
theorem corner_dists_pos (hι : Function.Injective ι) :
    0 < dist (ι c00) (ι c10) ∧ 0 < dist (ι c00) (ι c01) ∧
    0 < dist (ι c00) (ι c11) ∧ 0 < dist (ι c10) (ι c01) ∧
    0 < dist (ι c10) (ι c11) ∧ 0 < dist (ι c01) (ι c11) := by
  obtain ⟨h1, h2, h3, h4, h5, h6⟩ := corners_pairwise_distinct
  exact ⟨dist_pos_of_ne (fun h => h1 (hι h)),
         dist_pos_of_ne (fun h => h2 (hι h)),
         dist_pos_of_ne (fun h => h3 (hι h)),
         dist_pos_of_ne (fun h => h4 (hι h)),
         dist_pos_of_ne (fun h => h5 (hι h)),
         dist_pos_of_ne (fun h => h6 (hι h))⟩

/-- **YM-L2.** The corner gap — the minimum distance from the
(Spinᶜ-selected) vacuum corner to the three orthogonal corners —
is strictly positive. Stated with `c00` as the vacuum exemplar;
the argument is corner-symmetric, and the Spinᶜ selection picks
which corner plays the role. -/
theorem gap_pos (hι : Function.Injective ι) :
    0 < min (dist (ι c00) (ι c10))
        (min (dist (ι c00) (ι c01)) (dist (ι c00) (ι c11))) := by
  obtain ⟨h1, h2, h3, _, _, _⟩ := corner_dists_pos ι hι
  exact min₃_pos h1 h2 h3

end Embedding
end YML2
