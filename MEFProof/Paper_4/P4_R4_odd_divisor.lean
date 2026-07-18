/-
================================================================
P4_R4_odd_divisor.lean
================================================================
Paper 4, Step 5 certificate (R4, thm:projector + prop:rules +
lem:K2c2 + prop:alternation).

PART A — the projector identity (Rule 1), proved IN GENERAL:
    dodd (2^a * m) = dodd m   for all a ≥ 0 and all m ≥ 1,
where dodd n counts the odd divisors of n.  This is the arithmetic
core of thm:projector: the 2-adic valuation is invisible to the
odd-divisor count, which is what makes the p = 2 Euler factor
collapse from (1−2^{−s})^{−2} to (1−2^{−s})^{−1}.  (The statement
certified is in fact stronger than the frozen Rule 1, which
assumes m odd; oddness of m is not needed.)

PART B — table certification for Rules 2 and 4 (bounded, kernel-
checked): perfect-square parity and the protected value
dodd n = 1 ⟺ n = 2^a, verified for all 1 ≤ n ≤ 24.  The general
proofs are the divisor-function arguments given in the paper
(prop:rules); the bounded check certifies the smallest cases.

PART C — the Kloosterman alternation characterisation
(lem:K2c2 + prop:alternation) at sign level: at c = 2 the
generalised sum is a single term
    K₂(n, −1; 2) = ν̄(γ₁,₂) · (−1)^{n−1},
modelled over ℤ with the multiplier value nubar : ℤ as a NAMED
PARAMETER (recorded nowhere in the corpus; deliberately not
asserted).  Certified: the alternation identity holds for all
n ≥ 1 iff nubar = −1; with trivial multiplier (the classical sum)
the value is −(−1)ⁿ, so the identity fails.  The reduction of the
complex exponential e^{πi(n−1)} to the sign (−1)^{n−1} is the
modelling step (the value lies in {±1}); it matches the Mathlib
certificate YM_A1_multiplier_characterisation.lean, which performs
the same computation over ℂ.

Status target: CERT — core Lean 4.15.0, no Mathlib, no axioms,
no `sorry`.
Build:  lean P4_R4_odd_divisor.lean
================================================================
-/

namespace P4R4

/-! ### Part A — the odd-divisor function and Rule 1 -/

/-- Predicate: d is an odd divisor of n (d = 0 is excluded
    automatically, since 0 % 2 = 0). -/
def isOddDvd (n d : Nat) : Bool := d % 2 == 1 && n % d == 0

/-- The odd-divisor function: the number of odd divisors of n,
    counted over the range 0, …, n. -/
def dodd (n : Nat) : Nat := (List.range (n + 1)).countP (isOddDvd n)

/-- Key divisibility lemma: an odd d divides 2x iff it divides x.
    Division-free proof: if 2x = d·k with d odd, then k must be
    even by parity (odd · odd is odd, but 2x is even), and the
    factor 2 cancels. -/
theorem odd_dvd_two_mul {d x : Nat} (hd : d % 2 = 1) :
    d ∣ 2 * x ↔ d ∣ x := by
  constructor
  · intro hdvd
    have ⟨k, hk⟩ := hdvd
    -- parity: (d·k) % 2 = 0 since d·k = 2x
    have h1 : (d * k) % 2 = 0 := by omega
    rw [Nat.mul_mod, hd] at h1
    simp at h1
    -- so k = 2j, and 2x = d·(2j) = 2·(d·j) cancels
    have ⟨j, hj⟩ : ∃ j, k = 2 * j := ⟨k / 2, by omega⟩
    rw [hj] at hk
    have hcomm : d * (2 * j) = 2 * (d * j) := by
      rw [← Nat.mul_assoc, Nat.mul_comm d 2, Nat.mul_assoc]
    rw [hcomm] at hk
    exact ⟨j, by omega⟩
  · intro hdvd
    have ⟨k, hk⟩ := hdvd
    exact ⟨2 * k, by rw [hk]; exact Nat.mul_left_comm 2 d k⟩

/-- Membership form: the odd-divisor predicate is unchanged under
    doubling of the argument. -/
