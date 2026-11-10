# M1 v3 (working draft) — what changed from v2.1

**Status after the step audit and blind check of 10 Nov 2026 (`STEP_AUDIT.md`): this draft does not integrate the fifth axiom and is not a candidate to replace M1 v2.1.** It is kept as the record of a first attempt.

**10 November 2026.** `Paper_M1_Five_Axioms_v3.tex` is generated from `canon/M1/Paper_M1_Four_Axioms_v2.tex` by `tools/m1_build_v3.py` (32 edits, each required to match exactly once). `canon/M1` is unchanged. Rulings: Decision Log P19, P23, P25, P26, P27.

| Where (v2.1 line) | Change | Source |
|---|---|---|
| title, abstract, §1 (ll.39, 47, 50, 52, 56, 66, 68, 102, 109, 111) | "four axioms" becomes "five"; the abstract gains "and what is seen of it is less than what is there" | P23 |
| after l.64 | a fifth observation: a thing and its shadow | PI's content; architect's wording |
| after l.84 | Axiom 5 (shadow), the PI's sentence verbatim | P19 |
| l.86 | "shadow carries the fact that we see from where we stand, and see less than there is" | architect's wording |
| l.121 | one sentence: "not directly seen" is the fifth axiom at work | architect's wording |
| new §2.6 "Shadow", between ll.187 and 189 | the sentence; what it means for a shape; Definition (shadow, formal) with three clauses: (i) the place we see from, a point the drive returns to itself, and the projection; (ii) the growth law lies on the piece carrying the involution and nowhere else; (iii) everything observed is the image of something regular. The PI's reason for (ii) in words (gravity reaches all twelve dimensions; the other forces are local to the base) | (iii) P19; (ii) PI, P26, P27; (i) architect's decision with its reason, P27(d) |
| l.191 | six choices, not four | follows |
| after Prop 4.4's proof (l.270) | the drive returns exactly one point to itself: det(M₀ − I) = −1; new certificate theorem `L1_one_fixed_point` | CHECKED |
| after l.336 | Remark "one thing, three shadows": the three cycled corners are one corner and its line moved round; seen from the fixed place, three | PI (record §5); M1 Prop 5.6 |
| ll.488, 491, 499 | the theorem's hypotheses: five axioms, six readings; A5 gives the place we see from and puts the growth law on the pillowcase | follows |
| l.139 | "toward" → "towards" | lint |
| l.562 | "coherence field" → "Coherent Field"; "the same four axioms" → "the same axioms" | `canon/omega-definition-usage_v2.md` |
| preamble | listing frames set inside the text block | P15(b) |
| Appendix A | fifty theorems; the L1 description gains the new theorem | follows |

**Gates on the draft:** 1, 2, 4, 5 pass (27 pages; 50 theorems; 40 names cited). Gate 3: two findings, both the first-person voice of the first observation (v2.1 l.58), kept as in v2.1.

**Not yet changed, and owed before v3 can replace v2.1:**
1. Proposition 8.2 (the aspect ratio) says the radii of S² and ℂP² are "tied by the warp to the two periods". Under clause (ii) the base is not warped; the proposition has to be re-read. Its stationarity conditions are also still deferred.
2. The sign of the drive on the smooth cover (M₀ against −M₀).
3. "Regular" in clause (iii) has no definition yet.
4. A step audit and a blind check of the new §2.6 and of the remark.
5. CLAUDE.md §5 ("five numbered readings") and M2's use of "the fifth reading" for the positive-definite metric need renumbering once v3 is accepted.
