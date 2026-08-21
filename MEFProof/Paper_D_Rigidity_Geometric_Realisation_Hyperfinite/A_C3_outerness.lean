/-
  A_C3_outerness.lean  —  Paper A certificate C3.
  Statement certified (Paper A, Proposition on outerness): if a map
  θ(z) = u z v with u v = v u = 1 is anti-multiplicative on M_n, then
  the algebra is commutative; M₄ is not commutative (explicit witness
  E₁₂E₂₁ ≠ E₂₁E₁₂); hence no inner map realises the transpose.
  Entries in ℤ (the argument is ring-generic).  All identities used
  (associativity, unit laws) are proved in-document from the finite
  sum calculus.  Equalities of matrices are tracked entrywise on
  indices < n via `EqOn`.
  Lean 4.29.1, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC3

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

theorem sum_zero (n : Nat) : sum n (fun _ => (0 : Int)) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [sum]; omega

theorem sum_add (n : Nat) (f g : Nat → Int) :
    sum n (fun k => f k + g k) = sum n f + sum n g := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [sum]; rw [ih]; omega

theorem sum_comm (n m : Nat) (f : Nat → Nat → Int) :
    sum n (fun i => sum m (fun j => f i j))
      = sum m (fun j => sum n (fun i => f i j)) := by
  induction n with
  | zero =>
    exact (sum_zero m).symm
  | succ n ih =>
    simp only [sum]
    rw [ih, ← sum_add]

theorem sum_mul (n : Nat) (f : Nat → Int) (c : Int) :
    (sum n f) * c = sum n (fun k => f k * c) := by
  induction n with
  | zero => simp only [sum]; exact Int.zero_mul c
  | succ n ih => simp only [sum]; rw [Int.add_mul, ih]

theorem mul_sum (n : Nat) (f : Nat → Int) (c : Int) :
    c * (sum n f) = sum n (fun k => c * f k) := by
  induction n with
  | zero => simp only [sum]; exact Int.mul_zero c
  | succ n ih => simp only [sum]; rw [Int.mul_add, ih]

/-- Matrix product at size `n`. -/
def mul (n : Nat) (A B : Mat) : Mat :=
  fun i j => sum n (fun k => A i k * B k j)

/-- Identity matrix. -/
def one : Mat := fun i j => if i = j then 1 else 0

/-- Associativity (a genuine equality of functions). -/
theorem massoc (n : Nat) (A B C : Mat) :
    mul n (mul n A B) C = mul n A (mul n B C) := by
  funext i j
  show sum n (fun k => (sum n (fun l => A i l * B l k)) * C k j)
      = sum n (fun l => A i l * sum n (fun k => B l k * C k j))
  calc sum n (fun k => (sum n (fun l => A i l * B l k)) * C k j)
      = sum n (fun k => sum n (fun l => A i l * B l k * C k j)) :=
        sum_congr (fun k _ => sum_mul n _ (C k j))
    _ = sum n (fun l => sum n (fun k => A i l * B l k * C k j)) :=
        sum_comm n n _
    _ = sum n (fun l => A i l * sum n (fun k => B l k * C k j)) :=
        sum_congr (fun l _ =>
          (sum_congr (fun k _ => Int.mul_assoc _ _ _)).trans
            (mul_sum n _ (A i l)).symm)

theorem sum_delta_right {n j : Nat} (g : Nat → Int) (hj : j < n) :
    sum n (fun k => g k * (if k = j then 1 else 0)) = g j := by
  induction n with
  | zero => omega
  | succ n ih =>
    simp only [sum]
    by_cases hjn : j = n
    · subst hjn
      have hz : sum j (fun k => g k * (if k = j then 1 else 0)) = 0 := by
        rw [sum_congr (g := fun _ => 0)
          (fun k hk => by rw [if_neg (by omega)]; exact Int.mul_zero _)]
        exact sum_zero j
      rw [hz, if_pos rfl, Int.mul_one, Int.zero_add]
    · rw [if_neg (fun h => hjn h.symm), Int.mul_zero, Int.add_zero]
      exact ih (by omega)

