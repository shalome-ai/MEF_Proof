/-
  A_C7_graded_product.lean  —  Paper A certificate C7.
  Statements certified, on integer quaternions a + bi + cj + dk with the
  full multiplication (Paper A §4, eigenspace decomposition and product
  rule):
    (1) conjugation fixes exactly the elements with vanishing imaginary
        part, and negates exactly the purely imaginary elements — the two
        eigenspaces                                     [conj_fixed_iff,
                                                         conj_neg_iff]
    (2) the multiplication table of the grading:
        even·even ⊆ even, even·odd ⊆ odd, odd·even ⊆ odd [even_mul_even,
                                                         even_mul_odd,
                                                         odd_mul_even]
    (3) the even (Θ-fixed) component of a product of two imaginary
        quaternions p, q is −⟨p, q⟩ = −(p₁q₁ + p₂q₂ + p₃q₃), and the odd
        component is the half-commutator, doubled here to stay in integer
        coefficients: 2·Im(pq) = pq − qp              [odd_mul_odd_even,
                                                         odd_mul_odd_comm]
    (4) sanity for the model: i² = j² = k² = −1, ij = k, ji = −k
                                                        [table checks].
  Lean 4.15.0, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC7

/-- Integer quaternions. -/
structure Quat where
  a : Int
  b : Int
  c : Int
  d : Int
deriving DecidableEq

/-- Quaternion multiplication. -/
def qmul (x y : Quat) : Quat :=
  ⟨ x.a * y.a - x.b * y.b - x.c * y.c - x.d * y.d
  , x.a * y.b + x.b * y.a + x.c * y.d - x.d * y.c
  , x.a * y.c - x.b * y.d + x.c * y.a + x.d * y.b
  , x.a * y.d + x.b * y.c - x.c * y.b + x.d * y.a ⟩

/-- Conjugation, addition, subtraction. -/
def conj (x : Quat) : Quat := ⟨x.a, -x.b, -x.c, -x.d⟩
def add (x y : Quat) : Quat := ⟨x.a + y.a, x.b + y.b, x.c + y.c, x.d + y.d⟩
def sub (x y : Quat) : Quat := ⟨x.a - y.a, x.b - y.b, x.c - y.c, x.d - y.d⟩

def one : Quat := ⟨1, 0, 0, 0⟩
def qi  : Quat := ⟨0, 1, 0, 0⟩
def qj  : Quat := ⟨0, 0, 1, 0⟩
def qk  : Quat := ⟨0, 0, 0, 1⟩

/-- (4)  The multiplication table of the model. -/
theorem model_ii : qmul qi qi = ⟨-1, 0, 0, 0⟩ := rfl
theorem model_jj : qmul qj qj = ⟨-1, 0, 0, 0⟩ := rfl
theorem model_kk : qmul qk qk = ⟨-1, 0, 0, 0⟩ := rfl
theorem model_ij : qmul qi qj = qk := rfl
theorem model_ji : qmul qj qi = ⟨0, 0, 0, -1⟩ := rfl
theorem model_jk : qmul qj qk = qi := rfl
theorem model_ki : qmul qk qi = qj := rfl

/-- (1)  Conjugation fixes exactly the even part (imaginary part zero). -/
theorem conj_fixed_iff (x : Quat) :
    conj x = x ↔ (x.b = 0 ∧ x.c = 0 ∧ x.d = 0) := by
  cases x; simp [conj, Quat.mk.injEq]; omega

/-- (1)  Conjugation negates exactly the odd part (real part zero). -/
theorem conj_neg_iff (x : Quat) :
    conj x = ⟨-x.a, -x.b, -x.c, -x.d⟩ ↔ x.a = 0 := by
  cases x; simp [conj, Quat.mk.injEq]; omega

/-- (2)  even · even ⊆ even. -/
theorem even_mul_even (s t : Int) :
    qmul ⟨s, 0, 0, 0⟩ ⟨t, 0, 0, 0⟩ = ⟨s * t, 0, 0, 0⟩ := by
  simp [qmul]

/-- (2)  even · odd ⊆ odd. -/
theorem even_mul_odd (s q₁ q₂ q₃ : Int) :
    qmul ⟨s, 0, 0, 0⟩ ⟨0, q₁, q₂, q₃⟩ = ⟨0, s * q₁, s * q₂, s * q₃⟩ := by
  simp [qmul]

/-- (2)  odd · even ⊆ odd. -/
theorem odd_mul_even (s q₁ q₂ q₃ : Int) :
    qmul ⟨0, q₁, q₂, q₃⟩ ⟨s, 0, 0, 0⟩ = ⟨0, q₁ * s, q₂ * s, q₃ * s⟩ := by
  simp [qmul]

/-- (3)  The even component of a product of two imaginary quaternions is
    −⟨p, q⟩. -/
theorem odd_mul_odd_even (p₁ p₂ p₃ q₁ q₂ q₃ : Int) :
    (qmul ⟨0, p₁, p₂, p₃⟩ ⟨0, q₁, q₂, q₃⟩).a
      = -(p₁ * q₁ + p₂ * q₂ + p₃ * q₃) := by
  simp [qmul]; omega

/-- (3)  The full product of two imaginary quaternions: even component
    −⟨p, q⟩, odd component the antisymmetric part. -/
theorem odd_mul_odd (p₁ p₂ p₃ q₁ q₂ q₃ : Int) :
    qmul ⟨0, p₁, p₂, p₃⟩ ⟨0, q₁, q₂, q₃⟩
      = ⟨ -(p₁ * q₁ + p₂ * q₂ + p₃ * q₃)
        , p₂ * q₃ - p₃ * q₂
        , p₃ * q₁ - p₁ * q₃
        , p₁ * q₂ - p₂ * q₁ ⟩ := by
  simp [qmul, Quat.mk.injEq]; omega

/-- (3)  The odd component doubled is the commutator: 2·Im(pq) = pq − qp
    for imaginary p, q (the integer form of the half-commutator in the
    product rule of Paper A §4). -/
theorem odd_mul_odd_comm (p₁ p₂ p₃ q₁ q₂ q₃ : Int) :
    sub (qmul ⟨0, p₁, p₂, p₃⟩ ⟨0, q₁, q₂, q₃⟩)
        (qmul ⟨0, q₁, q₂, q₃⟩ ⟨0, p₁, p₂, p₃⟩)
      = ⟨ 0
        , 2 * (p₂ * q₃ - p₃ * q₂)
        , 2 * (p₃ * q₁ - p₁ * q₃)
        , 2 * (p₁ * q₂ - p₂ * q₁) ⟩ := by
  simp [qmul, sub, Quat.mk.injEq, Int.mul_comm]; omega

#print axioms conj_fixed_iff
#print axioms conj_neg_iff
#print axioms even_mul_even
#print axioms even_mul_odd
#print axioms odd_mul_even
#print axioms odd_mul_odd_even
#print axioms odd_mul_odd
#print axioms odd_mul_odd_comm

end AC7
