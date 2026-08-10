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

## Paper 3 — _The Zwegers shadow as U(1)-projected intrinsic torsion_

Sixteen certificates, all compiling under Lean 4.29.1. Numbering follows the
published version of the paper.

### §2 — The determinant line

| Paper 3                                                      | Certificate        | Lean declaration                      |
| ------------------------------------------------------------ | ------------------ | ------------------------------------- |
| Lemma 2.1 · _Tangent Chern class of ℂP²_                     | `C1_c1L_anchoring` | `C1.chern_poly_expand`, `C1.c1_coeff` |
| Proposition 2.2 · _The determinant line is O(3)_             | `C1_c1L_anchoring` | `C1.c1L_eq`                           |
| Remark 2.3 · _What the congruence does, and does not, force_ | `C1_c1L_anchoring` | `C1.congruence_not_forcing`           |

### §4 — Oddness and the level lift

| Paper 3                                                          | Certificate     | Lean declaration                               |
| ---------------------------------------------------------------- | --------------- | ---------------------------------------------- |
| Lemma 4.1 · _Oddness is forced_                                  | `C2_level_lift` | `C2.char_mod_one_even`, `C2.char_mod_two_even` |
| Lemma 4.2 · _Oddness has a minimal conductor_                    | `C2_level_lift` | `C2.odd_char_mod_three_forced`                 |
| Proposition 4.3 · _The Serre–Stark obstruction at level four_    | `C2_level_lift` | `C2.naive_level`                               |
| Proposition 4.4 · _The unique odd character, and the level lift_ | `C2_level_lift` | `C2.lifted_level`                              |

### §5 — Anchoring, and the transpose anti-involution

| Paper 3                                                              | Certificate         | Lean declaration                        |
| -------------------------------------------------------------------- | ------------------- | --------------------------------------- |
| Lemma 5.4 · _The stage-wise canonical family is not compatible_      | `C1_c1L_anchoring`  | `C1.canonical_fails`                    |
| Proposition 5.5 · _Anchored uniqueness of the uniform family_        | `C1_c1L_anchoring`  | `C1.anchored_unique`                    |
| Theorem 5.7 · _The hyperfinite completion_                           | `C3_tau_involution` | `C3.tower_dim`, `C3.trace_tower`        |
| Proposition 5.8 · _Existence and tower-coherence of τ_               | `C3_tau_involution` | `C3.tau_anti_mul`, `C3.tower_coherence` |
| Proposition 5.9 · _Classification, outerness, and the fixed algebra_ | `C3_tau_involution` | `C3.L_fixed`                            |
| Lemma 5.15 · _Fixed locus of s ↦ 1 − s̄_                              | `C3_tau_involution` | `C3.fixed_locus_critical`               |

### §6 — The involution, corner phases, and chirality

| Paper 3                                                    | Certificate           | Lean declaration                          |
| ---------------------------------------------------------- | --------------------- | ----------------------------------------- |
| Lemma 6.1 · _Spin^c involution lift_                       | `Sec3_Z2_Involution`  | `sigma_involution`, `sigma_fixed_P1`–`P4` |
| Proposition 6.2 · _The corner-phase product_               | `Sec3_Z2_Involution`  | `cornerProduct_deg3_eq_neg_one`           |
| Proposition 6.3 · _Degree dependence of the product_       | `Sec3_Z2_Involution`  | `cornerProduct_eq_neg_one_pow`            |
| Remark 6.4 · _The single non-trivial corner_               | `Sec3_Z2_Involution`  | `unique_nontrivial_corner_is_P4`          |
| Lemma 6.5 · _Signature-independence of σ̃² = −1_            | `R8_sector_chirality` | `R8.sigma_sq_signature_invariant`         |
| Proposition 6.6 · _On-sector chirality identification_     | `R8_sector_chirality` | `R8.sigmaTilde_eq_neg_i_gamma5_sector`    |
| Theorem 6.7 · _Sector-restricted chirality identification_ | `R8_sector_chirality` | `R8.sector_chirality`                     |
| Lemma 6.9 · _Odd-square residue_                           | `R9_theta2_spectrum`  | `R9.odd_sq_mod_four`                      |
| Proposition 6.10 · _No integer exponent_                   | `R9_theta2_spectrum`  | `R9.exponent_not_integer`                 |
| Corollary 6.11 · _Absence of the q¹ mode_                  | `R9_theta2_spectrum`  | `R9.q1_absent`                            |

### §7 — Numerical rigidity

