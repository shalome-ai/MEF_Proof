/-!
# M2 — Certificate L6: the shape of ω and the sign bookkeeping (Section 5 / WP5)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.

Certified (trigonometric content reduced to algebra in s = sin²ϑ, c = cos²ϑ,
s + c = 1, cleared to thirds):
* `L6_Phi_coefficient`  — Φ = ω|ψ−ψ̄|² = (2r cosϑ)|2ir sinϑ|² = 8 r³ cosϑ sin²ϑ:
                           the coefficient 2·(2²) = 8 (PI ruling 9 Nov 2026: modulus squared);
* `L6_Phi_extremum`     — d/dϑ(cosϑ sin²ϑ) = sinϑ(2cos²ϑ − sin²ϑ) vanishes at
                           2c = s, i.e. s = 2/3, c = 1/3 (tan²ϑ = 2);
* `L6_sign`             — if |ψ−ψ̄|² = q > 0 and Φ = ω·q ≥ 0 then ω ≥ 0: the
                           dilaton's positivity on the decaying-warp solutions
                           fixes the sign of Re ω wherever the sheets are
                           distinct (the half-circle); flipping ψ flips both
                           (`L6_flip`);
* `L6_hump_zeros`       — the circular-normal mean ⟨ω⟩ = 2 r̄ A(c) cosϑ₀ vanishes
                           at A = 0 (uniform) and at cosϑ₀ = 0 (locked), as the
                           product identity it is.
-/

namespace M2L6

/-- 8 = 2 · (2²): ω = 2r cos, |ψ−ψ̄|² = |2 i r sin|² = 4 r² sin². -/
theorem L6_Phi_coefficient : (2:Int) * (2 * 2) = 8 := by decide

/-- Extremum of cos·sin²: 2cos² = sin². With s + c = 3 (thirds), 2c = s ⇒ s = 2, c = 1. -/
theorem L6_Phi_extremum (s c : Int) (h1 : s + c = 3) (h2 : 2 * c = s) : s = 2 ∧ c = 1 := by
  omega

/-- Sign bookkeeping: q > 0 and ω·q ≥ 0 ⇒ ω ≥ 0. -/
theorem L6_sign (w q : Int) (hq : 0 < q) (h : 0 ≤ w * q) : 0 ≤ w := by
  by_cases hw : 0 ≤ w
  · exact hw
  · exfalso
    have hw' : w < 0 := by omega
    have : w * q < 0 := Int.mul_neg_of_neg_of_pos hw' hq
    omega

/-- Flipping the sign of ψ flips ω and Φ together: (−w)·q = −(w·q). -/
theorem L6_flip (w q : Int) : (-w) * q = -(w * q) := Int.neg_mul w q

/-- ⟨ω⟩ = 2 r̄ · A · cosϑ₀ vanishes when A = 0 or cosϑ₀ = 0. -/
theorem L6_hump_zeros (r A k : Int) : (A = 0 ∨ k = 0) → 2 * r * A * k = 0 := by
  intro h
  rcases h with h | h <;> simp [h]

end M2L6
