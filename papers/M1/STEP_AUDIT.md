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

*(There is no §11.2: the numbering runs 11.1, 11.3.)*

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

### 11.6 J1 taken up with the PI (11 November 2026; Decision Log P89): are spinors in twelve dimensions complex of themselves?

**Why asked.** The way out of the circle of J1 that M1's own l.685 points to is that the data are complex because they are spinor-valued (Definition 2.7), not because of the Spin^c line. The PI confirmed that order as the one intended and directed that the statement about spinors be verified at source first.

**Read at source.** Atiyah, Bott and Shapiro, "Clifford modules", *Topology* 3, Suppl. 1 (1964) 3–38, pp. 11 and 12, read as page images from a scanned copy (webhomes.maths.ed.ac.uk/~v1ranick/papers/abs.pdf). Only those two pages were read.
- p. 11, Table 1, column C_k, k = 1…8: "C, H, H ⊕ H, H(2), C(4), R(8), R(8) ⊕ R(8), R(16)". (C_1 ≅ C shows the generators square to −1.)
- p. 11: "C_{k+8} ≅ C_k ⊗ C_8; further C_8 ≅ R(16), whence if C_k ≅ F(m) then, C_{k+8} ≅ F(16m)."
- p. 12, Proposition (5.4): "Let φ: R^k → C⁰_{k+1} be defined by φ(e_i) = e_i e_{k+1}, i = 1, …, k. Then φ extends to yield an isomorphism C_k ≅ C⁰_{k+1}."

**What follows (by the two quoted statements, no more).** C_12 ≅ C_4 ⊗ R(16) ≅ H(32). Its even part is C⁰_12 ≅ C_11 ≅ C_3 ⊗ R(16) ≅ H(16) ⊕ H(16). Both are matrix algebras over the quaternions.

**CHECKED independently, no table assumed:** `checks/spinor_type_check.py`. It builds the gamma matrices, restricts the generators of Spin(n) to a half-spin space S⁺, and solves for an antilinear map commuting with them. Output: n = 2, 6, 10 none (complex type); n = 8 one, squaring to +1 (real type); **n = 4 and n = 12 one, squaring to −1 (quaternionic type)**; S⁺ irreducible in every case (commutant of dimension one); dim S⁺ = 32 at n = 12.

**Answer.** No. In twelve dimensions a spinor is not complex of itself: each half-spin space carries a quaternionic structure that commutes with Spin(12). A complex structure on it is one more datum, and the complex structures that commute with Spin(12) are the units of those quaternions.

**Not read and not checked.** That Spin(k) lies in C⁰_k and that the half-spin spaces are its irreducible modules (elsewhere in the same paper). That the commutant of H(m) on H^m is H (elementary; RECALLED). Whether the quaternions that commute with Spin(12) on spinors are the fibre algebra of M1: **an identification, and no certificate checks it** (CLAUDE.md §5). It was noticed after the difficulty of J1 was seen and with the wanted outcome (a selected unit) in view, so it is a lead and a premise of nothing.

**Bearing on J1.** The reconstruction "spinors → complex data → ℂP²" does not go through as "spinors are complex": that step is a choice. What the source gives in its place is that choosing to treat the spinors as complex *is* choosing a unit among quaternions. Whether that closes J1, and how, is with the PI.

**Failure test.** The answer is wrong if a half-spin representation of Spin(12) admits no invariant quaternionic structure; the script would then print "COMPLEX" or "REAL" at n = 12, and Table 1 with the periodicity would not give H(32).

**The lead tested (Decision Log P90).** `COMMUTANT_LEAD.md`: protocol and prediction fixed first; the architect's script and a blind reader agree. The quaternions that commute with Spin(12) on spinors are not M1's fibre algebra: three of four criteria taken from M1's own lines fail. J1 is not closed by the lead. Found on the way: the two levels of Definition 2.7 give different algebras on one tangent space (CHECKED), the point of the readers' 7.7.

### 11.7 J1 closed by a numbered choice (Decision Log P91, P92); corrections to §11.5

- **J1 is closed** by the PI's ruling of P92, a confirmed read-back: the tenth numbered choice of M1, the seventh of Section 2, in two parts: (a) the spinor bundle of Definition 2.7 is the complex spinor bundle; (b) data of the fibre algebra carried by spinors are complex-valued: the three imaginary units take values in ℂ ⊗ Im ℍ ≅ ℂ³. With it the order of P89 runs without a circle. In the table of §11.5, J1's mark becomes **DECLARED (P92); GAP in v6.3 as it stands**, until the new version carries the choice and the rewording of ll.661, 677, 685 and row E11.
- **Flagged in P92:** no argument that the sixth axiom selects complex over real or quaternionic spinors. **Failure test (P92):** a later paper needs spinors that are real or quaternionic and not complex; or the complex-valued units of (b) cannot be what the complex spinors carry.
- **Correction to §11.5, "Not done".** Of the three statements RECALLED by the readers, the one on the Clifford algebra in dimension twelve is now CHECKED (`COMMUTANT_LEAD.md` §4). The genus-three example and the flag manifold remain RECALLED.
- **Independent check of the handover** (a fresh reader, given the handover and the files it cites under the M2 reading limits): 26 findings, corrected in `HANDOVER.md`, in the note of the M2 handover, in Decision Log P90 and here.

### 11.8 Findings on M1 v6.3 carried from the notes of the second start of M2 (11 November 2026; Decision Log P95)

M2 is to be started from scratch on the new version of M1 and its files are sealed (P95). The findings below are about M1 and were made while reading M1 for M2; they are copied here so that the new version of M1 is built with them. **Sources, all read by the writing session and all now sealed or off the reading list:** `superseded/M2_second_start/STEP_AUDIT.md`, "Independent check of N0" (rows a–k); Decision Log P71, P74, P77, P85; that start's handover. The marks are the sources'. **The column "Meets" is the architect's mapping.** M1's definition of growth and decay (l.190) is Definition 2.4 by the count of the source file; the M2 notes and rows call it "Def 2.3". The first hypothesis in each is that the reading is wrong.

