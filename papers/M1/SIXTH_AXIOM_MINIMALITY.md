# The sixth axiom and minimality: does each "least" in M1 follow from the axiom?

**11 November 2026.** The note of item 7 of `papers/M1/HANDOVER.md` (Decision Log P42, P43; assumptions 1–11 of this session, agreed by the PI, who added: "i think that minimality comes from Axiom 6 - that is my view. If it doesn't then minimality is a criterion"). **Nothing in canon, in a draft, in a register or in the ledger has been edited.**

**Result in one line (as corrected by the blind check, §6).** No proof of M1 v5.0 changes. By the words of the axiom alone, no use of "least" follows; only the exemption of overall scale does. Two uses (no dial; trace three) follow if the axiom is read as **U**: *the axioms leave nothing about the shape to be chosen.* Three follow if it is read as **N-object**: *no object that the other five axioms do not require.* The rest (dimension, flux, the number of steps) are "least value of a quantity", which neither I nor the blind checker could ground in the axiom. U and N are meanings given to the axiom, of the kind M1 numbers as choices.

**Disclosure (CLAUDE.md §2b).** The wanted answer was known to me before I began: that the shape and the proofs stand and minimality rests on the axiom (P42(b)). The test of §2 is mine, agreed by the PI as assumption 8. My verdicts in §3 were written before the blind checker's answers were seen; §6 records where it differs. **Check script:** `checks/sixth_axiom_check.py` (S1–S7 pass).

**A breach to report.** A grep of `registers/Minimality_Register.md` for the M1 rows also printed one truncated row of the withdrawn M2 v1.0 (M2-5). It was not used. The bar of assumption 4 named the ledger, the Definitions Register and the ω note; the Minimality Register's M2 rows should be added to it.

**Read:** canon M1 v5.0 (`canon/M1/Paper_M1_Five_Axioms_v5.tex`) ll.50–453 and 536–935. **Not read:** ll.454–535 (the pillowcase theorem and its worked cases) and ll.936–1002 (appendices); a grep finds no use of "least" or "minimal" there other than l.449 and l.953. **Red-flag scan** of the whole file: 16 hits, none at a step this note consumes except l.737/l.953 ("taken as given", the count of Lemma 7.5(b), already entered in `STEP_AUDIT.md` §8).

## 1. The terms, as M1 v5.0 defines them

| Term | Defining text | Where |
|---|---|---|
| modulus | "a continuous parameter of its structure data (the warping function …, the complex and Spin^c structures, the orbifold data, the flux integers) that survives the stationarity conditions of the geometry's energy functional, taken modulo diffeomorphism and overall scale" | Def 3.1, l.236 |
| minimal | "selected by the following criteria applied in order, each used only to break ties left by the previous ones: (1) parametric: M has no modulus; (2) dynamical: one step of the drive of M has the least positive topological entropy; (3) arithmetic: …; (4) dimensional: M has least total dimension, and then least \|π₁(Σ)\|" | Def 3.2, l.240 |
| step | "One application of this map is a step of the drive" | l.249; Definitions Register l.84 |
| the sixth axiom | "There is only one thing, and that one thing is everything." | P42(1) |

## 2. The test

**T (assumption 8).** A non-least option is excluded by the axiom if it requires a second thing, or a distinction that nothing in the one thing makes. Where that cannot be shown, the "least" does not follow from the axiom.

T does not say "take the smallest". Three verdicts are used:

- **F**: follows from the axiom by T.
- **R**: follows only under the further reading **N**: *the shape contains nothing that the other five axioms do not require.* N is a meaning given to the axiom, not a consequence of its words: a shape of sixteen dimensions is one thing as much as a shape of twelve.
- **X**: does not follow under T or under N.

N has two forms and the difference matters below. **N-object**: no additional object (a line, a bundle, a dimension, a loop). **N-amount**: the least value of a quantity (an entropy, a count).

## 3. Use by use

