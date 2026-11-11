# M2 — handover (written 11 November 2026, seventh version)

Replaces the sixth version. The PI asked for that version to be read afresh; it was wrong, stale or incomplete in many places (P86). This version was then checked twice more, the last time by an independent sub-agent given the handover and the files it summarises and not told what to find.

**This handover is a summary. Where it and a file it cites differ, the file is right and the difference is reported to the PI.**

**Note added 11 November 2026 by the third M2 session (Decision Log P88–P93). The rest of this handover is unchanged and its work package (steps 1–3) is not started.**
- By the PI's direction that session audited M1's Theorem 8.1 and did nothing on M2: `papers/M1/STEP_AUDIT.md` §11; summary in `papers/M1/HANDOVER.md`, last section. In the audit's words (§11.5), "No Lean certificate, no computation and no statement of Sections 4–7 marked CHECKED in §§8–10 was found wrong by either reader"; the Lean files were not opened. Eleven findings (J1–J11) were put to the PI: J1 is closed (below) and J2–J11 are open. Several meet M2's nodes: J3 and J4 (Definition 2.4; the undefined functional; the unfixed proportions) are the points of P71 and P74 found again; J1 and J6 concern the base and the Spin^c line that `N2_sources.md` counts states on.
- **Read the handover before anything else.** That session read the series plan in the order of CLAUDE.md §1 before reaching item 4 below, and so read the barred rows. CLAUDE.md §1 has since been changed so that the handover is read first (P93). The next number in the Decision Log is **P94**, not P88 as item 3 says. The grep of item 3 prints rows P71–P89 only; `grep '^| P\(7[1-9]\|[89][0-9]\) ' registers/Decision_Log.md` prints P71–P99.
- **The next session: go to `papers/M1/HANDOVER.md`, "The next session".** The architect recommends that it take J2 of the audit and not M2; the PI directed the handover and did not rule on this (P93). This handover's lists "Do not read" and "Sealed" stay in force for it. J1 was closed by a tenth numbered choice of M1, complex spinors (P92); M1 v6.3 is unchanged and one new version is built when J2–J11 are ruled (P92(3)). Whether M2 steps 1–3 wait for the new version is not ruled.
- The definition this handover calls "Definition 2.3" (growth and decay, l.190) is Definition 2.4 by the count of the source (Remark 2.2 takes a number); closure (l.178) is Definition 2.3. Not checked against the PDF.

## The session that wrote it
The second M2 session: the fresh one of P71. The first was stopped as contaminated (P68, P69). What this session read:
- CLAUDE.md; the handover it was given; canon M1 v6.3 in full (ll.1–1105); Rulings in Force ll.1–43 (§§1–3).
- Of the Decision Log: its last three rows as they then stood (P68–P70), printed to match the format; one line of P67 printed by a search; and rows P71–P86, which it wrote. P70 had taken the Decision Log off this session's reading list; printing P68–P70 was a departure from that, and nothing above P40 was read.
- Of the series plan: the M2 row only.
- Outside sources, through a sub-agent's downloads and two copies supplied by the PI; and the report of a separate chat session (`N2_refs_from_chat.md`).
- It ran `tools/redflags.py` on canon M1.

