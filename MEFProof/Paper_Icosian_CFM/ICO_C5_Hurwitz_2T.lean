/-
  ICO_C5 : Half-integer Hurwitz units and the binary tetrahedral group
  Source: The_Icosian_Completion_of_K8_v2.tex
    - Lemma 3 (lem:rigidity), algebraic part: every u ∈ U has
      nrd(u) = 1, trd(u) = ±1, and u − ϖ₀ ∈ L                    [R]
    - Theorem 1 (thm:hurwitz)(ii), computational support:
      2T is closed, contains Q₈ and ϖ₀, |2T| = 24                [R]
    - §"One transport, two evaluations", direct check:
      conj_{ϖ₀} realises (i j k); conj_ϖ realises (i k j);
      ϖ = ϖ₀², ϖ³ = 1                                            [R]
  Encoding: all quaternions scaled by 2 to clear half-integer
  denominators: an element u is represented by 2u ∈ Int⁴. Then
    nrd(u) = 1        ⟺  nrd(2u) = 4,
    trd(u) = ±1       ⟺  (2u).r = ±1,
    u − ϖ₀ ∈ L        ⟺  all coordinates of 2u − 2ϖ₀ are even,
    u·v (both scaled) :   (2u)(2v) = 4uv = 2·(2uv), so closure of 2T reads
                          qmul x y ∈ (S2T scaled by 2),
    u·e·u⁻¹ = f (nrd 1):  (2u)(2e)conj(2u) = 8·(u e u⁻¹) = 8f.
  Deflationary reading: the SO(3) rotation classification of Lemma 3
  (that ANY inner 3-cycle realisation lies in F^× · U) is geometric and
  is NOT re-certified; certified here are the algebraic facts about U and
  2T that the classification lands on, the group table facts used in
  Theorem 1(ii), and the explicit conjugation realisation used to
  discharge H1. |⟨Q₈, u₀⟩| = 24 then follows from: 2T closed (a finite
  closed subset of a group containing 1 and inverses is a subgroup),
  Q₈ ∪ {ϖ₀} ⊆ 2T, |2T| = 24, together with the classical group theory
  stated in the paper.
  Lean 4.15.0 core only. No axioms beyond kernel defaults. Zero sorry.
-/

namespace ICOC5

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

def qdouble (a : Q) : Q := ⟨2 * a.r, 2 * a.i, 2 * a.j, 2 * a.k⟩

def nrd (a : Q) : Int := a.r * a.r + a.i * a.i + a.j * a.j + a.k * a.k

/-- The sixteen half-integer Hurwitz units, scaled by 2:
    U = {½(ε₀ + ε₁ i + ε₂ j + ε₃ k)}, represented as (ε₀, ε₁, ε₂, ε₃). -/
def U16 : List Q :=
  [⟨1,1,1,1⟩, ⟨1,1,1,-1⟩, ⟨1,1,-1,1⟩, ⟨1,1,-1,-1⟩,
   ⟨1,-1,1,1⟩, ⟨1,-1,1,-1⟩, ⟨1,-1,-1,1⟩, ⟨1,-1,-1,-1⟩,
   ⟨-1,1,1,1⟩, ⟨-1,1,1,-1⟩, ⟨-1,1,-1,1⟩, ⟨-1,1,-1,-1⟩,
   ⟨-1,-1,1,1⟩, ⟨-1,-1,1,-1⟩, ⟨-1,-1,-1,1⟩, ⟨-1,-1,-1,-1⟩]

/-- 2T scaled by 2: the eight scaled Lipschitz units {±2, ±2i, ±2j, ±2k}
    together with the sixteen scaled half-integer units. |2T| = 24. -/
def S2T : List Q :=
  [⟨2,0,0,0⟩, ⟨-2,0,0,0⟩, ⟨0,2,0,0⟩, ⟨0,-2,0,0⟩,
   ⟨0,0,2,0⟩, ⟨0,0,-2,0⟩, ⟨0,0,0,2⟩, ⟨0,0,0,-2⟩] ++ U16

/-- ϖ₀ = ½(1 + i + j + k), scaled: 2ϖ₀ = (1,1,1,1). -/
def w0 : Q := ⟨1,1,1,1⟩

/-- ϖ = ½(−1 + i + j + k), scaled: 2ϖ = (−1,1,1,1). -/
def w : Q := ⟨-1,1,1,1⟩

/-! ## Lemma 3, algebraic part: the sixteen units -/

/-- Every u ∈ U has nrd(u) = 1 (scaled: nrd(2u) = 4) and trd(u) = ±1
    (scaled: real part ±1). -/
