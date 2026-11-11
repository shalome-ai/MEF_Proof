# M1 v3 (working draft) — step audit of the new material (CLAUDE.md §2b.1)

**10 November 2026.** Scope: what the draft `Paper_M1_Five_Axioms_v3.tex` adds to M1 v2.1: Axiom 5, Definition (shadow, formal), its three paragraphs of commentary, the one-fixed-point paragraph, the remark "one thing, three shadows", and the changed statement of Theorem 8.1. The PI directed this audit: "It seems the fifth axiom hasn't done anything … Do a step audit and blind check of the new section and you will find a gap/inconsistency."

Statuses as in `papers/M2/STEP_AUDIT.md`. Terms as in `registers/Definitions_Register.md`.

**Written before the blind check reported.** §§1–3 are my own audit. The blind check's verdicts go in §4.

---

## 1. Does the fifth axiom do any work in the draft?

**No. It is logically idle.** Every derivation in the draft is the derivation of v2.1, unchanged, and each still says so in its own words:

| Place in the draft | What it says | Uses A5? |
|---|---|---|
| Def 3.1 (modulus), l.217 | "a geometry satisfying A1--A4" | no |
| Def 3.2 (minimal), l.221 | "Among geometries satisfying A1--A4" | no |
| Thm 4.2 (the drive), Prop 4.4 | from A4 and criterion (2) | no |
| §5, the fibre, its algebra, the corners, the pillowcase | from A1–A4 and criterion (4) | no |
| Thm 6.1 (the dimension), l.396 | "a geometry satisfying A1--A4 has dimension …" | no |
| §7, the base, Spin^c, S³ | from A3, Def 2.6, criteria (1), (4) | no |
| Thm 8.1, proof, l.526 | "A1--A4 with criterion (4) give the fibre …" | one sentence added by me, which derives nothing |
| Prop 8.2 (moduli) | stationarity conditions | no |
| §9, l.587 | "now a theorem of four behavioural axioms" | no; I failed to change it, and the sentence is true of the draft as it stands |

If Axiom 5 and Definition (shadow, formal) were deleted, no statement and no proof of the draft would change except the sentences I added to announce them. **I put the axiom into the text and did not integrate it.** The PI's reading is correct, and the line in §9 that still says "four" is the symptom, not a typing slip.

## 2. The new definition, clause by clause

