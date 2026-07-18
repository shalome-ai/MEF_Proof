/-
================================================================
YM_A1_orbit_signature.lean  (module YML.YM_A1b)
================================================================
Certificate 6b (Step 6, Ruling A(b), 12 Jul 2026):
thm:XXI-alternation (Paper XVII v6 line 888; canonical site
Paper XXI §7) — the orbit-signature derivation of the alternation.

Structure, matching the ruled classification (12 Jul 2026, [D];
ledger v14):
  UNCONDITIONAL (the [R] algebra layer):
    - the square of every pure imaginary unit quaternion is −1
      (convention-independence of the sign);
    - the V_Aut × Z action decomposes Q₈ into exactly the four
      degree-2 orbits {±1}, {±i}, {±j}, {±k} (each pair closed
      under the generators, pairwise disjoint, covering Q₈,
      cardinality 2).
  CONDITIONAL (the two geometric identifications that are NOT
  theorems — named hypothesis fields, preserving the ruled [D]):
    (a) h_wraps — the instanton number n corresponds to n FULL
        covering periods of T² (not half-periods), i.e. the
        cumulative phase is the 2n-fold half-period product;
    (b) h_lift  — each half-period lifts to the fibre as
        right-multiplication by a pure imaginary unit quaternion.
  CONCLUSION: over n wraps the cumulative phase is (−1)ⁿ.

The quaternions are modelled self-containedly (an explicit
4-component integer structure with the quaternion product), so
every finite claim is checked by `decide`.

Per Ruling B this file imports nothing from, and is imported by
nothing in, the 6a′ certificate (YML.YM_A1a). The comparison of
the conclusion with the analytic side K₂(n,−1;2) remains at prose
level (Ruling C).

Build: inside a Mathlib checkout (tag v4.15.0):
  lake env sh -c 'LEAN_PATH="$LEAN_PATH:$PWD" lean YML/YM_A1b.lean'
================================================================
-/
import Mathlib.Data.Finset.Card
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring

namespace YMA1b

/-- Integer quaternions, explicit 4-component model. -/
structure H4 where
  a : ℤ
  b : ℤ
  c : ℤ
  d : ℤ
deriving DecidableEq, Repr

namespace H4

/-- The quaternion product. -/
def mul (x y : H4) : H4 :=
  ⟨x.a*y.a - x.b*y.b - x.c*y.c - x.d*y.d,
   x.a*y.b + x.b*y.a + x.c*y.d - x.d*y.c,
   x.a*y.c - x.b*y.d + x.c*y.a + x.d*y.b,
   x.a*y.d + x.b*y.c - x.c*y.b + x.d*y.a⟩

instance : Mul H4 := ⟨mul⟩

def one : H4 := ⟨1, 0, 0, 0⟩
def i : H4 := ⟨0, 1, 0, 0⟩
def j : H4 := ⟨0, 0, 1, 0⟩
def k : H4 := ⟨0, 0, 0, 1⟩
def neg (x : H4) : H4 := ⟨-x.a, -x.b, -x.c, -x.d⟩

/-- Embedding of the centre ℤ. -/
def emb (m : ℤ) : H4 := ⟨m, 0, 0, 0⟩

/-- The six pure imaginary units. -/
def pureUnits : Finset H4 := {i, neg i, j, neg j, k, neg k}

/-- The eight-point quaternion group Q₈. -/
def Q8 : Finset H4 := {one, neg one, i, neg i, j, neg j, k, neg k}

/-! ### The algebra layer — unconditional [R] content -/

/-- Convention-independence: the square of EVERY pure imaginary
unit is −1, so the choice of axis for the half-period lift does
not affect the sign. -/
theorem sq_pure_unit_eq_neg_one :
    ∀ u ∈ pureUnits, u * u = emb (-1) := by decide

/-! ### The orbit decomposition — unconditional [R] content -/

/-- Generators of the V_Aut × Z action: conjugation by i,
conjugation by j (i⁻¹ = −i, j⁻¹ = −j in Q₈), and the centre. -/
def conjI (x : H4) : H4 := i * x * neg i
def conjJ (x : H4) : H4 := j * x * neg j
def negAct (x : H4) : H4 := neg x

