# CLAUDE.md — the Mx series

Repository `MEF_Proof`. PI: Dhiren J. Master, sole author. Claude is the conceptual architect and not the subject-matter expert; the PI directs.

This file holds standing rules only. Current state is in the paper's `HANDOVER.md` and `sow/Mx_Series_SOW.md`. Reasons and history are in `registers/Decision_Log.md`. Rulings on the theory are in `registers/Rulings_In_Force.md`.

## 1. Every session
- Post first: *Verify-first is on. I will list assumptions and wait. I am not the SME; you direct.*
- Then read, in this order: this file; the current paper's handover. The handover's reading list and its sealed list govern everything after it: the series plan, the SOW/DAG, the Decision Log and the rulings in force are read only as far as the handover allows.
- One work package per session, set by the handover. When it is done, stop and report. Start nothing further unasked.
- End by writing the paper's handover (what was built, what is open, what needs a ruling; no physics proposals) and by updating the Status column of the series plan.

## 2. Before acting
- Before any judgement, derivation, claim about the corpus or decision: number every assumption, each sourced to a file and line or to a PI statement, the unsourced ones marked **UNVERIFIED — guess**. End with **⏸ WAITING FOR CONFIRMATION — not proceeding.** and end the turn. Mechanical tasks are excepted: a named edit, a compile, a grep, reading a named file.
- Plain English first. Whatever is put to the PI is said in two or three plain sentences, what changes and why, before any code, table or TeX is shown. What follows from the paper's own text is kept apart from what is Claude's judgement.
- Presentation is not put to the PI. How things are numbered, labelled or placed, and what a version is called, are decided on the conventional option and said in a line; they are among the mechanical tasks excepted above. A point is presentation when no answer to it changes a proof, a result, a definition, a reading or a confirmed statement; such a point is never put as a conflict with a ruling. Everything else is put to the PI as §§2, 3, 5 and 11 say.
- Give verdicts item by item. The synthesis is the PI's.
- Do not reopen what the PI has closed. If unsure whether it is closed, ask once.
- UK English. Honesty over flattery: where the PI's statements conflict with each other or with a ruling, say so with the lines.

## 3. The PI's words
- When a statement of the PI would become an axiom, a definition, a reading or a ruling on the theory, return this before entering anything: the words verbatim; a plain-English restatement and the formal translation; which results would rest on it; where a physicist, a mathematician or a philosopher would hear something else; the opposite meaning the words allow; any conflict with earlier statements or rulings.
- Only the read-back the PI confirms is a ruling. Silence is not a ruling: ask again.
- Keep three things apart: what the PI said, what was confirmed, and leads (recorded, never premises).
- A statement the PI opens with "my musings:" is narrative to be translated. It is not a ruling or a premise and enters no paper. Return the translation, with where a physicist would hear something else; record it as a lead if it is to be kept.
- Claude's own reading of a text is not a ruling, even when the PI agrees with it. Ask for a ruling only when one is needed.
- **"Please Rosetta Translate x".** When the PI writes this, restate x in the three columns of `tools/ROSETTA_STONE.md`: the jargon, a first-year translation, the plain-English intuition; first the terms, then sentence by sentence, without changing what x says. Begin with "In a nutshell": at most four sentences saying what x claims and what it asks of the PI. It is a summary for orientation only; nothing is argued from it and it is entered nowhere. At all other times answer in the usual way. The file is a communication aid: it is not a source and not a register, and nothing in it enters a paper.
- **Keeping the Rosetta stone.** When a term of mathematical jargon is used with the PI, in any paper or session, and it is not in `tools/ROSETTA_STONE.md`, add a row for it to Part B in that session, and say in the end-of-session report which rows were added.

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
- **Context first.** Whether a step of a paper holds is judged with the whole paper and the axioms in view, never from a part. Before a step is called a gap: search the whole canon paper and the axioms for the paper's own answer and show those lines in full; then ask the PI, in plain English, what was meant. Each item ends as one of three: the sentence is restored from elsewhere in the paper; the ground is stated by the PI and written in full; the item is open.
- **Counter-examples.** A counter-example is looked for only when the PI asks for one explicitly, naming the statement. Confirmation of a list of assumptions is not such a request. Neither Claude nor a sub-agent is given an open brief to find what is wrong with a result. A counter-example the PI has asked for is tested against all six axioms and the readings of the whole paper, never against one definition alone. If something that looks like a counter-example is noticed in passing, it is reported in a sentence with the lines, and not pursued.
- **Independent check.** A fresh sub-agent, never given the wanted conclusion. For a computation it is scoped to that computation and blind. For whether a step holds it is given the whole paper and the axioms.
- **In full.** A mathematical statement is quoted, or stated with every hypothesis. It is never summarised: in a paper, a register, a handover or a report.
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
- Every paper has a glossary (PI, Decision Log P173): the appendix "Names and glossary", where the names are fixed and become canonical. Mx carries the glossary of M(x−1), keeps its names, and adds the terms Mx introduces. An entry is the term, the words of the paper that define it, copied by script and never rewritten, and where they stand; a term with no defining sentence in the paper is put to the PI and is not given a definition by Claude. A thing is named one way throughout a paper and throughout the series.
- Tags: [R] proved or cited theorem; [D] derived, hypotheses named; [M] mechanism, derivation incomplete; [G] open. "Prove, derive, compute, show" only for [R] and [D].
- Writing and layout follow `tools/PAPER_FORMAT.md` and `canon/MEF_Academic_Register_Guide.md`. A paper is put together from its write-up log (§10) by `tools/Paper_assembly_protocol.md`. A paper is never finished unattended, and it goes into `canon/` only at the PI's word.

