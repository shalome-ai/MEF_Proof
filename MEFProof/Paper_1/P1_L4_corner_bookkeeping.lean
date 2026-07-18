/-
  P1_L4_corner_bookkeeping.lean
  Paper 1 (CKM), WP-4 certificate — Lean 4.15.0, core toolchain only.
  Zero axioms, zero `sorry`.

  Certifies the exact-arithmetic spine of Section 6:
    (i)   the hierarchy quantum: per light index the warped exponent
          shifts by (c₁ − c₃)·4π = π, in cleared form
          (12c₁ − 12c₃)·4 = 12, i.e. Δc·4π = π exactly;
    (ii)  the diagonal-factor bracket: with u* ∈ (n, n+1)/10⁶,
          1137218/10⁶ < √(1 + 1/u*) < 1137219/10⁶;
    (iii) corner bookkeeping: the diagonal pairs of the pillowcase
          (differing in both ψ and ω) are exactly {P₁,P₄} and
          {P₂,P₃}; the interference sites of the correction matrices
          are (2,3),(3,2) in the up sector and (1,3),(3,1) in the
          down sector; the correction matrices of eq. (6.x) are
          reproduced by the rule C = 1 at (3,3) or at a diagonal
          pair, else 2;
    (iv)  the sign algebra: the Z₂ Spin^c phase is the composition of
          two quarter phases, i^1 · i^1 = i^2 = −1 (modelled in the
          cyclic group of quarter turns with sign readout), and the
          tree-level interference sum is 1 + (−1) = 0.
-/

namespace P1L4

/- ------------------------------------------------------------------
   (i) Hierarchy quantum, cleared denominators (c-values from
   P1_L3: 12c₁ = 7, 12c₃ = 4).
   ------------------------------------------------------------------ -/

/-- (c₁ − c₃)·4π = π in cleared form: 4·(12c₁ − 12c₃) = 12·1. -/
theorem hierarchy_quantum : 4 * ((7 : Int) - 4) = 12 * 1 := by decide

/- ------------------------------------------------------------------
   (ii) Diagonal factor bracket. d² = 1 + 1/u = (u + 1·10⁶-scale)…
   With u ∈ (n, n+1)/10⁶: d² ∈ ((n+1+10⁶)/(n+1), (n+10⁶)/n).
   Certify 1137218² · (n+1) < (n+1+10⁶) · 10¹² and
           (n+10⁶) · 10¹² < 1137219² · n.
   ------------------------------------------------------------------ -/

def n : Int := 3409867

theorem diag_lo : 1137218^2 * (n + 1) < (n + 1 + 1000000) * 10^12 := by
  decide

theorem diag_hi : (n + 1000000) * 10^12 < 1137219^2 * n := by decide

/- ------------------------------------------------------------------
   (iii) Corner bookkeeping. Corners P₁..P₄ ↦ 0,1,2,3;
   ψ-coordinates (0,1,0,1); ω-coordinates (0,0,1,1) (half-period
   units).
   ------------------------------------------------------------------ -/

def psi : Fin 4 → Fin 2
  | 0 => 0 | 1 => 1 | 2 => 0 | 3 => 1

def omg : Fin 4 → Fin 2
  | 0 => 0 | 1 => 0 | 2 => 1 | 3 => 1

/-- Two corners form a diagonal pair iff they differ in both
    coordinates. -/
def diagPair (a b : Fin 4) : Bool :=
  (!(psi a == psi b)) && (!(omg a == omg b))

/-- The diagonal pairs are exactly {P₁,P₄} and {P₂,P₃}. -/
theorem diag_pairs : ∀ a b : Fin 4, diagPair a b =
    ((a == 0 && b == 3) || (a == 3 && b == 0) ||
     (a == 1 && b == 2) || (a == 2 && b == 1)) := by decide

def upSites : Fin 3 → Fin 4
  | 0 => 0 | 1 => 1 | 2 => 2

def downSites : Fin 3 → Fin 4
  | 0 => 1 | 1 => 0 | 2 => 3

/-- Up-sector interference sites: source Q_L at upSites i, target u_R
    at upSites j; the diagonal elements are exactly (2,3) and (3,2)
    (1-based), i.e. (1,2),(2,1) in Fin 3. -/
theorem up_interference_sites :
    ∀ i j : Fin 3, diagPair (upSites i) (upSites j) =
      ((i == 1 && j == 2) || (i == 2 && j == 1)) := by decide

/-- Down-sector interference sites: source Q_L at upSites i, target
    d_R at downSites j; the diagonal elements are exactly (1,3) and
    (3,1) (1-based), i.e. (0,2),(2,0) in Fin 3. -/
theorem down_interference_sites :
    ∀ i j : Fin 3, diagPair (upSites i) (downSites j) =
      ((i == 0 && j == 2) || (i == 2 && j == 0)) := by decide

/-- The correction-matrix rule: C = 1 at the (3,3) selection-rule
    element or at a diagonal pair; C = 2 otherwise. -/
def Cup (i j : Fin 3) : Int :=
  if (i == 2 && j == 2) || diagPair (upSites i) (upSites j) then 1 else 2

def Cdown (i j : Fin 3) : Int :=
  if (i == 2 && j == 2) || diagPair (upSites i) (downSites j) then 1 else 2

/-- The rule reproduces C^(u) of eq. (6.x): rows (2,2,2),(2,2,1),(2,1,1). -/
theorem C_up_matrix :
    Cup 0 0 = 2 ∧ Cup 0 1 = 2 ∧ Cup 0 2 = 2 ∧
    Cup 1 0 = 2 ∧ Cup 1 1 = 2 ∧ Cup 1 2 = 1 ∧
    Cup 2 0 = 2 ∧ Cup 2 1 = 1 ∧ Cup 2 2 = 1 := by decide

/-- The rule reproduces C^(d) of eq. (6.x): rows (2,2,1),(2,2,2),(1,2,1). -/
theorem C_down_matrix :
    Cdown 0 0 = 2 ∧ Cdown 0 1 = 2 ∧ Cdown 0 2 = 1 ∧
    Cdown 1 0 = 2 ∧ Cdown 1 1 = 2 ∧ Cdown 1 2 = 2 ∧
    Cdown 2 0 = 1 ∧ Cdown 2 1 = 2 ∧ Cdown 2 2 = 1 := by decide

/- ------------------------------------------------------------------
   (iv) Sign algebra of the Z₂ Spin^c phase.
   Quarter turns modelled in Fin 4 (k ↦ phase i^k); sign readout
   sgn(k) = real sign of i^k on the axis: +1 at k = 0, −1 at k = 2.
   ------------------------------------------------------------------ -/

/-- Composition of the two quarter phases is the half turn. -/
theorem quarter_compose : ((1 : Fin 4) + 1) = 2 := by decide

/-- Sign readout of the half turn is −1. -/
def sgn : Fin 4 → Int
  | 0 => 1 | 2 => -1 | _ => 0

theorem z2_phase : sgn (1 + 1) = -1 := by decide

/-- Tree-level interference: the two geodesic contributions sum with
    the relative phase −1 and cancel exactly. -/
theorem destructive : (1 : Int) + sgn (1 + 1) * 1 = 0 := by decide

end P1L4
