# M2 — handover: the opening brief

**Written 13 November 2026 at the PI's direction ("go", Decision Log P163), by the chat that closed J10 and J8 of M1 and wrote the paper assembly protocol. M2 is started from scratch on the new version of M1 (P94, P95, P96). This file is the brief for the chat that opens M2, and the standing rules for every M2 chat after it.**

**Brought up to date on 18 November 2026 by the opening chat, at the PI's direction (Decision Log P180, P181): "You need to create a new handover document that has (1) and has 3 & 2 as the starting points with no reading of the lift_sign.md". The next chat starts at §0A, which governs where an older line of this file differs from it.** The opening chat is not blind for M2 either: besides the reading list it read, with the PI's leave, parts of M1's workshop (the later sections of `papers/M1/HANDOVER.md`; the method and trap sections of `HANDOVER_BUILD.md`, `HANDOVER_J7.md` and `HANDOVER_J10_J8.md`, and §17 of the first; `build_v7/COMPOSED.md`; and `LIFT_SIGN.md` without its §5 and §7). It has written here only process and the PI's own words.

**Brought up to date on 18 November 2026 by the chat that drew the DAG, at the PI's direction (Decision Log P183): "Now create the SOW/DAG". The cards exist; the next chat is chat C1 of `papers/M2/DAG.md` §4 and starts at §0A.** That chat read only what §4 lists and nothing that §5 bars.

**Brought up to date on 18 November 2026 by chat C1, at the PI's direction (Decision Log P186 to P188). Cards S01 and S02 are withdrawn and nothing was logged; the next chat is chat C2 of `papers/M2/DAG.md` §4, card S03, and starts at §0A.** Chat C1 read only what §4 lists and nothing that §5 bars.

**Brought up to date on 18 November 2026 by chat C3, at the PI's direction (Decision Log P191, P192). Card S04 is done as far as its twelve sentences (M2-W007 to M2-W018) and split; the next chat is chat C3b of `papers/M2/DAG.md` §4, card S04b, and starts at §0A.** Chat C3 read only what §4 lists and nothing that §5 bars; with the PI's leave it read rows V-22 and V-32 of Verified References (P191).

**Brought up to date on 18 November 2026 by chat C3b, at the PI's direction (Decision Log P198, P199). Card S04b is done (M2-W022 to M2-W033), with the first certificate of M2; the next chat is chat C3c of `papers/M2/DAG.md` §4, card S04c, and starts at §0A.** Chat C3b read only what §4 lists and nothing that §5 bars; besides, to write and build the certificate, it read `lakefile.toml`, the lines of `tools/gates.py` on gates 4 and 5, and the import lines of `MEFProof.lean`, and opened no other part of `MEFProof/`.

**Brought up to date on 18 November 2026 by chat C3c, at the PI's direction (Decision Log P202, P203). Card S04c was split before it began, the pieces put together being a new card S04d; S04c is done (eleven active entries among M2-W039 to M2-W051), with its certificate and the one owed for S04; the next chat is chat C3d of `papers/M2/DAG.md` §4, card S04d, and starts at §0A.** Chat C3c read only what §4 lists and nothing that §5 bars; besides, to write and build the certificates, it read `lakefile.toml`, the lines of `tools/README.md` and `tools/gates.py` on gates 4 and 5, and the import lines of `MEFProof.lean`, and opened no other part of `MEFProof/` than `MEFProof/Paper_M2/`; at the PI's request it read `tools/ROSETTA_STONE.md` (P203).

**Brought up to date on 19 November 2026 by chat C3d, at the PI's direction (Decision Log P206 to P209). Card S04d is done (twelve active entries among M2-W052 to M2-W068), with its certificate; the next chat is chat C4 of `papers/M2/DAG.md` §4, card S05, and starts at §0A.** Chat C3d read only what §4 lists and nothing that §5 bars; besides, to write and build the certificate, it read the import lines of `MEFProof.lean` and the head of `MEFProof/Paper_M2/M2_L3_time.lean`, and opened no other part of `MEFProof/`; at the PI's request it read `tools/ROSETTA_STONE.md` (P206, P207); it read the outside sources from their PDFs (Hatcher; Nicolaescu; Gompf).

**This file contains no physics and no mathematics, and must not, at any time; the one exception, made at the PI's direction (P181), is the PI's own sentence on what M2 is to derive, quoted in §0A.** The chat that wrote it is not blind for M2: it has read records that describe, in outline, what the abandoned starts of M2 stood on. It has therefore written here only the process, the reading list, and what the first chat does. What M2 is to derive is stated by the PI in the opening chat and is then held in `papers/M2/DAG.md`; here there is only the PI's sentence.

