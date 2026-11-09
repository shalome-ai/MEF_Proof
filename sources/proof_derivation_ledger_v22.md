# MEF Proof / Derivation Ledger — v22

**v22 (7 Nov 2026).** Banked, on PI sign-off, the Four Axioms programme: new section **Paper M1 — Four axioms and their minimal geometry**, first in publication precedence (nineteen rows, five certificates). Register corrections 7 (`thm:dim-12` leg (i) reworded) and 9 ({2,3} scoped) applied in place; 10 and 11 recorded in the M1 section; 8 held. Supersedes v21.

**Purpose**: source registry for **what is derived, where, and at what rigour**. One question, one answer: for any result, this file names the single canonical site and the rigour tag it holds there.

**The one-row-one-site convention (v17, PI ruling).** Every result has **exactly one row** and **exactly one site**. The ledger records **no consumption edges** ("Paper X uses this"), **no provenance chains**, and **no ancestry**. Where a result was first obtained, which papers consume it, and what it superseded are not registry facts. A row states what is true and where it is proved. Nothing else.

**Rationale, recorded once so it is not undone.** A consumption record looks exactly like a derivation record under grep, and a registry that answers "where does τ₂ live?" with five hits has failed at its only job. Consumption rows are also claims about papers' contents, so they rot silently: a superseded derivation propagates through every row that pointed at it. One row, one site means there is nothing to fall out of date.

**Fossil policy.** The numbered corpus (Papers I–XXIV) is frozen internal working notes. Where a live paper supersedes a fossil result, the fossil row is **deleted without annotation** — not corrected, not flagged, not cross-referenced. Fossil papers are untouched on disk; they are simply absent from this registry.

**Rigour tags**: `R` Rigorous · `D` Derived · `M` Motivated · `G` Gap. Conditionality travels **inside** a row (`[D | H1, H2]`), never as a cross-paper edge.

**Format**: three columns — `What is derived` | `Site` | `Rigour`.

**Owner**: Dhiren J. Master (PI). Only the PI banks edits.

---

## Paper M1 — Four axioms and their minimal geometry (`Paper_M1_Four_Axioms_v1.tex`)

**FIRST IN PUBLICATION PRECEDENCE** (banked 7 Nov 2026 by PI sign-off; the base paper of the new series. The ordinals previously assigned to Papers 3, 5, U, 4, 1, 2 each move down by one; the island rule is unchanged: M1 cites no MEF paper and reproduces every internal argument in-document). 16 pp.; XeLaTeX three-pass clean; five Lean 4.15.0 certificates (core toolchain, zero `sorry`, no author axioms; 45 theorems; compiled on two independent toolchains) reproduced in Appendix A.

**Axioms and readings (in-document).** A1 closure (compact factors, π₁(M) ≠ 0); A2 growth and decay (geometric warp, exponential law, sign-exchanging involution); A3 order (non-commutative fibre algebra of composed operations; Definitions 2.6 — spinor and tangent level — and 2.7 — orbits realised as base factors); A4 drive (fixed-point-free, positive entropy, periodic points of measure zero, on T × F). Minimality: lexicographic — parametric, dynamical (least entropy), arithmetic ({2,3} on listed integers), dimensional (least dimension, then least |π₁(Σ)|). Overall scale: declared input.

| What is derived | Site | Rigour |
|---|---|---|
| A4 ⇔ hyperbolic return map (\|tr\| > 2); trace 2 excluded | M1 Prop 4.1 | [R] (EXT Katok–Hasselblatt) · CERT `L1_trace3_min` |
| **Uniqueness of the trace-3 class — CANONICAL SITE.** Every trace-3 M ∈ SL(2,ℤ) is conjugate to ((2,1),(1,1)); two routes | M1 Thm 4.2 | [R] (EXT Latimer–MacDuffee, Taussky; Gauss) · CERT `L1_reduced_disc5`, `L1_cycle_disc5`, `L1_conj_M0_inv` |
| Odd trace ⇔ order 3 mod 2 ⇔ corner 3-cycle; M₀ fixes P₁, cycles P₂P₃P₄ | M1 Prop 4.3 | [R] · CERT `L1_odd_trace_iff_order_three`, `L1_M0_mod2_order3` |
| Division property from A1 (compact corner unit groups ⇒ norm positive-definite); 𝒜 = ℍ by Frobenius | M1 Lem 5.1, Prop 5.2 | [D \| A1, A2, A3; EXT Frobenius] · CERT `L2_hamilton`, `L2_norm_posdef` |
| Four corners = Q₈/{±1} = inner automorphism group V ≅ ℤ₂×ℤ₂ | M1 Prop 5.3 | [R] · CERT `L2_corner_count` |
| Commutative fixed subalgebras of V×⟨ι⟩ are exactly ℝ, ℂᵢ, ℂⱼ, ℂₖ | M1 Prop 5.4 | [R] · CERT `L2_fix_*`, `L2_iperp_not_closed` |
| Fibre is T² with inversion and linear drive (Franks; 2ⁿ = 4) | M1 Prop 5.5 | [D \| A2–A4, dimensional tier; EXT Franks 1970] · CERT `L2_two_torsion` |
| Corner algebras by stabiliser under ⟨ι, M₀⟩ (A4 closes the Dictionary link); Ad_w cycles i→j→k | M1 Prop 5.6 | [D \| A2, A3, A4] · CERT `L2_Ad_w_cycles`, `L2_w_cubed` |
| Pillowcase: unique Euclidean (2,2,2,2) orbifold; χ_orb = 0; χ = 2 by two routes | M1 Thm 5.7 | [R] (EXT Thurston; Satake/Kawasaki) · CERT `L2_chi_orb_zero`, `L2_chi_pillowcase` |
| Dimension: 4 ∣ D; F of quaternionic dim ≥ 2 ⇒ D ≥ 12; 4–11 fail; 12 least | M1 Thm 6.1 | [D \| Def. 2.6; EXT Salamon] · CERT `L3_*` |
| Split (3,6) unique given dim F ≥ 8; (7,2) recorded excluded | M1 Rem 6.2 | [R] · CERT `L3_split_three_six`, `L3_seven_two_meets_congruences` |
| S² = Sp(1)/U(1), sphere of imaginary units, base factor | M1 Prop 7.1 | [D \| Def. 2.7] · CERT `L4_unit_sphere_axes` |
| ℂP² = SU(3)/U(2), complex directions of the three units; χ = 3; c₁ = 3h | M1 Prop 7.2 | [D \| Def. 2.7, WP4] · CERT `L4_chern_CP2`, `L4_chi_counts` |
| Spin^c necessary (w₂(ℂP²) = h); L odd; minimal lift; canonical L = 𝒪(3), twisting line excluded by criterion (1) | M1 Prop 7.3 | [D \| Def. 2.6; EXT Lawson–Michelsohn] · CERT `L4_not_spin_and_congruence`, `L4_odd_lines` |
| Corner lift (−1)^{mn}, product −1 (Atiyah–Bott) | M1 Cor 7.4 | [R] · CERT `L4_four_corner_product` |
| Σ = S³ (T×Σ = ℍ^×; least \|π₁\|) | M1 Prop 7.5 | [D] |
| χ(K₈) = 3·2·2 = 12 (Künneth) | M1 Thm 7.6 | [R] · CERT `L3_chi_K8` |
| **Minimality theorem** | M1 Thm 8.1 | [D] assembly; readings and scale sector displayed |
| Scale eliminated to Q_w²(18u+1) = Q_c²u²(6u+1); (3,6) ⇒ 6u³+u²−72u−4 = 0; no dimensionless modulus; scale a Hessian saddle (declared sector) | M1 Prop 8.2 | [D]/[R] · CERT `L5_ratio`, `L5_cubic` |
| Witten 1981 recovered as corollary (cross-check only) | M1 §8.4 | [R] (EXT) |


**Register corrections carried by this banking:** entry 7 (Paper 3 `thm:dim-12` leg (i) reworded below); entry 9 ({2,3} signature scoped below); entry 10 (corner labelling convention: P₁=C₀, P₃=Cᵢ, P₂=Cⱼ, P₄=Cₖ; P₂/P₃ orientation conventional); entry 11 (Pillowcase Dictionary §2.3 superseded by M1 Prop 5.6). **Held:** entry 8 (N_gen index, Paper XI v3 vs v5) — PI decision pending.

---

## Paper 3 — The Zwegers shadow as $U(1)$-projected intrinsic torsion on twelve-manifolds (`Paper3_Zwegers_Shadow_U1_Torsion_v2.tex`)

**Published: J. Geom. Phys. FIRST IN PUBLICATION PRECEDENCE.** Sixty formal statements. Rigour grades are the paper's own accounting (§9.1 `sec:ledger`), inventory-mode. The eleven former island notes (R5, R6, R8–R10, C1–C6, Ca) are **absorbed here**: they were preparatory reproductions of results the published paper carries.

**Declared hypothesis.** Hypothesis S (`hyp:S` §5.5): the $\sigma$-odd equivariant geometry admits zero free continuous parameters — the Fréchet space of $\tauinv$-equivariant real exact forms on the base acts trivially on the $\sigma$-odd pointwise comparison data. **Consumed only by `thm:exact-seq` and `prop:injectivity`; nothing else in the paper uses it.**

**Declared inputs.** The $\Spinc$ charge assignment $q \in \{-1,-1,+2\}$ with bulk-mass map $c = \tfrac12 - q/12$ — entering **only** placement clauses (a) and (b) of `thm:c1-localisation`; the load-bearing displacement clause (c) is independent of it. The index-sector geometric identification (§6.3).

| What is derived | Site | Rigour |
|---|---|---|
| **Tangent Chern class of $\CPtwo$**: $c_2(T\CPtwo)$ integrates to $3$; the top Chern class is the Euler class, $\chi(\CPtwo) = \int c_2 = 3$ | `lem:c1-tangent-chern` §2.2 | **[R]** |
| **The determinant line is $\Oline{3}$ — CANONICAL SITE.** $L = K_{\CPtwo}^{-1} = \Oline{3}$, $c_1(L) = 3h$, by the Euler sequence on $\CPtwo$. Smallest case worked by hand | `prop:c1-detline-three` §2.2 | **[R]** |
| **★ LEAD THEOREM — Shadow–torsion correspondence.** For a closed almost-quaternionic $\Spinc$ orbifold of real dimension $4n \geq 12$ with $c_1(L) \neq 0$, compatible involution $\sigma$, and non-zero $U(1)$-projected intrinsic torsion $T_{U(1)}$: the Zwegers shadow of the associated mock modular object **is** the $U(1)$-projection of the intrinsic torsion, via the Swann hyperkähler bundle | `thm:swann-torsion-shadow` §3.2 | **[R]** |
| **Kernel characterisation.** $[T_{U(1)}] = 0 \iff \xi[T_{U(1)}] = 0$: the kernel of the shadow extraction corresponds exactly to strict quaternion-Kähler structures at the $U(1)$-projected level | `cor:kernel` §3.2 | **[R]** (unconditional) |
| **Oddness is forced; oddness has a minimal conductor** — the character the geometry supplies must be odd, and the minimal conductor is bounded below | `lem:c2-oddness`, `lem:c2-minimal` §4.2 | **[R]** |
| **The Serre–Stark obstruction at level four**: $\dim_\C S_{3/2}(\Gamma_0(4)) = 0$ — **the naive codomain is empty** | `prop:c2-empty` §4.2 | **[R]** |
| **The unique odd character and the level lift to $\Gamma_0(36)$**: the unique odd primitive Dirichlet character of the required conductor forces the level up from $4$ to $36$ | `prop:c2-level36` §4.3 | **[R]** |
| **The spectral push-forward functor $\Fun$** (definition); weight, level, and cusp structure of its target; weight $3/2 = c_1(L)/2$ fixed by the determinant degree | `def:functor`, `prop:weight-matching` §5.1 | **[R]** |
| **The stage-wise canonical family is not pullback-compatible**; **anchored uniqueness of the uniform family**: $L_n = \Ocal(c_n)$ is pullback-compatible only for the uniform degree-three family | `lem:c1-canonical-fails`, `prop:c1-uniform-three` §5.2 | **[R]** |
| **The hyperfinite completion.** Finite-stage algebras $\Afact_n = \operatorname{End}_\R(\Hquat^{\otimes n}) \cong M_{4^n}(\R)$ with transition maps $A \mapsto A \otimes I_4$; the weak closure is the hyperfinite Type II$_1$ factor | `thm:c3-completion` §5.3 | **[R]** |
| **The transpose anti-involution $\tauinv$**: existence and tower-coherence; **classification** — period-two $*$-anti-automorphisms of the hyperfinite II$_1$ factor form a single conjugacy class (Connes; Størmer) and $\tauinv$ belongs to it; $\tauinv^2 = \mathrm{id}$; no projective phase accumulates through the tower; outerness; the fixed algebra identified | `prop:c3-tau-exists`, `prop:c3-classification` §5.4 | **[R]** |
| **$\tauinv$-equivariance of the functor** — an exact structural symmetry on both sides of the correspondence; fixes the real subspace on the geometric domain, descends on the analytic codomain. **Unconditional** | `prop:tau-equivariance` §5.5 | **[R]** |
| **Exact-sequence compatibility.** The triple $(M, M, \Fun)$ induces a commutative diagram of short exact sequences: strict-QK $\hookrightarrow$ almost-QK $\to$ $\Wfour$ torsion classes, matched to the Bruinier–Funke sequence | `thm:exact-seq` §5.5 | **[D \| hyp:S]** |
| **Injectivity on torsion classes.** $\Fun$ is injective: distinct $U(1)$-equivariant $\Wfour$ classes map to distinct weight-$3/2$ cusp forms, at full section level. **The cohomology-level statement is unconditional** | `prop:injectivity` §5.5 | **[D \| hyp:S]**; cohomology level **[R]** |
| Fixed locus of the induced parameter involution $s \mapsto 1 - \bar s$ | `lem:c3-fixed-locus` §5.6 | **[R]** |
| **$\Spinc$ involution lift at the four corners — CANONICAL SITE.** For $L$ with $c_1(L) = 3h$ in the symmetric gauge, the lift $\stildec$ of $\sigma(x,y) = (-x,-y)$ acts at the fixed corner $C_{m,n} = (m/2, n/2)$ with the phase $(-1)^{mn}$ (degree-$3$ case) | `lem:spinc-involution-lift` §6.1 | **[R]** |
| **The corner-phase product — CANONICAL SITE.** For the degree-3 determinant line: $\chi_3(0,0) = \chi_3(1,0) = \chi_3(0,1) = +1$, $\chi_3(1,1) = -1$; **the product over the four corners is $-1$** (Atiyah–Bott-consistent). Degree dependence of the product given for every integer degree $d$ | `prop:product`, `prop:degree` §6.2 | **[R]** |
| **Signature-independence of $\stilde^2 = -1$** — the anticommutation is the source, not a Clifford-square convention | `lem:signature` §6.3 | **[R]** |
| **Sector-restricted chirality identification — CANONICAL SITE.** On the index-contributing sector, $\stildec(m,n) = \gamma_5 \cdot \chi(m,n)$ with $\chi(m,n) = -i(-1)^{mn}$ | `prop:identification`, `thm:sector-chirality` §6.3 | **[R]** |
| **Odd-square residue; no integer exponent; absence of the $q^1$ mode — CANONICAL SITE.** The corner-link spectrum is fractional: the integer exponent $1$ is attained by no mode, so the $q^1$ Fourier coefficient of $\tilde F_{\mathrm{corner}}$ **vanishes by spectral incidence** | `lem:odd-sq`, `prop:no-integer-exponent`, `cor:q1-absent` §6.4 | **[R]** |
| **$\chi(\Ttwo/\Ztwo) = 2$ — THE CANONICAL AND SOLE DERIVATION SITE.** Two independent routes: **(i) quotient formula** $\chi(X/\sigma) = \tfrac12(\chi(X) + \chi(F))$ with $\chi(\Ttwo) = 0$ and $F$ = four 2-torsion points, giving $\tfrac12(0+4) = 2$; **(ii) orbifold Gauss–Bonnet** — each corner is a cone point of angle $\pi$, deficit $\pi$; $2\pi\chi = 0 + 4\pi$. One route combinatorial-topological, one metric | **`lem:c4-pillowcase` §7.1**; `eq:c4-chi-two`, `eq:c4-gauss-bonnet` | **[R]** |
| **$\chi(\Keight) = 12$ — THE CANONICAL AND SOLE DERIVATION SITE.** Künneth over the warped product (warping is a metric datum only; the homotopy type is the direct product): $\chi(\Keight) = \chi(\CPtwo)\chi(\Stwo)\chi(\Ttwo/\Ztwo) = 3 \cdot 2 \cdot 2 = 12$. **Also $= 1 + 3 + 8 = \dim_\R\Mtwelve$.** $\chi(\CPtwo) = 3$ cross-checks against $\int c_2(T\CPtwo)$ of `lem:c1-tangent-chern` | **`prop:c4-twelve` §7.1**; `eq:c4-product`, `eq:c4-twelve` | **[R]** |
| **Dimension-twelve simultaneity — CANONICAL SITE.** At real dimension twelve three thresholds hold together: (i) the Clifford periodicity factorisation $\mathrm{Cl}_{0,12} \cong \mathrm{Cl}_{0,4} \otimes \mathrm{Cl}_{0,8} \cong \Hquat(32)$ — **reworded 7 Nov 2026 (Register 7): a statement about the residue class 4 of the ABS periodicity, not the only quaternionic class ($\mathrm{Cl}_{0,10} \cong \Hquat(16)$ is also quaternionic-matrix)**; (ii) the Euler–dimension identity $\chi(\Keight) = 12 = \dim_\R\Mtwelve$; (iii) $4n \geq 12$ is Swann's threshold for the four-component decomposition of almost-quaternionic intrinsic torsion. **It is leg (iii), not leg (i), that pins twelve from below** (sentence to be added to Paper 3 §7.2; M1 Thm 6.1 derives twelve independently from A3 on the internal factor) | **`thm:dim-12` §7.2** | **[R]** for (i) as reworded and (iii); **[D]** for the simultaneity claim |
| **The flat holonomy is quantised, and is $\pi$ — CANONICAL SITE.** The holonomy $z = e^{i\theta}$ of a $\sigma$-equivariant flat $U(1)$ Wilson line along the $\psi$-cycle satisfies $z^2 = 1$, so $\theta \in \{0,\pi\}$; for $L = \Oline{3}$ the realised value is the non-trivial one, $\theta = \pi$ | `lem:c1-holonomy` §7.3 | **[R]** |
| **Charge-dependent localisation — CANONICAL SITE.** For zero modes on $\Ttwo/\Ztwo$: (a) $Y = +\tfrac23$ modes localise at $P_1, P_2, P_3$; (b) $Y = -\tfrac13$ modes are forced to the $\psi$-shifted points $P_2, P_1, P_4$, each displaced by $L_\psi/2$; **(c) the displacement is uniquely forced** — since $\Delta Y = 1$ the relative twist is the exact sign $-1$, making the two hypercharge sectors' sites mutually exclusive across the $\psi$-axis. **Clause (c) is independent of the declared charge assignment; (a) and (b) consume it** | `thm:c1-localisation` §7.3 | **[R]** for (c); **[D \| declared charges]** for (a), (b) |
| **The order-six phase structure on $\Spinc$ sections.** The centre $\Z_3$ of $\mathrm{SU}(3)$ acts on $\Spinc$ sections of $\CPtwo$ in the $\bar{\mathbf 3}$ with composite phase $e^{i\pi/3}$ per centre element, generating a cyclic phase group of **order exactly six**, $\mu_6 \cong \mu_2 \times \mu_3$ | `prop:c1-z6` §7.3 | **[R]** |
| **★ Two anchorings of the integer three (numerical rigidity) — CANONICAL SITE.** The integer coefficient of the smooth part of the $U(1)$-projected torsion $\mathrm{T}_{U(1)}$ and the integer coefficient of the non-holomorphic completion $E_2^* = E_2 - 3/(\pi\tau_2)$ **are each equal to 3, and the two anchorings are independent**: the first is $c_1$ of the anticanonical bundle of $\CPtwo$ (Euler sequence, `prop:c1-detline-three`), anchored observationally by the charge lattice; the second is the universal constant of the weight-2 modular completion (transformation law of $E_2$). **No adjustable parameter intervenes on either side** | **`thm:rigidity` §7.4** | **[R]** |
| The functor reads the interior three | `prop:rigidity-functor` §7.4 | **[R]** |
| **Lowest $\Spinc$ Dirac eigenvalue $= \pi$ — THE CANONICAL AND SOLE DERIVATION SITE.** On $(\Ttwo, \tau = i\tau_2)$ with $L = \Oline{3}$, the lowest eigenvalue of the $\Spinc$ Dirac operator equals $\pi$, **independently of $\tau_2 > 0$** — a zero-parameter rigidity witness | **`prop:lambda-pi` §7.5**; with `lem:torus-spectrum`, `lem:nmode` | **[R]** |
| **Fixed-point vanishing — THE CANONICAL AND SOLE DERIVATION SITE.** For the involution $(x,y) \mapsto (-x,-y)$ with fixed set $\{P_1,\dots,P_4\}$, every continuous $\sigma$-odd section $\Psi$ **vanishes at every fixed point**: $\Psi(P_\alpha) = 0$. With pointwise inaccessibility (`cor:pairing`) and the functor instance in full | **`lem:fpv` §8**; `cor:pairing` | **[R]** |
| **Constant configurations are critical, at every window.** Under the conformal coupling $g_\Phi = e^{2\zeta\Phi}g_0$ on the fixed-area slice, constants are critical points of the spectral-rigidity functional $\omega = \Delta_3(L)$ for **every** window $L$, degenerate blocks included. Supported by: freeness of the $\sigma$-action on momenta; exact degeneracy of $\sigma$-partners; the $\sigma$-parity selection identity; constancy of projected densities | **`prop:ca` §9.1**; `lem:ca-free`, `lem:ca-degen`, `lem:ca-select`, `lem:ca-const` | **[R]** |
| **The criticality equation (density-balance form).** On the fixed-area slice with simple spectrum in the window: $\Phi$ is critical iff $\sum_{k \in W} w_k \lambda_k \lvert\chi_k^\Phi(x)\rvert^2 = \mu\,e^{2\zeta\Phi(x)}$ for every $x$, with $w_k = \tfrac2L \hat D(x_k)\bar\rho(\lambda_k)$, $\hat D$ the unfolded staircase's deviation from optimal linear fit (Dyson–Mehta; envelope theorem), $\bar\rho$ the mean density, $\mu$ the area multiplier. Supported by conformal eigenvalue variation, kernel decoupling, normalisation independence | **`prop:el` §9.2**; `lem:el-bg`, `lem:el-kernel`, `lem:el-norm` | **[R]** |
| **Residual symmetry and symmetric criticality.** The translations with $\varepsilon_a = -1$ exchange the projected sector with its complement and are **not** symmetries of the pillowcase-projected problem; the residual translation symmetry is the single $\Ztwo$ generated by the unshifted half-period, acting by $\omega$-preserving isometries. By Palais' principle every critical point of $\omega\vert_{X^{\Ztwo}}$ is critical on $X$. Corner orbits under the surviving swap are two pairs; constants lie in $X^{\Ztwo}$ | **`thm:strat` §9.3**; `lem:strat-eps` | **[R]** (given Palais) |
| **Base-multiplicity replication and the assembly — CANONICAL SITE.** At the adiabatic point the spectrum blocks as $\lambda^2 = \lambda_b^2 + \lambda_f^2(\Phi)$; every fibre level's variation is replicated once per base state, with **bottom-tower dressing equal to 6**, while kernel decoupling excludes the index-type signed count (which vanishes on $\Keight$). On the base-ground sector the block structure holds **exactly through the warp**. The arithmetic assembly: $\mathbf{6 \times 2 = 12 = \chi(\Keight) = 3\cdot2\cdot2}$ | **`prop:asm` §9.4**; `lem:asm-diag`, `lem:warp-rescale`, `lem:warp-measure`; `eq:assembly` | **[R]** |
| **Hamilton identity locked to the corner topology.** $i^2 = j^2 = k^2 = ijk = -1$; **closure of the functor's target** — the torsion data are $\ImH$-valued and their products generate real scalars, so the minimal algebra closed under the operative product is the full fibre $\Hquat$ | `lem:c5-hamilton`, `cor:closure` §10 | **[R]** |
| **Corner separation and the sign of a full period — CANONICAL SITE.** (a) In the quotient metric any two distinct corners are at geodesic distance $\geq \tfrac12\min(L_\psi, L_\omega)$; adjacent pairs attain exactly $L_\psi/2$ or $L_\omega/2$; the diagonal pair $\tfrac12\sqrt{L_\psi^2 + L_\omega^2}$. **No corner-to-corner transit at zero geodesic cost exists.** (b) The half-period translation group lifts to the quaternion fibre as right-multiplication by $Q_8$; a full covering period (two half-period lifts) contributes fibre phase $u^2 = -1$ for a pure-imaginary unit $u$, **independently of the choice of unit and of its sign**; $n$ full periods contribute $(-1)^n$ | **`cor:transit` §10** | **[R]** |

**Open (Paper 3; recorded at `rem:asm` and adjacent to `thm:strat`; no statement of the paper consumes any of them).** The exactness of the stratification; per-stratum existence beyond the constant stratum; the distinctness of the six base-sector replicas; the identification of the counting object among the coincident fibre factors.

---

## Paper 5 — Arithmetic microstructure in Hawking spectra (`Paper5_Arithmetic_Microstructure_v3_BF.tex`)

**SECOND IN PUBLICATION PRECEDENCE** (after Paper 3). Nine formal statements. Cites Paper 3.

**Consumed from Paper 3 (no rows here — Paper 3 owns them):** the critical structure of the spectral-rigidity functional realising the homology of $\Keight$ (`prop:ca`, `prop:el`, `thm:strat`, `prop:asm`); **warp elimination** and **measure cancellation** on the ground sector (`lem:warp-rescale`, `lem:warp-measure`) — Paper 5 reproduces these in-document as `lem:rescale` and `lem:measure` under the island rule, but the canonical site is Paper 3.

| What is derived | Site | Rigour |
|---|---|---|
| **Betti sequence of $\Keight$ — CANONICAL SITE.** $(b_0,\dots,b_8) = (1, 0, 3, 0, 4, 0, 3, 0, 1)$. **Every odd Betti number vanishes**; the sequence is Poincaré-symmetric; and the signed and unsigned sums coincide, $\sum(-1)^i b_i = \sum b_i = 12 = \chi(\Keight)$ — so the Euler characteristic is realised as a *total* Betti count, not merely an alternating one | **`prop:betti` §2.2**; `eq:betti`, `eq:chi` | **[R]** |
| **★ Uniqueness of the stable configuration — CANONICAL SITE.** Given that the critical structure of $\omega$ on the configuration space realises the homology of $\Keight$ (Paper 3), the critical points are counted **exactly** by the Betti numbers, $c_i = b_i$; in particular the number of index-zero critical points is $c_0 = b_0 = 1$ — **the stable configuration is unique** | **`thm:count` §2.3** | **[D \| Paper 3 critical structure]** |
| **$\dodd$ odd-part identity, octave symmetry, protected values — CANONICAL SITE.** For every positive integer $n$, with $n_{\mathrm{odd}} = n/2^{v_2(n)}$ and $d(\cdot)$ the divisor count: **(1)** $\dodd(n) = d(n_{\mathrm{odd}})$; **(2) octave symmetry** $\dodd(2m) = \dodd(m)$ — the power of two in the KK level is invisible to the count; **(3)** $\dodd(n) = 1 \iff n = 2^a$; **(4)** $\dodd(n) = 2 \iff n_{\mathrm{odd}}$ prime | **`lem:dodd` §3**; `eq:dodd` | **[R]** |
| **Constant conduit factor.** At the emission locus the projected densities $\lvert\tilde\chi_n(\mathrm{locus})\rvert^2$ are **common across the tower** — no level is preferentially weighted by where it is read out | `lem:locus` §4 | **[R]** |
| **★ The pattern, warp-neutral — CANONICAL SITE.** For a horizon in the four-dimensional projection coupling to the ground-sector tower and emitting thermally with envelope $E$, the relative amplitudes are $\mathcal{A}(n)/\mathcal{A}(1) = \dodd(n)\,E(n)/E(1)$, **independent of the warp function and of the emission locus**. For a geometric envelope $E(n) = q^{n-1}$ at the intrinsic modulus, $q = e^{-2\pi\tau_2} = 8.4047\times10^{-6}$ at $\tau_2 = 1.86$ | **`prop:pattern` §4**; `eq:pattern` | **[D \| coupling hypothesis]**; warp-neutrality **[R]** |
| **Line-class contrasts — CANONICAL SITE.** Under the coupling hypothesis: lines whose label has **prime odd part carry exactly twice** the strength of power-of-two lines, and the $n = 9$ line **exactly three times** ($\dodd(9) = 3$). Against the local mean over $n = 1,\dots,12$ ($\bar d = 7/4$), the exact fractional depths are $-3/7$ (singlets), $+1/7$ (doublets), $+5/7$ (the triplet). The local mean grows logarithmically, **so the contrasts strengthen with $n$** | **`prop:depth` §5** | **[D \| coupling hypothesis]** |
| **Comb spacing — CANONICAL SITE.** Matching the envelope weight to Boltzmann form, $e^{-2\pi n\tau_{2,\mathrm{eff}}} = e^{-n\hbar\omega_0/k_B T_H}$, defines $\tau_{2,\mathrm{eff}} = \hbar\omega_0/(2\pi k_B T_H)$ and gives $\Delta\omega = \omega_0 = 2\pi\tau_{2,\mathrm{eff}} k_B T_H/\hbar = c_s/R_{\mathrm{eff}}$, the last equality for a sonic platform of sound speed $c_s$ and effective compact scale $R_{\mathrm{eff}}$ | **`prop:comb` §6**; `eq:comb` | **[D]** |
| **Platform windows — CANONICAL SITE.** The visibility thresholds translate to $R_{\mathrm{eff}} \geq \ell_\kappa/\tau_{2,\mathrm{eff}}^{\max}$: the **first doublet** ($\tau_{2,\mathrm{eff}} \leq 0.6$) requires $R_{\mathrm{eff}} \gtrsim 1.7\,\ell_\kappa$; the **$n = 9$ triplet** ($\tau_{2,\mathrm{eff}} \leq 0.159$ at threshold $10^{-3}$) requires $R_{\mathrm{eff}} \gtrsim 6.3\,\ell_\kappa$. Hydrodynamics bounds the gradient scale below by the healing length, so $R_{\mathrm{eff}} = \xi$ closes the window against platform capability | **`prop:window` §6** | **[D]** |
| **The prediction and its falsifier**: the arithmetic comb is present in the Hawking spectrum with $\dodd$-weighted line strengths, or it is not; the sensitivity is stated against published analogue-gravity capability | §7 `sec:prediction`, `sec:statement` | inventory |

