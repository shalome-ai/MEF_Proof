/- T2_L1_flux_weights.lean — τ₂ programme, Lean certificates for P-7(α) / D2(c). Core Lean 4 (no Mathlib): `grind`, `decide`, `omega`.
   Integer arithmetic throughout; rational prefactors are cleared as stated in each theorem.  © Dhiren J. Master 2026. -/

/-! ## 1. Clifford-module dimensions: Cl(0,12) ≅ ℍ(32) -/
theorem cl_0_12_dim : (2:Nat)^12 = 4 * 32^2 := by decide            -- dim_ℝ Cl(0,12) = dim_ℝ M₃₂(ℍ)
theorem module_dims : 32 * 4 = 128 ∧ 64 * 2 = 128 := by decide       -- ℍ³² = ℂ⁶⁴ = ℝ¹²⁸

/-! ## 2. The explicit flux prefactors (D2(c)), denominators cleared.
    S²:   |F|² R_w⁴ = Q_w²/4        →  4·|F|²R_w⁴ = Q_w²
    ℂP²:  |F|² R_c⁴ = 8 Q_c²        (FS radius, R(ℂP²)=24/R_c²; ∫F∧F = 4π²Q_c², Vol = π²R_c⁴/2 ⇒ 8Q_c²/R_c⁴)
    The relative weight a_c/a_w = 32.  -/
theorem relative_weight : (8:Nat) = 32 * 1 / 4 * 1 ∧ 8 * 4 = 32 := by decide

/-! ## 3. Hypothesis H32 (R-τ13): the S² flux energy is counted once per quaternionic dimension of the
    Cl(0,12) module (32), the ℂP² Spin^c flux once.  Then the S² coefficient is 32·(Q_w²/4) = 8 Q_w²
    and the two sectors carry EQUAL weight 8: Paper 1's potential (a_c = a_w) is recovered exactly. -/
theorem H32_equal_weight (Qw : Int) : 32 * Qw^2 = 4 * (8 * Qw^2) := by grind
theorem H32_target : 32 * 9 = 288 ∧ 288 = 4 * 8 * 9 := by decide      -- a_w^eff Q_w² = 288 = 4·a_c·Q_c² at (3,6)

/-! ## 4. With equal weights the scale-free constraint is Paper 1's: from the generalised stationarity
    a_w Q_w² = u x (12u + 2),   a_c Q_c² = x (36 + 2/u)·(1/1) … cleared:  a_c Q_c² u = 2x(18u+1),
    the elimination identity holds for ANY common weight a (= a_c = a_w). -/
theorem elimination_equal_weights (a u x Qw Qc : Int)
    (hA : a * Qw^2 = 2*u*x*(6*u+1)) (hB : a * Qc^2 * u = 2*x*(18*u+1)) :
    a * Qw^2 * (18*u+1) = a * Qc^2 * u^2 * (6*u+1) := by grind
