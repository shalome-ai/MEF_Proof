/-
  A_C6_module_parity.lean  —  Paper A certificate C6.
  Two layers, matching Paper A §4 (module actions and parity invariant).

  Matrix layer (4×4 integer model, basis {1, i, j, k}):
    (1) ρ(u)² = −I for u = i, j, k                    [rho_sq]
    (2) λ(p)ρ(q) = ρ(q)λ(p) for p, q ∈ {i, j, k}       [lam_rho_comm]
    (3) ρ(g)ᵀ = ρ(ḡ) on the Q₈-indexed family          [rho_transpose_conj]
        (indices as in A_C4: 0↦1, 1↦−1, 2↦i, 3↦−i, 4↦j, 5↦−j, 6↦k, 7↦−k)

  Action layer (right multiplication on integer quaternions):
    (4) ρ(u)² = −id for each unit u ∈ {i, j, k}        [rmulI_sq etc.]
    (5) the composite of n squares of such actions equals the n-fold
        negation, for every choice function n ↦ uₙ     [iter_parity]
        with period-two behaviour pinning the sign (−1)ⁿ [par_two_step].

  The matrices were generated from the quaternion multiplication table and
  cross-checked numerically (squares, commutation, transposes, and the
  commutant dimension) before transcription.
  Lean 4.15.0, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC6

/- ## Matrix layer -/

/-- 4×4 integer matrices. -/
def Mat4 := Fin 4 → Fin 4 → Int

/-- Matrix product. -/
def mul (A B : Mat4) : Mat4 :=
  fun r c => A r 0 * B 0 c + A r 1 * B 1 c + A r 2 * B 2 c + A r 3 * B 3 c

/-- Transpose. -/
def tr (A : Mat4) : Mat4 := fun r c => A c r

/-- Identity and its negative. -/
def idM : Mat4 := fun r c => if r = c then 1 else 0
def negM (A : Mat4) : Mat4 := fun r c => - A r c

/-- λ(i), λ(j), λ(k): left multiplication in the basis {1, i, j, k}. -/
def lamI : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 1 => -1 | 1, 0 => 1 | 2, 3 => -1 | 3, 2 => 1 | _, _ => 0
def lamJ : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 2 => -1 | 1, 3 => 1 | 2, 0 => 1 | 3, 1 => -1 | _, _ => 0
def lamK : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 3 => -1 | 1, 2 => -1 | 2, 1 => 1 | 3, 0 => 1 | _, _ => 0

/-- ρ(i), ρ(j), ρ(k): right multiplication in the basis {1, i, j, k}. -/
def rhoI : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 1 => -1 | 1, 0 => 1 | 2, 3 => 1 | 3, 2 => -1 | _, _ => 0
def rhoJ : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 2 => -1 | 1, 3 => -1 | 2, 0 => 1 | 3, 1 => 1 | _, _ => 0
def rhoK : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 3 => -1 | 1, 2 => 1 | 2, 1 => -1 | 3, 0 => 1 | _, _ => 0

def lpick : Fin 3 → Mat4
  | ⟨0, _⟩ => lamI | ⟨1, _⟩ => lamJ | ⟨2, _⟩ => lamK
def rpick : Fin 3 → Mat4
  | ⟨0, _⟩ => rhoI | ⟨1, _⟩ => rhoJ | ⟨2, _⟩ => rhoK

/-- (1)  ρ(u)² = −I for every u ∈ {i, j, k}. -/
theorem rho_sq :
    ∀ (m : Fin 3) (r c : Fin 4), mul (rpick m) (rpick m) r c = negM idM r c := by
  decide

/-- The same identity for the left action. -/
theorem lam_sq :
    ∀ (m : Fin 3) (r c : Fin 4), mul (lpick m) (lpick m) r c = negM idM r c := by
  decide

/-- (2)  The left and right actions commute. -/
theorem lam_rho_comm :
    ∀ (a b : Fin 3) (r c : Fin 4),
      mul (lpick a) (rpick b) r c = mul (rpick b) (lpick a) r c := by
  decide

