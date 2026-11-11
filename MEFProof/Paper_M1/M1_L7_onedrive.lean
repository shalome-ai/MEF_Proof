/-!
# M1 — Certificate L7: one drive at trace three only (Proposition 4.5)

Paper M1, "Six axioms and their minimal geometry", v6.1.  Core library only,
no Mathlib, no author axioms, zero `sorry`.  Written for Lean 4.29.1; it uses
the core tactics `omega`, `grind` and `push_cast`.

What is certified.  With A_t = ((t,-1),(1,0)) and A_t⁻¹ = ((0,1),(-1,t)):
* an integer matrix P = ((p,q),(r,s)) with P A_t = A_t⁻¹ P has r = t p + q,
  s = -p and det P = -(p² + t p q + q²);
* for t ≥ 4 the equation p² + t p q + q² = -1 has no solution in integers
  (the descent of the proof of Proposition 4.5), so that no such P has
  determinant 1;
* at t = 3 it has the solution (1,-1);
* P = ((1,0),(t,-1)) has determinant -1 and satisfies P A_t = A_t⁻¹ P for
  every t: the hypothesis on orientation is used.

What is not certified: that conjugacy classes of SL(2,Z) are the drives up to
a relabelling of the torus that keeps its orientation, and that clause (a) of
Definition 3.2 is applied to them.  Those are the text's.
-/

/-- The descent.  For t ≥ 4 there are no natural numbers x ≥ y with
x² + y² + 1 = t x y.  Induction on a bound for x + y. -/
theorem L7_descent (t : Nat) (ht : 4 ≤ t) :
    ∀ n x y : Nat, x + y ≤ n → y ≤ x → x*x + y*y + 1 = t*x*y → False := by
  intro n
  induction n with
  | zero =>
    intro x y hn hyx h
    have hx : x = 0 := by omega
    have hy : y = 0 := by omega
    subst hx; subst hy
    simp at h
  | succ n ih =>
    intro x y hn hyx h
    -- y is positive
    have hy : 1 ≤ y := by
      rcases Nat.eq_zero_or_pos y with h0 | h0
      · subst h0; simp at h
      · exact h0
    have hx : 1 ≤ x := by omega
    rcases Nat.lt_or_eq_of_le hyx with hlt | heq
    · -- x > y: pass to the second root x' = t y - x
      have hxx : x * x < x * (t * y) := by
        have : x * (t * y) = t * x * y := by grind
        omega
      have hxty : x < t * y := Nat.lt_of_mul_lt_mul_left hxx
      -- write t y = x + x'
      obtain ⟨x', hx'⟩ : ∃ x', t * y = x + x' := ⟨t * y - x, by omega⟩
      have hprod : x * x' = y * y + 1 := by
        have : t * x * y = x * (x + x') := by rw [← hx']; grind
        grind
      have hx'y : x' ≤ y := by
        rcases Nat.lt_or_ge y x' with hgt | hle
        · have h1 : (y + 1) * (y + 1) ≤ x * x' :=
            Nat.mul_le_mul (by omega) (by omega)
          have h2 : (y + 1) * (y + 1) = y * y + 2 * y + 1 := by grind
          omega
        · exact hle
      have hnew : y * y + x' * x' + 1 = t * y * x' := by
        have : t * y * x' = (x + x') * x' := by rw [← hx']
        grind
      exact ih y x' (by omega) hx'y hnew
    · -- x = y: then x² (t - 2) = 1, impossible for t ≥ 4
      subst heq
      have h4 : 4 * (y * y) ≤ t * (y * y) := Nat.mul_le_mul_right _ ht
      have h5 : t * y * y = t * (y * y) := by grind
      have h6 : 1 ≤ y * y := Nat.mul_le_mul hy hy
      omega

/-- No natural solution, in either order. -/
theorem L7_no_nat_solution (t : Nat) (ht : 4 ≤ t) (x y : Nat) :
    x*x + y*y + 1 ≠ t*x*y := by
  intro h
  rcases Nat.le_total y x with hyx | hxy
  · exact L7_descent t ht (x + y) x y (Nat.le_refl _) hyx h
  · exact L7_descent t ht (y + x) y x (Nat.le_refl _) hxy (by grind)

/-- For t ≥ 4 the equation p² + t p q + q² = -1 has no solution in integers. -/
theorem L7_no_int_solution (t : Nat) (ht : 4 ≤ t) (p q : Int) :
    p*p + (t:Int)*p*q + q*q ≠ -1 := by
  intro h
  obtain ⟨x, hx⟩ := Int.eq_nat_or_neg p
  obtain ⟨y, hy⟩ := Int.eq_nat_or_neg q
  have key : ∀ x y : Nat, (x:Int)*x + (t:Int)*x*y + y*y ≠ -1 := by
    intro x y hxy
    have : (0:Int) ≤ ((x*x + t*x*y + y*y : Nat) : Int) := Int.natCast_nonneg _
    push_cast at this
    omega
  have key2 : ∀ x y : Nat, (x:Int)*x - (t:Int)*x*y + y*y ≠ -1 := by
    intro x y hxy
    apply L7_no_nat_solution t ht x y
    have : ((x*x + y*y + 1 : Nat) : Int) = ((t*x*y : Nat) : Int) := by
      push_cast; omega
    exact_mod_cast this
  rcases hx with hx | hx <;> rcases hy with hy | hy <;> subst hx <;> subst hy
  · exact key x y h
  · exact key2 x y (by grind)
  · exact key2 x y (by grind)
  · exact key x y (by grind)

/-- Entry comparison: P A_t = A_t⁻¹ P gives r = t p + q and s = -p, and then
det P = -(p² + t p q + q²). -/
theorem L7_det_of_intertwiner (t p q r s : Int)
    (e11 : p*t + q = r) (e12 : -p = s) :
    p*s - q*r = -(p*p + t*p*q + q*q) := by
  subst e11; subst e12; grind

/-- For t ≥ 4 no integer matrix of determinant 1 conjugates A_t to its inverse. -/
theorem L7_not_conj_inverse (t : Nat) (ht : 4 ≤ t) (p q r s : Int)
    (e11 : p*t + q = r) (e12 : -p = s) : p*s - q*r ≠ 1 := by
  intro hdet
  have h := L7_det_of_intertwiner t p q r s e11 e12
  exact L7_no_int_solution t ht p q (by omega)

/-- A_t A_t⁻¹ = 1, entry by entry. -/
theorem L7_inverse (t : Int) :
    t*0 + (-1)*(-1) = 1 ∧ t*1 + (-1)*t = 0 ∧ (1:Int)*0 + 0*(-1) = 0 ∧ (1:Int)*1 + 0*t = 1 := by
  refine ⟨by omega, by omega, by omega, by omega⟩

/-- At t = 3 the equation has the solution (1,-1). -/
theorem L7_trace3_solution : (1:Int)*1 + 3*1*(-1) + (-1)*(-1) = -1 := by decide

/-- P = ((1,0),(t,-1)) has determinant -1 and satisfies P A_t = A_t⁻¹ P:
the four entries of the two products agree. -/
theorem L7_flip (t : Int) :
    (1:Int)*(-1) - 0*t = -1 ∧
    (1*t + 0*1 = 0*1 + 1*t) ∧ ((1:Int)*(-1) + 0*0 = 0*0 + 1*(-1)) ∧
    (t*t + (-1)*1 = (-1)*1 + t*t) ∧ (t*(-1) + (-1)*0 = (-1)*0 + t*(-1)) := by
  refine ⟨by omega, by omega, by omega, by omega, by omega⟩
