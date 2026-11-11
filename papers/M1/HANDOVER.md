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

## v6.2 (11 November 2026; Decision Log P57–P60)
- The PI directed a test of the sign of the lift, then ruled: three steps, the drive's element on spinors −w, by clauses (b) and (c).
- The test: `LIFT_SIGN.md` §7; `checks/lift_sign_all.py` and the blind `checks/lift_sign_all_blind.py`. Sixteen assignments, eight for three steps in a group of 12, eight for six steps in a group of 48.
- Serre, *Trees*, Ch. I §4, read from pages the PI supplied; Verified References V-26.
- `canon/M1/Paper_M1_Six_Axioms_v6_2.tex` and `.pdf` (43 pp.), built from v6.1 by `tools/m1_build_v6_2.py` (7 edits). v6.1 is in `canon/M1/superseded/`. Audit: `STEP_AUDIT.md` §10.6.
- Proposed, for the PI to bank by commit: V-26; Minimality M1-14; the v6.2 note in the ledger.
- Not committed (the commit of v6.1 is d91f7d6).

## v6.3 (11 November 2026; Decision Log P61–P64)
- The PI directed a test of whether A3 or A4 supplies the orientation-keeping hypothesis of clause (a); protocol agreed before it ran. Record: `ORIENTATION_AND_TIME.md`; `checks/orientation_time_check.py`, blind `checks/orientation_time_blind.py`.
- Result: the hypothesis has two parts, both needed (a mirror image is another drive; a drive run backwards is another drive); M1 supplies neither. Trace three is unaffected.
- The PI ruled that "only one drive" stays the main reason, with both parts declared. `canon/M1/Paper_M1_Six_Axioms_v6_3.tex` and `.pdf` (44 pp.), built from v6.2 by `tools/m1_build_v6_3.py` (9 edits). v6.2 is in `canon/M1/superseded/`. Audit: `STEP_AUDIT.md` §10.7.
- Proposed, for the PI to bank by commit: the amended Minimality M1-12; the v6.3 note in the ledger.
- Item 3 of the PI's list (P65): the three symbols that printed as blanks in the Lean listings are printed in v6.3 (typesetting only), and gate 1 now fails on a missing character.
- Committed with v6.2 by the PI's direction (P65).

## After the commit a810568 (Decision Log P66)
- The PI confirmed a reading: the direction of the rule is part of the universe, so a drive run backwards is another drive. It makes the time half of the count of clause (a) a confirmed reading; flagged as confirmed after the result was known. Entered in the Decision Log, Rulings in Force, Minimality M1-12 and the Definitions Register. M1 v6.3 is unchanged. Not committed.

## Open
- For the PI, found on the way: M1 does not define when two geometries are the same.
- The two parts of the count of clause (a) are declared and not derived (Minimality M1-12).
- Applying clause (b) to the group of assigned elements is a flagged reading (`STEP_AUDIT.md` §10.6, S6).
- V-25: Gödel's paper of 1931 was not read; its publication data are RECALLED. V-26: Serre's publisher and year are RECALLED. V-12 (Gauss): pages still owed.
- The items under "Open, carried" and "Open, new" above; the sign of the lift there is closed by P58.

## Next
- M2 opens on M1 v6.3 from `papers/M2/HANDOVER.md` (rewritten 11 November, P67): the PI opens with a "my musings:" statement, then the drafts of `registers/Rulings_In_Force.md` §4 are read back one by one (P52).

## Audit of Theorem 8.1 (11 November 2026, third session of the date; Decision Log P88)
**This section is a summary. Where it and `STEP_AUDIT.md` §11 differ, the file is right.** It and the two sections after it were checked by the architect and then by an independent reader given the handover and the files it cites, under the reading limits of the M2 handover (26 findings, corrected here and in the notes).

