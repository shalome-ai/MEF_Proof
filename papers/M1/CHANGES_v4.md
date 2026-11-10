# M1 v4 / v4.1 (working draft) — what changed from canon v2

**10 November 2026.** `Paper_M1_Five_Axioms_v4.tex` is generated from `canon/M1/Paper_M1_Four_Axioms_v2.tex` by `tools/m1_build_v4.py` (58 edits in all, each required to match exactly once; the first pass was 36). `canon/M1` is unchanged. Rulings: Decision Log P19, P23, P31, P32. Scope (P32): the fifth axiom integrated as the warrant for the family M = (T × Σ) × F, and nothing else.

| Where (v2 line) | Change | Source |
|---|---|---|
| title, abstract, §1 (ll.39, 47, 50, 52, 56, 66, 68, 102, 109) | "four" becomes "five"; the abstract gains "and what is seen of it is less than what is there" | P23 |
| after l.64 | a fifth observation: a thing and its shadow | PI's content (record §2); architect's wording |
| after l.84 | Axiom 5 (shadow), the PI's sentence verbatim | P19 |
| l.86 | "not a fifth axiom" becomes "not a further axiom"; two sentences on how the fifth axiom differs in kind from the other four | P32; architect's wording |
| §2.1 (ll.115–121) | becomes "Shadow, and the shapes we consider": the sentence; what it means for a shape; **Definition 2.1 (shadow, formal)**: the family (T × Σ) × F, with what is seen the image under the projection π that forgets F; **Remark 2.2 (what the shadow loses)**: π is not one-to-one once F is more than a point, which Theorem 6.1 shows (wording corrected after the blind check, `STEP_AUDIT.md` §6); a closing paragraph saying the other four axioms are stated in the fifth's terms | P19 (existence statement; loss of information as a remark with proof; no uniqueness), P32 |
| ll.113, 133, 145, 163, 175, 191 | five choices, the new one first; the others renumbered | follows |
| ll.196, 200, 369, 491 | "A1–A4" becomes "A1–A5" | follows |
| ll.488, 499, 503 | the main theorem: five axioms, five readings; the proof says what A5 gives ("the family … it selects nothing within the family"); the deflationary reading says the same | P32 |
| ll.560, 562 | "five axioms"; "the same axioms"; "coherence field" becomes "Coherent Field" | follows; `canon/omega-definition-usage_v2.md` |
| l.139 | "toward" becomes "towards" | lint |
| Appendix A | "fifty theorems": the repository's `M1_L1_drive.lean` has carried `L1_one_fixed_point` since the v3 draft, and the file is listed verbatim; the text does not use it | follows |
| preamble | listing frames set inside the text block | P15(b) |

**Not changed:** Sections 3 to 8 (the drive, the fibre, the dimension, the base, the theorem) apart from the counts above. No statement about the observer's place, the light, the generations, the warp or Φ_QC is added (P32).

**Numbering.** The new definition and remark come first in Section 2, so the other items of Section 2 move up by two: closure is Definition 2.3, growth and decay 2.4, the fibre algebra 2.5, order 2.6, the two levels 2.7, orbits 2.8, drive 2.9. Sections 3 onward keep their numbers. M2, the registers and the ledger cite the old numbers and are to be updated when v4 is accepted.

**Gates on the draft:** 1, 2, 4, 5 pass (26 pages; 50 theorems; 39 names cited). Gate 3: two findings, both the first-person voice of the first observation (v2 l.58), the PI's opening, kept as in v2. Gate 6: `STEP_AUDIT.md` §6. Gate 7: `tools/redflags.py` on ll.50–150 of the draft; the hits in the new text are two forward references in Remark 2.2 (it refers to Theorem 6.1), entered in the step audit.

## v4.1: typesetting and the second pass (10 November 2026; PI: "Make the above type setting changes and then do the second pass")

