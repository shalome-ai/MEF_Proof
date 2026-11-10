# M3 — step audit (CLAUDE.md §2b.1; gate 6)

**10 November 2026.** Every load-bearing statement that M3 itself makes, step by step. Statuses: **CANON** (a result of M1 or M2, by printed number, read at the line given) · **VERIFIED REF** (`registers/Verified_References.md`) · **CHECKED** (script named, or elementary and shown) · **DECLARED** (a reading or setting, named) · **GAP** (does not follow as stated) · **RECALLED** (from memory; not usable until verified). No step is left unmarked.

M3 makes three kinds of statement. The classification verdicts cite M1 and M2 and are audited in `M3_WP1-4_verification.md` §§1–4, verdict by verdict, with file lines; they are not repeated here. The declared axiom is declared, not derived; it has a failure test (§C). Two statements are derived in M3 and are audited below: A, the completeness of the twelve-dimensional geometry; B, the smallest case.

Neither statement produces a number that is compared with observation, so measure 2 (derive blind to the target) has nothing to act on in M3.

---

## A. Completeness: "under A1 and the fifth reading, the smooth cover of the twelve-dimensional geometry is geodesically complete, and the only singular set of the geometry itself is the cone locus of the fold"

**Ruled by the PI, 10 Nov 2026 (P22): this statement is left to M11 and does not go into M3.** The audit below is kept as the record M11 starts from (Future-Mx F-8).

**Statement corrected on 10 Nov 2026 after the blind check (§E).** My first wording was "the twelve-dimensional geometry is geodesically complete … no singularities". That overstated it: step A6 did not follow as I had worded it. The error was mine.

Used for: the derived half of the old Shadow Principle; the answer to "is GBH1's completeness axiom A1?".

