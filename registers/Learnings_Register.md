# Learnings Register

**What this is.** The lessons on how the papers of the Mx series are made, kept in one place so that a mistake made once is not made again. Opened 18 November 2026 at the PI's direction (Decision Log P180): "we need to gather the learnings into a succinct Learnings_Register.md which starts from the lessons from M1. As we learn new lessons deriving M2 and other Mx papers those learnings should be added to the Learnings_Register".

**Rules.**
- It holds process only: no mathematics, and nothing of what any paper derives.
- A row is the rule, what happened, and where it is recorded. The PI's words are in quotation marks, verbatim.
- Every session reads it whole at the start.
- A lesson is added in the session that learns it: Claude proposes the row in the closing report and the PI banks it by commit (CLAUDE.md §7). Rows are numbered L1, L2, … and are not renumbered. A row that turns out wrong is marked withdrawn, with the reason, and kept.
- The column "Recorded at" is for the record. A chat opens a file named there only if its paper's handover allows it.
- Decision Log rows before P180 are named here as the files cited below name them; the rows themselves were not opened when this register was written.

## The root cause, in the PI's words

- 18 November 2026 (P180): "We found a result, rather than recording verbatim it was "remembered".  When constructing the paper, the memory was sumarised (errors introduced) then expanded (errors introduced).  As we do each element of the SOW/ DAG we record the result verbatim.   At the end the verbatim is put in the document,  copy paste - not LLM paraphrased !!!  Then connecting sentences applied.  Then checked for readability."
- P104: "an LLM heavily summarises text. When doing that with mathematical language the summary changes the meaning. You must not do that."
- P141: "When doing M2 - we are going to break the DAG down into smaller bite size pieces - write and log as we go along - so that you will cut and paste agreed text rather than summarise or "remember from memory" that is how these errors were introduced."
- P159: "I was very annoyed to have to go through 2-3 days of all these J1-J11 revisions because you did not have a robust process for creating a paper."

## Lessons from M1

### A. Recording and writing

| # | The rule | What happened | Recorded at |
|---|---|---|---|
| L1 | Record each result word for word at the moment it is agreed or checked. Never afterwards, never from memory. | Results were found and then remembered. The write-up log of M1 was opened part-way, at J2. | PI, P180; CLAUDE.md §10; `tools/Paper_assembly_protocol.md`, "For a paper written from scratch" |
| L2 | Every sentence that states mathematics is logged, the steps of a proof included, and each entry says where it goes in the paper. | The log held the confirmed statements and not the steps between them, and some entries did not say where they go. Twelve sentences had to be composed at the build. | `tools/Paper_assembly_protocol.md`, "For a paper written from scratch"; `papers/M1/build_v7/COMPOSED.md` |
| L3 | Never summarise or paraphrase a mathematical sentence: in a paper, a register, a handover or a report. Quote it, or state it with every hypothesis. | Summaries changed the meaning; most audit "gaps" in M1 were Claude's compressed wording and not missing mathematics. | P104; CLAUDE.md §5, "In full"; Claude's working note of 12 November 2026 |
| L4 | Words are copied, not reconstructed. Before any wording is put to the PI, read every line of the paper and every active entry that uses its terms, and copy. | Wordings put to the PI were constructed: an object no ruling had was introduced by paraphrase; an expression was written that stands nowhere in the paper; one word was swapped for another in a quotation. | `papers/M1/HANDOVER_J7.md` §10, trap 1 (P139, P142, P143) |
| L5 | Copy from the ruling, not from the older text that the ruling replaced. | A phrase was copied from the paper at a place where a ruling had already replaced it, and misquoted. | `papers/M1/HANDOVER_J10_J8.md` §10, trap 1 (P143); `papers/M1/HANDOVER_BUILD.md` §13, trap 3 |
| L6 | Quote by line, and check the line: print it and read what is there. | Quotations were sourced to the wrong line, and a line was listed for a word it does not contain. | `HANDOVER_J10_J8.md` §10, trap 2 (P144, P146, P148); `HANDOVER_BUILD.md` §13, trap 2 (P144, P146, P148, P156) |
| L7 | The paper is assembled by copying: the logged sentences go in word for word; what does not fit is fixed by deleting or copying, never by composing; connecting sentences come only after that, carry no mathematics, and a fresh reader checks that no meaning moved. | The PI: "I was very annoyed to have to go through 2-3 days of all these J1-J11 revisions because you did not have a robust process for creating a paper." | P159; `tools/Paper_assembly_protocol.md` |
| L8 | A printed statement says no more than was checked. Whatever its mark says is not shown goes into the read-back, before the PI confirms. | An entry asserted more than its own mark said had been checked, and the caveat was left out of the read-back. | `papers/M1/HANDOVER_J10_J8.md` §10, trap 4 (P148, P149); `HANDOVER_BUILD.md` §13, trap 4 (P148, P149, P156, P157) |
| L9 | One thing has one name. A term is defined at its first use, goes into the glossary, and is not revised afterwards. | M1 carried two namings of the same things until v7.2 made them one. The PI: "You define when it is first used, it goes into Glossary, that becomes canonical, any future reference refers to the Glossary. Glossary is carried forward to Mx+1 , new terms are added. There is no backwards revision". | P173–P177; CLAUDE.md §6; `papers/M1/HANDOVER.md`, the notes on v7.1 and v7.2 |
| L10 | One step is one result and one chat. A step that turns out larger is split, never compressed. *(Changed by the PI at P183: a chat does the work packages the DAG gives it, one or more; one work package is still one result.)* | The risk in a long chat, in the PI's words: "the only thing that i want us to do is to keep the DAG steps small enough to be comfortably in one chat. That reduces the risk of conflation, addition etc." | P141, P163; `papers/M2/HANDOVER.md` §3 |

