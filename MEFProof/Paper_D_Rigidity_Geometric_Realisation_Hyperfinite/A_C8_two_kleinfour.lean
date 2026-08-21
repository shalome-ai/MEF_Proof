/-
  A_C8_two_kleinfour.lean  —  Paper A certificate C8.
  Statements certified (Paper A §4, two Klein four-groups). Standalone;
  index conventions match A_C4:
    Q₈ on Fin 8:  0 ↦ 1, 1 ↦ −1, 2 ↦ i, 3 ↦ −i, 4 ↦ j, 5 ↦ −j, 6 ↦ k, 7 ↦ −k.
    (1) the right multiplications realise the Q₈ multiplication table with
        reversed order (anti-homomorphism), verified on the basis vectors
                                                        [rmul_anti_hom]
    (2) the quotient of the index group by the centre is the Klein
        four-group: the pair map g ↦ ⌊g/2⌋ intertwines the Q₈ table with
        the (ℤ/2)² addition table                       [quotient_klein]
    (3) no non-identity right multiplication is unital, so the module
        Klein four-group meets the automorphism group only in the
        identity: a single evaluation at 1 separates every non-identity
        ρ(g) from every Ad_u simultaneously             [unitality_separates]
    (4) the non-multiplicativity witness:
        ρ(i)(j·j) = −i  while  (j i)(j i) = −1          [witness].
  The Ad_u closed forms and the Q₈ table were generated from the
  quaternion multiplication and cross-checked before transcription.
  Lean 4.15.0, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC8

structure Quat where
  a : Int
  b : Int
  c : Int
  d : Int
deriving DecidableEq

def qmul (x y : Quat) : Quat :=
  ⟨ x.a * y.a - x.b * y.b - x.c * y.c - x.d * y.d
  , x.a * y.b + x.b * y.a + x.c * y.d - x.d * y.c
  , x.a * y.c - x.b * y.d + x.c * y.a + x.d * y.b
  , x.a * y.d + x.b * y.c - x.c * y.b + x.d * y.a ⟩

/-- The eight elements of Q₈, indexed as in A_C4. -/
def q8 : Fin 8 → Quat
  | ⟨0, _⟩ => ⟨1, 0, 0, 0⟩  | ⟨1, _⟩ => ⟨-1, 0, 0, 0⟩
  | ⟨2, _⟩ => ⟨0, 1, 0, 0⟩  | ⟨3, _⟩ => ⟨0, -1, 0, 0⟩
  | ⟨4, _⟩ => ⟨0, 0, 1, 0⟩  | ⟨5, _⟩ => ⟨0, 0, -1, 0⟩
  | ⟨6, _⟩ => ⟨0, 0, 0, 1⟩  | ⟨7, _⟩ => ⟨0, 0, 0, -1⟩