| # | Step | Status | Evidence, and what it rests on |
|---|---|---|---|
| A0 | The object. M₁₂ is the quotient of a compact smooth manifold M̃ by the fold: M̃ = S³ × (the mapping torus of id × M₀ on (ℂP² × S²) × T²), the fold acting on the T² factor | **DECLARED**, and my construction | M1 names the pieces (Thm 8.1) and says the time factor is the Sol torus bundle with monodromy M₀ (Thm 4.2) and the fibre is T² folded to the pillowcase (Thm 5.7). M1 does not write M₁₂ as a quotient of a smooth manifold; this description is mine and is the hypothesis under which A1–A6 are run |
| A1 | The fold −I commutes with M₀, so it acts on the mapping torus | **CHECKED** | `checks/lift_check.py` (A1); −I is central |
| A2 | M̃ is compact without boundary | **CANON** + elementary | M1 Def 2.1 (each piece compact, connected, without boundary); a bundle with compact base and compact fibre is compact |
| A3 | The metric is positive-definite | **DECLARED** (reading R5) | M2 Def 2.1 |
| A4 | The metric is smooth | **DECLARED** (a hypothesis of this statement; M1's setting) | M1 l.117: a geometry is "a smooth shape … allowed to have a few isolated sharp points". The textbook theorem of A5 needs a smooth metric, so the statement is made for smooth metrics. M2's warp profile, a(θ) = a(0) − k\|θ\| with its exact jump in slope at the flux-carrying corner (`M2_WP4` ll.198–217; Decision Log Q16), is the thin-wall idealisation, compared by M2 itself to the Randall–Sundrum junction condition (l.250); it is a property of the warp profile by design and not a defect of M2. Reworded 10 Nov 2026: I had called this a "gap in M2", which was wrong |
| A5 | A compact smooth Riemannian manifold is geodesically complete | **RECALLED → supported by secondary sources only** | Hopf–Rinow (Verified References V-1). A web search on 10 Nov 2026 found the statement and the compact corollary in the Encyclopedia of Mathematics entry and in lecture notes; no textbook page was read. Not yet citable |
| A6 | A geodesic of the quotient is the image of a geodesic of M̃; hence every geodesic of M₁₂ extends for all parameter values | **DECLARED** (the orbifold definition of geodesic) + A5. **Does not give "no singularities"** | True only by that definition. M₁₂ has a singular set (A6a). On the regular part alone, geodesics aimed at that set leave in finite parameter time; in the quotient length metric no locally shortest path passes through a cone point of angle less than 2π (blind check, §E; the second sentence is RECALLED, not verified) |
| A6a | The singular set of M₁₂ is the image of the fixed set of the fold: S³ × (ℂP² × S²) × (two circles), of codimension two, with cone angle π. One circle passes through P₁ and covers the time circle once; the other passes through P₂, P₃, P₄ and covers it three times | **CANON** + **CHECKED** | M1 Thm 5.7 (four cone points of angle π), M1 Prop 4.4 (the drive fixes P₁ and cycles the other three); `checks/lift_check.py` (E1). The curvature of the quotient has a concentrated part on this set (M1 Thm 5.7, M2 Prop 4.3: π at each corner) |
| A7 | The curvature is bounded | **CHECKED** (elementary) | A continuous function on a compact space is bounded; needs A4 |
| A8 | "No singularities" is read as: no incomplete geodesic and no curvature blow-up | **DECLARED** (identification) | This is the identification step. Geodesic incompleteness is the usual definition of a singularity; the old axiom's "singularity" also covers blow-ups of fluids and zeros of functions, which this statement does not touch |
| A9 | The statement fails in general for an indefinite metric | **RECALLED** | The Clifton–Pohl torus is the standard example of a compact Lorentzian manifold that is geodesically incomplete. Not verified against a reference; M3 does not need it as a premise, only as the reason the reading R5 is named |

**What A establishes.** For any smooth, fold-invariant, positive-definite metric on the cover M̃: the cover is geodesically complete with bounded curvature, and M₁₂ is a compact orbifold whose only singular set is the cone locus of A6a, which is the image of a regular set of the cover. Read in the series' terms: the singular points that the twelve-dimensional geometry does have are themselves projection artefacts of the fold. It does not establish that M₁₂ is non-singular as a metric space (it is not), anything for the thin-wall profile itself, which lies outside the smooth hypothesis (A4), or anything about singularities other than geometric ones (A8).

**Observation on the setting, reported and not built on (CLAUDE.md §2).** The only M₀-invariant Fourier mode on T² is the constant (`checks/lift_check.py`, last item), which is the ergodicity M2 Prop 5.3 uses. So a warp exponent that depends on the torus coordinates alone cannot be single-valued on the mapping torus unless it is constant; it would have to depend on the flow coordinate as well. M2 leaves the relation of the warp direction to the flow direction open (`M2_WP2` ll.158–167, tagged [M]). A does not depend on how this is resolved, since it holds for any admissible smooth metric; but it bears on A0 and A4. For the PI and for M7.

**Reading confirmed by the PI, 10 Nov 2026 (a reading, not a ruling).** "Singular in four dimensions, smooth in higher dimensions" is said of the cones seen in the four-dimensional shadow (Paper III Addendum l.1190), not of the four corners of the pillowcase. The corners are cone points of K₈ itself, as M1 Thm 5.7 and Thm 8.1, M2 Prop 4.3, Paper III l.293 and the Addendum l.1128 all have it. Nothing in M1 or M2 changes.

**Failure tests.** (1) No smooth configuration exists of which M2's thin-wall profile is the limit: then A says nothing about the solutions the series uses. (2) A physical statement that needs causal (Lorentzian) completeness and cannot be read along the flow: then A does not answer it (this is M11's question). (3) M₁₂ is not a quotient of a smooth compact manifold as in A0.

---

## B. The smallest case: "the cone point of the pillowcase has a smooth preimage, and it is unique"

Used for: the worked example of the fifth axiom in dimension two. Nothing later rests on it.

