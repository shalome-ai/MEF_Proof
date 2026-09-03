/-
Certificate 2 (Lemma: positivity of the corner gap).
Distinct points of a metric space are at strictly positive distance;
instantiated at the four corner points of Certificate 1, giving Δ > 0.
Unconditional; zero `sorry`.
Formalisation note (stated once): the certificate is proved at
METRIC-SPACE level -- strictly weaker machinery than Hopf--Rinow and
strictly sufficient for the claim as used. The prose retains
Hopf--Rinow as the Riemannian-geometric source: the ambient manifold
M, compact with continuous Riemannian metric, induces a metric-space
structure, and `ι` below is the injective inclusion of the pillowcase
fibre carrying the induced distance.
No reference to any gauge group appears in this file.
-/
import YML.Corners
set_option linter.style.whitespace false
set_option linter.style.show false
noncomputable section
namespace Gap
open Corners

/-- Distinct points of a metric space are at strictly positive
distance. -/
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

/-- **Positivity of the corner gap.** The minimum distance from the
distinguished corner to the three remaining corners is strictly
positive. Stated with `c00` as the distinguished exemplar; the
argument is corner-symmetric, and the selection data pick which
corner plays the role. -/
theorem gap_pos (hι : Function.Injective ι) :
    0 < min (dist (ι c00) (ι c10))
        (min (dist (ι c00) (ι c01)) (dist (ι c00) (ι c11))) := by
  obtain ⟨h1, h2, h3, _, _, _⟩ := corner_dists_pos ι hι
  exact min₃_pos h1 h2 h3

end Embedding
end Gap
