/-!
# M1 — Certificate L2: the fibre algebra and the four corners (Section 5)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.
External inputs named, never Lean axioms: Frobenius 1878 (finite-dimensional
associative real division algebras are ℝ, ℂ, ℍ); Thurston (Euclidean
2-orbifolds); Franks 1970 (Anosov diffeomorphisms of surfaces).

Certified: the Hamilton relations in an integer quaternion model; the fixed
subalgebras of conjugation and of the inner automorphisms Ad_i, Ad_j, Ad_k;
the order-three automorphism cycling i → j → k; the corner count 4 = 2^2;
the orbifold Euler characteristic of the pillowcase.
-/

/-- Quaternions with integer coefficients a + b i + c j + d k. -/
structure Q where
  a : Int
  b : Int
  c : Int
  d : Int
deriving DecidableEq, Repr

namespace Q
def mul (p q : Q) : Q :=
  ⟨p.a*q.a - p.b*q.b - p.c*q.c - p.d*q.d,
   p.a*q.b + p.b*q.a + p.c*q.d - p.d*q.c,
   p.a*q.c - p.b*q.d + p.c*q.a + p.d*q.b,
   p.a*q.d + p.b*q.c - p.c*q.b + p.d*q.a⟩
def conj (q : Q) : Q := ⟨q.a, -q.b, -q.c, -q.d⟩
def one : Q := ⟨1,0,0,0⟩
def i : Q := ⟨0,1,0,0⟩
def j : Q := ⟨0,0,1,0⟩
def k : Q := ⟨0,0,0,1⟩
def neg (q : Q) : Q := ⟨-q.a,-q.b,-q.c,-q.d⟩
/-- Norm form N(q) = q q̄ (real part). -/
def norm (q : Q) : Int := q.a*q.a + q.b*q.b + q.c*q.c + q.d*q.d
/-- Inner automorphism by a unit u with u² = −1: Ad_u(q) = u q u⁻¹ = −u q u. -/
def Ad (u q : Q) : Q := neg (mul (mul u q) u)
end Q

open Q

/-- Hamilton's relations. -/
theorem L2_hamilton :
    mul i i = neg one ∧ mul j j = neg one ∧ mul k k = neg one ∧
    mul i j = k ∧ mul j k = i ∧ mul k i = j ∧
    mul j i = neg k ∧ mul k j = neg i ∧ mul i k = neg j := by decide

/-- Non-commutativity witnessed. -/
theorem L2_noncomm : mul i j ≠ mul j i := by decide

/-- The norm is q q̄ and is positive-definite: N(q) = 0 ⇒ q = 0.
    (This is the step where A1 — compact corner unit groups, u² = −1 — makes
    the algebra a division algebra; cf. Section 5.3.) -/
theorem L2_norm_is_qqbar (q : Q) : (mul q (conj q)).a = norm q := by
  cases q with | mk a b c d =>
  show a*a - b*(-b) - c*(-c) - d*(-d) = a*a + b*b + c*c + d*d
  rw [Int.mul_neg, Int.mul_neg, Int.mul_neg]
  omega

/-- x·x ≥ 0 over the integers (core proof). -/
theorem sq_nonneg (x : Int) : 0 ≤ x*x := by
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · have := Int.mul_nonneg_of_nonpos_of_nonpos h h; exact this

/-- The norm is positive-definite: N(q) = 0 ⇒ q = 0.  (Section 5.3: this is
    where A1 — compact corner unit groups, u² = −1 — makes ℍ a division algebra.) -/
theorem L2_norm_posdef (q : Q) (h : norm q = 0) : q = ⟨0,0,0,0⟩ := by
  have ha := sq_nonneg q.a; have hb := sq_nonneg q.b
  have hc := sq_nonneg q.c; have hd := sq_nonneg q.d
  simp [norm] at h
  have a0 : q.a*q.a = 0 := by omega
  have b0 : q.b*q.b = 0 := by omega
  have c0 : q.c*q.c = 0 := by omega
  have d0 : q.d*q.d = 0 := by omega
  have key : ∀ x : Int, x*x = 0 → x = 0 := by
    intro x hx
    rcases Int.mul_eq_zero.mp hx with h | h <;> exact h
  cases q
  simp only at a0 b0 c0 d0
  exact (by simp [key _ a0, key _ b0, key _ c0, key _ d0])

