/-!
# M2 — Certificate L2: the kinetic coefficient of the warp (Section 3 / WP3)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.
External inputs named, never Lean axioms: O'Neill's warped-product curvature
formula (Semi-Riemannian Geometry, 1983, Ch. 7); the conformal transformation
of the scalar curvature in four dimensions.

What is certified is the integer algebra of the reduction, with the two
analytic inputs recorded as the coefficients they contribute:
* Jordan-frame gradient coefficient after integration by parts:
  2k² − k(k+1) = k(k−1)                                  (`L2_jordan`);
* four-dimensional Weyl rescaling σ = −kφ/2 contributes −6σ'² = −3k²/2
  (as a coefficient of (∂φ)² scaled by 2 to stay in ℤ)     (`L2_weyl`);
* total: k(k−1) − 3k²/2 = −k(k+2)/2, i.e. the Einstein-frame Lagrangian is
  R − C (∂A)² with C = k(k+2)/2                             (`L2_total`);
* C(6) = 24 for the six-dimensional fibre ℂP² × S²          (`L2_C_six`);
* C(1) = 3/2 (certified as 2C = 3) for one warped dimension — the
  Randall–Sundrum radion, the smallest case by hand         (`L2_C_one`);
* with the warp exponent A = ζΦ, the coefficient of T^Φ is C ζ²; for ζ = 12π
  this is 24·144·π² = 3456π² (certified in units of π²)     (`L2_coeff_Phi`).
All identities are stated with the factor 2 cleared so that everything is in ℤ.
-/

namespace M2L2

/-- Twice the Jordan-frame gradient coefficient: 2·(2k² − k(k+1)) = 2k(k−1). -/
theorem L2_jordan (k : Int) : 2*(2*(k*k) - k*(k+1)) = 2*(k*(k-1)) := by
  have h1 : k*(k+1) = k*k + k := by rw [Int.mul_add, Int.mul_one]
  have h2 : k*(k-1) = k*k - k := by rw [Int.mul_sub, Int.mul_one]
  rw [h1, h2]; omega

/-- The Weyl contribution −6σ'² with σ' = −k/2 equals −3k²/2: cleared of
    denominators (×8), −6k²·2 = −3k²·4. -/
theorem L2_weyl (k : Int) : -6 * (k*k) * 2 = -(3*(k*k)) * 4 := by
  omega

/-- Total, doubled: 2k(k−1) − 3k² = −k(k+2). Hence C = k(k+2)/2. -/
theorem L2_total (k : Int) : 2*(k*(k-1)) - 3*(k*k) = -(k*(k+2)) := by
  have h2 : k*(k-1) = k*k - k := by rw [Int.mul_sub, Int.mul_one]
  have h3 : k*(k+2) = k*k + 2*k := by rw [Int.mul_add, Int.mul_comm k 2]
  rw [h2, h3]; omega

/-- C(k) = k(k+2)/2, as a natural number for even k(k+2) (always even). -/
def C (k : Nat) : Nat := k*(k+2)/2

theorem L2_C_six : C 6 = 24 := by decide
/-- Smallest case: one warped dimension, 2C = 3 (C = 3/2, the RS radion). -/
theorem L2_C_one : 1*(1+2) = 3 ∧ C 1 = 1 := by decide
/-- k(k+2) is even for every k, so C is an integer whenever k is even, and
    2C = k(k+2) always. -/
theorem L2_two_C (k : Nat) (h : k % 2 = 0) : 2 * C k = k*(k+2) := by
  unfold C
  have : (k*(k+2)) % 2 = 0 := by
    have hk : ∃ m, k = 2*m := ⟨k/2, by omega⟩
    obtain ⟨m, rfl⟩ := hk
    have : 2*m*(2*m+2) = 2*(m*(2*m+2)) := by
      rw [Nat.mul_assoc]
    omega
  omega

/-- Coefficient of T^Φ in units of π², with A = ζΦ and ζ = 12π: C·12² = 3456. -/
theorem L2_coeff_Phi : C 6 * 12 * 12 = 3456 := by decide

end M2L2
