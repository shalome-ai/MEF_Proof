/- CERT-W13: the parity arithmetic of lem:strat-eps (core Lean,
   no Mathlib).
   The conjugation sign is ε_a = (-1)^(exponent/π): along the
   unshifted direction the exponent is 2πm, parity even, sign +1;
   along the shifted direction it is π(2n-3), parity odd, sign -1 —
   because the shift is -c₁(L)/2 = -3/2 with c₁(L) = 3 odd. Both
   parities are certified universally, together with the general
   statement that the shift parity is odd for every odd determinant
   class and even for every even one — the "precisely because c₁(L)
   is odd" clause. The operator identity σt_a = t_{-a}σ and the
   momentum-eigenbasis evaluation are human-audited inputs, outside
   scope. -/

/-- Sign of an integer exponent: (-1)^e as a parity. -/
def esgn (e : Int) : Int := if e % 2 = 0 then 1 else -1

/-- Unshifted direction: the exponent 2m is even, the sign is +1. -/
theorem eps_unshifted (m : Int) : esgn (2 * m) = 1 := by
  simp [esgn]

/-- Shifted direction: the exponent 2n - 3 is odd, the sign is -1. -/
theorem eps_shifted (n : Int) : esgn (2 * n - 3) = -1 := by
  simp [esgn]; omega

/-- The general clause: with determinant class c, the shifted exponent
    is 2n - c; its sign is -1 for every n precisely when c is odd. -/
theorem eps_iff_odd (c : Int) :
    (∀ n : Int, esgn (2 * n - c) = -1) ↔ c % 2 = 1 := by
  constructor
  · intro h
    have h0 := h 0
    simp [esgn] at h0
    omega
  · intro hc n
    simp [esgn]
    omega

/-- The diagonal product: the two shifted half-periods each contribute
    -1 and the unshifted one +1; the product over the two shifted
    directions is +1 and any single shifted conjugation is -1. -/
theorem diagonal_products :
    ((-1 : Int)) * (-1) = 1 ∧ ((1 : Int)) * (-1) = -1 := by decide

#print axioms eps_unshifted
#print axioms eps_shifted
#print axioms eps_iff_odd
#print axioms diagonal_products
