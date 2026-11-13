# Handover: complete J10 and J8, together

**Note, 13 November 2026 (P153): this brief is spent. J10 and J8 are closed (Decision Log P151–P153; `papers/M1/STEP_AUDIT.md` §§11.20, 11.21; `papers/M1/WRITE_LOG.md` M1-W035 to M1-W042; `papers/M1/HANDOVER.md` item 24). After it: M1-W039 (row E6) was retired at the PI's direction, row E6 keeping its [R] (P154); the reading on Corpus Errors 32(h) was dropped and the register entries banked (P155); a fresh reader checked the records (P156); M1-W042 was retired by M1-W043 (P157). Its numbers are those before that session: the next Decision Log row is now P158 and the next entry M1-W044; the current state is in `papers/M1/HANDOVER.md`, item 24. It is kept as the record.**

**Written 13 November 2026 at the PI's direction, at the end of the session that closed J7 (Decision Log P147–P149). It is the brief for one chat and one work package: J10 and then J8, taken together (PI, P148: "The order  should be J10 then J8  - we could do them together"). It does not replace `papers/M1/HANDOVER.md`, which is the paper's handover and holds the history; this file is the working brief and says which parts of that file are read. `papers/M1/HANDOVER_J7.md` is the record of the brief before this one and is not needed.**

**Checked** by a fresh reader given this file, CLAUDE.md and the sources it names; the findings are corrected here. See §13.

---

## 0. First, in this order

1. Post: *Verify-first is on. I will list assumptions and wait. I am not the SME; you direct.*
2. Read `CLAUDE.md` from the file on disk. It is the standing rules. Its §11, "The sense check protocol", governs how the questions of J10 and J8 are reduced before any reaches the PI.
3. Read this file whole.
4. Then the reading list of §4, and nothing else. The list is a whitelist.

Run every command from the repository root, `/home/dhiren/MEF_Proof`.

**Where this file and `papers/M1/HANDOVER.md` differ on a number, a line range, the reading list or the work package, this file governs:** that file's section "The next session" was written for earlier Js and keeps their lines as the record (for example its items 0 to 3 and its "Work package: J7").

**One work package: J10, then J8.** When both are done, stop and report. Start nothing further unasked; in particular **the new version of M1 is not begun** (§11).

---

## 1. The task

**J10 and J8 are findings 10 and 8 of the audit of Theorem 8.1.** Quoted whole from `papers/M1/STEP_AUDIT.md` §11.5:

- row J10 (l.578): `| J10 | Readings not among the nine numbered choices: A's list of twenty-eight | architect, A, B in part | DECLARED in the text, unnumbered |`
- row J8 (l.576): `| J8 | Tags of the table: E2, E3, E8, E9, E12 carry [R] and rest on results tagged [D] or on undeclared steps; E11 rests on J1 | architect, B | overstated |`

### 1.1 J10

**What is already ruled (P97(2), quoted from the Decision Log row):** "**(2) The readings and identifications of M1 that are not among its numbered choices become numbered choices.** The principle is ruled. The list is not: it is drawn up when J10 is taken, from `papers/M1/STEP_AUDIT.md` §11.4 (reader A's twenty-eight places) and §11.1 (T1, T4, T11), and each item is put to the PI with its wording before it is numbered, since some may prove to be consequences and not choices. No Minimality entry is made until then."

