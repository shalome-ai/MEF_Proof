# M1 — brief for the version with six axioms (11 November 2026)

**A session starting here (CLAUDE.md §1): go first to "The next session" at the end of this file. Its reading list and its lists "Do not read" and "Sealed" govern everything else, including the rest of this file.**

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

## Next (superseded: see "The next session" at the end of this file; M2 is restarted from scratch after the new M1, P95)
- As written at the time: M2 opens on M1 v6.3 from `papers/M2/HANDOVER.md` (rewritten 11 November, P67): the PI opens with a "my musings:" statement, then the drafts of `registers/Rulings_In_Force.md` §4 are read back one by one (P52).

## Audit of Theorem 8.1 (11 November 2026, third session of the date; Decision Log P88)
**This section is a summary. Where it and `STEP_AUDIT.md` §11 differ, the file is right.** It and the section on J1 were checked by the architect and then by an independent reader given the handover and the files it cites, under the reading limits then in the M2 handover (26 findings, corrected here and in the notes). The last two sections were rewritten after P95–P97 and then tested by a dry run (see there).

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

### Registers: banked by the PI's direction (P94: "Everything else bank the proposed register entries")
- **Corpus Errors Register, entry 32** (items (a)–(o)), written from this proposal: **M1 v6.3**, the first hypothesis in each being that the reading is wrong: J1 (since closed by a choice, P92; the row would record the wording of ll.661, 677, 685 as it stands in v6.3), J2, J5, J6, J9; the tags of rows E2, E3, E8, E9, E12 of the elimination table (J8); l.531 against Appendix B; l.533 ("Definition 2.9(iii)"); l.685's attribution to Proposition 7.3; l.235 ("is not assumed"); l.349 against l.357; l.725 against l.763 (the wording of the reading of clause (iii)); and from §11.4: Proposition 5.6, statement against proof (ll.521, 529); l.166; the [R] tags of Theorem 4.2 and Proposition 4.5; the double uses of "F", "the time factor" and "M".
- **Ruled since (P97(2)):** the unnumbered readings of J10 become numbered choices; the list is drawn up when J10 is taken (`STEP_AUDIT.md` §11.9).
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

### Registers: banked by the PI's direction (P94)
- **Minimality Register, M1-15:** the tenth choice, with P92's wording, its failure test and the flag on the sixth axiom. Its status cell: the tag does not go on until the new version states it.
- **Verified References, V-27:** Atiyah, Bott and Shapiro, "Clifford modules", *Topology* 3 Suppl. 1 (1964) 3–38: pp. 11–12 READ from a scanned copy; the rest not read.
- **Definitions Register:** "complex spinor bundle", entered in the section "Terms of M1 v6.0" before the new version uses the term (CLAUDE.md §6). The wording is the architect's.
- **Not banked (P95):** the proposals in the handover of M2's second start. M2 is restarted from scratch; the findings about M1 among them are carried to `STEP_AUDIT.md` §11.8.

## The next session (rewritten 11 November 2026 after P95–P98)
**Checked twice:** by an independent reader against its sources (33 findings), and by a dry run in which a fresh reader followed CLAUDE.md and this file cold (its findings corrected here; those that need the PI are in item 12).

**Where things stand.** M1 is the current paper. Its version 6.3 is in canon and has been audited (`STEP_AUDIT.md` §11). The audit found nothing certified false and eleven findings, J1–J11, on how the main theorem joins its cited results. J1 is closed. One new version of M1 is built when the rest are ruled. There were two earlier attempts at M2 (a withdrawn "v1.0" and a "second start"); both are sealed, M2 is begun afresh after the new M1 (P95, P96), and nothing about either is needed for the work here. "The writing session" below means the chat that wrote this file.

**Recommended work package: J2 only.** That it is J2 is the architect's recommendation; the PI has not ruled on the order. The PI's words: "Let's go through J1–J11 one at a time, start with J1" (P89); M2 is a fresh start "once we have completed J2-J11" (P96).
**"Done" means:** J2 has been put to the PI as J1 was (item 4, "Method") and the PI has ruled which it is: a misreading, a wording to correct, a step to close in M1, or an assumption to declare. The ruling is in the Decision Log, register entries are proposed, and this section is rewritten. No text of a new version of M1 is drafted (P92(3)). Then stop and report; start no other item.

