# Lean certificate manifest — The Icosian Completion of K₈ (v2)

**Source paper:** `The_Icosian_Completion_of_K8_v2.tex`
**Toolchain:** Lean 4.15.0 core only (no Mathlib, no user axioms, zero `sorry`, no `native_decide`)
**Axiom audit:** every theorem depends on at most `propext` — strictly within the permitted set {`propext`, `Classical.choice`, `Quot.sound`}
**Compile:** all seven files exit 0 under `lean` 4.15.0 (commit 11651562caae)
**Scope (as confirmed by PI):** algebraic spine only. The Transport Principle [D], the SO(3) rotation classification within Lemma 3, the geometric axis selection (Theorem 2 Step 1), the ADE classification, the 2O-exclusion (√2 ∉ ℚ(√5) — would want Mathlib), and the E₈ isometry (cite-only in the source) are excluded and remain human-auditable.

## Statement ↔ certificate map

| Paper statement | Rigour (source) | Certificate | Certified content | Excluded (human-auditable) |
|---|---|---|---|---|
| Lemma 0 `lem:ring` | [R] | **ICO_C1** | φ = φ² − 1, (2 − φ)φ² = 1, φ(φ−1) = 1 — the full content of the one-line proof; plus Step-4 identities φ² + φ⁻² = 3, (2φ−1)² = 5, (2−φ)(2+φ) = 3−φ | identification of the encoding with 𝒪_F; maximality (classical) |
| Remark `rem:mod2` (level-2 arithmetic) | [R] | **ICO_C2** | M̄ mod 2: order exactly 3, no non-zero fixed vector, single 3-cycle on the three non-zero points, char poly x²+x+1 irreducible over 𝔽₂ | geometric corner identification (Lemma 1 is consumed from Paper XV, not re-certified) |
| Witnesses W-1–W-4 | [R] | **ICO_C3** | ord(M mod 5) = 10 exactly; M⁵ ≡ −I; charpoly = (x−4)² mod 5; φ ≡ 3, eigenvalue collision at 4; σ = M⁵ on 5-torsion; σ free on non-zero points; fixed classes = eigenline span{(1,2)}; both explicit 5-cycles | torsion coordinatisation of T²[5] |
| Lemma 2 `lem:blind` | [R] | **ICO_C4** | conjugation by each of the 8 Lipschitz units preserves each imaginary axis as a line (u e u⁻¹ = ±e), exhaustively; nrd = 1 on Q₈ | passage axes ↔ corner sub-algebras (dictionary) |
| Lemma 3 `lem:rigidity`, algebraic part | [R] | **ICO_C5** | all 16 half-units: nrd = 1, trd = ±1, u − ϖ₀ ∈ L | the SO(3)/octahedral classification (that ANY realisation lies in F^×·𝒰) |
| Theorem 1 `thm:hurwitz`(ii), computational support | [R] implications | **ICO_C5** | \|2T\| = 24, Nodup; multiplicative closure of 2T (576 products); Q₈ ∪ {ϖ₀, ϖ} ⊆ 2T | the group-theoretic counting argument; TP itself |
| §twoeval direct check (H1 discharge support) | [R] | **ICO_C5** | ϖ = ϖ₀²; ϖ³ = 1; ϖ₀³ = −1 (level-2 sign invisibility); conj_{ϖ₀} realises (i j k); conj_ϖ realises (i k j) = eq:cycle | TP; assignment convention of Paper III Addendum §5 |
| Theorem 2 `thm:q5`, V1–V3 | [R] | **ICO_C6** | nrd(q₅) = 1; trd(q₅) = φ; trd(q₅²) = φ−1 (GR-5); minimal polynomial q₅² = φq₅ − 1; q₅⁵ = −1; q₅¹⁰ = 1; q₅ᵏ ≠ 1 for k = 1..9 (order exactly 10) | Steps 1–3 (axis selection [D], parity transport [D], angle convention [M]/GR-1) |
| Theorem 3 `thm:icosian`(i), arithmetic | [R] | **ICO_C7** | q₅ coefficients = even permutation (1 4)(2 3) of the icosian pattern (evenness witnessed as composition of two disjoint transpositions); stable branch = odd permutation (1 4) (GR-2); lcm(24,10) = 120; divisibility facts | Conway–Sloane tabulation (cite-only); ADE classification; 2O-exclusion via √2 ∉ ℚ(√5) |

## Not certified, by confirmed scope

- **Transport Principle (TP)** — the single framework input, [D]; GR-3.
- **Lemma 3 classification direction** — SO(3)/octahedral group argument (geometry).
- **Theorem 2 Steps 1–3** — axis selection, spinorial parity, angle convention.
- **Theorem 3(ii)–(iii)** — order equality 𝒪_MEF = 𝕀 (ring-theoretic span argument over the classical uniqueness of the maximal order) and the E₈ isometry (cite-only).
- **2O-exclusion** (trd = ±√2 ∉ ℚ(√5), 2 inert): flagged at scope confirmation; a Lean certificate would want Mathlib (number-field machinery). Available as a follow-on on PI ruling.
- **Proposition `prop:h1`** as a statement: conditional on TP; its computational substrate (the ϖ realisation) is certified in ICO_C5.

## Per-file audit record

| File | Theorems | Axioms used |
|---|---|---|
| ICO_C1_Golden_Ring.lean | 7 | none |
| ICO_C2_Mod2_Shadow.lean | 5 | ≤ {propext} |
| ICO_C3_Mod5_Witnesses.lean | 13 | {propext} |
| ICO_C4_Q8_Blind.lean | 3 | none |
| ICO_C5_Hurwitz_2T.lean | 9 | ≤ {propext} |
| ICO_C6_q5_Unit.lean | 7 | none |
| ICO_C7_Icosian_Membership.lean | 6 | ≤ {propext} |

Total: 50 kernel-checked theorems across 7 certificates.

## Proposed ledger delta (PI-gated — NOT banked)

One row proposal, awaiting sign-off:

> Icosian completion algebraic spine (Lemmas 0, 2, 3-alg; W-1–4; thm:q5 V1–V3; thm:icosian(i) arithmetic) — canonical site `The_Icosian_Completion_of_K8_v2.tex` — Lean certificates ICO_C1–ICO_C7 (4.15.0 core, axioms ≤ {propext}) — geometric identifications and TP remain [D], human-auditable.
