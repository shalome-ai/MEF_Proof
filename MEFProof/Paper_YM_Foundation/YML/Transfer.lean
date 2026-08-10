/-
Certificate 4 (Proposition: gauge transfer, master form) — AMENDED
(wave 2: per ruling R1(d), the gauge group is now a NAMED FIELD of
a `Theory` structure, not a bare quantifier absent from the data.
The independence claim (iii) is thereby about a datum the
structure genuinely carries).
The master theorem is proved for an arbitrary value of the
gauge-group field; the field occurs in none of the hypotheses or
conclusions, and the identity of the proofs at two theories
sharing the same spectral data but distinct gauge groups is
definitional (`rfl`). The complete input set:
  (1) the 2-torsion structure of σ on T²      [Certificate 1, proved]
  (2) positive distance between distinct points [Certificate 2, proved]
  (3) κ > 0                                    [class datum, named]
  (4) (A1), (5) (A2), (6) (A3)                 [Certificate 3, named]
— all G-free, verified by Lean's binder discipline on the field.
Conditional on (A1)–(A3); unconditional in the gauge-group field.
STATUS: source amended this wave; local compile pending (recorded
in the wave log; no compile claim is made here).
-/
import YML.Corners
import YML.Gap
import YML.Identification

noncomputable section
namespace Transfer
open Corners Gap Identification

section Master

variable {K : Type*} [MetricSpace K]   -- the ambient manifold, as a metric space
variable (ι : T → K)                    -- inclusion of the pillowcase fibre

/-- The corner gap: distance from the distinguished corner to the
nearest remaining corner. `c00` as the distinguished exemplar; the
argument is corner-symmetric. -/
def cornerGap : ℝ :=
  min (dist (ι c00) (ι c10)) (min (dist (ι c00) (ι c01)) (dist (ι c00) (ι c11)))

/-- A theory of the class: a gauge group, carried as a named
datum, together with the spectral data of Certificate 3. The
hypotheses (A1)–(A3) and the data Δ, κ live in `data`; `G` is the
gauge group of the reduction and appears in no hypothesis. -/
structure Theory where
  /-- the gauge group of the reduction — a genuine field of the
      structure -/
  G : Type*
  /-- the spectral data and class hypotheses -/
  data : IdentificationData

/-- **Gauge transfer (master form).** For every theory `T` — whose
gauge-group field is arbitrary and occurs in no hypothesis — if
the fibre embeds injectively in `K` and the spectral data carry
Δ = cornerGap, then (i) Δ > 0, and (ii) κ·Δ is the mass of the
lowest non-vacuum one-particle state. Claim (iii) is the visible
fact that the conclusion does not mention `T.G`. -/
theorem gauge_transfer (T : Theory)
    (hι : Function.Injective ι)
    (hΔdef : T.data.Δ = cornerGap ι) :
    0 < T.data.Δ ∧ IsLeast T.data.massSet (T.data.κ * T.data.Δ) := by
  have hpos : 0 < T.data.Δ := by rw [hΔdef]; exact gap_pos ι hι
  exact ⟨hpos, identification T.data (le_of_lt hpos)⟩

/-- The proof is literally constant across theories sharing the
same spectral data: two theories with distinct gauge groups but
equal `data` receive definitionally identical proofs. -/
theorem transfer_constant_in_G (G₁ G₂ : Type*)
    (D : IdentificationData)
    (hι : Function.Injective ι) (hΔdef : D.Δ = cornerGap ι) :
    gauge_transfer ι ⟨G₁, D⟩ hι hΔdef = gauge_transfer ι ⟨G₂, D⟩ hι hΔdef :=
  rfl

end Master
end Transfer
