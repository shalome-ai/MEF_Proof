/- CERT-W3: finite group theory of lem:sector-class (core Lean, no Mathlib).
   Certifies the mod-2 actions of T and S on the two-torsion labels: fixed
   points, transpositions, and that the induced permutations of the three
   non-zero vectors are six pairwise-distinct maps (hence all of S₃).
   The identification with the modular permutation of sector functions
   (thm:genus-jacobi) is the cited/derived input, outside scope. -/

namespace CertW3

def Tact (v : Bool × Bool) : Bool × Bool := (xor v.1 v.2, v.2)
def Sact (v : Bool × Bool) : Bool × Bool := (v.2, v.1)

theorem T_fixes : Tact (true, false) = (true, false) := rfl
theorem T_swaps :
    Tact (false, true) = (true, true) ∧ Tact (true, true) = (false, true) :=
  ⟨rfl, rfl⟩
theorem S_fixes : Sact (true, true) = (true, true) := rfl
theorem S_swaps :
    Sact (true, false) = (false, true) ∧ Sact (false, true) = (true, false) :=
  ⟨rfl, rfl⟩

/-- A word in the generators (true = T, false = S), acting on a vector. -/
def word (l : List Bool) (v : Bool × Bool) : Bool × Bool :=
  l.foldl (fun w b => if b then Tact w else Sact w) v

/-- Signature of a word: its images on the three non-zero vectors. -/
def sig (l : List Bool) : List (Bool × Bool) :=
  [word l (true, false), word l (false, true), word l (true, true)]

/-- Six words with pairwise-distinct signatures: the group generated is S₃. -/
theorem six_distinct :
    [sig [], sig [true], sig [false], sig [true, false],
     sig [false, true], sig [true, false, true]].Pairwise (· ≠ ·) := by decide

#print axioms T_fixes
#print axioms six_distinct

end CertW3