theorem isOddDvd_two_mul (x d : Nat) :
    isOddDvd (2 * x) d = isOddDvd x d := by
  cases h1 : isOddDvd (2 * x) d <;> cases h2 : isOddDvd x d
  · rfl
  · -- h2 true forces h1 true: contradiction with h1 = false
    exfalso
    unfold isOddDvd at h1 h2
    rw [Bool.and_eq_true, beq_iff_eq, beq_iff_eq] at h2
    have hodd := h2.1
    have hmod := h2.2
    have hdvd : d ∣ x := Nat.dvd_iff_mod_eq_zero.mpr hmod
    have hdvd2 : d ∣ 2 * x := (odd_dvd_two_mul hodd).mpr hdvd
    have hmod2 : (2 * x) % d = 0 := Nat.dvd_iff_mod_eq_zero.mp hdvd2
    have : (d % 2 == 1 && (2 * x) % d == 0) = true := by
      rw [Bool.and_eq_true, beq_iff_eq, beq_iff_eq]
      exact ⟨hodd, hmod2⟩
    rw [this] at h1
    cases h1
  · -- h1 true forces h2 true: contradiction with h2 = false
    exfalso
    unfold isOddDvd at h1 h2
    rw [Bool.and_eq_true, beq_iff_eq, beq_iff_eq] at h1
    have hodd := h1.1
    have hmod2 := h1.2
    have hdvd2 : d ∣ 2 * x := Nat.dvd_iff_mod_eq_zero.mpr hmod2
    have hdvd : d ∣ x := (odd_dvd_two_mul hodd).mp hdvd2
    have hmod : x % d = 0 := Nat.dvd_iff_mod_eq_zero.mp hdvd
    have : (d % 2 == 1 && x % d == 0) = true := by
      rw [Bool.and_eq_true, beq_iff_eq, beq_iff_eq]
      exact ⟨hodd, hmod⟩
    rw [this] at h2
    cases h2
  · rfl

/-- countP congruence helper: pointwise equal predicates give
    equal counts. -/
theorem countP_congr {α : Type} (p q : α → Bool) (l : List α)
    (h : ∀ a, p a = q a) : l.countP p = l.countP q := by
  induction l with
  | nil => rfl
  | cons a t ih =>
    rw [List.countP_cons, List.countP_cons, h a, ih]

/-- Range-truncation helper: if the predicate is false from m
    upward, the count over range n (n ≥ m) equals the count over
    range m. -/
theorem countP_range_trunc (p : Nat → Bool) (m n : Nat)
    (hmn : m ≤ n) (hfalse : ∀ d, m ≤ d → p d = false) :
    (List.range n).countP p = (List.range m).countP p := by
  induction n with
  | zero =>
    have : m = 0 := by omega
    simp [this]
  | succ k ih =>
    by_cases hk : m ≤ k
    · rw [List.range_succ, List.countP_append, ih hk]
      simp [hfalse k hk]
    · have : m = k + 1 := by omega
      simp [this]

/-- Divisors of x ≥ 1 do not exceed x: the predicate is false
    beyond x. -/
theorem isOddDvd_false_beyond (x d : Nat) (hx : 1 ≤ x)
    (hd : x + 1 ≤ d) : isOddDvd x d = false := by
  cases h : isOddDvd x d
  · rfl
  · exfalso
    unfold isOddDvd at h
    rw [Bool.and_eq_true, beq_iff_eq, beq_iff_eq] at h
    have hmod := h.2
    have : x % d = x := Nat.mod_eq_of_lt (by omega)
    omega

/-- The doubling step: dodd (2x) = dodd x for x ≥ 1. -/
theorem dodd_two_mul (x : Nat) (hx : 1 ≤ x) :
    dodd (2 * x) = dodd x := by
  unfold dodd
  rw [countP_congr (isOddDvd (2 * x)) (isOddDvd x) _
      (isOddDvd_two_mul x)]
  exact countP_range_trunc (isOddDvd x) (x + 1) (2 * x + 1)
    (by omega) (fun d hd => isOddDvd_false_beyond x d hx hd)

/-- **Rule 1 in general** (the projector identity):
    dodd (2^a · m) = dodd m for every a ≥ 0 and every m ≥ 1. -/
