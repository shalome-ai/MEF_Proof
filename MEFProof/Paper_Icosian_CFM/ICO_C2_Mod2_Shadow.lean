/-
  ICO_C2 : The mod-2 shadow of the Sol monodromy
  Source: The_Icosian_Completion_of_K8_v2.tex
    - Remark rem:mod2                                            [R]
    (arithmetic restatement of Lemma 1 / lem:3cycle, whose geometric
     content is consumed from Paper XV and is NOT re-certified here)
  Encoding: M̄ = [[0,1],[1,1]] ∈ GL(2, F₂) acting on F₂², with F₂ = Fin 2
    under its modular arithmetic; M̄ (x, y) = (y, x + y).
  Deflationary reading: the certificate verifies that the mod-2 reduction
  of M = [[2,1],[1,1]] has order exactly 3, has no non-zero fixed vector,
  acts in a single 3-cycle on the three non-zero points of F₂², and has
  irreducible characteristic polynomial x² + x + 1 over F₂. The
  identification of the corner set of the pillowcase with F₂² via
  eq:corners is geometric and human-auditable.
  Lean 4.15.0 core only. No axioms beyond kernel defaults. Zero sorry.
-/

namespace ICOC2

/-- M̄ mod 2: (x, y) ↦ (y, x + y), i.e. the matrix [[0,1],[1,1]]. -/
def M (x y : Fin 2) : Fin 2 × Fin 2 := (y, x + y)

def M2 (x y : Fin 2) : Fin 2 × Fin 2 := M (M x y).1 (M x y).2
def M3 (x y : Fin 2) : Fin 2 × Fin 2 := M (M2 x y).1 (M2 x y).2

/-- M̄³ = I on F₂². -/
theorem M_cubed_id : ∀ x y : Fin 2, M3 x y = (x, y) := by decide

/-- M̄ ≠ I : together with M̄³ = I and 3 prime, order(M̄) = 3. -/
theorem M_not_id : ¬ (∀ x y : Fin 2, M x y = (x, y)) := by decide

/-- No non-zero fixed vector: M̄ v = v → v = 0. -/
theorem no_nonzero_fixed : ∀ x y : Fin 2, M x y = (x, y) → (x = 0 ∧ y = 0) := by
  decide

/-- The single 3-cycle on the three non-zero points:
    (1,0) → (0,1) → (1,1) → (1,0). -/
theorem three_cycle :
    M 1 0 = (0, 1) ∧ M 0 1 = (1, 1) ∧ M 1 1 = (1, 0) := by decide

/-- Characteristic polynomial x² + x + 1 of M̄ has no root in F₂
    (irreducibility over F₂; hence no eigenvector, cf. no_nonzero_fixed). -/
theorem charpoly_irreducible : ∀ x : Fin 2, x * x + x + 1 ≠ 0 := by decide

#print axioms M_cubed_id
#print axioms M_not_id
#print axioms no_nonzero_fixed
#print axioms three_cycle
#print axioms charpoly_irreducible

end ICOC2