theorem sum_delta_left {n i : Nat} (g : Nat → Int) (hi : i < n) :
    sum n (fun k => (if i = k then 1 else 0) * g k) = g i := by
  induction n with
  | zero => omega
  | succ n ih =>
    simp only [sum]
    by_cases hin : i = n
    · subst hin
      have hz : sum i (fun k => (if i = k then 1 else 0) * g k) = 0 := by
        rw [sum_congr (g := fun _ => 0)
          (fun k hk => by rw [if_neg (by omega)]; exact Int.zero_mul _)]
        exact sum_zero i
      rw [hz, if_pos rfl, Int.one_mul, Int.zero_add]
    · rw [if_neg hin, Int.zero_mul, Int.add_zero]
      exact ih (by omega)

/-- Agreement of matrices on the block of indices `< n`. -/
def EqOn (n : Nat) (M N : Mat) : Prop :=
  ∀ k l, k < n → l < n → M k l = N k l

theorem eqOn_refl (n : Nat) (M : Mat) : EqOn n M M := fun _ _ _ _ => rfl

theorem eqOn_symm {n : Nat} {M N : Mat} (h : EqOn n M N) : EqOn n N M :=
  fun k l hk hl => (h k l hk hl).symm

theorem eqOn_trans {n : Nat} {M N P : Mat}
    (h1 : EqOn n M N) (h2 : EqOn n N P) : EqOn n M P :=
  fun k l hk hl => (h1 k l hk hl).trans (h2 k l hk hl)

theorem eqOn_of_eq {n : Nat} {M N : Mat} (h : M = N) : EqOn n M N := by
  subst h; exact eqOn_refl n M

theorem eqOn_mul_left {n : Nat} {M N : Mat} (X : Mat) (h : EqOn n M N) :
    EqOn n (mul n M X) (mul n N X) := fun k _ hk _ =>
  sum_congr (fun t ht => by rw [h k t hk ht])

theorem eqOn_mul_right {n : Nat} {M N : Mat} (X : Mat) (h : EqOn n M N) :
    EqOn n (mul n X M) (mul n X N) := fun _ l _ hl =>
  sum_congr (fun t ht => by rw [h t l ht hl])

theorem eqOn_mul_one (n : Nat) (A : Mat) : EqOn n (mul n A one) A :=
  fun k _ _ hl => sum_delta_right (fun t => A k t) hl

theorem eqOn_one_mul (n : Nat) (A : Mat) : EqOn n (mul n one A) A :=
  fun _ l hk _ => sum_delta_left (fun t => A t l) hk

/-- If u z v is anti-multiplicative with u v ≡ v u ≡ 1 on the block,
    then the block commutes. -/
