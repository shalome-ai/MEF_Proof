/-
  ICO_C4 : Lipschitz units cannot see the 3-cycle
  Source: The_Icosian_Completion_of_K8_v2.tex
    - Lemma 2 (lem:blind): the conjugation action of L¹ = Q₈ on the set
      of imaginary axes {R·i, R·j, R·k} is trivial                [R]
  Encoding: integral quaternions as 4-tuples over Int with Hamilton
    multiplication; for a unit u with nrd(u) = 1, u⁻¹ = conj(u), so
    conjugation is x ↦ u·x·conj(u). Axis preservation of the line R·e is
    the statement u·e·conj(u) = e ∨ u·e·conj(u) = −e.
  Deflationary reading: the certificate verifies, by exhaustive
  computation over the eight Lipschitz units and three imaginary basis
  units, that conjugation preserves every axis as a line (at most
  reversing orientation). Hence the induced homomorphism
  Q₈ → Sym{R·i, R·j, R·k} is trivial, and no Lipschitz unit realises any
  3-cycle of the corner sub-algebras — the exact content of Lemma 2. The
  passage from axes to corner sub-algebras C_i, C_j, C_k is the corner
  dictionary and is human-auditable.
  Lean 4.15.0 core only. No axioms beyond kernel defaults. Zero sorry.
-/

namespace ICOC4

structure Q where
  r : Int
  i : Int
  j : Int
  k : Int
deriving DecidableEq

def qmul (a b : Q) : Q :=
  ⟨a.r * b.r - a.i * b.i - a.j * b.j - a.k * b.k,
   a.r * b.i + a.i * b.r + a.j * b.k - a.k * b.j,
   a.r * b.j + a.j * b.r + a.k * b.i - a.i * b.k,
   a.r * b.k + a.k * b.r + a.i * b.j - a.j * b.i⟩

def qconj (a : Q) : Q := ⟨a.r, -a.i, -a.j, -a.k⟩

def qneg (a : Q) : Q := ⟨-a.r, -a.i, -a.j, -a.k⟩

def nrd (a : Q) : Int := a.r * a.r + a.i * a.i + a.j * a.j + a.k * a.k

/-- The eight Lipschitz units: Q₈ = {±1, ±i, ±j, ±k}. -/
def Q8 : List Q :=
  [⟨1,0,0,0⟩, ⟨-1,0,0,0⟩, ⟨0,1,0,0⟩, ⟨0,-1,0,0⟩,
   ⟨0,0,1,0⟩, ⟨0,0,-1,0⟩, ⟨0,0,0,1⟩, ⟨0,0,0,-1⟩]

/-- The three imaginary basis units (axis representatives). -/
def axes : List Q := [⟨0,1,0,0⟩, ⟨0,0,1,0⟩, ⟨0,0,0,1⟩]

/-- Every Lipschitz unit has reduced norm 1 (so u⁻¹ = conj u). -/
theorem Q8_norm_one : ∀ u ∈ Q8, nrd u = 1 := by decide

/-- Axis triviality: for every u ∈ Q₈ and every imaginary basis unit e,
    conjugation preserves the axis R·e as a line:
    u·e·u⁻¹ ∈ {e, −e}.  Hence Q₈ → Sym{axes} is trivial and no
    Lipschitz unit realises a 3-cycle of the axes. -/
theorem axis_trivial :
    ∀ u ∈ Q8, ∀ e ∈ axes,
      qmul (qmul u e) (qconj u) = e ∨ qmul (qmul u e) (qconj u) = qneg e := by
  decide

/-- Sharpness (the paper's example): conjugation by i reverses j and k
    while fixing i — orientation flips occur, axis exchanges never. -/
theorem conj_i_flips :
    qmul (qmul ⟨0,1,0,0⟩ ⟨0,0,1,0⟩) (qconj ⟨0,1,0,0⟩) = qneg ⟨0,0,1,0⟩ ∧
    qmul (qmul ⟨0,1,0,0⟩ ⟨0,0,0,1⟩) (qconj ⟨0,1,0,0⟩) = qneg ⟨0,0,0,1⟩ ∧
    qmul (qmul ⟨0,1,0,0⟩ ⟨0,1,0,0⟩) (qconj ⟨0,1,0,0⟩) = ⟨0,1,0,0⟩ := by decide

#print axioms Q8_norm_one
#print axioms axis_trivial
#print axioms conj_i_flips

end ICOC4