- **Built:** `STEP_AUDIT.md` §11 (§11.1 the architect's step table T1–T19 and E1–E14, fixed before the readers were launched; §11.3 blind reader B on the fourteen competitors; §11.4 blind reader A on the assembly; §11.5 the comparison, J1–J11). `checks/thm81_blindA_chk.py`, `checks/thm81_blindB_chk.py` (the readers' own scripts, re-run; A's outputs were not compared line by line with its report, and B's function `classes` is relied on for nothing). Decision Log P88. The M1 Status cell of the series plan.
- **Read:** canon M1 v6.3 ll.1–1023 and Appendix B (l.1075). Not read: ll.1024–1105 except l.1075; the Lean files.
- **Red flags:** 16 hits, none in ll.964–1018; those at lines the proof consumes are listed in §11.
- **Found:** in the words of §11.5, "No Lean certificate, no computation and no statement of Sections 4–7 marked CHECKED in §§8–10 was found wrong by either reader" (the Lean files were not opened). The findings are in §11.5, J1–J11: ten on the joins of the assembly, and J9, a gap inside a cited result (Proposition 5.2), outside the scope and recorded. Further points found by reader A are in §11.4, items 1–8. The theorem does not pass gate 6 as written.
- **Not changed:** canon, the ledger, every register other than the Decision Log. Committed and pushed as 18a2707.

### Open, for the PI
1. Each of J2–J11 (J1 is closed, below): whether it is a misreading, a wording to correct, a step to close in M1, or an assumption to declare with its failure test (CLAUDE.md §6). No proposal is made here.
2. J11 rests on P34(2), a sealed row of the Decision Log, known here only through `STEP_AUDIT.md` §8.
3. ~~CLAUDE.md §1 tells every session to read the series plan; the M2 handover (item 4) bars it.~~ Settled: CLAUDE.md §1 changed (P93).
4. Whether the third M2 session's reading of the series plan (P88) bars that chat from M2 work: **not ruled, and now moot.** The PI's words in P88 ("All confirmed - audit is the whole session, proceed") confirm the scope; that chat did no M2 work. It did go on, at the PI's direction (P89), to take up J1.

### Proposed for the registers (the PI banks by commit; none was written)
- **Corpus Errors Register, M1 v6.3**, the first hypothesis in each being that the reading is wrong: J1 (since closed by a choice, P92; the row would record the wording of ll.661, 677, 685 as it stands in v6.3), J2, J5, J6, J9; the tags of rows E2, E3, E8, E9, E12 of the elimination table (J8); l.531 against Appendix B; l.533 ("Definition 2.9(iii)"); l.685's attribution to Proposition 7.3; l.235 ("is not assumed"); l.349 against l.357; l.725 against l.763 (the wording of the reading of clause (iii)); and from §11.4: Proposition 5.6, statement against proof (ll.521, 529); l.166; the [R] tags of Theorem 4.2 and Proposition 4.5; the double uses of "F", "the time factor" and "M".
- **Minimality Register:** whether the unnumbered readings of J10 become numbered choices is for the PI.
- **Not for any register until verified:** two statements RECALLED by the readers: the genus-three example and the flag manifold. The third of §11.5's list, on the Clifford algebra in dimension twelve, has since been CHECKED (`COMMUTANT_LEAD.md` §4).

## J1 taken up and closed (same session; Decision Log P89–P92)
**A summary. Where it and the files it cites differ, the files are right: Decision Log P89–P92, which hold the PI's words; `STEP_AUDIT.md` §§11.6, 11.7; `COMMUTANT_LEAD.md`.** The session was confirmed as the audit only (P88); the PI then widened it: "Let's go through J1–J11 one at a time, start with J1" (P89).

- **J1** (`STEP_AUDIT.md` §11.5): Propositions 7.1–7.3 each take a hypothesis from another.
- **The order the PI confirmed as intended (P89, assumptions 2 and 5: "2 and 5 confirmed - verify 4 at source first").** As put: on the ground M1 gives at l.685 the order *would be* linear: spinors (Definition 2.7) → complex data → ℂP² (Proposition 7.2) → not spin, so Spin^c (Proposition 7.3) → its canonical structure fixes a unit → the sphere (Proposition 7.1). Nothing in M1 says what selects the unit; in that order it would come from ℂP²'s own complex structure through Proposition 7.3. Marked by the architect as its reconstruction and not something M1 states in order. Not in a paper.
- **Verified (P89; `STEP_AUDIT.md` §11.6).**
  - READ, Atiyah–Bott–Shapiro 1964, pp. 11–12 only (Table 1; the periodicity; Proposition 5.4): C₁₂ ≅ ℍ(32) and C⁰₁₂ ≅ ℍ(16) ⊕ ℍ(16), "by the two quoted statements, no more".
  - CHECKED, `checks/spinor_type_check.py`: the half-spin representations of Spin(12) are of quaternionic type. That a spinor in twelve dimensions is not complex of itself rests on this check.
  - Not read and not checked: that Spin(k) lies in C⁰_k and that the half-spin spaces are its irreducible modules; that the commutant of ℍ(m) on ℍ^m is ℍ (RECALLED).
  - Failure test: the script prints "COMPLEX" or "REAL" at n = 12, and Table 1 with the periodicity does not give ℍ(32).
