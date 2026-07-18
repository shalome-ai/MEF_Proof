/-
  P1_L6_cp_phase.lean
  Paper 1 (CKM), WP-5 certificate — Lean 4.15.0, core toolchain only.
  Zero axioms, zero `sorry`.

  Certifies the exact-arithmetic spine of Section 7:
    (i)    the quanta sum: φ_ψ = W_mono + W_base + W_fibre
           = 0 + π/12 + π/3 = 5π/12, in twelfths: 0 + 1 + 4 = 5;
    (ii)   corner-phase additivity ϑ(P₄) = ϑ(P₂) + ϑ(P₃):
           5 + 6 = 11 (twelfths), and the gap closure
           5 + 1 + 5 + 1 = 12 = χ(K₈);
    (iii)  derived-geometry brackets, from the u-bracket of P1_L1
           (u ∈ (n, n+1)/10⁶, n = 3409867):
           cos 2θ_W ∈ (546470, 546472)/10⁶;
           q_ψ = ½ cos 2θ_W ∈ (273235, 273236)/10⁶;
           δ_CP ∈ (65.4926°, 65.4931°), via
           δ°(c) = (90·b + 75·a)/(2·b) at c = a/b.
-/

namespace P1L6

/- ------------------------------------------------------------------
   (i) Quanta sum in twelfths of π.
   ------------------------------------------------------------------ -/

def Wmono  : Int := 0
def Wbase  : Int := 1   -- π/12
def Wfibre : Int := 4   -- π/3 = 4π/12
def phiPsi : Int := 5   -- 5π/12

theorem quanta_sum : Wmono + Wbase + Wfibre = phiPsi := by decide

/-- The base quantum is 2π/(2χ): in twelfths, 24·Wbase = 2·12. -/
theorem base_is_two_chi : 24 * Wbase = 2 * 12 := by decide

/-- The fibre quantum is 2π/6: in twelfths, 6·Wfibre = 24. -/
theorem fibre_is_z6 : 6 * Wfibre = 24 := by decide

/- ------------------------------------------------------------------
   (ii) Corner phases (twelfths): (P₁,P₂,P₃,P₄) = (0,5,6,11).
   ------------------------------------------------------------------ -/

def theta : Fin 4 → Int
  | 0 => 0 | 1 => 5 | 2 => 6 | 3 => 11

/-- Additivity: ϑ(P₄) = ϑ(P₂) + ϑ(P₃). -/
theorem corner_additivity : theta 3 = theta 1 + theta 2 := by decide

/-- Gap closure: consecutive gaps (5,1,5,1) sum to χ(K₈) = 12. -/
theorem gap_closure :
    (theta 1 - theta 0) + (theta 2 - theta 1) +
    (theta 3 - theta 2) + (12 - theta 3) = 12 := by decide

/- ------------------------------------------------------------------
   (iii) Derived-geometry brackets for cos 2θ_W, q_ψ and δ_CP.
   With c = cos 2θ_W = (n − D)/(n + D + k), the degree value is
   δ°(a,b) = (90b + 75a)/(2b) at c = a/b. Using the u-bracket
   n = 3409867, D = 10⁶ of P1_L1:
   lower endpoint (a₁,b₁) = (n−D, n+1+D), upper (a₂,b₂) = (n+1−D, n+D).
   Certify 65.4926 < δ°(a₁,b₁) and δ°(a₂,b₂) < 65.4931 in cleared
   integer form.
   ------------------------------------------------------------------ -/

def n : Int := 3409867
def D : Int := 1000000

/-- 654926·(2b₁) < (90b₁ + 75a₁)·10⁴ with a₁ = n−D, b₁ = n+1+D. -/
theorem deltaCP_derived_lo :
    654926 * (2 * (n + 1 + D)) <
      (90 * (n + 1 + D) + 75 * (n - D)) * 10^4 := by decide

/-- (90b₂ + 75a₂)·10⁴ < 654931·(2b₂) with a₂ = n+1−D, b₂ = n+D. -/
theorem deltaCP_derived_hi :
    (90 * (n + D) + 75 * (n + 1 - D)) * 10^4 <
      654931 * (2 * (n + D)) := by decide

/-- cos 2θ_W = (u−1)/(u+1) > 546470/10⁶ (lower endpoint at
    c = (n−D)/(n+1+D)). -/
theorem cos2W_derived_lo : 546470 * (n + 1 + D) < (n - D) * 10^6 := by
  decide

/-- cos 2θ_W < 546472/10⁶ (upper endpoint at c = (n+1−D)/(n+D)). -/
theorem cos2W_derived_hi : (n + 1 - D) * 10^6 < 546472 * (n + D) := by
  decide

/-- q_ψ = ½ cos 2θ_W > 273235/10⁶. -/
theorem qpsi_derived_lo : 273235 * (2 * (n + 1 + D)) < (n - D) * 10^6 := by
  decide

/-- q_ψ < 273236/10⁶. -/
theorem qpsi_derived_hi : (n + 1 - D) * 10^6 < 273236 * (2 * (n + D)) := by
  decide

end P1L6
