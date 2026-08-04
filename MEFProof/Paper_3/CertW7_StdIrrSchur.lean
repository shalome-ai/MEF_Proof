/- CERT-W7 (+W8): representation-theoretic core of lem:std-irr and
   lem:evc-schur (core Lean, no Mathlib).
   The sum-zero plane {(a,b,c) : a+b+c = 0} is presented in the integer
   basis e₁ = (1,-1,0), e₂ = (0,1,-1); the transpositions (12), (23) of
   S₃ act by the matrices A = [[-1,1],[0,1]], B = [[1,0],[1,-1]].
   Certifies: (W7) the basis lands in the sum-zero plane; A, B satisfy
   the S₃ relations and generate six distinct elements; the two
   A-eigenlines are not B-invariant (concrete, matching the paper's
   proof); and no common eigenline exists (universal over ℤ).
   (W8) any matrix commuting with A and B is the scalar p·I (the
   commutant elimination is by linear cancellation, valid over any
   commutative ring; ℤ is the certified instance); a non-zero scalar
   matrix has non-zero determinant, hence every non-zero equivariant
   map is invertible; and the normalising corner vector of def:evc has
   non-zero coordinates in the model (agreeing with CERT-W4's
   sum-zero projection (4,4,-8)).
   The eigenline exclusion consumes 3 ≠ 0, i.e. characteristic ≠ 3 —
   over ℂ, where the paper works, this holds; over 𝔽₃ the standard
   representation is genuinely reducible and no certificate could
   remove the hypothesis. The identifications of V_geo and V_spec with
   the sum-zero model (the second half of lem:std-irr, consuming
   lem:antiinv, lem:telescope, thm:level-stabiliser and
   lem:same-vector) are human-audited inputs, outside scope. -/

namespace CertW7

/-- 2×2 integer matrices as quadruples (a, b, c, d) = [[a,b],[c,d]]. -/
def mmul (X Y : Int × Int × Int × Int) : Int × Int × Int × Int :=
  (X.1 * Y.1 + X.2.1 * Y.2.2.1,
   X.1 * Y.2.1 + X.2.1 * Y.2.2.2,
   X.2.2.1 * Y.1 + X.2.2.2 * Y.2.2.1,
   X.2.2.1 * Y.2.1 + X.2.2.2 * Y.2.2.2)

def mvec (X : Int × Int × Int × Int) (v : Int × Int) : Int × Int :=
  (X.1 * v.1 + X.2.1 * v.2, X.2.2.1 * v.1 + X.2.2.2 * v.2)

def I2 : Int × Int × Int × Int := (1, 0, 0, 1)

/-- The transposition (12) on the sum-zero plane, basis (e₁, e₂). -/
def Amat : Int × Int × Int × Int := (-1, 1, 0, 1)

/-- The transposition (23) on the sum-zero plane, basis (e₁, e₂). -/
def Bmat : Int × Int × Int × Int := (1, 0, 1, -1)

/-- The basis presentation (a, b) ↦ a·e₁ + b·e₂ = (a, b - a, -b). -/
def present (a b : Int) : Int × Int × Int := (a, b - a, -b)

/-- W7: the presentation lands in the sum-zero plane, for every (a, b). -/
theorem present_sumzero (a b : Int) :
    (present a b).1 + (present a b).2.1 + (present a b).2.2 = 0 := by
  simp [present]; omega

/-- W7: the S₃ relations A² = B² = (AB)³ = 1. -/
theorem s3_relations :
    mmul Amat Amat = I2 ∧ mmul Bmat Bmat = I2 ∧
    mmul (mmul Amat Bmat) (mmul (mmul Amat Bmat) (mmul Amat Bmat)) = I2 := by
  decide

/-- W7: the words 1, A, B, AB, BA, ABA are pairwise distinct — the
    representation is faithful on six elements, hence on S₃. -/
def sixWords : List (Int × Int × Int × Int) :=
  [I2, Amat, Bmat, mmul Amat Bmat, mmul Bmat Amat,
   mmul Amat (mmul Bmat Amat)]

theorem six_words_distinct : sixWords.Pairwise (· ≠ ·) := by decide