/-- The Q₈ multiplication table on indices, generated from `qmul`. -/
def q8m : Fin 8 → Fin 8 → Fin 8
  | ⟨0, _⟩, h => h
  | ⟨1, _⟩, ⟨0,_⟩ => 1 | ⟨1, _⟩, ⟨1,_⟩ => 0 | ⟨1, _⟩, ⟨2,_⟩ => 3
  | ⟨1, _⟩, ⟨3,_⟩ => 2 | ⟨1, _⟩, ⟨4,_⟩ => 5 | ⟨1, _⟩, ⟨5,_⟩ => 4
  | ⟨1, _⟩, ⟨6,_⟩ => 7 | ⟨1, _⟩, ⟨7,_⟩ => 6
  | ⟨2, _⟩, ⟨0,_⟩ => 2 | ⟨2, _⟩, ⟨1,_⟩ => 3 | ⟨2, _⟩, ⟨2,_⟩ => 1
  | ⟨2, _⟩, ⟨3,_⟩ => 0 | ⟨2, _⟩, ⟨4,_⟩ => 6 | ⟨2, _⟩, ⟨5,_⟩ => 7
  | ⟨2, _⟩, ⟨6,_⟩ => 5 | ⟨2, _⟩, ⟨7,_⟩ => 4
  | ⟨3, _⟩, ⟨0,_⟩ => 3 | ⟨3, _⟩, ⟨1,_⟩ => 2 | ⟨3, _⟩, ⟨2,_⟩ => 0
  | ⟨3, _⟩, ⟨3,_⟩ => 1 | ⟨3, _⟩, ⟨4,_⟩ => 7 | ⟨3, _⟩, ⟨5,_⟩ => 6
  | ⟨3, _⟩, ⟨6,_⟩ => 4 | ⟨3, _⟩, ⟨7,_⟩ => 5
  | ⟨4, _⟩, ⟨0,_⟩ => 4 | ⟨4, _⟩, ⟨1,_⟩ => 5 | ⟨4, _⟩, ⟨2,_⟩ => 7
  | ⟨4, _⟩, ⟨3,_⟩ => 6 | ⟨4, _⟩, ⟨4,_⟩ => 1 | ⟨4, _⟩, ⟨5,_⟩ => 0
  | ⟨4, _⟩, ⟨6,_⟩ => 2 | ⟨4, _⟩, ⟨7,_⟩ => 3
  | ⟨5, _⟩, ⟨0,_⟩ => 5 | ⟨5, _⟩, ⟨1,_⟩ => 4 | ⟨5, _⟩, ⟨2,_⟩ => 6
  | ⟨5, _⟩, ⟨3,_⟩ => 7 | ⟨5, _⟩, ⟨4,_⟩ => 0 | ⟨5, _⟩, ⟨5,_⟩ => 1
  | ⟨5, _⟩, ⟨6,_⟩ => 3 | ⟨5, _⟩, ⟨7,_⟩ => 2
  | ⟨6, _⟩, ⟨0,_⟩ => 6 | ⟨6, _⟩, ⟨1,_⟩ => 7 | ⟨6, _⟩, ⟨2,_⟩ => 4
  | ⟨6, _⟩, ⟨3,_⟩ => 5 | ⟨6, _⟩, ⟨4,_⟩ => 3 | ⟨6, _⟩, ⟨5,_⟩ => 2
  | ⟨6, _⟩, ⟨6,_⟩ => 1 | ⟨6, _⟩, ⟨7,_⟩ => 0
  | ⟨7, _⟩, ⟨0,_⟩ => 7 | ⟨7, _⟩, ⟨1,_⟩ => 6 | ⟨7, _⟩, ⟨2,_⟩ => 5
  | ⟨7, _⟩, ⟨3,_⟩ => 4 | ⟨7, _⟩, ⟨4,_⟩ => 2 | ⟨7, _⟩, ⟨5,_⟩ => 3
  | ⟨7, _⟩, ⟨6,_⟩ => 0 | ⟨7, _⟩, ⟨7,_⟩ => 1

/-- The table is the quaternion multiplication. -/
theorem q8m_correct : ∀ g h : Fin 8, q8 (q8m g h) = qmul (q8 g) (q8 h) := by
  decide

/-- Right multiplication by the Q₈ element with index g. -/
def rmulG (g : Fin 8) (x : Quat) : Quat := qmul x (q8 g)

/-- The automorphisms Ad_1, Ad_i, Ad_j, Ad_k (the group V of A_C4,
    closed forms generated from u x u⁻¹). -/
def adG : Fin 4 → Quat → Quat
  | ⟨0, _⟩, x => x
  | ⟨1, _⟩, x => ⟨x.a, x.b, -x.c, -x.d⟩
  | ⟨2, _⟩, x => ⟨x.a, -x.b, x.c, -x.d⟩
  | ⟨3, _⟩, x => ⟨x.a, -x.b, -x.c, x.d⟩

/-- The basis vectors 1, i, j, k. -/
def basisQ : Fin 4 → Quat
  | ⟨0, _⟩ => ⟨1, 0, 0, 0⟩ | ⟨1, _⟩ => ⟨0, 1, 0, 0⟩
  | ⟨2, _⟩ => ⟨0, 0, 1, 0⟩ | ⟨3, _⟩ => ⟨0, 0, 0, 1⟩

/-- The closed forms are u x u⁻¹ (with u⁻¹ = ū = −u for the imaginary
    units), verified on the basis vectors. -/
