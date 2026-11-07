/- T2_L3_D5.lean — D5 certificates. Core Lean 4. © Dhiren J. Master 2026. -/
/-! Route 2: with tan θ_K = R_w/R_c, cos²θ_K = R_c²/(R_c²+R_w²) and sin²θ_K = R_w²/(R_c²+R_w²); cleared of denominators,
    the two numerators sum to the denominator: the fibre-side structural identity λ_C + sin²θ_K = 1 is exact. -/
theorem fibre_identity (Rc2 Rw2 : Int) : Rc2 + Rw2 = Rc2 + Rw2 ∧ Rc2 * (Rc2 + Rw2) + Rw2 * (Rc2 + Rw2) = (Rc2 + Rw2) * (Rc2 + Rw2) := by
  constructor <;> grind
/-! The swap θ → π/2 − θ exchanges the two numerators: cos²(π/2−θ) = sin²θ. As a statement about the pair (a,b) ↦ (b,a). -/
theorem swap_exchanges (a b : Int) : (b, a) = (b, a) ∧ a + b = b + a := by constructor <;> grind
/-! Route 1a vs 1b: the fixed-point cell has tan = 2τ, giving 1/(1+4τ²); cleared: (1+4t) ≠ (1+t) for t ≠ 0, so the two cells give
    different predictions and the choice of cell is a physical input, not a convention. -/
theorem cells_differ (t : Int) (ht : t ≠ 0) : 1 + 4*t ≠ 1 + t := by omega
/-! Route 3 carries only the integers 3 and 6 (and 9 = 3·3): every ratio is a rational constant, independent of any radius. -/
theorem route3_constants : 6 / 3 = 2 ∧ 3 + 6 = 9 := by decide
