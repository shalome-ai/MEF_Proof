# The paper assembly protocol

**Set by the PI on 13 November 2026 (Decision Log P159; named at P160). It says how a paper of the Mx series is put together from what has been agreed. It is the second half of a pair:**

- **The paper-writing protocol** is CLAUDE.md §10, "The write-up log" (P107; amended P161), with gate 8 of §8: how each statement is agreed with the PI and logged, word for word, at the moment it is confirmed. It has been followed since J2. Since P161 it asks that every sentence that states mathematics be an entry, the steps of a proof included, and that every entry say where it goes in the paper.
- **The paper assembly protocol** is this file: how the logged statements become the paper, without their meaning moving.

Why it exists, in the PI's words (P159): "I want to make sure that whatever we spent the last 2 days agreeing on is in the new version"; and (P104): "an LLM heavily summarises text. When doing that with mathematical language the summary changes the meaning. You must not do that."

## In a sentence

Put the agreed sentences in exactly as agreed; find and fix what no longer fits, by deleting or copying and never by rewriting; only then improve the flow, and prove that the flow changed no meaning.

## What an error is

Exactly these five kinds, fixed before Pass A, so that the two error logs can be compared:

1. a confirmed sentence missing or altered (checked by `tools/writelog_check.py`, not by the architect). An error of this kind is not left for the next pass: the pass is remade by script at once, the error is recorded in the log, and no pass is finished while gate 8 fails;
2. an old sentence still standing that a confirmed sentence replaces or contradicts;
3. an old word that a ruling removed still in use where the ruling applies;
4. a broken reference or number: an undefined reference (found by compiling), or a number or count written out in the prose that is no longer right (found by the reader);
5. a failure to compile.

The same script and the same checking brief are used for log A and for log B. The checking brief for kinds 2, 3 and the second half of 4 is written once, before Pass A is checked, kept beside the passes, and not changed afterwards. It says what the reader is given (the pass under check; the write-up log; the list of what the rulings removed or replaced; the brief itself; **not** the other pass and not the other log) and what to report (each error with its kind and the offending sentence quoted).

**How errors are counted.** An error is identified by its kind and the text of the offending sentence, not by a line number. Every finding a reader returns is logged; one the architect rejects on checking it against the files stays in the log, marked rejected with the reason, so that the hand that made the pass cannot thin the log. The count of a log is the number of findings not rejected.

## The passes

| Step | What is done | The rule |
|---|---|---|
| **Pass A** | The active entries of the paper's write-up log are put into the document word for word, each at its place. If the paper has an earlier version, a script applies named replacements to it, each matching exactly once, and nothing else is touched. | Entries are taken from the log by script. Nothing is retyped. Pass A need not read well; it must hold everything that was agreed. |
| **Check A** | Error log A: every error numbered, with its kind, its line and its source. | Kinds 1, 4, 5 by script and compile. Kinds 2, 3 by a fresh reader given no conclusion; the architect verifies each finding against the files before logging it. |
| **Pass B** | The errors of log A are fixed. | **Delete or copy; never compose.** An old sentence is removed, or old words are replaced by words copied from a confirmed entry. No paraphrase. |
| **Check B** | Error log B, by the same script and the same brief, with a fresh reader again. | **If log B has more errors than log A, or an error that was not in log A: stop and tell the PI.** The rule is applied as written. The report to the PI says of each such error whether Pass B introduced it or whether it was already in Pass A and the first check missed it. |
| **Pass C** | The errors that remain are fixed, by the same rule. | The script checks are run on Pass C until they pass, and a fresh reader confirms, item by item, that each error of log B is gone. Pass C is the text that Passes D and E are measured against. |
| **Pass D** | Pass C is gone through for a better flowing structure. | **Fenced.** The confirmed sentences stay frozen (gate 8 passes). Paragraphs may be reordered and linking sentences added, each marked `% LINK n`. No sentence that states mathematics is reworded, whatever its source. A script, written before Pass D and kept in `tools/`, confirms that every mathematical sentence of C is unchanged in D. A linking sentence contains no mathematics and makes no claim of its own. |
| **Check D against C; Pass E** | Sentence by sentence: does D mean what C means? Where the meaning has moved, it is put back from C: a changed sentence is restored by copying, a reordering is undone, a linking sentence is removed. The result is Pass E; if nothing had moved, Pass E is Pass D. | By a fresh reader given both texts and no conclusion. The architect wrote D and does not judge it. |
| **Final check: E against C** | Gate 8, the script of Pass D, and a fresh reader on whatever differs between D and E. | **If E still differs from C in meaning: stop and tell the PI. No further pass is begun unasked.** |

