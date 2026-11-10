# M3 WP1–WP4 — the proposed classifications checked against the M1 and M2 text

**Working file, 10 November 2026. Item-by-item verdicts; the synthesis and the confirmation are the PI's (M3 SOW §6). No prose of the paper is written from this file until the PI confirms.**

**What was read.** M1 in full (`canon/M1/Paper_M1_Four_Axioms_v2.tex`, ll.46–562 and Appendix B); M2 in full for statements and readings (`M2_WP0_definitions.tex`, `M2_WP2_handedness.tex`, `M2_WP5_omega.tex`, the main file ll.50–131; `M2_WP3_master_equation.tex` ll.13–204, 250–374; `M2_WP4_warp_exponent.tex` ll.11–286). Printed theorem numbers were taken from the two PDFs. The axioms are as transcribed in `M3_AppA_axioms.tex`.

**Classes (M3 SOW §1).** T: theorem of M1–M2. TT: theorem target, with the owing paper. I: independent axiom. N: not an axiom.

**Rule used to give each axiom one class.** Most of the old axioms are a headline statement followed by riders: consequences for physics that the headline is said to produce. The class below is the class of the headline. Riders are listed separately with their own status. Where an axiom is a single block with no headline (the mathematical axioms), the class is T only if every assertive clause is in M1–M2.

**Rigour.** T at [D] means: derived in M1/M2 under their numbered readings and the minimality principle. None of the T verdicts is unconditional; each names what it rests on.

---

## 0. Corrections to labels, found while checking (not verdicts)

| # | Finding | Evidence |
|---|---|---|
| L1 | The corner three-cycle is **M1 Proposition 4.4**, not 4.3. M1 Theorem 4.3 is "the Fibonacci drive" (M₀ = F², F ∉ SL₂(ℤ)). The ledger row "M1 Prop 4.3" is off by one, and Theorem 4.3 has no ledger row | M1 ll.254, 264; M1 PDF ("Theorem 4.3 (the Fibonacci drive)", "Proposition 4.4 (the corner three-cycle)") |
| L2 | The frozen M2 carries the same stale number once: "M1 Propositions 4.3, 5.6" for the corner fixed by the fold and the drive | `canon/M2/M2_WP4_warp_exponent.tex` l.187. Erratum candidate; M2 is not edited here |
| L3 | The ledger tags M1 Thm 7.6 [R]; M1 tags the theorem [D] (the Künneth count of χ, given the factors, is [R], and M2 Prop 4.4 tags it so) | M1 l.477; M2 `M2_WP4` l.76 |
| L4 | M2's printed numbers, for use in M3: Def 2.1 (fifth reading), Def 2.2 (ψ), Def 2.3 (ω), Prop 2.4 (parity), Def 2.5 (variational data), Prop 2.6 (flow reversals), Thm 2.7 (handedness), Thm 3.1 (Master Equation), Def 3.2 (action), Prop 3.3 (consistency), Prop 3.4 (stiff), Thm 4.1 (warp exponent), Cor 4.2 (ζ), Props 4.3–4.5 (χ of the pillowcase, χ(K₈), flux number), Prop 5.1 (locked zero), Def 5.2, Prop 5.3 (uncorrelated zero) | M2 PDF |
| L5 | The SOW's sources list names GBH1 v10; the file held is `sources/Paper_Schwarzschild_Interiorv9.tex` (v9). Its completeness axiom was read from v9, l.388 | `ls sources/` |

`M3_WP0_I2_ledger_touch.md` has been corrected for L1.

---

## 1. WP1 — the proposed theorems (class T)

### T.1 — Σ-1, Σ-2 (a–h), Σ-3, Σ-3a