1. **Start.** Read CLAUDE.md from the file on disk (its §1 was changed on 11 November, P93), then this file, beginning at this section. The reading list is a whitelist: what is not on it is not read, with the one exception in item 2, last bullet. Run every command below from the repository root.
2. **Read:**
   - this file from the heading "## Audit of Theorem 8.1" to the end. Everything above that heading is the history of v6.0–v6.3; the writing session read it and found nothing sealed in it; it is not needed;
   - `papers/M1/STEP_AUDIT.md` §11, from the heading "## 11." to the end of the file (it has no §11.2);
   - `papers/M1/COMMUTANT_LEAD.md`;
   - `canon/M1/Paper_M1_Six_Axioms_v6_3.tex`, ll.1–1105. The writing session read ll.1–1023 and l.1075. Lines 1024–1072 are the outlook and the list of certificates; the outlook speaks of the field equation as "the sequel" in M1's own words, with no display;
   - `registers/Rulings_In_Force.md` ll.1–45 only (its §§1–3; two rows were added at the end of §3 on 11 November, P98; the heading of §4 is at l.46 and nothing from it on is read);
   - Decision Log rows P88 onward: `grep '^| P\(8[89]\|9[0-9]\) ' registers/Decision_Log.md`. The next number is **P99**. Row format: `| Pnn | date | **Title (PI).** text, the PI's words verbatim in quotation marks | tags |`;
   - Corpus Errors Register, entry 32 only: `sed -n '/^## 32\./,$p' registers/Corpus_Errors_Register.md`;
   - Verified References, three rows: `grep '^| V-\(10\|14\|23\) ' registers/Verified_References.md`. **V-10** is Franks 1970 on surfaces and its row says "SECONDARY ONLY … Exact statement and hypotheses not read". **V-23** is Katok–Hasselblatt (entropy and periodic points of a hyperbolic automorphism of the torus) and its row says "NOT READ: no copy obtained … RECALLED". V-14 is a theorem on Anosov diffeomorphisms of tori that M1 no longer cites;
   - **as the work needs, and nothing else:** other files under `papers/M1/` (the earlier sections of `STEP_AUDIT.md`, the notes, `checks/`), `canon/M1/`, `MEFProof/Paper_M1/` and `tools/`, **except `papers/M1/LIFT_SIGN.md` §5, which is sealed.** The writing session did not read all of these. They are files of M1.
