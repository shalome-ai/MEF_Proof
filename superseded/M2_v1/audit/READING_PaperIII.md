# Reading notes: Paper III V16 and Paper III Addendum v11 (read in full, 10 November 2026)

Directed by the PI: "I need you to read all of paper III and all of paper III addendum - then report back". The corpus is read, never cited (CLAUDE.md §3). Line numbers are of the files in `sources/`. Every entry below is READ unless marked. Rigour marks quoted are the papers' own.

## Paper III V16 (1242 lines)

### ll.160–470: abstract, introduction, conventions, the lepton submanifold
- Abstract: lepton zero modes are "three-dimensional δ-localised distributions on a submanifold Σ_ab = S² × γ_ab ⊂ K₈ disjoint from ℂP²", lifted to 4D "via the Zwegers shadow completion". Five-factor mass matrix; one factor (Y_fib) "is not closed in this paper"; "structural floor m_μ/m_τ ≳ 0.30" conditional on it. "The framework predicts its own missing computation."
- ll.219–229 "Three failed precursors": treating the lepton mode as a function on the two-dimensional pillowcase failed "by thirty orders of magnitude" because of e^{±2A(ω)}. The paper's own diagnosis: the warp on the pillowcase, used as a growth factor e^{−12π}, wrecks the two-dimensional calculation.
- ll.231–245 "lift one dimension": modes live on S² × (corner-to-corner geodesic); arc length s along the geodesic has g_ss = 1, "absorbing the pathological warp factor exactly".
- ll.283–291: pillowcase metric ds² = dω² + e^{2A(ω)}dψ², A = −k_ω ω, k_ω L_ω = 12π, "the warp budget ζ = 12π is the topological invariant χ(K₈)·π", citing Paper I and its Addendum. Marked Rigorous. (The cited derivation is the one audited in `STEP_AUDIT.md`.)
- ll.293–303: four "conical fixed points"; C₀, C_j at ω = 0 ("UV"), C_i, C_k at ω = L_ω/2 ("IR").
- ll.305–325: corner algebras ℝ, ℂ_i, ℂ_j, ℂ_k "a labelling convention" (marked Motivated).
- ll.349–381: geodesic lengths between corners on the warped pillowcase (table). The ψ-adjacent IR pair is at distance e^{−6π}L_ψ/2: the two far corners are exponentially close.
- ll.383–427: full K₈ metric used: ds² = dω² + e^{2A}dψ² + e^{2A}g_{S²} + e^{2A}g_{ℂP²}. **The warp multiplies ℂP² and S² here.** (PI's account, record §§4, 10: the warp does not act on ℂP² × S².)
- ll.429–468: volumes; at the far corners the S² has area 4πR_w²·e^{−12π}.

### ll.471–613: the four-dimensional lift
- Lepton field = smooth function × a delta-distribution on Σ_ab (codimension 5 in K₈); its self-energy diverges (ll.475–506, Derived).
- The lift to a smooth 4D field uses the "Zwegers shadow completion" of "the Spin^c-twisted partition function Z(τ, z) … a mock Jacobi form of weight 0, level 2", taken from Papers XI and XV (ll.510–518). The identification of the shadow integral with a counterterm tower is in a box marked "Motivated … a full proof of equivalence … is deferred" (ll.530–546). (The audit of 10 Nov found two different objects behind "the partition function": `papers/M3/M3_WP1-4_verification.md`.)
- "the conformal smoothing acts in the modular flow direction τ₂, not in the warp direction ω" (l.575). Profile exponent κ = √(Δ₀ + Y² + j(j+1)); "Δ₀ is a universal lift constant".
- Corner amplitudes uniform after normalisation (ll.593–611); earlier treatments "produced spurious e^{6π} or e^{3π} enhancements".

### ll.615–712: species and generations
- Leptons: one mode, h^{0,2}(ℂP², O(−3)) = 1; quarks h^{0,2}(ℂP², O(−4)) = 3 (colours) (ll.636–642).
- **Generations of leptons are corners of the pillowcase** (ll.650–697). Table l.656: L_L at C₀, C_i, C_j; e_R at C_i, C₀, C_k; ν_R at C₀, C_i, C_j. So the fixed corner C₀ (= P₁, algebra ℝ) is generation 1 for L_L and ν_R, and **the three generations are three of the four corners, not the three cycled corners.**
- Which corner is left out: "L_L (Y = −1/2) cannot reside at C_k (the doubly-shifted corner)" (ll.673–690, Derived), by a hypercharge-twisted parity with holonomy π at the ψ-shifted corners. Which corner is which generation is "a labelling convention" (l.693, Motivated).
- ll.699–710: the paper records as *false* the conjecture that the three components on ℂP², the corner classes, and a three-fold iteration are one three: "The structures are mathematically independent."

### ll.714–893: the five-factor mass matrix
- The formula itself is "Motivated … not a uniqueness theorem" (ll.720–725).
- Δ₀ "is a corpus-undetermined parameter; for the present paper it is treated as a free parameter to be fixed by one mass ratio" (l.795). (The abstract says zero free parameters, l.214.)
- Factor Y_fib: "Classification: Gap" (ll.812–838).
- **Half-period Spin^c phases on the pillowcase: φ_ψ = 5π/12 = π/3 + π/12, φ_ω = π/2** (ll.840–852), attributed to Paper V §8. φ_ω = π/2 is "a quarter-period because the Spin^c involution must square to J² = −1". Phases add along a path (Lemma, ll.854–866): "The Spin^c connection on the warped pillowcase is flat away from the four conical fixed points".
- **The corner sign: (−1)^{3mn}, +1 at C₀, C_i, C_j and −1 at C_k** (ll.870–886); "the corner-level presentation of the hypercharge quantisation integer 3". This is M1 Cor 7.4. The corner left out for L_L (C_k) is the corner with the odd sign.

### ll.895–1100: assembly, the gap, discussion, conclusions
- The assembled matrix cannot be evaluated because Y_fib is open (ll.899–907). A "conditional floor" m_μ/m_τ ≳ 0.30 against the measured 0.0595, "Motivated" (ll.909–937): **the paper's own machinery, as it stands, misses the muon/tau ratio by a factor of five**, and says so ("a (C) verdict … the framework as currently configured fails to reproduce the observed mass hierarchy", l.1049).
- The missing factor is named: the S² overlap evaluated at the different S² radii at the two ends, R_{S²} = R_w e^{A}, "R_w at UV corners and R_w·e^{−6π} at IR corners" (ll.967–986). So the remedy again rests on the warp multiplying S².
- "What this paper does not do": no masses, no neutrino matrices, **no PMNS angles** (ll.1055–1064), despite the title.
- Conclusions (ll.1070–1098): (i) the submanifold, Rigorous; (ii) the lift, Motivated/Derived; (iii) the architecture, Derived, Y_fib a Gap; (iv) the floor, Motivated.

### What Paper III says about the corners, in one place
1. The corners are conical fixed points of the pillowcase; the Spin^c connection is flat away from them (l.859).
2. Two corners sit where the warp is 1 and two where it is e^{−6π}; everything quantitative in the paper comes from that exponential.
3. Leptons live at corners (on S² × a path between two corners); the three generations of a species are three of the four corners; the corner excluded for L_L is C_k, the corner with the odd Spin^c sign.
4. Phases, not growth, are accumulated along paths between corners: π/2 per ω half-period, 5π/12 per ψ half-period.
5. Paper III does not derive ζ = 12π, does not use the drive or time, and has no cones other than the four corners.

## The shared preamble `mef_field_content_preamble.tex` v1.5 (161 lines; it is §2 of both papers)
- Master Equation displayed as G = 8πG_eff T + ζ ∇Φ∇Φ + Λ_eff g with "ζ = χ(K₈)·π" **stated as a definition in the box** (ll.60–68). (No −½g|∇Φ|² term here; that is the pre-erratum form.)
- "all twelve dimensions are vast … nested embedding 4D ⊂ 5D ⊂ ⋯ ⊂ 12D" (l.71).
- ω, ψ, ψ̄ "independent and co-fundamental" (l.79). **ω is "a real scalar field … It parameterises one direction of the pillowcase orbifold and enters the 12D metric as a warp factor along the θ_ω-axis"** (l.93). (M2 and CLAUDE.md §5: ω = ψ + τ̂ψ, quaternion-valued, not independent. The preamble and M2 disagree on what ω is.)
- ψ and ψ̄ have "non-overlapping non-zero support": ψ at the "Quantum-wall", ψ̄ at the "Anti-Quantum-wall", related by "the geometric orbifold involution σ … that exchanges the Q-wall and AQ-wall fixed points" (ll.85–87, 96–100). **Here σ exchanges fixed points, so it is not the fold z ↦ −z (which fixes each corner); it is an exchange of corners.** The visible Standard Model is at the Q-wall; "a mirror Standard Model … constituting the dark matter sector" at the AQ-wall.
- Φ_QC = ω(ψ − ψ̄)² "is a cross-wall pairing … not a same-point spinor bilinear" (l.104).

## Paper III Addendum v11 (2196 lines)

### ll.131–170: introduction
- Five claimed results: lepton colourlessness; **m_μ/m_τ = ln(φ²)/(6π) ≈ 0.0510 against 0.0595**, "14% residual … Motivated"; the four mixing observables "within 1σ–2σ"; the neutrino mass scale V_min^{1/4} e^{−24π} ≈ 4 meV; the phase φ_ψ = 5π/12 = π/12 + π/3.
- "the warp length L_ω/2 = 6π from Paper IV tadpole cancellation" (l.143): **a second source named for the 12π (Paper IV), besides Paper I's Addendum.** Not yet read.
- The ratio ln(φ²)/(6π) divides the drive's growth exponent per step (2 ln φ) by half the warp budget (6π): the corpus treats the drive's exponent and the warp budget as quantities of one kind.

### ll.171–323: corner architecture ("Phase 0")
- Leptons are "corner-localised orbifold fixed-point modes", not bulk modes (ll.177–200). Supporting sentence "The data confirms Reading β" (l.196): a reading chosen by agreement with measured amplitudes.
- Four-corner table (ll.202–224): A = C₀ (0,0) UV, phase 0, parity +1, ℝ; B = (L_ω/2, 0) IR, phase π/2, +1, ℂ_i; C = (0, L_ψ/2) UV, 5π/12, −1, ℂ_j; D = (L_ω/2, L_ψ/2) IR, 11π/12, −1, ℂ_k. "Q wall" = ψ = 0 (A, B); "AQ wall" = ψ = L_ψ/2 (C, D).
- Corner amplitudes table (ll.226–248): numbers 0.250, 0.0877, 0.0160, 0.0401 given without derivation in this paper ("Derived").
- Occupancy (ll.250–279): each species has its three generations at three of the four corners; L_L and ν_R at A, B, C; e_R at B, A, D. "the excluded corner determined by Spin^c halving + species hypercharge".
- Higgs at corner B (ℂ_i, IR) (ll.281–293).
- "the V_Aut × Z orbit signature … acting transitively on the three non-distinguished corners C_i, C_j, C_k" (l.297): **the corpus also has the three corners permuted transitively, with C₀ distinguished.** This is M1's three-cycle.

### ll.324–458: the dilaton across the walls, the Sol flow, and m_μ/m_τ
- ll.335–343: identifying the field ω with the coordinate ω made the dilaton vanish at the ω = 0 corners and gave "m_μ/m_τ ∼ 10^{−16}".
- ll.353–367: the Sol monodromy M = [[1,1],[1,2]], trace 3, eigenvalues φ^{±2}; then "The Lyapunov exponent is λ_Sol = ln φ / T_Sol" (l.364). (Corpus error already banked, P17: with eigenvalues φ^{±2} the exponent per period is 2 ln φ.)
- ll.381–391: the field ω is given a constant shift "C_Sol · ln φ" from the twisted time circle; "The explicit numerical value of C_Sol has not been computed … C_Sol = 1 … is the natural normalisation" (Remark, l.388). **Red flag: a normalisation set where a number is compared with observation.**
- ll.402–438: a 2 × 2 block with entries a, ln φ, L_ω/2 + ln φ gives singular values ≈ 6π and ≈ ln φ, so m_μ/m_τ ≈ ln φ/(6π) = 0.0255.
- **ll.440–447 "The cross-wall factor of two": the numerator is then doubled, to ln(φ²)/(6π) = 0.0510**, with two alternative reasons offered ("The two viewpoints give the same arithmetic"). **Red flag: a factor introduced after the first value, with the target (0.0595) known.** Observation (mine): the true exponent of the drive is 2 ln φ (P17), so the doubling may simply be undoing the wrong exponent of l.364; the paper does not say this.
- **In this section 6π is L_ω/2, the *value of the coordinate/field ω at the far corners*, and it is compared directly with ln φ.** So in the corpus 12π is the full period L_ω of the pillowcase's ω-direction (in units with k_ω = 1), and is attributed here to "Paper IV tadpole cancellation" (ll.143, 409, 457).

### ll.459–642: the two phase quanta, π/12 and π/3
- Base quantum π/12 (ll.459–547): half-period translation T_ψ lifts to right-multiplication by j (order 4 on spinors, since j² = −1; l.476, Rigorous); Spin^c with c₁ = 3h breaks Sp(1) to U(1) (Derived); then "six weight channels" from a six-dimensional module K, and "the composite cyclic structure … of order 4 × 6 = 24 = 2χ(K₈) … the multiplicative composition (rather than group-theoretic least common multiple)" (ll.506–510). **Red flag: the paper itself says it multiplies where group orders would not multiply.** The corner pattern of the lifted fold is "{0, 0, 0, π} … a σ-fixed-point asymmetry rather than a translation accumulation" (l.467).
- Fibre quantum π/3 (ll.549–628): the centre ℤ₃ of SU(3) acts on Spin^c spinors of ℂP² with phase e^{−2πi/3} · e^{iπ} = e^{iπ/3} because the half-determinant line has c₁ = (3/2)h (ll.563–575, Derived): order 6 = 3 × 2, "the Spin^c structure is doing real work here". Then the half-period T_ψ is *identified* with one such step (ll.583–592, "the load-bearing structural identity").
- l.556 says h^{0,2}(ℂP², O(−4)) = 3 corresponds "to the three Standard-Model lepton generations"; ll.141 and 187 of the same paper say that 3 is the quarks' and the leptons have O(−3) = 1. **Internal inconsistency.**
- Sum (ll.630–640): φ_ψ = 0 + π/12 + π/3 = 5π/12. This "upgrades the corpus value of Paper II … from a numerical optimum (matched to δ_CP ≈ 65.6°)": **the value 5π/12 was first obtained by fitting** (red flag: agreement with a known target, then a derivation).
- **l.637, the closing sentence: "the assignments distribute the total geometric phase quantum Φ_geom^total = χ(K₈)·π = 12π uniquely across the four corner generators: 1 quantum on T_ψ via W_base, 4 quanta on T_ψ via W_fibre, 6 quanta on T_ω via φ_ω, and 1 quantum at the C₃ corner via the σ-fixed-point lift, summing to 1 + 4 + 6 + 1 = 12 = χ(K₈)."**
  - Here **12π is called a total *phase*** (a turning), where Paper III l.291 and this paper's ll.1464–1477 call it the warp *budget* (a growth exponent) and ll.409–457 use 6π as a *length* L_ω/2. One number, three kinds of quantity, no derivation connecting them.
  - The arithmetic does not give 12π: the quanta are of π/12 (W_base = π/12 is "1 quantum", π/3 is 4, π/2 is 6), so twelve of them total **π, not 12π**; and the corner lift is π, which is twelve such quanta, not one. (CHECKED by hand: (1 + 4 + 6)·π/12 = 11π/12, the phase of corner D in the table at l.218.)

### ll.643–886: the fibre overlap ("Y_fib closure") and the "dimensional-shell hierarchy"
- **A framing axiom is introduced (ll.647–658): "Quarks are direct 4D objects (no shadow) … Charged leptons are 4D shadows of one 8D source object on K₈ … Neutrinos are 4D shadows of one 12D source object on M₁₂ … One source object casts one 4D shadow at any given lower dimensional layer. Different 4D shadows correspond to different source objects."** This is the corpus's use of *shadow* in the sense of the fifth axiom. Compare the PI (record §§12–13): the three generations are three shadows of one hyper-fermion ("1 + 2 shadows"). The Addendum's "one object, one shadow" does not say that; in it the generations are corners, not shadows of one thing.
- Its status (ll.663–664): "classified [Motivated]. It is upgraded to [Derived] for the charged-lepton sector by the empirical match of the projected matrices". **Red flag: a rigour label raised by agreement with a target.**
- "dark matter and dark energy (6D+ objects with 4D-shadow gravitational-only signature)" (l.669): the dark sector as shadows seen through gravity alone, which is the PI's P26(a).
- Z-factors Z = 1 ± ν with ν = φ_ω/π = 1/2: 3/2 at the ω = 0 corners, 1/2 at the far corners; "the sign is set by the orientation of the half-determinant projection" (ll.701–713). Matrix of multiplicities with entries 1 and 2 (ll.716–750). R_fibre = cos(π/6) with "frame rotation per unit Spin^c charge φ_ω/c₁(L) = (π/2)/3 = π/6" (l.757). (π/6 again: today's "one shear".)
- ll.776–794: a table with columns "shadow output" and "Empirical" that are identical, and the sentence "The match is achieved without pre-loading the target values". The "Empirical" column is the pattern earlier drafts used; **red flag: agreement with a known target.**
- The step from the order-six action to "j_eff = 3/2" is "Motivated … A formal proof … is left open" (l.686).

### ll.887–1183: the charged-lepton mass matrix on "the quaternion pillowcase" ("Phase II")
- "Lengths L_ω/2 = 6π and L_ψ,UV are real-valued; fields are ℍ-valued" (l.908). Phases along the ω-cycle are put in ℂ_i, along the ψ-cycle in ℂ_j, diagonal in ℂ_k (ll.934–940); "e^{i·π/2} = i": **the ω half-period phase π/2 is the unit i itself** (l.962).
- Self-pair entries taken from the Sol mechanism: ln(φ²) ≈ 0.962 at corner A (ℝ) and 6π + ln(φ²) ≈ 19.81 at corner B (ℂ_i) (ll.965–969).
- A new factor Q̃ (ll.971–1005) with the same numerical entries as the earlier factor Q_cliff; the product "squares the suppression". The paper says: "If Q̃ were not applied … m_e would emerge at ∼4 MeV rather than 0.511 MeV … The introduction of Q̃ is therefore phenomenologically load-bearing" (l.1142). **Red flag: a factor introduced because the number needs it.**
- Projection to 4D: two rules offered; the real-part rule "annihilates" the key entry, so the magnitude rule is taken, "selected by structural falsification of the alternative" (ll.1027–1036, 1132). **Red flag: a choice made after the answer is known.**
- Result (ll.1047–1061): "fitting the single free parameter Δ₀ to recover the physical electron mass" and anchoring the scale to m_τ; then m_μ = 86.2 MeV against 105.66 ("∼18%"). So of three masses, two are fitted and the third is 18% off. The introduction (l.139) says "zero free parameters".
- "K₈ is an orbifold with π-deficit conical singularities, and lepton fields are pinned to the singularities" (l.1128): **the corpus's direct statement that the corners are cones of deficit π and that the leptons sit on them.**
- l.1129: "both [quarks and charged leptons] are 4D-shadow projections of a single M₁₂ fermionic object", and l.891 "charged leptons are 4D-shadow projections of a single M₁₂ fermionic object". (ll.647–658 said quarks cast no shadow and leptons come from an 8D object. **Internal inconsistency**; the l.1129 wording is the nearer to the PI's single hyper-fermion.)

### ll.1184–1380: mixing angles as "cone-deficit shadows" ("Phase III")
- **The second kind of cone** (ll.1190–1192): mixing angles "are 4D-shadow cone-deficit angles … discrete topological invariants of hyperbolic cones whose tips are projection artefacts of smooth higher-dim geodesic flows. The 'cone' has a singular tip in 4D but is smooth in higher dimensions". The smooth structure is S¹_Sol × S³ (the Sol flow and the Hopf fibration), with "corner-walk Wilson-line corrections from the pillowcase". **This is where the PI's sentence "singular in 4D, smooth above" lives in the corpus; it is said of cones in spacetime's shadow, not of the pillowcase corners.**
- The bare formula (ll.1200–1206): θ(k) = arctan(k·ln φ/(2π)), "the Sol expansion rate over the Hopf rotation rate". Marked **Motivated: "A formal proof … from the explicit metric is open; the form is supported by empirical match."**
- k = 2 "by the orbifold folding" (ll.1208–1214); and later: "If … k = 1, the bare cone-deficit angle would be … 4.38°, missing PDG θ₁₃ = 8.57° by a factor of two. The wrap-fraction k = 2 … is therefore phenomenologically load-bearing" (l.1345). **Red flag: factor of two fixed by the target.** Observation (mine; arithmetic CHECKED): with the drive's true exponent 2 ln φ per step (P17) and k = 1, the formula is arctan(2 ln φ / 2π) = 8.71°, the same number. So this "k = 2" and the "cross-wall factor of two" of ll.440–447 both stand where the factor 2 of the wrong Lyapunov exponent is missing. Read that way the formula says: **slope = (growth exponent of the drive per step) ÷ (one full turn)**, which is the pitch of a spiral that grows by φ² per turn.
- θ₁₃ = arctan(ln φ/π) = 8.71° (PDG 8.57°); θ₁₂ = arctan((ln φ + π/2)/π) = 33.15° (33.4°); θ₂₃ = arccos of the same slope = 49.22° (49.2°), marked **Motivated: "empirically established … by the simultaneous match … The geometric proof … is open"** (ll.1241–1258). Which trigonometric function is applied to the slope is chosen by the match. **Red flags: agreement with target; rigour by match.**
- The phase δ = 6π/24 + 11π/24 + 5π/24 = 11π/12 = 165° from the loop A → B → C → A using *half* phases, where the angles used *full* phases; "An alternative convention … would give a different value and is not pursued" (ll.1260–1276). **Red flag: choice of convention.**
- Tally in the paper's own words (l.1358): "7 observables, 2 free parameters".
- **Here the corpus does join a growth to a turning, as a ratio (a slope)**, never as an equality. Nothing in this section concerns ζ or the corner deficit π.

### ll.1381–1610: the neutrino mass scale ("Phase IV-A")
- A further axiom (ll.1389–1393, Motivated): the neutrino's "projection geometry activates the maximal-extent M₁₂ cycle"; quark projection is "4D-direct, no shadow dilution".
- The twelve-dimensional metric (ll.1411–1417): g⁽⁴⁾ + e^{2A}[R_c² ds²_{ℂP²} + R_w² ds²_{S²}] + dθ_ψ² + e^{2ζΦ_QC} dθ_ω², with A = −k_ψ|θ_ψ| − k_ω|θ_ω|. "The 4D spacetime factor … carries no exponential warp prefactor; the warp acts only on the Σ₆ = ℂP² × S² fibre and on the θ_ω direction of the orbifold base."
  - **Spacetime unwarped** agrees with the PI (P26(b)), and the paper leans on it: "If the metric … had warped the 4D spacetime coordinates … m_ν would fall below the meV scale, falsifying the framework" (l.1487).
  - **The warp on ℂP² × S²** is against the PI's account (record §§4, 10). In this paper it is what produces every exponential (S² radius e^{−6π}; the fibre volume e^{6A}).
  - **ζ multiplies Φ_QC in an exponent of the metric**: the one place read where ζ and Φ_QC appear together outside the Master Equation. With the PI's Φ_QC from 0 to 1, ζ is the total exponent.
- **A third source named for 12π** (l.1464, l.1572): "the warp budget ζ = 12π = χ(K)·π is topologically forced from the Euler characteristic of K via Chern–Gauss–Bonnet (Paper IV §4), not a moduli-tunable parameter". (Elsewhere in this paper: "Paper IV tadpole cancellation". Paper III: Paper I and its Addendum.) **Paper IV §4 has not been read in this audit.**
- Warp power w = 2 from a rescaling argument (ll.1431–1453, marked Rigorous; cites Bismut–Cheeger; not checked here).
- **Arithmetic inconsistency at ll.1475–1477:** "evaluation at the IR boundary A|_IR = −k_ω L_ω/2 = −ζ/2 = −6π: W_ν = e^{wA}|_IR = e^{2·(−12π)} = e^{−24π}". With A = −6π and w = 2 the factor is e^{−12π}, not e^{−24π}: sixteen orders of magnitude. The value e^{−24π} is the one that gives 4 meV. **Red flag: agreement with target; the stated inputs give a different number** (CHECKED by hand: 2 × 6π = 12π).
- Prefactor uses "(M_Pl R_c)² ≈ 4.4 × 10⁶" and τ₂ ≈ 1.861 (ll.1490–1503): numerical inputs taken from Paper IV, in a result described as having "zero free parameters".
- m_ν = V_min^{1/4} e^{−24π} ≈ 4 meV and "m_ν = Λ_eff^{1/4}" called "the application … of Axiom M-2 (The Shadow Completion) … the mathematical formalisation of the Shadow Principle (Σ-5)" (ll.1525–1545): **the corpus's fifth-axiom language applied to a number.** Λ_eff = V_min e^{−96π}, 96π = 8 × 12π.

### ll.1611–1796: the neutrino spectrum ("Phase IV-B")
- Each mass = baseline × F_i, with F_i = cosh(k ln φ · Φ_i), k = 2, Φ_i the Spin^c phase accumulated on the walk A → B → C: Φ = 0, π/2, 11π/12 (ll.1625–1660). So the generations differ by **the drive's exponent multiplied by an angle accumulated between corners**: growth e^{(2 ln φ)·Φ}. (Here the exponent is taken per radian; in the mixing-angle formula it was taken per full turn. The two uses are not consistent with each other.)
- Three different conventions for the same phases are used in three places (full phase on one edge for the angles; half phases round a loop for δ; cumulative full phases for the masses), and the paper says of the last: "If the cumulative-walk convention were replaced by single-edge attribution … m₃ ≈ 7.5 meV … The cumulative-walk convention is therefore phenomenologically load-bearing" (l.1779). **Red flag: convention chosen by the target.**
- Results (ll.1673–1713): m = 3.92, 9.45, 31.35 meV; m₃ is 37% below the measured ≈ 50 meV; the larger mass-squared splitting is off by "factor 2.6". The paper itself warns that its 0.27% agreement on the smaller splitting is partly a cancellation and "is not used as evidence". Held at "Motivated".

### ll.1797–2068: Dirac or Majorana ("Phase IV-C"), the summary table, unification, gaps, conclusion
- The corner sign again: "σ̃ᶜ(m,n) = σ̃·(−1)^{mn}" (l.1820), and on the index sector the lifted involution is "−i γ₅ (−1)^{mn}", with J² = −1 "generating the quarter-period phase Φ_ω = π/2" (ll.1823–1827). So in the corpus the ω-phase π/2 *is* the statement that the lifted fold squares to −1.
- The neutrino is argued to be Dirac because the lifted involution fails three conditions; the theorem is stated as Derived and in the same breath "at Motivated rigour grade" (l.1898). A construction that would give Majorana "was examined and rejected" as "an arithmetic accommodation" (ll.1873–1877).
- The summary table (ll.1904–1931), in the paper's own figures: three angles within 2%; δ within 7%; small splitting −1.3%; **large splitting −61.8% ("factor ∼2.6")**; **Σm_ν = 44.7 meV against an oscillation lower bound of 58.4 meV ("Tension")**; m_ν baseline 4 meV against its own "strict equality" partner 5 meV ("−20% … a rounding artefact"). The table and its footnotes are printed twice (ll.1933–1946 and 1951–1962).
- l.1949: "The lepton-sector closure carries zero free parameters". (l.1358 of the same paper: "2 free parameters"; plus C_Sol = 1, C_flat = 1, η = 1, k = 2, and the three phase conventions.)
- ll.2012–2027: the same Sol exponent is said to give the Cabibbo angle (Paper I), Λ (Paper IV), and several cosmological numbers (Paper X); "Paper II requires the ψ-cycle holonomy φ_ψ = 5π/12 to reproduce the observed δ_CP ≈ 65.6°".
- ll.2029–2039 "Physical interpretation" (all Motivated): "leptons feel the Anosov flow of cosmic time"; "The 'Higgs' is not a local scalar; it is a non-local pairing across two orbifold walls"; "every topological integer in MEF has prime factorisation involving only 2 and 3".
- ll.2041–2054 open gaps, in the paper's words: C_flat ("a placeholder constant … C_flat = 1") and C_Sol ("The natural normalisation C_Sol = 1 has been adopted"). **Both are normalisations set to 1 at the point where the number is compared with experiment.**
- l.2063: "The lepton sector closure is therefore complete."
- ll.2069–2196: acknowledgements and bibliography (not content). Paper III ll.1–159 macros, ll.1100–1242 acknowledgements and bibliography.

## What the two papers say about the four corners (collected)

1. **The corners are cones.** "conical fixed points" (III l.293); "K₈ is an orbifold with π-deficit conical singularities, and lepton fields are pinned to the singularities" (Add. l.1128); the Spin^c connection "is flat away from the four conical fixed points" (III l.859).
2. **What sits on them.** One corner is plain (C₀, ℝ, phase 0); the other three carry i, j, k and are "permuted transitively" (Add. l.297). Leptons are corner modes; each species has its three generations at three of the four corners; the corner a species cannot occupy is fixed by the Spin^c sign and hypercharge (III ll.673–690).
3. **The sign.** (−1)^{3mn}, odd at C_k only; "the corner-level presentation of the hypercharge quantisation integer 3" (III l.886); "a σ-fixed-point asymmetry rather than a translation accumulation" (Add. l.467).
4. **Phases between corners.** π/2 along ω (the lifted fold squaring to −1), 5π/12 along ψ (= π/12 + π/3), 11π/12 on the diagonal. These are turnings.
5. **Growth between corners.** The warp e^{A}, A = −k_ω ω, equals 1 at two corners and e^{−6π} at the other two; total "budget" 12π. This is a growth.
6. **The second kind of cone.** Mixing angles are deficits of cones in the 4D shadow of smooth motion on S¹_Sol × S³: "singular tip in 4D but … smooth in higher dimensions" (Add. l.1190). Their slope is (the drive's growth exponent) ÷ (a full turn), plus corner phases.

## On ζ = 12π: what the two papers contain

- **No derivation.** 12π is taken from elsewhere each time it appears, and three different sources are named: Paper I and its Addendum (III l.291); "Paper IV tadpole cancellation" (Add. ll.143, 409, 457); "Chern–Gauss–Bonnet (Paper IV §4)" (Add. ll.1464, 1572). The preamble states "ζ = χ(K₈)·π" inside the box that displays the Master Equation. Paper IV has not been read in this audit.
- **One number in three roles, never connected:** a growth exponent (the warp budget: e^{−6π}, e^{−24π}, e^{−96π}); a length (L_ω/2 = 6π, added to ln φ and compared with it); and a phase ("the total geometric phase quantum … = χ(K₈)·π = 12π", Add. l.637). The sentence that calls it a phase gets it by adding twelve quanta of π/12, which make π, not 12π.
- **ζ and Φ_QC together:** only in the metric term e^{2ζΦ_QC}dθ_ω² (Add. l.1415) and in the Master Equation itself. Nothing relates the two.
- **Where growth meets turning:** only as ratios and products with the drive's exponent: ln φ²/(6π) (a mass ratio), ln φ²/(2π) (a slope), e^{(ln φ²)·Φ} (mass factors). Each of these carries a factor of 2 that the paper attributes to something else ("cross-wall", "wrap-fraction k = 2") and that is exactly the factor missing from its Lyapunov exponent.

## Disagreements between these papers and the PI's account or the series (for the audit)

| Item | These papers | PI's account / series |
|---|---|---|
| Where the warp acts | on ℂP² × S² and on one direction of the pillowcase; not on spacetime | on the pillowcase only; not on ℂP² × S²; not on spacetime (record §§4, 10; P26) |
| What ω is | an independent real scalar that "parameterises one direction of the pillowcase" | M2: ω = ψ + chiral twin, quaternion-valued, not independent |
| The involution relating ψ and ψ̄ | "σ: (ψ, ω) ↦ (−ψ, −ω)" said to *exchange* the Q-wall and AQ-wall corners (preamble ll.85–87; Add. l.579). The fold z ↦ −z fixes every corner, so the map described is not the fold; the map that exchanges the walls A ↔ C, B ↔ D is the half-period translation T_ψ | M2: the exchange τ = (quarter-turn, s ↦ −s), τ² = fold; fixes P₁, P₄, swaps P₂, P₃. **Three different maps are in play for one role.** |
| Three generations | three of the four corners, including the plain corner C₀ | three shadows of one hyper-fermion (record §§12–13); today's audit: three phases of the cycled odd corner (P28) |
| Shadow | "One source object casts one 4D shadow" (Add. l.657) | one thing, three shadows |
| Lyapunov exponent | ln φ | 2 ln φ (P17, banked) |
| Free parameters | "zero" and "2" in the same paper | — |

---

## Paper IV v7, §4 "Topological Derivation of ζ = 12π" (ll.307–333), read in its entirety, 10 November 2026

Directed by the PI. Also read for context: §2 (ll.219–254, the manifold, χ, the metric), §3.3 (ll.286–303, τ₂), §5 (ll.334–391, the exponent). Not read: the rest of Paper IV.

**The whole of §4 is twenty-seven lines and two steps.** Its first sentence: "Full details appear in Paper I, §7 and Appendix C."

| Step | The text | Status |
|---|---|---|
| 1 (ll.311–317) | "The Chern–Gauss–Bonnet theorem constrains the total flux threading any compact manifold: N_flux = χ(K₈) = 12. This is a consistency condition: any other flux quantum number would leave uncancelled sources (tadpoles)" | **Asserted.** The Chern–Gauss–Bonnet theorem says the integral of the Euler form is χ. It says nothing about flux. No equation of motion, no source, no Bianchi identity is written. (This is the step the audit of M2 §4 marked: the known conditions of this kind carry χ/24, `papers/M2/STEP_AUDIT.md`.) |
| 2 (ll.319–327) | "When a unit of quantised flux is localised near a ℤ₂ fixed point, it backreacts on the geometry. For a BPS-type flux-brane solution, the warp factor A(ω) acquires Δ(k_ω L_ω) per flux unit = π" | **Asserted.** No solution is exhibited; no equation is solved. The sentence before it recalls that each corner has deficit π, but the π per flux unit is not derived from that deficit. |
| Result (ll.328–331) | ζ = k_ω L_ω = N_flux × π = 12π | the product of the two assertions |

**So Paper IV §4 is not a derivation. It is a summary of the same argument audited already** (Paper I Addendum §3 = Paper 2 §4 = M2 §4), now seen in a fourth place and in its shortest form. Every paper that uses 12π points to one of these; none contains more.

**Other things on the pages read.**
- l.238: "χ(T²/ℤ₂) = 2 by the orbifold Gauss–Bonnet formula, where the four ℤ₂ fixed points each contribute a deficit angle δ = π, giving 4 × (π/2π) = 2" (correct; M1 Thm 5.7).
- l.240: "This single integer – twelve – is the seed from which the cosmological constant, the fermion generation count, the mass hierarchy, the CKM matrix, and the electroweak mixing angle all grow."
- l.250: the metric with e^{2A} on ℂP² × S² and e^{2ζΦ_QC} on dθ_ω²: the source of the Addendum's l.1415.
- **τ₂ has three definitions and two values in the corpus:** "τ₂ = R_w/R_c" (IV l.253); "τ₂ = L_ω/L_ψ ≈ 1.86" (IV l.288); "τ₂ = L_ψ/L_ω ≈ 1.861" (III l.291); M1 Prop 8.2: 1.8466 from a cubic. In IV it comes from "the requirement that the SU(3) … and SU(2) … gauge coupling … unify … The tree-level stabilisation condition yields" (ll.290–293), with no condition written.
- **The Weinberg angle** (l.299): "sin²θ_W = 1/(1 + τ₂²) ≈ 0.224 (observed: 0.231, 3% agreement)". Arithmetic CHECKED: 0.2243 at 1.86; 0.2268 at M1's 1.8466. The formula is stated in a list of "consequences", not derived on the pages read. Not audited.
- **The suppression e^{−96π}** (ll.379–388): the integral ∫₀^{L} e^{−8kθ}dθ = (1 − e^{−8ζ})/(8k) is dominated by its *other* end and is ≈ 1/(8k); the paper then takes "the warp factor evaluated at the boundary", e^{−8ζ}, as the answer. And it evaluates at the full period (exponent −12π) where Paper III and the Addendum put the far corners at half the period (−6π). With −6π the factor would be e^{−48π}. **Red flag: the number used is not the value of the integral written, and the end point differs between papers.**

## Paper I, section 7 and Appendix C, read in their entirety (10 November 2026)

Lines read: `sources/Paper_I/chapter_7_implications.tex` ll.1-190 (all); `sources/Paper_I/appendix_C_hierarchy_zeta_12pi_derivation.tex` ll.1-1027 (all); `sources/Paper_I/chapter_3_geometric_foundation.tex` ll.196-395 (the body derivation, section 3.9, which is where the argument actually sits); `main.tex` ll.100-158. Red-flag scan run on Appendix C (10 hits; those at the steps consumed: l.145 "proportional", l.246 "standard result", l.323 "matches the observed").

**Section 7 (READ).** "Implications and Context": comparison with other programmes, speculative technology, Bell, life, philosophy. It contains no derivation of zeta; it quotes the value and points to Appendix C (ll.34, 63, 102). Paper IV's pointer "Paper I, section 7" leads to nothing. The body derivation is section 3.9 (chapter 3, ll.277-348).

**Appendix C, the derivation (ll.239-345) (READ).**
- Step 1, ll.246-268: Chern-Gauss-Bonnet gives the Euler number (correct, and all it gives); then "in flux compactifications (the paradigm established by F-theory, and applicable more broadly to any compact manifold supporting gauge flux) N_flux = chi(K8) = 12". No equation of motion, Bianchi identity or source is written. Asserted. (RECALLED, quarantined: the F-theory tadpole I know of is chi/24 = branes + a flux term, not N_flux = chi.)
- Step 2, ll.271-295: introduced as "The key claim". Justification: the orbifold map sends theta to theta + pi, "so the exponential warping picks up a factor of e^pi per unit charge" (a statement about an angle turned into a statement about a growth exponent, with no equation); "confirmed by direct computation of the Green's function" (the computation is not in the appendix); the holonomy "consistency" at l.295 assumes two flux units per 2 pi and returns pi per unit, i.e. restates the claim.
- Result ll.309-345: 12 x pi; "No step in this chain involves a freely adjustable parameter".

**Appendix C on its own status (READ).** l.974: "Strongest assumption---the pi factor ... A fully rigorous proof would require solving the nonlinear Einstein-Maxwell ODE ... analytically intractable". l.988, status table: "zeta = 12 pi derivation: Gap -> Gap persists (refined) ... The honest status: well-motivated conjecture, not closed proof." l.1010: open question 1 is the pi per flux unit. Against this, l.1022 (Conclusion box) says "unique value ... a prediction, derived", and the abstract (`main.tex` l.116) says "derives, with zero free parameters". Chapter 3 l.310 sends the "rigorous BPS derivation" to the Paper I Addendum, which was audited earlier in this file's companion (`ZETA_LEAD.md`) and does not hold.

**Other things in Appendix C (READ; arithmetic CHECKED where stated).**
- zeta has two roles identified without argument: the coefficient in e^{2 zeta Phi} d omega^2 (l.62) and the product k_omega L_omega of the warp A = -k|omega| on the fibre (l.86). At l.714 it is the rate alone: "k_omega approx 12 pi".
- chi(T^2/Z_2) is 2 at l.255 (needed for 3 x 2 x 2 = 12) and 1 at l.500 ("Euler characteristic check ... = 1, tick"). CHECKED by hand: the underlying surface is a sphere, chi = 2; the l.500 formula is wrong.
- Chapter 3 ll.351-373: the flux n_1 = -7 is selected as the integer giving three generations "and the correct hierarchy exponent", through a "holonomy constraint lambda k L = 12 pi" that is not derived anywhere read.
- tau_2: l.669 "sqrt(const. x N_c^2/N_w^2) approx 1.8708" with N_c = 8, N_w = 14 and the constant not given (CHECKED: it must be 10.72 for the formula as written; sqrt(3.5) = 1.8708). l.1014: these flux numbers are kept because "these values produce the correct tau_2". The status table calls it "Closed". Section title says 1.86, text 1.87.
- Hessian ll.728-755: a 5 x 5 matrix of round integers said to come from "explicit numerical computation"; stated eigenvalues of the upper block {102.5, 61.5, 10}; "trace check 100 + 64 + 10 = 174". CHECKED (numpy): the upper block has eigenvalues 64, 80.7, 101.3 and trace 246; the 82 on the diagonal was replaced by 10 in the "check". The masses in the table at ll.772-784 rest on this.
- Cosmological constant ll.841-938: the appendix states plainly that its result is +10^-11, 110 orders from observation, and open.
