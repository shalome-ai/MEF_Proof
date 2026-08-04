/- CERT-W4 (+W6): finite Fourier arithmetic of def:corner-sector,
   lem:same-vector and lem:rho-nontrivial (core Lean, no Mathlib).
   Certifies: the character pairing of the weight vector w = ((-1)^{mn})
   evaluates to (2,2,2,-2); its twisted sum-zero projection is non-zero
   (integer-scaled form); the pairing is invariant under the six
   GL(2,F₂) elements paired with their transpose-inverses; and the R8
   witness vector ((-1)^m) has pairing (0,4,0,0) with non-zero sum-zero
   projection. Which vector the geometry and the spectrum present is the
   human-audited identification, outside scope. -/

namespace CertW4

/-- (-1)^x for a Boolean exponent. -/
def ch (x : Bool) : Int := if x then -1 else 1

/-- The pairing exponent mn + ma + nb, as a parity. -/
def wPair (m n a b : Bool) : Int :=
  ch (xor (and m n) (xor (and m a) (and n b)))

/-- DFT of w over the four corners. -/
def what (a b : Bool) : Int :=
  wPair false false a b + wPair true false a b +
  wPair false true a b + wPair true true a b

theorem dft_w :
    (what false false, what true false, what false true, what true true)
      = (2, 2, 2, -2) := by decide

/-- Sum-zero projection of the twisted part (2,2,-2), scaled by 3. -/
theorem w_sumzero_nonzero :
    (3*2 - (2+2+(-2)), 3*2 - (2+2+(-2)), 3*(-2) - (2+2+(-2)))
      = ((4:Int), 4, -8) ∧ ((4:Int), 4, -8) ≠ (0, 0, 0) := by decide

/-- 2×2 matrices over F₂ as Boolean quadruples (p,q,r,s) = [[p,q],[r,s]]. -/
def act (M : Bool × Bool × Bool × Bool) (v : Bool × Bool) : Bool × Bool :=
  (xor (and M.1 v.1) (and M.2.1 v.2),
   xor (and M.2.2.1 v.1) (and M.2.2.2 v.2))

/-- Transpose-inverse over F₂ for det = 1: (p,q,r,s) ↦ (s,r,q,p). -/
def dual (M : Bool × Bool × Bool × Bool) : Bool × Bool × Bool × Bool :=
  (M.2.2.2, M.2.2.1, M.2.1, M.1)

/-- The bilinear pairing on F₂². -/
def form (x y : Bool × Bool) : Bool :=
  xor (and x.1 y.1) (and x.2 y.2)

def allv : List (Bool × Bool) :=
  [(false, false), (true, false), (false, true), (true, true)]

def checkInv (M : Bool × Bool × Bool × Bool) : Bool :=
  allv.all fun x => allv.all fun y =>
    form (act M x) (act (dual M) y) == form x y

/-- The six elements of GL(2,F₂). -/
def gl2f2 : List (Bool × Bool × Bool × Bool) :=
  [(true, false, false, true), (true, true, false, true),
   (false, true, true, false), (true, false, true, true),
   (true, true, true, false), (false, true, true, true)]

/-- Pairing invariance ⟨gx, (gᵀ)⁻¹y⟩ = ⟨x,y⟩ for all six group elements. -/
theorem pairing_equivariance : gl2f2.all checkInv = true := by decide

/-- CERT-W6: the R8 witness vector ((-1)^m) and its pairing. -/
def vPair (m n a b : Bool) : Int := ch (xor m (xor (and m a) (and n b)))

def vhat (a b : Bool) : Int :=
  vPair false false a b + vPair true false a b +
  vPair false true a b + vPair true true a b

theorem witness_dft :
    (vhat false false, vhat true false, vhat false true, vhat true true)
      = (0, 4, 0, 0) := by decide

theorem witness_sumzero_nonzero :
    (3*4 - (4+0+0), 3*0 - (4+0+0), 3*0 - (4+0+0)) = ((8:Int), -4, -4) ∧
    ((8:Int), -4, -4) ≠ (0, 0, 0) := by decide

#print axioms dft_w
#print axioms pairing_equivariance
#print axioms witness_dft

end CertW4
