/- CERT-W9: dimension bookkeeping of lem:antiinv, with the spines of
   prop:torsion-class and prop:sector-decomp (core Lean, no Mathlib).
   The generators of the de Rham complex of T² are the monomials
   dx^a ∧ dy^b, (a,b) ∈ {0,1}², of degree a+b; the involution
   σ(x,y) = (-x,-y) acts on the generator by the sign (-1)^(a+b).
   Certifies: the anti-invariant dimension count (0,2,0), the invariant
   count (1,0,1), their complementation in (1,2,1); the k = 0 forcing
   clause (no σ-odd base-constant class); and the degree count
   2 + 3 = 5 of the interior representative. The identification of the
   twisted cohomology of the quotient with the anti-invariant
   cohomology of the cover (Kawasaki), and the geometric membership
   clauses of prop:torsion-class, are human-audited inputs, outside
   scope. -/

/-- The four generators as (a, b) ∈ Bool²; degree and σ-sign. -/
def gens : List (Bool × Bool) :=
  [(false, false), (true, false), (false, true), (true, true)]

def deg (g : Bool × Bool) : Nat :=
  (if g.1 then 1 else 0) + (if g.2 then 1 else 0)

/-- σ-sign on the generator: (-1)^(a+b). -/
def sgn (g : Bool × Bool) : Int := if (deg g) % 2 = 0 then 1 else -1

def antiDim (k : Nat) : Nat :=
  (gens.filter (fun g => deg g == k && sgn g == -1)).length

def invDim (k : Nat) : Nat :=
  (gens.filter (fun g => deg g == k && sgn g == 1)).length

def totDim (k : Nat) : Nat :=
  (gens.filter (fun g => deg g == k)).length

/-- lem:antiinv: the anti-invariant dimensions are (0, 2, 0). -/
theorem antiinv_dims : (antiDim 0, antiDim 1, antiDim 2) = (0, 2, 0) := by
  decide

/-- prop:sector-decomp spine: the invariant dimensions are (1, 0, 1),
    complementary to (0, 2, 0) in the total (1, 2, 1). -/
theorem inv_dims : (invDim 0, invDim 1, invDim 2) = (1, 0, 1) := by decide

theorem complementation :
    (antiDim 0 + invDim 0, antiDim 1 + invDim 1, antiDim 2 + invDim 2)
      = (totDim 0, totDim 1, totDim 2) ∧
    (totDim 0, totDim 1, totDim 2) = (1, 2, 1) := by decide

/-- prop:torsion-class spine, clause 1: the degree count 2 + 3 = 5. -/
theorem degree_count : 2 + 3 = 5 := rfl

/-- prop:torsion-class spine, clause 2 (the forcing): the σ-odd space
    in degree zero is empty — a base-constant class admits no σ-odd
    representative. -/
theorem no_odd_constants : antiDim 0 = 0 := by decide

#print axioms antiinv_dims
#print axioms inv_dims
#print axioms complementation
#print axioms no_odd_constants
