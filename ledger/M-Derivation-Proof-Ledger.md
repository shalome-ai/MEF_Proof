# M-Derivation-Proof-Ledger

**The source of truth for the Mx series: where each load-bearing result lives, at what rigour, under which readings and minimality choices, and which Lean theorem certifies its finite part.** Seeded 9 November 2026 from M1 (canon, v2) and M2 (v1 draft). Maintained by the architect as proposals; **the PI banks every row**.

**Columns.** Result · Site (paper, label) · Rigour · Depends on (readings R1–R5; Minimality entries Mx-n; external results EXT) · Certificate (file: theorem names) · Status.

**Status vocabulary.** **BANKED** — in a frozen canon paper, PI-banked. **DRAFT** — in a complete draft awaiting freeze. **PROVISIONAL (old ledger row n / paper)** — imported from `proof_derivation_ledger_v22.md` as a *menu*; may not be cited by any Mx paper until re-derived in-document and flipped to BANKED, or **STRUCK (reason)**. **TARGET (owing paper)** — not yet derived.

**Readings in force.** M1 v6.0 (canon, 11 Nov 2026; P54) has nine numbered choices: the six of v5.0 listed next, and clauses (a), (b), (c) of Definition 3.2 (the sixth axiom, formal) as the seventh, eighth and ninth. M1 v5.0 has six numbered choices: Def 2.1(i) (what is seen is the image under the projection onto time and space); Def 2.1(ii), (iii) (an object is a state of the internal piece at rest, its shadow what is left when the internal piece is forgotten); Def 2.3 (closure); Def 2.4(i) (growth is in the geometry); Def 2.7 (spinors and tangent vectors); Def 2.8 (orbits are realised). M2's reading (called "the fifth" in M2 v1.0, to be renumbered when M2 is reworked): M2 Def. riemannian — positive-definite metric; time is the drive's orbit parameter. Minimality entries: `registers/Minimality_Register.md`.

---

## M1 — Five axioms and their minimal geometry (`canon/M1/Paper_M1_Five_Axioms_v5.tex`, v5.0, 10 Nov 2026; 38 pp.; certificates L1–L4, L6, 58 theorems) — rows BANKED at v5.0 by the PI's direction to move the paper to canon (Decision Log P36 item 10, P39)

*v5.0 supersedes v2 (`canon/M1/superseded/`). What changed, row by row, is marked "v5" below; the full list is `papers/M1/CHANGES_v4.md`, the audits `papers/M1/STEP_AUDIT.md` §§6–9, the numbering map `canon/M1/NUMBERING_v2_to_v5.md`.*

