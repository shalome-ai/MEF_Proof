/- T2_L5_phi_dressing.lean — the dressed kinetic ratios, cleared of exponentials: write D = e^{(2+ζ)Φ} as a positive factor. © Dhiren J. Master 2026. -/
/-! With k = k0·D and k_Y0 = R_c², k_W0 = R_w²: k_Y/k_W = τ² ⇔ R_c² D_Y / (R_w² D_W) = R_w²/R_c² ⇔ D_Y R_c⁴ = D_W R_w⁴. -/
theorem dressing_requirement (Rc2 Rw2 DY DW : Int) : Rc2 * DY * Rc2 = DW * Rw2 * Rw2 ↔ DY * Rc2^2 = DW * Rw2^2 := by
  constructor <;> intro h <;> grind
/-! And the colour sector: k_s/k_W = R_c²/R_w² with k_s0 = R_c², k_W0 = R_w² forces D_s = D_W (for nonzero radii): -/
theorem colour_constraint (Rc2 Rw2 Ds DW : Int) (hRc : Rc2 ≠ 0) (hRw : Rw2 ≠ 0)
    (h : Rc2 * Ds * Rw2 = Rc2 * DW * Rw2) : Ds = DW := by
  have : Rc2 * Rw2 * (Ds - DW) = 0 := by grind
  rcases Int.mul_eq_zero.mp this with h1 | h1
  · rcases Int.mul_eq_zero.mp h1 with h2 | h2 <;> contradiction
  · omega
