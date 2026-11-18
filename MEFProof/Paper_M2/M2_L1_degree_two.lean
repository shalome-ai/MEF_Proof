/-
  M2_L1_degree_two.lean — Paper M2, card S04: where states live (the base,
  space, and the fibre before it is folded).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite count of `papers/M2/checks/S04_degree_two.py`,
  used in the proofs of Proposition `prop:basespace` (write-up log M2-W008;
  its proof M2-W020, which replaces M2-W009, retired at Decision Log P195,
  M2-W010, M2-W011) and of Proposition `prop:unfolded` (M2-W013; its proof
  M2-W014, M2-W015).

  * The ranks of the integer cohomology groups of the factors are written in
    as inputs, degree by degree: CP² has rank 1 in degrees 0, 2, 4 (Hatcher,
    Theorem 3.19, n = 2); S^n has rank 1 in degrees 0 and n (Hatcher,
    Corollaries 2.14 and 3.3), for n = 1, 2, 3.
  * The Künneth formula for free, finitely generated cohomology (Hatcher,
    Theorem 3.15) gives the rank of a product in degree k as the coefficient
    of t^k in the product of the polynomials of the factors; the products are
    computed here.
  * (1) CP² × S² × S³ (M2-W020): rank 0 in degree one
    (`L1_base_space_degree_one`), rank 2 in degree two
    (`L1_base_space_degree_two`), the two classes of degree two coming one
    from CP² and one from S² (`L1_base_space_sources`); total rank 12
    (`L1_base_space_total`).
  * (2) CP² × S² × S³ × S¹ × S¹, the torus T² = S¹ × S¹ before it is folded
    (M2-W014): rank 2 in degree one (`L1_unfolded_degree_one`), rank 3 in
    degree two (`L1_unfolded_degree_two`), one class from each of CP², S² and
    the torus (`L1_unfolded_sources`), and no mixed term: no class of degree
    two has degree one on the torus and degree one elsewhere
    (`L1_unfolded_no_mixed_term`).

  What is not certified: the cited theorems (Hatcher, Theorems 3.15 and 3.19,
  Corollaries 2.14 and 3.3); that the groups are free (an input, from the same
  citations); Gompf's Proposition 1 and anything about Spin^c structures:
  only the finite count written here is certified.
-/

namespace M2L1

/-- The rank of the cohomology group of degree `d` of a factor, read from its list. -/
def coeff (p : List Nat) (d : Nat) : Nat := p.getD d 0

/-- The product of two rank polynomials (the Künneth count for free groups). -/
def mul (p q : List Nat) : List Nat :=
  (List.range (p.length + q.length - 1)).map fun k =>
    ((List.range (k + 1)).map fun i => coeff p i * coeff q (k - i)).foldl (· + ·) 0

/-- The product of a list of factors. -/
def prodAll : List (List Nat) → List Nat
  | [] => [1]
  | p :: ps => mul p (prodAll ps)

/-- CP²: rank 1 in degrees 0, 2, 4 (Hatcher, Theorem 3.19, n = 2). -/
def CP2 : List Nat := [1, 0, 1, 0, 1]
/-- S²: rank 1 in degrees 0 and 2. -/
def S2 : List Nat := [1, 0, 1]
/-- S³: rank 1 in degrees 0 and 3. -/
def S3 : List Nat := [1, 0, 0, 1]
/-- S¹: rank 1 in degrees 0 and 1. -/
def S1 : List Nat := [1, 1]

/-- The degrees in which a factor has a non-zero group. -/
def supp (p : List Nat) : List Nat := (List.range p.length).filter fun d => coeff p d != 0

/-- The tuples of degrees, one for each factor, at which every factor has a non-zero group. -/
def tuples : List (List Nat) → List (List Nat)
  | [] => [[]]
  | p :: ps => (supp p).flatMap fun d => (tuples ps).map (d :: ·)

/-- The tuples whose degrees add up to `k`: where the classes of degree `k` come from. -/
def sources (fs : List (List Nat)) (k : Nat) : List (List Nat) :=
  (tuples fs).filter fun t => t.foldl (· + ·) 0 == k

def baseSpace : List (List Nat) := [CP2, S2, S3]
def unfolded : List (List Nat) := [CP2, S2, S3, S1, S1]

theorem L1_base_space_degree_one : coeff (prodAll baseSpace) 1 = 0 := by decide

theorem L1_base_space_degree_two : coeff (prodAll baseSpace) 2 = 2 := by decide

/-- The two classes of degree two: degrees (CP², S², S³) = (0, 2, 0) and (2, 0, 0). -/
theorem L1_base_space_sources : sources baseSpace 2 = [[0, 2, 0], [2, 0, 0]] := by decide

theorem L1_base_space_total : (prodAll baseSpace).foldl (· + ·) 0 = 3 * 2 * 2 := by decide

theorem L1_unfolded_degree_one : coeff (prodAll unfolded) 1 = 2 := by decide

theorem L1_unfolded_degree_two : coeff (prodAll unfolded) 2 = 3 := by decide

/-- The three classes of degree two: from CP², from S², and from the torus (degree one on each circle). -/
theorem L1_unfolded_sources :
    sources unfolded 2 = [[0, 0, 0, 1, 1], [0, 2, 0, 0, 0], [2, 0, 0, 0, 0]] := by decide

/-- No mixed term: no class of degree two has degree one on the torus and degree one elsewhere. -/
theorem L1_unfolded_no_mixed_term :
    (sources unfolded 2).all (fun t => t.getD 3 0 + t.getD 4 0 != 1) = true := by decide

end M2L1
