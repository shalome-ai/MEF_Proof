/-
  A_C2_trace_compatibility.lean  —  Paper A certificate C2.
  Statement certified:  Tr(A ⊗ I₄) = 4 · Tr(A),
  the identity from which the tower trace-compatibility
  τ_{n+1} ∘ ι_n = τ_n follows (normalisation: τ_n = 4^{-n} Tr).
  Kronecker index pairs (i, a), a < 4, are encoded as p = 4*i + a,
  so p / 4 = i and p % 4 = a.
  Lean 4.15.0, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC2

def Mat := Nat → Nat → Int

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

/-- Unnormalised trace at size `n`. -/
def trace (n : Nat) (A : Mat) : Int := sum n (fun i => A i i)

/-- `A ⊗ I₄` on paired indices `4*i + a`. -/
def kronId4 (A : Mat) : Mat :=
  fun p q => A (p / 4) (q / 4) * (if p % 4 = q % 4 then 1 else 0)

/-- Blocks of four collapse: `Σ_{p < 4n} f (p/4) = 4 · Σ_{i < n} f i`. -/
theorem sum_quarter (f : Nat → Int) (n : Nat) :
    sum (4 * n) (fun p => f (p / 4)) = 4 * sum n f := by
  induction n with
  | zero => simp [sum]
  | succ n ih =>
    have h4 : 4 * (n + 1) = 4 * n + 3 + 1 := by omega
    rw [h4]
    show sum (4 * n + 3) (fun p => f (p / 4)) + f ((4 * n + 3) / 4)
        = 4 * sum (n + 1) f
    have h3 : 4 * n + 3 = 4 * n + 2 + 1 := by omega
    rw [h3]
    show sum (4 * n + 2) (fun p => f (p / 4)) + f ((4 * n + 2) / 4)
        + f ((4 * n + 2 + 1) / 4) = 4 * sum (n + 1) f
    have h2 : 4 * n + 2 = 4 * n + 1 + 1 := by omega
    rw [h2]
    show sum (4 * n + 1) (fun p => f (p / 4)) + f ((4 * n + 1) / 4)
        + f ((4 * n + 1 + 1) / 4) + f ((4 * n + 1 + 1 + 1) / 4)
        = 4 * sum (n + 1) f
    have h1 : 4 * n + 1 = 4 * n + 1 := rfl
    show sum (4 * n) (fun p => f (p / 4)) + f ((4 * n) / 4)
        + f ((4 * n + 1) / 4) + f ((4 * n + 2) / 4) + f ((4 * n + 3) / 4)
        = 4 * sum (n + 1) f
    have d0 : (4 * n) / 4 = n := by omega
    have d1 : (4 * n + 1) / 4 = n := by omega
    have d2 : (4 * n + 2) / 4 = n := by omega
    have d3 : (4 * n + 3) / 4 = n := by omega
    rw [d0, d1, d2, d3, ih]
    show 4 * sum n f + f n + f n + f n + f n = 4 * (sum n f + f n)
    omega

/-- Certificate:  Tr(A ⊗ I₄) = 4 · Tr(A). -/
theorem trace_kron_id4 (A : Mat) (n : Nat) :
    trace (4 * n) (kronId4 A) = 4 * trace n A := by
  unfold trace kronId4
  have h : ∀ p, p < 4 * n →
      A (p / 4) (p / 4) * (if p % 4 = p % 4 then 1 else 0)
        = (fun q => A (q / 4) (q / 4)) p := by
    intro p _
    simp
  rw [sum_congr h]
  exact sum_quarter (fun i => A i i) n

#print axioms trace_kron_id4

end AC2
