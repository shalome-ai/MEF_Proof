/- T2_L6_hypercharge_S2.lean — the R-τ12 hypercharge Killing norm. Core Lean 4. © Dhiren J. Master 2026. -/
/-! k_Y/k_W = (R_c² + b² R_w²)/R_w², so with u = τ² = R_w²/R_c²: cleared, k_Y·u = k_W·(1 + b²u) when k_W = R_w², k_Y = R_c² + b²R_w². -/
theorem hypercharge_sum (Rc2 Rw2 b2 : Int) : (Rc2 + b2*Rw2) * Rw2 = Rw2 * Rc2 + b2 * Rw2 * Rw2 := by grind
/-! sin²θ_W = k_W/(k_W + k_Y) = R_w²/(R_w² + R_c² + b²R_w²); with b² = 3 and τ² = R_w²/R_c² the denominator is R_c²(1 + 4τ²):
    cleared: R_w² + R_c² + 3R_w² = R_c² + 4R_w². -/
theorem b2_three (Rc2 Rw2 : Int) : Rw2 + Rc2 + 3*Rw2 = Rc2 + 4*Rw2 := by grind
/-! The sum form is never R_w⁴/R_c² (already: no_killing_combination in T2_L4); here the specific b² = 3 instance at (1,1): 4 ≠ 1. -/
theorem sum_not_quartic : (1:Int) + 3*1 ≠ 1 := by decide
