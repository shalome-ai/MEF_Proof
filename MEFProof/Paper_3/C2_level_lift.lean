/-
  C2_level_lift.lean
  Paper 3 — consolidation node C2.
  Certifies Paper 3: Lemmas 4.1 and 4.2, Propositions 4.3 and 4.4.

  Blocks:
    A. Oddness is forced: an even character cancels the unary theta
       pairwise; an odd character doubles it.
    B. Oddness has a minimal conductor: −1 ≡ 1 at moduli 1 and 2, so
       every character there is even.
    C. The unique odd character mod 3: values, oddness, multiplicativity,
       quadratic property, and forcedness of the values.
    D. First theta coefficients χ(n)·n for n = 1..5: 1, −2, 0, 4, −5.
    E. Level arithmetic: 4·1² = 4 (naive), 4·3² = 36 (lifted).
    F. Strict ℤ₃ periodicity of the geometric phase: ζ₃³ = 1 and ζ₃ ≠ 1.

  The certificate covers arithmetic only. The Serre–Stark classification,
  the Shimura lift, the genus of X₀(2), and the boundary-data inputs
  consumed from the determinant-line section are cited in the note, not
  formalised.

  Build: Lean 4 with Mathlib (`import Mathlib`). All goals should be
  accomplished with no `sorry`.
-/
import Mathlib

namespace C2

/-! ### Block A — oddness is forced -/

/-- Even character: the `n` and `−n` unary-theta summands cancel exactly. -/
theorem even_char_pairs_cancel (ψ : ℤ → ℤ) (heven : ∀ n, ψ (-n) = ψ n)
    (n : ℤ) : ψ (-n) * (-n) + ψ n * n = 0 := by
  rw [heven]
  ring

/-- Odd character: the `n` and `−n` summands agree, so the series
survives with doubled coefficients. -/
theorem odd_char_pairs_double (ψ : ℤ → ℤ) (hodd : ∀ n, ψ (-n) = -ψ n)
    (n : ℤ) : ψ (-n) * (-n) = ψ n * n := by
  rw [hodd]
  ring

/-! ### Block B — oddness has a minimal conductor -/

theorem neg_one_eq_one_mod_one : (-1 : ZMod 1) = 1 := by decide

theorem neg_one_eq_one_mod_two : (-1 : ZMod 2) = 1 := by decide

/-- Every character mod 1 is even: `f(−1) = f(1) = 1`. -/
theorem char_mod_one_even (f : ZMod 1 → ℤ) (h1 : f 1 = 1) :
    f (-1) = 1 := by
  rw [neg_one_eq_one_mod_one]
  exact h1

/-- Every character mod 2 is even: `f(−1) = f(1) = 1`. -/
theorem char_mod_two_even (f : ZMod 2 → ℤ) (h1 : f 1 = 1) :
    f (-1) = 1 := by
  rw [neg_one_eq_one_mod_two]
  exact h1

/-! ### Block C — the unique odd character mod 3 -/

/-- The quadratic residue character mod 3: `χ(0)=0, χ(1)=1, χ(2)=−1`. -/
def chi : ZMod 3 → ℤ := fun a => if a = 0 then 0 else if a = 1 then 1 else -1

theorem chi_zero : chi 0 = 0 := by decide

theorem chi_one : chi 1 = 1 := by decide

theorem chi_two : chi 2 = -1 := by decide

theorem neg_one_eq_two_mod_three : (-1 : ZMod 3) = 2 := by decide

/-- `χ` is odd: `χ(−1) = −1`. -/
theorem chi_odd : chi (-1) = -1 := by decide

/-- `χ` is multiplicative on all of `ZMod 3` (with the value 0 at 0). -/
theorem chi_mul : ∀ a b : ZMod 3, chi (a * b) = chi a * chi b := by decide

/-- `χ` is quadratic: `χ(a)² = 1` on units. -/
theorem chi_sq_one : ∀ a : ZMod 3, a ≠ 0 → chi a * chi a = 1 := by decide