---

## Paper U — Discriminant topology and the critical points of a spectral rigidity functional on conformal deformations of the pillowcase (`Paper_U_Discriminant_topology_v4.tex`)

**THIRD IN PUBLICATION PRECEDENCE** (after Papers 3 and 5). Two Lean certificates (GD and O4 readout). ~45 formal statements.

**Consumed from earlier papers (no rows here).** The **Betti sequence** of $\Keight$, $(1,0,3,0,4,0,3,0,1)$ — Paper U reproduces it as `prop:betti`, but the canonical site is **Paper 5** `prop:betti`. The **critical count** $c_i = b_i$, $c_0 = 1$ — canonical at **Paper 5** `thm:count`; Paper U's `thm:B` establishes it under its own hypothesis set and adds the saddle decomposition (below), which *is* new.

**Declared hypotheses (the paper's conditionality, carried inside its rows).** **OW** (`rb2:ow`) window retention and detection; **TR** (`rb2:tr`) transgression compatibility; **HS** (`hyp:hs`) dependence of the higher strata; **PS** (`o2:ps`) Morse-theoretic admissibility; **UB** (`hyp:ub`) no excess critical points; **B** (`o1:break`) index cost of symmetry breaking; **U** (`o1:symuniq`) symmetric uniqueness at index zero. NDC and GD are **established at reduction level on the verified list** (`ndc:verdict`, `gd:verdict`), not assumed.

| What is derived | Site | Rigour |
|---|---|---|
| **The ambient spaces carry no topology — CANONICAL SITE.** $\bar X_B$ and every $X_{\mathrm{bad}}(\varepsilon)$ are **contractible**: the flow-with-renormalisation deformation retracts each onto the fibre-only slice through profiles of non-increasing base energy, and an affine contraction completes the retraction to a point. **Consequence: whatever topology the admissible region carries comes from the discriminant alone** | **`rb:ambient` §3**; with `rb:retraction`, `rb:heat`, `rb:quasi`, `rb:colimit` | **[R]** |
| **Strata of the assembled discriminant; out-of-window coincidences are invisible; parity selection; warp gating of the tower strata** — the stratification of the discriminant and the selection rules that reduce it | `rb1:strata`, `rb1:invisible`, `rb1:parity`, `rb1:gate` §4 | **[R]** |
| **Non-degeneracy of the channel gating (NDC) — CANONICAL SITE.** For each base tower the crossing loci of the lowest tower level with the harmonic block **exist over an interval** of base eigenvalues — the deformation tunes the fibre gap through the coincidence, so **no exact matching to a reference gap is required** — and the gating is non-degenerate at every such crossing among the lowest pairs. Established, not assumed | **`ndc:verdict` §4**; with `ndc:factor`, `ndc:base`, `ndc:fibre` | **[R]** at reduction level, on the verified list |
| **Gram non-degeneracy (GD) — CANONICAL SITE.** On the reference spectrum in the integer momentum model $K(m,j) = (100m, 93j)$, $j = 2n-3$: the fibre-sector components are carried by the **seven multiplicity-four levels among the ten lowest**, each with transfer support $\{(0,186j), (200m, 0)\}$, both channels non-antiparallel since $mj \neq 0$, and the seven supports **pairwise distinct** | **`gd:verdict` §5** | **[R]** at reduction level · **CERT** (GD certificate) |
| **The collapse: one class per sector — CANONICAL SITE.** Given GD and NDC at reduction level: within each sector **all in-window linking classes are rationally proportional** — the increment lattice of the sector has **rank at most one**, and any chain of adjacent exchanges identifies the classes up to sign | **`rb2:collapse` §5**; with `rb2:capping`, `rb2:sector` | **[D \| OW]** |
| **The ring discriminator — CANONICAL SITE.** $x^2 \neq 0$ and $x^3 = 0$, while $y^2 = 0$: the **truncated relation** of the $\CPtwo$ generator and the **exterior relation** of the $\Stwo$ generator are forced by the base intersection forms $H^*(\CPtwo;\Q) = \Q[a]/(a^3)$ and $H^*(\Stwo;\Q) = \Q[b]/(b^2)$. **The asymmetry between the two tower generators is a statement of base topology** | **`rb2:ring` §5** | **[D \| TR]** |
| **★ Stabilisation — CANONICAL SITE.** The rational homology of the truncations $X_{\mathrm{ad}}(\varepsilon)$ **stabilises at a finite $\varepsilon^*$**: for $\varepsilon' \geq \varepsilon \geq \varepsilon^*$ the inclusions induce isomorphisms | **`rb2:stab` §6** | **[D \| OW, HS]**; GD/NDC established |
| **★ THEOREM A — Generator-level topology of the admissible region.** There is a finite $\varepsilon^*$ such that for every $\varepsilon \geq \varepsilon^*$ the admissible region carries **the rational cohomology ring of $\Keight$** at generator level | **`thm:A` §1** | **[D \| OW, TR, HS]**; GD/NDC established at reduction level |
| **The six replicas are six — CANONICAL SITE.** The six response vectors are the six bidegrees $(0,0), (2,0), (0,2), (4,0), (2,2), (4,2)$, **pairwise distinct**; in particular the two pairs of equal total degree, $(2,0) \neq (0,2)$ and $(4,0) \neq (2,2)$, are **separated by the anisotropy of the family — which a single overall scaling cannot achieve** | **`o3:pairwise` §7.1**; with `o3:secondvar`, `o3:blocks`, `o3:scaling` | **[R]** |
| **★ The counting object is the fibre Euler characteristic — CANONICAL SITE.** Among the three candidate counting objects, the readout selects $N_\chi$ (the fibre Euler characteristic), **definitively refuting the corner-orbit count**. Established via the group-replacement family: equivariant $\Spinc$ classes, residual translations and their signs, the separation table, and the exclusivity of flattening to the pillowcase | **`o4r:verdict` §7.2**; with `o4:coincide`, `o4:family`, `o4:equivariance`, `o4:signs`, `o4:table`, `o4:flatten`, `o4r:structure` | **[D]** · **CERT** (O4 readout certificate) |
| **Retirement of the odd-degree family.** For $L = \Oline{2k+1}$ the conjugation sign of the shifted half-periods is $-1$ for **every** level index and every $k$ (since $2n' - (2k+1)$ is odd); the residual symmetry and the corner-orbit count are unchanged across the odd degrees, and $N_\chi$, $N_{\mathrm{stab}}$ trivially so | `o4:odd` §7.2 | **[R]** |
| **Existence at every index — CANONICAL SITE.** The critical counts satisfy $c_i \geq b_i(\Keight)$ for $i = 0,\dots,8$: **beyond the constant stratum, critical points exist with multiplicities at least $3, 4, 3, 1$ at indices $2, 4, 6, 8$ — at least eleven non-constant critical points** | **`o2:exist` §7.3** | **[D \| thm:A, PS]** |
| **★ THEOREM B — the saddle decomposition.** In addition to the count $c_i = b_i$ (canonical at Paper 5): the remaining critical structure consists of **$3 + 4 + 3 + 1$ saddles of even index $2, 4, 6, 8$** | **`thm:B` §1** | **[D \| thm:A, PS, UB]** |
| **★ THEOREM C — uniqueness by the independent local route.** $c_0 = 1$ under the two **local** hypotheses B and U alone, **with no input from Theorem A** and no claim at higher index. A genuinely independent second route to the uniqueness of the stable configuration | **`thm:C` §8** | **[D \| B, U]** |
| **Main corollary.** Under **either** displayed hypothesis set, $\omega$ admits **exactly one critical point of index zero** | `cor:main` §1 | **[D]** — two independent routes |

---

## Paper 4 — The Bruinier–Funke operator as a Tate differential on the pillowcase orbifold (`P4_paper_v3.tex`)

**FOURTH IN PUBLICATION PRECEDENCE** (after Papers 3, 5, U). Ramanujan Journal track. 39 pp.; Lean 4.15.0, zero `sorry`, zero axioms, eight certificates. Twenty-two formal statements. **Rebuilt from source (v18).**

**Consumed from earlier papers (no rows here; reproduced in-document under the island rule).** The **$\Spinc$ corner lift** and the **four-corner phase product** $= -1$ — canonical at **Paper 3** (`lem:spinc-involution-lift`, `prop:product`); Paper 4 §8 reproduces them with $c_1(L) = 3$ as a stated datum. The **$\dodd$ rules** other than perfect-square parity — canonical at **Paper 5** `lem:dodd`; Paper 4 `prop:rules` reproduces them and **adds** the parity rule (below), which is Paper 4's own.

**Declared hypothesis.** `hyp:lift` (§3): the harmonic Maass form $\hat z = f + g^*$ carries a linear involution $\sigma^*$ under which $f$ is valued in the trivial orientation sector (trivial character) and $g^*$ in $\Lsigma$ (sign character).

| What is derived | Site | Rigour |
|---|---|---|
| **Setting.** Pillowcase as $S^2$ with four cone points of deficit $\pi$; Bruinier–Funke exact sequence $0 \to \Mk \to \Hk \xrightarrow{\xik} \Sk \to 0$; Zwegers completion and period map $\Ical$; **Tate cohomology of $\Ztwo$** ($D = 1-\sigma$, $N = 1+\sigma$, $DN = ND = 0$); flat local systems | §2 `sec:setting`; `eq:bfsequence`, `eq:tatecomplex` | **[R]** (EXT: Bruinier–Funke 2004; Zwegers 2002; Brown 1982) · CERT `Sec3_Z2_Involution.lean` |
| **★ Mock Eigenspace Theorem — CANONICAL SITE.** The mock modular decomposition **is** the $\Ztwo$ eigenspace decomposition under $\sigma^*$: $f = P^+(\hat z)$ and $g^* = P^-(\hat z)$ | **`thm:eigenspace` §3** | **[D \| hyp:lift]** |
| **Independent consistency route (Appell–Lerch).** The anomaly prefactor is **strictly $\sigma$-odd**, $\sigma^*(y - y^{-1}) = -(y - y^{-1})$, and **vanishes identically on the fixed locus** ($y = \pm1$ at the half-periods); the level-2 shadow is the unary theta with character $(-1)^n$ | `prop:appell` §3; `eq:prefactor`, `eq:unarytheta` | **[R]** |
| **★★ LEAD THEOREM — Bruinier–Funke $=$ Tate differential. THE CANONICAL AND SOLE SITE.** The BF shadow operator $\xik: \Hk \to \Sk$ is the **exact analytic realisation of the Tate cohomology differential** $D = 1 - \sigma^*$: $\xik = \Ical^{-1} \circ \tfrac12 D$, with $\Ical$ the Zwegers period map. $D(\hat z) = 2g^*$; $\ker\xik = \ker D = \Mk$ | **`thm:bftate` §4**; `eq:xikformula` | **[D \| hyp:lift]** |
| **Geometric origin of the nilpotency — CANONICAL SITE.** The nilpotency of the BF sequence, $\xi_{2-k}\circ\xik = 0$, **descends from the discrete identity $D \circ N = 0$** of the Tate complex | **`cor:nilpotent` §4** | **[D]** · CERT `P4_R2_nilpotency.lean` (`DN_zero`, `ND_zero`, unconditional) |
| **Naturality.** The identification is a natural isomorphism of **Hecke modules, uniform in weight and level**: weight variation reproduces the BF intertwining $\xi_{k+2}R_k = -L_{2-k}\xik$; Hecke equivariance ($[T_n, D] = 0$); level uniformity ($[-1]$ preserves $C_N$ for all $N$) | `rem:naturality` §4 | **[D]** |
| **★ Twisted de Rham $=$ shadow sector — THE CANONICAL AND SOLE SITE.** The BF exact sequence **is** the decomposition of the de Rham cohomology of the pillowcase into untwisted and twisted sectors: $H^*(\Ttwo/\Ztwo, \C)$ computes the holomorphic part $f$; $H^*(\Ttwo/\Ztwo, \Lsigma)$ computes the shadow $g$. Anti-invariant dimensions $(0,2,0)$; invariant $(1,0,1)$ | **`thm:twisted` §5** | **[D]** (EXT terminus: Kawasaki 1979) · CERT `P4_R3_antiinvariant.lean` (Kawasaki named in header, **never a Lean axiom**) |
| **★ Arithmetic Projector Theorem — THE CANONICAL AND SOLE SITE.** On the Dirichlet series of the Fourier spectrum, the **geometric $\Ztwo$ projection $P^+$ is exactly multiplication by the arithmetic multiplier $(1 - 2^{-s})$ on the $p = 2$ Euler factor**: $\sum \dodd(n) n^{-s} = (1-2^{-s})^{-1}\prod_{p>2}(1-p^{-s})^{-2} = (1-2^{-s})\zeta(s)^2$ | **`thm:projector` §6**; `eq:doddseries` | **[R]** · CERT `P4_R4_odd_divisor.lean` |
| **Multiplicativity as an involution invariant.** The arithmetic multiplicativity of $\dodd$ is an **invariant of $\sigma^2 = \mathrm{id}$**: because $P^+$ acts locally at $p = 2$ it commutes with all Euler factors for $p > 2$ | `cor:oddprimes` §6 | **[R]** |
| **$\dodd$ perfect-square parity — CANONICAL SITE.** $\dodd(n)$ is **odd if and only if $n_{\mathrm{odd}}$ is a perfect square**. *(The remaining $\dodd$ rules of `prop:rules` — orbifold projection, tensor factorisation, protected values — are canonical at **Paper 5** `lem:dodd`; Paper 4 reproduces them and derives them from the projector rather than elementarily.)* | **`prop:rules`(2) §6** | **[R]** · CERT `P4_R4_odd_divisor.lean` (`rule2_table` by `decide`) |
| **Kloosterman alternation — conditional characterisation. CANONICAL SITE.** Self-contained definition of the **level-2 multiplier-weighted generalised** sum $K_2$ (Rademacher–Zuckerman normalisation); at $c = 2$ the sum is a **single term**, $K_2(n,-1;2) = \bar\nu(\gamma_{1,2})(-1)^{n-1}$; hence $K_2(n,-1;2) = (-1)^n$ for all $n$ **iff** $\bar\nu(\gamma_{1,2}) = -1$. The classical (unweighted) sum gives $-(-1)^n$ — **the two objects differ by a sign at every $n$**. $\bar\nu(\gamma_{1,2})$ is **deliberately not evaluated**. *(The unconditional identity is a different theorem, canonical at Paper XXI §7.)* | **`def:K2`, `lem:K2c2`, `prop:alternation`, `rem:multiplier` §6** | **[R]** (the characterisation; conditional in form) · CERT `P4_R4_odd_divisor.lean` (Part C) |
| **Möbius sector structure and the level $\Gamma_0(4)$ — CANONICAL SITE.** $H^1(\Ttwo/\Ztwo, \Ztwo) \cong \Ztwo\times\Ztwo$: **one trivial (cylinder, untwisted) $+$ three non-trivial (Möbius, twisted)** bundles; the $3+1$ structure **mandates $\Gamma_0(4)$** (three cusps $0, \tfrac12, i\infty$) | **`thm:mobius` §7**; `eq:H1classification` | **[D]** · CERT `P4_R5_H1.lean` (`three_nontrivial`, `exponent_two`) |
| **Chiral telescoping — CANONICAL SITE.** Link spectrum $\mu_m^+ = m + \tfrac32$, $\mu_m^- = -m + \tfrac12$ (EXT: Friedrich; Mumford; normalisation cited to **Paper 3**). The squared pairing $(\mu_m^+)^2 = (\mu_{m+2}^-)^2$ is **proved for all $m$**; the surviving object is the **doublet** at $\mu = \pm\tfrac12$; $F_{\mathrm{cone}} \propto -2e^{-t/4}$ per corner; corner sum bracket $= 2$, total $\propto -4e^{-t/4}\cdot\mathrm{Ind}$ | **`lem:telescoping` §8**; `eq:cornersum`, `rem:holonomyprefactor` | **[R]** · CERT `P4_R6_microstate.lean` (`squared_pairing` general; `telescoping_list`; `bracket_two`; `corner_total`) |
| **Bruinier–Funke anomaly from the surviving doublet — CANONICAL SITE.** $\partial_{\bar\tau}\hat z = \partial_{\bar\tau}g^* \propto -e^{-y/4}/y^{3/2} = g(\tau)/\sqrt y$, with $g$ the weight-$\tfrac32$ unary theta; the period integral is $\Gamma(-\tfrac12, y/4)$ | **`thm:bfanomaly` §8**; `eq:bfanomaly`, `eq:eichlerintegral` | **[R]** |
| **★ Spectral origin of the shadow — CANONICAL SITE.** The Zwegers completion is **not imposed as an analytic device**: it is **forced** by the composition of (i) the $\Spinc$ $\sigma$-holonomy at the four cone tips, (ii) the spectral asymmetry, (iii) telescoping, (iv) corner summation, (v) the period integral, and (vi) differentiation of the improper integral. **Deflationary reading stated in-document** | **`thm:microstate` §8** | **[D]** |
| **Hyperbolic monodromy — CANONICAL SITE.** $M = \begin{pmatrix}2&1\\1&1\end{pmatrix}$ (Arnold cat map; minimal-trace hyperbolic) **commutes with $\sigma$ and descends** to the pillowcase; **fixes $P_1$ and 3-cycles $P_2 \to P_3 \to P_4 \to P_2$** (all four half-lattice evaluations by hand) | **`prop:commute`, `thm:threecycle` §9** | **[R]** · CERT `P4_R7_sol.lean` (`three_cycle`) |
| **The golden fixed points.** $\varphi = (1+\sqrt5)/2$ and $\bar\varphi$ are the **unique** fixed points of the Möbius transformation induced by $M$ on $\R \cup \{\infty\}$ (characteristic equation $\tau^2 - \tau - 1 = 0$; multiplier $\varphi^4$) | **`prop:golden` §9** | **[R]** · CERT `P4_R7_sol.lean` (golden algebra in $\Z[\sqrt5]$, denominators cleared; eigenvalue check $\varphi^{\pm2}$) |
| **Order three mod 2 — CANONICAL SITE.** $\bar M = M \bmod 2$ has **exact order 3** in $\mathrm{GL}(2,\mathbb{F}_2) \cong S_3$, generating the unique $\Z/3\Z$ permuting the three non-trivial elements of $\mathbb{F}_2^2$ | **`thm:orderthree` §9** | **[R]** · CERT `P4_R7_sol.lean` (`order_three`; `action_is_T` — the mod-2 matrix action **equals** the bundle-lattice map of `P4_R5_H1.lean`) |
| **Automorphism of the bundle lattice.** $\mathrm{GL}(2,\mathbb{F}_2) \cong S_3$ is **simultaneously** $\operatorname{Aut}(\Ztwo\times\Ztwo)$ of the flat-line-bundle classification; $M$ acts on the bundle lattice through the order-3 automorphism | `cor:autbundle` §9 | **[D]** |
| **★ Galois–orbifold correspondence — CANONICAL SITE.** $\mathbb{K} = \Q(\sqrt5,\sqrt6)$ is degree-4 Galois with $\operatorname{Gal}(\mathbb{K}/\Q) \cong \Ztwo\times\Ztwo$ (`prop:galois`, **[R]**); **this group is isomorphic to $H^1(\Ttwo/\Ztwo,\Ztwo)$**, and under the isomorphism the three intermediate quadratic fields $\Q(\sqrt5), \Q(\sqrt6), \Q(\sqrt{30})$ correspond to the three non-trivial bundle classes, with $M$ acting as the order-3 automorphism permuting them. **Equivariant identification unique up to $\operatorname{Aut}(\Z/3\Z) \cong \Z/2\Z$** (the two 3-cycle orientations). **The $\sqrt5$ arises internally** as the fixed-point field of $M$ | **`prop:galois`, `thm:galoisorbifold` §10**; `eq:correspondence` | **[D]** (`prop:galois` **[R]**) · CERT `P4_R8_galois.lean` (**`equivariance_pinning`** — exactly 3 automorphisms centralise $T$, exactly 3 intertwine $T$ with $T^{-1}$; the two classes partition $\operatorname{Aut}(V_4)$) |
| **The open identification (gap, stated in-document).** Which $P_j$ corresponds to which $\Q(\sqrt{\cdot})$ is **not determined by the group theory alone**. The holonomy phases of §8 separate $P_4$ from $P_2, P_3$ but **do not separate $P_2$ from $P_3$**. **Equivariance observation**: the residual freedom is $\operatorname{Aut}(\Z/3\Z)$, so **any $M$-equivariant invariant is blind to it however finely it resolves the corners** — the datum required must **break the equivariance, not refine the resolution**; it must **orient the 3-cycle**. Not supplied. **No impossibility claim is made** | **`rem:gap` §10** | **[G]** — visible, quantified |

**Bibliography**: the Paper 3 venue field is **TODO-PI**.


## Paper 1 — Geometric origin of quark mass hierarchies and CKM mixing (`Paper1_CKM_v0.tex`)

**FIFTH IN PUBLICATION PRECEDENCE** (after Papers 3, 5, U, 4). EPJC track. 27 pp.; XeLaTeX three-pass clean; six Lean 4.15.0 certificates (core toolchain, zero `sorry`, zero axioms) reproduced in Appendix A. Eighteen formal statements.

**Consumed from Paper 3 (no rows here — Paper 3 owns them; reproduced in-document under the island rule).** The **quantised flat holonomy** on the $\psi$-cycle, $\theta = \pi$ (Paper 1 `lem:holonomy` = Paper 3 `lem:c1-holonomy`); the **charge-dependent localisation theorem** with its three clauses and the $\Delta Y = 1$ displacement argument (Paper 1 `thm:displacement` = Paper 3 `thm:c1-localisation`); the **$\Spinc$ involution lift** at the corners (Paper 3 `lem:spinc-involution-lift` — Paper 3 does **not** state $\phi_\omega = \pi/2$; that value is Paper 1's, below); the **order-six phase structure** on $\Spinc$ sections (Paper 3 `prop:c1-z6` — Paper 3 does **not** state the quantum $W_{\mathrm{fibre}}$; that is Paper 1's, below).

**Declared input.** The $\Spinc$ charge assignment $(-1,-1,+2)$ (`ax:charges` §2.3), as the weight decomposition $\bar{\mathbf 3} \to \mathbf 2_{-1} \oplus \mathbf 1_{+2}$ of $H^{0,2}(\CP^2, \Oline{-4})$ under residual $U(2)$; charge gap $= 3 = \deg L$.

| What is derived | Site | Rigour |
|---|---|---|
| **Bulk-mass normalisation — CANONICAL SITE.** For a zero-mode sector of $\Spinc$ charge $q$: $c(q) = \tfrac12 - q/\chi(\K) = \tfrac12 - q/12$; values $(7/12, 7/12, 1/3)$; localisation gap $\tfrac14$. (Paper 3 **declares** this map as an input; Paper 1 derives it) | `lem:bulkmass` §3.2; `cor:cn-table`; `eq:cn` | **[D]**; Lean-certified |
| **No bare cosmological term — CANONICAL SITE.** The twelve-dimensional action admits **no bare $\Lambda_{12}$**: every coupling of the construction is fixed by a topological datum (Chern number, Euler characteristic, flux quantum), whereas a bare $\Lambda_{12}$ is a continuous parameter quantised by nothing — the zero-continuous-parameter property forbids it | `prop:nolambda` §4.1 | **[D]** |
| **Stationarity conditions of the moduli potential.** $-12R_w^2 - 2R_c^2 + Q_w^2 R_c^2/R_w^2 = 0$ and $-24R_c^2 + Q_c^2 - Q_w^2 R_c^4/R_w^4 = 0$ | `lem:vacuum` §4.2; `eq:vacA`, `eq:vacB` | **[D]** |
| **Closure of the vacuum equations — CANONICAL SITE.** At tree level the effective cosmological term **vanishes identically**; at one loop its only effect is a displacement $\lvert\delta\tau_2\rvert = O(10^{-5})$ of the stationary point. **The vacuum equations therefore close as written** — the one-loop modulus bound of the corpus | `prop:closure` §4.2 | **[D]** |
| **★ The flux-ratio constraint — CANONICAL SITE.** The stationarity conditions are equivalent to $Q_w^2 = 2ux(6u+1)$, $Q_c^2 u = 2x(18u+1)$, and eliminate the scale $x$ to the **single scale-free constraint** $u^2(6u+1)/(18u+1) = (Q_w/Q_c)^2$: **$\tau_2$ depends on the flux *ratio* alone**, not on either integer | **`thm:ratio` §4.3**; `eq:ratio-constraint` (boxed) | **[R]** — exact integer identity; Lean-certified |
| **Shape–scale split.** Truncated Hessian signature $(+,-)$; the negative direction is the overall-scale mode (the radion), lifted by the Goldberger–Wise sector, leaving the flux-locked shape intact. **At the stationary point $V_{\min} = M_{12}^4(24xy + 2x^2) > 0$ — strictly positive, fixing the de Sitter sign** | `rem:stability` §4.3 | **[D]** |
| **Parity of the flux quanta — CANONICAL SITE.** The flux quantum through any closed surface satisfies $Q_\Sigma \equiv \langle w_2, [\Sigma]\rangle \pmod 2$, since $c_1(L) \equiv w_2 \pmod 2$: **$Q_c$ odd on the non-spin $\CPtwo$, $Q_w$ even on the spin $\Stwo$** | `lem:parity` §4.4; `eq:parity` | **[R]** |
| **★ The stabilised aspect ratio $\tau_2 = 1.8466$ — THE CANONICAL AND SOLE DERIVATION SITE.** With $(Q_c, Q_w) = (3,6)$ the ratio constraint becomes the **integer cubic** $6u^3 + u^2 - 72u - 4 = 0$, whose unique positive root is $u^* = 3.409868$, giving $\tau_2 = 1.8466$, $\tau_2^2 = 3.4099$. **No continuous modulus survives the enumeration; zero empirical anchors.** $Q_w = 6 = N_{\mathrm{gen}}\cdot\chi(\Stwo)$ uniquely selected among the parity-admissible $\{2,4,6,8\}$ | **`thm:enumeration` §4.5**; `eq:cubic`, `eq:tau-value` (boxed); `eq:Qc`, `eq:Qw` | **[D]** — parity **[R]**, elimination **[R]** (Lean-certified); enumeration **[D]** |
| **The aspect-ratio identification (conventions).** $\tau_2 = R_w/R_c = L_\omega/L_\psi$ — the fibre radius ratio **and** the base half-period ratio are the same modulus | §2.1 (conventions, line 158) | **(definitional)** |
| **Universal coupling ratio — CANONICAL SITE.** Every common factor cancels, leaving the exact tree-level relation $\alpha_s/\alpha_w = g_s^2/g_w^2 = R_w^2/R_c^2 = \tau_2^2 = 3.410$ | `prop:ratio` §5.1; `eq:coupling-ratio` | **[D]** |
| **★ STRUCTURAL IDENTITY — CANONICAL SITE.** $\lambda_C = 1/(1+\tau_2^2) = \alpha_w/(\alpha_w + \alpha_s)$, **valid for every value of $\tau_2$**: a flavour-sector observable and a gauge-sector combination are two measurements of one geometric ratio. **A relation among three measured quantities containing no model parameter — the primary falsifier** | **`thm:structural` §5.3**; `eq:structural` (boxed) | **[D]** |
| **Scale of the identification.** Under SM one-loop flow ($b_2 = -19/6$, $b_3 = -7$) the ratio runs $3.488$ ($M_Z$) $\to 1.03$ ($10^{16}$ GeV), attaining the derived $\tau_2^2$ at $\mu_* \approx 112$ GeV. **The identity is an infrared statement**, holding where the electroweak vacuum forms, not at the compactification scale; heavy states in the desert displace $\mu_*$, so the identity doubles as a probe of the desert | §5.4; `eq:crossing` | **[D]** for the flow. The infrared anchoring is **recorded and quantified, not derived** — deflationary reading in-document |
| **Hierarchy quantum — CANONICAL SITE.** With the derived bulk masses, the warped overlaps normalised to the heavy–heavy element satisfy **exactly** $Y^{(\omega)}_{ij}/Y^{(\omega)}_{33} = e^{-\pi([i\neq3] + [j\neq3])}$: **each light index costs one factor $e^{-\pi} \approx 0.0432$** | `lem:hierarchy` §6.1; `eq:hierarchy-quantum` | **[D]** |
| Bottom/top Yukawa ratio $y_b/y_t = e^{-1.1372\pi}\cdot\sqrt3/2 = 0.0243$; diagonal factor $\sqrt{1+\tau_2^{-2}} = 1.1372$ | §6.1; `eq:ybyt`, `eq:diagfactor` | **[D]**; bracket Lean-certified |
| **Path multiplicity — CANONICAL SITE.** Two fixed points sharing a coordinate are connected by a **single** geodesic within the fundamental cell (the two torus lifts are identified by the involution); the **diagonal pairs** $\{P_1,P_4\}$ and $\{P_2,P_3\}$ are connected by **two genuinely distinct** geodesics. Fibre-sector doubling gives $\lvert V_{cb}\rvert = 0.0440$ | `prop:paths` §6.2; `eq:Vcb` | **[D]**; profile normalisation $0.509$ carries a $\sim19\%$ band |
| **Geodesic interference.** The two diagonal paths carry relative phase $e^{i\pi/2}\cdot e^{i\pi/2} = -1$ — **exact topological destructive interference at tree level**, broken only by the warp gradient; $\lvert V_{ub}\rvert = 0.00375$ | §6.3; `eq:interference`, `eq:VubVtd` | **[D]**. The order-unity residual $C^{\mathrm{eff}}$ is the **principal theoretical vulnerability of the CKM assembly**; $15$–$19\%$ band |
| **$\phi_\omega = \pi/2$ (the quarter phase) — THE CANONICAL AND SOLE SITE FOR THE VALUE.** The involution lifts to $\Spinc$ sections with square $-1$ (Paper 3 `lem:spinc-involution-lift`); **consequently** the lift acts on the determinant square root $L^{1/2}$ at a fixed corner through a fourth root of unity, and the $\omega$-cycle holonomy on $\Spinc$ sections is the quarter phase $\phi_\omega = \pi/2$. Corner determinant pattern $(+,+,+,-)$, product $-1$. **Paper 3 supplies the lift; it does not state $\pi/2$** | **`lem:quarterlift` §7.1**; `eq:phiomega` | **[D]** — inference from the [R] involution lift |
| **Fibre quantum $W_{\mathrm{fibre}} = 2\pi/6 = \pi/3$ — CANONICAL SITE FOR THE QUANTUM.** The half-period $\psi$-translation acts on $\mathrm{SU}(3)$-fundamental $\Spinc$ sections through an exact order-six cyclic structure (Paper 3 `prop:c1-z6`) and contributes this elementary quantum. **Paper 3 supplies the order-six structure; it does not state the quantum** | **`lem:Wfibre` §7.1**; `eq:Wfibre` | **[D]** |
| **Base quantum $W_{\mathrm{base}} = 2\pi/(2\chi(\K)) = \pi/12$ — CANONICAL SITE.** The flat Wilson-line piece of the half-period $\psi$-translation contributes this elementary quantum of the order-24 composite cyclic structure | **`lem:Wbase` §7.1**; `eq:Wbase` | **[D]**; channel-resolved step carries the deflationary reading in-document |
| **$\phi_\psi = 0 + \pi/12 + \pi/3 = 5\pi/12$ — CANONICAL SITE.** Corner phases $(0,5,6,11)\cdot\pi/12$; **gap closure $5+1+5+1 = 12 = \chi(\K)$** — the holonomy quanta close the Euler characteristic. **$\phi_\psi$ (path-additive under $T_\psi$) is a distinct object from $\phi_\omega$ (the $\sigma$-fixed-point lift phase); they live on different group elements** | §7.1; `eq:phipsi`, `eq:cornerphases` | **[D]**; quanta sum and gap closure Lean-certified |
| **Corner plaquette — CANONICAL SITE.** The rephasing-invariant phase of the Yukawa pair is the $\Spinc$ holonomy of the **closed corner circuit** $P_1 \to P_2 \to P_4 \to P_3 \to P_1$: a function of $(\phi_\psi, \phi_\omega, \tau_2)$ **alone — no measured quantity enters it** | `prop:plaquette` §7.2 | **[D]** |
| **Diagonal–Weinberg complementarity — CANONICAL SITE.** The diagonalisation angle of the down sector is the **complement** of the weak mixing angle: $\theta_d = \pi/2 - \theta_W$; rotation entries $\pm\cos2\theta_W$, $\sin2\theta_W$ | `lem:complement` §7.2; `eq:thetad` | **[D]** |
| **CP phase $\delta_{\mathrm{CP}} = \tfrac12[\phi_\omega + \phi_\psi\cos2\theta_W] = 65.49°$** (observed $65.2° \pm 3.0°$); sensitivity $q_\psi = 0.2732$ | §7.3; `eq:Fq`, `eq:deltaCP` | **[D]**; brackets Lean-certified. The **reflection implementation** is the section's one declared modelling convention **[M]** |
| **Jarlskog invariant $J = \mathcal{M}\sin\delta_{\mathrm{CP}} = 3.31\times10^{-5}$** (observed $3.08\times10^{-5}$); $\mathcal{M} = 3.6406\times10^{-5}$ | §7.4; `eq:Jvalue` | **[D]**; bracket Lean-certified. **Deflationary**: the standard factorisation evaluated on the construction's own angles and phase — a consistency of routes, **not an independent computation of $J$** |
| **CKM assembly**: standard parameterisation from the four derived inputs $(0.22676,\ 0.0440,\ 0.00375,\ 65.49°)$; exactly unitary. **Unitarity completions** (predictions, not inputs): $\lvert V_{td}\rvert = 0.0091$, $\lvert V_{ts}\rvert = 0.0432$, $\lvert V_{tb}\rvert = 0.9990$ | §8; `eq:inputs`, `eq:Vmatrix`, `eq:completion` | **[D]** — deviations $6.1\%$, $5.2\%$, $1.1\%$ |
| **Scoreboard**: ten observables from zero continuous inputs and zero empirical anchors; deviations $0.4\%$–$7.6\%$; RG systematic $10$–$20\%$ stated | `tab:summary` §8.2 | inventory |
| **Structural falsifiers**: (i) $\lambda_C(1 + \alpha_s/\alpha_w) = 1$; (ii) universality of $\tau_2$ across four roles; (iii) discreteness — $\tau_2$ is a cubic root, admitting no continuous deformation | §9.2 | **[D]** |

**Open (Paper 1)**: the $0.8\%$ residual between the derived $\tau_2$ and the values the data combinations return — candidates are threshold corrections, a corner-localised twisted-sector flux contribution (finite and exact in principle; the natural first target), and the running of the confirmations. The profile normalisation $0.509$ and the warp-breaking residual $C^{\mathrm{eff}}$ both await the eight-dimensional Dirac integration. A **direct geometric evaluation of $J$** as a triple overlap, independent of the factorisation route, is open. Two-loop running with threshold matching, and a first-principles derivation of the infrared anchoring of §5.4, are open. Bibliography: the `MasterShadow` entry is **Paper 3** (J. Geom. Phys.); its venue field is **TODO-PI**.

---

## Paper D — Rigidity and geometric realisation of a decorated hyperfinite factor (`PaperD_main_v5.tex`)

Island paper; cites no corpus material. Merger of the former island manuscripts A and C (G-D1 passed 21 Aug 2026). The hyperfinite completion and the transpose anti-involution with its classification are **held at Paper 3** (`thm:c3-completion`, `prop:c3-tau-exists`/`prop:c3-classification`); Paper D reproduces them in-document under the island rule and holds no row for them. The corner ↔ sub-algebra labelling is the definition of the decoration at Paper 3 §`sec:completion`. Grades in inventory mode from the paper's own verbs; CERT = machine-checked Lean 4.29.1 core-only certificate in the fourteen-file suite, Zenodo `doi:10.5281/zenodo.22044976`.

| What is derived | Site | Rigour |
|---|---|---|
| **Distinguished decoration.** The stagewise real form is $M_{4^n}(\mathbb{R})$; $\Theta$ restricts to quaternionic conjugation on the distinguished copy $\mathbb{H} \subset R_{\mathbb{R}}$; the $\Theta$-fixed subalgebra of $\mathbb{H}$ is $\mathbb{R}$ | `A1:thm:main`(iv); `A3:prop:realform`, `A4:prop:conjugation` | [R] · CERT `A_C5_fixed_subalgebra` |
| **$Q_8$ orbit table with $\Theta$-action.** Under $V \times Z = \langle \mathrm{Ad}(Q_8), q \mapsto -q\rangle$ exactly four degree-two orbits; $\Theta$ preserves each; $\{\pm 1\}$ is the unique $\Theta$-trivial orbit, sitting in the unique one-dimensional limiting subalgebra | `A1:thm:main`(v); `A4:lem:kleinfour`, `A4:prop:orbits`, `A4:prop:distinguished` | [R] · CERT `A_C4_Q8_orbits` |
| **Module actions and the parity invariant**: $\rho(u)^2 = -\mathrm{id}$ on pure units; $\lambda$–$\rho$ commutation; $\rho(g)^{\mathsf T} = \rho(\bar g)$; axis-independent parity | `A4:lem:modules`, `A4:prop:parity` | [R] · CERT `A_C6_module_parity` |
| **$\Theta$-eigenspace decomposition with graded product rule**: $\mathbb{H} = \mathbb{R} \oplus \mathrm{Im}\,\mathbb{H}$ as $\Theta$-grading, Hamilton product rule on the grading | `A4:prop:grading` | [R] · CERT `A_C7_graded_product` |
| **Two Klein four-groups separated**: $V = \mathrm{Ad}(Q_8) \subset \mathrm{Aut}(\mathbb{H})$ and the module group $W/\{\pm\mathrm{id}\}$ arise from the same $Q_8$, act on $\mathbb{H}$ by automorphisms and by left-module endomorphisms respectively, and share no non-trivial element of $\mathrm{GL}_{\mathbb{R}}(\mathbb{H})$ | `A4:prop:two-kleinfour` | [R] · CERT `A_C8_two_kleinfour` |
| **★ DECORATION RIGIDITY — CANONICAL SITE** (distinct from Paper 3 `thm:rigidity`, the numerical two-threes). Any two quaternionic decorations of $(R, \Theta)$ are conjugate by a unitary of $R_{\mathbb{R}}$, the induced automorphism commuting with $\Theta$; the finite invariants are invariants of the pair; the relative commutant of a decoration is $R_{\mathbb{R}}$; the stabiliser is identified; absorption $\mathbb{H} \otimes_{\mathbb{R}} R_{\mathbb{R}} \cong R_{\mathbb{R}}$ holds as an exact decomposition over the prescribed copy | `AR:thm:rigidity` via `AR:lem:automatic`, `AR:lem:sigma`, `AR:prop:correspondence`, `AR:lem:HC`, `AR:lem:complexified`, `AR:lem:conjugacy`, `AR:lem:cocycle`; `AR:cor:invariants`; `AR:lem:decomposition`, `AR:lem:averaging`, `AR:lem:commutant`, `AR:prop:stabiliser`, `AR:cor:absorption` | [R] — sole external input the comparison theorem for projections in a finite factor (Takesaki I, Ch. V) · CERT `A_C9_base_commutant` (base-stage commutant) |
| **Twist classification on the tower**: a pullback-compatible family of determinant twists on $M_n = \mathbb{CP}^{2n} \times S^{2n} \times P^n$ has constant degree; spin$^{\mathrm c}$ forces the degree odd; no family is stagewise-canonical; the constant family of degree three is the unique compatible continuation of the canonical spin$^{\mathrm c}$ structure of the base stage | `C2:lem:constancy`, `C2:lem:parity`, `C2:prop:canonical` | [R] · CERT `C_C1_pullback_compat` |
| **The corner correspondence**: bijection corners ↔ minimal diagonal projections, equivariant under the corner symmetries; the anchored commuting square; the anchor is intrinsic (the unique corner whose symmetry is $\Theta$-fixed); reconstruction of the unital inclusion as the orbit sum of the anchored embedding; trace identities $\tau_n(\Phi_n(w)) = 4^{-n}$ | `C3:lem:equivariance`, `C3:lem:square`, `C3:lem:anchor`, `C3:prop:reconstruction`, `C3:cor:trace` | [R] · CERT `C_C2_corner_count`, `C_C3_commuting_square` |
| **The tower operator and its orbifold index**: spin coefficients on the smooth factors give vanishing index at every stage (forcing Euler coefficients); $N(n,k) = \binom{p+2n}{2n}$, $p = \tfrac12(k-2n-1)$; torus Lefschetz numbers $L(e) = 0$, $L(\sigma) = 4$ with local term $+1$ per fixed point; orbifold index as deck-group average; $\mathrm{ind}_{\mathrm{orb}}(D_n^{(k)}) = 2^{n+1}N(n,k)$ with equal corner term $2^{1-n}N(n,k)$ | `C4:lem:naive`, `C4:lem:cp`, `C4:lem:torus`, `C4:lem:average`, `C4:prop:kawasaki` | [R] — analytic inputs consumed by citation (Atiyah–Bott, Atiyah–Segal, Hirzebruch–Riemann–Roch) · CERT `C_C4_index_arithmetic` (bookkeeping) |
| **Stage identity, trace = corner-localised index**: for every stage, every odd $k$, every corner set $S$, $\sum_{w \in S}\mathrm{ind}_w = \mathrm{ind}_{\mathrm{orb}} \cdot \tau_n(p_S)$; compatible with the inclusions; the limit diagonal algebra is $L^\infty(B^{\mathbb N}, \mu)$ with $\tau_{\mathrm{st}}$ the uniform Bernoulli measure; the integer stage index data are recovered from the trace, the value set on corner projections being exactly the dyadic rationals in $[0,1]$ | `C4:thm:stage`, `C4:thm:limit`, `C4:cor:ktension` | [R] · CERT `C_C4_index_arithmetic` |
| **Survival of the index data**: corner measures coherent along the tower; they survive the weak closure as the restriction of $\tau_{\mathrm{st}}$; under $K_0(R) \cong \mathbb{R}$ the corner classes are exactly the dyadic rationals; at each stage the pairing is an instance of the $K$-homology–$K$-theory index pairing, the coherent family encoded in one normal state | `C5:lem:equidistribution`, `C5:thm:survival`, `C5:rem:kk` | [R] |
| **The quaternionic decoration is geometric**: the real span of the base-factor corner symmetries $\{L_b\}$ is the left-multiplication copy of $\mathbb{H}$, on which $\Theta$ is quaternion conjugation | `C5:lem:quaternion` | [R] |
| **Realisation of the decorated limit**: every item of $(R, \Theta, \mathbb{H})$, with the trace, is the weak-closure image of a structure on the geometric tower; the tower selects the orthogonal class at every finite stage and the anchor within it | `C5:thm:main` | [R] |
| **Canonicity of the realised triple**: any triple of the realisable kind is carried to the realised one; the realised triple and its finite invariants are independent of the admissible degree and of every construction choice | `C5:cor:canonicity` | [R] (immediate from `A3:thm:class` and `AR:thm:rigidity`) |
| **One-directionality**: towers of every admissible degree share the same decorated limit; the geometry is not recoverable from the abstract factor | `C5:rem:deflation` | [R] as stated |
| **The $KO$-shadow of the corner classes**: $KO_*(\mathcal{R}_n) \cong KO_*(\mathbb{R})$ with $[p_S] = \lvert S\rvert$; $(\iota_n)_*$ is multiplication by four on every $KO$-group; $KO_0(\mathcal{A}) \cong \mathbb{Z}[\tfrac12] \cong KO_4(\mathcal{A})$ as ordered groups, all other degrees zero; $[p_S] \mapsto \tau_n(p_S)$; the $\mathbb{Z}/2$ in degrees one and two is present at every finite stage and every transition map is zero on it | `C5:lem:kostage`, `C5:lem:kotransition`, `C5:thm:ko` | [R] — Morita invariance and continuity of $KO$ consumed by citation · CERT `C_C5_ko_colimit` |
| **Certificate suite**: fourteen machine-checked files (nine `A_C1`–`A_C9`, five `C_C1`–`C_C5`), Lean 4.29.1, core library only, zero `sorry`, no author axioms (footprint at most {propext, Quot.sound}); consolidated Zenodo record `doi:10.5281/zenodo.22044976` | Appendix `DX:sec:certificates` | CERT registry row |

---

## Live papers

## Paper 2 — A topological sequestering mechanism for the cosmological constant from warped orbifold compactification (`Paper2_Sequestering_v7.tex`)

**SIXTH IN PUBLICATION PRECEDENCE** (last). CQG track. 19 pp.; XeLaTeX three-pass clean; three Lean 4.15.0 certificates (core toolchain, zero `sorry`, zero axioms): `P2_L1_euler_v1.lean`, `P2_L2_exponent_v2.lean`, `P2_L3_stability_v2.lean`.

**Consumed from earlier papers (no rows here; reproduced in-document under the island rule — the referee never leaves the document).** $\chi(\Ttwo/\Ztwo) = 2$ and $\chi(\Keight) = 12$ — canonical at **Paper 3** (`lem:c4-pillowcase`, `prop:c4-twelve`); Paper 2 §3 reproduces both with two routes each and certificate L1. **Tadpole cancellation** $N_{\mathrm{flux}} = \chi(\K) = 12$ — canonical at **Paper 1** §3.2. The **aspect ratio** $\tau_2 = 1.8466$ and the identification $\tau_2 = R_w/R_c = L_\omega/L_\psi$ — canonical at **Paper 1** (`thm:enumeration`; §2.1 conventions), cited. The **one-loop modulus bound** $\lvert\delta\tau_2\rvert = O(10^{-5})$ — canonical at **Paper 1** `prop:closure`, cited. The **$\Spinc$ corner lift** — canonical at **Paper 3** `lem:spinc-involution-lift`; the **quarter phase** $\phi_\omega = \pi/2$ — canonical at **Paper 1** `lem:quarterlift`. The **de Sitter sign from $V_{\min} > 0$** — canonical at **Paper 1** `rem:stability`, cited as independent confirmation.

**Declared axioms.** $\Sigma$-1 (`ax:sigma1` §2): the internal geometry $\Keight$, dimension 8, warped over the base with $\Spinc$ structure. $\Sigma$-2 (`ax:sigma2` §2, `eq:2D-action`): the reduction on the base is the 2D Einstein–Maxwell system — **deflationary reading stated in-document**: every result of §4 is a theorem *of this system*; the 12D$\to$2D reduction is not re-derived. $\Sigma$-3 (`ax:sigma3` §6.2): the fundamental unit, $k_\omega = 1$.

| What is derived | Site | Rigour |
|---|---|---|
| **★ THE EXACT WARP EXPONENT PER FLUX UNIT — THE CANONICAL AND SOLE DERIVATION SITE.** For the 2D Einstein–Maxwell system on $\Ttwo/\Ztwo$ with $N$ units of quantised flux at the $\Ztwo$ fixed points: $k_\omega L_\omega = N\pi$ **exactly**. Bogomol'nyi completion of the energy functional gives the first-order BPS equation linking $\partial_\omega A$ to the flux density; Dirac quantisation fixes the distributional source; the kink balance $2k = \kappa_2^2 N\pi$ closes against the Gauss–Bonnet normalisation $\kappa_2^2 = 2/L_\omega$. **No adjustable parameters.** Smallest case $N = 1$ worked by hand. Consistency checks: RS1 limit (Israel junction condition), positive-definite flux energy, warp monotonicity. **No predecessor proves this**: Paper 1 asserts $k_\omega L_\omega = 12\pi$ as topologically fixed but supplies no derivation | **`thm:warp-exponent` §4**; `eq:kL-Npi` (boxed) | **[R]** — conditional on $\Sigma$-2, stated in-document |
| **$\zeta = \chi(\Keight)\cdot\pi = 12\pi$ — THE CANONICAL AND SOLE DERIVATION SITE.** Composition of `thm:warp-exponent` with the tadpole count | **`cor:zeta` §4.6**; `eq:zeta` | **[R]** · CERT `P2_L2_exponent_v2.lean` (`zeta_coefficient`) |
| **Strict topological exponent $n = 8$ — CANONICAL SITE.** Two independent counts: fibre-dimension sum ($4+2+2$) and the **Weyl split** ($6$ from $\det g_{\Sigma_6}$, $2$ from the 4D Einstein-frame rescaling). General rule $n = d+2$; smallest case $d = 1 \Rightarrow n = 3$ (the familiar 5D warped weight) worked by hand. **The two occurrences of 2 are distinct integers** — base dimension vs conformal weight — that coincide numerically | **§5.1**; `eq:n-split` | **[R]** · CERT `P2_L2_exponent_v2.lean` (`dim_K8_eight`, `weyl_split`) |
| **★ Topological suppression $e^{-n\zeta} = e^{-96\pi} \approx 1.05\times10^{-131}$ — CANONICAL SITE.** A **single exponential** produced by one warped-volume integral; **not a cancellation between competing terms**. The exponent factorises as (dimension count) $\times$ (flux count) $\times$ $\pi$. Cross-checked by direct evaluation without factorising through $\zeta$ and $n$ | **§5.2**; `eq:suppression` (boxed) | **[R]** · CERT `P2_L2_exponent_v2.lean` (`exponent_96`, `single_flux_case`) |
| **Base-period closure — CANONICAL SITE.** $L_\omega = \zeta/k_\omega = 12\pi$ (by `cor:zeta` under $\Sigma$-3); $L_\psi = L_\omega/\tau_2 = 12\pi/1.8466 \approx 20.41$ (by the aspect-ratio identification, Paper 1). **Neither base length is a free parameter** | **§6.2**; `eq:periods` | **[D]** · CERT `P2_L2_exponent_v2.lean` (`period_omega`, `period_ratio`) |
| Fibre volumes and geometric coefficient: $\Vol(\CPtwo) = \pi^2 R_c^4/2$ (Fubini–Study), $\Vol(\Stwo) = 4\pi\tau_2^2 R_c^2$ (round); $C_{\mathrm{geom}} = 2\pi^3\tau_2^2 \approx 211$ **at the canonical $\tau_2 = 1.8466$** (the value $\approx 217$ corresponds to the rounded $1.86$; 2% difference, no order-of-magnitude consequence) | §6.3; `eq:volumes`, `eq:V6` | **[R]** |
| **★ Planck-mass closure — CANONICAL SITE.** $M_{\mathrm{Pl}}^2 = 12\pi^4\tau_2 R_c^6/\kappa_{12}^2$, from applying the warped-volume integral of §5 to the Einstein–Hilbert term and inserting $R_w = \tau_2 R_c$, $L_\psi = 12\pi/\tau_2$, $k_\omega = 1$. **One relation, one unknown**: $(M_{\mathrm{Pl}}R_c)^2$ is fixed by the Planck mass, the derived $\tau_2$, and the single scale in $\kappa_{12}$. **No identification of $R_c^{-1}$ with any external scale is made** | **§6.4**; `eq:MPl-closed` (boxed), `eq:MPlRc` | **[D]** |
| **Geometric prefactor $V_{\min} \approx 16\,(M_{\mathrm{Pl}}\ell_{12})^{8/3} M_{\mathrm{Pl}}^4$ — CANONICAL SITE**, with $\ell_{12} = (\kappa_{12}^2)^{1/10}$. A pure function of the Planck mass in fundamental units | §6.5; `eq:Vmin`, `eq:Vmin-number` | **[D]** |
| **Flux obstruction.** The $\Spinc$ involution lift squares to $-1$, so no flat connection exists and $F_{\psi\omega} \neq 0$ is **forced**; the flux energy density is a square, hence strictly positive. **A topological obstruction to flatness is, in the energy functional, a positive contribution** | §7.1; `eq:flux-energy` | **[R]** |
| **★ Positive (de Sitter) sign — THE CANONICAL AND SOLE DERIVATION SITE.** Derived **primarily on the warp factor**, requiring no field content beyond the reduction: $V(a) = V_{\min}(\lambda e^{8a} + \beta e^{10a})$, $\lambda < 0$ (bulk curvature), $\beta > 0$ (flux); the weights $8$ and $10$ are the volume weight and the same augmented by the $F^2$ contraction. Stationarity: $e^{2a_\ast} = 4\lvert\lambda\rvert/5\beta$; **$V''(a_\ast) = 20\,V_{\min}\,\beta\,e^{10a_\ast} > 0$ — a stable minimum.** *(Paper 1 `rem:stability` reaches the same sign by the moduli Hessian; Paper 2 cites it as independent confirmation, deflated in-document as sharing the fixed-point geometry.)* | **§7.2**; `eq:Veff-warp`, `eq:critical`, `eq:Vpp` | **[D]** · CERT `P2_L3_stability_v2.lean` (`critical_ratio`, `substitution_step`, `vpp_bracket`, `vpp_positive`) |
| **Parametrisation-independence of the sign — CANONICAL SITE.** The substitution $a = -\zeta\Phi$ carries the potential to the effective-field form; the computation repeats verbatim, the chain-rule factor $\zeta^2$ being a **square and hence sign-neutral**. **One certificate serves both routes.** Generality clause stated in-document: *any field with that normalisation and the topologically fixed coupling $\zeta = 12\pi$ produces the same potential and the same stable minimum*; the identification of $\Phi$ with a particular higher-dimensional field is a separate question on which the derivation is **silent and from which it is independent** | **§7.3**; `eq:Veff-field`, `eq:Vpp-field` | **[D]** · CERT `P2_L3_stability_v2.lean` (`route_agreement`) |
| **★ Cosmological constant $\Lambda_{\mathrm{eff}} = V_{\min} e^{-96\pi} \approx 16\,(M_{\mathrm{Pl}}\ell_{12})^{8/3} e^{-96\pi} M_{\mathrm{Pl}}^4$ — THE CANONICAL AND SOLE SITE.** The **factorisation** is the structural content: exponent = strict topology, prefactor = classical geometry, **no cancellation between large terms anywhere** | **§8.1**; `eq:lambda` (boxed) | **[D]** |
| **Scale location.** The observed $\Lambda \approx 10^{-122}M_{\mathrm{Pl}}^4$ fixes the one axiomatic scale: $M_{\mathrm{Pl}}\ell_{12} \approx 8\times10^2$, i.e. $\ell_{12}^{-1} \approx 1.5\times10^{16}$ GeV, with $R_c \approx 2.6\,\ell_{12}$ — **no large dimensionless number hides in the geometry**. **Deflationary reading in-document**: the framework does not predict $\Lambda$ unconditionally; it **converts $\Lambda$ into a measurement of the fundamental scale**, which lands at the unification scale | §8.1; `eq:M12-location` | **[D]** |
| Comparison with the anthropic bound (Weinberg 1987): **complementary, not competing** — the mechanism supplies a value from topology, the bound constrains from selection | §8.2 | inventory |
| **★ Relation to the de Sitter swampland conjectures — CANONICAL SITE.** The construction produces a **stable minimum** ($V' = 0$, $V'' > 0$, certified), violating **both** the original conjecture (Obied–Ooguri–Spodyneiko–Vafa) **and** the refined form (Ooguri–Palti–Shiu–Vafa) — the latter permits maxima but continues to forbid metastable minima. **The standard objection does not apply**: there is no uplifting sector to backreact upon; the positive term is the energy of a flux whose non-vanishing is forced by a topological obstruction, and **no limit switches it off without changing the topology**. Three readings offered without choosing between them; the loop-level failure mode is named as the falsification criterion | **§8.4** | **[D]** |
| **Open (radiative corrections).** **Bounded**: the one-loop Casimir shift of the modulus, $\lvert\delta\tau_2\rvert = O(10^{-5})$ (Paper 1 `prop:closure`, cited). **Open**: the one-loop effective potential of the KK tower on the warped background, and whether its contribution to the 4D vacuum energy inherits the $e^{-96\pi}$ suppression of the infrared-localised classical term. The structural expectation is the RS intuition; **an expectation is not a computation and is not presented as one** | §8.3 | **[G]** — visible, precisely located |
| **Notational caution (banked).** $e^{-24\pi}$ (the 4D Casimir suppression, Paper 1 §4.1) and $e^{-96\pi}$ (the 12$\to$4 warped-volume exponent $8\zeta$, this paper) are **different objects answering different questions**. They coexist without tension | §8.3 | inventory |

**Bibliography**: venue fields for the Paper 1 and Paper 4 entries are **TODO-PI**.

---

### Paper I — Master Equation Framework (Foundational Preprint)

| What is derived | Site | Rigour |
|---|---|---|
| **MASTER EQUATION — canonical explicit-$\zeta$ form:** $G_{MN} = 8\pi G_{\mathrm{eff}} T_{MN} + \zeta \nabla_M \Phi \nabla_N \Phi + \Lambda_{\mathrm{eff}} g_{MN}$, where $\Phi = \omega(\psi - \bar\psi)^2$ is the **Quantum Coherence Dilaton** ($\omega$ = consciousness coherence field; $\psi, \bar\psi$ = quantum / anti-quantum spinor condensates; $\zeta = 12\pi$ = quantum coherence coupling constant, topologically derived). $\nabla_M \Phi \nabla_N \Phi$ is a **rank-2 symmetric tensor formed from the outer product of covariant derivatives of the Quantum Coherence Dilaton**. $\zeta$ is **never absorbed** into a redefined field. | Ch 2, §master-presentation | **(definitional)** |
| 12-manifold $\mathcal{M}_{12} = (S^1_{\mathrm{Sol}} \times S^3) \times K_8$ definition | Ch 3 §geo-M12 | R (definitional) |
| Internal manifold $K_8 = [(\mathbb{CP}^2 \times S^2) \times_w (T^2/\mathbb{Z}_2)]^{\mathrm{Spin}^c}$ | Ch 3 eq:K8 (line 76, boxed) | R (definitional / construction) |
| Warped product metric ansatz with $A(\theta_\psi, \theta_\omega) = -k_\psi\ | \theta_\psi\ | - k_\omega\ |
| Cosmological constant $\Lambda_{\mathrm{eff}} = V_{\min} \times e^{-96\pi} \approx 10^{-122} M_{\mathrm{Pl}}^4$ | Ch 5 eq:lambda-result (line 203, boxed); App C §C.6 | M — App C: "+10^{-11} M_Pl^4, correct sign de Sitter, 110 orders too large; uplift mechanism + landscape selection required" |
| Three fermion generations $N_{\mathrm{gen}} = h^{0,2}(\mathbb{CP}^2, \mathcal{O}(-4)) = \binom{3}{2} = 3$ via Dolbeault cohomology | Ch 4 eq:generations-dolbeault (line 167, boxed); App B eq:B.3, eq:B.25 (three independent derivation routes: orbifold projection, Dolbeault, ${+i}$ subspace) | R (Dolbeault) / D (orbifold projection) |
| Universal fibre multiplicity matrix $C_{\mathrm{fibre}} = (2,2,2;2,2,2;2,2,1)$ for quark sector | App G eq line 397 (boxed) | D (fibre-sector cohomology + 3-j) |
| Closed universe $\Omega_k < 0$ from $S^3$ spatial topology | Ch 5 eq:closed-universe (line 29, boxed) | D (topology assumption + observation interpretation) |
| Sol monodromy / cosmic cycle period via Anosov flow | Ch 5 §sol-geometry, §monodromy | M (cosmological prediction, not yet observed) |
| Born rule from geometric collapse on $S^3$ | Ch 5 §born-rule | M at Paper I; later upgraded in I-Addendum (§Born Rule Theorem) |

### Paper I Addendum — Six Gap Closures (`Paper_I_Addendum_v3.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Uniqueness of Quantum Coherence Dilaton form $\Phi_{\mathrm{QC}} = \omega(\psi - \bar\psi)^2$ from analyticity, Z₂ symmetry, EFT suppression | §2 Uniqueness Theorem; §sec:uniqueness:theorem | **R** (Classification stated at line 226) |
| Fermionic condensate from orbifold zero-modes via Hubbard–Stratonovich + super-criticality of geometric coupling | §3 Condensation Theorem; §sec:condensate:theorem | R/D (mean-field justification rigorous; condensate scale derived) |
| **π-per-flux-unit result** from reduced 2D BPS system on T²/Z₂ — closes the Gap from Paper I App C | §4 §sec:bps2d:exact (line 1031); §sec:bps2d:theorem (line 1083) | **R** — line 895: "Classification: Rigorous"; line 1086: "rigorous, parameter-free theorem of the 2D Einstein–Maxwell system" |
| Fibre Decoupling Theorem — 8D problem reduces to decoupled 2D problem | §5 §sec:fibre8d:theorem | D (Einstein condition + rescaling argument) |
| Weinberg Angle from explicit Kaluza–Klein reduction on $\mathbb{CP}^2 \times S^2$, with normalisation constant $\mathcal{C}_{\mathrm{norm}} = 8/27$ | §6 §sec:weinberg:theorem | R (KK reduction rigorous); identification $c_2 = 8/27$ stated as Derived (line 1393) |
| Hypercharge quantisation from $\psi$-shifted Dirac equation; localisation theorem | §7 §sec:hypercharge:theorem | **R** (line 1644: "Classification: Rigorous") |
| Born Rule from Petersson inner product on mock modular forms; uniqueness $\alpha = 2$ from modular constraint | §8 §sec:born:theorem | R (Petersson integral) + D (bridge from Petersson norm to $K_8$ $L^2$ norm — line 1934 explicit) |

### Paper III — PMNS Topological Derivation (`Paper_III_PMNS_Topological_Derivation_V16.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Reading β: leptons as corner-localised orbifold modes (vs Reading α: bulk RS-style) | §4 — status summary line 240 | D (corner amplitude analysis; line 138) |
| Geodesic length spectrum on warped pillowcase | §5 prop:geodesic-spectrum | D |
| Induced metric on geodesic submanifold | §5 prop:induced-metric | R (line 499) |
| Colour-singlet character of leptons (geometric origin, not stipulated) | §5 prop:colour-singlet (line 507); prop:distinction (line 734) | D (line 738: "derived, not stipulated") |
| Finite volume across all corner classes | §5 prop:finite-volume | R (line 515; line 556 for self-pairs) |
| Self-energy divergence resolution by geodesic absorption | §5 prop:self-energy | D |
| Smoothness of lifted mock-modular mode | §6 prop:smoothness | D |
| OS positivity from modularity (cancellation of negative-norm shadow states by Zwegers integral) | §6 prop:OS | D |
| Corner amplitude uniformity (all four corners contribute identically) | §6 prop:corner-uniformity | D |
| Geometric content of dimensional sequence $A_n$ | §7 prop:An-content | D |
| Generation–corner allowed-set from Spin$^c$ hypercharge-twisted parity | §7 prop:generation-map (line 758) | D |
| Within-species generation labelling (Reading II convention) | §7 prop:generation-map remark | M (convention; corner-exclusion content is D) |
| Per-class accumulated phase | §8 lem:H-class (line 934) | (lemma in support of further results) |
| $\sigma$-lift sign on column 3 of PMNS | §8 prop:sigma-lift (line 962) | D |
| **Conditional floor on $m_\mu/m_\tau$** (the V15 "Gap" — the structural floor result) | §9 thm:floor (line 1001) | **G** — paper §0.4 line 363 explicit: "the structural floor of §9 is Gap"; remedy localised |
| Corner-dependence decomposition for PMNS observables | §9 prop:corner-decomposition | D |

### Paper III Addendum — Sol-Monodromy Regularisation (`Paper_III_Addendum_Sol_Monodromy_v11.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Phase 0 corner architecture (Reading β confirmation, four-corner table, walking patterns) | §2 (lines 112–264); §2.7 status summary | D (line 138; line 220) |
| Cross-wall structure of dilaton $\Phi_{\mathrm{QC}} = \omega(\psi - \bar\psi)^2$ as cross-wall pairing (not same-point algebraic) | §3 (lines 265–289) | **R** (line 274: "Lorentz invariance of $\Phi_{\mathrm{QC}}$ arises from geometric pairing across walls") |
| Sol Anosov flow — Lyapunov exponent $\ln\varphi$ (golden ratio) per period | §4 (lines 291–342) | R (line 308) |
| Topological Casimir shift on Sol manifold: $\langle\omega\rangle_{\mathrm{eff}}(x_\perp) = \omega_{\mathrm{classical}}(x_\perp) + \mathcal{C}_{\mathrm{Sol}}\ln\varphi$ | §4 eq line 326 (boxed) | D (line 328: "form is Derived from Sol Anosov geometry of Paper X; value of $\mathcal{C}_{\mathrm{Sol}}$ requires explicit heat-kernel computation") |
| **Charged lepton mass ratio $m_\mu/m_\tau = (\ln\varphi)^2 / (6\pi) \approx 0.0510$** (14% agreement with observed 0.0596) | §5 line 392 (boxed) | **M** (line 331: "Classification of the numerical prediction: M; agreement is indicative but not conclusive; fully Derived prediction requires explicit heat-kernel computation of $\mathcal{C}_{\mathrm{Sol}}$") |
| Cross-wall factor of two (UV/IR self-pair regularisation) | §5.4 line 387 | D |
| Chiral mirror Z_2 = ½ · (Z_3 centre on $L = \mathcal{O}(3)$) — anchor identity | §6/§7 line 528 (boxed) | D |
| Charged lepton fibre Z-factors $Z_{\mathrm{UV}} = 3/2, Z_{\mathrm{IR}} = 1/2$ from SU(3) centre on Spin$^c$ sections | §8 line 652 (boxed) | D |
| **Charged lepton fibre matrix $C_{\mathrm{fibre}}^{(e)} = (2,2,1;2,2,2;1,2,2)$** | §8 line 689 (boxed) | D |
| Analytic cancellation $R_{\mathrm{fibre}} \cdot 1/\sqrt{Z_{\mathrm{UV}} Z_{\mathrm{IR}}} = (\sqrt{3}/2)(2/\sqrt{3}) = 1$ | §8 line 710 (boxed) | D |
| **Phase IV-A: Bismut warp power $w = 8 - 2s = 8 - 6 = 2$** for Spin$^c$ Dirac operator | §10 line 1345 (boxed) | D (will become R after rigour upgrade per memory: "Bismut w=2 at Derived") |
| **Phase IV-A: neutrino mass baseline $m_\nu^{\mathrm{baseline}} = V_{\min}^{1/4} \cdot e^{-24\pi}$** (≈ 4 meV) | §10 line 1397 (boxed) | D ([F4] framing axiom + Sol closure narrative at M) |
| **$m_\nu^{\mathrm{baseline}} = \Lambda_{\mathrm{eff}}^{1/4}$** strict-equality identity | §10 line 1417 (boxed) | D — promoted to corpus prediction in Addendum v7 §11.7 (per memory) |
| Cosh structure $\mathcal{F}_i = \cosh(k \ln\varphi \cdot \Phi_i)$ from σ-lift | §11 line 1532 (boxed) | D |
| **Phase IV-C: neutrino is structurally Dirac** (not Majorana) | §11 line 1757 (boxed) | D — "structurally Dirac" determined by σ-lift, not an axiom |
| Bare cone-deficit form $\theta_{\mathrm{bare}}(k) = \arctan\!\bigl(k\ln\varphi/2\pi\bigr)$ on $S^1_{\mathrm{Sol}} \times S^3$ | §Phase III `eq:phase3:bare` (line 1203) | D (closure theorem, line 1294; the derivation-site tag at line 1206 reads M — paper-internal inconsistency, paper not rewritten) |
| Wrap-fraction $k = 2$ from the $\mathbb{Z}_2$ folding of the covering torus | §Phase III `eq:phase3:k=2` (line 1211) | D |
| Corner-walk augmented slope $X(w) = (\ln\varphi + \delta\Phi(w))/\pi$, $\delta\Phi$ summing full edge phases $\Phi_\omega = \pi/2$, $\Phi_\psi = 5\pi/12$ | §Phase III `eq:phase3:augmented-slope` (line 1230) | D |
| **$\theta_{13} = \arctan(\ln\varphi/\pi) \approx 8.71^\circ$** (reference corner, no walk) | §Phase III `eq:phase3:theta13` (line 1241) | D |
| **$\theta_{12} = \arctan\bigl((\ln\varphi + \Phi_\omega)/\pi\bigr) \approx 33.15^\circ$** ($\omega$-edge walk) | §Phase III `eq:phase3:theta12` (line 1247) | D |
| **$\theta_{23} = \arccos\bigl((\ln\varphi + \Phi_\omega)/\pi\bigr) \approx 49.22^\circ$** (same invariant as $\theta_{12}$; corner reading in $\mathbb{C}_j$ from the Sol axis) | §Phase III `eq:phase3:theta23` (line 1254); co-function identification proved at `Supplementary_Lemmas_v2.md` SL-B-1 | **D** — the identification of the invariant extracted by $\arccos$ is closed: $\theta_{23}$ is the angle from the Sol axis of the unit corner state in $\mathbb{C}_j$ with Sol component $X$, forced by Paper 3 `sec:completion` (corner collapse), `cor:closure`/`eq:c3-quat-fixed` (real component separated by $\tau$) and the Addendum's no-edge statement (line 1254); Lean-certified (`SL_A1_cofunction.lean`, 4.29.1). PI ruling 31 Aug 2026. The Addendum text (lines 1255, 1294, 1372) still reads M — paper not rewritten |
| **$\delta_{CP}^l = 165^\circ$** from the $\nu_R$ corner triangle | §Phase III `ssec:phase3:deltaCP` (line 1260) | D (line 1294); diagonal-edge loop convention M (line 1373) |
| Phase III closure: four PMNS observables from $\Mtwelve$ topology with zero free parameters | §Phase III `thm:phase3-closure` (line 1279) | D for all four observables ($\theta_{23}$ closed at SL-B-1; the line-1294 M tag is now stale — paper not rewritten) |

### Paper IV — Cosmological Constant Derivation v6 (`Paper_IV_Cosmological_Constant_Derivation_v6.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Holonomy "tilt" of dilaton potential | §7.5 `sec:tilt` | D |
| AQ-wall Weinberg angle $\sin^2\theta_W^{\mathrm{(AQ)}} = \sin^2(103.2°) \approx 0.948$ | §8.2 line 609 (boxed) | D |
| Dark electromagnetic coupling $\alpha_{\mathrm{EM}}^{\mathrm{(dark)}}/\alpha_{\mathrm{EM}}^{\mathrm{(vis)}} \approx 4.23$ | §8.3 eq:DM-ratio line 675 (boxed) | **D** (line 695: "Rigour status: Derived"; cites Paper XI for $\Omega_{\mathrm{DM}}/\Omega_b = 3+\sqrt{6}$ algebraic upgrade) |

### Paper V — Standard Model Parameters Geometric Derivation v6 (`Paper_V_Standard_Model_Parameters_Geometric_Derivation_v6.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Top quark Yukawa $y_t = I_{\mathbb{CP}^2} \cdot I_{\Stwo} \cdot I_{\mathrm{base}} = 1 \cdot (\mathcal{C}_{3j} \cdot 2/\sqrt{\pi}) \cdot e^{4\pi/3}$ | §3 eq:yt line 338 (boxed) | **M** (§13.2 line 1014: "Pending exact $q_R$ confirmation") — §3.4 remark explicit |
| **Gauss–Bonnet obstruction** (Higgs mass cannot arise from $\Stwo$ Ricci scalar) | §4.1 Theorem `thm:gauss-bonnet` (line 369) | **R** (Theorem-level; §13.2 line 999) |
| Mexican hat from tension-vs-flux on deformed $\Stwo$ | §4.2–4.3 (tension + magnetic-flux expansion); §13.2 line 1000 | D |
| Geometric Higgs parameters $\mu^2 = (2/5) R_w^2 \Delta$, $\lambda = (4/25) R_w^4 E_{\mathrm{mag}}(0)$ | §4.3 eq:mu2, eq:lambda | D |
| Higgs VEV $v^2 = \mu^2/(2\lambda)$ + boson mass $m_H^2 = 2\mu^2$ | §4.4 eq:vev, eq:mH | D (functional form); §13.2 line 1007: "Derived; requires stabilised $R_w$ and $\Delta$" |
| **Gauge coupling ratio $\alpha_s/\alpha_w = R_w^2/R_c^2 = \tau_2^2$** | §6.3 eq:ratio line 583 (boxed) | **R** (§13.2 line 1001: "Killing vector integrals") |
| **Absolute $\alpha_s = 6 (l_{\mathrm{Pl}}/R_c)^2$** | §6.4 eq:alpha-s line 618 (boxed) | D (§13.2 line 1002: "KK reduction with one empirical anchor") |
| **Gravitational hierarchy $M_{\mathrm{Pl}}/M_{\mathrm{weak}} = e^{12\pi} \approx 2.3\times10^{16}$ — THE CANONICAL AND SOLE SITE.** `thm:hierarchy`, boxed. Four-step chain: (1) $\chi(\Keight) = 12$ [R] (Künneth + Kawasaki orbifold Gauss–Bonnet + Atiyah–Singer); (2) $N_{\mathrm{flux}} = \chi(\Keight)$ [R] (tadpole cancellation); (3) $kL = N\pi$ [R] ($\pi$-per-flux, **Paper I Addendum §3** `thm:warp-exponent` — an input, **not re-derived here**; Paper V miscites this as "§4"); (4) composition [D]. **No adjustable parameters at any step.** **No other paper derives the hierarchy. Paper I's row DELETED (v13).** | **Paper V §7.5** `sec:hierarchy-verify`, `eq:hierarchy` (boxed) | **[R]** — paper's own classification; the substantive content is Steps 1–3, each independently [R] |
| **Strong CP $\theta_{\mathrm{QCD}} = 0$** from $\mathbb{Z}_2$ chiral cancellation | §9 eq:theta-zero | D (§13.2 line 1005) |
| AQ-wall Weinberg angle relation $\theta_{\mathrm{AQ}} = \theta_Q \pm 5\pi/12$ | §11 eq:theta-AQ | D |
| Weinberg angle RG closure (1-loop SM running at 3% offset) | §12.1 | D (§13.2 line 1006) |

### Paper VI — Geometric Higgs Mechanism v8 (`Paper_VI_Geometric_Higgs_Mechanism_Derivation_v8.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Gauss–Bonnet topological obstruction** (volume-preserving $\Stwo$ deformation has constant integrated Ricci scalar) | §2.2 Theorem `thm:gauss-bonnet` | **R** (Theorem-level; line 871: "rigorously proves") |
| Surface area expansion of volume-preserving ellipsoid | §3 line 318 | R (textbook formula) |
| Tension-vs-flux Mexican hat from competing internal action sectors | §4 (tension §4.1 + flux §4.2 + combined §4.3) | D |
| Higgs VEV $v^2 = (5/4 R_w^2) \cdot (\Delta/E_{\mathrm{mag}}(0))$ | §5.3 eq:vev-boxed line 461 (boxed) | D |
| Higgs boson mass $m_H^2 = (4/5) R_w^2 \Delta$ | §5.4 eq:mH-boxed line 477 (boxed) | D |
| Master polynomial vacuum potential $V(R_c, R_w)$ from KK reduction | §6 eq:V-master line 533 (boxed) | D |

### Paper VII — Wavefunction Collapse v2 (`Paper_VII_Wavefunction_Collapse_v2.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Collapse timescale $t_{\mathrm{coll}}(\Phi_{\mathrm{QC}})$** as deterministic function of dilaton position on $K_8$ | §4 Theorem `thm:collapse` (and §1.4 R1) | D (table) |
| Three-regime quantum-to-classical boundary | §4.3 `sec:three_regimes` | D (table) |
| **Born rule preservation under Spin$^c$ holonomy phase cancellation** ($P_i \propto \ | \psi_i\ | ^2$ exactly) |
| Complexity wall prediction (sharp transition exp → power-law at critical $\Phi_{\mathrm{QC}}$) | §6 `sec:complexity_wall` | M (table) |
| Geometric Zeno effect | §4.3 (within three-regime analysis) | M (table) |
| Pillowcase metric stiffness function (full derivation) | §2 §pillowcase + §2.4 `sec:total_stiffness` | D |
| 4D effective potential from dimensional reduction; vacuum stability | §3 `sec:vacuum`, `sec:stability` | D |
| Retrospective collapse / anthropic selection | §10 `sec:cosmological` | **Speculative** (paper's own tag, line 1589, 1628) |

### Paper VIII — Dark Matter Ratio v3 (`Paper_VIII_Dark_Matter_Ratio_v3.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Anti-Quantum-wall mixing angle $\theta_{\mathrm{AQ}} = \theta_Q + 5\pi/12 = 103.2°$** | §4.2 `sec:aqwall` | D (table) |
| AQ-wall Weinberg $\sin^2\theta_W^{(\mathrm{AQ})} = \sin^2(103.2°) \approx 0.948$ | §4.2 | D (table) |
| **Dark electromagnetic coupling ratio $\alpha_{\mathrm{EM}}^{\mathrm{AQ}}/\alpha_{\mathrm{EM}}^{Q} \approx 4.23$** | §4.3 `sec:em_ratio` | D (table) |
| Relic density ratio $\Omega_{\mathrm{DM}}/\Omega_b \approx 4$–$5$ from coupling-enhanced baryogenesis | §5 `sec:relic` | M (table; Gap G1 explicit at line 625) |
| Dark disk formation: dark matter cools ~18× faster | §6.1 `sec:dark_disk` | M (table) |
| Dark hydrogen binding energy enhancement | §6.2 `sec:dark_hydrogen` | M (table) |
| SIDM cross-section in observationally preferred range | §6.3 `sec:sidm_xsec` | M (table; Gap G6 explicit at line 482) |

### Paper IX — Baryon Asymmetry v2 (`Paper_IX_Baryon_Asymmetry_v2.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| MEF–Sakharov correspondence (B-violation, CP, out-of-equilibrium from MEF inputs) | §2 `sec:sakharov` | **D** (line 239 B-violation upgraded M → D, May 2026, via composition theorem at line 329; line 241 CP Derived; line 243 OOE Derived) |
| Total baryon number = 0 (Q-wall + AQ-wall sum) from $\mathbb{Z}_2$ symmetry | §3 line 271 | **D** |
| Quantum Coherence Dilaton anomaly: $\partial_\mu J^\mu_B = (\zeta/(4\pi)^2)(\Box \Phi) \, \bar\Psi i\gamma^5 \Psi$, with $\Phi = \omega(\psi - \bar\psi)^2$ | §4 eq line 327 (boxed); composition theorem inserted at line 329 | **D** (upgraded M → D, May 2026, via composition of three Rigorous inputs: $\zeta = 12\pi$ from BPS theorem on $T^2/\mathbb{Z}_2$ [Paper I Addendum §3 `sec:bps2d`]; standard 4D one-loop $1/(4\pi)^2$ [Fujikawa 1979]; $\Box\Phi$ from $\alpha(x) \propto \Phi(x)$ space-dependent chiral rotation, Σ-4 [Paper XX]. Composition step mechanically elementary; structural pattern identical to Theorem 7.1 gravitational hierarchy. Resolves the M → D upgrade banked at this row. **v5 notation**: dilaton rendered as the canonical Quantum Coherence Dilaton $\Phi = \omega(\psi-\bar\psi)^2$ (was $\Phi_{\mathrm{QC}}$); **v5 action**: verify the line-329 laser fragment `paper_ix_line329_upgrade_laser.tex` is present in the Paper IX source at application time.) |
| Shared origin of $\Lambda_{\mathrm{eff}}$ and $\eta$ from $(\psi-\bar\psi)^2$ asymmetry | §4 line 301 | D |
| **Baryogenesis master formula**: $\eta_{\mathrm{MEF}} = \mathcal{C}_{\mathrm{MEF}} \cdot (\pi^2/2\zeta(3)) \cdot (\zeta \cdot J \cdot \sigma_{\mathrm{wall}})/(T_c^4 \cdot \Delta\beta)$ | §5 eq line 350 (boxed) | M (line 357 verifies $\zeta = 0 \Rightarrow \eta = 0$ Rigorously) |
| Wall tension $\sigma_{\mathrm{wall}} = (\sqrt{2}/3) \times 530 \times v^2 \approx (247 \mathrm{GeV})^3$ | §5.4 line 382 (boxed) | D (line 388) |
| **Critical temperature $T_c = 500$ GeV** from KK + ζ-coupling thermal effective potential | §6 line 429 (boxed); line 433 | D (line 433: "naturally set by the radion mass scale") |
| Wall velocity friction budget — KK-tower contribution dominates (94.8%) | §7 line 482 | M (Gap G-BA6 explicit) |
| Dimensionless wall velocity $\Delta\beta = 3.50 \times 10^{-4}$ from friction | §7 line 498 (boxed) | D |
| **Baryon-to-photon ratio $\eta_{\mathrm{MEF}}/\eta_{\mathrm{obs}} = 1.03$** (zero free parameters) | §8 eq:central_result line 542 (boxed) | D (Master formula consequence; predictionbox) |
| First-order phase transition (no barrier; $S_3 = 0$ instantaneous nucleation) | §10 line 608 (boxed) | D |

### Paper X — S³-Sol JWST Anomalies v3 (`Paper_X_S3_Sol_JWST_Anomalies_v3.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| $S^3$ eigenvalue spectrum (standard) | §2.1 `sec:S3spectrum` | R (line 213) |
| Sol temporal geometry + Anosov flow + golden-ratio Lyapunov exponent | §2.3 `sec:Sol` line 248 | R |
| $\Omega_k$ closed-universe constraint from $S^3$ + BAO | §3.1–3.2 line 297, 313 | D / R ($S^3$ topology prediction R) |
| Linear growth on $S^3$ scale-independent for cold DM | §3.3 `sec:growth` line 323 | **R** (paper's own tag) |
| Halo mass function on $S^3$ | §3.4 `sec:halo` line 342 | D |
| **BAO scale $L_{\mathrm{BAO}} = e^{-3\pi/2} \cdot L_\Lambda \approx 146$ Mpc** | §4 line 379 (boxed) | D (the exponent factor $e^{-3\pi/2}$ traced to warp-per-internal-dimension) |
| BAO transfer function on $S^3$ | §4.4 `sec:BAO_transfer` line 423 | D |
| Four-environment correspondence (cluster / void / filament / sheet) | §5.2 `sec:four_env` line 482 | D (the four-fold structure); M (the physical correspondence) |
| Doubly-indexed mode spectrum from $K_8$ topology | §5.3 line 498 | D / Gap (sub-BAO comparison reserved for future work) |
| Anisotropic tidal correction from Sol shape modulus | §6 `sec:Sol_disk` line 519, 535 | D / M (mechanism vs projection) |
| **Sol cycle period $T_{\mathrm{Sol}} = 2\ln\varphi \cdot t_{\mathrm{dyn}}$** | §6.4 line 579 (boxed) | D (line 585) |
| **Disk formation alignment timescale $t_{\mathrm{align}} = 2 t_{\mathrm{dyn}}$** (resolves JWST early disks) | §6.5 line 597 (boxed); §1.2 line 153 | **R** (line 591: "Classification: Rigorous") |
| Quaternion identity $1 + i + (-1) + (-i) = 0$ (algebraic constraint) | §7 line 697 (boxed) | R |
| Pillowcase corner angular momentum balance | §7 line 609 | D |
| Holonomy-induced CMB low-multipole power suppression (~8% at ℓ=2, ~14% at ℓ=3) | §1.2 line 155 | (referenced as observational consistency, not formally classified in scan) |
| Dark matter abundance $\Omega_{\mathrm{DM}}/\Omega_b \in [4.2, 6.5]$ from Paper VIII coupling ratio | §3.1 line 283 | **G** (line 283: "the precise value requires thermal history modelling; Classification: Gap") |

### Paper XI — Mock Modular Partition Function of K_8 v3 (`Paper_XI_Mock_Modular_K8_v3.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Five Chern numbers of $K_8$ ($c_4 = \chi = 12$, etc.) computed by polynomial algebra in $H^*(K_8, \mathbb{Z})$ | §2.2 line 330 | **R** (paper: "verified by six independent consistency checks: Noether, signature, $\hat{A}$-genus, Betti sum, intersection form eigenvalues, χ product formula") |
| Spin$^c$ twist breaks Liu rigidity by accessing $A_0, A_1, A_2$ lower cohomological components | §3.2 `subsec:rigidity-breaking`; line 473 | **R** |
| **Appell–Lerch sum identification + factorisation** $S(\tau,z) = (y - y^{-1}) \cdot \mu(\tau,z)$ | §4.1 line 540 (boxed); line 549 | **R** (Zwegers Theorem 1.3) |
| **Odd divisor function** $d_{\mathrm{odd}}(n) = \#\{d \mid n : d \text{ odd}\}$ as central Appell–Lerch coefficients; Dirichlet series $\zeta(s)^2(1-2^{-s})$ | §4.2 line 555; line 574 | **R** (combinatorial identity + Euler product, verified to $q^{50}$ and at $s = 2, 3$) |
| $E_2$ anomaly $E_2(-1/\tau) = \tau^2 E_2(\tau) + 12\tau/(2\pi i)$ as unique source of mockness | §4.3 line 601 | **R** (Shimura 1973) |
| Mock Jacobi form classification of $Z_{K_8}^{\mathrm{Spin}^c}(\tau,z)$ — weight 0, level 2, mock theta order 2 | §4.4 Proposition `prop:mock` (line 607); line 616 | **D** (numerical verification at physical $\tau_2$; algebraic origin in $E_2$ anomaly via Appell–Lerch) |
| **Two principal topological identities**: $N_{\mathrm{gen}} = \mathrm{ind}(D_{\mathrm{Spin}^c}) = 3$, $\theta_{\mathrm{QCD}} = \hat{A}(K_8) = 0$ | §6 line 855 (boxed) | R |
| **Algebraic dark matter ratio $\Omega_{\mathrm{DM}}/\Omega_b = 3 + \sqrt{6} = 5.4495\ldots$** | §6 Theorem `thm:dm-ratio` (line 694); line 869 (boxed); line 882 line 908 | **R** (algebraic identity $\cos(\pi/12) + \cos(5\pi/12) = \sqrt{6}/2$; phase assignments from Spin$^c$ holonomy) |
| Kloosterman alternation $K_2(n,-1;2) = (-1)^n$ — **unconditional statement** | §7 line 1010 | **[D]** — values verified computationally; canonical derivation at **Paper XXI §7** `thm:alternation`. *(Rules 1–4, the $\dodd$ selection rules, deleted at v16 — canonical at **Paper 4** §6: `thm:projector`, `prop:rules`. Paper 4's `prop:alternation` proves only the **conditional characterisation** $K_2(n,-1;2) = (-1)^n \iff \bar\nu(\gamma_{1,2}) = -1$ — a weaker, different theorem; this row is unaffected.)* |
| **{2,3} arithmetic signature — scoped (Register 9, 7 Nov 2026)**: the listed topological quantities ($N_{\mathrm{gen}}$, $n_{\mathrm{eff}}$, $\chi$, $\Delta$, $\Lambda$-exponent, $\eta$-denominator; and the Note's list: $\chi$, flux (3,6), the $\tau_2$ cubic coefficients) involve only primes 2 and 3; **not all Chern numbers** ($c_1^2c_2[K_8] = 204 = 2^2\cdot3\cdot17$, $c_1c_3 = 60$). The universal wording in Paper XI §7.5 and the Note §2 is to be narrowed. M1 §8.1 derives 2, 3, 5 as outputs | §7.5 line 1031 | **R** (as scoped; prime 2 from Z_2 orbifold and $\chi(S^2)$; prime 3 from the three imaginary units, $\chi(\mathbb{CP}^2) = 3$) |
| Eight-channel encoding structure + $q^0$ dominance + 9 exact numerical SM matches | §6 line 821 | encoding structure D; numerical matches R; "SM = $q^0$ sector" interpretive M |
| KK mass tower predictions: $m_{\mathrm{KK,1}} \approx 7.6 \times 10^{15}$ GeV, mass ratio $1 : \sqrt{3} : \sqrt{6}$ | §10 line 1115, 1118 | NP-4 D / NP-5 R |
| Sum of neutrino masses $\sum m_\nu < 120$ meV consistency check | §10 line 1095 | **M** (within Planck 2018 bound; testable by CMB-S4) |
| Proton stability prediction (no proton decay) | §10 line 1138 | **R** |
| Falsification: LISA stochastic GW from electroweak-era bubble collisions should NOT be detected | §10 line 1130 | **D** |

### Paper XVI — Fine Structure Constant from K_8 (`Paper_XVI_Fine_Structure_Constant_from_K8_v7.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **MEF internal manifold $K_8$ definition + cohomology ring** | §2.1 Definition `def:K8` (line 276); §2.2 line 287 | R |
| Total Chern class of $K_8$ + Chern numbers | §2.2 line 297 | R |
| **Vanishing topological index** ($\hat{A}$-genus + index theorem) | §2.4 Proposition `prop:vanishing` (line 322) | R |
| 12D metric form for $\mathcal{M}_{12}$ | §4.1 line 375 | D |
| **Gauge kinetic warp exponent** Proposition `prop:warpexp` | §4.1 line 381 | R |
| **Bulk integral is transcendental** (without brane localisation) | §4.2 Proposition `prop:bulkfail` (line 397) | D |
| **Brane localisation at Q-wall fixed point $\omega = 0$**: nullifies warp factor $e^{6A(0)} = 1$ — connects to Appell–Lerch anomaly carrier vanishing at half-period (Paper XV) | §4.3 Definition `def:brane` (line 409); Proposition `prop:warpelim` (line 413); §4.4 corollary `cor:unwarped` (line 421); line 429 | D / R |
| Killing vector scaling on $\mathbb{CP}^2$ and $S^2$ | §4.5 Proposition `prop:killing` (line 434) | D |
| Polynomial $\tau_2$-dependence as diagnostic for coupling-type quantities | §4.5 line 454 (Paper XX cross-ref) | D |
| **$\mathbb{CP}^2$ gauge kinetic integral** (intersection number on Fubini–Study) | §5.1 Proposition `prop:CP2int` (line 464) | R |
| **$S^2$ topological weight** ($\chi(S^2) = 2$) | §5.2 Proposition `prop:S2chi` (line 481) | R |
| Orthogonality of product structure | §5.4 line 505 | R |
| **Master fine-structure formula $\alpha^{-1}(M_c) = [\int_{\mathbb{CP}^2} c_1(\mathcal{O}(3))^2 \cdot \chi(S^2) \cdot \chi(T^2/\mathbb{Z}_2) / \chi(K_8)] \cdot \tau_2^2 (1 + \tau_2^2) = 46.37$** | §1.4 line 155 (boxed); §6 line 682 (boxed) | R/D |
| **Fine-structure constant at Thomson limit $\alpha^{-1}(0)\ | _{\mathrm{MEF}} = 136.93$ vs experimental 137.036 (0.08% deviation)** | §1.4 line 159 (boxed); §7 line 811 (boxed) |
| Normalisation constant $C_{\mathrm{norm}} = 3$ | §5 (within fibre integrals) | R |
| Three identities — $c_1(L) = 3$ (topology), $N_{\mathrm{gen}} = 3$ (physics), $C_{\mathrm{norm}} = 3$ (normalisation) — coincide as the same Chern class of $\mathbb{CP}^2$ anticanonical bundle | §3.1 footnote line 440 | R |

### Paper XVII — Yang–Mills Existence and Mass Gap (`Paper_XVII_Yang-Mills_Existence_and_Mass_Gap_v6.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Theorem A (Existence)**: KK reduction on $K_8$ yields 4D Euclidean QFT on $\mathbb{R}^4$ satisfying OS-0,1,2,3 axioms | §1.3 Theorem A (line 194); §3 OS verification | **D** (internal OS verification D; KK transmission D via standard Glimm–Jaffe + Appelquist) |
| **THEOREM B (MASS GAP) — THE CANONICAL AND SOLE SITE FOR THE YANG–MILLS MASS GAP.** The 4D Euclidean theory $\mathcal{T}$ reconstructed from the $q^0$ sector is uniquely pure **$SU(3)$** Yang–Mills, $\theta_{\mathrm{QCD}} = 0$, zero tunable parameters; $\mathcal{T}$ has a strictly positive mass gap $\Delta > 0$. **Two routes.** **Route A** ($a$-theorem chain, `thm:massgap`, Steps 1–8) is **[M]-BLOCKED at Step 6** by the Dead-End CFT Bootstrap Lemma (`lem:bootstrap`, **[M]**) and does **not** close on its own. **Route B** (corner-geodesic, `subsec:quatderivation`) is **THE OPERATIVE CLOSURE** and imports **Paper XXI §7** Theorem B. Positivity decomposes as: corner distinctness [R] (Paper XX Σ-3) ∧ Hopf–Rinow [R] ∧ the M-6/M-8 spectral identification via `thm:index` **[D]** — the whole weight sits on the [D] leg. ✅ **G-YM-2 CLOSED (12 Jul 2026) by the transfer proposition `prop:gauge-transfer` (**Paper XVII v6, line 915**).** The Sp(1)-dependence audit refuted the null: $\Delta > 0$ uses **five inputs — 2-torsion structure of $\sigma$ on $\Ttwo$; Hopf–Rinow; $\mathcal{M}$-6; $\mathcal{M}$-8; `thm:index` — and none mentions the gauge group.** The gauge group enters at exactly one place, `thm:UV`, **downstream** of the positivity argument. Hence Route B closes Theorem B for **$SU(3)$**. $\mathrm{Sp}(1)$ is the **structure group of the quaternionic fibre**, never "the Yang–Mills gauge group". **⚠️ SCOPE LIMIT (`cor:gauge-scope`): only the EXISTENCE claim is gauge-group independent. The numerical VALUE of $\Delta$ depends on the Spinᶜ corner selection ($\mathrm{Sp}(1) \to U(1)$) and is NOT gauge-group independent.** The Clay problem asks only for existence. **⚠️ Operative justification ruled (`rem:which-identification`):** the identification *corner distance = mass gap* has **two** justifications and only one transfers — XXI's **gauge-theoretic** one (SU(2) excitations transit corners) does **NOT**; XVII's **spectral** one (`thm:index`) **does**, and is operative. XXI's is demoted to physical motivation. | **Paper XVII, Theorem B** (line 200); Route B at `subsec:quatderivation` (line 878) | **[D]** — unconditional, G-YM-2 discharged by `prop:gauge-transfer`. |
| **`rem:which-identification` — which justification is operative.** The identification *corner distance = mass gap* has **two rival justifications and only one transfers.** XXI's is **gauge-theoretic** ("SU(2) excitations must transit to an orthogonal corner") — **specific to $SU(2)$; does NOT transfer to $SU(3)$**; demoted to physical motivation. XVII's is **spectral** (`thm:index`: $\dodd(n)$ counts one-particle states at mass level $n$) — **gauge-group agnostic; transfers**; **declared operative**. | **Paper XVII** `rem:which-identification` (v5, line 1007) | **[R]** |
| **Theorem C (Cluster property)**: mass gap implies isolated vacuum + OS-4 cluster decomposition with exponential decay $\sim e^{-\Delta\ | x\ | }$ |
| **CP Topological Bridge Theorem** (Paper I/V topological identifications lift to YM mass gap) | §3.2 Theorem `thm:bridge` (line 451) | D |
| **Mock Modular Reflection Positivity (OS-2)** | §3.3 Theorem `thm:OS2` (line 496) | (proves OS-2 axiom from mock-modular completion) |
| **Continuum Exhaustion Theorem** | §3.4 Theorem `thm:cont` (line 560) | (final OS-axiom verification) |
| OS-0, OS-1, OS-3 verification | §3.5 line 574 | D |
| **UV Identification Theorem** ($q^0$ sector = pure SU(3) YM with θ = 0) | §4 Theorem `thm:UV` (line 625) | (key "topological rigidity" theorem) |
| Komargodski–Schwimmer a-theorem (cited) | §5 Theorem `thm:aKS` (line 664) | R |
| Dead-End CFT Bootstrap Lemma (Route A bootstrap exclusion) | §5 lem:bootstrap | **M** (paper's own tag) — Route A's closure conditional on this lemma; bypassed by Route B |
| **Route A — $a$-theorem chain** (`thm:massgap`, Steps 1–8): UV identification [D] → $a_{\mathrm{UV}} = 248/45$ [R] → Komargodski–Schwimmer $a$-theorem [R/D] → topological exclusion of Banks–Zaks/Goldstone/Coulomb/$\theta = \pi$ [R/D] → Dead-End constraint [D] → **Step 6 bootstrap exclusion [M]** → trivial IR [D] → Hofman–Maldacena no-massless-states [R]. **Route A does NOT close Theorem B**: Step 6 rests on `lem:bootstrap`, **[M]**, which XVII itself declares bypassed by Route B. Route A also imports **Paper XXI §6/§3.3** via `rem:MEFsectors` (Step 3) — so the routes are independent *in machinery*, **not in foundations**; both consume XXI's corner structure. | **Paper XVII §5.4** `thm:massgap` (line 814); `lem:bootstrap` (line 757) | **[M]-blocked at Step 6** |
| Paper XXI §6 Theorem B restated | §6 Theorem `thm:XXI-B` (line 882) | R |
| Orbit-signature derivation of Kloosterman alternation | §6 Theorem `thm:XXI-alternation` (line 888) | (key intermediate result) |
| Hofman–Maldacena bounds (cited) | §5 (line 142) | R |
| Bruinier–Funke Theorem (cited) | §2.6 thm:BF (line 397) | R |

### YM-Foundation-A — A gauge-independent spectral gap from the two-torsion geometry of a torus quotient (`YM_Foundation_A.tex`)

**CANONICAL.** Submission track: Annales Henri Poincaré. 18 pp.; seven-certificate Lean 4 suite (zero errors, zero `sorry`); XeLaTeX. **Rebuilt from source (v18).** Twelve formal statements (three definitions, five lemmas/propositions, one theorem, one corollary, one remark).

**The paper's own division, maintained explicitly throughout.** An **unconditional part** — four statements, resting on nothing but the geometry and the arithmetic. A **conditional part** — the class $\class$ of Kaluza–Klein-reduced theories, defined through declared spectral hypotheses, over which the gap transfers.

**Consumed from earlier papers (no rows here — PI ruling (a), v18).** The $\dodd$ **octave symmetry** and **protected values** of `prop:doddprops`(iii),(v), and the **odd-part identity** of `def:dodd` — canonical at **Paper 5** `lem:dodd`. The $\dodd$ **multiplicativity on coprimes** of `prop:doddprops`(iv) — canonical at **Paper 4** `prop:rules`(3), `cor:oddprimes`. YM-A reproduces all of these in-document under the island rule.

| What is derived | Site | Rigour |
|---|---|---|
| **The Setting.** $\T^2/\sigma$ the pillowcase; $(M,g)$ compact connected Riemannian with **continuous** metric; $\iota$ a continuous injection of the pillowcase onto a fibre of $M$; $c$ the image of one distinguished corner; $\Delta$ the minimum of the three geodesic distances $\dist_M(c, c')$ to the remaining corners | `def:setting` §2 | **(declared setting)** |
| **★ Corner distinctness — CANONICAL SITE.** $\mathrm{Fix}(\sigma) = \{(0,0), (\tfrac12,0), (0,\tfrac12), (\tfrac12,\tfrac12)\}$ — **exactly the four two-torsion points, pairwise distinct in $\T^2$**. Consequently the pillowcase has exactly four corners and their images under $\iota$ are four **distinct** points of $M$. *(Papers 3 and 4 set up the four fixed points; neither states distinctness as a lemma. This is the statement the gap argument consumes.)* | **`lem:corners` §2** | **[R]** · CERT |
| **★ Positivity of the corner gap — CANONICAL SITE.** In the Setting, each of the three distances $\dist_M(c,c')$ is **strictly positive**, and hence $\boxed{\Delta > 0}$. Unconditional: it rests on corner distinctness and the continuity of the metric alone — **no gauge theory, no quantum field theory, no gauge group enters** | **`lem:positivity` §2** | **[R]** · CERT |
| **$\dodd$ positivity — CANONICAL SITE.** $\dodd(1) = 1$ and $\dodd(n) \geq 1$ for all $n \geq 1$. *(Trivial in themselves; they are what makes the degeneracy function of $\class$ nowhere-vanishing, and so are load-bearing for the identification of $\Delta$ with the lowest mass.)* **The remaining clauses of `prop:doddprops` — octave symmetry, protected values, multiplicativity — are canonical at Papers 5 and 4 (PI ruling (a))** | **`prop:doddprops`(i),(ii) §3** | **[R]** · CERT |
| **The level-two Appell–Lerch sum** $\mu(\tau,z) = \sum_{n\geq1} q^n/\bigl((1-yq^n)(1-y^{-1}q^n)\bigr)$, as a formal power series in $q$ with coefficients in Laurent polynomials in $y$ | `def:appell` §3 | **(definition)** |
| **★ Appell–Lerch central coefficients — CANONICAL SITE.** $[y^0 q^m]\,\mu(\tau,z) = \dodd(m)$ for **every** $m \geq 1$. *(Paper 4 carries Appell–Lerch material but does not state this identity.)* This is the bridge from the arithmetic to the spectral degeneracies | **`prop:appell` §3** | **[R]** · CERT |
| **★ Vanishing of odd cohomology on the framed moduli — CANONICAL SITE.** The framed moduli space $\Mod(r,n)$ admits a decomposition into **affine cells of even real dimension** (Białynicki-Birula); consequently $H_{2j+1}(\Mod(r,n),\Z) = 0$ for all $j$, and the Euler characteristic **equals the absolute Betti count**: $\chi = \sum_j(-1)^j b_j = \sum_j b_{2j} = \sum_j b_j$. **There are no cancellations — the counting is absolute.** *(Distinct object from Paper 5 `prop:betti`, which is the Betti sequence of $\Keight$.)* | **`thm:betti` §4**; `eq:chiabs` | **[R]** · CERT |
| **The class $\class$ — CANONICAL SITE.** A Kaluza–Klein-reduced theory over the Setting is a four-dimensional theory presented through its **one-particle spectral data**: a degeneracy function $m: \N \to \N$, a mass assignment, and the mass set $\mathcal{S}(\thy)$ of non-vacuum one-particle states. The hypotheses defining $\class$ are **declared, not derived**, and are held to explicitly | **`def:class` §5** | **(declared class)** |
| **Second route to the absence of a paired sector** (weight-zero Liouville): under a remark-local modular-completion hypothesis, the paired sector is excluded independently of the primary argument | `rem:secondroute` §5 | **[D \| remark-local hypothesis]** |
| **Identification of $\Delta$ with the lowest mass — CANONICAL SITE.** For $\thy \in \class$: **$\Delta$ is the mass of the lowest non-vacuum one-particle state** of $\thy$ — the least element of $\mathcal{S}(\thy)$ | **`prop:identification` §6** | **[D \| $\class$]** |
| **★ Gauge-group independence of the corner gap — THE CANONICAL AND SOLE SITE.** For $\thy \in \class$ with gauge group $G$: **(i)** $\Delta > 0$; **(ii)** $\Delta$ is the mass of the lowest non-vacuum one-particle state; **(iii) neither (i) nor (ii) refers to $G$.** Consequently **a positive mass gap holds for every theory in $\class$, uniformly in the gauge group.** The gauge group is a phantom binder: the proof term is constant in $G$ | **`prop:transfer` §6** | **[D \| $\class$]** · CERT (parametricity machine-checked; $G$ a phantom binder, proof term constant in $G$ by `rfl`) |
| **★ Scope — the value of $\Delta$ is NOT gauge-group independent. CANONICAL SITE.** `prop:transfer` establishes the gauge-group independence of the **existence** claim $\Delta > 0$ **only**. The **numerical value** of $\Delta$ depends on which corner is distinguished and on the induced metric data — the selection $(g, \iota, c)$ of `def:setting` — and is **therefore not a gauge-group invariant. No such claim is made here.** *(A real scope limit, stated in-document rather than papered.)* | **`cor:scope` §7** | **[R]** — the limitation itself |

**Relation to Paper XVII (fossil).** YM-A does **not** supersede Paper XVII Theorem B. XVII claims the Yang–Mills mass gap for pure $SU(3)$ reconstructed from the $q^0$ sector; YM-A proves an **unconditional geometric statement** ($\Delta > 0$ from corner distinctness and metric continuity) plus a **conditional transfer** over a declared class, with the value of $\Delta$ explicitly disclaimed. **Different claims; both rows stand.**


### Paper XVIII — Navier–Stokes Existence and Smoothness v7 (`Paper_XVIII_Navier_Stokes_v7.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Theorem A (Global Regularity on $S^3$)**: 3D incompressible Navier–Stokes solution on $S^3$ with smooth initial data, viscosity $\nu > 0$, arising as holomorphic projection of harmonic Maass form $\hat{f}(\tau, \bar\tau)$ encoding volume-preserving diffeomorphisms on $\mathcal{M}_{12}$ at the Q-wall, is globally smooth $\mathbf{v} \in C^\infty(S^3 \times [0,\infty))$ | §1.3 Theorem A (line 200) | **D** (proof chain: 12 steps; 7 rigorously established + 5 derived from MEF axiomatisation — line 204) |
| **Theorem B (Domain Extension)**: regularity extends to $T^3$ via $K_8$ topological universality + to $\mathbb{R}^3$ via stereographic conformal equivalence | §1.3 Theorem B (line 206) | **D** (standard conformal geometry — line 210) |
| Topological viscosity = Quantum Coherence Dilaton identification ("the dilaton is viscosity") | §3.1 `sec:dilaton-viscosity` line 485 | (key novel identification; foundational for the whole approach) |
| Time-Propagation Lemma (KK eigenmode evolution preserves polynomial growth) | §3.2 lem:time-prop (line 519) | (key intermediate) |
| Dispersion relation from KK reduction on $K_8$ | §3.3 line 557 | D |
| **Diophantine Cascade Sieve** (modular selection rule preventing nonlinear energy cascade to singularity) | §3.4 line 579 | (the core mechanism — Fourier-type harmonic constraint preventing blow-up) |
| Sobolev embedding on $S^3$ (standard but weaponised for gain) | §3.5 line 625 | R |
| Sol flow on hyperbolic plane $\mathbb{H}$ | §4.X Theorem `thm:sol` (line 640) | (geometric setup) |
| Cauchy convolution preserves polynomial growth | §X Theorem `thm:cauchy` (line 704) | R |
| Exponential defeats polynomial (key inequality used in gradient bound) | §X Theorem `thm:expsupr` (line 727) | R |
| Beale–Kato–Majda criterion (cited) | §2.7 thm:BKM (line 472) | R |
| **Modular covariance at refined level $\Gamma_0(36)$** with character $\chi_{-3}$ via Spin$^c$ + Serre–Stark + Aharonov–Bohm phase $W_\psi(Y) = e^{iY\pi}$ | §2.5 (H1) line 431 | **R** (refined level + multiplier from Paper XI §4.5; resolves Serre–Stark dimensional collapse $\dim S_{3/2}(\Gamma_0(4)) = 0$) |
| Harmonicity of $\hat{H}$ (Zwegers + character refinement does not affect $\Delta_{1/2}\hat{H}$) | §2.5 (H2) line 433 | R |
| Linear exponential growth at cusps (Hardy–Wright bound on $d_{\mathrm{odd}}$) | §2.5 (H3) line 435 | R |
| Bruinier–Funke applicability with three-route confirmation (Lemma `lem:bf-applicability`, Paper XV Theorem 8.6, Paper XXII Theorem 9.9) | §2.6 line 450 | R |
| **Navier–Stokes Global Regularity** (Synthesis Theorem) | §X Theorem `thm:main` (line 787) | D |
| **NS shadow is forced, not imposed** | §X Theorem `thm:forced-shadow` (line 945) | (resolves PI core hypothesis: 3D NS is a shadow of 4D well-behaved object — Zwegers shadow theorem applied to volume-preserving diffeomorphisms) |

### Paper XIX — Riemann Hypothesis v6 (`Paper_XIX_Riemann_Hypothesis_v6.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Theorem A (Riemann Hypothesis, conditional on MEF axioms)**: All non-trivial zeros of $\zeta(s)$ have $\Re(s) = 1/2$ | §1.3 Theorem A (line 189) | **D** — paper line 193: "14-step proof chain; 5 rigorously established (number theory + automorphic forms), 5 derived from MEF axiomatisation, 1 motivated, 1 axiom (Shadow Principle)" |
| **Theorem B (Conservation Law)**: $F(\sigma) = \varphi^{-2\sigma} + \varphi^{-4\sigma} = 1 \Leftrightarrow \sigma = 1/2$; $F$ strictly decreasing ⇒ unique solution | §1.3 Theorem B (line 195); §5.X Theorem `thm:conservation` (line 564) | **R** — paper line 203: "Elementary algebra"; the golden ratio selects the critical line as the unique conservation locus |
| Spectral hierarchy parameter $\kappa$ from dilaton gradient | §2.4 line 321 | D |
| Arithmetic of $d_{\mathrm{odd}}(n)$ — Dirichlet series, Hardy–Wright bounds | §3.3 (lines 372–392) | R |
| **Dimensional Firewall — Selberg Class Trap**: classical analytic number theory cannot reach $\sigma = 1/2$ from above because the Selberg class is $\sigma > 1$ closed | §4 (lines 418–445) | R / D — Proposition `prop:firewall` (line 434) |
| **Triple Twisted Fusion Theorem** + GL(3) lift to $E_0(\tilde M, s) = S_+(s) + S_-(s)$ | §5 Theorem `thm:fusion` (line 461); GL(3) lift §5 line 487 | **D** (paper's tag) — uses GL(2,F_2) ≅ W(A_2) ≅ S_3 (line 468) and Sol monodromy mod 2 ↔ Coxeter element (line 469) |
| Holomorphy for $\sigma > 0$ | §6 Theorem `thm:holomorphy` (line 535) | **R** |
| **Algebraic fixed-locus recasting** | §7 Theorem `thm:algrec` (line 758) | D |
| **Riemann Hypothesis (synthesis main theorem)** | §7 Theorem `thm:RH` (line 777) | D |
| At every $\zeta$-zero $\rho$: $S_-(\rho) = 0$ AND $S_+(\rho) \neq 0$ — zero is a projection artefact | §7 line 768 | D (Shadow Principle in $s$-space) |
| Topological lock $\Phi_{\mathrm{QC}} \neq 0 \Rightarrow \sigma > 0$ | §7 line 775 | D |
| Sol embedding via S^1_Sol × S^3 — completes $s$-space | §6 `sec:completion` line 487 | D |

### Paper XX — New Axioms for Old Problems (`Paper_XX_New_Axioms_for_Old_Problems_v10.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Σ-0 (Universal Symmetry)** | §5.X line 335 | (axiom — Lie–Cartan kinship) |
| **Σ-1 (The Manifold $\mathcal{M}_{12}$)** | §5.X line 348 | (axiom — Riemann/Kaluza lineage) |
| **Σ-2 (The Fundamental Shapes)**: $\mathbb{CP}^2$, $S^2$, $T^2$, $S^3$ as fundamental irreducible components | §5.X line 363; line 1927 | (axiom — Lie–Cartan kinship; **Motivated** for the closure claim) |
| **Σ-3 (The Pillowcase)** | §5.X line 430 | (axiom) |
| **Σ-3a (The Quaternionic Layer)** | §5.X line 452 | (axiom — handed off to Paper XXI for development) |
| **Σ-4 (The Quantum Coherence Dilaton)**: $\Phi_{\mathrm{QC}} = \omega(\psi - \bar\psi)^2$ — derived coupling from three independent fields | (per ref line 1932) | (axiom — Faraday/Maxwell + Yang–Mills lineage; **Motivated**) |
| **Σ-5 (The Shadow Principle)**: 3D/4D phenomena are projections of higher-dimensional simpler structure | (per ref) | (axiom — Jacobi/Ramanujan/Zwegers lineage) |
| **Σ-6 (Shape Determinism)** | (referenced in Paper XXII as conditional axiom) | (axiom) |
| **Σ-7 (Complexity-as-projection)** | line 1937 | (axiom; **Motivated** — Riemann lineage) |
| **Σ-8 (Coherence drive $\omega$)**: continuous parameter ordering systems classical ↔ quantum ↔ post-quantum | line 1942 | (axiom; **Motivated, novelty flagged** — paper acknowledges no prior precedent) |
| **Σ-P (Pillowcase boundaries)**: transparent / puncture / impermeable types | line 1947 | (operational axiom; **Motivated** — Satake/Thurston orbifold kinship) |
| **Σ-S (Shadow channels)**: gravity / $\omega$ / mock modular completion | line 1952 | (operational axiom; **Motivated** — operational companion to Σ-5) |
| **Σ-T (Two transparent fields)**: gravity + $\omega$ topologically forced by 2 homology generators of $T^2$ | line 1957 | (axiom; **Motivated** — gauge-theory lineage) |
| **Five realisations of Fixed-Point Vanishing** as common geometric root: (1) Kloosterman sum (universal cause); (2) Arithmetic Comb Filter; (3) Rademacher–Voronoi duality; (4) Zwegers completion; (5) MEF functor (Paper XXII §10.1) | §7 line 868; line 882 | **D** |
| **Brane Vanishing Theorem** (why classical approaches fail) | §2.4 line 234 | (paper's framing theorem — explains why 165 years of Riemann/YM/NS work is "trapped inside the firewall") |
| Each instance also admits Rademacher small-modulus cusp expression paired with Kawasaki fixed-point expression | §7 line 694 | D |
| Polynomial $\tau_2$-dependence ↔ coupling-type quantities; transcendental (η-function) $\tau_2$-dependence ↔ topological indices | §2 (programme-wide diagnostic; cited by Paper XVI line 454) | D |
| Yang–Mills closure summary: 7R / 5D / 2M / 1G | §10 line 919 | (paper's summary tag) |
| Navier–Stokes closure summary: 8R / 4D | §10 line 923 | (paper's summary tag) |
| Riemann closure summary: 4R / 5D / 1M | §10 line 927 | (paper's summary tag) |

### Paper XXI — The Quaternionic Unification on K_8 (`Paper_XXI_The_Quaternionic_Unification_on_K8_v8.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Theorem A (Riemann Hypothesis closure)** | §2.1 (line 348); §6 `sec:RH` (line 566) | **D** — paper line 354: "conditional on the MEF axioms" |
| **THEOREM B (CORNER-GEODESIC)** — the geometric identification of $\Delta$. The Yang–Mills mass gap is the **minimum geodesic distance between distinct pillowcase corners** of $\Ttwo/\Ztwo$ under the metric induced from $\Keight$: $\Delta = \mathrm{dist}_{\Keight}(C_{\mathrm{vac}}, C_\perp)$. Vacuum corner selected by the $\Spinc$ twist. | **Paper XXI §7** `sec:YM` (line 629). | **[D]** |
| **ORBIT-SIGNATURE DERIVATION OF THE KLOOSTERMAN ALTERNATION** (`thm:alternation`): $(V_{\mathrm{Aut}} \times Z)$ acting on $Q_8$ decomposes into four degree-2 orbits $\{\pm1\},\{\pm i\},\{\pm j\},\{\pm k\}$; one full covering period of $\Ttwo$ = two half-period translations = $(\cdot i)^2 = -1$; over $n$ wraps, $(-1)^n = K_2(n,-1;2)$. **✅ RIGOUR RULING (12 Jul 2026): [D].** Reason, from the proof itself: the **algebra** is [R] — $(\pm i)^2 = -1$ for every generator, so the sign is genuinely convention-free — **but the theorem rests on two modelling identifications that are not theorems**: (a) *"the instanton number $n$ **corresponds to** a full topological covering period of $\Ttwo$, not a half-period"*, and (b) *"each half-period **lifts** to the fibre as right-multiplication by a pure imaginary unit quaternion"*. Both are geometric identifications, hence **[D]**. **A paper may not upgrade another paper's rigour tag: the canonical site (XXI §7) sets it, and consumers inherit.** | **Paper XXI §7** `thm:alternation` | **[D]** — ruled |
| **Theorem C (Navier–Stokes regularity)** | §2.1 (line 368); §8 `sec:NS` (line 642) | **D** — line 370 |
| **Theorem D (Unification Theorem)**: A, B, C are three faces of a single index-theoretic statement | §2.2 (line 372); §9 `sec:unification` (line 782) | **D** conditional on MEF axioms — line 384 |
| **Hamilton identity $i^2 = j^2 = k^2 = ijk = -1$** locked to pillowcase corner-product topology | §8.1 `subsec:item22` line 655 (Item 2) | (key intermediate — pillowcase encodes Hamilton's quaternion identity) |
| **Spin$^c$ as Quaternion-to-Complex reduction** ($\Sp(1) \to U(1)$ symmetry breaking by $c_1(L) = 3h$) | §2.6 `subsec:spinc` (line 504); line 513 | D |
| **Zwegers–quaternion dictionary** (Item 1 for NS) | §8.2 `subsec:item21` line 683 | D |
| **NS regularity consequence** (Item 3) | §8.3 `subsec:item23` line 742 | D |
| Almost-quaternionic non-strict QK obstruction = obstruction to classical modularity (handed off to Paper XXII) | §2.4 line 480 | D |

### Paper XXII — Almost-Quaternionic / Mock Modular Correspondence (`Paper_XXII_Almost_Quaternionic_Mock_Modular_Correspondence_v5.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Theorem 1 (Almost-Quaternionic / Mock Modular Correspondence)**: spectral push-forward functor $\mathcal{F}: \Gamma_{U(1)}(M, \mathcal{W}_4) \to \mathrm{Cusp}_{2-k}(\Gamma_0(N))$ canonically determined by the almost-quaternionic structure + Spin$^c$ twist | §2.1 Theorem `thm:main` (line 297) | **D** conditional on MEF axioms (Swann decomposition for $n = 3$ is R) |
| Swann decomposition $\mathrm{T} = \mathcal{W}_1 \oplus \mathcal{W}_2 \oplus \mathcal{W}_3 \oplus \mathcal{W}_4$ for $n = 3$ | §3.1 (line 428) | **R** (Swann 1989; standard for $n \geq 3$) |
| Quaternionic fundamental 4-form $\Omega_M$ | §3.4 (line 444) | R |
| **Theorem `thm:exact-seq` (Exact sequence compatibility)**: pointwise + section-level compatibility | §X (line 785); §1 line 272 | **D conditional on Σ-6** (Shape Determinism) — paper explicit at line 272 |
| Hypercharge anchoring of $c_1(L) = 3h$ | §6.1 `subsec:c1-hypercharge` (line 689) | R |
| Kaluza–Klein push-forward construction | §5.3 `subsec:kk-pushforward` (line 646) | D |
| **Corollaries: NS, YM, RH geometric readings** | §2.6 lines 379–381 | D (each via the corresponding Clay paper) |

### Paper XXIII — Black Hole Singularities (`Paper_XXIII_Black_Hole_Singularities_v4.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Singularities are inevitabilities IN GR, not statements about physical reality | §2.2 line 255 | R |
| Embedding existence (any spacetime → higher-dimensional manifold via Clarke 1993); MEF physical identification with $\mathcal{M}_{12}$ | §2.3 line 263 | R (existence); **M** (physical identification) |
| **Q-wall projection**: black hole singularity as 4D shadow of $\mathcal{M}_{12}$ smooth structure | §2.4 line 283 | **D** (conditional on Σ-1, Σ-5, Σ-P of Paper XX) |
| **Paper XVIII Navier–Stokes template applied to gravity** ($\Phi_{\mathrm{QC}}$ = "spacetime viscosity") | §3 (lines 289–352) | D (Paper XVIII conditional on MEF axioms; Zwegers 2002 + Bruinier–Funke 2004 + BKM 1984 R) — line 304 |
| BH singularity / NS blow-up structural analogy (BKM-type criterion + completion mechanism) | §3.3 line 327; line 344 | D |
| **$\Phi_{\mathrm{QC}}$ as Planck scale / spacetime viscosity** | §4.3 (lines 398–419) | D conditional on Σ-3, Σ-4 of Paper XX |
| **Topological protection of $\Phi_{\mathrm{QC}}$**: Proposition `prop:Q-nonvanishing` | §4.2 line 396 | D |
| Master Equation regularisation through singular locus via $\Phi_{\mathrm{QC}}$-term | §4.4 line 421; line 434 |  |
| **Black hole formation as orbifold rupture** (Paper IX mechanism) | §5.1 line 442; line 453 | D (Paper IX conditional on MEF axioms; F1 has null-GW-at-LISA prediction) |
| **Gravitational collapse as local orbifold rupture** | §5.2 line 455; line 473 | M (structural identification); D (conditional on Paper IX, Paper VIII) |
| **Horizon as phase boundary** (Q-wall ↔ AQ-wall transition) — falsifiable: any firewall or bounce observation refutes MEF | §5.4 Proposition `prop:horizon-chart` line 488; line 494 | **D** (falsifiable prediction) |
| No firewall, no bounce | §5.4 line 488 | D |
| **Black hole interior as AQ-wall geometry**: dark hydrogen + AQ-EOS | §6.1 line 515 ; line 527; line 540 | D (Paper VIII); |
| Hawking information paradox (statement) | §7 line 562 | R |
| **Information preservation via Z_2 symmetry** ($\psi \leftrightarrow \bar\psi$ symmetric Hawking radiation) | §7.2 line 580 | D (Paper IX Z_2 + Paper XX Σ-0) |
| **Hawking radiation as $\hat H = f + g^*$ (mock modular structure)** | §7.3 line 591 | D (Paper XVIII identifies $\hat H = f + g^*$; physical application direct) |
| Spectrum modulation prediction | §7.4 line 607 |  |

### Paper XXIV — Hilbert's Programme v3 (`Paper_XXIV_Hilberts_Programme_v3.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Hilbert's vision (statement) | §1.1 line 186 | R (historical) |
| **Received view's cost** (Hilbert-impasse argument) | §1.3 line 206 | M |
| **Present proposal**: MEF axioms (Paper XX) provide Hilbertian finite axiom set with empirical anchor | §1.4 line 225 | M (philosophical claim); D (mathematical results of Papers XI–XXIII) |
| **Master Equation as fundamental physical-mathematical axiom** | §2.2 line 292 | R / D (Paper XX Theorem 1 conditional on MEF axioms; Einstein-equation reduction D) |
| **Quantum Coherence Dilaton $\Phi_{\mathrm{QC}} = \omega(\psi - \bar\psi)^2$** identification | §2.3 line 314 | R (definition per Σ-4); D (physical identifications) |
| **Harmonic Maass form on $\mathcal{M}_{12}$** as structural object | §2.4 line 336 | R (Zwegers); D ($K_8$ Spin$^c$ partition function as instance per Paper XI) |
| Hilbert-was-substantively-right argument | §3 (lines 364–397) | R historical / M structural |
| Gödel-restated | §4.1 line 412 | R |
| What Gödel asserts | §4.2 line 422 | R |
| **What Gödel does NOT assert** (limits-of-incompleteness argument) | §4.3 line 440 | M |
| **Gödel sentence as chart seam** | §4.4 line 442; line 462 | M (structural identification; Lawvere's theorem itself R) |
| **Curry–Howard isomorphism** (proofs are programs) | §5.2 line 491 | R |
| **Lawvere's fixed-point theorem** | §5.3 line 520 | R (Lawvere 1969) |
| **HoTT (Homotopy Type Theory) connection** | §5.4 line 542 | R |
| **Restated position** (synthesis) | §5.5 line 556 | M (philosophical synthesis); R (constituent results) |
| Historical-physics lineage of Hilbert programme + MEF | §6 (lines 571–595) | R (each piece); M (the structural reading) |

### Companion Paper — Baryogenesis Overconstraint Derivations v1 (`MEF_Baryogenesis_Overconstraint_Derivations_v1.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Rank-2 independence of the quark/lepton Dirac-phase maps $(F_q, F_\ell)$ in $(\phi_\psi, \phi_\omega)$; degeneracy iff $q_\psi = q_\omega$ | Thm 3.2 `thm:rank2` | **D** (leading order + weighted refinement); D-conditional for the exact D4 map (partition-weighting structure) |
| Weinberg witness: degeneracy locus requires $\sin^2\theta_W \geq 1/2$; at $0.224$, $\lvert\det\rvert \geq 0.552$ | Thm 3.2 proof; Lean `weinberg_witness` | **D** |
| Observable-to-parameter count: 7 observables ($\delta^q_{CP}, J, \delta^\ell_{CP}, \theta_{12}, \theta_{13}, \theta_{23}, \eta$) to 0 continuous parameters | Prop 3.4 `prop:count` + Table 1 | **D** (rows inherit per-source tags) |
| $\chi$-trace: $\partial\delta^\ell_{CP}/\partial\chi = -\pi/144 \approx -1.25^\circ$ per unit $\chi$; both chains route through $W_{\mathrm{base}} = \pi/\chi(K_8)$ | Prop 3.5 `prop:chitrace` | **D** ($W_{\mathrm{base}}$ route); M ($\theta_W$ route, $\tau_2(\chi)$ closed form absent) |
| Dimensional closure of the anomaly: $\partial_\mu J^\mu_B = [\zeta_{\mathrm{cpl}}/(4\pi)^2](\Box\Phi_{QC}/v_\Phi)(\bar\Psi i\gamma^5\Psi/\Lambda_W)$, $v_\Phi = v$, $\Lambda_W = T_c$; Paper IX numerics unchanged | Prop 4.2 `prop:dims`, eq (4.2) | **D** (closure); canonical booking flagged for PI (§8 item 4) |
| Jarlskog power $n = 1$ from CP parity (odd powers only) + rephasing invariance (Jarlskog's theorem); $T_c^3$ from dimensional closure | Lem 4.3 `lem:parity` + Prop 4.4 `prop:jpower` | **D** |
| Insertion-counting dichotomy: flavour-universal weights force $f_{\mathrm{GIM}} = \prod\Delta m^2/T_c^{12} = 1.63 \times 10^{-23}$ → $\eta \sim 10^{-32}$; non-degenerate weights lift the light-mass factors | Lem 4.5 `lem:counting`, eqs (4.3)–(4.5); Lean `gim_suppression` | **D** at counting level (eq (4.3) R, Jarlskog 1985); magnitude of branch (ii) deferred to the Conjecture |
| **Conjecture: geometric flavour discrimination** — $W_f$ = corner-resolved zero-mode overlaps on $K_8$, non-degenerate at order unity ⟹ $f_m = \mathcal{O}(1)$. Decision criterion: two-loop finite-T weighted trace in the tanh wall background | Conj 4.6 `conj:geom` | **M** — the single load-bearing open item for the $\eta$ magnitude; proposed gap ID **G-BA7**, priority above G-BA1/G-BA6 |
| Exact wall-profile integrals $(0, 2/3, 4/3)$ under $u = \tanh\xi$; odd source forces bilinear $\propto \tanh\xi$; $\kappa = 1$ | Prop 4.7 `prop:profiles`, eq (4.7); Lean `profile_I1/I2/I4` | **D** |
| Exact $\Delta\beta$ elimination (net power identically zero); residual $O(\Delta\beta^2) = 1.2 \times 10^{-7}$; $A_{\mathrm{top}} = 1.61 \times 10^{-12}$ (Paper IX's $A = 5.369 \times 10^{-10} = A_{\mathrm{top}}/(\Delta T/T_c)_{\mathrm{nom}}$) | Thm 5.1 `thm:cancel` + Rem 5.2; Lean `delta_beta_elimination` | **D** |
| Coupling elasticity $d\ln\eta/d\ln\zeta_{\mathrm{cpl}} = 1.948$; $\zeta_{\mathrm{cpl}} = 0 \Rightarrow \eta = 0$ (cancellation physical, not tautological) | Prop 5.3 `prop:elasticity`; Lean `eta_vanishes_without_coupling` | **D** |
| Independent latent-heat reconstruction: $L = \hat\Pi T_c^2 v^2 = 8.57 \times 10^9~\mathrm{GeV}^4$; $\Delta\beta = 3.50 \times 10^{-4}$ reconfirmed; Paper IX numerics reproduced to 3 s.f. throughout | Prop 5.4 `prop:indep-db`, eqs (5.4)–(5.5) | **D**, conditional on friction sum ($\tilde\eta_\zeta$ remains M, Gap G-BA6) |
| Extended sensitivity map: $S_{T_c} = -3.35$ **dominates** (absent from Paper IX tornado); $S_{\Delta T/T_c} = -1$, $S_{\sigma} = +1$ exact; $S_{f_\zeta} = +0.948$; $\eta/\eta_{\mathrm{obs}} \in [0.51, 1.85]$ across $T_c \in [419, 616]$ GeV — headline 3% is central-value, factor 2 across band | Prop 5.5 `prop:sweep` + Tables 2–3 | **D**, within the stated Boltzmann-scaled friction model |
| GW transition parameters: $\alpha \in [2.8, 5.2] \times 10^{-3}$; $H_c R_* \in [1.3 \times 10^{-15}, 4.1 \times 10^{-12}]$ (wall thickness ↔ Kibble–Zurek); $\kappa_v = 1.4 \times 10^{-6}$ | Prop 6.2 `prop:gwparams` | **D** (standard relations; $R_*$ bracket stated) |
| **GW falsifier inversion**: $\Omega_{\mathrm{GW}}h^2 \in [4 \times 10^{-38}, 8 \times 10^{-34}]$ at $[3 \times 10^7, 6 \times 10^{11}]$ Hz — null at LISA/BBO is the *prediction*; operative GW falsifier is *detection* of a peaked strong-transition signal | Finding 6.3 `find:gw`, eqs (6.3)–(6.4) | **D** (scaling estimates); M (amplitude bracket, order-of-magnitude — cannot bridge 16 orders) |
| D-bis exact map: $\delta^\ell_{CP}(\phi_\psi) = \phi_\omega + \phi_\psi$, $\partial\delta^\ell_{CP}/\partial\phi_\psi = 1$ exactly; point value $165^\circ$ | Prop 7.1 `prop:dbismap` | **D** (diagonal-edge convention inherits the Addendum's [M] flag) |
| Operative forward falsifier: three bands R1 (point $165^\circ$) / R2 ($165^\circ \pm 3.0^\circ/\lvert q_\psi\rvert$, CKM-pinned) / R3 ($\eta$-route uninformative, $\Delta\delta^q \approx 88^\circ$); separations $12^\circ$ (NuFIT 6.0) / $15^\circ$ (CP conservation); $2\sigma$ ($3\sigma$) discrimination at $\sigma_{\mathrm{exp}} \leq 7.5^\circ$ ($5.0^\circ$) — DUNE/Hyper-K reach | Prop 7.2 `prop:dbis` + §7.3 + Table 4 | **D** for R1/R3 and the falsification logic; R2 |
| Lean 4 machine-check of the exact arithmetic/algebraic skeleton (19 theorems: phase sums, rank-2, Weinberg witness, CP parity, GIM bound, profile integrals, $\Delta\beta$ elimination, wall velocity, D-bis offsets) | Appendix A | Supporting apparatus (PI to run independently) |

### Working paper — *On the Parity Structure of the Photon Sector on M₁₂* (GAN-PHOTON-HEL-1 to HEL-5)

| What is derived | Site | Rigour |
|---|---|---|
| The three involutions separated: 4D parity P; the gauged orbifold involution σ; the chirality swap C_χ = ψ ↔ ψ̄, implemented geometrically by σ | §3, Definition 3.1 (`def:involutions`) | Definition (convention) |
| σ-evenness of the consciousness field ω and of the Quantum Coherence Dilaton Φ_QC = ω(ψ − ψ̄)², forced by descent of g_ωω to the orbifold | §3, Lemma 3.2 (`lem:omegaeven`) | D |
| Routing lemma: Φ_QC is even under C_χ and σ; ∇Φ_QC is a polar vector; neither can supply the pseudoscalar of θFF̃ nor the axial vector of the CFJ term | §3, Lemma 3.3 (`lem:routing`) | D |
| Exhaustive audit: no object in the stated geometry is simultaneously P/σ/C_χ-odd in a way feeding the parity-odd class and visible to the photon zero mode at propagation level | §3, Proposition 3.4 (`prop:audit`) | D |
| Lock 1: the metric-only Kaluza–Klein reduction of the twelve-dimensional Maxwell term produces no ε^{μνρσ} operator at tree level, for any internal background | §4, Lemma 4.1 (`lem:noeps`) | R |
| Lock 2: the ℤ₂ selection rule — the internal integrals I_θ and I_CFJ vanish identically; the untwisted, σ-even photon zero mode cannot couple linearly to any σ-odd (twisted) insertion | §4, Lemma 4.2 (`lem:selection`) | D |
| **Parity cleanliness at leading order**: the coefficient of every parity-odd photon operator (θFF̃, Carroll–Field–Jackiw, helicity-dependent dispersion) vanishes identically in the 4D effective Lagrangian | §5, Theorem 5.1 (`thm:main`; restated as Theorem 1.1 in the introduction) | D, resting on Lemmas 4.1 [R] and 4.2 [D] |
| Independence of the (missing) photon eigenvector construction: both locks apply to B and W³ separately, hence to every linear combination | §5, Corollary 5.2 (`cor:eigenvector`) | D |
| Exactly three failure channels: radiative CFJ from a wall-fermion axial background [G]; a twelve-form topological term [G]; one-loop twisted-sector (shadow) contributions at the corners [M] | §5, Proposition 5.3 (`prop:failure`; restated as Proposition 1.2) | G / G / M per channel |
| **Null prediction**: zero isotropic cosmic birefringence and zero helicity-dependent dispersion of geometric origin at leading order; falsifier stated (confirmed propagation-level detection) | §5, prediction box after Proposition 5.3 | D |
| α chain and wall confinement undisturbed by the reduction (consistency gates) | §6 | D |
| Index bookkeeping: among all stated backgrounds, exactly two carry a free 4D index (∂_μΦ_QC and the flat Sol connection); every internal-indexed background feeds the scalar (mass/Yukawa) sector only and cannot contribute to b_μ | §10, Lemma 10.1 (`lem:bookkeeping`) | D |
| Universal dilaton weight: u_n = ζ for every wall mode at leading adiabatic order (measure and inverse localisation width share the conformal factor e^{ζΦ_QC}); axial part vanishes identically; residue O(e^{−2c_nkL_ψ}) | §10, Proposition 10.2 (`prop:universal`) | D |
| Source (a) closed: the J-eigenspace projection supplies a spectrum, not a background; the antilinear C maps V₊ → V₋ (cross-wall); b_μ^{(a)} = 0 | §11, Lemma 11.1 (`lem:jproj`) | D |
| Source (b) closed: 3A′ removed exactly by the Bismut–Cheeger rescaling; residue is a parity-even scalar mass shift at O(A′²); no route to a 4D axial vector; b_μ^{(b)} = 0 | §11, Lemma 11.2 (`lem:warp`) | D |
| Source (c) closed: the Spin^c Wilson line ⟨A_ω⟩ = π/(2L_ω) is internal-indexed; its descendants are the banked mass-matrix phases; b_μ^{(c)} = 0 | §11, Lemma 11.3 (`lem:wilson`) | D |
| Source (e) closed: the spinodal gradient coupling is universal-vector at leading order; any axial residue is a pure-gradient background equivalent by the anomaly to an axion-type ϑFF̃ with ϑ ∝ Φ_QC; epoch-bounded; no propagation-level relic | §11, Proposition 11.4 (`prop:spinodal`) | D, resting on I16; transient interpretation [M] |
| Consistency guard: nothing promotes Φ_QC or ∇Φ_QC to a pseudoscalar or axial vector; the loop channel located without disturbing the Part I locks | §11, Remark 11.5 (`rem:F1guard`) | D (commentary) |
| Source (d) reduced: the Sol channel yields the flat holonomy U ∈ U(3) on the wall zero-mode bundle; b₀ = (γ_{n_L} − γ_{n_R})/(2T_Sol); eigenphase decomposition γ_n = q_n φ_M + γ̂_n with φ_M the abelian compensator phase per unit charge — the deciding quantity | §11, Proposition 11.6 (`prop:sol`) | D for the reduction; G for the value |
| The residual wall involution σ_w exists (fixed-locus convention) and the physical bilinear densities are σ_w-even | §12, Lemma 12.1 (`lem:sigmaw`) | D, conditional on the fixed-locus convention (convention later derived at Theorem 19.1) |
| Neutral-sector wall image: every gauge-neutral σ_w-odd background integrates to zero against the wall modes — the wall-level image of the chirality balance in the neutral sector | §12, Lemma 12.2 (`lem:neutral`) | D |
| Charge sectors: the unique background-preserving antiunitary is the CPT-type σ_w ∘ K (odd charges); the balance is cross-wall, with the exact relation b_μ^{AQ} = −b_μ^{Q} (perspective effect) | §12, Theorem 12.3 (`thm:cpt`) | D |
| Quantisation: under assumptions A9 and A10, φ_M ∈ {0, π}, with π an antiperiodic temporal spin structure, not a local CFJ background | §12, Proposition 12.4 (`prop:quant`) | D, conditional on A9 and A10 |
| Sol-lift neutrality $\varphi_M = 0$ | §12 `conj:phiM`; Theorem 30.1 | **[D]** (two-premise theorem) |
| Hard-gate statement: the mapping-torus boundary conditions and J-projected Kaluza–Klein tower constitute a specified ultraviolet completion, resolving the Jackiw–Kostelecký/Pérez-Victoria scheme ambiguity in principle should a non-zero b₀ survive | §13 | M |
| Residual failure orders after the round (R1–R4: φ_M ≠ 0; higher KK modes; AQ-wall bulk leakage; spinodal transients) | §14, Proposition 14.1 (`prop:failure2`) | G / M / M / D per order |
| **The walls are edges**: the Q-wall is the one-dimensional locus {θ_ψ = 0}, the AQ-wall {θ_ψ = L_ψ/2}; each a pillowcase segment of proper length e^{ζ⟨Φ_QC⟩}L_ω/2; neither a point nor a region | §19, Theorem 19.1 (`thm:wallloci`) | D |
| Corner–wall incidence: F₁, F₃ on the Q-wall; F₂, F₄ on the AQ-wall; two corners per wall | §19, Corollary 19.2 (`cor:incidence`) | D |
| The 1+3 Sol orbit derived and characterised: F₁ invariant for any integer-linear map; the 1+3 pattern is equivalent to the mod-2 reduction of the monodromy having order three; representative ((2,1),(1,1)) realises it; cycle orientation open | §20, Proposition 20.1 (`prop:solorbit`) | D; [G] on the orientation |
| Hyperbolic monodromy preserves no rational circle: the wall loci are not M-invariant and the 3-cycle moves corner data across the walls; compatibility handled by the corpus Sol-monodromy regularisation | §20, Remark 20.2 (`rem:sweep`) | R for the eigendirection fact; D/M for the transport statement |
| Variant reconciliation: V4 derived; V2 consistent; V3 admissible only as corner-naming shorthand; V1's "photon vertex" at F₄ fails against the photon's Q-wall confinement | §20, Table (`tab:variants`) and surrounding prose | D (V2 labels [D/M]) |
| The phase–corner bijection from the additive holonomy cocycle with (φ_ψ, φ_ω) = (5π/12, π/2): exactly two assignments reproduce the corpus set; the residual ℤ₂ is the ψ-orientation | §21, Proposition 21.1 (`prop:bijection`) | D, up to one enumerated ℤ₂ |
| **Corpus concordance: Bijection A canonical** — the Phase 0 four-corner table (pillowcase–quaternion dictionary) matches the derived incidence and phases cell by cell under the label map A = F₁, B = F₃, C = F₂, D = F₄; the ℤ₂ is resolved | §21, Corollary 21.2 (`cor:bijectionA`) | D, corpus concordance; subject to adjudication |
| Sol transport of the corner phases: compensator increments (π/12, 5π/12, −π/2) along the 3-cycle, zero at the invariant corner, orbit sum zero in either orientation and bijection | §21, Proposition 21.3 (`prop:compensator`) | D |
| **The canonical corner table** (coordinates [R]; wall incidence [D]; phases Bijection A [D]; Sol orbit [D]; sector labels: product structure [D], semantic names [M]) | §21, Table (`tab:cornertable`) | per-cell tags as listed |
| Corner weights and the failure of the naive suppression: photon factor exactly unity at every corner; wall-fermion weight c_nkτ₂L_ω/(1 − e^{−c_nkL_ψ}) at on-wall corners (enhancement), exponentially reversed at the opposite wall; F3-channel protection rests on the selection rule and loop counting, not separation | §22, Proposition 22.1 (`prop:overlap`) | D; [G] on the E/M_c powers |
| Mapping-torus rigidity: single-valuedness over S¹_Sol forces isomorphic defect spectra, hence equal anomaly polynomials, at the three permuted corners: I(F₂) = I(F₃) = I(F₄) | §24, Lemma 24.1 (`lem:rigidity`) | D |
| Mirror pairing: the antiunitary exchange implementing the exact chirality balance reverses the anomaly polynomial between mirror-paired corners: I(F₂) = −I(F₁), I(F₄) = −I(F₃) | §24, Lemma 24.2 (`lem:mirrorpair`) | D |
| Corollary in prose: any admissible corner spectrum is gauge-vector-like (equivalent to its own conjugate mirror) | §24, after Lemma 24.2 | D |
| Reconciliation with the shadow: the corner modes are σ-unpaired (sourcing the Zwegers shadow) while gauge-vector-like — the two chirality notions are independent | §24, Remark 24.3 (`rem:shadow`) | D/M |
| **Corner-by-corner anomaly cancellation, forced**: I(F_i) = 0 for every corner, term by term; no inflow (twelve-form) term is required, and none may be added; failure conditions (weakened mirror; non-1+3 orbit; extra defect matter) stated | §25, Theorem 25.1 (`thm:cornercancel`) | D |
| The anomaly ledger (corner-by-corner constraint table with running total zero) | §25, Table (`tab:ledger`) | D |
| Consistency gates: α chain undisturbed under either outcome (topological terms cannot renormalise the gauge kinetic trace); Lock 2 respected; the Wilson-line axion remains couplingless — now derived, not observed | §26 | D |
| Composition consequence: the null prediction of Theorem 5.1 hardens to **tree-level-exact** | §25–§26, composed in §32 | D |
| Corpus-instantiated inputs: monodromy M = ((2,1),(1,1)) [D]; L_ω = 12π = ζ [D]; Sol–Casimir regularisation with 𝒞_Sol = 1 [D/M]; T_Sol not retrieved [G]; φ_ψ decomposition W_base + W_fibre traces beyond the pillowcase fibre | §27 (inputs I24–I27) | as tagged per input |
| Parity obstruction (Readings I and III): invariance forces the monodromy entry b even; every mod-2 order-three class has b odd; the stabiliser intersection is empty under strict and orbifold-relaxed equivalence | §28, Theorem 28.1 (`thm:parity`) | D |
| Congruence emptiness (Reading II): the mod-12 system {stabiliser, det ≡ 1, order-three class} is exactly empty | §28, Theorem 28.2 (`thm:readingII`) | D |
| **The obstruction**: no orbit-compatible element of SL(2,ℤ) preserves any reading of the fibre Wilson data as a flat background; the covering-torus compensator does not exist; φ_M is not definable as a Jacobian winding; corpus defect vectors exhibited | §28, Corollary 28.3 (`thm:obstruction`) | D |
| The defect is corner data: the corpus monodromy's Reading-I defect components (11, 5) — and (6, 11) in the transpose presentation — are the corner phase quanta | §28, Remark 28.4 (`rem:defect`) | D as arithmetic; M as interpretation |
| Reading IV (the corpus half-cycle convention, full-cycle vector (5π/6, π)) fails by the identical parity obstruction; the obstruction is robust across all four readings | §28, Remark 28.5 (`rem:readingIV`) | D |
| Reframing: the consistent object is the isomorphism Ξ_M of σ-equivariant Spin^c structures; its corner-sector invariant content is exactly the Part III increment data; φ_M redefined compatibly as the abelian charge-linear per-period phase on the wall determinant line | §29, Proposition 29.1 (`prop:reframing`) | D |
| **The fibre spin structure is forced**: the order-three monodromy 3-cycles the even spin structures and fixes the odd (P, P) one; mapping-torus consistency selects (P, P) with no freedom; the lift sign ±1 is charge-blind | §29, Proposition 29.2 (`prop:spinstructure`) | D; [G] on the sign |
| Assumption A9 discharged and the anchor fixed: a V₊-preserving lift exists ([Ξ_M, J] = 0 by construction); the abelian normalisation is canonically anchored to zero at the Sol-invariant corner F₁ | §29, Proposition 29.3 (`prop:A9`) | D |
| The holonomy ledger (five abelian phase sources audited under the reframing) | §29, Table (`tab:holonomyledger`) | per-row tags as listed |
| **Conditional determination: φ_M = 0** — premise P1 (corner–wall determinant identification) gives 3φ_M ≡ 0, i.e. {0, ±2π/3}; premise P2 (antiunitary pairing) gives {0, π}; the intersection on the 24th-root lattice is {0}; Conjecture 12.5 promoted to a theorem of the two premises | §30, Theorem 30.1 (`thm:phiM`) | D, conditional on P1 [M] and P2 [M/G] |
| **Premise P1 holds for the lepton sector**: Reading β makes the lepton generations corner-localised; their Sol transport is corner-data transport; the orbit constraint 3q_nφ_M ≡ 0 is corpus-derived for every realised lepton charge; unit-lattice step [M]; the [M] on P1 reduces to the quark sector | §30, Proposition 30.2 (`prop:P1lepton`) | D, from the corpus Phase 0 architecture; subject to adjudication; [M] on the lattice step |
| Cross-checks: corner increments reproduced; α chain undisturbed; exact division of labour against the banked CKM/PMNS content (abelian charge-linear phase only); wall confinement consumed, never violated | §30, cross-checks paragraph | D |
| **Final protection status** (provisional, pending adjudication): tree level exact (Locks 1–2 composed with the twelve-form closure); one loop closed except premise P2 and the quark-sector case of premise P1, the lepton sector being corpus-closed; falsifier unchanged and sharpened | §32 (`sec:composition`), protection status box | D at each cited component; composition conditional as stated |
| Proposed ledger deltas of the chain, enumerated for adjudication | §32, closing paragraph | — (list) |
| L1 `sq_diff_swap` | (ψ − ψ̄)² invariant under the chirality swap (ring identity over ℤ) | Lemma 3.3; Remark 11.5 |
| L2 `odd_zero`, `symmSum_odd` | ℤ₂ pairing cancellation with fixed-point vanishing (discretised σ_w selection rule) | Lemmas 4.2, 12.2 |
| L3 `antilinear_swaps` | An antilinear map commuting with J exchanges V₊ and V₋ | Lemma 11.1 |
| L4 `antiunitary_conjugates_eigenphase` | An antiunitary commutant conjugates holonomy eigenvalues | Theorem 12.3; Proposition 12.4 |
| L5 `selfconj_unit` | A unimodular phase fixed by conjugation is ±1 (γ ∈ {0, π}) | Proposition 12.4 |
| L6 `negOne_central` | −𝟙 central in M₂(ℤ), hence SL(2,ℤ): σ commutes with every monodromy | §11 (Sol channel), §20 |
| L7 `lin_fix_origin`, `cat_orbit` | Origin fixed; representative mod-2 three-cycle of the corners | Proposition 20.1 |
| L8 `anchor_and_orientation` | Finite search: exactly two cocycle assignments reproduce {0, 5, 6, 11} | Proposition 21.1 |
| L9 `sm_anomaly_sums` | A complete SM generation is gauge-anomaly-free (Tr Y, Tr Y³, SU(2)²Y, SU(3)²Y) | §26 wall-sector complement to Theorem 25.1 |
| L10 `orbit_compensator_sum` | The 3-cycle compensator increments sum to zero, either orientation | Proposition 21.3; Theorem 30.1 (P1 route) |
| L11 `parity_obstruction_I/III/IV`, `readingII_empty` | The stabiliser obstruction, all four readings, strict and relaxed | Theorems 28.1–28.2; Remark 28.5 |
| L12 `constraint_intersection` | {0, 8, 16} ∩ {0, 12} = {0} on the 2π/24 lattice | Theorem 30.1 |
| L13 `corpus_defect_values` | The corpus monodromy's defect vectors equal the corner quanta | Corollary 28.3; Remark 28.4 |

### Paper XII — Geometric Correspondence: Cristae and Compactification (`Paper_XII_Geometric_Correspondence_Cristae_v2.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| $\Ttwo/\Ztwo$ pillowcase: two length scales $L_\psi, L_\omega$, four $\Ztwo$ fixed points, $\chi(\Ttwo/\Ztwo)=2$ (orbifold Gauss–Bonnet, four cone points $\times\,\tfrac12$) | §1.1 | **R** |
| Orbifold eigenvalue spectrum $\lambda^{\mathrm{orb}}_{m,n} = (\pi m/L_\psi)^2 + (\pi n/L_\omega)^2$ (Neumann/cosine modes from $\Ztwo$ projection) | §1.1 eq:orbifold_eigenvalues | **R** (standard orbifold spectral geometry) |
| 2D free-space mode wavelength $\lambda_{m,n} = 2 n_{\mathrm{eff}}/\sqrt{(m/L_\psi)^2+(n/L_\omega)^2}$ | §1.1 eq:mode_wavelength_2D | **R** |
| Structural correspondence table: orbifold circles $\leftrightarrow$ cristae periodicities; four fixed points $\leftrightarrow$ crista junctions; warp factor $\leftrightarrow$ proton-motive-force gradient; dynamical modulus (set by $\QCD$) $\leftrightarrow$ cristae remodelling | §4.1 Table (correspondence) | **M** (biological measurements R; the analogy itself M) |
| Neumann boundary condition ($\Ztwo$ projection) $\leftrightarrow$ open boundary at crista junctions | §4.1 Table | **D** |
| Junction as waveguide-below-cutoff: $R_{\mathrm{junction}}\to 1$ for NIR modes (aperture $\ll\lambda$) | §3.3 | **D** (waveguide theory); precise $R_{\mathrm{junction}}$ value is **G** |
| **3D rectangular cavity mode formula** $f_{p,q,r} = (c/2)\sqrt{(p/n_{\mathrm{gap}}L_{\mathrm{gap}})^2 + (q/n_{\mathrm{lumen}}L_{\mathrm{length}})^2 + (r/n_{\mathrm{lumen}}L_{\mathrm{depth}})^2}$; anisotropic indices $n_{\mathrm{gap}}=1.46$, $n_{\mathrm{lumen}}=1.37$ | §4.2 eq:3D_modes / eq:3D_wavelength | **R** (exact cavity eigenvalue problem) |
| 2D gap-model negative result: zero modes in $600$–$1000$ nm across 88 parameter combinations; longest mode $58.4$ nm (EUV) | §5.1 resultbox | **R** |
| **3D lumen central result**: $(0,1,0)$ mode at $822$ nm within CCO Peak 2 window ($810$–$850$ nm); $\lambda_{0,1,0} = 2 n_{\mathrm{lumen}} L_{\mathrm{length}} = 2\times1.37\times300$ nm | §5.2 resultbox / eq:lambda_010 | **D** (exact eigenvalue on measured dimensions) |
| Spectral-regime separation: EUV modes ($p\geq1$, gap-determined, $\lambda<60$ nm) vs visible/NIR modes ($p=0$, $L_{\mathrm{length}}/L_{\mathrm{depth}}$-determined, $\lambda>200$ nm) | §5.2 | **D** |
| Sensitivity: $L_{\mathrm{length}}=303$ nm matches CCO Peak 2 (830 nm); $244$ nm matches Peak 1 (670 nm); PBM-window mode for $L_{\mathrm{length}}\geq225$ nm | §5.3 eq:L_required_830 / eq:L_required_670 | **D** |
| 822/830 nm convergence ($<1\%$) from independent origins (cavity geometry vs Cu-centre electronic structure); evolutionary co-adaptation interpretation | §5.5 mechanismbox | numerics **D**; evolutionary interpretation **M** |
| Nested-cavity compound ZPF suppression $\rho_{\mathrm{eff}}/\rho_{\mathrm{free}}\approx0.83$ across PBM window (product approximation) | §6.1 | **D** (within product approximation) |
| Degraded-geometry mode loss: shortened lumen ($125$ nm) shifts $(0,1,0)$ to $342.5$ nm (UV); CCO-resonant cavity mode lost; ~23% CCO-band ZPF deficit | §6.2 eq:degraded_mode | **D** (23% amplitude model-dependent) |
| Warburg logical chain (cristae degradation → lumen shortening → mode shift → ZPF deficit → OXPHOS impairment → glycolysis) | §6.2 | steps 1–4 **R/D**; step 5 (metabolic bridge) **M** |
| Predictions 1–5 (lumen-length spectral response, junction $Q$-factor, metabolic-state frequency shift, tissue-type fingerprint, $L_{\mathrm{length}}$–CCO-activity correlation) | §7 | **D** (given the cavity model) |
| Prediction 6 (temporal ordering during Yamanaka reprogramming: cristae shortening precedes metabolic shift precedes pluripotent epigenetic signature) | §8.4 mechanismbox | **D** (discriminates geometric vs epigenetic account) |
| $R_{\mathrm{junction}}$ value at biological crista junctions | §3.3; §8.2 Table | **G** (principal experimental target) |

### Paper XIII — The Biocentric Fixed Point (`Paper_XIII_Biocentric_Fixed_Point_v2.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| Four fixed points of $\Ttwo/\Ztwo$: $P_1=(0,0)$, $P_2=(L_\psi,0)$, $P_3=(0,L_\omega)$, $P_4=(L_\psi,L_\omega)$ | §2.1 eq:fixed-points | **R** (Paper XI computation) |
| $\Spinc$ holonomy phases $\vartheta_i$: $P_1{:}\,0$ (SM/visible), $P_2{:}\,5\pi/12$ (dark), $P_3{:}\,\pi/2$ (biocentric), $P_4{:}\,11\pi/12$ | §2.1 definitionbox | **R** (phase computation); sector identification **D** |
| $N_{\mathrm{gen}} = \chi(\Kman)/4 = 12/4 = 3$ (denominator 4 = four fixed-point sectors); $\hat A[\Kman]=0$ so all generation content is orbifold-twisted | §2.1 | **R** |
| Maximal CP-violation at $P_3$: $\lvert\vartheta_3-\vartheta_1\rvert=\pi/2$, weight $e^{i\pi/2}=i$ purely imaginary — biocentric sector orthogonal to SM holomorphic amplitude | §2.2 | **D** |
| Four-sector non-holomorphic completion $\hat Z = Z^{(P_1)}_{\mathrm{vis}} + Z^{(P_2)}_{\mathrm{dark}} + Z^{(P_3)}_{\mathrm{bio}} + Z^{(P_4)}$; $P_3$-identification with biological systems | §2.3 | **D** (phase structure); $P_3\leftrightarrow$ bio-systems **M** (Fractal Recapitulation Thesis) |
| Distinction biocentric vs dark: $P_2$ = Zwegers shadow $g(\tau)$, $\lvert g\rvert\sim10^{-19}$ at $\tau_2=1.86$, gravitationally decoupled; $P_3$ = physically accessible SM complement | §2.3 | **D** |
| $\Ztwo$ identification $(x,y)\sim(-x,-y)$ $\leftrightarrow$ R↔S inversion at chiral centre; four fixed points $\leftrightarrow$ four stereoisomers; phase $\leftrightarrow$ relative stereoisomer stability | §3.1–3.2 definitionbox | **D** (structural identification) |
| **Homochirality as mock modularity**: L-amino/D-sugar sector ($P_1$, holomorphic, dominant); D-amino/L-sugar = Zwegers shadow, exponentially suppressed at $\tau_2=1.86$ | §3.3 resultbox | **M** (structural mapping; awaits $\tau_2^{\mathrm{bio}}$) |
| Enantiomeric potency ratio as $\Spinc$ phase-mismatch measurement | §3.4 | **M** (awaits $\tau_2^{\mathrm{bio}}$) |
| Biological Zwegers completion: shadow $g(\tau)\leftrightarrow$ D-amino acids; non-holomorphic completion $\hat f = f+\int g \leftrightarrow$ L+D required for NMDA (D-serine co-agonist) | §4 resultbox2 | shadow=D-amino **M**; D-serine/NMDA **R** (neuro), interpretation **M** |
| $\{2,3\}$ arithmetic signature of $\Kman$: every topological invariant factorises over $\{2,3\}$ only ($N_{\mathrm{gen}}=3$, $n_{\mathrm{eff}}=8=2^3$, $\chi=12=2^2\cdot3$, $\Delta_{\mathrm{DM}}=24$, $\Lambda$-exponent $96$) | §5.1 | **R** (Paper XI) |
| $\{2,3\}$ ring signature in monoamines: catechol $6=2\times3=\chi/2$; indole $8=2^3=n_{\mathrm{eff}}$; ethylamine $2$; purine $9=3^2$; pyrimidine $4=2^2$ | §5.2 resultbox2 | **M** (carbon counts exact; correspondence not derived) |
| $\{2,3\}$ arithmetic selection rule for biosynthetic enzymes (TH/TPH discriminate against ring primes $\geq5$) | §5.3–5.4 | **M** (arithmetic exact; pharmacological prediction falsifiable) |
| $N_{\mathrm{gen}}=3 = \mathrm{ind}(\slashed D_{\Spinc}) = \chi(\CP^2)$ as topological integer | §6.1 eq:ngen | **R** (Papers I–II) |
| Three-generation identification (three monoamine families ↔ three generations); biosynthetic + action-radius hierarchy | §6.2–6.3 | biochemistry **R**; three-generation identification **M** |
| **$\mathrm{BH}_4$ chokepoint**: tetrahydrobiopterin shared essential cofactor for TH, TPH, eNOS; GTP → GTPCH-I → BH$_4$ | §6.4 mechanismbox | **R** (established biochemistry) |
| Mitochondrial–monoamine causal chain: cristae geometry → OXPHOS → GTP → GTPCH-I → BH$_4$ → {dopamine, serotonin, noradrenaline, NO} | §6.5 resultbox | **D** (each arrow R; end-to-end chain D) |
| Failure staging model (sequential dopamine→noradrenaline→serotonin depletion) | §7.1 predictionbox | **D** (BH$_4$ [R] + hierarchy [M]) |
| Predicted pharmacological failure modes (production vs reuptake distinction; tachyphylaxis) | §7.2 | **D** |
| **Sequenced recovery P-XIII-2** (serotonin recovers first, dopamine last; reverse of failure; 5-HIAA before HVA) — primary falsifiable output | §7.3 predictionbox | **D** (given generation-ordering M premise) |
| MEF multiplicative restoration map $F_e\times F_n\times F_m\times F_c$ | §7.4 | **D** (map); exercise literature **R**; interaction strength **M** |
| Self-calibrating therapeutic principle (physiological BH$_4$ allocation) | §7.5 | **M** |
| Appell–Lerch sum $\mu(\tau,z)$ as 1D Casimir-cavity partition function (counterpropagating mode families) | §8.1 eq:appell-lerch | **D** (structural identification) |
| ZPF spectral shift in $\sim25$ nm synaptic cleft; monoamine UV absorption 270–310 nm | §8.2 | **M** (Casimir physics applied) |
| Predictions P-XIII-1…P-XIII-6 (triple-depletion cluster; sequenced recovery; $\{2,3\}$ enzyme selectivity; BH$_4$ tachyphylaxis; exercise+CTR multiplicativity; D-serine NMDA shadow) | §9; Rigour Summary Table | P-1,2,4,5 **D**; P-3,6 **M** |
| Effective biological modular parameter $\tau_2^{\mathrm{bio}}$ (governs enantiomeric ratios, D-serine fraction, shadow accessibility) | §11 open questions | **G** (primary open theoretical question; multi-scale RG from $\tau_2=1.86$ to molecular scale) |

### Paper XIV — Chirality Maintenance, Shadow Sector Leakage, Enantiomeric Pharmacology (`Paper_XIV_Chirality_Maintenance_v2.tex`)

| What is derived | Site | Rigour |
|---|---|---|
| **Thesis: biological homochirality is actively maintained** (not a frozen historical boundary condition) | §1; §2 | **D** |
| Maintenance mechanism = cristae Casimir cavity sustaining $\tau_2^{\mathrm{bio}}$; shadow amplitude $\lvert g(\tau)\rvert_{\mathrm{bio}}\sim\exp(-\pi\tau_2^{\mathrm{bio}})$; degraded cristae → lower $\tau_2^{\mathrm{bio}}$ → shadow grows | §2.3 mechanismbox / eq:shadow-amplitude | **D** (Papers XII + XIII; shadow formula Paper XI) |
| Baryogenesis analogy (Sakharov conditions ↔ biological chirality maintenance): C/CP violation ↔ $\Ztwo$ + $\pi/2$ phase at $P_3$; departure from equilibrium ↔ non-equilibrium metabolism; baryon-number violation ↔ racemisation events | §2.4 definitionbox | **D** (structural analogy); active vs passive maintenance distinction **D** |
| Racemisation rate $k_{\mathrm{rac}} \sim f(\tau_2^{\mathrm{bio}})$ (D/L ratio tracks tissue mitochondrial health, not merely chronological protein age) | §3 | **D** |
| Warburg chirality cascade: degraded cristae → weaker enzyme enantioselectivity → positive-feedback chirality death spiral (ATP-dependent maintenance) | §4 | **D** |
| Elevated D/L ratios predicted in tumour tissue; CTR as chiral restoration in oncology | §4.4–4.5 | **D** |
| Variable enantioselectivity: enantiomeric potency ratio is a function of receptor-tissue mitochondrial state, not a fixed constant; $R = R_0\exp(\beta\tau_2^{\mathrm{bio}})$ | §5 eq:potency | **D** |
| Treatment-resistance reframing; thalidomide recontextualised ($\tau_2^{\mathrm{bio}}$ foetal vs adult contributes to differential enantiomeric response) | §5.3–5.4 | reframing **D**; thalidomide **M** (not proven; cereblon remains proximate mechanism) |
| $\{2,3\}$ arithmetic selection rule for drug design (extends P-XIII-3 to TH/TPH/AADC/DBH panel) | §5.5 | **M** (arithmetic exact; prediction testable, untested) |
| Receptor-level vulnerability: reduced $\tau_2^{\mathrm{bio}}$ → degraded receptor enantioselectivity → reduced signal fidelity | §6.2 | **D** |
| **Dual degradation mechanism**: production deficit (BH$_4$, Paper XIII) + reception deficit (receptor enantioselectivity, this paper) converge on treatment-resistant depression; independent mechanisms, same endpoint | §6.3 mechanismbox | **D** *(text cites "Papers XV and XVI" — cross-reference slip for Papers XIII and XII; flagged for author)* |
| CTR as dual-mechanism restoration (restored cristae geometry addresses both production and reception prongs) | §6.4 | **D** |
| Effective biological modular parameter $\tau_2^{\mathrm{bio}}$: definition, physical interpretation, four determinants (cristae geometry, receptor pocket geometry, local ZPF density, temperature) | §7.1–7.2 eq:shadow-bio | definition/framework (not a rigour claim) |
| Single-$\tau_2^{\mathrm{bio}}$-per-tissue consistency prediction (one fitted value predicts all enantiomeric ratios in a tissue; inconsistency $>2\times$ falsifies) | §7.3 eq:adrenaline-constraint | **M** (consistency test); **G** (needs experimental determination) |
| $\tau_2^{\mathrm{bio}}$ from first principles via multi-scale RG flow ($\tau_2=1.86$ topological → cristae scale → receptor-pocket scale) | §7.4 | **G** (primary open theoretical problem; stated, not solved) |
| Predictions P-XIV-1…P-XIV-8 (racemisation vs mitochondrial health; tumour D/L; variable enantiomeric pharmacology; single-$\tau_2^{\mathrm{bio}}$ consistency; CTR reduces racemisation; $\{2,3\}$ enzyme panel; foetal $\tau_2^{\mathrm{bio}}<$ adult) | §9; Rigour Summary Table | P-1,2,3,4,6 **D**; P-5,7,8 **M** |

### Stage A — D4 projection map $F_q$ (target 1)

| What is derived | Site | Rigour |
|---|---|---|
| **Under-determination at a single point**: banked $65.6^\circ$ does not fix $F_q$ uniquely; three D4-compatible forms (reflection, partition-weighted, $\mathbb{Z}_3$-weighted) agree to $0.1^\circ$ but differ in $q_\psi$ by up to a factor 5 and a sign. | §Stage A, Prop (under-determination) | **D** for the under-determination statement; the convention selection is **[M] — ruled, not derived** (a closed-form $F_q$ derivation would upgrade it; that remains programme target 1) |
| **Lepton-phase falsifier band R2 widths**: reflection $\pm10.9^\circ$, partition-weighted $\pm53.6^\circ$, $\mathbb{Z}_3$-weighted $\pm40.2^\circ$. | §Stage A, Cor (band widths) | **D** conditional on the ruled convention (see row above) |

### Stage B — direct Jarlskog invariant (target 2)

| What is derived | Site | Rigour |
|---|---|---|
| Direct object definition: $J_{\mathrm{direct}} = \mathcal{M}\sin(\arg\mathrm{hol}(\partial F))$, $\mathcal{M}$ = triangle suppression product | §Stage B, Def (direct object) | (definitional) |
| Deflationary reading: route *equivalence* proved, not two *independent* computations; genuine independent 8D Dirac triple-overlap queued | §Stage B, Rem (deflation) | **[G]** — gap **G-J1**, REGISTERED |

### Stage C — thermal pseudoscalar bilinear and $\eta_{\mathrm{MEF}}$ (target 3)

| What is derived | Site | Rigour |
|---|---|---|
| MEF-native baryon anomaly $\partial_\mu J^\mu_B = \zeta/(4\pi)^2 (\Box\Phi)\bar\Psi i\gamma^5\Psi$, $\Phi=v\tanh\xi$; no sphaleron/nucleation/washout | §Stage C, eq:anomaly | **D** |
| **Thermal bilinear scaling law** $\langle\bar\Psi i\gamma^5\Psi\rangle_T = \kappa f_m J\, T_c^3\tanh\xi\,\mathrm{sech}^2\xi$: linearity in $J$ (CP parity + rephasing), power $T_c^3$ (dimensional closure), profile + $\kappa=1$ (exact wall integrals $0,\,4/3$) — **upgrades Paper IX §4 step M → D** | §Stage C, Prop (bilinear), eq:bilinear | **[D]** for the scaling law; **[M]** for coefficient magnitude $\kappa f_m$ |
| **Exclusion of the flavour-universal branch (partial closure of G-BA7)**: corner zero-mode weights $W_f$ exponentially non-degenerate ($e^{\pi\Delta q/3}\neq 1$ from $c_n=\tfrac12-q_n/12$, charges $\{-1,-1,+2\}$); GIM collapse $f_m\to1.6\times10^{-23}$ excluded | §Stage C, Prop (G-BA7 exclusion) | **D** |
| Residual of G-BA7 narrowed from branch dichotomy to a two-loop coefficient evaluation | §Stage C, Rem (what remains of G-BA7) | **[M]** reduced scope; **[D]** for the narrowing |
| **$\eta_{\mathrm{MEF}} = 6.53\times10^{-10}$, ratio $1.07$** at central $T_c=500$ GeV; band $[0.53, 1.93]$ across $T_c\in[419,616]$ GeV ($S_{T_c}=-3.35$); $J$-independent prefactor $1.98\times10^{-5}$; no tuning | §Stage C, Prop ($\eta_{\mathrm{MEF}}$), eq:etachain / eq:etavalue / eq:band | **D** within stated friction model |

### Sol stage — heat-kernel coefficient $\mathcal{C}_{\mathrm{Sol}}$ and $m_\mu/m_\tau$ (target 4)

| What is derived | Site | Rigour |
|---|---|---|
| Closure and canonical period: Sol mapping torus smooth iff $e^{L_{\mathrm{Sol}}}=\varphi^2$, i.e. $L_{\mathrm{Sol}}=\ln(\varphi^2)=2\ln\varphi$; half-period quantum $\ln\varphi$ | §Sol, Lem (closure) | **R** |
| Square root of monodromy: $A=\left(\begin{smallmatrix}0&1\\1&1\end{smallmatrix}\right)$, $A^2=M$, unique in $\mathrm{GL}(2,\mathbb{Z})$ up to sign; $\mathrm{Tr}\,A^k=L_k$ (Lucas); $\lvert\det(A-I)\rvert=L_1=1$, $\lvert\det(M-I)\rvert=1$ | §Sol, Lem (sqrt monodromy), eq:detformula | **R** — machine-checked |
| Action on pillowcase corners: $A$ fixes $C_0$, cycles $(C_1 C_2 C_3)$; $M=A^2$ inverse cycle; each has exactly one $\mathbb{Z}^2$ fixed point (Lefschetz count 1) | §Sol, Lem (corners) | **R** |
| Half-period isometry $\iota(x,z)=(Ax, z-\ln\varphi)$: isometry, $\iota^2=\mathrm{id}$, orientation-reversing ($\det A=-1$), fixes $C_0$-line, half-period translation | §Sol, Prop (half-period isometry), eq:iota | **R** |
| **Zero-mode projection / Lefschetz localisation**: twisted heat trace $\mathrm{Tr}(U_B e^{t\Delta_{T^2}})=1$ identically for $B=A^k$ ($k\neq 0$); localises at fixed points with weight $1/\lvert\det(I-B)\rvert$; for $A$, weight $1/L_1=1$ at $C_0$; no fibre-mode dressing | §Sol, Thm (trace), eq:trace / eq:lefschetz / eq:weight | **R** |
| Geometric realisation of cross-wall involution: $\sigma$ ($\psi\leftrightarrow\bar\psi$) realised by $\iota$ on four structural grounds — **the single non-rigorous identification of the section** | §Sol, Prop (σ = ι) | **[D]** — ADJUDICATED (PI): stands at [D]; everything downstream inherits the conditionality |
| **$\mathcal{C}_{\mathrm{Sol}} = 1/\lvert\det(I-A)\rvert = 1/L_1 = 1$ exactly** (computed Lefschetz weight, not assumed); higher-sector winding tower $\approx 11\%$ bracket | §Sol, Thm ($\mathcal{C}_{\mathrm{Sol}}$), eq:csol / eq:tower | **[D]**, rigorous except for the σ = ι identification |
| Cross-wall factor-of-two bookkeeping settled structurally: half-period $\ln\varphi$ (one wall), full period $\ln(\varphi^2)$ (coherent pair); exactly one factor of two | §Sol, Rem (bookkeeping) | **D** |
| **$m_\mu/m_\tau = \mathcal{C}_{\mathrm{Sol}}\ln(\varphi^2)/(6\pi) = 0.0511$** (vs PDG 0.0595, dev 14.2%); central value unchanged, epistemic status upgraded — **upgrades Paper III Addendum M → D** conditional on σ = ι | §Sol, Prop (mass ratio), eq:ratio2 | **[D]** conditional on σ = ι |
| Residual disjointness: 14.2% residual scope ($j_H$ Clebsch–Gordan on $\mathbb{CP}^2/S^2$ + QED running) untouched by heat-kernel computation; $j_H$ remains separate [M] | §Sol, Rem (residual and $j_H$) | **D** for the disjointness statement |

### Black-hole stage — gap cluster G-BH-1…G-BH-4 (target 5)

| What is derived | Site | Rigour |
|---|---|---|
| **Rigidity no-go for diagonal lifts (G-BH-1)**: interior Kasner exponents $(-\tfrac13,\tfrac23,\tfrac23)$ saturate both 12D Kasner sums; internal exponents and $\tilde q$ forced to zero; unique diagonal lift is static product, whose Kretschmann diverges — no diagonal lift smooth | §BH C1, Prop (no-go), eq:budget | **R** — machine-checked |
| Gauss budget: entire 4D singularity carried by second fundamental form, $\lVert\mathrm{II}\rVert^2\gtrsim\mathcal{K}_4^{1/2}=\sqrt{48}\,GM/r^3$, ambient smooth | §BH C1, Lem (Gauss budget), eq:gaussrate | **R** |
| **Winding lift (G-BH-1)**: explicit near-puncture embedding; interior anisotropy = winding around compact Sol base at $1/(12\ln\varphi^2)\approx0.087$ windings/Kretschmann-e-fold (the 12 is $4\times3$, **not** $\chi(K_8)$); stretch $\varphi^2$ per winding; induced metric = Schwarzschild interior at leading order | §BH C1, Thm (winding lift), eq:embedding / eq:winding | **[D]** — inherited $\Ssol$ time-cycle assignment |
| Geodesic extendability through the singular locus: 12D geodesics extend by escape lemma; extension via $\Sigma$-P puncture into $P_3$ or $K_8$ excursion | §BH C1, Thm (escape) | **R** given banked ambient smoothness |
| Residual split: **G-BH-1 → closed core [R]/[D] + G-BH-1R [G]** (global interpolating solution across horizon, sharply scoped) | §BH C1, acceptance | **[G]** for G-BH-1R |
| **$\sigma$-evenness of Master Equation (G-BH-2)**: under $\sigma:(\psi,\omega)\mapsto(-\psi,-\omega)$, $\Phi\mapsto-\Phi$; every term invariant; solution space σ-symmetric | §BH C2, Prop (σ-evenness) | **R** |
| Quantitative pullback across $\Sigma$-P (G-BH-2): interior = σ-mirrored block matched by Israel junction at banked $\sigma_{\mathrm{wall}}=1.51\times10^{7}$ GeV³; no new parameter; $P_1$ Sol-fixed / $P_3$ on three-cycle explains why Q-wall chart extends | §BH C2, Prop (pullback), eq:israel | **[D]** conditional on C1 |
| **Two-component equation of state (G-BH-3)**: stiff dilaton-gradient $p=\rho$ [R] + ultra-relativistic $\bar\psi$ $p=\rho/3$ [D]; stiff dominates under contraction ($a^{-6}$ vs $a^{-4}$) [R]; interpolating $p(\rho)=\rho[1-\tfrac23(\rho_*/\rho)^{1/3}]$, causal/monotone | §BH C3, Prop (eos), eq:eos | limits **[R]/[D]**; crossover form + $\rho_*$ **[M]** |
| Collapse-condition consistency (G-BH-3): stiff-dominated interior = velocity-dominated non-oscillatory regime of the winding lift; C1 and C3 mutually consistent; density local not cosmological | §BH C3, Prop (collapse consistency) | **D** |
| **Kaluza–Klein Hawking channel weights (G-BH-4)**: $w_n=\dodd(n)e^{-n m_{\mathrm{KK}}/T_H}/\mathcal{Z}$ from mock-Jacobi $\dodd(n)$ coefficients | §BH C4, eq:kkreduction | **[D]** weight law; greybody prefactors **[M]** |
| **Arithmetic falsifier (G-BH-4)**: log-spectrum residuals $\varrho_n=\ln\dodd(n)$ (singlets at $2^a$, doublets $\ln 2$ at odd primes, $\varrho_9=\ln 3$); line ratios $1:0.368:0.271:0.050:0.037$, $w_3/w_4=2e$; operative only in final evaporation burst | §BH C4, Prop (falsifier), eq:residuals | **[D]** given the weight law |
| Consolidated non-propagation: all four closures local to black-hole applications sector; 4D Einstein + Penrose–Hawking untouched; $P_1$ Sol-fixed / $\{P_2,P_3,P_4\}$ cycle consistent with Sol-stage corner arithmetic | §BH, consolidated statement | **R** for the scope statement |

### Yang–Mills gap cluster — REGISTERED (v13, 12 Jul 2026)

| What is derived | Site | Rigour |
|---|---|---|
| Gap | Statement | Rigour |
| **G-YM-2** ✅ **CLOSED** | **THE GAUGE-GROUP TRANSFER.** XVII Theorem B is stated for $SU(3)$; its operative closure (Route B, from XXI §7) is stated for $SU(2) \cong \mathrm{Sp}(1)$. **Sp(1)-dependence audit (12 Jul 2026): NULL REFUTED.** Of five candidate dependence sites, the three on the **positivity** path are **all gauge-group-free** — corner distinctness (2-torsion fixed points of $\sigma$ on $\Ttwo$, [R], **logically prior to the quaternions, which merely label the corners**), Hopf–Rinow [R], and the spectral identification via `thm:index` [D]. The two genuine Sp(1)-dependences are **off the existence path**: the *value* of $\Delta$ (corner selection — **a real scope limit**), and the alternation's orbit proof (harmless — XVII proves it independently by number theory). **DISCHARGED by the gauge-transfer proposition — canonical site: YM-Foundation-A, Proposition 6.2** (parametricity machine-checked: `Transfer.lean`, $G$ a phantom binder, proof term constant in $G$ by `rfl`; the five-input inspection carried in the row at the canonical site). | **CLOSED [D]** |
| **G-YM-1** | **APPARENT XVII↔XXI CIRCULARITY — DISSOLVED.** Read at paper granularity, XVII closes via XXI while XXI cites XVII for its mechanism. **This is a node-granularity artefact, not a logical cycle**: XXI §7 consumes XVII **Pillar I** (`thm:index`, `rem:kloosterman`), **never** XVII Theorem B. Verified: `thm:index` and `thm:bridge` contain **zero** citations of Paper XXI. The chain **XVII-I → XXI-7 → XVII-II is acyclic.** Residual: XVII's *"genuinely independent routes"* claim is true of machinery but not foundations — `rem:MEFsectors` imports XXI §6/§3.3 into Route A. | **[D]** — documentation gap, downgraded from [G] |
| **G-YM-3** | **CITATION ERROR.** Paper XVII cites Route B's source as *"Paper XXI **§6**"* **five times** (lines 204, 249, 804, 878, 960). **XXI §6 is the Riemann Hypothesis; Yang–Mills is §7.** Second section-pointer error found this session (cf. Paper I Addendum §3-cited-as-§4). **A corpus-wide section-pointer audit is warranted.** | **[R]** correction |

### A3-chain island note A — `A3_Chain_EL_Stratification_Assembly.tex`

| What is derived | Site | Rigour |
|---|---|---|
| Conformal eigenvalue variation δλ = −ζλ∫δΦ\ | χ\ | ²dv (BG, conformal trace) |
| Kernel decoupling: zero modes contribute nothing; index-type signed counts excluded from the weights by derivation | `lem:el-kernel` | **D** (machine-checked core) |
| Normalisation independence: any F′ ≠ 0 reshaping has identical critical sets | `lem:el-norm` | **D** (machine-checked) |
| **EL equation, density-balance form** Σw_kλ_k\ | χ_k\ | ² = μe^{2ζΦ}; degenerate blocks via trace contraction; extremal-metric family identified |
| Conjugation of the lift by half-period translations: ε_a = +1 (unshifted; 2m even) / −1 (shifted; 2n−3 odd) — odd-c₁ breaking V₄ → ℤ₂ | `lem:strat-eps` | **D** (parity core machine-checked) |
| Residual symmetry ℤ₂ + Palais symmetric criticality (sufficiency); corner orbits two pairs; constants in X^{ℤ₂} | `thm:strat` | **D** (Palais EXT); exactness and per-stratum existence recorded open [M/G], [M] |
| Signed = unsigned on the base (diagonal diamond): Σb(B) = 6 = χ(B); χ_y identities | `lem:asm-diag` | **R/D** (machine-checked identities) |
| **Base-multiplicity replication + assembly 6 × 2 = 12 = 3·2·2**, kernel-exclusion built in; H5 discharge cross-referenced (N2b) | `prop:asm`, `rem:asm` | **D** at adiabatic point; final strata-count identification **M** with two named residuals — layered grade in-document |

### GBH4-Evaluation island note B — `GBH4_Evaluation_N3_N6.tex`

| What is derived | Site | Rigour |
|---|---|---|
| Octave symmetry as the coarsest signature — the corrected coarsest signature superseding the former "even-suppression" fossil phrasing (deleted, see below) | `rem:ev-octave` | **R** identity |
| Depth: factor-2 / factor-3 line-class contrasts, parameter-free; exact local-mean depths −3/7, +1/7, +5/7 (upgrading former decimal figures) | `prop:ev-depth` | **D** \ |
| Comb formula Δω = 2πτ₂,eff·k_BT_H/ħ = c_s/R_eff; τ₂,eff = ℓ_κ/R_eff | `prop:ev-comb` | **D** \ |
| Platform windows R_eff ≳ 1.7ℓ_κ / 6.3ℓ_κ; healing-length reading marginal/fails (EXT hydrodynamic bound); ℤ₂-fold specification | `prop:ev-window` | **D** given mapping; mapping [M] |
| Sensitivity vs published capability (Nature 569, 688; Nat. Phys. 17, 362; CRP 2025; LivRev); kill-criterion not tripped; platform-existence qualification | `rem:ev-sens` | **D** \ |

### N2b Ground-Sector island note — `GBH4_N2b_Ground_Sector.tex`

| What is derived | Site | Rigour |
|---|---|---|
| Warp elimination on the ground sector: χ = e^{−(d_w/2)A}χ̃ reduces the transverse-massless fibre problem to the flat pillowcase Spin^c operator; (m,n) — hence d_odd(n) — labelling survives the warp exactly | `lem:n2b-rescale` | **D** (given EXT warped-KK Dirac decomposition; exponent core machine-checked) |
| Measure cancellation: \ | χ\ | ²e^{d_wA} = \ |
| Constant conduit factor: \ | χ̃_n(locus)\ | ² common across the tower |
| **Relative pattern, warp-neutral**: 𝒜(n)/𝒜(1) = d_odd(n)·E(n)/E(1); geometric envelope d_odd(n)q^{n−1}, q = 8.4047×10⁻⁶ at τ₂ = 1.86 | `prop:n2b-pattern`, `eq:n2b-pattern` | **D conditional on the declared emission premise** (`prem:n2b`, Motivated — never absorbed; deflationary reading in-document §5) |
| Excited-block coupling: ⟨e^{2A}⟩ = (1−e^{−2ζ})/2ζ = 1.326×10⁻²; shift coefficient 2.11×10⁻³·λ_b² on the π-level | `rem:n2b-excited` | **D** (algebraic evaluation machine-checked; first-order shift D-qualitative) |
| N2 kill-criterion (warp washout of the arithmetic): not tripped — non-tripping derived | `lem:n2b-rescale` + `prop:n2b-pattern` | **D** |
| **H5 discharge, confirming direction**: KK block structure λ² = λ_b² + λ_f² holds exactly through the warp on the base-ground (multiplicity-6) sector; deforms by the small computed shifts off it — A3-chain 6 × 2 = 12 assembly (`prop:asm`) now stands with its main conditional closed; residuals (stratum distinctness; fibre-factor identification) remain [M] | `GBH4_N2b_Ground_Sector.tex` `lem:n2b-rescale` + `rem:n2b-excited` | **D** (ground sector) |

---

### Supplementary lemmas awaiting a home — `Supplementary_Lemmas_v2.md`

Island note holding (A) lemmas with fixed statement and open proof, and (B) lemmas proved with Lean verification and no paper to sit in. One row per entry; the row moves when the entry finds a paper and the entry is then deleted from the note.

| What is derived | Site | Rigour |
|---|---|---|
| **SL-B-1 — Co-function lemma for $\theta_{23}$** (formerly SL-A-1): with $X = (\ln\varphi + \Phi_\omega)/\pi$, (1) the $\omega$-datum $w = X + i \in \mathbb{C}_i$ at corner $B$ has angle $\arctan X = \theta_{12}$ from the Hopf axis (log-spiral pitch under the conformal projection $(t,p) \mapsto e^{t}p$); (2) the unit corner state in $\mathbb{C}_j$ at corner $C$ with Sol component $X$ is $e = X + j\sqrt{1-X^2}$ and has angle $\arccos X = \theta_{23}$ from the Sol axis; (3) $\theta_{12} + \theta_{23} < \pi/2$; (4) $0 < X < 0.66$ at the MEF value. The v1 form (a unit $e$ with $\langle u, e\rangle = X$ for the unit generator $u$) is **false**. Inputs: Paper 3 `sec:completion`, `cor:closure`, `cor:transit` (R); Paper 1 `lem:quarterlift` (D; unverified at source); Addendum lines 1238, 1254 | `Supplementary_Lemmas_v2.md` §B, SL-B-1 · CERT `SL_A1_cofunction.lean` (Lean 4.29.1 / Mathlib 5e932f97; 17 headline declarations; zero `sorry`; `propext`, `Classical.choice`, `Quot.sound` only) | **D** (PI ruling 31 Aug 2026; one D-graded inference: corner lift $\to$ corner state) |


## v18 changelog

**Publication precedence established (PI ruling).** The order in which the six citable papers reach peer-reviewed journals: **Paper 3 → Paper 5 → Paper U → Paper 4 → Paper 1 → Paper 2**. The **earliest-published paper containing a result owns its ledger row.** Later papers reproduce results in-document under the island rule — so the referee never leaves the document — but receive **no row** and are **not amended**. One row, one site.

**Blocks written from source.** Each paper's formal statements were read from its `.tex` and the rows written from the statement *bodies*, not from prior ledger entries. Rigour grades are inventory-mode, taken from each paper's own accounting where it has one (Paper 3 §9.1).

**Paper 4 block rebuilt from source** (`P4_paper_v3.tex`, supplied). All twenty-two formal statements read from the `.tex`; rows written from the statement bodies. **Correction recorded**: an earlier v18 working pass deleted Paper 4's $\dodd$ row wholesale on the strength of the v17 row text. Reading the source showed this was wrong — Paper 4's `prop:rules` contains **five** rules, one of which (**perfect-square parity**: $\dodd(n)$ odd $\iff n_{\mathrm{odd}}$ a perfect square) **does not appear in Paper 5**. Paper 5 owns the four overlapping rules; **Paper 4 retains the parity rule**. The row is split accordingly.

**Rows deleted (fossil rows for results now owned by a citable paper; deleted outright, no "consumed by" pointers retained):**

*Now Paper 3's:* Paper I Ch 3 (χ(K₈)=12) · Paper XVI §2.2 `prop:euler` (χ(K₈)=12) · Paper XVI §5.3 `prop:pillowchi` (χ(T²/ℤ₂)=2) · Paper XX §7 (Fixed-Point Vanishing) · Paper XXI §2.6 (λ_{0,2}=π) · Paper XXII §2.3 `thm:dim-12` (Why Dimension 12) · Paper 4 §8 `sec:spincsetup` ("canonical" Spin^c corner lift) · Paper V §11 (φ_ω "canonical", resting on the lift) · Paper 1 `lem:quarterlift`'s lift clause.

*Now Paper 5's:* Paper 4 §6 `prop:rules` — **the four overlapping $d_{\mathrm{odd}}$ rules only** (orbifold projection, tensor factorisation, protected values, odd-part identity), formerly "CANONICAL SITE, Ruling 11(a)". **Paper 4 retains perfect-square parity**, which Paper 5 does not state.

**Rows trimmed (composite; only the colliding clause removed):** Paper XI §6 — the χ(K₈) = c₄[K₈] clause removed; **N_gen and θ_QCD retained**, being distinct index-theoretic statements Paper 3 does not make.

**Island notes absorbed into Paper 3:** R5, R6, R8, R9, R10, C1–C6, Ca, and the "Observable: Fixed-Point Vanishing" section. These were preparatory reproductions of results the published paper carries.

**Banked rulings overturned by precedence (PI-authorised):** χ(K₈) canonical at Paper I (v7 delta, R3 pointer correction) → now **Paper 3**. The $d_{\mathrm{odd}}$ selection rules canonical at Paper 4 (Ruling 11(a), v16) → now **Paper 5**.

**Rows checked and explicitly NOT deleted** (results the later paper does not contain): Paper V §7.5 gravitational hierarchy — Paper 2 supplies the ingredients but never composes them and never mentions the electroweak scale. Paper IX §4 QC Dilaton anomaly — no anomaly, baryon current or γ⁵ appears in any citable paper.

**Standing note (banked so it is not rediscovered).** The two base half-periods are **closed, not open**: L_ω = 12π (Paper 2 `cor:zeta` under Σ-3) and L_ψ = 12π/τ₂ (via τ₂ = L_ω/L_ψ, Paper 1 §2.1). No research programme is required to derive them.

---

## v18 — exhaustive fossil sweep

All **493 fossil rows** were cross-matched against the ~137 canonical results held by the six citable papers. Candidate matches were then adjudicated **by hand against the row's stated result**, not by pattern alone: a fossil row is deleted only where **its result** is now canonical elsewhere, never merely because it *consumes* a canonical quantity.

**Nineteen fossil duplicate rows deleted:**

| Fossil site | Result | Now canonical at |
|---|---|---|
| Paper I Ch 3 | Spin$^c$ structure, $L = \Ocal(3)$, $c_1(L) = 3h$ | Paper 3 `prop:c1-detline-three` |
| Paper I App A | Spin$^c$ holonomy $e^{i\pi/2}$ on the $\omega$-cycle | Paper 1 `lem:quarterlift` |
| Paper I Addendum §3 | $\zeta = 12\pi$ / `thm:warp-exponent` | Paper 2 `thm:warp-exponent`, `cor:zeta` |
| Paper IV §5 | Strict topological exponent $n = 8$ | Paper 2 §5.1 |
| Paper IV §5 | Suppression $e^{-96\pi}$ | Paper 2 §5.2 |
| Paper IV §6 | Geometric prefactor $V_{\min}$ | Paper 2 §6.5 |
| Paper IV §7 | Cosmological constant $\Lambda_{\mathrm{eff}}$ | Paper 2 §8.1 |
| Paper IV §7.4 | Positive (de Sitter) sign | Paper 2 §7.2 |
| Paper V §7.4 | Planck mass relation `eq:MPl` | Paper 2 §6.4 |
| Paper XI §3.1 | Spin$^c$ structure via $L = \Ocal(3)$ | Paper 3 |
| Paper XVI §2.3 | Spin$^c$ structure, $c_1(L) = 3h$ | Paper 3 |
| Paper XXI | Hyperfinite II$_1$ realisation | Paper 3 `thm:c3-completion` |
| Paper XXII Thm 2 | Numerical rigidity (the two threes) | Paper 3 `thm:rigidity` |
| Paper XXII Thm 4 | Swann–Torsion–Shadow correspondence | Paper 3 `thm:swann-torsion-shadow` |
| Paper XXII | `prop:sector-chirality` | Paper 3 `thm:sector-chirality` |
| Paper XXII | $\vartheta_2$ fractional corner spectrum | Paper 3 `cor:q1-absent` |
| Paper XXII | `prop:lambda-pi` ($\lambda_{0,2} = \pi$) | Paper 3 `prop:lambda-pi` |
| Paper XXII | `prop:universal-vanishing` (FPV) | Paper 3 `lem:fpv` |
| GBH4-Evaluation note | $\dodd$ identity, octave symmetry, protected values | Paper 5 `lem:dodd` |

**Rows examined and explicitly NOT deleted** — each *consumes* a canonical quantity inside a **different** result, which is not duplication:

- Paper XX "Five realisations of Fixed-Point Vanishing" — Paper 3 owns the **lemma**; the five-realisation instantiation table is a distinct result.
- Paper XVIII $\Gamma_0(36)$ modular covariance — asserts covariance of a **different object**; the level is shared, the theorem is not.
- Paper XI $\dodd$ **definition** — a definition, not the selection rules.
- G-BH-4 KK Hawking channel weights — a **gap-cluster registry** row, not a derivation site; the derivation is Paper 5 `prop:pattern`.
- Papers III, V, VIII, X, XI, XIII, XIV, IX, the Companion Paper, the photon working paper — rows consuming $\tau_2$, $\phi_\psi$, $W_{\mathrm{base}}$, $\zeta$, $\chi(\Keight)$, $c_1(L)$, or $\delta_{\mathrm{CP}}$ **inside** dark-matter ratios, PMNS angles, biocentric parameters, baryogenesis counting, and the fine-structure formula.

**Result: every canonical result now has exactly one derivation site in the registry.**

---

## v18 — YM-Foundation-A promoted to canonical

**Block rebuilt from source** (`YM_Foundation_A.tex`, supplied). All twelve formal statements read from the `.tex`; rows written from the statement bodies. The previous block was inherited from v17 and written without the source.

**PI ruling (a), banked.** Of `prop:doddprops`'s five clauses, three are already owned and **stay where they are**: octave symmetry (iii) and protected values (v) at **Paper 5** `lem:dodd`; multiplicativity on coprimes (iv) at **Paper 4** `prop:rules`(3). The odd-part identity of `def:dodd` likewise stays at **Paper 5**. YM-A receives a row for clauses **(i) $\dodd(1) = 1$ and (ii) $\dodd(n) \geq 1$** only — trivial in themselves, but they are what makes the degeneracy function of $\class$ nowhere-vanishing, and so are load-bearing for `prop:identification`.

**New canonical rows (verified against Papers 3, 5, U, 4, 1, 2 — no predecessor holds them):**

- **`lem:corners`** — corner distinctness. Papers 3 and 4 *set up* the four two-torsion fixed points; **neither states distinctness as a lemma**. Paper 3 `cor:transit` gives geodesic *separation in the quotient metric* — a different statement.
- **`lem:positivity`** — $\Delta > 0$, unconditional.
- **`prop:appell`** — $[y^0 q^m]\,\mu = \dodd(m)$. **Paper 4 carries Appell–Lerch material but does not state this identity.**
- **`thm:betti`** — odd cohomology of the framed moduli $\Mod(r,n)$ vanishes; $\chi$ = absolute Betti count. **Distinct object from Paper 5 `prop:betti`**, which is the Betti sequence of $\Keight$.
- **`def:class`, `prop:identification`, `prop:transfer`, `cor:scope`** — no predecessor.

**Fossil sweep against YM-A: zero deletions.** Two rows were examined and **retained**:

- **Paper XVII Theorem B** ("THE CANONICAL AND SOLE SITE FOR THE YANG–MILLS MASS GAP") — **not superseded**. XVII claims the mass gap for pure $SU(3)$ reconstructed from the $q^0$ sector. YM-A proves an **unconditional geometric statement** ($\Delta > 0$, from corner distinctness and metric continuity — no gauge theory enters) plus a **conditional transfer** over a declared class $\class$, with the *value* of $\Delta$ explicitly disclaimed at `cor:scope`. **Different claims.**
- **G-YM-2 (gap cluster registry)** — a **registry row recording a closure**, not a derivation site. It already points at YM-A `prop:transfer` as the canonical site. Retained; it is the registry working as designed.


---

## v19 — Paper D promoted to canonical (merger of the island papers A and C)

**PI rulings banked (21 Aug 2026).** Gate G-D1 passed: the island manuscripts `Hyperfinite_Quaternionic_v7.tex` (Paper A) and `Equivariant_Dirac_-_Decorated_Hyperfinite_v10.tex` (Paper C) are superseded as submission units by the single merged paper **Paper D** — *Rigidity and geometric realisation of a decorated hyperfinite factor* (working title), source `PaperD_main_v2.tex`, 42 pp., compiled clean. **Venue re-ruled 21 Aug 2026: Annals of K-Theory**, on exact subject fit and speed; **Transactions of the AMS is the banked fallback on rejection** (double-anonymous; suggested editor Musat or Kerr). The A and C manuscripts are absorbed as preparatory to D in the manner of the island notes absorbed into Paper 3; their results receive rows only under D. The label-to-numbering aid is `D_label_map.md` (145 labels).

**Register of citable papers extended.** Paper D joins the citable set as an island (cites no corpus material; ten external items after bibliography union, 32 entries). It enters the earliest-published precedence order on its publication date; until then it owns only its own rows, all verified against Papers 3, 5, U, 4, 1, 2 and YM-A — no predecessor holds them.

**Explicitly NOT claimed by Paper D (one row, one site):** the hyperfinite completion and the transpose anti-involution with its classification remain at **Paper 3** (`thm:c3-completion`, `prop:c3-tau-exists`/`prop:c3-classification`) — Paper D reproduces them in-document under the island rule and receives no row. Paper XXI §7 `thm:alternation` is **untouched**: its result (the Kloosterman alternation, [D] under the ruled geometric identifications) is not Paper D's; D's new orbit row below is the bare algebraic decomposition with the $\Theta$-action, a standalone statement no registry row holds.

Rows now held in the Paper D section above (refreshed to `PaperD_main_v5.tex` at v20).

---

## v20 changelog (31 Aug 2026)

1. **Paper D refreshed to `PaperD_main_v5.tex`** and given a top-level section among the citable papers. Fourteen-file certificate suite; consolidated Zenodo record `doi:10.5281/zenodo.22044976`; `C_C5_ko_colimit` names the $KO$ certificate. Paper 3 remains canonical for the hyperfinite completion and the transpose anti-involution with its classification; Paper D holds only what Paper 3 does not (PI ruling 31 Aug 2026). One row added against v2: the separation of the two Klein four-groups (`A4:prop:two-kleinfour`, CERT `A_C8`).
2. **Paper III V16 row for the four PMNS angles deleted.** V16 contains no §§10–12 and disclaims the PMNS angles (V16 §9.4). The angles are now sited at **Paper III Addendum v11 §Phase III**, eight rows; $\theta_{23}$ carries M (co-function identification open; PI ruling 31 Aug 2026), the other three observables D per the closure theorem (line 1294). Neither paper is rewritten.
3. **Three Paper XXI rows deleted** as duplicates of results now held at Paper 3 or Paper D: the UHF inclusions preserving $\mathbb{H}$ pointwise (Paper 3 `thm:c3-completion`(a)); the corner ↔ sub-algebra dictionary (definition of the decoration at Paper 3 §`sec:completion`; theorem form at Paper D `C3:lem:equivariance`, `C5:lem:quaternion`); the two Klein four-groups (Paper D `A4:prop:two-kleinfour`).
4. **Supplementary lemmas register created** (`Supplementary_Lemmas_v1.md`, island note, registered alongside notes A, B and N2b). First entry SL-A-1, the co-function lemma for $\theta_{23}$, grade M; the $\theta_{23}$ row under the Addendum points to it.


## v21 changelog (31 Aug 2026)

1. **$\theta_{23}$ closed.** The Addendum row for $\theta_{23}$ regraded **M → D**; the Phase III closure row now reads D for all four observables. The co-function identification is proved at SL-B-1 from Paper 3's decorated fibre (`sec:completion`, `cor:closure`, `eq:c3-quat-fixed`, `cor:transit`) together with the Addendum's statement that no edge is traversed for $\theta_{23}$ (line 1254); an interim declared axiom (Σ-1, Sol-component matching) used earlier the same day is retired as derived. Lean-certified. The Addendum's own M tags (lines 1255, 1294, 1372) are now stale; paper not rewritten.
2. **SL-A-1 → SL-B-1.** The supplementary-lemmas register advances to `Supplementary_Lemmas_v2.md`; the entry moves from §A (to prove) to §B (proven, Lean-verified). Statement corrected: the vector paired with the Sol axis is the corner state in $\mathbb{C}_j$, not the cone generator $u$; the v1 form is recorded false. Certificate `SL_A1_cofunction.lean` (not yet in `shalome-ai/MEF_Proof`; not under CI).
3. **Open items recorded, not opened.** (a) Addendum v11 line 1227 cites a "[E4] canonical-normalisation projection rule" in §phase2-closure that does not exist in the text; the bracketed tag scheme [E4]/[F4]/[H2] is undefined in v11 ([F4] resolves by context to `axm:phase4-projection`; [E4] and [H2] do not resolve). The rule by which $\Phi_\omega$ enters the slope additively is therefore uncited in v11, upstream of $\theta_{12}$, $\theta_{13}$ and the Phase IV-B cumulative-walk phases. (b) Coordinate-to-cycle convention: Paper 3 `cor:transit` writes periods $(L_\psi, L_\omega)$ with $C_{1,0} \to \mathbb{C}_i$; Addendum line 1222 assigns $\Phi_\omega$ to $\mathbb{C}_i$. Both agree $B = \mathbb{C}_i$, $C = \mathbb{C}_j$; the $\theta_{23}$ derivation is unaffected; the convention should be confirmed once across the two papers.
4. **Paper 1 not in the project.** `lem:quarterlift` was consumed via the ledger row (line 179) and the Addendum's local re-derivation §Wbase; it has not been read at source in this session.