| # | Step | Status | Evidence |
|---|---|---|---|
| B1 | The pillowcase is T²/ι, a sphere with four cone points of angle π; T² → T²/ι is two-to-one, branched at the four fixed points | **CANON** | M1 Prop 5.5, Thm 5.7; fixed points listed in `checks/lift_check.py` (B1) |
| B2 | Connected double covers of the sphere branched over a given four points correspond to homomorphisms from the fundamental group of the four-times-punctured sphere to ℤ₂ sending each puncture loop to the generator | **RECALLED** | Classification of coverings, and the filling-in of punctures for branched covers (Verified References V-4). A web search on 10 Nov 2026 confirmed only that the torus is a double cover of the sphere branched at four points, not this classification. Not yet citable |
| B3 | There is exactly one such homomorphism | **CHECKED** | `checks/lift_check.py` (B3): of the eight homomorphisms, one sends all four loops to the generator. Lean target `M3_L1_lift` |
| B4 | Hence the branched double cover is unique up to isomorphism of covers | B2 + B3 | Inherits B2's status |
| B5 | Its Euler characteristic is 2·2 − 4 = 0: a torus | **CHECKED** | Riemann–Hurwitz, `checks/lift_check.py` (B5); agrees with M1 Thm 5.7's quotient formula read backwards |
| B6 | The flat cone metric pulls back to a flat metric, smooth at the branch points because the angle π doubles to 2π | **CHECKED** (elementary) | M1 l.362 gives the same picture from above |
| B7 | "Unique" means: unique among connected double covers branched at exactly those four points, up to isomorphism of covers | **DECLARED** (scope); the unqualified claim **does not follow** | Other smooth spaces map onto the pillowcase: the plane and the cylinder; R²/Λ for any finite-index sublattice Λ; and, topologically, a smooth sphere (the singularity of the pillowcase is in its metric, not its topology). The uniqueness is of the minimal smooth cover |
| B8 | **The uniqueness does not carry over to the twelve-dimensional geometry.** The mapping torus of −M₀ is a second smooth double cover of the same quotient, not homeomorphic to the first | **CHECKED** (arithmetic) + **RECALLED** (one formula) | M₀ and −M₀ induce the same map on T²/(z ∼ −z); det(M₀ − I) = −1, det(−M₀ − I) = 5, so the first homology of the two mapping tori differs by a ℤ/5 (`checks/lift_check.py` E3, E4; the formula H₁ = ℤ ⊕ coker(A − I) is RECALLED). Found by the blind check |

**What B establishes.** Given B2: the two-to-one smooth cover of the pillowcase exists, is a torus, and is unique among double covers branched at the four corners. It does not establish uniqueness of a smooth preimage in any wider sense, and by B8 the smooth double cover of the twelve-dimensional geometry is not unique: M₁₂ has at least two. That is an instance, inside the series' own geometry, of the fifth axiom as ruled (P19): a smooth preimage exists; the shadow does not determine it.

**Failure test.** A second, non-isomorphic double cover branched over the same four points; excluded by B3 once B2 is verified.

---

## C. The declared axiom (not derived; audited for what it rests on)

Statement (P19): every admissible observed configuration, including what appears singular, has a smooth twelve-dimensional preimage under the reduction map.

| Item | Status |
|---|---|
| "The reduction map" | **CANON** as a scheme: M2 Def 2.5(iii) (integration over K₈ in two stages). M2 does not define it as a map on a named space of configurations; M3 must say on what it acts |
| "Admissible" | **DECLARED**, and not yet defined. GBH1's wording was "smooth solutions … geodesically complete"; M3 must give its own |
| The loss of information (the reduction is not one-to-one) | **CHECKED** in the smallest sense: integration over a factor is not injective. To be stated with a one-line example in the paper |
| Uniqueness | not asserted |

**Failure tests (Minimality Register M3-1).** A later paper needing uniqueness of the preimage, or a named completion mechanism, as a premise; or an admissible configuration shown to have no smooth preimage.

---

## D. Red-flag scan of the sources M3 consumes (gate 7)

M3's premises are M1 and M2 only. Scans run with `tools/redflags.py`; counts are of pattern hits, which prove nothing and say where to look.

| Source | Lines | Hits | By kind |
|---|---|---|---|
| `canon/M1/Paper_M1_Four_Axioms_v2.tex` | 629 | 8 | identified/read off 1; forward reference 3; choice words 4 |
| `canon/M2/M2_WP0_definitions.tex` | 265 | 5 | ∝ / up to 2; forward reference 1; choice words 2 |
| `canon/M2/M2_WP2_handedness.tex` | 170 | 1 | choice words 1 |
| `canon/M2/M2_WP3_master_equation.tex` | 375 | 3 | ∝ / up to 1; forward reference 1; choice words 1 |
| `canon/M2/M2_WP4_warp_exponent.tex` | 287 | 4 | ∝ / up to 1; forward reference 2; choice words 1 |
| `canon/M2/M2_WP5_omega.tex` | 161 | 2 | ∝ / up to 1; forward reference 1 |
| for comparison: `sources/Paper3_v13_Ramanujan.tex`, the shadow derivation | 105 (ll.376–480) | 10 | ∝ / up to 6; taken as given 1; read off 1; forward reference 1; choice words 1 |

