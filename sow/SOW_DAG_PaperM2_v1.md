# SOW + DAG v1 — Paper M2: the Master Equation from the four axioms

**Date:** 8 November 2026 · **PI:** Dhiren J. Master · **State:** ROLLED BACK to the end of WP2 (PI confirmation, 8 Nov 2026). Q11, Q13 void; Q2 re-scoped; Q12 to be re-confirmed in the 12D frame. WP3/WP4 artefacts withdrawn to `withdrawn/`. See §8. PI note: M2 is as long as it needs to be; journal-submission constraints no longer govern the series.
**Inputs read this session:** `M2_Handover_Note_v1.md`; `proof_derivation_ledger_v22.md` §"Paper M1"; `Paper_M1_Four_Axioms_v2.tex` (§§1–2, 5–8, Appendix A–B); `M1_L1`–`M1_L5.lean`; `omega-definition-usage_v2.md` §§2, 4, 6a; `F1_eq_master_canonical.tex`; `F1_erratum_convention_note.md`; `SOW_DAG_Paper3_Ramanujan_v2_locked.md` (format model).

---

## 0. Recorded rulings consumed (PI, 7–8 Nov 2026, per handover)

| Ruling | Content | Consequence for M2 |
|---|---|---|
| R1 | ω = ψ + ψ̄ = 2 Re ψ (even combination, not modulus); ω = 0 at ψ = −ψ̄ | Fixes WP0 definition D0.2; supplies one of the two vanishing conditions in the parity theorem (R2.2) |
| R2 | ψ, ψ̄ opposite chirality — must be **derived** | WP2 node R2.3 is a theorem target, never an assumption |
| R3 | M2 derives G = 8πG_eff T + ζT^Φ + Λ_eff g, Φ_QC = ω(ψ−ψ̄)², ζ = 12π, from A1–A4 on M₁₂; accessible opening, formal thereafter; **no MEF paper cited as premise except M1** | Node-tag set gains `M1` (permitted premise); every other internal link is `INT` → reproduce or `AX` |
| Reg. 10 | Corner labelling P₁=C₀, P₃=Cᵢ, P₂=Cⱼ, P₄=Cₖ (M1 App. B) | Consumed; not re-derived |
| F1 | Canonical scalar-stress form of the dilaton term; □Φ = 0 and stiff identity are theorems of the equation | WP3 target form; the F1 files are scratch and are **not citable** — R3.3/R3.4 reproduce in-document |

**Standing principle of the Mx series (PI, 8 Nov 2026).** Wherever the axioms leave a choice, the series takes the minimal option, in the sense of M1 Definition 3.2 extended from geometric data to every datum of the theory (terms in the action, connections, couplings, readings). A result obtained this way is tagged [D | minimality] and is on the same footing as M1's own minimality results. **Obligation:** at any point where the minimal option fails — produces a contradiction, an empty solution set, or a result the corpus's [R] facts exclude — the failure is flagged in the paper and in the Register, not absorbed. Instances so far in M2: one gravitational term (Q1); the induced Spin^c connection (Q12); the sheets couple to curvature through Φ_QC alone (§3). The principle is itself to be stated once in M2 §2 (the readings) as the series' standing rule.