theorem U16_norm_trace :
    ∀ x ∈ U16, nrd x = 4 ∧ (x.r = 1 ∨ x.r = -1) := by decide

/-- Every u ∈ U satisfies u − ϖ₀ ∈ L: all coordinates of 2u − 2ϖ₀ are
    even. Hence L + Z·u = L + Z·ϖ₀ = H for every single u ∈ U. -/
theorem U16_diff_integral :
    ∀ x ∈ U16, (x.r - w0.r) % 2 = 0 ∧ (x.i - w0.i) % 2 = 0 ∧
               (x.j - w0.j) % 2 = 0 ∧ (x.k - w0.k) % 2 = 0 := by decide

/-! ## Theorem 1(ii) support: 2T as a group of order 24 -/

/-- |2T| = 24 with no repeats. -/
theorem S2T_card : S2T.length = 24 ∧ S2T.Nodup := by decide

/-- Multiplicative closure: for x, y ∈ 2T (scaled), the product
    (2x')(2y') = 2·(2·x'y') lands in the doubled list — i.e. 2T is closed
    under multiplication. -/
theorem S2T_closed :
    ∀ x ∈ S2T, ∀ y ∈ S2T, qmul x y ∈ S2T.map qdouble := by decide

/-- 2T contains the scaled Lipschitz unit group Q₈ and the generator ϖ₀:
    Q₈ ∪ {ϖ₀} ⊆ 2T, so ⟨Q₈, ϖ₀⟩ ⊆ 2T with |2T| = 24. -/
theorem S2T_contains :
    (⟨2,0,0,0⟩ : Q) ∈ S2T ∧ (⟨0,2,0,0⟩ : Q) ∈ S2T ∧
    (⟨0,0,2,0⟩ : Q) ∈ S2T ∧ (⟨0,0,0,2⟩ : Q) ∈ S2T ∧
    w0 ∈ S2T ∧ w ∈ S2T := by decide

/-! ## The two evaluations: the ϖ realisation (H1 discharge, direct check) -/

/-- ϖ = ϖ₀² (scaled: (2ϖ₀)² = 4ϖ = 2·(2ϖ)). -/
theorem w0_sq : qmul w0 w0 = qdouble w := by decide

/-- ϖ³ = 1 (scaled: (2ϖ)³ = 8) and ϖ₀ has order 6 with ϖ₀³ = −1
    (scaled: (2ϖ₀)³ = −8): the level-2 central sign is invisible —
    both signs are compatible, exactly as stated in §twoeval. -/
theorem w_cubed :
    qmul (qmul w w) w = ⟨8,0,0,0⟩ ∧ qmul (qmul w0 w0) w0 = ⟨-8,0,0,0⟩ := by
  decide

/-- conj_{ϖ₀} realises the axis 3-cycle (i j k):
    ϖ₀ i ϖ₀⁻¹ = j, ϖ₀ j ϖ₀⁻¹ = k, ϖ₀ k ϖ₀⁻¹ = i
    (scaled: (2ϖ₀)(2e)conj(2ϖ₀) = 8·image). -/
theorem w0_realises_ijk :
    qmul (qmul w0 ⟨0,2,0,0⟩) (qconj w0) = ⟨0,0,8,0⟩ ∧
    qmul (qmul w0 ⟨0,0,2,0⟩) (qconj w0) = ⟨0,0,0,8⟩ ∧
    qmul (qmul w0 ⟨0,0,0,2⟩) (qconj w0) = ⟨0,8,0,0⟩ := by decide

/-- conj_ϖ = conj_{ϖ₀²} realises the opposite 3-cycle (i k j):
    ϖ i ϖ⁻¹ = k, ϖ k ϖ⁻¹ = j, ϖ j ϖ⁻¹ = i — precisely the sub-algebra
    cycle eq:cycle forced by the mod-2 Sol shadow. -/
theorem w_realises_ikj :
    qmul (qmul w ⟨0,2,0,0⟩) (qconj w) = ⟨0,0,0,8⟩ ∧
    qmul (qmul w ⟨0,0,0,2⟩) (qconj w) = ⟨0,0,8,0⟩ ∧
    qmul (qmul w ⟨0,0,2,0⟩) (qconj w) = ⟨0,8,0,0⟩ := by decide

#print axioms U16_norm_trace
#print axioms U16_diff_integral
#print axioms S2T_card
#print axioms S2T_closed
#print axioms S2T_contains
#print axioms w0_sq
#print axioms w_cubed
#print axioms w0_realises_ijk
#print axioms w_realises_ikj

end ICOC5
