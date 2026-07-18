/-
  P1_L2_structural_identity.lean
  Paper 1 (CKM), WP-3 certificate — Lean 4.15.0, core toolchain only.
  Zero axioms, zero `sorry`.

  Certifies the exact-arithmetic spine of Section 5:
    (i)   the rational bracket for the derived Cabibbo suppression:
          with u* in (3409867, 3409868)/10⁶ (root bracket certified in
          P1_L1), 226764/10⁶ < 1/(1+u*) < 226765/10⁶, i.e.
          λ_C(derived) = 0.226764(1);
    (ii)  the identity algebra: λ(1+u) = 1 and α_w/(α_w+α_s) = 1/(1+u)
          under α_s = u·α_w, in cleared integer form;
    (iii) the complementarity of the ψ-overlap patterns: with the
          corner ψ-coordinates and the certified placement maps, the
          down-sector same-ψ pattern is the exact Boolean negation of
          the up-sector pattern — the 1 ↔ λ_C transposition of the
          overlap matrices.
-/

namespace P1L2

/- ------------------------------------------------------------------
   (i) λ_C bracket. λ = 1/(1+u) with u ∈ (n, n+1)/10⁶, n = 3409867.
   λ_lo = 10⁶/(10⁶+n+1), λ_hi = 10⁶/(10⁶+n). Certify
   226764/10⁶ < λ_lo and λ_hi < 226765/10⁶ in cleared form.
   ------------------------------------------------------------------ -/

def n : Int := 3409867

/-- 226764 · (10⁶ + n + 1) < 10¹²  ⟺  226764/10⁶ < 10⁶/(10⁶+n+1). -/
theorem lam_lo : 226764 * (1000000 + n + 1) < 10^12 := by decide

/-- 10¹² < 226765 · (10⁶ + n)  ⟺  10⁶/(10⁶+n) < 226765/10⁶. -/
theorem lam_hi : (10^12 : Int) < 226765 * (1000000 + n) := by decide

/- ------------------------------------------------------------------
   (ii) Identity algebra, exact over ℤ (cleared denominators).
   ------------------------------------------------------------------ -/

/-- λ(1+u) = 1 in cleared form: with λ = a/b, u = p/q,
    a(q+p) = bq ⟺ λ = 1/(1+u). Stated as the defining identity. -/
theorem identity_cleared (a b p q : Int) (h : a * (q + p) = b * q) :
    a * q + a * p = b * q := by
  have := h
  rw [Int.mul_add] at this
  exact this

/-- The gauge-side combination: if α_s = u·α_w (cleared:
    as·q = u_num·aw with u = u_num/q), then
    aw/(aw+as) = q/(q+u_num) in cleared form:
    aw·(q+u_num) = (aw+as)·q. -/
theorem gauge_side (aw as u_num q : Int) (h : as * q = u_num * aw) :
    aw * (q + u_num) = (aw + as) * q := by
  rw [Int.mul_add, Int.add_mul]
  have h2 : as * q = aw * u_num := by
    rw [h, Int.mul_comm u_num aw]
  rw [h2]

/- ------------------------------------------------------------------
   (iii) Complementarity of the ψ-overlap patterns.
   Corners P₁..P₄ ↦ 0,1,2,3 with ψ-coordinates (0,½,0,½) ↦ Fin 2.
   Up placement (Q_L, u_R): Gen ↦ (P₁,P₂,P₃); down (d_R): (P₂,P₁,P₄).
   ------------------------------------------------------------------ -/

/-- ψ-coordinate of each corner (in half-period units). -/
def psi : Fin 4 → Fin 2
  | 0 => 0
  | 1 => 1
  | 2 => 0
  | 3 => 1

def upSites : Fin 3 → Fin 4
  | 0 => 0
  | 1 => 1
  | 2 => 2

def downSites : Fin 3 → Fin 4
  | 0 => 1
  | 1 => 0
  | 2 => 3

/-- Up-sector same-ψ predicate for the (i,j) Yukawa element. -/
def sameU (i j : Fin 3) : Bool := psi (upSites i) == psi (upSites j)

/-- Down-sector same-ψ predicate for the (i,j) Yukawa element. -/
def sameD (i j : Fin 3) : Bool := psi (upSites i) == psi (downSites j)

/-- Exact complementarity: the down pattern is the Boolean negation
    of the up pattern at every element — the 1 ↔ λ_C transposition. -/
theorem complementarity : ∀ i j, sameD i j = !(sameU i j) := by decide

/-- The up pattern is the checkerboard of eq. (5.x):
    same-ψ at (1,1),(1,3),(2,2),(3,1),(3,3); displaced elsewhere. -/
theorem up_pattern :
    (sameU 0 0 = true)  ∧ (sameU 0 1 = false) ∧ (sameU 0 2 = true) ∧
    (sameU 1 0 = false) ∧ (sameU 1 1 = true)  ∧ (sameU 1 2 = false) ∧
    (sameU 2 0 = true)  ∧ (sameU 2 1 = false) ∧ (sameU 2 2 = true) := by
  decide

end P1L2