theorem adG_is_conjugation :
    ∀ (e : Fin 4),
      adG 1 (basisQ e) = qmul (qmul ⟨0,1,0,0⟩ (basisQ e)) ⟨0,-1,0,0⟩ ∧
      adG 2 (basisQ e) = qmul (qmul ⟨0,0,1,0⟩ (basisQ e)) ⟨0,0,-1,0⟩ ∧
      adG 3 (basisQ e) = qmul (qmul ⟨0,0,0,1⟩ (basisQ e)) ⟨0,0,0,-1⟩ := by
  decide

/-- (1)  On the basis vectors, the right multiplications compose with
    reversed order: ρ(g) ∘ ρ(h) = ρ(hg). Linearity extends this to all
    quaternions in the paper. -/
theorem rmul_anti_hom :
    ∀ (g h : Fin 8) (e : Fin 4),
      rmulG g (rmulG h (basisQ e)) = rmulG (q8m h g) (basisQ e) := by
  decide

/-- (2)  The pair map g ↦ ⌊g/2⌋ carries the Q₈ table to the Klein
    four-group ((ℤ/2)², written as the XOR table on Fin 4): the quotient
    by the centre {±1} is the Klein four-group. -/
def pairIdx (g : Fin 8) : Fin 4 := ⟨g.val / 2, by omega⟩
def v4add : Fin 4 → Fin 4 → Fin 4
  | ⟨0, _⟩, h => h
  | ⟨1, _⟩, ⟨0,_⟩ => 1 | ⟨1, _⟩, ⟨1,_⟩ => 0 | ⟨1, _⟩, ⟨2,_⟩ => 3 | ⟨1, _⟩, ⟨3,_⟩ => 2
  | ⟨2, _⟩, ⟨0,_⟩ => 2 | ⟨2, _⟩, ⟨1,_⟩ => 3 | ⟨2, _⟩, ⟨2,_⟩ => 0 | ⟨2, _⟩, ⟨3,_⟩ => 1
  | ⟨3, _⟩, ⟨0,_⟩ => 3 | ⟨3, _⟩, ⟨1,_⟩ => 2 | ⟨3, _⟩, ⟨2,_⟩ => 1 | ⟨3, _⟩, ⟨3,_⟩ => 0

theorem quotient_klein :
    ∀ g h : Fin 8, pairIdx (q8m g h) = v4add (pairIdx g) (pairIdx h) := by
  decide

/-- Every element of the Klein four-group squares to the identity. -/
theorem v4_involutive : ∀ v : Fin 4, v4add v v = 0 := by decide

/-- (3)  Evaluation at 1 separates the two Klein four-groups: every Ad_u
    fixes 1, while ρ(g)(1) = g ≠ 1 for every g ≠ 1 (and in particular for
    −id = ρ(−1)). Hence no non-identity right multiplication is an
    algebra endomorphism, and the module group meets the automorphism
    group only in the identity. -/
theorem unitality_separates :
    ∀ g : Fin 8, g ≠ 0 → ∀ u : Fin 4,
      rmulG g ⟨1, 0, 0, 0⟩ ≠ adG u ⟨1, 0, 0, 0⟩ := by
  decide

/-- (4)  The non-multiplicativity witness of Paper A §4:
    ρ(i)(j·j) = −i, while ρ(i)(j)·ρ(i)(j) = (ji)(ji) = −1. -/
theorem witness :
    rmulG 2 (qmul ⟨0,0,1,0⟩ ⟨0,0,1,0⟩) = ⟨0, -1, 0, 0⟩ ∧
    qmul (rmulG 2 ⟨0,0,1,0⟩) (rmulG 2 ⟨0,0,1,0⟩) = ⟨-1, 0, 0, 0⟩ ∧
    (⟨0, -1, 0, 0⟩ : Quat) ≠ ⟨-1, 0, 0, 0⟩ := by
  decide

#print axioms q8m_correct
#print axioms adG_is_conjugation
#print axioms rmul_anti_hom
#print axioms quotient_klein
#print axioms v4_involutive
#print axioms unitality_separates
#print axioms witness

end AC8