theorem intertwined_antimult_forces_comm
    (n : Nat) (u v x y : Mat)
    (_huv : EqOn n (mul n u v) one)
    (hvu : EqOn n (mul n v u) one)
    (hanti : EqOn n (mul n u (mul n (mul n x y) v))
                    (mul n (mul n u (mul n y v)) (mul n u (mul n x v)))) :
    EqOn n (mul n x y) (mul n y x) := by
  -- Claim 1: θ(y)θ(x) agrees with θ(yx) on the block.
  have claim1 : EqOn n (mul n (mul n u (mul n y v)) (mul n u (mul n x v)))
                       (mul n u (mul n (mul n y x) v)) := by
    have e1 : mul n (mul n u (mul n y v)) (mul n u (mul n x v))
        = mul n u (mul n (mul n (mul n y v) u) (mul n x v)) := by
      rw [massoc n u (mul n y v) (mul n u (mul n x v)),
          ← massoc n (mul n y v) u (mul n x v)]
    have e2 : mul n (mul n y v) u = mul n y (mul n v u) := massoc n y v u
    -- y (v u) ≡ y on the block
    have h3 : EqOn n (mul n y (mul n v u)) y :=
      eqOn_trans (eqOn_mul_right y hvu) (eqOn_mul_one n y)
    have h4 : EqOn n (mul n (mul n y v) u) y := by
      rw [e2]; exact h3
    have h5 : EqOn n (mul n (mul n (mul n y v) u) (mul n x v))
                     (mul n y (mul n x v)) := eqOn_mul_left _ h4
    have h6 : EqOn n (mul n u (mul n (mul n (mul n y v) u) (mul n x v)))
                     (mul n u (mul n y (mul n x v))) := eqOn_mul_right _ h5
    rw [e1]
    refine eqOn_trans h6 (eqOn_of_eq ?_)
    rw [← massoc n y x v]
  -- Claim 2: v θ(z) u agrees with z on the block, for any z.
  have claim2 : ∀ z : Mat,
      EqOn n (mul n v (mul n (mul n u (mul n z v)) u)) z := by
    intro z
    have e1 : mul n v (mul n (mul n u (mul n z v)) u)
        = mul n (mul n v u) (mul n (mul n z v) u) := by
      rw [massoc n u (mul n z v) u,
          ← massoc n v u (mul n (mul n z v) u)]
    have h2 : EqOn n (mul n (mul n v u) (mul n (mul n z v) u))
                     (mul n (mul n z v) u) :=
      eqOn_trans (eqOn_mul_left _ hvu) (eqOn_one_mul n _)
    have e3 : mul n (mul n z v) u = mul n z (mul n v u) := massoc n z v u
    have h4 : EqOn n (mul n z (mul n v u)) z :=
      eqOn_trans (eqOn_mul_right z hvu) (eqOn_mul_one n z)
    rw [e1]
    refine eqOn_trans h2 ?_
    rw [e3]
    exact h4
  -- Assemble:  xy ≡ v θ(xy) u ≡ v (θy θx) u ≡ v θ(yx) u ≡ yx.
  have s1 : EqOn n (mul n x y)
      (mul n v (mul n (mul n u (mul n (mul n x y) v)) u)) :=
    eqOn_symm (claim2 (mul n x y))
  have s2 : EqOn n (mul n v (mul n (mul n u (mul n (mul n x y) v)) u))
      (mul n v (mul n (mul n u (mul n (mul n y x) v)) u)) := by
    have hmid : EqOn n (mul n u (mul n (mul n x y) v))
                       (mul n u (mul n (mul n y x) v)) :=
      eqOn_trans hanti claim1
    exact eqOn_mul_right v (eqOn_mul_left u hmid)
  exact eqOn_trans (eqOn_trans s1 s2) (claim2 (mul n y x))

/-- Matrix units E₁₂ and E₂₁ (indices 0-based: E₀₁ and E₁₀). -/
def E12 : Mat := fun i j => if i = 0 ∧ j = 1 then 1 else 0
def E21 : Mat := fun i j => if i = 1 ∧ j = 0 then 1 else 0

/-- M₄ is not commutative:  (E₁₂E₂₁)₀₀ = 1 ≠ 0 = (E₂₁E₁₂)₀₀. -/
theorem noncomm : mul 4 E12 E21 0 0 ≠ mul 4 E21 E12 0 0 := by decide

/-- Certificate: no intertwined anti-multiplicative map exists on M₄;
    in particular the transpose anti-automorphism is not inner. -/
theorem no_inner_antiautomorphism :
    ¬ ∃ u v : Mat,
        EqOn 4 (mul 4 u v) one ∧ EqOn 4 (mul 4 v u) one ∧
        ∀ x y : Mat,
          EqOn 4 (mul 4 u (mul 4 (mul 4 x y) v))
                 (mul 4 (mul 4 u (mul 4 y v)) (mul 4 u (mul 4 x v))) := by
  intro ⟨u, v, h1, h2, h3⟩
  have hcomm := intertwined_antimult_forces_comm 4 u v E12 E21 h1 h2
    (h3 E12 E21)
  exact noncomm (hcomm 0 0 (by omega) (by omega))

#print axioms intertwined_antimult_forces_comm
#print axioms no_inner_antiautomorphism

end AC3
