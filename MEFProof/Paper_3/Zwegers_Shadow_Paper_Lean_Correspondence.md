# Certificate correspondence

This file states, for each machine-checked result in this repository, which
numbered result of the corresponding paper it certifies and which Lean
declaration carries it.

It exists because a proof assistant verifies that a stated theorem follows from
its premises; it does not verify that the stated theorem is the one the paper
asserts. That correspondence is a matter of reading, and this table is what
makes the reading possible. The axiom footprint of each result is recorded
separately in `Zwegers_Shadow_Paper_Axiom_Audit.md`.

---

## Paper 3 — *The Zwegers shadow as U(1)-projected intrinsic torsion*

Sixteen certificates, all compiling under Lean 4.29.1. Numbering follows the
published version of the paper.

### §2 — The determinant line

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Lemma 2.1 · *Tangent Chern class of ℂP²* | `C1_c1L_anchoring` | `C1.chern_poly_expand`, `C1.c1_coeff` |
| Proposition 2.2 · *The determinant line is O(3)* | `C1_c1L_anchoring` | `C1.c1L_eq` |
| Remark 2.3 · *What the congruence does, and does not, force* | `C1_c1L_anchoring` | `C1.congruence_not_forcing` |

### §4 — Oddness and the level lift

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Lemma 4.1 · *Oddness is forced* | `C2_level_lift` | `C2.char_mod_one_even`, `C2.char_mod_two_even` |
| Lemma 4.2 · *Oddness has a minimal conductor* | `C2_level_lift` | `C2.odd_char_mod_three_forced` |
| Proposition 4.3 · *The Serre–Stark obstruction at level four* | `C2_level_lift` | `C2.naive_level` |
| Proposition 4.4 · *The unique odd character, and the level lift* | `C2_level_lift` | `C2.lifted_level` |

### §5 — Anchoring, and the transpose anti-involution

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Lemma 5.4 · *The stage-wise canonical family is not compatible* | `C1_c1L_anchoring` | `C1.canonical_fails` |
| Proposition 5.5 · *Anchored uniqueness of the uniform family* | `C1_c1L_anchoring` | `C1.anchored_unique` |
| Theorem 5.7 · *The hyperfinite completion* | `C3_tau_involution` | `C3.tower_dim`, `C3.trace_tower` |
| Proposition 5.8 · *Existence and tower-coherence of τ* | `C3_tau_involution` | `C3.tau_anti_mul`, `C3.tower_coherence` |
| Proposition 5.9 · *Classification, outerness, and the fixed algebra* | `C3_tau_involution` | `C3.L_fixed` |
| Lemma 5.15 · *Fixed locus of s ↦ 1 − s̄* | `C3_tau_involution` | `C3.fixed_locus_critical` |

### §6 — The involution, corner phases, and chirality

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Lemma 6.1 · *Spin^c involution lift* | `Sec3_Z2_Involution` | `sigma_involution`, `sigma_fixed_P1`–`P4` |
| Proposition 6.2 · *The corner-phase product* | `Sec3_Z2_Involution` | `cornerProduct_deg3_eq_neg_one` |
| Proposition 6.3 · *Degree dependence of the product* | `Sec3_Z2_Involution` | `cornerProduct_eq_neg_one_pow` |
| Remark 6.4 · *The single non-trivial corner* | `Sec3_Z2_Involution` | `unique_nontrivial_corner_is_P4` |
| Lemma 6.5 · *Signature-independence of σ̃² = −1* | `R8_sector_chirality` | `R8.sigma_sq_signature_invariant` |
| Proposition 6.6 · *On-sector chirality identification* | `R8_sector_chirality` | `R8.sigmaTilde_eq_neg_i_gamma5_sector` |
| Theorem 6.7 · *Sector-restricted chirality identification* | `R8_sector_chirality` | `R8.sector_chirality` |
| Lemma 6.9 · *Odd-square residue* | `R9_theta2_spectrum` | `R9.odd_sq_mod_four` |
| Proposition 6.10 · *No integer exponent* | `R9_theta2_spectrum` | `R9.exponent_not_integer` |
| Corollary 6.11 · *Absence of the q¹ mode* | `R9_theta2_spectrum` | `R9.q1_absent` |

