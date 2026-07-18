/-
  ICO_C3 : Arithmetic witnesses at the ramified prime (mod-5 shadow)
  Source: The_Icosian_Completion_of_K8_v2.tex, §"Arithmetic witnesses"
    - W-1 : order(M mod 5) = 10, M⁵ ≡ −I (mod 5)                 [R]
    - W-2 : eigenvalue collision phi^{±2} ≡ 4 (mod p₅)           [R]
    - W-3 : σ = M⁵ on 5-torsion                                  [R]
    - W-4 : σ free on non-zero 5-torsion; fixed classes on the
            eigenline span{(1,2)}; two 5-cycles                  [R]
  Encoding: F₅ = Fin 5 with modular arithmetic; M (x, y) = (2x + y, x + y);
    the residue-field image of phi is 3 (since √5 = 2·phi − 1 ≡ 0 and
    2·3 ≡ 1); negation written 0 − x; pillowcase classes are ±-pairs, so
    class-level fixedness is M v = v ∨ M v = −v, and the 5-cycle chains
    close up to sign.
  Deflationary reading: all statements are finite F₅ computations. The
  identification of T²[5] with F₅², and of the pillowcase involution σ
  with v ↦ −v, is the standard torsion coordinatisation and is
  human-auditable. Order exactly 10 follows from M¹⁰ = I with M, M², M⁵
  all ≠ I (the proper divisors of 10).
  Lean 4.15.0 core only. No axioms beyond kernel defaults. Zero sorry.
-/

namespace ICOC3

/-- M mod 5: (x, y) ↦ (2x + y, x + y). -/
def M (v : Fin 5 × Fin 5) : Fin 5 × Fin 5 := (2 * v.1 + v.2, v.1 + v.2)

/-- n-fold iterate of M. -/
def Mpow : Nat → (Fin 5 × Fin 5) → Fin 5 × Fin 5
  | 0,     v => v
  | n + 1, v => M (Mpow n v)

def neg (v : Fin 5 × Fin 5) : Fin 5 × Fin 5 := (0 - v.1, 0 - v.2)

/-! ## W-1 : order 10, with M⁵ ≡ −I -/

/-- Characteristic polynomial collapses at 5: x² − 3x + 1 = (x − 4)² over F₅. -/
theorem charpoly_square : ∀ x : Fin 5, x * x - 3 * x + 1 = (x - 4) * (x - 4) := by
  decide

/-- M⁵ = −I on F₅². -/
theorem M5_eq_neg_id : ∀ x y : Fin 5, Mpow 5 (x, y) = neg (x, y) := by decide

/-- M¹⁰ = I on F₅². -/
theorem M10_eq_id : ∀ x y : Fin 5, Mpow 10 (x, y) = (x, y) := by decide

/-- M ≠ I, M² ≠ I, M⁵ ≠ I: with M¹⁰ = I this gives order(M) = 10 exactly
    (the proper divisors of 10 are 1, 2, 5). -/
theorem order_exactly_ten :
    (¬ ∀ x y : Fin 5, Mpow 1 (x, y) = (x, y)) ∧
    (¬ ∀ x y : Fin 5, Mpow 2 (x, y) = (x, y)) ∧
    (¬ ∀ x y : Fin 5, Mpow 5 (x, y) = (x, y)) := by decide

/-! ## W-2 : eigenvalue collision at the ramified prime -/

/-- phi ↦ 3 in the residue field: √5 = 2·phi − 1 ≡ 0 (mod p₅). -/
theorem phi_residue : (2 : Fin 5) * 3 - 1 = 0 := by decide

/-- phi² ≡ 4 and phi⁻² = 2 − phi ≡ 4: the two Sol eigenvalues collide. -/
theorem eigenvalue_collision :
    (3 : Fin 5) * 3 = 4 ∧ (2 : Fin 5) - 3 = 4 := by decide

/-- The collided eigenvalue is 4 = −1 in F₅. -/
theorem collided_is_neg_one : (4 : Fin 5) = 0 - 1 := by decide

/-! ## W-3 : σ = M⁵ on the 5-torsion -/

/-- The involution v ↦ −v coincides with M⁵ on F₅² (restatement of
    M5_eq_neg_id in the form of W-3). -/
theorem sigma_eq_M5 : ∀ x y : Fin 5, neg (x, y) = Mpow 5 (x, y) := by decide

/-! ## W-4 : orbit structure on the 12 pillowcase classes -/

/-- σ is free on non-zero 5-torsion: −v = v → v = 0
    (hence 24 non-zero points descend to 12 classes). -/
theorem sigma_free : ∀ x y : Fin 5, neg (x, y) = (x, y) → x = 0 ∧ y = 0 := by
  decide

/-- Class-level fixed points of M: exactly the classes of ±(1,2) and
    ±(2,4), i.e. the non-zero points of the eigenline span{(1,2)}. -/
theorem fixed_classes :
    ∀ x y : Fin 5, (M (x, y) = (x, y) ∨ M (x, y) = neg (x, y)) ↔
      ((x, y) = ((0 : Fin 5), (0 : Fin 5)) ∨ (x, y) = (1, 2) ∨ (x, y) = (4, 3) ∨
       (x, y) = (2, 4) ∨ (x, y) = (3, 1)) := by decide

/-- The mod-5 eigenline: M v = 4·v exactly on span{(1,2)}. -/
theorem eigenline :
    ∀ x y : Fin 5, M (x, y) = (4 * x, 4 * y) ↔
      ((x, y) = ((0 : Fin 5), (0 : Fin 5)) ∨ (x, y) = (1, 2) ∨ (x, y) = (2, 4) ∨
       (x, y) = (3, 1) ∨ (x, y) = (4, 3)) := by decide

/-- First 5-cycle: {±(1,0)} → {±(2,1)} → {±(0,3)} → {±(3,3)} → {±(4,1)} →
    back (the wrap closes up to sign, i.e. at class level). -/
theorem five_cycle_one :
    M (1, 0) = (2, 1) ∧ M (2, 1) = (0, 3) ∧ M (0, 3) = (3, 3) ∧
    M (3, 3) = (4, 1) ∧ M (4, 1) = neg (1, 0) := by decide

/-- Second 5-cycle: {±(0,1)} → {±(1,1)} → {±(3,2)} → {±(3,0)} → {±(1,3)} →
    back (up to sign). -/
theorem five_cycle_two :
    M (0, 1) = (1, 1) ∧ M (1, 1) = (3, 2) ∧ M (3, 2) = (3, 0) ∧
    M (3, 0) = (1, 3) ∧ M (1, 3) = neg (0, 1) := by decide

#print axioms charpoly_square
#print axioms M5_eq_neg_id
#print axioms M10_eq_id
#print axioms order_exactly_ten
#print axioms phi_residue
#print axioms eigenvalue_collision
#print axioms collided_is_neg_one
#print axioms sigma_eq_M5
#print axioms sigma_free
#print axioms fixed_classes
#print axioms eigenline
#print axioms five_cycle_one
#print axioms five_cycle_two

end ICOC3