| Result | Site | Rigour | Depends on | Certificate | Status |
|---|---|---|---|---|---|
| **v5 (new).** The fifth axiom, formal: (i) M = (T × Σ) × F with what is seen the image under the projection that forgets F; (ii) the structure carried by the internal piece is not carried to itself by one step of the drive; (iii) the internal piece has two independent states at rest with the same shadow. Remark: the projection is not one-to-one | M1 Def 2.1, Rem 2.2 | declared (axiom); Rem [D] | A5 (P19, P34, P35); two numbered choices | — | BANKED (v5) |
| A4 ⇔ hyperbolic return map (\|tr\| > 2); trace 2 excluded | M1 Prop 4.1 | [R] | EXT Katok–Hasselblatt | `M1_L1_drive.lean`: `L1_trace3_min` | BANKED |
| Uniqueness of the trace-3 class: every trace-3 M ∈ SL(2,ℤ) is conjugate to ((2,1),(1,1)); **v5:** three routes, the first a direct descent complete in itself | M1 Thm 4.2 | [R] | none for the first route; EXT Latimer–MacDuffee, Taussky (determinant ±1, ideal classes: V-11); Gauss, Sarnak (V-12) as corroboration | `L1_reduced_disc5`, `L1_cycle_disc5`, `L1_conj_M0_inv` | BANKED |
| Odd trace ⇔ order 3 mod 2 ⇔ corner 3-cycle; M₀ fixes P₁, cycles P₂P₃P₄ | M1 Prop 4.4 (the Fibonacci drive is Thm 4.3) | [R] | — | `L1_odd_trace_iff_order_three`, `L1_M0_mod2_order3` | BANKED |
| Division property from A1; 𝒜 = ℍ by Frobenius | M1 Lem 5.1, Prop 5.2 | [D] | A1, A2, A3; EXT Frobenius | `M1_L2_fibre.lean`: `L2_hamilton`, `L2_norm_posdef` | BANKED |
| Four corners = Q₈/{±1}, V ≅ ℤ₂×ℤ₂ | M1 Prop 5.3 | [R] | — | `L2_corner_count` | BANKED |
| Commutative fixed subalgebras of V×⟨ι⟩ are ℝ, ℂᵢ, ℂⱼ, ℂₖ | M1 Prop 5.4 | [R] | — | `L2_fix_*`, `L2_iperp_not_closed` | BANKED |
| Fibre is T² with inversion and linear drive (Franks; **v5:** the involution by the surface argument) | M1 Prop 5.5 | [D] | A2–A4, M1-2 (dimension tier); EXT Franks 1970 (V-10, secondary only); Thurston (V-16) | `L2_two_torsion` | BANKED |
| Corner algebras by stabiliser under ⟨ι, M₀⟩; Ad_w cycles i→j→k | M1 Prop 5.6 | [D] | A2, A3, A4; reading: ι on the algebra identified with ι on spinors (M1's one [D] reading); **refined by M2: ι = τ² (fold); A2's involution is τ** (Register §13) | `L2_Ad_w_cycles`, `L2_w_cubed` | BANKED (refinement noted) |
| Pillowcase: unique Euclidean (2,2,2,2) orbifold; χ_orb = 0; χ = 2 by two routes | M1 Thm 5.7 | [R] | EXT Thurston (V-16); Satake (V-17) | `L2_chi_orb_zero`, `L2_chi_pillowcase` | BANKED |
| Dimension: 4 ∣ D; quaternionic dim F ≥ 2 ⇒ D ≥ 12; 4–11 fail; 12 least | M1 Thm 6.1 | [D] | Def 2.7; M1-2 (least dimension, which also makes the time–space block four-dimensional: **v5**, P38) | `M1_L3_dimension.lean`: `L3_*` | BANKED |
| Split (3,6) unique given dim F ≥ 8; (7,2) excluded | M1 Rem 6.2 | [R] | — | `L3_split_three_six`, `L3_seven_two_meets_congruences` | BANKED |
| S² = Sp(1)/U(1), sphere of imaginary units | M1 Prop 7.1 | [D] | Def 2.8 | `M1_L4_base.lean`: `L4_unit_sphere_axes` | BANKED |
| ℂP² = SU(3)/U(2); χ = 3; c₁ = 3h | M1 Prop 7.2 | [D] | Def 2.8 | `L4_chern_CP2`, `L4_chi_counts` | BANKED |
| Spin^c necessary (w₂ = h); L odd; canonical L = 𝒪(3); twisting line excluded | M1 Prop 7.3 | [D] | Def 2.7; M1-3; EXT Lawson–Michelsohn | `L4_not_spin_and_congruence`, `L4_odd_lines` | BANKED |
| **v5 (new).** States of the fibre for a twist of flux d: d of them; 1 + Σ⌊aᵢ/2⌋ kept by the first lift of the fold; which corner patterns the drive leaves in place; a half-turn twist has none | M1 Def 7.4, Lemma 7.5 | [R] | EXT Whittaker–Watson (V-9) | `M1_L6_twist.lean`: `L6_fixed_patterns`, `L6_return_three` | BANKED (v5) |
| **v5 (new).** The twist of the fibre: the least flux meeting clauses (ii) and (iii) of the fifth axiom, with the states counted on the pillowcase for one lift, is three; one odd corner, a cycled one; two states kept, one removed by the fold | M1 Prop 7.6 | [D] | A5 (Def 2.1(ii), (iii)); M1-11 (least flux) | `L6_flux_one`, `L6_flux_two`, `L6_flux_three_states`, `L6_flux_three_one_odd`, `L6_flux_three_cycled`, `L6_least_flux`, `L6_smallest_case` | BANKED (v5) |
| Corner lift (−1)^{mn} up to one overall sign, product −1; the odd corner a cycled one. **v5:** rests on Prop 7.6; was [R] on a citation of Atiyah–Bott that does not contain the statement (V-7) | M1 Cor 7.7 (was Cor 7.4) | [D] | Prop 7.6 | `L4_four_corner_product`, `L6_corner_product` | BANKED (v5) |
| **v5 (new).** The time circle is three steps of the drive; M₀³ = ((13,8),(8,5)); the drive's numbers are per step. Open: the sign of the lift (w or −w) bears on three against six | M1 Cor 7.8 | [D] | Cor 7.7; P28; M1-7, M1-9 | `L1_M0_mod2_order3`, `L1_Fib_powers` | BANKED (v5) |
| Σ = S³: the least fundamental group, and the Poincaré theorem (**v5**, P38) | M1 Prop 7.9 (was Prop 7.5) | [D] | M1-4; EXT Morgan–Tian Cor 0.2 (V-24) | — | BANKED (v5) |
| χ(K₈) = 3·2·2 = 12 | M1 Thm 7.10 (was Thm 7.6) | [R] | Künneth | `L3_chi_K8` | BANKED |
| Minimality theorem (assembly). **v5:** five axioms; step M₀ and a time circle of three steps; flux three on the fibre with one odd corner; the overall scale and the aspect ratio of the fibre held by a declared sector; no claim about moduli | M1 Thm 8.1 | [D] | all above; the declared input (M1-10) | — | BANKED (v5) |
| ~~Scale eliminated to Q_w²(18u+1) = Q_c²u²(6u+1); (3,6) ⇒ 6u³+u²−72u−4 = 0~~ | ~~M1 Prop 8.2~~ | — | — | `M1_L5_vacuum.lean` (kept in the tree for M7) | **REMOVED from M1 at v5.0 (P38, P29): owed by M7** |
| Cross-check: Witten 1981 (seven is the least dimension with SU(3) × SU(2) × U(1) symmetry; ℂP² × S² × S¹ is one such manifold) | M1 §8.3 (was §8.4) | [R] | EXT Witten (V-18) | — | BANKED (v5) |

### M1 v6.0 (`canon/M1/Paper_M1_Six_Axioms_v6.tex`, 11 Nov 2026; 40 pp.; certificates L1–L4, L6, 58 theorems) — moved to canon by the PI's direction (Decision Log P54); v5.0 in `canon/M1/superseded/`

*No proof of v5.0 changed and no result was renumbered. In the rows above read "clause" for "criterion" by `canon/M1/NUMBERING_v5_to_v6.md`, and "six axioms" in the row of Theorem 8.1. The rows below are new or restated at v6.0. Audit: `papers/M1/STEP_AUDIT.md` §10.*

| Result | Where | Tag | Inputs | Certificate | Status |
|---|---|---|---|---|---|
| **v6 (new).** The sixth axiom, formal: a geometry satisfying A1–A5 is minimal if selected by (a) nothing is left to be chosen (no modulus; the step of the drive the only one of its trace, up to a relabelling of the torus that keeps its orientation); (b) nothing is present that is not needed; (c) what is needed is least (entropy of one step, total dimension, flux of the twist, steps of the time circle), applied in that order. Each clause is a reading and a numbered choice | M1 Axiom 6; Def 3.2 | reading | P42, P45, P46, P47(1), P49(1) | — | BANKED (v6) |
| **v6 (new).** One drive at trace three only: for t ≥ 4 the matrix ((t,−1),(1,0)) is not SL₂(ℤ)-conjugate to its inverse, so there are at least two classes of trace t; at t = 3 there is one (Thm 4.2). Orientation-keeping is a hypothesis: a relabelling of determinant −1 conjugates the two | M1 Prop 4.5 | [R] | Thm 4.2; a descent on p² + tpq + q² = −1 | none; `papers/M1/checks/sixth_axiom_check.py`, `sixth_axiom_blind_classes.py` | BANKED (v6) |
| **v6 (restated).** Trace three both ways: clause (c), least entropy, and clause (a), one drive. Which is the ground is not ruled (P44). The positive trace is an input, not a selection | M1 §4.2 | [D] | Def 3.2 (a), (c); Thm 4.2; Prop 4.5 | `L1_trace3_min` (positive trace assumed) | BANKED (v6) |
| **v6 (restated).** Minimality theorem (assembly): six axioms; overall size has no meaning; the aspect ratio of the fibre is the one declared input | M1 Thm 8.1 | [D] | all above; M1-10 | — | BANKED (v6) |
| **v6 (new).** The sixth axiom gives that nothing is absolute, the fifth that the inside view is incomplete; a resemblance to Gödel's theorem. Nothing is derived from it; no reference is cited | M1 outlook | [M] | P47(2) | — | BANKED (v6) as [M] |

*v6.1 (`canon/M1/Paper_M1_Six_Axioms_v6_1.tex`, 11 Nov 2026; 42 pp.; six certificates L1–L4, L6, L7, 66 theorems; Decision Log P55, P56; v6.0 in `canon/M1/superseded/`). Changes to the rows above: Proposition 4.5 has the certificate `M1_L7_onedrive.lean` (`L7_descent`, `L7_no_int_solution`, `L7_not_conj_inverse`, `L7_det_of_intertwiner`, `L7_flip`, `L7_trace3_solution`); the ground of trace three is clause (a), and clause (c) agrees (P55); Gödel's first incompleteness theorem is cited (V-25); in the row of Proposition 7.3 "Spin^c is the least such structure" is withdrawn and the result reads "a Spin^c structure exists, and clause (b) admits no structure group larger than is needed". Proposed with the move to canon; the PI banks by commit.*

*v6.2 (`canon/M1/Paper_M1_Six_Axioms_v6_2.tex`, 11 Nov 2026; 43 pp.; certificates unchanged; Decision Log P58, P60; v6.1 in `canon/M1/superseded/`). Change to the row of Corollary 7.8 (the time circle): the open point on the sign of the lift is closed by ruling; on spinors the drive is −w, of cube +1, and the time circle is three steps, by clauses (c) and (b) of Definition 3.2 [D \| minimality, M1-14]; inputs EXT Serre (V-26) and the list of sixteen assignments (`papers/M1/checks/lift_sign_all.py` and its blind twin; no Lean certificate). Proposed with the move to canon; the PI banks by commit.*

*v6.3 (`canon/M1/Paper_M1_Six_Axioms_v6_3.tex`, 11 Nov 2026; 44 pp.; certificates unchanged; Decision Log P61–P64; v6.2 in `canon/M1/superseded/`). Change to the rows of Definition 3.2 and Proposition 4.5: clause (a) states its count of drives in full (two steps are the same when, and only when, an orientation-keeping relabelling carries one to the other); both parts (no mirror; a step run backwards is another step) are declared, both are needed, neither is derived; the four counts to trace sixty are stated after the proof (`papers/M1/checks/orientation_time_check.py` and its blind twin; EXT Gauss, V-12). Proposed with the move to canon; the PI banks by commit.*

*M1 v5.0 was 38 pp., five certificates, 58 theorems. Section 2 numbering: the fifth axiom is Definition 2.1 with Remark 2.2; closure 2.3; growth and decay 2.4; the fibre algebra 2.5; order 2.6; the two levels 2.7; orbits 2.8; drive 2.9. Earlier header notes (v1, v2) are superseded.*

### M1 v7.0 (`canon/M1/Paper_M1_Six_Axioms_v7_0.tex`, 14 Nov 2026; 47 pp.; six certificates L1–L4, L6, L7, 66 theorems, unchanged) — moved to canon by the PI's direction (Decision Log P169, P172); v6.3 in `canon/M1/superseded/`

*Built from v6.3 and the write-up log `papers/M1/WRITE_LOG.md` by `tools/Paper_assembly_protocol.md` (Decision Log P159–P171): 48 active entries, every one in the paper word for word (gate 8). **The statements are not restated here: each row points to the entry that holds the statement in full**, with its mark and its failure test. Numbering: `canon/M1/NUMBERING_v6_to_v7.md` (Remark 6.2 of v6.3 is Remark 6.3; Definition 3.3, Remark 3.4, Proposition 5.8 and Remark 6.2 are new). Ten numbered choices: the nine of v6.0 and the tenth (complex spinors). Audit: `papers/M1/STEP_AUDIT.md` §§11, 12. Rows of the sections above that are not listed below stand as they are. Proposed with the move to canon; the PI banks by commit.*

| Result | Where | Tag | Inputs | Certificate | Status |
|---|---|---|---|---|---|
| **v7.** Growth and decay, formal (restated) | M1 Def 2.4 | reading | M1-W025; Minimality M1-19 | — | proposed (v7.0) |
| **v7.** The two levels (restated: the words on the Clifford action leave) | M1 Def 2.7 | reading | M1-W016 | — | proposed (v7.0) |
| **v7.** The tenth choice: the spinor bundle is the complex spinor bundle (new in the text) | M1 §2.4, after Def 2.7; §2.6 | reading | M1-W035, M1-W048, M1-W049; Minimality M1-15 | — | proposed (v7.0) |
| **v7.** Orbits are realised (restated: "factor"; what a symmetry is) | M1 Def 2.8 | reading | M1-W021 | — | proposed (v7.0) |
| **v7.** Drive, formal (restated: no clause on measure) | M1 Def 2.9 | reading | M1-W006 | — | proposed (v7.0) |
| **v7.** Modulus (restated) | M1 Def 3.1 | reading | M1-W027; Minimality M1-20 | — | proposed (v7.0) |
| **v7.** The sixth axiom, formal (restated: the clauses in an order of priority; clause (c) gains the dimension of the fibre and its number of handles) | M1 Def 3.2 | reading | M1-W012, M1-W010, M1-W050; Minimality M1-17 | — | proposed (v7.0) |
| **v7.** The same geometry; unique (new) | M1 Def 3.3 | reading | M1-W032 | — | proposed (v7.0) |
| **v7.** Mirror image and run backwards (new) | M1 Remark 3.4 | [D]; two points declared not shown | M1-W034 | — | proposed (v7.0) |
| **v7.** The setting of the drive: a step keeps the handedness; the drive moves only the fibre that carries it; the step is the linear map of its matrix; the internal piece is carried round time by a whole number of steps (new in the text) | M1 §4.1 | declared choices, and READ from the paper | M1-W001, M1-W004, M1-W005, M1-W009 | `L1_Fib_not_SL2` for the determinants | proposed (v7.0) |
| **v7.** The points that return are the rational points (replaces a citation) | M1 Prop 4.1, proof | [R]; hand proof `STEP_AUDIT.md` §11.11 | M1-W007 | — | proposed (v7.0) |
| **v7.** The norm form (restated, with its proof) | M1 Lemma 5.1 | [R] | M1-W017, M1-W051 | — | proposed (v7.0) |
| **v7.** The fibre algebra is the quaternions (two steps of the proof restated or added) | M1 Prop 5.2 | [D] | M1-W045, M1-W015; EXT Frobenius (V-15) | `L2_hamilton`, `L2_noncomm`, `L2_norm_posdef` | proposed (v7.0) |
| **v7.** The fibre is a surface, and the torus (restated: by clause (c); "Anosov" and Franks leave) | M1 Prop 5.5 | [D] | M1-W013, M1-W003, M1-W008, M1-W058; Minimality M1-17; V-28, V-29, V-30 (not read at source) | `L2_two_torsion` | proposed (v7.0) |
| **v7.** The corner algebras (restated: "left in place" for "stabiliser"; the local form of the fold in the statement) | M1 Prop 5.6 | [D] | M1-W044, M1-W052, M1-W053 | `L2_Ad_w_cycles`, `L2_w_cubed` | proposed (v7.0) |
| **v7.** The geometry satisfies A2 (new) | M1 Prop 5.8 | [D] | M1-W026; Minimality M1-19 | none; `papers/M1/checks/j3_warp_check.py` | proposed (v7.0) |
| **v7.** Where the quaternionic structure carries information (new); that the structure exists on the whole of M₁₂ is assumed and not shown | M1 Remark 6.2 | declared | M1-W031 | — | proposed (v7.0) |
| **v7.** The two-sphere (restated: "is selected") | M1 Prop 7.1 | [D] | M1-W056 | `L4_unit_sphere_axes` | proposed (v7.0) |
| **v7.** The projective plane (restated) | M1 Prop 7.2 | [D] | M1-W019; the tenth choice; V-31 (not read at source) | `L4_chi_counts`, `L4_chern_CP2` | proposed (v7.0) |
| **v7.** The integer two on S² (new in the text) | M1 §7.4 | [D] | M1-W036; Minimality M1-16; V-32 (not read at source) | — | proposed (v7.0) |
| **v7.** Flux and states (restated: second and last paragraphs) | M1 Def 7.4 | reading | M1-W024, M1-W023 | — | proposed (v7.0) |
| **v7.** The base has no further factor (new step of the proof) | M1 Thm 7.10 | [D] | M1-W020; Minimality M1-18 | `L3_chi_K8` | proposed (v7.0) |
| **v7.** Minimality theorem (restated: the tenth choice among the readings; one declared input, the continuous data the paper does not derive held fixed; the integer two on S² among the data) | M1 Thm 8.1 | [D] | all above; M1-W028, M1-W047, M1-W057, M1-W054, M1-W055; Minimality M1-20 | — | proposed (v7.0) |
| **v7.** The elimination table: rows E2, E3, E8, E9, E11, E12 restated; row E6 unchanged | M1 §8.2 | as printed in each row | M1-W037, M1-W038, M1-W040, M1-W041, M1-W043, M1-W046 | — | proposed (v7.0) |

*v7.1 (`canon/M1/Paper_M1_Six_Axioms_v7_1.tex`, 14 Nov 2026; 46 pp.; certificates unchanged in what they certify; Decision Log P173; v7.0 in `canon/M1/superseded/`). No row above changes: the headers of five Lean files are brought into line with the paper (the title; Franks, Atiyah–Bott and "v6.1" deleted), Appendix A's list of classical theorems loses Franks and Atiyah–Bott, and four uncited bibliography items are deleted. Proposed with the move to canon; the PI banks by commit.*

*Open at v7.0 and named in `papers/M1/HANDOVER.md`: whether the geometry has a symmetry that mirrors the torus (declared open in the paper); facts taken as known and not read at source (V-23, V-28 to V-33); the items of `papers/M1/HANDOVER_BUILD.md` §7 that the paper is silent on.*

---

## M2 v1.0 — WITHDRAWN 10 Nov 2026 (Decision Log P41). The rows below are the record of the withdrawn paper (`superseded/M2_v1/`); none is BANKED any longer, none is citable, and the new M2 enters its own rows when it is written

| Result | Site | Rigour | Depends on | Certificate | Status |
|---|---|---|---|---|---|
| Fifth reading: positive-definite metric; time = orbit parameter of the drive | M2 Def riemannian | reading R5 | PI ruling Q8; M2-4 | — | BANKED |
| Standing principle of minimality (series rule) | M2 §readings | principle | PI ruling 8 Nov | — | BANKED |
| ψ, ψ̄ sections of the Clifford module M ≅ ℍ³² (Cl(0,12) ≅ ℍ(32)); shadow ψ̄ = τ̂ψ; corner reading in 𝒞 | M2 Def ψ | [D] | A3 (M1 Def 2.7, Prop 7.3); EXT Bott periodicity; R-F1(Φ) adopted (Q17) | `M2_L7_module.lean`: `L7_bott`, `L7_module_dims` | BANKED |
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
| χ(pillowcase) = 2 two routes; 4π total, π per corner; χ(K₈) = 12; tadpole N = 12 on the base cycle | M2 Props chi-*, flux | [R]/[D] | M1 Thm 5.7, 7.10; weak (c) Q14; Addendum §4.6 reason reproduced | `M2_L3_zeta.lean`; `M2_L5_warp.lean`: `L5_chi_pillowcase`, `L5_deficit`, `L5_chi_K8` | BANKED |
| BPS completion; flux density at P₁; FD check; exact kink [∂a] = −κ₂²Nπ; constant slope (boundary condition); κ₂² = 2/L (normalisation, [D]) | M2 §§bps–gb | [R] (jump) / [D] (slope, κ₂²) | M2-6; Q16 | `L5_FD_check`, `L5_balance` | BANKED |
| **kL = Nπ; ζ = χ(K₈)π = 12π** | M2 Thm warp-exponent, Cor zeta | [R] given the [D] inputs above | Q15 (direction-blind; τ₂ the physical remnant) | `L5_zeta`, `L5_single_flux`, `L5_tau_corners` | BANKED |
| ω = 0 at the locked phase (τ̂ψ = −ψ) | M2 Prop locked | [R] | R1 | — | BANKED |
| ω orbit-average = space average (ergodic drive); = 0 for uniform phase | M2 Prop uncorrelated | [R] | EXT Katok–Hasselblatt; M1 Prop 4.1 | — | BANKED |
| One hump in the lock angle; Φ extremal at tan²ϑ = 2 (ϑ* ≈ 54.7°) — new | M2 §hump | [D]/[R] | — | `M2_L6_omega.lean`: `L6_Phi_coefficient`, `L6_Phi_extremum`, `L6_hump_zeros` | BANKED |
| ω has a definite sign on the decaying-warp solutions (half-circle); which sign is ψ's convention | M2 §half-circle | [D] | M2-9 | `L6_sign`, `L6_flip` | BANKED |
| ω's spectral face (GUE maximum) | M2 §omega-hook | [M] | — | — | TARGET (M4) |

## Targets registered for later papers (from the withdrawn M2 v1.0 and the series SOW; to be re-read when the new M2 exists)
| Result | Owing paper | Lead |
|---|---|---|
| Cone-tip Dirac spectrum; λ_n = n, d_odd(n); ζ(s)²(1−2^{−s}); partition function mock Jacobi; bridge field-ω ↔ spectral functional | M4 | Future-Mx §12.1 |
| Stationarity conditions for the aspect ratio (formerly M1 Prop 8.2, removed from M1 at v5.0, P38) derived from the reduced action; Λ₁₂ by solvability (R-τ8 as theorem or refuted); equal weighting via the module trace; τ₂ = 1.8466 | M7 | M1 v2 proof of Prop 8.2 (`canon/M1/superseded/`); Q17(3) |
| The Sp(1) structure of the commutator remainder in Φ's degree-three invariant; the S² flux | M7 | M2 Prop parity remark |
| κ₂² = 2/L from orbifold Gauss–Bonnet with warped weights ([D] → [R]) | M7 or M10 | M2 §gb |
| Paper 2 §5.1 Einstein-frame weight "+2" (e^{−96π}) | M10 | Register §15 (withdrawn) note |
| Σ-5 from A1 | M3 → M5 | M3 SOW WP3 |

## PROVISIONAL imports from the old ledger (menu only; not citable until re-derived)
*To be populated per paper at its opening session, from `proof_derivation_ledger_v22.md` rows for the paper's sources, each marked PROVISIONAL (old ledger line n) with the old rigour tag quoted, never trusted. The first import is M3's (Paper XX rows) and M4's (Paper 3 Prop 5; Paper 5 d_odd; Paper XI).*
