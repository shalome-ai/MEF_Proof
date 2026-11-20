# M2 — handover

**Written clean on 20 November 2026 by chat C8b5, at the PI's word ("Yes write a clean handover before C9 starts", Decision Log P271), after the reset of the plan to chat C6 (P264).** The file as it stood before, with the paragraph of every chat from the opening brief of 13 November 2026 to chat C8b5 and the whole of its §8 and §10, is `papers/M2/HANDOVER_retired_2026-11-20.md`: it is kept for the record, it is not the handover, and no chat reads it. In this file §0, points 1 to 4 and 6 of §0A, and §§1, 3, 4, 5, 6, 7 and 9 are copied from it by script, word for word; the head, point 5 and point 7 of §0A, §2, §8 and §10 are written anew. It is the brief for the next chat and the standing rules for every M2 chat.

**This file contains no physics and no mathematics, and must not, at any time; the one exception, made at the PI's direction (P181), is the PI's own sentence on what M2 is to derive, quoted in §0A.** What M2 is to derive is held in `papers/M2/DAG.md` §1.

**M1 in canon is v7.3** (the file named in §9). Wherever §§1 to 8 say "M1 v7.0", read "M1 as it stands in canon, the file named in §9". The Decision Log rows before P180 that this file names are named for the record: **an M2 chat does not open them** (§5). Rows P180 onward are M2's own and may be read (§4).

**Read with the reset, wherever the copied sections below speak of them:** `papers/M2/DAG.md` is the clean plan of 20 November 2026; cards S09 to S20 are retired or superseded and package N0 is done (its §5, "The old cards, sorted"), and the cards from here are T1b, T2, T3, T4a, T4b, T5, T6, then S21 to S24 and N1 to N5. "§8" below is the one page of this file.

---

## 0. First, in this order

1. Post: *Verify-first is on. I will list assumptions and wait. I am not the SME; you direct.*
2. Read `CLAUDE.md` **from the file on disk** (a copy carried into a chat by other means may be an older one).
3. Read this file whole.
4. Then the reading list of §4, and nothing else. The list is a whitelist.

Run every command from the repository root, `/home/dhiren/MEF_Proof`.

---

## 0A. Where the next chat starts

**1. What M2 is to derive.** The PI's words, confirmed by read-back (P181): "What is left for paper M2 to do is to derive the equation that naturally sits on the manifold.  It will need this result, to derive the equation.  How it is used to derive the equation is up to M2 using first principles." The read-back the PI confirmed is `papers/M2/DAG.md` §1, in full, and is read there; it is not restated here. "This result" is named in `papers/M2/DAG.md` §2 and is cited from M1 v7.3 as printed.

