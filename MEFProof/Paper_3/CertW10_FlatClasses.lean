/- CERT-W10: the 3+1 classification of lem:flat-classes (core Lean,
   no Mathlib).
   Flat ℤ₂ line bundles on the pillowcase are labelled by holonomy
   pairs (ε_ψ, ε_ω) ∈ {±1}², encoded here as Bool² with true ↦ -1.
   Certifies: the involution acts on mod-two cohomology as the
   identity, since -1 ≡ 1 (mod 2), stated universally on integral
   classes; there are exactly four holonomy classes; exactly one is
   trivial (both holonomies +1); and exactly three carry holonomy -1
   around at least one cycle — the 3 + 1 count. The geometric
   identification of the non-trivial total spaces as Möbius bands over
   the corresponding cycles, and of H¹(T²/ℤ₂; ℤ₂) with the two-torsion
   group of the cover, are human-audited inputs, outside scope. -/

namespace CertW10

/-- -1 acts as the identity mod 2: for every integral class n,
    (-1)·n ≡ n (mod 2). -/
theorem sigma_trivial_mod_two (n : Int) : ((-1) * n) % 2 = n % 2 ∨
    ((-1) * n) % 2 = n % 2 - 2 ∨ ((-1) * n) % 2 = n % 2 + 2 := by
  omega

/-- The cleaner parity form: (-n) and n have equal parity. -/
theorem neg_parity (n : Int) : (-n) % 2 = 0 ↔ n % 2 = 0 := by omega

/-- Holonomy labels: (ε_ψ, ε_ω) ∈ {±1}², true ↦ -1. -/
def classes : List (Bool × Bool) :=
  [(false, false), (true, false), (false, true), (true, true)]

def isTrivial (c : Bool × Bool) : Bool := !c.1 && !c.2

/-- Four classes; exactly one trivial; exactly three with holonomy -1
    around at least one cycle: the 3 + 1. -/
theorem three_plus_one :
    classes.length = 4 ∧
    (classes.filter isTrivial).length = 1 ∧
    (classes.filter (fun c => !(isTrivial c))).length = 3 := by decide

/-- The four labels are pairwise distinct — the classification does
    not collapse. -/
theorem classes_distinct : classes.Pairwise (· ≠ ·) := by decide

#print axioms sigma_trivial_mod_two
#print axioms neg_parity
#print axioms three_plus_one
#print axioms classes_distinct

end CertW10