| # | Finding | Mark in the source | Meets |
|---|---|---|---|
| M-a | The integer of the determinant line on S² is not stated: "even" only (ll.707, 712, 938); the theorem names 𝒪(3) on ℂP² and flux three on the fibre and gives no value on S² (l.971) | READ (row a; P77) | T10. The PI confirmed the reading "two" for M2: P85, "Agreed, 2 - record it and proceed. I can't see any reason to change it". **Ruled (P97): the new M1 states two** (Minimality M1-16) |
| M-d | The measure for which the periodic points have "measure zero" is not named (ll.229, 232, 290) | READ (row d) | J2 |
| M-e | Cross terms between the pieces are not excluded (l.163) | READ (row e) | J4 |
| M-f | Definition 2.4(iii), l.190: "ι*κ = −κ" for "a constant κ". The pull-back of a constant is the same constant, so κ = 0, against κ ≠ 0 | CHECKED, one line (row f; P77) | J3 |
| M-g | Definition 2.4(i), l.190, asks for a warped product "in (2.1)", which has two products, T × Σ and (T × Σ) × F; the display (l.125) writes both plain and puts the warp inside F | READ (row g) | J3; T13 |
| M-h | "The base over which F sits" (ll.209, 220) against F = base × fibre, dim F = 8 (ll.617, 650). Wording | READ (row h) | Corpus Errors entry 32, item (n) |
| M-i | The elimination table excludes bases with moduli by clause (a) with tag [R] (l.1013), while the functional that defines a modulus is not defined (l.258), and the fibre torus keeps its own shape parameter by a declared input | READ (row i) | J4; J8 (row E12) |
| M-j | The worked example of a trivial stabiliser, l.578. The point (1/3, 0) is fixed by ι∘M₀²: M₀² = (5 3; 3 2), M₀²(1/3, 0) = (5/3, 1) ≡ (2/3, 0), and ι sends that to (1/3, 0). Every rational point is periodic (l.290), so none has trivial stabiliser. By the rule of Proposition 5.6 (l.521) the algebra at (1/3, 0) is then what conjugation composed with Ad_w² fixes: a + v with −Rv = v, R a turn of order three, which has no eigenvalue −1, so v = 0 and the algebra is ℝ, not ℍ. P77: "the worked example at l.578 is wrong as written" | CHECKED (row j; P77) | **not among J1–J11: a new item** |
| M-k | The block "modelled on ℝ_{>0} × S³" (ll.615, 943) against a compact time circle (l.178) | READ (row k) | J3 |
| M-P74(i) | Definition 2.4 (l.190) with Definition 2.3 (l.178): a smooth w on a compact piece without boundary cannot have dw/ds = κw with one constant κ ≠ 0 throughout. The computation, as P74 has it: at the maximum of w the gradient vanishes, so κw = 0 there and the maximum is 0; likewise the minimum; so w ≡ 0, against ∇w ≠ 0. Clause (iii) suggests that κ changes sign; the text does not say where | CHECKED by hand (P74) | J3; found again by both blind readers of §11 |
| M-P74(ii) | "The warped piece" has two readings. P74 cites ll.190(iii) and 193; the phrase is at l.190(iii), and l.193 speaks of "the fold that halves the internal piece" | READ; "noted only" (P74) | J3 |
| M-P74(iii) | The aspect ratio (l.602). As P74 has it: a flat torus has two shape parameters and not one (four for a lattice, less rotation and scale); and no flat shape of the torus is kept by a step of the drive: if M₀ᵀgM₀ = cg then c = 1 and M₀ would have eigenvalues of modulus one; they are φ^{±2} (M1 agrees at ll.344, 723) | CHECKED by hand (P74) | J4; the second half found again by both blind readers |
| M-sector | "Declared sector" (l.967) occurs once in M1 and is not defined | READ (P74) | J4; T15 |
| M-w | The place of "×_w" in the display (l.125); M1 itself says nothing derived depends on it (l.127) | READ (the second start's handover, its list for the Corpus Errors Register) | T13 |
| M-list | **The continuous data M1 v6.3 leaves unfixed, eight rows** (P71, with the amendments of P74 and P77; this is what §11.1 T15 calls "seven other continuous data" besides the aspect ratio): (1) the flat shape of the fibre, named in M1 as the aspect ratio (ll.602, 239, 967, 992): two parameters, and how it is carried round time; (2) the warp: which piece is scaled and by a function on which (ll.127, 190); (3) the warp's constants κ and w₀ (l.190); (4) the relative sizes of T, S³, ℂP², S² and the fibre (M1 silent; ll.239, 255); (5) the metric on each piece (M1 silent; ll.55, 143); (6) the length of the time circle and the parametrisation of the flow (ll.232, 277, 837); (7) the almost-quaternionic structure as a subbundle, with the spinor bundle and the Clifford action (l.214); (8) the connection on the Spin^c line and on the twist, with their Hermitian metrics and the forms that carry the flux (ll.693–703, 717, 934–938) | READ, each row (P71, P77). **Completeness is not proved:** "the architect's reading … marked UNVERIFIED" (P71); found independently by a second reader (the source's "Agreement" paragraph) | J4 |

**Not carried:** the readings confirmed for M2 (P72, P76, P79, P81, P84), which are about M2; the report's RECALLED statements.

### 11.9 Reader A's list of readings not among the nine numbered choices, in full (for J10; Decision Log P97(2))

Reader A's report is kept in no file of its own; §11.4 quotes parts of it by A's own numbering ("its 4.1–4.28", "its 7.10", and so on). Its item 4 is copied here from the report as returned, because P97(2) has the list for J10 drawn from it. Lines are of canon M1 v6.3; the words in quotation marks are M1's. The nine numbered choices are at ll.163, 181, 193, 211, 223, 239, 247. Standing: a reader's list, model output; each item is put to the PI before it is numbered, since some may prove to be consequences and not choices (P97(2)).

| A's # | Line | The meaning, identification or selection |
|---|---|---|
| 4.1 | l.143 | "A geometry here is a smooth shape … on which lengths and angles can be measured, and which is allowed to have a few isolated sharp points": the class of objects |
| 4.2 | l.163 | "Writing M this way is only a way of naming the pieces … the internal piece may be carried round time by a map of itself": "product" in Definition 2.1(i) is thereby not a product |
| 4.3 | l.150 | "T is a one-dimensional piece carrying time"; exactly three pieces |
| 4.4 | ll.175, 178 | "'closes on itself' means two things. First, no piece goes on for ever and no piece has an edge: each is compact". The third numbered choice (l.181) is only the loop that cannot be shrunk |
| 4.5 | l.187 | "'As a function of itself' is the law of natural growth"; "'Grows and decays' says that both signs of κ occur … there is a symmetry of the shape that swaps κ for −κ". Only clause (i) is numbered (l.193) |
| 4.6 | ll.199–202, 209 | "The axiom says that the operations the universe performs on its internal piece fail to commute. To make this precise we must say what those operations are": Definition 2.5 is not numbered. "Two things follow at once and are not extra assumptions … 𝒜 is finite-dimensional" |
| 4.7 | ll.229, 235 | "'Never stands still' means the flow has no fixed points. 'Constant change' means more than motion … we take the axiom to exclude that"; entropy; periodic points of measure zero; "The flow is placed on time together with the internal piece". No part of Definition 2.9 is numbered |
| 4.8 | l.258 | Definition 3.1: "survives the stationarity conditions of the geometry's energy functional" |
| 4.9 | l.277 | "The drive of A4 acts on T² by its return map, an element M ∈ SL₂(ℤ)"; "One application of this map is a step" |
| 4.10 | l.295 | "The trace is taken positive. This is an input and not a selection" |
| 4.11 | l.300 | "the time factor of a minimal geometry is the Sol torus bundle" |
| 4.12 | l.449 | "Let ι act on the fibre algebra 𝒜 as an anti-involution a ↦ a* (the algebraic image of exchanging growth and decay: composition run backwards)" |
| 4.13 | ll.458, 467 | "A1 requires every factor, the corner fibres included, to close" |
| 4.14 | ll.501, 513 | "the fibre X that carries the involution of A2 … the drive of A4 acting as an Anosov diffeomorphism commuting with ι"; clause (c) applied to dim X |
| 4.15 | l.516 | "the fixed points of ι are the points at which the algebra reduces" |
| 4.16 | ll.521, 525, 529 | "let the algebra at a point be the subalgebra of ℍ fixed by the stabiliser of that point, ι acting as conjugation and the drive as the order-three inner automorphism Ad_w"; "The principle is A4 read on A3: order has nothing to act on where nothing moves"; "the local form of ι at such a point is the inner automorphism by the surviving unit". Acknowledged as "a definition rather than a computation" (l.536), not numbered |
| 4.17 | ll.613, 619, 621 | "The time–space block T × Σ carries the quaternionic structure with the drive along T"; "A3 places the full algebra with its four corners on F"; "A3 would carry no information on F" used as a ground of exclusion |
| 4.18 | ll.653, 712 | "F = base × T²/ℤ₂"; "ℂP² × S² × T²": the base is the product of the two orbits and nothing else |
| 4.19 | ll.661, 693 | "If a Spin^c structure selects one unit i"; "the almost-complex structure of A3's selected unit" |
| 4.20 | ll.677, 685 | "Let the three imaginary units be made complex-valued by the Spin^c line … and let the symmetry preserving the induced Hermitian form and the Spin^c phase be U(3)"; "Two readings enter and are named: that complexification is forced …; and that the geometry records directions rather than vectors". Named, not numbered. (The first is now the tenth choice, P92.) |
| 4.21 | l.712 | "the canonical structure has zero on the torus" |
| 4.22 | ll.717–725 | Definition 7.4: a twist is 𝒪(D) "of a divisor D = Σ aᵢPᵢ on the corners, with aᵢ ≥ 0"; "A state of the fibre at rest is a holomorphic section of the twist"; "The structure of a twist is its flux together with its corner signs up to the overall sign … It is this that clause (ii) of Definition 2.1 speaks of"; "This is the reading of Definition 2.1(iii)". The second numbered choice says only that an object is "a state of the internal piece at rest" (l.163) |
| 4.23 | l.763 | "the states of clause (iii) being states on the pillowcase for one of the two lifts of the fold" |
| 4.24 | ll.817, 536 | "Naming the corners so that it is P₄"; "The labelling of which cycled corner carries which unit is a convention" |
| 4.25 | ll.837, 847, 865, 873, 887 | "The lifted fold being one structure on the whole geometry"; "that every symmetry is given one is a hypothesis of this paragraph"; "We ask that the assignment move the three lines … with no condition on signs"; "The larger group is an object that nothing requires" |
| 4.26 | l.894 | "That the clause is applied to the step is a choice of what the clause is applied to, and is recorded as such." |
| 4.27 | l.943 | "the loop of Definition 2.3 is supplied by the time circle"; "Σ = S³ = Sp(1), the unit quaternions, and the block is modelled on ℍ^×" |
| 4.28 | ll.264, 271 | the count of drives ("Neither part is derived … both are declared here"). Inside clause (a), so arguably inside the seventh choice; listed for completeness |

**A's list of terms used and not defined in ll.58–947 (its 7.10):** "energy functional", "stationarity conditions", "structure data", "orbifold data", "flux integers" (l.258); "Sol", "S¹_Sol" (l.300); "corner fibres" (l.458); "the base" (first at l.220); "scale-freeness of A3" (l.685); "Spin^c phase" (l.677); "A3's selected unit" (l.693); "Q_c", "Q_w" (l.707, before l.934); "ψ", "ω" as names of the periods (l.602); "M" for both the manifold (l.148) and the return map (l.277).

### 11.10 Why the integer on S² is two: the sphere's own winding, by hand (Decision Log P97(1), P99)

The PI (P99): "there was already a read back - we could write as to why it is 2". The reason, for the new version of M1.

1. **M1's rule (READ).** On ℂP² the structure taken is the one the complex structure gives, with determinant line the anticanonical line K⁻¹ and "no further datum" (ll.693, 703, 918); on the torus the same rule gives zero (l.712); every other choice is this one twisted by a line E, "an object that nothing requires", which clause (b) removes.
2. **The rule applied to S².** The sphere is the complex projective line. Its anticanonical line K⁻¹ is its holomorphic tangent line. So the integer M1's rule gives is the degree of the tangent line of the sphere.
3. **That degree is two (CHECKED, by hand, in full).** Cover the sphere by the coordinate z and the coordinate w = 1/z. Take the vector field ∂/∂z. In the z-chart it has no zero and no pole. In the w-chart, since dw/dz = −1/z² = −w², it is ∂/∂z = (dw/dz) ∂/∂w = −w² ∂/∂w: holomorphic, with a zero of order two at w = 0 and no other. A holomorphic section with exactly two zeros, counted with their order, and no poles: the degree is two. Cross-check: the same count for ℂP² is c₁ = 3 (l.683), and two is the Euler characteristic of the sphere, which M1 uses at l.949.
4. **The other candidates.** Zero would be K⁻¹ ⊗ E² with E of degree −1: a twisting line. Four would need E of degree +1. Each adds an object; clause (b) removes it. Hence two.
5. **What is taken as known and not read at source:** that the degree of a holomorphic line on the sphere is the number of zeros less the number of poles of any of its meromorphic sections; and that the canonical Spin^c structure of a complex manifold has determinant K⁻¹, which M1 already cites (l.703; Lawson–Michelsohn and Friedrich, not obtained: `STEP_AUDIT.md` §9.3). With no further sources (P97(3)), the new version declares these two as standard facts with their citations, or closes the first by hand.

**Failure test.** A holomorphic vector field on the sphere with a number of zeros other than two; or a later paper that needs no flux through S².

### 11.11 J2 taken up with the PI (12 November 2026): the torus and the drive

**Standing (Decision Log P103, P104).** The readings at source, the hand proofs (i)–(iii) and the computations of this section stand. The marks GAP in its table, and the two "Bearing" sentences, were reached by judging the node apart from the rest of the paper and the axioms; the PI rejected that method and they are withdrawn as verdicts on M1 (the architect was wrong). The rows remain as the list of sentences of J2 to be taken by the method of P104: the paper first, then the PI.

**Direction (PI).** The session put eleven numbered assumptions on J2; the PI: "all confirmed - proceed". **Read:** as the handover of 11 November lists; Newhouse 1970 in full (text layer; pp. 761–762 also as page images); Dathe 2010 pp. 17–28 (p. 25 also as an image); Burns–Rapoport 1975, first page and p. 255, text layer only. **Red flags:** `J2_sources_from_chat.md`, two hits, both in its from-memory passages, which are used for nothing; of the sixteen hits on canon (§11 above), l.229 lies in the lines J2 consumes ("we take the axiom to exclude that": a reading of A4, unnumbered, A's 4.7).

**The step table for J2. Written before the blind reader of `J2_COVER_LEAD.md` reported.** J2 is divided into the five parts the PI confirmed (assumption 11). "First hypothesis" in every GAP row: the reading is wrong.

| # | Step | Mark | Note |
|---|---|---|---|
| J2-a | The flow of Definition 2.9, on T × F (l.232; F eight-dimensional, l.617), is one map of a two-dimensional fibre X, repeated: "its return map" (l.277) | **DECLARED in the text, unnumbered** (A's 4.9); as a derivation, GAP | Nothing read derives it from l.232. l.235 gives a reason for placing the flow on T with F and none for a return map on one fibre |
| J2-b | The return map is an Anosov diffeomorphism (l.501) | **GAP** | Asked by Proposition 5.5 as a hypothesis; not among the hypotheses of Theorem 8.1 (l.967); l.235 says "is not assumed; Section 4 derives it"; Proposition 4.1 derives hyperbolicity for a linear map of a torus only (ll.277–290). Whether it can be derived from Definition 2.9 with the other hypotheses of Proposition 5.5 is the lead under test (`J2_COVER_LEAD.md`) |
| J2-c | The return map commutes with ι (l.501) | **GAP** | A hypothesis of Proposition 5.5 only. ι is the involution of A2, placed by Definition 2.4(iii) on "the warped piece" (l.190); no line says the drive of A4 commutes with it. Once the map is linear and ι is z ↦ −z it holds of itself; before that it is asked |
| J2-d1 | An Anosov diffeomorphism of a compact surface "lives on T² and is topologically conjugate to a hyperbolic linear automorphism" (l.505, citing Franks 1970) | **Verified reference available, with one step CHECKED by hand** | Franks 1970 is not read (V-10, SECONDARY ONLY). Newhouse 1970, p. 762, Corollary (1.3), READ: "Any codimension 1 Anosov diffeomorphism is topologically conjugate to a toral automorphism"; standing hypotheses p. 761: M compact, connected, C^∞, without boundary; f of class C^r, r ≥ 1. It rests on his Theorem (1.1), quoted from Franks's thesis, not read. The step from "surface" to "codimension 1" is hand proof (i) below |
| J2-d2 | "the drive is a hyperbolic element of SL₂(ℤ)" (l.501); "an element M ∈ SL₂(ℤ)" (l.277); "The trace is taken positive" (l.295) | **GAP, three parts** | (i) The source gives a map conjugate by a homeomorphism to a linear one, not a linear one. (ii) The source's toral automorphisms have det = ±1 (Newhouse p. 761, READ); determinant +1 is not derived. The Fibonacci matrix has determinant −1, is hyperbolic and commutes with −I (CHECKED, S6; hand proof (iii)); M1 l.379 sets it aside as "not an element of SL₂(ℤ)". (iii) l.295 rests the positive trace on the fold being z ↦ −z, a result of Section 5, against l.277 ("nothing in the present section is used there") |
| J2-e | "a set of periodic points of measure zero" (ll.229, 232); "its periodic points are exactly the rational points, which have measure zero" (l.290, citing Katok–Hasselblatt) | The measure: **not named, GAP of wording**. For a linear hyperbolic map: **CHECKED by hand** (ii) | Katok–Hasselblatt is not read (V-23). The entropy, log \|λ\| (l.290), stays on that unread source |

**Hand proofs, in full.**

(i) *On a surface an Anosov diffeomorphism is of codimension one.* With Newhouse's definition (p. 761): TM = E^s ⊕ E^u, ‖Tfⁿv‖ ≤ cλⁿ‖v‖ on E^s and ‖Tf⁻ⁿv‖ ≤ c′λⁿ‖v‖ on E^u, 0 < λ < 1. Suppose E^s = 0, so E^u = TM. Take N with c′λᴺ < 1. Then f⁻ᴺ shortens every curve by the factor c′λᴺ, so d(f⁻ᴺx, f⁻ᴺy) ≤ c′λᴺ d(x, y). M is compact and connected and not a point, so its diameter D > 0 is attained at some x, y; f⁻ᴺ is onto, so x = f⁻ᴺx′, y = f⁻ᴺy′ and D = d(x, y) ≤ c′λᴺ d(x′, y′) ≤ c′λᴺ D < D. Contradiction. Likewise E^u = 0 with fᴺ. On a surface both bundles are therefore lines.

(ii) *The periodic points of a hyperbolic A ∈ GL₂(ℤ) on ℝ²/ℤ² are the rational points.* Aⁿv ≡ v means (Aⁿ − I)v ∈ ℤ². Aⁿ − I is an integer matrix, and it is invertible over ℚ because the eigenvalues of Aⁿ are λⁿ and ±λ⁻ⁿ with \|λ\| ≠ 1, so 1 is not one of them. Hence v ∈ (Aⁿ − I)⁻¹ℤ² ⊂ ℚ². Conversely the points with denominator q are finitely many and A permutes them, so each is periodic. The rational points are countable, so they have Lebesgue measure zero, and measure zero for any measure without atoms. (For M₀, det(M₀ⁿ − I) ≠ 0 for n ≤ 40: `checks/j2_cover_check.py`, S4.)

(iii) *Least spectral radius.* For det = +1 and trace t the map is hyperbolic exactly when \|t\| ≥ 3, with spectral radius (\|t\| + √(t² − 4))/2, increasing in \|t\|: least φ² at \|t\| = 3. For det = −1 the eigenvalues are (t ± √(t² + 4))/2, real, of product −1; they have modulus one exactly when t = 0; otherwise the spectral radius is (\|t\| + √(t² + 4))/2, least φ at \|t\| = 1. So among hyperbolic integer matrices of determinant ±1 the least spectral radius is φ, at determinant −1 and trace ±1: the Fibonacci matrix and its conjugates and negatives. (S6.)

**Failure test of this table.** J2-a, J2-b, J2-c: a line of M1 before l.501 that derives the return map, "Anosov" or the commutation from Definition 2.9. J2-d1: Newhouse's Corollary (1.3) carries a hypothesis not quoted here. J2-d2: a line of M1 that derives determinant +1. J2-e: a line that names the measure.

**The lead tested (12 November 2026; `J2_COVER_LEAD.md`).** Protocol and prediction fixed first; the architect's script (`checks/j2_cover_check.py`) and a blind reader given the mathematics alone (`checks/j2_cover_blind.py`, re-run) agree on every point. A closed surface of genus three, the double cover of the torus branched at the four half-lattice points that M₀ carries to itself, has an involution with exactly four isolated fixed points and a lift of M₀ that commutes with it, has countably many periodic points, and is not Anosov; it is a homeomorphism, smooth except at four points. Its entropy is positive at the standing of M1's l.290 (not read). **Bearing on J2-b:** "Anosov" and the torus do not follow from Definition 2.9 with "smooth" left out and the other hypotheses of Proposition 5.5. Whether "smooth" excludes the example is not settled (that smooth models exist is RECALLED by both readers and enters nothing). **Bearing on J2-d2:** the least spectral radius among hyperbolic integer matrices of determinant ±1 is φ, at the Fibonacci matrix, of determinant −1 (CHECKED by both; hand proof (iii)); so the restriction to determinant +1 carries weight in the selection of the step.

**Not part of J2 and not marked here:** the hypothesis "exactly four isolated fixed points" (l.501, l.516), which is row T4(iii); row T19, which is J5; Burns–Rapoport p. 255 ("Since φ preserves a lattice and is orthogonal, it is of finite order", READ in the text layer), which bears on M-P74(iii) and so on J4.

### 11.12 J2: outcomes with the PI (12 November 2026; Decision Log P109–P115)

Each part ends as one of the three outcomes of P104. The statements are in `WRITE_LOG.md` and are not restated here.

| Part | Outcome | Where |
|---|---|---|
| J2-a | Restored from the paper for the one map repeated (canon ll.163, 175, 235, 277, 845), confirmed by the PI. For the rest of the internal piece: the ground stated by the PI, a declared choice | P114, M1-W009; P111, M1-W004 |
| J2-b | The ground stated by the PI: the torus by the least number of handles, clause (c) with an item added. "Anosov" is no longer a hypothesis of Proposition 5.5 | P110, P115 (R1 confirmed in words); M1-W002, M1-W003 |
| J2-c | Restored from the paper (canon ll.127, 187, 295) with one hand step, confirmed by the PI. "Commuting with ι" is no longer a hypothesis of Proposition 5.5 | P114; M1-W008 |
| J2-d1 | The citation of Franks at l.505 is no longer a premise of the torus | P110 |
| J2-d2(i) | The ground stated by the PI: the step is the linear map, a declared choice | P112; M1-W005 |
| J2-d2(ii) | The ground stated by the PI: a step keeps the handedness, determinant +1 | P109; M1-W001 |
| J2-d2(iii) | Restored, nothing to change; the "against" of §11.11 was a misreading (the architect was wrong); confirmed by the PI | P114 |
| J2-e | The ground stated by the PI: M1 does not speak of measure; the clause leaves Definition 2.9; the periodic points are stated exactly | P113; M1-W006, M1-W007 |

**Marks of the new steps.** M1-W001: DECLARED (a step keeps the handedness), determinants CHECKED by hand, READ canon l.389 for the name of the certificate. M1-W002: DECLARED. M1-W003: CHECKED by hand (the count of cells); three facts on surfaces taken as known and not read at source, to be entered in Verified References before the paper prints them. M1-W004, M1-W005: DECLARED. M1-W006: DECLARED, with READ (canon ll.286, 288) that Proposition 4.1 does not use the clause removed. M1-W007: CHECKED by hand (§11.11, proof (ii)). M1-W008: READ, with the step to fι = ιf CHECKED by hand. M1-W009: READ. Bredon's formula (V-21, PARTIAL) is not used by M1-W003.

**Leads, entering nothing (RECALLED, unread):** that an Anosov map of the torus is the linear map of its matrix after a continuous relabelling (Franks; Manning); that no map of the torus with a given matrix on its loops has less entropy than the linear one (Manning); that each handle of a surface adds two classes of loops.

### 11.13 J5: outcomes with the PI (12 November 2026; Decision Log P116, P117)

**Method:** P104. The lines of canon M1 v6.3 searched out and shown to the PI in full: ll.262, 264, 266, 268, 271, 277, 440, 977, 979, 863, 865 (the order of the clauses); ll.501, 511, 513, 572, 576, 235, 615, 650, 1009, 1010, 992 (the dimension of the fibre). No counter-example was looked for and no reader was launched. The statements are in `WRITE_LOG.md` and are not restated here. The division into parts is the architect's, confirmed by the PI with the assumptions (P116).

| Part | The sentence of the audit | Outcome | Where |
|---|---|---|---|
| J5-a | Clause (c) is applied at l.513 to the dimension of the fibre, where l.268 names the total dimension of M (row T5); with it, carried from J2, why the fibre is a surface at all | The ground stated by the PI: the least dimension of the fibre is an item of clause (c) of its own. That no such fibre has dimension less than two is closed by hand | P116, P118; M1-W010, M1-W013 (which retires M1-W011) |
| J5-b | Clause (c) gives the torus before clause (a) is used on the drive, against "applied in order" (l.262; row T19) | The ground stated by the PI: the order is one of priority, and each clause is applied wherever the derivation reaches a datum of which it speaks. On the drive the paper's own lines say that (a) and (c) select alike (ll.271, 440) | P117; M1-W012 |
| J5-c | Clause (c) is used before clause (b) in Theorem 6.1 (reader A, §11.4 row T19) and in Corollary 7.8 (ll.863, 865; §11.4 row T11) | The same ground. Corollary 7.8: l.865, restored from the paper, says that (b) makes the same selection. Theorem 6.1: no line says that (b) would not select differently; carried to J3 (existence), confirmed by the PI | P117; M1-W012 |

**Marks of the new steps.** M1-W010: DECLARED. M1-W013 (P118; it retires M1-W011, whose statement left unstated that the fold is continuous, that the fibre is a manifold, the case ι(x) < x, and that the identity is excluded; found by a fresh reader, the architect's wording at fault; argument and conclusion unchanged; M1-W013 itself not checked by a fresh reader): CHECKED by hand in full (dimension zero; dimension one, by the open arc); two facts taken as known and not read at source, that a compact connected one-dimensional manifold without boundary is a circle and that a connected manifold of dimension zero is a point, to be entered in Verified References before the paper prints it; it rests also on the hypothesis "exactly four isolated fixed points" (row T4(iii), not part of J5). M1-W012: DECLARED, with READ (canon ll.271, 440, 865) for the places at which two clauses select alike. M1-W002 is retired by M1-W010 and M1-W011 by M1-W013; M1-W003 is flagged (P116, P118) and its statement is unchanged.

**Red flags (gate 7).** Canon: 16 hits, at ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 (two), 806, 1049 (re-run this session). None is at a line shown for J5 or cited by M1-W010 to M1-W013: ll.178, 235, 253, 262–271, 277, 440, 501–516, 572–576, 615, 650, 863, 865, 977, 979, 992, 1009, 1010. `WRITE_LOG.md` (re-run after M1-W013): 6 hits, at ll.34, 58, 102, 113, 146, 168, each "by hand" in a mark.

**Failure tests.** As in the entries. Of this table: a line of canon M1 that derives the dimension of the fibre from the least total dimension; or a line that says the three clauses are three sieves in strict sequence and uses them so.

**Carried, no proposal made.** To J3: whether clause (b) would select differently at Theorem 6.1. To J10 (the architect's view): the hypothesis "exactly four isolated fixed points". To the build: the lines that change with the entries (canon ll.262, 268, 271, 501, 513, 992 and the proof of Proposition 5.5); the unread fact on one-dimensional manifolds. Noted and not looked for: no reason is given in the paper for clause (a) before clause (b), and no place where the two meet was found.

### 11.14 J9: outcomes with the PI (12 November 2026; Decision Log P119, P120, P121)

**Method:** P104. The lines of canon M1 v6.3 searched out and shown to the PI in full: ll.187, 193, 209, 449, 453, 455, 458, 461, 465, 467, 469, 471, 489, 546–552 (Lemma 5.1 and Proposition 5.2); ll.211, 214, 217, 536, 566, 611, 693, 837, 871 (Definition 2.7; these are the lists of P119). Quoted to the PI afterwards, in whole sentences or in the clause used, when the PI asked for the whole context of l.214 (P120): ll.239, 442, 607, 619, 728. No counter-example was looked for and no reader was launched. Reader B's example (M₂(ℝ) with the transpose, §11.3 row E7) stands as a computation and was not taken further (P105). The statements are in `WRITE_LOG.md` and are not restated here. The division into parts is the architect's, confirmed by the PI (P121).

| Part | The sentence of the audit | Outcome | Where |
|---|---|---|---|
| J9-a | Which anti-involution Lemma 5.1 means (l.449); "J9 is wrong if the text restricts the anti-involution before Lemma 5.1" (§11.5) | Restored from the paper and confirmed by the PI: l.193 names it "the operation of conjugation" before the lemma, l.489 again, and the worked case ll.546–550 states N(x + yu) = x² − u²y² (l.546) and uses it for u = i (l.548) and for j² = +1 in the split algebra (l.550); the formula holds exactly when the flip sends u to −u (CHECKED by hand: if u* = −u then (x + yu)(x − yu) = x² − u²y²; conversely (x + yu)(x + yu*) = x² + xy(u + u*) + y²uu*, and if this is x² − u²y² for all real x, y then at y = 1 the expression x(u + u*) + (uu* + u²) vanishes for every x, so u + u* = 0; the converse was supplied by the fresh reader and re-checked). The restriction is written into the lemma: the fixed elements are exactly the real multiples of 1 | P119 (R7), P121; M1-W014 |
| J9-b | "N(a) = aa* takes values in the fixed set of *" (l.449) against a⁻¹ = a*/N(a) (l.467), which needs N real | Restored with J9-a: the fixed set is the real numbers, so N is real | P119, P121; M1-W014 (M1-W015 uses it) |
| J9-c | "every corner subalgebra" (l.449) and "the corner fibres" (ll.458, 467) before Proposition 5.3 counts the corners | The ground stated by the PI: no table is assumed; closure is asked of every u ≠ 0 with u* = −u; the step by Frobenius (canon l.469) is unchanged. **Standing of the confirmation:** the PI's words on the read-back are "and Q2 becomes (i) not (ii)", which name the question and not R8; the architect took them as confirming R8-(i); the printed statements were then confirmed word for word (P121) | P119 (R8-(i)), P121; M1-W014, M1-W015 |
| J9-d | The two levels of Definition 2.7 (l.214; `COMMUTANT_LEAD.md` §4; §11.4 item 7; Corpus Errors 32(o)) | The ground stated by the PI: the words "as the algebra generated by the Clifford action" leave the definition. READ: they occur once in canon and no result uses them | P120, P121; M1-W016 |

**Marks of the new steps.** M1-W014: CHECKED by hand in full (the decomposition a = x + u; u² real; N = x² − u²; the unit group compact exactly when u² < 0; both directions of the equivalence); DECLARED for the reading that ι acts on the fibre algebra as such an anti-involution (row T4(i); numbering at J10). The hypothesis that the algebra has a unit is written in; canon l.209 does not state it. M1-W015: DECLARED for the reading of A1's closure on the unit groups (row T4(ii); numbering at J10); the two-sided inverse CHECKED by hand; Frobenius is V-15 (READ per §9 of this file, l.283). M1-W016: DECLARED (a definition), with READ for the places at which each half of the definition is used. A fresh reader then checked the three entries and this section (see "Fresh reader" below).

**Standing of `COMMUTANT_LEAD.md` §4 after P120.** The computation stands (CHECKED there by two scripts: on the flat model, one tangent space ℝ¹² = ℍ³ with I, J, K multiplication by i, j, k on one side, the three carried to spinors through the Clifford action generate an algebra of dimension 30 and do not obey the quaternion relations). With the phrase removed, Definition 2.7 does not say that the fibre algebra is what the Clifford action generates, and the computation is against no printed sentence (the architect's consequence, P120). M1-W016 does not say how the fibre algebra acts on spinors. Canon speaks of elements acting on spinors at ll.536, 566, 728, 837; l.536 calls the identification of the lift on spinors with the reading on the algebra "a definition rather than a computation", and l.865 states as a hypothesis "that every symmetry is given one"; ll.566 and 728 state no hypothesis.

**Red flags (gate 7).** Canon: 16 hits, at ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 (two), 806, 1049 (re-run this session). Of the lines shown for J9: l.209 (the hit is "bounded below", in the sentence on the uncertainty relation, not the sentence J9 uses); l.239 (the hit is "Every result below", not the clause on Definition 2.7); l.728 (two hits, "up to the overall sign" and "the counts below", beside the sentence on the fold acting on spinors, which M1-W016 cites only as a place of use). `WRITE_LOG.md` (re-run after M1-W017): 9 hits, each "by hand" in a mark (eight at ll.34, 58, 102, 113, 146, 168, 179, 190 when run after M1-W016; the ninth is in the mark of M1-W017).

**Failure tests.** As in the entries. Of this table: a line of canon M1 under which the flip of the algebra leaves unchanged a direction other than the real numbers; or a result of M1 that uses the phrase removed from Definition 2.7.

**Carried, no proposal made.** To J10: the numbering of the two readings (l.449's parenthesis; l.467's reading of A1). To the build: canon ll.453–455 (the lemma's proof), ll.458, 471 and 546–552 ("corners", the split quaternions), which are reworded with M1-W014 and M1-W015; row E7 of the elimination table; the header of the Lean file L2 if it names the lemma; the tenth choice (P92) in the wording of Definition 2.7; canon l.209, which says the algebra is finite-dimensional and associative and does not say it has a unit.

**Fresh reader (12 November 2026, after P121).** Given CLAUDE.md, the handover's section "The next session", `WRITE_LOG.md`, this file ll.270–291 and from §11.5, `COMMUTANT_LEAD.md`, canon, Decision Log P104, P105, P116–P121 and Corpus Errors entry 32; asked to check the record against its sources and the hand computations as computations, and not whether any result holds. Twelve findings, three to be fixed before use. It found every written step of the hand checks of M1-W014 and M1-W015 correct. (1) The statement of M1-W014 uses and does not state that the anti-involution is real-linear; smaller: that 1 ≠ 0, that 1 and u are independent, and in which sense the unit group is compact. The PI confirmed that statement word for word, so it is not changed by the architect: a corrected wording was put to the PI and confirmed (P122): it is M1-W017, which retires M1-W014; M1-W015 is flagged and now rests on M1-W017. M1-W017 was not itself checked by a fresh reader. R8-(i) was confirmed in the PI's words in the same row. (2) The list of lines shown, corrected above. (3) The confirmation of R8-(i), attributed above and in P119. The rest (the places of use on spinors; the "only if" of row J9-a; stale lines of the handover; an attribution; a contracted quotation; the two lists of what is carried) are corrected here, in the entries' marks and in the handover. The corrections were not checked again.

### 11.15 J6: outcomes with the PI (12 November 2026; Decision Log P126, P127, P128)

**Method:** P104. The lines of canon M1 v6.3 searched out and shown to the PI in full: ll.220, 223, 661, 665–671, 677, 681, 685, 687, 949, 953, 983 whole; of ll.127, 146, 163, 251, 266, 650, 653, 712, 992, 1012–1014, 1022 the whole sentences used. Cited to the PI by number and not shown in full: ll.255, 683, 1047; cited in the entries or as noticed in passing: ll.239, 521, 531. No counter-example was looked for and no reader was launched on whether a step holds. Reader B's example (the flag manifold of ℂ³, §11.3, question A) remains RECALLED and was not taken further (P105). The statements are in `WRITE_LOG.md` and are not restated here. The division into parts is the architect's, put as assumption 3 of the session; the PI confirmed the read-backs and gave no separate word on the division.

| Part | The sentence of the audit | Outcome | Where |
|---|---|---|---|
| J6-a | "U(3) is not the group Def 2.8 names" (§11.5; §11.1 row T8; §11.4 row T8): l.220 has "the symmetry group G of the fibre algebra", l.677 has U(3) | The ground stated by the PI, in the PI's word provisional, and entered at the PI's direction: a symmetry in Definition 2.8 is a linear map of the imaginary units, real or complex-valued, that keeps their length, and is not asked to keep their products. The paper's own description of the group at l.223 is "the rotations of the three imaginary units i, j, k among themselves" | P126; M1-W018 |
| J6-b | The words of Proposition 7.2 on which the orbit turns: "the induced Hermitian form", "and the Spin^c phase" (l.677); "the scale-freeness of A3" (l.685; reader A, §11.4 row T8: it "appears nowhere else") | The ground stated by the PI: "the scale-freeness of A3" is the absence of an overall size and no more; the words "the induced Hermitian form" and "and the Spin^c phase" leave the statement, the length of a complex-valued unit being stated in plain terms; that the phase is not recorded is a choice and is not derived. READ: "Hermitian" and "phase" occur once each in canon, at l.677, and no result uses either | P127; M1-W019 |
| J6-c | "Def 2.8 says 'piece', Props 7.1, 7.2 read 'factor'" (§11.3, question A) | Restored from the paper and confirmed by the PI: the paper uses "piece" for the things multiplied in a product (ll.146, 163). Definition 2.8 is printed with "factor" | P126; M1-W018 |
| J6-d | "that the base is the product of the two orbits and nothing more is asserted" (§11.5; §11.1 row T9; §11.4 row T9) | The ground stated by the PI: clause (b) of Definition 3.2 admits no further factor. The count 2 + 4 = 6 agrees with l.650. **Correction (the architect was wrong):** §11.1 row T9 says "No cited statement says that the realised orbits are exactly these two, or that the base is their product", and Corpus Errors 32(e) that it is "used (ll.653, 712) and not stated as a result"; Theorem 7.10 (l.949) states it, with the proof "Propositions … supply the factors" (l.953). The blind readers were not given those lines. What was missing is the reason there is nothing further | P128; M1-W020 |

**Marks of the new steps.** M1-W018: DECLARED (a definition; the sixth numbered choice; the sentence on symmetry provisional in the PI's word); READ canon ll.146, 163, 223; CHECKED by hand, in the entry's mark, that a map of ℂ³ keeping the length need not keep the products. M1-W019: DECLARED (complex-valued units, the tenth choice; the direction recorded and not the unit; the phase a choice); READ for the single occurrences of "Hermitian", "phase" and "the scale-freeness of A3" and for ll.255, 665, 667, 681, 683; CHECKED by hand that with the size alone not recorded what is left is the five-sphere and not ℂP²; **taken as known and not read at source:** that U(3) carries any complex line of ℂ³ to any other, that the maps carrying one line to itself are U(1) × U(2), and that U(3)/(U(1) × U(2)) = SU(3)/U(2). M1-W020: DECLARED (clause (b)); READ canon ll.266, 650, 653, 949, 953.

**Not claimed by any of the three entries, and reported to the PI in passing (P105), not pursued.** Definition 2.8 does not say which selected structures it speaks of; canon ll.521, 531 fix other things on the fibre algebra (the three corner lines; the element w). M1-W020 supposes that a unit and a complex direction are the only ones. What selects the complex direction is not said in M1-W019. Also noticed: l.223 says the other possible reading of Definition 2.8 is set out in Section 7, and it is at l.992, in Section 8; and the architect could not tell what "the base is then determined among products only" (l.992) claims.

**Said to the PI on the other reading of "symmetry" (the architect's reading; a premise of nothing).** If a symmetry had to keep the products, the rotations, a group of dimension three (taken as known, not read at source), could not carry one complex line to every other in a space of four dimensions. Clause (b), "a structure group larger than is needed" (l.266), can be heard against U(3); the PI's answer to Question 1 is given as provisional.

**Red flags (gate 7).** Canon: 16 hits, at ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 (two), 806, 1049 (re-run this session). Of the lines shown for J6: l.677 ("the Spin^c line of Proposition 7.3 below", the forward reference that J1's tenth choice removes and M1-W019 no longer prints). `WRITE_LOG.md` (re-run after M1-W020): 12 hits, each "by hand" in a mark (the nine of §11.14 and three in the marks of M1-W018 and M1-W019).

**Failure tests.** As in the entries. Of this table: a line of canon M1 that says the symmetries of Definition 2.8 keep the products; a result of M1 that uses the Hermitian form or the Spin^c phase of l.677; a line that requires a third factor of the base.

**Carried, no proposal made.** To J10: the numbering of the readings that M1-W019 declares (the direction and not the unit; the phase), reader A's 4.20, and of "the base is the product of the two orbits and nothing else", A's 4.18. To J8: rows E11 and E13 of the elimination table. To the build: canon ll.220, 677, 685 and the proof of Theorem 7.10 (l.953) change with the entries; l.661's "If a Spin^c structure selects one unit" and l.681's "the maximal torus of U(3)" are read again with them; the fact on U(3)/(U(1) × U(2)) is closed by hand or entered in Verified References; the cross-reference at l.223; the tenth choice still has no entry in the write-up log.

**Fresh reader (12 November 2026, after P128; its run overlapped the commit 881e4c5).** Given CLAUDE.md, the handover's section "The next session", `WRITE_LOG.md`, this file from §11.5, canon, Decision Log P104, P105, P126–P128, Corpus Errors entries 32 and 33 and `tools/ROSETTA_STONE.md`; asked to check the record against its sources and the hand computations as computations, and not whether any result holds. Twenty-two findings, three to be fixed before use. It found every quotation of canon in the entries word for word at its line, the single occurrences of "Hermitian", "phase" and "scale-freeness" as stated, the counts and numbers consistent, and every written step of the two hand checks correct. (1), (2) The read-backs R9–R11 lacked more of the items of CLAUDE.md §3 than P127 and P128 disclose (none has "any conflict with earlier statements or rulings"; R10 has no "which results would rest on it"); recorded in Decision Log P130 and in the handover. (3) The statement of M1-W018 says "a linear map" without saying over which numbers, and "their length" without saying what it is. The PI confirmed that statement word for word, so it is not changed by the architect: a corrected wording is put to the PI. The rest (what the two hand checks use without stating; what the statements of M1-W019 and M1-W020 use without stating; a wrong line for a quotation; a paraphrase in quotation marks; the list of lines shown; the three wordings of the correction; stale lines of the handover; two Rosetta rows) are corrected here, in the entries' marks, in the handover and in the Rosetta stone, or recorded in P130. The corrections were not checked again.

**After the reader (P131).** The corrected wording of Definition 2.8 was put to the PI and confirmed: it is M1-W021, which retires M1-W018; M1-W019 and M1-W020 are flagged and now rest on M1-W021. In the table above read M1-W021 for M1-W018. M1-W021 was not itself checked by a fresh reader. `WRITE_LOG.md` red flags, re-run after M1-W021: see the handover, item 19.

### 11.16 J11: outcomes with the PI (12 November 2026; Decision Log P134)

**Method:** P104. The lines of canon M1 v6.3 searched out and shown to the PI in full: ll.158, 161, 714, 719, 725, 763, 765, 781–789 whole; of ll.127, 163, 583, 653, 992, 1026 the sentences or clauses used. Read besides, as the work needed: this file ll.175–226 (§8, §8a); `MEFProof/Paper_M1/M1_L6_twist.lean` ll.1–105; and, with the PI's leave, `SHADOW_TWO_CLAUSES.md` whole. P34 was not read. No counter-example was looked for and no reader was launched on whether a step holds. The statements are in `WRITE_LOG.md` and are not restated here. The division into parts is the architect's, confirmed by the PI with the outcomes (P134).

| Part | The sentence of the audit | Outcome | Where |
|---|---|---|---|
| J11-a | "The least flux is two or three according to the reading of clause (iii)" (§11.5; §11.1 row T12; §11.4 row T12): which states clause (iii) counts | Restored from the paper and confirmed by the PI: the fibre is the pillowcase (canon ll.127, 583, 653), $E$ is "the covering torus of the pillowcase" (l.714), and Proposition 7.6 (ll.763, 765, 785), l.1026 and the certificate (`M1_L6_twist.lean` ll.45–46) count on the pillowcase. The PI: "states counted on the pillowcase confirmed" | P134; M1-W022, M1-W023 |
| J11-b | Canon l.725 words the reading of clause (iii) in "states of the fibre at rest", a name that l.719 gives to functions on the covering torus, where l.763 has "states on the pillowcase" (Corpus Errors 32(m)) | The ground stated by the PI and written in full: the two paragraphs of Definition 7.4 are reworded. Proposition 7.6 and Definition 2.1(iii) are unchanged | P134 (R12); M1-W022, M1-W023 |
| (C) | Raised by the PI in the session, from the ruling of J2 that the torus is carried round time (P109, P111, P114), and taken in the hearing the PI chose: "(C) The fibres at the different moments of time are joined into one object. A structure on the fibre must come back to itself once round the circle." | Restored from the paper, nothing printed differently: canon l.837 ("The lifted fold being one structure on the whole geometry"), l.847, and M1-W009. Its numbering is J10 (reader A's 4.25) | P134 |

**The computation behind row J11 of §11.5, re-checked by hand from Lemma 7.5 as stated (canon l.731).** At flux two with $D=P_i+P_j$, $i\neq j$: two states at rest (7.5(a)); the first lift keeps $1+0+0+0+0=1$ and the second $2-1=1$ (7.5(b)); the corner signs are two of each kind, neither all alike nor with one odd sign at $P_1$, so one step does not carry them to themselves (7.5(c) as stated; l.755 in its proof). Counted on the covering torus both clauses are met at flux two, and not below: at flux one there is one state (7.5(a)); at flux zero a half-turn twist has no state at rest (7.5(d)) and the trivial line fails clause (ii) (l.771); counted on the pillowcase clause (iii) fails there, and the least flux is three (`L6_least_flux`). This agrees with §11.4 row T12, with canon l.785 and with `SHADOW_TWO_CLAUSES.md` rows G3 and G4.

**Marks of the new steps.** M1-W022: DECLARED (part of Definition 7.4, which is not among the numbered choices; numbering at J10); READ canon ll.127, 583, 653, 714, 719. M1-W023: DECLARED (the reading of Definition 2.1(iii)); READ canon ll.158, 161, 163, 725, 763, 785 and the certificate's ll.45–46; CHECKED by hand as above.

**Standing under "Blind" (CLAUDE.md §5).** `SHADOW_TWO_CLAUSES.md` §4 (READ) discloses that the count on the covering torus was seen first, gave two, and the pillowcase was counted after; §8 of this file repeats it. The ground that does not depend on the answer is that the paper's fibre is the pillowcase. The ruling is the PI's (P34(2) per §8; confirmed again in P134).

**Red flags (gate 7).** Canon: 16 hits, at ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 (two), 806, 1049 (re-run this session). At the lines used for J11: l.714 ("The counts below") and l.719 ("the statements below"), forward references, the second kept in M1-W022 as canon has it; ll.723, 728 ("up to the overall sign"), beside the paragraphs reworded and not in them. `SHADOW_TWO_CLAUSES.md`: 3 hits, at l.17 ("is standard and RECALLED", of the states being those of the twisted Dirac operator, which canon l.728 gives as motivation only), l.35 ("by hand") and l.46 ("not below", in the sentence on the freedom of the lift, which is J10).

**Failure tests.** As in the entries. Of this table: a line of canon M1 under which the fibre of the shape is the unfolded torus and not the pillowcase; or a result of M1 that counts the states of clause (iii) on the covering torus.

**Carried, no proposal made.** To J10: "for one of the two lifts" (canon l.763; A's 4.23); that Definition 7.4 is unnumbered (A's 4.22); the hypothesis of Corollary 7.8 (A's 4.25). To the build: canon ll.719, 725 change with the entries; every line that says "state" or "state at rest" is read again with them: ll.161, 728, 731, 737, 741, 743, 765, 773, 777, 783, 785, 793 and 1049, l.161 above all (the mark of M1-W023).

**Fresh reader (12 November 2026, after P134; its run overlapped the commit 274d4d3).** Given CLAUDE.md, the handover's section "The next session", `WRITE_LOG.md`, this file ll.175–226 and from §11.5, canon, Decision Log P104, P105 and P134, `SHADOW_TWO_CLAUSES.md`, the certificate L6 and Corpus Errors entries 32 and 33; asked to check the record against its sources and the hand computation as a computation, and not whether any result holds. Sixteen findings, two to be fixed before use. It found every quotation of the PI and of canon word for word at its line, the counts consistent and every written step of the hand check correct. (1) The statement of M1-W022 says "The fibre is the pillowcase", where the active M1-W003 has "the fibre is therefore the torus": a conflict of wording between active entries that the architect did not find (P134 says none was found; the architect was wrong), canon having the same double use (ll.127, 277). With it, smaller: the added sentence says "the lift" without saying which. The PI had confirmed that statement word for word, so it was not changed by the architect: a corrected wording was put to the PI and confirmed (P136); it is M1-W024, which retires M1-W022; M1-W023 is flagged and now rests on M1-W024. **In the table above read M1-W024 for M1-W022.** M1-W024 was not itself checked by a fresh reader. (2) The list of lines to be read again at the build was incomplete; corrected above and in the mark of M1-W023. The rest (what the "Rests on" lines say changes from canon; "least" cited to a check that showed only flux two; a line of the lemma's proof cited for its statement; hearing (C) shortened; what the PI was not shown word for word; a line number; stale and inconsistent lines of the handover) are corrected here, in the entries and in the handover, or recorded in P136. The corrections were not checked again. `WRITE_LOG.md` red flags, re-run after M1-W024: see the handover, item 20.

### 11.17 J3 and J4: outcomes with the PI (13 November 2026; Decision Log P137–P140)

**Method:** P104. The lines of canon M1 v6.3 that J3 and J4 turn on were searched out and shown to the PI in full: for J3, ll.122, 125, 127, 143, 178, 187, 190, 193, 196, 964, 967, 992 and the table of which definitions the sections show; for J4, ll.163, 239, 255, 258, 602, 723, 964, 967, 992, 1013; for M-j, l.578. Nine numbered assumptions and six questions were put with them. The PI answered Q2 with a musing, which was checked against the ruling of J2 and recorded as a lead (P137); then ruled the warp (P138, read-back R13) and Question 3 (option (A)); the architect's wording of (A) was found to introduce a second flip, the PI directed that the whole context be checked and the English made consistent, and the correction and the two printed statements were confirmed (P139). The PI then directed that the axioms and minimality be applied to the remaining questions in turn, each answer consistent with the one before, with "not sure" wherever the answer was less than nine parts in ten clear; the architect reported its picks as readings, and the PI ruled them (P140). Rosetta translations were given at the PI's request for "warp", for Questions 2 and 3, for options (i-a) and (i-b), and for R13 with Question 3. No counter-example was looked for and no reader was launched on whether a step holds. The statements are in `WRITE_LOG.md` and are not restated here.

| Part | The sentence of the audit | Outcome | Where |
|---|---|---|---|
| J3-a | "Existence: no passage shows that M₁₂ satisfies Defs 2.1–2.9 and 3.2" (§11.5, row J3; §11.1, row T14) | The ground stated by the PI: the theorem claims existence, because the sixth axiom says that the one thing is. A2 is shown by M1-W026; that the operations on the fibres of $F$ are the quaternions is Proposition 5.2 (canon l.460, "Under A1, A2 and A3 the fibre algebra is the quaternions", tagged \rigD), the fibre algebra being the operations on the fibres of $F$ by Definition 2.5 (l.201; corrected 13 Nov 2026, P148: this read "Definition 2.3") **Corrected 13 Nov 2026 (P144, the fresh reader's check):** this read "that the operations on the fibres are ℍ is declared at canon l.536"; l.536 says "a definition rather than a computation" of the identification of the corner lift with the reading of ι on the algebra, not of the fibre algebra being ℍ. **One item truly open:** that the almost-quaternionic structure of Definition 2.7 exists on the whole twelve-dimensional shape; the architect reported it as not sure, and it is checked in the new version or declared there with its failure test (CLAUDE.md §6) | P140 (Q1) |
| J3-b | "Def 2.4 with Def 2.3 cannot hold as written (P74(i))", the clause on the warped product and which product is warped (§11.8, M-g, M-w, M-P74(ii)) | The ground stated by the PI and written in full: the warp is between time and the fibre torus, at one rate, closing through the drive | P138 (R12 is J11; here read-back R13), P139; M1-W025, M1-W026 |
| J3-c | Definition 2.4(ii) on a compact piece (§11.8, M-P74(i); found by both blind readers and by P74) | The same ground: the lengths are written out and close across the join exactly when e^{κL} = φ² (CHECKED) | P138, P139; M1-W026 |
| J3-d | Definition 2.4(iii), "ι*κ = −κ" for a constant κ (§11.8, M-f) | The same ground: the clause becomes the symmetry of the shape that swaps κ for −κ, which applied twice is the fold | P138, P139; M1-W025 |
| J4-a | "the functional is undefined" (§11.5, row J4; §11.1, row T15; §11.3, row E12; §11.8, M-i) | The ground stated by the PI: clause (b) removes the energy functional from Definition 3.1, and a modulus is a continuous datum the axioms and their readings leave free, apart from relabelling and overall size | P140 (Q4) |
| J4-b | "one proportion is declared and the others are neither fixed nor declared" (§11.8, M-list, M-sector) | The ground stated by the PI: one declared input covers the data the paper does not derive, with the failure test of canon l.992 | P140 (Q4) |
| J4-c | The aspect ratio: a flat torus has two shape numbers and none is kept by a step (§11.8, M-P74(iii)) | The ground stated by the PI: the lengths of M1-W026 fix the shape of the fibre at every moment, and the aspect ratio is no longer a declared input. **Not ruled, reported as not sure:** that nothing else on the fibre is free | P140 (Q5) |
| J4-d | "the base's torus is excluded for a datum of the kind the fibre is allowed"; row E12 not [R] (§11.5, row J4) | Restored from the paper with M1-W020: row E12 rests on Definition 2.8 and clause (b). Its tag is taken with J8 | P140 (E12) |
| M-j | "the worked example at l.578 is wrong as written" (§11.8, M-j; P77, sealed, read there) | Restored from the paper: the example stands and the word "stabiliser" is the slip; a point is special when the fold, or one step of the drive, leaves it in place, which gives exactly the four corners | P140 (Q6) |
| (lead) | The PI's musing on the growth law and the torus | Checked against J2 and found congruent in the form J2 has; recorded as a lead, a premise of nothing | P137 |

**The hand computations of this section, re-done here (CHECKED).** (1) A smooth w on a compact piece without boundary has a highest point, where dw/ds = 0, so κw = 0 and w = 0 there, hence w ≤ 0 everywhere; the lowest point gives w ≥ 0; so w ≡ 0, against ∇w ≠ 0 (§11.8, M-P74(i)). (2) The pull-back of a constant is the same constant, so ι*κ = −κ gives κ = 0 (M-f). (3) M₀² = (5 3; 3 2) sends (⅓, 0) to (5/3, 1) ≡ (⅔, 0), and ι sends that to (⅓, 0), so the point is fixed by ι∘M₀²; and a point of the torus is moved by every element of ⟨ι, M₀⟩ exactly when at least one coordinate is irrational, since M₀ⁿ − I and M₀ⁿ + I are invertible over the rationals (the eigenvalues of M₀ⁿ are φ^{±2n} ≠ ±1), the converse being M1-W007 (M-j). (4) A flat torus has two shape numbers, and no flat shape is kept by a step: M₀ᵀgM₀ = cg gives c = 1 by determinants, and then M₀ would have eigenvalues of modulus one (M-P74(iii)).

**The script.** `checks/j3_warp_check.py`, written for M1-W026 and kept: W1 (v₂ = Sv₁ is the other eigenvector, eigenvalue φ⁻²), W2 (the join keeps lengths exactly at e^{κL} = φ², tested there and at two other rates), W3 (the swap keeps the lengths), W4 (SM₀S⁻¹ = M₀⁻¹), W5 (the swap applied twice is the fold), W6 (the fold keeps the lengths and exchanges nothing), and the coordinate line. All pass.

**Red flags (gate 7).** Canon: 16 hits, at ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 (two), 806, 1049 (re-run this session). Of the lines used for J3 and J4: l.239 (the hit is "Every result below", a forward reference, in the sentence that also carries the declared input of J4-b); l.129 ("the smallest case is worked by hand"). `WRITE_LOG.md` (re-run after M1-W026): 19 hits, each "by hand" in a mark. `checks/j3_warp_check.py` is a script and is not scanned.

**Failure tests.** As in the entries. Of this table: a line of canon M1 that gives an energy functional, or that tests a datum for being a modulus; a line that fixes the warp elsewhere than between time and the fibre; a line under which the algebra at a point is what every power of the drive leaves in place.

**Carried, no proposal made.** To J7: what a geometry's data are, which J3 and J4 were to say; the data are now the factors, the discrete data, and the continuous data covered by the one declared input. To J10: the reading of M1-W025 and M1-W026 (where the growth sits), the reading of M1-W017's parenthesis ("composition run backwards", said of the fold, which is the swap applied twice), and the readings of §11.9 as before. To J8: the tag of row E12. To the build: canon l.190, l.127 (from "The symbol ×_w records"), the displays at ll.125 and 969, ll.258, 239, 967, 992, 602, 521, 533, 578, 1013 and 163; the printed wording of Definition 3.1, of the theorem's hypotheses, of Proposition 5.6 and of row E12, each owed to the PI; and the item left open at J3-a.

**Disclosure.** The architect noticed the likeness between the growth law and the drive's regluing of the torus, and wrote it under its own Question 2, before the PI's musing of P137; P137 says so. The architect's first wording of option (A) introduced a second flip and said that Section 5 would change; the PI directed that the whole context be checked, and the correction is P139: there is one flip, ι, and the second flip is withdrawn.

### 11.18 The one item left open by P140 (Q1): the almost-quaternionic structure on the whole shape (13 November 2026; Decision Log P142)

**Direction.** The PI: "a) try to close it by hand". The attempt did not close it; what it established, and what it did not, is below. Everything here is at the architect's hand unless a certificate is named.

| # | Statement | Mark | Ground |
|---|---|---|---|
| Q1-i | The Sol frame $E_0=\partial_s$, $E_1=e^{-\kappa s}v_1$, $E_2=e^{\kappa s}v_2$ is carried to itself by the join exactly when $e^{\kappa L}=\phi^2$ | CHECKED | `checks/j3_warp_check.py` W7, and by hand. Corroborates M1-W026 by a second route |
| Q1-ii | The frame does not descend to the pillowcase: the fold sends $E_1,E_2$ to $-E_1,-E_2$ and fixes $E_0$ | CHECKED | `checks/j3_warp_check.py` W8 |
| Q1-iii | $T\times\Sigma$ carries the structure globally: $\Sigma=S^3=\mathrm{Sp}(1)$ is parallelised by left translation; with the time direction this frames the block | CHECKED by hand | canon l.943 ($\Sigma=S^{3}=\mathrm{Sp}(1)$, "the block is modelled on $\Hquat^{\times}=\R_{>0}\times S^{3}$"), l.613 |
| Q1-iv | Under the grouping of the internal piece into $\CPtwo$ and $\Stwo\times(\Ttwo/\Ztwo)$, the two triples of canon l.621 cannot be matched: the obstruction is $w_2$, and $\CPtwo$ is not spin while $\Stwo\times(\Ttwo/\Ztwo)$ is | CHECKED by hand | canon l.699 (certificate `L4_not_spin_and_congruence`), l.705 |
| Q1-v | Whether some structure exists that respects no such grouping | **GAP, declared** | the obstruction computation in dimension twelve was not done; the standard facts it needs are RECALLED by the architect and unread (CLAUDE.md §4), and P97(3) forbids obtaining further sources |
| Q1-vi | In dimension two there is no almost-quaternionic structure: the only $J$ with $J^2=-1$ on $\R^2$ are $\pm J_0$, which commute | CHECKED by hand | used only to report that the literal reading of the PI's first statement was not available |

**Outcome (P142, R14).** The item is not closed and is **DECLARED** in the new version with its failure test, through write-up log M1-W031, which states why the paper does not need it closed: the structure carries information in exactly one place, the pillowcase, being automatic on the four-dimensional blocks and not constructed on the eight-dimensional internal piece. This is the first step of M1 declared because it could not be closed rather than because a choice was made.

**Red flags.** Not re-run: no new source was read for this item; the lines consumed (canon ll.520, 613, 615, 621, 699, 705, 943, 955, 969) are within the scan of §11.1.

**Failure tests.** Of M1-W031, as in the entry. Of this table: a construction of an almost-quaternionic structure on $\CPtwo\times\Stwo\times(\Ttwo/\Ztwo)$; a proof that none exists on $\Mtwelve$; a grouping of the eight dimensions under which the triples do match.

**Noticed in passing, reported in a sentence and not pursued (CLAUDE.md §5).** The obstruction at Q1-iv is the same non-spinness of $\CPtwo$ that forces $\Spinc$ at Proposition 7.3; the two are consistent and not in conflict.

**Disclosure.** The architect wrote "$\Stwo\times_{w}(\Ttwo/\Ztwo)$" in putting the clauses to the PI. Canon l.969 has $(\CPtwo\times\Stwo)\times_{w}(\Ttwo/\Ztwo)$: the base of the warp is the whole six-dimensional base. The subscript was constructed and not copied, the fault recorded at P139 repeated; the PI found it. The grouping of the eight dimensions into two fours is likewise the architect's and appears nowhere in canon; clause (iii) of R14 says so, and l.955 makes the clause independent of where the warp sits.

### 11.19 J7: outcomes with the PI (13 November 2026; Decision Log P147)

**Method:** P104, with the sense check protocol of CLAUDE.md §11 for the reduction of the questions. The lines of canon M1 v6.3 searched out and shown to the PI, each in whole sentences: ll.122, 967, 992 (where "unique" or "uniqueness" is said of the geometry) and l.964 (what the theorem's conclusion names); ll.143, 163 (what a geometry is); ll.249, 255, 264, 271, 297, 442 (where the paper says two things count as one, or as two); ll.406, 714, 721, 834, 1075 (what the paper itself calls a convention). Cited by number and not shown in full: ll.55, 509, 583, 943, 971. With them the active entry M1-W027 and Rulings in Force l.39 (P66). Read besides, as the work needed: this file ll.413–427 (§10.7). P71 was not read. Eleven numbered assumptions were put and confirmed; then three picks reported as the architect's readings and three questions; then the read-back R15 with the two statements as they would be printed. No counter-example was looked for and no reader was launched on whether a step holds. The statements are in `WRITE_LOG.md` and are not restated here. The division into parts is the architect's, confirmed by the PI with the assumptions and again with the outcomes (P147).

| Part | The sentence of the audit | Outcome | Where |
|---|---|---|---|
| J7-a | "'Unique' has no definition of sameness behind it" (§11.5): what "unique" is said of | Restored from the paper and P140, confirmed by the PI: the conclusion "names every factor and every discrete datum of the geometry" (canon l.964; the list at l.971), and the continuous data the paper does not derive are held by the one declared input (M1-W028). Nothing is printed differently | P147 |
| J7-b | "No definition of when two geometries are the same" (§11.1 row T16; §11.4 row T16; §10.7) | The ground stated by the PI and written in full: a new definition after Definition 3.2 | P147 (Q1 (i); read-back R15); M1-W032 |
| J7-c | Whether the conventions the paper names make a second geometry (the architect's part; no sentence of the audit) | Restored from the paper, confirmed by the PI: canon ll.255, 406, 714, 721, 834, 1075 say, in the words quoted to the PI, that the thing is a convention with no content (ll.406, 1075), is taken up to one overall sign (l.721), does not change the counts (l.714), is a naming of which step is first (l.834), or has no meaning (l.255); with M1-W032 they are not data | P147 |
| J7-d | How sameness sits with the two points canon l.442 declares open and with P66 (the architect's part; §10.7 row C5) | The ground stated by the PI and written in full: a mirror image, and a geometry run backwards, are other geometries unless a relabelling of the definition carries one to the other; the handedness kept is that of the internal piece only. For M₁₂ run backwards the quarter-turn is such a relabelling. The symmetry that mirrors the torus (l.442) stays declared open with its failure test | P147 (Q2 (i), Q3 (i)); M1-W032, M1-W033 |

**Step table of the two entries (CLAUDE.md §5).**

| # | Step | Mark | Note |
|---|---|---|---|
| S1 | Two geometries are the same when a relabelling carries one to the other with every datum, overall size apart | DECLARED (PI, P147) | the paper's words for it: ll.249, 255, 264, 271, 297 |
| S2 | The relabelling carries T to T, Σ to Σ, F to F | DECLARED | Definition 2.1(i) makes the division; the identification "a relabelling must respect it" is the architect's reading, confirmed with R15 |
| S3 | It keeps the direction of time and the handedness of the internal piece, and is not asked to keep that of Σ | DECLARED (PI, P147, Q2 (i), Q3 (i)) | l.442 for the handedness Definition 2.7 fixes; P66 |
| S4 | SM₀S⁻¹ = M₀⁻¹, so run backwards and relabelled by S the step is M₀ | CHECKED | `L1_conj_M0_inv` (canon l.342); `checks/j3_warp_check.py` W4; by hand in the mark of M1-W033 |
| S5 | The lengths of M1-W026 are kept by time run backwards with the quarter-turn | CHECKED | `checks/j3_warp_check.py` W3 (re-run this session: True) |
| S6 | The corner pattern (−1)^{mn} is left in place by S | READ | canon l.834 |
| S7 | Every other datum of M₁₂ is carried to itself by that map | **GAP, declared in the entry** | not checked datum by datum; that S is the identity on the rest of the internal piece is the architect's reading |
| S8 | The definition applied to the step alone is the count of clause (a) | **not claimed** | one direction immediate; the other RECALLED, unread |
| S9 | The proof of Theorem 8.1 delivers each datum up to such a relabelling | **not claimed** | for the whole-paper reader at the build (P104, point 5) |
| S10 | The mirror image of M₁₂ is, or is not, M₁₂ | **not claimed** | the symmetry that mirrors the torus is declared open at canon l.442 |

**Red flags (gate 7).** Canon: 16 hits, at ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 (two), 806, 1049 (re-run this session). Of the lines used for J7: l.714 ("The counts below", a forward reference, in the sentence quoted for the complex structure on E); l.239 ("Every result below", beside the sentence on overall size, which was read and not quoted to the PI). `WRITE_LOG.md` (re-run after M1-W033): 24 hits.

**Failure tests.** As in the entries. Of this table: a line of canon M1 that defines when two geometries are the same; a line under which a mirror image, or a geometry run backwards, is counted as the same geometry with no relabelling asked.

**Carried, no proposal made.** To J10: whether Definition "the same geometry" is a numbered choice. To the build: canon l.442 (the clause "without saying that the geometry run backwards is another geometry" is reworded with M1-W033); the place of the new definition and the numbering after it; S7, S8 and S9 above; ll.55 and 122 are read again with the definition.

**Fresh reader (13 November 2026, after P147 and the banking; Decision Log P148).** Given CLAUDE.md, the two handovers, this file ll.413–427 and from §11, canon, the write-up log, Decision Log P104, P105 and P140–P147, Rulings in Force ll.1–54, the Definitions section for M1, Corpus Errors from entry 34, the script and the diff; asked to check the record against its sources and the hand computation as a computation, and not whether any result holds. Eighteen findings and four observations on the printed statements, each verified against the files by the architect before being acted on. It found the tex of the two statements in agreement with what P147 records, every canon quotation in the two entries word for word at its line, the counts right, and the hand computation and W3, W4 correct. **One to be put to the PI:** the second sentence of M1-W033 says without qualification that a relabelling of the new definition carries M₁₂ run backwards to M₁₂, where row S7 above marks "every datum" a declared gap; the statement was confirmed word for word and is not changed by the architect. **Corrected here, in the entries' marks, in the registers and in the handovers:** l.964 listed as a line where "unique" is said (above); the gloss in row J7-c (above); the mark of M1-W033 on the labels $C_j$, $C_i$, which canon's sentence on the convention does not name; the attribution of the list of a geometry's data to P140 (Q4) alone; a hypothesis dropped from the Rulings row; a sentence of the Definitions row "unique" without its source; stale numbers and ranges in the handovers. **Recorded in P148, since P147 is not edited:** P147's list of what is not claimed lacks S7, and its list of lines cited by number (ll.509, 583, 943) is shorter than this section's (ll.55, 509, 583, 943, 971), which is the right one. The corrections were not checked again.

**After the reader (P149).** The corrected wording of the remark was put to the PI and confirmed: it is M1-W034, which retires M1-W033; its second sentence now claims only what rows S4–S6 show and says that row S7 is not shown, and its third says "the torus". **In the tables above read M1-W034 for M1-W033**, and row S7 is no longer a gap declared against the statement: the statement itself says it is not shown. M1-W034 was not itself checked by a fresh reader. `WRITE_LOG.md`: 34 entries, 28 active, 6 retired.

### 11.20 J10: outcomes with the PI (13 November 2026; Decision Log P151, P152, P153)

**Method:** P104, with the sense check protocol of CLAUDE.md §11. The task was repeated back; fourteen numbered assumptions and the six opening questions of `papers/M1/HANDOVER_J10_J8.md` §12 were put and confirmed (P151). The list was drawn up from §11.9 (reader A's 4.1 to 4.28 and 7.10), §11.1 rows T1, T4, T11, §11.4 row T1, the "Carried forward" bullets of `papers/M1/HANDOVER.md` items 16 to 23, the marks of the active entries of the write-up log, P92 and P97(1). **Read:** the whitelist of the brief, in full; of the Minimality Register the first two cells of the rows beginning "M1-" (P151 discloses that in its second table the second cell is a phrase on the choice). No counter-example was looked for and no reader was launched on whether a step holds. The statements are in `WRITE_LOG.md` and are not restated here.

**What was ruled (P152).** The architect reported its picks under two readings of its own (the test of canon l.133, "whenever a word has to be given a meaning that is a choice rather than a consequence, we say so and number the choice as a definition", with P97(2); one number to a definition, on the precedent of canon ll.239, 271 and P92) and listed seven "new choices", A to G. The PI asked where they came from and directed a check. The check (READ) found each of A to F stated in canon or in a confirmed entry and used by a named result, and G used by none. The PI: "These choices are forced. I don't care whether they are numbered or not numbered. Numbering or not numbering does not change the paper … Yes we need A-F." **A to F stay as stated and no wording changes. G, and the architect's proposal of seven new numbers, are withdrawn (the architect was wrong).**

| | The reading | Stated at | Used by | Outcome |
|---|---|---|---|---|
| A | what the operations of the order axiom are | canon Definition 2.5 (l.201) | the proof of Proposition 5.2 (l.465, the only line that cites it) | needed; stays (P152) |
| B | the drive: Definition 2.9; a step keeps the handedness; it moves only the fibre that carries it; it is the linear map of its matrix | M1-W006, M1-W001, M1-W004, M1-W005 (P109, P111, P112, P113) | Proposition 4.1, Theorems 4.2 and 4.3, M1-W007, M1-W026 | needed; stays (P152) |
| C | how the fold acts on the fibre algebra | M1-W017 (canon ll.193, 449, 489; P119, P122) | Lemma 5.1, Proposition 5.2 | needed; stays (P152) |
| D | closure asked of every reversed direction of the algebra | M1-W015 (canon ll.458, 467; P119, P122) | Proposition 5.2 | needed; stays (P152) |
| E | the algebra at a point, and the four fixed points of the fold as the four corners | M1-W029 (canon ll.516, 521, 536; P140, Q6) | Proposition 5.6; canon l.873 | needed; stays (P152) |
| F | the phase of a complex-valued unit is not recorded | M1-W019 (P127) | Proposition 7.2 | needed; stays (P152) |
| G | "everything" (canon l.245; P47(1)) | canon l.245, the only line with the phrase | no result | withdrawn as an item of J10; the sentence of canon is not touched |

**The architect's picks on the rest of the list.** Reported to the PI; neither confirmed item by item nor overturned; with P152 they are not put again. They are readings, change no word of the paper, and are recorded for the build, which settles how the choices are counted in the text (P151(1)).

| Item | Pick | Ground |
|---|---|---|
| A's 4.2 (l.163), 4.3 (l.150) | part of the first choice | canon l.239 gives it as "(Definition 2.1(i))"; M1-W009 |
| A's 4.4 (ll.175, 178) | part of the third | canon ll.239, 967 cite Definition 2.3 whole |
| A's 4.5 (l.187); Definition 2.4(ii), (iii); where the growth sits (M1-W025, M1-W026) | stays as stated; canon ll.193, 239, 967 give clause (i) alone as the fourth choice, and the placement is "a declared reading, not forced by the axiom" (Rulings l.48) | P152 |
| A's 4.22, 4.23 (Definition 7.4; "for one of the two lifts"); M1-W023, M1-W024 | part of the second | canon l.161 ("made exact"), l.723, l.725 ("This is the reading of Definition 2.1(iii)") |
| A's 4.17 (ll.613, 619, 621); the first sentence of M1-W031 | part of the fifth | canon l.619 cites Definition 2.7 |
| M1-W016; M1-W021 with its sentence on symmetry (provisional) | the fifth; the sixth | their marks |
| A's 4.8 (Definition 3.1, M1-W027); A's 4.28 (the count of drives) | part of the seventh | canon l.264 ("$M$ has no modulus"); l.271 ("The way of counting drives is part of the clause"); Rulings l.38 |
| A's 4.21 (zero on the torus); the integer two on S² (M1-W036); A's 4.25 at l.887 | part of the eighth | clause (b), canon l.266; ll.693, 918 |
| A's 4.14 (M1-W010); A's 4.26 and row T11 (l.894) | part of the ninth | Rulings l.35; canon l.268 ("one step of the drive") |
| M1-W012 | the opening of Definition 3.2 | canon l.262 |
| A's 4.20, complexification | the tenth (M1-W035) | P92 |
| A's 4.6, second half; 4.10; 4.11; 4.18 (M1-W020); 4.19; 4.20 (the size); 4.27; M1-W003, W007, W008, W009, W013, W034 | consequences, restored | canon ll.209, 295, 300, 181; P114, P128, P89; the entries' marks |
| A's 4.24 | a convention | canon l.1075; P147 |
| M1-W028 | the theorem's one declared input | canon l.964 |
| M1-W031 (the structure on the whole of M₁₂); the hypothesis of Corollary 7.8 (canon ll.837, 865; A's 4.25) | stay where they are stated, each with its failure test; the hypotheses of Theorem 8.1 do not name them | taken by the architect from P152 and reported |
| A's 4.1 ("a geometry", l.143); M1-W032 | definitions of the paper's terms | taken by the architect from P152 and reported |
| A's 7.10 (terms used and not defined) | for the Definitions Register at the build | several have left by ruling (P127, P140) |

**Step table of the two new entries (CLAUDE.md §5).**

| # | Step | Mark | Note |
|---|---|---|---|
| S1 | The spinor bundle of Definition 2.7 is the complex one; the units are complex-valued (M1-W035) | DECLARED (P92) | not shown to be selected by the sixth axiom |
| S2 | In twelve dimensions a spinor is not complex of itself | READ (V-27, pp. 11–12), CHECKED (`checks/spinor_type_check.py`, §11.6) | not re-run this session; not printed in the entry |
| S3 | On S² the structure taken is the one the complex structure gives (M1-W036) | DECLARED (P97(1); clause (b)) | that the sphere of units carries a complex structure selected by the axioms is not claimed |
| S4 | $\partial/\partial z=-w^{2}\,\partial/\partial w$: one zero, of order two, no pole | CHECKED by hand (§11.10, re-done) | — |
| S5 | The degree of a line on the sphere is its zeros less its poles; the canonical structure has determinant the anticanonical line | taken as known, **not read** | owed to Verified References or closed by hand (P97(3)) |

**Red flags (gate 7).** Canon: 16 hits, at ll.110, 129, 139, 209, 229, 239, 340, 596, 677, 714, 719, 723, 728 (two), 806, 1049 (re-run this session). Of the lines used for J10: l.229 ("read off", beside "we take the axiom to exclude that", reading B); l.239 ("Every result below"); l.677 (the forward reference that the tenth choice removes). `WRITE_LOG.md` (re-run after M1-W042): 29 hits.

**Failure tests.** As in the entries. Of this section: a result of M1 whose proof uses none of A to F and yet reaches the same conclusion; a result that uses the reading G.

**Carried to the build, no proposal made.** How the choices are counted and where each is stated (canon ll.129, 163, 181, 193, 211, 223, 239, 247, 964, 967); the places of M1-W035 and M1-W036; the rewording of canon ll.661, 677, 685 (P92); the two facts of S5; the mark of M1-W006, which calls Definition 2.9 "one of the paper's numbered choices of meaning" where canon l.239 does not list it; the word "input" at canon l.295; canon l.181, which names only the loop as the third choice.

### 11.21 J8: outcomes with the PI (13 November 2026; Decision Log P153)

**Method:** as §11.20. All fourteen rows were taken (P151(5)), with Corpus Errors 32(h) (P151(4)). The architect's reading, confirmed with the table: a row carries the tag of the lowest-tagged result on which its exclusion rests, the tags being those of canon l.129, "\rigR\ (proved, or a cited classical theorem), \rigD\ (derived under a stated reading) and \rigM\ (motivated)" (P151, assumption 11). Reader B's lower verdicts in §11.3 ([M] at E3 for $D=8$, E4, E7, E9 for K3, E11, E12) rested on text withheld from it or on points since ruled (existence, P140 Q1; the functional, P140 Q4; the flip, P119; the tenth choice, P92) and were not taken further (P105).

| Row | Cites, with its printed tag | Tag in canon | Outcome | Where |
|---|---|---|---|---|
| E1 | Definition 2.4 | [D] | stands | — |
| E2 | Theorem 6.1 [D] | [R] | [D]: the ground stated by the PI | M1-W037 |
| E3 | Theorem 6.1 [D] | [R] | [D] | M1-W038 |
| E4 | Definition 3.2(c) | [D] | stands | — |
| E5 | Proposition 4.1 [R] | [R] | stands | — |
| E6 | Theorem 4.2 [R], Proposition 4.5 [R] | [R] | [D]: the exclusion is the selection of clause (a) | M1-W039 |
| E7 | Proposition 5.2 [D] | [D] | stands; the word "corner" is for the build | — |
| E8 | Proposition 5.5 [D] | [R] | [D] | M1-W040 |
| E9 | Proposition 5.3 [R], Theorem 6.1 [D] | [R] | [D] | M1-W041 |
| E10 | Proposition 7.9 [D] | [D] | stands | — |
| E11 | Propositions 7.3, 7.1 [D] | [D] | tag stands; the ground becomes that of row E12 | M1-W042 |
| E12 | M1-W030 | [R] in canon; [D] in M1-W030 | stands as M1-W030 | P143, P145 |
| E13 | Proposition 7.1 [D] | [D] | stands | — |
| E14 | Proposition 7.3 [D] | [D] | stands | — |
| 32(h) | Theorem 4.2 "Consequently …" (l.300); Proposition 4.5 "the clause selects it" (l.409) | [R] | the [R] is for the conjugacy statements; the selecting sentence is [D]; no text changes; where the two tags are printed is for the build | P153 |

**Step table of M1-W042.**

| # | Step | Mark | Note |
|---|---|---|---|
| S1 | The base is ℂP² × S² and nothing further | DECLARED (P128; M1-W020) | — |
| S2 | A product ℂP² × X has χ = 3χ(X) | CHECKED by hand, given the product rule | the product rule (Künneth) taken as known, not read (§9.2) |
| S3 | χ = 8, 4, 2 for S² × S² × S², ℂP³, S⁶ | taken as known, **not read** | — |
| S4 | None is a multiple of three, so none has a ℂP² factor | CHECKED by hand | — |

**Red flags (gate 7).** Canon: 16 hits as in §11.20; none in ll.994–1018.

**Failure tests.** As in the entries. Of this table: a row whose exclusion rests on a result with a lower tag than the row prints.

**Carried to the build, no proposal made.** Where the two tags of Theorem 4.2 and Proposition 4.5 are printed; row E7's "corner unit groups" (with M1-W015, M1-W017); rows E8 and E9, whose "Where" columns still cite Proposition 5.5 and "corners" as canon has them, the torus being now by clause (c) (M1-W003, M1-W010, M1-W013); the facts of S2 and S3.

**Not done.** No fresh reader has checked §§11.20 and 11.21, the entries M1-W035 to M1-W042 or the handover; the session was committed at the PI's direction without one.

**After the PI's review (13 November 2026; Decision Log P154).** The PI kept the four tags that follow the paper's own (E2, E3, E8, E9) and the reworded row E11, and undid the fifth: **row E6 stands as canon l.1007 prints it, with \rigR, and M1-W039 is retired** with no entry replacing it. In the table above read "stands" for row E6. The change at E6 had rested on the architect's judgement and not on the printed tag of a cited result, both results cited there being \rigR. The pick on Corpus Errors 32(h) was not touched by the direction; it changes no text. `WRITE_LOG.md`: 42 entries, 35 active, 7 retired.

**The reading on Corpus Errors 32(h) dropped (Decision Log P155).** At the PI's direction ("drop it") the last row of the table above is struck: Theorem 4.2 and Proposition 4.5 keep their [R] as canon prints it, and item (h) stays in the register as a wording item for the new version. In "Carried to the build" the item "Where the two tags of Theorem 4.2 and Proposition 4.5 are printed" goes with it. The register entries proposed after this session were banked in the same row.

**Fresh reader (13 November 2026, after P155; Decision Log P156).** Given CLAUDE.md, the two handovers (the M1 handover from "## Audit of Theorem 8.1"), this file from §11, the write-up log, canon, Decision Log rows P88 onward, Rulings in Force ll.1–56, Corpus Errors from entry 32, V-32 and V-33, the last lines of the Rosetta stone and the commit log; asked to check the records of the session against their sources and the two hand computations as computations, and not whether any result holds. Twenty-one findings, each verified against the files by the architect before being acted on. It found about twenty canon quotations word for word and about sixty cited lines holding what is claimed; the five active rows of the table identical to canon but for the changes each entry lists; the counts right (42 entries, 35 active, 7 retired); both hand computations correct as written. **Corrected, all the architect's errors:** stale numbers and pointers in the two handovers after P154 and P155; in M1-W036 the two quotations of canon ll.693 and 918 given in the reverse order of their lines, and one sentence of the statement without a mark (that the anticanonical line of the sphere is its tangent line: now among the facts taken as known, with row S5 above, and in V-32); in M1-W030 a wrong line (l.1005, not l.1006, is the $D=16$ row) and no note that its tag is settled (likewise Rulings l.52 and Corpus Errors 34(h)); in Corpus Errors 36 and V-33 the sentence that the proof does not use the table given without its source (§11.1, the architect's sentence; the proof at canon ll.975–989 does not cite the table). **For the tables of §11.20, so that reader A's list can be ticked off by number:** A's 4.7 and 4.9 are reading B; 4.12 is C; 4.13 is D; 4.15 and 4.16 are E. **For the "Method" of §11.21:** reader B's [M] at E3 for $D=8$ and at E9 for K3 rested on canon l.621 being "a requirement not found in any definition or numbered choice"; the answer to it is the pick of §11.20 on A's 4.17 (canon l.619 cites Definition 2.7) and the "Rests on" of M1-W038, and not one of the four rulings named there. **Recorded in P156, since rows P151 and P152 are not edited:** P151 cites the brief's list as "its l.46", now l.48; P151 does not list the fourteen assumptions, so "assumption 11" above cannot be checked from it (it is the assumption on the gloss of canon l.129, which P151 quotes); P152 gives shorter sources for readings B to E than the table of §11.20, which is the fuller. **One wording is not corrected and is with the PI, being one the PI confirmed:** M1-W042's "the two orbits are not realised". The corrections were not checked again.
