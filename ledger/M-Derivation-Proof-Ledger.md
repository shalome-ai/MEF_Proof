# M-Derivation-Proof-Ledger

**The source of truth for the Mx series: where each load-bearing result lives, at what rigour, under which readings and minimality choices, and which Lean theorem certifies its finite part.** Seeded 9 November 2026 from M1 (canon, v2) and M2 (v1 draft). Maintained by the architect as proposals; **the PI banks every row**.

**Columns.** Result · Site (paper, label) · Rigour · Depends on (readings R1–R5; Minimality entries Mx-n; external results EXT) · Certificate (file: theorem names) · Status.

**Status vocabulary.** **BANKED** — in a frozen canon paper, PI-banked. **DRAFT** — in a complete draft awaiting freeze. **PROVISIONAL (old ledger row n / paper)** — imported from `proof_derivation_ledger_v22.md` as a *menu*; may not be cited by any Mx paper until re-derived in-document and flipped to BANKED, or **STRUCK (reason)**. **TARGET (owing paper)** — not yet derived.

**Readings in force.** R1–R4: M1's four (Def 2.1–2.7 and the readings table). R5: M2 Def. riemannian — positive-definite metric; time is the drive's orbit parameter. Minimality entries: `registers/Minimality_Register.md`.

---

## M1 — Four axioms and their minimal geometry (`canon/M1/Paper_M1_Four_Axioms_v2.tex`, 49 theorems, L1–L5) — all rows BANKED

