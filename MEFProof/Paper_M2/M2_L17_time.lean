/-
  M2_L17_time.lean — Paper M2, chat C13: the rule along time (the time part of
  card T2 reopened, Decision Log P296, P298) and the finite part of card T5.
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite and the integer parts.

  * The series.  A term of the series θ_j is exp(3πi n²τ + 6πi n u).  With
    u = p₁ + p₂τ and τ' = 2iκ/w², differentiating along time at a fixed point
    multiplies the term by τ'·(3πi n² + 6πi n p₂), and the right side of the
    rule, (κ/6π)∂² + g∂ with ∂ = 6πi n/w and g = 2iκp₂/w, multiplies it by
    (κ/6π)(6πi n)²/w² + (2iκp₂)(6πi n)/w².  Divided by −πκ/w² the two are
    2(3n² + 6np₂) and 6n² + 12np₂ (`L17_term`).
  * The rule keeps the rule of the series under u ↦ u + τ: the coefficient of
    the first derivative, (1/6)·12 − 2, is zero (`L17_first`), and the
    coefficient of the function itself, in units of πκ/w²,
    6(1+2p) + 6 − 12p − 12, is zero (`L17_zeroth`).
  * Once round the time circle.  In ℤ[ω], ω² + ω + 1 = 0, written as pairs
    (a, b) for a + bω, the matrix
        M = [[1, ω, ω], [ω², ω², ω], [ω², ω, ω²]]
    has M·M = 3·P, where P exchanges the second and the third place
    (`L17_twice`); P·P = 1 (`L17_fold_sq`); M·M·M·M = 9 (`L17_four`); the
    trace of M is −1 − 2ω, whose square is −3 (`L17_trace`); M applied to the
    column (0, 1, −1) is −1 − 2ω times that column (`L17_odd`), and the row
    (0, 1, −1) times M is −1 − 2ω times that row (`L17_odd_row`); ω·ω = ω²
    and ω² + ω + 1 = 0 in this writing (`L17_w_sq`).
    In the write-up log ω is written ζ, M is 𝒞, P is ℰ; in the first two
    bullets above τ is υ_s, w is ϖ₂ and θ_j is ϑ_j, and in the code `w` is ω.
  * M₀ carries the corner P₄ to P₂, P₂ to P₃ and P₃ to P₄ and leaves P₁, and
    the quarter-turn S exchanges P₂ and P₃ and leaves P₁ and P₄, the corners
    written as the pairs of their doubled coordinates modulo 2 (`L17_corners`).
  * Card T5: the number at P₄ of each of the divisors 2P₂+P₄ and 2P₃+P₄ is
    odd (`L17_odd_P4`).

  What is not certified: that the series converge and may be differentiated
  term by term; the two commutators of the derivative along time with the
  derivatives along the fibre; that the rule is the only one of its kind;
  that the matrix M is the matrix once round the time circle (it is read off
  numerically by `papers/M2/checks/T2b_time.py`, I1 to I3); every statement
  about smooth sections, states and solutions.  These are by hand in the
  write-up log.
-/

namespace MEFProof.Paper_M2.L17

/-- the term of the series: both sides of the rule, divided by −πκ/w² -/
theorem L17_term (n p : Int) : 2 * (3 * (n * n) + 6 * (n * p)) = 6 * (n * n) + 12 * (n * p) := by
  omega

theorem L17_first : 12 = 6 * 2 := by decide

theorem L17_zeroth (p : Int) : 6 * (1 + 2 * p) + 6 - 12 * p - 12 = 0 := by
  omega

/-- ℤ[ω] as pairs (a, b) for a + bω, with ω² = −1 − ω -/
abbrev Zw := Int × Int
def zadd (x y : Zw) : Zw := (x.1 + y.1, x.2 + y.2)
def zmul (x y : Zw) : Zw := (x.1 * y.1 - x.2 * y.2, x.1 * y.2 + x.2 * y.1 - x.2 * y.2)
def one : Zw := (1, 0)
def zero : Zw := (0, 0)
def w : Zw := (0, 1)
def w2 : Zw := (-1, -1)

abbrev Mat := List (List Zw)
def dot (r c : List Zw) : Zw := (List.zipWith zmul r c).foldl zadd zero
def col (m : Mat) (j : Nat) : List Zw := m.map (fun r => r.getD j zero)
def mmul (a b : Mat) : Mat := a.map (fun r => [dot r (col b 0), dot r (col b 1), dot r (col b 2)])
def smul (k : Zw) (a : Mat) : Mat := a.map (fun r => r.map (zmul k))

def M : Mat := [[one, w, w], [w2, w2, w], [w2, w, w2]]
def P : Mat := [[one, zero, zero], [zero, zero, one], [zero, one, zero]]
def I3 : Mat := [[one, zero, zero], [zero, one, zero], [zero, zero, one]]

theorem L17_w_sq : zmul w w = w2 ∧ zadd (zadd w2 w) one = zero := by decide

theorem L17_twice : mmul M M = smul (3, 0) P := by decide

theorem L17_fold_sq : mmul P P = I3 := by decide

theorem L17_four : mmul (mmul M M) (mmul M M) = smul (9, 0) I3 := by decide

theorem L17_trace :
    zadd (zadd one w2) w2 = (-1, -2) ∧ zmul (-1, -2) (-1, -2) = (-3, 0) := by decide

theorem L17_odd :
    [dot [one, w, w] [zero, one, (-1, 0)], dot [w2, w2, w] [zero, one, (-1, 0)],
     dot [w2, w, w2] [zero, one, (-1, 0)]]
      = [zero, zmul (-1, -2) one, zmul (-1, -2) (-1, 0)] := by decide

theorem L17_odd_row :
    [dot [zero, one, (-1, 0)] (col M 0), dot [zero, one, (-1, 0)] (col M 1),
     dot [zero, one, (-1, 0)] (col M 2)]
      = [zero, zmul (-1, -2) one, zmul (-1, -2) (-1, 0)] := by decide

/-- a corner as the pair of its doubled coordinates modulo 2:
    P₁ = (0,0), P₂ = (1,0), P₃ = (0,1), P₄ = (1,1) -/
def act (a b c d : Nat) (x : Nat × Nat) : Nat × Nat := ((a * x.1 + b * x.2) % 2, (c * x.1 + d * x.2) % 2)

theorem L17_corners :
    act 2 1 1 1 (1, 1) = (1, 0) ∧ act 2 1 1 1 (1, 0) = (0, 1) ∧ act 2 1 1 1 (0, 1) = (1, 1)
    ∧ act 2 1 1 1 (0, 0) = (0, 0)
    ∧ act 0 1 1 0 (1, 0) = (0, 1) ∧ act 0 1 1 0 (0, 1) = (1, 0)
    ∧ act 0 1 1 0 (1, 1) = (1, 1) ∧ act 0 1 1 0 (0, 0) = (0, 0) := by decide

/-- the divisors 2P₂+P₄ and 2P₃+P₄ as their numbers at P₁, P₂, P₃, P₄ -/
theorem L17_odd_P4 : [0, 2, 0, 1].getD 3 0 % 2 = 1 ∧ [0, 0, 2, 1].getD 3 0 % 2 = 1 := by decide

end MEFProof.Paper_M2.L17
