/- T2_L13_step4b.lean — 4b warp-weight bookkeeping. Core Lean 4. © Dhiren J. Master 2026. -/
/-! Powers of e^{A}: measure 6, minus 2 per inverse fibre metric, plus 2 for the Killing contraction, plus 2 for the Einstein-frame factor. -/
theorem warp_exponents : (6 - 4 = 2) ∧ (6 - 4 + 2 = 4) ∧ (6 - 2 + 2 = 6) ∧ (6 + 0 = 6) ∧ (6 + 2 = 8) := by decide
/-! With I_n ∝ 1/n the two warp ratios: (I₄/I₆)(I₈/I₆) = (6/4)(6/8) = 9/8 and (I₂/I₄)(I₈/I₆) = (4/2)(6/8) = 3/2. -/
theorem warp_ratios : 6 * 6 * 8 = 9 * 4 * 8 ∧ 4 * 6 * 2 = 3 * 2 * 8 := by decide
/-! Premise (c) fails: 2 ≠ 6 and 4 ≠ 6. -/
theorem premise_c_fails : (2:Nat) ≠ 6 ∧ (4:Nat) ≠ 6 := by decide
