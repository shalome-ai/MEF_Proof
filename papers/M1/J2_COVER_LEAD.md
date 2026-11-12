# The lead of J2: does Definition 2.9, with the other hypotheses of Proposition 5.5, give "Anosov" and the torus?

**Standing (12 November 2026; Decision Log P103, P104).** The computations of this note stand. Its framing and its section "What follows, and what does not" judge one node of M1 apart from the rest of the paper and the axioms; the PI rejected that method ("Everything it said was correct. But it was incorrect because in context the results were wrong.") and the conclusions about M1 are withdrawn (the architect was wrong). The PI's ground for the torus, said and not yet a confirmed read-back: "a genus 1 manifold torus is simpler and minimal vs a genus 3 object". This note is a premise of nothing.

**12 November 2026. Direction (PI):** the eleven assumptions on J2 were confirmed ("all confirmed - proceed"); assumption 8 has any example tested blind before it is used, with protocol and prediction written first (HANDOVER item 4, "Method"; the pattern is `COMMUTANT_LEAD.md`). **§§1–3 were written before any script was run and before the blind reader was launched.**

## 1. The object and the criteria

**The object.** T² = ℝ²/ℤ² with the four half-lattice points P₁…P₄ (M1 l.395) and the step M₀ = (2 1; 1 1). Σ: a double cover of T² branched exactly at P₁…P₄. τ: its covering involution. φ: a lift to Σ of M₀ or of a power of M₀. This is reader B's example (`STEP_AUDIT.md` §11.3, RECALLED there), made definite. It is not Dathe's example (genus two, branched at two points; READ, Dathe p. 25), which has no involution with four fixed points on the page.

**The criteria,** each a quoted line of canon M1 v6.3 and nothing else:

| # | M1's words | Line | Test, fixed now |
|---|---|---|---|
| D1 | "a smooth flow φ_t with no fixed points" | l.232 | Is φ a diffeomorphism, so that its suspension is a smooth flow without fixed points? |
| D2 | "positive topological entropy" | l.232 | Is the entropy of φ positive? |
| D3 | "a set of periodic points of measure zero" | l.232 | Are the periodic points of φ countable? |
| H1 | "compact and connected" | l.501 | Is Σ so? What is its genus? |
| H2 | "the involution ι having exactly four isolated fixed points" | l.501 | How many fixed points has τ? |
| H3 | "commuting with ι" | l.501 | Does φ commute with τ? |
| H4 | "the drive of A4 acting as an Anosov diffeomorphism" | l.501 | Is φ Anosov? |

**What the outcome would mean.** If D1–D3 and H1–H3 hold and H4 fails, then "Anosov" does not follow from Definition 2.9 together with the other hypotheses of Proposition 5.5, and the torus does not follow without it. If the object fails one of D1–D3 or H1–H3, it says nothing, and whether "Anosov" can be derived stays open.

## 2. Assumptions
1. Only the surface and its map are tested. Definition 2.9 puts the flow on T × F with F eight-dimensional (l.617); that it is the suspension of a map of a two-dimensional fibre is the reading of l.277 and is taken here as M1 takes it.
2. τ is the covering involution of Σ. It is not the fold z ↦ −z of the torus. Proposition 5.5 asks only for an involution with four isolated fixed points that the drive commutes with (l.501).
3. "Measure zero" is tested as "countable", which gives measure zero for every measure without atoms; M1 names no measure (assumption 7 of the session, confirmed).
4. Facts taken as known and not read at source: the lifting criterion for covering spaces; the Riemann–Hurwitz count; that a map has at least the entropy of a map it covers. Newhouse (1.3) is READ (p. 762) and is used for H4.

## 3. The architect's prediction, recorded before running anything
Reasoned, not computed, so RECALLED until the script and the blind reader report.
- The double covers of T² branched exactly at the four points are four in number (they differ by a class in H¹(T²; ℤ₂)). M₀ acts on the four as an affine map whose linear part has order three and no fixed vector, so **exactly one of the four is carried to itself by M₀**, and all four by M₀³.
- H1 holds: Σ is closed, connected, of **genus three** (χ = 2·0 − 4 = −4).
- H2 holds: τ has **exactly four** fixed points, the points over P₁…P₄.
- H3 holds: a lift of a map commutes with the covering involution of a double cover.
- D3 holds: the periodic points of φ are the points over the rational points; countable.
- D2 holds, at the standing of M1's own l.290: the entropy of φ is at least that of the torus map, which is positive (the last is V-23, not read).
- D1: φ is a homeomorphism, smooth away from the four points over P₁…P₄, and **not differentiable there** in the charts w with w² = z. Reason: a real-linear map z ↦ αz + βz̄ lifts to a differentiable map only if α = 0 or β = 0, and a hyperbolic map has neither. Whether another smooth structure makes it smooth is not something I can prove; that smooth models of such maps exist is RECALLED and used for nothing.
- **H4 fails:** an Anosov diffeomorphism of a surface is conjugate to a toral automorphism (Newhouse (1.3), READ), and Σ is not a torus.
- So the prediction is: every criterion but H4 is met, with D1 met except for smoothness at four points. "Anosov" then does not follow from the rest unless "smooth" at every point is what excludes the example, and nothing read settles whether it does. M1's own word for a geometry allows "a few isolated sharp points" (l.143).