theorem rule1 (a m : Nat) (hm : 1 ≤ m) :
    dodd (2 ^ a * m) = dodd m := by
  induction a with
  | zero => simp
  | succ k ih =>
    have hpos : 1 ≤ 2 ^ k * m :=
      Nat.mul_pos (Nat.two_pow_pos k) (by omega)
    have hexp : 2 ^ (k + 1) * m = 2 * (2 ^ k * m) := by
      rw [Nat.pow_succ, Nat.mul_comm (2 ^ k) 2, Nat.mul_assoc]
    rw [hexp, dodd_two_mul _ hpos, ih]

/-! ### Part B — table certification (smallest cases by hand) -/

/-- The values quoted in the paper (\S on divisor functions). -/
theorem table_values :
    dodd 1 = 1 ∧ dodd 2 = 1 ∧ dodd 3 = 2 ∧ dodd 4 = 1 ∧
    dodd 6 = 2 ∧ dodd 9 = 3 ∧ dodd 12 = 2 := by
  decide

/-- Odd part of n, by structural fuel recursion (kernel-reducible,
    so `decide` applies). -/
def oddPartAux : Nat → Nat → Nat
  | 0, n => n
  | fuel + 1, n => if n % 2 == 0 && n != 0
      then oddPartAux fuel (n / 2) else n

def oddPart (n : Nat) : Nat := oddPartAux n n

/-- Bounded perfect-square test. -/
def isSquare (n : Nat) : Bool :=
  (List.range (n + 1)).any (fun r => r * r == n)

/-- Rule 2 certified for 1 ≤ n ≤ 24: dodd n is odd iff the odd
    part of n is a perfect square. -/
theorem rule2_table :
    ((List.range 24).map (· + 1)).all
      (fun n => (dodd n % 2 == 1) == isSquare (oddPart n)) = true := by
  decide

/-- Rule 4 certified for 1 ≤ n ≤ 24: dodd n = 1 iff n is a power
    of two (equivalently, oddPart n = 1). -/
theorem rule4_table :
    ((List.range 24).map (· + 1)).all
      (fun n => (dodd n == 1) == (oddPart n == 1)) = true := by
  decide

/-! ### Part C — the Kloosterman alternation characterisation -/

/-- The c = 2 generalised sum at sign level: single term h = 1,
    h̄ = 1, exponential e^{πi(n−1)} = (−1)^{n−1}; the multiplier
    value nubar is a parameter. -/
def K2c2 (nubar : Int) (n : Nat) : Int := nubar * (-1) ^ (n - 1)

/-- Sign flip under increment: (−1)^{n+1} = −(−1)^n. -/
theorem neg_one_pow_succ (n : Nat) :
    ((-1 : Int)) ^ (n + 1) = -((-1 : Int) ^ n) := by
  rw [Int.pow_succ]
  omega

/-- **The characterisation** (prop:alternation): the alternation
    identity K₂(n, −1; 2) = (−1)ⁿ holds for all n ≥ 1 iff the
    multiplier value equals −1. -/
theorem characterisation (nubar : Int) :
    (∀ n : Nat, 1 ≤ n → K2c2 nubar n = (-1) ^ n) ↔ nubar = -1 := by
  constructor
  · intro h
    have h1 := h 1 (by omega)
    unfold K2c2 at h1
    simp at h1
    exact h1
  · intro h n hn
    subst h
    have ⟨k, hk⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    subst hk
    unfold K2c2
    simp only [Nat.add_sub_cancel]
    rw [neg_one_pow_succ]
    omega

/-- With trivial multiplier (the classical sum) the value is
    −(−1)ⁿ, so the alternation identity fails at every n ≥ 1:
    the multiplier-weighted and classical objects genuinely
    differ. -/
theorem classical_differs (n : Nat) (hn : 1 ≤ n) :
    K2c2 1 n = -((-1 : Int) ^ n) := by
  have ⟨k, hk⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
  subst hk
  unfold K2c2
  simp only [Nat.add_sub_cancel, Int.one_mul]
  rw [neg_one_pow_succ]
  omega

/-- Smallest cases worked by hand: n = 1 gives ν̄, n = 2 gives
    −ν̄ (the two evaluations quoted in lem:K2c2). -/
theorem smallest_cases (nubar : Int) :
    K2c2 nubar 1 = nubar ∧ K2c2 nubar 2 = -nubar := by
  constructor
  · unfold K2c2
    simp
  · unfold K2c2
    simp

end P4R4
