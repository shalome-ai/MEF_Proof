# M2 — handover: the opening brief

**Written 13 November 2026 at the PI's direction ("go", Decision Log P163), by the chat that closed J10 and J8 of M1 and wrote the paper assembly protocol. M2 is started from scratch on the new version of M1 (P94, P95, P96). This file is the brief for the chat that opens M2, and the standing rules for every M2 chat after it.**

**This file contains no physics and no mathematics, and must not, at any time.** The chat that wrote it is not blind for M2: it has read records that describe, in outline, what the abandoned starts of M2 stood on. It has therefore written here only the process, the reading list, and what the first chat does. What M2 is to derive is stated by the PI in the opening chat and is then held in `papers/M2/DAG.md`, not here.

**M2 does not begin until M1 v7.0 is in canon** (P94). §9 has blanks that the M1 build fills when it finishes. If a blank is still empty, stop and tell the PI.

**Checked** by a fresh reader and corrected; see §10. The Decision Log rows named in this file (P88, P94–P96, P104, P141, P154, P159, P163, P164) are named for the PI and for the record: **an M2 chat does not open them** (§5).

---

## 0. First, in this order

1. Post: *Verify-first is on. I will list assumptions and wait. I am not the SME; you direct.*
2. Read `CLAUDE.md` **from the file on disk** (a copy carried into a chat by other means may be an older one).
3. Read this file whole.
4. Then the reading list of §4, and nothing else. The list is a whitelist.

Run every command from the repository root, `/home/dhiren/MEF_Proof`.

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

**It derives nothing.** It does four things with the PI and stops.

1. **What M2 is to derive.** The PI states it, in the PI's own words. The architect reads it back by CLAUDE.md §3: the words verbatim; a plain-English restatement and the formal translation; which results would rest on it; where a physicist, a mathematician or a philosopher would hear something else; the opposite meaning the words allow; any conflict with earlier statements or rulings. Only the read-back the PI confirms stands. The architect proposes no physics.
2. **The DAG.** `papers/M2/DAG.md`: the steps from M1 v7.0 and the axioms to what M2 is to derive, each a card in the form of §3, drawn up with the PI. The PI supplies the direction; the architect supplies the form and says where a step is too large. If the cards cannot all be written comfortably in one chat, the opening chat writes the first few and says so; the rest are written a few at a time by the chats that follow (§3, "Chats that are not steps").
3. **The write-up log.** `papers/M2/WRITE_LOG.md` is opened with its rules and its entry format (CLAUDE.md §10; the form is the head of `papers/M1/WRITE_LOG.md`, §4), and with no entries.
4. **Two things the assembly protocol leaves to be settled when M2 opens** (its last section): the form of an entry's "place" line that a script can order by; and where the text that is not mathematics comes from (title, abstract, the plain-English openings that `tools/PAPER_FORMAT.md` asks for, headings, bibliography). Each is a point of process, put to the PI in plain English with a proposal.

Then the end of every chat (§3, steps 4 to 8, so far as they apply), with the sections of the registers for M2 opened (§5). **No step of the DAG is begun in the opening chat.**

---

## 3. The small-step rule

**One step of the DAG is one chat, and one step is one result:** one definition, or one proposition with its proof, or one computation.

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
| Done means | what has to exist when the chat ends (the entries, their checks) |
| Size | the estimate in logged sentences; "split" if over the limit |
| Blind | **the PI says** whether a target value exists anywhere; the architect does not look. If one exists it is not on the card and is not looked at until the step's result is logged (CLAUDE.md §5, "Blind") |

**Every step chat runs the same way:**

