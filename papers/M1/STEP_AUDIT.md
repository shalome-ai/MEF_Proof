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