**A second point, predicted with it.** The source's toral automorphisms have determinant ±1 (Newhouse p. 761, READ). The Fibonacci matrix (1 1; 1 0) has determinant −1 and eigenvalues φ and −1/φ, off the unit circle; it commutes with z ↦ −z; its entropy would be log φ, half that of M₀. M1 l.379 sets it aside as "not an element of SL₂(ℤ)". Prediction: among hyperbolic integer matrices of determinant ±1 it has the least spectral radius, so that the restriction to determinant +1 (l.277) carries weight in the selection of the drive.

**Failure test of the prediction:** no branched cover is carried to itself by any power of M₀; or τ has a number of fixed points other than four; or the lift is differentiable at the branch points; or a hyperbolic matrix of determinant −1 with spectral radius below φ exists.

## 4. Result (12 November 2026)

**The architect's script:** `checks/j2_cover_check.py` (S1–S6, all pass). **The blind reader:** given the torus, the four points, the matrix and six questions, with no mention of M1, of the lead or of an expected answer, and told to read no file of the repository; its own script is kept as `checks/j2_cover_blind.py` and was re-run here. It marks each statement computed, proved by hand or recalled. Standing: model output, as the architect's is. The two agree on every point.

| # | Finding | Architect | Blind reader |
|---|---|---|---|
| The covers | Four double covers branched at P₁…P₄. Exactly one is carried to itself by M₀ and by M₀²; all four by M₀³ | CHECKED (S2: monodromy by crossings of two cuts, tested on generating loops); the affine argument by hand | computed with three different systems of cuts, the same result; proved by the same affine argument. Adds: the one cover is that with monodromy 1 on both torus cycles, and it is the only one to which every element of GL₂(ℤ) lifts |
| H1 | Σ is closed, connected, orientable, of genus three | CHECKED (S3, the count); connectedness by hand | proved |
| H2 | τ has exactly four fixed points, isolated: the points over P₁…P₄ | by construction | proved (locally τ is w ↦ −w) |
| H3 | Every lift of M₀ or of a power commutes with τ | by hand (prediction) | proved in full: fτf⁻¹ covers the identity, is not the identity, and the covering group is {1, τ}; computed locally |
| D3 | The periodic points of φ are the points over the rational points: countable (and dense) | by hand; S4 | proved in full |
| D2 | The entropy of φ equals that of M₀, log φ² ≈ 0.962 | not checked: rests on the unread V-23 and on the rule for a map and the map it covers | RECALLED by the reader (three theorems named, none proved) |
| D1 | φ is a homeomorphism, smooth away from the four points, and **not differentiable at them** in the charts w, w² = z | CHECKED (S5, numerically); the reason by hand | proved exactly: f(1)² = 2 + i, (f(1) + f(i))² = −2 + 4i, f(1 + i)² = 2 + 2i, so f is not additive. Adds: four contracting and four expanding directions at each such point |
| D1, other smooth structures | Not settled | cannot prove; RECALLED that smooth models exist | "I cannot prove it either way"; RECALLED the same (Gerber–Katok 1982; Lewowicz–Lima de Sá), with the remark that the four points would then be non-hyperbolic periodic points |
| H4 | φ is not Anosov, and Σ carries no Anosov diffeomorphism | by Newhouse (1.3), READ: such a map is conjugate to a toral automorphism, and Σ is not a torus | the first proved; the second by a recalled theorem on line fields (a different route to the same end) |
| Second point | The least spectral radius among hyperbolic integer matrices of determinant ±1 is φ, at determinant −1 and trace ±1 (the Fibonacci matrix); among determinant +1 it is φ², at trace ±3 | CHECKED (S6) and proved by hand (`STEP_AUDIT.md` §11.11 (iii)) | proved the same way; computed in a larger box. Adds: the Fibonacci matrix lifts to the same one cover |

**Verdict on the lead.** The prediction of §3 is confirmed in each part. The object meets H1, H2, H3 and D3 (CHECKED or proved by both), and D2 at the standing of M1's own l.290 (not read at source). It fails H4. On D1 it is a homeomorphism that is smooth except at four points, where it is not differentiable in the natural charts.

**What follows, and what does not.**
- From the words of Definition 2.9 with "smooth" left out, together with "compact, connected, an involution with exactly four isolated fixed points, commuting with it" (l.501), neither "Anosov" nor the torus follows: this surface of genus three meets them all.
- Whether "smooth" at every point is what excludes it is **not settled by anything read or checked.** Both readers recall that such maps have smooth models; if that is so, "smooth" does not exclude it either, and "Anosov" cannot be derived from Definition 2.9 at all. RECALLED; it enters nothing.
- M1's own word for a geometry allows "a few isolated sharp points" (l.143), and M1's own drive acts on a fibre with four of them (l.583).
- The example is a surface. It says nothing about fibres of higher dimension, which Proposition 5.5 removes by the count of fixed points and by clause (c).

**Not tested.** The flow on T × F as Definition 2.9 has it (assumption 1). Smooth models. The entropy. Dathe's example of genus two.

**Failure test of the verdict.** A fixed point of τ other than the four; a cover-preserving check that fails on some loop of the four-times-punctured torus; or a proof that no smooth structure makes φ a diffeomorphism, which would leave "smooth" doing the work that "Anosov" is asked to do.