It read nothing in the sealed list (checked against the session's own transcript). It derived no equation and chose no functional.

## How the next session starts
1. The handshake of CLAUDE.md §1.
2. **Read:**
   - CLAUDE.md;
   - this handover;
   - `sow/M2/SOW_DAG.md`;
   - `papers/M2/STEP_AUDIT.md`;
   - `papers/M2/N1_what_varies.md`; `papers/M2/N2_sources.md`; `papers/M2/N2_refs_from_chat.md`; `papers/M2/N3_field_and_functional.md`;
   - `canon/M1/Paper_M1_Six_Axioms_v6_3.tex`, in full;
   - `registers/Rulings_In_Force.md` ll.1–43 only (§§1–3).
3. **The Decision Log: read rows P71 onward in full** (PI, P87: "the next session should read Decision Log rows P71–P86 in full"). Use `grep '^| P\(7[1-9]\|8[0-9]\) ' registers/Decision_Log.md`, which prints rows P71–P89 and no other. They hold the PI's words verbatim and outrank this handover's summaries. Rows above P40 are sealed (P70); rows P40–P70 are not on the list.
   - **Writing to it:** append one row at the end of the file. The next number is **P88**. Format: `| Pnn | date | **Title (PI).** text, the PI's words verbatim in quotation marks | tags |`.
4. **Do not read:** the series plan (edit only the Status cell of the M2 row, by a targeted replacement); Rulings in Force from l.44 on; anything in the sealed list at the end. The ban on the series plan and on Rulings §§5–7 is carried from the handover this session was given; P69 and P70 themselves speak of the Decision Log and of Rulings §4.
5. **How to work (P78, P86).** P78 governs: proceed, and stop only where a text allows more than one reading and one has to be chosen or defined. At those points the rule of CLAUDE.md §2 applies: numbered assumptions, each sourced, then wait. The PI in this session, not in the log: "if you have a strong recommendation then tell me what that is. Only ask me if you genuinely don't know , and it could go either way".
6. **Words.** The PI (P83): "what you have described isn't in conflict with M1, it is applying a reading on M1 and refining what it means for M2. IT IS NOT A CONFLICT !!!! Your language is also sloppy." The architect's working rule drawn from that: "conflict" only where two statements cannot both hold; otherwise say "reading" (a point the text leaves open) or "addition" (says more than the text); say first whether any proof or finding of M1 changes.
7. **Changing M1 (P87).** Two statements are on record and they pull apart. P74(i): "no change to M1 now"; "if the definition then needs rewording, M1 has a new version". The PI later (P83): "We should not go back and change M1". Nothing in M2 so far needs a change to M1. Both stay on record. The PI is asked only if N5 finds that Definition 2.3 needs rewording.
8. **Sources.** The PI: "I won't be able to access any more than I have." An outside statement not read at source is closed by hand in M2 or declared there as an assumption with its failure test (CLAUDE.md §6; P86).
9. **The old corpus.** `sources/` is not read. The series plan's M2 row allows it "only to look for a datum when a step does not follow"; if that arises, ask the PI first.
10. **Tools.** `pdftoppm` is not installed. Text can be taken from a PDF that has a text layer, with a PDF library installed into the session's scratch folder. The Read tool reads PNG images, and that is how the scanned pages of Serre 1955 and Kaup were read. The copies of the sources were in the last session's scratch folder and are not in the repository. The PI's copies of Hitchin 1974 and Sampson–Washnitzer 1959 were in the PI's Downloads folder (known from the session; ask for the path, do not search).

## The work package of the next session
Set by the architect from the SOW/DAG (P86: "it should be what you are planning to do next - as per the SOW/DAG"). The PI does not review the drafts of N1 and N3 as a package of their own (P86). The order is in `sow/M2/SOW_DAG.md`, "Order of work". **The next session does steps 1–3 and stops.**

**Step 1. Close N1** (`N1_what_varies.md`).
- Argue which option the sixth axiom selects in N1-a and N1-b (§5; the step table in §8 marks it GAP). Give N1-c a failure test.
- The two suppositions of §4 (the fibre flat at every time; no cross term with time): removed, or declared.
- Whether V, Q and ∇ are unknowns or are fixed by g is "not settled by N1" (§3), and assumption A2 of the SOW is still UNVERIFIED. The SOW says N1 closes when every row is placed. Either place them, or say they pass to N4 and amend the closing condition.
- An independent check by a fresh sub-agent given the steps and not the conclusion.

**Step 2. Close what is left of N2** (`N2_sources.md` §8, §9).
- By hand, or declared with a failure test:
  - the first cohomology of the twist on the fibre vanishes. §9 item 5 reduces it to two statements, both unread: Serre duality, and that a line of negative degree has no section;
  - the degree of a line as zeros less poles of a section, and the degree of the canonical line (§3).
- Write out the combination that gives the states at rest of the whole twisted internal piece (§2, §9), with every hypothesis. No single published statement of it was found. The hypotheses the notes name:
  - the lengths are Kähler for the complex structure;
  - the connection on the twist is that of a holomorphic structure (Nicolaescu 1.4.25 asks only a Hermitian connection; its proof is "left to the reader");
  - each piece is projective and the twist on the fibre is a holomorphic line: used, and not read at source;
  - **the pillowcase:** every source read is for manifolds; the fold is handled by M1's own device (ll.719, 763) and by nothing read;
  - the flatness remark on EGA III (6.7.8) is the architect's.
- Nothing read concerns the block of time and space or the drive (§5).
- **Nicolaescu (P87).** Rest on Hitchin 1974 where it covers the ground: the spinors of a Kähler manifold as forms of type (0, ∗) and the Dirac operator as √2(∂̄ + ∂̄*) (proof of Theorem 2.1); the kernel for the canonical structure (Theorem 2.1); the twisted case in its spin form (proof of Theorem 2.2, part (4)). Cite Nicolaescu for the rest, in particular that a twist by a line L gives the determinant line K⁻¹ ⊗ L² (Proposition 1.4.25), saying that it was read in the author's hosted version and that of the print only the contents and index were seen. Which statements fall on which side is worked out in this step.

**Step 3. Close the first half of N3** (`N3_field_and_functional.md`).
- Put to the PI, each with its alternative, the Minimality argument and a recommendation (these are places where a reading has to be chosen, so the rule of item 5 applies):
  - the identification of the field: the spinor level, or the tangent level (N3 §2; step audit 0.8 with its "Against");
  - the swap on the whole shape (step audit 0.10);
  - the alternatives N3 §3 leaves open: what the shadow of a field is as an object on time and space (not defined); whether the field itself is multiplied by a factor after one circuit; whether "never stands still" is asked of the field or of the flow only.
- The Minimality argument for each of the six meanings of §3.
- An independent check of Q1–Q9.

**Owed by hand for each of N1–N3** (CLAUDE.md §5, §8; step audit): the red-flag hits at the M1 lines the node consumes (the scan found hits at ll.719, 723 and 728, which N1 and N3 use; none is entered), and a step table. The step audit's "Step tables" section says "None yet". No red-flag scan of the outside sources is recorded.

**Not in this package.** The functional (step 4): no candidate is named until steps 1–3 are done; that order is the blindness rule of CLAUDE.md §5. The calculus of variations ("stationary means no change to first order": step audit 0.3, RECALLED) is read at source when the functional is known and before N4. So node N2 does not fully close at step 2.

## The task
Write M2, the field equation on the geometry of M1, from scratch on M1 v6.3 and the six axioms, as if no earlier M2 existed. M2 cites only M1 and external peer-reviewed results.

## Rulings and confirmed readings (P71–P87)
| Entry | What |
|---|---|
| P71, P74, P77 | The list of continuous data M1 leaves unfixed is eight rows (SOW N0): row 1 reworded (P74), rows 7 and 8 widened after the independent check (P77). It is not assumed that all eight are unknowns of the equation (P71). Completeness is not proved: it is as good as two independent readings (step audit 0.4) |
| P72 | A small movement is a small change of the shape itself, the pieces, twists and integers held; modulo relabelling and overall size |
| P74, P77 | The odd places in M1 are noted and carried; "no change to M1 now". See item 7 above |
| P75 | ω does not enter M1. The PI's musing on ω is withdrawn |
| P76 | For M2 the sixth axiom speaks of a shape and one field. Flagged in P76 and not resolved: whether the field is itself built from the shape; and that M1 reads the sixth axiom for the shape only, so M2 gives the axiom a meaning M1 does not state |
| P78, P86 | The vector-field lead is withdrawn. M2 from M1 v6.3 alone, with external theorems cited. How to work: item 5 above |
| P79, P82 | The field is on the shape, satisfies all six axioms at once, and creates the growth and decay. **Not ruled (P79, in terms):** "that the field is the spinor of the shape" |
| P81, P84 | The PI: "\"the same shape with space that much larger\" counts as the same shape. - yes". P81 records it as the PI's answer on that point and reads it narrowly: larger by the factor one circuit of time gives. P81 adds that it is a premise of nothing until R-b or another reading is chosen. Point 3 of P84, agreed by the PI: "after one circuit of time the shape is larger by a fixed factor, and that counts as the same shape" |
| P84 | The growth runs along time. What grows as time advances is an unknown for the equation: (a) space against a length of time, or (b) time and space together against the internal piece |
| P85 | The integer of the determinant line on S², which M1 v6.3 does not state (P77), is **two**: M1's own rule applied, the sphere carrying the winding of its own complex structure and no further twisting line. M1 is not edited |
| P86 | R-b is examined and is the reading under consideration; this is not a confirmation. P78 governs, as item 5. The order of work is the architect's, from the SOW/DAG |
| P87 | The next session reads rows P71 onward. Hitchin where it covers the ground, Nicolaescu cited with its caveat for the rest. On changing M1, as item 7. None is a ruling on the theory |

P73 holds the PI's words on the sixth axiom; P75 withdrew the musing in it and P76 confirmed the sentence outside it. P80 and P83 are records of discussion, with the PI's words; P83 says of itself "Nothing here is a ruling or a premise". What stands from them is in P81, P82, P84 and P86, and items 6 and 7 above quote P83 directly.

## Failure tests of the confirmed readings (from the Decision Log)
- **P76:** fails for M2 if N3 cannot say what the field is without a choice that the sixth axiom does not select.
- **P79:** fails if no object on M1's shape carries all five actions at once, or if the growth function cannot be given by the field without a choice the sixth axiom does not select.
- **P85:** reopened if at source the sphere's own winding is not two, or the counts do not multiply. After N2: the first is CHECKED by hand with one elementary fact unread; the second is READ in its algebraic form with the passage to the holomorphic one READ, subject to the hypotheses of step 2.
- Three more, for the equation, are in the SOW/DAG under "Failure tests fixed before any derivation".

## Where the second axiom's growth sits: the reading under consideration
**R-b (step audit, "the two-growth readings examined").** The growth and decay of the second axiom sit in the block of time and space. M1 gives that block the dimension of the non-zero quaternions, a size times a direction (l.615), and says it is modelled on them (l.943). In R-b the size grows by the law of natural growth as time advances, and the swap of growth and decay is the inverse of a quaternion: the reciprocal of the size together with conjugation of the direction. On the fibre the swap stays the fold, as M1 has it.

**Its standing.** Examined, and the reading under consideration (P86). **Not confirmed:** the PI, "We are still discussing so i cannot confirm R-b" (P83). It was found after the difficulty with M1's Definition 2.3 was seen, so it is an identification of the kind CLAUDE.md §5 warns of, and it is a premise of nothing.

**Its relation to M1** (step audit, correction 1). A reading of a point M1 leaves open and an addition to what M1 says. M1 l.127: "Which of the two pieces is scaled, and by a function on which, is not fixed in this paper: nothing derived here depends on it, and it is fixed where the warp is given its law, with the field equation." M1's display (l.125) puts the warp between the base and the fibre; R-b puts it elsewhere. That the fold and the inverse of a quaternion are one inversion seen in two places is R-b's addition. No proof, finding or part of the shape of M1 changes.

**Its two forms, both carried into the equation (P84).** (a) Space alone grows, against a fixed length of time. (b) Time and space grow together, against the internal piece; CHECKED, this is the quaternions with their own flat lengths. The step audit says the two are different shapes.

**Against M1's Definition 2.3: not all settled** (step audit, the entry on R-b, correction 2 and the notes of the third check).
- Clause (i) asks a smooth function on one piece. The growth function is not the same after one circuit of time; it closes only through P81. The independent check of N0 had listed the same point as odd place k.
- Clause (ii), the law of growth, holds in the coordinate round the time circle. The two forms differ in whether time's own lengths grow.
- Clause (iii) asks an involution of the warped piece that exchanges κ and −κ. The swap carries the growing form to the decaying one and is "not a symmetry of either". Whether that is what the clause asks is not settled. As literally written the clause gives κ = 0 (odd place f).
- The rate times the length of the time circle, κL, would be a datum for the equation to fix.

**The other readings.**
- R-a, M1's display as written (growth between the base and the fibre, the swap the fold): fails as written, by two hand computations. N1 §7 records a further reading of the text on which the first computation does not apply; not adopted, kept for N5 to test.
- One growth (the second axiom's growth is the drive's stretch): excluded as a consequence of "creates" (P82). No error was found in its mathematics (P81, P82). "Merging axiom 2 and 4 is an error" (P80) is left as the PI's words and is not relied on.
- R-c (the growth is the state's own law; from the PI's musing of P80): set aside in the step audit because M1 puts the growth "not of something placed on" the shape (ll.187, 193). **Open:** the confirmed readings "on the shape" and "creates" meet the same two lines (P79, flagged and not resolved), so this ground does not separate R-c from them.
- (c), the internal piece shrinking: P84 records that the architect withdrew it as a separate option, as (b) described with another unit. The step audit ends that comparison "Not settled": it turns on whether a unit may be chosen afresh at each moment. P84 also records as not excluded that a part of the internal piece alone grows.

**Recorded, premises of nothing.** The PI's musing on the state, the drive to the next state, "maximise its value", "another saddle" (P80). The PI's remarks on the expansion of the universe, dark energy and dark matter (P83). **Blindness:** these last are targets; a reading chosen because it fits them cannot later be credited with deriving them. "Undergoes" (P80) was not entered as a ruling; "creates" stands (P82).

## What was built
- `sow/M2/SOW_DAG.md`: nodes N0–N8, rulings, assumptions, the order of work, failure tests.
- `papers/M2/STEP_AUDIT.md`: entries 0.1–0.11; the red-flag scan of M1; hand computations; the independent check of N0; the examination of where the growth can sit; the entry for the integer on S².
- `papers/M2/N1_what_varies.md`: draft of N1.
- `papers/M2/N2_sources.md`: outside results, each with its mark. §§1–7 are the first pass and are in places superseded, as marked there, by §8 and §9. `papers/M2/N2_refs_from_chat.md`: the report of a separate chat session, which paraphrases and does not quote in full.
- `papers/M2/N3_field_and_functional.md`: first half of N3.
- Decision Log P71–P87. The Status cell of the M2 row of the series plan.

Nothing was compiled; no gate was run; no certificate exists (`MEFProof/Paper_M2/` is still to be created). No independent check of N1 or of N3 has been made. No register other than the Decision Log was written.

**Commit state.** This version, P86 and P87, the SOW's order of work, and the corrections to the notes, the step audit and the series plan were committed and pushed together on 11 November 2026 (the commit after 26b1020; see `git log`).

## What was found, each with its mark
| Finding | Mark, and where |
|---|---|
| A shape has four parts: g (how lengths are measured), V (the flow), Q (the quaternionic structure, spinors and Clifford action), ∇ (connections and Hermitian metrics on the two lines, and the forms that carry the flux) | DECLARED, the architect's proposed definition (N1 §2). That M1 states no relation between g and the others: READ, as an absence |
| The gluing by M₀³ keeps no flat shape of the fibre, so the fibre's shape is a path in time with a condition on its ends, unless something further fixes the path; "the aspect ratio" (M1 l.602) is then not one number unless a time is named or a rule is given | CHECKED under two suppositions (N1 §4). P74: the reading may be incomplete, since M1 writes no lengths on the time factor; the first hypothesis remains that the reading is wrong |
| The law of natural growth at one rate cannot hold across a closed piece. Time is closed too; along time it can hold only through P81 | CHECKED (step audit); P84 point 2 |
| Form (b) of R-b is the quaternions with their own flat lengths; (b) and "the internal piece shrinks" differ only by a unit that depends on the time | CHECKED (step audit). Whether they are one shape: not settled |
| M1 has the fold acting on states (l.719), says two states at rest have the same shadow (l.725), and defines an object as a state (l.163). It has the quaternions acting "on a spinor bundle" (l.214), the drive acting "on spinors" (l.837) and the lifted fold returning to itself round time (l.847) | READ |
| That the state is the spinor, so that all five actions are on one object | DECLARED, the architect's identification (step audit 0.8). Against it, there: M1 uses "states are the harmonic spinors" as motivation only (l.728); the quaternions act at the tangent level too (l.214). Two gaps (P79): M1 speaks of states at rest only, and never applies the growth law to them |
| The functional M1 names (ll.258, 992) is the one whose stationarity is the equation of M2 | DECLARED, an identification; M1 does not say so (step audit 0.2; SOW A3) |
| Requirement Q4: at rest on a fibre, the stationary fields must be exactly M1's states: three, two kept by the fold | DECLARED as a test (N3 §4). Its hypotheses are those of step 2; N3 §5 carries the note added after N2 |
| The count on the internal piece is 1 × 1 × 3 with the integer two on S² | `N2_sources.md` §4, §8: READ in the main, with the gaps and hypotheses of step 2 |
| Within Kähler lengths the count does not depend on the lengths | Hitchin, p. 16, Remark (1), READ, said there of the spin case without a twist. For the rest, the architect's inference from Theorem 2.1, whose displayed line was not legible in extraction and is reported by the chat session; for the whole twisted piece it rests on the combination of step 2 (`N2_sources.md` §9 item 4) |

**Sources read at source by the architect:** Nicolaescu (the author's hosted version, not the print), EGA III 1961 and 1963, Serre 1955, Serre 1956, Sampson–Washnitzer 1959, Hitchin 1974. Parts reported by the chat session and not read by the architect: Serre 1955 n° 54 and n° 62 (the sections for H⁰); the display of Hitchin's Theorem 2.1; one line of his remark on products. Kaup 1967 was misreported by a sub-agent, is corrected and is not used.

## Declared by the architect, not ruled
- The field is the state of M1, the spinor of the shape, no longer at rest and no longer confined to one fibre (step audit 0.8). **Goes to the PI at step 3.**
- The swap of growth and decay acts on the whole shape at once (step audit 0.10; P84: "Not ruled"). **Goes to the PI at step 3.**
- The identification of the functional (step audit 0.2).
- N1's choices N1-a, N1-b, N1-c (N1 §5). The sixth axiom's selection is not argued.
- The six proposed meanings of "the field satisfies A*n*" (N3 §3), each a numbered choice of M2.
- The definitions of N1 §2.

## Not ruled; put to the PI when the work reaches it
1. What selects the functional if several pass Q1–Q9. M1's clause (a) "can exclude and cannot pick" (l.271).
2. Whether a unit may be chosen afresh at each moment.
3. P76, flagged and not resolved: step 4 of P69 has the functional "built from the shape alone"; whether the field is itself built from the shape is not ruled.
4. P79, flagged and not resolved: M1 l.187, "the growth is a property of the shape, not of something placed on it", and l.193, "the growth is in the geometry rather than in a field placed on it". With P79 a field on the shape creates the growth. Whether the field counts as "placed on" the shape is not ruled.
5. Which of R-b's two forms, if the equation does not decide.
6. The wider statement of P81: whether the size of space against the internal piece has no meaning at all. Asked in P81; no answer is recorded.
7. R-c's standing, given the open point above.

## Proposed for the registers (the PI banks by commit; none was written)
- **Rulings in Force:** a section for M2 with P72, P76, P79, P81, P84, P85; P75 beside P43(1); the directions on working of P78 and P86.
- **Verified References:** EGA III 1961 and 1963; Serre 1955; Serre 1956; Sampson–Washnitzer 1959; Hitchin 1974. Nicolaescu 2000 with the caveat of P87. Details in `N2_sources.md` §8.
- **Minimality Register:** P76 and P85 as numbered choices of M2; later, the identification of the field, the swap, the six meanings of N3 §3 and the choices of N1.
- **Definitions Register:** shape, admissible relabelling, the same, small movement (N1 §2); the field, at rest (N3).
- **Corpus Errors Register, M1 v6.3.** The first hypothesis in each is that the reading is wrong. Whether a finding of M1 depends on each has **not** been examined, except where said.
  - Def 2.3 with Def 2.2 (P74(i)); "the warped piece" (P74(ii)); the aspect ratio as one number (P74(iii)); "declared sector" (l.967), used once and not defined (P74).
  - From the independent check (step audit): d, the measure is not named (ll.229, 232, 290); f, clause (iii) of Def 2.3 as written gives κ = 0; g; h; i, the elimination table excludes by clause (a) with tag [R] (l.1013) while the functional that defines a modulus is not defined, which bears on a tagged result of M1; j, the worked example at l.578 is wrong as written (CHECKED); k.
  - The place of the "w" in the display (l.125): M1 itself says nothing derived depends on it (l.127).
  - M1 states no integer on S² (P77), against "every whole number is fixed"; handled for M2 by P85.
- **Future-Mx Register:** what M1 leaves to M2: the warp's law (l.127); the discharge of the declared input (l.992); the functional (ll.258, 992), under the identification of step audit 0.2.

## Open
- The items of the work package.
- P74(i): where κ changes sign is owed at N5.
- N1 §7: an observation recorded for N5 to test.
- That a part of the internal piece alone might grow as time advances is excluded by no argument (P84).
- A torus has four holomorphic square roots of its canonical line; whether M1's "one odd corner" names one is not examined (`N2_sources.md` §9). The degree, and so the count of three, is the same for each (the architect's inference); whether "two kept by the fold" depends on it is not examined.
- That the start is independent of the withdrawn M2 is not shown (SOW A6; step audit 0.1).
- P72 left one statement RECALLED: that a movement of the points in general changes measured lengths. Not built on.
- M1's references. Not opened for want of a copy: Lawson–Michelsohn, Friedrich, Griffiths–Harris (`N2_sources.md`). Carried from the handover this session was given and not re-verified: "Gödel 1931; the pages of Gauss and of five other references".
- The drafts of Rulings in Force §4: each is put to the PI through the read-back rule when the derivation reaches the thing it speaks of (P70).
- `mef_macros.tex` and the Lean files of M1 were not read.
- The series plan's M2 row, fourth cell, still says the SOW/DAG "is not yet written". It is written. The cell is outside what this session may edit.

## Sealed: not to be read until the new derivation is written and recorded
Carried unchanged from the handover this session was given.
- `superseded/M2_v1/` (the withdrawn M2 v1.0, its certificates, plan and audit notes).
- **`registers/Decision_Log.md`: every row above P40**, that is, the section of 8 November and the rows P1–P39. If a later row is needed, the PI names it.
- **`registers/records/2026-11-11_M2_opening_musing_SEALED.md` and its figure.**
- **`registers/Rulings_In_Force.md` §§4–6.** (§7 was not read either.)
- The ledger's section on M2 v1.0 and the section of targets after it.
- The rows headed "M2 v1.0" in `registers/Minimality_Register.md`.
- Definitions Register rows that cite `M2_WP…`; Verified References rows that cite M2, its work packages or `papers/M2/…` notes.
- The display of the Master Equation in `canon/omega-definition-usage_v2.md` (its §6a may be read).
- `papers/M1/LIFT_SIGN.md` §5.
- The series plan's rows for M6, M7, M9, M10 and M16. Only the Status cell of the M2 row is edited.
- `sow/M3/` was not opened; it may carry wording from the withdrawn paper.
- Do not search the ledger, the registers or the Decision Log for "M2".

When the derivation and its results are written and recorded, and only then, they are compared with the sealed material and with the canonical form of the Master Equation. That comparison is a consistency check and not a test.