| # | Use of minimality in v5.0 | Where | The non-least option | Verdict | Reason |
|---|---|---|---|---|---|
| 1 | Criterion (1): no modulus | Def 3.2(1); l.243; table l.919 | a shape with a dial | **F** | A modulus is by definition a value the shape's own conditions leave free. Then either something other than the shape sets it, which is a second thing, or every value is there, which is more than one thing. This is v5.0's own sentence (l.243: "a geometry with a dial would admit two universes differing only by that dial") with the axiom as its ground |
| 2 | The exemption of overall scale, "by construction" | l.243; l.231 | counting size as a dial | **F**, with a consequence the PI should see (§5.3) | Two shapes that differ only in overall size differ by nothing inside either: a size is a comparison with a second thing |
| 3 | Criterion (1) used on a discrete datum: no twisting line on ℂP², L = 𝒪(3) | Prop 7.3, l.629; l.830; table l.921 | 𝒪(1), 𝒪(5), … | **R** (N-object) | T does not exclude 𝒪(5): it is a determinate structure and needs nothing outside the shape. What singles out 𝒪(3) is that it is built from the complex structure already there with no further line. That is N. See also §5.1: Def 3.2(1) as worded does not cover this use |
| 4 | Spin^c as the least structure group | l.629, l.637 | Spin^h and larger | **R** (N-object) | as row 3. The sentence "the larger ones reduce to it when w₂ lifts integrally" (l.637) carries no citation in the lines read |
| 5 | Criterion (2): least entropy, trace three | Def 3.2(2); l.267; Thm 4.2 | trace four and above | **X** as "least" under T; **R** (N-amount); **F by a second route**, conditionally (§4) | A drive of trace four is not a drive of trace three with something added. Under N it is "no more change than the fourth axiom requires", which is an amount. The second route is §4 |
| 6 | Criterion (4): least total dimension. Three uses: the fibre is a surface (Prop 5.4, l.449); the time–space block has dimension four (l.551); D = 12 and not 16 (Thm 6.1, l.561) | as listed | a fibre of higher dimension; a block of eight; D = 16 | **R** (N-object) | T does not exclude D = 16: nothing shows that it needs a second thing. Under N the extra quaternionic dimension is something no axiom requires |
| 7 | Criterion (4), last clause: least \|π₁(Σ)\|, Σ = S³ | Prop 7.9, l.849; l.852 | S³/ℤ₂, S³/ℤ₃ | **R** (N-object) | The first axiom's loop is already supplied by the time circle (l.173); a further loop in space is required by nothing. v5.0 says at l.852 that this "stronger principle, that the geometry carries no unforced topology … is not adopted". Under N it is adopted, and that sentence changes |
| 8 | The least flux on the fibre, three | Prop 7.6, l.699; l.750 | flux four, five, … | **R** (N-amount, or N-object if each unit of flux is counted as a thing) | T does not exclude flux five. v5.0 calls the choice "of the same character as criterion (1)" (l.750); it is of the character of row 3, not of row 1 |
| 9 | The time circle of three steps, the least multiple of three | Cor 7.8, l.773; l.791 | six, nine, … | **R** (N-amount) | T does not exclude six steps. An argument that it does is unsound (the caution at the end of §5). The sign of the lift, which could force six, is still open (l.795; `LIFT_SIGN.md`) |
| 10 | Criterion (3) | l.243; l.895 | — | nothing to test | v5.0 shows it is an output; it removes nothing |
| 11 | That criterion (2) is applied to the step and not to the map once round | l.800; Minimality M1-7 | applied to the map once round | unchanged | v5.0 records it as a choice of what the criterion is applied to; the axiom does not bear on it |
| 12 | The order of the criteria ("applied in order, each used only to break ties") | Def 3.2 | another order | not derived from the axiom | In ll.866–896 no step of the theorem uses the order to settle a conflict between two criteria. Whether the order can simply be dropped is not tested here |

Not uses of minimality, listed so that nothing is unmarked: "the least power of F that is [in SL₂(ℤ)]" (l.351) is arithmetic; the single clauses of Prop 7.6 (l.701) are illustrations; l.844 is treated in §5.2.

## 4. The drive: a second route to trace three

v5.0 already says of trace three that "at the least trace there is nothing to choose" (l.269). The check makes this exact.

| # | Statement | Status |
|---|---|---|
| D1 | At trace three there is one drive up to relabelling of the torus that keeps its orientation (one class under SL₂(ℤ)), and the drive is a relabelling of its own inverse | M1 Thm 4.2, three proofs; **CHECKED** again (S1), two methods |
| D2 | At every trace from 4 to 60 there are at least two such drives, and the drive is not a relabelling of its inverse | **CHECKED** (S2, S4), forms; brute force agrees at traces 4, 5, 6 (S6). **Not proved for every trace** |
| D3 | If relabellings that reverse orientation are allowed (GL₂(ℤ)), there is one drive at traces 3, 4, 5, 9, 21 among 3–60 | **CHECKED** (S3, S6) |
| D4 | −M₀ (trace −3) has the same entropy as M₀, acts on the four corners as M₀ does, and is the one class of trace −3 | **CHECKED** (S7) |

*A recalled statement of mine was wrong and the check corrected it: I expected the drive to be conjugate to its inverse at every trace s² + 2; it is so only at trace three in the range checked.*

**What follows.** By T: at a trace with two or more inequivalent drives, to have one of them is to make a distinction (this drive and not that one; forwards and not backwards) that nothing in the shape makes. At trace three there is nothing to distinguish. So T selects trace three, **on two conditions**:

