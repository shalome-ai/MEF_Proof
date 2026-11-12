# M1 — write-up log

**What this is (CLAUDE.md §10; Decision Log P107).** The mathematics of the paper, one statement to an entry, in the words in which it will be printed. The first draft of the paper is the active entries, verbatim. The Decision Log keeps the PI's words and the process; this log keeps the mathematics. Opened 12 November 2026; it starts with J2 of the audit of Theorem 8.1.

**Rules.**
- An entry is written at the moment the PI confirms a read-back, not afterwards from memory. Before each commit: every item confirmed since the last commit has its entry.
- One statement to an entry, in full, with every hypothesis. Nothing is summarised.
- Before an entry goes in, it is read against every active entry of this log. If it contradicts one, the PI decides which stands, usually the newer. The other is marked **retired**: it is kept and never deleted, and every entry that rests on it is flagged.
- The second pass on the paper adds connecting English and corrects grammar and punctuation. It does not change a logged statement: `python3 tools/writelog_check.py M1 <paper.tex>` checks that every active statement is in the paper word for word (gate 8).

**Format of an entry.**

    ### M1-W001 · active
    - **Statement (as it will be printed):**
    ```tex
    (the statement, in TeX, whole)
    ```
    - **Rests on:** (axiom, clause, earlier entry, verified reference)
    - **Mark:** READ (file, line) / CHECKED (script or hand computation) / DECLARED
    - **Failure test:** (what would show it false)
    - **Confirmed:** Decision Log Pnn, with the date
    - **Retires / retired by:** (entry numbers, or none)

The heading line carries the status: `· active` or `· retired`. The next number is **M1-W001**.

## Entries

*(none yet: no part of J2 is ruled)*
