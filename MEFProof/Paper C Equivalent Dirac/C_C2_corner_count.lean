/-
  C_C2_corner_count.lean
  Paper C — certificate C2 (node C6 counting basis).

  The pillowcase T^2/Z_2 has exactly four isolated orbifold corners
  (the fixed points of the elliptic involution). The corner set of
  the n-fold product (T^2/Z_2)^n is the n-fold cartesian product of
  the corner set of one factor, so the corner count satisfies the
  product rule  corners (n+1) = 4 * corners n  with  corners 0 = 1.

  Certified statements:
  (1) corners_eq_pow        : corners n = 4 ^ n.
  (2) corners_eq_matrix_dim : 4 ^ n is also the side length of the
      matrix stage M_{4^n}; the counting bases of the geometric and
      algebraic towers agree at every stage.
  (3) corners_pos           : the count is positive at every stage.

  Lean 4.15.0, core only. No axioms, no sorry.
-/

namespace PaperC.C2

/-- Corner count of the n-fold pillowcase product, by the product rule. -/
def corners : Nat → Nat
  | 0 => 1
  | n + 1 => 4 * corners n

/-- Side length of the n-th matrix algebra stage M_{4^n}. -/
def matrixDim : Nat → Nat := fun n => 4 ^ n

/-- (1) The corner count is 4^n. -/
theorem corners_eq_pow : ∀ n, corners n = 4 ^ n
  | 0 => rfl
  | n + 1 => by
      show 4 * corners n = 4 ^ (n + 1)
      rw [corners_eq_pow n, Nat.pow_succ, Nat.mul_comm]

/-- (2) Geometric corner count = algebraic matrix dimension, stagewise. -/
theorem corners_eq_matrix_dim (n : Nat) : corners n = matrixDim n :=
  corners_eq_pow n

/-- (3) Positivity at every stage. -/
theorem corners_pos (n : Nat) : 0 < corners n := by
  rw [corners_eq_pow]
  exact Nat.pos_pow_of_pos n (by decide)

end PaperC.C2
