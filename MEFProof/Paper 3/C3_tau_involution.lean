/-
  C3_tau_involution.lean
  Paper XXII / Paper 3 — consolidation node C3.
  Matrix-algebra and arithmetic core of the companion note "The
  Transpose Anti-Involution on the Hyperfinite Completion".

  Blocks:
    A. Transpose calculus: period two, anti-multiplicativity, unitality,
       additivity, trace preservation.
    B. Tower coherence: (A ⊗ B)ᵀ = Aᵀ ⊗ Bᵀ and the corollary
       (A ⊗ I)ᵀ = Aᵀ ⊗ I.
    C. Trace and dimension bookkeeping: Tr(A ⊗ I₄) = 4·Tr(A);
       4^{n+1} = 4·4ⁿ.
    D. The outerness witness: two non-commuting matrices.
    E. Quaternions: the left-regular matrix L_q, its transpose L_{q̄};
       i² = −1, ij = k, ji = −k; fixed points of conjugation = ℝ.
    F. The fixed locus of ρ(s) = 1 − s̄: involutivity and Re s = ½.

  The certificate covers finite-stage and arithmetic content only. The
  weak closure, GNS construction, Murray–von Neumann uniqueness, and the
  Connes–Størmer classification are cited in the note, not formalised.

  Build: Lean 4 with Mathlib (`import Mathlib`). All goals should be
  accomplished with no `sorry`.
-/
import Mathlib
set_option linter.unusedSectionVars false
set_option linter.unusedFintypeInType false
set_option linter.unusedDecidableInType false

open Matrix
open Kronecker

namespace C3

variable {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m] [DecidableEq n]

/-! ### Block A — transpose calculus -/

/-- Period two: `(Aᵀ)ᵀ = A`. -/
theorem tau_period_two (A : Matrix m m ℝ) : Aᵀᵀ = A :=
  Matrix.transpose_transpose A

/-- Anti-multiplicativity: `(AB)ᵀ = Bᵀ Aᵀ`. -/
theorem tau_anti_mul (A B : Matrix m m ℝ) : (A * B)ᵀ = Bᵀ * Aᵀ :=
  Matrix.transpose_mul A B

/-- Unitality: `1ᵀ = 1`. -/
theorem tau_unital : (1 : Matrix m m ℝ)ᵀ = 1 :=
  Matrix.transpose_one

/-- Additivity: `(A + B)ᵀ = Aᵀ + Bᵀ`. -/
theorem tau_additive (A B : Matrix m m ℝ) : (A + B)ᵀ = Aᵀ + Bᵀ :=
  Matrix.transpose_add A B

/-- Trace preservation: `Tr(Aᵀ) = Tr(A)`. -/
theorem tau_trace (A : Matrix m m ℝ) : Aᵀ.trace = A.trace :=
  Matrix.trace_transpose A

/-! ### Block B — tower coherence -/

/-- Transpose distributes over the Kronecker product:
`(A ⊗ B)ᵀ = Aᵀ ⊗ Bᵀ`. -/
theorem kron_transpose (A : Matrix m m ℝ) (B : Matrix n n ℝ) :
    (A ⊗ₖ B)ᵀ = Aᵀ ⊗ₖ Bᵀ := by
  ext ⟨i1, i2⟩ ⟨j1, j2⟩
  simp [Matrix.transpose_apply, Matrix.kroneckerMap_apply]

/-- Tower coherence: the transpose intertwines the transition map
`ι(A) = A ⊗ I₄` on the nose — `ι(A)ᵀ = ι(Aᵀ)`. This is the exactness
that kills the projective obstruction (clause (ii) of the
classification). -/
theorem tower_coherence (A : Matrix m m ℝ) :
    (A ⊗ₖ (1 : Matrix (Fin 4) (Fin 4) ℝ))ᵀ =
      Aᵀ ⊗ₖ (1 : Matrix (Fin 4) (Fin 4) ℝ) := by
  rw [kron_transpose, Matrix.transpose_one]

/-! ### Block C — trace and dimension bookkeeping -/

/-- `Tr(A ⊗ I₄) = 4 · Tr(A)`: the trace compatibility that assembles the
tower traces into a single tracial state. -/
theorem trace_tower (A : Matrix m m ℝ) :
    (A ⊗ₖ (1 : Matrix (Fin 4) (Fin 4) ℝ)).trace = 4 * A.trace := by
  rw [Matrix.trace_kronecker, Matrix.trace_one]
  simp [Fintype.card_fin]
  ring

/-- Dimension bookkeeping: `4^{n+1} = 4 · 4ⁿ` — matrix size and corner
count march in step up the tower. -/
theorem tower_dim (n : ℕ) : 4 ^ (n + 1) = 4 * 4 ^ n := by
  rw [pow_succ]
  ring

