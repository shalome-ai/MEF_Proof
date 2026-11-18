# M2 — write-up log

**What this is (CLAUDE.md §10).** The mathematics of the paper, one statement to an entry, in the words in which it will be printed. The paper is assembled from the active entries, word for word, by `tools/Paper_assembly_protocol.md`. The Decision Log keeps the PI's words and the process; this log keeps the mathematics. Opened 18 November 2026 (Decision Log P183), with no entry.

**Rules.**
- Every sentence that states mathematics is an entry: each definition, each statement, and each step of a proof. Nothing mathematical is written for the first time when the paper is assembled; where that cannot be avoided, the sentence is a composed sentence of the assembly protocol, marked as such and shown to the PI.
- An entry is written at the moment the PI confirms a read-back, not afterwards from memory. A step of a proof that is CHECKED or READ and brings in no new reading is entered at the moment it is checked, its "Confirmed" line saying that it was checked and not read back, and the PI is told in plain English what was entered; where it is in doubt whether a step brings in a reading, it is read back. Before each commit: every item confirmed or checked since the last commit has its entry.
- One statement to an entry, in full, with every hypothesis. Nothing is summarised.
- A printed statement says no more than was checked. Whatever an entry's mark says is not shown, or not claimed, goes into the read-back, before the PI confirms.
- Before an entry goes in, it is read against every active entry of this log. If it contradicts one, the PI decides which stands, usually the newer. The other is marked **retired**: it is kept and never deleted, and every entry that rests on it is flagged.
- A term is defined at its first use. The entry that defines it is copied at once into `papers/M2/GLOSSARY.md` and into M2's section of the Definitions Register.
- No pass of the assembly protocol changes a logged statement: `python3 tools/writelog_check.py M2 <paper.tex>` checks that every active statement is in the paper word for word (gate 8).

**Format of an entry.**

    ### M2-W001 · active
    - **Statement (as it will be printed):**
    ```tex
    (the statement, in TeX, whole)
    ```
    - **Place:** `<section key> <number>` (see "The Place line" below), then, after a semicolon, in words what it follows or replaces
    - **Step:** (the work package of `papers/M2/DAG.md` that produced it)
    - **Rests on:** (axiom, clause, result of M1 v7.3 by printed number and label, earlier entry, verified reference)
    - **Mark:** READ (file, line) / CHECKED (a script in `papers/M2/checks/`, a Lean certificate, or a hand computation in full) / DECLARED (a reading or a choice, said as such)
    - **Tag:** [R] / [D] / [M] / [G], where the entry is a statement that carries one
    - **Failure test:** (what would show it false)
    - **Confirmed:** Decision Log Pnn, with the date; or "checked, not read back", with the date
    - **Retires / retired by:** (entry numbers, or none)

The heading line carries the status: `· active` or `· retired`. The next number is **M2-W001**.

**The Place line** *(proposed by the architect, 18 November 2026; one of the two points the assembly protocol leaves to be settled; not yet confirmed by the PI).* The line begins with a section key and a number, for example `states 030`. The section keys, in the order of the paper, are: `front` (the title and the abstract), `intro`, `m1`, `states`, `conditions`, `minimal`, `warp`, `supply`, `select`, `theorem`, `checks`, `outlook`, `ack` (the acknowledgements), `lean`, `glossary`, `bib` (the bibliography). Within a section the entries are printed in the order of their numbers. Numbers are given in tens, so that an entry agreed later can be placed between two earlier ones without renumbering. Pass A is made by a script that sorts the active entries by section key, in the order above, and then by number. A retired entry keeps its Place line. A change to the list of section keys is presentation and is made here, at the head of this log, and nowhere else.

**The text that is not mathematics** *(proposed by the architect, 18 November 2026; the second of the two points; not yet confirmed by the PI).* The title, the abstract, the headings, the plain-English openings that `tools/PAPER_FORMAT.md` asks for, and the linking sentences are kept in `papers/M2/PLAIN_TEXT.md`, one piece to an item, each with a Place line of the same form, so that the same script puts them in. They are written by the architect in package N1 of the DAG, after the mathematics is logged. A piece of that file states no mathematics and makes no claim of its own: where a plain-English opening says what a result is, it says it by pointing to the entry, and if it has to state mathematics, that sentence is first made an entry of this log and confirmed like any other. The bibliography is made by script from M2's section of `registers/Verified_References.md`, and the glossary appendix from M1's Appendix B and `papers/M2/GLOSSARY.md`. A fresh reader checks that no piece of `PLAIN_TEXT.md` states mathematics that is not in an entry. The PI is shown the abstract and the plain-English openings at the end, with the composed sentences if there are any.

## Entries