## 7. Registers and ledger
All in `registers/`, edited only in this repository: Decision Log, Rulings in Force, Minimality, Definitions, Verified References, Corpus Errors, Future-Mx (steps owed, with the owing paper), and `records/` for verbatim records.
- Claude writes the Decision Log entry at the moment of a ruling, with the PI's words verbatim.
- For every other register and for the ledger, Claude proposes and the PI banks by commit.
- `ledger/M-Derivation-Proof-Ledger.md` says where a result lives and at what rigour. Ledger first, then the paper. Never edit `canon/` or a banked row silently.

## 8. Gates
A paper is not committed with a failing gate. The working passes of the assembly protocol are not yet the paper: they may be committed, with their error logs, while gates other than gate 8 fail. Gates 1–5: `python3 tools/gates.py Mx` (details in `tools/README.md`).
1. XeLaTeX, three passes, no errors, no undefined references.
2. No overfull boxes; margins clean.
3. Lint, including the forbidden names for ω.
4. `lake build` of the certificates; no `sorry`, no `axiom`, no Mathlib import.
5. Every certificate named in the paper exists.
6. Step audit complete (by hand).
7. Red-flag scan entered in the audit (by hand).
8. For a paper built from a write-up log (§10): `python3 tools/writelog_check.py Mx <paper.tex>`; every active statement is in the paper word for word. No pass of the assembly protocol, from Pass A on, is finished until it passes.

## 9. Lean
Library `MEFProof` at the repository root; modules `MEFProof.Paper_Mx.Mx_Ln_name`; `MEFProof.lean` imports every certificate. One file per load-bearing block, with a header saying what is certified and what is not.

## 10. The write-up log (the paper-writing protocol)
Each paper under development has `papers/Mx/WRITE_LOG.md`: the mathematics, one statement to an entry, in the words in which it will be printed. This section is how a paper is written; how the log then becomes the paper is `tools/Paper_assembly_protocol.md`.
- Every sentence that states mathematics is an entry: each definition, each statement, and each step of a proof. Nothing mathematical is written for the first time when the paper is assembled; where that cannot be avoided, the sentence is a composed sentence of the assembly protocol, marked as such and shown to the PI.
- An entry is written at the moment the PI confirms a read-back, not afterwards from memory. A step of a proof that is CHECKED or READ and brings in no new reading is entered at the moment it is checked, its "Confirmed" line saying that it was checked and not read back, and the PI is told in plain English what was entered; where it is in doubt whether a step brings in a reading, it is read back. Before each commit, check that every item confirmed or checked since the last commit has its entry.
- An entry holds: the statement in full, with every hypothesis; its place in the paper (the section, and what it follows or replaces); what it rests on (an axiom, a clause, an earlier entry, a verified reference); its mark; what would show it false; its status, active or retired.
- Before an entry goes in, read it against every active entry of the paper. If it contradicts one, the PI decides which stands, usually the newer. The other is retired: kept, never deleted, and every entry that rests on it is flagged.
- The paper is assembled from the active entries by `tools/Paper_assembly_protocol.md`: the entries go in word for word (Pass A); what no longer fits is found and fixed by deleting or copying, never by composing (Passes B and C); the flow is improved only after that, and a check shows that no meaning moved (Passes D and E). No pass changes a logged statement (gate 8). Within the passes Claude does not stop for confirmation (§2) except where the protocol says to stop; the PI is shown no list of changes along the way, and at the end a short report with any sentence that had to be composed.
- The Decision Log keeps the PI's words and the process; the write-up log keeps the mathematics. A Decision Log row points to the entry and does not restate it.

## 11. The sense check protocol
It is applied to the report of an audit, a fresh read or a red team, and to nothing else. A red team finds real errors and also makes errors of its own, from reading a part without the whole paper and the axioms; this protocol removes the second kind before anything reaches the PI. In ordinary derivation work there is no such report, and the method is §§2, 3 and 5 as they stand.
- An audit, a fresh read or a red team reports on what is written, never with an open brief to find what is wrong (§5). Its report becomes a numbered list of findings, and each finding the questions it raises.
- **Reduce before asking.** Take the questions in turn. For each, search the paper for its own answer (§5, "Context first"), then apply the six axioms and the clauses of the sixth axiom for the shape (M1 Definition 3.2), and pick the option they select. Carry each pick forward: every later pick is consistent with the earlier ones, and the report says which rests on which.
- **Clear, or not sure.** A pick is made only when a clause or an axiom names the quantity and one option survives with the lines shown. Otherwise the answer is "not sure", and the question goes to the PI.
- **What reaches the PI.** The questions marked not sure; those where two clauses pull different ways; those whose answer would change an axiom's reading, a definition or a theorem; and those where the paper's own lines conflict. Three or four, not twenty.
- **A pick is a reading.** It is reported as Claude's, with its ground. It becomes a ruling only when the PI confirms it, and the PI may overturn any pick.
- **Before any wording is put to the PI,** read every line of the paper and every active entry of the write-up log that uses the terms in it, and make the English consistent with them. Words are copied, not reconstructed.
- **Repeat the task back** before running the protocol.
