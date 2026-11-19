/-
  M2_L4_whole.lean — Paper M2, card S04d: the pieces together (the unfolded
  geometry and its spinor bundle).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and integer arithmetic of the proof of
  Proposition `prop:whole` (write-up log M2-W054 to M2-W062, as logged), with
  A = M0³ the map by which the fibre is joined to itself once round the time
  circle (M1 Corollary 7.8).

  * A − I = 4·U with U = [[3, 2], [2, 1]] (`L4_A_minus_I`); det U = −1
    (`L4_U_det`); U·U' = U'·U = I for U' = [[−1, 2], [2, −3]]
    (`L4_U_inverse`); A = U·U (`L4_A_is_U_squared`).
  * The row vector (μ, ν) times A is (13μ + 8ν, 8μ + 5ν)
    (`L4_winding_after_A`): the integers of p ↦ β(A p), by hand, for a
    function β with the integers μ, ν.
  * For integers μ, ν there are integers μ', ν' with
    (μ, ν)·A = (μ', ν')·(A − I) exactly when 4 divides μ and 4 divides ν
    (`L4_criterion`); for (μ, ν) = (4a, 4b) the pair is (3a + 2b, 2a + b)
    (`L4_witness`).
  * There are sixteen pairs (μ, ν) with 0 ≤ μ, ν ≤ 3 (`L4_sixteen`), and two
    of them whose differences are both divisible by 4 are equal
    (`L4_sixteen_distinct`).
  * The integers: (3 + 2n₁, 2 + 2n₂, 2n₃) = (3, 2, 6) exactly when
    (n₁, n₂, n₃) = (0, 0, 3) (`L4_integers`).
  * Counts: 3 + 3 + 4 + 2 = 12 = 1 + 3 + 4 + 2 + 2, and the slices have
    dimensions 9 and 11 (`L4_dimensions`); 2¹·2⁵ = 2⁶ (`L4_ranks`); the
    ranks of the cohomology of S¹ × S³ in degree two add up to 0
    (`L4_S1S3_degree_two`), those of S¹ being 1, 1 and those of S³ being
    1, 0, 0, 1 (by hand, from the cited theorems).

  What is not certified: the cited theorems (Hatcher; Nicolaescu; Gompf;
  Segal); M1's results; anything about continuity, exponentials, logarithms,
  real or complex numbers, bundles, lifts, Clifford algebras or Spin^c
  structures: only the integer arithmetic written here is certified.
-/

namespace M2L4

/-- 2 × 2 integer matrices as (a, b, c, d) = [[a, b], [c, d]]. -/
abbrev Mat := Int × Int × Int × Int

def mmul (x y : Mat) : Mat :=
  let (a, b, c, d) := x
  let (e, f, g, h) := y
  (a * e + b * g, a * f + b * h, c * e + d * g, c * f + d * h)

def det (x : Mat) : Int :=
  let (a, b, c, d) := x
  a * d - b * c

def A : Mat := (13, 8, 8, 5)
def Id : Mat := (1, 0, 0, 1)
def U : Mat := (3, 2, 2, 1)
def U' : Mat := (-1, 2, 2, -3)

/-- A − I = 4·U, entry by entry. -/
theorem L4_A_minus_I :
    (13 - 1 : Int) = 4 * 3 ∧ (8 : Int) = 4 * 2 ∧ (8 : Int) = 4 * 2 ∧ (5 - 1 : Int) = 4 * 1 := by
  decide

theorem L4_U_det : det U = -1 := by decide

theorem L4_U_inverse : mmul U U' = Id ∧ mmul U' U = Id := by decide

theorem L4_A_is_U_squared : mmul U U = A := by decide

/-- The row vector (μ, ν) times a matrix. -/
def rowMul (v : Int × Int) (x : Mat) : Int × Int :=
  let (a, b, c, d) := x
  (v.1 * a + v.2 * c, v.1 * b + v.2 * d)

