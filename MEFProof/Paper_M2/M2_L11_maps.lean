/-
  M2_L11_maps.lean — Paper M2, card T1: the maps that carry what is given to
  itself (chat C8b5, after the reset of Decision Log P264).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the integer arithmetic of the test of the maps, with M0 the
  step of M1, S the quarter-turn of M1 (Theorem 4.2) and N = -1 the fold.

  * M0·M0⁻¹ = 1 and S·S⁻¹ = 1 (`L11_M0_inv`, `L11_S_inv`): the two matrices
    written as inverses are the inverses.
  * S·M0·S⁻¹ = M0⁻¹ (`L11_S_conj_M0`): time run backwards together with the
    quarter-turn carries the step to its inverse.
  * M0·S·M0 = S (`L11_join`) and M0³·S·M0³ = S (`L11_glue`): that map respects
    the join of one step and the gluing once round the time circle.
  * S² = -1 (`L11_S_sq`): applied twice it is the fold on the fibre.
  * On the four corners, written as pairs of bits (twice the coordinates,
    modulo two): S fixes P1 and P4 and exchanges P2 and P3 (`L11_S_corners`);
    M0 fixes P1 and cycles P2 → P3 → P4 → P2 (`L11_M0_corners`); the signs
    (+,+,+,−) are kept by S and by M0³ and not by M0 nor by M0²
    (`L11_signs_S`, `L11_signs_M0cubed`, `L11_signs_M0`, `L11_signs_M0sq`).

  What is not certified: anything about lengths, complex structures, bundles
  or lifts; those parts are checked in `papers/M2/checks/T1_maps.py` (the
  lengths and the coordinate z_s) or rest on the entries of the write-up log.
-/
namespace MEFProof.Paper_M2.L11

abbrev Mat := Int × Int × Int × Int   -- (a, b, c, d) for the rows (a b), (c d)

def mul (A B : Mat) : Mat :=
  (A.1*B.1 + A.2.1*B.2.2.1, A.1*B.2.1 + A.2.1*B.2.2.2,
   A.2.2.1*B.1 + A.2.2.2*B.2.2.1, A.2.2.1*B.2.1 + A.2.2.2*B.2.2.2)

def M0 : Mat := (2, 1, 1, 1)
def M0inv : Mat := (1, -1, -1, 2)
def S : Mat := (0, 1, -1, 0)
def Sinv : Mat := (0, -1, 1, 0)
def one : Mat := (1, 0, 0, 1)
def negOne : Mat := (-1, 0, 0, -1)
def M0cubed : Mat := mul M0 (mul M0 M0)
def M0sq : Mat := mul M0 M0

theorem L11_M0_inv : mul M0 M0inv = one := by decide
theorem L11_S_inv : mul S Sinv = one := by decide
theorem L11_S_conj_M0 : mul (mul S M0) Sinv = M0inv := by decide
theorem L11_join : mul (mul M0 S) M0 = S := by decide
theorem L11_glue : mul (mul M0cubed S) M0cubed = S := by decide
theorem L11_S_sq : mul S S = negOne := by decide

/-- A corner is a pair of bits (m, n): the point (m/2, n/2). P1=(0,0), P2=(1,0), P3=(0,1), P4=(1,1). -/
def actC (A : Mat) (p : Nat × Nat) : Nat × Nat :=
  (((A.1 * p.1 + A.2.1 * p.2) % 2).toNat, ((A.2.2.1 * p.1 + A.2.2.2 * p.2) % 2).toNat)

def corners : List (Nat × Nat) := [(0,0), (1,0), (0,1), (1,1)]

theorem L11_S_corners : corners.map (actC S) = [(0,0), (0,1), (1,0), (1,1)] := by decide
theorem L11_M0_corners : corners.map (actC M0) = [(0,0), (0,1), (1,1), (1,0)] := by decide

/-- The sign (+,+,+,−): −1 at P4 = (1,1) only; here `true` stands for −1. -/
def odd (p : Nat × Nat) : Bool := p.1 == 1 && p.2 == 1
def keepsSigns (A : Mat) : Bool := corners.all (fun p => odd (actC A p) == odd p)

theorem L11_signs_S : keepsSigns S = true := by decide
theorem L11_signs_M0cubed : keepsSigns M0cubed = true := by decide
theorem L11_signs_M0 : keepsSigns M0 = false := by decide
theorem L11_signs_M0sq : keepsSigns M0sq = false := by decide

end MEFProof.Paper_M2.L11
