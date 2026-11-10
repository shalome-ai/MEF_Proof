/-!
# M1 — Certificate L6: the twist of the fibre (Section 7.4)

Paper M1, "Five axioms and their minimal geometry".  Core Lean, no Mathlib,
no author axioms, zero `sorry`.

External input named here and never used as a Lean axiom: the classical
theory of elliptic functions (an even elliptic function is a rational
function of the Weierstrass function), which gives the count of states
`1 + Σ ⌊aᵢ/2⌋` kept by the first lift of the fold (Lemma 7.5 (b)).

What is certified: the finite case analysis of Proposition 7.6, taking that
count as given.  A divisor on the four corners is a quadruple of
multiplicities; the drive fixes P₁ and cycles P₂ → P₃ → P₄.

What is not certified: the count itself, and the reading that the states of
the fibre are the objects of the fifth axiom.
-/

/-- A divisor on the four corners: multiplicities at P₁, P₂, P₃, P₄. -/
structure CDiv where
  a1 : Nat
  a2 : Nat
  a3 : Nat
  a4 : Nat
deriving DecidableEq, Repr

namespace CDiv
/-- The flux. -/
def deg (D : CDiv) : Nat := D.a1 + D.a2 + D.a3 + D.a4
/-- States kept by the first lift of the fold: 1 + Σ ⌊aᵢ/2⌋. -/
def kept1 (D : CDiv) : Nat := 1 + D.a1 / 2 + D.a2 / 2 + D.a3 / 2 + D.a4 / 2
/-- States kept by the second lift: the remainder. -/
def kept2 (D : CDiv) : Nat := D.deg - D.kept1
/-- Corner signs of the first lift; `true` stands for −1. -/
def sgn (D : CDiv) : List Bool := [D.a1 % 2 == 1, D.a2 % 2 == 1, D.a3 % 2 == 1, D.a4 % 2 == 1]
/-- Corner signs up to one overall sign: the sign at P₁ is made +1. -/
def pat (D : CDiv) : List Bool := if D.a1 % 2 == 1 then D.sgn.map (fun b => !b) else D.sgn
/-- One step of the drive: P₂ → P₃ → P₄ → P₂, P₁ fixed. -/
def step (D : CDiv) : CDiv := ⟨D.a1, D.a4, D.a2, D.a3⟩
/-- The corner signs are carried to themselves by one step. -/
def fixedByDrive (D : CDiv) : Bool := D.step.pat == D.pat
/-- Clause (ii) of the fifth axiom: the structure is not carried to itself. -/
def clauseII (D : CDiv) : Bool := !D.fixedByDrive
/-- Clause (iii): two states on the pillowcase, for one of the two lifts. -/
def clauseIII (D : CDiv) : Bool := decide (2 ≤ D.kept1) || decide (2 ≤ D.kept2)
/-- Number of corners with sign −1. -/
def minus (D : CDiv) : Nat := (D.sgn.filter (fun b => b)).length
/-- All divisors of flux at most three (thirty-five of them). -/
def all : List CDiv :=
  (List.range 4).flatMap fun a => (List.range (4 - a)).flatMap fun b =>
  (List.range (4 - a - b)).flatMap fun c => (List.range (4 - a - b - c)).map fun d => ⟨a, b, c, d⟩
end CDiv

open CDiv

set_option maxRecDepth 8192

/-- The list has thirty-five members. -/
theorem L6_count : CDiv.all.length = 35 := by decide

/-- The product of the four corner signs is (−1)^flux. -/
theorem L6_corner_product : ∀ D ∈ CDiv.all, D.minus % 2 = D.deg % 2 := by decide

/-- Three steps of the drive return every pattern. -/
theorem L6_return_three : ∀ D ∈ CDiv.all, D.step.step.step = D := by decide

/-- A pattern is left in place by the drive exactly when all corners are
    alike or the odd corner is P₁. -/
theorem L6_fixed_patterns : ∀ D ∈ CDiv.all,
    (D.fixedByDrive = true ↔
      (D.pat = [false, false, false, false] ∨ D.pat = [false, true, true, true])) := by decide

/-- Flux one: clause (iii) fails. -/
theorem L6_flux_one : ∀ D ∈ CDiv.all, D.deg = 1 → D.clauseIII = false := by decide

/-- Flux two: clause (iii) forces a structure the drive leaves in place,
    so clause (ii) fails. -/
theorem L6_flux_two : ∀ D ∈ CDiv.all, D.deg = 2 → D.clauseIII = true → D.clauseII = false := by decide

/-- Flux three: clause (iii) always holds, one lift keeping two states and
    removing one. -/
theorem L6_flux_three_states : ∀ D ∈ CDiv.all, D.deg = 3 →
    (D.clauseIII = true ∧ ((D.kept1 = 2 ∧ D.kept2 = 1) ∨ (D.kept1 = 1 ∧ D.kept2 = 2))) := by decide

/-- Flux three: exactly one corner is odd (up to the overall sign). -/
theorem L6_flux_three_one_odd : ∀ D ∈ CDiv.all, D.deg = 3 →
    (D.pat = [false, false, false, true] ∨ D.pat = [false, false, true, false] ∨
     D.pat = [false, true, false, false] ∨ D.pat = [false, true, true, true]) := by decide

/-- Flux three: clause (ii) holds exactly when the odd corner is not P₁. -/
theorem L6_flux_three_cycled : ∀ D ∈ CDiv.all, D.deg = 3 →
    (D.clauseII = true ↔ D.pat ≠ [false, true, true, true]) := by decide

/-- No flux of one or two meets both clauses; flux three does. -/
theorem L6_least_flux :
    (∀ D ∈ CDiv.all, D.deg = 1 ∨ D.deg = 2 → ¬ (D.clauseII = true ∧ D.clauseIII = true)) ∧
    (∃ D ∈ CDiv.all, D.deg = 3 ∧ D.clauseII = true ∧ D.clauseIII = true) := by decide

/-- The smallest case: D = 3 P₄ has two states kept, one removed, corner
    signs (+, +, +, −), and meets both clauses. -/
theorem L6_smallest_case :
    (⟨0, 0, 0, 3⟩ : CDiv).kept1 = 2 ∧ (⟨0, 0, 0, 3⟩ : CDiv).kept2 = 1 ∧
    (⟨0, 0, 0, 3⟩ : CDiv).sgn = [false, false, false, true] ∧
    (⟨0, 0, 0, 3⟩ : CDiv).clauseII = true ∧ (⟨0, 0, 0, 3⟩ : CDiv).clauseIII = true := by decide
