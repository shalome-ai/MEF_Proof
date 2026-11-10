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
