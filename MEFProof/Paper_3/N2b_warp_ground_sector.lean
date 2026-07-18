import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Tactic

noncomputable section
open Real

/-!
# N2b — Warp elimination on the ground sector: the finite core

Paper 3 (JGP), §9.3, Lemma 9.14 (Warp elimination on the ground
sector) and Lemma 9.15 (Measure cancellation).

The two lemmas discharge the assembly's warp conditional: under the
conformal rescaling χ = e^{−(d_w/2)A} χ̃, the transverse-massless
fibre eigenproblem of the warped Spin^c Dirac operator reduces to
the unwarped one, and the warped volume weight cancels identically
in every norm and overlap, |χ|² e^{d_w A} = |χ̃|².

The conformal covariance of the Dirac operator,
    D_{e^{2A} g} = e^{−(d+1)A/2} ∘ D_g ∘ e^{(d−1)A/2},
is the cited analytic input [Hitchin 1974; Hijazi 1986;
Bourguignon–Gauduchon 1992]; it is an input here, not a claim of
this file — exactly the pattern of the R5 certificate, whose
spectrum formula is likewise consumed as cited. What this file
certifies is the exponent algebra those lemmas run on:

* squaring the half-weight: (e^{−(d/2)x})² = e^{−dx};
* the measure cancellation e^{−dx} · e^{dx} = 1, and the density
  identity |χ|² e^{d_w A} = |χ̃|² in its scalar shape;
* the net conformal weight of the covariance formula:
  −(d+1)/2 + (d−1)/2 = −1, independent of d — the eigenvalue
  dressing is a single power e^{−A}, which is what vanishes from the
  problem on the transverse-massless (ground) sector;
* the dimension-two instance −3/2, +1/2 matching the displayed
  D_u = e^{−3u/2} D₀ e^{u/2} of §9.1.

FILING NOTE. This certificate is written fresh for Paper 3. If a
local file `GBH4_N2b_ground_sector.lean` exists from the Paper 5
companion set, the two should be diffed and one retained; the
declarations below are self-contained either way.
-/

/-- Squaring the half-weight rescaling: (e^{−(d/2)x})² = e^{−dx}.
    This is |χ|² = e^{−d_w A} |χ̃|² in scalar form. -/
theorem n2b_half_weight_sq (d x : ℝ) :
    (Real.exp (-(d/2) * x))^2 = Real.exp (-(d * x)) := by
  rw [sq, ← Real.exp_add]
  congr 1
  ring

/-- The warped volume weight cancels the rescaled density exactly:
    e^{−dx} · e^{dx} = 1. -/
theorem n2b_measure_cancel (d x : ℝ) :
    Real.exp (-(d * x)) * Real.exp (d * x) = 1 := by
  rw [← Real.exp_add]
  simp

/-- Lemma 9.15 in scalar shape: for any density c = |χ̃|²,
    ((e^{−(d/2)x})² · c) · e^{dx} = c. All ground-sector norms and
    overlaps are warp-free. -/
theorem n2b_density (d x c : ℝ) :
    ((Real.exp (-(d/2) * x))^2 * c) * Real.exp (d * x) = c := by
  rw [n2b_half_weight_sq]
  calc (Real.exp (-(d * x)) * c) * Real.exp (d * x)
      = (Real.exp (-(d * x)) * Real.exp (d * x)) * c := by ring
    _ = 1 * c := by rw [n2b_measure_cancel]
    _ = c := one_mul c

/-- The net conformal weight of the covariance formula is −1,
    independently of the dimension: −((d+1)/2)x + ((d−1)/2)x = −x.
    The eigenvalue dressing is the single power e^{−A}. -/
theorem n2b_net_weight (d x : ℝ) :
    -((d + 1)/2) * x + ((d - 1)/2) * x = -x := by ring

/-- The dimension-two instance: the covariance exponents are −3/2
    and +1/2, matching D_u = e^{−3u/2} D₀ e^{u/2} of §9.1. -/
theorem n2b_dim_two :
    -(((2 : ℚ) + 1)/2) = -3/2 ∧ (((2 : ℚ) - 1)/2) = 1/2 := by
  norm_num

/-- Assembled statement: the finite core of Lemmas 9.14–9.15. -/
theorem n2b_ground_sector_core :
    (∀ d x : ℝ, (Real.exp (-(d/2) * x))^2 = Real.exp (-(d * x))) ∧
    (∀ d x c : ℝ,
      ((Real.exp (-(d/2) * x))^2 * c) * Real.exp (d * x) = c) ∧
    (∀ d x : ℝ, -((d + 1)/2) * x + ((d - 1)/2) * x = -x) :=
  ⟨n2b_half_weight_sq, n2b_density, n2b_net_weight⟩
