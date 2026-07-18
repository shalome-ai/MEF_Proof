/-!
# Paper 2 — Certificate L3 (v1): The stability bracket of the de Sitter minimum

Core Lean 4.15.0 only (no Mathlib, no axioms, no `sorry`).

Certifies the rational arithmetic of Paper 2 §7 (eq:critical, eq:Vpp): the
bracket entering the second derivative of the two-term potential
V(Φ) = V_min(λ e^{−8ζΦ} + β e^{−10ζΦ}) at its critical point. The analytic
surroundings (exponentials, the potential itself) are out of Lean scope per
the SOW; what is certified is the exact rational bracket, in the
"bracket Lean-certified" pattern of Paper 1.

Statements:

1. `critical_ratio`     — stationarity 8·|λ|·E8 = 10·β·E10 rearranges, with
                          denominators cleared, to 4·(|λ|·E8) = 5·(β·E10):
                          the exact critical-point ratio 4/5 behind
                          e^{−2ζΦ*} = 4|λ|/(5β), certified as the integer
                          identity on the cleared form.
2. `substitution_step`  — the substitution λ·E8 = −(5/4)·β·E10 in cleared
                          form: 4·(λ·E8) = −5·(β·E10) follows from
                          stationarity with λ = −|λ| < 0.
3. `vpp_bracket`        — the second-derivative bracket: 64·(−5) + 100·4
                          = −320 + 400 = 80 = 4·20, i.e. after clearing the
                          factor 4, the coefficient is exactly 20 —
                          V″(Φ*) = 20·V_min·ζ²·β·e^{−10ζΦ*}.
4. `vpp_positive`       — the certified coefficient is strictly positive:
                          20 > 0. With every remaining factor a square or a
                          declared-positive quantity (V_min, ζ², β, the
                          exponential), the minimum is stable and the sign
                          of the vacuum energy is the flux term's: de Sitter.
5. `bracket_smallest`   — smallest case displayed in-document: the ratio
                          64·(5/4) = 80 versus 100, gap 20, certified as
                          64·5 = 4·80 and 100·4 − 64·5 = 80 = 4·20.

Abstract-variable convention: E8 and E10 stand for the (strictly positive)
exponential values e^{−8ζΦ*} and e^{−10ζΦ*}; L stands for |λ| > 0; B for
β > 0. All identities are certified over ℤ with these as abstract symbols,
so no numerical model of the exponentials, of ζ, or of Φ* enters.
-/

namespace P2L3

/-- Stationarity in cleared form. From V'(Φ*) = 0, i.e.
    8·L·E8 = 10·B·E10 (L = |λ|, all symbols positive), dividing by 2:
    4·(L·E8) = 5·(B·E10). Certified as: the hypothesis 8·x = 10·y implies
    4·x = 5·y over ℤ, where x := L·E8 and y := B·E10. -/
theorem critical_ratio (x y : Int) (h : 8 * x = 10 * y) : 4 * x = 5 * y := by
  omega

/-- The substitution step of eq:Vpp. With λ = −L (λ < 0), stationarity
    8·L·E8 = 10·B·E10 gives the signed identity 4·(λ·E8) = −5·(B·E10):
    certified as 8·x = 10·y → 4·(−x) = −(5·y). -/
theorem substitution_step (x y : Int) (h : 8 * x = 10 * y) :
    4 * (-x) = -(5 * y) := by
  omega

/-- The second-derivative bracket. V″(Φ*) ∝ 64·λ·E8 + 100·β·E10; inserting
    the substitution 4·(λ·E8) = −5·(β·E10), i.e. λ·E8 = −(5/4)·(β·E10) in
    cleared form, the bracket becomes (100·4 + 64·(−5))/4 = 80/4 = 20 times
    β·E10. Certified with denominators cleared: for every y,
    64·(−5·y) + 100·(4·y) = 4·(20·y). -/
theorem vpp_bracket (y : Int) : 64 * (-5 * y) + 100 * (4 * y) = 4 * (20 * y) := by
  omega

/-- Integer core of the bracket: 100·4 − 64·5 = 80 = 4·20. -/
theorem vpp_bracket_int : 100 * 4 - 64 * 5 = 4 * 20 := by decide

/-- Strict positivity of the certified coefficient: 20 > 0. Every remaining
    factor of V″(Φ*) = 20·V_min·ζ²·β·e^{−10ζΦ*} is positive (V_min > 0
    declared, ζ² a square, β > 0 by the flux positivity of eq:flux-energy,
    the exponential positive), so the critical point is a stable minimum. -/
theorem vpp_positive : (0 : Int) < 20 := by decide

/-- Smallest case as displayed in §7: the two competing coefficients are
    64·(5/4) = 80 (curvature, destabilising) against 100 (flux,
    stabilising); the gap is 20. Cleared forms: 64·5 = 4·80 and
    100·4 − 64·5 = 80. -/
theorem bracket_smallest : 64 * 5 = 4 * 80 ∧ 100 * 4 - 64 * 5 = 80 := by
  constructor <;> decide

end P2L3