**A sentence that states mathematics** is, for the fences and the script of Pass D: any sentence inside a definition, a theorem-like statement or a proof; any sentence containing mathematics in TeX; and any sentence of a confirmed entry.

## Composed sentences

Where a fix cannot be made without a new sentence of mathematics that no entry contains, the sentence is written as short as it can be, set in the source between the comment lines `% COMPOSED n: begin` and `% COMPOSED n: end`, and entered in a list with its number, what it joins and why it was needed. **The PI looks at these at the end, not as they arise.** Each one the PI confirms becomes an entry of the write-up log; one not confirmed is reworded at the PI's word.

A composed sentence is a sign that something was not logged when it was agreed. The fewer the better; the aim for a paper written from scratch is none (see "For a paper written from scratch" below).

## What the PI sees

**No change list.** Nothing in the course of the passes, except at a stop. There are four stops, and no others: the two stop rules of the table; something that looks like an error of mathematics, which is reported in a sentence with the lines and not pursued (CLAUDE.md §§4, 5); and a confirmed entry that cannot be printed as it stands, whose corrected wording only the PI can confirm (CLAUDE.md §10). A session still opens with its assumptions, listed once (CLAUDE.md §§1, 2).

The readers of the checks work to a fixed brief and not an open one. A question that the sense check protocol (CLAUDE.md §11) would send to the PI from one of their reports is held for the end report, unless it is one of the four stops.

At the end, after the checks that follow Pass E, one short report, in plain English first:

- that every confirmed sentence is present word for word;
- the error counts of logs A and B;
- the composed sentences, each in plain English and then as printed;
- the verdict of the two meaning checks.

Presentation (how things are numbered, where a sentence is placed, what a version is called) is decided by the architect on the conventional option and is not put to the PI as a question (P152, P154).

## After Pass E

The gates of CLAUDE.md §8; one reader with the whole paper and the axioms (P104, point 5), its report taken by the sense check protocol of CLAUDE.md §11; the step audit and the red-flag scan. **Any change to the text after the final check** (from these checks, or because the PI rewords a composed sentence) is made by the rule of Pass B, delete or copy, and is followed by gate 8, the script of Pass D and a fresh reader on the passages changed. The move into `canon/` is made at the PI's word, with the ledger and the registers.

## Where the files live

For paper Mx at version n: `papers/Mx/build_vn/`, holding `passA.tex` to `passE.tex`, `ERROR_LOG_A.md`, `ERROR_LOG_B.md`, `CHECK_BRIEF.md` and `COMPOSED.md`, each written there as it is finished, so that a later session resumes from the last finished pass. Committing is at the PI's word, as for any work. A session stops only at the end of a pass or at a stop.

## For a paper written from scratch

M1 v7.0 is assembled from an earlier version plus the entries, and its log was opened part-way (at J2): it holds the statements the PI confirmed and not the steps between them, and some entries do not say where they go. Composed sentences are therefore expected there, and the places of the entries are in `papers/M1/HANDOVER_BUILD.md` §4.

A paper with no earlier version (M2 onward) has nothing to copy from but the log. For such a paper the two rules of CLAUDE.md §10 added at P161 do the work: every sentence that states mathematics is an entry, so that Pass A is the whole of the mathematics in its logged order and **no composed sentence should be needed**; and every entry carries its place, so that Pass A can be made from the log alone. Kinds 2 and 3 of "What an error is" then have nothing to find, and the checks of Pass A reduce to kinds 1, 4 and 5 and a fresh reader's check that the entries stand in the order their "place" lines give.

**Not yet settled, and to be settled with the PI when M2 opens (P141):** the form of the "place" line that a script can order by (the write-up log has it as free prose); and where the text that is not mathematics comes from (title, abstract, the plain-English openings that `tools/PAPER_FORMAT.md` asks for, headings, bibliography), none of which is in a log of mathematics.