**Node tags used below:** `M1` (M1 result — citable as premise under R3; cite by theorem number) · `EXT` (peer-reviewed external) · `INT` (un-peer-reviewed MEF link — reproduce in-document or axiomatise) · `AX` (declared in-document Σ-axiom / definition) · `PROP` (architect's proposal — a target, not a result) · `GAP` (no derivation known; question to PI) · `HOOK` (downstream, captured not opened).

---

## 1. Objective and acceptance criteria

**Objective:** one self-contained manuscript deriving the Master Equation in its canonical form from A1–A4 on the M₁₂ of M1, at the standard of M1 (every load-bearing link derived in-document or reduced to `EXT`/`M1`; second route where available; smallest case by hand; Lean certificates in an appendix), with the three expository registers of M1 kept (observation → axiom → mathematics).

**Acceptance criteria:**
1. Every term of the displayed equation has a sourced origin: G and Λ_eff from WP1/WP3, T from A3 spinors (WP3), T^Φ from the warp (WP3), ζ from WP4, Φ_QC = ω(ψ−ψ̄)² from WP2.
2. Opposite chirality of ψ, ψ̄ appears as a numbered theorem with its dependency on M1's [D] reading stated (R2.3).
3. The two theorems-of-the-equation (□Φ = 0 on supp ∇Φ; ρ_Φ = p_Φ = ½ζΦ̇²) are proved in-document and certified.
4. Whatever remains undetermined (overall scale — declared in M1; half-circle if still open; ω one-hump if [M]) is **displayed as a declared input or a tagged [M]/[G] statement**, never papered.
5. ω named per `omega-definition-usage_v2.md` §6a only; the F1 lint passes; register checklist (§11 of the register guide) passes.
6. Zero citations of MEF papers other than M1.

---

## 2. Load-bearing results by work package

### WP0 — Definitions sheet

| | |
|---|---|
| **D0.1 The field ψ** | *Statement (PROP):* ψ is a complex-valued field on the warped piece, ι-equivariant: ψ(ιz) = \overline{ψ(z)}; Re ψ ι-even, Im ψ ι-odd. *Provenance:* A2(iii) sign-exchanging involution [`M1` Def 2.2]; ι = fold on the fibre and conjugation on the algebra [`M1` Prop 5.4, Thm 5.7]. **Caution captured from M1 Prop 5.6 proof text:** ι acts as *conjugation* at the drive-fixed corner P₁ = C₀ only; at the three cycled corners it acts as Ad by the surviving unit. The definition must therefore be stated per corner, or on ℂᵢ with the Ad-action transported by M1 Prop 5.6 (Ad_w cycles i→j→k). This is the first thing WP0 must settle. *Tag:* `AX` candidate (a definition), `PROP` until confirmed. |
| **D0.2 ω and the odd variable** | ω ≡ ψ + ψ̄ = 2 Re ψ (ι-even); ψ − ψ̄ = 2i Im ψ (ι-odd). *Provenance:* PI ruling R1. *Tag:* `AX` (ruling, displayed as definition). |
| **D0.3 "Field equation on M₁₂"** | What is varied (the 12-metric with the A2 warp; the Spin^c spinor of A3), over what (compact boundaryless M₁₂, A1), and the reduction scheme (T × Σ = S¹ × S³ external; K₈ internal; warp carries s-dependence). *Provenance:* `M1` Defs 2.1–2.4, Prop 7.3 (L = 𝒪(3)), Prop 7.5 (Σ = S³). *Tag:* `AX` (scheme declaration). |
| **D0.4 Notation — RULED Q6: M1 conventions carry; new symbols enter M2 App. B (cumulative)** | M1 App. B names the fibre coordinates (θ_ψ, θ_ω) and calls P₃ "the ω half-period". M2 uses ψ, ω for *fields*. Either rename M2's fields or M1's coordinates in M1 v3; must not coexist unremarked. *Tag:* register item; PI decision. |
| **D0.5 Naming** | ω = Coherent Information Field / Coherent Field; Φ_QC = Quantum Coherence Dilaton; forbidden terms per ω doc §6a. **Source-correction flag:** M1 v2 §9 (outlook) reads "coupling to the *coherence field*" — a forbidden form; propose M1 v3 erratum. *Tag:* register item. |

### WP1 — A1 ⇒ variational principle; Lovelock

| Node | Statement · rigour target | Provenance chain | Tags | Lean |
|---|---|---|---|---|
| **R1.1** | On a compact, boundaryless M (A1) an action S[g, ψ, …] has no boundary terms; stationarity gives Euler–Lagrange equations without boundary data. [D \| A1; EXT] | `M1` Def 2.1 → EXT (standard variational calculus on closed manifolds; cite a textbook, e.g. Wald App. E) | `M1`, `EXT` | NONE (not a Lean target) |
| **R1.2** | Lovelock: the unique symmetric divergence-free (0,2)-tensor built from g and ≤ 2 derivatives in **four** dimensions is aG_{μν} + Λg_{μν}. [R \| EXT Lovelock 1971, 1972] | EXT terminus | `EXT` | NONE |
| **R1.3 — GAP** | **The handover route applies Lovelock in 4D, but the action is varied on M₁₂.** In 12 dimensions Lovelock admits five independent terms (Einstein, Gauss–Bonnet, …). A reason to exclude the higher Lovelock densities in 12D is needed: candidates are (a) M1 Def 3.2 criterion (1) (unforced datum — same move that excluded twisted Spin^c lines, `M1` Prop 7.3), or (b) second-order-in-derivatives read off A2's first-order growth law. Neither is written. **Question to PI.** | — | `GAP` | — |

### WP2 — A2 ⇒ one complex field; parity ⇒ Φ_QC; chirality; half-circle

| Node | Statement · rigour target | Provenance chain | Tags | Lean |
|---|---|---|---|---|
| **R2.1** | The two sheets of A2's exponential (κ, −κ, exchanged by ι) are one complex field ψ, its two real components being the ι-even and ι-odd combinations. Complexity of the field is forced by spinor data being complex (`M1` Prop 7.3 reading) and the selected unit's almost-complex structure (`M1` Prop 7.2). [D \| A2, Def 2.5] | `M1` Def 2.2(iii) → `M1` Prop 5.4 (fixed subalgebra ℂᵢ) → `M1` Prop 7.2/7.3 | `M1`, `PROP` (the identification sheets ↔ Re/Im is the architect's) | NONE |
| **R2.2 Parity theorem** | *Sharpened statement proposed:* among real monomials (Re ψ)^a (Im ψ)^b, the lowest-degree ι-even one (b even) that vanishes on **both** loci ψ = ψ̄ (no held distinction, ω doc §4: Im ψ = 0 ⇒ b ≥ 1 ⇒ b ≥ 2) and ψ = −ψ̄ (ruling R1: Re ψ = 0 ⇒ a ≥ 1) is (Re ψ)(Im ψ)², degree 3, unique up to a real constant; i.e. Φ_QC ∝ ω(ψ−ψ̄)². [R] once the two vanishing conditions are taken as inputs; the inputs are `AX` (R1) and `INT` (ω doc §4 — a scratch document, so the "Φ_QC = 0 when ψ = ψ̄" condition must be re-motivated in-document). **Correction logged (handover):** parity alone does not choose ψ+ψ̄ over ψψ̄; the choice is R1. The sharpened form makes the two selectors explicit rather than hiding them in "lowest order". | R1 (`AX`) + ω doc §4 (`INT` → reproduce as motivated condition) → finite monomial classification | `AX`, `INT`, `PROP` | **NONE → CERT target `M2_L1_parity`**: degree-3 uniqueness over ℤ-indexed exponents (a, b) with b even, a ≥ 1, b ≥ 2 minimising a + b; plus the sign/parity table under ι. Small, decidable. |
| **R2.3 Handedness theorem — BUILT 8 Nov 2026 (`M2_WP2_handedness.tex`, `M2_L4_handedness.lean`, 11 thms, compiles clean)** | ψ̄ has the opposite Weyl chirality to ψ. **Verified rule (EXT, four independent sources: Sohnius table via arXiv:1912.00952; Quevedo et al. arXiv:1011.1491; Álvarez-Gaumé et al. hep-th/9212006 eq. 3.24; Borghini et al. hep-ph/0108094 eq. A9):** charge conjugation C satisfies CΓ̄ = (−1)^{(s−t)/2} Γ̄C, so C **flips** chirality iff (s−t)/2 is odd. Minkowski (t = 1): flips in d = 4k, preserves in d = 4k+2. **The rule is not "d mod 4" but "(s−t)/2 mod 2"** — my earlier statement that d = 8 also flips was wrong: in Riemannian signature (t = 0) d = 8 has (s−t)/2 = 4, C *preserves* chirality. Consequences: **(A) M₁₂ Lorentzian (t = 1, s = 11):** (s−t)/2 = 5, C flips ⇒ ψ̄ opposite chirality: theorem. Second route: 12D chirality = (4D Lorentzian, flips) × (8D Riemannian K₈, preserves) = flips — consistent. **(B) M₁₂ Riemannian (t = 0):** (s−t)/2 = 6, C preserves ⇒ this route gives ψ̄ the *same* chirality and R2 would need another mechanism. **M1 does not fix the signature of M₁₂** (grep: no "Lorentz"/"signature" statement about the metric; only the orbifold signature (2,2,2,2) and the Hessian signature). **Ruling required (Q8).** Route otherwise as before: ι on ℂᵢ is conjugation (M1 Prop 5.4/5.6) → spinor lift (M1 Cor 7.4) → C-type operation → table. Inherits M1 Prop 5.6's [D] reading. | `M1`, `EXT`, `PROP` | **NONE → CERT target `M2_L4_chirality`**: the sign (−1)^{(s−t)/2} for (t,s) = (1,11), (1,3), (0,8), and the product check. |
| **R2.4 Half-circle — GAP** | ω ≥ 0 ⇔ Re ψ ≥ 0 ⇔ \|arg ψ\| ≤ π/2. Not supplied by A1–A4 or by D0.1 (equivariance relates the sheets; it does not sign Re ψ). *Candidate routes, none asserted:* (a) positivity of the complexity functional ω (ω doc §2 — rated [M] there; cannot be upgraded by citation); (b) a fundamental-domain argument for the fold (note: the natural fundamental domain of conjugation is a *half-plane*, and which half is a convention unless a second structure breaks it); (c) the scale sector sign of `M1` Prop 8.2. **First concrete target per handover; question to PI which route to open.** | — | `GAP` | — |

### WP3 — Reduction ⇒ the equation; the two theorems-of-the-equation; T and Λ_eff

| Node | Statement · rigour target | Provenance chain | Tags | Lean |
|---|---|---|---|---|
| **R3.1 Warp ⇒ scalar stress — BUILT 8 Nov 2026 (`M2_WP3_reduction.tex` §3.1–3.3; `M2_L2_reduction.lean`, 7 thms). Result: C = k(k+2)/2 = 24; V(A) = V_F(2Λ₁₂e^{kA} − R̂_F e^{(k−2)A}) derived (discharges Paper 2 Σ-2's Einstein and potential parts). Open: the log w ↔ Φ_QC link is now the ruled identification A = ζΦ_QC (Q11), [D]** | Reducing the 12D Einstein–Hilbert term over the A2 warped product with w = w₀e^{κs} produces, in the external 4D equation, exactly the canonical scalar stress tensor ∇_μΦ∇_νΦ − ½g_{μν}\|∇Φ\|² for a scalar Φ built from log w, plus a potential/vacuum term feeding Λ_eff. Φ_QC is the warp seen from 4D, not an added field. [D \| A2, D0.3; EXT warped-product curvature formulae: O'Neill 1983 Ch. 7, Bishop–O'Neill 1969] **The load-bearing INT link of the paper:** the map from (κ, ι-sheets) to Φ_QC = ω(ψ−ψ̄)² — i.e. why log w is the degree-3 invariant of R2.2 and not, say, Re ψ itself — must be written. Nothing read this session supplies it. | `M1` Def 2.2 → EXT (O'Neill) → R2.2 → **INT (unwritten)** | `M1`, `EXT`, `INT` | NONE (R3.1 is analytic; its coefficient feeds R3.2/WP4) |
| **R3.2 Normalisation — RESOLVED by Q11: the reduction coefficient is C = 24 (a dimension count); ζ = 12π is the exponent; coefficient of T^Φ is Cζ²** | The coefficient multiplying T^Φ after reduction, in the units where the 4D Einstein term is G_{μν}, **is** ζ. Whatever number R3.1 yields is the derivation of ζ; WP4 then interprets it. | R3.1 | `INT` | — |
| **R3.3 Bianchi ⇒ □A = 0 — BUILT (`prop:bianchi`)** | ∇^μG_{μν} = 0 and ∇^μT_{μν} = 0 ⇒ ∇^μT^Φ_{μν} = (□Φ)∇_νΦ = 0 ⇒ □Φ = 0 on supp ∇Φ. Theorem of the equation. [R] | Canonical form (R3.1) → identity | `INT` → reproduce (F1 note not citable) | **NONE → CERT target `M2_L2_bianchi`** on a finite symbolic model (see §4 note on what Lean can and cannot certify here) |
| **R3.4 Stress tensor along the flow — BUILT (`prop:stiff`; Lorentzian stiff form stated as the continuation reading, Q8)** | For homogeneous Φ(t): ρ_Φ = p_Φ = ½ζΦ̇². Theorem of the equation. [R] | R3.1 → componentwise | `INT` → reproduce | CERT target within `M2_L2_bianchi` (algebraic) · **ANALOGUE (unverified):** `WP4_M1_eos_causality.lean` from the project baseline list — file not in project; cannot confirm it certifies the stiff EOS |
| **R3.5 T from A3 — BUILT (`sec:matter`, scope line)** | T_{μν} is the stress tensor of the Spin^c Dirac field on the bundle with L = 𝒪(3) (`M1` Prop 7.3), reduced over K₈. [D \| Def 2.5; EXT Dirac stress tensor] "M1 WP4" = M1 §7 / L4 (confirmed). **Scope:** M2 derives the *form* of the equation; T enters as the conserved stress tensor of the A3 spinor sector. Its content (generations, masses) is downstream Mx work, not opened. The one property proved: ∇^μT_{μν} = 0, from diffeomorphism invariance of the spinor action on the closed M₁₂ (A1) — short in-document argument, EXT standard. Reduction of the spinor sector over K₈ is a `HOOK`. | `M1` Def 2.5 → `M1` Prop 7.3 → EXT | `M1`, `EXT` | NONE |
| **R3.6 Λ_eff — BUILT (`sec:lambda`; presence/form fixed, value downstream)** | Λ_eff is the compact factor's vacuum energy at M1's declared scale. **Honesty line to display:** since the scale is a declared input (`M1` Thm 8.1, Prop 8.2), Λ_eff's *value* is not derived in M2; its *presence* and *form* are. [D \| scale declared] | `M1` Thm 8.1, Prop 8.2 → R3.1 | `M1` | NONE |

| **R3.7 — RULED Q12 (c), BUILT (`sec:connection`): the Spin^c connection is the induced (Chern) connection of A3's almost-complex structure, F = Ricci form; no gauge coupling; on the pillowcase F = π Σ δ_corner, ∫F = 4π = 2πc₁** | Paper 2's 2D system and its BPS argument need a kinetic term −½\|F\|² for the Spin^c determinant-line curvature. Under Q1 the 12D action is Einstein–Hilbert + spinor sector only; a Maxwell term for the Spin^c connection carries a gauge coupling — an unforced datum by the same criterion that killed the higher Lovelock terms. Candidates (none asserted): (a) induced from the Dirac sector (heat-kernel a₂ coefficient of the Spin^c Dirac operator — EXT, but scale-dependent); (b) the flux is a topological background (c₁(L) = 3h, M1 Prop 7.3) whose stress tensor enters with a coefficient fixed by the spinor's Spin^c charge, not by a free gauge coupling; (c) admit the Maxwell term as forced by A3's reading (Def 2.5 makes the connection part of the geometry's data) and argue its coefficient is fixed by the Dirac normalisation. **PI question (Q12).** | `GAP` | — |

### WP4 — ζ = 12π

| Node | Statement | Provenance | Tags | Lean |
|---|---|---|---|---|
| **R4.1 Candidate A** | ζ = (total cone deficit of the pillowcase) × (number of imaginary units) = 4π × 3. Deficit: four cone points of angle π, deficit π each, total 4π = 2πχ(S²) with χ = 2 (`M1` Thm 5.7, Gauss–Bonnet). Three units = χ(ℂP²) (`M1` Prop 7.2). | `M1` Thm 5.7, Prop 7.2 | `PROP` | arithmetic only |
| **R4.2 Candidate B** | ζ = π × χ(K₈) = π × 12 = π × dim M (`M1` Thm 7.6, Thm 6.1). | `M1` Thm 7.6, Thm 6.1 | `PROP` | arithmetic only |
| **R4.3 — SUPERSEDED by Q5 ruling (see §7); observation on A/B identity retained as gloss** | A and B are **the same identity read in two orders**: χ(K₈) = 3 · 2 · 2 (Künneth, `M1` Thm 7.6), so 4π × 3 = π × 12 trivially. Neither candidate can be selected numerically. The only content WP4 can add is the origin of the **factor π** (as opposed to 2π, 1, or 1/2π) and of **which** Euler characteristics multiply — and that is decided by R3.2, not by numerology. **Recommendation (for PI decision, not asserted):** WP4 is a corollary of R3.2, to be written *after* the reduction coefficient exists; the "cone-deficit route first" instruction is honoured as the order in which the coefficient is *interpreted*, not derived. | — | `GAP` until R3.2 | **CERT target `M2_L3_zeta`**: 4·3 = 12 = 3·2·2; deficit sum 4·(2π−π) = 2π·2. Trivial; included so the arithmetic face of ζ is certified as M1 certified χ(K₈). |

### WP5 — ω one-hump from the drive; assembly

| Node | Statement | Provenance | Tags | Lean |
|---|---|---|---|---|
| **R5.1 — LIVE (Q4 revised): the two zeros from A2 and A4** | Proposal: ω_field = orbit average of ψ + ψ̄ under A4's drive (Fibonacci M₀ on T², `M1` Thm 4.2); M₀ is ergodic (EXT Katok–Hasselblatt) so time average = space average a.e. **Issue captured:** the ergodic average of a fixed function is a *constant*, not a field; the proposed hump ("zero at locked phase θ = π/2, zero at uniform phase, positive between") is a function of a *configuration parameter* of ψ, not of position. WP5 must state: average over what, as a function of what, before any theorem is attempted. **Target (Q4 ruling):** derive ω = 0 at the locked phase ψ = −ψ̄ from A2(iii) + R1, and ω = 0 at the uniform/mixed phase from A4 (mixing of the Fibonacci drive); positivity between is the half-circle (Q3, deferred to after R3.1). | `M1` Thm 4.2 → EXT (ergodicity of hyperbolic toral automorphisms) | `M1`, `EXT`, `PROP` | NONE |
| **R5.2 GUE face — HOOK to M3/M4 (Q4 ruling)** | Bridge from the spectral functional of ω doc §2 (Σ²(L), Δ₃) to ω_field via the cone-tip Dirac spectrum of the pillowcase. The cone-tip spectrum's canonical site in the corpus is Paper 3 (Prop 5, λ_{0,2} = π) — **not citable under R3**. Options: (a) reproduce the needed spectral statement in-document; (b) declare it as Σ-axiom; (c) leave the GUE face out of M2 and state ω's hump as [M] with the deflationary reading, which is the rigour the canonical ω document itself assigns (§2: Motivated). **PI decision.** | ω doc §2 (`INT`) → Paper 3 Prop 5 (`INT`, not citable) | `INT`, `GAP` | NONE |
| **R5.3 Assembly** | Display the canonical equation with every term's node cited; validity conditions (supp ∇Φ; homogeneity for R3.4; reduction scheme D0.3); declared inputs listed in one place (scale; half-circle if open; ω hump if [M]); F1 lint; register checklist. | all above | — | — |

---

## 3. DAG

```
WP0 ── D0.1 ─► D0.2 ─► D0.3 (definitions; D0.4/D0.5 register items in parallel)
  │
  ├─► WP1: R1.1 ─► R1.2 ─► [R1.3 GAP: 12D vs 4D Lovelock] ──────────────┐
  │                                                                     │
  ├─► WP2: R2.1 ─► R2.2 (parity) ─┬─► R2.3 (chirality) ─► [R2.4 GAP] ─┐ │
  │                               │                                   │ │
  │                               └──────────────────────────────┐    │ │
  │                                                              ▼    ▼ ▼
  └─► WP3: R3.5 (T), R3.6 (Λ) ──► R3.1 (warp ⇒ T^Φ; INT) ─► R3.2 (ζ coefficient)
                                        │                         │
                                        ├─► R3.3 (Bianchi) ─► R3.4 (stiff)
                                        │                         │
                                        │                         ▼
                                        │              WP4: R4.3 ⇐ R4.1, R4.2 (interpretation)
                                        │                         │
  M1 Thm 4.2 (drive) ──► WP5: R5.1 ─► [R5.2 INT/GAP] ─────────────┤
                                                                  ▼
                                                          R5.3 ASSEMBLY

Critical path: D0.1 → R2.1 → R2.2 → R3.1 → R3.2 → R4.3 → R5.3
Blocking gaps on the critical path: R3.1 (the warp–Φ_QC map and the 2D system it yields: κ₂², Maxwell term, V(A) balance); R1.3 closed by Q1
Non-blocking gaps: R2.4 (half-circle), R5.2 (GUE face) — can ship as declared [G]/[M]
```

---

## 4. Lean status and conversion order

| Target file | Certifies | Baseline status | Order |
|---|---|---|---|
| `M2_L1_parity.lean` | R2.2 degree-3 uniqueness; τ̂-parity table of ω, ψ−ψ̄, Φ_QC | **CERT (12 theorems)** | done |
| `M2_L3_zeta.lean` | WP4 arithmetic skeleton: 4·3 = 12 = 3·2·2; deficit sum = 2πχ | **CERT (7 theorems)** | done |
| `M2_L4_handedness.lean` | R2.3: S conjugates M₀ to M₀⁻¹, S² = fold, det S = 1, τ reverses orientation, S swaps v_u ↔ v_s in ℤ[φ], eigenvalues φ^{±2}, involutive reversals have det −1 | **CERT (11 theorems, Lean 4.15.0 core, zero sorry)** | done |
| `M2_L2_bianchi.lean` | R3.3 contraction identity and R3.4 stiff identity on a finite symbolic model | NONE; ANALOGUE `WP4_M1_eos_causality.lean` **unverified** (not in project) | 4 — after R3.1 fixes the form |

**Note on what Lean certifies here.** Core Lean 4 without Mathlib tensor calculus cannot certify the covariant identity ∇^μT^Φ_{μν} = (□Φ)∇_νΦ in general. `M2_L2_bianchi` would certify it on an explicit finite model (e.g. a diagonal homogeneous metric with Φ = Φ(t), where the identity reduces to a polynomial identity in Φ̇, Φ̈, the scale factors and their derivatives). The paper must say the certificate covers the model, and the general identity is the standard one-line computation displayed in the text. Same discipline M1 applied to its readings.

---

## 5. Consolidation — the decompression list (INT/GAP nodes, deduplicated)

1. **R3.1** — the map from A2's warp (κ, sheets) to Φ_QC = ω(ψ−ψ̄)², and the reduced 4D equation with its coefficient. *The paper.*
2. **R1.3** — why only the Einstein–Lovelock term in 12D (or why Lovelock is applied after reduction).
3. **D0.1** — per-corner statement of ι-equivariance (conjugation at C₀, Ad at Cᵢ, Cⱼ, Cₖ).
4. **R2.2 input** — re-motivate "Φ_QC = 0 at ψ = ψ̄" in-document (ω doc §4 is scratch).
5. **R2.3** — verify the charge-conjugation chirality table (Polchinski II B.1; Lawson–Michelsohn); state the inherited [D] reading from M1 Prop 5.6.
6. **R3.3, R3.4** — reproduce the two theorems-of-the-equation (F1 files not citable).
7. **R2.4** — half-circle: choose a route or declare [G].
8. **R5.1** — make the orbit-average proposal precise (average over what; function of what).
9. **R5.2** — GUE face: reproduce / Σ-axiom / omit and tag ω's hump [M].
10. **D0.4, D0.5** — notation collision (θ_ψ, θ_ω vs ψ, ω); "coherence field" in M1 v2 §9.

---

## 6. Verified this session vs hypothesis

**Verified (read in file):**
- Ledger v22 §M1: 19 rows, numbering Prop 4.1 … §8.4 matches M1 v2 section/label order (§4 drive, §5 fibre, §6 dimension, §7 base, §8 minimality).
- M1 v2: Def 2.2 (A2 formal, clauses i–iii), Def 2.5/2.7 readings, Prop 5.6 proof text on ι's corner-dependent local form and the [D] reading, Prop 7.3 (Spin^c, L = 𝒪(3)), Cor 7.4 ((−1)^{mn}), Thm 7.6 (χ = 12), App. B labelling and coordinates (θ_ψ, θ_ω), §9 outlook sentence announcing the sequel.
- M1 certificates: 16 + 17 + 6 + 7 + 3 = **49 theorems** — agrees with the handover (v2).
- ω doc: §2 one-hump functional rated Motivated; §4 Φ_QC = 0 at ψ = ψ̄; §6a naming table.
- F1 canonical fragment and erratum note: Option 2 form; Bianchi and stiff identity stated as consequences.

**Discrepancies found (for PI; ledger edits are PI-gated):**
- M1 v2 §2 numbering: the spinor/tangent reading is **Definition 2.5** and the orbits reading **Definition 2.6** (A4 formal is 2.7); the handover's "Definitions 2.6 and 2.7" are v1 numbers. This SOW now cites v2 numbers.
- Ledger v22 §M1 header still cites `Paper_M1_Four_Axioms_v1.tex`, "16 pp.", "45 theorems"; the project file is v2, and the certificates hold 49. **Proposed ledger delta (not banked):** update the M1 header to v2 / page count / 49 theorems.
- M1 v2 §9 uses "coherence field" — forbidden form per ω doc §6a (D0.5).
- Project instructions §3 name ledger v18 as source of truth; this SOW treats v22 as authoritative (handover).

**Hypotheses (architect's, unconfirmed):**
- "M1 WP4" in the handover = M1 §7 / certificate L4 (R3.5).
- `WP4_M1_eos_causality.lean` is an analogue for the stiff identity (file not in project).
- The sharpened parity statement (R2.2) is a faithful formalisation of the handover's "lowest-order ι-even scalar" once the two vanishing selectors are made explicit.
- The observation that candidates A and B for ζ coincide identically (R4.3) and that the content is the factor π.
- The precision problem in R5.1 (ergodic average is a constant).

---

## 7. Questions requiring PI decision before build

| # | Node | Question |
|---|---|---|
| Q1 | R1.3 | **RULED (8 Nov 2026):** Vary on M₁₂. Higher Lovelock densities excluded by M1 minimality criterion (1) (each carries an unforced coupling); Einstein term survives as the one needed for dynamics, coefficient = declared scale. EXT Cartan–Weyl–Vermeil cited for dimension-independent uniqueness of the surviving term. Rigour: [D \| A1; minimality criterion (1); EXT Cartan–Weyl]. R1.2's 4D Lovelock becomes a remark, not a step; R1.3 GAP closed. |
| Q2 | R3.1 | **RULED (8 Nov 2026): option (c)** — derive fresh in M2 with no corpus input: reduce over the A2 warp (EXT O'Neill), identify the 4D scalar as log w, then show via A2(ii)–(iii) and the parity theorem R2.2 that log w is expressed through ψ as the degree-3 invariant. The step "log w is a function of ψ, and which" is the open link; it stays visibly marked [G] until it closes. No corpus site consulted. |
| Q3 | R2.4 | **RULED (8 Nov 2026): option (d) now** — half-circle declared [G] in M2 (the equation does not need ω ≥ 0; only ω's coherence reading does). **Designated route (a)** — fundamental domain of the fold oriented by the sign of ψ at the drive-fixed corner P₁ = C₀ — opened as a bounded task **after R3.1 exists**, since R3.1 fixes how ψ enters log w and w = w₀e^{κs} > 0 may supply the sign for free. Routes (b) functional positivity and (c) scale-sector sign dropped. |
| Q4 | R5.1/R5.2 | **RULED (8 Nov 2026, revised): option (ii)** — M2 carries a section "What ω is": the definitions (ψ, ψ̄, ω = ψ+ψ̄, Φ_QC); the **two zeros derived from the axioms** — ω = 0 at the locked phase ψ = −ψ̄ (A2's involution, R1) and ω = 0 at the uniform/mixed phase (A4's mixing; R5.1 made precise: average over what, function of what); positivity between = the half-circle target (Q3); the GUE maximum stated [M] with the spectral bridge named as the route. **The spectral proof (cone-tip Dirac spectrum, Σ²(L), the bridge theorem) goes to M3 or M4** — registered in `Register_delta_Future_Mx_Work_v1.md` §12.1. R5.1 is therefore live again; R5.2 becomes a `HOOK` to M3/M4. PI note: M2 is as long as it needs to be; journal-submission constraints no longer govern the series. |
| Q5 | WP4 | **RULED (8 Nov 2026).** Correction first: ζ = 12π is **derived** — canonical site Paper 2 (`Paper2_Sequestering_v7.tex`) `thm:warp-exponent` §4 (k_ωL_ω = Nπ: BPS completion → Dirac flux at the fixed points → kink balance 2k = κ₂²Nπ → Gauss–Bonnet κ₂² = 2/L_ω) composed with `prop:flux` (tadpole N = χ(K₈) = 12; canonical Paper 1 §3.2) in `cor:zeta` §4.6, [R] conditional on Σ-2; CERT `P2_L2_exponent_v2.lean` (`zeta_coefficient`). R4.3's "GAP until R3.2" was wrong and is withdrawn. **Ruling (i):** WP4 reproduces Paper 2 §§3–4 inside M2 with **Σ-2 discharged by WP3/R3.1**. Content of (i), not separate decisions: (ii) κ₂² = 2/L_ω derived as a node (the step carrying the π; one sentence in Paper 2); (iii) the V(A) balance required by the Bogomol'nyi completion derived from the reduction; (iv) ζ_coupling (coefficient of T^Φ) = k_ωL_ω proved as R3.2 — `cor:zeta` *defines* ζ as the warp exponent, so this identification is M2's to supply; (v) `P2_L2_exponent_v2.lean` ported as CERT baseline. Also reproduce: flux localisation at the four corners (M1 Cor 7.4, `L4_flux_parity` support) and the tadpole argument (M1 Thm 7.6). Cone-deficit reading kept as geometric gloss; Paper 2 `rem:zeta-crosscheck` confirms there is one derivation, not two. **Separable item deferred:** if V(A)'s tuning does not fall out of A2, Σ-axiom in M2 vs visible [G] — decided after R3.1. |
| Q6 | D0.4 | **RULED (8 Nov 2026).** The Mx series rewrites the canon; Papers I–XXV, 1–6, GBH etc. are all superseded by it. **Naming convention:** M1's conventions carry unchanged into M2 (coordinates (θ_ψ, θ_ω), half-periods (L_ψ, L_ω), corner labels per M1 App. B). Every new symbol M2 introduces (ψ, ψ̄ as fields; ω = ψ+ψ̄; Φ_QC; ζ; κ₂; A, k_ω as warp data; T^Φ) is entered in **M2 Appendix B**, which reproduces and extends M1 App. B; each Mx carries the cumulative table of M1…M(x−1). No renaming of fields or coordinates. WP0 states once that subscripted ψ, ω are coordinate labels and bare ψ, ω are fields. Open to R3.1: whether θ_ω and the field ω are related by construction (the warped direction) — if so, M2 App. B records the relation. |
| Q7 | R3.5 | **Reading confirmed (not a ruling):** "M1 WP4" = M1 §7 / certificate L4 (Spin^c bundle, L = 𝒪(3), corner lift). Scope line added to R3.5. |

| Q8 | R2.3, D0.3, R3.4 | **RULED (8 Nov 2026): M₁₂ is Riemannian.** The metric is positive-definite; the geometry signs no direction (PI: the universe is non-judgemental; motivation for §1's observation register). Recorded in M2 as the **fifth numbered reading**, attached to every result depending on it. **Time is the orbit parameter of A4's drive, not a signed direction of the metric** (PI: "exactly"). Consequences: (a) R2.3 re-routed — charge conjugation preserves chirality in Riemannian d = 12 ((s−t)/2 = 6), so ψ̄ ≡ ι̂ψ must get its opposite chirality from the fold's spinor lift ι̂ being **orientation-reversing (odd in Pin)**, which anticommutes with the chirality operator in every signature; first place to look: M1 Cor 7.4. Route to investigate, not asserted. (b) The field equation's form is signature-independent; the stiff identity ρ_Φ = p_Φ = ½ζΦ̇², a⁻⁶ domination and causality are readings **along the flow** (Φ̇ = derivative along the drive's orbit parameter). (c) Positive consistency: no closed time-like curves on the compact M₁₂; the spectral programme (M3/M4) is Riemannian; Spin(12) half-spin representations are quaternionic (d ≡ 4 mod 8), matching A3's ℍ — noted, not used. (d) Architect's inference, **not confirmed by PI:** the S¹_Sol label encodes flow-time; M2 does not claim it. |
| Q9 | R2.3 | **RULED (8 Nov 2026): R2 is reading (i)** — ψ and ψ̄ are distinguished by handedness **relative to the flow**, derived in M2 (ψ, ψ̄ are defined here; the reader should not wait three papers to learn why the shadow is not the image). PI: the structure keeping the sectors apart is **Sol** — without it there would be no arrow of time. Architect's formalisation (to build, not asserted): S¹_Sol is the suspension of the drive M₀; the Sol metric e^{2s}dx² + e^{−2s}dy² + ds² is A2's law with the two sheets = the unstable/stable directions of A4; time reversal s ↦ −s swaps them and is a **reflection of M₁₂** (orientation-reversing, odd in Pin), hence flips chirality in any signature. M1's fold z ↦ −z (rotation by π, central, chirality-preserving) is the **square** of the quarter-turn S with SM₀S⁻¹ = M₀⁻¹ (`L1_conj_M0_inv`); candidate sheet-exchange τ = (s ↦ −s)∘S, τ² = fold. |
| Q10 | R3.1 | **RULED (8 Nov 2026): one direction, two forced rates.** A2's warp and the Sol exponential share one direction (de minimis, M1 criterion (1)); the two rates are both theorems — φ² per time circuit (A4, trace 3) and e^{24π} per θ_ω period (tadpole) — so two numbers are not an unforced datum; 24π ≠ ln φ² shows they cannot scale the *same* lengths, so they act on different objects (fibre torus vs 6D fibre + external block). Their ratio 24π/ln φ² ≈ 78.4 is a pure number of the framework — physics, not choice; **not checked against the corpus**. Whether θ_ω and the flow coordinate coincide is decided at R3.1 (theorem or declared identification), not before. |
| Q11 | R3.1/R3.2, canonical display | **RULED (8 Nov 2026): ζ = 12π is the warp exponent, A = ζΦ_QC; the Master Equation's kinetic coefficient is the derived dimension count × ζ².** Derivation (M2 §3): ansatz g₁₂ = g₄ + e^{2A}ĝ₆ + g₂ (M1 A2 on K₈; Paper 2 Σ-1), A = a(θ) + φ(x); O'Neill warped-product scalar curvature; integrate by parts (gradient coefficient k(k−1) in Jordan frame); 4D Weyl rescaling σ = −kφ/2 contributes −3k²/2; total **C = k(k+2)/2 = 24** for k = 6 (architect's first figure 30 was wrong: it used D = 12 in a formula assuming the whole internal space is warped; the pillowcase is base, unwarped). Smallest case k = 1, D = 5: C = 3/2 (RS radion). **Corrected canonical display for M2:** G_μν = 8πG_eff T_μν + 24·T^A_μν + Λ_eff g_μν with A = ζΦ_QC, i.e. coefficient of T^Φ is **24ζ²**, not ζ. PI: "the most honest and accurate way forward; this is why the Mx series is being redone." **Blast radius to log (register entry 15):** every gradient-active site that used ζ as the kinetic coefficient (collapse cluster, budget, no-go, F1 erratum note). Paper U's conformal coupling e^{2ζΦ} is consistent with this ruling. **Separate check flagged, not resolved:** Paper 2 §5.1's Einstein-frame weight "+2" (n = 8) against the Weyl factor obtained here (σ = −3A gives a vacuum-term weight of e^{−6A} in the frame used) — to be settled when WP4 reproduces §5; affects e^{−96π}. |

| Q12 | R3.7 | **RULED (8 Nov 2026): option (c).** The Spin^c connection is part of the geometry's data (M1 Def 2.5, Prop 7.3 canonical structure): the induced connection on K⁻¹, F = Ricci form, energy weighted by 1/2κ₁₂², no gauge coupling; an independent connection is an unforced datum (criterion (1)). Consequence: the flux at the fixed points *is* the cone curvature, π per corner — Paper 2's "π is the deficit angle" becomes a derivation. |

| Q13 | WP4 | **RULED (8 Nov 2026): option (B)** — pursue a new derivation of ζ = 12π before M2 freezes: the warp exponent across the half-period as a holonomy/period of the induced connection on K⁻¹ (Q12), summed over the three complex directions A3 realises (M1 Prop 7.2): 3 × 4π. A Chern–Simons/holonomy statement, not a BPS kink. Paper 2 §4 is **not** reproduced as [R] (Findings 1–4, `M2_WP4_zeta_reproduction_findings.md`). |

| Q14 | R3.7 revised | **RULED (8 Nov 2026): weak (c).** The Maxwell term for the Spin^c line is forced and its coefficient tied to the gravitational one (inside the 1/2κ² bracket; CFM v12 l.1419; Addendum §4.4 κ²_{2,eff} = κ₈²/(Vol₀e^{6A₀})): no free gauge coupling. The identification F = Ricci form (architect's strong form) is withdrawn: the flux quanta of L are topological data — total N = χ(K₈) = 12 by the tadpole, all on the base cycle because it is the only cycle with cone points (Addendum §4.6, [D]). Minimality Register M2-2 amended, not failed. PI: the Addendum's results are robust. |
| Q15 | WP4 direction | **RULED (8 Nov 2026), architect's recommendation accepted with precision.** The exponent 12π is τ-symmetric and direction-blind: Nπ along the direction away from the wall the sector sits on, for either sheet; "L_ω = 12π" vs "L_ψ = 12π" (Paper 2 vs Addendum) is the choice of which sheet is called ψ (M1 App. B j/k convention). The aspect ratio τ₂ is the one place the choice becomes physical (k and period lengths differ by τ₂ between sheets). The ledger's "L_ω = 12π" is read as the half-period transverse to the ψ-wall in the sheet called ψ. Registered as a fossil-vs-canonical discrepancy (Corpus Errors delta). |
| Q16 | WP4 exactness | **Noted (PI agreed):** the jump 2k = κ₂²Nπ is exact; constant slope between walls is the boundary condition (Addendum §4.6: backreaction alters the shape, not the jump). M2 states both. The Addendum's two-warp ansatz (e^{2A} fibre, e^{2ζΦ} on dθ_ω²) vs Paper 2 §7.3's a = −ζΦ to be reconciled in WP4. |

| Q17 | Def ψ, §3, §5 | **RULED (8 Nov 2026) — reconciliation with the τ₂ programme.** (1) **R-F1(Φ) adopted in M2 now:** ψ, ψ̄ ∈ Γ(M), M the irreducible Cl(0,12)-module ≅ ℍ³² (A3; Bott); Φ componentwise; kinetic term the module trace ζ⟨∇Φ,∇Φ⟩_M, forced by covariance (one-dimensional space of invariant forms, [R]); three readings 1/32/1024; the corner-algebra bundle 𝒞 is the *corner reading* of the module-valued field. Certificate `M2_L7_module.lean` (5 thms). (2) **Option (b) for ω:** τ̂ is the Pin lift of the flow reversal *without* conjugation; ω = ψ + τ̂ψ is quaternion-valued with its imaginary part along the selected unit (R-τ11 recovered; today's R1 "ω = 2 Re ψ" now holds in the corner reading only); the degree-three uniqueness holds up to the order of non-commuting factors, the commutator remainder being the Sp(1) structure the fibre paper (M7) reads as the S² flux — not used in M2. (3) **M2-6 kept against R-τ8:** Λ₁₂ = 0 is the case where solvability returns zero, to be established or refuted in M7; §3 says so. Items for the Register: Paper 6 l.84 "consciousness coherence field" (forbidden form); the corpus "disjoint support" wall picture to be re-expressed in τ's terms. |

*Q1–Q17 closed 8 Nov 2026 (see §7). Build order per §3 critical path: WP0 → R2.1 → R2.2 → R3.1 → R3.2 → WP4 (Paper 2 §§3–4 reproduced, Σ-2 discharged) → WP5 (two zeros) → R5.3. First unblocked items: WP0 definitions sheet; `M2_L1_parity`; `M2_L3_zeta`.*


---

## 8. Rollback record (8 Nov 2026)

**Error.** R3.1 was scoped (from the handover, unchecked by the architect against the canonical form G_{MN}) as "Φ_QC is the warp seen from 4D". The Master Equation is twelve-dimensional; Φ_QC is a dilaton on M₁₂ with coupling ζ. The 4D radion computation (C = 24) is correct about a different object and is not M2 material. All conclusions drawn from it are void: Q11 (display "24ζ²"), Q13, Findings 1–4 and the numerical test of WP4, Register §15, SOW rows R3.1–R3.7 as written. The architect's standing lesson: check handover physics against the canonical form before adopting it.

**Kept.** WP0, WP2 and their certificates (L1, L3, L4); rulings Q1, Q3–Q10; Register §12.1, §13, §14.

**Re-scoped R3.1 (PI-confirmed).** The action on M₁₂ contains the Φ_QC sector as a dilaton with coupling ζ; the Master Equation G_{MN} = 8πG_eff T_{MN} + ζT^Φ_{MN} + Λ_eff g_{MN} is its twelve-dimensional Euler–Lagrange equation; A2's warp is the geometry's response to the Φ profile, A = ζΦ with Φ dropping by one unit across the half-period, so Paper 2's ζ ≡ k_ωL_ω is the solution relation; Paper 2's 2D system is the base restriction of the Master Equation (discharging Σ-2); ζ = 12π is Paper 2's derivation reproduced in M2 on that footing. **Top open item for the assumption list:** how the Φ kinetic term in the 12D action arises from A2's sheets, given Φ_QC = ω(ψ−ψ̄)² is composite in ψ, and its reconciliation with M1's reading "growth is in the geometry".


## 9. WP3 re-built on the re-scoped R3.1 (8 Nov 2026)

Delivered: `M2_WP3_master_equation.tex` (§3: the action on M₁₂ — one gravitational term [Q1], induced connection [Q12], the dilaton term with the "sheets enter through Φ alone" reading and the parity theorem as its reason, Λ₁₂ by stationarity; Theorem thm:master = the canonical display, proved by variation; ζ□Φ = V′ with the F1 note's □Φ = 0 as the V′ = 0 case; flow stress tensor; base restriction eq:2D with a = −ζΦ as the solution relation to be established in WP4; matter scope; derived-vs-read summary). `M2_L2_master.lean`, 6 theorems. WP0+WP2+WP3 compile together (8 pp.); the only forward reference is to WP4. Convention flag for PI: Φ kinetic term inside the 1/2κ² bracket with coefficient ζ (reproduces the canonical display); CFM v12 l.1525 uses −½ζ outside the bracket.

**WP4 scope (next):** reproduce Paper 2 §§3–4 inside M2 on this footing — the 2D system as the base restriction (eq:2D), the BPS completion with Φ present, Dirac quantisation of the induced F (π per corner from Q12), the kink balance, the Gauss–Bonnet normalisation, the tadpole count; establish a = −ζΦ with Φ = 1 at the boundary configuration (Paper 2 §7.3) as the solution relation; ζ = 12π. Port `P2_L2_exponent_v2.lean`.


## 10. WP4 built (8 Nov 2026)

Delivered: `M2_WP4_warp_exponent.tex` (§4: Thm warp-exponent, Cor ζ = 12π; integers — χ(pillowcase) two routes, Gauss–Bonnet, χ(K₈), tadpole N = 12 on the base cycle [weak (c)]; base system with its single modulus — fibre decoupling via Einstein fibres, κ₂² = κ₁₂²/(V₄Vol₀e^{6a₀}), a = −ζΦ with Φ = 1 at the far wall as the dilaton's normalisation (Q16 reconciliation); BPS completion with the V-balance as the determination of Λ₁₂; flux at P₁ with FD check; constant slope as boundary condition, exact kink; κ₂² = 2/L as the one normalisation, made a scale relation; result, N = 1 case, three checks; the direction subsection (Q15, τ-symmetry, τ₂ physical); derived-vs-read summary). `M2_L5_warp.lean`, 9 theorems (ports P2_L1/L2 integer content + balance identity + τ on corners). WP0+WP2+WP3+WP4 compile together: 12 pp., no undefined references. ω-lint clean. §3's connection paragraph reworded for weak (c).

**Open for PI (flagged in the fragment):** (i) κ₂² = 2/L — reproduced as in Paper 2/Addendum and tagged [D] with eq:kappa-eff making it a scale relation; a derivation from orbifold Gauss–Bonnet with the e^{6a} weights would make it [R]. (ii) M2-7 bracket convention for ζ. (iii) "Canonically normalised" for Φ read as ΔΦ = 1 per half-period fixed by the far-wall configuration.

**Remaining nodes:** WP5 — "What ω is": the two zeros from A2 and A4 (R5.1 precise form), GUE maximum [M], hook to M3/M4; R2.4 half-circle route (a) now that a = −ζΦ is in hand (w > 0 ⇒ sign of Φ?); R5.3 assembly (abstract, §1, outlook, acknowledgements, Appendix A certificates, Appendix B table, register checklist §11, F1 lint).


## 11. WP5 and assembly — M2 v1 draft complete (8 Nov 2026)

Delivered in `Paper_M2_v1/`: `Paper_M2_Master_Equation_v1.tex` (main file: M1 preamble + mef_macros; abstract per the anomaly-first anatomy; §1 purpose / observation / results / organisation / register note with the deflationary reading; §§2–6 = WP0, WP2, WP3, WP4, WP5 fragments; outlook with four named open items; acknowledgements in the mandated wording; Appendix A certificates; Appendix B cumulative symbol table; 13 external references), the five fragments, `M2_AppB.tex`, six certificates (L1–L6, 50 theorems, Lean 4.15.0 core, zero sorry). Compiles three-pass clean, 16 pp., no undefined references, ω-lint clean, UK spelling, "we" throughout.

WP5 (`M2_WP5_omega.tex`): Prop locked zero (A2, R1); Def orbit average; Prop uncorrelated zero (A4, ergodic theorem); the hump in the lock angle (circular-normal family); **new:** Φ_QC = −8r³cosϑ sin²ϑ is extremal at tan²ϑ = 2 (ϑ* ≈ 54.7°) — the parity theorem's own number; the half-circle closed as "definite sign on the decaying-warp solutions" [D] with the sign of ψ a convention (R2.4 closed under Q3 route (a)); the spectral face [M] with the hook to M3/M4.

**Register checklist (§11 of the guide):** 1 title noun phrase ✓; 2 abstract order ✓ (anomaly-first anatomy); 3 "The purpose of this paper is" ✓; 4 organisation paragraph ✓; 5 Master Equation with Φ expansion, ζ value, terms defined — in thm:master prose, ζ = 12π stated in the readings paragraph (lettered definitions not used; M1 style followed instead — PI to accept or request); 6 consistent symbols ✓; 7 macros ✓; 8 UK ✓; 9 tags + deflationary reading ✓; 10 no MEF citations except M1 by name ✓; 11 acknowledgements exact ✓; 12 no bullets/boxes/exclamations ✓.

**Open for PI (presentation, none blocking):** κ₂² = 2/L [D]; bracket convention for ζ (M2-7); square vs modulus in Φ_QC (M2-9); checklist item 5 style; the ratio 24π/log φ² left unstated in text (comment only). Ledger delta to propose once PI accepts the draft: Paper M2 section (rows for thm:handedness, prop:parity, thm:master, thm:warp-exponent/cor:zeta reproduced, prop:locked, prop:uncorrelated, Φ extremum, half-circle), and the M1 header correction (v2 / 49 theorems).

**Verified vs hypothesis for the whole build:** read in file — M1 v2, ledger v22 §M1, Paper 2 §§2–4, §7.3, Paper I Addendum §§3–4, CFM v12 l.1419/1525, SoT v6 l.30–45, ω doc §§2, 4, 6a, F1 files, register v2, all certificates. Architect's constructions marked `%% ARCH` in the fragments: Def ψ as a section of 𝒞 (PI-instructed); τ = (S, s ↦ −s) as A2's involution; the sharpened parity statement; the circular-normal family for the hump; the Φ extremum; the half-circle argument. All rulings Q1–Q16 recorded in §7.


## 12. Reconciliation with the τ₂ programme applied (8 Nov 2026)

Rulings Q17(1)–(3) applied across Def ψ, Def ω, Prop parity, §3 (action, thm:master, variation, Bianchi, flow components, Λ₁₂ note), §5 (corner reading, half-circle on Re), Appendix B, abstract and §1. New certificate `M2_L7_module.lean` (Bott 12 ≡ 4 mod 8 ⇒ ℍ(32); dims 32/64/128; three readings; uniform trace; imaginary square real). Paper: 28 pp., zero overfull, margins clean, lint clean. Build record line for L7 marked "to be run" pending the PI's tree.
