/-
  LP0_certificate.lean — Lean 4 (Mathlib)
  Work package L-P0: configuration-space topology.

  WHAT THIS CERTIFICATE PROVES (decidable/rational layer only):
  (1) The von Neumann–Wigner codimension-three core: the discriminant
      of the 2×2 Hermitian characteristic polynomial is the sum of
      squares (a−d)² + 4b² + 4c², and its vanishing is equivalent to
      the three independent conditions a = d, b = 0, c = 0.
  (2) The Betti data consumed by L-P0: the Poincaré polynomial product
      (1+t²+t⁴)(1+t²)(1+t²) has coefficient list (1,0,3,0,4,0,3,0,1),
      total 12, and in particular b₂ = 3 — the number of two-cycles
      TASK L-P0.1 must exhibit.
  (3) σ-evenness is closed under affine combination — the formal core
      of Lemma lp0:ambient (the obstruction to contraction cannot come
      from the linear structure; it must come from the discriminant).

  WHAT THIS CERTIFICATE DOES NOT PROVE:
  the homotopy equivalence X ≃ K₈ (infinite-dimensional analysis);
  the codimension statement for the actual operator family D_Φ;
  the Berry–Simon Chern-charge lemma; the Palais–Smale condition.
-/
import Mathlib

namespace LP0

/- ------------------------------------------------------------------
   §1  The von Neumann–Wigner codimension-three core
   ------------------------------------------------------------------ -/

/-- The characteristic discriminant of ((a, b+ic), (b−ic, d)) equals
    the sum of squares (a−d)² + 4b² + 4c². -/
theorem herm_discriminant (a d b c : ℚ) :
    (a + d) ^ 2 - 4 * (a * d - b ^ 2 - c ^ 2)
      = (a - d) ^ 2 + 4 * b ^ 2 + 4 * c ^ 2 := by
  ring

/-- Vanishing of the discriminant is exactly the three independent
    real conditions: eigenvalue coincidence has codimension three. -/
theorem vnw_codim_three (a d b c : ℚ) :
    (a - d) ^ 2 + 4 * b ^ 2 + 4 * c ^ 2 = 0 ↔ (a = d ∧ b = 0 ∧ c = 0) := by
  constructor
  · intro h
    have had : (a - d) ^ 2 = 0 := by
      linarith [sq_nonneg (a - d), sq_nonneg b, sq_nonneg c]
    have hb : b ^ 2 = 0 := by
      linarith [sq_nonneg (a - d), sq_nonneg b, sq_nonneg c]
    have hc : c ^ 2 = 0 := by
      linarith [sq_nonneg (a - d), sq_nonneg b, sq_nonneg c]
    refine ⟨?_, ?_, ?_⟩
    · exact sub_eq_zero.mp (pow_eq_zero_iff (by norm_num : (2 : ℕ) ≠ 0) |>.mp had)
    · exact pow_eq_zero_iff (by norm_num : (2 : ℕ) ≠ 0) |>.mp hb
    · exact pow_eq_zero_iff (by norm_num : (2 : ℕ) ≠ 0) |>.mp hc
  · rintro ⟨rfl, rfl, rfl⟩
    ring

/- Contrast case, recorded for the codimension count: for a REAL
   symmetric family (c = 0 identically) the coincidence is only two
   conditions — the crossing locus is codimension two, and 2-spheres
   do not generically link it. The Spin^c Dirac family is complex. -/
theorem real_symmetric_codim_two (a d b : ℚ) :
    (a - d) ^ 2 + 4 * b ^ 2 = 0 ↔ (a = d ∧ b = 0) := by
  constructor
  · intro h
    have had : (a - d) ^ 2 = 0 := by
      linarith [sq_nonneg (a - d), sq_nonneg b]
    have hb : b ^ 2 = 0 := by
      linarith [sq_nonneg (a - d), sq_nonneg b]
    exact ⟨sub_eq_zero.mp (pow_eq_zero_iff (by norm_num : (2 : ℕ) ≠ 0) |>.mp had),
           pow_eq_zero_iff (by norm_num : (2 : ℕ) ≠ 0) |>.mp hb⟩
  · rintro ⟨rfl, rfl⟩
    ring

/- ------------------------------------------------------------------
   §2  Betti data: b₂(K₈) = 3, the target count of TASK L-P0.1
   ------------------------------------------------------------------ -/

/-- Coefficient-list addition (padded). -/
def addLists : List ℕ → List ℕ → List ℕ
  | [], ys => ys
  | xs, [] => xs
  | x :: xs, y :: ys => (x + y) :: addLists xs ys

/-- Coefficient-list polynomial multiplication. -/
def polymul : List ℕ → List ℕ → List ℕ
  | [], _ => []
  | x :: xs, b => addLists (b.map (x * ·)) (0 :: polymul xs b)

/-- The Poincaré coefficient list of K₈:
    (1+t²+t⁴)(1+t²)(1+t²) = 1 + 3t² + 4t⁴ + 3t⁶ + t⁸. -/
def bettiK8 : List ℕ := polymul (polymul [1,0,1,0,1] [1,0,1]) [1,0,1]

theorem bettiK8_val : bettiK8 = [1,0,3,0,4,0,3,0,1] := by decide

theorem bettiK8_total : bettiK8.sum = 12 := by decide

/-- b₂ = 3: the number of independent two-cycles L-P0 demands of X. -/
theorem b2_eq_three : bettiK8[2]? = some 3 := by decide

/- Bidegree provenance of the three 2-classes (consumed by
   Proposition lp0:three): one from H²(ℂP²), one from H²(S²), one
   from the pillowcase invariant class. Recorded as the base/fibre
   split 2 + 1. -/
theorem b2_base_fibre_split : (2 : ℕ) + 1 = 3 := by decide

/- ------------------------------------------------------------------
   §3  σ-evenness is closed under affine combination
   (the formal core of Lemma lp0:ambient)
   ------------------------------------------------------------------ -/

variable {α : Type*} (s : α → α)

/-- A configuration is σ-even when it is invariant under the
    involution on points. -/
def SigmaEven (f : α → ℚ) : Prop := ∀ x, f (s x) = f x

/-- Affine combinations of σ-even configurations are σ-even: the
    straight-line path never leaves the symmetry class, so no
    topology arises from the linear structure. -/
theorem sigmaEven_affine (t : ℚ) (f g : α → ℚ)
    (hf : SigmaEven s f) (hg : SigmaEven s g) :
    SigmaEven s (fun x => t * f x + (1 - t) * g x) := by
  intro x
  show t * f (s x) + (1 - t) * g (s x) = t * f x + (1 - t) * g x
  rw [hf x, hg x]

/-- Constant shifts preserve σ-evenness (the area-normalisation map
    of Lemma lp0:ambient acts by a constant shift). -/
theorem sigmaEven_shift (κ : ℚ) (f : α → ℚ) (hf : SigmaEven s f) :
    SigmaEven s (fun x => f x + κ) := by
  intro x
  show f (s x) + κ = f x + κ
  rw [hf x]

end LP0
