/-
  M2_L12_reverse.lean — Paper M2, card T1b: time run backwards together with
  the quarter-turn, and the spinor bundle with its lift of the fold (chat C9).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the integer arithmetic of the test of card T1b, with S the
  quarter-turn of M1 (Theorem 4.2), and, in the frame (∂_s, e1, e2, e3) of the
  directions of time and of space, J0 the structure with J0 ∂_s = e1 and
  J0 e2 = e3, and D = diag(-1,1,1,1) the action on that frame of time run
  backwards (∂_s to -∂_s, the frame of space left in place).

  * det S = 1 (`L12_det_S`): the quarter-turn keeps the handedness of the fibre.
  * The signs (+,+,+,−) of the lift of the fold, pulled back by S, are
    (+,+,+,−) (`L12_signs_pulled`); the signs (+,−,+,+) pulled back are
    (+,+,−,+) (`L12_signs_other`).
  * J0² = -1 (`L12_J0_sq`); J0R = D·J0·D has J0R ∂_s = -e1 and J0R e2 = e3
    (`L12_J0R_entries`), J0R² = -1 (`L12_J0R_sq`), and J0R is neither J0 nor
    -J0 (`L12_J0R_ne`).
  * The frame (∂_s, J ∂_s, e2, J e2) has determinant +1 for J0 and -1 for J0R
    (`L12_hand_J0`, `L12_hand_J0R`): the two have opposite handedness.

  What is not certified: anything about bundles, lifts, forms with complex
  coefficients or isomorphisms; those parts are checked in
  `papers/M2/checks/T1b_reverse.py` or rest on the entries of the write-up log.
-/
namespace MEFProof.Paper_M2.L12

-- the fibre: S on the four corners, written as pairs of bits (twice the coordinates, modulo two)
def detS : Int := 0 * 0 - 1 * (-1)
theorem L12_det_S : detS = 1 := by decide

/-- S = (0 1; -1 0) on a corner (m, n) modulo two: (m, n) ↦ (n, m). -/
def Scorner (c : Bool × Bool) : Bool × Bool := (c.2, c.1)

/-- the sign of the lift at the corner (m, n): −1 (true) only at P4 = (1,1). -/
def sign4 (c : Bool × Bool) : Bool := c.1 && c.2
/-- the signs with −1 only at P2 = (1,0), and only at P3 = (0,1). -/
def sign2 (c : Bool × Bool) : Bool := c.1 && !c.2
def sign3 (c : Bool × Bool) : Bool := !c.1 && c.2

theorem L12_signs_pulled : ∀ m n : Bool, sign4 (Scorner (m, n)) = sign4 (m, n) := by decide
theorem L12_signs_other : ∀ m n : Bool, sign2 (Scorner (m, n)) = sign3 (m, n) := by decide

-- the directions of time and of space
abbrev M4 := Fin 4 → Fin 4 → Int

def mul (A B : M4) : M4 := fun i j => A i 0 * B 0 j + A i 1 * B 1 j + A i 2 * B 2 j + A i 3 * B 3 j

def ofRows (r0 r1 r2 r3 : Int × Int × Int × Int) : M4 := fun i j =>
  let r := match i with | 0 => r0 | 1 => r1 | 2 => r2 | 3 => r3
  match j with | 0 => r.1 | 1 => r.2.1 | 2 => r.2.2.1 | 3 => r.2.2.2

/-- columns are the images of ∂_s, e1, e2, e3. -/
def J0 : M4 := ofRows (0,-1,0,0) (1,0,0,0) (0,0,0,-1) (0,0,1,0)
def D : M4 := ofRows (-1,0,0,0) (0,1,0,0) (0,0,1,0) (0,0,0,1)
def negOne : M4 := ofRows (-1,0,0,0) (0,-1,0,0) (0,0,-1,0) (0,0,0,-1)
def J0R : M4 := mul (mul D J0) D

def eqM (A B : M4) : Bool :=
  (List.finRange 4).all fun i => (List.finRange 4).all fun j => A i j == B i j

theorem L12_J0_sq : eqM (mul J0 J0) negOne = true := by decide
theorem L12_J0R_sq : eqM (mul J0R J0R) negOne = true := by decide
theorem L12_J0R_entries :
    (J0R 0 0, J0R 1 0, J0R 2 0, J0R 3 0) = (0, -1, 0, 0) ∧
    (J0R 0 2, J0R 1 2, J0R 2 2, J0R 3 2) = (0, 0, 0, 1) := by decide
theorem L12_J0R_ne : eqM J0R J0 = false ∧ eqM J0R (mul negOne J0) = false := by decide

def det3 (a b c d e f g h i : Int) : Int := a*(e*i - f*h) - b*(d*i - f*g) + c*(d*h - e*g)

/-- determinant of the matrix whose columns are ∂_s, J ∂_s, e2, J e2. -/
def hand (J : M4) : Int :=
  -- columns: c0 = (1,0,0,0), c1 = J(·,0), c2 = (0,0,1,0), c3 = J(·,2); expand along the first column
  det3 (J 1 0) 0 (J 1 2) (J 2 0) 1 (J 2 2) (J 3 0) 0 (J 3 2)

theorem L12_hand_J0 : hand J0 = 1 := by decide
theorem L12_hand_J0R : hand J0R = -1 := by decide

end MEFProof.Paper_M2.L12