/-- Q₈-indexed family of right multiplications, indices as in A_C4. -/
def rhoG : Fin 8 → Mat4
  | ⟨0, _⟩ => idM        | ⟨1, _⟩ => negM idM
  | ⟨2, _⟩ => rhoI       | ⟨3, _⟩ => negM rhoI
  | ⟨4, _⟩ => rhoJ       | ⟨5, _⟩ => negM rhoJ
  | ⟨6, _⟩ => rhoK       | ⟨7, _⟩ => negM rhoK

/-- Conjugation on the Q₈ indices: fixes ±1, negates the imaginary units. -/
def conjG : Fin 8 → Fin 8
  | ⟨0, _⟩ => 0 | ⟨1, _⟩ => 1 | ⟨2, _⟩ => 3 | ⟨3, _⟩ => 2
  | ⟨4, _⟩ => 5 | ⟨5, _⟩ => 4 | ⟨6, _⟩ => 7 | ⟨7, _⟩ => 6

/-- (3)  ρ(g)ᵀ = ρ(ḡ) throughout the Q₈-indexed family. -/
theorem rho_transpose_conj :
    ∀ (g : Fin 8) (r c : Fin 4), tr (rhoG g) r c = rhoG (conjG g) r c := by
  decide

/- ## Action layer -/

/-- Integer quaternions a + bi + cj + dk. -/
structure Quat where
  a : Int
  b : Int
  c : Int
  d : Int
deriving DecidableEq

/-- Right multiplications by i, j, k, and negation. -/
def rmulI (x : Quat) : Quat := ⟨-x.b,  x.a,  x.d, -x.c⟩
def rmulJ (x : Quat) : Quat := ⟨-x.c, -x.d,  x.a,  x.b⟩
def rmulK (x : Quat) : Quat := ⟨-x.d,  x.c, -x.b,  x.a⟩
def negQ  (x : Quat) : Quat := ⟨-x.a, -x.b, -x.c, -x.d⟩

/-- (4)  Each square is the negation, independently of the unit chosen. -/
theorem rmulI_sq (x : Quat) : rmulI (rmulI x) = negQ x := rfl
theorem rmulJ_sq (x : Quat) : rmulJ (rmulJ x) = negQ x := rfl
theorem rmulK_sq (x : Quat) : rmulK (rmulK x) = negQ x := rfl

def apick : Fin 3 → Quat → Quat
  | ⟨0, _⟩ => rmulI | ⟨1, _⟩ => rmulJ | ⟨2, _⟩ => rmulK

theorem apick_sq : ∀ (m : Fin 3) (x : Quat), apick m (apick m x) = negQ x
  | ⟨0, _⟩, x => rmulI_sq x
  | ⟨1, _⟩, x => rmulJ_sq x
  | ⟨2, _⟩, x => rmulK_sq x

/-- Composite of `n` squares along an arbitrary choice function `f`. -/
def iter (f : Nat → Fin 3) : Nat → Quat → Quat
  | 0, x => x
  | n + 1, x => apick (f n) (apick (f n) (iter f n x))

/-- The `n`-fold negation. -/
def par : Nat → Quat → Quat
  | 0, x => x
  | n + 1, x => negQ (par n x)

/-- (5)  The composite of `n` squares equals the `n`-fold negation, for
    every choice of units and hence in every order and grouping: the sign
    depends only on `n`. -/
theorem iter_parity (f : Nat → Fin 3) : ∀ (n : Nat) (x : Quat),
    iter f n x = par n x
  | 0, _ => rfl
  | n + 1, x => by
      show apick (f n) (apick (f n) (iter f n x)) = negQ (par n x)
      rw [apick_sq (f n) (iter f n x), iter_parity f n x]

/-- Double negation is the identity ... -/
theorem negQ_negQ (x : Quat) : negQ (negQ x) = x := by
  cases x; simp [negQ]

/-- ... so the `n`-fold negation has period two: the sign is (−1)ⁿ. -/
theorem par_two_step (n : Nat) (x : Quat) : par (n + 2) x = par n x := by
  show negQ (negQ (par n x)) = par n x
  exact negQ_negQ (par n x)

theorem par_zero (x : Quat) : par 0 x = x := rfl
theorem par_one (x : Quat) : par 1 x = negQ x := rfl

#print axioms rho_sq
#print axioms lam_sq
#print axioms lam_rho_comm
#print axioms rho_transpose_conj
#print axioms apick_sq
#print axioms iter_parity
#print axioms par_two_step

end AC6
