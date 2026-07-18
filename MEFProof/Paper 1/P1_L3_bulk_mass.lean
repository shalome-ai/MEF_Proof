/-
  P1_L3_bulk_mass.lean
  Paper 1 (CKM), WP-1 certificate — Lean 4.15.0, core toolchain only.
  Zero axioms, zero `sorry`.

  Certifies the exact-arithmetic spine of Section 3:
    (i)   bulk-mass values c(q) = 1/2 - q/12 for the declared charges
          q = (-1, -1, +2): c = (7/12, 7/12, 1/3), in cleared-denominator
          integer form 12*c = 6 - q;
    (ii)  ultraviolet/infrared ordering c_doublet > 1/2 > c_singlet;
    (iii) doublet-singlet gap 1/4 and charge gap 3 = deg O(3);
    (iv)  displacement sign e^{i*pi*DeltaY} = -1 at DeltaY = 1, and
          sign-level mutual exclusivity (Theorem 3.1(c));
    (v)   the placement pattern (up: P1 P2 P3; down: P2 P1 P4) equals the
          psi-shift involution applied to the up map, and that shift is
          an involution.
-/

namespace P1L3

/-- Declared Spin^c charges (Assumption Σ-1): doublet, doublet, singlet. -/
def q : Fin 3 → Int
  | 0 => -1
  | 1 => -1
  | 2 =>  2

/-- Twelve times the bulk-mass parameter: `cNum q = 12·c(q) = 6 − q`. -/
def cNum (qv : Int) : Int := 6 - qv

/- (i) the bulk-mass table, cleared denominators: c₁ = c₂ = 7/12, c₃ = 1/3. -/
theorem c_doublet_1 : cNum (q 0) = 7 := by decide
theorem c_doublet_2 : cNum (q 1) = 7 := by decide
theorem c_singlet   : cNum (q 2) = 4 := by decide

/-- c₃ = 1/3 exactly: 3·(12·c₃) = 12. -/
theorem c_singlet_is_third : 3 * cNum (q 2) = 12 := by decide

/- (ii) UV/IR ordering: c_doublet > 1/2 > c_singlet, i.e. 12c ≷ 6. -/
theorem ordering_UV : cNum (q 0) > 6 := by decide
theorem ordering_IR : cNum (q 2) < 6 := by decide

/- (iii) gaps. -/
/-- Doublet–singlet bulk-mass gap is exactly 1/4: 4·(12c₁ − 12c₃) = 12. -/
theorem gap_quarter : 4 * (cNum (q 0) - cNum (q 2)) = 12 := by decide

/-- Charge gap equals the degree of the Spin^c determinant line O(3). -/
theorem charge_gap : q 2 - q 0 = 3 := by decide

/- (iv) displacement sign (Theorem 3.1(c)), sign-level model.
   The relative Wilson parity between hypercharge sectors differing by
   ΔY on the thirds lattice is e^{iπΔY}, modelled in {±1} ⊂ ℤ. -/

/-- Relative parity of a hypercharge gap ΔY (integer part of πΔY/π). -/
def relPar (dY : Nat) : Int := if dY % 2 = 0 then 1 else -1

/-- At ΔY = 1 (up vs down sector) the relative parity is exactly −1. -/
theorem displacement_sign : relPar 1 = -1 := by decide

/-- Mutual exclusivity at sign level: a corner of local parity s ∈ {±1}
    admits a zero mode iff s = 1; after the ΔY = 1 twist the same corner
    has parity −s, so the two sectors' admissible sites are disjoint. -/
theorem exclusivity (s : Int) (h : s = 1 ∨ s = -1) :
    (s = 1) ↔ ¬ (relPar 1 * s = 1) := by
  cases h with
  | inl h => subst h; decide
  | inr h => subst h; decide

/- (v) the placement pattern is the ψ-shift involution. Corners are
   P₁,P₂,P₃,P₄ ↦ 0,1,2,3. -/

/-- The ψ-shift on the corner set: P₁↔P₂, P₃↔P₄. -/
def shift : Fin 4 → Fin 4
  | 0 => 1
  | 1 => 0
  | 2 => 3
  | 3 => 2

/-- Up-sector placement (Q_L and u_R): Gen 1,2,3 ↦ P₁,P₂,P₃. -/
def upSites : Fin 3 → Fin 4
  | 0 => 0
  | 1 => 1
  | 2 => 2

/-- Down-sector placement (d_R): Gen 1,2,3 ↦ P₂,P₁,P₄. -/
def downSites : Fin 3 → Fin 4
  | 0 => 1
  | 1 => 0
  | 2 => 3

/-- Eq. (3.6): the down map is exactly the ψ-shift of the up map. -/
theorem placement_is_shift : ∀ i, downSites i = shift (upSites i) := by
  decide

/-- The ψ-shift is an involution (rigid half-period displacement). -/
theorem shift_involutive : ∀ p, shift (shift p) = p := by decide

end P1L3
