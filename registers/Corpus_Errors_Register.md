# Corpus Errors and Inconsistencies — findings from the Mx build (delta to `Corpus_Errors_and_Inconsistencies_Register_v2.md`)

*M2 v1.0 was withdrawn on 10 November 2026 (Decision Log P41) and is in `superseded/M2_v1/`. Entries below that cite M2, its work packages (`M2_WP…`), its certificates or `papers/M2/…` notes are records of the withdrawn paper: they are not in force and are not premises of the new M2.*

*M1 is cited by the numbering of v5.0 (canon, 10 Nov 2026). Line numbers of M1 quoted in entries made before that date are lines of v2 (`canon/M1/superseded/`); the map is `canon/M1/NUMBERING_v2_to_v5.md`.*

*Entries found while building M2, 8 Nov 2026. Numbering continues the PI's register (its last entry is 11). Entry 15 was withdrawn on the day (see note). PI banks.*

## 13. M1 v2 — refinement of the identification of A2's involution (found 8 Nov 2026, M2 build)

**What.** M1 identifies A2(iii)'s involution ι with the fold z ↦ −z of the fibre torus and conjugation on the algebra (M1 §2.2 text after Def 2.2; Prop 5.6; Thm 5.7). The fold is rotation by π: it is central (commutes with M₀), orientation-preserving, and does not exchange the stable and unstable directions of the drive — so it cannot send κ to −κ on the Sol block. The operation that does is the flow reversal τ: (x, s) ↦ (Sx, −s) with S the quarter-turn, SM₀S⁻¹ = M₀⁻¹ (M1's own `L1_conj_M0_inv`), and **τ² = fold** (`M2_L4_handedness.lean`: `L4_S_sq_fold`, `L4_swap_lines`, `L4_involution_det`).