**2. The starting points, read first and whole, in this order,** after CLAUDE.md and this file:
- `registers/Learnings_Register.md`;
- M1 as it stands in canon, `canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, with its glossary (Appendix B);
- `papers/M2/DAG.md`, whole: the plan and its rules (§3), the chats (§4), the cards (§5, §6);
- `papers/M2/WRITE_LOG.md` and `papers/M2/GLOSSARY.md`.

Then the rest of the list of §4.

**3. `papers/M1/LIFT_SIGN.md` is not read, in any part** (the PI, P181: "with no reading of the lift_sign.md"). What M2 needs of it is in M1 v7.3. `MEFProof/Paper_2/` is not opened (the PI, P183: "correct do not open it").

**4. The plan is the architect's, and the PI follows it** (the PI, P183: "you should decide how many work packages are , and set how many work packages are done in a particular chat.  We will follow that plan."). A chat does the work packages that `papers/M2/DAG.md` §4 gives it, in order, and no others; one work package is still one result. This replaces "One step of the DAG is one chat" in §3 below.

**5. The work package of the next chat** is that of chat **C9** of `papers/M2/DAG.md` §4: **card T1b, then card T2** (the PI, Decision Log P264, P268). T1b is the one point that card T1 left undecided (M2-W169); it is computed, or, if neither answer can be shown, it is put to the PI in that chat as one numbered choice. T2 is the operations that what is given determines, in the least form that card T3 needs. The opening text of the chat is `papers/M2/OPENING_C9.md`. The chat ends with mathematics logged (Learnings L45).

**6. What a chat does not put to the PI** (the PI, P187: "don't ask me to confirm/ rule what is blindingly obvious"; Learnings L27, L28). A point on which the architect has a recommendation and on which no proof, result, definition or reading turns is decided, said in a line and recorded. Before a work package is begun the chat says in two sentences what it produces that the derivation needs; if that is nothing, it says so at once and does not begin.


**7. The reset and the trip-wires (the PI, Decision Log P264, P268, P270).** Every entry of the write-up log from M2-W090 to M2-W161 is retired; no entry and no card cites one, and a chat does not read them: where point 2 above and §4 say that the write-up log is read whole, its head and its active entries are meant. `papers/M2/DAG_retired_2026-11-20.md` and `papers/M2/HANDOVER_retired_2026-11-20.md` are not read. Rule 12 of `papers/M2/DAG.md` §3 (Learnings L46) governs every chat and is read there, not restated here: the chat's own two sentences at its opening, the counter, no point put on hold, a card split once at most, and a waiting point that expires at the card named for it.

---

## 1. Why M2 is built this way

The PI's words.

- On how the errors of M1 arose (P104): "an LLM heavily summarises text. When doing that with mathematical language the summary changes the meaning. You must not do that."
- On M2 (P141): "When doing M2 - we are going to break the DAG down into smaller bite size pieces - write and log as we go along - so that you will cut and paste agreed text rather than summarise or "remember from memory" that is how these errors were introduced."
- On the cost (P159): "I was very annoyed to have to go through 2-3 days of all these J1-J11 revisions because you did not have a robust process for creating a paper."
- On the size of a step (P163): "the only thing that i want us to do is to keep the DAG steps small enough to be comfortably in one chat. That reduces the risk of conflation, addition etc."

So M2 is written by two protocols and one rule:

- **The paper-writing protocol**, CLAUDE.md §10: every sentence that states mathematics is an entry of `papers/M2/WRITE_LOG.md`, logged word for word when it is agreed or checked, with its place in the paper.
- **The paper assembly protocol**, `tools/Paper_assembly_protocol.md`: the logged sentences become the paper by Pass A to Pass E; for a paper written from scratch no composed sentence should be needed.
- **The small-step rule**, §3 below.

---

## 2. The work package of the opening chat

*(Done on 18 November 2026 by the opening chat and the chat that drew the DAG, Decision Log P180 to P184. The section as it was written is in `papers/M2/HANDOVER_retired_2026-11-20.md`. What it set up and still stands: what M2 is to derive, `papers/M2/DAG.md` §1; the write-up log with its Place line and the file `papers/M2/PLAIN_TEXT.md` for the text that is not mathematics, both at the head of `papers/M2/WRITE_LOG.md`; and the glossary `papers/M2/GLOSSARY.md`, which holds M2's own entries only, M1's being read in Appendix B of M1 v7.3, each new entry copied in the same chat into M2's section of the Definitions Register.)*

---

## 3. The small-step rule

**One step of the DAG is one chat, and one step is one result:** one definition, or one proposition with its proof, or one computation. *(Changed 18 November 2026 by the PI, P183: a chat does the work packages that `papers/M2/DAG.md` §4 gives it, which may be one or more; one work package is still one result. Where the lines below say "the step" of a chat, read "each work package of the chat".)*

**A step is split before it begins** if either holds:

- it would need more than about a dozen logged sentences;
- what has to be read at the start (M1 v7.0, the M2 write-up log so far, and the step's own material) cannot all be read comfortably in one chat.

"About a dozen" is a first guess of the chat that wrote this file. **It is to be adjusted after the first two or three steps**, on what they show, and the adjustment recorded here.

**When the standing reading itself no longer fits** (M1 v7.0 with a write-up log that has grown), splitting a step does not help. Stop and tell the PI; the remedy is the PI's to choose.

**Every step has a card in `papers/M2/DAG.md`, written before the step begins:**

| Line of the card | What it holds |
|---|---|
| Step | its number and a short name |
| Kind | definition, proposition with proof, or computation |
| May use | the axioms; the results of M1 v7.0 it may cite, by printed number and TeX label; the entries of the M2 log it may cite, by number, or by the step that is to produce them where they do not yet exist; external sources, each entered in Verified References. Nothing else is used |
| The question | what the step is to settle, **put as a question and not as the hoped-for answer** |
| Produces | the kind of thing that comes out: a definition, a statement with its tag, a value |
| Done means | what has to exist when the chat ends (the entries, their checks, and the glossary entry of every term the step defines) |
| Size | the estimate in logged sentences; "split" if over the limit |
| Blind | **the PI says** whether a target value exists anywhere; the architect does not look. If one exists it is not on the card and is not looked at until the step's result is logged (CLAUDE.md §5, "Blind") |

**Every step chat runs the same way:**

1. Post; read CLAUDE.md, this file, the list of §4, the card.
2. List the assumptions and wait, as CLAUDE.md §2 says, before the step and before any further judgement the step calls for.
3. Do the step. Each sentence is logged at the moment it is confirmed or checked, with its place (CLAUDE.md §10). What is put to the PI is in plain English first (CLAUDE.md §2). Before a name or a term is used, the glossary is looked at (M1's Appendix B and `papers/M2/GLOSSARY.md`) and the term is used as it stands there; a term the step defines is entered in `papers/M2/GLOSSARY.md` at once.
4. The step audit table for the step (`papers/M2/STEP_AUDIT.md`; CLAUDE.md §5), the red-flag scan of every source used, and the failure test of each result.
5. A fresh reader checks the chat's records against their sources (not whether the result holds); each finding is verified against the files before it is acted on. **A sub-agent is bound by §§4 and 5 exactly as the chat is:** its brief names what it may read, and nothing sealed.
6. The Decision Log rows; register and ledger entries proposed for the PI to bank; the next step's card brought up to date (the numbers of the entries it may use now exist).
7. §8 of this file rewritten in one page: what was built, what is open, what needs a ruling, the next step. **Entries are named by their numbers; no mathematics is restated here** (CLAUDE.md §5, "In full"). The wording for the Status cell of the series plan is proposed to the PI, who edits the cell (§5).
8. Commit and push at the PI's word. Stop. Start nothing further unasked.

**If a step turns out larger than its card said, stop at the last logged sentence and tell the PI;** the step is split with the PI, and the rest is a new card for a later chat. A step is never finished by compressing it.

**Chats that are not steps** (writing more cards, re-splitting a step, changing the DAG, adjusting the size limit, the assembly passes, the later comparison with the sealed material). The work package is set in §8 by the chat before it, at the PI's word. Such a chat follows steps 1, 2 and 5 to 8 above. The opening chat is one of these, and its records are checked by a fresh reader like any other.

---

## 4. Read

- **`CLAUDE.md`**, from disk; **this file**, whole.
- **`tools/Paper_assembly_protocol.md`**; **`tools/PAPER_FORMAT.md`**; **`tools/README.md`** (the gates). Where one of these points to a script in `tools/`, the script may be read. `tools/README.md` gives page counts and gate results for an earlier, frozen M2; they are of no use and are not followed up.
- **M1 as it stands in canon:** the file named in §9. Whole. It is the only statement of M1 that M2 is derived from (CLAUDE.md §6: "M1 is derived from the axioms and each paper from those before it"; "Mx cites only M1…M(x−1) and external peer-reviewed results").
- **The numbering table of M1 v7.0** named in §9, if a result of M1 has to be found by an older number.
- **The glossary of M1:** Appendix B, "Names and glossary", of the file named in §9. It is read with the paper; it is named here because every name in it is canonical for M2.
- **The failure tests of M1 v7.0**, the file named in §9: what would show each result of M1 false. If a step of M2 needs the very thing that one of those lines says a later paper must not need, that is reported to the PI at once, in a sentence, with the line.
- **What M1 leaves owed by M2**, the file named in §9, if there is one.
- **The terms of M1:** the section of `registers/Definitions_Register.md` named in §9 (CLAUDE.md §6: "Use every term as the Definitions Register defines it"). No other section of that register, except M2's own (below).
- **`registers/Rulings_In_Force.md` to the heading of its §3 only:** `sed -n '/^## 3\. /q;p' registers/Rulings_In_Force.md` (its §1, the axioms, and §2, how the papers are derived). §3 is about M1 and is read only if the PI names a row. §§4 to 7 are not read: §§4–6 are sealed.
- **M2's own sections of the registers and of the ledger** (§5, "How M2 writes and reads its records"): from the heading `## M2 (new start)` to the end of the file, in each.
- **`papers/M2/`**: this file, `DAG.md`, `WRITE_LOG.md`, `GLOSSARY.md`, `PLAIN_TEXT.md`, `STEP_AUDIT.md`, `checks/`, and the files §9 names, as they come to exist.
- **`papers/M1/WRITE_LOG.md` from its first line to the line `## Entries` only**, for the form of a write-up log: `sed -n '1,/^## Entries/p' papers/M1/WRITE_LOG.md`. No entry of it is read.
- **The sealed list, so as to know what is sealed:** `sed -n '/^## Sealed: not to be read/,/^---$/p' papers/M1/HANDOVER.md` (33 lines, ending at the first rule after the list; corrected 18 November 2026, P180: the command first written here printed to the end of the file, and sections added to that file afterwards were read by the opening chat). Nothing else of that file. The list was written for sessions on M1: where it says that something sealed is "read" somewhere else (for example in M1's step audit), that does not hold for an M2 chat (§5); its note that the folder `papers/M2/` no longer exists is out of date.
- **`canon/omega-definition-usage_v2.md` §6a only**, for the names that gate 3 forbids (the sealed list allows it).
- **The Decision Log: from the first row of M2 on, and no earlier row** unless the PI names it. The first row of M2 is the first row the opening chat writes; its number is recorded in §8. To read M2's rows: `sed -n '/^| P<that number> /,$p' registers/Decision_Log.md`. To find the last row used, without reading any: `grep -o '^| P[0-9]*' registers/Decision_Log.md | tail -1`; the next free row is one more.
- **`canon/MEF_Academic_Register_Guide.md`** when writing is done (CLAUDE.md §6), **without its §5.2**: `awk '/^### 5\.2 /{skip=1} /^### 5\.3 /{skip=0} !skip' canon/MEF_Academic_Register_Guide.md` (it prints the guide and leaves out everything from the heading of §5.2 to the heading of §5.3; tested on 14 November: 333 of 354 lines, the heading of §5.2 not among them). The chat that built M1 read the guide and reported (13 November) that its §5.2, headed "The Master Equation, in-register" (ll.208–228), prints a display of the Master Equation with a gloss of its terms; the sealed list seals that display elsewhere, so the section is not read by an M2 chat. Whether any other section of the guide holds something of the earlier M2 was not reported; it is not on the sealed list.
- **`registers/Learnings_Register.md`**, whole, at the start of every chat (opened 18 November 2026 at the PI's direction, P180): the lessons on how the papers are made, beginning with those of M1. It holds process only. A lesson learnt in a chat is proposed as a new row in that chat's closing report.
- **`tools/ROSETTA_STONE.md`** only when the PI writes "Please Rosetta Translate x", or to add a row.
- **External sources** the PI supplies or a step needs; each is entered in Verified References before a paper cites it (CLAUDE.md §4).

---

## 5. Do not read

**The reason for this section is one phrase of the PI's (P96): "to make M2 a true fresh start".** A chat that has read any of the following is not the chat that writes M2. **If one is read by mistake: stop, tell the PI what was read, and wait; the PI decides whether the chat goes on and what becomes of what it has written.**

- **Everything on the sealed list** (the section of `papers/M1/HANDOVER.md` that §4 prints). Among it: `superseded/M2_v1/`; `superseded/M2_second_start/`; Decision Log rows P1–P39 with the section of 8 November, and rows P71–P87; `registers/records/2026-11-11_M2_opening_musing_SEALED.md` and its figure; `registers/Rulings_In_Force.md` §§4–6; the ledger's section on M2 v1.0 and the targets after it; the Minimality rows headed "M2 v1.0"; Definitions and Verified References rows that cite `M2_WP…`, M2 or `papers/M2/…` notes of the earlier starts; the display of the Master Equation in `canon/omega-definition-usage_v2.md`; `papers/M1/LIFT_SIGN.md` §5; the series plan's rows for M6, M7, M9, M10 and M16. "Do not search the ledger, the registers or the Decision Log for "M2"."
- **The Decision Log before the first row of M2.** For rows P88 onward this is the architect's addition and not a ruling: it was flagged at P96 for rows P88–P96, which name in outline what the abandoned second start stood on, and it is extended here to every row up to M2's first, several of which record leads and musings that are premises of nothing.
- **`papers/M1/LIFT_SIGN.md`, in any part** (the PI, 18 November 2026, P181: "with no reading of the lift_sign.md").
- **Everything else under `papers/M1/`:** the handovers, `STEP_AUDIT.md`, the notes, the entries of the write-up log, `build_v7/`. They are the workshop of M1; M2 is derived from the finished paper.
- **`superseded/`, `sources/`** (the old corpus is not used to derive; it is compared with afterwards, CLAUDE.md §6), **`papers/M3/`, `sow/M3/`, `registers/records/`.**
- **`canon/M2/` and `MEFProof/Paper_M2/`, if they exist when M2 opens.** The chat that wrote this file does not know whether either holds files of a withdrawn M2. If either exists and is not empty, do not open its files: tell the PI, who says what is done with them. M2's own certificates go to `MEFProof/Paper_M2/` only after that.
- **`sow/Mx_Series_SOW.md`.** Its rows carry wording of the withdrawn M2 (P88). What M2 is to derive comes from the PI (§2). CLAUDE.md §1 asks that the Status column be brought up to date at the end of a session: for M2 the chat proposes the wording in its closing report and **the PI edits the cell**.
- **The history of the repository.** `git status` and `git log --oneline -5` may be used; `git show`, `git diff` against earlier commits, and `git log` further back are not, since they print the content of files this section bars.
- **Notes carried from earlier chats** (a memory folder, where the tool has one). Notes on how to work are followed. A note that names or describes sealed material, the old corpus or an earlier M2 is not opened and not followed; say that it exists.
- **The registers and the ledger, other than as §4 allows.**

**How M2 writes and reads its records.** So that no M2 chat has to read what earlier papers left in a register, M2 keeps its own section at the end of each:

- The opening chat appends, without reading the file, the heading line `## M2 (new start)` to the end of each of: `registers/Rulings_In_Force.md`, `registers/Definitions_Register.md`, `registers/Verified_References.md`, `registers/Minimality_Register.md`, `registers/Corpus_Errors_Register.md`, `registers/Future_Mx_Register.md`, and the ledger; under it, the table's header row in the format below.
- Every M2 row is appended under that heading, and an M2 chat reads a register only from that heading to the end: `sed -n '/^## M2 (new start)$/,$p' <file>`. (This is a fixed heading at the end of a file, not a search of the register for "M2".)
- Formats: Rulings in Force, `| ruling | source |`; Definitions, `| **term** | definition | source |`; Verified References, `| # | Statement as used | Source | Wanted by | Status | Notes |`; Minimality, `| # | Node | Choice space | Minimal option | Criterion | Stated at | Failure test | Status |`; Corpus Errors and Future-Mx, a short dated paragraph to an item. The Decision Log is one table that ends its file; a row is appended as `| Pnn | date | **Title (PI).** text, the PI's words verbatim in quotation marks | tags |`.
- The formats of the Minimality and Verified References rows are copied from the M1 handovers and were not checked against the registers by the chat that wrote this file; **the format of a ledger row is not known to it**, and is a blank of §9.
- Rows for M2 are numbered within M2's section (`M2-1`, `V-M2-1`, and so on), so that no earlier number has to be looked up.
- Claude writes the Decision Log row at the moment of a ruling; for every other register and for the ledger Claude proposes and the PI banks by commit (CLAUDE.md §7).

**When the sealed material is opened.** "When the derivation and its results are written and recorded, and only then, they are compared with the sealed material and with the canonical form of the Master Equation. That comparison is a consistency check and not a test." (the sealed list, carried word for word.)

---

## 6. The rules that matter most for M2

All of CLAUDE.md applies. These are the ones the fortnight on M1 showed to matter.

1. **Words are copied, not reconstructed** (CLAUDE.md §11). Agreed text is taken from the log by its number, never from memory.
2. **Every sentence that states mathematics is an entry**, the steps of a proof included (CLAUDE.md §10). Nothing mathematical is written for the first time at assembly.
3. **Plain English first**, before any code, table or TeX (CLAUDE.md §2).
4. **Presentation is not put to the PI** (CLAUDE.md §2): numbering, labels, placement, names.
5. **The PI's words.** A statement of the PI that would become an axiom, a definition, a reading or a ruling is read back in full before anything is entered; "my musings:" is narrative, not a premise (CLAUDE.md §3). The PI uses some terms of physics in a sense of the PI's own: translate before adopting a term.
6. **Blind.** A derived value is recorded, and every reading fixed, before the target is looked at (CLAUDE.md §5).
7. **Where the axioms leave a choice** (CLAUDE.md §6): "take the option the sixth axiom selects (M1 Definition 3.2) and enter it in the Minimality Register before the tag goes on. If it fails, flag it in the paper and in the Corpus Errors Register; never enlarge the choice silently." And the PI (P154): "if we are forced to make a choice then make the choice".
8. **No counter-examples unless the PI asks for one, naming the statement** (CLAUDE.md §5).
9. **A step M2 relies on is closed in M2, or declared there with its failure test.** It is never left to a later paper (CLAUDE.md §6).
10. **A printed statement says no more than was checked** (learnt in the M1 sessions; it is in no rule of CLAUDE.md). Whatever an entry's mark says is not shown, or not claimed, is told to the PI in the read-back, before the PI confirms the statement.
11. **Close once** (learnt in the M1 sessions). What is owed at the end of a chat is swept into one list and put once.
12. **The glossary** (CLAUDE.md §6; the PI, 14 November 2026): "You define when it is first used, it goes into Glossary, that becomes canonical, any future reference refers to the Glossary. Glossary is carried forward to Mx+1 , new terms are added. There is no backwards revision". One thing has one name, in M2 and across the series. The architect writes the definition: the PI is not asked to supply one. The defining sentence is a sentence of the paper like any other, so it is logged and confirmed as CLAUDE.md §10 says (read back to the PI in plain English with the architect's wording, or entered as checked where §10 allows that).

---

## 7. What is not M2

- **M1.** If a step of M2 finds something in M1 v7.0 that looks wrong or missing, the first hypothesis is that the reading is wrong (CLAUDE.md §4). It is reported in a sentence with the line; M1 is changed only as a new version, at the PI's word (CLAUDE.md §6).
- **M3 and later.** What a step finds to be owed by a later paper is entered in M2's section of the Future-Mx Register, and not worked on.
- **Comparison with the old corpus or the sealed material.** After M2 is written and recorded, and not before.

---

## 8. Where M2 stands

*(Rewritten at the end of every M2 chat, in one page. Entries are named by number; no mathematics is restated. The pages of the chats before the reset are in `papers/M2/HANDOVER_retired_2026-11-20.md`.)*

- **State, 20 November 2026 (after chat C8b5, the reset):** the active entries are those active among M2-W001 to M2-W089 (S03 to S06) and M2-W162 to M2-W169 (S07 and T1): seventy-seven. Every entry from M2-W090 to M2-W161 is retired (P264). The next number is **M2-W170**. Numbered choices M2-1 to M2-9 (M2-8 and M2-9 proposed, from S07). Thirty-seven glossary entries, of which the thirteen from retired entries are kept and not used (the note at the foot of `papers/M2/GLOSSARY.md`). Certificates in use: `M2_L1` to `M2_L5` and `M2_L11_maps.lean`; `M2_L6` to `M2_L10` certify arithmetic that no active entry cites, and are kept. Verified References V-M2-13 and V-M2-14 are cited by no active entry. One ledger row proposed (Proposition "the maps"), and three rows of the Definitions Register (from S07); the ledger rows of the retired cards are noted there. **Ruled by the PI:** the reset (P264); the read-back of S07 with "it has a solution" in its second clause (P265); the read-back of T1 (P267); T1 to T6 in that order, the sort of the old cards, T1b and the split of T4 (P268). **Open, carried to the next chat:** the point that M2-W169 says is not shown (card T1b). **Not ruled, and not put as lists:** the open points of the old cards S09, S10, S11 and S13; `papers/M2/DAG.md` §5, "The old cards, sorted", and the list of waiting points in its §4 say where each is decided or comes to the PI. Learnings L45 and L46 are confirmed by the PI (P269, P270).
- **What chat C8b5 did:** read `CLAUDE.md` as loaded, the handover as it then stood, whole, `registers/Learnings_Register.md`, `papers/M2/DAG.md` as it then stood, whole, M1 v7.3 ll.40 to 1322, Decision Log P222, P223, P256 and P262; of the write-up log the head and the statements in full of M2-W005, M2-W039, M2-W048, M2-W052, M2-W069, M2-W078, M2-W082, M2-W085 to M2-W089, of M2-W053 and M2-W054 cut short with part (vi) of the second, the mark of M2-W086 cut short, and, before the reset, M2-W158 and M2-W159 (a departure from "whole", told to the PI at the opening); listed sixteen assumptions on the package of the opening text; the PI reset the plan (P264); put S07 by read-back, restated it in plain English at the PI's request, logged five entries (P265); rewrote the DAG; said the test of T1, listed six assumptions (P266), wrote and ran the script and the certificate, put three sentences by read-back and logged them (P267). Not read: the statements of the other active entries; every mark but one; the retired entries; the step audit beyond its headings; M2's sections of the Verified References, Future-Mx and Rulings registers; of the Minimality, Definitions and ledger sections the last rows only; `M1_failure_tests.md`, the owed file, M1 ll.1 to 39, Decision Log rows other than those named. `registers/records/`, `registers/Corpus_Errors_Register.md`, `papers/M1/LIFT_SIGN.md` and `MEFProof/` outside `Paper_M2/` were not opened. A carried note that points to the PI's earlier reference texts exists and was not opened. Chat C8b5 added two rows to Part B of `tools/ROSETTA_STONE.md` ("image", "one-to-one"). Before the close it wrote `papers/M2/DAG.md` clean (P268). After the close it gave its account of what went wrong, proposed the five trip-wires (P270), wrote the opening text of chat C9, and wrote this file clean (P271).
- **Done and standing, by card** (the cards are in `papers/M2/DAG.md` §5, whole): S03 (M2-W001 to M2-W006); S04, S04b, S04c, S04d (the active entries among M2-W007 to M2-W068); S05 (among M2-W069 to M2-W082); S06 (among M2-W083 to M2-W089); S07 (M2-W162 to M2-W166); T1, as far as its test decides (M2-W167 to M2-W169). S01 and S02 are withdrawn (P188): M2 cites M1 v7.3 by its printed numbers.
- **Certificates of M2** (core Lean; import lines in `MEFProof.lean` under the line "-- Paper M2 (new start, Decision Log P180 onward)"): `MEFProof/Paper_M2/M2_L1_degree_two.lean`, `M2_L2_pillowcase.lean`, `M2_L3_time.lean`, `M2_L4_whole.lean`, `M2_L5_step.lean` and `M2_L11_maps.lean` are cited by active entries; `M2_L6_fibre.lean` to `M2_L10_base.lean` are cited by retired entries only, and are kept. The next file is `M2_L12_…`. A build of the whole library is not run (P208): a certificate is compiled standalone and its own module built.
- **The numbered choices of M2 so far** (a musing of the PI, P192, kept as a lead; Learnings L31): M2-1 (M2-W005), M2-2 (M2-W016), M2-3 (M2-W022), M2-4 (M2-W053), M2-5 (M2-W069), M2-6 (M2-W078), M2-7 (M2-W085), M2-8 (M2-W163), M2-9 (M2-W165). The alternatives and what rests on each are in its Minimality row. What M2-6 does and does not constrain is in the mark of M2-W078. M2-7 has no clause of M1 Definition 3.2 as the ground of its first part: its ground is M1's text, and the PI ruled (P216).
- **Leads, premises of nothing** (CLAUDE.md §3): the PI's musing on the torus counted once (P206, with the architect's translation); a candidate noticed by chat C3d and not examined, which nothing uses (P207, read there); the PI's musing on the sixth choice (P211, with the architect's translation); the PI's sentence that a derivation of the step of M2-W069 is in a separate paper (P211; owed in Future-Mx F-M2-1; the old corpus is not looked at for it); a naming direction of the PI's for an object that M2 has not reached (P212): a name is given to an object only when the derivation has produced it, and the PI gives it then.; the PI's musing on what the equation is for, with the architect's translation, and the PI's two answers on what two of its phrases mean (P216): it names known physics, of which nothing is taken; the PI's leaning to the second of the four options put for what the fifth axiom asks of the equation (P222) and the PI's sentence of belief in P223, read there: neither is a ruling, and no definition is written to fit either; the PI's musing on the warp, with the architect's translation, which the PI confirmed as its meaning (P234): it is to be tested when the open point of S13 is taken up, and no entry is written to fit it *(Since the reset: the leads in this line that speak of cards S07, S08 and S13 as open are leads still, and those cards are done, waiting or superseded as `papers/M2/DAG.md` §5 says.)*
- **A chat that is not blind on one point (P212):** chat C4 read by mistake entries 32 to 36 of the Corpus Errors Register. One item of them bears on the question of card S10; the note is on that card. No later chat opens that register outside M2's section, and none takes anything on the point from chat C4 beyond what the write-up log holds. **For every chat: a command that prints part of a register is run on one file at a time** (Learnings L35). *(Card S10 is superseded since the reset and is not in the clean DAG, so there is no note to read; the bar stands, and nothing on the point is taken from chat C4's records.)*
- **Chat C8b4 is sealed (P262):** its record is in `registers/records/` and is not opened by any M2 chat (§5). A chat takes nothing on it beyond row P262 and `papers/M2/DAG.md` §1.
- **Settled earlier and standing:** the two proposals at the head of the write-up log (P187); new terms go into the glossary as §6 rule 12 says, in the same chat (P199); a new lemma or proof has its Lean certificate and one ledger row (P186; P199), applied as CLAUDE.md §9 and §7 stand. The chat that writes a certificate adds its import line to `MEFProof.lean` under the line above and opens no part of `MEFProof/` other than `MEFProof/Paper_M2/`. Theorem names are prefixed by file (`L1_` to `L11_`); the next file is `M2_L12_…`. **A build of the whole library is not run** (P208): the certificate is compiled standalone (`lake env lean <file>`) and its module built alone (`lake build MEFProof.Paper_M2.<module>`); the PI is told before anything larger is built.
- **Noticed in M1 v7.3 in passing, reported to the PI and not pursued** (lines only): l.129 with ll.221 and 244 to 246; l.697 and l.704 with Definition 3.1; l.1190 (chat C1). The references behind l.806, l.818 and l.827 are marked not read in rows V-22 and V-32 of Verified References (chat C3). M1 takes the corner signs "up to one overall sign" (ll.836, 932); M2-W023(iv) gives the signs of the lift with two states for every divisor: an addition (P199). M1 says of the counts that they do not depend on the complex structure of $E$ (l.829); M2-W041(iii) says it of the bundle with its lift: an addition (P203). M1 Proposition 5.8 does not say in words which way the join runs; M2-W039 reads it from M1's own condition (an identification step, P203). M1 prints $S^{1}_{\Sol}$ and $\Ttwo/\Ztwo$ as separate factors (ll.124, 1094) and calls $S^{1}_{\Sol}$ "the Sol torus bundle" (l.339); M2-W052 reads the symbol as the time circle along which the fibre is carried (an identification step, P206; the PI agrees with the reading, which is not a ruling). M1 says that a $\Spinc$ structure with its integers exists (l.806, l.827); M2-W054(v) shows it on the two products of M2-W008 and M2-W013: an addition (P207). M1 gives the step on the torus (ll.302, 310) and the join (l.704) and names no map of the whole geometry as one step; M2-W069 reads the join as such a map: an addition, the fifth choice (P210, P211). M1 says of the structure of a twist that one step does not carry it to itself (ll.156, 846); M2-W082(iii) and (iv) say it of the spinor bundle with its lift of the fold and of the $\Spinc$ structure: an addition (P211). The file `papers/M2/OWED_BY_M2_FROM_M1.md` places M1's sentence on the warp in "Section 1.5" and names its display "(1.1)"; in v7.3 they are Section 1.4 and "(1)". That file was read by the PI and is left as it is. *(Copied word for word from the handover as it stood before 20 November 2026; it is the record of lines and of entries by number, kept whole because no other record that a chat may read holds the list.)*
- **Open, for the PI:** the line "Blind" of every card: each is treated as if a target existed, and nothing is looked at, until the PI says otherwise (P205).
- **Not checked by a fresh reader when this page was written:** see §10.
- **First Decision Log row of M2:** P180 (18 November 2026). **Last row used:** the last row of `registers/Decision_Log.md` (chat C8b5 wrote P264 to P271; P258 to P261 are not used).
- **Next chat, and its work package:** §0A, point 5.

