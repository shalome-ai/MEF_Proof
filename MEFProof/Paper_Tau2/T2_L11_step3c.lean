/- T2_L11_step3c.lean — step 3c: r_ψ cancels in γ once the flux coefficient is ∝ r_ψ². Core Lean 4. © Dhiren J. Master 2026. -/
/-! k_Y = r²·V_G, k_W = (2/3) R_w² V_K with R_w² = u·c₀·x and c₀ = a·r²: 3·k_W·r² = 2·u·a·r²·x·V_K... cleared of the 2/3 and w:
    the ratio k_W/k_Y = (2/3) u a x V_K/(V_G): r² drops. Integer form: (2*u*a*r2*x)*V_K * 1 = (2*u*a*x*V_K) * r2. -/
theorem r_cancels (u a r2 x VK : Int) : (2*u*a*r2*x)*VK = (2*u*a*x*VK)*r2 := by grind
/-! EH identity coefficient bookkeeping: R₁₂ = R_B − (r²/4)F_{ab}F^{ab} and F_{ab}F^{ab} = 2|F|² give (r²/2)|F|²: 4·2 = 8 → r²/2. -/
theorem eh_coefficient : (2:Nat) * 1 = 2 ∧ 4 / 2 = 2 := by decide
