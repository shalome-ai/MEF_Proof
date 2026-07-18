/-
  C_C3_commuting_square.lean
  Paper C — certificate C3 (node C9, [C-alpha] functoriality engine).

  The corner correspondence sends the corner set of the pillowcase power
  P^n — a torsor under the Klein four-group V of half-period translations,
  labelled by {1,i,j,k} once a basepoint corner is fixed — to the minimal
  projections E_w, w in {1,i,j,k}^n, of the diagonal masa of
  A_n = End(H^{tensor n}) in the quaternion basis. All tower maps act as
  identity tensor (last factor), so the load-bearing content of the
  commuting square is carried by the 4x4 layer, certified here. Matrices
  are lists of rows of integers in the ordered basis (1, i, j, k); L b is
  left multiplication by the basis quaternion b; E a is the diagonal
  minimal projection at label a; labelMul is the induced Klein four-group
  product on labels (Q8 modulo sign).

  Certified statements:
  (1) L_orthogonal      : L b * (L b)^T = I for every label b.
  (2) ad_L_E            : (L b) (E a) (L b)^T = E (labelMul b a) —
                          equivariance of the correspondence under the
                          corner symmetries (16 cases).
  (3) anchored_square   : (L b) (E anchor) (L b)^T = E b — the anchored
                          commuting square at the new factor: transporting
                          the basepoint corner by the symmetry b lands on
                          the corner labelled b.
  (4) identity_resolution : the sum over the corner orbit of the anchored
                          projection is the identity — the algebraic
                          inclusion iota (A) = A tensor I is recovered
                          from the anchored corner embedding
                          Psi (A) = A tensor (E anchor) by summing over
                          the corner-symmetry orbit.
  (5) trace_E / trace_I : Tr (E a) = 1 and Tr I = 4 — the trace step
                          tau_{n+1} = (1/4) tau_n on anchored corners.
  (6) labelMul_* : the label action is a commutative group action of
                          exponent two, simply transitive on labels.
  (7) anchor_unique_symmetric : L b is symmetric iff b = anchor — the
                          basepoint corner is the unique choice compatible
                          with the transpose anti-involution, so the
                          anchoring is intrinsic, not a convention.

  Lean 4.15.0, core only. Zero sorry; proofs by kernel decision procedure.
-/

namespace PaperC.C3

/-- 4x4 integer matrices as lists of rows. -/
def Mat : Type := List (List Int)

instance : DecidableEq Mat := inferInstanceAs (DecidableEq (List (List Int)))

/-- Matrix product (4x4, total on the matrices used here). -/
def mul (A B : Mat) : Mat :=
  A.map (fun row =>
    (List.range 4).map (fun j =>
      (List.zip row (B.map (fun brow => brow.getD j 0))).foldl
        (fun s p => s + p.1 * p.2) 0))

/-- Transpose. -/
def transpose (A : Mat) : Mat :=
  (List.range 4).map (fun j => A.map (fun row => row.getD j 0))

/-- Entrywise sum. -/
def add (A B : Mat) : Mat :=
  (List.zip A B).map (fun p => (List.zip p.1 p.2).map (fun q => q.1 + q.2))

/-- Trace. -/
def trace (A : Mat) : Int :=
  ((List.range 4).map (fun i => (A.getD i []).getD i 0)).foldl (· + ·) 0

/-- Identity. -/
def I4 : Mat := [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]

/-- Left multiplication by the basis quaternions in the ordered basis
    (1, i, j, k). Label order: 0 = 1, 1 = i, 2 = j, 3 = k. -/
def L : Fin 4 → Mat
  | 0 => I4
  | 1 => [[0,-1,0,0],[1,0,0,0],[0,0,0,-1],[0,0,1,0]]
  | 2 => [[0,0,-1,0],[0,0,0,1],[1,0,0,0],[0,-1,0,0]]
  | 3 => [[0,0,0,-1],[0,0,-1,0],[0,1,0,0],[1,0,0,0]]

/-- Diagonal minimal projections at each label. -/
def E : Fin 4 → Mat
  | 0 => [[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
  | 1 => [[0,0,0,0],[0,1,0,0],[0,0,0,0],[0,0,0,0]]
  | 2 => [[0,0,0,0],[0,0,0,0],[0,0,1,0],[0,0,0,0]]
  | 3 => [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]]

/-- The anchor: the basepoint (real) corner, label of the quaternion 1. -/
def anchor : Fin 4 := 0

/-- The Klein four-group product on labels (Q8 modulo sign). -/
def labelMul : Fin 4 → Fin 4 → Fin 4
  | 0, 0 => 0 | 0, 1 => 1 | 0, 2 => 2 | 0, 3 => 3
  | 1, 0 => 1 | 1, 1 => 0 | 1, 2 => 3 | 1, 3 => 2
  | 2, 0 => 2 | 2, 1 => 3 | 2, 2 => 0 | 2, 3 => 1
  | 3, 0 => 3 | 3, 1 => 2 | 3, 2 => 1 | 3, 3 => 0

/-- (1) Orthogonality: each L b is orthogonal, so (L b)^{-1} = (L b)^T. -/
theorem L_orthogonal : ∀ b : Fin 4, mul (L b) (transpose (L b)) = I4 := by
  decide

/-- (2) Equivariance: conjugating the projection at label a by L b gives
    the projection at label (labelMul b a). This is the engine of the
    corner correspondence: the corner symmetries act on projections
    exactly as the Klein four-group acts on labels. -/
theorem ad_L_E :
    ∀ b a : Fin 4,
      mul (mul (L b) (E a)) (transpose (L b)) = E (labelMul b a) := by
  decide

/-- (3) The anchored commuting square at the new factor. -/
theorem anchored_square :
    ∀ b : Fin 4,
      mul (mul (L b) (E anchor)) (transpose (L b)) = E b := by
  decide

/-- (4) Resolution of the identity over the corner orbit: summing the
    anchored projection over the corner-symmetry orbit yields I, hence
    iota (A) = A tensor I4 is recovered from the anchored embedding
    Psi (A) = A tensor (E anchor) by summing over the orbit. -/
theorem identity_resolution :
    add (add (E 0) (E 1)) (add (E 2) (E 3)) = I4 := by
  decide

/-- (5a) Each corner projection has trace one. -/
theorem trace_E : ∀ a : Fin 4, trace (E a) = 1 := by
  decide

/-- (5b) The identity has trace four: the normalised trace scales by 1/4
    across one tower step on anchored corner projections. -/
theorem trace_I4 : trace I4 = 4 := by
  decide

/-- (6a) The label action is an involutive abelian group (Klein four). -/
theorem labelMul_comm : ∀ b a : Fin 4, labelMul b a = labelMul a b := by
  decide

theorem labelMul_self : ∀ b : Fin 4, labelMul b b = 0 := by
  decide

theorem labelMul_assoc :
    ∀ b c a : Fin 4,
      labelMul b (labelMul c a) = labelMul (labelMul b c) a := by
  decide

/-- (6b) Simple transitivity, with the witness explicit: the unique
    symmetry carrying label a to label c is labelMul c a. -/
theorem labelMul_simply_transitive :
    ∀ a c b : Fin 4, labelMul b a = c ↔ b = labelMul c a := by
  decide

/-- (7) Intrinsic anchoring: the basepoint is the unique label whose
    symmetry is fixed by the transpose anti-involution. -/
theorem anchor_unique_symmetric :
    ∀ b : Fin 4, transpose (L b) = L b ↔ b = anchor := by
  decide

end PaperC.C3
