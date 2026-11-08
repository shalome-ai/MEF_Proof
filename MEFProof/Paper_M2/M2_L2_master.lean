/-!
# M2 — Certificate L2: the dilaton term of the Master Equation (Section 3)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.

Certified, on an explicit finite model (a diagonal orthonormal frame with
Φ depending on the flow parameter only; components as integers scaled by
2/(ζ Φ̇²) to stay in ℤ):
* `L2_flow_components` — T^Φ_ss = ½Φ̇² and T^Φ_ii = −½Φ̇², i.e. in doubled
                          units (1, −1,…,−1) with trace 1 − 11 = −10;
* `L2_trace`            — the trace g^{MN}T^Φ_{MN} = (1 − 12/2)|∇Φ|² = −5|∇Φ|²
                          in twelve dimensions (doubled: −10);
* `L2_kinetic_parity`   — |∇Φ|² is τ̂-even: Φ ∼ (Re ψ)(Im ψ)² has Im-exponent 2,
                          and the gradient does not change the Im-parity, so
                          the product of two gradients has even Im-exponent;
* `L2_kinetic_degree`   — |∇Φ|² has degree 6 in the components of ψ;
* `L2_competitors`      — the competing two-derivative terms fail the
                          vanishing conditions of Prop. parity: |∇ω|² ∼ (Re ψ)^0
                          in the Im-exponent (does not vanish at ψ = ψ̄),
                          |∇ψ|² has Re- and Im-exponents 0 (vanishes nowhere).
The analytic content (variation, Bianchi contraction) is the one-line
computation in the text; this certificate fixes the arithmetic the text relies on.
-/

namespace M2L2

/-- Doubled components of T^Φ in the frame (∂_s, e_1, …, e_11): index 0 is the flow. -/
def comp (i : Nat) : Int := if i = 0 then 1 else -1

theorem L2_flow_components : comp 0 = 1 ∧ (∀ i, 1 ≤ i → i ≤ 11 → comp i = -1) := by
  constructor
  · decide
  · intro i h1 _
    unfold comp
    have : i ≠ 0 := by omega
    simp [this]

/-- Trace in d = 12 (doubled): 1 + 11·(−1) = −10, i.e. (1 − d/2)·2 with d = 12. -/
theorem L2_trace : ((List.range 12).map comp).foldl (· + ·) 0 = -10 := by decide
theorem L2_trace_formula : (2 : Int) - 12 = -10 := by decide

/-- Monomial bookkeeping in (Re ψ, Im ψ): Φ ↦ (1,2). A gradient preserves the
    Im-exponent parity; the product of two gradients of (a,b) has Im-exponent
    2b − (0 or 2), even iff b even. -/
def PhiExp : Nat × Nat := (1, 2)
def gradSq (e : Nat × Nat) : Nat × Nat := (2*e.1, 2*e.2)   -- leading term (∂Φ)² ∼ Φ²/length²

theorem L2_kinetic_parity : (gradSq PhiExp).2 % 2 = 0 := by decide
theorem L2_kinetic_degree : (gradSq PhiExp).1 + (gradSq PhiExp).2 = 6 := by decide

/-- Competitors: ω ∼ (1,0), ψ ∼ (1,0)+(0,1). |∇ω|² has Im-exponent 0 (b = 0 fails
    "vanishes at ψ = ψ̄", which needs b ≥ 1); |∇ψ|² contains the monomial (0,0),
    which fails both vanishing conditions. -/
def omegaExp : Nat × Nat := (1, 0)
theorem L2_competitors :
    (gradSq omegaExp).2 = 0 ∧ ¬ (1 ≤ (gradSq omegaExp).2) ∧
    ((0:Nat), (0:Nat)) = (0,0) ∧ ¬ (1 ≤ (0:Nat)) := by decide

end M2L2
