# Handover: build the new version of M1

**Written 13 November 2026 at the PI's direction ("Create a handover document for the build of the new M1"), at the end of the session that closed J10 and J8 (Decision Log P151–P157). Every one of J1–J11 of the audit of Theorem 8.1 has its outcome; what remains is to build one new version of the paper from the write-up log (P92(3)). This file is the working brief for that. It does not replace `papers/M1/HANDOVER.md`, which is the paper's handover and holds the history; this file says which parts of that file are read, and governs where the two differ. `papers/M1/HANDOVER_J10_J8.md` and `papers/M1/HANDOVER_J7.md` are spent and are not read.**

**Checked** by a fresh reader (P158); rewritten in §§1–3 and 15 for the process the PI set at P159; checked again with CLAUDE.md and the protocol (P162); see §16.

---

## 0. First, in this order

1. Post: *Verify-first is on. I will list assumptions and wait. I am not the SME; you direct.*
2. Read `CLAUDE.md` from the file on disk.
3. Read this file whole.
4. Then the reading list of §8, and nothing else. The list is a whitelist.

Run every command from the repository root, `/home/dhiren/MEF_Proof`.

**In plain English, what the build is.** The mathematics is settled. Over J1–J11 the PI confirmed, word for word, the sentences that replace or add to canon v6.3; they are the thirty-five active entries of `papers/M1/WRITE_LOG.md`. The build puts those sentences into the paper exactly as confirmed, removes the sentences of v6.3 round them that no longer fit, or replaces their wrong words by words copied from a confirmed sentence, checks the result, and moves it into canon. **No choice is reopened and no new mathematics is proposed.**

---

## 1. The task

Build version 7.0 of M1 from canon v6.3 (`canon/M1/Paper_M1_Six_Axioms_v6_3.tex`) and the active entries of `papers/M1/WRITE_LOG.md`, **by the process the PI set at P159 (§2)**.

The PI's aim, in the PI's words (P159): "I really don't want to see the change list. I want to make sure that whatever we spent the last 2 days agreeing on is in the new version v7.0". And the reason for the process: "I was very annoyed to have to go through 2-3 days of all these J1-J11 revisions because you did not have a robust process for creating a paper."

The standing rule it sits on (CLAUDE.md §10, as amended at P161): "The paper is assembled from the active entries by `tools/Paper_assembly_protocol.md`: the entries go in word for word (Pass A); what no longer fits is found and fixed by deleting or copying, never by composing (Passes B and C); the flow is improved only after that, and a check shows that no meaning moved (Passes D and E). No pass changes a logged statement (gate 8)."

Three kinds of text are in the new version:

1. **An active entry.** It goes in word for word and is never edited, shortened, merged or re-punctuated, in any pass. `python3 tools/writelog_check.py M1 <paper.tex>` checks every active statement against the paper, white space apart, and must pass on every pass from A to E.
2. **A sentence of v6.3 that an entry or a ruling makes wrong** (the index of §5). It is removed, or its wrong words are replaced by words copied from a confirmed entry. It is never paraphrased (§2, the rule of Pass B).
3. **Everything else of v6.3.** It is copied unchanged. Pass A is made by a script that applies named replacements to v6.3, each matching exactly once (§12), so that what was not meant to change cannot change.

---

## 2. The process (PI, P159)

**The protocol is `tools/Paper_assembly_protocol.md` (named by the PI, P160), which is general to the Mx series and governs where this section differs from it. This section is that protocol applied to M1; read the protocol first.**

**The PI's words:** "1. Create the new version as we agreed taking the verbatim edits and putting them into the first pass of the new document. - Pass A 2. Check Pass A is actually as it is meant to be - create an error log 3. Modify version Pass B - check - create error log B. If there are more errors / new errors in B than in A - stop and tell me. Otherwise incorporate Error edits to create Pass C 4. Go through Pass C and create a better flowing structure Pass D 5. Check that Pass D has the same meaning as Pass C - if not then edit and create Pass E 6. Check Pass E for meaning with Pass C". Four modifications were put by the architect and accepted ("1-4 accepted, only look at the end , yes list it"); they are written into the steps below and marked **(mod. n)**.

**What an error is (mod. 1).** Exactly these five kinds, fixed before Pass A so that log A and log B can be compared:

1. a confirmed sentence missing or altered (checked by `tools/writelog_check.py`, not by the architect);
2. an old sentence still standing that a confirmed sentence replaces or contradicts;
3. an old word that a ruling removed (for example "stabiliser", "aspect ratio", "measure zero") still in use where the ruling applies;
4. a broken reference or number;
5. a failure to compile.

The same script and the same checking brief are used for A and for B. The checking brief for kinds 2 and 3 is written once, before Pass A is checked, saved beside the passes, and not changed afterwards.

**The steps.**

- **Pass A.** A build script takes v6.3 and puts in the thirty-five active entries, word for word, each at its place (§4). Where an entry replaces a canon passage one for one (a definition, a statement, a clause, a table row), the script substitutes it. Where it is new, or is not one for one (M1-W001, M1-W003, M1-W004, M1-W005, M1-W007, M1-W008, M1-W009, M1-W013, M1-W020, M1-W026, M1-W031, M1-W032, M1-W034, M1-W035, M1-W036), the script inserts it whole at the mapped place and leaves the canon sentences round it as they are. Nothing else is touched. Pass A is not expected to read as a paper; it is expected to hold everything that was agreed.
- **Check A, error log A.** Kind 1, the undefined references of kind 4, and kind 5 by script and by gate 1; a kind-1 error is not left for Pass B: the pass is remade by script at once and the error recorded. Kinds 2 and 3, and the numbers and counts written out in the prose (kind 4), by a fresh reader given Pass A, the write-up log, Corpus Errors entries 32 to 36, the index of §5 and the fixed checking brief, and no conclusion (mod. 4); the architect verifies each finding against the files; **every finding is logged, and one the architect rejects stays in the log, marked rejected with the reason.** Every error gets a number, its kind, the offending sentence quoted, and its source. The reader is not given the other pass or the other log.
- **Pass B.** The errors of log A are fixed **by deleting or by copying, and in no other way (mod. 2)**: an old sentence is removed, or old words are replaced by words copied from a confirmed entry. The architect does not compose and does not paraphrase. **Where a fix cannot be made without a new sentence of mathematics that no entry contains,** the sentence is written as short as it can be, set in the `.tex` between the comment lines `% COMPOSED n: begin` and `% COMPOSED n: end`, and entered in the list of composed sentences with its number, what it joins and why it was needed. These are not shown to the PI as they arise: **the PI looks at them at the end** (P159).
- **Check B, error log B.** The same script, the same brief, a fresh reader again. **If log B has more errors than log A, or holds an error that was not in log A, stop and tell the PI**; the rule is applied as written, and the report says of each such error whether Pass B introduced it or the first check missed it. Otherwise the errors that remain are fixed, by the same rule, to give **Pass C**. The script checks are run on Pass C until they pass, and a fresh reader confirms, item by item, that each error of log B is gone.
- **Pass D: flow.** Pass C is gone through for a better flowing structure. **It is fenced (mod. 3):** the thirty-five confirmed sentences stay frozen and `tools/writelog_check.py` must pass; paragraphs may be reordered and linking sentences added; **no sentence that states mathematics is reworded, whether it came from an entry or from v6.3**; and a script confirms that every mathematical sentence of Pass C appears unchanged in Pass D. Each linking sentence added is marked `% LINK n` so that the checks can find it.
- **Check D against C; Pass E.** A fresh reader, given both texts and no conclusion, checks sentence by sentence that Pass D means what Pass C means (mod. 4); the architect, having written D, does not judge it. Where the meaning has moved, it is put back from Pass C: a changed sentence is restored by copying, a reordering is undone, a linking sentence is removed. The result is **Pass E**; if nothing had moved, Pass E is Pass D.
- **Final check: E against C.** Gate 8, the script of Pass D, and a fresh reader on whatever differs between D and E. **If Pass E still differs from Pass C in meaning, stop and tell the PI. No Pass F is begun unasked.**

