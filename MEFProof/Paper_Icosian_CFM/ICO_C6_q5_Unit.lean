/-
  ICO_C6 : The canonical trace-phi unit q₅
  Source: The_Icosian_Completion_of_K8_v2.tex
    - Theorem 2 (thm:q5), Verification block V1–V3:
        V1: nrd(q₅) = 1                                          [R]
        V2: trd(q₅) = phi; companion trd(q₅²) = phi − 1 (GR-5)   [R]
        V3: q₅² = phi·q₅ − 1, q₅⁵ = −1, ord(q₅) = 10             [R]
  Encoding: quaternions over Z[phi] as 4-tuples of Zphi := Int × Int
  (see ICO_C1 for the ring encoding), Hamilton multiplication with Zphi
  coefficient arithmetic. All elements scaled by 2 to clear the half:
    q₅ = ½(phi + phi⁻¹·i + j)  is represented by
    Q5 := (phi, phi − 1, 1, 0)  —  recall phi⁻¹ = phi − 1.
  Under scaling: nrd(q₅) = 1 ⟺ nrd(Q5) = 4;  trd(q₅) = phi ⟺ Q5.r = phi;
  q₅ⁿ = c ⟺ Q5ⁿ = 2ⁿ·c;  the minimal polynomial q₅² = phi·q₅ − 1 scales
  to Q5² = 2phi·Q5 − 4.
  Deflationary reading: the geometric construction of q₅ (axis selection
  via the Sol unstable eigenvector, Step 1; the transport-principle
  inputs; the angle convention GR-1) is NOT certified — those steps are
  [D]/[M] and human-auditable. Certified here is the complete algebraic
  verification block: the exhibited element has reduced norm 1, reduced
  trace phi, satisfies the golden minimal polynomial, has fifth power −1
  and order exactly 10 = ord(M mod p₅) (matching ICO_C3), with the GR-5
  companion trace phi − 1 for q₅².
  Lean 4.15.0 core only. No axioms beyond kernel defaults. Zero sorry.
-/

namespace ICOC6

/-- Z[phi] as pairs (a,b) = a + b·phi; see ICO_C1. -/
abbrev Zphi := Int × Int

def zmul (x y : Zphi) : Zphi :=
  (x.1 * y.1 + x.2 * y.2, x.1 * y.2 + x.2 * y.1 + x.2 * y.2)

def zadd (x y : Zphi) : Zphi := (x.1 + y.1, x.2 + y.2)
def zsub (x y : Zphi) : Zphi := (x.1 - y.1, x.2 - y.2)

structure QF where
  r : Zphi
  i : Zphi
  j : Zphi
  k : Zphi
deriving DecidableEq

def qmul (a b : QF) : QF :=
  ⟨zsub (zsub (zsub (zmul a.r b.r) (zmul a.i b.i)) (zmul a.j b.j)) (zmul a.k b.k),
   zsub (zadd (zadd (zmul a.r b.i) (zmul a.i b.r)) (zmul a.j b.k)) (zmul a.k b.j),
   zsub (zadd (zadd (zmul a.r b.j) (zmul a.j b.r)) (zmul a.k b.i)) (zmul a.i b.k),
   zsub (zadd (zadd (zmul a.r b.k) (zmul a.k b.r)) (zmul a.i b.j)) (zmul a.j b.i)⟩

def nrd (a : QF) : Zphi :=
  zadd (zadd (zadd (zmul a.r a.r) (zmul a.i a.i)) (zmul a.j a.j)) (zmul a.k a.k)

def qpow : Nat → QF → QF
  | 0,     _ => ⟨(1,0), (0,0), (0,0), (0,0)⟩
  | n + 1, a => qmul (qpow n a) a

/-- Q5 = 2·q₅ = (phi, phi⁻¹, 1, 0) = ((0,1), (−1,1), (1,0), (0,0)). -/
def Q5 : QF := ⟨(0,1), (-1,1), (1,0), (0,0)⟩

/-- Scalar 2ⁿ as a quaternion, for the scaling bookkeeping. -/
def scalar (c : Zphi) : QF := ⟨c, (0,0), (0,0), (0,0)⟩

/-! ## V1 : reduced norm -/

/-- nrd(q₅) = 1: scaled, nrd(Q5) = phi² + phi⁻² + 1 = 3 + 1 = 4. -/
theorem V1_norm : nrd Q5 = (4, 0) := by decide

/-! ## V2 : reduced trace -/

/-- trd(q₅) = phi: the real part of Q5 = 2q₅ is phi. -/
theorem V2_trace : Q5.r = (0, 1) := by decide

/-- GR-5 companion: trd(q₅²) = phi − 1 (order-5 adjunction is the square
    of the order-10 unit). Scaled: (Q5²).r = 4·(q₅²).r = 2(phi − 1). -/
theorem V2_companion_trace : (qmul Q5 Q5).r = (-2, 2) := by decide

/-! ## V3 : minimal polynomial, fifth power, order -/

/-- q₅² = phi·q₅ − 1. Scaled: Q5² = 2phi·Q5 − 4·1. -/
theorem V3_minpoly :
    qmul Q5 Q5 = ⟨zsub (zmul (0,2) (0,1)) (4,0),
                  zmul (0,2) (-1,1), zmul (0,2) (1,0), (0,0)⟩ := by decide

/-- q₅⁵ = −1. Scaled: Q5⁵ = 2⁵·(−1) = −32. -/
theorem V3_fifth_power : qpow 5 Q5 = scalar (-32, 0) := by decide

/-- q₅¹⁰ = 1. Scaled: Q5¹⁰ = 2¹⁰ = 1024. -/
theorem V3_tenth_power : qpow 10 Q5 = scalar (1024, 0) := by decide

/-- Order exactly 10: q₅ᵏ ≠ 1 for 1 ≤ k ≤ 9
    (scaled: Q5ᵏ ≠ 2ᵏ; suffices for k ∈ {1, 2, 5}, the maximal proper
    divisors of 10, but all nine are checked). -/
theorem V3_order_exact :
    qpow 1 Q5 ≠ scalar (2, 0) ∧ qpow 2 Q5 ≠ scalar (4, 0) ∧
    qpow 3 Q5 ≠ scalar (8, 0) ∧ qpow 4 Q5 ≠ scalar (16, 0) ∧
    qpow 5 Q5 ≠ scalar (32, 0) ∧ qpow 6 Q5 ≠ scalar (64, 0) ∧
    qpow 7 Q5 ≠ scalar (128, 0) ∧ qpow 8 Q5 ≠ scalar (256, 0) ∧
    qpow 9 Q5 ≠ scalar (512, 0) := by decide

/- Cross-certificate note (commentary, not a theorem): ord(q₅) = 10
   here matches ord(M mod p₅) = 10 in ICO_C3, and q₅⁵ = −1 mirrors
   M⁵ ≡ −I there. The spinorial-faithfulness principle TP(b) linking the
   two is [D] and is not certified; the numerical match of orders and
   central signs is what the two certificates jointly establish. -/

#print axioms V1_norm
#print axioms V2_trace
#print axioms V2_companion_trace
#print axioms V3_minpoly
#print axioms V3_fifth_power
#print axioms V3_tenth_power
#print axioms V3_order_exact

end ICOC6