| # | Statement | Status | Finding |
|---|---|---|---|
| D1 | Clause (i), first half: observation is made from a point *o* of the fibre that the drive returns to itself | **DECLARED**, and as I now read it **in conflict with the PI's account** | The one such point is P₁ (CHECKED, `L1_one_fixed_point`). By M1 Prop 5.6 the algebra there is ℝ, and the reason M1 gives is "order has nothing to act on where nothing moves". By M2 the dilaton vanishes at P₁ (`M2_WP0` ll.227–231). The PI's chapter 8 puts the living observer where Φ is high ("the top floor … Φ approaches its maximum value along the ω-axis", ¶75) and says of Φ = 0: "consciousness cannot arise" (¶81). So the clause puts the observer at the one place where, on the PI's account, nothing is observed. My argument "an observer who persists must sit where the drive returns it" also sits badly with A4 as M1 words it: "a typical state of the universe does not return: the points that do return are exceptional" (M1 l.181) |
| D2 | Clause (i), second half: what is observed is the image under π: M → T × Σ, "the projection that forgets the internal piece" | **GAP — inconsistent with the axiom's own sentence and with the remark** | A map that forgets the internal piece sends things at P₂, P₃ and P₄ to the same image. It cannot give "very different shadows as the light moves round" (the motivation), nor "three shadows" (the remark). As defined, the shadow carries *no* information about position in the internal piece, where the axiom says it carries some and loses some. **The definition has no light:** nothing in it says how the shadow depends on what is hidden |
| D3 | Clause (ii): the growth law "lies on the piece of F that carries the involution … and on no other: no length measured on T × Σ, or on the base … depends on position in it" | **GAP — does not say what A2 requires, and leaves the warp undetermined** | M1 Def 2.2(i) requires "a smooth function w on **one** piece … entering the lengths measured on **another**". The clause says which piece is *not* affected; it does not say on which piece the function w lives or which lengths it enters. Read with Def 2.2(i), the pillowcase cannot be both. In M1 as written the only growth law of the form e^{κs} that is ever exhibited is the Sol metric of the drive, e^{2κs}dx_u² + e^{−2κs}dx_s² + ds² (M2 `M2_WP2` ll.31–44, "A2's law seen in A4's drive"): there the function lives on **T**, the time circle, and enters the lengths of the **torus**. Neither v2.1 nor the draft says whether that is the warp of A2. The PI's statement of 10 Nov, "zeta couples the pillowcase to S³ × S¹ … through the fibres" (record §10), points the same way: the piece the function lives on is spacetime, and the piece whose lengths it enters is the pillowcase. The draft's clause does not say this |
| D4 | Clause (iii): every thing observed is the image under π of a regular thing on M | **DECLARED** (P19); **used nowhere**; "regular" **USED UNDEFINED** | The clause the PI named as the axiom has no consequence drawn from it anywhere in the draft |
| D5 | "π is not one-to-one … a consequence of clause (i)" | follows | trivially; see D2 for why this is too much loss, not the right loss |
| D6 | "Clause (ii) … the warp is there and nowhere else. The reason is physical: gravity … reaches everywhere; the other forces are carried by the base and are local" | **DECLARED** (the PI's reason, record §10) | Stated in words; M1 has no forces in it, so nothing in M1 can use or test it. And it contradicts Prop 8.2 of the same draft, which ties the radii of S² and ℂP² "by the warp to the two periods" (l.560 of the draft) |
| D7 | Remark "one thing, three shadows": "seen from the place the drive leaves fixed, that one thing is met at three places in each cycle" | **GAP** | (a) By D2 the three have the same image under π, so they are not three shadows by the draft's own definition. (b) The drive moves a cycled corner one step per circuit of T, so the three places are met in three successive circuits, not at once; the remark says "in each cycle" and passes over this. (c) "Seen from P₁" is not a defined operation: π does not depend on *o* |
| D8 | Theorem 8.1 restated for "A1--A5" | **EMPTY** | Nothing in the proof uses A5 (§1) |

## 3. What the audit finds, in one paragraph

The fifth axiom was added beside the other four instead of being woven into them. Three things are missing, and they are the same thing seen from three sides. **(a) The shadow has no light.** The formal definition projects by forgetting, so a shadow cannot depend on where the thing is in the hidden piece; the axiom's own sentence needs it to. **(b) The warp is not connected to the shadow.** The PI's account says the warp is what makes the hidden piece show differently (record §§4, 5, 10) and that ζ couples the pillowcase to spacetime; the draft's clause (ii) only says where the warp is not. **(c) The observer is in the wrong place.** The draft stands the observer at the corner where, on the PI's account and by M1's own Prop 5.6, nothing moves and nothing is seen.

So the inconsistency the PI expected is real: Definition 2.2(i) (a function on one piece entering the lengths of another), the Sol metric of the drive (a function on T entering the lengths of the torus), clause (ii) of the new definition, and Prop 8.2 (the base radii tied by the warp to the periods) cannot all be read together as they stand; and the new definition's projection contradicts the axiom it formalises.

**Not done, deliberately:** I have not written a replacement definition. What the light is, and how the warp and ζ enter the shadow, is the PI's account to give; a definition built by me to make the pieces fit would be the kind of constructed device CLAUDE.md §0a warns against.

## 4. Independent blind check (measure 3) — done 10 November 2026

**How it was run.** A fresh sub-agent was given M1's formal definitions of A1–A4 and six of its results as background, and the new material as seven numbered items, with no file access and no word of what was wanted. It was asked what does not follow, what is inconsistent, and whether the new axiom does any work.

**Its verdicts beside mine.**

| Item | Blind verdict | Agrees with §§1–2? | Re-check |
|---|---|---|---|
| Does A5 do any work? | "A5 is logically idle in this paper. No statement or proof depends on it." | yes (§1) | by reading |
| Clause (i), the place *o* | "EMPTY … π does not depend on o, so 'from which observation is made' has no mathematical content" | yes (D2, D7c) | by reading |
| Clause (i), uniqueness of the place | **false for the fibre as M1 has it.** On the torus the drive returns one point to itself; on the *pillowcase*, which is the fibre of F, it returns three: P₁ and two regular points (those with M₀z = −z) | **new; I had this wrong** | **CHECKED** (`checks/fixed_points_check.py`, C1, C2): the five solutions of M₀z = −z are the multiples of (1/5, 2/5); with z ∼ −z they give two points besides P₁ |
| Clause (ii), the warp | "INCONSISTENT WITH THE BACKGROUND": A2(i) needs a function on one piece acting on another; in the drive's metric the function lives on T and scales the torus | yes (D3) | by reading |
| Three homes for the warp | the text offers T (the drive's metric), the base B (the notation B ×_w F), and the pillowcase (my clause): "the paper must pick one" | sharper than D3 | by reading |
| The exponential on a closed piece | **w = w₀e^{κs} with κ ≠ 0 "cannot be a single-valued function on any compact piece without boundary". It makes sense only through the M₀ gluing of the mapping torus** | **new** | **CHECKED** (C3; elementary: w(s+1) = e^{κ}w(s) ≠ w(s)) |
| A2(iii), the sign of κ | the fold z ↦ −z leaves κ unchanged; a sign flip needs s ↦ −s | new to this audit; **M2 already found it** (`M2_WP2` ll.99–110: the involution of A2 is the flow reversal τ, whose square is the fold) | by reading |
| Clause (iii) | "EMPTY. Used nowhere. 'Regular', 'singular' and 'thing' are undefined" | yes (D4) | by reading |
| The remark, three shadows | π forgets the fibre position, so "there is one shadow, not three"; the three corners are met over three circuits, in succession; "seen from P₁" has no map behind it | yes (D7) | by reading |
| Theorem 8.1 for A1–A5 | needs a lemma that the geometry satisfies A5; none is given | yes (D8) | by reading |
| The observer's place and A4 | not formally violated, but "N4 puts the observer on exactly the exceptional set"; at P₁ the algebra is ℝ and "how an observer with algebra ℝ registers the lines … is not defined" | yes (D1) | by reading |

**Its statement of the most serious gap:** "The definition contains no observation map that depends on the observer's place o or on position in the fibre. Its only map, π, forgets precisely the data that the sentence … and the remark … need."

**Two things the blind check adds that matter beyond the draft.**

1. **The growth law of the second axiom can only be the drive's.** A function growing as e^{κs} cannot close up on a closed piece. It can exist on the closed time circle only if going once round is compensated by a gluing whose stretch is e^{κ}; that gluing is the drive M₀, and κ is then log φ². So in M1 the warp of A2 and the stretching of the torus by the drive along time are not two structures: A1 and A2(ii) together leave room only for the second. M1 v2.1 never says this, and M2 treats them as two ("two forced rates", Decision Log Q10). On the PI's statement that ζ couples the pillowcase to spacetime (record §10), this is the place to look.
2. **My certificate theorem `L1_one_fixed_point` is true and proves less than I used it for.** It is a statement about the torus. The fibre is the pillowcase, where there are three such points.

**Standing of this check.** Model output, as mine is; its computations C1–C3 were re-run here and agree. The two audits were made independently and agree on every item; on three the blind check found more.

## 5. Position

The first working draft of M1 with five axioms does not integrate the fifth axiom, and its new definition is inconsistent with M1's second axiom and with the axiom's own sentence. The draft is kept as a record of the attempt and is not a candidate to replace M1 v2.1. What has to be supplied, in the PI's terms and not by construction: what a thing and its shadow are; the map by which the shadow depends on what is hidden (the light); which piece carries the growth law's function and which piece it acts on; and where the observer stands.

---

## 6. M1 v4 (working draft) — step audit of the fifth axiom as integrated (10 November 2026)

Scope (Decision Log P32): in M1 the fifth axiom is the statement that there is a seen part and an unseen part, and nothing more. The new material of `Paper_M1_Five_Axioms_v4.tex` is Axiom 5, Definition 2.1 (shadow, formal), Remark 2.2 (what the shadow loses), the paragraph after it, and one clause each in the proof and the deflationary reading of Theorem 8.1. §§1–5 above concern the v3 draft (now in `draft_v3/`) and are superseded for v4.

| # | Step | Status | Note |
|---|---|---|---|
| S1 | Axiom 5: "We can see the shadow, but the shadow is missing information about what it is a shadow of" | **DECLARED** (P19) | the PI's sentence, verbatim |
| S2 | Def 2.1: a geometry is M = (T × Σ) × F, T one-dimensional carrying time, Σ carrying space, F internal; what is seen is the image under π(t,x,f) = (t,x) | **DECLARED** (a reading; the first of the five numbered choices) | the family is canon v2's (ll.117–121), unchanged, T one-dimensional included; what is new is that an axiom states it. "Seen", "carrying time", "carrying space" are readings with no further formal content |
| S3 | Remark 2.2: π is onto, and one-to-one only if F is a single point | **CHECKED** (by hand, in the remark: (t,x,f) and (t,x,f′) have the same image) | blind check: follows |
| S4 | Remark 2.2: F is more than a point in every geometry satisfying the other four axioms | **verified in the paper**: Theorem 6.1 (dim F ≥ 8), [D], certificate `L3_dim_ge_twelve` | first written with a one-line argument from the order axiom ("a one-point piece admits only the identity operation"); the blind check found that this depends on how "operations" in Def 2.5 is read; replaced by the reference to Theorem 6.1. Red flag: the remark refers forward to Theorem 6.1; nothing between the remark and the theorem uses the remark |
| S5 | Remark 2.2: therefore a point of M is not determined by its shadow; a consequence, not part of the axiom | follows from S3, S4 | wording narrowed after the blind check from "the shadow does not determine what it is the shadow of" (which can be read as a claim that T × Σ does not determine F) to the statement about points, which is what is shown |
| S6 | "The axiom does not say that the whole can be recovered from the shadow" | follows from S2 | the further clause "and nothing below assumes that it can" was removed: the blind check noted it is a claim about every step of the paper and was not shown |
| S7 | The other four axioms are stated in the terms of the division: closure of each piece (Def 2.3), a tie between pieces (Def 2.4), operations on F (Def 2.5), a flow on T × F (Def 2.9) | **READ** (v2 ll.130, 142, 154, 184) | blind check: follows; it adds that they need only the division, not the projection or the word "seen", and that making the division by an axiom is a choice of exposition. The paper now says "in this paper it is the fifth axiom that makes the division" |
| S8 | Theorem 8.1, proof: "A5 gives the family (T × Σ) × F in which the other four axioms are stated; it selects nothing within the family" | follows from S2 | blind check: follows, noting that dim T = 1 is part of the family's definition (as in v2), not a selection made by the theorem |

**Does the axiom do work?** In the sense of P32, yes: delete Axiom 5 and Definition 2.1 and Definitions 2.3–2.9 have no T, Σ and F to refer to. It does no other work: it restricts no member of the family, and every selection is made by A1–A4 and minimality. The paper says so in the deflationary reading. That is the role ruled in P32 ("nothing more").

**Blind check (measure 3).** A fresh sub-agent was given the formal definitions of A1–A4 as background and the new material as eight numbered items, with no file access and no word of what was wanted. Its findings that led to changes are in S4, S5, S6, S7. Its findings not acted on, recorded for the PI:
- The sentence says "missing information"; the formal definition alone does not deliver it (it is satisfied with F a point). It is delivered by the remark. This is as ruled in P19 (the loss of information is a remark with its proof, not part of the axiom).
- "See" has no formal counterpart in M1: there is no observer and no definition of an observable.
- The shadow is defined as a set of points. Whether it carries a well-defined geometry of its own when lengths on one piece depend on position in another is not addressed in M1.

**Failure test.** The integration fails if some definition or proof of M1 uses the division (T × Σ) × F in a way Definition 2.1 does not supply, or if a geometry satisfying A1–A4 exists with F a single point (then Remark 2.2 is false for it; Theorem 6.1 excludes this).

**Red-flag scan** (`tools/redflags.py` on the draft, ll.50–150): in the new text, two forward references in Remark 2.2 (see S4). No other hit in the new material.

---

## 7. M1 v4.1 (working draft) — step audit of the second pass (10 November 2026)

Scope: the agreed items 22–25 and 28 of `REWRITE_ASSUMPTIONS.md` (Decision Log P28, P29). New material: the word *step* (§4.1); criterion (2) applied to the step; Corollary 7.4 restated; Corollary 7.5 (the time circle) and the two paragraphs after it; the open point on the sign of the lift (§5.5); Section 8.3 "What this paper does not fix" with Definition 8.2 (declared assumption); the statement of Theorem 8.1; Appendices A and B.

| # | Step | Status | Note |
|---|---|---|---|
| P1 | One application of the return map is a *step*; the number of steps in the time circle is not assumed in §4 | **DECLARED** (a term) | Definitions Register, proposed |
| P2 | Criterion (2) is applied to the step | **DECLARED**; Minimality M1-7 (proposed) | not a minimal option: see P8 |
| P3 | Cor 7.4, first sentence: the corner signs have product −1; one corner is odd | **verified reference owed**: Atiyah–Bott, cited in v2 and **not read** (`CORNER_SIGNS.md` §5); the count of eight functions and the product **CHECKED** (`L4_four_corner_product`; `checks/corner_sign_check.py`) | carried over from v2 unchanged in content; the reference is to be entered in `Verified_References.md` before M1 is frozen |
| P4 | The refinement class has four members, one per odd corner; the index does not choose | **CHECKED** (`checks/corner_sign_check.py`; blind check C1–C3 of `CORNER_SIGNS.md`) | |
| P5 | Cor 7.4, second sentence: the odd corner is a cycled corner | **DECLARED** (P28); Minimality M1-8 (proposed), **flagged: not the minimal option** | the paper says so in the paragraph after the corollary |
| P6 | Among the three cycled corners the choice is the choice of the first step; (−1)^{mn} is the pattern the quarter-turn S leaves in place | **CHECKED** (`checks/growth_law_check.py` C10: S fixes P₁, P₄ and exchanges P₂, P₃; `CORNER_SIGNS.md` §6) | uses only M1's own S (Thm 4.2), not M2's exchange |
| P7 | Cor 7.5: the pattern returns after three steps and not before; the time circle is a multiple of three steps; the least is three; M₀³ = ((13,8),(8,5)), trace 18, identity modulo two | **CHECKED** (`L1_M0_mod2_order3`, `L1_Fib_powers`; `checks/three_circuits_check.py`); "the lifted fold is one structure on the whole geometry" **DECLARED** (P28); "the least" Minimality M1-9 (proposed) | blind check C5, Q1 of `CORNER_SIGNS.md` |
| P8 | Applied to the map once round time with the corners returned, criterion (2) would select trace six, which cycles no corner; excluded by the reading of Cor 7.4, not by minimality | **CHECKED** (by hand: a map that is the identity modulo two has a, d odd and bc divisible by four, so ad ≡ 1 and a + d ≡ 2 modulo four; the least hyperbolic such trace is six, e.g. ((5,2),(2,1)); `checks/three_circuits_check.py` (3)); even trace gives order one or two: M1 Prop 4.4 | |
| P9 | Per step: stretch φ², entropy 2 log φ; per time circle: φ⁶, 6 log φ | **CHECKED** (`checks/three_circuits_check.py` (1)) | |
| P10 | The automorphism Ad_w is the same for w and −w; (−w)³ = +1; which element the drive is is left open, nothing in M1 depending on it | **CHECKED** (`checks/lift_sign_check.py`; `LIFT_SIGN.md` §1: M1 "nowhere uses the value of w³") | open point stated, as agreed (item 25) |
| P11 | Def 8.2: the stationarity conditions fix the aspect ratio | **DECLARED assumption** with its failure test in the text; Minimality M1-10 (proposed) | replaces Proposition 8.2, which leaves M1 (P29). The value 1.8466, the cubic and the quanta (3, 6) are no longer stated in M1 |
| P12 | "No other statement of the paper depends on it" | **READ**: every remaining occurrence of the aspect ratio in the draft is at l.364 of v2 (the definition of the ratio) and in §8.3; the quadric row of the elimination table no longer cites it | checked by search for `tautwo`, `prop:moduli`, `aspect` in the built file |
| P13 | Theorem 8.1 as restated: step M₀; time circle of three steps under the reading of Cor 7.4; scale a declared input; aspect ratio under Def 8.2 | follows from P1–P12 | the phrase "no continuous modulus" is gone from the theorem |

**Blind check.** The steps of P3–P7 were given to a blind checker on 10 November (`CORNER_SIGNS.md`); the wording now in the paper has not been checked again. P11–P13 have not been blind-checked.

**Failure tests.** As in Minimality M1-7 to M1-10. In one line each: a trace-six return map carrying everything else M1 derives; a use, from M2 onward, of nothing that depends on which corner is odd; a result needing six or nine steps; stationarity conditions that leave the aspect ratio free.

**Red-flag scan** (`tools/redflags.py` on the draft): no new hit in the second-pass material beyond one forward reference (§4.1 points to Corollary 7.5 for the number of steps; nothing in §§4–6 uses that number).

### 7a. Blind check of the second pass (10 November 2026), and what it changed

A fresh sub-agent was given the second-pass steps as fourteen numbered items with the background results, no file access and no word of what was wanted.

| Step | Blind verdict | Action |
|---|---|---|
| P3, P4 (the four patterns; one odd corner; the index does not choose) | follows; adds that the pattern with odd corner P₁ is the one invariant under every symmetry, and the three cycled ones are a single orbit | none |
| P5 (the odd corner is a cycled corner) | declared; "the sole source of the factor three" | none; the paper already says it is a declared reading |
| P6 ((−1)^{mn} is the pattern S leaves in place) | follows for the S as written, but S is one of three quarter-turns conjugating M₀ to its inverse; the other two fix P₂ and P₃ | **wording changed**: the paper now says so, and that this is the same statement as "nothing to choose among the three" |
| P7 (multiple of three; three taken) | "multiple of three" follows; "three" is a choice; **three is not shown to suffice** if the overall sign of the lift counts: with the drive lifted as w, three steps return the pattern with the overall sign reversed (w³ = −1), six would be needed | **wording changed**: Cor 7.5 says divisibility by three is what is forced, that three is taken, and states the condition; §5.5 no longer says nothing depends on the sign of the lift |
| P8 (criterion (2) on the return map would select trace six, excluded by the reading of Cor 7.4) | **does not follow.** Trace six is indeed the least hyperbolic trace among maps that are the identity modulo two (verified), but (i) a return map need only preserve the pattern, and ((2,3),(1,2)), of trace four, does; (ii) a map that is the identity modulo two preserves every pattern, so the reading does not exclude it | **paragraph withdrawn and replaced** by: the map once round is a power of the step and is not chosen separately; applying criterion (2) to the step is a declared choice. Minimality M1-7 amended. **The architect was wrong here**; the same claim in `CONSEQUENCES_OF_B.md` C1 is wrong in the same way |
| P9, P10 (numbers per step; w and −w) | follows | none |
| P11 (declared assumption on the aspect ratio) | declared; the assumption named one parameter while its use ("no modulus besides scale") needs all dimensionless data fixed | **wording changed**: the assumption now says every dimensionless continuous datum |

### 7b. Atiyah–Bott read (10 November 2026): step P3 is not supported by its citation

**Read:** Atiyah and Bott, *Ann. of Math.* 88 (1968), pp. 486–487 by the architect; all of §8 (pp. 479–488) and §9 by a sub-agent with verbatim quotations (`registers/Verified_References.md` V-7).

**What M1 says (v2 l.437, carried into v4.1):** the corner signs have "product −1, the Atiyah–Bott fixed-point index (−1)^d for odd determinant class"; "the Atiyah–Bott input selects the refinement class for odd d".

**What the paper says.** It treats Spin structures, not Spin^c. The sign ε(P, f̂) at a fixed point is defined only up to the choice of lift; the product of the signs at two fixed points depends on f alone; whether two fixed points of an involution have the same sign is decided by the Spin structure, through its class on a loop (Props 8.44, 8.45). There is no formula for the product over all fixed points, no "(−1)^d", no determinant class, and no torus or surface example.

**Status of P3: GAP.** The combinatorial half stands (CHECKED: of the eight corner functions, four have product +1 and four have product −1). What is not supported is the step that puts the lift in the product −1 class "for odd determinant class". Under CLAUDE.md §2 the first hypothesis is that the statement is true and the citation is wrong or incomplete: Proposition 8.45 does make the relative signs depend on the Spin structure, which is the kind of dependence the corollary needs. But the derivation from Proposition 8.45 to "product −1 when c₁(L) is odd" is not in the reference and is not in M1. It has to be supplied, by a different reference or by a proof in the paper, before Corollary 7.4 keeps its [R].

**Not done:** I have not attempted the derivation, and I have not changed the corollary's first sentence or its tag in the draft. For the PI.

### 7c. The derivation attempted for step P3 (10 November 2026): it does not give Corollary 7.4

`CORNER_LIFT_DERIVATION.md`, with `checks/corner_lift_check.py` (K1–K8 pass) and a blind check. For a spin structure on the torus, or any Spin^c structure whose determinant line is trivial along the torus (M1's canonical structure among them), the corner signs of the lifted fold have product +1 and no corner is odd. The product is (−1)ⁿ with n half the degree of the determinant line on the torus; the parity of c₁(L) on ℂP² does not enter. **P3 remains a GAP, and on this computation the first sentence of Cor 7.4 does not hold for the structure M1 constructs.** P5 and P7 (P28, the time circle) start from the one-odd-corner pattern. Nothing in the draft has been changed; for the PI.

### 7d. Proposition 8.2 restored (PI, 10 November 2026)

Row P11 above is superseded. Proposition 8.2 stands as in v2, with one change in its proof: the stationarity conditions are named as a declared assumption with its failure test, in place of "their derivation belongs to the sequel". Theorem 8.1 keeps "no continuous modulus" and names the assumption among its hypotheses. Not re-examined in this pass, and left as in v2: "R_w, R_c … tied by the warp to the two periods" and "one unit per corner-cycled sector".

---

## 8. M1 v4.3 (working draft) — the fifth axiom's two clauses and the twist of the fibre (10 November 2026; Decision Log P33, P34)

This supersedes §6's conclusion that the axiom "restricts no member of the family", and rows P3–P5 of §7 together with §§7b–7c: Corollary 7.4 no longer rests on Atiyah–Bott or on a separate reading. Numbers below are those of the built v4.3 (Section 7: Def 7.4, Lemma 7.5, Prop 7.6, Cor 7.7 the corner lift, Cor 7.8 the time circle).

| # | Step | Status | Note |
|---|---|---|---|
| A1 | Def 2.1(ii): the structure carried by the internal piece is not carried to itself by one step of the drive | **DECLARED** (the axiom's first further clause; P34) | forward reference: "step" is defined in §4, the structure in §7 |
| A2 | Def 2.1(iii): the internal piece has at least two independent states at rest with the same shadow | **DECLARED** (P34) | forward reference to Def 7.4 |
| A3 | The reading: an object is a state of the internal piece at rest; its shadow is what is left when the internal piece is forgotten | **DECLARED**: the second of the paper's six numbered choices; confirmed by the PI (P34 (1)) | the identification step; no computation checks it. The paper's deflationary reading says what is lost without it |
| A4 | The determinant line of a Spin^c structure on ℂP² × S² × T² has three independent integers, odd, even, even; the canonical one has zero on the torus | **CHECKED** by hand (Künneth; H¹(ℂP² × S²) = 0; w₂ = h mod 2) | cites Hatcher for Künneth, as v2 does |
| A5 | Def 7.4: twist, flux, state, state on the pillowcase, corner sign | **DECLARED** | states are defined as holomorphic sections; that they are the harmonic spinors is given as motivation and is not a step |
| A6 | On the untwisted spinors the fold acts alike at every corner | **CHECKED** by hand (ι*dz̄ = −dz̄); `corner_lift_check.py` K4 | |
| A7 | Lemma 7.5(a): d independent states | **verified reference** V-8 (statement RECALLED; **CHECKED** numerically for every case used, Z2) | page of the reference owed |
| A8 | Lemma 7.5(b): 1 + Σ⌊aᵢ/2⌋ states kept by the first lift | proof in the paper (even functions live on the quotient sphere; partial fractions), resting on V-9; **CHECKED** for all 70 divisors up to degree four (Z3, Z4); blind check derived the same formula | |
| A9 | Lemma 7.5(c): which corner patterns the drive leaves in place | **CHECKED** (Z5; K8); from M1 Prop 4.4 | blind check agrees |
| A10 | Lemma 7.5(d): a half-turn twist has no state; the three are cycled | proof in the paper (a section of a degree-zero line has no zeros); **CHECKED** Z1, K8 | |
| A11 | Prop 7.6: least flux meeting both clauses on the pillowcase is three; one odd, cycled corner; two states kept, one removed | proof by cases in the paper (flux 0, 1, 2, 3); **CHECKED** Z6, Z7; **blind derivation**: "R1 and R2 together: least degree 3" | "least flux": Minimality M1-11 (proposed). Depends on A3, on counting on the pillowcase (P34 (2)), and on the freedom of the lift: see `SHADOW_TWO_CLAUSES.md` §4 |
| A12 | The smallest case: D = 3P₄, states 1, 1/(℘ − e₄), ℘′/(℘ − e₄)² | **CHECKED** by orders at the four corners; the blind checker gave the same basis | V-9 |
| A13 | Cor 7.7 (the corner lift): product of the corner signs (−1)^d = −1; the odd corner cycled; (−1)^{mn} with it named P₄ | follows from A6, A11 | replaces "the Atiyah–Bott fixed-point index (−1)^d for odd determinant class", which the reference does not contain (V-7) |
| A14 | Cor 7.8 (the time circle): three steps | as §7 P7, now from A13 | the open sign of the lift (w or −w) still bears on three against six |
| A15 | Theorem 8.1: "flux three on the fibre with one odd corner"; the fifth axiom enters twice | follows | |

**Not shown, and said in the paper:** that the flux three and the three of c₁(ℂP²) are one fact and not two.

**Disclosure.** The target (three, one odd corner) was known before the computation. The count on the covering torus was looked at first and gives two; the count on the pillowcase gives three; the PI has ruled the pillowcase (P34 (2)). The blind checker was given the problem with no target and no context.

**Blind check of the new text of the paper:** not done; the mathematics was derived blind (`SHADOW_TWO_CLAUSES.md` §5), the wording of §7.4 has not been read by a fresh checker.

**Red flags:** two forward references in Definition 2.1 (clauses (ii), (iii) use "step" and "state at rest", defined in §4 and §7). Nothing between uses the clauses.

**Failure tests:** as Minimality M1-11 and `SHADOW_TWO_CLAUSES.md` §7.

**Owed:** pages for V-8 and V-9; a Lean certificate for the finite part of Prop 7.6 (the counts 1 + Σ⌊aᵢ/2⌋ for degree ≤ 3 and the periods of the patterns), which the paper at present proves by hand.

### 8a. Blind read of the wording of §7.4 (10 November 2026), and what it changed

A fresh sub-agent read only the section and the background statements it uses, with no word of what was wanted, and recomputed every case.

**Confirmed by its own computation:** the Künneth statement; every count in the proof of Proposition 7.6 (flux one, two, three, both lifts); the corner signs; which patterns the drive leaves in place; the smallest case D = 3P₄ by orders at the four corners; M₀³; the numbers per step. "No arithmetic or counting error was found."

**Corrected in the paper after it:**

| Its finding | Change |
|---|---|
| The flux and the determinant-line integer on the torus were not related; read one way, flux three contradicted "even on the torus" | the opening paragraph says the integer on the torus is 2d |
| "The structure carried by the internal piece" was undefined for a twist; read as the divisor, flux two would meet both clauses | Definition 7.4 defines the structure of a twist (flux with corner signs up to overall sign; holonomy at flux zero) and says the drive, not being holomorphic, acts on structures through the corners |
| "States on the pillowcase" did not say which lift; with both lifts required the least flux would be four | Definition 7.4 names the two lifts; Proposition 7.6 says "for one of the two lifts", as disclosed in `SHADOW_TWO_CLAUSES.md` §4 |
| Flux two: "D = 2Pᵢ, which the drive leaves in place" named the wrong object | "whose structure, with the four corner signs alike, the drive leaves in place" |
| Lemma 7.5(b), second lift, asserted not proved; (d) omitted that a half-turn twist is not trivial | both completed |
| "No step below depends on it" (harmonic spinors) was contradicted by Corollary 7.7 | the paragraph says what is motivation and names the one fact Corollary 7.7 uses |
| Corollary 7.7 gave definite signs without "up to overall sign" | added |
| The time-circle argument rested on unstated premises (time a circle; a whole number of steps; the fibre glued by a power of the drive; the lifted fold one structure on the whole), and the overall-sign condition was only in the proof | the premises are in the proof with their sources (Definition 2.3, Theorem 4.2, the hypothesis of the statement); the condition is in the statement; the paragraph after Definition 2.1 says the internal piece may be carried round time by a map of itself |

**Not changed:** "forced by the fifth axiom" stays as the paper's summary; the Proposition's statement now carries its hypotheses in full (the two clauses, one lift, the least flux).

---

## 9. The theorems M1 inherits from v2: step audit and references (10 November 2026; Decision Log P36 item 9)

**How this was done.** Every proof of Sections 4 to 8 was read in the text (v2 ll.205–556, READ this session). Each external citation was checked against the source's own text by a sub-agent with instructions not to rely on memory; I then read the Taussky, Witten and Whittaker–Watson passages myself. Results by reference are in `registers/Verified_References.md` V-10 to V-23. Independent computations: `checks/inherited_checks.py` (I1–I12, all pass). Numbering is that of the built draft.

**Statuses:** verified reference (V-n, READ) · CHECKED (script or Lean) · DECLARED · GAP · NOT READ (the source could not be obtained; the statement is standard and RECALLED).

### 9.1 What the reference check found, and what was changed (the old text was wrong in each case)

| # | Where | v2 said | The source says | Change made |
|---|---|---|---|---|
| R1 | Thm 4.2, first route | Latimer–MacDuffee and Taussky give "SL₂(ℤ)-conjugacy classes … in bijection with the narrow ideal classes" | conjugation by integer matrices of **determinant ±1**, and **ordinary** ideal classes (V-11, READ) | the route is stated as it is; one sentence takes it from determinant ±1 to determinant one by an explicit conjugation. **A direct descent is added as the first route, complete in itself** (CHECKED I11, I12) |
| R2 | Thm 4.2, second route | Sarnak: M ↦ cx² + (d−a)xy − by² "carries conjugacy classes of trace t bijectively to … forms of discriminant t² − 4" | not read; a secondary source gives Sarnak's Prop. 1.4 as a bijection between **primitive** forms and **primitive hyperbolic** classes in PSL₂(ℤ), with t² − du² = 4 (V-12, SECONDARY) | now the third route, stated as "the classical correspondence"; its finite part is certified (`L1_reduced_disc5`, `L1_cycle_disc5`). It is corroboration, not the proof |
| R3 | Thm 6.1; Def 2.7 | Salamon: "an almost-quaternionic structure exists only in real dimension 4n"; the I, J, K definition | the I, J, K basis is given for quaternionic Kähler manifolds; "almost quaternionic" is defined by its structure group; dimension 4n is built into the definitions, not a theorem (V-13, READ) | the dimension statement is now the elementary one (each tangent space is a module over the quaternions); Salamon is cited for the local form of the coefficient bundle |
| R4 | Prop 5.5 | "An involution of Tⁿ with only isolated fixed points is conjugate to an affine map …" (uncited); "On a three-torus the count is eight, excluding dim X = 3" citing Franks 1969 and Newhouse | Franks 1969 Thm 1 is about Anosov diffeomorphisms of tori under two hypotheses; neither paper is about involutions (V-14, READ / SECONDARY) | replaced by the argument in dimension two, which is all the proposition uses: an involution of a surface with isolated fixed points preserves orientation; the count of Euler characteristics gives a sphere with four cone points; the orbifold (2,2,2,2) is unique (Thurston, V-16, READ). CHECKED I6 |
| R5 | Thm 5.7 | orbifold Gauss–Bonnet cited to Satake and Kawasaki | Satake's Theorem 2 is the Gauss–Bonnet theorem for V-manifolds (V-17, READ); Kawasaki's paper is "The signature theorem for V-manifolds" (not obtained) | cited to Satake alone |
| R6 | §8.5 | "Witten's theorem … the lowest-dimensional compact manifold admitting SU(3) × SU(2) × U(1) … is ℂP² × S² × S¹" | "seven dimensions is in fact the minimum dimensionality … although ℂP² × S² × S¹ is not the only seven-dimensional manifold with this symmetry" (V-18, READ by the architect) | the sentence and the abstract now say what Witten says |
| R7 | §2.2 | Lyusternik–Fet: "there is always a shortest closed path" | existence of a closed geodesic, by a minimax argument, not a shortest path (V-19, SECONDARY) | "a closed geodesic" |
| R8 | §2.4 | Robertson: "the uncertainties … are bounded below by half the size of their commutator" | "the product of the uncertainties … is not less than half the absolute value of the mean of their commutator" (V-20, READ) | reworded to that |

### 9.2 Step tables

**Proposition 4.1 (A4 is hyperbolicity).** [R]

| Step | Status |
|---|---|
| characteristic polynomial λ² − tλ + 1 | CHECKED by hand |
| \|t\| < 2: finite order, entropy zero | CHECKED on a sample (I3) |
| \|t\| = 2: a shear, entropy zero | by hand |
| \|t\| > 2: Anosov, entropy log\|λ\|, periodic points the rational points, no fixed points of the flow on the mapping torus | **NOT READ**: Katok–Hasselblatt (V-23); standard |
| the drive "acts on T² by its return map, an element of SL₂(ℤ)" | **DECLARED** in the text (the fibre is a torus by Prop 5.5; linear up to topological conjugacy by Franks, V-10 SECONDARY) |

**Theorem 4.2 (the drive).** [R]

| Step | Status |
|---|---|
| first route, the descent: 4bc = 5 − (2a−3)², b and c odd; shift a until \|2a−3\| ≤ \|c\|; then \|b\| < \|c\| for \|c\| ≥ 3; a quarter-turn; termination at \|c\| = 1; M₀ or M₀⁻¹ | **CHECKED**: by hand in the paper; I11 (80 small and 400 large matrices), I12 |
| S M₀ S⁻¹ = M₀⁻¹ | CHECKED `L1_conj_M0_inv`, I2 |
| second route: classes under determinant ±1 ↔ ideal classes of ℤ[λ] | verified reference V-11 (READ: Taussky by the architect; Latimer–MacDuffee by the sub-agent) |
| ℤ[φ] is the ring of integers of ℚ(√5) and has class number one | **RECALLED**, standard; not checked against a reference. The first route does not use it |
| from determinant ±1 to determinant one | CHECKED by hand (conjugation by diag(1, −1), then the descent) |
| third route: reduced forms of discriminant five, one cycle | CHECKED `L1_reduced_disc5`, `L1_cycle_disc5`; the correspondence itself V-12 (SECONDARY) |
| eigenvalues φ^{±2}, entropy 2 log φ | CHECKED I4 |

**Theorem 4.3, Proposition 4.4.** [R] All steps CHECKED: `L1_M0_is_Fib_squared`, `L1_Fib_recursion`, `L1_Fib_powers`, `L1_Fib_not_SL2`, `L1_odd_trace_iff_order_three`, `L1_M0_mod2_order3`; the half-lattice evaluations by hand.

**Lemma 5.1, Proposition 5.2 (𝒜 = ℍ).** [D]

| Step | Status |
|---|---|
| N(a) = aa* is fixed by *; circle or hyperbola according as u² = ∓1 | CHECKED by hand |
| "A1 requires every factor, the corner fibres included, to be compact", hence the norm form is positive-definite | **DECLARED** (the reading that carries the [D]; stated in the text before the proposition) |
| a finite-dimensional associative real division algebra is ℝ, ℂ or ℍ | verified reference V-15 (Frobenius, READ) |
| Hamilton's relations, non-commutativity, positive-definiteness | CHECKED `L2_hamilton`, `L2_noncomm`, `L2_norm_posdef` |

**Propositions 5.3, 5.4.** [R] CHECKED: `L2_corner_count`, `L2_fix_conj`, `L2_fix_Ad_i/j/k`, `L2_fix_conj_Ad_i`, `L2_iperp_not_closed`.

**Proposition 5.5 (the fibre is a torus).** [D]

| Step | Status |
|---|---|
| an Anosov diffeomorphism of a compact surface lives on T² and is conjugate to a hyperbolic linear automorphism | **SECONDARY ONLY** (V-10): Franks 1970 not obtained; a survey attributes the classification on surfaces to it. Standard |
| the involution preserves orientation; the quotient is a sphere with four cone points; unique; ι is inversion | CHECKED I6; Thurston V-16 (READ); V-4 |
| least dimension by criterion (4) | DECLARED (Minimality) |

**Proposition 5.6 (the corner algebras).** [D] The reading (the local form of ι at the corners) is **DECLARED** in the text as "a definition rather than a computation". `L2_Ad_w_cycles`, `L2_w_cubed` CHECKED.

**Theorem 5.7 (the pillowcase).** [R]

| Step | Status |
|---|---|
| orbifold Euler characteristic 2 − 4·½ = 0; Euclidean; (2,2,2,2) unique among the seventeen | Thurston V-16 (READ: formula 13.3.4, Theorem 13.3.6); `L2_chi_orb_zero`; I5 |
| χ(X/σ) = ½(χ(X) + χ(Fix σ)) | **PARTIAL** (V-21: Bredon, a snippet only); the second route does not use it |
| orbifold Gauss–Bonnet | Satake V-17 (READ) |

**Theorem 6.1 (the dimension), Remark 6.2.** [D]

| Step | Status |
|---|---|
| 4 ∣ D | CHECKED by hand (elementary, R3 above) |
| "The time–space block T × Σ carries the quaternionic structure with the drive along T; its natural model is ℍ^× = ℝ_{>0} × S³, of dimension four, and this is the block's dimension" | **DECLARED, and not numbered among the paper's choices.** It is an identification: nothing before it forces the block to be four-dimensional. See 9.3 |
| on a four-manifold the three structures span Λ²₊ and carry no information; so dim F ≥ 8 | standard (Sp(1)Sp(1) = SO(4)); RECALLED, elementary |
| the arithmetic: D ≥ 12; four to eleven fail; the split (3, 6) | CHECKED `L3_*`; I7, I8 |

**Propositions 7.1, 7.2, 7.3.** [D]

| Step | Status |
|---|---|
| the units form a two-sphere; Sp(1)/U(1) | by hand; `L4_unit_sphere_axes` |
| Def 2.8 (orbits are realised) | DECLARED (a numbered choice) |
| ℂP²: complexification and "directions rather than vectors" | **DECLARED**; the text names both readings and calls the proposition "the least direct" |
| c(Tℂℙ²) = (1+h)³ | CHECKED I9, `L4_chern_CP2`; Griffiths–Harris not read (standard) |
| spinors iff w₂ = 0 or w₂ lifts; canonical Spin^c structure with determinant K⁻¹ | **NOT READ**: Lawson–Michelsohn (V-22) |
| criterion (1) removes the twisting line | DECLARED (Minimality M1-3) |

**Proposition 7.9 (Σ = S³).** [D] "modelled on ℍ^×" is the same identification as in Theorem 6.1 (**DECLARED**, unnumbered); "every such quotient is rigid" is **uncited** (standard for spherical space forms; RECALLED); least \|π₁\| DECLARED (Minimality M1-4).

**Theorem 7.10 (the base).** χ multiplicative by Künneth (Hatcher; standard, not read); `L3_chi_K8`; I5.

**Proposition 8.2 (the moduli).** [D] As recorded in §7d: the stationarity conditions are a declared assumption; the algebra is CHECKED (`L5_ratio`, `L5_cubic`, I10); the choice of quanta is Minimality M1-5. Two phrases remain as in v2 and unexamined: the radii "tied by the warp to the two periods" (which now sits beside P37, under which M1 says nothing on what the warp scales), and "one unit per corner-cycled sector".

**§8.5 (cross-check).** Not a premise. Witten V-18 (READ), corrected as R6.

### 9.3 Left for the PI

1. **The four-dimensional time–space block** (Theorem 6.1, Proposition 7.9). The proof says the block's "natural model is ℍ^× … and this is the block's dimension". This is an identification on which the dimension twelve and S³ rest, and it is not one of the paper's numbered choices. I have not changed it. It should either be numbered as a choice, with its failure test, or derived.
2. **Proposition 8.2's two phrases** (above). The first is in tension with P37.
3. **References not obtained**, all for standard statements: Franks 1970, Katok–Hasselblatt, Lawson–Michelsohn, Bredon (in part), Kawasaki, Sarnak, Lyusternik–Fet (the last two read only in secondary sources). They need a library copy before their pages can be entered.
4. The Lean file headers of L1 and L4 still name Latimer–MacDuffee, Atiyah–Bott and others as the inputs; the files are reproduced verbatim and were not edited.

### 9.4 The three points of §9.3 settled (10 November 2026; Decision Log P38)

1. **The four-dimensional block.** Theorem 6.1 now says: the block carries the quaternionic structure, so its dimension is a positive multiple of four, and criterion (4) takes the least total dimension. Proposition 7.9 now says: Σ is a compact connected three-manifold without boundary (Definition 2.3); the least fundamental group is the trivial one; a closed, simply connected three-manifold is the three-sphere (V-24, READ). Steps: the multiple of four, by hand; the least, **DECLARED** (Minimality M1-2, M1-4, already banked); the Poincaré theorem, **verified reference V-24**. No "natural model" remains as a premise; ℍ^× is named as what results.
2. **Proposition 8.2** is out of M1 (P38), with its worked cases and its certificate. The rows on it in §9.2 and §7d no longer apply. Theorem 8.1 names the scale and the aspect ratio as held by a declared sector: **DECLARED**, with its failure test in the deflationary reading (Minimality M1-10).
3. **References not obtained** remain owed as housekeeping (V-10, V-12, V-19, V-21, V-22, V-23): not a matter for the PI.

**Failure test for point 1:** Σ is not S³ if the series later needs a spatial piece with a non-trivial fundamental group; the block is not four-dimensional if a later paper needs a larger seen part.

## 10. M1 v6.0 (canon since 11 November 2026, P54) — the sixth axiom (11 November 2026; Decision Log P42–P47)

Source of the edits: `papers/M1/SIXTH_AXIOM_MINIMALITY.md` (its own step audit is its §7; blind check its §6). Built by `tools/m1_build_v6.py` (51 edits). No proof of v5.0 is changed; no theorem of v5.0 is renumbered; Proposition 4.5 is new.

### 10.1 Definition 3.2 (oneness, formal; minimal)

| Step | Statement | Status |
|---|---|---|
| O1 | "Everything" is everything that can be observed or spoken of | DECLARED (PI, P47(1)) |
| O2 | Clause (a), nothing is left to be chosen | DECLARED reading (PI, P45, P46); numbered as the seventh choice. Not a consequence of the words of the axiom (note §6.1) |
| O3 | Clause (b), nothing is present that is not needed | DECLARED reading (PI, P45, P46); the eighth choice |
| O4 | Clause (c), what is needed is least | DECLARED reading (PI, P46(1)); the ninth choice. The note found no ground for it in the words of the axiom (note §6) |
| O5 | Clause (a) is written for two data only (a modulus; the class of the drive at its trace) | the architect's wording, **confirmed by the PI (P49)**: a general clause "no choice among inequivalent options" would exclude every option wherever more than one is admitted, including the one taken (note §6.1, blind check) |
| O6 | Clause (c) names four quantities and is applied after clause (b) | the architect's wording, **confirmed by the PI (P49)**: without the order, "least" would give 𝒪(1) and not 𝒪(3) (note §6.3) |
| O7 | Overall size has no meaning; only proportions | follows from the axiom by the note's test (note §3 row 2, §6); PI, P45(3), P46(2). The blind check's proviso: nothing in the shape ties a length to an integer |
| O8 | Which former criterion each use now cites: (1) on moduli → (a); (1) on the twisting line, Spin^c, and the least π₁ → (b); (2) → (a) and (c); (4) on dimension → (c); least flux, least steps → (c); (3) dropped as an output | note §6, last table. Least π₁ under (b) and not (c): the note's verdict (N-object) |

### 10.2 Proposition 4.5 (one drive at trace three only)

| Step | Statement | Status |
|---|---|---|
| Q1 | PA_t = A_t⁻¹P forces r = tp + q, s = −p, det P = −(p² + tpq + q²) | CHECKED by hand (note §6); blind checker's derivation, independent |
| Q2 | A solution of p² + tpq + q² = −1 has pq < 0 and can be put as x² − txy + y² = −1, x ≥ y ≥ 1 | CHECKED by hand |
| Q3 | Descent: x > y gives a smaller solution (y, x′), x′ = ty − x = (y² + 1)/x ≤ y | CHECKED by hand; (y² + 1)/(y + 1) ≤ y for y ≥ 1 |
| Q4 | x = y forces x = 1, t = 3 | CHECKED by hand |
| Q5 | Numerical agreement: one class at trace 3; at least two at traces 4–60; no solution of the equation for t = 4..8 in a box | CHECKED: `checks/sixth_axiom_check.py` (S1, S2, S4, S6), `checks/sixth_axiom_blind_classes.py` |
| Q6 | P = ((1,0),(t,−1)) has determinant −1 and conjugates A_t to its inverse | CHECKED by hand (both products equal ((t,−1),(t²−1,−t))) |
| Q7 | "Clause (a) selects trace three" | follows from Q1–Q4, Thm 4.2 and Def 3.2(a), given positive trace and orientation-keeping relabellings, both stated as inputs. **GAP, declared:** that relabellings keep orientation is not derived from the axioms |
| Q8 | −M is M followed by the fold; same entropy; same map of the pillowcase | CHECKED (S7) for M₀; the general statement is that −1 acts on the torus as z ↦ −z |

**v6.1 (11 Nov 2026):** Q1, Q3, Q4 and Q6 are now also certified in Lean, `MEFProof/Paper_M1/M1_L7_onedrive.lean` (eight theorems; Lean 4.29.1, core only): Q1 `L7_det_of_intertwiner`; Q2–Q4 for every t ≥ 4 `L7_descent`, `L7_no_nat_solution`, `L7_no_int_solution`, `L7_not_conj_inverse`; the solution at t = 3 `L7_trace3_solution`; Q6 `L7_flip`. Not certified, and the text's: Q7 (that the classes are the drives, and the orientation hypothesis). Since P55 clause (a) is the ground of trace three, so Q7's declared gap is load-bearing. **Failure test:** a trace above three with one class under SL₂(ℤ); or an axiom-level reason that relabellings may reverse orientation.

### 10.3 Red-flag scan of the draft
`tools/redflags.py` on `Paper_M1_Six_Axioms_v6.tex`: the hits of v5.0 and no new class of hit at the edited lines (counts in the handover).

### 10.4 Owed (still open after the move to canon, P54; the PI accepted the paper as it stands)
- Gödel's theorem is named in the outlook (P47(2)) without a citation; a published reference read and entered in Verified References, or the sentence reworded.
- The sentence at v5.0 l.637 ("the larger ones reduce to it when w₂ lifts integrally") carries no citation (note §3 row 4).

### 10.5 v6.1 (11 November 2026; Decision Log P55, P56)
- **The ground of trace three** is clause (a) (P55); the paragraph of §4.2, the remark after Definition 3.2, the assembly of Theorem 8.1 and the table of §8 are reordered. No step changes.
- **Gödel** (10.4, first item): closed. Statement read in a secondary source and entered as Verified References V-25; the original not read, its publication data RECALLED. The sentence now states the theorem and says it is not applied.
- **The uncited sentence** (10.4, second item): closed by rewording. v6.0 claimed that Spin^c "has the least structure group lifting a non-zero w₂, and the larger ones reduce to it when w₂ lifts integrally"; no reference was found or read for that, and the architect could not support it. v6.1 claims only what the proof shows (a Spin^c structure exists) and what clause (b) does (no larger structure group than is needed). The statement of Proposition 7.3 changed accordingly: "Spin^c is the least such structure" is no longer claimed. **Status: the word "least" is withdrawn, not proved false.**
- **Lean certificate for Proposition 4.5:** written, 10.2.
- Red-flag scan of v6.1: 16 hits, the same as v6.0. Gates 1, 2, 4, 5 pass; 3 fails on the P36 exception only.
- **Fixed at v6.3 (P65).** Found on the way, not new: the listings of `M1_L3_dimension.lean` and `M1_L4_base.lean` contain three symbols (∣, ∤, 𝒪) that the listing font lacks; they print as blanks in the appendix (12 places), in v5.0 and v6.0 as well. No gate checks it.

### 10.6 v6.2 — the sign of the lift (11 November 2026; Decision Log P57–P60)

Corollary 7.8 now says: on spinors the drive is −w; three steps. Source of the steps: `LIFT_SIGN.md` §7.

| Step | Statement | Status |
|---|---|---|
| S1 | With w six steps are needed, with −w three | CHECKED: w³ = −1 (`L2_w_cubed`), (−w)³ = +1 |
| S2 | The first five axioms allow both | CHECKED in the sense of S5: both families are non-empty; and `LIFT_SIGN.md` §3 (the fold and the drive alone fix no sign) |
| S3 | Clause (c), least number of steps, takes −w | follows from S1 and Def 3.2(c), which names "steps" |
| S4 | SL₂(ℤ) is the amalgam of ⟨S⟩ (order 4) and ⟨U⟩ (order 6) over {±1}; M₀ = U⁻¹S⁻¹U⁻²S⁻¹ | verified reference V-26 (READ); the generators and the word CHECKED |
| S5 | Sixteen assignments; eight with d³ = +1 and a group of 12; eight with d³ = −1 and the group of 48 | CHECKED: `checks/lift_sign_all.py`; blind `checks/lift_sign_all_blind.py`, written without the results; the count 4 × 4 also by hand in the proof |
| S6 | Clause (b) removes the larger group | **a reading, flagged.** Def 3.2(b) speaks of "a structure group larger than is needed"; that the group generated by the assigned elements is such an object is an identification made in this session. The group order was put in the protocol before the script ran, but the wanted answer (three) was known (`LIFT_SIGN.md`, disclosure). Ruled by the PI (P58). Clause (c), S3, gives the same answer without it |
| S7 | Hypotheses: every symmetry of the torus is given an element (for S5, S6 only); the assignment moves the three lines as the corners move | DECLARED in the proof |

**Failure test.** A later paper needing a symmetry that fixes every corner to act on i, j, k; or a result that needs a time circle of six steps.
**Red-flag scan of v6.2:** to be read with 10.5; the new text adds "a choice made after the answer is known" at S6, entered above.

### 10.7 v6.3 — the count of clause (a) (11 November 2026; Decision Log P61–P64)

Source: `ORIENTATION_AND_TIME.md` (protocol agreed by the PI before it ran; blind check; its own step audit R1–R7).

| Step | Statement in the paper | Status |
|---|---|---|
| C1 | Clause (a) counts two steps as the same when, and only when, an orientation-keeping relabelling carries one to the other | DECLARED (PI ruling P63); part of the seventh numbered choice |
| C2 | Both parts are needed: with a mirror admitted, or with a step and its inverse counted as one, A_t and its inverse are one drive | CHECKED: `L7_flip`; the second is immediate |
| C3 | The four counts for traces up to sixty: {3} against {3, 4, 5, 9, 21} | CHECKED: `checks/orientation_time_check.py`, blind `checks/orientation_time_blind.py`. "A single drive" at 4, 5, 9, 21 under the relaxed counts is checked outright (every merge is an explicit equivalence). That the other traces have more than one rests on Gauss's reduction theory (V-12, pages still owed) and, under the strict count, on Proposition 4.5 (`L7_not_conj_inverse`) |
| C4 | The least trace with a single drive is three in all four counts | CHECKED |
| C5 | The first five axioms supply neither part | READ and ARGUED, structure by structure; blind check agrees; **two GAPs declared in the paper**: whether the geometry has a symmetry mirroring the torus; whether the geometry run backwards is another geometry |

**Failure test (in the paper).** A symmetry of the geometry that mirrors the fibre torus; or a later paper that must count a state and the same state run backwards as one.
**Found on the way:** M1 has no definition of when two geometries are the same (the blind checker's words: "a notion of isomorphism of geometries"). Not added to the paper; for the PI.

## 11. Theorem 8.1 (minimality) as it stands in v6.3: audit of the assembly (11 November 2026, third session of the date)

**Direction (PI):** "Do the blind audit of M1's main theorem first"; scope and design confirmed ("All confirmed - audit is the whole session, proceed"). **Scope:** canon M1 v6.3 ll.964–992 (statement, proof, the deflationary reading) and the elimination table ll.994–1018. For each clause of the proof: does the cited result, as stated at its own lines, deliver what the clause claims, and does "unique" follow. The cited results are not re-proved; their own tables are §§8–10 above.

**Read for this section:** canon M1 v6.3 ll.1–1023 (ll.1024–1105 not read); this file's headings, ll.306–348 and 384–387, and the lines a search for "Theorem 8.1" and "blind" printed.

**Disclosure.** The architect is not blind: it read the theorem's conclusion before writing this table, and carries from the M2 handover and Decision Log P71–P87 the odd places found there (Def 2.3; the eight unfixed data; the integer on S²; l.1013). Rows that repeat those are marked "known". §11.1 is the architect's own table and **was written before either blind reader was launched**; their verdicts are in §11.3 and §11.4.

**Red-flag scan (gate 7).** `python3 tools/redflags.py canon/M1/Paper_M1_Six_Axioms_v6_3.tex`: 16 hits, at ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 (two), 806, 1049. **None lies in ll.964–1018.** Hits at lines the proof consumes through its citations: l.677 (Prop 7.2 cites Prop 7.3 "below": see T7); ll.719, 723, 728 (Def 7.4, behind Prop 7.6: "the statements below speak of one lift or the other"; signs "up to the overall sign"); l.1049 (the certificate takes the count of Lemma 7.5(b) as given, as l.801 says).

### 11.1 The architect's step table (fixed before the blind readers reported)

Marks as CLAUDE.md §5. "First hypothesis" in every GAP row: the reading is wrong.

| # | Step of the assembly | Mark | Note |
|---|---|---|---|
| T1 | Hypotheses: "A1–A5 under the readings of Definitions 2.1, 2.3, 2.4(i), 2.7, 2.8" (l.967) | DECLARED, **incomplete as a list** | The proof also rests on Def 2.5 (fibre algebra), Def 2.9 (drive: positive entropy, periodic points of measure zero; l.229 "we take the axiom to exclude that") and Def 7.4 (flux, states, structure), which give words their meaning and are not among the six numbered choices of l.239 |
| T2 | "A5 gives the family (T × Σ) × F" (l.975) | DECLARED (Def 2.1(i)) | dim T = 1 is part of the family |
| T3 | "A4 with clause (a) gives the drive" (l.977) → Thm 4.2, Prop 4.5 | Thm 4.2, Prop 4.5: CHECKED (§9.2, §10.2). **The passage from Def 2.9 to them: GAP** | Thm 4.2 and Prop 4.1 are for a linear map of a torus (l.277). The torus comes from Prop 5.5, whose hypothesis is that the drive "act[s] as an Anosov diffeomorphism commuting with ι" (l.501). Def 2.9 asks a flow with no fixed points, positive entropy and periodic points of measure zero; nothing read derives "Anosov" from that on a fibre not yet known to be a torus, nor "commuting with ι", nor that the flow has a return map on one fibre |
| T4 | "A1–A4 with clause (c) give the fibre, its algebra, its corners and the pillowcase (Section 5)" (l.979) | Thm 5.7 CHECKED; Prop 5.2, 5.5, 5.6 [D]. **Two identifications unnumbered: DECLARED-in-text, not among the nine choices** | (i) l.449: ι acts on the algebra as an anti-involution, "the algebraic image of exchanging growth and decay"; (ii) l.467: A1's compactness of the pieces is read as compactness of the unit groups of the corner subalgebras; (iii) l.516: "exactly four isolated fixed points" of ι is Prop 5.3 "read geometrically" |
| T5 | Clause (c) in Prop 5.5: "selects the least dimension" of the fibre X (l.513) | **GAP (identification)** | Clause (c) names four quantities (l.268); the dimension it names is the total dimension of M. The least dimension of the fibre X is not one of them. With D = 12 fixed, dim X = 2 follows only if the base is already six-dimensional |
| T6 | "A3 with clause (c) gives dimension twelve and the split (3, 6)" (l.981) → Thm 6.1, Rem 6.2 | [D]; DECLARED steps as §9.2, §9.4 | "The time–space block carries the quaternionic structure … so its dimension is a positive multiple of four" (l.613) and "A3 would carry no information on F" (l.621) are readings beyond Def 2.7 as written. Rem 6.2 presupposes F = base × T²/ℤ₂ |
| T7 | "A3 with Definition 2.8 gives S² and ℂP², with Spin^c necessary" (l.983) → Props 7.1–7.3 | **GAP: the three propositions presuppose one another** | Prop 7.1 is conditional: "If a Spin^c structure selects one unit" (l.661). Prop 7.2 takes "the Spin^c line of Proposition 7.3 below" (l.677). Prop 7.3 gets Spin^c from "a geometry whose base contains ℂP²" (l.693). So ℂP² rests on the Spin^c line and the Spin^c line on ℂP². l.685 offers another ground ("spinor-valued data are complex"); that is not what l.677 states |
| T8 | Prop 7.2 against Def 2.8 | **GAP (identification)** | Def 2.8 realises G/H with G "the symmetry group of the fibre algebra" (l.220). In Prop 7.2 the group is U(3), "the symmetry preserving the induced Hermitian form and the Spin^c phase" (l.677), introduced by "let". U(3) is not the symmetry group of ℍ. The paper tags the proposition [D] and "least direct" |
| T9 | The base is the product ℂP² × S² and nothing more | **GAP** | No cited statement says that the realised orbits are exactly these two, or that the base is their product. The dimension count 4 + 2 = 6 agrees with the split and is not an argument for it |
| T10 | "L = 𝒪(3) and Σ = S³ by clause (b)" (l.983) | Prop 7.3, 7.9 [D]; DECLARED (Minimality M1-3, M1-4) | "Determinant line 𝒪(3)" names the integer on ℂP² only. Known (P77, P85): the integer on S² is not stated; l.964 says the conclusion "names … every discrete datum" |
| T11 | "Corollaries 7.7 and 7.8 give the time circle … least number of steps by clause (c)" (l.985) | [D]; hypothesis named in the text ("the lifted fold being one structure on the whole geometry", l.837); §10.6 | l.894: applying the entropy of clause (c) to the step and not to the map once round "is recorded as such": a choice, not among the nine |
| T12 | "flux three on the fibre with one odd corner (Proposition 7.6)" | [D]; §8 A11; target known before the computation (§8 "Disclosure") | hypothesis: the states of clause (iii) are states on the pillowcase for one lift (l.763) |
| T13 | ×_w in the display | **Not derived by the proof; DECLARED (Def 2.4(i)) as a hypothesis** | No clause of the proof speaks of the warp. Known: l.127 (which piece is unfixed); P74(i) (Def 2.4(ii) cannot hold on a closed piece, CHECKED in the M2 step audit) |
| T14 | Existence: "the geometry that satisfies A6 … is unique and is M₁₂" | **GAP** | Every clause of the proof argues that a factor is forced. No clause shows that M₁₂ satisfies A1–A5 as defined, in particular Def 2.4(ii), (iii), Def 2.9 on T × F with F eight-dimensional, and clause (a) |
| T15 | Clause (a), "M has no modulus", for M₁₂ | DECLARED (the declared input; Minimality M1-10), **narrower than what is needed** | The energy functional of Def 3.1 is not defined, so no datum can be tested. One proportion is declared (the aspect ratio). Known (P71): seven other continuous data are left unfixed, among them the relative sizes of the pieces, which l.255 says are the only things that mean anything. "Declared sector" (l.967) is not defined (known, P74) |
| T16 | "unique" | **GAP (undefined term)** | No definition of when two geometries are the same (known: §10.7; P71) |
| T17 | χ(K₈) = 12 | CHECKED (`L3_chi_K8`); Künneth not read (§9.2) | — |
| T18 | The primes (ll.987–989) | DECLARED; "topological integers" is not defined | Cannot be marked CHECKED until the list of integers is given. M₀³ has entries 13, 8, 8, 5 (l.837); whether entries count is not said |
| T19 | Order of the clauses: "(a), (b), (c) applied in order, each among the geometries the previous ones leave" (l.262) | **GAP against the proof's order** | Clause (a) on the drive presupposes the torus, which Prop 5.5 gets by clause (c). The proof applies (c) before (a) there |

**Elimination table (ll.1002–1015), the architect's verdicts, fixed before the blind reader B reported.**

| Row | Competitor | Verdict | Tag in M1 | Architect |
|---|---|---|---|---|
| E1 | non-warped product | excluded by definition | [D] | agrees |
| E2 | D ≢ 0 (4) | excluded given Def 2.7 | [R] | the cited Thm 6.1 is [D]; [R] only for "almost-quaternionic ⇒ 4 ∣ D" |
| E3 | D = 4, 8 | D = 8 excluded by the reading "A3 vacuous on F" and a four-dimensional block | [R] | **overstated: [D]** |
| E4 | D = 16, 20, … | clause (c) | [D] | agrees |
| E5 | trace 2 | entropy zero | [R] | agrees |
| E6 | trace ≥ 4 | at least two classes: CHECKED; the exclusion needs the declared count | [R] | [R] for the count of classes; the exclusion is [D] |
| E7 | M₂(ℝ) | Prop 5.2 | [D] | agrees, with T4(ii) |
| E8 | Tⁿ, n ≠ 2 | 2ⁿ ≠ 4: CHECKED; that the fibre has four fixed points is T4(iii) | [R] | **overstated: [D]** (Prop 5.5 is itself [D]) |
| E9 | T⁴/ℤ₂, K3 | 16 corners CHECKED; "D = 8" rests on Thm 6.1 | [R] | **overstated: [D]** |
| E10 | S³/ℤ₂, S³/ℤ₃ | clause (b) | [D] | agrees |
| E11 | spin bases S² × S² × S², ℂP³, S⁶ | "Spin^c unforced; no S² factor" | [D] | **GAP.** S² × S² × S² has S² factors. "Spin^c unforced" is not a failure of an axiom: Def 2.7 asks a spinor bundle, a spin base supplies one with less, and clause (b) would prefer it. What excludes a spin base is that ℂP² must be realised (Def 2.8), which is T7 |
| E12 | bases with moduli: ℂP² × T², T⁶ | clause (a) | [R] | **not [R]** (known, handover item i): the functional is undefined; and the fibre's own modulus is admitted "held by a declared sector" while the base's torus is excluded for having one. Both lack an S² factor or a ℂP² factor and would fall to Def 2.8 at [D] |
| E13 | the quadric Q³ | no Sp(1)/U(1) factor | [D] | agrees, under Def 2.8 |
| E14 | 𝒪(1), 𝒪(5) | clause (b) | [D] | agrees |

The table is a list of examples. It is not exhaustive and the proof does not use it; uniqueness rests on T3–T12.

**What would show this table wrong (failure test of the audit).** T3: a line of M1 that derives "Anosov, commuting with ι, with a return map" from Def 2.9 before l.501. T5: a line that applies least dimension to the fibre by a named clause. T7: an order of Props 7.1–7.3 in which each rests only on what precedes it. T14: a passage that checks M₁₂ against Defs 2.1–2.9.

### 11.3 Blind reader B: the fourteen competitors (returned 11 November 2026)

**What it was given.** Canon M1 v6.3 ll.58–119 and 131–947 with line numbers, and nothing else: ll.120–130 (the summary of results), ll.948–end (Theorem 7.10, Section 8 with the theorem and the table, the outlook, the appendices), the abstract and the title page were withheld. It was given the fourteen competitors and the result named against each, without the "Fails at" column and without the tags, and was asked whether the text excludes each, by what, on what hypotheses, and with what tag. It was not told the architect's verdicts. Standing: model output, as §11.1 is. Its arithmetic script is kept as `checks/thm81_blindB_chk.py` and was re-run here.

| Row | Competitor | Tag in M1 | Architect (§11.1) | Blind reader B | Agree? |
|---|---|---|---|---|---|
| E1 | no warping | [D] | agrees | excluded by Def 2.4(i); [D] | yes |
| E2 | D ≢ 0 (4) | [R] | [D], with [R] only for the module step | [D]: "an elementary consequence of a declared reading; the theorem is itself tagged [D]" | yes; both below M1's tag |
| E3 | D = 4, 8 | [R] | overstated: [D] | D = 4: [D]. **D = 8: [M]**: the excluding step is "a requirement not found in any definition or numbered choice" (l.621, "A3 would carry no information on F") | both below M1's tag; B is lower than the architect |
| E4 | D = 16, 20, … | [D] | agrees | **[M] on the text as given**: "least" needs a twelve-dimensional geometry that survives clauses (a) and (b), and that is asserted (l.625) and not shown; [D] once existence is supplied | B adds the dependence on existence (T14) |
| E5 | trace 2 | [R] | agrees | [R] within the torus setting of l.277; the setting itself [D]. Notes that at \|t\| = 2 the proof says "M is a shear" and ±1 is not one; the conclusion stands | yes |
| E6 | trace ≥ 4 | [R] | [R] for the count, [D] for the exclusion | [D]: "the arithmetic is [R], but the exclusion holds only under the declared count". Thm 4.2 excludes nothing at trace ≥ 4. Adds: what is excluded is a *step* of trace ≥ 4; the same bundle read as one step of trace eighteen is excluded only by the choice of l.894 with Cor 7.8 | yes; B adds the point on trace eighteen |
| E7 | M₂(ℝ) | [D] | agrees, with T4(ii) | **[M]**. Two identifications undeclared (compact pieces ⇒ compact unit groups; the anti-involution is quaternion conjugation). **Counter-example to the step as worded, CHECKED:** on M₂(ℝ) with a* the transpose, the only line ℝ ⊕ ℝu with u* = −u is spanned by J, J² = −1, with compact unit group; the hypotheses of Lemma 5.1 hold and M₂(ℝ) is not a division algebra. Lemma 5.1 gives N "values in the fixed set of *", and a⁻¹ = a*/N(a) needs N real | **B found more.** Re-checked by the architect by hand: transpose is an anti-involution; skew matrices are the multiples of J; the unit group of ℝ ⊕ ℝJ is the circle. The first hypothesis stands: the text may intend * as the conjugation of an algebra already of quaternion type (l.471), and that is then an unstated premise |
| E8 | Tⁿ, n ≠ 2 | [R] | overstated: [D] | [D]: "arithmetic under a declared identification; the proposition is [D]". Notes l.513 against l.268 (T5) | yes |
| E9 | T⁴/ℤ₂, K3 | [R] | overstated: [D] | T⁴/ℤ₂: [D]. **K3: [M]**, resting on the D = 8 step alone; Prop 5.3 "by itself excludes neither: it counts subalgebras of ℍ" | both below M1's tag; B lower on K3 |
| E10 | S³/ℤ₂, S³/ℤ₃ | [D] | agrees | [D] | yes |
| E11 | spin bases | [D] | GAP, by T7 | **[M]**. "Spin^c is forced" does not exclude a spin base: it "presupposes the ℂP² that excludes them". Finds the circle of Props 7.1–7.3 independently; finds that l.685 attributes to Prop 7.3 a statement ("spinor-valued data are complex") that ll.692–707 do not contain; finds U(3) outside Def 2.8 as worded; notes that clause (b) "would, if anything, favour a base needing no determinant line" | **yes, independently, on T7, T8 and E11** |
| E12 | bases with moduli | [R] | not [R] | **[M]**: "the test in Def 3.1 cannot be carried out on the text, because the functional it refers to is not given". On question B: the treatment of the base's torus and of the fibre's aspect ratio is "not consistent" on the text as given; consistent only if the undefined stationarity conditions fix the one and not the other, and "the text given supplies neither half" | **yes, independently** |
| E13 | the quadric Q³ | [D] | agrees | [D]; notes that l.223 promises "the other possible reading is set out" in Section 7 and it is not found in ll.656–947 (the architect: it is at l.992, in the withheld part) | yes |
| E14 | 𝒪(1), 𝒪(5) | [D] | agrees | [D]; notes that the sign of the selected unit (𝒪(3) against 𝒪(−3)) is declared and not derived | yes |

**Question A (does excluding the fourteen leave one geometry?). B: no.** Its list of what is not excluded or not shown, each checked here against §11.1:
- existence of the survivor (T14), and that it has no modulus (T15); the other proportions unfixed (T15, known);
- fibres that are not tori: Def 2.9 does not ask Anosov (T3). **B's example, RECALLED and not verified:** a surface of genus three, a double cover of the torus branched at four points, with a pseudo-Anosov map commuting with an involution that has exactly four fixed points;
- return maps that are not linear, and negative traces (T3);
- least dimension of the fibre is not what clause (c) names (T5);
- other six-dimensional bases holding both orbits: Def 2.8 says "piece", Props 7.1, 7.2 read "factor" (T9). **B's example, RECALLED:** the flag manifold of ℂ³, an S²-bundle over ℂP²;
- the integer of the determinant line on S² (T10, known);
- the metric on each factor (not in §11.1; within the known list of P71);
- **not in §11.1:** Def 2.7 speaks of "the algebra generated by the Clifford action on a spinor bundle over M", which in dimension twelve is not ℍ (RECALLED by B); the text does not reconcile this with Prop 5.2;
- **not in §11.1:** l.235 says the strong form of the drive "is not assumed; Section 4 derives it", while Prop 5.5 assumes Anosov; B reads "is not assumed" as too strong as worded.

**On Def 2.4, found by B without being asked:** on a compact piece no single-valued smooth w has ∇w nowhere zero. This is the point of P74(i) (CHECKED there), found a third time independently. B gives three readings under which the definition could hold and notes that ll.131–947 exhibit no product of the derived geometry as warped (T13).

**Where B and the architect differ.** In no row does B rate an exclusion higher than the architect. B is lower at E3 (D = 8), E4, E7 and E9 (K3). B did not raise T19 (the order of the clauses).

**On the script.** Re-run here: no solution of p² + tpq + q² = −1 for t = 4…12 in the box; the intertwiner identities; the entropies 0.962, 1.317, 1.567, 1.763; J² = −1; the three conjugators of ll.353–355. Its function `classes` (a count of classes among small matrices) prints 1, 2, 2, 1, 0, 0 for traces 3–8: it is a search in a bounded box, B did not report it, and it is relied on for nothing.

### 11.4 Blind reader A: the assembly (returned 11 November 2026)

**What it was given.** The same text as B (ll.58–119, 131–947), and no list of competitors. It was asked to assemble for itself what the stated results determine, taking each result as true as stated; to list the hypotheses of each and where the text discharges them; the order of dependence; readings not among the nine numbered; what is left free; and whether existence and uniqueness are shown. It was not given the theorem, the display of the geometry, Theorem 7.10 or the architect's table. Standing: model output. Its script is kept as `checks/thm81_blindA_chk.py` and was re-run here (it runs; its outputs were not compared line by line with A's report).

| §11.1 row | Blind reader A | Agree? |
|---|---|---|
| T1 (hypotheses incomplete) | Lists twenty-eight places (its 4.1–4.28) where a meaning, identification or selection enters that is not among the nine numbered. Among them: no part of Def 2.9 is numbered; Def 2.5; l.187 ("'As a function of itself' is the law of natural growth") where only clause (i) is numbered; Def 3.1; l.277 (return map in SL₂(ℤ)); l.295 (positive trace); Def 7.4 | yes; A's list is longer |
| T3 (Def 2.9 to the drive) | Its 2.1, 2.6(d), 3.3. "Def A4 … does not ask Anosov, nor that the flow be the suspension of a diffeomorphism of a fibre." **Calls it a circle:** l.277 says the torus "is proved in Section 5 … and nothing in the present section is used there"; l.235 says the strong form "is not assumed; Section 4 derives it"; Section 4 derives it only on the torus. "The two sentences l.235 and l.277 cannot both be the case unless Anosov is an independent assumption in Prop [5.5], which l.235 denies." Also: Franks gives topological conjugacy to a linear map (l.505), the statement says the drive *is* an element of SL₂(ℤ) (l.501) | **yes, independently** |
| T4 (unnumbered identifications) | Its 2.4, 2.5, 2.6(a)–(c), 3.4, 3.5. Adds: that the involution of A2 sits on the same fibre as the drive is nowhere established (Def 2.4(iii) puts it on "the warped piece" and no result says which piece is warped); Prop 5.2 uses "the corner fibres" before any corner exists; the four fixed points rest on Prop 5.3 "read geometrically" and "the next proposition", which assumes the torus (a near-circle) | yes; A adds |
| T5 (clause (c) on the fibre's dimension) | Its 3.7(iii): "not one the clause's wording covers … no step shows that a larger X gives a larger total" | **yes, independently** |
| T6 (Thm 6.1) | Its 2.8: Def 2.7 "does not say that T × Σ and F are separately invariant under I, J, K"; restated as a hypothesis in Rem 6.2 and not established there | yes |
| T7 (Props 7.1–7.3 presuppose one another) | Its 3.2: "Circle: Prop CP2 ↔ Prop spinc." Without ℂP² the remaining pieces are spin (l.705), "so nothing in the text forces a Spin^c structure, and then nothing selects a unit." Its consistent reading: a Spin^c structure with a selected unit is posited independently, and then "the selected unit is an unsourced input". l.685's attribution to Prop 7.3 is not in l.693 | **yes, independently (all three readers)** |
| T8 (U(3) against Def 2.8) | Its 2.11(iii): "what Def orbits literally asks and what Prop CP2 assumes are not the same thing"; "scale-freeness of A3" (l.685) appears nowhere else | **yes, independently** |
| T9 (the base as a product) | Its 1.22: "Not a datum determined by any result in the lines given"; used as known at ll.653, 712 | **yes, independently** |
| T10 (integer on S²) | Its 5.6: "even" only; "not acknowledged as open" | yes (known) |
| T11 (time circle; the step) | Its 2.14, 3.8. Adds: l.277 calls one application of the *return map* a step; once round T the return map is M₀³, of trace eighteen, where Prop 4.5 gives at least two classes and the entropy is 6 log φ. Def 2.1(ii) and the hypothesis of Cor 7.8 are compatible only with the later meaning of "step". And in Cor 7.8 clause (c) is applied before clause (b) (ll.863, 865) | yes; A adds |
| T12 (flux three) | Its 2.12. **The integer turns on a reading.** Def 7.4 says "Two states of the fibre *at rest* have the same shadow … This is the reading of Definition 2.1(iii)" (l.725); Prop 7.6 assumes "states on the pillowcase for one of the two lifts" (l.763). CHECKED by A from Lemma 7.5 as stated, and re-checked here by hand: at flux two with D = P_i + P_j there are two states at rest (7.5(a)) and the signs are two of each kind, moved by one step (7.5(c), l.755), so clauses (ii) and (iii) both hold; on the pillowcase each lift keeps one (7.5(b)) and clause (iii) fails. Least flux two on the words of l.725, three on the hypothesis of l.763 | **Known and ruled:** §8, "Disclosure" (l.199 of this file): "The count on the covering torus … gives two; the count on the pillowcase gives three; the PI has ruled the pillowcase (P34 (2))". P34 is a sealed row and was not read. What A adds is that l.725 words the reading of clause (iii) in states at rest, not in states on the pillowcase |
| T13 (the warp) | Its 5.5, 6(a): "no warp is constructed anywhere" | yes |
| T14 (existence) | Its 6(a), clause by clause. Shown: A1; A5(ii), (iii) under Def 7.4; a Spin^c structure; clause (a) for the drive; A4 on the torus. Not shown: A2(i)–(iii); the almost-quaternionic structure of Def 2.7 on the twelve-dimensional product ("D = 12 is admissible" is "the divisibility test only"); that ℍ is the algebra of operations on the fibres of the candidate; "no modulus". **Cannot hold as written: Def 2.4 with Def 2.3**, computed in full (maximum and minimum of w), with three readings under which it could | **yes, independently.** The Def 2.4 point is P74(i), now found by four readings |
| T15 (no modulus) | Its 3.7(i), 5.3, 5.15, 6(a): the first part of clause (a) is applied nowhere in ll.58–947; l.239 "One proportion is not derived" implies the others are, and none is | **yes, independently** |
| T16 ("unique") | Its 6(b): "No notion of sameness of two geometries is defined" | yes (known) |
| T17, T18 | Not reached: Theorem 7.10 and ll.987–989 were withheld | — |
| T19 (order of the clauses) | Its 3.7(ii), (iv): "a use of (c) precedes the first use of (a)"; Thm 6.1 applies (c) before any use of (b), which is harmless "only if a twelve-dimensional geometry survives (a) and (b)" | **yes, independently** |

**Found by A and not in §11.1** (each checked here against the text; the first hypothesis in each is that the reading is wrong):
1. **Prop 5.6, statement against proof (ll.521, 529).** The statement has "ι acting as conjugation"; with that alone Prop 5.4 gives ℝ at all four corners. The proof uses "the local form of ι at such a point is the inner automorphism by the surviving unit". READ; l.536 acknowledges the reading and calls it "a definition rather than a computation". The statement's hypothesis does not say that conjugation is meant at P₁ only.
2. **The corner labels against the cycle.** l.531: "ℂ_i ↦ ℂ_j ↦ ℂ_k exactly as P₂ → P₃ → P₄". Appendix B (l.1075, read here; withheld from A) has P₂ = C_j, P₃ = C_i, P₄ = C_k, and l.578 the same. Under that dictionary P₂ → P₃ → P₄ is ℂ_j → ℂ_i → ℂ_k, which is Ad_w run backwards (Ad_w sends j to k). CHECKED by hand from ll.403, 531, 1075. Appendix B calls the assignment of j and k "a convention [that] carries no content"; l.531 as worded does not agree with the dictionary. Since w⁻¹ has the same cube as w, the choice of −w in Cor 7.8 is not touched (CHECKED: (w⁻¹)³ = (w³)⁻¹ = −1).
3. **Cross-references that do not resolve.** l.533 cites "Definition 2.9(iii)"; Def 2.9 has no numbered clauses (READ l.232). l.685 as in T7. l.166 says Theorem 6.1 holds for "a geometry satisfying the other four axioms"; its hypothesis is Def 2.7 and A1–A5.
4. **l.349 against l.357.** "any A … is S M₀ S⁻¹" and "S A S⁻¹ = M₀": the three displayed pairs satisfy the second (CHECKED by both readers); the first holds for the second pair only. Wording; no effect.
5. **Tags.** Thm 4.2 is [R] and its "Consequently" speaks of "the minimal drive" and "a minimal geometry"; Prop 4.5 is [R] and ends "the clause selects it". The [R] content is the conjugacy statements.
6. **Names.** "F" is both the eight-dimensional internal piece (l.150) and what sits over the base (ll.202, 220, 277); "the time factor" is one-dimensional at l.150 and the three-dimensional torus bundle at l.300; "M" is the manifold (l.148) and the return map (l.277). A's list of terms used and not defined: its 7.10.
7. **Def 2.7 against Prop 5.2** (also B): the algebra generated by the Clifford action on spinors over M is not ℍ in dimension twelve (RECALLED by both; not verified). A's consistent reading: "acts as" means "acts through".
8. **The aspect ratio and the drive** (A's 7.6; B's last remark): no flat metric on the fibre is kept by a step. This is P74(iii), found again independently.

### 11.5 What the three readings agree on, and the standing of the theorem

**Nothing certified is found false.** No Lean certificate, no computation and no statement of Sections 4–7 marked CHECKED in §§8–10 was found wrong by either reader; both re-derived parts of them (Prop 4.5's descent, the conjugators, M₀³, the sixteen assignments, the flux table of Prop 7.6 on the pillowcase) and agree with the paper.

**What is found concerns the joins.** Marked by how many of the three readings (architect, A, B) found it independently:

| # | Finding | Found by | Mark |
|---|---|---|---|
| J1 | Props 7.1, 7.2, 7.3 each take a hypothesis from another: ℂP² from the Spin^c line, the Spin^c line from ℂP². As written, nothing excludes a spin base | all three | GAP |
| J2 | The torus is obtained from "Anosov" (Prop 5.5) and "Anosov" from the torus (Section 4); Def 2.9 asks neither Anosov nor a return map; l.235 says the strong form is not assumed | all three | GAP |
| J3 | Existence: no passage shows that M₁₂ satisfies Defs 2.1–2.9 and 3.2; Def 2.4 with Def 2.3 cannot hold as written (P74(i)) | all three | GAP |
| J4 | Clause (a), "no modulus", is applied nowhere; the functional is undefined; one proportion is declared and the others are neither fixed nor declared; the base's torus is excluded for a datum of the kind the fibre is allowed | all three | DECLARED, narrower than needed; row E12 not [R] |
| J5 | Clause (c) is applied to the fibre's dimension, which it does not name, and before clause (a), against l.262 | architect, A; B notes the first half | GAP |
| J6 | U(3) is not the group Def 2.8 names; that the base is the product of the two orbits and nothing more is asserted | all three | GAP |
| J7 | "Unique" has no definition of sameness behind it | all three (known) | GAP |
| J8 | Tags of the table: E2, E3, E8, E9, E12 carry [R] and rest on results tagged [D] or on undeclared steps; E11 rests on J1 | architect, B | overstated |
| J9 | Prop 5.2: the hypotheses of Lemma 5.1 as worded are met by M₂(ℝ) with the transpose | B; re-checked by hand | GAP inside a cited result (outside the scope of §11; recorded) |
| J10 | Readings not among the nine numbered choices: A's list of twenty-eight | architect, A, B in part | DECLARED in the text, unnumbered |
| J11 | The least flux is two or three according to the reading of clause (iii) | A | known; ruled (P34(2), per §8) |

**Failure test of this section.** As at the end of §11.1. In addition, J1 is wrong if M1 somewhere gives a ground for the selected unit, or for complexification, that does not pass through ℂP²; J9 is wrong if the text restricts the anti-involution before Lemma 5.1.

**Not done.** ll.1024–1105 of M1 were not read except Appendix B (l.1075). The Lean files were not opened. No claim RECALLED by a reader (the genus-three example; the flag manifold; the Clifford algebra in dimension twelve) was verified, and none enters a register or a paper until it is. Gate 6 for Theorem 8.1 is this section; it is complete as an audit and the theorem does not pass it as written.
