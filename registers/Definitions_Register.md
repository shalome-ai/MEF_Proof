# Definitions Register — the Mx series

*One meaning per term (CLAUDE.md §2d; Decision Log P24). Opened 10 November 2026. Every term is entered with the text that defines it, by file and line. **When reading a paper, read each term as defined here. When writing, use each term as defined here, and enter a new term here before it is used.** If a definition seems to need changing, the first hypothesis is that the wording has drifted in the writing (an error of the kind language models introduce), not that the mathematics or the physics is wrong: stop, show the defining text, and take it to the PI. Claude proposes; the PI banks.*

**Columns.** Term · Definition (in the words of the defining text where possible) · Defined at · Notes (other senses in the corpus; collisions; status).

**Status marks.** DEFINED (a defining sentence exists at the place cited) · USED UNDEFINED (the term is used in M1/M2 without a defining sentence) · COLLISION (the same word carries more than one meaning in the texts).

## Geometry

| Term | Definition | Defined at | Notes |
|---|---|---|---|
| **fold** (ι) | the involution z ↦ −z of the torus fibre; "the fold that halves the internal piece" | M1 l.145; M1 Prop 5.5 (l.317) | DEFINED. In M2 the fold is τ², not τ (M2 `M2_WP2` ll.103–110) |
| **pillowcase** | the quotient T²/ι: "a sphere with four cone points of cone angle π" | M1 Thm 5.7 (l.355) | DEFINED |
| **cone point** | a fixed point of the fold, where "a small disc of angle 2π is folded to a cone of angle π" | M1 ll.359–362 | DEFINED |
| **deficit (angle)** | 2π minus the cone angle; π at each cone point of the pillowcase; the four sum to 4π | M1 l.362 | DEFINED |
| **corner** (P₁ … P₄; C₀, C_i, C_j, C_k) | the four cone points, by position P₁ = (0,0), P₂ = (½,0), P₃ = (0,½), P₄ = (½,½) and by algebra | M1 Appendix B (l.602) | DEFINED. "corner" and "cone point" name the same four points |
| **half-period** (L_ψ, L_ω) | half the period of the covering torus in the θ_ψ, θ_ω direction | M1 l.364; M2 `M2_WP0` ll.17–18 | DEFINED by use; no displayed defining sentence |
| **aspect ratio** (τ₂) | L_ω/L_ψ | M1 l.364; M2 `M2_WP4` l.268 | DEFINED. COLLISION flagged in the series SOW: fibre-radius ratio R_w/R_c against pillowcase ratio (M7) |
| **drive** (M₀) | the return map of the flow of A4 on the torus, M₀ = ((2,1),(1,1)) | M1 Def 2.7 (l.183), Thm 4.2 (l.225) | DEFINED |
| **exchange** / **sheet exchange** (τ) | (x, s) ↦ (Sx, −s): a quarter-turn of the fibre with a reversal of the flow; τ² = the fold | M2 `M2_WP2` ll.103–110 | DEFINED. The word "exchange" for τ is used in the audit draft; M2 says "the involution of A2", "flow reversal" |
| **wall** | **PROPOSED (10 Nov 2026), from the PI's figure and chapter, awaiting the PI:** one of the two edges of the pillowcase that run along the ω direction: the **Q-wall** (ψ), the edge θ_ψ = 0, which passes through the corners P₁ and P₃; and the **AQ-wall** (ψ̄), the edge θ_ψ = L_ψ, which passes through P₂ and P₄ (corner labels of M1 Appendix B). A wall is a line, not a point. The direction from one wall to the other is θ_ψ; ω runs along each wall from low (at P₁, P₂) to high (at P₃, P₄) | figure "pillowcase engine schematic: four quadrants, two walls, one axis of ω" and text of *The Shape of Becoming*, ch. 8 (v2, 25 Jun 2026), ¶¶63, 66, 100, 103; Paper I Addendum ll.1084–1086 ("from the UV brane (Quantum-wall) to the IR brane (Anti-Quantum-wall)", warp along θ_ψ) | Was USED UNDEFINED in M1 and M2. Points to settle: (0) Paper VIII (ll.357–366, 1160–1169) uses "wall" for a *corner*: "P₁ = (0,0): Quantum-wall", "P₃ = (L_ψ, L_ω): Anti-Quantum-wall", the diagonally opposite corner, and numbers the corners P₂ = (L_ψ,0), P₃ = (L_ψ,L_ω), P₄ = (0,L_ω), which is neither M1's numbering nor Paper XI's assignment of sectors; (1) the chapter also says "the AQ-wall is fixed-point P₃ … the diagonally opposite corner" (¶101), a point, and "through the two fixed points" (¶137); (2) the figure labels the four *quadrants* P1–P4, with P2 displaced from P1 along ω and P3 across to the other wall, which is M1's P₃ and P₂ respectively (M1 App. B has P₂ the ψ half-period and P₃ the ω half-period; Paper XI ll.493–500 agrees with M1); (3) the fold z ↦ −z fixes only the four corners, so a wall is not a fixed set of the fold: it is an edge of the folded rectangle; (4) the map that carries one wall to the other is the half-period translation in θ_ψ (P₁ ↔ P₂, P₃ ↔ P₄), not the fold (which is the identity on the pillowcase) and not M2's exchange τ (which fixes P₁, P₄ and swaps P₂ ↔ P₃, carrying a wall to a low-ω/high-ω edge) |

