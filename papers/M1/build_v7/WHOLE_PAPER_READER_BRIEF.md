# Brief for the whole-paper reader after Pass E (M1 v7.0)

Written 14 November 2026, before the reader was started, and not changed afterwards. Source of the task: Decision Log P104, point 5 ("When the new version is written, every restored sentence is stated in full, and the check is a reader who has the whole paper and the axioms"); `papers/M1/HANDOVER_BUILD.md` §2 "After Pass E", §7 and §19 Part 1 item 2; CLAUDE.md §§5, 11.

## What you are given, and what you read

Work from the repository root `/home/dhiren/MEF_Proof`. Read these files, whole, and no others:

1. `papers/M1/build_v7/passE.tex` — the paper under check, whole (1240 lines). The six axioms are stated in it. The Lean listings are pulled in by `\lstinputlisting` and are not part of the check.
2. `papers/M1/WRITE_LOG.md` — the write-up log: 43 entries, 35 active and 8 retired. Each active entry holds a statement (in a fenced `tex` block), its place, what it rests on, its mark, and what would show it false.
3. `papers/M1/build_v7/COMPOSED.md` — the list of twelve composed sentences; each is set in `passE.tex` between the comment lines `% COMPOSED n: begin` and `% COMPOSED n: end`.

Do not read any register, any handover, the ledger, the Decision Log, anything under `sources/`, `papers/M2/`, `papers/M3/`, `sow/`, or any other file. Do not edit any file. Do not search the web.

## The rules you work under

- You report on what is written. You are **not** asked to find what is wrong with a result, and you do **not** look for counter-examples. If something that looks like a counter-example or an error of mathematics is noticed in passing, report it in one sentence with the lines, and do not pursue it.
- Whether a step holds is judged with the whole paper and the six axioms in view, never from a part. Before you say that something is not stated or not grounded, search the whole of `passE.tex` for the paper's own answer and quote those lines.
- Quote; do not summarise. Every mathematical statement you refer to is quoted from the file with its line number (`passE.tex` l.N, or the entry number). Do not paraphrase a mathematical sentence.
- Mark anything you bring from memory and did not read in these files as RECALLED.
- You are given no conclusion. None is wanted beyond the three parts below.

## What to report

**Part A. The thirty-five active entries, one by one.** For each active entry of the write-up log: (i) the line(s) of `passE.tex` where its statement stands; (ii) whether, read in its place with the whole paper in view, the statement is stated in full, that is, whether every hypothesis it uses and every term it uses is stated or defined in the paper at or before that place, quoting the defining line for each term the statement turns on, or saying which term has no defining line; (iii) whether what the entry's "Rests on" line names (an axiom, a clause of Definition 3.2, an earlier statement, a reference) stands in the paper as the entry says, with the lines; (iv) whether the sentences of the paper immediately round the statement (the proof or paragraph it sits in) use it as it is stated, or use words that the statement does not contain, quoting them. Answer each of (ii)–(iv) as YES, NO or NOT SURE, with the lines.

**Part B. The twelve composed sentences, one by one.** For each: the lines of `passE.tex`; what it joins; whether every term in it is defined in the paper; whether it says anything that no other sentence of the paper says (quote what), or only what the sentences it joins already say (quote them). YES, NO or NOT SURE, with the lines.

**Part C. What the paper says on the following points.** The points below are copied from the build handover. They are things that the entries themselves say are not shown, not claimed, or not checked. For each point, and each clause of each point, report what `passE.tex` itself says: quote the lines where the paper claims it, declares it as an assumption or as open (with its failure test, if the paper gives one), or say that the paper is silent after searching the whole file. Do not decide whether the mathematics is true; report what is written and where. (Line numbers of the form "canon l.N" in these points are of the earlier version v6.3, not of `passE.tex`; find the passage by its words.)

2. **From J7** (`STEP_AUDIT.md` §11.19, rows S7–S9; `HANDOVER.md` item 23): that the proof of Theorem 8.1 delivers each datum up to a relabelling of M1-W032; that the definition applied to the step alone is the count of clause (a) (one direction immediate, the other RECALLED and unread); that the quarter-turn with time run backwards carries every datum of M₁₂ to itself (M1-W034 says it is not shown); that the mirror image of M₁₂ is or is not M₁₂ (not claimed; the symmetry that mirrors the torus is declared open at canon l.442).
3. **From J3 and J4:** the theorem claims existence (P140, Q1; Rulings l.49); that the almost-quaternionic structure exists on the whole of M₁₂ is **declared and not shown** (M1-W031; `STEP_AUDIT.md` §11.18). Reported as not sure and not ruled: that nothing else on the fibre is free (the mark of M1-W028: "it is a check at the build").
4. **From J5:** at Theorem 6.1 clause (c) is used before any use of clause (b); no line says that clause (b) would not select differently (the mark of M1-W012, which carries it to J3; `HANDOVER.md` item 4 says it "ended with J3-a (P140, Q1)", and no later record takes it up, so that it is here on the writing session's own reading and not on a J-session's). Also from J5: M1-W003 says "an involution of $X$" and does not say that it is continuous; "it is put to the PI when M1-W003 is next touched" (`HANDOVER.md` item 17; the flag of P118 on the entry); the build prints M1-W003 as confirmed, and the point is named in the end report.
5. **From J9:** M1-W016 does not say how the fibre algebra acts on spinors; canon speaks of it at ll.536, 566, 728, 837 (`HANDOVER.md` item 18).
6. **From J6:** the meaning of "symmetry" in Definition 2.8 is provisional in the PI's word (P126; M1-W021); M1-W020 supposes that a unit and a complex direction are the only structures selected; M1-W019 does not say what selects the complex direction (`HANDOVER.md` item 19).

## Form of the report

A numbered list of findings, grouped under Parts A, B and C. Each finding: its number; the entry or point it concerns; the lines quoted; the answer (YES / NO / NOT SURE, or for Part C: CLAIMED / DECLARED / SILENT / NOT SURE); and, where the answer is NO or NOT SURE, the question it raises, put in one plain sentence. End with a list, apart, of anything RECALLED, and a list of anything noticed in passing. Your whole report is returned as your final message; it will be kept verbatim.
