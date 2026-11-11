# Zero-based CLAUDE.md: what happens to every rule of the present file

**11 November 2026.** Directed by the PI (Decision Log P49(3); read-back points 1–6 agreed). This is the table of point 5. **CLAUDE.md has not been rewritten.** Nothing is switched until the PI approves this table.

**The present file:** 131 lines, 3,655 words (counted). **Target:** about one page, 600 to 800 words.

**The four marks.**
- **KEEP**: stays in CLAUDE.md, reworded as trigger and action.
- **MERGE**: stays, folded into the rule named.
- **MOVE**: leaves CLAUDE.md for the file named; CLAUDE.md keeps at most a pointer.
- **DROP**: leaves and is not kept anywhere new. The Decision Log and git history still hold it.

The content of the rules is not reopened (point 6). Where the present file conflicts with itself, the table cannot simply reword, and the choice is put to the PI in §1.

## 1. Five conflicts that need the PI's choice

| # | The conflict | Lines | What I would write, for the PI to confirm or correct |
|---|---|---|---|
| C1 | The PI's three texts are "the reference" and the task is to find where M1 and M2 departed from them. Later rulings (P31, P43) say the three texts are not premises, are not cited and are not audited against, for M1 and M2 | §0a first three bullets, against §0a sixth bullet and §5 | One rule, the later one: *the PI supplies the axioms and direction; M1 is derived from the axioms and each paper from the ones before it; the old corpus and the PI's three texts are not used to derive and are compared with afterwards.* The statement that the three texts are the reference is dropped |
| C2 | Canon holds "the frozen papers"; "no paper is truly frozen" | §3 against §2c | *A paper in `canon/` is the current best version. When a later paper or an audit shows it must change, it changes as a new version, recorded in the Decision Log and the ledger.* The word "frozen" goes |
| C3 | "Claude proposes register and ledger entries; the PI banks"; the Decision Log is "written the moment the ruling is made" | §6 | *Claude writes the Decision Log entry at the moment of the ruling, with the PI's words verbatim. Every other register and the ledger: Claude proposes, the PI banks by commit.* This is what has in fact been done |
| C4 | Seven gates are listed; "run … (all five)" | §8 | *Gates 1–5 are scripted (`tools/gates.py`); gates 6 and 7 are checked by hand until scripted.* |
| C5 | The principle of minimality is "the standing principle", beside the axioms; under P42–P46 minimality is the sixth axiom, in three clauses | §4 against §5 and the M1 draft | *Wherever the axioms leave a choice, the series takes the option the sixth axiom selects (M1 Definition 3.2); each such choice is entered in the Minimality Register before the tag goes on.* The wording follows the M1 draft and is final only when the draft is accepted |

## 2. The table