/-- Forcedness: any character mod 3 normalised by `f(1) = 1` and odd,
`f(−1) = −1`, takes the values of `chi` on the units — uniqueness of the
odd character mod 3. -/
theorem odd_char_mod_three_forced (f : ZMod 3 → ℤ) (h1 : f 1 = 1)
    (hodd : f (-1) = -1) : f 1 = chi 1 ∧ f 2 = chi 2 := by
  constructor
  · rw [h1, chi_one]
  · have h2 : f 2 = -1 := by
      rw [← neg_one_eq_two_mod_three]
      exact hodd
    rw [h2, chi_two]

/-! ### Block D — first theta coefficients -/

/-- The coefficient of `q^{n²}` in `θ_χ` (up to the overall doubling over
`±n`): `χ(n mod 3) · n`. -/
def thetaCoeff (n : ℕ) : ℤ := chi (n : ZMod 3) * n

theorem theta_c1 : thetaCoeff 1 = 1 := by decide

theorem theta_c2 : thetaCoeff 2 = -2 := by decide

theorem theta_c3 : thetaCoeff 3 = 0 := by decide

theorem theta_c4 : thetaCoeff 4 = 4 := by decide

theorem theta_c5 : thetaCoeff 5 = -5 := by decide

/-! ### Block E — level arithmetic -/

/-- The naive level: `4·1² = 4`. -/
theorem naive_level : 4 * 1 ^ 2 = 4 := by norm_num

/-- The lifted level: `4·3² = 36`. -/
theorem lifted_level : 4 * 3 ^ 2 = 36 := by norm_num

/-! ### Block F — strict ℤ₃ periodicity of the geometric phase -/

/-- The order-three phase `ζ₃ = e^{2πi/3}`. -/
noncomputable def zeta3 : ℂ :=
  Complex.exp ((2 * Real.pi / 3 : ℝ) * Complex.I)

/-- `ζ₃³ = 1`. -/
theorem zeta3_pow_three : zeta3 ^ 3 = 1 := by
  rw [zeta3, ← Complex.exp_nat_mul]
  have h : ((3 : ℕ) : ℂ) * (((2 * Real.pi / 3 : ℝ) : ℂ) * Complex.I) =
      2 * (Real.pi : ℂ) * Complex.I := by
    push_cast
    ring
  rw [h]
  exact Complex.exp_two_pi_mul_I

/-- `ζ₃ ≠ 1`: the periodicity is strict (order exactly three, with
`zeta3_pow_three`). Uses `Complex.exp_eq_one_iff`; the arithmetic
reduces to `1 = 3n`, impossible in `ℤ`. -/
/- `zeta3 ≠ 1`: the periodicity is strict (order exactly three, with
`zeta3_pow_three`). Uses `Complex.exp_eq_one_iff`; the arithmetic
reduces to `1 = 3n`, impossible in `Z`. -/
theorem zeta3_ne_one : zeta3 ≠ 1 := by
  rw [ne_eq, zeta3, Complex.exp_eq_one_iff]
  rintro ⟨n, hn⟩
  -- take imaginary parts: 2π/3 = n·2π over ℝ
  have hre : (2 * Real.pi / 3 : ℝ) = (n : ℝ) * (2 * Real.pi) := by
    have h' := congrArg Complex.im hn
    simp [Complex.mul_im, Complex.mul_re, Complex.I_im, Complex.I_re,
      Complex.ofReal_im, Complex.ofReal_re] at h'
    linarith [h']
  have hπ : Real.pi ≠ 0 := Real.pi_ne_zero
  have h3 : (1 : ℝ) * Real.pi = (3 * (n : ℝ)) * Real.pi := by
    ring_nf at hre ⊢
    linarith [hre]
  have h1n : (1 : ℝ) = 3 * (n : ℝ) := mul_right_cancel₀ hπ h3
  have hz : (1 : ℤ) = 3 * n := by exact_mod_cast h1n
  omega

end C2

/-! ### Axiom footprint -/

#print axioms C2.odd_char_mod_three_forced
#print axioms C2.naive_level
#print axioms C2.lifted_level