| Axiom | SOW | Verdict | Evidence in M1/M2 | Riders, and what the verdict rests on |
|---|---|---|---|---|
| **Σ-1 The Manifold** | T | **T confirmed**, [D] | M1 Thm 8.1: the minimal geometry is unique and is (S¹_Sol × S³) × [(ℂP² × S²) ×_w (T²/ℤ₂)]^{Spin^c}, χ(K₈) = 12, dimension twelve. M1 Thm 6.1 (twelve least) | Rests on M1's four readings (Defs 2.1, 2.2(i), 2.5, 2.6), the minimality principle (Def 3.2) and the declared scale. **"Vast, not small"** is a statement about the overall scale, which M1 does not derive ("it does not derive the overall scale", M1 l.502): it sits inside M1's one declared input and is neither a theorem nor a further axiom. **"Every singular phenomenon is smooth in the full geometry"** is Σ-5 and is classed there |
| **Σ-2 (head)** | T | **T confirmed**, [D] | M1 Thm 8.1 and its proof, which names the axiom and criterion forcing each factor | "Each component independently necessary" is M1's "no factor is named before it is forced". M1 does not claim that non-minimal geometries fail the axioms (M1 l.502). **The External Horizon** (alternatives undecidable from within) is a meta-statement: **N**, on the footing of 𝕄-4 |
| **Σ-2a ℂP²** | T | **T confirmed**, [D] | M1 Prop 7.2: ℂP² = SU(3)/U(2), χ = 3, c₁ = 3h, anticanonical line 𝒪(3); M1 tags it "the least direct step", two readings named. M1 Prop 7.3: w₂ = h ≠ 0 forces Spin^c | Riders, all **TT**: SU(3) isometry *is the strong force* (M1 names no gauge group, l.191; Witten's theorem is a cross-check only, l.556) — M8/M13; three generations from H^{0,2}(ℂP², 𝒪(−4)) — M8; W = 36 and the fine-structure constant — M14 |
| **Σ-2b S²** | T | **T confirmed**, [D] | M1 Prop 7.1: S² = Sp(1)/U(1), the sphere of imaginary units | Riders **TT**: sin²θ_W — M13 (blocked, F-100). The axiom's value 0.224 has no support in the canon: M1 l.548 records 1/(1+u*) = 0.22676 without interpreting it, and the series SOW lists sin²θ_W among what "does not stand" at M7. Higgs mechanism — M9/M15 |
| **Σ-2c T²** | T | **T confirmed**, [D] | M1 Prop 5.5 (the fibre is T², ι inversion, drive hyperbolic); τ₂ = L_ω/L_ψ (M1 l.364; M2 `M2_WP4` l.268) fixed with no modulus by M1 Prop 8.2 | **The value is 1.8466, not 1.86** (M1 Prop 8.2; M2 l.268). The stationarity conditions behind the cubic are hypotheses owed by M7 (M1 l.537). Riders **TT**: two homology generators as the origin of two transparent fields (with Σ-T; no route in M1/M2); modular forms and the partition function — M4 |
| **Σ-2d ℤ₂** | T | **T confirmed**, [D], with M2's refinement | M1 Prop 5.5, Thm 5.7 (z ↦ −z, four fixed points, the pillowcase); M1 Prop 5.3 (four corners) | **Two operations, not one.** The fold z ↦ −z makes the pillowcase. What separates ψ from ψ̄ is τ = (quarter-turn, s ↦ −s), with τ² = the fold (M2 Prop 2.6, eq. τ; Thm 2.7). The old axioms use "the ℤ₂ involution" for both; M3 must say which is meant each time. Riders **TT**: mock modularity — M4/M5; "creates all apparent asymmetry" — see Σ-0 |
| **Σ-2e ×_w** | T | **T confirmed**, [D] | The warp is A2 itself under M1's second reading (Def 2.2(i)); the non-warped product is eliminated at M1's table, l.512. The exponent is M2 Thm 4.1, Cor 4.2: ζ = 12π | Riders **TT**: the Planck–electroweak hierarchy and Λ_eff ≈ 10⁻¹²² M_Pl⁴ — M10 |
| **Σ-2f Spin^c** | T | **T confirmed**, [D] | M1 Prop 7.3 (forced by w₂; canonical L = 𝒪(3); twisted lines excluded by criterion (1)); "enables fermions" is the first sentence of the proof (spinors exist only through Spin^c) | Riders **TT**: L = 𝒪(3) *gives U(1)_Y* — M8/M13; Liu rigidity broken, mock modularity and the Zwegers completion — M4/M5 (see 𝕄-8) |
| **Σ-2g S¹_Sol** | T | **T confirmed**, [R] given minimality criterion (2) | M1 Thm 4.2: every trace-three element of SL₂(ℤ) is conjugate to M₀; eigenvalues φ^{±2}; entropy 2 log φ; splitting field ℚ(√5); discriminant 5. M1 Prop 4.1 (Anosov). Mixing: M2 Prop 5.3. Arrow of time: M2 Thm 2.7 and the paragraph after it | Riders **TT**: the conservation law F(½) = 1 — M25; the cascade pump — M24. "Fibonacci growth" is M1 Thm 4.3, in hand |
| **Σ-2h S³** | T | **T confirmed**, [D] | M1 Prop 7.5: Σ = S³/Γ from the model ℍ^× = ℝ_{>0} × S³, Γ trivial by the least-π₁ clause of criterion (4) | Riders **TT**: discrete spectrum, CMB low-ℓ suppression — M18 |
| **Σ-2 Euler characteristic** | T | **T confirmed** | M1 Thm 7.6; M2 Props 4.3, 4.4; ζ = χ(K₈)π: M2 Cor 4.2 | Riders **TT**: generations = χ/4 — M8; e^{−96π} — M10; the BAO factor e^{−3π/2} — M18. The hierarchy e^{12π} is M2 Cor 4.2 read as a warp |
| **Σ-3 The Pillowcase** | T | **T in part** | In hand: the pillowcase with four cone points (M1 Thm 5.7); two sheets ψ, ψ̄ = τ̂ψ of opposite handedness (M2 Def 2.2, Thm 2.7); base coordinates (θ_ψ, θ_ω) (M1 App. B) | **Not in hand: "two walls and an ω-axis creating four sectors".** In M2, ω is a field (the τ̂-even part, Def 2.3), not an axis; θ_ω is a coordinate label; whether θ_ω is the flow coordinate is left open in M2 (`M2_WP2` ll.165–167, [M]) and no later section of M2 closes it. τ exchanges the ψ- and ω-half-period corners P₂ ↔ P₃ (`L5_tau_corners`), so the 2 × 2 table "ψ or ψ̄ against low or high ω" is not a structure M1/M2 exhibits. "Wall" is used in M2 without a definition. The series SOW already holds the open item that the corpus's wall picture is to be re-expressed in τ's terms. The contents of the four sectors (Standard Model; life; dark matter; dark consciousness) are riders, **TT** (M8, M17) or outside the mathematics of the series (M19–M21 are the nearest) |
| **Σ-3a The Quaternionic Layer** | T | **T confirmed**, [D] | M1 Prop 5.6: the algebra is ℝ at P₁, ℂ_i, ℂ_j, ℂ_k at the three other corners, ℍ at every point with trivial stabiliser. M1 Props 5.2–5.4; M1 Prop 4.4 (the drive fixes P₁ alone) | Rests on M1's one [D] reading in §5 (ι on the algebra identified with ι on spinors, M1 l.336), refined by M2 (ι = τ²). Riders **TT**: the three Millennium closures from the uniqueness of C₀ — M23, M24, M25 |

### T.2 — Σ-4 The Three Fields

**SOW: T. Verdict: T confirmed, with two corrections the canon already settles.**

- Evidence: M2 Def 2.2 (ψ a section of the Clifford module M ≅ ℍ³², shadow ψ̄ = τ̂ψ), Def 2.3 (ω = ψ + ψ̄), Prop 2.4 (Φ_QC the unique lowest-order even scalar vanishing on both degenerate loci; [R] given the two vanishing conditions, one of which is [M]), Thm 2.7 (opposite handedness).
- **One field, not three.** In M2 the shadow and ω are both determined by ψ: "the two sheets of A2 are therefore one field" (`M2_WP0` l.126). Its independent parts are the even part and the odd part. "Three fundamental degrees of freedom" does not survive as stated. (M2 itself says "the fundamental fields are the sheets ψ, ψ̄ and the Coherent Field ω" once, `M2_WP3` l.159; M3 should use Def 2.2's wording.)
- **The square is the modulus squared**, Φ_QC = ω|ψ − ψ̄|² (M2 Prop 2.4).
- **Rider not in hand, and in tension with M2 as written: "Φ_QC ≠ 0 topologically".** M2 shows Φ_QC vanishes at the real corner P₁ (`M2_WP0` ll.227–231), wherever the sheets are locked (Prop 5.1), and wherever they coincide. Read pointwise, the rider is false in M2. What M2 does prove is that the sectors are distinct: a non-zero ψ of definite chirality cannot equal its shadow (Thm 2.7). That gives ψ − ψ̄ ≢ 0; it does not give Φ_QC ≢ 0, since ω may vanish. The rider is the "topological lock" used by 𝕄-2 and 𝕄-3 for the Navier–Stokes and Riemann arguments, so it needs a precise statement and a proof where it is first consumed: **TT**, owed by M5 or M22 (no paper is named for it in the series SOW).

### T.3 — Σ-6 Shape Determinism, Σ-7 Dimensional Simplicity

| Axiom | SOW | Verdict | Reason |
|---|---|---|---|
| **Σ-6** | T | **T confirmed**, relative to A1–A4 plus minimality | Its content is (a) the minimality principle's first criterion, no modulus (M1 Def 3.2(1); the standing principle, M2 §2.1); (b) the theorem that the minimal geometry has none: M1 Thm 8.1 and Prop 8.2 ([D]; stationarity hypotheses owed by M7). **Exception to "no free parameters": one dimensionful input, the overall scale** (M1 Thm 8.1, Prop 8.2: a saddle, "held by a sector the axioms do not supply"). Rider **TT**, paper by paper: that each named quantity (α, the baryon asymmetry, the mass ratios, Λ, the dark-to-visible ratio) is an invariant of the geometry |
| **Σ-7** | T | **Not confirmed. Recommended class: N (interpretation)** | The SOW's evidence does not carry it. M1 Def 3.2 is a rule for selecting a geometry; M1 Thm 6.1 is the least dimension. Neither says that complexity is a projection artefact. The axiom has no formal statement ("the second, third, fourth, or fifth derivative of a much simpler shape"), and nothing in the old document consumes it: Paper XX names it only in its own heading, two summary tables, the reading note and the resonance appendix. It is an outlook, close in spirit to Σ-5 |

### T.4 — 𝕄-7 The Sol Monodromy

**SOW: T. Verdict: T confirmed**, [R] given minimality criterion (2), with the one correction already banked (P17).

Clause by clause: the matrix and its eigenvalues φ^{±2} — M1 Thm 4.2. The exponent — M1 Thm 4.2 states "its entropy is 2 log φ"; the axiom's "ln φ" is the error of Corpus Errors entry 23. The fixed point φ of τ ↦ (2τ+1)/(τ+1) — M1 Thm 4.2, proof (fixed points φ and −1/φ). Anosov — M1 Prop 4.1. Mixing — M2 Prop 5.3. Arrow of time — M2 Thm 2.7.

### T.5 — 𝕄-8 The Spin^c Twist

**SOW: T. Verdict: not confirmed as a whole. Recommended class: TT (M4, with M5), first clause in hand.**

The first clause, "the Spin^c structure on K₈ — forced by w₂(ℂP²) ≠ 0", is M1 Prop 7.3. Everything else the axiom asserts is absent from M1 and M2: that the twist breaks Liu rigidity, that it activates the spectrum d_odd(n), the rigid genus A₂ = 1 − y + y², mock modularity and the Zwegers completion. Those are the cone-tip spectrum and the twisted genus (M4) and the completion (M5). Since the axiom is a single block and most of it is unproved, T would overstate what is in hand.

### T.6 — Σ-0 Universal Symmetry

**SOW: T with a caveat. Verdict: T confirmed with the caveat, [D]; the caveat is M2's own.**

- In hand: the flow reversal τ exists and is a symmetry of the Sol block (M2 Prop 2.6; isometry of the Sol metric, `M2_WP2` ll.153–156); it is the involution of A2 (M2 eq. τ, [D], Minimality M2-5); the two sectors are exchanged by it and have opposite handedness (M2 Thm 2.7). Total chirality across both sectors zero is Thm 2.7.
- **The symmetry is exact for the exponent and not for the period lengths.** M2 `M2_WP4` ll.264–270: the exponent 12π is τ-symmetric; "what is not conventional is the aspect ratio", τ₂ = 1.8466, so the rate k differs by τ₂ between the sheets. "Every apparent asymmetry is a confinement artefact" therefore does not hold as stated: τ₂ is a real difference between the sheets. The SOW's phrase "an isometry of the flat base only if τ₂ = 1" is elementary (the quarter-turn preserves a rectangular flat metric only when the periods are equal) but is not a sentence of M2; M3 should cite M2's wording.
- Riders **TT**: total baryon number zero and total charge zero across both sectors. Nothing in M1/M2 bears on them, and **no paper of the series is named for them** (the old baryon-asymmetry paper has no place in the M1–M25 table).

---

## 2. WP2 — the proposed targets (class TT) and their owing papers

| Node | Axiom | SOW owing paper | Verdict | Notes from the check |
|---|---|---|---|---|
| TT.1 | **𝕄-6** spectral data | M4 | **TT (M4) confirmed** | Nothing in M1/M2; M2 §5.5 marks the spectrum as open, [M]. The axiom states the spectrum of D² on K₈ and then says D² "sees only the base"; the series SOW gives M4 the cone-tip spectrum of the pillowcase. M4 must state which operator is meant |
| TT.2 | **𝕄-5** partition function | M4 | **TT confirmed; owing M4 and M5** | The mock Jacobi form is M4's; the second sentence (its completion is a harmonic Maass form) is M5's by the series SOW |
| TT.3 | **𝕄-1** observables as spectral data | M4 | **TT (M4) confirmed** | "Central charge c = 12" appears nowhere in M1/M2 |
| TT.4 | **Σ-8** the ω-drive | M2 + M4 | **TT (M4) confirmed; the field-level half is in hand** | M2 Prop 5.1 (ω = 0 when locked), Prop 5.3 (ω averages to zero when the phase is uniform), §5.3 (one hump, [D]). The identification with a spectral functional is [M] in M2 and owed by M4 (Future-Mx F-1). **Σ-8 is one-sided as written**: it describes low ω as ordered and high ω as interconnected, and omits the second zero, the uncorrelated one, which M2 derives. M3 must restate it with both zeros |
| TT.5 | **Σ-P** permeability | M10, M11 | **TT confirmed; owing papers corrected to M8 (impermeable) and M11 (puncture)** | "Transparent": in M2 the metric and Φ_QC are fields on all of M₁₂ (Def 2.5, Thm 3.1). But so are ψ and the Spin^c spinor; nothing in M2 separates fields that cross "shells" from fields that do not, and "dimensional shell" is not a notion of M1/M2. The SOW's "Spin^c line confined to K₈" is not in M2: what M2 has is that the flux quanta sit on the base cycle (Prop 4.5, [D]). Quasars as inward conduits: no paper named |
| TT.6 | **Σ-T** dual transparency | M2 + M8 | **TT confirmed (M8); two clauses with no route** | The form of the equation (two geometric sources, G and ζT^Φ) is M2 Thm 3.1. "Exactly two transparent fields, from the two homology generators of T²" has no counterpart in M1/M2 and no owing paper. "Structured diversity requires at least two" is an argument, not a mathematical statement: N in character |
| TT.7 | **Σ-S** shadow influence | M5 + M10 | **Headline T; riders TT with owing papers M5 and M17 (not M10)** | The headline, "the AQ-wall is not in a different dimension", is in hand: ψ̄ = τ̂ψ is a section of the same module over the same M₁₂ (M2 Def 2.2) and is the chiral mirror (Thm 2.7). Channel one, gravity: the shadow enters the curvature through ζT^Φ (M2 Thm 3.1); its identification with dark matter is M17 in the series SOW, not M10. Channel two, ω: true by definition (M2 Def 2.3). Channel three, the mock modular completion: M5 |
| TT.8 | GBH1's completeness axiom | M11; "M3 says whether it is A1" | **It is A1, under the fifth reading, for the Riemannian statement; [D]** | See §2.1 |
| TT.9 | Paper 2's Σ-3, k_ω = 1 | M7 | **Recommended class: N (choice of unit); what remains is M1's declared scale** | See §2.2 |

### 2.1 TT.8 — is causal completeness A1?

The axiom (GBH1 v9 l.388): admissible configurations are smooth solutions on M₁₂ that are causally geodesically complete.

1. A1, formal (M1 Def 2.1): T, Σ and F are compact, connected and without boundary.
2. Fifth reading (M2 Def 2.1): the metric of M₁₂ is positive-definite.
3. External, standard: a compact Riemannian manifold is geodesically complete (Hopf–Rinow). The cone points do not obstruct this: K₈'s base is the quotient of a torus by the fold, and geodesics are those of the compact cover.

So under the fifth reading every smooth metric on M₁₂ is geodesically complete: the completeness half of the axiom is a consequence of A1, at [D] (it depends on reading R5).

What does not follow from A1:

- **"Smooth solutions".** Smoothness is M1's setting (a geometry is "a smooth shape … allowed to have a few isolated sharp points", M1 l.117), not a consequence of closure.
- **"Causally".** Causal completeness is a statement about time-like and null geodesics. In Lorentzian signature compactness does not give completeness (the Clifton–Pohl torus is the standard counter-example). Under the fifth reading the statement has to be read along the flow, and how GBH1's selection argument reads there is M11's to establish.

Owing paper for the remainder: M11, as the SOW has it.

### 2.2 TT.9 — Paper 2's Σ-3

The axiom (Paper 2 v7 l.643): lengths are measured in units of the inverse warp rate, k_ω = 1; "the paper's single dimensionful normalisation".

M2 already contains this as a statement of units: kL = 12π (Thm 4.1, Cor 4.2), and "in this series 'L_ω = 12π' means the half-period transverse to the ψ-wall, in the sheet called ψ, in the unit of [κ₂² = 2/L]" (`M2_WP4` ll.271–273). Setting k = 1 is that unit. It asserts nothing about the world; the one dimensionful fact is M1's declared scale (Thm 8.1). What a later paper owes is the relation of this unit to κ₁₂ (the Planck closure the series SOW gives to M10) and the normalisation κ₂² = 2/L at [R] (ledger target, M7 or M10).

Paper 2's other two axioms, for completeness: its Σ-1 (the internal geometry) is M1 Thm 8.1; its Σ-2 (the two-dimensional effective action) is the base restriction of the Master Equation, "not an axiom" (M2 `M2_WP3` ll.343–344; `M2_WP4` l.151).

---

## 3. WP3 — Σ-5 = 𝕄-2, the Shadow Principle

### S.1 — the statement, from the old wording

Σ-5 and 𝕄-2 together assert four things:

- (a) every apparent singularity in a lower-dimensional description is a projection artefact;
- (b) the completed object on the full geometry of M₁₂ is smooth and complete;
- (c) the completion is achieved by the Zwegers completion (in τ) or the GL(3) Eisenstein completion (in s);
- (d) the completion is unique given the topological data of K₈.

One imprecision to carry into M3: Σ-5 says "what looks singular in n dimensions is smooth in n + 1" (a fluid in 3 to 4; a zero in 2 to 3), while 𝕄-2 and the SOW's S.1 speak of the full twelve-dimensional geometry. These are not the same claim.

### S.2 — the attempt from A1: result

**Part (b), completeness of the twelve-dimensional geometry: follows, at [D].** This is the argument of §2.1: A1 (compact, no boundary) with the fifth reading and Hopf–Rinow gives geodesic completeness of any smooth metric on M₁₂. In the sense of geodesic incompleteness there are no singularities in M₁₂. Hypotheses: A1; R5; M1's setting of smooth geometries with cone points.

**Parts (a), (c), (d): do not follow from A1 with M1 and M2. Three gaps.**

1. **Smoothness is assumed, not derived, and M2's own solution is not smooth.** The warp profile of M2 is a(θ) = a(0) − k|θ| with an exact jump in its derivative at the flux-carrying corner and a delta-function flux density there (`M2_WP4` eqs. flux-density, bulk, kink). M2 says the smooth backreaction changes the shape between the walls "without touching" the jump. So the configuration M2 exhibits is a thin-wall one. Whether a smooth configuration exists of which it is the limit is not shown in M2. This is a gap in the existence half, not a contradiction: I report it as my reading of M2 §4.
2. **Existence of a lift for a given lower-dimensional singularity is a separate claim for each class.** A1 says the twelve-dimensional geometry is complete. It does not say that a given singular four-dimensional solution, a fluid blow-up, or a zero of ζ(s) is the projection of some smooth twelve-dimensional object. Part (c) names the mechanisms (Zwegers, Eisenstein); those are theorems to be proved in modular forms, owed by M5 for the pillowcase and by M22–M25 for the rest.
3. **Uniqueness: the SOW's proposed route does not work.** The route was uniqueness for elliptic problems on a closed manifold (Gilbarg–Trudinger). That uniqueness is a maximum-principle result for scalar second-order equations under a sign condition. The Master Equation is a non-linear system for the metric, elliptic only after fixing the diffeomorphism gauge, and for such systems uniqueness on a closed manifold fails in general: Einstein metrics on a fixed closed manifold are known to be non-unique (Böhm's inhomogeneous Einstein metrics on spheres, Invent. Math. 134 (1998); Besse, *Einstein Manifolds*, ch. 12, on moduli). **UNVERIFIED — from memory; the two references need checking before they are cited.** Where the route does work is the linear case: at fixed metric and with V′ = 0, the dilaton equation □Φ = 0 on closed Riemannian M₁₂ has only parallel solutions (integrate ⟨Φ, □Φ⟩ by parts), so Φ is unique up to a constant. That is a true smallest case of (d), and no more.

**Consequence under the ruling already made (P6): the fallback applies to (a), (c), (d).** The derivation attempt is documented above; part (b) is kept as a theorem.

**Recommendation.** State Σ-5 in M3 in two parts: (i) *completeness of M₁₂*, a theorem at [D] from A1 and R5; (ii) *the completion principle* — a lower-dimensional singularity is the projection of a smooth configuration on M₁₂, and the completion is unique — as the series' one declared axiom, with M5 owing its test on the pillowcase. This is narrower than the old Σ-5 and is the weakest statement that still gives what 𝕄-2 uses, which is what the anticipated Minimality entry M3-1 asks for.

### S.3 — the smallest case by hand: confirmed, [R]

The cone point of the pillowcase is a singular point of a two-dimensional space (all the curvature, π, sits there: M1 Thm 5.7; M2 Prop 4.3). It is the image of a regular point of the smooth flat torus under the fold. The smooth object above it is unique: a double cover of the sphere branched over four given points is determined by the homomorphism from the fundamental group of the four-times-punctured sphere to ℤ₂ that sends each puncture loop to the generator, and there is exactly one such homomorphism. External input: the classification of branched double covers; Thurston ch. 13 for the orbifold statement (already M1's reference for Thm 5.7). Here all four parts (a)–(d) hold, in dimension two.

### S.4 — Lean certificates: not started

`M3_L1_lift.lean`, `M3_L2_count.lean`, `M3_L3_walls.lean` are not written. Their content depends on the PI's confirmation of the split in S.2 and of the class of Σ-0 and Σ-6.

---

## 4. WP4 — not axioms (class N)

| Node | Item | SOW | Verdict | Notes |
|---|---|---|---|---|
| N.1 | **𝕄-3** the proof template | N — method | **N confirmed** | The template in the axiom is: identify the shadow → construct the completion → prove the topological lock → derive the consequence. (The SOW's gloss "spectral → modular → number-theoretic" is not the axiom's wording.) Two of its four steps lean on things not in hand: the completion (Σ-5) and the lock "Φ_QC ≠ 0" (see T.2) |
| N.2 | **𝕄-4** the Gödel boundary | N — meta-statement | **N confirmed**, with a limit on what it can be used to say | The axiom asserts that Σ-5 "cannot be proved from within any single existing formal system" and calls this Gödel's theorem in action. What it reports is that three approaches did not close. That is evidence that the statement is hard, not a proof that it is undecidable; nothing in the old text exhibits Σ-5 as independent of a named formal system. Under P6 it remains the justification offered for declaring Σ-5 an axiom, and M3 should present it with "argue", not "prove". After S.2 it applies only to the completion principle, since the completeness half is derived |
| N.3 | Conventions among the Σ axioms | N | **No axiom is a convention as a whole** | Conventional elements, all already settled in the canon: the j/k assignment of corners (M1 App. B); which sheet is called ψ (M2 `M2_WP4` §4.8; Minimality M2-8); the overall sign of ψ (M2 `M2_WP5` l.137). Items moved to N by this check: Σ-7 (T.3), Paper 2's Σ-3 as a unit (§2.2), the External Horizon clause of Σ-2, and the "requires at least two" clause of Σ-T |

---

## 5. The classification as it stands after the check (for the PI's confirmation)

| Axiom | SOW class | Class after the check | Changed? |
|---|---|---|---|
| Σ-0 | T (caveat) | T, [D], caveat is M2's (τ₂) | no |
| Σ-1 | T | T, [D]; "vast" inside the declared scale | no |
| Σ-2 with a–h | T | T, [D]; physics riders TT | no |
| Σ-3 | T | T in part: pillowcase and two sheets in hand; walls, ω-axis and four sectors not | **yes** |
| Σ-3a | T | T, [D] | no |
| Σ-4 | T | T, corrected: one field; modulus squared; "Φ ≠ 0" rider TT | no (riders) |
| Σ-5 | I (attempt) | split: completeness T [D]; completion principle I (the declared axiom) | **yes** |
| Σ-6 | T | T relative to A1–A4 + minimality; one declared scale | no |
| Σ-7 | T | N (interpretation) | **yes** |
| Σ-8 | TT | TT (M4); two zeros in hand | no |
| Σ-P | TT (M10, M11) | TT (M8, M11) | owing paper |
| Σ-S | TT (M5, M10) | headline T; riders TT (M5, M17) | **yes** |
| Σ-T | TT (M2, M8) | TT (M8); two clauses without a route | no |
| 𝕄-1 | TT (M4) | TT (M4) | no |
| 𝕄-2 | I (= Σ-5) | as Σ-5 | **yes** |
| 𝕄-3 | N | N | no |
| 𝕄-4 | N | N | no |
| 𝕄-5 | TT (M4) | TT (M4, M5) | owing paper |
| 𝕄-6 | TT (M4) | TT (M4) | no |
| 𝕄-7 | T | T, [R]; exponent corrected | no |
| 𝕄-8 | T | TT (M4, M5); forcing clause in hand | **yes** |
| GBH1 completeness | TT (M11) | completeness is A1 under R5, [D]; "smooth" and "causal" owed by M11 | **yes** |
| Paper 2 Σ-3 | TT (M7) | N (unit); scale is M1's declared input | **yes** |

**Count of the twenty after the check:** T — Σ-0, Σ-1, Σ-2, Σ-3 (in part), Σ-3a, Σ-4, Σ-6, 𝕄-7, and the headline of Σ-S. TT — Σ-8, Σ-P, Σ-T, 𝕄-1, 𝕄-5, 𝕄-6, 𝕄-8. I — the completion principle (Σ-5 = 𝕄-2), with its completeness half a theorem. N — Σ-7, 𝕄-3, 𝕄-4.

## 6. Items with no owing paper in the series SOW

1. Total baryon number and total charge zero across both sectors (Σ-0).
2. "Φ_QC ≠ 0 topologically", the lock used by 𝕄-2 and 𝕄-3 (Σ-4).
3. Two homology generators of T² as the origin of exactly two transparent fields (Σ-2c, Σ-T).
4. Quasars as inward conduits (Σ-P).
5. The re-expression of the wall picture and the four sectors in τ's terms (Σ-3); the series SOW holds this as an open item for M7–M9 without a single owner.

---

## 7. After the PI's replies of 10 November 2026: the fifth axiom, and 𝕄-8

**Confirmed by the PI (P18):** the table of §5, with 𝕄-8 held for discussion.

**The fifth axiom (PI: "(iii) is the axiom"; proposed P19, Minimality M3-1).** Plain sentence, the PI's: we can see the shadow, but the shadow is missing information about what it is a shadow of. Formal content, in M1's manner:

- (i) *reading:* observables are the image of the twelve-dimensional configuration under the reduction map (M2 Def 2.5(iii));
- (ii) *remark with proof, not part of the axiom:* the reduction is not one-to-one;
- (iii) *the axiom:* every admissible observed configuration, including what appears singular, has a smooth twelve-dimensional preimage.

Uniqueness is not part of it. "One object, different shadows" is M2's structure (one field ψ, its four corner readings and two sheets, Def 2.2); which reading is which particle is owed by M8, M9, M17.

**Bounded read of `sources/twisted_genus_note.tex` (362 lines, read in full), for 𝕄-8.** The note computes the elliptic genus of ℂP² × ℂP¹ × ℂP¹ twisted by e^{ℓh/2}; ℓ = 3 is the determinant line of the canonical Spin^c structure of ℂP². It states that all results are proved from cited classical inputs with no hypotheses, and that each identity is checked numerically.

| Clause of 𝕄-8 | What the note proves | Status |
|---|---|---|
| Spin^c forced by w₂(ℂP²) ≠ 0 | not its subject | in hand: M1 Prop 7.3 |
| "Breaks Liu rigidity"; without the twist "no q-dependence", A₂ = 1 − y + y² | The untwisted genera are q-dependent (two routes). Liu's rigidity is about a circle action's parameter, not about τ. "The twist does not create the anomaly" | **does not stand** (Corpus Errors 29) |
| "Activating the q-dependent spectrum d_odd(n)" | Z_ℓ = Ell(ℂP²) − (3ℓ/2)𝒥φ₋₂,₁ + (ℓ²/8)φ₋₂,₁ (Thm, l.212). The twist adds the weight −1 and −2 components; the weight −1 component is proportional to ℓ, and the y-constant term of its Lambert function is Σ d_odd(m)qᵐ, d_odd the number of odd divisors, with Dirichlet series ζ(s)²(1−2⁻ˢ) (Prop, l.288) | **stands in a corrected form**: the odd-divisor series sits in the component the twist creates. The note proves a statement about one coefficient of a genus; it does not prove a statement about the spectrum of a Dirac operator (𝕄-6) |
| "Creates mock modularity … provides the Zwegers completion" | The form is quasi-Jacobi; its completion is algebraic; "not of the harmonic-Maass type"; no Zwegers shadow is attached; its Lambert function is not an Appell–Lerch sum | **contradicted for this object** (Corpus Errors 30); whether another object is meant is open |

**Verdict on 𝕄-8 after the read: TT (M4, M5) stands, and the axiom cannot become a theorem as worded.** One clause is in hand, one does not stand, one stands in a corrected form that M4 can state and prove from this note, and one is contradicted for the object the note treats.

**Consequence for 𝕄-5 and for the fifth axiom's first test.** 𝕄-5 calls the partition function a mock Jacobi form with a harmonic-Maass completion. For the note's object that is not so. I have not read Paper XI or Paper 3, where a different object (the pillowcase orbifold's own partition function) may be meant. **This is the one point in WP1–WP4 where the corpus is significantly against itself and I cannot tell which document, or which object, is the intended one.**

**Correction (10 Nov 2026, after reading Paper XI and Paper 3; the error was mine, twice).** In discussion I offered Bruinier–Funke's theorem as the counterpart of "identical shadows, different objects" before reading any source; I then withdrew it after reading the note alone. Both steps were premature. The position after reading: the theorem does not apply to the twisted elliptic genus (object A below), which is not mock; it does apply to the cone-tip projection of Paper 3 (object B), where Paper 3 itself uses it. The sentence in the previous paragraph, "this is the one point … I cannot tell which document, or which object, is the intended one", is resolved in §8.

---

## 8. Which object is "the partition function"? Paper XI and Paper 3 read (10 November 2026)

**Read (body text, not abstracts).** Paper XI v5: ll.195–238, 421–700. Paper 3 v13: ll.97–144, 241–292, 376–630, 1631–1713, 2233–2266. The twisted-genus note: in full. **Not read:** the rest of both papers; in particular Paper 3's §§4–7 and 9–11 and Paper XI from l.700.

**Two objects.**

| | Object A | Object B |
|---|---|---|
| What | the Spin^c-twisted elliptic genus of K₈ | the σ-odd twisted-sector projection of the Spin^c Dirac data at the four cone tips of the pillowcase |
| Where | Paper XI (12 Jul 2026); the note (28 Sep 2026) | Paper 3 v13 (28 Sep 2026) |
| 𝕄-5's wording | is Paper XI's sentence | — |
| Nature | quasi-Jacobi; completion elementary; no shadow | has a shadow, −η(2τ)³ (weight 3/2) |

**Object A — status of each statement.**

- READ: Paper XI and the note use the same function μ (Paper XI l.553; note l.280) and the same components A₀, A₁ (Paper XI ll.476–477 against note Thm l.212 at ℓ = 3).
- CHECKED (`checks/mu_check.py`): μ is an elementary expression in 𝒥 = (2πi)⁻¹∂_z log ϑ₁, to 10⁻¹⁶ at three points; 𝒥(−1/τ, z/τ) = τ𝒥 + z; adding (z − z̄)/(τ − τ̄) removes the anomaly exactly. The y⁰ coefficients of μ are the numbers of odd divisors (1, 1, 2, 1, 2, 2, 2, 1, 3, …), not their sums.
- CHECKED by hand: the q¹ coefficient of the genus of ℂP¹ by the note's Riemann–Roch formula is y^{−1/2}(3 + 3y − 3y⁻¹ − 3y²) ≠ 0, so the ℂP¹ factor is not "rigid" as Paper XI l.520 has it. The computation, with the note's formula [q¹]Ell = y^{−d/2} Σ_p (−y)^p χ(Ω^p ⊗ ((1−y)T* + (1−y⁻¹)T)) (note l.196, READ, not independently derived) and χ(𝒪(k)) = k + 1 on ℂP¹, where T = 𝒪(2), T* = Ω¹ = 𝒪(−2): p = 0 gives (1−y)(−1) + (1−y⁻¹)(3) = 2 + y − 3y⁻¹; p = 1 gives −y[(1−y)χ(𝒪(−4)) + (1−y⁻¹)χ(𝒪)] = −y[(1−y)(−3) + (1−y⁻¹)] = 1 + 2y − 3y²; the sum is 3 + 3y − 3y⁻¹ − 3y².
- Conclusion: for object A, "mock Jacobi form" is a misclassification in Paper XI, corrected by the later note.

**Object B — what Paper 3 establishes, on its own account and on my check.**

| Step (Paper 3) | Status |
|---|---|
| The corner-link spectrum μ⁺ = m + 3/2, μ⁻ = −m + 1/2 | **declared input** of the paper ("taken as given", l.1639; listed as declared at l.2243). Not derived there; not checked here |
| Telescoping: two modes at 1/4 survive per corner; trace −2e^{−t/4} (l.416) | CHECKED (`checks/paper3_check.py` item 1) |
| Corner sum with phases (−1)^{mn}: bracket 2, total −4e^{−t/4} (l.427) | CHECKED (item 2); the phases are M1 Cor 7.4 |
| The shadow is −η(2τ)³ = −Σ(−1)^k(2k+1)q^{(2k+1)²/4} (Thm l.451; Lemma l.482) | Jacobi's identity CHECKED to q³⁰ (item 3). **The step from the surviving term to the whole series: see "my reading" below** |
| A harmonic Maass form ĥ with that shadow exists (l.526) | READ; rests on Bruinier–Funke surjectivity (Verified References V-2, original unchecked) |
| The geometric completion ẑ equals ĥ up to a holomorphic function; its modular transformation is **not established** (Remark l.545) | READ; the paper's own statement |
| The full pillowcase genus 2(R₂ + R₃ + R₄) is a weak Jacobi form, no shadow (Thm l.603) | CHECKED numerically (item 4): S exchanges R₂ ↔ R₄ and fixes R₃, T fixes R₂ and exchanges R₃ ↔ R₄, value 6 at z = 0 |
| Which mock modular form the geometry computes; the decomposition of the σ-odd projection; the relation of the level-64 shadow to the level-36 system | **open**, in the paper's own words (ll.2247, 2263; Remark l.626) |
| Hypotheses H1–H4 (l.129) | declared; the shadow computation of §3.4 does not consume H1–H3 |

**My reading of one step, reported and not built on (CLAUDE.md §2: the first hypothesis is that my reading is wrong).** The telescoping leaves a single exponential, e^{−t/4}. Theorem l.451 then writes ∂_τ̄ ẑ ∝ −e^{−y/4}/y^{3/2} = g(τ)/√y with g the whole series. For the higher terms (+3q^{9/4}, −5q^{25/4}, …) the proof refers to "the ϑ₂-structure of §theta2 carrying the alternating character in the tower index, fixed independently in Proposition [l.469]"; the proof of that proposition says its support and sign "are read off [the series], whose derivation precedes it"; and the series of §theta2 (l.1635) has all coefficients +1. As I read these three passages, the spectral computation fixes the leading exponent 1/4, the multiplicity and the sign, and the full series with its coefficients (2k+1) is then identified as the weight-3/2 unary theta with that leading term, not computed term by term. The paper's own accounting lists the theorem as "proved in full" (l.2239). I cannot tell whether the gap is in the paper or in my reading; the modes above 1/4 cancelled in the telescoping, and at the physical value y = 1.8466 the second term is 2.5 × 10⁻¹⁰ of the first (item 5), so the leading term is what any numerical statement sees. **This is for the PI, and for M5.**

**Consequence for the fifth axiom.** For object B, Paper 3 gives exactly the shape of the axiom as ruled (P19): a preimage with the given shadow *exists* (ĥ), and it is determined only up to a holomorphic form — the shadow does not fix the object. That is an instance of existence without uniqueness, resting on one external theorem (V-2) and one declared spectrum.

**Consequence for the classification.** 𝕄-5 → two targets: the genus is quasi-Jacobi and carries d_odd (M4); the cone-tip projection carries the shadow (M5). 𝕄-8's last clause → the same split. 𝕄-6's spectrum statement is not established by either source read: the note gives one coefficient of a genus, Paper 3 takes its link spectrum as given.

---

## 9. Correction after the step audit (10 November 2026; the error was mine)

In §2.1 and §3 (S.2) I wrote that under the fifth reading the twelve-dimensional geometry is geodesically complete and that "in the sense of geodesic incompleteness there are no singularities in M₁₂". The blind check of `STEP_AUDIT.md` §E showed that this does not follow as worded. What holds: the smooth cover of M₁₂ is complete with bounded curvature; M₁₂ itself is an orbifold with a codimension-two cone locus of angle π (the image of the fold's fixed set), which is the image of a regular set of the cover. In §3 (S.3), "the smooth object above it is unique" holds only among double covers branched at the four corners, and does not carry over to M₁₂, which has at least two smooth double covers. The corrected statements, step by step, are in `STEP_AUDIT.md` §§A, B. The verdicts of §5 are unchanged: completeness remains a derived statement at [D], in its corrected form; the fifth axiom asserts existence and not uniqueness (P19).

**Further correction (10 Nov 2026; the error was mine).** In §3 (S.2, gap 1) and §8 I described the jump in the slope of M2's warp as a gap in M2 ("M2's own solution is not smooth"). It is M2's thin-wall profile, exact by design (Decision Log Q16), and no defect; the smoothness requirement belongs to the completeness statement, as its hypothesis. And the PI has confirmed the reading that "singular in 4D, smooth in higher dimensions" refers to the cones seen in the four-dimensional shadow, not to the pillowcase corners, which are cone points of K₈ as M1 Thm 5.7 states. See `STEP_AUDIT.md` §A.

**Amendment to §5 by PI ruling, 10 Nov 2026 (P22).** Completeness is left to M11 and is not stated in M3. In the table of §5: Σ-5 = 𝕄-2 reads "the completion principle I (the declared axiom, existence only); completeness a target owed by M11"; the GBH1 completeness item reads "target, M11; the audit of `STEP_AUDIT.md` §A is its starting point".
