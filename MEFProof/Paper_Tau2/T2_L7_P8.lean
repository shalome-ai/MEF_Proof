/- T2_L7_P8.lean — P-8: the hypercharge S² component is a removable kinetic mixing. Core Lean 4. © Dhiren J. Master 2026. -/
/-! Kinetic matrix K = [[kc + y²kw, y kw],[y kw, kw]] in (B, W³). det K = kc·kw for every y. -/
theorem det_independent_of_y (kc kw y : Int) : (kc + y^2*kw)*kw - (y*kw)*(y*kw) = kc*kw := by grind
/-! Under (B, W³) ↦ (B, W³ − yB) the form becomes diagonal: the three entries of Sᵀ K S. -/
theorem mixing_removed (kc kw y : Int) :
    ((kc + y^2*kw) - 2*y*(y*kw) + y^2*kw = kc) ∧ ((y*kw) - y*kw = 0) := by constructor <;> grind
/-! so(3): [L₃, L₁] = L₂ ≠ 0 on the standard 3×3 generators, entry (0,2) of the commutator is 1. -/
theorem so3_noncommuting : (0:Int)*0 + (-1)*0 + 0*(-1) - (0*0 + 0*(-1) + 1*(-1)) = 1 := by decide