### B. The PI's words, and what is put to the PI

| # | The rule | What happened | Recorded at |
|---|---|---|---|
| L11 | Plain English first: two or three plain sentences on what changes and why, before any code, table or TeX. | A table of codes with a request to confirm got a confirmation that was not an informed one, and a change had to be undone. | `HANDOVER_BUILD.md` §13, trap 6 (P154); CLAUDE.md §2 |
| L12 | A read-back carries every item of CLAUDE.md §3. The PI's choice of an option is not a confirmation of a read-back that says more. | Read-backs were put without "where others would hear something else", "the opposite meaning" or the conflicts; a chosen option was taken as confirming more than it did. | `HANDOVER_J10_J8.md` §10, traps 5 and 6 (P127, P128, P130; P110, P119); `HANDOVER_BUILD.md` §13, trap 5 (P153) |
| L13 | The PI uses some terms of physics in a sense of the PI's own. Take the plain-English statement as the content, translate it, and read it back before a term is adopted. "my musings:" is narrative and not a premise. On "Please Rosetta Translate x", translate x by `tools/ROSETTA_STONE.md`. | The PI and Claude misunderstood each other without knowing it; the errors of one audit report were found only when the PI had it translated. | CLAUDE.md §3; Claude's working notes of 11 and 12 November 2026, which cite P106 and P108 |
| L14 | An observation of the PI's is not a direction. Translate and read back before acting on it. | A remark of the PI's was read as "a direction on scope". That it was a statement of fact is the architect's reading, recorded in the handover and not in a ruling. | `HANDOVER_J7.md` §10, trap 4 (P144) |
| L15 | Do not overstate what an agreed entry fixes: it fixes what it needs for its own purpose and no more. | An entry made as a declared reading for one purpose was reported as settling a further point. | `HANDOVER_J7.md` §10, trap 5 (P142, P144) |
| L16 | Presentation is not put to the PI, and never as a conflict with a ruling. Add no item of Claude's own to a list for the PI. | Numbering was put as a conflict between two of the PI's statements and changed nothing in the paper. The PI: "if we are forced to make a choice then make the choice … numbering is presentation and irrelevant". An item in no source was added to a list. | `HANDOVER_BUILD.md` §3 and §13, traps 7 and 8 (P152, P154); CLAUDE.md §2 |
| L17 | Say "conflict" only for a contradiction, with both lines. Otherwise say which it is: a reading, an addition, or notation; and say first whether any proof or finding changes. | Alarm words cost the PI several turns to find that nothing was broken. | Claude's working note of 11 November 2026 |
| L18 | Ask for a ruling only when one is needed. Where the paper settles a point, state it. "Not sure" is an answer. | A point was put to the PI as a question when canon already fixed it, and the question confused the PI. | Claude's working note of 10 November 2026; CLAUDE.md §11 |

### C. Checking

| # | The rule | What happened | Recorded at |
|---|---|---|---|
| L19 | Whether a step holds is judged with the whole paper and the axioms in view. First search the paper for its own answer and show the lines in full; then ask the PI what was meant. On whether a step holds, no reader is given a part alone (a blind check is kept for a computation), and no counter-example is looked for unless the PI asks, naming the statement. | The PI: "This happened because you "red teamed" J2 in isolation of the rest of the paper, and the axioms. So the red team concluded something based purely on what it was given. Everything it said was correct. But it was incorrect because in context the results were wrong. We cannot use this process that you are using to fix J2 (Jx)." | P104, P105; CLAUDE.md §§5, 11 |
| L20 | No mathematical claim from memory. Mark each READ, CHECKED or RECALLED; a RECALLED claim is listed apart and enters nothing until verified. | A theorem was offered from memory, withdrawn, and the withdrawal was itself premature. | Claude's working note of 10 November 2026; CLAUDE.md §4 |
| L21 | Checks are not made by the hand that wrote. A script for what a script can check; a fresh reader, given no conclusion and a brief fixed in advance, for the rest. Every finding a reader returns is verified against the files before it is acted on. | A reader's finding was itself wrong about its source. Two readers on one brief filed the same sentences differently, and that, not the pass under check, fired a stop. | `HANDOVER_J7.md` §10, trap 7 (P146); `HANDOVER_BUILD.md` §3, §13 trap 9 and §17 (P144, P156, P159) |
| L22 | A handover is checked line by line against its sources by a fresh reader before the PI sees it. Quote the PI; do not paraphrase a ruling. | Three re-reads of one handover found 16, then 8, then 54 errors, the last by an independent reader. | Claude's working note of 11 November 2026 |

### D. Closing and records

| # | The rule | What happened | Recorded at |
|---|---|---|---|
| L23 | Close once. Sweep everything owed into one list and put it once. | Leftover items were reported one at a time over several closing messages. The PI: "I am also begin to wonder that you keep on pulling on every single thread - we have tried to close this chat 3 times already." | `HANDOVER_J10_J8.md` §3 and §10, trap 9 (P125) |
| L24 | Do not print a register to find a row number: match the first cell only. | Recorded as a trap with four rows; the incidents are in those rows, which were not opened when this register was written. | `HANDOVER_BUILD.md` §13, trap 10 (P94, P98, P150, P158) |
| L25 | A `% COMPOSED` or `% LINK` marker stands alone on its line. | Text after a marker on the same line is a comment and is not printed, and no gate catches it. | `HANDOVER_BUILD.md` §17 |

## Lessons from M2

| # | The rule | What happened | Recorded at |
|---|---|---|---|
| L26 | A command in a brief that prints part of a file names both ends of the part, and is run again whenever the file it reads has changed. | The brief's command printed a file from the sealed-list heading to the end of the file. Sections were added to that file afterwards, and the opening chat of M2 read them. | P180 |
