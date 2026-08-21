/-
  C_C4_ko_colimit.lean --- Paper D, thirteenth certificate.

  Arithmetic spine of Section "The KO-shadow of the corner classes":
  (1) `four_mul_torsion`  : in the two-torsion group the fourfold map
                            is zero;
  (2) `step_veq`          : the normalised rank map r |-> r / 4^n is
                            compatible with the transition r |-> 4r;
  (3) `stage_injective`   : the map is injective at every stage;
  (4) `into_dyadic` and `onto_dyadic` : its value set is exactly the
                            dyadic rationals, via 4^n = 2^n * 2^n.

  Lean 4.29.1, core library only.  No sorry, no author axioms.
-/

namespace KOColimit

/-- The two-element group, modelled on `Bool` with exclusive or. -/
abbrev Z2 := Bool

def add2 (a b : Z2) : Z2 := xor a b

/-- (1) Two-torsion kills four: `x + x + x + x = 0`. -/
theorem four_mul_torsion (x : Z2) :
    add2 (add2 x x) (add2 x x) = false := by
  cases x <;> rfl

/-- Powers of four. -/
def q4 : Nat → Int
  | 0     => 1
  | n + 1 => 4 * q4 n

/-- Powers of two. -/
def p2 : Nat → Int
  | 0     => 1
  | n + 1 => 2 * p2 n

theorem q4_pos : ∀ n, 0 < q4 n
  | 0     => by decide
  | n + 1 => by
      have h := q4_pos n
      simp only [q4]
      omega

/-- A stage class: rank `r` at stage `n`, of value `r / 4^n`. -/
structure Stage where
  r : Int
  n : Nat

/-- Cross-multiplied value equality of two stage classes. -/
def veq (a b : Stage) : Prop := a.r * q4 b.n = b.r * q4 a.n

/-- The transition map of the tower: rank multiplies by four. -/
def step (a : Stage) : Stage := ⟨4 * a.r, a.n + 1⟩

/-- (2) A class and its image under the transition have equal value. -/
theorem step_veq (a : Stage) : veq a (step a) := by
  show a.r * q4 (a.n + 1) = (4 * a.r) * q4 a.n
  simp only [q4]
  calc a.r * (4 * q4 a.n) = a.r * 4 * q4 a.n := (Int.mul_assoc _ _ _).symm
    _ = 4 * a.r * q4 a.n := by rw [Int.mul_comm a.r 4]

/-- (3) At a fixed stage the value determines the rank. -/
theorem stage_injective {r s : Int} {n : Nat}
    (h : veq (Stage.mk r n) (Stage.mk s n)) : r = s := by
  have hq : 0 < q4 n := q4_pos n
  have h' : r * q4 n = s * q4 n := h
  have hsub : (r - s) * q4 n = 0 := by
    rw [Int.sub_mul, h', Int.sub_self]
  rcases Int.mul_eq_zero.mp hsub with h0 | h0
  · omega
  · omega

/-- `4^n = 2^n * 2^n`. -/
theorem q4_eq_p2_sq : ∀ n, q4 n = p2 n * p2 n
  | 0     => by decide
  | n + 1 => by
      have ih := q4_eq_p2_sq n
      show 4 * q4 n = (2 * p2 n) * (2 * p2 n)
      calc 4 * q4 n
          = 4 * (p2 n * p2 n) := by rw [ih]
        _ = 2 * 2 * (p2 n * p2 n) := by
              rw [show (4 : Int) = 2 * 2 from by decide]
        _ = 2 * (2 * (p2 n * p2 n)) := Int.mul_assoc 2 2 _
        _ = 2 * ((2 * p2 n) * p2 n) := by rw [Int.mul_assoc]
        _ = 2 * (p2 n * (2 * p2 n)) := by
              rw [Int.mul_comm (2 * p2 n) (p2 n)]
        _ = (2 * p2 n) * (2 * p2 n) := (Int.mul_assoc _ _ _).symm

/-- Value equality between a stage class and the dyadic `m / 2^k`. -/
def dveq (a : Stage) (m : Int) (k : Nat) : Prop :=
  a.r * p2 k = m * q4 a.n

/-- (4a) Every stage class has dyadic value: `r / 4^n = r / 2^(2n)`. -/
theorem into_dyadic (a : Stage) : dveq a a.r (2 * a.n) := by
  show a.r * p2 (2 * a.n) = a.r * q4 a.n
  have h : ∀ n, p2 (2 * n) = q4 n := by
    intro n
    induction n with
    | zero => decide
    | succ m ih =>
        have h2 : 2 * (m + 1) = (2 * m) + 1 + 1 := by omega
        rw [h2]
        show 2 * (2 * p2 (2 * m)) = q4 (m + 1)
        rw [ih]
        show 2 * (2 * q4 m) = 4 * q4 m
        calc 2 * (2 * q4 m)
            = 2 * 2 * q4 m := (Int.mul_assoc 2 2 _).symm
          _ = 4 * q4 m := by rw [show (2 : Int) * 2 = 4 from by decide]
  rw [h]

/-- (4b) Every dyadic `m / 2^k` is the value of a stage class. -/
theorem onto_dyadic (m : Int) (k : Nat) :
    dveq (Stage.mk (m * p2 k) k) m k := by
  show (m * p2 k) * p2 k = m * q4 k
  rw [Int.mul_assoc, ← q4_eq_p2_sq]

end KOColimit

#print axioms KOColimit.four_mul_torsion
#print axioms KOColimit.step_veq
#print axioms KOColimit.stage_injective
#print axioms KOColimit.into_dyadic
#print axioms KOColimit.onto_dyadic