**After Pass E.** Gates 1 to 5 and gate 8; one reader with the whole paper and the six axioms (P104, point 5), its report taken by the sense check protocol of CLAUDE.md §11; the step audit of the new version and the red-flag scan (gates 6 and 7). None of this needs the PI unless something fails. **The move into `canon/` is made at the PI's word** (CLAUDE.md §§6, 7), with the ledger and the registers (§12).

**What the PI is shown, and when.** Nothing in the course of the passes, except at one of the four stops of the protocol: the two stop rules above; something that looks like an error of mathematics, reported in a sentence with the lines and not pursued; a confirmed entry that cannot be printed as it stands. At the end, after the checks that follow Pass E, one short report: that all thirty-five sentences are present word for word; the error counts of logs A and B; the composed sentences, each in plain English and then as printed; the verdict of the meaning checks. The PI confirms the composed sentences then; each one confirmed becomes an entry of the write-up log (CLAUDE.md §10), and one not confirmed is reworded at the PI's word.

**Ruled already, and the first composed sentence (P159):** the statement of Theorem 8.1 lists the integer two on S² among the data it names ("yes list it"). Its wording is copied as far as possible from M1-W036 and is set between `% COMPOSED` lines like the others.

**Where the files live.** The passes, the two error logs, the checking brief and the list of composed sentences are kept in `papers/M1/build_v7/` (`passA.tex` … `passE.tex`, `ERROR_LOG_A.md`, `ERROR_LOG_B.md`, `CHECK_BRIEF.md`, `COMPOSED.md`), each written there as it is finished, so that a later session resumes from the last finished pass; committing is at the PI's word, as for any work. Scripts are kept in `papers/M1/checks/` and `tools/` (§12).

**Work package.** One work package per session (CLAUDE.md §1). **The first session's is Pass A to Pass C**, ending with a status of a few lines (the counts; whether a stop rule fired) and not with a list. The second session's is Pass D to the final check. The third is what follows Pass E. A session stops only at the end of a pass or at one of the four stops.

---

## 3. The method

- **Entries are copied, never retyped.** Take each statement from the fenced `tex` block of its entry by script.
- **Delete or copy; never compose (P159, mod. 2).** The PI (P104): "an LLM heavily summarises text. When doing that with mathematical language the summary changes the meaning. You must not do that." Where a line of v6.3 has to change, the words that replace it are found in the entries or elsewhere in the paper and copied (CLAUDE.md §11; traps 1–3 of §13). What cannot be had by copying is a composed sentence and is handled as §2 says.
- **Checks are not made by the hand that wrote (P159, mod. 4).** Scripts for what a script can check; a fresh reader, given no conclusion, for the rest. Every finding a reader returns is verified against the files before it is acted on.
- **The PI is not asked along the way (P159).** No change list, no questions on presentation. The PI: "if we are forced to make a choice then make the choice … numbering is presentation and irrelevant" (P154). How the choices are counted in the text, where a sentence is placed, how results are renumbered: take the conventional option and go on. The only things that reach the PI before the end are a stop rule of §2 and something that looks like an error of mathematics, which is reported in a sentence with the lines and not pursued (CLAUDE.md §§4, 5).
- **Plain English first** when anything is put to the PI: two or three plain sentences on what and why, before any TeX, table or code (P154).
- **A confirmed statement is not changed by the architect.** If an entry cannot be printed as it stands, that is a stop: the corrected wording is put to the PI and, if confirmed, is a new entry that retires the old one (the precedent is P118, P122, P131, P136, P149, P157).
- **No counter-examples (P105; CLAUDE.md §5).** Looked for only when the PI asks for one explicitly, naming the statement.

---

## 4. The map: where each active entry goes

Thirty-five active entries. "Replaces" means the entry stands in place of the canon text named; "new" means canon v6.3 has no such passage. Where an entry says what it replaces (in its "Rests on", "Mark" or "Retires" line), the entry is the authority and this table is the index. **For M1-W001, M1-W004, M1-W005 and M1-W009 no line of the entry names a place: "at l.277" is the writing session's reading, from Corpus Errors 33(c) and the canon lines the entries quote. M1-W035 says its place is for the build.** These placements are presentation (§3). Lines are of canon v6.3.