3. **Do not read:**
   - the series plan, `sow/Mx_Series_SOW.md`. At the end of the session its Status cell for M1 is edited without reading the file: the cell contains, once in the file, the string `J2–J11 open; one new version to be built when all are ruled; canon unchanged**`; replace that string by a script;
   - Rulings in Force from l.46 on; the rest of the Decision Log;
   - every other register and register row, and the ledger. (The architect's instruction; its reason is the breach of P94.) To write to a register, append a row in its format: Minimality, eight cells, `| # | Node | Choice space | Minimal option | Criterion | Stated at | Failure test | Status |`; Verified References, six cells, `| # | Statement as used | Source | Wanted by | Status | Notes |`; Definitions, three cells, `| **term** | definition | source |`; Corpus Errors, a new `## 33.` section at the end. CLAUDE.md §6 asks that a term be used as the Definitions Register defines it: for J2 quote M1's own defining text instead, and ask the PI before opening that register;
   - `papers/M3/`, `sow/M3/` and `canon/omega-definition-usage_v2.md` (the architect's additions: the first two were drafted against the withdrawn M2; the third is named in the sealed list);
   - anything in the sealed list.
4. **J2, as the audit has it** (`STEP_AUDIT.md` §11.1 row T3; §11.3, question A; §11.4, row T3; §11.5):
   - the torus is obtained by assuming the drive "an Anosov diffeomorphism commuting with ι" (Proposition 5.5, l.501), and Section 4 treats the drive only on the torus (l.277), where Proposition 4.1 (ll.279–291) gets hyperbolicity for a linear map;
   - Definition 2.9 (l.232) asks neither Anosov, nor a return map on one fibre, nor commutation with ι;
   - l.235 says the strong form "is not assumed";
   - Franks gives topological conjugacy to a linear map (l.505), where the statement has the drive an element of SL₂(ℤ) (l.501); return maps that are not linear are not excluded; on negative traces M1 has l.295 ("The trace is taken positive. This is an input and not a selection");
   - the measure for which the periodic points have "measure zero" is not named (ll.229, 232, 290; §11.8, M-d);
   - row T19 (clause (a) on the drive presupposes the torus, which Proposition 5.5 gets by clause (c)) belongs to J5 and is taken there; it is named here only because it touches the torus.
   - Failure test of T3: "a line of M1 that derives 'Anosov, commuting with ι, with a return map' from Def 2.9 before l.501".
   - Reader B's example, RECALLED and to be verified or dropped before anything rests on it: a surface of genus three, a double cover of the torus branched at four points, with a pseudo-Anosov map commuting with an involution that has exactly four fixed points.
   - **Method, as for J1** (see P89 and `STEP_AUDIT.md` §11.6): the texts quoted; numbered assumptions, each sourced; then wait. A lead is tested blind before it is used, with the protocol and a prediction written first (`COMMUTANT_LEAD.md` is the pattern). CLAUDE.md §5 applies: the step audit, the red-flag scan of every source used, an independent check by a fresh sub-agent.
5. **Everything the new version of M1 has to take in** (nothing of it is drafted until all of J2–J11 are ruled, P92(3)):
   - J2–J11 as they are ruled (`STEP_AUDIT.md` §11.5);
   - J1: the tenth numbered choice stated (P92; Minimality M1-15), with ll.661, 677, 685 and row E11 reworded;
   - the integer two on S² stated, with the mark for the sphere's own winding (P97(1); Minimality M1-16);
   - the unnumbered readings numbered, from the list of `STEP_AUDIT.md` §11.9 as the PI rules on each (P97(2)); the places that count the choices change with them (ll.129, 163, 181, 193, 211, 223, 239, 247, 964, and the theorem's own list at l.967);
   - the findings carried from the M2 notes (`STEP_AUDIT.md` §11.8). That they are items for the new version is the architect's consequence drawn in P95, not the PI's words. **M-j, the worked example at l.578, is not among J1–J11;**
   - the finding on the two levels of Definition 2.7 (`COMMUTANT_LEAD.md` §4; Corpus Errors 32(o)): the architect's addition; no ruling makes it a condition of the build;
   - the wording items of Corpus Errors entry 32.
6. **Order after J2: the architect's recommendation, not ruled.** J5, J6, J9 need work of the kind J1 did; J7, J8, J10, J11 are lighter. J11 turns on a ruling known here only through one sentence of the earlier audit (`STEP_AUDIT.md` §8, "Disclosure": the PI "has ruled the pillowcase (P34 (2))"); P34 is a sealed row and the PI would have to state it. J3 and J4 concern the warp, the functional and the unfixed proportions, which the new M2 will derive; the architect recommended (P93) that they not be taken in a chat that has read the barred rows of the series plan. The PI decides whether that still applies.
7. **Sources.** The PI: "can't obtain further sources" (P97). Franks 1970 and Katok–Hasselblatt are not read (item 2, V-10 and V-23). The consequence, the architect's and from CLAUDE.md §6: a statement of theirs that M1 relies on is closed by hand in M1, or declared there as an assumption with its failure test. Whether the session may itself look for an openly hosted copy on the web is not ruled; the writing session did so once, for Atiyah–Bott–Shapiro, through a sub-agent and with nothing of the project in the request. Ask the PI before doing it again.
8. **Tools (from the writing session's own experience).** `pdftoppm` is not installed. PyMuPDF (`import fitz`) is in the user's Python packages; pages of a scanned PDF are rendered to PNG by a short script and read with the Read tool.
9. **Ruled on 11 November after the audit (P97).**
   - **The new version of M1 states the integer of the determinant line on S², and it is two** (Minimality M1-16). The PI's words answer whether the new M1 states it ("yes"). The value and its read-back were confirmed for M2 in P85, a sealed row whose content on this point P97 repeats; no separate read-back was made for M1 (flagged by the dry run). Owed in the new version: the mark for "the sphere's own winding is two"; with no further sources that means CHECKED by hand.
   - **The unnumbered readings become numbered choices.** The principle is ruled. The list is `STEP_AUDIT.md` §11.9 with §11.1 rows T1, T4, T11; each item is put to the PI with its wording before it is numbered, since some may prove to be consequences and not choices.
   - **No further sources** (item 7).
10. **An M1 session is not blind for M2.** Rows P88–P98, and `STEP_AUDIT.md` §11 (rows T10, T13, T15, §11.8), name in outline, and in places in full, what the sealed second start of M2 stood on; P97 repeats the content of the sealed row P85. This is deliberate: the M1 findings had to be kept. The consequences are the architect's and are flagged in P96, not ruled: a chat that has read them is not the chat that writes the new M2, and the new M2 session's reading list, written when M2 opens, keeps them from it.
11. **Breaches and readings of the writing session, disclosed (P88, P94, P98).** It read: `sow/Mx_Series_SOW.md` ll.1–87; the headings of entries 13–31 of the Corpus Errors Register, the first paragraph of entry 13 and the last lines of entry 31; the handover of M2's second start in full; of that start's step audit, the section "Independent check of N0" and the opening of the section after it; a few lines of its SOW/DAG printed by a search; the first lines of several rows of the Minimality, Verified References and Definitions registers printed while matching formats. It did no M2 work. P92 and P97 were ruled in it.
12. **For the PI at the start of the next session** (points the dry run could not settle from the text):
    - whether the session may look on the web for Franks 1970 or Katok–Hasselblatt (item 7);
    - whether it may open the Definitions Register's section for M1 (item 3);
    - whether P97(1), the integer on S² for M1, wants its own read-back (item 9);
    - the order after J2, and whether J3 and J4 are held back (item 6).
13. **Labels that come from sealed files and are not needed:** N0–N3 (notes of M2's second start); R-a, R-b (readings discussed there); "handover item i" in `STEP_AUDIT.md` §11.1 row E12 is finding M-i of §11.8; "M2 steps 1–3", "the third M2 session" (that start's work package and this chat). Minimality rows named by number in `STEP_AUDIT.md` (M1-3, M1-4, M1-10, M1-12) are entries of a register that is not read; M1-15 and M1-16 are described in this file. Reader A's own numbering ("its 4.1–4.28", "7.10") is in `STEP_AUDIT.md` §11.9; the rest of A's report is in no file.
14. **Commit state:** see `git log` and `git status`. Everything since 3e3b86f (P95–P98, the move of the M2 files, the register entries, this file) was committed together after the dry run's findings were corrected; the PI's word for it was "Bank the above" (P97, P98).

## Sealed: not to be read until the new M2 is written and recorded
**Carried word for word from the handover of M2's second start, which is itself now sealed:**

- `superseded/M2_v1/` (the withdrawn M2 v1.0, its certificates, plan and audit notes).
- **`registers/Decision_Log.md`: every row above P40**, that is, the section of 8 November and the rows P1–P39. If a later row is needed, the PI names it.
- **`registers/records/2026-11-11_M2_opening_musing_SEALED.md` and its figure.**
- **`registers/Rulings_In_Force.md` §§4–6.** (§7 was not read either.)
- The ledger's section on M2 v1.0 and the section of targets after it.
- The rows headed "M2 v1.0" in `registers/Minimality_Register.md`.
- Definitions Register rows that cite `M2_WP…`; Verified References rows that cite M2, its work packages or `papers/M2/…` notes.
- The display of the Master Equation in `canon/omega-definition-usage_v2.md` (its §6a may be read).
- `papers/M1/LIFT_SIGN.md` §5.
- The series plan's rows for M6, M7, M9, M10 and M16. Only the Status cell of the M2 row is edited.
- `sow/M3/` was not opened; it may carry wording from the withdrawn paper.
- Do not search the ledger, the registers or the Decision Log for "M2".

When the derivation and its results are written and recorded, and only then, they are compared with the sealed material and with the canonical form of the Master Equation. That comparison is a consistency check and not a test.

**Notes on the carried list (the architect's; some of its lines were written for an M2 session and are stale here):**
- "Only the Status cell of the M2 row is edited": for the next session it is the Status cell of the **M1** row (item 3).
- "`papers/M2/…` notes": that folder no longer exists; the path survives only as text inside register rows.
- "(§7 was not read either.)": said of M2's second session.
- "`canon/omega-definition-usage_v2.md` (its §6a may be read)": for an M1 session the whole file is not read (item 3).
- The closing paragraph ("When the derivation and its results are written and recorded …") speaks of the new M2 and has no bearing on an M1 session.
- `sow/M2/` no longer exists either.

**Added 11 November 2026 (PI, P95: "seal the current M2 notes"):**
- `superseded/M2_second_start/` (the handover of the second start, its SOW/DAG, its step audit, and the notes N1, N2 (two files) and N3). The M1 findings in them are copied to `STEP_AUDIT.md` §11.8 and are read there.

**Added 11 November 2026 (PI, P96: "I agree P71-P87 be sealed.  Should not be read, to make M2 a true fresh start once we have completed J2-J11"):**
- Decision Log rows P71–P87, for every session. What they hold about M1 is in `STEP_AUDIT.md` §11.8.