| Result | Site | Rigour | Depends on | Certificate | Status |
|---|---|---|---|---|---|
| A4 ⇔ hyperbolic return map (\|tr\| > 2); trace 2 excluded | M1 Prop 4.1 | [R] | EXT Katok–Hasselblatt | `M1_L1_drive.lean`: `L1_trace3_min` | BANKED |
| Uniqueness of the trace-3 class: every trace-3 M ∈ SL(2,ℤ) is conjugate to ((2,1),(1,1)); two routes | M1 Thm 4.2 | [R] | EXT Latimer–MacDuffee, Taussky; Gauss | `L1_reduced_disc5`, `L1_cycle_disc5`, `L1_conj_M0_inv` | BANKED |
| Odd trace ⇔ order 3 mod 2 ⇔ corner 3-cycle; M₀ fixes P₁, cycles P₂P₃P₄ | M1 Prop 4.3 | [R] | — | `L1_odd_trace_iff_order_three`, `L1_M0_mod2_order3` | BANKED |
| Division property from A1; 𝒜 = ℍ by Frobenius | M1 Lem 5.1, Prop 5.2 | [D] | A1, A2, A3; EXT Frobenius | `M1_L2_fibre.lean`: `L2_hamilton`, `L2_norm_posdef` | BANKED |
| Four corners = Q₈/{±1}, V ≅ ℤ₂×ℤ₂ | M1 Prop 5.3 | [R] | — | `L2_corner_count` | BANKED |
| Commutative fixed subalgebras of V×⟨ι⟩ are ℝ, ℂᵢ, ℂⱼ, ℂₖ | M1 Prop 5.4 | [R] | — | `L2_fix_*`, `L2_iperp_not_closed` | BANKED |
| Fibre is T² with inversion and linear drive (Franks; 2ⁿ = 4) | M1 Prop 5.5 | [D] | A2–A4, M1-2 (dimension tier); EXT Franks 1970 | `L2_two_torsion` | BANKED |
| Corner algebras by stabiliser under ⟨ι, M₀⟩; Ad_w cycles i→j→k | M1 Prop 5.6 | [D] | A2, A3, A4; reading: ι on the algebra identified with ι on spinors (M1's one [D] reading); **refined by M2: ι = τ² (fold); A2's involution is τ** (Register §13) | `L2_Ad_w_cycles`, `L2_w_cubed` | BANKED (refinement noted) |
| Pillowcase: unique Euclidean (2,2,2,2) orbifold; χ_orb = 0; χ = 2 by two routes | M1 Thm 5.7 | [R] | EXT Thurston; Satake/Kawasaki | `L2_chi_orb_zero`, `L2_chi_pillowcase` | BANKED |
| Dimension: 4 ∣ D; quaternionic dim F ≥ 2 ⇒ D ≥ 12; 4–11 fail; 12 least | M1 Thm 6.1 | [D] | Def 2.5 (v2); M1-2; EXT Salamon | `M1_L3_dimension.lean`: `L3_*` | BANKED |
| Split (3,6) unique given dim F ≥ 8; (7,2) excluded | M1 Rem 6.2 | [R] | — | `L3_split_three_six`, `L3_seven_two_meets_congruences` | BANKED |
| S² = Sp(1)/U(1), sphere of imaginary units | M1 Prop 7.1 | [D] | Def 2.6 (v2) | `M1_L4_base.lean`: `L4_unit_sphere_axes` | BANKED |
| ℂP² = SU(3)/U(2); χ = 3; c₁ = 3h | M1 Prop 7.2 | [D] | Def 2.6 | `L4_chern_CP2`, `L4_chi_counts` | BANKED |
| Spin^c necessary (w₂ = h); L odd; canonical L = 𝒪(3); twisting line excluded | M1 Prop 7.3 | [D] | Def 2.5; M1-3; EXT Lawson–Michelsohn | `L4_not_spin_and_congruence`, `L4_odd_lines` | BANKED |
| Corner lift (−1)^{mn}, product −1 | M1 Cor 7.4 | [R] | EXT Atiyah–Bott | `L4_four_corner_product` | BANKED |
| Σ = S³ (least \|π₁\|) | M1 Prop 7.5 | [D] | M1-4 | — | BANKED |
| χ(K₈) = 3·2·2 = 12 | M1 Thm 7.6 | [R] | Künneth | `L3_chi_K8` | BANKED |
| Minimality theorem (assembly) | M1 Thm 8.1 | [D] | all above; the declared scale | — | BANKED |
| Scale eliminated to Q_w²(18u+1) = Q_c²u²(6u+1); (3,6) ⇒ 6u³+u²−72u−4 = 0; scale a Hessian saddle | M1 Prop 8.2 | [D]/[R] | M1-5; the stationarity conditions themselves are hypotheses **owed by the sequel (M7)** | `M1_L5_vacuum.lean`: `L5_ratio`, `L5_cubic` | BANKED (hypotheses → TARGET M7) |
| Witten 1981 recovered (cross-check) | M1 §8.4 | [R] | EXT | — | BANKED |

*Ledger header correction carried: M1 is v2 (26 pp., 49 theorems); the old ledger's "v1 / 16 pp. / 45" is superseded. M1 v2 §2 numbering: readings are Definitions 2.5 (spinors/tangent) and 2.6 (orbits), A4 formal is 2.7.*

## M2 — The Master Equation from four axioms (`canon/M2/Paper_M2_Master_Equation_v1.tex`, v1.0 canon 9 Nov 2026, L1–L7, 55 theorems) — rows BANKED

| Result | Site | Rigour | Depends on | Certificate | Status |
|---|---|---|---|---|---|
| Fifth reading: positive-definite metric; time = orbit parameter of the drive | M2 Def riemannian | reading R5 | PI ruling Q8; M2-4 | — | BANKED |
| Standing principle of minimality (series rule) | M2 §readings | principle | PI ruling 8 Nov | — | BANKED |
| ψ, ψ̄ sections of the Clifford module M ≅ ℍ³² (Cl(0,12) ≅ ℍ(32)); shadow ψ̄ = τ̂ψ; corner reading in 𝒞 | M2 Def ψ | [D] | A3 (M1 Def 2.5, Prop 7.3); EXT Bott periodicity; R-F1(Φ) adopted (Q17) | `M2_L7_module.lean`: `L7_bott`, `L7_module_dims` | BANKED |
| ω = ψ + τ̂ψ (even), ψ − τ̂ψ (odd); ω quaternion-valued, unique carrier of the imaginary direction; Φ_QC = ω|ψ−ψ̄|² (modulus squared, P10) | M2 Def ω; Prop parity remark | [R] | R1 (ruled), Q17(b) | `L7_imaginary_square_real` | BANKED |
| Parity theorem: lowest τ̂-even invariant vanishing on both degenerate loci is degree 3, exponents (1,2): Φ = ω(ψ−ψ̄)² up to constant and factor order | M2 Prop parity | [R] given the two vanishing conditions (inputs: R1; motivated condition) | — | `M2_L1_parity.lean`: `L1_unique`, `L1_vanish_Im`, `L1_vanish_Re`, `L1_table_*`, `L1_sign_mul` | BANKED |
| Sol block = suspension of M₀; Sol metric is A2's law with κ = log φ²; sheets = eigen-directions | M2 §handedness | [D] | M1 Thm 4.2; EXT Thurston | `M2_L4_handedness.lean`: `L4_eigen` | BANKED |
| Flow reversals: involutive ⇒ det −1 (orientation-preserving); quarter-turn S: SM₀S⁻¹ = M₀⁻¹, S² = fold, orientation-reversing | M2 Prop reversal | [R] | — | `L4_S_conj`, `L4_S_sq_fold`, `L4_S_det`, `L4_tau_reverses`, `L4_swap_lines`, `L4_involution_det` | BANKED |
| A2's involution is τ = (S, s ↦ −s); τ² = fold (refines M1's ι) | M2 §handedness | [D] | M2-5 | — | BANKED |
| Handedness theorem: ψ̄ = τ̂ψ has opposite chirality (Pin, any signature) | M2 Thm handedness | [R] | EXT Lawson–Michelsohn; R5 | `L4_swap_lines` | BANKED |
| Action on M₁₂: one gravitational term; induced Spin^c connection inside the bracket (no gauge coupling; flux quanta topological); Φ via module trace; Λ₁₂ by solvability | M2 Def action | [D] | M2-1, M2-2 (amended), M2-3, M2-6, M2-10; EXT Lovelock, Cartan–Weyl–Vermeil | `M2_L2_master.lean`: `L2_competitors`; `L7_three_readings`, `L7_trace_uniform` | BANKED |
| **The Master Equation** G_{MN} = 8πG_eff T_{MN} + ζT^Φ_{MN} + Λ_eff g_{MN}, T^Φ the module trace of the scalar form | M2 Thm master | [R] given the action | — | — | BANKED |
| ζ□Φ = V′; Bianchi consistency; □Φ = 0 where V′ = 0 | M2 eq dilaton, Prop bianchi | [R] | — | — | BANKED |
| Flow components: T_ss = ½⟨Φ̇,Φ̇⟩, T_ii = −½⟨Φ̇,Φ̇⟩; stiff reading along the flow | M2 Prop stiff | [R]; reading R5 | — | `L2_flow_components`, `L2_trace` | BANKED |
| Base restriction eq:2D is Paper 2's Σ-2 system; a = −ζΦ with ΔΦ = 1 per half-period the solution relation | M2 §base-restriction, §base-system | [D] | EXT O'Neill; Paper 2 §7.3 reproduced | — | BANKED |
| Axiom attribution: Einstein = A1 + A3; extra term = A2; two-ness/arrow = A4 | M2 §3 after thm:master; §1 | [D] | all above | — | BANKED |
| χ(pillowcase) = 2 two routes; 4π total, π per corner; χ(K₈) = 12; tadpole N = 12 on the base cycle | M2 Props chi-*, flux | [R]/[D] | M1 Thm 5.7, 7.6; weak (c) Q14; Addendum §4.6 reason reproduced | `M2_L3_zeta.lean`; `M2_L5_warp.lean`: `L5_chi_pillowcase`, `L5_deficit`, `L5_chi_K8` | BANKED |
| BPS completion; flux density at P₁; FD check; exact kink [∂a] = −κ₂²Nπ; constant slope (boundary condition); κ₂² = 2/L (normalisation, [D]) | M2 §§bps–gb | [R] (jump) / [D] (slope, κ₂²) | M2-6; Q16 | `L5_FD_check`, `L5_balance` | BANKED |
| **kL = Nπ; ζ = χ(K₈)π = 12π** | M2 Thm warp-exponent, Cor zeta | [R] given the [D] inputs above | Q15 (direction-blind; τ₂ the physical remnant) | `L5_zeta`, `L5_single_flux`, `L5_tau_corners` | BANKED |
| ω = 0 at the locked phase (τ̂ψ = −ψ) | M2 Prop locked | [R] | R1 | — | BANKED |
| ω orbit-average = space average (ergodic drive); = 0 for uniform phase | M2 Prop uncorrelated | [R] | EXT Katok–Hasselblatt; M1 Prop 4.1 | — | BANKED |
| One hump in the lock angle; Φ extremal at tan²ϑ = 2 (ϑ* ≈ 54.7°) — new | M2 §hump | [D]/[R] | — | `M2_L6_omega.lean`: `L6_Phi_coefficient`, `L6_Phi_extremum`, `L6_hump_zeros` | BANKED |
| ω has a definite sign on the decaying-warp solutions (half-circle); which sign is ψ's convention | M2 §half-circle | [D] | M2-9 | `L6_sign`, `L6_flip` | BANKED |
| ω's spectral face (GUE maximum) | M2 §omega-hook | [M] | — | — | TARGET (M4) |