- that relabelling means SL₂(ℤ). v5.0 uses SL₂(ℤ) throughout (l.249, l.272), so the group was not chosen in this note; but under GL₂(ℤ) the route fails (D3), and I have not tested whether the axioms force the orientation to be kept;
- that D2 holds for every trace. This was checked to 60 when this section was written; the blind check supplied a proof (§6).

And a third condition, from the blind check: the route uses the reading U (§6.1).

Under this route criterion (2) would be an output, as criterion (3) is, and "least entropy" would be a remark.

## 5. Four things found in v5.0 on the way (the old text in each case)

1. **Criterion (1) is defined for continuous data and used on a discrete one.** Def 3.1 says a modulus is "a continuous parameter"; Prop 7.3 removes the twisting line "by criterion (1) … as an unforced datum" (l.629) and l.830 calls it "a discrete choice which criterion (1) removes". The Minimality Register's M1-3 names the criterion "(1) no unforced datum", which is N and not Def 3.2(1). First hypothesis (§2d): the wording drifted; the mathematics of Prop 7.3 is not affected.
2. **l.844** ("the least even quantum compatible with one canonical unit … per sector is a multiple of two") does not parse and nothing in the lines read uses it. It looks like a remnant of Proposition 8.2, which left M1 at P38.
3. **Overall scale.** v5.0 calls the size "the input the axioms do not supply" (l.231) and has it "held by a declared sector" (l.873). Row 2 says that under the sixth axiom an overall size has no meaning, so there would be nothing to supply. The aspect ratio of the fibre is different: it is a dial in the sense of row 1, and M1 still does not derive it (Minimality M1-10 stands). I report the tension and do not resolve it.
4. **The negative trace.** l.267 says criterion (2) selects "the least \|t\| > 2, which is t = 3". \|t\| = 3 also allows t = −3, and the certificate `L1_trace3_min` assumes t > 0 (`M1_L1_drive.lean` l.50). By D4, −M₀ is M₀ followed by the fold, so on the pillowcase the two are the same map; on the covering torus they are not. v5.0 does not say this. Whether it bears on the open sign of the lift is not examined.

And one caution on the axiom itself. An argument of the form "the two halves of a six-step time circle differ in nothing, so the axiom identifies them" would give three steps (row 9). The same form of argument applied to space would prefer the quotients S³/Γ to S³, and applied without limit would collapse any symmetric space to a point. It is therefore not used. If the sixth axiom is ever formalised as "what cannot be told apart is the same", this is where it breaks.

## 6. Independent blind check (done 11 November 2026), and what it changed

A fresh sub-agent was given the axiom, T, and nine situations stated as neutral mathematics, with no file access, no statement of which option M1 takes and no statement of what was hoped for. It was asked whether T excludes anything, and to compute the class counts by its own script.

**Where it agrees.** Its counts for traces 3–30 equal mine in every row, by two methods different from mine (words in L and R; a box search). N is "a reasonable reading that is nevertheless a choice of meaning", not a consequence of the axiom. The covering argument for three steps is unsound and pulls the opposite way for space. Trace −3 is one class and cannot be told from trace 3 on the corners, so "the restriction to positive trace is a separate input".

**Where it is stricter than §3, and I was wrong.**

1. **Row 1 (no dial) is not F.** T's second limb has two readings. Read as "a distinction the thing itself does not have", it excludes nothing: a shape with a given value of its dial is a determinate shape, and the value is a property of it. Read as "a distinction the axioms do not select", it is the demand that the axioms fix the shape, which is the reading U above and not the words of the axiom. My argument in row 1 ("something else sets it, or every value is there") used the second reading without saying so. The checker: "'leaves a parameter free' is a property of the equations, not of any one geometry." Corrected verdict: **follows under U**.
2. **The second route for the drive (§4) rests on U as well**, for the same reason. It also noted that if an axiom needs the direction of the drive to be told apart from its reverse, then the drive being a relabelling of its inverse at trace three counts against trace three under T, not for it. That is not examined here.
3. **N-object and N-amount can disagree.** In row 3, "no added line" gives 𝒪(3); "least value" gives 𝒪(1). M1 takes 𝒪(3), so row 3 is N-object and cannot be described as "least".
4. **Row 6 (dimension) is N-amount, not N-object**, unless every solution of dimension above twelve is a twelve-dimensional solution times a factor the axioms do not use, which M1 does not show.
5. **The axiom can be read the opposite way.** "That one thing is everything" can as well mean that the thing contains all that is possible. The words do not choose between that and N.