| Where (v2 line) | Change | Source |
|---|---|---|
| preamble | line spacing 1.2 and a small space between paragraphs, throughout; the Lean listings keep single spacing. 30 pages (was 26) | PI, on reading v4 |
| abstract | "whose drive is, at each step, the square of the Fibonacci matrix … and whose time circle is three steps" (was "whose monodromy is") | P28 |
| Def 3.2 (l.200) | criterion (2) is applied to one step of the drive; criterion (3) no longer names "the coefficients of the polynomial fixing its aspect ratio" | P28 (item 24); P29 |
| §4.1 (l.209), §4.2 (l.221), Thm 4.2 (l.226) | the word *step*; criterion (2) "applied to the step"; the time factor has M₀ "as its step" (was "with this monodromy") | P28 (items 23, 24) |
| §5.5 (l.346) | the open point on the sign of the lift stated: Ad_w is the same for w and −w; which element the drive is is left open | item 25; `LIFT_SIGN.md` |
| §5.6 (l.364) | the aspect ratio is one "which this paper does not fix" | P29 |
| Cor 7.4 (ll.436–442) | restated: [R] the product of the corner signs is −1 and one corner is odd; [D] the odd corner is a cycled corner, named P₄. The proof says the index does not choose within the class of four. A paragraph says this is a declared reading that minimality would not take, and why (−1)^{mn} among the three | P28 (item 22); `CORNER_SIGNS.md` |
| new Cor 7.5 | the time circle is three steps; M₀³ = ((13,8),(8,5)); two consequences: the drive's numbers are per step, and criterion (2) must be applied to the step | P28; `CONSEQUENCES_OF_B.md` C1, C3, C9 |
| Thm 8.1 (ll.488–499) | hypotheses gain the reading of Cor 7.4 and one declared assumption; "with step … and a time circle of three steps"; "no continuous modulus" replaced by the statement of what is not fixed | P28, P29 |
| table (l.524) | the quadric row no longer cites the aspect ratio | P29 |
| §8.3–8.4 (ll.530–552) | **Proposition 8.2 and its four worked cases removed.** New §8.3 "What this paper does not fix": the scale (declared input, as before) and the aspect ratio, with **Definition 8.2 (declared assumption: the stationarity conditions fix the aspect ratio)** and its failure test | P29 (item 28); CLAUDE.md §2c |
| l.191, l.560 | the aspect ratio named as not fixed; §9 cites the time circle in place of the cubic | follows |
| Appendix A | four files, forty-seven theorems; the fifth certificate (`M1_L5_vacuum.lean`) is no longer listed. The file stays in `MEFProof/Paper_M1/` until the τ₂ paper takes it | P29 |
| Appendix B (l.602) | the drive carries the odd corner P₄ → P₂ → P₃ → P₄; the pattern returns after three steps | P28 (item 22) |

**Numbering after v4.1.** Section 7: the new corollary is 7.5, so Σ = S³ is Proposition 7.6 and the base is Theorem 7.7. Section 8: Theorem 8.1 as before; Definition 8.2 is the declared assumption (Proposition 8.2 is gone).

**Gates on v4.1:** 1, 2, 4, 5 pass (30 pages; 38 names cited). Gate 3: the same two first-person findings. Gate 6: `STEP_AUDIT.md` §§6–7. Gate 7: entered there.

## v4.2 (10 November 2026, later): line breaks; blind-check corrections; Proposition 8.2 restored

- **Line breaks (PI).** In the proofs and worked cases of Sections 4 to 8 each step starts on its own line; proof steps are set flush left. Now the series layout (CLAUDE.md §9).
- **Blind check of the second pass** (`STEP_AUDIT.md` §7a): the trace-six paragraph after Cor 7.5 withdrawn; Cor 7.5 says what is forced (a multiple of three) and what is taken (three), and names the open sign of the lift; the quarter-turn sentence after Cor 7.4 corrected.
- **Proposition 8.2 restored (PI).** Everything in the v4.1 table above about its removal is reversed: §8.3 "No continuous modulus", the proposition, its worked cases, the fifth certificate and the theorem's "no continuous modulus" are back as in v2; criterion (3) keeps its clause on the aspect-ratio polynomial. The one change: the proof names the stationarity conditions as a declared assumption with its failure test, and Theorem 8.1 names that assumption. Appendix A: five files, fifty theorems. Section 8 keeps v2's numbering.
- 34 pages; 55 edits to canon v2. Gates 1, 2, 4, 5 pass; gate 3 as before.

**Not changed, and open:** Corollary 7.4's first sentence and tag. Atiyah–Bott does not contain it (Verified References V-7), and the derivation attempted on 10 November gives the opposite sign for the structure M1 constructs (`CORNER_LIFT_DERIVATION.md`). Corollary 7.5 depends on it.

## v4.3 (10 November 2026, later): the fifth axiom's two clauses; the twist of the fibre (Decision Log P33, P34)