## Targets registered for later papers (from M2 and the series SOW)
| Result | Owing paper | Lead |
|---|---|---|
| Cone-tip Dirac spectrum; λ_n = n, d_odd(n); ζ(s)²(1−2^{−s}); partition function mock Jacobi; bridge field-ω ↔ spectral functional | M4 | Future-Mx §12.1 |
| Stationarity conditions of M1 Prop 8.2 derived from the reduced action; Λ₁₂ by solvability (R-τ8 as theorem or refuted); equal weighting via the module trace; τ₂ = 1.8466 | M7 | M1 proof of Prop 8.2; Q17(3) |
| The Sp(1) structure of the commutator remainder in Φ's degree-three invariant; the S² flux | M7 | M2 Prop parity remark |
| κ₂² = 2/L from orbifold Gauss–Bonnet with warped weights ([D] → [R]) | M7 or M10 | M2 §gb |
| Paper 2 §5.1 Einstein-frame weight "+2" (e^{−96π}) | M10 | Register §15 (withdrawn) note |
| Σ-5 from A1 | M3 → M5 | M3 SOW WP3 |

## PROVISIONAL imports from the old ledger (menu only; not citable until re-derived)
*To be populated per paper at its opening session, from `proof_derivation_ledger_v22.md` rows for the paper's sources, each marked PROVISIONAL (old ledger line n) with the old rigour tag quoted, never trusted. The first import is M3's (Paper XX rows) and M4's (Paper 3 Prop 5; Paper 5 d_odd; Paper XI).*
