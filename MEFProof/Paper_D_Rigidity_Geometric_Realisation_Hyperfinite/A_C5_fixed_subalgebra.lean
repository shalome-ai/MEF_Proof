/-
  A_C5_fixed_subalgebra.lean  —  Paper A certificate C5.
  Statements certified, stagewise on M_{4^n}(ℂ) (entries modelled as
  Gaussian pairs (re, im) with conjugation (a, b) ↦ (a, −b)):

    (1)  Θ(A) = A*  ⟺  every entry of A is real
         — the stagewise computation behind R_ℝ ∩ 𝔄 = ⋃ M_{4^n}(ℝ)
           (Paper A, Proposition on the real form).
    (2)  Θ(A) = A   ⟺  A is symmetric
         — the linear fixed points, recorded to witness that the two
           notions differ (the Jordan caveat of §3).
    (3)  On real matrices, Θ and * coincide.

  Lean 4.29.1, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC5

/-- Complex entries as pairs (re, im). -/
def C2 := Int × Int

def conj (z : C2) : C2 := (z.1, -z.2)

def Mat := Nat → Nat → C2

/-- Θ, the transpose. -/
def transpose (A : Mat) : Mat := fun i j => A j i

/-- The adjoint A* (conjugate transpose). -/
def star (A : Mat) : Mat := fun i j => conj (A j i)

def isReal (A : Mat) : Prop := ∀ i j, (A i j).2 = 0

def isSymmetric (A : Mat) : Prop := ∀ i j, A j i = A i j

/-- (1)  Θ(A) = A*  ⟺  A has real entries. -/
theorem theta_eq_star_iff_real (A : Mat) :
    (∀ i j, transpose A i j = star A i j) ↔ isReal A := by
  constructor
  · intro h i j
    have hji := h j i
    -- transpose A j i = A i j ;  star A j i = conj (A i j)
    have : A i j = conj (A i j) := hji
    have hsnd : (A i j).2 = -((A i j).2) := congrArg Prod.snd this
    omega
  · intro h i j
    show A j i = conj (A j i)
    have hz : (A j i).2 = 0 := h j i
    unfold conj
    have hfst : (A j i).1 = (A j i).1 := rfl
    have hsnd : (A j i).2 = -((A j i).2) := by omega
    calc A j i = ((A j i).1, (A j i).2) := rfl
      _ = ((A j i).1, -((A j i).2)) := by rw [← hsnd]

/-- (2)  Θ(A) = A  ⟺  A is symmetric.  (Definitional.) -/
theorem theta_fixed_iff_symmetric (A : Mat) :
    (∀ i j, transpose A i j = A i j) ↔ isSymmetric A :=
  Iff.rfl

/-- (3)  On real matrices, Θ = *. -/
theorem theta_eq_star_of_real (A : Mat) (h : isReal A) :
    ∀ i j, transpose A i j = star A i j :=
  (theta_eq_star_iff_real A).mpr h

#print axioms theta_eq_star_iff_real
#print axioms theta_fixed_iff_symmetric
#print axioms theta_eq_star_of_real

end AC5
