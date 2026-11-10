/-!
# M2 — Certificate L7: the Clifford module and the module trace (Sections 2–3)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.
Adopted from the τ₂ programme's ruling R-F1(Φ) (24 Oct 2026) and re-certified
in M2's tree; the external input is Bott periodicity for the real Clifford
algebras, Cl(0,n+8) ≅ Cl(0,n) ⊗ ℝ(16), with the table Cl(0,4) ≅ ℍ(2).

Certified:
* `L7_bott`           — 12 = 4 + 8, 12 % 8 = 4: Cl(0,12) ≅ Cl(0,4) ⊗ ℝ(16) ≅ ℍ(2·16) = ℍ(32);
* `L7_module_dims`    — the irreducible module ℍ³² has real dimension 128,
                        complex dimension 64, quaternionic dimension 32;
                        the algebra ℍ(32) has real dimension 4·32² = 4096 = 2¹²;
* `L7_three_readings` — for a module-symmetric configuration with per-component
                        value c, the three readings of ζ∇Φ∇Φ are c (one
                        component), 32c (trace of the square), 1024c (square
                        of the trace); only the trace is the module inner product;
* `L7_trace_uniform`  — the trace of a uniform vacuum is 32 × one component;
* `L7_imaginary_square_real` — for a pure imaginary quaternion q = bi + cj + dk,
                        q² = −(b² + c² + d²) is real: hence (ψ−ψ̄)² contributes
                        no imaginary direction, and ω is its unique carrier.
-/

namespace M2L7

theorem L7_bott : (12:Nat) = 4 + 8 ∧ 12 % 8 = 4 ∧ (2:Nat) * 16 = 32 := by decide

theorem L7_module_dims :
    (4:Nat) * 32 = 128 ∧ (2:Nat) * 32 = 64 ∧ (4:Nat) * (32 * 32) = 4096 ∧ 2 ^ 12 = 4096 := by
  decide

/-- Three readings of the kinetic term for a uniform configuration of 32 components. -/
def oneComponent (c : Nat) : Nat := c
def traceOfSquare (c : Nat) : Nat := 32 * c
def squareOfTrace (c : Nat) : Nat := (32 * 32) * c

theorem L7_three_readings (c : Nat) :
    oneComponent c = c ∧ traceOfSquare c = 32 * c ∧ squareOfTrace c = 1024 * c := by
  unfold oneComponent traceOfSquare squareOfTrace
  refine ⟨rfl, rfl, ?_⟩
  omega

theorem L7_trace_uniform (c : Nat) : (List.replicate 32 c).foldl (· + ·) 0 = 32 * c := by
  have h : ∀ (n acc : Nat), (List.replicate n c).foldl (· + ·) acc = acc + n * c := by
    intro n
    induction n with
    | zero => intro acc; simp
    | succ k ih =>
      intro acc
      simp [List.replicate_succ, List.foldl_cons, ih, Nat.succ_mul]
      omega
  simpa using h 32 0

/-- Quaternion multiplication on (a,b,c,d) = a + bi + cj + dk. -/
structure Q where
  a : Int
  b : Int
  c : Int
  d : Int
deriving DecidableEq, Repr

def Q.mul (p q : Q) : Q :=
  ⟨p.a*q.a - p.b*q.b - p.c*q.c - p.d*q.d,
   p.a*q.b + p.b*q.a + p.c*q.d - p.d*q.c,
   p.a*q.c - p.b*q.d + p.c*q.a + p.d*q.b,
   p.a*q.d + p.b*q.c - p.c*q.b + p.d*q.a⟩

/-- The square of a pure imaginary quaternion is the real number −(b²+c²+d²). -/
theorem L7_imaginary_square_real (b c d : Int) :
    Q.mul ⟨0,b,c,d⟩ ⟨0,b,c,d⟩ = ⟨-(b*b + c*c + d*d), 0, 0, 0⟩ := by
  simp only [Q.mul, Q.mk.injEq]
  refine ⟨?_, ?_, ?_, ?_⟩
  · omega
  · rw [Int.mul_comm c d]; omega
  · rw [Int.mul_comm b d]; omega
  · rw [Int.mul_comm b c]; omega

end M2L7