**What it added.** A proof, for every trace t ≥ 4, that the drive is not a relabelling of its inverse, so D2 holds for all traces and not only to 60. I have checked each line by hand:

- Let A = ((t, −1), (1, 0)), so A⁻¹ = ((0, 1), (−1, t)). If PA = A⁻¹P with P = ((p, q), (r, s)), comparing entries gives r = tp + q and s = −p, and det P = −(p² + tpq + q²).
- So A is conjugate to A⁻¹ in SL₂(ℤ) only if p² + tpq + q² = −1 has an integer solution. Then pq < 0; write it as x² − txy + y² = −1 with x ≥ y ≥ 1, and take x + y least.
- If x > y, the other root x′ = ty − x = (y² + 1)/x is a positive integer and x′ ≤ y, so (y, x′) is a smaller solution: a contradiction.
- So x = y, and x²(2 − t) = −1 gives x = 1, t = 3.

**One point of the checker's that does not apply.** It observed that line bundles of a given degree on the torus form a continuous family. M1 Def 7.4 takes the twist from a divisor on the four corners, so the family is finite.

**Corrected verdicts.**

| Row | Use | §3 | Corrected |
|---|---|---|---|
| 1 | no dial | F | follows under **U** |
| 2 | overall scale | F | **F**, provided nothing in the shape ties a length to an integer |
| 3, 4 | no twisting line; Spin^c | R (N-object) | **N-object** |
| 5 | trace three | X / R / F by the second route | follows under **U** (given SL₂(ℤ); D2 now proved for every trace), or **N-amount** as "least entropy" |
| 6 | least dimension | R (N-object) | **N-amount** |
| 7 | least π₁(Σ) | R (N-object) | **N-object** |
| 8 | least flux | R | **N-amount** |
| 9 | three steps | R (N-amount) | **N-amount** |

## 7. Step audit

| Step | Statement | Status |
|---|---|---|
| A1 | The list of uses in §3 is complete for ll.50–453, 536–935 | READ; ll.454–535, 936–1002 by grep only |
| A2 | T is the test | DECLARED (assumption 8, agreed) |
| A3 | Row 1: a modulus needs a setter or a plurality | follows from Def 3.1 and T |
| A4 | Row 2: overall size is not a distinction inside one thing | follows from T, second limb; **identification step**, mine |
| A5 | Rows 3, 4, 6, 7: T does not exclude the non-least option | argument by absence: no second thing was found. **GAP** in the strict sense: an absence is not a proof |
| A6 | Rows 3–9 follow under N | follows, given N; N is DECLARED if adopted |
| A7 | N is not a consequence of the words of the axiom | argued (a larger shape is still one thing); **identification step**, mine |
| A8 | D1–D4 | CHECKED (`checks/sixth_axiom_check.py`; blind check, independent methods). D2 for every trace: hand proof, §6 |
| A10 | Rows 1 and 5 need U; U is not the words of the axiom | blind check §6.1; accepted. U is DECLARED if adopted |
| A9 | D1–D2 with T select trace three | follows, given SL₂(ℤ) as the relabellings; the choice of group is inherited from v5.0 and untested against the axioms: **GAP** |

## 8. Failure tests

- Row 1: a modulus shown to be physical (Minimality M1-6).
- N: a later paper that needs an object or an amount N removes (dimension sixteen; a lens space; flux five; six steps; a twisting line). These are the failure tests already in the Minimality Register for M1-1 to M1-4, M1-9, M1-11.
- The second route for the drive: a trace above three with a single class under SL₂(ℤ), or an axiom-level reason that relabellings may reverse orientation.

## 9. For the PI

The item-by-item verdicts are the last table of §6. On the PI's statement ("minimality comes from Axiom 6 … If it doesn't then minimality is a criterion"): by the test agreed, it does not come from the words of the axiom alone. It comes in part from two readings of the axiom, and in part from neither.

Three points need a ruling before the draft is edited.

1. **How the axiom is made formal for the shape.** The uses fall into three groups: under U (no dial; trace three), under N-object (no twisting line; Spin^c; S³), and least value of a quantity (dimension twelve; flux three; three steps), which is a criterion and not the axiom on the evidence here. Is the formal statement of the sixth axiom U, N-object, both, or neither; and are the least-value uses kept as a criterion of minimality with numbered choices?
2. **The drive.** Is trace three to be stated by the second route (one drive, nothing to choose), by least entropy, or by both with one named as the ground? The second route needs relabellings to keep orientation and needs the positive trace as a stated input.
3. **Scale** (§5.3): is the overall size an input the axioms do not supply, as v5.0 has it, or without meaning under the sixth axiom?

§5.1, §5.2 and §5.4 are corrections of wording in v5.0 and need no ruling; they go into the draft with the rest.
