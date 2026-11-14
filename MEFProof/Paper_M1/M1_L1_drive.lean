/-!
# M1 — Certificate L1: the drive (Section 4)

Paper M1, "Six axioms and their minimal geometry".  Core toolchain,
Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.

External inputs named here and never used as Lean axioms:
Katok–Hasselblatt (hyperbolicity ⇔ |tr| > 2 for SL(2,Z));
Gauss / Latimer–MacDuffee–Taussky (SL(2,Z) classes of trace t ↔ narrow
classes of binary quadratic forms of discriminant t² − 4).

What is certified: the arithmetic skeleton those theorems consume.
-/

/-- Integer 2×2 matrices. -/
structure M2 where
  a : Int
  b : Int
  c : Int
  d : Int
deriving DecidableEq, Repr

namespace M2
def mul (X Y : M2) : M2 :=
  ⟨X.a*Y.a + X.b*Y.c, X.a*Y.b + X.b*Y.d, X.c*Y.a + X.d*Y.c, X.c*Y.b + X.d*Y.d⟩
def det (X : M2) : Int := X.a*X.d - X.b*X.c
def tr  (X : M2) : Int := X.a + X.d
def I : M2 := ⟨1,0,0,1⟩
/-- The cat map M₀ = ((2,1),(1,1)). -/
def M0 : M2 := ⟨2,1,1,1⟩
/-- Its inverse ((1,−1),(−1,2)). -/
def M0inv : M2 := ⟨1,-1,-1,2⟩
/-- The quarter-turn S = ((0,1),(−1,0)), S⁻¹ = ((0,−1),(1,0)). -/
def S : M2 := ⟨0,1,-1,0⟩
def Sinv : M2 := ⟨0,-1,1,0⟩
end M2

open M2

/-- M₀ ∈ SL(2,Z) with trace 3. -/
theorem L1_M0_in_SL2 : det M0 = 1 ∧ tr M0 = 3 := by decide

/-- Smallest case by hand: S M₀ S⁻¹ = M₀⁻¹, so the two 3-cycle orientations
    are one conjugacy class. -/
theorem L1_conj_M0_inv : mul (mul S M0) Sinv = M0inv := by decide
theorem L1_M0_M0inv : mul M0 M0inv = I := by decide

/-- Trace 2 is not hyperbolic; the least hyperbolic positive trace is 3:
    t·t > 4 with t > 0 forces t ≥ 3. -/
theorem L1_trace3_min (t : Int) (h : t * t > 4) (hp : t > 0) : t ≥ 3 := by
  rcases (show t = 1 ∨ t = 2 ∨ t ≥ 3 by omega) with h1 | h1 | h1
  · subst h1; omega
  · subst h1; omega
  · exact h1

/-- Discriminant of the trace-3 characteristic polynomial. -/
theorem L1_disc5 : 3 * 3 - 4 = 5 := by decide

/-- Helper: squares grow. -/
theorem sq_ge_of_ge (x k : Int) (hk : 0 ≤ k) (h : k ≤ x) : k*k ≤ x*x :=
  Int.mul_le_mul h h hk (by omega)

/-- m ≥ 0 and (m−1)² < 5 force m ≤ 3. -/
theorem m_le_three (m : Int) (_hm : 0 ≤ m) (h : (m-1)*(m-1) < 5) : m ≤ 3 := by
  rcases (show m ≤ 3 ∨ m ≥ 4 by omega) with h1 | h1
  · exact h1
  · exfalso; have := sq_ge_of_ge (m-1) 3 (by omega) (by omega); omega

/-- (m+1)² > 5 with m ≥ 0 forces m ≥ 2. -/
theorem m_ge_two (m : Int) (hm : 0 ≤ m) (h : (m+1)*(m+1) > 5) : m ≥ 2 := by
  rcases (show m = 0 ∨ m = 1 ∨ m ≥ 2 by omega) with h1 | h1 | h1
  · subst h1; omega
  · subst h1; omega
  · exact h1

/-- Reduced forms of discriminant 5 (Gauss reduction, integer form).  Write
    m = 2·|a|.  (a,b,c) with b² − 4ac = 5, 0 < b, b² < 5, (m+b)² > 5 and
    (m−b)² < 5 forces (a,b,c) ∈ {(1,1,−1), (−1,1,1)}: one reduced cycle,
    hence one class.  This is the hand content of the uniqueness theorem. -/
theorem L1_reduced_disc5 (a b c : Int)
    (hD : b*b - 4*(a*c) = 5) (hb0 : 0 < b) (hb5 : b*b < 5)
    (hlo : (2*(a.natAbs:Int) + b)*(2*(a.natAbs:Int) + b) > 5)
    (hhi : (2*(a.natAbs:Int) - b)*(2*(a.natAbs:Int) - b) < 5) :
    (a = 1 ∧ b = 1 ∧ c = -1) ∨ (a = -1 ∧ b = 1 ∧ c = 1) := by
  have hb : b = 1 ∨ b = 2 := by
    rcases (show b = 1 ∨ b = 2 ∨ b ≥ 3 by omega) with h | h | h
    · exact Or.inl h
    · exact Or.inr h
    · exfalso; have := sq_ge_of_ge b 3 (by omega) h; omega
  rcases hb with hb | hb
  · subst hb
    have h3 := m_le_three (2*(a.natAbs:Int)) (by omega) hhi
    have h2 := m_ge_two (2*(a.natAbs:Int)) (by omega) hlo
    have hA : (a.natAbs:Int) = 1 := by omega
    have hac : a*c = -1 := by omega
    rcases Int.natAbs_eq a with ha | ha
    · rw [hA] at ha; subst ha; left; refine ⟨rfl, rfl, ?_⟩; omega
    · rw [hA] at ha; subst ha; right; refine ⟨rfl, rfl, ?_⟩; omega
  · subst hb; exfalso; omega

