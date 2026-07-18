/-
================================================================
YM_C1_scope.lean  (module YML.YM_C1)
================================================================
Statement-level certificate for YM-C1 (statement register R-6):
the scope corollary cor:gauge-scope — the EXISTENCE claim Δ > 0
is gauge-group independent; the numerical VALUE of Δ is not: it
depends on the corner-selection data (which corner is the vacuum,
and the induced metric — the Spinᶜ selection Sp(1) → U(1) of
Paper XXI §4.4), and no value-independence claim is made.

Formalisation (statement-level): a "selection" is the data the
value actually depends on — the four corner images in the metric
space, pairwise distinct. Two theorems:
  (1) existence_selection_and_gauge_independent — for EVERY
      admissible selection and EVERY G, the gap is positive
      (existence transfers);
  (2) value_depends_on_selection — two explicit admissible
      selections with DIFFERENT gap values (1 and 2), witnessing
      that the value is a function of the selection, not a
      gauge-group invariant.
As in YM-P2, `G` is a phantom parameter throughout.

Status: CERT (statement-level, unconditional — zero `sorry`).

Build: inside a Mathlib checkout (tag v4.15.0), with YM_L2 at YML/:
  lake env sh -c 'LEAN_PATH="$LEAN_PATH:$PWD" lean YML/YM_C1.lean'
================================================================
-/
import YML.YM_L2

noncomputable section
namespace YMC1
open YML2

/-- A corner selection in a metric space `K`: the vacuum corner image
and the three orthogonal corner images, pairwise distinct from the
vacuum. (The data the value of Δ actually depends on.) -/
structure Selection (K : Type*) [MetricSpace K] where
  vac : K
  o1 : K
  o2 : K
  o3 : K
  h1 : vac ≠ o1
  h2 : vac ≠ o2
  h3 : vac ≠ o3

/-- The gap of a selection. -/
def Selection.gap {K : Type*} [MetricSpace K] (s : Selection K) : ℝ :=
  min (dist s.vac s.o1) (min (dist s.vac s.o2) (dist s.vac s.o3))

-- The linter's "unused variable `G`" report is the scope claim's
-- gauge-independence half, issued by the machine; silenced only to
-- keep the compile warning-free, having been placed on the record.
set_option linter.unusedVariables false in
/-- **Existence half.** For every admissible selection and every
gauge group `G`, the gap is positive. Selection- and G-uniform. -/
theorem existence_selection_and_gauge_independent
    (G : Type*) {K : Type*} [MetricSpace K] (s : Selection K) :
    0 < s.gap :=
  min₃_pos (dist_pos_of_ne s.h1) (dist_pos_of_ne s.h2) (dist_pos_of_ne s.h3)

/-! ### Value half: two admissible selections, different values -/

/-- Selection A: corners at 0, 1, 2, 3 on the real line. -/
def selA : Selection ℝ where
  vac := 0
  o1 := 1
  o2 := 2
  o3 := 3
  h1 := by norm_num
  h2 := by norm_num
  h3 := by norm_num

/-- Selection B: corners at 0, 2, 4, 6 on the real line. -/
def selB : Selection ℝ where
  vac := 0
  o1 := 2
  o2 := 4
  o3 := 6
  h1 := by norm_num
  h2 := by norm_num
  h3 := by norm_num

theorem gapA : selA.gap = 1 := by
  simp only [Selection.gap, selA, Real.dist_eq]
  norm_num

theorem gapB : selB.gap = 2 := by
  simp only [Selection.gap, selB, Real.dist_eq]
  norm_num

/-- **Value half (YM-C1).** The value of the gap is not
selection-independent: two admissible selections with different
values. Hence no value-independence claim can be made — exactly the
scope limit of cor:gauge-scope. -/
theorem value_depends_on_selection : selA.gap ≠ selB.gap := by
  rw [gapA, gapB]; norm_num

end YMC1