No hit is of the kinds "rigour label on a numerical test" or "agreement with a known target" in M1 or M2.

**Limit of the scan, stated plainly.** A low count does not mean the text is free of soft steps; it means the soft steps are not phrased in the scanner's patterns. M1 and M2 mark theirs in another way, by the tags [D] and [M] and by the "what is derived and what is read" subsections (M2 `M2_WP3` l.364, `M2_WP4` l.276). The soft steps of M2 that M3 touches were found by reading, not by the scan, and are in the audit above and in the verification file: the normalisation κ₂² = 2/L ([D], M2 l.226); the constant slope between walls ([D], a boundary condition); the tie a = −ζΦ with Φ = 1 at the far wall ([D], a normalisation); the placement of the twelve flux units ([D]); the stationarity conditions of M1 Prop 8.2 (hypotheses owed by M7). None of these is consumed by statements A or B.

## E. Independent check (measure 3) — done 10 November 2026

**How it was run.** A fresh sub-agent was given the bare numbered steps of A and B, with the setting described in neutral terms (a mapping torus, an involution, a quotient), no file access, no mention of the series, and the instruction to find what does not follow. It was not told what result was wanted.

**Its verdicts, and what I did with each.**

| Step | Blind verdict | My re-check | Effect on the audit |
|---|---|---|---|
| A1, A2, A3, A5 | follow | — | none |
| A4 (my A6) | follows only by definition | agreed | A6 reworded |
| "no singularities" | **does not follow as worded**: the quotient has a codimension-two cone locus of angle π; its regular part is geodesically incomplete; the curvature has a concentrated part there | fixed locus CHECKED (`lift_check.py` E1) and it is M1 Thm 5.7 and Prop 4.4; the statements about locally shortest paths are its recollection | **statement A corrected**; A6a added |
| Lorentzian case | completeness can fail on a compact manifold (Clifton–Pohl); the curvature clause does not fail | RECALLED, as before | A9 unchanged |
| Lipschitz warp | A3–A5 not justified; curvature is then a distribution; a non-constant piecewise-linear periodic warp always has kinks | agrees with A4's gap | none; A4 stands as a gap |
| Hidden assumption | M₀ is not an isometry of any flat metric on T², so the torus metric must vary round the circle; a warped product with a fixed torus metric does not exist on the mapping torus | consistent with M2's Sol metric (`M2_WP2` eq. sol-metric); not independently checked | added to the observation for M7 below |
| Invariant functions | no continuous non-constant M₀-invariant function on T² | CHECKED (Fourier modes) | observation confirmed |
| B1–B6 | follow | — | none |
| B7 | **needs a substantial hypothesis**: unique only within the class of B2 | agreed | B7 reworded |
| transfer to X | **does not transfer**: −M₀ gives a second, non-homeomorphic smooth double cover | CHECKED (`lift_check.py` E2–E4), one formula RECALLED | B8 added |

**What the check caught.** One overstatement of mine (A, "no singularities") and one unstated scope (B, "unique"). Both are now corrected above. It also produced B8, which I had not seen.

**A consequence for M1, reported and not acted on (CLAUDE.md §2: the first hypothesis is that my reading is wrong).** M1 l.221 selects "the least \|t\| > 2, which is t = 3", and Theorem 4.2 proves uniqueness among matrices of trace three. The trace −3 matrix −M₀ has the same eigenvalue modulus φ² and therefore the same entropy (`lift_check.py` E2), so criterion (2) of M1 Def 3.2 does not separate M₀ from −M₀. On the pillowcase the two are the same map, so M1's geometry, which is the quotient, is unaffected; the difference is visible only on the smooth cover (B8). As I read it, M1's uniqueness statement is correct for the quotient and silent on the sign for the cover. For the PI: an erratum line or a Minimality Register entry, if the reading is right.

