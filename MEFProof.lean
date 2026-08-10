-- Paper 1
import MEFProof.Paper_1.P1_L1_flux_ratio
import MEFProof.Paper_1.P1_L2_structural_identity
import MEFProof.Paper_1.P1_L3_bulk_mass
import MEFProof.Paper_1.P1_L4_corner_bookkeeping
import MEFProof.Paper_1.P1_L5_assembly
import MEFProof.Paper_1.P1_L6_cp_phase

-- Paper 2
import MEFProof.Paper_2.P2_L1_euler_v1
import MEFProof.Paper_2.P2_L2_exponent_v2
import MEFProof.Paper_2.P2_L3_stability_v2

-- Paper 3
import MEFProof.Paper_3.A3_chain_core
import MEFProof.Paper_3.C1_c1L_anchoring
import MEFProof.Paper_3.C2_level_lift
import MEFProof.Paper_3.C3_tau_involution
import MEFProof.Paper_3.C4_euler_twelve
import MEFProof.Paper_3.C5_hamilton_closure
import MEFProof.Paper_3.C6_corner_alternation
import MEFProof.Paper_3.Ca_constant_critical
import MEFProof.Paper_3.CertW1_ShadowClassical
import MEFProof.Paper_3.CertW2_Appell3Sign
import MEFProof.Paper_3.CertW3_SectorClassDictionary
import MEFProof.Paper_3.CertW4_CornerSectorDFT
import MEFProof.Paper_3.CertW5_LevelConjugation
import MEFProof.Paper_3.CertW7_StdIrrSchur
import MEFProof.Paper_3.CertW9_AntiinvSectorDims
import MEFProof.Paper_3.CertW10_FlatClasses
import MEFProof.Paper_3.CertW11_ChiralTelescope
import MEFProof.Paper_3.CertW12_GenusSectorS3
import MEFProof.Paper_3.CertW13_StratEps
import MEFProof.Paper_3.N1_shadow_nonvanishing
import MEFProof.Paper_3.N2_E2_completion_identity
import MEFProof.Paper_3.N2b_warp_ground_sector
import MEFProof.Paper_3.N3_dim12_arithmetic
import MEFProof.Paper_3.Prop5_Dirac_Spectrum
import MEFProof.Paper_3.R8_sector_chirality
import MEFProof.Paper_3.R9_theta2_spectrum
import MEFProof.Paper_3.Sec3_Z2_Involution

-- Paper 4
import MEFProof.Paper_4.P4_R1_eigenspace
import MEFProof.Paper_4.P4_R2_nilpotency
import MEFProof.Paper_4.P4_R3_antiinvariant
import MEFProof.Paper_4.P4_R4_odd_divisor
import MEFProof.Paper_4.P4_R5_H1
import MEFProof.Paper_4.P4_R6_microstate
import MEFProof.Paper_4.P4_R7_sol
import MEFProof.Paper_4.P4_R8_galois

-- Paper 5
import MEFProof.Paper_5.A3_chain_core
import MEFProof.Paper_5.Ca_constant_critical
import MEFProof.Paper_5.GBH4_N2b_ground_sector
import MEFProof.Paper_5.GBH4_evaluation_core

-- Paper A Hyperfinite Quaternionic
import MEFProof.Paper_A_Hyperfinite_Quaternionic.A_C1_transpose_antiauto
import MEFProof.Paper_A_Hyperfinite_Quaternionic.A_C2_trace_compatibility
import MEFProof.Paper_A_Hyperfinite_Quaternionic.A_C3_outerness
import MEFProof.Paper_A_Hyperfinite_Quaternionic.A_C4_Q8_orbits
import MEFProof.Paper_A_Hyperfinite_Quaternionic.A_C5_fixed_subalgebra

-- Paper C Equivalent Dirac
import MEFProof.Paper_C_Equivalent_Dirac.C_C1_pullback_compat
import MEFProof.Paper_C_Equivalent_Dirac.C_C2_corner_count
import MEFProof.Paper_C_Equivalent_Dirac.C_C3_commuting_square

-- Paper U Uniqueness Discriminant Topology
import MEFProof.Paper_U_Uniqueness_Discriminant_Topology.LP0_certificate
import MEFProof.Paper_U_Uniqueness_Discriminant_Topology.O1_certificate
import MEFProof.Paper_U_Uniqueness_Discriminant_Topology.O2_certificate
import MEFProof.Paper_U_Uniqueness_Discriminant_Topology.O3_certificate
import MEFProof.Paper_U_Uniqueness_Discriminant_Topology.O4_certificate
import MEFProof.Paper_U_Uniqueness_Discriminant_Topology.RB1_certificate
import MEFProof.Paper_U_Uniqueness_Discriminant_Topology.RB_retraction_certificate

-- Paper GBH1 Schwarzschild
import MEFProof.Paper_GBH1_Schwarzschild.H5_transmission_bound
import MEFProof.Paper_GBH1_Schwarzschild.WP1_N1_budget_limit
import MEFProof.Paper_GBH1_Schwarzschild.WP4_M1_eos_causality

-- Paper Icosian CFM
import MEFProof.Paper_Icosian_CFM.ICO_C1_Golden_Ring
import MEFProof.Paper_Icosian_CFM.ICO_C2_Mod2_Shadow
import MEFProof.Paper_Icosian_CFM.ICO_C3_Mod5_Witnesses
import MEFProof.Paper_Icosian_CFM.ICO_C4_Q8_Blind
import MEFProof.Paper_Icosian_CFM.ICO_C5_Hurwitz_2T
import MEFProof.Paper_Icosian_CFM.ICO_C6_q5_Unit
import MEFProof.Paper_Icosian_CFM.ICO_C7_Icosian_Membership

-- CFM Mechanism
import MEFProof.CFM_Mechanism.CFM_Certificates

-- Root
import MEFProof.Basic

/-!
# MEF_Proof — machine-checked certificates

This is the library root. It imports every certificate in the repository, so
that `lake build` compiles and verifies the whole collection. Each module is a
self-contained certificate; the grouping above follows the paper it supports.
-/