| Entry | What it is | Place |
|---|---|---|
| M1-W025 | Definition 2.4 (growth and decay) | replaces l.190 |
| M1-W016 | Definition 2.7 (the two levels) | replaces l.214 |
| M1-W035 | the tenth choice: complex spinors | new; with Definition 2.7 (ll.211–217), the place to be chosen |
| M1-W021 | Definition 2.8 (orbits are realised) | replaces l.220 |
| M1-W006 | Definition 2.9 (drive) | replaces l.232 |
| M1-W027 | Definition 3.1 (modulus) | replaces l.258 |
| M1-W012 | the opening sentence of Definition 3.2 | replaces l.262 |
| M1-W010 | clause (c) of Definition 3.2 | replaces l.268 |
| M1-W032 | Definition "the same geometry; unique" | new; after Definition 3.2 |
| M1-W034 | remark on mirror image and run backwards | new; after the new definition |
| M1-W001 | a step keeps the handedness; determinant +1 | new; at l.277 |
| M1-W004 | the drive moves only the fibre that carries it | new; at l.277 |
| M1-W005 | the step is the linear map of its matrix | new; at l.277 |
| M1-W009 | time is a circle; the internal piece carried round it | new; at l.277 (the paper's own lines: ll.163, 175, 235, 277, 845) |
| M1-W007 | the points that return are the rational points | replaces the clause of l.290 on periodic points |
| M1-W017 | Lemma 5.1 (the norm form) | replaces l.449; its proof (ll.453–455) no longer fits it and is for the error checks |
| M1-W015 | the step of the proof of Proposition 5.2 | replaces the sentence of l.467 |
| M1-W013 | the fibre is a surface | replaces the sentence of l.513 beginning "Clause (c) … selects the least dimension" |
| M1-W003 | the fibre is the torus | Proposition 5.5 and its proof (ll.501–513) |
| M1-W008 | the drive commutes with the fold | with Proposition 5.5 (l.501) |
| M1-W029 | Proposition 5.6 (the corner algebras) | replaces l.521 |
| M1-W026 | the geometry satisfies A2 | new proposition; after the fibre and the fold are derived |
| M1-W031 | remark: where the quaternionic structure carries information | new; after Theorem 6.1 |
| M1-W019 | Proposition 7.2 (the projective plane) | replaces the statement at l.677 |
| M1-W036 | the integer two on S² | new; in the paragraph of l.712 |
| M1-W024 | Definition 7.4, second paragraph | replaces l.719 |
| M1-W023 | Definition 7.4, last paragraph | replaces l.725 |
| M1-W020 | the base has no further factor | new; in the proof of Theorem 7.10, after the sentence of l.953 |
| M1-W028 | the declared-input clause of Theorem 8.1 | replaces "with the aspect ratio of the fibre held by a declared sector" in l.967 |
| M1-W037 | table row E2 | replaces l.1003 |
| M1-W038 | table row E3 | replaces l.1004 |
| M1-W040 | table row E8 | replaces l.1009 |
| M1-W041 | table row E9 | replaces l.1010 |
| M1-W043 | table row E11 | replaces l.1012 |
| M1-W030 | table row E12 | replaces l.1013 |

**Row E6 (l.1007) and the tags of Theorem 4.2 and Proposition 4.5 are not changed (P154, P155).**

**Not worked out by the writing session, and where composed sentences are most likely to be needed:** M1-W003, M1-W008 and M1-W013 between them replace the hypotheses and most of the proof of Proposition 5.5 (ll.501–513). They are three statements written at three times; how they sit together as one proposition with its proof, and which sentences of ll.507–511 remain, has **never been examined** (`HANDOVER.md` item 16: "how the rest of its proof (canon ll.507 on) reads was not examined"). Each must still appear word for word.

---

## 5. Lines of v6.3 that change and have no entry

These are the sentences of kind 2 in §1. **This section is not a list for the PI (P159): it is what the error checks of §2 are run against.** The sources are the Corpus Errors Register, entries 32 to 36, which were written for this purpose, and the "for the build" bullets of `HANDOVER.md` items 16 to 24. **Those are the authority; the list below is an index made from them and is to be checked against them, not used in their place.** Lines are of canon v6.3.

**Changed by an entry (the wording round it):**

- ll.229, 286, 290: measure (M1-W006, M1-W007; Corpus Errors 33(a)). l.290's entropy $\log\lvert\lambda\rvert$ still rests on Katok–Hasselblatt, V-23, not read.
- ll.262, 271: "applied in order"; "the four it names"; "applied after clause (b)"; "the fewest dimensions" (M1-W010, M1-W012; 33(d)). l.992: the list of what a reader loses without clause (c) does not name the fibre (33(e)).
- l.277: the paragraph that M1-W001, M1-W004, M1-W005 and M1-W009 join (33(c)).
- ll.453–455, 458, 471, 546–552: the proof of Lemma 5.1, "corner subalgebra", "the corner fibres included", the split quaternions (M1-W017, M1-W015; 33(f)). l.209 says the algebra is finite-dimensional and associative and does not say it has a unit, which M1-W017 writes in as a hypothesis.
- ll.501, 505, 507–513: Proposition 5.5 and its proof; "Anosov", "commuting with ι" and the citation of Franks leave (33(b); §4 above).
- ll.533, 578: "stabiliser" (M1-W029; 34(g); Rulings l.51: "ll.533 and 578 are owed at the build"). l.533 also cites "Definition 2.9(iii)", which has no numbered clauses (32(k)), and says "generic" (34(g)). **Found by the fresh reader of this file and in no register item:** canon l.525, in the proof of Proposition 5.6, also has "the surviving algebra at a point is what its stabiliser fixes".
- ll.661, 677, 681, 685: "If a Spin^c structure selects one unit"; "the Spin^c line of Proposition 7.3 below"; "the maximal torus of U(3)"; the sentence naming the two readings (M1-W019, M1-W035; P92; 32(a), 32(b), 33(j), 33(k)).
- l.953: the proof of Theorem 7.10 (M1-W020; 33(l)).
- Every line that says "state" or "state at rest" is read again with M1-W024 and M1-W023: ll.161, 728, 731, 737, 741, 743, 765, 773, 777, 783, 785, 793, 1049; l.161 above all (the mark of M1-W023).
- l.127, from "The symbol ×_w records", with the displays at ll.125 and 969: the prose and the displays pair different pieces and the new version must not read as though they agree; which piece the ×_w of the displays scales is **owed by M2** (Future-Mx F-10) and is not fixed here (34(b); M1-W025, M1-W026).
- ll.239, 602, 967, 992: the aspect ratio is no longer the declared input; "declared sector"; the failure sentence of l.992 (M1-W027, M1-W028; 34(d), 34(e), 34(f)).
- l.442: "without saying that the geometry run backwards is another geometry" (M1-W034; 35(b)). The other point of that sentence, the symmetry that mirrors the torus, stays declared open with its failure test.
- ll.55, 122, 967, 992: "unique", read again with M1-W032 (35(a)).
- The elimination table: row E7's "corner unit groups"; the "Where" columns of rows E8 and E9 (`STEP_AUDIT.md` §11.21).
- The places that count the choices: ll.129, 163, 181, 193, 211, 223, 239, 247, 964, and the theorem's list at l.967. The tenth choice is "the seventh of Section 2" (P92). The architect's readings of which unnumbered sentences sit under which existing choice are in `STEP_AUDIT.md` §11.20; they are readings, and how the count is worded is presentation (§3).

**Wording items changed by no ruling (Corpus Errors 32, 33, 34):**

- l.116 against l.892 (φ against φ² per step; 33(h)).
- l.163: "the second axiom will insist that it does" (which pieces are tied; 34(i)).
- l.166: "a geometry satisfying the other four axioms" (32(k)).
- l.223: "Section 7, where the other possible reading is set out"; it is at l.992, in Section 8 (33(m)).
- l.349 against l.357 (32(l)).
- ll.521, 529, 536: Proposition 5.6, statement against proof (32(i)). M1-W029 keeps "ι acting as conjugation".
- l.531 against Appendix B (l.1075) and l.578: the corner labels against the cycle (32(j)).
- Names used for two things: "F", "the time factor", "M" (32(n)); ll.123–126, the torus twice in the display.
- ll.615, 943: the block against a compact time circle (`STEP_AUDIT.md` §11.8, M-k); l.943 has "the block is modelled on $\Hquat^{\times}=\R_{>0}\times S^{3}$" and l.615 "that of $\Hquat^{\times}=\R_{>0}\times S^{3}$".
- l.295: "This is an input and not a selection" (§11.20).
- Appendix A (l.1039) and the bibliography (ll.1080, 1081): Franks is named among the classical theorems; whether it is still cited anywhere after ll.505 and 513 change.
- l.992: "the base is then determined among products only"; the architect could not tell what it claims (`HANDOVER.md` item 19). It is left as canon has it and named in the end report.
- **ll.300, 409 (Corpus Errors 32(h)): nothing is done.** The register's "Action" line classes item (h) with the wording items, but the PI dropped the reading put on it and struck its sentence (P155, P157): Theorem 4.2 and Proposition 4.5 are printed as canon has them, with their [R].
- Terms: "anti-involution", "unit group" and "norm form" are not in the Definitions section for M1, and whether they are entered is for the build (`HANDOVER.md` item 18): rows are proposed with the registers at the move into canon; reader A's list of terms used and not defined (`STEP_AUDIT.md` §11.9, its 7.10) is for the Definitions Register at the build (§11.20). The Definitions Register has, outside the section for M1, an older row at its l.107 beginning "state of the fibre at rest; state on the pillowcase", not read, to be brought into line with the rows of P135 and P136 (`HANDOVER.md` item 20; leave is asked at §15).
- Marks to correct, the architect's wording and not confirmed statements: that of M1-W006, which calls Definition 2.9 "one of the paper's numbered choices of meaning" where canon l.239 does not list it (§11.20).

**The integer two on S².** M1-W036 states it at l.712. Canon also says "even" at ll.707 and 938, and the theorem's list of discrete data (l.971) gives no value on S², while l.964 says the conclusion "names … every discrete datum". **Ruled (P159, "yes list it"): the statement of Theorem 8.1 lists it**; the wording is the first composed sentence (§2).

---

## 6. Facts taken as known and not read at source

P97(3): no further sources can be obtained. Each is **closed by hand in the paper, or declared there with its failure test** (CLAUDE.md §6), before the paper prints the sentence that uses it. They are entered as owed in Verified References:

| Row | The fact | Used by |
|---|---|---|
| V-23 | the entropy of a hyperbolic automorphism of the torus is the logarithm of its larger eigenvalue | Proposition 4.1 (canon l.290, in its proof); the entropy $2\log\phi$ of Theorem 4.2 |
| V-28 | three facts on closed surfaces | M1-W003 |
| V-29, V-30 | a compact connected one-dimensional manifold without boundary is a circle; a connected manifold of dimension zero is a point | M1-W013 |
| V-31 | ℂP² = U(3)/(U(1) × U(2)) = SU(3)/U(2); U(3) carries any complex line of ℂ³ to any other | M1-W019 |
| V-32 | the degree of a line on the sphere; the determinant of the canonical Spin^c structure; the anticanonical line of the sphere is its tangent line | M1-W036 |
| V-33 | three Euler characteristics; the product rule | M1-W043 |

Read these rows by number (§8). The marks of the entries name further things taken as known in a hand check (for example in M1-W013, M1-W019, M1-W021); read each entry's mark.

---

## 7. Checks owed at the build

Carried here by the J-sessions; none is a new proposal. **Where they go in the process:** none is put to the PI along the way. Items 2 to 6 are given, as the list of what the entries say is not shown or not claimed, to the whole-paper reader after Pass E, and whatever of them is still open is named in the end report. Item 7 is covered by the readers of the passes, who have every entry before them.

1. **The whole-paper reader, after Pass E** (P104, point 5): every restored sentence stated in full, checked by a reader with the whole paper and the axioms.
2. **From J7** (`STEP_AUDIT.md` §11.19, rows S7–S9; `HANDOVER.md` item 23): that the proof of Theorem 8.1 delivers each datum up to a relabelling of M1-W032; that the definition applied to the step alone is the count of clause (a) (one direction immediate, the other RECALLED and unread); that the quarter-turn with time run backwards carries every datum of M₁₂ to itself (M1-W034 says it is not shown); that the mirror image of M₁₂ is or is not M₁₂ (not claimed; the symmetry that mirrors the torus is declared open at canon l.442).
3. **From J3 and J4:** the theorem claims existence (P140, Q1; Rulings l.49); that the almost-quaternionic structure exists on the whole of M₁₂ is **declared and not shown** (M1-W031; `STEP_AUDIT.md` §11.18). Reported as not sure and not ruled: that nothing else on the fibre is free (the mark of M1-W028: "it is a check at the build").
4. **From J5:** at Theorem 6.1 clause (c) is used before any use of clause (b); no line says that clause (b) would not select differently (the mark of M1-W012, which carries it to J3; `HANDOVER.md` item 4 says it "ended with J3-a (P140, Q1)", and no later record takes it up, so that it is here on the writing session's own reading and not on a J-session's). Also from J5: M1-W003 says "an involution of $X$" and does not say that it is continuous; "it is put to the PI when M1-W003 is next touched" (`HANDOVER.md` item 17; the flag of P118 on the entry); the build prints M1-W003 as confirmed, and the point is named in the end report.
5. **From J9:** M1-W016 does not say how the fibre algebra acts on spinors; canon speaks of it at ll.536, 566, 728, 837 (`HANDOVER.md` item 18).
6. **From J6:** the meaning of "symmetry" in Definition 2.8 is provisional in the PI's word (P126; M1-W021); M1-W020 supposes that a unit and a complex direction are the only structures selected; M1-W019 does not say what selects the complex direction (`HANDOVER.md` item 19).
7. **Entries not yet checked by a fresh reader:** M1-W013, M1-W017, M1-W021, M1-W024, M1-W034 and M1-W043 (each says so in its mark).
8. **The step audit of the new version** (gate 6) and **the red-flag scan** (gate 7). The audit of v6.3 is `STEP_AUDIT.md` §§8–11; the new version's main theorem needs its own table.

---

## 8. Read

- **this file**, whole; **`CLAUDE.md`**, from disk.
- **`canon/M1/Paper_M1_Six_Axioms_v6_3.tex`**, ll.1–1105. It is 1105 lines; the Lean listings are pulled in by `\lstinputlisting` and are not in the file.
- **`papers/M1/WRITE_LOG.md`**, every entry. Forty-three entries, M1-W001 to M1-W043: **thirty-five active and eight retired** (M1-W002 by M1-W010, M1-W011 by M1-W013, M1-W014 by M1-W017, M1-W018 by M1-W021, M1-W022 by M1-W024, M1-W033 by M1-W034, M1-W042 by M1-W043, and M1-W039 with nothing replacing it). **The next number is M1-W044.**
- **`papers/M1/HANDOVER.md`** from the heading `## Audit of Theorem 8.1` to the end. Items 16 to 24 are the records of the J-sessions; their "Carried forward" and "for the build" bullets are sources of §5 and §7. In item 24 read the bullets on P154, P155, P156 and P157 first: they correct the bullets written before them.
- **`papers/M1/STEP_AUDIT.md`** §11, from the heading `## 11.` to the end. §§11.12 to 11.21 are the outcomes of the Js. As the work needs, §§8 to 10 (the step tables of v6.3's sections).
- **`registers/Rulings_In_Force.md` ll.1–56 only** (its §§1–3; the heading of §4 is at l.58 and nothing from l.57 on is read).
- **Decision Log rows P88 onward:** `grep '^| P\(8[89]\|9[0-9]\|1[0-9][0-9]\) ' registers/Decision_Log.md`. **The next number is P165** (P158 records this file, P159 the process, P160 the protocol file, P161 the changes to CLAUDE.md, P162 their check, P163 the opening brief of M2, P164 its check). Read P159 with the others named next. Read P92, P97, P104, P105, P140, P152 and P154 with care.
- **Corpus Errors Register from entry 32:** `sed -n '/^## 32\./,$p' registers/Corpus_Errors_Register.md` (entries 32 to 36).
- **Definitions Register, the section for M1 only:** `sed -n '7,30p' registers/Definitions_Register.md`.
- **Verified References, by number:** `grep '^| V-\(10\|14\|15\|21\|23\|27\|28\|29\|30\|31\|32\|33\) ' registers/Verified_References.md`. The writing session read only V-10, V-14, V-23, V-32 and V-33; the others are named in the entries' marks and in `HANDOVER.md`, and whether any of those rows cites M2 was not checked; the sealed list seals "Verified References rows that cite M2", so if a row printed by this command does, nothing is used from it and it is reported to the PI.
- **`tools/Paper_assembly_protocol.md`** (the protocol of §2).
- **`tools/README.md`** (the gates), **`tools/PAPER_FORMAT.md`** (content and layout), **`tools/writelog_check.py`** (gate 8), **`tools/m1_build_v6_3.py`** (the form of a build script).
- **`canon/MEF_Academic_Register_Guide.md`** (CLAUDE.md §6 requires it for the writing). The writing session did not read it; it is not on the sealed list.
- **`papers/M1/COMMUTANT_LEAD.md`**.
- **`tools/ROSETTA_STONE.md`** only when the PI writes "Please Rosetta Translate x", or to add a row.
- **as the work needs, and nothing else:** other files under `papers/M1/`, `canon/M1/`, `MEFProof/Paper_M1/` and `tools/`, **except `papers/M1/LIFT_SIGN.md` §5, which is sealed.**

---

## 9. Do not read

- **`sow/Mx_Series_SOW.md`.** At the end of a session its Status cell for M1 is edited **without reading the file**: the cell contains, once in the file, the string

  `J1 to J11 all closed (J10 and J8 at P151–P153); one new version to be built from the write-up log; canon unchanged**`

  Replace that string by a script; the new wording is the session's.
- **`registers/Rulings_In_Force.md` from l.57 on**; the rest of the Decision Log.
- **the ledger, the Minimality Register and the Future-Mx Register, unless the PI gives leave (§15).** The ledger has a sealed section on M2 v1.0; the Minimality Register has sealed rows headed "M2 v1.0"; the headings of the Future-Mx Register name M2 material (the writing session printed them by mistake: §16). Register row formats, for writing without reading, are in `papers/M1/HANDOVER.md` item 3 of "The next session" (on the reading list); the numbers to use are those of §11 here. No format for a ledger row is on the reading list. Leave is asked at §15 for the ledger and the Minimality Register; the Future-Mx Register is not read at all, and if a pass ends with something owed to a later paper a section `## F-11. <what is owed> — owed by M<n> (source)` is appended to it without reading.
- **every other register row.**
- **`papers/M3/`, `sow/M3/`, `canon/omega-definition-usage_v2.md`.**
- **anything in the sealed list** (`papers/M1/HANDOVER.md`, the section headed "Sealed: not to be read until the new M2 is written and recorded"). Decision Log rows P1–P39, the section of 8 November, and rows P71–P87 are sealed; what rows P71–P87 hold about M1 is in `STEP_AUDIT.md` §11.8.
- **An M1 session is not blind for M2** (`HANDOVER.md` item 10): the chat that builds M1 is not the chat that writes the new M2.

---

## 10. What the build may lean on

Rulings in force (`registers/Rulings_In_Force.md` §3, ll.25–56). All of §3 is read; the rows below are the ones the build turns on.

| What | Where |
|---|---|
| One new version is built when J2–J11 are ruled, from all the rulings together | P92(3) |
| The paper is assembled from the active entries word for word; no pass changes a logged statement | P107, P159, P161; CLAUDE.md §10; `tools/Paper_assembly_protocol.md` |
| The readings on which the proofs stand are needed and stay as stated; whether they carry numbers is presentation | P152, P154; Rulings l.55 |
| The tags of the elimination table; row E6 keeps its [R] | P153, P154, P157; Rulings l.56 |
| The tenth choice; the integer two on S² | P92, P97(1); M1-W035, M1-W036 |
| The three clauses are in an order of priority | P117; M1-W012 |
| Theorem 8.1 claims existence; one declared input | P140; Rulings ll.49, 50 |
| When two geometries are the same | P147; M1-W032, M1-W034 |
| No further sources: a fact of an unread source is closed by hand or declared with its failure test | P97(3) |
| Which piece the warp of the display scales is owed by M2 | Future-Mx F-10; Corpus Errors 34(b) |
| M2 waits for the new M1 and is started from scratch | P94, P95, P96 |

---

## 11. Numbers and pointers, true as of this file

| Thing | Value |
|---|---|
| Next Decision Log row | **P168** (P167 records the second session of the build, Pass D to the final check; P166 the ruling on canon l.127; P165 records the first session of the build, Pass A to Pass C; P158 this file and its check; P159 the process; P160 the protocol file; P161 CLAUDE.md §§2, 6, 8, 10 amended; P162 the check of those; P163 the opening brief of M2; P164 its check) |
| Next write-up log entry | **M1-W044** |
| Write-up log | 43 entries, 35 active, 8 retired |
| Next Corpus Errors section | **`## 37.`** |
| Rulings in Force §3 ends | l.56; §4 heading at l.58 |
| Definitions Register, M1 rows | ll.7–30 |
| Last Verified References row | V-33 |
| Last Minimality row of M1 named anywhere on the reading list | M1-20 |
| Last commit before this file | `5d5e8b3` |
| Canon | `canon/M1/Paper_M1_Six_Axioms_v6_3.tex`, v6.3, unchanged |

Gate 8 fails against canon v6.3 for all thirty-five active entries, as it must. It must pass on Pass A and on every pass after it.

---

## 12. Mechanics

- **The build script.** `tools/m1_build_v6_3.py` is the precedent: it reads the old `.tex`, applies named replacements each of which must match exactly once (`assert c == 1`), and writes the new file. The new script (the name follows the version) takes each entry's statement from the write-up log by its number, so that no statement is retyped.
- **The passes live in `papers/M1/build_v7/`** (§2) until the move into canon. To run the gates on a pass, see how `tools/gates.py` finds the paper (its function `main_tex`) before relying on it: a copy of the pass under test may have to stand in `papers/M1/` as the main `.tex` for the run. `tools/gates.py M1` takes the paper from `papers/M1/` if that folder holds a main `.tex`, otherwise from `canon/M1/` (`tools/README.md`); `papers/M1/mef_macros.tex` is there already. Nothing in `canon/` is edited before the move into canon, at the PI's word (CLAUDE.md §§6, 7).
- **The version.** Definitions 2.4, 2.7, 2.8, 2.9, 3.1, 3.2 and 7.4 change and a definition, a proposition and two remarks are added. The writing session's default, which the PI may change: the new version is **v7.0**, `Paper_M1_Six_Axioms_v7_0.tex`. This is presentation and is not put as a question.
- **Numbering.** Canon's `remark` shares the theorem counter (Section 2 runs 2.1 shadow, 2.2 the remark, 2.3 closure, 2.4 growth and decay, 2.5 the fibre algebra, 2.6 order, 2.7 the two levels, 2.8 orbits realised, 2.9 drive). The new definition after 3.2, the remark after it, the remark after Theorem 6.1 and the new proposition shift the numbers after them. The entries use `\ref` labels and survive; **prose in the registers, the Decision Log and the handovers cites numbers of v6.3**. The precedent for a table of old to new numbers is `canon/M1/NUMBERING_v5_to_v6.md`. Labels: `def:same` and `rem:whereH` are defined inside the statements of M1-W032 and M1-W031 and are not in canon; `def:modulus` is in canon (l.257); the new proposition of M1-W026 has no label in its entry, and the build gives it one.
- **Gates** (`tools/README.md`): `python3 tools/gates.py M1` for gates 1–5; gate 8 by `tools/writelog_check.py`; gates 6 and 7 by hand. `tools/README.md` records what the gates found on the papers as frozen on 9 November, two days before v6.3 (gate 2: the Lean listing frames of Appendix A; gate 3: four items kept as they stand, at line numbers that are not those of v6.3), "accepted by the PI (P15)", a sealed row. Run the gates on v6.3 first, to have the baseline for the new version.
- **Lean.** The certificates are in `MEFProof/Paper_M1/` (seven files; the paper lists six, `M1_L5_vacuum.lean` not being among them). No entry changes a certified statement. To be checked before Pass C is finished: every `\texttt{L…}` name the new text uses exists (gate 5); the header of `M1_L2_fibre.lean` if it names Lemma 5.1 (`HANDOVER.md` item 18: "if it names the lemma") or, the writing session adds, Franks; Appendix A's sentence naming the classical theorems (l.1039).
- **Layout** (`tools/PAPER_FORMAT.md`): in every proof and worked case each step starts on its own line. An entry that is a proof step is still printed word for word; the line breaks round it are white space, which gate 8 ignores.
- **The blanks of the M2 brief, at the move into canon.** `papers/M2/HANDOVER.md` §9 (P163, P164) has seven blanks that only the M1 build can fill, and the build reads that §9 for their exact terms: the file of M1 in canon; the numbering table from v6.3 to v7.0; a file of the failure tests of v7.0, made by script from the "Failure test" lines of the active entries and holding nothing else of the log; what M1 leaves owed by M2, as a separate file in the words in which it is owed (Future-Mx F-10, read with the PI's leave), which the PI reads before M2 opens; the date and the Decision Log row; the command that prints the Definitions Register's section for the terms of M1 as v7.0 uses them; the format of a ledger row (with the PI's leave to read the ledger's rows for M1). **Nothing else of that file is read or edited by the chat that builds M1.**
- **Registers and the ledger, at the move into canon.** CLAUDE.md §7: "Ledger first, then the paper"; §6: a new version is "recorded in the Decision Log and the ledger". The Minimality rows M1-15 to M1-20 say that the tag does not go on until the new version states the item; the Definitions rows for "minimal" and others are rewritten when the new version is in canon (P124). Claude proposes; the PI banks.

---

## 13. Traps: errors actually made in the sessions so far

1. **Words are copied, not reconstructed** (P139, P142, P143). Before any wording is put to the PI, read every line of the paper and every active entry that uses its terms, and copy.
2. **Quote by line, and check the line** (P144, P146, P148, P156). Use `sed -n 'Np'`.
3. **Copy from the ruling, not from the canon line the ruling replaced** (P143). In the build this is the main risk: v6.3 is the base text, and its superseded phrases ("stabiliser" at ll.521, 525, 533, 578; "Anosov" at ll.501–513; "aspect ratio" at ll.239, 602, 967, 992; "state of the fibre at rest"; "the Spin^c line" at l.677; "measure zero") stand round the entries. The same words are also used where no ruling touches them (for example "the stabiliser $H$" of Definition 2.8 and M1-W021, and at canon ll.661, 669, 867; "Anosov" at l.290; "aspect ratio" at l.1053): a search for a word is not a list of what changes.
4. **A printed statement must not say more than its mark** (P148, P149, P156, P157). A phrase copied from a neighbouring entry can say more in its new place than was checked there.
5. **A read-back carries every item of CLAUDE.md §3** (P127, P128, P130, P153), and **a choice of option is not a confirmation of a read-back** (P110, P119).
6. **Say it in plain English before showing codes or TeX** (P154). A table of codes with a request for "1-2 confirmed" (P154) got a confirmation that was not an informed one, and a change had to be undone.
7. **Do not bring presentation to the PI as though it reopened a choice** (P152, P154). Numbering was put as a conflict between two of the PI's statements; it changed nothing in the paper.
8. **Do not add items of your own to a list for the PI** (P152: the item "everything", in no source and used by no result).
9. **A fresh reader is for the records in a J-session and for the whole paper at the build**; every finding it returns is verified against the files before it is acted on (P144, P156).
10. **Do not drip-feed** (P125). **Do not print a register to find a row number**: match the first cell only (P94, P98, P150, P158).
11. **The build is not a rewrite.** A summary of a mathematical sentence changes its meaning (the PI, P104: "an LLM heavily summarises text. When doing that with mathematical language the summary changes the meaning. You must not do that."). Sentences of v6.3 that no entry and no register item touches are left exactly as they are.

---

## 14. What is not the build

- **M2.** Started from scratch after the new M1 is in canon.
- **Owed to M2:** which piece the warp of the display scales (Future-Mx F-10).
- **New mathematics.** If the build finds that something does not follow, it is reported in a sentence with the lines, and the PI decides (CLAUDE.md §4: "the first hypothesis is that the reading is wrong or the wording drifted").
- **The PI's picture of time and the torus** (`HANDOVER.md` item 16): a communication aid, not a logged statement; whether any of it is used at canon l.127 is the PI's to say and was not asked.

---

## 15. What is put to the PI

**At the start,** only what CLAUDE.md §2 asks: the session's assumptions, numbered and short, confirmed once. The process, the work package and the version are set (§2; P159) and are not put again.

**Along the way,** nothing, except at one of the four stops of §2.

**At the end, after the checks that follow Pass E,** the short report of §2, with the composed sentences.

**Before the move into canon,** one question, which is not presentation: leave to read the ledger's rows for M1, the Minimality Register's rows for M1 and the one older Definitions row outside the section for M1 (its l.107; §5), each of which has to be brought into line with the new version; the files hold sealed M2 material beside them.

---

## 16. The check of this file

This file and its check are recorded at Decision Log **P158**. **Disclosed (the architect's error):** while finding the number of the last Future-Mx entry the writing session printed the heading lines of that register's entries F-1 to F-10, cut at a hundred characters; the register is not on any reading list, and some of those headings name M2 and later papers. Nothing was used from them but "F-10" and its heading, which `HANDOVER.md` already carries.

A fresh reader was given this file, CLAUDE.md, `papers/M1/HANDOVER.md` from `## Audit of Theorem 8.1`, §5 of `papers/M1/HANDOVER_J10_J8.md`, `papers/M1/STEP_AUDIT.md` §11, the write-up log, canon, Decision Log rows P88 onward, Rulings in Force ll.1–56, Corpus Errors from entry 32, the Definitions section for M1, the row numbers of Verified References with V-10, V-14, V-23, V-32 and V-33 in full, the four files of `tools/` named in §8, directory listings, the commit log and status, and a run of `tools/writelog_check.py` on canon; and asked to check every claim, quotation, line number, count and pointer in it against those sources, and to report what a reader of this file alone could not do. It found the map of §4 exact (thirty-five rows, the thirty-five active entries, each place agreeing with the entry and with canon), about seventy-five line references of §5 holding what is said, and the counts right. Twenty-three findings, four to be fixed before use, all the architect's: Corpus Errors 32(h) had no instruction; stage 1 could not be done literally for the entries that are not one-for-one replacements; `papers/M1/HANDOVER.md` did not point to this file; and seven items that the J-sessions carried to the build were missing from §§5 and 7. All are corrected here and recorded in P158. **It could not verify from its list:** the Status string of the series plan; the heading of §4 of Rulings in Force at l.58; that Minimality rows M1-15 to M1-20 all say that the tag waits (seen for M1-15 and M1-17 through `HANDOVER.md`); the contents of V-15, V-21 and V-27 to V-31; anything about the Lean files; what the gates find on v6.3; that `canon/MEF_Academic_Register_Guide.md` holds nothing sealed. The corrections were not checked a second time.

**After the check (P159).** The PI set the process by which the build is made (Pass A to Pass E, with two error logs and two stop rules) and accepted four modifications put by the architect. §§1, 2, 3 and 15 were rewritten for it, and the stages of the first draft of this file are gone: there is no change list for the PI, the architect deletes or copies and does not compose, a sentence that has to be composed is marked and shown to the PI only at the end, and the checks are made by scripts and fresh readers. The PI also ruled that the statement of Theorem 8.1 lists the integer two on S². §§4 to 14 are as the fresh reader checked them, apart from the few words that named a stage. The rewritten sections were then checked by a fresh reader together with CLAUDE.md as amended at P161 and with `tools/Paper_assembly_protocol.md` (P162): it found CLAUDE.md word for word as P161 records, and eight things to fix, among them lines of this file left from its first draft (a question already ruled; "reworded"; "stage"; a quotation of a bullet of CLAUDE.md that P161 replaced), and places where the process was underspecified (how errors are identified and counted; what a kind-1 error does; which stops there are). All are corrected here and in the protocol. **The corrections were not checked a second time.** CLAUDE.md §§2 and 10 as they now stand are part of the rules of the build: read them from disk.

---

## 17. State after the first session of the build (13 November 2026; Decision Log P165)

**Read this section first in the second session; then §§0 to 16 as they stand.** No physics is proposed here.

**Built, all in `papers/M1/build_v7/` unless said:**
- `tools/m1_build_v7_0.py` (stages A, B, C; every edit named and matching once; statements taken from the log by number) and `tools/gates_on_pass.sh` (runs the gates on a pass: `tools/gates_on_pass.sh M1 papers/M1/build_v7/passC.tex`).
- `passA.tex`: canon v6.3 with the thirty-five active entries, 29 edits. `passB.tex`: `passA.tex` with `edits_B.py`, 33 edits. `passC.tex`: `passB.tex` with `edits_C.py`, 4 edits. **`passC.tex` is the working file and the text that Passes D and E are measured against.** Gate 8 passes on all three; each compiles (46 pages); gates 2, 4, 5 pass; gate 3 finds on each the two items it finds on canon v6.3 (the "I" voice of l.66).
- `CHECK_BRIEF.md` (fixed before Check A) and `RULINGS_LIST.md` (Corpus Errors 32 to 36 and §5 of this file, copied by script, with the canon lines they cite quoted).
- `ERROR_LOG_A.md`: 27 errors (29 findings of the reader, 2 rejected). `ERROR_LOG_B.md`: 4 errors (7 findings, 3 rejected), all four not in log A, none introduced by Pass B; **the first stop rule fired**; the PI directed Pass C (P165). Each log holds its reader's report whole.
- `COMPOSED.md`: **twelve composed sentences**, each marked in `passC.tex`. None has been shown to the PI in plain English yet; that is for the end report after Pass E.

**Open, and needing the PI:**
1. ~~Error B-2~~ **Closed (P166):** the PI confirmed the read-back of the musing with "(a)": the two sentences on the symbol $\times_{w}$ (canon l.127) stand as canon has them. Nothing is owed on it; Pass D does not reword them (they state mathematics).
2. **The twelve composed sentences**, at the end (§2). Numbers 10 (Proposition 7.1), 11 (the hypotheses of Theorem 8.1) and 12 (the conclusion of Proposition 5.5) stand inside statements.
3. **Two confirmed rows:** M1-W030 still prints "the two orbits are not realised", the words that M1-W043 dropped from the row above it (P157); noted by the reader of Pass B (its D.13). A confirmed entry is not changed by the architect.

**Held for the end report, not errors under the five kinds** (the two readers' lists "Register items still standing that fit none of the three kinds" and "Other", in the appendices of the two logs): among them the wording items of §5 changed by no ruling (ll.116, 163, 166, 349, 531, the names used for two things, ll.615 and 943, l.295, "determined among products only"); the bare word "state" outside Definition 7.4; "relabellings that reverse the orientation"; that the hypothesis of four fixed points and the unit of the algebra are as before; the items of §7.
**From the Lean check of §12:** the header of `MEFProof/Paper_M1/M1_L2_fibre.lean` (l.7) names "Franks 1970 (Anosov diffeomorphisms of surfaces)" and not Lemma 5.1; the file is printed in Appendix A; not changed. No `\cite` of Franks remains in Pass C; the two bibliography items and the mention in Appendix A stand.

**The work package of the second session** is Pass D to the final check (§2), from `passC.tex`. Before Pass D: the script that confirms every mathematical sentence of C unchanged in D is written and kept in `tools/`.

**Two things learnt in this session, for the next:**
- A `% COMPOSED` or `% LINK` marker must stand alone on its line: text after it on the same line is a comment and is not printed, and no gate catches that. The reader's check of the markers on Pass C is the model.
- The two readers, on one brief, filed the same canon sentences differently (register item against error); that, and not Pass B, fired the stop. The brief is fixed and was not changed.

**Disclosed:** `canon/MEF_Academic_Register_Guide.md` (on the reading list, §8) prints at its §5.2 a display of the Master Equation with a gloss of its terms. An M1 chat is not blind for M2; the M2 brief's reading list should take account of it.

**Committed and pushed at the PI's direction (P166); see `git log`.** The ledger, the Minimality and Future-Mx registers and the series plan were not read. No register other than the Decision Log (P165) was written.

---

## 18. State after the second session of the build (14 November 2026; Decision Log P167)

**Read this section first in the third session; then §17; then §§0 to 16 as they stand.** No physics is proposed here.

**Built, all in `papers/M1/build_v7/` unless said:**
- `tools/passD_check.py`, the script of Pass D, written before Pass D: every sentence of the measured pass stands unchanged in the later pass (white space apart), nothing is added but marked linking sentences, the composed sentences and their markers are unchanged, and a link holds no mathematics. It is stricter than the fence: it checks every sentence, not only those that state mathematics. `tools/m1_build_v7_0.py` has the stages D and E.
- `passD.tex`: `passC.tex` with `edits_D.py`, 15 named edits: one reordering (the five opening paragraphs of Section 4); paragraph breaks at sentence ends in seven proof paragraphs and two in the paragraph of the deflationary reading; five linking sentences marked `% LINK n: begin` / `% LINK n: end`. No sentence reworded.
- `MEANING_CHECK_D.md`: the first fresh reader's report, whole. 16 differences: 12 SAME, 2 MOVED, 2 NOT SURE.
- `passE.tex`: `passD.tex` with `edits_E.py`, 6 named edits: everything the reader marked MOVED or NOT SURE put back from Pass C by copying (the reordering undone; the two breaks in the deflationary reading removed; the link at the head of Section 6 removed). **`passE.tex` is now the working file.** It differs from `passC.tex` in exactly this: 25 paragraph breaks at sentence ends in seven proof paragraphs (the proofs of Propositions 4.1, 5.2, 5.5 (three paragraphs), 7.3 and Theorem 7.10, numbers of v6.3), and four linking sentences (the openings of Sections 4, 5 and 7, and "We return to the second axiom." before the proposition of M1-W026).
- `FINAL_CHECK_E.md`: the final check. Gate 8 passes on Pass D and Pass E (35 active; 0 failing); the script of Pass D passes on both against Pass C (872 sentences each; 12 composed sentences); a second fresh reader, who saw neither Pass D nor the first report, found 11 differences between E and C, all SAME. **The second stop rule did not fire.** Gates 1, 2, 4, 5 pass on Pass D and Pass E (47 pages); gate 3 finds the two "I" voice items of l.66 that it finds on canon v6.3.

**Departures from the letter of the protocol, the architect's, disclosed:** (1) the protocol's final reader is "on whatever differs between D and E"; the reader was given the whole of E against C, which covers it. (2) A reader's NOT SURE was treated as MOVED and put back. (3) Item 16 of the first report, SAME by itself, was put back with item 15, of which it is part.

**Open, and needing the PI (unchanged from §17):** the twelve composed sentences, at the end report; the two confirmed rows M1-W030 and M1-W043 (§17, item 3).

**Held for the end report, added by this session (noticed in passing, not pursued; none is an error under the five kinds as the logs stand, and the error logs' appendices were not read this session, so some may be there already):**
- Pass E l.129 says that Section 2 "isolates as numbered definitions the six points"; l.211 calls Definitions 2.7 and 2.8 "the fifth and sixth choices" and the sentence of composed sentence 2, which calls the choice of M1-W035 "the seventh of this section", is printed between them.
- In the worked case "The order-three automorphism" (Pass E, the paragraph beginning "This is the algebraic image of the corner three-cycle") the word "This" stands two paragraphs after the sentence on $\Ad_{w}$ that it appears to refer to. It is as canon has it; Pass D did not move it, since a move would change what a pronoun points at.
- From the two readers, each the same in Pass C and Pass E: the letter $F$ names the Fibonacci matrix in M1-W001 and the internal piece elsewhere in the same subsection (§5, "Names used for two things"); M1-W007 stands at the end of the proof of Proposition 4.1 as a statement with no argument given for it there; the proposition of M1-W026 has no proof environment after it.
- The reordering of the opening of Section 4 that Pass D tried and Pass E undid: the reader's ground was that "step" would be used before the sentence that defines it. If the PI wants that order, it is the PI's to say.

**The work package of the third session** is what follows Pass E (§2, "After Pass E"; `tools/Paper_assembly_protocol.md`, "After Pass E"): gates 1 to 5 and 8 on `passE.tex`; the one reader with the whole paper and the six axioms (P104, point 5), given the list of §7, its report taken by CLAUDE.md §11; the step audit of the new version and the red-flag scan (gates 6 and 7); then the end report to the PI with the twelve composed sentences, each in plain English and then as printed. Any change to the text after the final check is made by delete or copy and followed by gate 8, `tools/passD_check.py` and a fresh reader on the passages changed. The move into `canon/` is at the PI's word, with the leave asked at §15.

**Read this session:** this file whole; `tools/Paper_assembly_protocol.md`; `passC.tex` whole; `COMPOSED.md`; `CHECK_BRIEF.md`; `tools/PAPER_FORMAT.md`, `tools/README.md`, `tools/writelog_check.py`, `tools/gates_on_pass.sh`, `tools/m1_build_v7_0.py`, `edits_C.py`; `canon/MEF_Academic_Register_Guide.md`; Decision Log P159 to P166; the head of the write-up log and M1-W001, the other statements by script only. **Not read** (assumption 14, confirmed by the PI): the rest of the list of §8. The ledger, the Minimality and Future-Mx registers and the series plan were not read. No register other than the Decision Log (P167) was written. No row was added to `tools/ROSETTA_STONE.md`: no new term of jargon was used with the PI.

**Not committed:** committing is at the PI's word.