- **A lead tested and failed (P90; `COMMUTANT_LEAD.md`).** The PI: "Option 2 - test the lead first".
  - The object, as the note defines it: ℍ_c, all real-linear maps of the twelve-dimensional spinor space that commute with the Clifford action; on each half-spin space the maps commuting with Spin(12) are again a copy of ℍ.
  - The lead: that ℍ_c is M1's fibre algebra. Protocol, criteria and the architect's prediction were fixed first (§§1–3). `checks/commutant_lead_check.py` and a blind reader's `checks/commutant_lead_blind.py` agree.
  - K1, K2, K3 fail (CHECKED). K4 holds (by construction for the architect; proved by the blind reader).
  - Not tested: the drive; anything about bundles over M₁₂ (the model is one tangent space); other almost-quaternionic structures on ℝ¹² than the standard one (assumption 3 of the note, RECALLED).
  - Failure test of the verdict: a non-real element of ℍ_c written as a real combination of products of gammas; or an element of Spin(12) that does not commute with J.
- **The choice of how to close it (P91).** The PI: "Option 1 - declare the choice". J1 is closed in M1 by a new numbered choice and not by an assumption of the theorem. **Correction recorded there (the architect was wrong):** option 1 was first put as "the spinors are taken complex, which selects a unit". The unit so selected belongs to ℍ_c, which is not the copy of the quaternions that M1's Sections 5 and 7 speak of; the words "which selects a unit" are dropped.
- **The ruling (P92), a confirmed read-back ("1-3 confirmed"). The tenth numbered choice of M1, the seventh of Section 2:** (a) the spinor bundle of Definition 2.7 is the complex spinor bundle; (b) data of the fibre algebra carried by spinors are complex-valued: the three imaginary units take values in ℂ ⊗ Im ℍ ≅ ℂ³.
  - Ground: (a) is a choice by the check above; (b) is M1's own named reading at l.685.
  - What rests on it: Proposition 7.2 in place of "the Spin^c line of Proposition 7.3 below" (l.677); through it Propositions 7.3 and 7.1, Theorems 7.10 and 8.1, row E11 of the elimination table.
  - Failure test: a later paper needs spinors that are real or quaternionic and not complex; or the complex-valued units of (b) cannot be what the complex spinors carry.
  - The other hearings of the words are in P92.
- **Flagged in P92 and not resolved:** no argument is made that the sixth axiom selects complex over real or quaternionic spinors (CLAUDE.md §6). Until one is, it is a declared choice and not one the axiom selects.
- **No new version of M1 is built yet (P92(3)).** J2–J11 are gone through first and one version is built from all the rulings. Owed, in P92's words: "the Minimality Register entry (proposed for the PI to bank); the rewording of ll.677, 685, 661 and of row E11 in the new version". The architect adds, not in any ruling: the choice has to be stated in the text, and the places that count the choices change (ll.129, 163, 181, 193, 239, 964 say "six"; l.247 names the seventh to ninth). How the ordinals run is settled at the build.
- **Disclosure.** P92 was ruled in the chat that P88 records as having read the barred rows of the series plan. The architect sees no line of those rows that bears on complex spinors; the PI may judge otherwise.
- **Found on the way, for the PI, beside J10 and not part of J1** (`COMMUTANT_LEAD.md` §4): on one tangent space the tangent-level I, J, K, acting on spinors through the Clifford action, do not obey the quaternion relations and generate an algebra of dimension 30; so the two levels of Definition 2.7 do not give the same algebra and the spinor-level one is not ℍ. CHECKED by both. The first hypothesis is that "acts … as" is misread.

### Proposed for the registers (the PI banks by commit; none was written)
- **Minimality Register:** the tenth choice, M1, with P92's wording, its failure test and the flag on the sixth axiom.
- **Verified References:** Atiyah, Bott and Shapiro, "Clifford modules", *Topology* 3 Suppl. 1 (1964) 3–38: pp. 11–12 READ from a scanned copy; the rest not read.
- **Definitions Register:** "complex spinor bundle", to be entered before the new version uses the term (CLAUDE.md §6). The architect's proposal; P92 does not mention it.