/-- The two reduced forms are one Gauss cycle: ρ(1,1,−1) = (−1,1,1) and
    ρ(−1,1,1) = (1,1,−1), where ρ(a,b,c) = (c, b', (b'²−5)/(4c)) with
    b' ≡ −b (mod 2c) chosen reduced.  Checked by evaluation. -/
theorem L1_cycle_disc5 :
    ((1:Int)*(1:Int) - 5) / (4*(-1)) = (1:Int) ∧ ((1:Int)*(1:Int) - 5) / (4*1) = (-1:Int) := by decide

/-! ### Odd trace ⇔ order three mod 2 (the corner 3-cycle) -/

/-- 2×2 matrices over F₂ = Fin 2. -/
structure F2M where
  a : Fin 2
  b : Fin 2
  c : Fin 2
  d : Fin 2
deriving DecidableEq, Repr

namespace F2M
def mul (X Y : F2M) : F2M :=
  ⟨X.a*Y.a + X.b*Y.c, X.a*Y.b + X.b*Y.d, X.c*Y.a + X.d*Y.c, X.c*Y.b + X.d*Y.d⟩
def I : F2M := ⟨1,0,0,1⟩
def det (X : F2M) : Fin 2 := X.a*X.d - X.b*X.c
def tr  (X : F2M) : Fin 2 := X.a + X.d
def all : List F2M := Id.run do
  let mut l : List F2M := []
  for a in [0,1] do
    for b in [0,1] do
      for c in [0,1] do
        for d in [0,1] do
          l := l ++ [⟨a,b,c,d⟩]
  return l
end F2M

open F2M in
/-- For every M ∈ SL(2,F₂): M³ = I with M ≠ I  ⇔  tr M = 1 (odd trace).
    Hence the drive 3-cycles the three non-trivial corners iff its trace is odd;
    trace 3 qualifies, every even trace does not.  Finite check over GL(2,F₂). -/
theorem L1_odd_trace_iff_order_three :
    ∀ X ∈ F2M.all, F2M.det X = 1 →
      ((F2M.mul (F2M.mul X X) X = F2M.I ∧ X ≠ F2M.I) ↔ F2M.tr X = 1) := by decide

/-- The cat map reduced mod 2 is ((0,1),(1,1)), of order 3. -/
theorem L1_M0_mod2_order3 :
    F2M.mul (F2M.mul ⟨0,1,1,1⟩ ⟨0,1,1,1⟩) ⟨0,1,1,1⟩ = F2M.I ∧ (⟨0,1,1,1⟩ : F2M) ≠ F2M.I := by decide

/-! ### The drive is the square of the Fibonacci matrix -/

/-- The Fibonacci matrix F = ((1,1),(1,0)): F·(F_n, F_{n−1}) = (F_{n+1}, F_n). -/
def Fib : M2 := ⟨1,1,1,0⟩

/-- M₀ = F², so the least drive is two Fibonacci steps, and its eigenvalue
    φ² is the square of the Fibonacci growth rate. -/
theorem L1_M0_is_Fib_squared : M2.mul Fib Fib = M0 := by decide

/-- Powers of F carry the Fibonacci numbers: F^n = ((F_{n+1}, F_n), (F_n, F_{n−1})),
    checked for n = 2..6 (F² = M₀, F³, F⁴, F⁵, F⁶). -/
theorem L1_Fib_powers :
    M2.mul Fib Fib = ⟨2,1,1,1⟩ ∧
    M2.mul (M2.mul Fib Fib) Fib = ⟨3,2,2,1⟩ ∧
    M2.mul (M2.mul (M2.mul Fib Fib) Fib) Fib = ⟨5,3,3,2⟩ ∧
    M2.mul (M2.mul (M2.mul (M2.mul Fib Fib) Fib) Fib) Fib = ⟨8,5,5,3⟩ ∧
    M2.mul (M2.mul (M2.mul (M2.mul (M2.mul Fib Fib) Fib) Fib) Fib) Fib = ⟨13,8,8,5⟩ := by decide

/-- Fibonacci recursion in the entries: the (1,1) entry of Fⁿ⁺¹ is the sum of the
    (1,1) and (1,2) entries of Fⁿ. -/
theorem L1_Fib_recursion (X : M2) : (M2.mul X Fib).a = X.a + X.b := by
  simp only [M2.mul, Fib, Int.mul_one, Int.mul_zero, Int.add_zero]

/-- tr F = 1, det F = −1: F itself is not in SL(2,Z); its square is the least
    element of SL(2,Z) with trace > 2. -/
theorem L1_Fib_not_SL2 : M2.det Fib = -1 ∧ M2.tr Fib = 1 ∧ M2.det (M2.mul Fib Fib) = 1 ∧ M2.tr (M2.mul Fib Fib) = 3 := by decide

/-- The drive returns exactly one point of the torus to itself: det(M₀ − I) = −1,
so M₀ − I is invertible over ℤ and M₀x ≡ x (mod ℤ²) forces x ≡ 0. Added for
M1 v3 (the place we see from, Definition "shadow, formal"). -/
theorem L1_one_fixed_point : M2.det ⟨2 - 1, 1, 1, 1 - 1⟩ = -1 := by decide
