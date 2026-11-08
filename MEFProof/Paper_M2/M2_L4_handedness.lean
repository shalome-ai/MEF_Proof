/-!
# M2 — Certificate L4: handedness relative to the flow (Section 2 / WP2, R2.3)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.
External input named, never a Lean axiom: an orientation-reversing element of
Pin anticommutes with the chirality operator in every signature
(Lawson–Michelsohn, Spin Geometry, I.§5).

Model. The Sol block is the suspension of the drive: (x, s) ~ (M₀x, s+1) with
M₀ = ((2,1),(1,1)) (M1 Thm 4.2). A symmetry reversing the flow has the form
(x, s) ↦ (Ax, −s) with A ∈ GL(2,ℤ) and A M₀ A⁻¹ = M₀⁻¹. Its orientation on the
three-dimensional block is det A · (−1).

Certified:
* `L4_S_conj`        — the quarter-turn S conjugates M₀ to M₀⁻¹ (M1 `L1_conj_M0_inv`,
                        re-certified here under the island rule);
* `L4_S_sq_fold`     — S² = −I: the square of the quarter-turn is M1's fold;
* `L4_S_det`         — det S = +1, so τ = (S, s ↦ −s) has total determinant −1:
                        it reverses the orientation of the block;
* `L4_swap_lines`    — in ℤ[φ], S carries the unstable eigenvector (φ, 1) of M₀
                        to minus the stable eigenvector (−1, φ): the quarter-turn
                        exchanges growth and decay;
* `L4_eigen`         — M₀(φ,1) = φ²(φ,1) and M₀(−1,φ) = φ⁻²(−1,φ), φ⁻² = 2 − φ;
* `L4_involution_det`— any A with A² = I and A M₀ A⁻¹ = M₀⁻¹ has det A = −1, so
                        an *involutive* flow reversal preserves the block's
                        orientation; orientation reversal forces order four,
                        with square the fold.
Hence ψ̄ ≡ τ̂ψ is related to ψ by an odd element of Pin and has the opposite
chirality — in Riemannian signature, with no Lorentzian structure assumed.
-/

namespace M2L4

/-- 2×2 integer matrices ((a,b),(c,d)). -/
structure M2 where
  a : Int
  b : Int
  c : Int
  d : Int
deriving DecidableEq, Repr

namespace M2
def mul (p q : M2) : M2 :=
  ⟨p.a*q.a + p.b*q.c, p.a*q.b + p.b*q.d, p.c*q.a + p.d*q.c, p.c*q.b + p.d*q.d⟩
def det (p : M2) : Int := p.a*p.d - p.b*p.c
def I    : M2 := ⟨1,0,0,1⟩
def negI : M2 := ⟨-1,0,0,-1⟩
def M0   : M2 := ⟨2,1,1,1⟩
def M0inv: M2 := ⟨1,-1,-1,2⟩
def S    : M2 := ⟨0,1,-1,0⟩   -- quarter-turn
def Sinv : M2 := ⟨0,-1,1,0⟩
end M2
open M2

theorem L4_M0_inv : mul M0 M0inv = I ∧ mul M0inv M0 = I := by decide
theorem L4_S_inv  : mul S Sinv = I := by decide
/-- S M₀ S⁻¹ = M₀⁻¹ (re-certification of M1 `L1_conj_M0_inv`). -/
theorem L4_S_conj : mul (mul S M0) Sinv = M0inv := by decide
/-- S² = −I: the quarter-turn squares to the fold. -/
theorem L4_S_sq_fold : mul S S = negI := by decide
theorem L4_S_det : det S = 1 := by decide
/-- Total orientation of τ = (S, s ↦ −s) on the Sol block: det S · (−1) = −1. -/
theorem L4_tau_reverses : det S * (-1) = -1 := by decide

/-! ### The golden ring ℤ[φ], φ² = φ + 1, and the eigen-directions -/

/-- Elements a + bφ of ℤ[φ]. -/
structure Zphi where
  a : Int
  b : Int
deriving DecidableEq, Repr

