# SOW + DAG v1 — Paper M3: Which axioms survive — an audit of the twenty axioms of the programme against the four

**PI:** Dhiren J. Master · **Seeded:** 9 November 2026 · **State:** PROPOSED; opens when the PI freezes M2. Written for Claude Code; the first session lists assumptions against this document and waits.

## 0. Rulings consumed (Decision Log, 8–9 Nov 2026)
- **Σ-5 (the Shadow Principle):** attempt its derivation from A1 first; fallback: establish it as the series' one declared axiom with the Gödel-boundary argument (𝓜-4) as justification.
- **Σ-P, Σ-S, Σ-T:** retire from the axiom list; mark each as a derivation target with the owing paper; if any proves non-derivable it returns to the axiom list with the failure logged.
- The standing principle of minimality and its register apply to every classification below.
- M1 and M2 are the only citable premises. Paper XX is the read-only source; reproduce, do not cite.

## 1. Objective and acceptance
**Objective.** Classify every axiom of Paper XX (twelve Σ creation axioms including Σ-0, Σ-3a, Σ-P, Σ-S, Σ-T; eight 𝓜 mathematical axioms) against A1–A4 + minimality + M1 + M2, into exactly one of: **(T)** theorem of M1–M2 (with the theorem named); **(TT)** theorem target, with the Mx paper that owes it; **(I)** genuinely independent axiom, with the derivation attempt documented; **(N)** not an axiom (method, interpretation, convention). Output: the minimal axiom set of the series, and the list of targets that defines M4–M13.

**Acceptance.** (1) every one of the twenty has a class and a one-paragraph justification; (2) Σ-5 has either a derivation from A1 at [D] or a documented failed attempt and the fallback statement; (3) Σ-P/S/T each have an owing paper and a one-line statement of what would derive them; (4) the paper ends with the minimal axiom set stated in one sentence; (5) Appendix: certificates for the finite parts (the corner/wall bookkeeping of Σ-0 and Σ-3; the Σ-6 parameter count); (6) register checklist and gates pass.

## 2. Load-bearing nodes

### WP0 — Inventory (mechanical; no ruling)
| Node | Task | Source |
|---|---|---|
| I.1 | Transcribe the twenty axioms verbatim with their Paper XX locations into Appendix A of M3 (as data, not citation) | Paper XX v10 ll.335–545 (Σ), ll.639–770 (𝓜) |
| I.2 | For each, list which M1/M2 results touch it (by label) | `ledger/M-Derivation-Proof-Ledger.md` |

### WP1 — The theorems already in hand (class T)
| Node | Axiom | Claimed classification (to be confirmed by the architect against M1/M2 text; PI confirms) | Evidence |
|---|---|---|---|
| T.1 | Σ-1 (manifold), Σ-2a–h (shapes), Σ-3 (pillowcase, walls, drive axis), Σ-3a (quaternionic layer to ℝ at one corner) | T | M1 Thm 8.1, Props 5.4–5.6, 7.1–7.6, Thm 5.7 |
| T.2 | Σ-4 (three fields; Φ = ω(ψ−ψ̄)²) | T | M2 Def ψ, Def ω, Prop parity |
| T.3 | Σ-6 (no free parameters), Σ-7 (dimensional simplicity) | T | M1 Def 3.2 and Thm 6.1 — these *are* the minimality principle |
| T.4 | 𝓜-7 (Sol monodromy; trace 3; φ²; arrow) | T | M1 Thm 4.2; M2 §handedness |
| T.5 | 𝓜-8 (Spin^c twist forced by w₂) | T | M1 Prop 7.3 |
| T.6 | Σ-0 (exact symmetry across the involution; asymmetries = which wall) | T, with a caveat to write: τ is an isometry of the lattice and the drive, an isometry of the flat base only if τ₂ = 1; the exact symmetry is of the *exponent*, the asymmetry is τ₂ (M2 Q15) | M2 §handedness, §direction; `L4_swap_lines`, `L5_tau_corners` |

### WP2 — Theorem targets (class TT) and their owing papers
| Node | Axiom | Owing paper | What derives it |
|---|---|---|---|
| TT.1 | 𝓜-6 (λ_n = n, d_odd(n), ζ(s)²(1−2^{−s})) | M4 | cone-tip Dirac spectrum |
| TT.2 | 𝓜-5 (partition function mock Jacobi) | M4 | twisted elliptic genus |
| TT.3 | 𝓜-1 (observables = internal spectral data) | M4 | spectral dictionary |
| TT.4 | Σ-8 (ω-drive: low ω classical, high ω interconnected) | M2 (two zeros, done) + M4 (GUE face) | the bridge theorem |
| TT.5 | Σ-P (three boundary types: transparent / puncture / impermeable) | M10 (Λ, warp), M11 (puncture = BH) | 12D objects (G, T^Φ) pass; Spin^c line confined to K₈; punctures as GBH1 topology |
| TT.6 | Σ-T (only gravity and ω transparent) | M2 (form) + M8 (gauge confinement) | G_{MN}, T^Φ twelve-dimensional; gauge fields on K₈ |
| TT.7 | Σ-S (shadow reaches us via gravity, ω, completion) | M5 (completion) + M10 (gravity, dark matter) | ψ̄ enters through T, Φ, and the mock completion |
| TT.8 | GBH1's causal-completeness axiom | M11; M3 says whether it is A1 | A1 closure ⇒ no boundary for incompleteness? — attempt |
| TT.9 | Paper 2's Σ-3 (k_ω = 1 fundamental unit) | M7 | the unit from the declared scale |

