# Error log A: the check of Pass A (M1 v7.0)

**13 November 2026.** Pass A is `papers/M1/build_v7/passA.tex`, made by `python3 tools/m1_build_v7_0.py A` from canon v6.3 and the thirty-five active entries of `papers/M1/WRITE_LOG.md` (29 named edits, each matching once; the script asserts that every active entry is placed exactly once). The five kinds of error are those of `tools/Paper_assembly_protocol.md`. An error is identified by its kind and the offending sentence; line numbers are of `passA.tex` and are a help only.

## Part 1. By script and by compiling (kinds 1, 4 undefined references, 5)

| Kind | Check | Result |
|---|---|---|
| 1 | `python3 tools/writelog_check.py M1 papers/M1/build_v7/passA.tex` | "35 active, 8 retired; 0 failing". **No error.** |
| 4 (undefined references) | gate 1, `tools/gates_on_pass.sh M1 papers/M1/build_v7/passA.tex 1 2 3 5` | no undefined reference or citation. **No error.** |
| 5 | gate 1, XeLaTeX three passes | PASS, 46 pages (canon v6.3: 44). **No error.** |

Beside the five kinds, for the record: gate 2 PASS (no overfull box); gate 5 PASS (54 certificate names cited, none missing); gate 3 finds the same two items as on canon v6.3 (the "I" voice of l.66, in the child's observations) and nothing new. The baseline on canon v6.3, run first: gates 1, 2, 4, 5 PASS; gate 3 those two items.

## Part 2. By the fresh reader (kinds 2, 3, and numbers and counts in the prose)

The reader was given `CHECK_BRIEF.md`, `CLAUDE.md`, `passA.tex`, `WRITE_LOG.md` and `RULINGS_LIST.md`, and nothing else; no conclusion. Every finding it returned is logged below. The column "Architect" says whether the finding was verified against the files; a finding rejected stays in the log, marked rejected with the reason, and is not counted.

### The architect's verdict on each finding

The reader's report is copied whole, unedited, in the appendix below; its numbers are the error numbers A-1 to A-29, and each offending sentence is quoted there in full. Every finding was verified against `passA.tex` (each sentence is there as quoted: the Pass B script matches each exactly once) and against the entry or register item named.

| # | Kind | Offending sentence begins | Architect | How fixed in Pass B |
|---|---|---|---|---|
| A-1 | 3 (2) | "Which of the two pieces is scaled, and by a function on which, is not fixed in this paper" | **REJECTED.** Corpus Errors 34(b), as amended at P142, says "the sentence quoted from l.127 stands as to K₈"; which piece the ×_w of the displays scales is owed by M2 (HANDOVER_BUILD §5) | not touched |
| A-2 | 4 | "…isolates as numbered definitions the six points at which a behavioural word has to be given a mathematical meaning." | **REJECTED.** The numbered definitions that carry a choice in Section 2 are still six; M1-W035 is a sentence and not a numbered definition, as the reader itself notes | not touched |
| A-3 | 4 | "…is the first of the six choices this section records." | verified | "six" deleted |
| A-4 | 4 | "…and that is the third of the six choices." | verified | "six" deleted |
| A-5 | 4 | "Clause~(i) is the fourth of the six choices" | verified | "six" deleted |
| A-6 | 4 | "…of Section~\ref{sec:base}, where the other possible reading is set out." | verified (Corpus Errors 33(m)) | ", where the other possible reading is set out" deleted |
| A-7 | 3 | "And ``never comes to the same point again'' means…a typical state…of measure zero." | verified (M1-W006; 33(a)) | sentence deleted; M1-W007 says which points return |
| A-8 | 4 | "…and in doing so six choices were made and numbered:…" | verified | "six" deleted; the tenth choice added to the list (COMPOSED 3) and named where it is stated (COMPOSED 2) |
| A-9 | 2 | "One proportion is not derived in this paper, the aspect ratio of the internal fibre…" | verified (M1-W028; 34(e)) | sentence deleted |
| A-10 | 2, 3, 4 | "Clause~(c) selects the gentlest drive…the four it names, and it is applied after clause~(b)…" | verified (M1-W010, M1-W012; 33(d)) | sentence replaced by COMPOSED 4, which keeps the paper's reason for clause (b) before clause (c) |
| A-11 | 3, 4 | "…contradicting two clauses of Definition~\ref{def:A4}." | verified (M1-W006) | "two clauses of" deleted |
| A-12 | 2, 3 | "…its periodic points are exactly the rational points, which have measure zero…" | verified (M1-W006, M1-W007) | that clause deleted; the rest of the sentence, with its citation for the entropy, stands |
| A-13 | 2 | "…and the definitions use a direction of time without saying that the geometry run backwards is another geometry." | verified (M1-W034; 35(b)) | that clause deleted |
| A-14 | 2, 3 | "$(aa^{*})^{*}=aa^{*}$, so $N$ is $*$-fixed." | verified (M1-W017) | the two sentences of the old proof deleted; the hand check of the Mark of M1-W017 copied in their place (COMPOSED 5) |
| A-15 | 2, 3 | "On $\R\oplus\R u$ the unit group is…positive-definiteness of $N$ on the span." | verified (M1-W017; 33(f)) | as A-14 |
| A-16 | 3 | "…what rules them out is that a corner whose unit group is a hyperbola…the corner fibres included, to close." | verified (M1-W015; 33(f)) | that clause deleted; M1-W015 says what A1 asks |
| A-17 | 3 (2) | "Let the fibre $X$ that carries the involution of A2 be compact and connected…Anosov diffeomorphism commuting with $\iota$." | verified (M1-W003, M1-W008; 33(b)), with the reader's note on the sentence after it | the hypotheses replaced by the first sentence of M1-W013, copied; "Then the least-dimensional such $X$ is" replaced by the words of M1-W003, "Under clause~(c) of Definition~\ref{def:minimal} the fibre is" |
| A-18 | 2, 3 | "If $\dim X=2$, Franks' theorem \cite{Franks1970} states…" | verified | sentence deleted |
| A-19 | 2, 3 | "Clause~(c) of Definition~\ref{def:minimal} selects the least dimension; the selection is unconditional, resting on Franks' theorem…" | verified (M1-W013) | sentence deleted |
| A-20 | 3 | "…and the surviving algebra at a point is what its stabiliser fixes." | verified (M1-W029; HANDOVER_BUILD §5) | "what its stabiliser fixes" replaced by the words of M1-W029, copied |
| A-21 | 2, 3, 4 | "A point with trivial stabiliser, which by Definition~\ref{def:A4}(iii) is a generic point…" | verified (M1-W029, its Mark; 32(k), 34(g)) | COMPOSED 6 |
| A-22 | 3 | "\emph{The stabilisers.} Under $\langle\iota,M_{0}\rangle$ on $\Ttwo$:…" | verified (M1-W029, its Mark; 34(g)) | COMPOSED 7; the computation kept |
| A-23 | 2 | "…the ratio of the periods is the one continuous datum of the fibre, its aspect ratio…" | verified (34(f); M1-W026, M1-W028) | that clause deleted |
| A-24 | 2, 3 | "Two readings enter and are named: that complexification is forced…the scale-freeness of A3…" | verified (M1-W019; 32(b), 33(k)) | sentence deleted |
| A-25 | 4 | "Its hypotheses are the six axioms, the six readings of Section~\ref{sec:axioms}…" | verified | the second "six" deleted |
| A-26 | 2 | "…and it does not derive the aspect ratio of the fibre." | verified (M1-W028; 34(e)) | that clause deleted |
| A-27 | 2, 3 | "That this proportion is fixed is the declared input of the theorem; it would fail if the stationarity conditions…" | verified (M1-W027, M1-W028; 34(d)) | COMPOSED 8, from the statement and the failure test of M1-W028 |
| A-28 | 4 | "Proposition~\ref{prop:CP2} is the least direct step and is tagged \rigD\ with its two readings named." | verified: the sentence that named two readings is A-24 and is gone | " with its two readings named" deleted |
| A-29 | 3 | "$M_{2}(\R)$ as fibre algebra & non-compact corner unit groups &…" | verified (HANDOVER_BUILD §5; `STEP_AUDIT.md` §11.21, carried to the build) | "corner " deleted |

## Count of log A

| | |
|---|---|
| Kind 1 | 0 |
| Kind 4, undefined references | 0 |
| Kind 5 | 0 |
| Reader's findings | 29 |
| Rejected | 2 (A-1, A-2) |
| **Count of log A** (findings not rejected) | **27** |

## Not errors, and held

- **The reader's lists "Register items still standing that fit none of the three kinds" and "Other"** (appendix) are not counted (`CHECK_BRIEF.md`). They are left as canon has them and are named in the end report. Among them, changed in Pass B as presentation and not as an error: the date and the header, which said v6.3.
- **From the Lean check owed before Pass C (HANDOVER_BUILD §12):** the header of `MEFProof/Paper_M1/M1_L2_fibre.lean` (l.7) names "Franks 1970 (Anosov diffeomorphisms of surfaces)"; it does not name Lemma 5.1. The file is printed in Appendix A. It is a comment in a certificate and was not changed; it is named in the end report. `\cite{Franks1970}` is cited nowhere after Pass B; the two bibliography items on Franks stand.

---

## Appendix: the reader's report on Pass A, whole and unedited

**Files read, each whole:** `papers/M1/build_v7/CHECK_BRIEF.md` (ll.1–48); `CLAUDE.md` from disk (ll.1–97); `papers/M1/build_v7/RULINGS_LIST.md` (ll.1–429); `papers/M1/WRITE_LOG.md` (ll.1–544); `papers/M1/build_v7/passA.tex` (ll.1–1141). No other file was opened; grep was run on `passA.tex` only. Line numbers below ("L") are of `passA.tex`, as a help. No statement is judged true or false.

# Findings (kinds 2, 3, 4)

**1. Kind 3 (with 2), in doubt. L127.**
Sentence: "Which of the two pieces is scaled, and by a function on which, is not fixed in this paper: nothing derived here depends on it, and it is fixed where the warp is given its law, with the field equation."
Measured against: M1-W025, "Retires" line: "canon l.127, from "The symbol $\times_{w}$ records", is reworded with it"; M1-W025 "Rests on": "in (i), "with a smooth function $w$ on one piece, $\nabla w\neq0$, entering the lengths measured on another" becomes "the lengths measured on one piece depend on where one is in another""; M1-W027 "Rests on": "in which the warp is a rate and not a function on a piece".
Reason: "by a function on which" keeps the removed "function on a piece" at a place the entry says is reworded. Doubt: Corpus Errors 34(b) as amended says "the sentence quoted from l.127 stands as to K₈".

**2. Kind 4, in doubt. L129.**
Sentence: "Section~\ref{sec:axioms} turns the first five sentences into mathematics, at a level intended to be followed by a first-year mathematics graduate, and isolates as numbered definitions the six points at which a behavioural word has to be given a mathematical meaning."
Measured against: M1-W019, "Let the three imaginary units be complex-valued (the tenth choice)"; M1-W035 "Rests on": "It is the tenth choice, which M1-W019 names. It is a new sentence"; list Part 2: "The tenth choice is "the seventh of Section 2" (P92)."
Reason: Section 2 now holds a seventh choice (M1-W035 at L219). Doubt: that sentence is not a numbered definition, so "six … numbered definitions" may still be literally right.

**3. Kind 4. L163.**
Sentence: "That the part along which we see is time and space, and that seeing is the projection $\pi$, is the first of the six choices this section records."
Measured against: as finding 2 (M1-W019 "(the tenth choice)"; M1-W035; Part 2 "the seventh of Section 2").
Reason: the section now records seven choices.

**4. Kind 4. L181.**
Sentence: "On any compact shape there is always a closed geodesic, a closed path that is as straight as the shape allows \cite{LyusternikFet}; we ask for more, a loop that is topologically stuck, and that is the third of the six choices."
Measured against: as finding 2.
Reason: "of the six" is no longer the count of this section's choices.

**5. Kind 4. L193.**
Sentence: "Clause~(i) is the fourth of the six choices: the growth is in the geometry rather than in a field placed on it."
Measured against: as finding 2.
Reason: as finding 4.

**6. Kind 4. L225.**
Sentence: "That is the sixth choice, and it is what produces the two-sphere and the complex projective plane of Section~\ref{sec:base}, where the other possible reading is set out."
Measured against: Corpus Errors 33(m): ""Section 7, where the other possible reading is set out"; the other reading of Definition 2.8 is at l.992, in Section 8."
Reason: in the pass the other reading (the "fibrewise form") stands at L1028, in Section~\ref{sec:theorem}, not in Section~\ref{sec:base}.

**7. Kind 3. L231.**
Sentence: "And ``never comes to the same point again'' means that although time itself is a circle, a typical state of the universe does not return: the points that do return are exceptional, of measure zero."
Measured against: M1-W006 "Rests on": "canon l.229 loses "typical" and "of measure zero""; Corpus Errors 33(a): "M1 does not speak of measure".
Reason: both removed words are still in use at the line the ruling names.

**8. Kind 4. L241.**
Sentence: "The five sentences have been turned into five conditions, and in doing so six choices were made and numbered: that what is seen is the image of the whole under the projection onto time and space (Definition~\ref{def:A5}(i)); that an object is a state of the internal piece at rest, and its shadow what is left of it when the internal piece is forgotten (Definition~\ref{def:A5}(ii),~(iii)); that self-reference means a loop that cannot be shrunk (Definition~\ref{def:A1}); that growth is in the geometry (Definition~\ref{def:A2}(i)); that the non-commutative algebra is the algebra of the shape's own spinors and tangent directions (Definition~\ref{def:levels}); and that the sphere of alternatives is part of the shape (Definition~\ref{def:orbits})."
Measured against: as finding 2.
Reason: the count "six" and the list of six omit the tenth choice, which now stands in this section.

**9. Kind 2. L241.**
Sentence: "One proportion is not derived in this paper, the aspect ratio of the internal fibre, and the final theorem states it as its declared input."
Measured against: M1-W028, "with the continuous data of the geometry that this paper does not derive held fixed, which is its one declared input,"; its "Rests on": "so "the aspect ratio" is no longer a declared input"; Corpus Errors 34(e).
Reason: gives the theorem's declared input a different content from the confirmed clause at L1003.

**10. Kinds 2, 3 and 4. L273.**
Sentence: "Clause~(c) selects the gentlest drive that still drives, the fewest dimensions, the least flux and the shortest time circle; the quantities to which it applies are the four it names, and it is applied after clause~(b), so that it does not replace a structure that needs no further object by one with a smaller integer."
Measured against: M1-W010 "Retires" line: "with it "the fewest dimensions" and "the quantities to which it applies are the four it names" at canon l.271 are reworded"; M1-W010 statement, which names "the least total dimension; the fibre of $F$ carrying the drive has the least dimension and, at that dimension, the least number of handles"; M1-W012: "Each is applied wherever the derivation reaches a datum of which it speaks. Where two clauses would select differently, clause~(a) prevails over clause~(b), and clause~(b) over clause~(c)."; M1-W012 "Retires" line: ""it is applied after clause (b)" at l.271 is reworded with it"; Corpus Errors 33(d).
Reason: "the four it names" is no longer the count in clause (c) (kind 4); "applied after clause (b)" states an order of application where M1-W012 states an order of priority (kinds 2, 3).

**11. Kinds 3 and 4. L304.**
Sentence: "If $\lvert t\rvert<2$ the eigenvalues are complex of modulus one and $M$ has finite order: every point is periodic and the entropy vanishes, contradicting two clauses of Definition~\ref{def:A4}."
Measured against: M1-W006 "Rests on": "l.286 "contradicting two clauses of Definition 2.9" becomes "contradicting Definition 2.9""; Corpus Errors 33(a).
Reason: the definition at L234 no longer has the clause on periodic points, so "two clauses" is no longer right.

**12. Kinds 2 and 3. L308.**
Sentence: "If $\lvert t\rvert>2$ the eigenvalues are real, $\lambda$ and $\lambda^{-1}$ with $\lvert\lambda\rvert>1$; $M$ is Anosov, its entropy is $\log\lvert\lambda\rvert>0$, its periodic points are exactly the rational points, which have measure zero, and the induced flow on the mapping torus has no fixed points \cite{KatokHasselblatt}."
Measured against: M1-W006 "Rests on": "l.290 loses "which have measure zero""; M1-W007 "Mark": "It replaces the citation of Katok–Hasselblatt for the periodic points at canon v6.3 l.290 (V-23, not read); the entropy $\log\lvert\lambda\rvert$ in the same line stays on that unread source".
Reason: "which have measure zero" is a removed phrase at the named line (kind 3); the clause on the periodic points with its citation is replaced by M1-W007, which stands next at L310 (kind 2). "Anosov" here is not within the ruling of 33(b), which names Proposition 5.5 only.

**13. Kind 2. L462.**
Sentence: "The fold, the corners and their algebras, the corner signs, the flux of the twist and the element of the drive on spinors, as this paper defines them, are each carried to themselves by a mirror of the torus and by the reversal of the drive; Definition~\ref{def:levels} fixes a handedness on the internal piece, but it is one of the numbered choices, and it does not say whether the whole geometry has a symmetry that mirrors the torus; and the definitions use a direction of time without saying that the geometry run backwards is another geometry."
Measured against: M1-W034: "The mirror image of a geometry, and a geometry run backwards, are therefore other geometries, unless a relabelling of Definition~\ref{def:same} carries the one to the other."; its "Rests on": "With it, at the build, the second half of that sentence of canon l.442 is reworded"; Corpus Errors 35(b): "The new version says it".
Reason: the last clause says the paper does not say what M1-W034 (L280) now says. The clause on the symmetry that mirrors the torus stays, by 35(b).

**14. Kinds 2 and 3. L473.**
Sentence: "$(aa^{*})^{*}=aa^{*}$, so $N$ is $*$-fixed."
Measured against: M1-W017 "Retires" line: "it supersedes canon v6.3 l.449 and its proof, ll.453–455"; Corpus Errors 33(f): ""takes values in the fixed set of *" where a real number is needed".
Reason: a sentence of the superseded proof, carrying the "fixed set" wording where the lemma (L469) now says "is real".

**15. Kinds 2 and 3. L475.**
Sentence: "On $\R\oplus\R u$ the unit group is $\{x+yu:\,x^{2}-u^{2}y^{2}=1\}$, a circle if $u^{2}=-1$ and a hyperbola if $u^{2}=+1$; compactness is $u^{2}=-1$, i.e.\ $N(u)=1>0$ on every such line, which is positive-definiteness of $N$ on the span."
Measured against: M1-W017 "Retires" line (as finding 14); Corpus Errors 33(f): ""positive-definiteness of N on the span"".
Reason: a sentence of the superseded proof, carrying the phrase the item names.

**16. Kind 3. L478.**
Sentence: "Non-commutativity alone admits the split quaternions, in which two of the three imaginary units square to $+1$ and whose unit groups are hyperbolas; what rules them out is that a corner whose unit group is a hyperbola is not compact, and A1 requires every factor, the corner fibres included, to close."
Measured against: M1-W015 "Retires" line: ""the corner fibres included" at ll.458, 467 goes with it"; M1-W017 "Retires" line: "canon ll.458, 471 and 546–552 are reworded with it"; Corpus Errors 33(f): ""every corner subalgebra" and "the corner fibres included" are said before the corners are counted".
Reason: "the corner fibres included" (and "a corner") still stand before the corners are counted (L498).

**17. Kind 3 (with 2). L521.**
Sentence: "Let the fibre $X$ that carries the involution of A2 be compact and connected, with the involution $\iota$ having exactly four isolated fixed points and the drive of A4 acting as an Anosov diffeomorphism commuting with $\iota$."
Measured against: M1-W003 "Retires" line: "with it the hypothesis "Anosov" and the citation of Franks leave Proposition 5.5, canon v6.3 ll.501, 505, 513"; M1-W008 "Retires" line: "with it "commuting with $\iota$" is no longer a hypothesis of Proposition 5.5, canon v6.3 l.501"; Corpus Errors 33(b).
Reason: both removed hypotheses are still in the statement. The sentence that follows it ("Then the least-dimensional such $X$ is the torus $\Ttwo$, …") speaks of "such $X$" and names the least dimension only, where M1-W013 and M1-W003 (L525, L527) reach the torus by least dimension and then least number of handles.

**18. Kinds 2 and 3. L531.**
Sentence: "If $\dim X=2$, Franks' theorem \cite{Franks1970} states that every Anosov diffeomorphism of a compact surface lives on $\Ttwo$ and is topologically conjugate to a hyperbolic linear automorphism."
Measured against: M1-W003 "Retires" line (as finding 17); Corpus Errors 33(b): "the citation of Franks".
Reason: the citation and the word the ruling removed from this proof.

**19. Kinds 2 and 3. L539.**
Sentence: "Clause~(c) of Definition~\ref{def:minimal} selects the least dimension; the selection is unconditional, resting on Franks' theorem at the minimal case, while the non-existence of exotic Anosov manifolds in dimension four and above, an open conjecture, is not needed."
Measured against: M1-W013 "Retires" line: "with it the sentence of canon v6.3 l.513 that begins "Clause~(c) of Definition~\ref{def:minimal} selects the least dimension;" is replaced when the new version is built".
Reason: named by the entry as replaced; M1-W013 stands at L525.

**20. Kind 3. L551.**
Sentence: "The principle is A4 read on A3: order has nothing to act on where nothing moves, and the surviving algebra at a point is what its stabiliser fixes."
Measured against: M1-W029: "fixed by those of the fold and one step of the drive that leave the point in place"; its "Rests on": ""the example stands; 'stabiliser' becomes 'the fold or one step'""; list Part 2: "canon l.525, in the proof of Proposition 5.6, also has "the surviving algebra at a point is what its stabiliser fixes"".
Reason: "stabiliser" for the algebra at a point, in the proof of the proposition the ruling reworded.

**21. Kinds 2, 3 and 4. L559.**
Sentence: "A point with trivial stabiliser, which by Definition~\ref{def:A4}(iii) is a generic point, has nothing fixed and carries $\Hquat$."
Measured against: M1-W029 "Mark": "canon l.533 (…) becomes a point that neither the fold nor one step leaves in place, and the cross-reference goes"; Corpus Errors 32(k): "l.533 cites "Definition 2.9(iii)" and Definition 2.9 has no numbered clauses"; 34(g): "calls such a point "generic" by the measure clause that M1-W006 removes".
Reason: "stabiliser" and "generic" are removed words (kind 3); the definition at L234 has no clause (iii) (kind 4); the statement at L547 now says "$\Hquat$ at every other point" (kind 2).

**22. Kind 3. L604.**
Sentence: "\emph{The stabilisers.} Under $\langle\iota,M_{0}\rangle$ on $\Ttwo$: $P_{1}$ has stabiliser $\langle\iota,M_{0}\rangle$ and algebra $\Fix(\text{conj})\cap\Fix(\Ad_{w})=\R$; $P_{2},P_{3},P_{4}$ have stabiliser $\langle\iota\rangle$ and algebras $\C_{j},\C_{i},\C_{k}$ (Appendix~\ref{app:labels}); a point such as $(\tfrac13,0)$ is moved by $\iota$ to $(\tfrac23,0)$ and by $M_{0}$ to $(\tfrac23,\tfrac13)$, has trivial stabiliser, and carries $\Hquat$."
Measured against: M1-W029 "Mark": "canon l.578 keeps its computation and loses the word "stabiliser""; its "Rests on": ""Let $\langle\iota,M_{0}\rangle$ act on $\Ttwo$" becomes "Let $\iota$ and $M_{0}$ act on $\Ttwo$", the group having been there only to supply the word "stabiliser""; Corpus Errors 34(g).
Reason: the removed word (four times, with the heading) and the group, at the line the ruling names. Not within the ruling: "stabiliser" at L222 (confirmed, M1-W021), L695, L703 and L901, which are stabilisers in a group acting on units or on the half-plane and not "the algebra at a point".

**23. Kind 2. L628.**
Sentence: "In the covering torus with periods $(L_{\psi},L_{\omega})$ any two distinct corners are at distance at least $\tfrac12\min(L_{\psi},L_{\omega})$: the corners are separated by the periods, and the ratio of the periods is the one continuous datum of the fibre, its aspect ratio $\tautwo=L_{\omega}/L_{\psi}$, which this paper does not fix."
Measured against: Corpus Errors 34(f): "a flat torus has two shape numbers, not one, and no flat shape is kept by a step"; M1-W028 "Rests on": "the shape of the fibre is what M1-W026 gives, so "the aspect ratio" is no longer a declared input"; M1-W026: "Let lengths on $T$ together with the fibre be measured by $\mathrm{d}s^{2}+e^{2\kappa s}\mathrm{d}x^{2}+e^{-2\kappa s}\mathrm{d}y^{2}$".
Reason: says the fibre has one continuous datum that the paper does not fix, where the confirmed proposition (L631) gives the lengths on the fibre.

**24. Kinds 2 and 3. L719.**
Sentence: "Two readings enter and are named: that complexification is forced, which is Proposition~\ref{prop:spinc}'s statement that spinor-valued data are complex; and that the geometry records directions rather than vectors, which is the scale-freeness of A3 together with the absence of an overall scale (Section~\ref{sec:minimal})."
Measured against: M1-W019: "Let the three imaginary units be complex-valued (the tenth choice)" and "That its size is not recorded is the absence of an overall scale (Section~\ref{sec:minimal}); that its phase is not recorded is a choice and is not derived."; its "Retires" line: "the sentence of l.685 that names the two readings is reworded with it"; Corpus Errors 32(b): "l.685 attributes to Proposition 7.3 a statement it does not contain"; 33(k): ""the scale-freeness of A3" occurs once and is explained nowhere".
Reason: gives complex-valuedness another ground (forced, by Proposition 7.3) than the confirmed statement (a numbered choice), and keeps the removed phrase "the scale-freeness of A3".

**25. Kind 4. L1000.**
Sentence: "Its hypotheses are the six axioms, the six readings of Section~\ref{sec:axioms} and the three of Section~\ref{sec:minimal}, and one declared input; its conclusion names every factor and every discrete datum of the geometry."
Measured against: as finding 2 (Part 2: "The tenth choice is "the seventh of Section 2" (P92)").
Reason: "the six readings of Section 2" is no longer the count.

**26. Kind 2. L1028.**
Sentence: "The theorem asserts uniqueness among minimal realisations under the stated readings; it does not assert that a non-minimal geometry, one of dimension sixteen or with a lens-space spatial factor, fails the first five axioms, and it does not derive the aspect ratio of the fibre."
Measured against: M1-W028 "Rests on": "the shape of the fibre is what M1-W026 gives, so "the aspect ratio" is no longer a declared input"; Corpus Errors 34(e); list Part 2: "ll.239, 602, 967, 992: the aspect ratio is no longer the declared input".
Reason: the last clause introduces the aspect ratio as the thing not derived, which the next sentence makes the declared input. The rest of the sentence is not touched, except "uniqueness" (see 35(a) below).

**27. Kinds 2 and 3. L1028.**
Sentence: "That this proportion is fixed is the declared input of the theorem; it would fail if the stationarity conditions of the geometry's energy left it free, and the geometry would then not meet clause~(a)."
Measured against: M1-W028 statement (as finding 9) and its "Failure test": "as canon l.992, reworded with this clause at the build: a continuous datum of the geometry that this paper does not derive and that is not held fixed; the geometry would then not meet clause (a)"; M1-W027 "Rests on": "the clause naming the stationarity of an energy functional is struck"; Corpus Errors 34(d).
Reason: names another declared input than L1003 (kind 2) and keeps "the stationarity conditions of the geometry's energy", which the ruling struck (kind 3).

**28. Kind 4, in doubt. L1028.**
Sentence: "Proposition~\ref{prop:CP2} is the least direct step and is tagged \rigD\ with its two readings named."
Measured against: M1-W019 "Mark": "DECLARED: that the units are complex-valued (the tenth choice); that the geometry records the direction and not the unit; that the phase is not recorded (a choice, not derived)."
Reason: the "two readings" were those of the sentence in finding 24; the confirmed statement at L711 names a choice, a recording of direction, and a further choice on the phase. Doubt: how these are counted is not said by any entry.

**29. Kind 3, in doubt. L1044.**
Sentence (table row): "$M_{2}(\R)$ as fibre algebra & non-compact corner unit groups & Proposition~\ref{prop:H} & \rigD\\"
Measured against: list Part 2: "The elimination table: row E7's "corner unit groups""; M1-W015: "the unit group of $\R\oplus\R u$ be compact for every $u\neq0$ of $\mathcal{A}$ with $u^{*}=-u$".
Reason: "corner" unit groups, where the confirmed proof of the proposition cited speaks of every such line and not of corners. Doubt: only Part 2 (the index) names this row; no item of Part 1 does.

# Register items still standing that fit none of the three kinds

- **32(a) / Part 2 "ll.661 …".** L695: "If a $\Spinc$ structure selects one unit $i$, its stabiliser is $U(1)$ and the orbit of $i$ is $\mathrm{Sp}(1)/U(1)=\Stwo$." M1-W035 says the rewording of canon l.661 is "for the build"; no confirmed sentence replaces it. Also L727, "A3's selected unit", unchanged.
- **32(i).** L555: "The points $P_{2},P_{3},P_{4}$ are fixed by $\iota$ and permuted by $M_{0}$; the local form of $\iota$ at such a point is the inner automorphism by the surviving unit, and its fixed subalgebra is the corresponding complex line." L562: "The reading in the statement, that the local form of $\iota$ is conjugation at the drive-fixed corner and the inner automorphism by the surviving unit at the three cycled corners, is the one place in this section where the proposition is \rigD\ rather than \rigR." The statement (M1-W029, L547) keeps "$\iota$ acting as conjugation"; Part 2 records this as changed by no ruling.
- **32(j).** L557: "The drive carries the lines with the points: $\Ad_{w}$ sends $i\mapsto j\mapsto k\mapsto i$ (certificate \texttt{L2\_Ad\_w\_cycles}, with $(2w)^{3}=-8$ giving order three, \texttt{L2\_w\_cubed}), so $\Ad_{w}\Ad_{i}\Ad_{w}^{-1}=\Ad_{j}$ and $\C_{i}\mapsto\C_{j}\mapsto\C_{k}$ exactly as $P_{2}\to P_{3}\to P_{4}$." against L604 ("algebras $\C_{j},\C_{i},\C_{k}$") and Appendix B, L1111 ("$P_{3}=C_{i}$ … $P_{2}=C_{j}$ … $P_{4}=C_{k}$"; "The assignment of $j$ and $k$ between $P_{2}$ and $P_{3}$").
- **32(k), second half.** L166: "The internal piece of a geometry satisfying the other four axioms is more than a point: Theorem~\ref{thm:dim} shows that it has dimension at least eight."
- **32(l).** L369: "The theorem asserts that any $A\in\mathrm{SL}_{2}(\Z)$ of trace three is $SM_{0}S^{-1}$ for some $S$." against L377: "In each case $\det S=1$ and $SAS^{-1}=M_{0}$; …".
- **32(n), names used for two things.** "$F$": the internal piece (L150) and what sits over the base (L202 "the fibres of $F$", L209 "$F$ sits over a compact piece", L287). "The time factor": L55, L320 ("the time factor of a minimal geometry is the Sol torus bundle"), L879, against the one-dimensional $T$ of L150. "$M$": the manifold (L148) and the matrix (L287 onward). Part 2, "ll.123–126, the torus twice in the display": L124–125 unchanged.
- **33(e).** L1028: "The three clauses of Definition~\ref{def:minimal} are readings of the sixth axiom and its words do not force them: a reader who does not take clause~(c) has dimension twelve, flux three and three steps as the least admissible values and not as the only ones, and a reader who allows relabellings that reverse orientation has the drive by clause~(c) alone." The list does not name the fibre (its dimension and handles, M1-W010). It is a list and not a count, so not put as kind 4.
- **33(h).** L116: "It enters through the drive, as the rate at which the gentlest possible everlasting change stretches what it acts on (Section~\ref{sec:drive})." against L926: "the stretch is $\phi^{2}$ and the entropy $2\log\phi$ per step".
- **34(b).** L127: "In words: time is a circle along which a two-dimensional internal fibre is stretched and squeezed by the Fibonacci drive; …" with the displays at L125 and L1005 (both still "$(\CPtwo\times\Stwo)\times_{w}(\Ttwo/\Ztwo)$"). The prose and the displays still pair different pieces; no confirmed sentence replaces either.
- **34(c), open.** No passage shows that $\Mtwelve$ meets all the definitions. L122, L1000, L1003 and L1028 stand; A2 is now shown (L631), and M1-W031 (L659) says of the quaternionic structure on the whole of $\Mtwelve$ "is assumed here and is not shown".
- **34(i).** L163: "The way lengths are measured may tie the pieces together, and the second axiom will insist that it does; and the internal piece may be carried round time by a map of itself, as Section~\ref{sec:drive} finds."
- **35(a), "unique".** Still at L55 ("they force a unique geometry"), L122 ("The result is that the six axioms force a unique geometry:"), L1003 ("is unique and is") and L1028 ("asserts uniqueness among minimal realisations"). Definition~\ref{def:same} now defines the word; no confirmed sentence replaces these uses.
- **Part 2, "l.209".** L209 ("$\mathcal{A}$ is finite-dimensional … $\mathcal{A}$ is associative") and L485 ("By Definition~\ref{def:fibrealg} $\mathcal{A}$ is finite-dimensional and associative.") do not say the algebra has a unit, which M1-W017 takes as a hypothesis.
- **Part 2, "ll.458, 471, 546–552" (M1-W017: "are reworded with it").** L491: "The alternative that compactness excludes is the split algebra $M_{2}(\R)$, which carries the same $\pm1,\pm i,\pm j,\pm k$ pattern with non-compact unit groups on two of its three imaginary lines." L572–578, of which L578: "A1 excludes the second picture at every corner, and with it every zero-divisor." No removed word is in them; "at every corner" at L578 comes after the corners are counted, so it is outside 33(f).
- **Part 2, "ll.507–513".** L533 ("An involution of a surface with isolated fixed points is a half-turn near each of them, so it preserves orientation."), L535 ("For the torus the quotient $Q$ is then an orbifold …") and L537 ("Inversion of $T^{n}$ has $2^{n}$ fixed points …") remain in the proof after M1-W013, M1-W003 and M1-W008. No entry says it replaces them and none contradicts them; M1-W040 rests on the certificate named at L537.
- **Part 2, "l.681".** L715: "the maximal torus of $U(3)$ fixes exactly these".
- **Part 2, "ll.615, 943".** L645: "the block has dimension four, that of $\Hquat^{\times}=\R_{>0}\times S^{3}$"; L977: "the block is modelled on $\Hquat^{\times}=\R_{>0}\times S^{3}$".
- **Part 2, "l.295".** L315: "This is an input and not a selection: …". It calls the positive trace "an input", where L1003 (M1-W028) and L1000 speak of "one declared input"; I could not decide whether that is a contradiction.
- **Part 2, "l.992 … among products only".** L1028: "… will not obtain Propositions~\ref{prop:S2} and~\ref{prop:CP2}, and the base is then determined among products only." Left as canon, as the list directs.
- **Part 2, Franks in Appendix A and the bibliography.** L1075 ("Classical theorems (Franks, Frobenius, …)"), L1116 (`Franks1970`), L1117 (`FranksNewhouse`). In the pass Franks is cited only at L531 and L539 (findings 18, 19); `FranksNewhouse` is cited nowhere.
- **Part 2, the places that count the choices, where the number is still right.** L211 ("these are the fifth and sixth choices"), L225 ("That is the sixth choice") and L249 ("the seventh, eighth and ninth choices of this paper") agree with the marks of M1-W016 and M1-W021 and with "the tenth choice". The theorem's list at L1003 ("under the readings of Definitions~\ref{def:A5}, \ref{def:A1}, \ref{def:A2}(i), \ref{def:levels} and~\ref{def:orbits}") does not name the tenth choice; it is a list and not a count.
- **Part 2, "The integer two on S²".** L1007, the theorem's list of discrete data, gives no value on $\Stwo$, while L1000 says the conclusion "names every factor and every discrete datum". The list says a composed sentence is owed (P159). "Even" at L741 and L972 agrees with M1-W036.
- **Part 2, lines that say "state" or "state at rest", read with M1-W024 and M1-W023.** L161, L762, L765, L771, L775, L777, L799, L807, L811, L817, L819, L827, L842, L1062, L1085: none is contradicted. The phrase "state of the fibre at rest" no longer occurs. The bare word "state(s)" (L765(a), L771, L775, L777, L807, L811, L817, L819, L827, L842) is now defined nowhere: M1-W024 defines "state at rest" and "state on the pillowcase" only. This is not within 33(n), which removed the name "state of the fibre at rest". L161 still says "state at rest" is made exact in Definition~\ref{def:states}, which holds by M1-W024, the pillowcase reading being carried by M1-W023 (L759).
- **Part 2, terms.** "norm form" (L468, lemma title) is not defined; "anti-involution" and "unit group of $\R\oplus\R u$" are now defined inside M1-W017 (L469).

# Items of the list found already met

- 32(c), 33(c): M1-W009, M1-W004, M1-W001, M1-W005 stand at L289–295 after the paragraph of canon l.277.
- 32(d), 33(d): the opening of Definition 3.2 is M1-W012 (L264) and clause (c) is M1-W010 (L270). The remaining line is finding 10.
- 32(e), 33(i): Definition 2.8 is M1-W021 (L222).
- 32(f), 33(f): Lemma 5.1 is M1-W017 (L469); the proof step of Proposition 5.2 is M1-W015 (L487). "Corner subalgebra" is gone. The remaining lines are findings 14–16.
- 32(g), 34(h), 36(a), 36(b): table rows at L1039, L1040, L1045, L1046 (M1-W037, 038, 040, 041, each \rigD), L1048 (M1-W043), L1049 (M1-W030).
- 36(c): the row "trace $\geq4$" keeps \rigR\ (L1043).
- 32(h): Theorem 4.2 (L320) and Proposition 4.5 (L429) are as canon, with \rigR; nothing to do.
- 32(m), 33(n), 33(o): Definition 7.4's two paragraphs are M1-W024 (L753) and M1-W023 (L759); Proposition 7.6 (L797) is unchanged.
- 32(o), 33(g): Definition 2.7 is M1-W016 (L214); "Clifford" does not occur.
- 33(a): Definition 2.9 is M1-W006 (L234); M1-W007 is at L310. The remaining lines are findings 7, 11, 12.
- 33(b): M1-W013, M1-W003, M1-W008 stand in the proof (L525–529). The remaining lines are findings 17–19.
- 33(j): Proposition 7.2 is M1-W019 (L711); "Hermitian" does not occur, and "phase" occurs only inside M1-W019.
- 33(l): M1-W020 stands at L989 after "Propositions … supply the factors." (L987).
- 34(a): Definition 2.4 is M1-W025 (L190). The words "at least one product in~\eqref{eq:family}" are in the confirmed sentence itself.
- 34(c), in part: A2 is shown at L631 (M1-W026); M1-W031 is at L659.
- 34(d): Definition 3.1 is M1-W027 (L260); "functional" does not occur. The remaining line is finding 27.
- 34(e): the theorem's clause is M1-W028 (L1003); "sector" does not occur. The remaining lines are findings 9, 26, 27.
- 34(g): the statement of Proposition 5.6 is M1-W029 (L547). The remaining lines are findings 20–22.
- 35(a): Definition~\ref{def:same} (M1-W032) stands after Definition 3.2 (L275–277).
- 35(b): M1-W034 stands at L280. The remaining line is finding 13.
- The tenth choice: M1-W035 stands at L219.
- The integer two on $\Stwo$: M1-W036 stands at L746.
- Part 2, "ll.661, 677": "the $\Spinc$ line of Proposition 7.3 below" no longer occurs.

# Other

- The date line, L49 (before `\begin{document}`, printed by `\maketitle`), reads "11 November 2026 (v6.3)"; the header comments at L3–4 also say v6.3.
- L187 has "and so $w=w_{0}e^{\kappa s}$", where M1-W025's "Rests on" says "$w_{0}$ leaves" of Definition 2.4; the entry names l.190 only, so I could not decide whether the ruling reaches L187.
- L225 says the symmetry group of the quaternions is "the rotations of the three imaginary units", where M1-W021 defines a symmetry as a length-keeping real-linear or complex-linear map; M1-W021 itself cites this line as a ground, so I did not put it as kind 2.
- L287 says the drive acts "by its return map" with "One application of this map is a \emph{step}", where M1-W009 (L289) says the map round time is "a whole number of applications of one map, the step"; whether "return map" names the step or the map once round I could not decide.
- L412 ("the least everlasting change that the axioms allow is the Fibonacci recursion applied twice, and $\phi$ is its growth rate") may be a second place of the wording of 33(h); the list does not name it.
- L455 and L1028 speak of "relabellings that reverse (the) orientation", where the relabelling of Definition~\ref{def:same} keeps the handedness of the internal piece; the mark of M1-W032 notes this and says it was not acted on.
- L462, first clause, says the corners and their algebras "are each carried to themselves … by the reversal of the drive", where M1-W034 says "that it carries every datum of $\Mtwelve$ to itself is not shown here"; a particular claim against a general "not shown", which I could not decide.
- Two confirmed sentences use one letter for two things: M1-W001 (L293) has "The Fibonacci matrix $F$", and M1-W004 (L291), M1-W010, M1-W013 have "the fibre of $F$" for the internal piece (compare 32(n)).
- Part 2 names "the "Where" columns of rows E8 and E9"; in the pass these rows are the confirmed sentences M1-W040 and M1-W041 (L1045, L1046), so nothing is reported against them.
- The headings of the two new environments, "mirror image and run backwards" (L279) and "the geometry satisfies A2" (L630), with their labels, are in no entry; they are titles and not sentences, and are noted only.
- Part 2's item on the mark of M1-W006 and on the Definitions Register concern files other than the pass and were not checked.