| Where | Change | Source |
|---|---|---|
| §1.1, §1.2 | the fifth observation and the paragraph on the axiom say both things a shadow does: several things in one shadow, one thing in several | PI, record §26 |
| Axiom 5 and §2.1 | the axiom is the PI's two sentences; §2.1 says which clause formalises which half (P35) | P35 |
| Def 2.1 | gains clause (ii) (the structure carried by the internal piece is not carried to itself by one step of the drive) and clause (iii) (the internal piece has at least two independent states at rest with the same shadow); a paragraph says where the words are made exact | P34 |
| §2 | six numbered choices (was five): the new one, second, is that an object is a state of the internal piece at rest and its shadow what is left when the internal piece is forgotten | P34 |
| **new §7.4 "The twist of the fibre"** | Definition 7.4 (flux, states, corner sign); Lemma 7.5 (states, the fold and the drive); **Proposition 7.6: the least flux meeting both clauses is three, with one odd corner, a cycled one; two states on the pillowcase, one removed by the fold**; the smallest case by hand; three remarks | `SHADOW_TWO_CLAUSES.md` |
| Cor 7.7 (the corner lift; was 7.4) | rests on Proposition 7.6; tagged [D]; no longer cites Atiyah–Bott | Verified References V-7; `CORNER_LIFT_DERIVATION.md` |
| after Cor 7.7 | the paragraph "a reading … not the option minimality would take" is replaced: the cycled odd corner is clause (ii) at work | P34 |
| Cor 7.8 (the time circle; was 7.5) | "with the corner signs of Corollary 7.7" | follows |
| Thm 8.1 | "flux three on the fibre with one odd corner"; six readings; the proof and the deflationary reading say the fifth axiom enters twice, and what is lost without the reading | P34 |
| worked case (the eight corner functions) | "the odd flux of the fibre" in place of "the odd determinant class" | follows |

36 pages; 56 edits to canon v2. Gates 1, 2, 4, 5 pass; gate 3 as before. Step audit: `STEP_AUDIT.md` §8.

**Numbering after v4.3.** Section 7: Def 7.4, Lemma 7.5, Prop 7.6 are new; the corner lift is Cor 7.7, the time circle Cor 7.8, Σ = S³ Prop 7.9, the base Thm 7.10.

## v4.4 (10 November 2026, last round): certificate, blind read, references, the display (Decision Log P36, P37)

- **`M1_L6_twist.lean`** (eleven theorems): the finite case analysis of Proposition 7.6 over the thirty-five divisors of flux at most three, taking the count of Lemma 7.5(b) as given. Named in the proofs of Lemma 7.5, Proposition 7.6 and Corollary 7.7. Appendix A: six files, sixty-one theorems.
- **Lemma 7.5(a)** no longer cites Riemann–Roch: the states are counted as even plus odd from the classical facts on ℘ and ℘′ (Whittaker and Watson, 3rd ed., §§20·21, 20·32, 20·51; Verified References V-9, read from the page images).
- **Blind read of §7.4** (`STEP_AUDIT.md` §8a) applied: the flux and the determinant line related (the integer on the torus is 2d); "structure" of a twist defined, with the remark that the drive is not holomorphic and acts through the corners; the two lifts named and the Proposition stated "for one of the two lifts"; "odd corner" defined; the flux-two step corrected (the structure, not the divisor, is left in place); Lemma 7.5(b), (d) completed; "up to one overall sign" added to Corollary 7.7; the premises of the time-circle argument stated in its proof, and the overall-sign condition in its statement; the paragraph on harmonic spinors says exactly what is and is not used.
- **Abstract** rewritten within the length limit, with the twist of the fibre; **outlook** names it.
- **The display of K₈ (P37):** one sentence after the display says the warp symbol records that the product is warped and that which piece is scaled is not fixed in M1; "the warped fibre X of A2" and "the base over which F is warped" made neutral. Future-Mx F-10, owed by M2.
- 39 pages; 66 edits to canon v2. Gates 1, 2, 4, 5 pass; gate 3: the two first-person sentences, an exception by P36.

**Still owed:** the step audit of the theorems inherited from v2 with their references (`STEP_AUDIT.md` §9, in progress); on acceptance, the move to canon and the renumbering of references to M1 in M2, the registers, the ledger and CLAUDE.md §5.