1. Post; read CLAUDE.md, this file, the list of §4, the card.
2. List the assumptions and wait, as CLAUDE.md §2 says, before the step and before any further judgement the step calls for.
3. Do the step. Each sentence is logged at the moment it is confirmed or checked, with its place (CLAUDE.md §10). What is put to the PI is in plain English first (CLAUDE.md §2).
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
- **The failure tests of M1 v7.0**, the file named in §9: what would show each result of M1 false. If a step of M2 needs the very thing that one of those lines says a later paper must not need, that is reported to the PI at once, in a sentence, with the line.
- **What M1 leaves owed by M2**, the file named in §9, if there is one.
- **The terms of M1:** the section of `registers/Definitions_Register.md` named in §9 (CLAUDE.md §6: "Use every term as the Definitions Register defines it"). No other section of that register, except M2's own (below).
- **`registers/Rulings_In_Force.md` to the heading of its §3 only:** `sed -n '/^## 3\. /q;p' registers/Rulings_In_Force.md` (its §1, the axioms, and §2, how the papers are derived). §3 is about M1 and is read only if the PI names a row. §§4 to 7 are not read: §§4–6 are sealed.
- **M2's own sections of the registers and of the ledger** (§5, "How M2 writes and reads its records"): from the heading `## M2 (new start)` to the end of the file, in each.
- **`papers/M2/`**: this file, `DAG.md`, `WRITE_LOG.md`, `STEP_AUDIT.md`, `checks/`, and the files §9 names, as they come to exist.
- **`papers/M1/WRITE_LOG.md` from its first line to the line `## Entries` only**, for the form of a write-up log: `sed -n '1,/^## Entries/p' papers/M1/WRITE_LOG.md`. No entry of it is read.
- **The sealed list, so as to know what is sealed:** `sed -n '/^## Sealed: not to be read/,$p' papers/M1/HANDOVER.md`. Nothing else of that file. The list was written for sessions on M1: where it says that something sealed is "read" somewhere else (for example in M1's step audit), that does not hold for an M2 chat (§5); its note that the folder `papers/M2/` no longer exists is out of date.
- **`canon/omega-definition-usage_v2.md` §6a only**, for the names that gate 3 forbids (the sealed list allows it).
- **The Decision Log: from the first row of M2 on, and no earlier row** unless the PI names it. The first row of M2 is the first row the opening chat writes; its number is recorded in §8. To read M2's rows: `sed -n '/^| P<that number> /,$p' registers/Decision_Log.md`. To find the last row used, without reading any: `grep -o '^| P[0-9]*' registers/Decision_Log.md | tail -1`; the next free row is one more.
- **`canon/MEF_Academic_Register_Guide.md`** when writing is done (CLAUDE.md §6). The chat that wrote this file did not read it and cannot say that it holds nothing of the earlier M2; it is not on the sealed list.
- **`tools/ROSETTA_STONE.md`** only when the PI writes "Please Rosetta Translate x", or to add a row.
- **External sources** the PI supplies or a step needs; each is entered in Verified References before a paper cites it (CLAUDE.md §4).

---

## 5. Do not read

**The reason for this section is one phrase of the PI's (P96): "to make M2 a true fresh start".** A chat that has read any of the following is not the chat that writes M2. **If one is read by mistake: stop, tell the PI what was read, and wait; the PI decides whether the chat goes on and what becomes of what it has written.**

- **Everything on the sealed list** (the section of `papers/M1/HANDOVER.md` that §4 prints). Among it: `superseded/M2_v1/`; `superseded/M2_second_start/`; Decision Log rows P1–P39 with the section of 8 November, and rows P71–P87; `registers/records/2026-11-11_M2_opening_musing_SEALED.md` and its figure; `registers/Rulings_In_Force.md` §§4–6; the ledger's section on M2 v1.0 and the targets after it; the Minimality rows headed "M2 v1.0"; Definitions and Verified References rows that cite `M2_WP…`, M2 or `papers/M2/…` notes of the earlier starts; the display of the Master Equation in `canon/omega-definition-usage_v2.md`; `papers/M1/LIFT_SIGN.md` §5; the series plan's rows for M6, M7, M9, M10 and M16. "Do not search the ledger, the registers or the Decision Log for "M2"."
- **The Decision Log before the first row of M2.** For rows P88 onward this is the architect's addition and not a ruling: it was flagged at P96 for rows P88–P96, which name in outline what the abandoned second start stood on, and it is extended here to every row up to M2's first, several of which record leads and musings that are premises of nothing.
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

---

## 7. What is not M2

- **M1.** If a step of M2 finds something in M1 v7.0 that looks wrong or missing, the first hypothesis is that the reading is wrong (CLAUDE.md §4). It is reported in a sentence with the line; M1 is changed only as a new version, at the PI's word (CLAUDE.md §6).
- **M3 and later.** What a step finds to be owed by a later paper is entered in M2's section of the Future-Mx Register, and not worked on.
- **Comparison with the old corpus or the sealed material.** After M2 is written and recorded, and not before.

---

## 8. Where M2 stands

*(Rewritten at the end of every M2 chat, in one page. Entries are named by number; no mathematics is restated.)*

- **State, 13 November 2026:** not begun. No DAG, no write-up log, no entry. Waiting for M1 v7.0 in canon.
- **First Decision Log row of M2:** *(empty: the opening chat writes it here)*
- **Next chat, and its work package:** the opening chat (§2).
- **Size limit of a step:** about a dozen logged sentences (a first guess; §3).
- **Open, for the PI:** nothing yet.

---

## 9. To be filled before M2 opens

| # | Blank | Filled by | Value |
|---|---|---|---|
| 1 | M1 in canon: the file | the M1 build | *(empty: to be `canon/M1/Paper_M1_Six_Axioms_v7_0.tex` if the name stands)* |
| 2 | The numbering table, v6.3 to v7.0: the file | the M1 build | *(empty)* |
| 3 | The failure tests of M1 v7.0: a file made by script from the "Failure test" lines of the active entries of M1's write-up log, with nothing else of the log in it | the M1 build | *(empty)* |
| 4 | What M1 leaves owed by M2: **a file, not words written here**, holding it in the words in which it is owed and nothing else of the register it comes from. The PI reads the file before M2 opens and says that it carries nothing of an earlier M2 | the M1 build, with the PI | *(empty)* |
| 5 | The date v7.0 went into canon, and the Decision Log row | the M1 build | *(empty)* |
| 6 | The section of the Definitions Register that holds the terms of M1 as v7.0 uses them: the command that prints it | the M1 build | *(empty)* |
| 7 | The format of a ledger row | the M1 build, with the PI's leave to read the ledger's rows for M1 | *(empty)* |

Blanks 1 and 2 were in the proposal the PI agreed (P163). **Blanks 3 to 7 are additions of the chat that wrote this file**, so that an M2 chat need not open M1's workshop or the older parts of a register. If the PI strikes one, the line of §4 that names it goes with it.

---

## 10. The check of this file

Recorded at Decision Log P163 (the brief) and P164 (its check). A fresh reader was given this file, CLAUDE.md, the assembly protocol, `tools/PAPER_FORMAT.md`, `tools/README.md`, the sealed-list section of `papers/M1/HANDOVER.md`, the head of M1's write-up log, the head of Rulings in Force, one bullet of the M1 build brief and the Decision Log rows this file quotes, and nothing sealed. It was asked whether every quotation is word for word; whether the file states any physics or mathematics, or anything about what an earlier start of M2 contained; whether its reading list and its "do not read" are consistent with each other, with the sealed list and with CLAUDE.md; whether it matches what the PI agreed at P163; and what a chat following it literally could not do.

It found the quotations word for word and **no sentence that states a physical or mathematical content for M2 or what an earlier attempt contained**. Twenty-five findings, thirteen to be fixed before use, all the architect's, each verified before being acted on; what was done is in P164. The chief ones: a blank that would have put words about M2's task into this file (now a separate file that the PI reads first); CLAUDE.md's rules on the Definitions Register, the ledger and the Status column, which the first draft made impossible to follow (M2 now has its own section in each register; the PI edits the Status cell); no format for a Decision Log row and no definition of "the first row of M2"; sub-agents, the history of the repository and carried notes left outside the reading rules; and "list the assumptions once", which narrowed CLAUDE.md §2 for a derivation and is withdrawn. **The corrections were not checked a second time.**

**It could not verify, and neither could the chat that wrote this file:** whether `canon/MEF_Academic_Register_Guide.md`, `tools/ROSETTA_STONE.md`, `MEFProof/`, `canon/M2/`, the ledger or the Future-Mx Register hold material of an earlier M2; the row formats of the registers other than Rulings in Force; that each register's table ends its file.