/-- W7, concrete half (the paper's proof verbatim): the A-eigenvectors
    (1,1,-2) and (1,-1,0), in basis coordinates (1,2) and (1,0), have
    eigenvalues +1 and -1, and their B-images are proportional to
    neither. -/
theorem a_eigenvectors :
    mvec Amat (1, 2) = (1, 2) ∧ mvec Amat (1, 0) = (-1, 0) := by decide

/-- The basis coordinates (1,2), (1,0) present the paper's ambient
    eigenvectors (1,1,-2), (1,-1,0); their B-images (1,-1), (1,1)
    present the paper's (1,-2,1), (1,0,-1). -/
theorem eigenvector_presentations :
    present 1 2 = (1, 1, -2) ∧ present 1 0 = (1, -1, 0) ∧
    mvec Bmat (1, 2) = (1, -1) ∧ present 1 (-1) = (1, -2, 1) ∧
    mvec Bmat (1, 0) = (1, 1) ∧ present 1 1 = (1, 0, -1) := by decide

theorem b_breaks_eigenlines :
    (mvec Bmat (1, 2)).1 * 2 - (mvec Bmat (1, 2)).2 * 1 ≠ 0 ∧
    (mvec Bmat (1, 0)).1 * 0 - (mvec Bmat (1, 0)).2 * 1 ≠ 0 := by decide

/-- W7, universal half: no common eigenline over ℤ. The hypotheses are
    the vanishing of the parallelism determinants det[Av | v] and
    det[Bv | v]; the conclusion is v = 0. -/
theorem no_common_eigenline (x y : Int)
    (h1 : (mvec Amat (x, y)).1 * y - (mvec Amat (x, y)).2 * x = 0)
    (h2 : (mvec Bmat (x, y)).1 * y - (mvec Bmat (x, y)).2 * x = 0) :
    x = 0 ∧ y = 0 := by
  simp [mvec, Amat, Bmat] at h1 h2
  -- h1 : (-x + y) * y - y * x = 0,  h2 : x * y - (x + -y) * x = 0
  rw [Int.add_mul, Int.neg_mul, Int.mul_comm y x] at h1
  rw [Int.add_mul, Int.neg_mul, Int.mul_comm y x] at h2
  -- linear in the atoms x*y, y*y, x*x from here on
  by_cases hy : y = 0
  · subst hy
    have hx2 : x * x = 0 := by
      have h0 : x * (0 : Int) = 0 := Int.mul_zero x
      omega
    rcases Int.mul_eq_zero.mp hx2 with hx | hx <;> exact ⟨hx, rfl⟩
  · -- h1 forces y·y = 2·(x·y), hence y = 2x by right-cancellation
    have h3 : y * y = 2 * x * y := by
      have := Int.mul_assoc 2 x y
      omega
    have hy2 : y = 2 * x := Int.eq_of_mul_eq_mul_right hy h3
    -- substitute into h2: 3·(x·x) = 0, hence x = 0, hence y = 0 — contradiction
    have hxx : x * x = 0 := by
      rw [hy2, Int.mul_left_comm] at h2
      omega
    rcases Int.mul_eq_zero.mp hxx with hx | hx <;>
      exact absurd (by rw [hy2, hx, Int.mul_zero]) hy

/-- W8: the commutant is scalar. Any integer matrix commuting with both
    A and B has q = r = 0 and s = p. The elimination is linear. -/
theorem commutant_scalar (p q r s : Int)
    (hA : mmul (p, q, r, s) Amat = mmul Amat (p, q, r, s))
    (hB : mmul (p, q, r, s) Bmat = mmul Bmat (p, q, r, s)) :
    q = 0 ∧ r = 0 ∧ s = p := by
  simp [mmul, Amat, Bmat] at hA hB
  omega

def mdet (X : Int × Int × Int × Int) : Int :=
  X.1 * X.2.2.2 - X.2.1 * X.2.2.1

/-- W8: a non-zero scalar matrix is invertible (non-zero determinant). -/
theorem scalar_invertible (p : Int) (hp : p ≠ 0) :
    mdet (p, 0, 0, p) ≠ 0 := by
  simp [mdet]
  exact hp

/-- W8: the normalising vector of def:evc, in model coordinates. The
    3-scaled sum-zero projection (4,4,-8) of CERT-W4 has basis
    coordinates (4, 8): present 4 8 = (4, 4, -8) ≠ 0. -/
theorem normaliser_nonzero :
    present 4 8 = (4, 4, -8) ∧ ((4 : Int), (8 : Int)) ≠ (0, 0) := by decide

#print axioms present_sumzero
#print axioms s3_relations
#print axioms six_words_distinct
#print axioms a_eigenvectors
#print axioms eigenvector_presentations
#print axioms b_breaks_eigenlines
#print axioms no_common_eigenline
#print axioms commutant_scalar
#print axioms scalar_invertible
#print axioms normaliser_nonzero

end CertW7