namespace Zphi
def add (x y : Zphi) : Zphi := ⟨x.a+y.a, x.b+y.b⟩
/-- (a+bφ)(c+dφ) = ac + (ad+bc)φ + bd φ² = (ac+bd) + (ad+bc+bd)φ. -/
def mul (x y : Zphi) : Zphi := ⟨x.a*y.a + x.b*y.b, x.a*y.b + x.b*y.a + x.b*y.b⟩
def ofInt (n : Int) : Zphi := ⟨n,0⟩
def phi   : Zphi := ⟨0,1⟩
def phi2  : Zphi := ⟨1,1⟩      -- φ² = 1 + φ
def phiInv2 : Zphi := ⟨2,-1⟩   -- φ⁻² = 2 − φ
def neg (x : Zphi) : Zphi := ⟨-x.a, -x.b⟩
end Zphi
open Zphi

/-- Vectors in ℤ[φ]². -/
structure V where
  x : Zphi
  y : Zphi
deriving DecidableEq, Repr

def act (m : M2) (v : V) : V :=
  ⟨Zphi.add (Zphi.mul (ofInt m.a) v.x) (Zphi.mul (ofInt m.b) v.y),
   Zphi.add (Zphi.mul (ofInt m.c) v.x) (Zphi.mul (ofInt m.d) v.y)⟩
def smul (l : Zphi) (v : V) : V := ⟨Zphi.mul l v.x, Zphi.mul l v.y⟩
def negV (v : V) : V := ⟨Zphi.neg v.x, Zphi.neg v.y⟩

def vU : V := ⟨phi, ofInt 1⟩        -- unstable direction (φ, 1)
def vS : V := ⟨ofInt (-1), phi⟩     -- stable direction (−1, φ)

theorem L4_phi2 : Zphi.mul phi phi = phi2 := by decide
theorem L4_phi_inv2 : Zphi.mul phi2 phiInv2 = ofInt 1 := by decide
/-- M₀ v_u = φ² v_u and M₀ v_s = φ⁻² v_s. -/
theorem L4_eigen : act M0 vU = smul phi2 vU ∧ act M0 vS = smul phiInv2 vS := by decide
/-- The quarter-turn exchanges the two lines: S v_u = −v_s, S v_s = v_u. -/
theorem L4_swap_lines : act S vU = negV vS ∧ act S vS = vU := by decide

/-! ### Involutive flow reversals preserve orientation -/

/-- If A² = I and A M₀ = M₀⁻¹ A (i.e. A M₀ A⁻¹ = M₀⁻¹), then det A = −1. -/
theorem L4_involution_det (A : M2) (hsq : M2.mul A A = I) (hconj : M2.mul A M0 = M2.mul M0inv A) :
    det A = -1 := by
  obtain ⟨a, b, c, d⟩ := A
  simp only [M2.mul, I, M0, M0inv, M2.mk.injEq, det] at hsq hconj ⊢
  obtain ⟨h1, h2, h3, h4⟩ := hsq
  obtain ⟨k1, k2, k3, k4⟩ := hconj
  -- h2 : a*b + b*d = 0, h3 : c*a + d*c = 0
  have hb : b * (a + d) = 0 := by rw [Int.mul_add, Int.mul_comm b a]; omega
  have hc : c * (a + d) = 0 := by rw [Int.mul_add, Int.mul_comm c d]; omega
  rcases Int.mul_eq_zero.mp hb with hb0 | had
  · subst hb0
    rcases Int.mul_eq_zero.mp hc with hc0 | had
    · subst hc0
      -- A = diag(a,d); conjugation gives 2a = a, so a = 0, contradicting a² = 1
      have ha : a = 0 := by omega
      subst ha
      simp at h1
    · have hd : d = -a := by omega
      subst hd
      have h1' : a * a = 1 := by simpa using h1
      have : a * -a = -(a * a) := Int.mul_neg a a
      omega
  · have hd : d = -a := by omega
    subst hd
    have : a * -a = -(a * a) := Int.mul_neg a a
    omega

end M2L4
