/-
  P1_L5_assembly.lean
  Paper 1 (CKM), WP-6 certificate — Lean 4.15.0, core toolchain only.
  Zero axioms, zero `sorry`.

  Certifies the exact-arithmetic spine of Section 8 (derived
  geometry throughout):
    (i)    the exact input rationals s₂₃ = 11/250 (= 0.0440),
           s₁₃ = 3/800 (= 0.00375) with Pythagorean complements
           c₂₃² = 62379/62500, c₁₃² = 639991/640000 as exact
           identities; s₁₂ carried by its derived bracket
           (226764, 226765)/10⁶ from P1_L2;
    (ii)   square-root brackets: 249757/250000 < c₂₃ < 249758/250000
           and, from the s₁₂ bracket,
           973949/10⁶ < c₁₂ < 973950/10⁶
           (c₁₂² · 10¹² ∈ (10¹² − 226765², 10¹² − 226764²));
    (iii)  the Jarlskog suppression product
           𝓜 = c₁₂ c₂₃ c₁₃² s₁₂ s₂₃ s₁₃:
           3.6404×10⁻⁵ < 𝓜 < 3.6409×10⁻⁵ in cleared integer form;
    (iv)   the holonomy phase-difference tables of both sectors, in
           twelfths of π: Φ⁽ˢ⁾ᵢⱼ = ϑ(QL(i)) − ϑ(siteₛ(j)) with the
           corner pattern ϑ = (0,5,6,11) and the placement maps.
-/

namespace P1L5

/- ------------------------------------------------------------------
   (i) Inputs and Pythagorean complements, cleared denominators.
   ------------------------------------------------------------------ -/

/-- s₂₃² + c₂₃² = 1 over 62500: 11² + 62379 = 250². -/
theorem pyth_23 : 11^2 + 62379 = 250^2 := by decide

/-- s₁₃² + c₁₃² = 1 over 640000: 3² + 639991 = 800². -/
theorem pyth_13 : 3^2 + 639991 = 800^2 := by decide

/-- s₂₃ = 11/250 is the stated 0.0440: 11·10⁴ = 440·250. -/
theorem s23_value : 11 * 10^4 = 440 * 250 := by decide

/-- s₁₃ = 3/800 is the stated 0.00375: 3·10⁵ = 375·800. -/
theorem s13_value : 3 * 10^5 = 375 * 800 := by decide

/- ------------------------------------------------------------------
   (ii) Square-root brackets (cleared): c = √N / D with
   c₁₂: N = 14841·10⁶, D = 125000; c₂₃: N = 62379·10⁶, D = 250000.
   ------------------------------------------------------------------ -/

/-- c₁₂ bracket from the derived s₁₂ bracket:
    c₁₂²·10¹² ∈ (10¹² − 226765², 10¹² − 226764²), and
    973949² < 10¹² − 226765², 10¹² − 226764² < 973950². -/
theorem c12_lo : 973949^2 < 10^12 - 226765^2 := by decide
theorem c12_hi : (10^12 - 226764^2 : Int) < 973950^2 := by decide
theorem c23_lo : 249757^2 < 62379 * 10^6 := by decide
theorem c23_hi : 62379 * 10^6 < 249758^2 := by decide

/- ------------------------------------------------------------------
   (iii) The suppression product 𝓜.
   s-product: (28/125)(11/250)(3/800) = 924/25 000 000 = 231/6 250 000.
   𝓜 bracket: with c₁₂ ∈ (121823, 121824)/125000,
   c₂₃ ∈ (249757, 249758)/250000, c₁₃² = 639991/640000 exact:
   num_lo = 121823·249757·639991·231,
   num_hi = 121824·249758·639991·231,
   den    = 125000·250000·640000·6250000 = 125·10²¹·? (kernel decides),
   certify 35984·den < num_lo·10⁹ and num_hi·10⁹ < 35987·den.
   ------------------------------------------------------------------ -/

def den : Int := 10^6 * 250 * 800 * 10^6 * 250000 * 640000
def numLo : Int := 226764 * 11 * 3 * 973949 * 249757 * 639991
def numHi : Int := 226765 * 11 * 3 * 973950 * 249758 * 639991

/-- 𝓜 > 3.6404×10⁻⁵. -/
theorem M_lo : 36404 * den < numLo * 10^9 := by decide

/-- 𝓜 < 3.6409×10⁻⁵. -/
theorem M_hi : numHi * 10^9 < 36409 * den := by decide

/- ------------------------------------------------------------------
   (iv) Phase-difference tables (twelfths of π).
   Corners P₁..P₄ ↦ 0..3; ϑ = (0,5,6,11); QL = (P₁,P₂,P₃);
   uR = (P₁,P₂,P₃); dR = (P₂,P₁,P₄).
   ------------------------------------------------------------------ -/

def theta : Fin 4 → Int
  | 0 => 0 | 1 => 5 | 2 => 6 | 3 => 11

def QL : Fin 3 → Fin 4
  | 0 => 0 | 1 => 1 | 2 => 2

def uR : Fin 3 → Fin 4
  | 0 => 0 | 1 => 1 | 2 => 2

def dR : Fin 3 → Fin 4
  | 0 => 1 | 1 => 0 | 2 => 3

def phiU (i j : Fin 3) : Int := theta (QL i) - theta (uR j)
def phiD (i j : Fin 3) : Int := theta (QL i) - theta (dR j)

/-- Up-sector table: rows (0,−5,−6), (5,0,−1), (6,1,0). -/
theorem phiU_table :
    phiU 0 0 = 0 ∧ phiU 0 1 = -5 ∧ phiU 0 2 = -6 ∧
    phiU 1 0 = 5 ∧ phiU 1 1 = 0  ∧ phiU 1 2 = -1 ∧
    phiU 2 0 = 6 ∧ phiU 2 1 = 1  ∧ phiU 2 2 = 0 := by decide

/-- Down-sector table: rows (−5,0,−11), (0,5,−6), (1,6,−5). -/
theorem phiD_table :
    phiD 0 0 = -5 ∧ phiD 0 1 = 0 ∧ phiD 0 2 = -11 ∧
    phiD 1 0 = 0  ∧ phiD 1 1 = 5 ∧ phiD 1 2 = -6 ∧
    phiD 2 0 = 1  ∧ phiD 2 1 = 6 ∧ phiD 2 2 = -5 := by decide

/-- Antisymmetry of the up table (a closed-circuit consistency:
    the plaquette telescoping of Proposition 7.x). -/
theorem phiU_antisym : ∀ i j, phiU i j = -phiU j i := by decide

end P1L5