| Present rule | Where | Mark | Goes to / becomes |
|---|---|---|---|
| Repository, PI, role of Claude (architect, not the SME; the PI directs) | header | KEEP | two lines |
| Date of the file; "seeded from the chat that built M2" | header | DROP | history |
| Opening handshake, posted first every session | §0 | KEEP | one line |
| Reading order at the start of a session | §0 | KEEP | corrected: the paper's SOW/DAG "if there is one" |
| The PI's own account is the reference; where M1 or M2 disagrees the error is theirs | §0a | — | conflict C1 |
| The fifth axiom is the centre, not an addition | §0a | MOVE | `registers/Rulings_In_Force.md` (a statement about the theory) |
| The task: find where M1 and M2 departed from the PI's account | §0a | DROP | superseded by P31 and P43; M2 v1.0 is withdrawn |
| The pure mathematics of M1 is not thereby false | §0a | DROP | history |
| The fifth axiom in M1: two clauses force the twist; later papers build on it | §0a | MOVE | `Rulings_In_Force.md`; it is also in canon M1 |
| Limit for the M1 rewrite: the three texts are not premises | §0a | MERGE | into the rule of C1 |
| Claude does not simply agree; where the PI's statements disagree with each other, say so with the lines | §0a | KEEP | merged with "honesty over flattery" and with §2e item 2 |
| State the plan, list sourced assumptions, write the waiting line, end the turn; mechanical tasks excepted | §1 | KEEP | one rule |
| No self-generated work loops; when a node is done, stop and report | §1 | KEEP | |
| Item-by-item verdicts; synthesis is the PI's | §1 | KEEP | |
| Corrections stated once; no lectures | §1 | KEEP | merged with "a correction says once who was wrong" (§2a) |
| Never assert unsourced | §1 | MERGE | into the READ / CHECKED / RECALLED rule (§2a) |
| Do not revisit what the PI has closed; if unsure, ask once | §1 | KEEP | |
| UK English; honesty over flattery | §1 | KEEP | |
| Rulings are the PI's; do not manufacture rulings; a confirmed reading is not a ruling | §1 | KEEP | merged with §2e item 3. **Note:** "a confirmed reading is not a ruling" (§1) and "only the confirmed read-back is a ruling" (§2e) read as opposites. They mean different things: the first is about Claude's reading of a canon text, the second about the PI's own statement. The new wording will say so |
| Check handover and proposal physics against canon before adopting it | §2 | KEEP | one line; the account of 8 November dropped |
| A "contradiction" found in a canonical result: first hypothesis, the architect's reading is wrong; stop and report | §2 | KEEP | merged with the same rule for definitions (§2d): one "first hypothesis" rule |
| Why the evidence rules exist (the PI relies on what Claude reports) | §2a | DROP | reason; the Decision Log has it (P20) |
| Read before speaking; say which lines were read; "not read" if not | §2a | KEEP | |
| Mark every mathematical statement READ, CHECKED or RECALLED | §2a | KEEP | |
| RECALLED statements are quarantined | §2a | KEEP | same rule |
| Load-bearing claims get an independent check; the script goes in `papers/Mx/checks/` | §2a | KEEP | merged with the blind check (§2b.3) |
| A correction says once who was wrong | §2a | MERGE | with §1 |
| Every external theorem cited is entered in Verified References first | §2a | KEEP | |
| Why the anti-fudging measures exist; the identification step is the weak point | §2b | KEEP | one sentence |
| 1. Step audit before a load-bearing theorem is banked | §2b | KEEP | merged with gate 6 |
| 2. Derive blind to the target | §2b | KEEP | |
| 3. Independent check that has not seen the conclusion | §2b | KEEP | merged with §2a's independent check and with the sub-agent rule (§7) |
| 4. Red-flag scan of every source; the list of what is flagged | §2b | KEEP the rule; MOVE the list | the list to `tools/README.md` |
| 5. A failure test for every claim | §2b | KEEP | |
| 6. Agreement with the old corpus is not a test; a new reading is tuning | §2b | KEEP | |
| Ungrounded steps are parked in the Future-Mx Register | §2b | MERGE | into the registers list |
| No paper is frozen until the series is consistent | §2c | — | conflict C2 |
| Nothing is left to a later paper that the present paper relies on | §2c | KEEP | |
| M1 and M2 were written before §§2a–2b and are audited under them | §2c | DROP | done for M1 (v5.0); M2 v1.0 withdrawn |
| The Definitions Register holds every term; read and write each term as it defines it; enter a new term first | §2d | KEEP | |
| Quote the defining text of every term a finding turns on | §2d | KEEP | |
| If a definition seems to need changing, first hypothesis: the wording drifted | §2d | MERGE | the "first hypothesis" rule |
| USED UNDEFINED and COLLISION entries are settled before the term is used again | §2d | KEEP | one clause |
| The read-back rule, six items | §2e | KEEP | condensed to about five lines |
| Canon holds the papers with their certificates | §3 | KEEP | with C2's wording |
| Island rule: Mx cites only M1…M(x−1) and external peer-reviewed results; no MEF corpus paper is cited; old papers are read-only in `sources/` | §3, §11 | KEEP | §11 merged in |
| The ledger is the source of truth for where a result lives and at what rigour | §3 | KEEP | |
| Rigour tags [R] [D] [M] [G] and the verbs each allows | §3 | KEEP | two lines |
| The principle of minimality and its register; the obligation when a minimal option fails | §4 | — | conflict C5; the register rule and the obligation are kept |
| The sixth axiom; M1 being redone; M2 waits | §5 | MOVE | the series plan and `papers/M1/HANDOVER.md` (already there) |
| Discipline (P43): axioms and direction from the PI; derive; compare afterwards | §5 | KEEP | the rule of C1 |
| Language: the read-back rule | §5 | MERGE | §2e |
| "M1 is v5.0 with five axioms"; its six numbered choices; M1 says nothing on which piece the warp scales | §5 | MOVE | the series plan; the last clause to `Rulings_In_Force.md` |
| M2 v1.0 is withdrawn; `superseded/M2_v1/` is not read by the session that writes the new M2 | §5 | MOVE | `papers/M2/HANDOVER.md` (already there) |
| The PI's rulings on the theory that stand for M2 | §5 | MOVE | `Rulings_In_Force.md` |
| What was set aside with M2 v1.0 | §5 | MOVE | `Rulings_In_Force.md`, under "not in force" |
| Forbidden names for ω | §5 | MERGE | gate 3 already checks them; a pointer to `canon/omega-definition-usage_v2.md` §6a |
| The six registers and what each is for | §6 | KEEP | a compact list |
| Who writes the registers | §6 | — | conflict C3 |
| Registers and ledger are edited only in this repository | §6 | KEEP | |
| `registers/records/` holds verbatim records the PI directs to be kept | §6 | KEEP | one clause |
| One work package per session; end by writing the paper's HANDOVER with three things and nothing else | §7 | KEEP | |
| Keep the series plan's Status column current | §7 | KEEP | |
| No physics proposals in a handover | §7 | KEEP | |
| Sub-agents only when scoped to one SOW node; a paper is never finished unattended | §7 | KEEP | merged with the blind check |
| The seven gates | §8 | KEEP the list, one line each; MOVE the detail | margin tolerances, lint list and toolchain detail are already in `tools/README.md` |
| How to write the paper (title, abstract, §1, register, appendices, AI statement, macros) | §9 | MOVE | `canon/MEF_Academic_Register_Guide.md`; CLAUDE.md keeps a pointer |
| Layout as M1 v4.1 (line spacing, proof steps on their own lines, emergency stretch) | §9 | MOVE | the same guide; the preamble lines are in `tools/m1_build_v4.py` |
| Lean: library name, directory convention, one file per block, header comment | §10 | KEEP | two lines |
| The certificates of the withdrawn M2 v1.0 must not be in the tree | §10 | MOVE | `papers/M2/HANDOVER.md` |

## 3. Counts

The table has 70 rows (counted by script).

- KEEP: 42. MERGE: 7. Many of the 42 fold into one another; my estimate, not counted, is about 25 rules in the new file.
- KEEP the rule and MOVE its detail: 2.
- MOVE: 10, to five files that already exist and one new one.
- DROP: 5.
- Marked as a conflict: 4 rows; with the gate count (C4) that is the 5 conflicts of §1.

## 4. What has to exist before the switch

1. **`registers/Rulings_In_Force.md`** (new): the PI's rulings on the theory that are in force, each with its Decision Log number, and a short list of what is not in force. Its M2 part is copied from CLAUDE.md §5 and `papers/M2/HANDOVER.md` without my reading anything of the withdrawn M2 v1.0.
2. **`canon/MEF_Academic_Register_Guide.md`**: the layout rules of §9 added. I have not read this guide in this session; I do not know whether it already holds part of §9.
3. **`tools/README.md`**: the list of red-flag classes added.
4. The new CLAUDE.md, shown to the PI as a draft beside the present one before it replaces it.

## 5. Not part of this project file

`~/.claude/CLAUDE.md` (the PI's global file) holds only "- to memorize" four times. It has no effect. Whether to empty it is the PI's call; I have not touched it.
