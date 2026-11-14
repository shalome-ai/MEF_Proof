# Brief for the collation of the step table of Theorem 8.1 in M1 v7.0 (gate 6)

Written 14 November 2026 before the collation was started, and not changed afterwards. Source of the task: CLAUDE.md §5 ("Step audit"), §8 gate 6; `papers/M1/HANDOVER_BUILD.md` §7 item 8 and §19 Part 1 item 3.

## What this is

A collation of marks already on record. It is **not** a new judgement of the mathematics, not a search for what is wrong, and not a search for counter-examples. Where no mark is on record for a step, the row says "no mark on record"; you do not supply one from your own judgement and you do not call anything a gap yourself.

## Files you read (from the repository root `/home/dhiren/MEF_Proof`), and no others

1. `papers/M1/build_v7/passE.tex`, whole (1240 lines): the paper, v7.0. The six axioms are in it.
2. `papers/M1/WRITE_LOG.md`, whole: the 35 active entries (and 8 retired). Each has a "Mark" line (READ / CHECKED / DECLARED, with what is "taken as known and not read at source" and what is "not in this entry and not claimed by it") and a "Failure test" line.
3. `papers/M1/STEP_AUDIT.md`, lines 175 to the end (its §§8 to 11): the step tables of the earlier version v6.3 and the outcomes of the items J1 to J11 (§§11.12 to 11.21). Line numbers quoted there as "l.N" are of v6.3, not of `passE.tex`; find the passage in `passE.tex` by its words.
4. `papers/M1/build_v7/COMPOSED.md`: the twelve composed sentences (marked in `passE.tex` by `% COMPOSED n` comment lines).
5. `papers/M1/build_v7/REDFLAGS_passE.txt`: the output of the red-flag scan on `passE.tex`.

Do not read any register, handover, ledger, the Decision Log, `sources/`, `papers/M2/`, `papers/M3/`, `sow/`. Do not search the web. The only file you create is the output file named below; edit no other file.

## The table

Take Theorem 8.1 of `passE.tex` (label `thm:main`, statement and proof, about ll.1085 to 1117). Make one row for each hypothesis named in its statement, one for each datum named in its conclusion, and one for each sentence of its proof. Then, for each result that a sentence of the proof cites (each theorem, proposition, lemma, corollary, definition or remark named there), add rows for that result: one row for its statement and one for each step of its proof that an active write-log entry states or that §§8 to 11 of the step audit give a row to. One level of citation from the proof of Theorem 8.1 is the minimum; follow a second level where the cited result's own proof rests on another numbered result of the paper.

Each row has these columns:

- **#** a running number (V1, V2, …);
- **Step**: the sentence, quoted from `passE.tex` word for word (not summarised; a long statement may be quoted by its first and last ten words with "…" between, with its lines), and its line numbers in `passE.tex`;
- **Source of the text**: "entry M1-Wnnn" if an active entry states it; "composed n" if it is a composed sentence; otherwise "v6.3 unchanged";
- **Mark on record**: one of *verified reference* (an external theorem recorded as read at source), *CHECKED* (a script, a Lean certificate or a hand computation in full; name it), *DECLARED* (a reading, a choice or an assumption stated in the paper), *GAP* (recorded as a gap and not closed on record), or *no mark on record*; taken from the entry's Mark line or from the step-audit row, and quoted with its place (entry number, or `STEP_AUDIT.md` line and row id). Where the v6.3 audit row was a GAP and one of §§11.12 to 11.21 records its outcome, give the outcome and its place. Where a mark says something is "taken as known and not read at source", say so in the row, in the mark's words;
- **Not claimed / not shown, on record**: what the entry's Mark or the audit says is not in the statement, not shown, or declared open, quoted;
- **Failure test on record**: quoted from the entry's "Failure test" line or from the paper, or "none on record";
- **Red flag**: any hit of `REDFLAGS_passE.txt` at the lines of this row, quoted; otherwise blank.

After the table: (i) a list of the rows whose mark is GAP or "no mark on record"; (ii) a list of every red-flag hit, saying for each whether it lies at a line some row of the table consumes; (iii) the twelve composed sentences, each with the row that holds it or "not in a row"; (iv) anything noticed in passing, one sentence each with lines, not pursued.

## Output

Write the whole of it to `papers/M1/build_v7/STEP_TABLE_v7_0_DRAFT.md`. Your final message is short (under about 500 words): the path; the number of rows; the count of rows by mark; the list (i) by row number with a few words each; and the count of red-flag hits at consumed lines.
