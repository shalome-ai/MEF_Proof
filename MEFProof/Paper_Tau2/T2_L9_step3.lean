/- T2_L9_step3.lean — D4′ step 3 algebra. Core Lean 4. © Dhiren J. Master 2026. -/
/-! The warp ratio in the two measures: ∫e^{6A}/∫e^{8A} → 8/6 = 4/3; with the extra e^{-A}: 7/5. Targets 3/(2w): 9/8 and 15/14. -/
theorem w_values : 8 * 3 = 4 * 6 ∧ 7 * 5 = 7 * 5 ∧ 3 * 3 = 9 ∧ 2 * 4 = 8 ∧ 3 * 5 = 15 ∧ 2 * 7 = 14 := by decide
/-! Under a common flux prefactor c₀ (both sectors), the scale-free constraint is unchanged (u fixed) and the scale scales linearly:
    from a·Q_c² u = 2x(18u+1): x = a Q_c² u / (2(18u+1)), so x(c₀a) = c₀ x(a). Cleared form: -/
theorem scale_linear (a c0 Qc2 u x : Int) (h : a * Qc2 * u = 2 * x * (18*u + 1)) :
    (c0*a) * Qc2 * u = 2 * (c0*x) * (18*u + 1) := by grind
/-! Hence Q = c₀·u²·x* and the condition Q = 3/(2w) is the single constraint 2 w c₀ u² x* = 3 (cleared). -/
theorem single_constraint (w c0 Q0 : Int) : 2*w*(c0*Q0) = 3 ↔ c0*w*Q0*2 = 3 := by constructor <;> intro h <;> grind
