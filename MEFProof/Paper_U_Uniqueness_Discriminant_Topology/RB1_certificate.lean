/-
  RB1_certificate.lean — Lean 4 (Mathlib)
  Work package RB-1: the assembled discriminant and the counting check.

  WHAT THIS CERTIFICATE PROVES (finite/decidable layer only):
  (1) THE STAR: the monomial count of the truncated polynomial ring
      ℚ[x,y,z]/(x³, y², z²) with |x| = |y| = |z| = 2 is exactly
      (1, 0, 3, 0, 4, 0, 3, 0, 1) — i.e. the Betti match of
      Proposition rb1:ring is equivalent to the complement carrying
      this ring, and the arithmetic of that equivalence is machine-
      verified. Also: the count agrees with the Poincaré product
      (1+t²+t⁴)(1+t²)(1+t²), the two computations being independent.
  (2) Parity selection bookkeeping (Lemma rb1:parity): the fibre
      σ-parity of a label pair decides coupling; opposite-parity
      pairs are excluded; the parity of the shifted label is the
      parity of 2n−3, odd for every n — the arithmetical core reused
      from lem:strat-eps.
  (3) Stratum codimension arithmetic (Remark rb1:free): generic
      complex Hermitian strata sit at codimensions 3, 6, 8; the link
      cohomologies S², S²×S², (S²)³ have even Betti lists only, each
      verified by list convolution.

  WHAT THIS CERTIFICATE DOES NOT PROVE:
  the collapse statements C1–C4/C6, the NDC integrals, the ring
  isomorphism itself, or anything analytic about the operator family.
-/
import Mathlib

namespace RB1

/- ------------------------------------------------------------------
   §1  The star: monomial count of ℚ[x,y,z]/(x³,y²,z²)
   ------------------------------------------------------------------ -/

/-- Exponent triples (a, b, c) with a ≤ 2, b ≤ 1, c ≤ 1: the monomial
    basis of the truncated ring. -/
def monomials : List (ℕ × ℕ × ℕ) :=
  [(0,0,0), (0,0,1), (0,1,0), (0,1,1),
   (1,0,0), (1,0,1), (1,1,0), (1,1,1),
   (2,0,0), (2,0,1), (2,1,0), (2,1,1)]

theorem monomials_count : monomials.length = 12 := by decide

theorem monomials_nodup : monomials.Nodup := by decide

/-- The list is exactly the full exponent box {0,1,2}×{0,1}×{0,1}. -/
theorem monomials_complete :
    ∀ a b c : ℕ, (a, b, c) ∈ monomials ↔ (a ≤ 2 ∧ b ≤ 1 ∧ c ≤ 1) := by
  decide

/-- Cohomological degree of a monomial: 2(a + b + c). -/
def degreeOf (m : ℕ × ℕ × ℕ) : ℕ := 2 * (m.1 + m.2.1 + m.2.2)

/-- Count of monomials in each degree 0..8. -/
def bettiOfRing : List ℕ :=
  (List.range 9).map (fun d => (monomials.filter (fun m => degreeOf m = d)).length)

/-- **The counting check**: the truncated ring realises exactly the
    Betti sequence of K₈. -/
theorem ring_betti_match : bettiOfRing = [1, 0, 3, 0, 4, 0, 3, 0, 1] := by
  decide

/-- Independent route: the Poincaré product of the three factors. -/
def addLists : List ℕ → List ℕ → List ℕ
  | [], ys => ys
  | xs, [] => xs
  | x :: xs, y :: ys => (x + y) :: addLists xs ys

def polymul : List ℕ → List ℕ → List ℕ
  | [], _ => []
  | x :: xs, b => addLists (b.map (x * ·)) (0 :: polymul xs b)

theorem two_routes_agree :
    bettiOfRing = polymul (polymul [1,0,1,0,1] [1,0,1]) [1,0,1] := by
  decide

theorem total_twelve : bettiOfRing.sum = 12 := by decide

/- ------------------------------------------------------------------
   §2  Parity selection (Lemma rb1:parity)
   ------------------------------------------------------------------ -/

/-- The shifted-label parity is the parity of 2n − 3, odd for every
    integer n: the arithmetical fact of lem:strat-eps, reused. -/
theorem shifted_label_odd (n : ℤ) : ¬ (2 ∣ (2 * n - 3)) := by
  intro ⟨k, hk⟩
  omega

/-- Coupling is decided by equality of fibre parities; a pair of
    opposite parities is excluded. Formal schema over any label type
    with a parity map. -/
theorem parity_selection {L : Type*} (par : L → Bool)
    (couple : L → L → Prop)
    (hsel : ∀ k k', couple k k' → par k = par k') :
    ∀ k k', par k ≠ par k' → ¬ couple k k' :=
  fun k k' hne hc => hne (hsel k k' hc)

/- ------------------------------------------------------------------
   §3  Stratum arithmetic (Remark rb1:free)
   ------------------------------------------------------------------ -/

/-- Codimensions of the generic strata: single crossing 3, transverse
    double point 3 + 3 = 6, triple degeneracy of a 3×3 Hermitian
    block 8 = 3² − 1. -/
theorem stratum_codims :
    (3 : ℕ) + 3 = 6 ∧ (3 : ℕ) ^ 2 - 1 = 8 := by decide

/-- Link Betti lists: S² = (1,0,1); S²×S² = (1,0,2,0,1);
    (S²)³ = (1,0,3,0,3,0,1). All odd entries vanish: the links carry
    even cohomology only, so the complement acquires no odd classes
    from generic strata. -/
def s2 : List ℕ := [1, 0, 1]

theorem link_double : polymul s2 s2 = [1, 0, 2, 0, 1] := by decide

theorem link_triple : polymul (polymul s2 s2) s2 = [1, 0, 3, 0, 3, 0, 1] := by
  decide

theorem links_even :
    (polymul s2 s2)[1]? = some 0 ∧ (polymul s2 s2)[3]? = some 0
      ∧ (polymul (polymul s2 s2) s2)[1]? = some 0
      ∧ (polymul (polymul s2 s2) s2)[3]? = some 0
      ∧ (polymul (polymul s2 s2) s2)[5]? = some 0 := by decide

end RB1