**Its sources:**
- `STEP_AUDIT.md` §11.9 (from l.639): reader A's list in full, items 4.1 to 4.28, with A's list of terms used and not defined (its 7.10). The section's own words on its standing: "a reader's list, model output; each item is put to the PI before it is numbered, since some may prove to be consequences and not choices (P97(2))".
- `STEP_AUDIT.md` §11.1, rows T1, T4, T11; §11.4, row T1.
- **What the J-sessions since have sorted to J10**, each recorded in `papers/M1/HANDOVER.md` under "Carried forward" of the item named. **In every case the sorting to J10 is the architect's ("the architect's view"; "the sorting is the architect's") and not a ruling.** They are listed here by pointer so that none is lost; the wording of each is read at its source:
  - item 16 (J2): whether and how the declared choices of M1-W004 and M1-W005 are numbered ("the architect's view, not put to the PI"); beside it, carried there without being sorted to any J: whether the choice of M1-W004 is "a further numbered choice of the paper or a further item of clause (c)" (P111, "Not ruled"), and that R3 says the choice is "taken because it is the least" while its ground in Definition 3.2 is open;
  - item 17 (J5): the hypothesis "exactly four isolated fixed points" (audit row T4(iii)), on which M1-W003 and M1-W013 rest;
  - item 18 (J9): the two readings that M1-W017 and M1-W015 declare (canon l.449's parenthesis, row T4(i); canon l.467's reading of A1, row T4(ii));
  - item 19 (J6): the readings M1-W019 declares (the direction and not the unit; the phase), A's 4.20; the base as the product of the two orbits, A's 4.18;
  - item 20 (J11): "for one of the two lifts" (canon l.763; A's 4.23); that Definition 7.4 is unnumbered (A's 4.22); the hypothesis of Corollary 7.8 that the lifted fold is one structure on the whole geometry (A's 4.25);
  - item 21 (J3, J4): the readings of M1-W025 and M1-W026 (where the growth sits); the reading of M1-W017's parenthesis ("composition run backwards", said of the fold, which is the swap applied twice);
  - item 23 (J7): whether the new definition of "the same geometry" (M1-W032) is a numbered choice.
- **Active entries marked DECLARED whose marks do not themselves defer to J10** (found by reading the marks; whether any is a numbered choice is part of drawing up the list): M1-W001, M1-W004, M1-W005, M1-W019, M1-W020, M1-W021 (its second sentence provisional in the PI's word), M1-W027, M1-W028, M1-W029, M1-W031. `STEP_AUDIT.md` §11.17 also carries to J10 "the readings of §11.9 as before".
- **The tenth choice** (J1; P92): complex spinors; in P92's words "the tenth choice of M1, the seventh of Section 2". It is ruled and numbered; it has no entry in the write-up log, and whether the rulings made before the log was opened (J1, P92; the integer on S², P97(1)) are given entries has **never been asked of the PI** (`HANDOVER.md` item 2, the bullet on the write-up log: "ask before writing any").
- **Where canon counts its choices** (`HANDOVER.md` item 5): ll.129, 163, 181, 193, 211, 223, 239, 247, 964, and the theorem's own list at l.967. Canon l.239 is the paragraph "What has been chosen"; l.247 names the seventh, eighth and ninth.

**What J10 is not.** It is not a re-opening of any reading. Every reading named above has been ruled, declared or restored in its own J; J10 asks of each only **whether it is a numbered choice, a consequence, or part of a choice already numbered, and, if a choice, its number and where it is stated.** A reading whose substance the PI has closed is not asked again (CLAUDE.md §2).

### 1.2 J8

**Its sources:**
- `STEP_AUDIT.md` §11.1, the elimination table, rows E1 to E14 (ll.468–481): the architect's verdicts, fixed before reader B reported. The closing sentence of that table: "The table is a list of examples. It is not exhaustive and the proof does not use it; uniqueness rests on T3–T12."
- `STEP_AUDIT.md` §11.3, rows E1 to E14 (ll.495–508): reader B's verdicts beside the architect's.
- Corpus Errors entry 32, item (g): "**J8. Tags of the elimination table** (ll.1002–1015): the rows D ≢ 0 (4); D = 4, 8; Tⁿ, n ≠ 2; T⁴/ℤ₂ and K3; bases with moduli carry [R] and rest on results tagged [D], on undeclared steps, or (the last) on a functional that is not defined. The row on spin bases rests on (a)." Beside it, item (h), which is about tags and not about the table: "**[R] on statements that include a selection:** Theorem 4.2's "Consequently …" (l.300) and Proposition 4.5's "the clause selects it" (l.409). The [R] content is the conjugacy statements." Whether (h) is taken with J8 is for the PI.
- The table itself: canon ll.996–1018, its fourteen rows at ll.1002–1015.
- **What the J-sessions since have carried to J8** (`HANDOVER.md`): item 19 (J6), rows E11 and E13; items 21 and 22 (J3, J4), the tag of row E12, whose printed row is now write-up log M1-W030 (printed \rigD; "whether that tag stands is J8, and this entry does not prejudge it"). For the build and not for J8 unless the PI says: row E7 (item 18) and row E11's rewording (item 5, the bullet on J1).

**The meaning of the tags** (CLAUDE.md §6, quoted whole): "Tags: [R] proved or cited theorem; [D] derived, hypotheses named; [M] mechanism, derivation incomplete; [G] open. "Prove, derive, compute, show" only for [R] and [D]." Canon's own gloss, l.129: "Rigour is tagged \rigR\ (proved, or a cited classical theorem), \rigD\ (derived under a stated reading) and \rigM\ (motivated)."

**Why J8 comes after J10.** The architect's note, not a ruling: a row's tag depends on what its exclusion rests on, and whether that is a theorem, a numbered choice or a declared reading is what J10 settles. `HANDOVER.md` item 6 has it "last, when the content is fixed".

**Standing of a J (P104; the architect's wording, agreed by the PI with points 1–5).** A place where the text does not carry the argument to a reader; **not, until the method of §3 has been followed, a step in doubt.**

---

## 2. What "done" means

J10 and J8 have each been taken **part by part** by the method of §3, and each part has ended as one of its three outcomes, **the PI having confirmed which**:

1. the sentence is restored from elsewhere in the paper;
2. the ground is stated by the PI and written in full;
3. the item is truly open.

For J10 "part" is, at the least, each reading on the list once the list is drawn up; the division is the session's to propose and the PI's to confirm. For J8 the division is likewise the session's to propose: the audit row names E2, E3, E8, E9, E12 and E11, the sessions since add E13, and the table has fourteen rows; whether every row is taken or only those named is put to the PI (§12).

"Written in full" means **as an entry of `papers/M1/WRITE_LOG.md`**, written at the moment the PI confirms the read-back (P107; CLAUDE.md §10): the statement in full as it will be printed, what it rests on, its mark, its failure test, its status; and it is read against **every active entry** before it goes in. The entries are the log; they are not yet a version of M1.

Then: a new section of `papers/M1/STEP_AUDIT.md` for each J (the next are §11.20 and §11.21), as every closed J has: the lines shown, the outcomes table, the step table of any new entry (CLAUDE.md §5, gate 6), the red-flag scan of every source used (`python3 tools/redflags.py <file>`, gate 7) and the failure tests; the Decision Log row (it points to the entry and does not restate it); register entries proposed; `papers/M1/HANDOVER.md` and this file brought into line; the series plan's Status cell edited by the method of §5. Then stop and report.

---

## 3. The method — read this before touching either J

**It is the method of P104 and P105, and CLAUDE.md §§5 and 11.** The PI's words that set it, at P104:

> "This happened because you "red teamed" J2 in isolation of the rest of the paper, and the axioms. So the red team concluded something based purely on what it was given. Everything it said was correct. But it was incorrect because in context the results were wrong. We cannot use this process that you are using to fix J2 (Jx)."

The five points the PI agreed ("Points 1–5 agreed"):

1. **Paper first.** For each J, the whole of canon M1 and the axioms are searched for the paper's own answer, and the lines are shown **in full, unshortened**.
2. **Then the PI.** Only what the paper does not answer goes to the PI, as a plain-English question about what was meant.
3. **No counter-examples and no isolated reader** on whether a step holds. Blind checks are kept for computations only.
4. **Three outcomes per item**, as in §2.
5. **When the new version is written,** every restored sentence is stated in full, and the check is a reader who has the whole paper and the axioms.

**Counter-examples (P105; CLAUDE.md §5).** Looked for only when the PI asks for one explicitly, naming the statement. Reader B's verdicts in §11.3 include examples the PI did not ask for; they stand as what they are and are not taken further.

**The sense check protocol (CLAUDE.md §11).** J10 and J8 arrive as rows of an audit report, so the protocol applies. **Repeat the task back before running it.** Take the questions in turn, search the paper for its own answer, apply the six axioms and the clauses of Definition 3.2, carry each pick forward, and say which rests on which. **A pick is made only when a clause or an axiom names the quantity and one option survives with the lines shown; otherwise the answer is "not sure" and the question goes to the PI.** A pick is a reading, reported as the architect's with its ground; it becomes a ruling only when the PI confirms it.

**J10 is where this protocol is most needed.** The list is long: twenty-eight places of reader A, three rows of §11.1, and the items carried from seven sessions, with overlaps. "Three or four, not twenty" (CLAUDE.md §11). What reaches the PI (CLAUDE.md §11, quoted): "The questions marked not sure; those where two clauses pull different ways; those whose answer would change an axiom's reading, a definition or a theorem; and those where the paper's own lines conflict." The architect adds, not part of the rule: a pick that changes how many choices the paper counts is put to the PI as well. The rest are reported as picks, in one table, for the PI to confirm or overturn.

**The PI's words on leftover items (P125), which apply to a list of this length:** "I am also begin to wonder that you keep on pulling on every single thread - we have tried to close this chat 3 times already." Sweep every item into one list and close once.

---

## 4. Read

- **this file**, whole.
- **`CLAUDE.md`**, from disk.
- **`papers/M1/HANDOVER.md`** from the heading `## Audit of Theorem 8.1` to the end. Items 16 to 23 are the records of the J-sessions already closed; their "Carried forward" bullets are sources for J10 and J8 (§1). **Item 23** is the J7 session.
- **`papers/M1/STEP_AUDIT.md`** §11, from the heading `## 11.` to the end of the file. It has no §11.2. For J10: §11.1 (from l.438), §11.4 (from l.527) and §11.9 (from l.639). For J8: the two tables at ll.468–481 and ll.495–508. §§11.12 to 11.19 are the outcomes of the Js already closed.
- **`canon/M1/Paper_M1_Six_Axioms_v6_3.tex`**, ll.1–1105. `\appendix` is l.1035; Appendix A begins at l.1037; Appendix B's text is l.1075; l.1077 begins the bibliography.
- **`papers/M1/WRITE_LOG.md`**, every entry. Thirty-four entries, M1-W001 to M1-W034: **twenty-eight active and six retired** (M1-W002 by M1-W010, M1-W011 by M1-W013, M1-W014 by M1-W017, M1-W018 by M1-W021, M1-W022 by M1-W024, M1-W033 by M1-W034). **The next number is M1-W035.** Read every entry: a new entry is read against every active one, and for J10 the marks of the entries say which statements are DECLARED and where each defers its numbering to J10.
- **`registers/Rulings_In_Force.md` ll.1–54 only** (its §§1–3; §4 begins at l.56 and nothing from it on is read).
- **Decision Log rows P88 onward:** `grep '^| P\(8[89]\|9[0-9]\|1[0-9][0-9]\) ' registers/Decision_Log.md`. **The next number is P151** (P150 records this file and its check). Read **P97, P104 and P105 with care**. Row format: `| Pnn | date | **Title (PI).** text, the PI's words verbatim in quotation marks | tags |`.
- **Corpus Errors Register, entries 32 to 35 only:** `sed -n '/^## 32\./,$p' registers/Corpus_Errors_Register.md`. Entry 32, item (g), is J8's; item (h) stands beside it, and whether it is taken with J8 is for the PI (§1.2, §12). The register's own "Action" line classes (h) with the wording items.
- **Definitions Register, the section for M1 only:** `sed -n '7,30p' registers/Definitions_Register.md` — the heading at l.7 and the rows to l.30. Line 31 is blank and the register's general preamble begins at l.32; it and the other sections are not read.
- **Verified References, three rows:** `grep '^| V-\(10\|14\|23\) ' registers/Verified_References.md`.
- **`papers/M1/COMMUTANT_LEAD.md`**.
- **`tools/ROSETTA_STONE.md`** only when the PI writes "Please Rosetta Translate x", or to add a row for a term of jargon used with the PI that it lacks. Rows added are reported at the end of the session.
- **as the work needs, and nothing else:** other files under `papers/M1/` (the earlier sections of `STEP_AUDIT.md`, the notes, `checks/`), `canon/M1/`, `MEFProof/Paper_M1/` and `tools/`, **except `papers/M1/LIFT_SIGN.md` §5, which is sealed.**

**The J2 sources are not read** unless the work calls for them: `J2_SOURCES_PROMPT.md`, `J2_sources_from_chat.md`, `J2_COVER_LEAD.md` and the PDFs in `papers/M1/sources/`. The three Verified References rows above are read all the same, though `HANDOVER.md` item 0 lists them among the J2 sources: they bear on which statements are cited theorems, which is J8's question.

---

## 5. Do not read

- **`sow/Mx_Series_SOW.md`.** At the end of the session its Status cell for M1 is edited **without reading the file**: the cell contains, once in the file, the string

  `J8 and J10 open (J1, J2, J3, J4, J5, J6, J7, J9 and J11 closed); one new version to be built when all are ruled; canon unchanged**`

  (set on 13 November after P147). Replace that string by a script; the new wording is the session's, in the form of the old (which Js are closed; the one new version to be built; "canon unchanged**").
- **`registers/Rulings_In_Force.md` from l.56 on**; the rest of the Decision Log.
- **every other register and register row, and the ledger.** The architect's instruction; its reason is the breach of P94. **This bears on J10 in particular: the Minimality Register is not read**, although the numbered choices have rows in it (M1-15 to M1-18 are described in a phrase each in `HANDOVER.md`; M1-19 and M1-20 are only named there, at item 21; the earlier rows are known only by the numbers `STEP_AUDIT.md` gives them; the last row named anywhere on the reading list is M1-20, and the last Verified References row named is V-31, so a new row's number is found by printing the register's last row number as a number only, as P124 did). To write to a register, append a row in its format without reading the file: Minimality, eight cells, `| # | Node | Choice space | Minimal option | Criterion | Stated at | Failure test | Status |`; Verified References, six cells, `| # | Statement as used | Source | Wanted by | Status | Notes |`; Definitions, three cells, `| **term** | definition | source |`; Rulings in Force, two cells, `| ruling | source |`, inserted at the end of §3 (after l.54; l.54 and the l.56 of §4 then move); Corpus Errors, **a new `## 36.` section at the end**; Future-Mx, a new section `## F-11. <what is owed> — owed by M<n> (source)` at the end. If the PI wants the Minimality Register read for J10, the PI says so.
- **`papers/M3/`, `sow/M3/`, `canon/omega-definition-usage_v2.md`.**
- **anything in the sealed list** (`papers/M1/HANDOVER.md`, the section headed "Sealed: not to be read until the new M2 is written and recorded", at l.481). Read that list before opening any file not named above. Decision Log rows P1–P39 with the section of 8 November ("every row above P40" in the list's words, meaning earlier in the file) and rows P71–P87 are sealed; where an audit row cites one, what it holds about M1 is in `STEP_AUDIT.md` §11.8.

---

## 6. What J10 and J8 may use, already settled

Rulings in force. They are not answers; they are what the session may lean on.

| What | Where |
|---|---|
| The unnumbered readings and identifications become numbered choices; the list is drawn up at J10 and each item is put to the PI with its wording, since some may prove to be consequences | P97(2) |
| The sixth axiom has three clauses, "each a reading and a numbered choice" | Rulings l.34 (P45, P46) |
| Complex spinors are the tenth numbered choice of M1, the seventh of Section 2; a declared choice, not shown to be selected by the sixth axiom | P92; Rulings l.43 |
| The three clauses are in an order of priority: (a) over (b), (b) over (c) | P117; M1-W012; Rulings l.35 |
| Row E12 rests on Definition 2.8 and clause (b), not on clause (a); its tag is taken with J8 | P140 (E12); M1-W030; Rulings l.52 |
| The base is ℂP² × S² and nothing further by clause (b) | P128; M1-W020 |
| M1 has no energy functional; a modulus is a continuous datum the axioms and readings leave free | P140 (Q4); M1-W027; Rulings l.50 |
| Theorem 8.1 claims existence | P140 (Q1); Rulings l.49 |
| When two geometries are the same, and what "unique" means | P147; M1-W032, M1-W034; Rulings l.54 |
| The count of drives in clause (a) is declared, not derived (reader A's 4.28) | Rulings l.38 |
| Other rows of Rulings ll.44–48 bear on J10 and are read there: the integer on S², the provisional meaning of symmetry, the direction and the phase, the states on the pillowcase, the warp | Rulings ll.44–48 |
| No further sources can be obtained; a statement of an unread source is closed by hand or declared with its failure test | P97(3) |

---

## 7. What the architect noticed and did **not** work out

**Its own reading, no ruling, and not to steer the search.**

- For J10 no mapping has been made from reader A's twenty-eight places to the entries that have since ruled them. Several plainly have been touched (for example A's 4.8 by M1-W027, 4.12 by M1-W017, 4.14 by M1-W003 and M1-W013, 4.16 by M1-W029, 4.18 by M1-W020, 4.20 by M1-W019, 4.22 and 4.23 by M1-W023 and M1-W024); **these pairings are from memory of the session and are to be checked, not used.** The fresh reader of this file compared line numbers only and found: 4.14 is also M1-W010; 4.16 overlaps M1-W029 at l.521 only, ll.525 and 529 being in no entry; 4.18 overlaps M1-W020 at l.653 and not l.712; and the records themselves pair 4.13 with M1-W015, 4.25 with (C) of J11, and 4.7 and 4.9 with J2. Drawing up the list is the first task of J10.
- Canon counts "six" choices in Section 2 and "three" in Section 3 (ll.239, 247, 964); the tenth is ruled (P92). How the ordinals run when more are numbered is said in `HANDOVER.md` (the section on J1) to be "settled at the build". Whether J10 fixes the numbers or only the list is a question for the PI and has not been put.
- For J8, rows whose ground has changed since the audit: E8 (the torus is now by clause (c), M1-W003, M1-W010, M1-W013, and no longer by Franks); E11 (J1, the tenth choice); E12 (M1-W030); E7 (M1-W015, M1-W017). Whether a row's wording, and not only its tag, is J8's business has not been asked.
- The audit's own sentence on the table ("It is not exhaustive and the proof does not use it") is quoted in §1.2 because it bounds what J8 can affect.

---

## 8. Numbers and pointers, true as of this file

| Thing | Value |
|---|---|
| Next Decision Log row | **P151** (P150 records this file and its check) |
| Next write-up log entry | **M1-W035** |
| Write-up log | 34 entries, 28 active, 6 retired |
| Next Corpus Errors section | **`## 36.`** |
| Rulings in Force §3 ends | l.54; §4 heading at l.56 |
| Definitions Register, M1 rows | ll.7–30 |
| `HANDOVER.md`, the sealed list | from l.481 |
| Last commit of the J7 work | `6abd680` |
| Canon | `canon/M1/Paper_M1_Six_Axioms_v6_3.tex`, v6.3, unchanged |

Gate 8 fails against canon v6.3 for every active entry, as it must: the entries are the new version and canon is the old one. That is expected and is not an item.

---

## 9. Registers and the ledger

Claude **proposes**; the PI banks by commit. The one exception: **Claude writes the Decision Log entry at the moment of a ruling, with the PI's words verbatim** (CLAUDE.md §7).

For J10 the Minimality Register is where a numbered choice is entered "before the tag goes on" (CLAUDE.md §6). Rows are proposed in the format of §5 and are not written until the PI banks them.

---

## 10. Traps — errors actually made in the sessions so far

1. **Words are copied, not reconstructed.** P139, P142: wordings put to the PI were constructed and not copied. P143: a phrase was copied, but from canon where a ruling had replaced it, and misquoted. Before any wording is put to the PI, read every line of the paper and every active entry that uses the terms in it, and copy.
2. **Quote by line, and check the line.** P144, P146, P148: quotations sourced to the wrong line, and a line listed for a word it does not contain. Use `sed -n 'Np'` and read what is there.
3. **Definition numbers.** Canon's `remark` shares the theorem counter, so Section 2 runs: 2.1 shadow, 2.2 the remark at l.165, 2.3 closure, 2.4 growth and decay, **2.5 the fibre algebra**, 2.6 order, 2.7 the two levels, 2.8 orbits realised, 2.9 drive. Also 3.1 modulus, 3.2 minimal. This matters for J10, which numbers things.
4. **A printed statement must not say more than its mark.** P148, P149: M1-W033 asserted that a relabelling carries M₁₂ run backwards to itself, while its own mark said that was not checked datum by datum, and the caveat was left out of the read-back. **Everything the mark says is not claimed goes into the read-back**, and the statement is worded to what is shown.
5. **A read-back carries every item of CLAUDE.md §3.** P127, P128, P130: read-backs were put without "where others would hear something else", "the opposite meaning" or "any conflict with earlier statements or rulings".
6. **A choice of option is not a confirmation of the read-back.** P110, P119: the PI named an option of a question and the architect took it as confirming a read-back that said more. Put the read-back and get the word on it.
7. **"Not sure" is an answer.** CLAUDE.md §11.
8. **In a J-session a fresh reader is for the records** (the whole-paper reader on whether a step holds belongs to the build: P104 point 5; CLAUDE.md §5, "Independent check"), and every finding it returns is verified against the files before it is acted on. A statement the PI has confirmed word for word is not changed by the architect: the corrected wording is put to the PI and, if confirmed, is a new entry that retires the old one.
9. **Do not drip-feed.** P125: leftover items were reported one at a time across several closing messages. Close once.

---

## 11. What is **not** J10 or J8, and what comes after

**Not to be started:**

- **The new version of M1.** It is built from the active entries of the write-up log when J10 and J8 are ruled (P92(3)), in a session of its own. "A paper is never finished unattended" (CLAUDE.md §6).
- **The items "for the build"** listed in `HANDOVER.md` items 16 to 23 and in Corpus Errors entries 32 to 35: the rewording of the canon lines the entries replace, the unread facts to be entered in Verified References or closed by hand, the place of each new statement, and how the ordinals of the choices run in the text.
- **Owed to M2:** which piece the warp scales (Future-Mx F-10).
- **Carried open from J7 to the build** (`STEP_AUDIT.md` §11.19; `HANDOVER.md` item 23): that the proof of Theorem 8.1 delivers each datum up to a relabelling of M1-W032; that the definition applied to the step alone is the count of clause (a) (one direction immediate, the other RECALLED and unread); that the quarter-turn with time run backwards carries every datum of M₁₂ to itself; the symmetry that mirrors the torus (canon l.442).

After J10 and J8: one new version of M1.

---

## 12. Six things to ask the PI at the start, with the assumptions, in one list

None is decided here.

1. Whether J10 fixes the **numbers** of the choices as they will be printed, or only the **list** of which readings are choices, the ordinals being left to the build.
2. Whether the rulings made before the write-up log was opened (J1, P92; the integer on S², P97(1)) are given entries in it now. This has been carried, unasked, through every session since P107.
3. Whether the Minimality Register is read for J10 (§5).
4. Whether Corpus Errors 32(h), the [R] on Theorem 4.2's "Consequently …" and on Proposition 4.5's "the clause selects it", is taken with J8 (§1.2).
5. Whether J8 takes all fourteen rows of the table or only those the audit and the sessions name (E2, E3, E8, E9, E11, E12, E13) (§2).
6. Whether a row's wording, and not only its tag, is J8's business; rows E7 and E11 are otherwise reworded at the build (§1.2, §7).

---

## 13. The check of this file

This file and its check are recorded at Decision Log **P150**, so the next free row is **P151**. A fresh reader was given this file, `CLAUDE.md`, `papers/M1/HANDOVER.md` from `## Audit of Theorem 8.1`, `papers/M1/STEP_AUDIT.md` §11, `papers/M1/WRITE_LOG.md`, canon, Decision Log rows P88 onward, Rulings in Force ll.1–54, Corpus Errors entries 32 to 35, the Definitions section for M1, the commit log and a count of the Status string, and asked to check every claim, quotation, line number, count and pointer in it against those sources, and to report what it could not verify and what a reader of this file alone could not do. It found no wrong quotation, line number or count; two findings to be fixed before use (the rule of CLAUDE.md §11 on what reaches the PI, given here in narrowed words; Corpus Errors 32(h) said in one place to be J8's and in another to be for the PI) and fifteen minor ones. All are corrected here and recorded in the Decision Log. **It could not verify from its list:** the Future-Mx row format and that the next entry is F-11 (taken from `HANDOVER_J7.md` §5, which it was not given); the contents of the three Verified References rows and of `COMMUTANT_LEAD.md`. The corrections were not checked a second time.