**M2 does not begin until the new M1 is in canon** (P94). **It is, since 14 November 2026: the file is named in §9, and every blank of §9 is filled.** This file was written when that version was expected to be called v7.0; three small versions followed on the day, and the file in canon is v7.3. **Wherever §§1 to 8 of this file say "M1 v7.0", read "M1 as it stands in canon, the file named in §9".** (In §9 the labels of the blanks keep "v7.0", which was the version that first went into canon.)

**Brought up to date on 14 November 2026 by the chat that built M1, at the PI's direction ("create the handover for the M2 SOW/DAG chat", Decision Log P179); what was changed, and its check, are in §10.** The PI calls what the opening chat produces "the SOW/DAG" of M2: it is `papers/M2/DAG.md` with its cards (§2, §3).

**Checked** by a fresh reader and corrected; see §10. The Decision Log rows named in this file (P88, P94–P96, P104, P141, P154, P159, P163, P164, P169, P172–P179) are named for the PI and for the record: **an M2 chat does not open them** (§5). Rows P180 onward are M2's own and are read (§4).

---

## 0. First, in this order

1. Post: *Verify-first is on. I will list assumptions and wait. I am not the SME; you direct.*
2. Read `CLAUDE.md` **from the file on disk** (a copy carried into a chat by other means may be an older one).
3. Read this file whole.
4. Then the reading list of §4, and nothing else. The list is a whitelist.

Run every command from the repository root, `/home/dhiren/MEF_Proof`.

---

## 0A. Where the next chat starts (18 November 2026; Decision Log P180, P181, P183)

**1. What M2 is to derive.** The PI's words, confirmed by read-back (P181): "What is left for paper M2 to do is to derive the equation that naturally sits on the manifold.  It will need this result, to derive the equation.  How it is used to derive the equation is up to M2 using first principles." The read-back the PI confirmed is `papers/M2/DAG.md` §1, in full, and is read there; it is not restated here. "This result" is named in `papers/M2/DAG.md` §2 and is cited from M1 v7.3 as printed.