## The warp

| Term | Definition | Defined at | Notes |
|---|---|---|---|
| **base** and **fibre** of K₈; **warped product** (×_w) | In B ×_w F the base is B, the fibre is F, and the metric is g_B + w² g_F with w a function on B. For K₈ = (ℂP² × S²) ×_w (T²/ℤ₂): **base ℂP² × S², fibre the pillowcase, warp a function on ℂP² × S² multiplying the pillowcase metric** | the PI's block-matrix form `TPhi_12x12_elements.tex` ll.107–112 ("w² g_P", "the warp w a function on the base ℂP² × S²"); M1 ll.107, 172, 317 | **COLLISION.** M2 (`M2_WP0` ll.243, 249–251; `M2_WP3` l.320), Paper 2 Σ-1 and Paper I Addendum §3 use the opposite: "the pillowcase base", "the six-dimensional fibre ℂP² × S²", warp e^{2a(θ)} on ℂP² × S² depending on the pillowcase coordinates. Under CLAUDE.md §0a the PI's form is the reference. The standard convention for ×_w is RECALLED (O'Neill ch. 7), not yet verified |
| **warp** (w = e^A; exponent A or a) | the function entering the lengths of one piece from another; w = w₀e^{κs} | M1 Def 2.2 (l.142); M2 Def 2.5 | DEFINED |
| **warp exponent across the half-period** (kL) | A(0) − A(L) = kL, with k the constant decay rate of A between the walls | Paper I Addendum eq. boundary-cond (l.1006); M2 Thm 4.1 (ll.20–31) | DEFINED |
| **kink** | **a discrete jump in the derivative of the warp exponent at a point**: [∂A]₀ = A′(0⁺) − A′(0⁻). "Each unit of flux contributes a discrete kink of exactly κ₂²π to the derivative of A"; "the jump in the derivative at the origin … = −2k" | Paper I Addendum ll.996–997, 1034–1040; Paper 2 ll.418–424; M2 `M2_WP4` ll.211–213 | DEFINED, and the three texts agree. It is a jump in the *slope*, not in A. The companion statement in the corpus is the Israel junction condition ΔA′ = −κ²λ (Paper I Addendum l.1062) |
| **flux unit** (N) | one unit of Dirac-quantised flux of the Spin^c determinant line: (1/2π)∫F = N | Paper I Addendum l.960; M2 `M2_WP4` l.185 | DEFINED |
| **BPS equation** | the first-order equation ∂A = −(κ₂²/2)\|F\|/√g₂ | Paper I Addendum eq. bps-equation (l.950); M2 `M2_WP4` l.176 | DEFINED as an equation; its derivation is under audit (`papers/M2/STEP_AUDIT.md`) |
| **ζ** — reference meaning (PI, 10 Nov 2026, record §10): **what couples the pillowcase to spacetime S³ × S¹ "through the fibres"; there is no ζ coupling spacetime to ℂP² × S²**; the weight of the shadow's contribution to gravity (P26). In M2: | (i) the coupling of Φ_QC: the coefficient of T^Φ in the Master Equation; (ii) the warp exponent across the half-period for N = χ(K₈) | (i) M2 Thm 3.1 (`M2_WP3` ll.30–44); (ii) M2 Cor 4.2 | DEFINED twice; M2 states they are "one number" by a normalisation of Φ (`M2_WP4` ll.130–146). Under audit |

## Fields

| Term | Definition | Defined at | Notes |
|---|---|---|---|
| **sheet field** (ψ) | a smooth section of the irreducible Clifford module M ≅ ℍ³² of M₁₂ | M2 Def 2.2 (`M2_WP0` ll.92–96) | DEFINED |
| **chiral twin** (ψ̄) — the PI's name, 10 Nov 2026: "psi-bar is the chiral twin of psi". M2 calls it the **shadow** | ψ̄ ≡ τ̂ψ, "the field as seen after the exchange of growth and decay" (M2's definition; under audit) | M2 Def 2.2 (ll.97–104) | DEFINED. **The word "shadow" is now reserved for the fifth axiom** (sense (b)); ψ̄ is the *chiral twin* (record §9). Earlier collision, three senses: (a) this one, the sector ψ̄; (b) what is observed, the image of the twelve-dimensional object under the reduction (the fifth axiom, Decision Log P19); (c) Zwegers' shadow of a mock modular form (earlier corpus). One must be chosen for the series and the others renamed |
| **Coherent Field** (ω) | ω ≡ ψ + ψ̄ | M2 Def 2.3 (`M2_WP0` ll.138–152); naming per `canon/omega-definition-usage_v2.md` | DEFINED |
| **dilaton** (Φ_QC) | Φ_QC = ω\|ψ − ψ̄\|², component by component in M | M2 Prop 2.4 (ll.167–181) | DEFINED |

