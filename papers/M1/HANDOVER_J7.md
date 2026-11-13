# Handover: complete J7

**J7 is done (13 November 2026; Decision Log P147).** Every part has its outcome: `papers/M1/STEP_AUDIT.md` §11.19; write-up log M1-W032 and M1-W034 (M1-W033 retired, P149); `papers/M1/HANDOVER.md` item 23. This file is kept as the record of the brief. Its numbers are those before the session: the next Decision Log row is now P150 and the next write-up log entry M1-W035; the series plan's Status string of §5 has been replaced. Its §11 gives the order after J7 as J8 then J10, where `papers/M1/HANDOVER.md` item 6 has J10 then J8; the PI ruled J10 then J8, and that they may be taken together (P148). Since the session one Rulings row, three Definitions rows and Corpus Errors entry 35 were banked (P148): Rulings in Force §3 now ends at l.54 with §4 at l.56, the Definitions section for M1 is ll.7–30, and the next Corpus Errors section is `## 36.`.

**Written 13 November 2026 at the PI's direction, at the end of the session that completed J3 and J4 (Decision Log P137–P145). It is the brief for one chat and one work package: J7. It does not replace `papers/M1/HANDOVER.md`, which is the paper's handover and holds the history; this file is the working brief and says which parts of that file are read.**

**Checked** by a fresh reader given this file, CLAUDE.md and the sources it names; the findings are corrected here. See §12.

---

## 0. First, in this order

1. Post: *Verify-first is on. I will list assumptions and wait. I am not the SME; you direct.*
2. Read `CLAUDE.md` from the file on disk. It is the standing rules and it has changed: §1 was rewritten on 11 November (P93), §11 "The sense check protocol" was added on 13 November (P141).
3. Read this file whole.
4. Then the reading list of §4, and nothing else. The list is a whitelist.

Run every command from the repository root, `/home/dhiren/MEF_Proof`.

**One work package. J7 only.** When it is done, stop and report. Start nothing further unasked.

---

## 1. The task

**J7 is finding 7 of the audit of Theorem 8.1.** Quoted whole from its sources:

- `papers/M1/STEP_AUDIT.md` §11.5, row J7: **"'Unique' has no definition of sameness behind it"**, found by all three readings, marked there **GAP** and **known**.
- `papers/M1/STEP_AUDIT.md` §11.1, row T16: `| T16 | "unique" | **GAP (undefined term)** | No definition of when two geometries are the same (known: §10.7; P71) |`. §11.1 gives **no failure test of its own** for T16.
- `papers/M1/STEP_AUDIT.md` §11.4, row T16: `| T16 ("unique") | Its 6(b): "No notion of sameness of two geometries is defined" | yes (known) |`.

Theorem 8.1 says the minimal geometry **"is unique and is"** M₁₂ — canon **l.967**, which ends "… the minimal geometry, is unique and is"; l.969 carries the display of M₁₂ and nothing else. "Unique" is a claim that there are not two; the audit's finding is that the paper nowhere says when two geometries would be one.

**Why J7 comes now.** The architect's note at the PI's word, not a ruling: J7 was placed after J3 and J4 because it needs them to say what a geometry's data are. P140 settles that: **the factors, the discrete data, and the continuous data covered by the one declared input** (write-up log M1-W027, M1-W028).