### §7 — Numerical rigidity

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Lemma 7.1 · *Euler characteristic of the pillowcase* | `C4_euler_twelve` | `C4.gauss_bonnet`, `C4.quotient_formula` |
| Proposition 7.2 · *χ(K₈) = 12 = dim_ℝ M₁₂* | `C4_euler_twelve` | `C4.identification` |
| Theorem 7.3 · *Dimension-twelve simultaneity* | `N3_dim12_arithmetic` | `n3_dim12_arithmetic` |
| Lemma 7.4 · *The flat holonomy is quantised, and is π* | `C1_c1L_anchoring` | `C1.holonomy_quantised` |
| Theorem 7.5 · *Charge-dependent localisation* | `C1_c1L_anchoring` | `C1.composite_phase`, `C1.Lhalf_phase` |
| Proposition 7.6 · *The order-six phase structure* | `C1_c1L_anchoring` | `C1.zeta6_isPrimitiveRoot` |
| Lemma 7.9 · *The completion coefficient is forced* | `N2_E2_completion_identity` | `n2_completion_identity`, `n2_key_identity` |
| Lemma 7.11 · *Spectrum on the flat torus* | `Prop5_Dirac_Spectrum` | `prop5_min_is_pi_sq` |
| Lemma 7.12 · *Discrete n-mode bound* | `Prop5_Dirac_Spectrum` | `n_mode_bound` |
| Proposition 7.13 · *The lowest eigenvalue is π* | `Prop5_Dirac_Spectrum` | `prop5_min_eigenvalue_is_pi` |

### §8 — Fixed-point vanishing

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Lemma 8.1 · *Fixed-point vanishing* | `Sec3_Z2_Involution` | `fixed_point_vanishing` |
| Corollary 8.2 · *Pointwise inaccessibility* | `Sec3_Z2_Involution` | `corner_pairing_vanishes` |

### §9 — Criticality, stratification, and the warp sector

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Lemma 9.1 · *Freeness of the σ-action on momenta* | `Ca_constant_critical` | `Paper3.CaConstantCritical.ca_sigma_free` |
| Lemma 9.2 · *Exact degeneracy of σ-partners* | `Ca_constant_critical` | `Paper3.CaConstantCritical.ca_partner_degenerate` |
| Lemma 9.3 · *σ-parity selection identity* | `Ca_constant_critical` | `Paper3.CaConstantCritical.ca_overlap_zero` |
| Lemma 9.4 · *Constancy of projected densities* | `Ca_constant_critical` | `Paper3.CaConstantCritical.ca_projected_density_const` |
| Proposition 9.5 · *Constant configurations are critical* | `Ca_constant_critical` | `Paper3.CaConstantCritical.ca_projected_density_const` |
| Lemma 9.8 · *Kernel decoupling* | `A3_chain_core` | `Paper3.A3ChainCore.a3_kernel_decouple` |
| Lemma 9.9 · *Normalisation independence* | `A3_chain_core` | `Paper3.A3ChainCore.a3_normalisation_indep` |
| Lemma 9.13 · *Signed equals unsigned on the base* | `A3_chain_core` | `Paper3.A3ChainCore.a3_base_signed_unsigned` |
| Lemma 9.14 · *Warp elimination on the ground sector* | `N2b_warp_ground_sector` | `n2b_ground_sector_core` |
| Lemma 9.15 · *Measure cancellation* | `N2b_warp_ground_sector` | `n2b_measure_cancel` |
| Proposition 9.16 · *Base-multiplicity replication and the assembly* | `A3_chain_core` | `Paper3.A3ChainCore.a3_assembly` |

### §10 — Closure and corner separation

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Lemma 10.1 · *Hamilton* | `C5_hamilton_closure` | `C5.im_not_closed` |
| Corollary 10.2 · *Closure of the functor's target* | `C5_hamilton_closure` | `C5.pure_unit_sq` |
| Corollary 10.3 · *Corner separation, and the sign of a full period* | `C6_corner_alternation` | `C6.alternation_even`, `C6.alternation_odd`, `C6.diagonal_distance_sq` |

### §3 — The shadow–torsion correspondence

| Paper 3 | Certificate | Lean declaration |
|---|---|---|
| Theorem 3.1 · *Shadow–torsion correspondence*, clause (iv) | `N1_shadow_nonvanishing` | `n1_shadow_nonvanishing` |

---

## What is certified, and what is not

Each certificate carries an explicit statement in its own header of what it
proves and what it takes as input. The pattern throughout is that the
**algebraic and arithmetic core** of a result is machine-checked, while the
**geometric identification** that gives the core its meaning — that a particular
algebraic object *is* the shadow, the torsion class, or the Dirac spectrum of
the geometry in question — is established in the paper by ordinary mathematical
argument and is an input to the certificate, not an output of it.

Theorem 3.1 is the clearest instance. The certificate proves that the exponent
map n ↦ n²/4 is injective on n ≥ 1, that the exponent 1/4 is attained only at
n = 1, and that the coefficient there is −1 ≠ 0 — hence the shadow does not
vanish. That the series in question *is* the shadow of the equivariant elliptic
genus is the content of the theorem itself and is proved in the paper.

Readers should therefore treat these certificates as eliminating arithmetic and
algebraic error, not as replacing the geometric argument.

---

## Other papers

Certificates for the remaining papers in this repository build clean but are not
yet tabulated here. Sections for Paper GBH1 and YM-Foundation-A will follow.