theorem L4_winding_after_A (μ ν : Int) :
    rowMul (μ, ν) A = (13 * μ + 8 * ν, 8 * μ + 5 * ν) := by
  simp only [rowMul, A]
  congr 1 <;> omega

/-- (μ, ν)·A = (μ', ν')·(A − I) has a solution in integers exactly when
    4 divides μ and 4 divides ν.  Here (μ', ν')·(A − I) = (12μ' + 8ν', 8μ' + 4ν'). -/
theorem L4_criterion (μ ν : Int) :
    (∃ μ' ν' : Int, 13 * μ + 8 * ν = 12 * μ' + 8 * ν' ∧ 8 * μ + 5 * ν = 8 * μ' + 4 * ν')
      ↔ (∃ a b : Int, μ = 4 * a ∧ ν = 4 * b) := by
  constructor
  · intro ⟨m, n, h1, h2⟩
    exact ⟨-m + 2 * n, 2 * m - 3 * n, by omega, by omega⟩
  · intro ⟨a, b, ha, hb⟩
    exact ⟨3 * a + 2 * b, 2 * a + b, by omega, by omega⟩

theorem L4_witness (a b : Int) :
    13 * (4 * a) + 8 * (4 * b) = 12 * (3 * a + 2 * b) + 8 * (2 * a + b)
      ∧ 8 * (4 * a) + 5 * (4 * b) = 8 * (3 * a + 2 * b) + 4 * (2 * a + b) := by
  constructor <;> omega

/-- The pairs (μ, ν) with 0 ≤ μ, ν ≤ 3. -/
def residues : List (Nat × Nat) :=
  (List.range 4).flatMap fun m => (List.range 4).map fun n => (m, n)

theorem L4_sixteen : residues.length = 16 := by decide

theorem L4_sixteen_distinct (μ₁ ν₁ μ₂ ν₂ k l : Int)
    (h1 : 0 ≤ μ₁ ∧ μ₁ ≤ 3) (h2 : 0 ≤ ν₁ ∧ ν₁ ≤ 3)
    (h3 : 0 ≤ μ₂ ∧ μ₂ ≤ 3) (h4 : 0 ≤ ν₂ ∧ ν₂ ≤ 3)
    (hk : μ₁ - μ₂ = 4 * k) (hl : ν₁ - ν₂ = 4 * l) :
    μ₁ = μ₂ ∧ ν₁ = ν₂ := by
  constructor <;> omega

theorem L4_integers (n₁ n₂ n₃ : Int) :
    (3 + 2 * n₁ = 3 ∧ 2 + 2 * n₂ = 2 ∧ 2 * n₃ = 6) ↔ (n₁ = 0 ∧ n₂ = 0 ∧ n₃ = 3) := by
  constructor
  · intro ⟨h1, h2, h3⟩
    exact ⟨by omega, by omega, by omega⟩
  · intro ⟨h1, h2, h3⟩
    exact ⟨by omega, by omega, by omega⟩

theorem L4_dimensions :
    3 + 3 + 4 + 2 = 12 ∧ 1 + 3 + 4 + 2 + 2 = 12 ∧ 3 + 4 + 2 = 9 ∧ 2 + 3 + 4 + 2 = 11 := by
  decide

theorem L4_ranks : 2 ^ 1 * 2 ^ 5 = 2 ^ 6 ∧ 2 ^ 6 = 64 := by decide

/-- Ranks of the cohomology of S¹ (degrees 0, 1, 2) and of S³ (degrees 0, 1, 2);
    the rank of the product in degree two is the sum over i + j = 2. -/
theorem L4_S1S3_degree_two :
    let s1 : List Nat := [1, 1, 0]
    let s3 : List Nat := [1, 0, 0]
    s1[0]! * s3[2]! + s1[1]! * s3[1]! + s1[2]! * s3[0]! = 0 := by
  decide

end M2L4