| Paper 3                                                | Certificate                 | Lean declaration                            |
| ------------------------------------------------------ | --------------------------- | ------------------------------------------- |
| Lemma 7.1 · _Euler characteristic of the pillowcase_   | `C4_euler_twelve`           | `C4.gauss_bonnet`, `C4.quotient_formula`    |
| Proposition 7.2 · _χ(K₈) = 12 = dim_ℝ M₁₂_             | `C4_euler_twelve`           | `C4.identification`                         |
| Theorem 7.3 · _Dimension-twelve simultaneity_          | `N3_dim12_arithmetic`       | `n3_dim12_arithmetic`                       |
| Lemma 7.4 · _The flat holonomy is quantised, and is π_ | `C1_c1L_anchoring`          | `C1.holonomy_quantised`                     |
| Theorem 7.5 · _Charge-dependent localisation_          | `C1_c1L_anchoring`          | `C1.composite_phase`, `C1.Lhalf_phase`      |
| Proposition 7.6 · _The order-six phase structure_      | `C1_c1L_anchoring`          | `C1.zeta6_isPrimitiveRoot`                  |
| Lemma 7.9 · _The completion coefficient is forced_     | `N2_E2_completion_identity` | `n2_completion_identity`, `n2_key_identity` |
| Lemma 7.11 · _Spectrum on the flat torus_              | `Prop5_Dirac_Spectrum`      | `prop5_min_is_pi_sq`                        |
| Lemma 7.12 · _Discrete n-mode bound_                   | `Prop5_Dirac_Spectrum`      | `n_mode_bound`                              |
| Proposition 7.13 · _The lowest eigenvalue is π_        | `Prop5_Dirac_Spectrum`      | `prop5_min_eigenvalue_is_pi`                |

### §8 — Fixed-point vanishing

| Paper 3                                     | Certificate          | Lean declaration          |
| ------------------------------------------- | -------------------- | ------------------------- |
| Lemma 8.1 · _Fixed-point vanishing_         | `Sec3_Z2_Involution` | `fixed_point_vanishing`   |
| Corollary 8.2 · _Pointwise inaccessibility_ | `Sec3_Z2_Involution` | `corner_pairing_vanishes` |

### §9 — Criticality, stratification, and the warp sector

| Paper 3                                                             | Certificate              | Lean declaration                                       |
| ------------------------------------------------------------------- | ------------------------ | ------------------------------------------------------ |
| Lemma 9.1 · _Freeness of the σ-action on momenta_                   | `Ca_constant_critical`   | `Paper3.CaConstantCritical.ca_sigma_free`              |
| Lemma 9.2 · _Exact degeneracy of σ-partners_                        | `Ca_constant_critical`   | `Paper3.CaConstantCritical.ca_partner_degenerate`      |
| Lemma 9.3 · _σ-parity selection identity_                           | `Ca_constant_critical`   | `Paper3.CaConstantCritical.ca_overlap_zero`            |
| Lemma 9.4 · _Constancy of projected densities_                      | `Ca_constant_critical`   | `Paper3.CaConstantCritical.ca_projected_density_const` |
| Proposition 9.5 · _Constant configurations are critical_            | `Ca_constant_critical`   | `Paper3.CaConstantCritical.ca_projected_density_const` |
| Lemma 9.8 · _Kernel decoupling_                                     | `A3_chain_core`          | `Paper3.A3ChainCore.a3_kernel_decouple`                |
| Lemma 9.9 · _Normalisation independence_                            | `A3_chain_core`          | `Paper3.A3ChainCore.a3_normalisation_indep`            |
| Lemma 9.13 · _Signed equals unsigned on the base_                   | `A3_chain_core`          | `Paper3.A3ChainCore.a3_base_signed_unsigned`           |
| Lemma 9.14 · _Warp elimination on the ground sector_                | `N2b_warp_ground_sector` | `n2b_ground_sector_core`                               |
| Lemma 9.15 · _Measure cancellation_                                 | `N2b_warp_ground_sector` | `n2b_measure_cancel`                                   |
| Proposition 9.16 · _Base-multiplicity replication and the assembly_ | `A3_chain_core`          | `Paper3.A3ChainCore.a3_assembly`                       |

### §10 — Closure and corner separation

| Paper 3                                                             | Certificate             | Lean declaration                                                       |
| ------------------------------------------------------------------- | ----------------------- | ---------------------------------------------------------------------- |
| Lemma 10.1 · _Hamilton_                                             | `C5_hamilton_closure`   | `C5.im_not_closed`                                                     |
| Corollary 10.2 · _Closure of the functor's target_                  | `C5_hamilton_closure`   | `C5.pure_unit_sq`                                                      |
| Corollary 10.3 · _Corner separation, and the sign of a full period_ | `C6_corner_alternation` | `C6.alternation_even`, `C6.alternation_odd`, `C6.diagonal_distance_sq` |

### §3 — The shadow–torsion correspondence

| Paper 3                                                    | Certificate              | Lean declaration         |
| ---------------------------------------------------------- | ------------------------ | ------------------------ |
| Theorem 3.1 · _Shadow–torsion correspondence_, clause (iv) | `N1_shadow_nonvanishing` | `n1_shadow_nonvanishing` |

---

## What is certified, and what is not

Each certificate carries an explicit statement in its own header of what it
proves and what it takes as input. The pattern throughout is that the
**algebraic and arithmetic core** of a result is machine-checked, while the
**geometric identification** that gives the core its meaning — that a particular
algebraic object _is_ the shadow, the torsion class, or the Dirac spectrum of
the geometry in question — is established in the paper by ordinary mathematical
argument and is an input to the certificate, not an output of it.

Theorem 3.1 is the clearest instance. The certificate proves that the exponent
map n ↦ n²/4 is injective on n ≥ 1, that the exponent 1/4 is attained only at
n = 1, and that the coefficient there is −1 ≠ 0 — hence the shadow does not
vanish. That the series in question _is_ the shadow of the equivariant elliptic
genus is the content of the theorem itself and is proved in the paper.

Readers should therefore treat these certificates as eliminating arithmetic and
algebraic error, not as replacing the geometric argument.

---