**Standing of a J (P104; the architect's wording, agreed by the PI with points 1–5).** A place where the text does not carry the argument to a reader; **not, until the method of §3 has been followed, a step in doubt.**

---

## 2. What "done" means

J7 has been taken **part by part** by the method of §3, and each part has ended as one of its three outcomes, **the PI having confirmed which**:

1. the sentence is restored from elsewhere in the paper;
2. the ground is stated by the PI and written in full;
3. the item is truly open.

"Written in full" means **as an entry of `papers/M1/WRITE_LOG.md`**, written at the moment the PI confirms the read-back (P107; CLAUDE.md §10): the statement in full as it will be printed, what it rests on, its mark, its failure test, its status; and it is read against **every active entry** before it goes in. The entries are the log; they are not yet a version of M1, which is assembled from them when all of J2–J11 are ruled (P92(3)).

Then: the Decision Log row (it points to the entry and does not restate it); register entries proposed; `papers/M1/HANDOVER.md` and this file brought into line; the series plan's Status cell edited by the method of §5. Then stop and report.

---

## 3. The method — read this before touching J7

**It is the method of P104 and P105, and CLAUDE.md §§5 and 11.** The PI's words that set it, at P104:

> "This happened because you "red teamed" J2 in isolation of the rest of the paper, and the axioms. So the red team concluded something based purely on what it was given. Everything it said was correct. But it was incorrect because in context the results were wrong. We cannot use this process that you are using to fix J2 (Jx)."

The five points the PI agreed ("Points 1–5 agreed"):

1. **Paper first.** For each J, the whole of canon M1 and the axioms are searched for the paper's own answer, and the lines are shown **in full, unshortened**.
2. **Then the PI.** Only what the paper does not answer goes to the PI, as a plain-English question about what was meant.
3. **No counter-examples and no isolated reader** on whether a step holds. Blind checks are kept for computations only.
4. **Three outcomes per item**, as in §2.
5. **When the new version is written,** every restored sentence is stated in full, and the check is a reader who has the whole paper and the axioms.

**Added by the architect, not part of what was agreed:** the lines of point 1 are shown to the PI; the PI's answer under point 2 is translated and read back (CLAUDE.md §3).

**Counter-examples (P105; CLAUDE.md §5, quoted whole):** "A counter-example is looked for only when the PI asks for one explicitly, naming the statement. Confirmation of a list of assumptions is not such a request. Neither Claude nor a sub-agent is given an open brief to find what is wrong with a result. A counter-example the PI has asked for is tested against all six axioms and the readings of the whole paper, never against one definition alone. If something that looks like a counter-example is noticed in passing, it is reported in a sentence with the lines, and not pursued."

**What is not counter-example hunting and stays (agreed, P105):** checking a computation the paper itself states, such as a matrix product or a count; and the failure test, where each banked result says what would show it false — stating it is not searching for it.

**The sense check protocol (CLAUDE.md §11, added 13 November, P141).** It applies **to the report of an audit, a fresh read or a red team, and to nothing else.** J7 arrives as a row of such a report, so the protocol applies to reducing its questions: take them in turn, search the paper for its own answer, then apply the six axioms and the clauses of Definition 3.2, carry each pick forward so that later picks are consistent with earlier ones, and say which rests on which. **A pick is made only when a clause or an axiom names the quantity and one option survives with the lines shown; otherwise the answer is "not sure" and the question goes to the PI.** Three or four questions reach the PI, not twenty. A pick is a reading, reported as the architect's with its ground; it becomes a ruling only when the PI confirms it.

**In ordinary derivation work there is no such report and the method is CLAUDE.md §§2, 3 and 5 as they stand.**

---

## 4. Read

- **this file**, whole.
- **`CLAUDE.md`**, from disk.
- **`papers/M1/HANDOVER.md`** from the heading `## Audit of Theorem 8.1` to the end. Everything above that heading is the history of v6.0–v6.3 and is not needed. Items 16 to 22 of that file are the records of the J-sessions already closed: **item 21** is the session that closed J3 and J4 (P137–P141) and **item 22** the session after it (P142–P145). §10 of this file draws the lessons of both.
- **`papers/M1/STEP_AUDIT.md`** §11, from the heading `## 11.` to the end of the file. It has no §11.2.
- **`canon/M1/Paper_M1_Six_Axioms_v6_3.tex`**, ll.1–1105. Lines 1024–1072 are the outlook and the certificate list. `\appendix` is l.1035; **Appendix A** (`app:lean`, "Machine-verified certificates") begins at l.1037; **Appendix B** (`app:labels`, "The labelling of the corners") is l.1073 for the heading and **l.1075 for its text**; l.1077 begins the bibliography.
- **`papers/M1/WRITE_LOG.md`**, every entry. Thirty-one entries, M1-W001 to M1-W031: **twenty-six active and five retired** (M1-W002 by M1-W010, M1-W011 by M1-W013, M1-W014 by M1-W017, M1-W018 by M1-W021, M1-W022 by M1-W024). By J: W001–W009 from J2, W010–W013 from J5, W014–W017 from J9, W018–W021 from J6, W022–W024 from J11, W025–W026 from J3, W027–W030 the four printed wordings owed from P140 (confirmed P143), W031 the item J3 left open (P142). **The next number is M1-W032.** Read every entry, because a new entry is read against every active one. CLAUDE.md §10 governs the log.
- **`registers/Rulings_In_Force.md` ll.1–53 only** (its §§1–3; §4 begins at l.55 and nothing from it on is read).
- **Decision Log rows P88 onward:** `grep '^| P\(8[89]\|9[0-9]\|1[0-9][0-9]\) ' registers/Decision_Log.md`. **The next number is P146.** Read **P104 and P105 with care**: they hold the PI's words on the method and on counter-examples. Row format: `| Pnn | date | **Title (PI).** text, the PI's words verbatim in quotation marks | tags |`. P137–P145 are the J3/J4 session and the two after it.
- **Corpus Errors Register, entries 32, 33 and 34 only:** `sed -n '/^## 32\./,$p' registers/Corpus_Errors_Register.md`. Entry 34 is the wording that the rulings on J3 and J4 change; its items (b), (c), (d) and (e) carry amendments made on 13 November (P142, P144).
- **Definitions Register, the section for M1 only** (PI, P99): `sed -n '7,27p' registers/Definitions_Register.md` — the heading at l.7 and the rows to l.27. Line 28 is blank and the register's general preamble begins at l.29 and then its other sections, which are not read.
- **Verified References, three rows:** `grep '^| V-\(10\|14\|23\) ' registers/Verified_References.md`. **V-10** Franks 1970 is marked "SECONDARY ONLY … Exact statement and hypotheses not read"; **V-23** Katok–Hasselblatt is "NOT READ: no copy obtained … RECALLED"; V-14 is no longer cited by M1.
- **`papers/M1/COMMUTANT_LEAD.md`** — the record of J1 and of the finding on the two levels of Definition 2.7.
- **`tools/ROSETTA_STONE.md`** only when the PI writes "Please Rosetta Translate x" (CLAUDE.md §3, P106), or to add a row for a term of jargon used with the PI that it lacks. Rows added must be reported at the end of the session.
- **as the work needs, and nothing else:** other files under `papers/M1/` (the earlier sections of `STEP_AUDIT.md`, the notes, `checks/`), `canon/M1/`, `MEFProof/Paper_M1/` and `tools/`, **except `papers/M1/LIFT_SIGN.md` §5, which is sealed.**

**The J2 sources are not read** unless the work calls for them: `J2_SOURCES_PROMPT.md`, `J2_sources_from_chat.md`, `J2_COVER_LEAD.md`, the three PDFs in `papers/M1/sources/` (that folder is on the PI's machine only; it is in `.gitignore` because the files are copies of published papers).

---

## 5. Do not read

- **`sow/Mx_Series_SOW.md`.** At the end of the session its Status cell for M1 is edited **without reading the file**: the cell contains, once in the file, the string

  `J7, J8 and J10 open (J1, J2, J3, J4, J5, J6, J9 and J11 closed); one new version to be built when all are ruled; canon unchanged**`

  (set on 13 November after P140). Replace that string by a script.
- **`registers/Rulings_In_Force.md` from l.55 on**; the rest of the Decision Log.
- **every other register and register row, and the ledger.** The architect's instruction; its reason is the breach of P94. To write to a register, append a row in its format without reading the file: Minimality, eight cells, `| # | Node | Choice space | Minimal option | Criterion | Stated at | Failure test | Status |`; Verified References, six cells, `| # | Statement as used | Source | Wanted by | Status | Notes |`; Definitions, three cells, `| **term** | definition | source |`; Corpus Errors, **a new `## 35.` section at the end**; **Future-Mx**, a new section **`## F-11. <what is owed> — owed by M<n> (source)`** at the end, followed by a paragraph saying what the owing paper must contain and what its inputs are (there are ten entries, F-1 to F-10). A session that ends an item of J7 at outcome 3, "truly open", proposes such a row if the step is owed to a later paper, and `registers/Future_Mx_Register.md` is read only for the entry it is amending.
- **`papers/M3/`, `sow/M3/`, `canon/omega-definition-usage_v2.md`.**
- **anything in the sealed list** (`papers/M1/HANDOVER.md`, the section headed "Sealed: not to be read until the new M2 is written and recorded"). Read that list before opening any file not named above.

---

## 6. What J7 may use, already settled

These are rulings in force. They are not answers to J7; they are what J7 is allowed to lean on.

| What | Where |
|---|---|
| A geometry's data are the factors, the discrete data, and the continuous data covered by the one declared input | P140 (Q4); M1-W027, M1-W028 |
| M1 has no energy functional; a modulus is a continuous datum the axioms and readings leave free, apart from relabelling and overall size | P140 (Q4); M1-W027 |
| The overall size of the shape has no meaning; only proportions do | Rulings l.41 (P45(3), P46(2)) |
| The shape of the fibre at every moment is fixed by M1-W026; the aspect ratio is **no longer** a declared input | P140 (Q5); Rulings l.41 as amended |
| Theorem 8.1 claims **existence**, not only "if such a shape exists it is this one" | P140 (Q1); Rulings l.49 |
| The three clauses of Definition 3.2 are applied in an order of priority: (a) over (b), (b) over (c) | P110, P116, P117; Rulings l.35 |
| Clause (a) is written for two data only: a dial, and the class of the drive among those of its trace | P49(1); Rulings l.35 |
| The quaternionic structure carries information in exactly one place, the pillowcase | P142 (R14); M1-W031 |

---

## 7. Lines the architect noticed and did **not** search out

**Its own reading, no ruling, and not to steer the search.** Point 1 of the method is to search the whole paper and the axioms and to show the lines in full; that search has not been done for J7. These are recorded only so that the next session does not have to rediscover that they exist, and it must still do the search:

ll.122, 143, 264, 967, 969, 992, and Appendix B, whose text is **l.1075** (l.1073 is the heading alone). `papers/M1/HANDOVER.md` l.161 gives the same list without l.969; l.969 is added here because it is the display that the word "unique" is said of.

Two of them bear directly on the words of J7 and are quoted here because they are short and because a paraphrase of them would be the very fault §10 warns against:

- **l.143:** "A \emph{geometry} here is a smooth shape, of some number of dimensions, on which lengths and angles can be measured, and which is allowed to have a few isolated sharp points (cone points, like the tip of a paper cone)."
- **l.264, clause (a) of Definition 3.2:** "(a) nothing is left to be chosen: $M$ has no modulus, and the step of its drive (Section~\ref{sec:drive}) is the only one of its trace, **two steps being counted as the same when a relabelling of the torus that keeps its orientation carries one to the other, and only then**;"

The second is the paper defining sameness for one kind of object. Whether it is a template for geometries, or is confined to steps, is for the search and then for the PI; the architect has formed no view and the question is not to be put as though it had.

---

## 8. Numbers and pointers, true as of this file

| Thing | Value |
|---|---|
| Next Decision Log row | **P147** (P146 records this file and its check) |
| Next write-up log entry | **M1-W032** |
| Write-up log | 31 entries, 26 active, 5 retired |
| Next Corpus Errors section | **`## 35.`** |
| Rulings in Force §3 ends | l.53; §4 heading at l.55 |
| Definitions Register, M1 rows | ll.7–27 |
| Last commit of the J3/J4 work | `91c27e1` |
| Canon | `canon/M1/Paper_M1_Six_Axioms_v6_3.tex`, v6.3, unchanged |

Gate 8 fails against canon v6.3 for every active entry, as it must: the entries are the new version and canon is the old one. That is expected and is not an item.

---

## 9. Registers and the ledger

Claude **proposes**; the PI banks by commit. The one exception: **Claude writes the Decision Log entry at the moment of a ruling, with the PI's words verbatim** (CLAUDE.md §7).

---

## 10. Traps — the errors actually made in the three sessions just finished

Each is recorded in the Decision Log, except where a trap says otherwise; they are listed because they recurred.

1. **Words are copied, not reconstructed.** P139: the architect introduced a second flip "E" that no ruling had, by paraphrasing instead of copying. P142: it wrote `S²×_w(T²/ℤ₂)`, which appears nowhere in canon — l.969 has `(ℂP²×S²)×_w(T²/ℤ₂)`. P143: it wrote "at every point **of** trivial stabiliser" where canon l.521 has "**with**". Before any wording is put to the PI, read every line of the paper and every active entry that uses the terms in it, and copy.
2. **Quote by line, and check the line.** P144: three quotations were sourced to the wrong line (l.520 for l.521; l.699 for l.693; l.615 for l.943). Use `sed -n 'Np'` and read what is actually there.
3. **Definition numbers.** Canon's `remark` shares the theorem counter, so Section 2 runs: 2.1 shadow, 2.2 the remark at l.165, 2.3 closure, 2.4 growth and decay, **2.5 the fibre algebra**, 2.6 order, 2.7 the two levels, 2.8 orbits realised, 2.9 drive. Also 3.1 modulus, 3.2 minimal. P142 had the fibre algebra as 2.3 and orbits as 2.5; both were wrong.
4. **An observation is not a direction.** P144 records that the architect read the PI's "M2 will determine where the w lies - not M1" as "a direction on scope". P144 says expressly that no Decision Log row records the item; that it was instead a statement of fact about what M1 settles is the architect's reading, recorded in `papers/M1/HANDOVER.md` item 22 and here, and not in a ruling. Translate and read back before acting.
5. **Do not overstate what an entry fixes.** P142, P144: M1-W026 places the growth between time and the fibre torus **as a declared reading**, which is what it needs to show A2 and no more; it does not fix which piece the `×_w` of ll.125 and 969 scales. That is owed by M2 (Future-Mx F-10).
6. **"Not sure" is an answer.** CLAUDE.md §11: a pick is made only when a clause or an axiom names the quantity and one option survives with the lines shown.
7. **A fresh reader is for the records, not for the mathematics.** CLAUDE.md §5: no sub-agent gets an open brief to find what is wrong with a result. Verify every finding a reader returns against the files before acting on it; in the check of this file (P146) a finding was returned that was itself wrong about its source. That last fact is recorded at P146 and nowhere else.

---

## 11. Carried into J7, and what is **not** J7

**Carried in** (from `STEP_AUDIT.md` §11.17): what a geometry's data are — settled, §6 above.

**Not J7, and not to be started:**

- **J8** — the tag of row E12 of the elimination table (M1-W030 is printed [D]; whether it stands is J8).
- **J10** — the numbering of the readings of M1-W017, M1-W025 and M1-W026.
- **At the build**, when the new version is assembled: canon ll.533 and 578 (the word "stabiliser"); the rewording of l.992 (the failure test of the declared input); l.127 with the displays at ll.125 and 969 (Corpus Errors 34(b)); **canon l.602** (the aspect ratio as "the one continuous datum of the fibre … which this paper does not fix", Corpus Errors 34(f)) and **canon l.163** ("The way lengths are measured may tie the pieces together, and the second axiom will insist that it does", Corpus Errors 34(i)); and the declared assumption of M1-W031, which carries into the new version as DECLARED with its failure test. The full list is at `STEP_AUDIT.md` §11.17 and in Corpus Errors entry 34, whose closing **Action** line is "Corrected in the one new version of M1".
- **Owed to M2:** which piece the warp scales (Future-Mx F-10), with the lead of P142 and P30 as its inputs. **P30 is a sealed row** — `papers/M1/HANDOVER.md` l.463 seals "every row above P40" — and is not read; what F-10 needs of it is quoted in F-10 itself.

After J7 the order is **J8**, then **J10**, then one new version of M1 built from the active entries of the write-up log.

---

## 12. The check of this file

This file and its check are recorded at Decision Log **P146**, so the next free row is **P147**; §8's table says so. A fresh reader was given this file, `CLAUDE.md`, `papers/M1/HANDOVER.md` from `## Audit of Theorem 8.1`, `papers/M1/STEP_AUDIT.md` §11, `papers/M1/WRITE_LOG.md`, canon, and Decision Log rows P88 onward, and asked to check every claim, quotation, line number, count and pointer in it against those sources, and to report what it could not verify. Its findings are corrected here and the correction is recorded in the Decision Log. The corrections were not checked a second time.
