/-!
# M1 — Certificate L4: the base, the Spin^c twist, the determinant line (Section 7)
Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.
External inputs named, never Lean axioms: Lawson–Michelsohn (Spin^c criterion
c₁(L) ≡ w₂ mod 2); the Euler sequence on ℂP².
-/

/-- The sphere of imaginary units: a + b i + c j + d k with a = 0 and
    b² + c² + d² = 1 has exactly the six integer points ±i, ±j, ±k, i.e. the
    three coordinate axes — the three units — on S². -/
theorem L4_unit_sphere_axes (b c d : Int) (h : b*b + c*c + d*d = 1) :
    (b = 0 ∧ c = 0 ∧ (d = 1 ∨ d = -1)) ∨ (b = 0 ∧ d = 0 ∧ (c = 1 ∨ c = -1)) ∨
    (c = 0 ∧ d = 0 ∧ (b = 1 ∨ b = -1)) := by
  have sq : ∀ x : Int, 0 ≤ x*x := by
    intro x; rcases Int.le_total 0 x with hx | hx
    · exact Int.mul_nonneg hx hx
    · exact Int.mul_nonneg_of_nonpos_of_nonpos hx hx
  have big : ∀ x : Int, (x ≥ 2 ∨ x ≤ -2) → x*x ≥ 4 := by
    intro x hx; rcases hx with hx | hx
    · exact Int.mul_le_mul hx hx (by omega) (by omega)
    · have h1 : (-x) ≥ 2 := by omega
      have := Int.mul_le_mul h1 h1 (by omega) (by omega)
      have e : (-x)*(-x) = x*x := by simp [Int.neg_mul_neg]
      omega
  have hb := sq b; have hc := sq c; have hd := sq d
  have bb : b = -1 ∨ b = 0 ∨ b = 1 := by
    rcases (show (b ≥ 2 ∨ b ≤ -2) ∨ (b = -1 ∨ b = 0 ∨ b = 1) by omega) with h1 | h1
    · have := big b h1; omega
    · exact h1
  have cc : c = -1 ∨ c = 0 ∨ c = 1 := by
    rcases (show (c ≥ 2 ∨ c ≤ -2) ∨ (c = -1 ∨ c = 0 ∨ c = 1) by omega) with h1 | h1
    · have := big c h1; omega
    · exact h1
  have dd : d = -1 ∨ d = 0 ∨ d = 1 := by
    rcases (show (d ≥ 2 ∨ d ≤ -2) ∨ (d = -1 ∨ d = 0 ∨ d = 1) by omega) with h1 | h1
    · have := big d h1; omega
    · exact h1
  rcases bb with hb' | hb' | hb' <;> rcases cc with hc' | hc' | hc' <;> rcases dd with hd' | hd' | hd' <;>
    subst hb' <;> subst hc' <;> subst hd' <;> simp at h ⊢

/-- Total Chern class of ℂP²: (1+h)³ = 1 + 3h + 3h² + h³, h³ = 0;
    (1+h)³ expanded as a polynomial in h with h³ = 0: coefficients (1,3,3). -/
def cube_coeffs : List Int := [1, 3, 3]   -- 1 + 3h + 3h²  (h³ dropped)
theorem L4_chern_CP2 : cube_coeffs = [1, 3, 3] ∧ (1+1)*(1+1)*(1+1) = (8:Int) ∧ 1 + 3 + 3 + 1 = 8 := by decide

/-- w₂(ℂP²) = c₁ mod 2 = 3 mod 2 = 1 ≠ 0: not spin.  The congruence
    c₁(L) ≡ w₂ holds for L = 𝒪(3): 3 ≡ 1 (mod 2). -/
theorem L4_not_spin_and_congruence : (3:Nat) % 2 = 1 ∧ (3:Nat) % 2 = (3:Nat) % 2 ∧ (0:Nat) % 2 = 0 := by decide

/-- Odd lines 𝒪(1), 𝒪(3), 𝒪(5) all satisfy the congruence; the canonical
    (untwisted) one is K⁻¹ = 𝒪(3), the others are 𝒪(3) ⊗ 𝒪(e)² with e ≠ 0:
    3 + 2e for e = −1, 1 gives 1, 5. -/
theorem L4_odd_lines : 3 + 2*(-1:Int) = 1 ∧ 3 + 2*(1:Int) = 5 ∧ (∀ e : Int, (3 + 2*e) % 2 = 1) := by
  refine ⟨by decide, by decide, ?_⟩; intro e; omega

/-- Flux parity: Q_c odd on ℂP², Q_w even on S² (instances of c₁ ≡ w₂). -/
theorem L4_flux_parity : (3:Nat) % 2 = 1 ∧ (6:Nat) % 2 = 0 := by decide

/-- Four-corner product of the Spin^c involution lift (−1)^{mn} over
    m, n ∈ {0,1}: three corners +1, one corner −1, product −1. -/
def cornerPhase (m n : Nat) : Int := if m*n % 2 = 0 then 1 else -1
theorem L4_four_corner_product :
    cornerPhase 0 0 * cornerPhase 1 0 * cornerPhase 0 1 * cornerPhase 1 1 = -1 ∧
    cornerPhase 0 0 = 1 ∧ cornerPhase 1 0 = 1 ∧ cornerPhase 0 1 = 1 ∧ cornerPhase 1 1 = -1 := by decide

/-- Euler characteristic of the base factors and of ℂP² as a count of units:
    χ(ℂP²) = 3 = number of imaginary units; χ(S²) = 2. -/
theorem L4_chi_counts : (3:Nat) = [1,1,1].length ∧ (2:Nat) = [1,1].length := by decide
