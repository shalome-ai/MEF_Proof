/-
  M2_L16_fifth.lean — Paper M2, card T4b with card S08: the candidates, the
  fifth axiom and the first axiom (chat C12).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite part of card T4b and of card S08.

  * Of the three numbers a₀, a₁, a₂ of a candidate only whether each is zero
    enters.  Writing `true` for "is zero": the state of the first family
    (ψ′ = f, ψ″ = 0) is a solution exactly when a₀ is zero, and that of the
    second (ψ′ = 0, ψ″ = v) exactly when a₁ and a₂ are zero; over the eight
    patterns one of the two is a solution exactly when the pattern is not one
    of those with a₀ not zero and one of a₁, a₂ not zero (`L16_patterns`);
    five patterns have one and three have none (`L16_count`).
  * For each of the three divisors 3P₄, 2P₁+P₄, P₁+P₂+P₃, with ε = +1 when
    the number at P₄ is odd and −1 when it is even, the function taken for
    the first family has parity ε and that for the second parity −ε, and the
    orders of their poles at the four corners are bounded by the divisor
    (`L16_table`).
  * On a circle of twelve units, three steps of four units, the arc of the
    units 1, 2, 3 moved back by one step has no unit in common with itself
    (`L16_arc`).

  * M₀ = [[2,1],[1,1]]; M₀³ = [[13,8],[8,5]], its inverse is [[5,−8],[−8,13]],
    and both are the identity modulo 2 (`L16_M03`).
  * M₀⁻³(0,1) = (0,1) + 2(−4,6) and M₀⁻³(1,0) = (1,0) + 2(2,−4); the numbers
    of ω₁ in λ₁ = 6ω₁ − 4ω₂ and in λ₁ + λ₂ = 2ω₁ − 2ω₂ are even
    (`L16_signs`).

  What is not certified: that the two states are smooth states and have the
  left sides named; the functions Ξ, K₁, K₂, K₃, their parities, periods and
  poles (here these are data, written down); that a candidate with a₀ not
  zero and one of a₁, a₂ not zero has no solution but zero (the induction of
  M2-W191); the coordinates of the fibre; the shadows; anything about bundles, sections or smoothness;
  that the series Ξ is the only function with its poles and rules of sign.
  Those parts are by hand in the write-up log (M2-W220 to M2-W222, M2-W224), with the
  script `papers/M2/checks/T4b_fifth.py`.
-/
namespace MEFProof.Paper_M2.L16

/-- `true` stands for "the number is zero". -/
def family1 (z0 _z1 _z2 : Bool) : Bool := z0
def family2 (_z0 z1 z2 : Bool) : Bool := z1 && z2

/-- The patterns of proposition (ii): a₀ not zero and one of a₁, a₂ not zero. -/
def onlyZero (z0 z1 z2 : Bool) : Bool := !z0 && (!z1 || !z2)

def patterns : List (Bool × Bool × Bool) :=
  [true, false].flatMap fun a => [true, false].flatMap fun b => [true, false].map fun c => (a, b, c)

theorem L16_patterns :
    patterns.all (fun (z0, z1, z2) =>
      (family1 z0 z1 z2 || family2 z0 z1 z2) == !(onlyZero z0 z1 z2)) = true := by decide

theorem L16_count :
    (patterns.filter fun (z0, z1, z2) => family1 z0 z1 z2 || family2 z0 z1 z2).length = 5
    ∧ (patterns.filter fun (z0, z1, z2) => onlyZero z0 z1 z2).length = 3 := by decide

/-- A function on the fibre, as data: its parity under z ↦ −z and the greatest
    orders of its poles at P₁, P₂, P₃, P₄. -/
structure Fn where
  parity : Int
  poles : List Nat
deriving DecidableEq

def one : Fn := ⟨1, [0, 0, 0, 0]⟩
def K1 : Fn := ⟨-1, [1, 0, 1, 0]⟩
def K2 : Fn := ⟨-1, [1, 0, 0, 1]⟩
def K3 : Fn := ⟨-1, [0, 0, 0, 3]⟩

/-- A divisor with the functions taken for the first and the second family. -/
def table : List (List Nat × Fn × Fn) :=
  [([0, 0, 0, 3], one, K3), ([2, 0, 0, 1], one, K2), ([1, 1, 1, 0], K1, one)]

def eps (d : List Nat) : Int := if d.getD 3 0 % 2 == 1 then 1 else -1

def bounded (f : Fn) (d : List Nat) : Bool :=
  (List.range 4).all fun i => f.poles.getD i 0 ≤ d.getD i 0

theorem L16_table :
    table.all (fun (d, f1, f2) =>
      d.foldl (· + ·) 0 == 3
      && eps d * f1.parity == 1 && eps d * f2.parity == -1
      && bounded f1 d && bounded f2 d) = true := by decide

def arc : List Nat := [1, 2, 3]
def moved : List Nat := arc.map fun t => (t + 12 - 4) % 12

theorem L16_arc : (arc.all fun t => !moved.contains t) = true := by decide

abbrev M2x2 := Int × Int × Int × Int   -- (a, b, c, d) for [[a, b], [c, d]]

def mul (x y : M2x2) : M2x2 :=
  let (a, b, c, d) := x
  let (e, f, g, h) := y
  (a * e + b * g, a * f + b * h, c * e + d * g, c * f + d * h)

def M0 : M2x2 := (2, 1, 1, 1)
def M03 : M2x2 := mul M0 (mul M0 M0)
def M03inv : M2x2 := (5, -8, -8, 13)

def idMod2 (x : M2x2) : Bool :=
  let (a, b, c, d) := x
  (a - 1) % 2 == 0 && b % 2 == 0 && c % 2 == 0 && (d - 1) % 2 == 0

theorem L16_M03 :
    M03 = (13, 8, 8, 5) ∧ mul M03 M03inv = (1, 0, 0, 1)
    ∧ idMod2 M03 = true ∧ idMod2 M03inv = true := by decide

/-- The columns of M₀⁻³ are (5, −8) and (−8, 13).  With ω₁ = z(0,1), ω₂ = z(1,0):
    z(−8,13) = ω₁ + 2(6ω₁ − 4ω₂) and z(5,−8) = ω₂ + 2(−4ω₁ + 2ω₂). -/
theorem L16_signs :
    ((-8 : Int), (13 : Int)) = (2 * (-4), 1 + 2 * 6)
    ∧ ((5 : Int), (-8 : Int)) = (1 + 2 * 2, 2 * (-4))
    ∧ (6 : Int) % 2 = 0 ∧ ((6 : Int) + (-4)) % 2 = 0 := by decide

end MEFProof.Paper_M2.L16
