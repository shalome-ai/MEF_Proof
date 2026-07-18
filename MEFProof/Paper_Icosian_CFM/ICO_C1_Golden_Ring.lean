/-
  ICO_C1 : Golden ring identities
  Source: The_Icosian_Completion_of_K8_v2.tex
    - Lemma 0 (lem:ring): Z[phi^{±2}] = Z[phi] = O_F           [R]
    - Theorem thm:q5 Step 4 golden identities                   [R]
  Encoding: Zphi := Int × Int, with (a, b) representing a + b·phi,
    multiplication induced by phi² = phi + 1:
    (a + b·phi)(c + d·phi) = (ac + bd) + (ad + bc + bd)·phi.
  Deflationary reading: the certificate verifies the ring identities that
  constitute the entire mathematical content of Lemma 0's one-line proof
  (phi = phi² − 1 and phi⁻² = 2 − phi, hence Z[phi^{±2}] ⊇ Z[phi] and
  equality) together with the three golden identities consumed by
  Theorem thm:q5 Step 4. The identification of (Int × Int, zmul) with the
  ring of integers of Q(√5) is the standard presentation and is
  human-auditable; maximality of Z[phi] in Q(√5) is classical and not
  re-certified here.
  Lean 4.15.0 core only. No axioms beyond kernel defaults. Zero sorry.
-/

namespace ICOC1

/-- Z[phi] as pairs (a,b) = a + b·phi. -/
abbrev Zphi := Int × Int

def zmul (x y : Zphi) : Zphi :=
  (x.1 * y.1 + x.2 * y.2, x.1 * y.2 + x.2 * y.1 + x.2 * y.2)

def zadd (x y : Zphi) : Zphi := (x.1 + y.1, x.2 + y.2)

def zsub (x y : Zphi) : Zphi := (x.1 - y.1, x.2 - y.2)

def phi  : Zphi := (0, 1)
def one  : Zphi := (1, 0)

/-- phi² = phi + 1 (the defining relation, checked against the encoding). -/
theorem phi_sq : zmul phi phi = (1, 1) := by decide

/-- phi = phi² − 1 : phi lies in Z[phi²]. Core of Lemma 0. -/
theorem phi_in_ring_of_phi_sq : zsub (zmul phi phi) one = phi := by decide

/-- phi⁻¹ = phi − 1 : phi·(phi − 1) = 1. -/
theorem phi_inv : zmul phi (-1, 1) = one := by decide

/-- phi⁻² = 2 − phi : (2 − phi)·phi² = 1. Core of Lemma 0
    (phi⁻² ∈ Z[phi], i.e. Z[phi^{±2}] needs no denominators). -/
theorem phi_inv_sq : zmul (2, -1) (zmul phi phi) = one := by decide

/-- phi² + phi⁻² = 3 = tr M  (integrality closure of q₅, Step 4). -/
theorem trace_M_identity : zadd (zmul phi phi) (2, -1) = (3, 0) := by decide

/-- (phi + phi⁻¹)² = (2·phi − 1)² = 5 = disc Q(√5)  (Step 4). -/
theorem disc_identity : zmul (-1, 2) (-1, 2) = (5, 0) := by decide

/-- (2 − phi)(2 + phi) = 3 − phi  (the sine identity of Step 4:
    (3 − phi) = phi⁻²(2 + phi)). -/
theorem sine_identity : zmul (2, -1) (2, 1) = (3, -1) := by decide

#print axioms phi_sq
#print axioms phi_in_ring_of_phi_sq
#print axioms phi_inv
#print axioms phi_inv_sq
#print axioms trace_M_identity
#print axioms disc_identity
#print axioms sine_identity

end ICOC1
