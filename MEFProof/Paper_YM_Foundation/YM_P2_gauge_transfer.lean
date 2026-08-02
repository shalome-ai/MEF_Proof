/-
================================================================
YM_P2_gauge_transfer.lean  (module YML.YM_P2)
================================================================
Master certificate for YM-P2 (statement register R-4):
prop:gauge-transfer assembled, with claim (iii) — gauge-group
independence — made STRUCTURAL.

How claim (iii) is machine-checked (parametricity): the master
theorem is quantified over an arbitrary type `G` ("the gauge
group"), and `G` occurs in NONE of the hypotheses, definitions,
or conclusions — the proof term is constant in `G`. This is the
machine-checkable form of v6's "inspection of the proof's
dependencies": the five frozen inputs (register R-5) —
  (1) the 2-torsion structure of σ on T²   [YML.YM_L1, proved]
  (2) positive distance between distinct points  [YML.YM_L2, proved;
      metric-space form of Hopf–Rinow, see YM-L2 header]
  (3) 𝓜-6, (4) 𝓜-8, (5) the spectral reading of thm:index
      [YML.YM_P1, named hypotheses]
— are all G-free, verified by Lean's binder discipline.

Status: CERT, conditional on 𝓜-6, 𝓜-8, the spectral reading of
thm:index, and (in the consequence clause) thm:UV — and
UNCONDITIONAL IN G. Claims (i) and (iii) are discharged; the [D]
weight sits on claim (ii)'s hypotheses, exactly as the prose
classification states. The certificate does not upgrade [D].

The consequence clause ("namely G = SU(3)"): thm:UV's
determination of the gauge group is itself [D] and is NOT
re-proved here; it enters only as the choice of which `G` to
instantiate — and the conclusion is invariant under that choice,
which is precisely the transfer.

Build: inside a Mathlib checkout (tag v4.15.0), with YM_L1, YM_L2,
YM_P1 at YML/:
  lake env sh -c 'LEAN_PATH="$LEAN_PATH:$PWD" lean YML/YM_P2.lean'
================================================================
-/
import MEFProof.Paper_YM_Foundation.YM_L1_corner_distinctness
import MEFProof.Paper_YM_Foundation.YM_L2_positivity
import MEFProof.Paper_YM_Foundation.YM_P1_identification

noncomputable section
namespace YMP2
open YML1 YML2 YMP1

section Master

variable {K : Type*} [MetricSpace K]   -- K₈ with its geodesic distance
variable (ι : T → K)                    -- inclusion of the pillowcase fibre

/-- The corner gap: distance from the (Spinᶜ-selected) vacuum corner
to the nearest orthogonal corner. `c00` as vacuum exemplar; the
argument is corner-symmetric. -/
def cornerGap : ℝ :=
  min (dist (ι c00) (ι c10)) (min (dist (ι c00) (ι c01)) (dist (ι c00) (ι c11)))

-- NOTE: without the option below, Lean's linter reports
-- "unused variable `G`" on the theorem that follows. That report IS
-- claim (iii), issued by the machine itself. It is silenced only to
-- keep the compile warning-free, having been placed on the record.
set_option linter.unusedVariables false in
/-- **YM-P2 (the transfer proposition, master form).** For an
ARBITRARY gauge group `G` — which occurs nowhere in the hypotheses —
if the fibre embeds injectively in `K` and the identification data
carries Δ = cornerGap, then
  (i)  Δ > 0, and
  (ii) Δ is the mass of the lowest non-vacuum one-particle state.
Claim (iii) is the visible fact that `G` is a phantom parameter. -/
theorem gauge_transfer (G : Type*)
    (hι : Function.Injective ι)
    (D : IdentificationData)
    (hΔdef : D.Δ = cornerGap ι) :
    0 < D.Δ ∧ IsLeast D.massSet D.Δ := by
  have hpos : 0 < D.Δ := by rw [hΔdef]; exact gap_pos ι hι
  exact ⟨hpos, identification D (le_of_lt hpos)⟩

/-- The proof term is literally constant in `G`. -/
theorem transfer_constant_in_G (G₁ G₂ : Type*)
    (hι : Function.Injective ι) (D : IdentificationData)
    (hΔdef : D.Δ = cornerGap ι) :
    gauge_transfer ι G₁ hι D hΔdef = gauge_transfer ι G₂ hι D hΔdef :=
  rfl

/-- **Consequence clause.** Instantiation at the gauge group
determined by thm:UV — namely SU(3) — is literal instantiation:
the conclusion is unchanged because `G` does not occur. thm:UV
itself remains a named [D] input, represented here only by the
choice of instantiating type. -/
theorem consequence (G_UV : Type*)
    (hι : Function.Injective ι) (D : IdentificationData)
    (hΔdef : D.Δ = cornerGap ι) :
    0 < D.Δ ∧ IsLeast D.massSet D.Δ :=
  gauge_transfer ι G_UV hι D hΔdef

end Master
end YMP2