**Status of M1's statement.** Correct on the pillowcase T²/{±1}, where τ² is trivial and τ is an involution; a refinement on the covering torus, where τ has order four and M1's "ι" is its square. Not an error in any M1 result (no M1 theorem uses more than the fold's action on the pillowcase and the corner lift), but the sentence "the involution ι is the fold" should read "the involution ι is the flow reversal τ, whose square is the fold".

**Consequences noted.** τ fixes exactly the corners P₁ and P₄ on the pillowcase (solutions of Sx ≡ ±x), i.e. the drive-fixed corner and the corner carrying the −1 lift — consistent with M1 Cor 7.7 and App. B without further input. Consistent with the corpus's quarter-turn Spin^c holonomy e^{iπ/2} on the ω-cycle (fossil site Paper I App A → Paper 1 `lem:quarterlift`).

**Proposed action.** One-sentence erratum in M1 v3 (§2.2 and Prop 5.6 remark); M2 states the refinement in its §2 (handedness subsection) and tags it [D]. PI to adjudicate.

## 14. `mef_macros.tex` line 20 — forbidden ω name in a comment (found 8 Nov 2026)

`\newcommand{\consciousness}{\omega} % consciousness coherence field`. Comment carries a forbidden form (ω doc §6a). The macro is unused in M1/M2. Proposed: delete macro and comment at next macros revision.


## 15. (withdrawn) Master Equation display
Withdrawn 8 Nov 2026: it rested on the architect's error of treating the 4D radion of the warp as Φ_QC; the Master Equation is twelve-dimensional and Φ_QC is a dilaton on M₁₂. No ledger action.


---

## 16. Direction of the warp exponent — Paper 2 (θ_ω) vs Paper I Addendum (θ_ψ) (found 8 Nov 2026)

**What.** Paper 2 §4 states k_ωL_ω = Nπ with the profile along θ_ω ("the warped direction θ_ω", l.339, no reason given) and builds on it: L_ω = ζ/k_ω = 12π (§6.2), L_ψ = L_ω/τ₂, Planck closure §6.4; ledger banks L_ω = 12π. The Addendum §3 (fossil, superseded by Paper 2 per ledger l.1008) derives kL_ψ = Nπ with A = −k|θ_ψ|, anchored to the wall structure: Q-wall {θ_ψ = 0}, AQ-wall {θ_ψ = L_ψ/2} (Addendum §2.2; photon paper Thm 19.1, ledger l.739). Neither paper derives the direction; the Addendum's is tied to where the sectors sit, Paper 2's is asserted.

**Resolution (PI ruling Q15).** The exponent is direction-blind (κ₂² = 2/L per direction makes kL = Nπ either way) and τ-symmetric: M2's sheet exchange τ swaps P₂ ↔ P₃ (the ψ- and ω-half-periods), so a θ_ψ profile for ψ is a θ_ω profile for ψ̄. The two papers describe the two sheets; the labelling is the j/k convention of M1 App. B. The aspect ratio τ₂ is where the choice is physical. **Action:** Paper 2 and the ledger's "L_ω = 12π" to carry the reading "half-period transverse to the ψ-wall, in the sheet called ψ"; Planck closure's τ₂ factors to be re-read under that convention when the sequestering paper of the series is built. No numerical change to ζ.


## 17. Paper 6 (τ₂) l.84 — forbidden ω name (found 8 Nov 2026)
"ω is the consciousness coherence field" — forbidden form per ω doc §6a; replace with "the Coherent Information Field". Also: Paper 6's R-τ8 (Λ₁₂ = 0 axiom) is superseded in the Mx series by M2-6 (Λ₁₂ by solvability), to be tested in M7.

## 18. Wall picture vs τ (found 8 Nov 2026)
The corpus's "disjoint support" (ψ on the Q-wall {θ_ψ = 0}, ψ̄ on the AQ-wall {θ_ψ = L_ψ/2}) is the fold's geometry; M2's sheet exchange τ maps the Q-wall through P₁ to the wall {θ_ω = 0} through P₁ (τ swaps P₂ ↔ P₃). M2 states the two sheets as τ-images (Q15); the "disjoint support" sentence must be re-expressed in τ's terms wherever it is consumed (Paper 6, the Addendum's zero-mode sections, F-58's proof), or the two pictures will read as contradicting.

## 19. Source of Truth v6 l.34 — the square in Φ_QC (ruled 9 Nov 2026; reopened and confirmed the same day)
The SoT writes Φ_QC = ω(ψ−ψ̄)². Under the literal square (ψ−ψ̄)² = −4(Im ψ)² ≤ 0 in the corner reading, so Φ and Re ω have opposite signs wherever the sheets differ, and no sign convention on ψ can make both positive. The corpus requires both: Φ ≥ 0 (decaying warp a = −ζΦ with Φ = 1 at the far wall, Paper 2 §7.3) and ω ≥ 0 (the one-hump, R1). Hence the corpus was using the modulus squared without writing it. Canon: Φ_QC = ω|ψ−ψ̄|² (M2 Def ω, Prop parity). The cross-wall pairing of Paper III/Addendum survives as the Hermitian pairing term. Action: SoT and all consumers to read |ψ−ψ̄|²; phase formula Φ = +8r³cos ϑ sin²ϑ. (Caught by Claude Code, 9 Nov 2026, before an attempted reversion.)

## 20. CFM Formal Foundations v12 l.1525 — normalisation of ζ (ruled 9 Nov 2026)
S_Φ = ∫√g[−½ζ|∇Φ|² − V] outside the gravitational bracket gives a coefficient of T^Φ differing from the canonical ζ by 2κ². The canon places the kinetic term inside the 1/2κ² bracket with coefficient ζ (M2 Def action). CFM's form is superseded.

## 21. Paper III Addendum (Sol Monodromy v11) — `\consciousness` macro for ω throughout
The Addendum writes ω via the `\consciousness` macro (mef_macros l.20, "consciousness coherence field" — forbidden form, cf. entry 14). Action: replace with `\omega` / "Coherent Information Field" when the Addendum's content is reproduced in M9; delete the macro at the next macros revision.

## 22. Paper III l.329 — "the MEF Higgs is the shape-modulus dilaton Φ = ω(ψ−ψ̄)² of Paper VI"
An identification, not a derivation, and under entry 19 the square is the modulus squared. Entered as a target (Future-Mx F-3) for M9 (Higgs sector) and M15 (Higgs mechanism), not consumed as a premise.

## 23. Paper XX v10 l.761 (𝕄-7) — "The Lyapunov exponent is ln φ" (banked by the PI, 10 Nov 2026)
The same axiom gives the eigenvalues of M = ((2,1),(1,1)) as φ² and φ⁻², which is correct (M1 Thm 4.2; M2 `L4_eigen`). The Lyapunov exponent is the logarithm of the stretching eigenvalue, 2 ln φ = ln φ², as M2 has it (κ = log φ², `canon/M2/M2_WP2_handedness.tex` l.35). PI ruling 10 Nov 2026 (Decision Log P17): the old axiom is incorrect as stated. Action: M3 Appendix A keeps the wording as data with a marked correction; any later paper reproducing a rate "ln φ" from the corpus (Paper XX l.764 repeats it: "all at rate ln φ") re-derives it with κ = log φ².

## 24. Paper XX v10 l.387 (Σ-2c) — "τ₂ = L_ω/L_ψ = 1.86" (banked by the PI, 10 Nov 2026)
The canon's value is 1.8466, the positive root of 6u³ + u² − 72u − 4 = 0 with u = τ₂² (M1 v2 Prop 8.2 (removed at v5.0); M2 `M2_WP4_warp_exponent.tex` l.268). Same discrepancy as flagged in the series SOW for Papers VI, VIII, X, XVI. Action: M3 states 1.8466 with the M1 reference; the stationarity hypotheses remain owed by M7.

## 25. Paper XX v10 l.480 (Σ-4) and ll.651, 726, 939 — "Φ_QC ≠ 0 topologically" (banked by the PI, 10 Nov 2026)
M2 shows Φ_QC vanishes at the real corner P₁, at the locked phase (Prop 5.1) and where the sheets coincide, so the statement is false pointwise. What M2 proves is that the two sectors are distinct (Thm 2.7), which gives ψ − ψ̄ ≢ 0 for a chiral ψ ≠ 0 and not Φ_QC ≢ 0. The statement is the "topological lock" of 𝕄-2/𝕄-3 (Navier–Stokes, Riemann). Action: to be stated precisely and proved where first consumed (M5 or M22); not a premise until then. See `papers/M3/M3_WP1-4_verification.md` T.2.

## 26. Paper XX v10 ll.476–480 (Σ-4) — "three fundamental geometric degrees of freedom" (banked by the PI, 10 Nov 2026)
In M2 there is one sheet field ψ; the shadow ψ̄ = τ̂ψ and ω = ψ + ψ̄ are determined by it (Defs 2.2, 2.3; "the two sheets of A2 are therefore one field"). Action: M3 uses M2's wording. Note for a future erratum list: M2 `M2_WP3_master_equation.tex` l.159 says "the fundamental fields are the sheets ψ, ψ̄ and the Coherent Field ω".

## 27. Paper XX v10 ll.520–526 (Σ-8) — the ω-drive stated one-sidedly (banked by the PI, 10 Nov 2026)
Σ-8 gives low ω as ordered and high ω as interconnected and omits the second zero. M2 derives both zeros (locked, Prop 5.1; uncorrelated, Prop 5.3) with one hump between, in agreement with `canon/omega-definition-usage_v2.md` §2. Action: M3 restates Σ-8 with both zeros.

## 28. Paper XX v10 l.751 (𝕄-6) — d_odd(n) called "the sum of odd divisors of n" (banked by the PI, 10 Nov 2026)
d_odd(n) is the number of odd divisors. The Dirichlet series the same axiom states, ζ(s)²(1−2⁻ˢ), is that of the count (the sum would give ζ(s)ζ(s−1)(1−2^{1−s})); `sources/twisted_genus_note.tex` Prop. `prop:dodd` (l.288) defines it as the count, with d_odd(6) = 2. The axiom's worked example at l.754, "d_odd(6) = 1 + 3 = 4", is wrong. Action: marked note in M3 Appendix A; M4 states the count.

## 29. Paper XX v10 l.769 (𝕄-8) and l.405 (Σ-2f) — "without [the twist] the partition function would be Liu-rigid … with no q-dependence" (banked by the PI, 10 Nov 2026)
Contradicted by `sources/twisted_genus_note.tex`: the untwisted genera of ℂP¹ and ℂP² are q-dependent (Prop. `prop:untwisted`(iii), with a second route by Riemann–Roch, `lem:RR`); Liu's rigidity theorems concern the equivariant parameter of a circle action and "say nothing about independence of τ" (`rem:rigidity`, l.206); "the twist does not create the anomaly … it breaks homogeneity of weight" (abstract; `rem:reading`). A₂ = 1 − y + y² is the q → 0 limit (the χ_y-genus), not the whole function. Action: M3 records the clause as not standing; M4 states what the twist does.

## 30. Paper XX v10 l.741 (𝕄-5), l.769 (𝕄-8), l.648 (𝕄-2); Paper XI v5 — the partition function called a mock Jacobi form completed by the Zwegers completion (banked by the PI, 10 Nov 2026; amended 10 Nov 2026 after the reading of Paper XI and Paper 3)
**Two objects were being called "the partition function".**
**Object A, the Spin^c-twisted elliptic genus** (Paper XI ll.421–540; `twisted_genus_note.tex`). 𝕄-5's wording ("mock Jacobi form of weight 0, level 2, and mock theta order 2") is Paper XI's (its abstract and l.203). Paper XI classifies it as mock because its function μ(τ,z) = Σ qⁿ/((1−yqⁿ)(1−y⁻¹qⁿ)) is called "the Appell–Lerch sum" (l.553) and the function is "T-invariant but S-anomalous" numerically (Prop. at l.620). The later note treats the identical μ and says it "should not be confused with the Appell–Lerch sums of Zwegers' theory" (l.303); the genus is quasi-Jacobi with an algebraic completion. **CHECKED** (`papers/M3/checks/mu_check.py`): μ = [½(y+1)/(y−1) − 𝒥]/(y−y⁻¹) to 10⁻¹⁶ at three points; 𝒥(−1/τ, z/τ) = τ𝒥 + z; the completed 𝒥̂ transforms with no anomaly. So for object A the mock classification is an error of Paper XI, carried into 𝕄-5 and 𝕄-8. Paper XI's "A₂ = 1 − y + y² (rigid)" and "(1−y)² … (rigid)" (ll.467, 520) are contradicted by the note's Prop. `prop:untwisted`(iii) (two routes).
**Object B, the σ-odd twisted-sector projection of the Spin^c Dirac data at the four cone tips** (Paper 3 v13 ll.284–288, 376–630). Paper 3 states that it is "not the full orbifold elliptic genus of K₈" and that the full pillowcase genus is a weak Jacobi form with no shadow (verified here: `paper3_check.py` item 4). For object B it gives a shadow −η(2τ)³ and, by the surjectivity of the Bruinier–Funke operator, a harmonic Maass form with that shadow, determined up to a holomorphic function (ll.526–575).
**Action.** M3 restates 𝕄-5 and the mock clause of 𝕄-8 as two statements: the genus (A) is quasi-Jacobi and carries the odd-divisor series — owed by M4; the cone-tip projection (B) carries the shadow — owed by M5. See `papers/M3/M3_WP1-4_verification.md` §8 for what Paper 3 establishes about B and what it leaves open.

## 31. Paper VIII v6 — four points found on reading it for the fifth axiom (PROPOSED 10 Nov 2026; PI to bank)
Read: ll.257–275, 341–606, 863–1010, 1104–1236. (a) **Appendix A.1 (ll.1113–1121) multiplies the four-dimensional metric by a warp factor e^{2α(y)} depending on the internal position.** The PI's account has spacetime unwarped (block-matrix form, g_E; Decision Log P26(b)). (b) **"Wall" is used for a corner** (ll.357–366, 1160–1169): the Anti-Quantum-wall is the diagonally opposite corner P₃ = (L_ψ, L_ω); the PI's figure has walls as edges. The corner numbering differs from M1 Appendix B and the sector assignment differs from Paper XI. (c) **The dark mixing angle is obtained by adding the holonomy phase to the visible angle** (l.479, "shifted by precisely this accumulated phase"), with no derivation of why a phase adds to a mixing angle; tagged "Derived". (d) **The result rests on hypercharge being the twisted Spin^c determinant line** (ll.387–397), a statement of the same kind as book ch. 8 ¶99, which the PI has said is not to be assumed (P26(e)); and on sin²θ_W = 0.224 and τ₂ = 1.86 from Paper V (see entries 24 and the series SOW on F-100). Consistent with the PI's account and kept: the pillowcase metric dψ² + e^{2ζΦ}dω² (l.369); SU(3) and SU(2) the same on both sides; the dark side acting on the visible "only gravitationally" (ll.985–990). Action: none of (a)–(d) is a premise; M17 re-derives.

## 32. M1 v6.3 — findings of the audit of Theorem 8.1 (banked by the PI, 11 Nov 2026, P94)
Source: `papers/M1/STEP_AUDIT.md` §11 (the architect's table, two blind readers, the comparison). Lines are of canon M1 v6.3. **In every item the first hypothesis is that the reading is wrong.** No certificate and no computation marked CHECKED was found wrong. J3, J4, J7, J10 and J11 of §11.5 are not entered here: they are with the PI as questions and not as errors of wording.

(a) **J1. Propositions 7.1–7.3 each take a hypothesis from another** (ll.661, 677, 693): ℂP² from "the Spin^c line of Proposition 7.3 below", the Spin^c line from "a geometry whose base contains ℂP²". Closed by a numbered choice (P92; Minimality M1-15); the wording stands in v6.3 until the new version.
(b) **l.685 attributes to Proposition 7.3 a statement it does not contain** ("spinor-valued data are complex"; ll.692–707).
(c) **J2. The torus is obtained from "Anosov" and "Anosov" from the torus** (ll.501, 277). Definition 2.9 (l.232) asks neither Anosov, nor a return map on one fibre, nor commutation with ι; l.235 says the strong form "is not assumed". Open.
(d) **J5. Clause (c) is applied to the dimension of the fibre** (l.513), which it does not name (l.268), and before clause (a), against the order of l.262. Open.
(e) **J6. U(3) is not the group Definition 2.8 names** (l.220 against l.677); that the base is the product of the two orbits and nothing more is used (ll.653, 712) and not stated as a result. Open.
(f) **J9. Proposition 5.2 with Lemma 5.1** (ll.449, 467): the hypotheses of the lemma as worded are met by M₂(ℝ) with the transpose (CHECKED by hand); the lemma gives N "values in the fixed set of *", and a⁻¹ = a*/N(a) needs N real. Open.
(g) **J8. Tags of the elimination table** (ll.1002–1015): the rows D ≢ 0 (4); D = 4, 8; Tⁿ, n ≠ 2; T⁴/ℤ₂ and K3; bases with moduli carry [R] and rest on results tagged [D], on undeclared steps, or (the last) on a functional that is not defined. The row on spin bases rests on (a).
(h) **[R] on statements that include a selection:** Theorem 4.2's "Consequently …" (l.300) and Proposition 4.5's "the clause selects it" (l.409). The [R] content is the conjugacy statements.
(i) **Proposition 5.6, statement against proof** (ll.521, 529): the statement has "ι acting as conjugation"; the proof uses the inner automorphism by the surviving unit at the three cycled corners. l.536 acknowledges the reading; the statement does not.
(j) **The corner labels against the cycle:** l.531 has "ℂ_i ↦ ℂ_j ↦ ℂ_k exactly as P₂ → P₃ → P₄"; Appendix B (l.1075) and l.578 have P₂ = C_j, P₃ = C_i, P₄ = C_k, under which the points run ℂ_j → ℂ_i → ℂ_k. Appendix B calls the assignment a convention; the choice of −w in Corollary 7.8 is not touched (CHECKED).
(k) **Cross-references:** l.533 cites "Definition 2.9(iii)" and Definition 2.9 has no numbered clauses; l.166 says Theorem 6.1 holds for "a geometry satisfying the other four axioms", where its hypothesis is Definition 2.7 with A1–A5.
(l) **l.349 against l.357:** "any A … is S M₀ S⁻¹" and "S A S⁻¹ = M₀"; the three displayed pairs satisfy the second. Wording.
(m) **l.725 against l.763:** the reading of clause (iii) is worded in "states of the fibre at rest" and Proposition 7.6 assumes "states on the pillowcase". The count is ruled (the earlier audit, `STEP_AUDIT.md` §8: P34(2)); the wording of l.725 does not say so.
(n) **Names used for two things:** "F" (the internal piece, l.150; what sits over the base, ll.202, 220, 277); "the time factor" (one-dimensional, l.150; the torus bundle, l.300); "M" (the manifold, l.148; the return map, l.277).
(o) **Definition 2.7, its two levels** (l.214): on one tangent space the tangent-level I, J, K, acting on spinors through the Clifford action, do not obey the quaternion relations and generate an algebra of dimension 30 (CHECKED twice, `papers/M1/COMMUTANT_LEAD.md` §4). "Acts through" for "acts … as" would be consistent. With the PI.

**Action.** One new version of M1 when J2–J11 are ruled (P92(3)). Items (b), (h)–(n) are wording and are corrected in it; (c)–(f) and (o) wait for their rulings.

**Note, 11 Nov 2026 (P97).** Since this entry was written the PI has ruled on J10 in principle: the unnumbered readings become numbered choices, the list to be drawn up when J10 is taken.