---

## 9. To be filled before M2 opens

| # | Blank | Filled by | Value |
|---|---|---|---|
| 1 | M1 in canon: the file | the M1 build | `canon/M1/Paper_M1_Six_Axioms_v7_3.tex` (PDF beside it; 50 pp.; v7.3 has one naming of the corners and the glossary, fixed from this version, P176–P178; v7.1 is v7.0 with the Lean headers and the reference list brought into line, no statement changed; P173) |
| 2 | The numbering table, v6.3 to v7.0: the file | the M1 build | `canon/M1/NUMBERING_v6_to_v7.md` |
| 3 | The failure tests of M1 v7.0: a file made by script from the "Failure test" lines of the active entries of M1's write-up log, with nothing else of the log in it | the M1 build | `papers/M2/M1_failure_tests.md` (remade at v7.3: 51 active entries) |
| 4 | What M1 leaves owed by M2: **a file, not words written here**, holding it in the words in which it is owed and nothing else of the register it comes from. The PI reads the file before M2 opens and says that it carries nothing of an earlier M2 | the M1 build, with the PI | `papers/M2/OWED_BY_M2_FROM_M1.md` (one item, from Future-Mx F-10). **Read by the PI, 14 November 2026 (Decision Log P177): "yes that is what we agreed"** |
| 5 | The date v7.0 went into canon, and the Decision Log row | the M1 build | 14 November 2026. The new M1 went into canon at Decision Log P172 (the PI's word: P169); the version now in canon, v7.3, at P178. The last row used by the chat that built M1 is P179; the opening chat finds the next free row by the command of §4 |
| 6 | The section of the Definitions Register that holds the terms of M1 as v7.0 uses them: the command that prints it | the M1 build | `sed -n '/^## Terms of M1/,/^## Geometry/p' registers/Definitions_Register.md` (the section is headed "Terms of M1 v6.0"; a note under the heading says what was rewritten at v7.0; nothing in it was changed at v7.1 to v7.3. Where it and the glossary of M1 name the same thing, the glossary governs) |
| 7 | The format of a ledger row | the M1 build, with the PI's leave to read the ledger's rows for M1 | The ledger's own line of columns: "Result · Site (paper, label) · Rigour · Depends on (readings R1–R5; Minimality entries Mx-n; external results EXT) · Certificate (file: theorem names) · Status", printed in the tables of M1 as `\| Result \| Where \| Tag \| Inputs \| Certificate \| Status \|`; a row does not restate a statement, it points to the write-up log entry (the section "M1 v7.0" of the ledger is the model) |

**Added 14 November 2026 by the chat that built M1, at the PI's direction (Decision Log P173–P175; not a blank):** every paper of the series has a glossary. The PI: "There has to be a definitions / naming/glossary section in this paper - this is where the corners are named and it becomes canonical.  Each Mx paper carries the Glossary from the Mx-1 paper, follows the same naming convention and then adds any new terms introduced by that Mx paper". M1's is Appendix B of v7.3, "Names and glossary"; the rule is in CLAUDE.md §6 and `tools/PAPER_FORMAT.md`, "Glossary". **The discipline (PI, P177): a term is defined by the architect at its first use, goes into the glossary, and is not revised afterwards.** M2 starts from M1's glossary (Appendix B of v7.3), keeps its names, and adds its own terms.

Blanks 1 and 2 were in the proposal the PI agreed (P163). **Blanks 3 to 7 are additions of the chat that wrote this file**, so that an M2 chat need not open M1's workshop or the older parts of a register. If the PI strikes one, the line of §4 that names it goes with it.

---

## 10. The check of this file

The checks of the file as it stood from 13 to 20 November 2026 are §10 of `papers/M2/HANDOVER_retired_2026-11-20.md` (Decision Log P164, P179, P182, P184 and the rows of each chat's close). **This clean file (20 November 2026, P271):** the sections copied from the earlier file were checked by script to be word for word; the parts written anew, with rule 12 and §4 of `papers/M2/DAG.md` and `papers/M2/OPENING_C9.md`, were given to a fresh reader to check against their sources, and what it found and what was done is in Decision Log P271.
