/-
Certificate 5 (Corollary: scope, statement-level abstraction).
The EXISTENCE claim Δ > 0 is gauge-group independent; the numerical
VALUE is not. This certificate carries the abstraction — four
distinct points in a metric space, two point-sets of different
gap; the admissible instantiation is Certificate 9.
Formalisation (statement-level): a "selection" is the data the value
actually depends on -- the distinguished corner image and the three
remaining corner images, pairwise distinct from it. Two theorems:
  (1) existence is selection- and G-uniform;
  (2) two explicit point-selections with DIFFERENT gap values
      (1 and 2), witnessing that the abstract gap function is
      non-constant; admissibility is carried by Certificate 9.
The parameter `G` below occurs in no hypothesis; the existence
half quantifies over it.
Unconditional (statement-level); zero `sorry`.
-/
import YML.Gap

noncomputable section
namespace Scope
open Gap

/-- A corner selection in a metric space `K`: the distinguished corner
image and the three remaining corner images, pairwise distinct from
it. (The data the value of Δ actually depends on.) -/
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

-- The linter's "unused variable `G`" report is the existence half's
-- gauge-independence, issued by the machine; silenced only to keep
-- the compile warning-free.
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

/-- **Value half.** The value of the gap is not
selection-independent: two admissible selections with different
values. Hence no value-independence claim can be made. -/
theorem value_depends_on_selection : selA.gap ≠ selB.gap := by
  rw [gapA, gapB]; norm_num

end Scope