/-- The four candidate orbits. -/
def orb1 : Finset H4 := {one, neg one}
def orbI : Finset H4 := {i, neg i}
def orbJ : Finset H4 := {j, neg j}
def orbK : Finset H4 := {k, neg k}

/-- Each candidate orbit is closed under all three generators
(hence under the generated group). -/
theorem orbits_closed :
    (∀ x ∈ orb1, conjI x ∈ orb1 ∧ conjJ x ∈ orb1 ∧ negAct x ∈ orb1) ∧
    (∀ x ∈ orbI, conjI x ∈ orbI ∧ conjJ x ∈ orbI ∧ negAct x ∈ orbI) ∧
    (∀ x ∈ orbJ, conjI x ∈ orbJ ∧ conjJ x ∈ orbJ ∧ negAct x ∈ orbJ) ∧
    (∀ x ∈ orbK, conjI x ∈ orbK ∧ conjJ x ∈ orbK ∧ negAct x ∈ orbK) := by
  decide

/-- Within each orbit the two elements are connected by a
generator (the centre), so each closed pair is a single orbit,
not two. -/
theorem orbits_connected :
    (∀ x ∈ orb1, negAct x ≠ x) ∧ (∀ x ∈ orbI, negAct x ≠ x) ∧
    (∀ x ∈ orbJ, negAct x ≠ x) ∧ (∀ x ∈ orbK, negAct x ≠ x) := by
  decide

/-- The four orbits partition Q₈: pairwise disjoint, covering,
each of cardinality exactly 2. -/
theorem orbits_partition :
    (orb1 ∪ orbI ∪ orbJ ∪ orbK = Q8) ∧
    (Disjoint orb1 orbI ∧ Disjoint orb1 orbJ ∧ Disjoint orb1 orbK ∧
     Disjoint orbI orbJ ∧ Disjoint orbI orbK ∧ Disjoint orbJ orbK) ∧
    (orb1.card = 2 ∧ orbI.card = 2 ∧ orbJ.card = 2 ∧ orbK.card = 2) := by
  decide

/-! ### Arithmetic helpers -/

theorem emb_neg_one_mul (x : H4) : emb (-1) * x = neg x := by
  show mul (emb (-1)) x = neg x
  simp only [mul, emb, neg, H4.mk.injEq]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> ring

theorem neg_emb (m : ℤ) : neg (emb m) = emb (-m) := by
  simp [neg, emb]

/-! ### The conditional layer — the two ruled identifications -/

/-- The wrap data: the two geometric identifications of the
12 Jul 2026 ruling, as named hypothesis fields. -/
structure WrapData where
  /-- the fibre lift of one half-period translation -/
  halfLift : H4
  /-- identification (b): each half-period lifts as
      right-multiplication by a pure imaginary unit quaternion -/
  h_lift : halfLift ∈ pureUnits
  /-- the cumulative fibre phase of the n-instanton sector -/
  instantonPhase : ℕ → H4
  /-- identification (a): instanton number n ↔ n full covering
      periods = 2n half-periods, so the cumulative phase is the
      n-fold product of (halfLift · halfLift) -/
  h_wraps : ∀ n, instantonPhase (n + 1) =
    (halfLift * halfLift) * instantonPhase n
  h_zero : instantonPhase 0 = one

/-- **6b (the alternation, conditional).** Under the two
identifications, the cumulative phase over n instanton sectors
is (−1)ⁿ. -/
theorem alternation (D : WrapData) (n : ℕ) :
    D.instantonPhase n = emb ((-1) ^ n) := by
  induction n with
  | zero => rw [D.h_zero]; rfl
  | succ m ih =>
      rw [D.h_wraps, ih, sq_pure_unit_eq_neg_one D.halfLift D.h_lift,
        emb_neg_one_mul, neg_emb, pow_succ]
      congr 1
      ring

end H4
end YMA1b