**2. The starting points, read first and whole, in this order,** after CLAUDE.md and this file:
- `registers/Learnings_Register.md`;
- M1 as it stands in canon, `canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, with its glossary (Appendix B);
- `papers/M2/DAG.md`, whole: the plan and its rules (§3), the chats (§4), the cards (§5, §6);
- `papers/M2/WRITE_LOG.md` and `papers/M2/GLOSSARY.md`.

Then the rest of the list of §4.

**3. `papers/M1/LIFT_SIGN.md` is not read, in any part** (the PI, P181: "with no reading of the lift_sign.md"). What M2 needs of it is in M1 v7.3. `MEFProof/Paper_2/` is not opened (the PI, P183: "correct do not open it").

**4. The plan is the architect's, and the PI follows it** (the PI, P183: "you should decide how many work packages are , and set how many work packages are done in a particular chat.  We will follow that plan."). A chat does the work packages that `papers/M2/DAG.md` §4 gives it, in order, and no others; one work package is still one result. This replaces "One step of the DAG is one chat" in §3 below.

**5. The work package of the next chat** is chat **C4** of `papers/M2/DAG.md` §4: the card **S05** (the fold and the drive on states), and nothing further. It is a step, and the chat runs as §3 says a step chat runs. S03 is done (M2-W001 to M2-W006, P189); S04 is done as far as M2-W007 to M2-W021 and was split there (P191, P192); S04b is done (M2-W022 to M2-W033, P198, P199); S04c is done (eleven active entries among M2-W039 to M2-W051, P202 to P204); S04d is done (twelve active entries among M2-W052 to M2-W068, P206 to P209). Cards S01 and S02 are withdrawn (the PI, P188; `papers/M2/DAG.md` §3 rule 10): M2 cites M1 v7.3 by its printed numbers, and where a card says "the entries of S01" or "of S02", M1 v7.3 as printed is meant. When the chat rewrites §8 it also brings this section up to date.

**6. What a chat does not put to the PI** (the PI, P187: "don't ask me to confirm/ rule what is blindingly obvious"; Learnings L27, L28). A point on which the architect has a recommendation and on which no proof, result, definition or reading turns is decided, said in a line and recorded. Before a work package is begun the chat says in two sentences what it produces that the derivation needs; if that is nothing, it says so at once and does not begin.

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

**It derives nothing.** It does five things with the PI and stops.

1. **What M2 is to derive.** *(Done, 18 November 2026: §0A, and `papers/M2/DAG.md` §1.)* The PI states it, in the PI's own words. The architect reads it back by CLAUDE.md §3: the words verbatim; a plain-English restatement and the formal translation; which results would rest on it; where a physicist, a mathematician or a philosopher would hear something else; the opposite meaning the words allow; any conflict with earlier statements or rulings. Only the read-back the PI confirms stands. The architect proposes no physics.
2. **The DAG.** `papers/M2/DAG.md`: the steps from M1 v7.0 and the axioms to what M2 is to derive, each a card in the form of §3, drawn up with the PI. The PI supplies the direction; the architect supplies the form and says where a step is too large. If the cards cannot all be written comfortably in one chat, the opening chat writes the first few and says so; the rest are written a few at a time by the chats that follow (§3, "Chats that are not steps").
3. **The write-up log.** `papers/M2/WRITE_LOG.md` is opened with its rules and its entry format (CLAUDE.md §10; the form is the head of `papers/M1/WRITE_LOG.md`, §4), and with no entries.
4. **Two things the assembly protocol leaves to be settled when M2 opens** (its last section): the form of an entry's "place" line that a script can order by; and where the text that is not mathematics comes from (title, abstract, the plain-English openings that `tools/PAPER_FORMAT.md` asks for, headings, bibliography). Each is a point of process, put to the PI in plain English with a proposal.

5. **The glossary.** `papers/M2/GLOSSARY.md` is opened with its rule (CLAUDE.md §6; `tools/PAPER_FORMAT.md`, "Glossary") and with no entry. **It holds M2's own entries only**, in the order of first use; an entry is the term, the words that define it, copied from the entry of M2's write-up log that states them, and that entry's number. **M1's entries are not copied into it:** they are read where they stand, in Appendix B of the file named in §9, and none of them is changed. "The glossary" of M2 means the two together: M1's Appendix B, then `papers/M2/GLOSSARY.md`. When the paper is assembled its appendix "Names and glossary" is M1's entries, copied by script from M1's source, followed by M2's. From the first step on, a term is defined by the architect at its first use, its entry is added in the same chat, and the entry is not revised afterwards. The same entry is copied, in the same chat, into M2's section of the Definitions Register with the number of its write-up log entry (CLAUDE.md §6 asks for both); the glossary is the canonical text and the register row is its copy.

Then the end of every chat (§3, steps 4 to 8, so far as they apply), with the sections of the registers for M2 opened (§5). **No step of the DAG is begun in the opening chat.**

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

*(Rewritten at the end of every M2 chat, in one page. Entries are named by number; no mathematics is restated.)*

- **State, 19 November 2026 (after chat C3d):** S03 is done (M2-W001 to M2-W006). S04 is done as far as twelve entries, M2-W007 to M2-W021 (M2-W009, M2-W012 and M2-W017 retired and replaced by M2-W020, M2-W021 and M2-W019). S04b is done: twelve active entries among M2-W022 to M2-W038 (M2-W027 to M2-W031 retired). S04c is done: eleven active entries among M2-W039 to M2-W051 (M2-W042 and M2-W047 retired). **S04d is done: twelve active entries among M2-W052 to M2-W068** (the definitions M2-W052 and M2-W053, the proposition M2-W054, its proof M2-W055, M2-W056, M2-W064 to M2-W066, M2-W060, M2-W067 and M2-W062, and M2-W068, what is not said; M2-W057 to M2-W059 and M2-W061 retired and replaced by M2-W064 to M2-W067 after the fresh reader's check, P208; M2-W063 retired and replaced by M2-W068 for one corrected wording, confirmed by the PI, P209). The next number is **M2-W069**. Fifteen glossary entries (nine before; six from M2-W052 and M2-W053). Minimality M2-1 to M2-4 (M2-4 new). Verified References V-M2-1 to V-M2-12. Five ledger rows. `papers/M2/STEP_AUDIT.md` has the tables of S03, S04, S04b, S04c and S04d. `papers/M2/checks/` holds, besides the checklist of chat C1, `S04_degree_two.py`, `S04b_lift_signs.py`, `S04c_time.py` and `S04d_whole.py`. **Certificates of M2** (core Lean; import lines in `MEFProof.lean` under the line "-- Paper M2 (new start, Decision Log P180 onward)"; `M2_L4_whole` compiles standalone and its module was built by `lake build`, but the build of the whole library was stopped in chat C3d when the machine ran out of memory on certificates of other papers, P208): `MEFProof/Paper_M2/M2_L1_degree_two.lean` (S04's count, eight theorems), `M2_L2_pillowcase.lean` (S04b, twelve), `M2_L3_time.lean` (S04c, fourteen), `M2_L4_whole.lean` (S04d, thirteen); each certifies finite and integer arithmetic only, as its header says.
- **What chat C3d did:** read the list of §4 (not the assembly protocol, the paper format, the numbering table, the register guide, §6a of the ω file or the head of M1's write-up log); read M1 v7.3 whole once; said in two sentences what S04d produces and what uses it, listed fourteen assumptions, confirmed (P206); read at source, from the PDFs, Nicolaescu's notes (pp.4–5, 27–31, 35, 37–51, 77), Gompf (pp.43–46) and Hatcher (Proposition 2.7, Example 2.48, Theorem 3.2 with pp.191 and 196, pp.207, 214), and proposed V-M2-9 to V-M2-12; changed the route of the count after the reading (said to the PI, P207) and did not use Hatcher's Example 2.48; amended card S04d's line "May use" before use, twice, the PI told each time (P206, P207), and once after use, for what the fresh reader found (P208); put M2-W052, M2-W053, M2-W054 and M2-W063 to the PI by read-back, confirmed (P207); at the PI's direction added part (vi) of the proposition and two steps of proof, which remove a caveat of the read-back, and changed three sentences accordingly; the changed words were shown to the PI and confirmed (P208); entered M2-W055 to M2-W062 as checked; wrote the certificate and the script; gave the PI three Rosetta translations and added seven rows to the Rosetta stone (P206, P207); a fresh reader checked the records (P208: nineteen findings; four checked steps retired and replaced; marks, registers, the ledger, the script, the step audit and this file corrected; two sentences of confirmed statements flagged, their corrected wordings put to the PI). **A correction, the architect's:** it told the PI that M1 has no complex structure on the directions of time and of space; M1 Remark 6.2 (l.732) says that a four-dimensional piece carries the almost-quaternionic structure for any oriented metric and that the time–space block is such a piece (P207; the words of M1 are quoted in M2-W053).
- **The numbered choices of M2 so far** (a musing of the PI, P192, kept as a lead; Learnings L31): M2-1 (M2-W005), M2-2 (M2-W016), M2-3 (M2-W022), M2-4 (M2-W053). The alternatives and what rests on each are in its Minimality row.
- **Leads, premises of nothing** (CLAUDE.md §3): the PI's musing on the torus counted once (P206, with the architect's translation). Noticed by chat C3d and not examined (P207): M1's $\Stwo$ factor is the sphere of imaginary units (M1 l.228; Proposition 7.1), so that a complex structure on time and space that varies with the point of that sphere is another candidate for the one fixed in M2-W053; nothing uses it.
- **Recalled by chat C3 and not verified; premises of nothing:** that the spinor bundle of a product is built from those of its factors (not used by S04d: no source that can be opened was found; the special case S04d needs is a hand step of M2-W059); that a thing on a folded shape and a thing on its cover that the lifted fold leaves unchanged are one object (not used; not claimed).
- **What chat C3c noticed in its head (P202)** on the torus carried round time is now settled by M2-W054, parts (i) and (ii), and is no longer open.
- **Left by S04d, said in M2-W068:** declared and not shown, the family of complex structures carried round time; to S05, how the step acts on a state and the element of the drive on spinors; to S13, the lengths of M1 and the direction of the warp; to S14, the holomorphic structure of the twist and how a state is differentiated. **The weakest step of the card** is M2-W067, which replaced M2-W061 (the step audit says why): its hand steps are made from the definitions of one source and no script or certificate checks them.
- **Settled earlier and standing:** the two proposals at the head of the write-up log (P187); new terms go into the glossary as §6 rule 12 says, in the same chat (P199); a new lemma or proof has its Lean certificate and one ledger row (P186; P199), applied as CLAUDE.md §9 and §7 stand. The chat that writes a certificate adds its import line to `MEFProof.lean` under the line above and opens no other part of `MEFProof/`. Theorem names are prefixed `L1_`, `L2_`, `L3_`, `L4_`, … by file; the next file is `M2_L5_…`. **A build of the whole library is not run** (in chat C3d a plain `lake build` went on to recompile certificates of other papers until the machine had no memory left, P208): the certificate is compiled standalone (`lean <file>`) and its module built alone (`lake build MEFProof.Paper_M2.<module>`, tried in chat C3d on `M2_L4_whole`); the PI is told before anything larger is built.
- **First Decision Log row of M2:** P180 (18 November 2026). Last row used: see the last line of this section.
- **Next chat, and its work package:** §0A, point 5: chat C4, card S05.
- **Learnings L27 to L34** are banked; L34, proposed by chat C3d, is confirmed by the PI (P209): a statement that the earlier paper does not have something is a claim about the corpus, and the paper is searched for it, and the lines shown, before it is said or logged. **The Status cell of M2** in the series plan, confirmed by the PI for the PI to enter (P209): "M2: S04d done (the pieces together: the spinor bundle of the whole geometry); S05 next."
- **Size limit of a work package:** about a dozen logged sentences (§3), counted in entries. S03 took six; S04 twelve with two of its four parts; S04b twelve; S04c eleven; S04d twelve, two of them added at the PI's direction. The limit is kept; it is looked at again in chat C10 (package N0 of the DAG).
- **Noticed in M1 v7.3 in passing, reported to the PI and not pursued** (lines only): l.129 with ll.221 and 244 to 246; l.697 and l.704 with Definition 3.1; l.1190 (chat C1). The references behind l.806, l.818 and l.827 are marked not read in rows V-22 and V-32 of Verified References (chat C3). M1 takes the corner signs "up to one overall sign" (ll.836, 932); M2-W023(iv) gives the signs of the lift with two states for every divisor: an addition (P199). M1 says of the counts that they do not depend on the complex structure of $E$ (l.829); M2-W041(iii) says it of the bundle with its lift: an addition (P203). M1 Proposition 5.8 does not say in words which way the join runs; M2-W039 reads it from M1's own condition (an identification step, P203). M1 prints $S^{1}_{\Sol}$ and $\Ttwo/\Ztwo$ as separate factors (ll.124, 1094) and calls $S^{1}_{\Sol}$ "the Sol torus bundle" (l.339); M2-W052 reads the symbol as the time circle along which the fibre is carried, by M1's own l.127 and Definition 2.1 (an identification step, P206; the PI agrees with the reading, which is not a ruling). M1 says that a $\Spinc$ structure with its integers exists (l.806, l.827); M2-W054(v) shows it on the two products of M2-W008 and M2-W013: an addition (P207). The file `papers/M2/OWED_BY_M2_FROM_M1.md` places M1's sentence on the warp in "Section 1.5" and names its display "(1.1)"; in v7.3 they are Section 1.4 and "(1)". That file was read by the PI and is left as it is.
- **Decided at the close of chat C3d (P209):** the corrected wording of M2-W063 is entered as M2-W068 (the PI's word); the last sentence of M2-W053 is left as it stands and the point is said in its mark (the architect's decision, told to the PI); the point on the family of complex structures carried round time stays declared in M2-W068 and is closed only if a later card needs it (the architect's decision, told to the PI).
- **Open, for the PI:** the line "Blind" of cards S05 to S24: each is treated as if a target existed, and nothing is looked at, until the PI says otherwise (P205). The register rows and the ledger row that chat C3d proposed went in with the commit of P208. Nothing else.
- **Last Decision Log row used:** P209.

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

Recorded at Decision Log P163 (the brief) and P164 (its check). A fresh reader was given this file, CLAUDE.md, the assembly protocol, `tools/PAPER_FORMAT.md`, `tools/README.md`, the sealed-list section of `papers/M1/HANDOVER.md`, the head of M1's write-up log, the head of Rulings in Force, one bullet of the M1 build brief and the Decision Log rows this file quotes, and nothing sealed. It was asked whether every quotation is word for word; whether the file states any physics or mathematics, or anything about what an earlier start of M2 contained; whether its reading list and its "do not read" are consistent with each other, with the sealed list and with CLAUDE.md; whether it matches what the PI agreed at P163; and what a chat following it literally could not do.

It found the quotations word for word and **no sentence that states a physical or mathematical content for M2 or what an earlier attempt contained**. Twenty-five findings, thirteen to be fixed before use, all the architect's, each verified before being acted on; what was done is in P164. The chief ones: a blank that would have put words about M2's task into this file (now a separate file that the PI reads first); CLAUDE.md's rules on the Definitions Register, the ledger and the Status column, which the first draft made impossible to follow (M2 now has its own section in each register; the PI edits the Status cell); no format for a Decision Log row and no definition of "the first row of M2"; sub-agents, the history of the repository and carried notes left outside the reading rules; and "list the assumptions once", which narrowed CLAUDE.md §2 for a derivation and is withdrawn. **The corrections were not checked a second time.**

**Brought up to date, 14 November 2026 (Decision Log P173–P179), by the chat that built M1; that chat is not blind for M2 either, and has written here only process.** Changed: the note at the head that the file in canon is v7.3 and that "M1 v7.0" is to be read as the file of §9; the fifth thing the opening chat does (the glossary), with one clause in the card's "Done means", one sentence in step 3 of a step chat, the glossary file in the list of §4, and rule 12 of §6; the register guide read without its §5.2; the glossary of M1 named in §4; §8; the values of §9 and the paragraph on the glossary under its table. A fresh reader was then given this file, CLAUDE.md and `tools/PAPER_FORMAT.md` and asked whether the changed passages state any physics or mathematics or anything about an earlier M2, whether their quotations of the PI are word for word against Decision Log rows P173 and P177 (which it was given, and no other row), and whether they agree with the rest of the file and with CLAUDE.md; its findings and what was done are in Decision Log P179.

**It could not verify, and neither could the chat that wrote this file:** whether `canon/MEF_Academic_Register_Guide.md`, `tools/ROSETTA_STONE.md`, `MEFProof/`, `canon/M2/`, the ledger or the Future-Mx Register hold material of an earlier M2; the row formats of the registers other than Rulings in Force; that each register's table ends its file.

**Brought up to date, 18 November 2026 (Decision Log P180, P181), by the opening chat.** Changed: the two paragraphs at the head; §0A, new; the note "Done" at thing 1 of §2; in §4 the command for the sealed list, corrected, and the Learnings Register added; in §5 the line on `papers/M1/LIFT_SIGN.md`; §8. Nothing else of §§1 to 9 was changed. A fresh reader then checked the changed passages, `papers/M2/DAG.md`, the Learnings Register, the row of Rulings in Force and rows P180 and P181 against their sources, within reading limits that named nothing sealed; its findings and what was done are in Decision Log P182. The corrections were not checked a second time.

**Brought up to date, 18 November 2026 (Decision Log P183), by the chat that drew the DAG.** Changed: one paragraph added at the head; §0A rewritten; the note in §3 on work packages and chats; `PLAIN_TEXT.md` added to the list of §4; §8. Nothing else of §§1 to 9 was changed. A fresh reader then checked `papers/M2/DAG.md` §§3 to 7, the heads of `papers/M2/WRITE_LOG.md` and `papers/M2/GLOSSARY.md`, the changed passages of this file and row P183 against their sources, within reading limits that named nothing sealed; its findings and what was done are in Decision Log P184.

**Brought up to date, 18 November 2026 (Decision Log P186 to P188), by chat C1.** Changed: one paragraph added at the head; §0A point 5 rewritten and point 6 added; §8. Nothing else of §§1 to 9 was changed.

**Brought up to date, 18 November 2026 (Decision Log P191, P192), by chat C3.** Changed: one paragraph added at the head; §0A point 5 rewritten; §8. Nothing else of §§1 to 9 was changed. The fresh reader's check of chat C3's records is in Decision Log P193; the corrected wordings it led to are in P194 and P195.

**Brought up to date, 18 November 2026 (Decision Log P198 to P201), by chat C3b.** Changed: one paragraph added at the head; §0A point 5 rewritten; §8. Nothing else of §§1 to 9 was changed. The fresh reader's check of chat C3b's records is in Decision Log P200.

**Brought up to date, 18 November 2026 (Decision Log P202 to P205), by chat C3c.** Changed: one paragraph added at the head; §0A point 5 rewritten; §8. Nothing else of §§1 to 9 was changed. The fresh reader's check of chat C3c's records is in Decision Log P204.

**Brought up to date, 19 November 2026 (Decision Log P206 to P209), by chat C3d.** Changed: one paragraph added at the head; §0A point 5 rewritten; §8. Nothing else of §§1 to 9 was changed. The fresh reader's check of chat C3d's records is in Decision Log P208; what was changed after it, at the PI's word, is in P209 and was not checked by a reader.
