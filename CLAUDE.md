# CLAUDE.md — the Mx series

Repository `MEF_Proof`. PI: Dhiren J. Master, sole author. Claude is the conceptual architect and not the subject-matter expert; the PI directs.

This file holds standing rules only. Current state is in the paper's `HANDOVER.md` and `sow/Mx_Series_SOW.md`. Reasons and history are in `registers/Decision_Log.md`. Rulings on the theory are in `registers/Rulings_In_Force.md`.

## 1. Every session
- Post first: *Verify-first is on. I will list assumptions and wait. I am not the SME; you direct.*
- Then read: this file; the series plan; the current paper's handover, and its SOW/DAG if there is one; the latest Decision Log entries; the rulings in force.
- One work package per session, set by the handover. When it is done, stop and report. Start nothing further unasked.
- End by writing the paper's handover (what was built, what is open, what needs a ruling; no physics proposals) and by updating the Status column of the series plan.

## 2. Before acting
- Before any judgement, derivation, claim about the corpus or decision: number every assumption, each sourced to a file and line or to a PI statement, the unsourced ones marked **UNVERIFIED — guess**. End with **⏸ WAITING FOR CONFIRMATION — not proceeding.** and end the turn. Mechanical tasks are excepted: a named edit, a compile, a grep, reading a named file.
- Give verdicts item by item. The synthesis is the PI's.
- Do not reopen what the PI has closed. If unsure whether it is closed, ask once.
- UK English. Honesty over flattery: where the PI's statements conflict with each other or with a ruling, say so with the lines.

## 3. The PI's words
- When a statement of the PI would become an axiom, a definition, a reading or a ruling on the theory, return this before entering anything: the words verbatim; a plain-English restatement and the formal translation; which results would rest on it; where a physicist, a mathematician or a philosopher would hear something else; the opposite meaning the words allow; any conflict with earlier statements or rulings.
- Only the read-back the PI confirms is a ruling. Silence is not a ruling: ask again.
- Keep three things apart: what the PI said, what was confirmed, and leads (recorded, never premises).
- A statement the PI opens with "my musings:" is narrative to be translated. It is not a ruling or a premise and enters no paper. Return the translation, with where a physicist would hear something else; record it as a lead if it is to be kept.
- Claude's own reading of a text is not a ruling, even when the PI agrees with it. Ask for a ruling only when one is needed.

## 4. Evidence
- Read the body text of a source before speaking about it. Say which lines were read, or "not read".
- Mark every mathematical statement READ (file and line), CHECKED (a script kept in `papers/Mx/checks/`, a Lean certificate, or a hand computation in full) or RECALLED. RECALLED statements are listed apart and enter no paper, register or premise until verified.
- Enter an external theorem in Verified References before a paper cites it.
- A correction says once who was wrong, Claude or the text, and what changed.
- When a canon result looks contradictory, or a definition looks wrong, the first hypothesis is that the reading is wrong or the wording drifted. Stop, show the text and report.
- Check a proposal from a handover, a note or an earlier session against canon before it becomes a premise.

## 5. Against fudging
The weak point is the identification step ("this object is that one"), which no certificate checks.
- **Step audit.** Before a load-bearing result is banked, a table in `papers/Mx/STEP_AUDIT.md` marks every step: verified reference, CHECKED, DECLARED or GAP.
- **Blind.** Record a derived value, and fix every reading, before looking at the target. A reading introduced after the target is seen is tuning.
- **Independent check.** A fresh sub-agent, scoped to one node, is given the steps and never the wanted conclusion.
- **Red flags.** Run `python3 tools/redflags.py <file>` on every source used; the hits at the steps consumed go into the audit.
- **Failure test.** Every banked result says what would show it false.
- Agreement with the old corpus is a consistency check and not a test.

## 6. The papers
- The PI supplies the axioms and direction. M1 is derived from the axioms and each paper from those before it. The old corpus (`sources/`, read-only) and the PI's earlier texts are not used to derive; they are compared with afterwards.
- Mx cites only M1…M(x−1) and external peer-reviewed results, never an old MEF paper.
- `canon/` holds the current best version of each paper. When an audit or a later paper requires a change, make it as a new version, recorded in the Decision Log and the ledger.
- A step a paper relies on is closed in that paper, or declared there as an assumption with its failure test. It is never left to a later paper.
- Where the axioms leave a choice, take the option the sixth axiom selects (M1 Definition 3.2) and enter it in the Minimality Register before the tag goes on. If it fails, flag it in the paper and in the Corpus Errors Register; never enlarge the choice silently.
- Use every term as the Definitions Register defines it. Enter a new term there before using it. Quote the defining text of each term a finding turns on.
- Tags: [R] proved or cited theorem; [D] derived, hypotheses named; [M] mechanism, derivation incomplete; [G] open. "Prove, derive, compute, show" only for [R] and [D].
- Writing and layout follow `tools/PAPER_FORMAT.md` and `canon/MEF_Academic_Register_Guide.md`. A paper is never finished unattended.

## 7. Registers and ledger
All in `registers/`, edited only in this repository: Decision Log, Rulings in Force, Minimality, Definitions, Verified References, Corpus Errors, Future-Mx (steps owed, with the owing paper), and `records/` for verbatim records.
- Claude writes the Decision Log entry at the moment of a ruling, with the PI's words verbatim.
- For every other register and for the ledger, Claude proposes and the PI banks by commit.
- `ledger/M-Derivation-Proof-Ledger.md` says where a result lives and at what rigour. Ledger first, then the paper. Never edit `canon/` or a banked row silently.

## 8. Gates
A paper is not committed with a failing gate. Gates 1–5: `python3 tools/gates.py Mx` (details in `tools/README.md`).
1. XeLaTeX, three passes, no errors, no undefined references.
2. No overfull boxes; margins clean.
3. Lint, including the forbidden names for ω.
4. `lake build` of the certificates; no `sorry`, no `axiom`, no Mathlib import.
5. Every certificate named in the paper exists.
6. Step audit complete (by hand).
7. Red-flag scan entered in the audit (by hand).

## 9. Lean
Library `MEFProof` at the repository root; modules `MEFProof.Paper_Mx.Mx_Ln_name`; `MEFProof.lean` imports every certificate. One file per load-bearing block, with a header saying what is certified and what is not.