/-! ### Block D — the outerness witness -/

/-- Two non-commuting matrices: the arithmetic kernel of clause (iii) —
an inner (multiplicative) map cannot equal the anti-multiplicative
transpose on a non-commutative algebra. Stated over `ℤ` for
decidability; the real witness is the same pair of matrix units. -/
theorem matrices_noncomm :
    ∃ A B : Matrix (Fin 2) (Fin 2) ℤ, A * B ≠ B * A := by
  refine ⟨!![0, 1; 0, 0], !![0, 0; 1, 0], ?_⟩
  decide

/-! ### Block E — quaternions -/

/-- The left-regular representation of a quaternion `a + bi + cj + dk`
in the orthonormal real basis `{1, i, j, k}`. -/
def L (a b c d : ℝ) : Matrix (Fin 4) (Fin 4) ℝ :=
  !![a, -b, -c, -d;
     b,  a, -d,  c;
     c,  d,  a, -b;
     d, -c,  b,  a]

/-- The transpose of `L_q` is `L_{q̄}`: the stage-wise transpose
restricts to quaternion conjugation on the fibre algebra. -/
theorem L_transpose (a b c d : ℝ) :
    (L a b c d)ᵀ = L a (-b) (-c) (-d) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [L, Matrix.transpose_apply]

/-- Fixed points of conjugation at the matrix level: `L_qᵀ = L_q` if and
only if the three imaginary components vanish — `𝒜^τ ∩ ℍ = ℝ`. -/
theorem L_fixed (a b c d : ℝ) :
    (L a b c d)ᵀ = L a b c d ↔ b = 0 ∧ c = 0 ∧ d = 0 := by
  rw [L_transpose]
  constructor
  · intro h
    have hb := congrFun (congrFun h 1) 0
    have hc := congrFun (congrFun h 2) 0
    have hd := congrFun (congrFun h 3) 0
    simp [L] at hb hc hd
    exact ⟨by linarith, by linarith, by linarith⟩
  · rintro ⟨hb, hc, hd⟩
    rw [hb, hc, hd]
    norm_num

/-- The imaginary unit `i` as a quaternion. -/
def qI : Quaternion ℝ := ⟨0, 1, 0, 0⟩

/-- The imaginary unit `j` as a quaternion. -/
def qJ : Quaternion ℝ := ⟨0, 0, 1, 0⟩

/-- The imaginary unit `k` as a quaternion. -/
def qK : Quaternion ℝ := ⟨0, 0, 0, 1⟩

/- `i^2 = -1` . -/
theorem qI_mul_qI : qI * qI = -1 := by
  ext <;> simp [qI] <;> rfl

/- `ij = k` . -/
theorem qI_mul_qJ : qI * qJ = qK := by
  ext <;> simp [qI, qJ, qK]

/- `ji = -k`: the non-commutativity of the fibre algebra. -/
theorem qJ_mul_qI : qJ * qI = -qK := by
  ext <;> simp [qI, qJ, qK]

/-- Fixed points of quaternion conjugation are the reals:
`q̄ = q ↔ imI = imJ = imK = 0`. -/
theorem quat_conj_fixed (q : Quaternion ℝ) :
    star q = q ↔ q.imI = 0 ∧ q.imJ = 0 ∧ q.imK = 0 := by
  rw [Quaternion.ext_iff]
  constructor
  · rintro ⟨-, hI, hJ, hK⟩
    simp at hI hJ hK
    exact ⟨by linarith, by linarith, by linarith⟩
  · rintro ⟨hI, hJ, hK⟩
    simp [hI, hJ, hK]

/-! ### Block F — the fixed locus of ρ(s) = 1 − s̄ -/

/-- `ρ` is an involution: `1 − conj (1 − conj s) = s`. -/
theorem rho_involutive (s : ℂ) :
    1 - (starRingEnd ℂ) (1 - (starRingEnd ℂ) s) = s := by
  rw [map_sub, map_one, Complex.conj_conj]
  ring

/-- The fixed locus of `ρ(s) = 1 − s̄` is the vertical line
`Re s = 1/2`. -/
theorem fixed_locus_critical (s : ℂ) :
    (1 : ℂ) - (starRingEnd ℂ) s = s ↔ s.re = 1 / 2 := by
  constructor
  · intro h
    have hre := congrArg Complex.re h
    simp only [Complex.sub_re, Complex.one_re, Complex.conj_re] at hre
    linarith
  · intro h
    apply Complex.ext
    · simp only [Complex.sub_re, Complex.one_re, Complex.conj_re]
      linarith
    · simp only [Complex.sub_im, Complex.one_im, Complex.conj_im,
        zero_sub, neg_neg]

end C3
