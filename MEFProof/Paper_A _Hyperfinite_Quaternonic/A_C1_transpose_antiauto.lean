/-
  A_C1_transpose_antiauto.lean  —  Paper A certificate C1.
  Statement certified: the matrix transpose satisfies
      Θ(AB) = Θ(B) Θ(A)   and   Θ² = id.
  Matrices are modelled with entries in ℤ; the proofs use only
  commutativity of entry multiplication, so the identities are generic
  over commutative rings (in the paper: ℂ).
  Lean 4.15.0, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC1

/-- Square matrices of formal size `n`, indexed by naturals. -/
def Mat := Nat → Nat → Int

/-- `sum n f = f 0 + ⋯ + f (n-1)`. -/
def sum : Nat → (Nat → Int) → Int
  | 0, _ => 0
  | n + 1, f => sum n f + f n

theorem sum_congr {n : Nat} {f g : Nat → Int}
    (h : ∀ k, k < n → f k = g k) : sum n f = sum n g := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [sum]
    rw [ih (fun k hk => h k (Nat.lt_succ_of_lt hk)),
        h n (Nat.lt_succ_self n)]

/-- Matrix product at size `n`. -/
def mul (n : Nat) (A B : Mat) : Mat :=
  fun i j => sum n (fun k => A i k * B k j)

/-- The transpose. -/
def transpose (A : Mat) : Mat := fun i j => A j i

/-- Θ² = id. -/
theorem transpose_involutive (A : Mat) :
    transpose (transpose A) = A := rfl

/-- Θ(AB) = Θ(B) Θ(A). -/
theorem transpose_antimult (n : Nat) (A B : Mat) :
    transpose (mul n A B) = mul n (transpose B) (transpose A) := by
  funext i j
  show sum n (fun k => A j k * B k i) = sum n (fun k => B k i * A j k)
  exact sum_congr (fun k _ => Int.mul_comm _ _)

#print axioms transpose_involutive
#print axioms transpose_antimult

end AC1
