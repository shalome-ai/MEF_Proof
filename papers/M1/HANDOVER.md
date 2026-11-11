# M1 — brief for the version with six axioms (11 November 2026)

## The task
Redo M1 with the sixth axiom (Decision Log P42, P43). **Done: M1 v6.0 is in canon since 11 November 2026 (P54); see the last three sections.** As the task stood: canon M1 v5.0 is unchanged until the PI accepts the new version; M2 is not started until the new M1 is in canon.

## The sixth axiom (P42(1)) and its observation (P43(1))
- The axiom, in the PI's words: "There is only one thing, and that one thing is everything."
- The observation for "What a child can observe", in the PI's words: "A baby sees everything as one thing, and that one thing is everything. There are no labels, no categorisations, no judgements. They don't see their parents or their environment as separate from them. They exist, and all that exists is them."

## What the PI has agreed (P42, P43)
1. The wording of the axiom is exactly as above.
2. In M1 the axiom does one thing: it is the warrant for minimality. Minimality stops being a stated principle beside the axioms (v5.0 l.114) and becomes the formal statement of the axiom for the shape (Def 3.2).
3. ω, ψ, ψ̄ and Φ_QC do not enter M1.
4. The shape and every proof are expected to stand, with only the accounting of what minimality rests on changing. This is an expectation of the PI and of the architect and is not checked. It is to be checked criterion by criterion: criterion (1); criteria (2) and (4), which v5.0 justifies only as "the instinct that the geometry carries no unforced structure" (l.243); criterion (3), already an output (l.895); and the two later minimal choices, the least flux (l.750) and the time circle of three steps (l.791). Where "least" cannot be derived from the axiom, the step is numbered as a choice.
5. The opening gains the sixth observation above.
6. Mechanics: a working draft in `papers/M1/`, built from canon v5.0 by script as v5.0 was built from v2 (`tools/m1_build_v4.py` is the precedent). On acceptance: the title, the count of axioms and of numbered choices, the hypotheses of the theorem, the ledger, the registers, the numbering map and the briefing (CLAUDE.md §§0a, 5) follow.
7. Order of work: first a short note that tests item 4, with its step audit, shown to the PI before the draft is edited (as `SHADOW_TWO_CLAUSES.md` was for the fifth axiom, P33).

## Discipline (P43)
- What the PI supplies is the axioms and direction. M1 is derived from the axioms; M2 is then derived from M1.
- The old corpus is not used to derive M1 or M2. After the derivation the result is compared with it.
- Only the axioms go into M1. The PI's three texts (the note of 22 February 2026, the block-matrix form, chapter 8 of *The Shape of Becoming*) are not premises, are not cited and are not audited against, for M1 and for M2.
- The leads recorded in P42 (the object moving in the ω field, the cathode-ray picture, the time frames, the several light sources, the four-quadrant figure) are not premises and do not enter M1.
- Working method for language (P42(6)): the PI states in plain English; the architect translates, reads back and says where a physicist would hear something else; the PI confirms before a term is used.

## Built this session (11 November 2026)
- Decision Log P42 and P43. Nothing else: no paper, no draft, no note, no certificate.

## Built in the second session of 11 November 2026
- `papers/M1/SIXTH_AXIOM_MINIMALITY.md`: the note of item 7, with its step audit, a blind check and the corrected verdicts (its §6). Checks: `checks/sixth_axiom_check.py` (S1–S7 pass) and the blind checker's own script `checks/sixth_axiom_blind_classes.py`.
- Nothing else: no draft, no edit to canon, the registers or the ledger. Not committed.
- What the note finds: no proof of v5.0 changes. By the words of the sixth axiom alone no use of "least" follows; the uses divide into those that follow under a reading "the axioms leave nothing to be chosen" (no dial; trace three), those under "no object the other axioms do not require" (no twisting line; Spin^c; S³), and those that are the least value of a quantity (dimension twelve; flux three; three steps).
- Found in v5.0 on the way (note §5): criterion (1) is defined for continuous data and used on a discrete one; l.844 does not parse and is unused; trace −3 is not treated and `L1_trace3_min` assumes a positive trace; l.852 says a principle "is not adopted" that the sixth axiom may adopt.
- Process: a grep of the Minimality Register printed one truncated row of the withdrawn M2 v1.0 (M2-5); it was not used. The M2 rows of that register should be added to the bar of P43(4).