## The next session (written 11 November 2026)
**Recommended work package: J2 only; when it is done, stop and report. This is the architect's recommendation. The PI directed the handover and did not rule on what the next session does (P93). The PI's standing words on order: "Let's go through J1–J11 one at a time, start with J1" (P89).**

1. **Start.** CLAUDE.md §1 as changed (P93) has a session read CLAUDE.md and then the current paper's handover. The current paper is M2: `papers/M2/HANDOVER.md`, whose note of 11 November sends the session here, and whose lists "Do not read" and "Sealed" stay in force. (That the M2 handover is opened first and this file second is this handover's arrangement, not P93's.)
2. **Read:** this file from "Audit of Theorem 8.1" to the end; `STEP_AUDIT.md` ll.328–348 (§§9.3, 9.4) and §11 (from the heading "## 11." to the end of the file); `COMMUTANT_LEAD.md`; canon `Paper_M1_Six_Axioms_v6_3.tex` in full; `registers/Rulings_In_Force.md` ll.1–43 only; Decision Log rows P88 onward, by `grep '^| P\(8[89]\|9[0-9]\) ' registers/Decision_Log.md`. The next number is **P94**.
3. **Do not read:** the series plan (its Status cell for M1 is edited at the end by a targeted replacement, without reading, as the M2 handover's item 4 has it for M2); anything in the M2 handover's sealed list; the rest of the Decision Log.
4. **J2, as the audit has it** (`STEP_AUDIT.md` §11.1 rows T3 and T19; §11.3, question A; §11.4, row T3; §11.5):
   - the torus is obtained by assuming the drive "an Anosov diffeomorphism commuting with ι" (l.501) and Anosov is derived only on the torus (l.277);
   - Definition 2.9 (l.232) asks neither Anosov, nor a return map on one fibre, nor commutation with ι;
   - l.235 says the strong form "is not assumed";
   - Franks gives topological conjugacy to a linear map (l.505), where the statement has the drive an element of SL₂(ℤ) (l.501); return maps that are not linear, and negative traces, are not excluded;
   - clause (a) on the drive presupposes the torus, which Proposition 5.5 gets by clause (c) (T19; J5).
   - Failure test of T3: "a line of M1 that derives 'Anosov, commuting with ι, with a return map' from Def 2.9 before l.501".
   - Reader B's example, RECALLED and to be verified or dropped before anything rests on it: a surface of genus three, a double cover of the torus branched at four points, with a pseudo-Anosov map commuting with an involution that has exactly four fixed points.
   - Method as for J1: the texts quoted, numbered assumptions, then wait.
   - Sources: Franks 1970 and Katok–Hasselblatt are among "References not obtained" (`STEP_AUDIT.md` §9.3 item 3; §9.4 item 3 calls them "owed as housekeeping … not a matter for the PI"). Franks is Verified References V-10 (the first line of its row was seen); the row for Katok–Hasselblatt was not identified. The M2 handover, item 8, quotes the PI, "I won't be able to access any more than I have", and gives the consequence: an outside statement not read at source is closed by hand or declared as an assumption with its failure test.
5. **After J2: the architect's recommendation, not ruled, and it departs from "one at a time" in numerical order.** J5, J6, J9 need work of the kind J1 did. J7, J8, J10, J11 are lighter; J11 turns on P34(2), a sealed row, which the PI would have to state. The architect recommended (P93) that J3 and J4 not be taken in a chat that has read the barred rows of the series plan, because they concern the warp, the functional and the unfixed proportions, which M2 derives. J6 and J1 touch the base and the Spin^c line that M2's `N2_sources.md` counts states on; J1 was ruled in such a chat (the disclosure above). The PI decides the order at the start of the next session.
6. **Commit state:** see `git log`. At the time of writing, uncommitted: this file, `STEP_AUDIT.md` §11.6 on, `COMMUTANT_LEAD.md`, three scripts in `checks/`, Decision Log P89–P93, CLAUDE.md, the M1 Status cell, the note in the M2 handover. The PI directed that they be committed and pushed once the independent reader's findings were corrected.