## Terms of the PI's account not yet formalised (PI statements of 10 Nov 2026; `registers/records/2026-11-10_PI_account_warp_generations.md`)

**Standing caution from the PI (10 Nov 2026):** "I am using viscosity, mass and momentum these are '4 dimensional' 'human analogies'. the pillowcase is not a viscous medium in the true sense. And this is where definitions matter." The terms *viscosity*, *mass*, *momentum*, *speed*, *slower*, *faster* below are four-dimensional analogies for what is seen; none of them is a property of the pillowcase itself. No formal statement of the series may use them as if they were; each needs its twelve-dimensional definition entered here before it is used in a paper.

| Term | Definition (the PI's words) | Defined at | Notes |
|---|---|---|---|
| **the warp** (reference meaning) | "The warp is on the pillowcase"; it is a function of position on the pillowcase through Φ; it does not act on ℂP² × S² | record §4 | Supersedes, for the series, M2's e^{2a(θ)} on ℂP² × S² and the sentence at `TPhi_12x12_elements.tex` ll.107–112 |
| **viscosity** (of a sector) | what the warp gives each of the four sectors of the pillowcase: "as Φ traverses the pillowcase it slows down and speeds up" | record §4 | the PI's word; formal counterpart not yet fixed |
| **generation** | "Gen I, II and III are the same object but we see different shadows … there is only a single fermion" | record §5 | three shadows in four dimensions of one object "moving at different speeds in a higher dimension" |
| **mass** (as seen in four dimensions) | "mass is how we interpret the slowing up and speeding up"; "the mass goes up in gen III because it is moving slower - and because of the momentum conservation we interpret it as mass is higher" | record §5 | Settled 10 Nov 2026 (record §7): the two are "the same phenomenon interpreted in two different ways". At fixed energy, for an object massless in the full space, mass seen in four dimensions = hidden momentum; as it rises the visible speed and the hidden wave speed both fall and the hidden wavelength shortens (`papers/M2/checks/speed_check.py`). "Speed along the pillowcase" means the speed of the wave pattern, not the object's rate of travel round the hidden direction |
| **the forces** | carried by ℂP² × S²; "not effected" by the warp | record §4 | Whether the twist contributes to any force is **not assumed**: the PI withdrew reliance on chapter 8 ¶99 on 10 Nov 2026; to be proved later if at all |

## Terms proposed for M1 v3 (the architect's candidate wording, 10 Nov 2026; `papers/M1/Paper_M1_Five_Axioms_v3.tex` §2.6; awaiting the PI)

| Term | Definition | Defined at | Notes |
|---|---|---|---|
| **seen** (a piece that is seen) | T × Σ, the pieces carrying time and space, along which we observe; and, by the PI's statement that the forces are not affected by the warp, the pieces whose physics is observed directly | draft Def (shadow, formal), clauses (i), (ii); M1 l.121 ("an internal piece that is not directly seen") | PROPOSED. Whether ℂP² × S² counts as "seen" is the open point of clause (ii) |
| **projection** (π) | the map M → T × Σ that forgets the internal piece | draft clause (i) | PROPOSED |
| **shadow** (sense of the fifth axiom) | the image under π of a thing on M: what is left of it when its position in the internal piece is forgotten | draft §Shadow | PROPOSED. This is sense (b) of the three in collision above; if adopted, M2's ψ̄ needs another name |
| **regular** | (not yet defined for M1) | draft clause (iii) | PROPOSED term, definition owed |

## Terms introduced in the audit draft (the architect's wording; not yet banked)

| Term | Definition | Defined at | Notes |
|---|---|---|---|
| **rider** | a consequence for physics attached to the headline of one of the earlier axioms | audit draft Def 2.1 | internal |
| **reduction** (ρ) | the four-dimensional data obtained by integrating over K₈ in the two stages of M2 Def 2.5(iii) | audit draft Def 5.1 | candidate wording; awaits the PI |
| **regular configuration** | fields defined at every point of M₁₂ and smooth away from the corners and walls of the pillowcase | audit draft Def 5.1 | candidate wording; depends on "wall", which is undefined |

### Proposed 10 November 2026 (second session), from M1 v4 working draft; awaiting the PI. These replace the v3-draft wording of the rows "seen", "projection", "shadow" above; "regular" is withdrawn (not used in v4).
| Term | Definition | Defined at | Notes |
|---|---|---|---|
| **seen** | T × Σ, the pieces carrying time and space: "what is seen is the image of M under the projection π … that forgets F" | M1 v4 Def 2.1 | PROPOSED. A reading; the first of M1's five numbered choices |
| **projection** (π) | π: M → T × Σ, π(t,x,f) = (t,x) | M1 v4 Def 2.1 | PROPOSED |
| **shadow** (sense of the fifth axiom) | "the image under π of a point or of a subset of M" | M1 v4 Def 2.1 | PROPOSED. The only sense in which M1 uses the word (P26(c)) |
| **step** | "One application of this map [the return map of the drive on the torus] is a step of the drive" | M1 v4.1 §4.1 | PROPOSED (agreed as item 23). The drive's numbers (φ², 2 log φ) are per step |
| **time circle** | the circle T; three steps of the drive under the reading of Cor 7.4 | M1 v4.1 Cor 7.5 | PROPOSED (agreed as item 23; P28). M2's "circuit" is used for a step: COLLISION, to be settled when M2 is revised |
