/- T2_L8_D4prime.lean — D4′: the geometric-mean relation in kinetic coefficients. Core Lean 4. © Dhiren J. Master 2026. -/
/-! k_W² = k_Y k_s ⇔ (k_W/k_Y)(k_W/k_s) = 1; cleared: with k_W = γ k_Y and k_W = τ² k_s … as integer identities on the products. -/
theorem geometric_mean_iff (kY kW ks : Int) : kW * kW = kY * ks ↔ kW * kW - kY * ks = 0 := by constructor <;> intro h <;> grind
/-! With k_W = g·k_Y and k_s·T = k_W (T = τ²): k_W² = k_Y k_s ⇔ g·T = 1 (for k_Y ≠ 0, k_s ≠ 0): the canon formula sin² = 1/(1+T)
    is exactly the geometric-mean relation combined with α_s/α_w = τ². -/
theorem canon_formula_core (kY ks g T : Int) (h : g*kY = T*ks) :
    (g*kY)*(g*kY) = kY*ks ↔ g*T*(kY*ks) = kY*ks := by
  constructor <;> intro hh <;> grind
/-! sin²θ_W = γ/(1+γ) and γ = 1/τ² give sin² = 1/(1+τ²): cleared, γ(1+τ²) = (1+γ)·1 when γτ² = 1. -/
theorem sin2_from_gamma (g T : Int) (h : g*T = 1) : g*(1+T) = 1 + g := by grind