**Observation for M7, extended.** Two facts now point the same way: no non-constant function of the torus coordinates alone is carried round by the drive (CHECKED), and no fixed flat metric on the torus is preserved by the drive (blind check; RECALLED). So neither a warp depending on (θ_ψ, θ_ω) alone nor a fixed aspect ratio of the torus is globally defined on the Sol bundle as it stands; each would have to vary with the flow coordinate. M1 Prop 8.2 fixes the aspect ratio τ₂ as a number; the series SOW already records for M7 that the pillowcase ratio is dynamical. Not built on here.

---

## F. The statements of the draft paper (`Paper_M3_Axiom_Audit_v0.tex`, 10 November 2026)

After P22 the paper contains neither statement A nor the uniqueness part of statement B. Its own statements, step by step:

| Statement in the draft | Step | Status |
|---|---|---|
| Thm 2.2 (the classification) | each verdict cites a theorem of M1 or M2 by printed number | **CANON**, read at the lines recorded in `M3_WP1-4_verification.md` §§1–4, 8; confirmed by the PI (P18, amended P22) |
| | counts 8 + 7 + 2 + 3 = 20; one class each | **CHECKED**: `M3_L2_count` (`L2_class_counts`, `L2_partition`) |
| | the rule "class of the headline; a block is T only if every clause is proved" | **DECLARED** (Definition 2.1), tagged [D \| minimality] |
| §1.2, the Euler remark | S² = −I | **CANON** (M2 Prop 2.6, `L4_S_sq_fold`); re-derived, `L3_exchange_squared` |
| | "a half-turn is multiplication by e^{iπ} = −1 in the complex coordinate" | **CHECKED** (elementary: rotation by π in ℂ is z ↦ −z) |
| §4, the Dirichlet series of d_odd | each n = md with d odd in d_odd(n) ways; Σ_{d odd} d^{−s} = ζ(s)(1 − 2^{−s}) | **CHECKED** (elementary, shown in the text; coefficients also in `checks/mu_check.py` item 4) |
| Axiom 5 and Def 5.2 (the fifth axiom) | declared, not derived | **DECLARED** (P19; Minimality M3-1). The words "configuration", "regular", "reduction", "observed configuration" (Def 5.1) are the architect's candidate wording and await the PI |
| Remark 5.3 (the reduction loses information) | integration over K₈ kills functions of zero mean | **CHECKED** (elementary). Stated for the map on fields only; whether two solutions share a reduction is expressly not claimed |
| Prop 5.4 (i) cone points are images of regular points | M1 Thm 5.7 and the paragraph after it | **CANON** (M1 ll.355–362) |
| Prop 5.4 (ii) the fold is two-to-one, not one-to-one | z and −z have the same image; equal only at the half-lattice | **CHECKED**: `L1_four_fixed`, `L1_two_to_one`, `L1_not_injective` (finite model) |
| Prop 5.4 (iii) other tori lie over the pillowcase | nℤ² ⊂ ℤ², so the identity of ℝ² descends and commutes with z ↦ −z | **CHECKED** (elementary); finite model `L1_second_cover`, `L1_second_cover_fold` |
| §5.4, the justification | three approaches did not close; "argue", tagged [M] | **DECLARED** as an argument, not a proof |
| Thm 7.1 (the minimal set) | follows from Thm 2.2 by counting | **CHECKED**: `L2_one_axiom`, `L2_minimal_set`, `L2_inputs`; its three stated limits are in the text |

**No external theorem is cited as a premise in the draft.** The sixteen bibliography entries are the references that occur inside the quoted text of Appendix A; their details were copied from the source's bibliography and have not been verified. Verified References V-1 to V-5 are therefore not consumed by M3.

**Failure tests stated in the draft.** For the axiom: an observed configuration with no regular configuration above it; a later paper needing uniqueness or a named mechanism as a premise (§5.4). For the minimal set: a target that proves not derivable returns to the axiom list (§7).

**Not done for the draft:** an independent blind check of its text (measure 3), and a referee's read. Gate results: 1, 2, 4, 5 pass; gate 3 has one finding, the word "negentropy" in the Σ-3 table of Appendix A, kept by the PI's ruling P16(j).