## Open, carried from the handover of 10 November
- Pages for six references that need a library copy (Verified References V-10, V-12, V-19, V-21, V-22, V-23), and the publication data of V-24.
- The sign of the lift (w or −w), stated in M1 as open; it bears on whether the time circle is three steps or six (`LIFT_SIGN.md`; M1 Cor 7.8).
- Not derived, and said in M1: that the flux three of the fibre and the three of c₁(ℂP²) are one fact (Future-Mx F-9, owing paper to be named).
- The Lean file headers of L1 and L4 still name Latimer–MacDuffee and Atiyah–Bott as inputs in v2's terms. `M1_L5_vacuum.lean` is in the tree and not part of M1; M7 takes it.
- Parked, not premises: `GROWTH_LAW_17_20.md`; the v3 draft in `draft_v3/`. Proposed and unbanked from earlier sessions: Corpus Errors entries from the reading notes.

## Open, new
- The corner labels of the PI's four-quadrant figure have P2 and P3 exchanged relative to M1 Appendix B. M1's labels are in use; not yet put to the PI as a question.
- The briefing (CLAUDE.md), the series plan and `papers/M2/HANDOVER.md` still say "five axioms" where they describe canon v5.0; each carries a note pointing to P42. They are brought up to date when the new M1 is accepted.

## Rulings of the second session (Decision Log P44–P47)
- The sixth axiom for the shape has three clauses, each a reading and a numbered choice: (a) nothing is left to be chosen; (b) nothing is present that is not needed; (c) what is needed is least. "Everything" is everything that can be observed or spoken of.
- Trace three is stated both ways: one drive (clause (a), new Proposition 4.5) and least entropy (clause (c)).
- Overall size has no meaning; only proportions. The aspect ratio of the fibre stays the declared input.
- One sentence on the resemblance to Gödel's theorem in the outlook, tagged [M].

## Accepted and moved to canon (11 November 2026; Decision Log P54)
- The PI read the draft: "all good bank - not changes". M1 v6.0 is `canon/M1/Paper_M1_Six_Axioms_v6.tex` and `.pdf` (40 pp.; six axioms; nine numbered choices; certificates L1–L4 and L6, 58 theorems). v5.0 is in `canon/M1/superseded/`. The map is `canon/M1/NUMBERING_v5_to_v6.md`; the build script `tools/m1_build_v6.py` reproduces the canon file from v5.0.
- The one change after the PI's read: the label "v6, working draft" became "v6.0".
- Gates: 1, 2, 4, 5 pass; 3 fails on the two "I"-voice findings of the first observation only (the exception of P36). Gate 6: `STEP_AUDIT.md` §10. Gate 7: 16 hits, the same classes and counts as v5.0.
- The two wordings of Definition 3.2 were confirmed (P49(1)).
- Proposed, for the PI to bank by commit: ledger rows for v6.0; Minimality M1-12, M1-13 and the table of clauses; Definitions rows; `registers/Rulings_In_Force.md`.
- CLAUDE.md was replaced by the zero-based version (P49–P51, P54). The read-back rule and "my musings:" are in its §3 (P53).
- Nothing is committed.

## v6.1 (11 November 2026; Decision Log P55, P56)
- The PI ruled that clause (a), one drive, is the ground of trace three and that least entropy is true and not the ground; and directed v6.1 with the architect's three owed items closed.
- `canon/M1/Paper_M1_Six_Axioms_v6_1.tex` and `.pdf` (42 pp.; six certificates, 66 theorems), built from v6.0 by `tools/m1_build_v6_1.py` (20 edits). v6.0 is in `canon/M1/superseded/`.
- Changed: the order of the two reasons for trace three; Proposition 4.5 cites the new certificate `MEFProof/Paper_M1/M1_L7_onedrive.lean`; Gödel's first incompleteness theorem is stated and cited (Verified References V-25); the uncited sentence of Proposition 7.3 is reworded, and the proposition no longer says Spin^c is the least such structure.
- Gates as for v6.0. Audit: `STEP_AUDIT.md` §10.5.
- Proposed, for the PI to bank by commit: V-25; the v6.1 note in the ledger; the amended Minimality rows M1-1 and M1-3.
- Nothing is committed.

## Open
- The sign of the lift (w or −w): unanswered mathematics; three steps or six (`LIFT_SIGN.md`; M1 Cor 7.8).
- That relabellings of the torus keep orientation is a hypothesis of clause (a), not derived from the axioms; since P55 the selection of trace three rests on it (Minimality M1-12).
- V-25: the original paper of 1931 was not read; its publication data are RECALLED.
- Three symbols in the Lean listings of L3 and L4 print as blanks in the appendix (the listing font lacks them); in v5.0 and v6.0 as well.
- The items under "Open, carried" and "Open, new" above.

## Next
- M2 opens on M1 v6.1. Its first act is the read-back, one by one, of the drafts in `registers/Rulings_In_Force.md` §4 (P52).