### WP3 — The independent axiom (class I): Σ-5 = 𝓜-2, the Shadow Principle
| Node | Task | Route | Fallback |
|---|---|---|---|
| S.1 | State Σ-5 precisely: every singularity in the four-dimensional shadow is the projection artefact of a smooth twelve-dimensional configuration; completion exists and is unique | from Paper XX wording, as data | — |
| S.2 | **Attempt from A1.** Reading: a closed, boundaryless M₁₂ (A1) with a smooth metric (M1) has no locus at which a field is undefined; a singularity in a lower-dimensional projection is therefore a property of the projection, not of the geometry. Existence of the completion = the twelve-dimensional configuration itself. **Uniqueness** is the hard part: show the projection map (restriction to the wall / base) has a unique smooth lift under the Master Equation's elliptic structure in Riemannian signature (Q8) — candidate: uniqueness of the solution to the 12D boundary-value problem on a closed manifold | A1 + M2 (Riemannian, elliptic) + EXT (uniqueness for elliptic systems on closed manifolds, e.g. Gilbarg–Trudinger) | If uniqueness fails to follow: **Σ-5 is the series' one declared axiom**, stated once with 𝓜-4 (the Gödel boundary: a complete object cannot certify its own completeness from inside) as its justification; Minimality Register entry; Future-Mx entry for M5 to test on the pillowcase |
| S.3 | Smallest case by hand: the pillowcase cone point — the 2D "singularity" is the fold of a smooth torus; the lift is unique because the fold is 2:1 | M1 Thm 5.7 | — |
| S.4 | Lean: the 2:1 lift uniqueness in the finite model (corner bookkeeping); the parameter count of Σ-6 | new `M3_L1_*.lean` | — |

### WP4 — Not axioms (class N)
| Node | Item | Classification | Note |
|---|---|---|---|
| N.1 | 𝓜-3 (proof template: spectral → modular → number-theoretic) | N — method | stays as the series' *method*, stated in the SOW not as an axiom |
| N.2 | 𝓜-4 (Gödel boundary) | N — meta-statement, used as the justification of Σ-5 if S.2 fails | — |
| N.3 | Any Σ-axiom found to be a convention (e.g. naming, orientation j/k) | N | Minimality Register entry if a choice is involved |

### WP5 — Assembly
Abstract (setting: twenty axioms; results: the classification and the minimal set; application: the target list for M4–M13; strongest consequence: the series needs A1–A4, minimality and at most Σ-5); §1 plain English ("how many rules does the universe need?"); §§2–5 as WP1–WP4; §6 the minimal axiom set and the target list; Appendix A the twenty axioms verbatim; Appendix B cumulative symbols; Appendix C certificates.

## 3. DAG
```
WP0 (inventory) ─► WP1 (T) ─┐
                 ─► WP2 (TT) ─┼─► WP5 (assembly)
                 ─► WP3 (Σ-5: S.1 → S.2 → S.3 → S.4) ─┤
                 ─► WP4 (N) ─┘
Critical path: WP0 → S.2 (the one derivation attempt) → WP5.
```

## 4. Lean targets
`M3_L1_lift.lean` — 2:1 fold lift uniqueness in the finite model (S.4); `M3_L2_count.lean` — Σ-6 parameter count (zero continuous parameters given M1's inputs); `M3_L3_walls.lean` — Σ-0/Σ-3 corner and wall bookkeeping under τ (reuses M2 `L5_tau_corners`).

## 5. Minimality Register entries anticipated
M3-1: Σ-5 as declared axiom (if S.2 fails) — choice space: axiom vs stronger completeness assumption; minimal: the weakest statement that gives uniqueness. M3-2: any classification that depends on a reading.

## 6. Verified vs hypothesis (at seeding)
Read: Paper XX v10 §§3–4 (the twenty axioms, by line). The classifications in WP1–WP4 are the architect's proposals from the M2 chat (9 Nov 2026) and are to be **re-verified against M1/M2 text by the first M3 session**, then confirmed by the PI, before any prose is written.

## 7. Sources to be uploaded by the PI (read-only)
`Paper_XX_New_Axioms_for_Old_Problems_v10.tex` (in repo under `sources/` or uploaded); GBH1 v10 (its axiom statement); Paper 2 v7 §2 (Σ-1–3).
