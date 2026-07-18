/-
  O3_certificate.lean — Lean 4 (Mathlib)
  Work package O3: distinctness of the six base-sector replicas.

  WHAT THIS CERTIFICATE PROVES (finite arithmetic layer only):
  (1) The base Betti data: the Poincaré coefficient list of
      B = ℂP² × S² is (1,0,2,0,2,0,1), with total 6 = χ(B) and all
      odd entries zero (lem:asm-diag's unsigned-equals-signed count).
  (2) The bidegree labelling: the six base harmonic states carry the
      six pairwise-distinct labels (0,0),(2,0),(0,2),(4,0),(2,2),(4,2),
      which exhaust the product {0,2,4} × {0,2} exactly — so the
      labelling is injective and complete, the formal core of the
      block-rigidity argument in lem. o3:blocks.
  (3) The label-preservation schema: an action fixing every label
      cannot identify two blocks with distinct labels (injectivity
      transport — trivial but recorded, since it is the step that
      converts "labels distinct" into "blocks cannot merge").

  WHAT THIS CERTIFICATE DOES NOT PROVE:
  the second-variation formula (lem. o3:secondvar), the block form of
  the Hessian for the actual operator, or the pairwise inequality of
  the six dressed weight functionals (the hypothesis of
  prop. o3:distinct) — these are spectral-analytic content outside
  decidable scope.
-/
import Mathlib

namespace O3

/- ------------------------------------------------------------------
   §1  Base Betti arithmetic
   ------------------------------------------------------------------ -/

def addLists : List ℕ → List ℕ → List ℕ
  | [], ys => ys
  | xs, [] => xs
  | x :: xs, y :: ys => (x + y) :: addLists xs ys

def polymul : List ℕ → List ℕ → List ℕ
  | [], _ => []
  | x :: xs, b => addLists (b.map (x * ·)) (0 :: polymul xs b)

/-- Poincaré coefficient list of B = ℂP² × S²:
    (1+t²+t⁴)(1+t²) = 1 + 2t² + 2t⁴ + t⁶. -/
def bettiB : List ℕ := polymul [1, 0, 1, 0, 1] [1, 0, 1]

theorem bettiB_val : bettiB = [1, 0, 2, 0, 2, 0, 1] := by decide

/-- χ(B) = 6: the base multiplicity of the assembly. -/
theorem chiB_six : bettiB.sum = 6 := by decide

/-- Odd entries vanish: the unsigned harmonic count equals the signed
    one (lem:asm-diag). -/
theorem bettiB_odd_vanish :
    bettiB[1]? = some 0 ∧ bettiB[3]? = some 0 ∧ bettiB[5]? = some 0 := by
  decide

/- ------------------------------------------------------------------
   §2  The bidegree labelling of the six base states
   ------------------------------------------------------------------ -/

/-- The six bidegree labels (p, q), p ∈ H^p(ℂP²), q ∈ H^q(S²). -/
def basePairs : List (ℕ × ℕ) :=
  [(0, 0), (2, 0), (0, 2), (4, 0), (2, 2), (4, 2)]

theorem basePairs_count : basePairs.length = 6 := by decide

/-- The six labels are pairwise distinct. -/
theorem basePairs_nodup : basePairs.Nodup := by decide

/-- The labels exhaust the product {0,2,4} × {0,2} exactly:
    completeness of the Künneth bookkeeping. The right-hand list is
    the explicit enumeration of the product in lexicographic order. -/
theorem basePairs_exhaust :
    basePairs.Perm [(0, 0), (0, 2), (2, 0), (2, 2), (4, 0), (4, 2)] := by
  decide

/-- Degree bookkeeping: the total degrees p + q of the six labels
    reproduce the exponent multiset {0,2,2,4,4,6} of the Poincaré
    polynomial of B (equality as multisets, via permutation). -/
theorem basePairs_degrees :
    (basePairs.map (fun pq => pq.1 + pq.2)).Perm [0, 2, 2, 4, 4, 6] := by
  decide

/- ------------------------------------------------------------------
   §3  Label preservation excludes merging
   ------------------------------------------------------------------ -/

/-- If a symmetry action fixes every label, blocks with distinct
    labels remain distinct under it: a merging of two replicas would
    require an identification across distinct labels, which no
    label-preserving action supplies. -/
theorem no_merge_of_label_preserving {ι Λ : Type*}
    (label : ι → Λ) (act : ι → ι)
    (hfix : ∀ i, label (act i) = label i)
    (i j : ι) (hne : label i ≠ label j) :
    label (act i) ≠ label (act j) := by
  rw [hfix i, hfix j]
  exact hne

/-- Instantiation: the six concrete labels are injectively indexed. -/
def labelOf : Fin 6 → ℕ × ℕ :=
  ![(0, 0), (2, 0), (0, 2), (4, 0), (2, 2), (4, 2)]

theorem labelOf_injective : Function.Injective labelOf := by decide

end O3