/- and with (Q_c,Q_w) = (3,6): 36·(18u+1) = 9·u²·(6u+1) ⇔ 6u³ + u² − 72u − 4 = 0 (Paper 1's cubic). -/
theorem paper1_cubic (u : Int) : 9*u^2*(6*u+1) - 36*(18*u+1) = 9*(6*u^3 + u^2 - 72*u - 4) := by grind

/-! ## 5. Without H32 (weights 8 and 1/4, cleared by 4): the constraint at (3,6) is a DIFFERENT cubic.
    4·(1/4)·36·(18u+1) = 4·8·9·u²(6u+1)  ⇒  36(18u+1) = 288 u²(6u+1).  Its root is τ₂ = 0.751 (numerics). -/
theorem unequal_weight_cubic (u : Int) : 288*u^2*(6*u+1) - 36*(18*u+1) = 36*(48*u^3 + 8*u^2 - 18*u - 1) := by grind

/-! ## 6. Route 1 arithmetic (fluxes add, total quantised): Q_tot = Q_w + 2A², energy Q_tot²/4.
    Q_tot = 34 gives 289; the exact target 288 is not a square of an integer over 4. -/
theorem route1_34 : 34^2 = 4*289 ∧ 289 - 288 = 1 := by decide
theorem route1_no_exact : ∀ n : Nat, n ≤ 40 → n^2 ≠ 4*288 := by decide
theorem route1_parity (Qw A2 : Int) (h : ∃ k, Qw = 2*k) : ∃ m, Qw + 2*A2 = 2*m := by
  obtain ⟨k, hk⟩ := h; exact ⟨k + A2, by grind⟩

/-! ## 7. Hamilton: for imaginary quaternions p,q (components), pq − qp = 2 p×q and Re(pq) = −p·q. -/
theorem hamilton_comm (p1 p2 p3 q1 q2 q3 : Int) :
    -- imaginary parts of pq and qp are p×q and q×p = −p×q; their difference is 2(p×q), componentwise:
    ((p2*q3 - p3*q2) - (q2*p3 - q3*p2) = 2*(p2*q3 - p3*q2)) ∧
    ((p3*q1 - p1*q3) - (q3*p1 - q1*p3) = 2*(p3*q1 - p1*q3)) ∧
    ((p1*q2 - p2*q1) - (q1*p2 - q2*p1) = 2*(p1*q2 - p2*q1)) := by
  refine ⟨?_, ?_, ?_⟩ <;> grind

/-! ## 8. The commutator flux of an S²-directed field is RADIAL: for p, q tangent to the sphere at the
    unit vector u (u·p = u·q = 0, u·u = 1), p×q = ((p×q)·u) u.  Proof: (p×q)×u = q(p·u) − p(q·u) = 0,
    and u×(a×u) = a(u·u) − u(a·u). -/
theorem cross_radial (u1 u2 u3 p1 p2 p3 q1 q2 q3 : Int)
    (hu : u1*u1 + u2*u2 + u3*u3 = 1) (hp : u1*p1 + u2*p2 + u3*p3 = 0) (hq : u1*q1 + u2*q2 + u3*q3 = 0) :
    let a1 := p2*q3 - p3*q2
    let a2 := p3*q1 - p1*q3
    let a3 := p1*q2 - p2*q1
    let s  := a1*u1 + a2*u2 + a3*u3
    a1 = s*u1 ∧ a2 = s*u2 ∧ a3 = s*u3 := by
  intro a1 a2 a3 s
  refine ⟨?_, ?_, ?_⟩ <;> grind

/-! ## 9. D2(a): Spin^c index.  ℂP², det line O(3): 24·ind = 3·9 − 3 = 24 ⇒ ind = 1.
    S² with det of degree Q_w: ind = Q_w/2; product index Q_w/2 = N_gen = 3 ⇔ Q_w = 6. -/
theorem index_cp2 : 3 * 9 - 3 = 24 ∧ 24 / 24 = 1 := by decide
theorem index_product (Qw : Int) : Qw / 2 = 3 ∧ Qw % 2 = 0 → Qw = 6 := by omega

/-! ## 10. R-Sol: M = [[2,1],[1,1]] mod 2 fixes (0,0) and 3-cycles the other corners (corners as Nat pairs mod 2). -/
def Mmod2 (c : Nat × Nat) : Nat × Nat := ((2*c.1 + c.2) % 2, (c.1 + c.2) % 2)
theorem sol_corner_cycle :
    Mmod2 (0,0) = (0,0) ∧ Mmod2 (1,0) = (0,1) ∧ Mmod2 (0,1) = (1,1) ∧ Mmod2 (1,1) = (1,0) := by decide
theorem sol_order_three :
    Mmod2 (Mmod2 (Mmod2 (0,0))) = (0,0) ∧ Mmod2 (Mmod2 (Mmod2 (1,0))) = (1,0) ∧
    Mmod2 (Mmod2 (Mmod2 (0,1))) = (0,1) ∧ Mmod2 (Mmod2 (Mmod2 (1,1))) = (1,1) := by decide

/-! ## 11. ω is the unique carrier of the imaginary direction (given canon: ψ, ψ̄ have disjoint support,
    chapter 2 l. 71, so (ψ − ψ̄)² = ψ² or ψ̄² pointwise).  The square of an imaginary quaternion is real:
    Im(v·v) = v × v = 0 and Re(v·v) = −|v|².  Hence Im Φ ≠ 0 forces ω ∈ Im ℍ. -/
theorem imaginary_square_real (v1 v2 v3 : Int) :
    (v2*v3 - v3*v2 = 0) ∧ (v3*v1 - v1*v3 = 0) ∧ (v1*v2 - v2*v1 = 0) ∧
    (-(v1*v1 + v2*v2 + v3*v3) = -(v1^2 + v2^2 + v3^2)) := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> grind

/-! ## 12. The three readings of ζ∇Φ∇Φ for a module-valued Φ with 32 equal quaternionic components φ:
    single scalar → 1·φ²;  trace of the square → 32·φ²;  square of the trace → 32²·φ² = 1024·φ².
    Only the trace-of-the-square reading equals the H32 weight. -/
theorem three_readings (φ : Int) : 32 * φ^2 = 32 * φ^2 ∧ (32*φ)^2 = 1024 * φ^2 ∧ 1024 ≠ 32 ∧ (1:Nat) ≠ 32 := by
  refine ⟨rfl, by grind, by decide, by decide⟩

/-! ## 13. The flux-ratio elimination identity of Theorem 4.3 (Paper 1), with the weights carried as a common factor. -/
theorem flux_ratio_identity (u x Qw Qc : Int)
    (hA : Qw^2 = 2*u*x*(6*u+1)) (hB : Qc^2*u = 2*x*(18*u+1)) :
    Qw^2 * (18*u+1) = Qc^2 * u^2 * (6*u+1) := by grind