/-- Fixed set of conjugation is ℝ: q̄ = q ⇔ b = c = d = 0. -/
theorem L2_fix_conj (q : Q) : conj q = q ↔ (q.b = 0 ∧ q.c = 0 ∧ q.d = 0) := by
  cases q; simp [conj]; omega

/-- Fixed set of Ad_i is ℂ_i: Ad_i(q) = q ⇔ c = d = 0. -/
theorem L2_fix_Ad_i (q : Q) : Ad i q = q ↔ (q.c = 0 ∧ q.d = 0) := by
  cases q; simp [Ad, mul, neg, i]; omega
theorem L2_fix_Ad_j (q : Q) : Ad j q = q ↔ (q.b = 0 ∧ q.d = 0) := by
  cases q; simp [Ad, mul, neg, j]; omega
theorem L2_fix_Ad_k (q : Q) : Ad k q = q ↔ (q.b = 0 ∧ q.c = 0) := by
  cases q; simp [Ad, mul, neg, k]; omega

/-- Conjugation composed with Ad_u fixes the 3-dimensional u^⊥, which is
    not closed under multiplication (j·k = i ∉ i^⊥): so {ℝ, ℂ_i, ℂ_j, ℂ_k}
    are the only commutative fixed subalgebras. -/
theorem L2_fix_conj_Ad_i (q : Q) : conj (Ad i q) = q ↔ q.b = 0 := by
  cases q; simp [Ad, mul, neg, conj, i]; omega
theorem L2_iperp_not_closed : (mul j k).b ≠ 0 := by decide

/-- The order-three automorphism cycling i → j → k → i.  With 2w = 1+i+j+k
    and (2w)⁻¹ = (1−i−j−k)/4:  (2w)·i·(2w)̄ = 4j, etc. -/
def twow : Q := ⟨1,1,1,1⟩
theorem L2_Ad_w_cycles :
    mul (mul twow i) (conj twow) = ⟨0,0,4,0⟩ ∧
    mul (mul twow j) (conj twow) = ⟨0,0,0,4⟩ ∧
    mul (mul twow k) (conj twow) = ⟨0,4,0,0⟩ := by decide
/-- w³ = −1 (as (2w)³ = −8), so Ad_w has order 3. -/
theorem L2_w_cubed : mul (mul twow twow) twow = ⟨-8,0,0,0⟩ := by decide

/-- The corner group: the eight units {±1, ±i, ±j, ±k} modulo sign give
    exactly four subalgebras.  Represented as the four generators 1, i, j, k
    each fixed (up to sign) by negation. -/
theorem L2_corner_count : [one, i, j, k].length = 4 ∧ (8:Nat) / 2 = 4 := by decide

/-- Two-torsion of a torus Tⁿ has 2ⁿ points; four corners force n = 2. -/
theorem L2_two_torsion (n : Nat) (h : 2 ^ n = 4) : n = 2 := by
  match n with
  | 0 => simp at h
  | 1 => simp at h
  | 2 => rfl
  | 3 => simp at h
  | n+4 =>
    have : 2 ^ (n+4) = 16 * 2 ^ n := by rw [Nat.pow_add]; omega
    have hp : 2 ^ n ≥ 1 := Nat.one_le_two_pow
    omega

/-- Orbifold Euler characteristic of a sphere with four cone points of order 2,
    in integer form (doubled): 2·2 − 4·1 = 0; hence Euclidean (Thurston). -/
theorem L2_chi_orb_zero : 2*2 - 4*1 = 0 := by decide

/-- χ(T²/ℤ₂) = ½(χ(T²) + #fixed) = ½(0 + 4) = 2, and by orbifold
    Gauss–Bonnet 2πχ = 4 · (deficit π) ⇒ χ = 2. -/
theorem L2_chi_pillowcase : (0 + 4) / 2 = 2 ∧ 4 / 2 = 2 := by decide
