# Final check: Pass E against Pass C (M1 v7.0)

**14 November 2026.** `tools/Paper_assembly_protocol.md`, "Final check: E against C". By script: gate 8 (`python3 tools/writelog_check.py M1 papers/M1/build_v7/passE.tex`: 35 active, 8 retired; 0 failing) and the script of Pass D (`python3 tools/passD_check.py papers/M1/build_v7/passC.tex papers/M1/build_v7/passE.tex --moves`: 872 sentences in each, 12 composed sentences, 4 LINK blocks, order unchanged, PASS). By a second fresh reader, who had not seen Pass D or the first reader's report, given `passC.tex`, `passE.tex`, `CLAUDE.md` and the rows of the protocol, and no conclusion. The protocol asks for a reader "on whatever differs between D and E"; the reader was given the whole of E against C instead, which covers it. Its report is below, whole and unedited. **Verdict: 11 differences, 11 SAME, none MOVED, none NOT SURE; the second stop rule did not fire.** Line numbers are of `passC.tex` and `passE.tex`.

---

## Fresh reader's check: `passE.tex` against `passC.tex`

**Result: 11 differences found; 11 SAME, 0 MOVED, 0 NOT SURE.** The differences are four linking sentences and seven added paragraph breaks. Nothing is reordered, reworded, added or removed outside the four LINK blocks.

How the differences were found (CHECKED, not assumed):
- A full `diff` of the two files gives eleven hunks and no others.
- A read-only Python comparison removed the four `% LINK n` blocks from `passE.tex` and compared the two files token by token (split on whitespace): identical, 16,674 tokens. So every sentence, formula, label, tag, citation and reference of C is in E in the same order.
- Markers: `passE.tex` has LINK 1–4, each begin/end paired and alone on its line. The `% COMPOSED` marker lines number 24 in each file, paired, alone on their lines and unchanged. No changed line carries a `%` with text after it.

I did not judge whether the mathematics is true.

### Differences, in the order of the paper

**1. LINK 1 added.** C: between l.293 `\section{The drive}` and l.295 `\subsection{Hyperbolicity}`. E: l.296–298.
- Added: "This section takes up the drive, under three headings: hyperbolicity, the least drive and its uniqueness, and worked cases."
- **SAME.** It sits between the section heading and the first subsection heading, inside no environment. The subsections of the section in E are l.300 "Hyperbolicity", l.332 "The least drive and its uniqueness", l.386 "Worked cases": three, as listed. It does not disturb E l.302 "nothing in the present section is used there" or E l.334 "The content of the section is that there is one drive of trace three, and that at every larger trace there is more than one."

**2. Two paragraph breaks added, end of the proof of Proposition `prop:hyp`.** C l.321 (one paragraph); E l.325, 327, 329 (three).
- "Let $M\in\mathrm{SL}_{2}(\Z)$ have trace $t$ with $\lvert t\rvert>2$."
- "A point of $\Ttwo=\R^{2}/\Z^{2}$ is carried back to itself by some number $n\ge1$ of steps of $M$ if and only if both its coordinates are rational."
- "No other point of the torus ever returns."
- **SAME.** Order unchanged and still inside the same proof. "steps of $M$" names the $M$ of the sentence directly before, and "No other point" still follows directly on the sentence it qualifies. Every other step of this proof is already its own paragraph in C (C l.313–319).

**3. LINK 2 added.** C: between l.474 `\section{The fibre}` and l.476 `\subsection{The fibre algebra is the quaternions}`. E: l.485–487.
- Added: "This section takes up the fibre, under six headings: its algebra, the four corners, the surface, the collapse at the corners, worked cases, and the pillowcase."
- **SAME.** Outside any environment. The subsections in E are l.489 "The fibre algebra is the quaternions", l.521 "The four corners", l.543 "The fibre is a surface, and a torus", l.607 "The collapse at the corners", l.629 "Worked cases", l.673 "The pillowcase and its cones": six, in that order. The link names them in short form and does not repeat what the headings assert ("is the quaternions", "and a torus").

**4. One paragraph break added, proof of Proposition `prop:H`.** C l.498; E l.510 and 512.
- "A1 requires every factor to close, and this is read as asking that the unit group of $\R\oplus\R u$ be compact for every $u\neq0$ of $\mathcal{A}$ with $u^{*}=-u$."
- "By Lemma~\ref{lem:norm}, $N(a)>0$ for every $a\neq0$, and $a\cdot a^{*}/N(a)=a^{*}/N(a)\cdot a=1$: every non-zero element of $\mathcal{A}$ has an inverse, and $\mathcal{A}$ is a division algebra."
- **SAME.** The step "By Lemma~\ref{lem:norm}, $N(a)>0$" still follows directly on the sentence that supplies the compactness it rests on, in the same proof. The neighbouring steps (C l.496, 500, 502, 504) are each already separate paragraphs in C.

**5. Nine paragraph breaks added, first block of the proof of Proposition `prop:surface`.** C l.540 (one paragraph); E l.554–572 (ten paragraphs, one sentence each).
- "Let the fibre $X$ of $F$ carrying the drive be a compact connected manifold without boundary, and let the fold $\iota$ be a continuous involution of $X$ with exactly four fixed points, each isolated."
- "If $X$ has dimension zero it is a point, and $\iota$ has one fixed point."
- "If $X$ has dimension one it is a circle."
- "Suppose $\iota$ fixes a point $p$ of it."
- "Then $\iota$ maps the open arc $X\setminus\{p\}$ to itself, one-to-one and continuously, and so is increasing or decreasing there."
- "If it is increasing it is the identity, since $\iota(x)>x$ would give $x=\iota(\iota(x))>\iota(x)$ and $\iota(x)<x$ would give $x=\iota(\iota(x))<\iota(x)$; its fixed points are then not isolated, which the hypothesis excludes."
- "If it is decreasing it fixes exactly one point of the arc, and $\iota$ has exactly two fixed points."
- "So $\iota$ has no fixed point or exactly two, and not four."
- "No such $X$ has dimension less than two, and the torus $\Ttwo$ with $z\mapsto-z$ is one of dimension two."
- "Under clause~(c) of Definition~\ref{def:minimal} the fibre is a surface."
- **SAME.** This is the difference I weighed longest, because of the "Suppose …" / "Then …" pair and the dimension-one case. "of it" (the circle) and "Then … $X\setminus\{p\}$" each still follow directly on their antecedent, and the "Then" sentence names $p$, so it cannot read as unconditional. "So $\iota$ has no fixed point or exactly two" still follows the two "If it is …" sentences. In C the one paragraph also held the dimension-zero case and the conclusion, so the paragraph did not mark off the dimension-one case there either.
- Note: in C this was the first of three block paragraphs (C l.540, 542, 544). In E the three blocks are no longer marked by paragraphing. Each still opens with its own fresh start in words ("Let $X$ be a compact connected surface …", "The drive is a map of the folded fibre …"), and the rest of the same proof (C l.546 onward) was already one sentence to a paragraph in C.

**6. Seven paragraph breaks added, second block of the same proof.** C l.542; E l.574–588 (eight paragraphs).
- "Let $X$ be a compact connected surface without boundary that carries a handedness, and let $\iota$ be an involution of $X$ that keeps the handedness and has exactly four fixed points, each isolated."
- "Then $X/\iota$ is a compact connected surface without boundary."
- "Take a triangulation of $X/\iota$ having the images of the four fixed points among its vertices: every cell of it is the image of two cells of $X$, except those four vertices, each of which is the image of one."
- "Hence $\chi(X)=2\chi(X/\iota)-4$."
- "Since $\chi(X/\iota)\le2$, with equality only when $X/\iota$ is a sphere, $\chi(X)\le0$: $X$ is not a sphere, and $\chi(X)=0$ exactly when $X/\iota$ is a sphere."
- "A compact connected surface without boundary that carries a handedness and has $\chi=0$ is the torus $\Ttwo$, which has one handle, and every other such surface with $\chi<0$ has more than one."
- "The torus $\Ttwo=\R^{2}/\Z^{2}$ carries such an involution: $z\mapsto-z$ fixes exactly the four points with $2z\in\Z^{2}$."
- "Under clause~(c) of Definition~\ref{def:minimal} the fibre is therefore the torus."
- **SAME.** "Then", "Hence", "Since" and "therefore" each still follow directly on the sentence they rest on. "such an involution" points at the "Let $X$ …" sentence at the same distance in sentences as in C, with no other involution introduced between.

**7. Three paragraph breaks added, third block of the same proof.** C l.544; E l.590–596 (four paragraphs).
- "The drive is a map of the folded fibre $\Ttwo/\iota$."
- "A one-to-one continuous map $f$ of $\Ttwo$ that gives a map of $\Ttwo/\iota$ carries each pair $\{x,\iota x\}$ to such a pair, so that $f(\iota x)$ is $f(x)$ or $\iota f(x)$."
- "Where $\iota x\neq x$ it is not $f(x)$, since $f$ is one-to-one, and so $f(\iota x)=\iota f(x)$."
- "The fixed points of $\iota$ are isolated, and by continuity $f\iota=\iota f$ on the whole of $\Ttwo$: the drive commutes with the fold."
- **SAME.** The "it" of "Where $\iota x\neq x$ it is not $f(x)$" is the $f(\iota x)$ of the sentence directly before, now across a paragraph break but still adjacent. Nothing else in the paper refers to these sentences by position; E l.605 "the next proposition makes the reduction precise" lies after the proof and still precedes the same proposition.

**8. LINK 3 added.** C: between l.644 (paragraph beginning "The four cone points are the geometry of Proposition~\ref{prop:collapse}") and l.646 `\begin{proposition}[the geometry satisfies A2]`. E: l.697–699.
- Added: "We return to the second axiom."
- **SAME.** It stands outside the proposition, in the subsection "The pillowcase and its cones". The proposition it precedes is titled "the geometry satisfies A2" and ends "The geometry therefore satisfies A2. \rigD". The second axiom has been treated before (E l.86 `ax:A2`, l.183 subsection "Growth and decay", l.189 `def:A2`, l.504 "Under A1, A2 and A3 the fibre algebra is the quaternions."), so "return" is true.

**9. LINK 4 added.** C: between l.704 `\section{The base}` and l.706 `\subsection{The sphere of imaginary units}`. E: l.763–765.
- Added: "This section takes up the base, under six headings: the sphere of imaginary units, the space of complex directions, the twist that is necessary, the twist of the fibre, worked cases, and the spatial factor."
- **SAME.** The subsections in E are l.767 "The sphere of imaginary units", l.787 "The space of complex directions", l.801 "The twist is necessary", l.823 "The twist of the fibre", l.1009 "Worked cases", l.1053 "The spatial factor": six, in that order.
- Note: the link's "the twist that is necessary" is not the heading's words "The twist is necessary". It carries the same necessity that the heading and the proposition title "$\Spinc$ is forced" (E l.803) assert at that place, so I read no new claim in it.

**10. One paragraph break added, proof of Proposition `prop:spinc`.** C l.752; E l.812 and 814.
- "A $\Spinc$ structure therefore suffices."
- "A larger structure group, such as that of a $\mathrm{Spin}^{h}$ structure, is not needed, and clause~(b) does not admit it."
- **SAME.** "therefore" rests on the paragraph before (C l.750, E l.810), which was already a separate paragraph in C. "is not needed" still follows directly on "suffices".

**11. Two paragraph breaks added, proof of Theorem `thm:base`.** C l.1006; E l.1068, 1070, 1072.
- "Definition~\ref{def:orbits} calls for two factors of the base, $\Stwo$ (Proposition~\ref{prop:S2}) and $\CPtwo$ (Proposition~\ref{prop:CP2}), of dimensions two and four."
- "Clause~(b) of Definition~\ref{def:minimal} admits no further factor: it would be an object that A1--A5 do not require."
- "The base is therefore $\CPtwo\times\Stwo$, of dimension six, the dimension that Remark~\ref{rem:split} leaves for it."
- **SAME.** "no further factor" and "therefore" still follow directly on the sentences they rest on, and the "it" of the second sentence has its antecedent inside that sentence. The other steps of this proof are already separate paragraphs in C.

### The linking sentences

| Link | Sentence | (a) no mathematics | (b) no claim of its own | (c) true of the text |
|---|---|---|---|---|
| 1 (E l.297) | "This section takes up the drive, under three headings: hyperbolicity, the least drive and its uniqueness, and worked cases." | Yes: no TeX mathematics; "hyperbolicity" is the heading's word | Yes: it only lists headings | Yes: three subsections, l.300, 332, 386 |
| 2 (E l.486) | "This section takes up the fibre, under six headings: its algebra, the four corners, the surface, the collapse at the corners, worked cases, and the pillowcase." | Yes | Yes: short forms of the headings, without what they assert | Yes: six subsections, l.489, 521, 543, 607, 629, 673 |
| 3 (E l.698) | "We return to the second axiom." | Yes | Yes: says only what the next proposition's title says | Yes: the proposition is "the geometry satisfies A2", and A2 was treated earlier |
| 4 (E l.764) | "This section takes up the base, under six headings: the sphere of imaginary units, the space of complex directions, the twist that is necessary, the twist of the fibre, worked cases, and the spatial factor." | Yes | Yes, with the note under difference 9 on "the twist that is necessary" | Yes: six subsections, l.767, 787, 801, 823, 1009, 1053 |

### Other

Nothing I could not decide. Two things noticed in passing, identical in both texts and so not differences, not pursued:
- In the proof of `prop:hyp`, the last three sentences (C l.321, E l.325–329: "Let $M\in\mathrm{SL}_{2}(\Z)$ have trace $t$ with $\lvert t\rvert>2$. … No other point of the torus ever returns.") read as a statement placed inside a proof, with no argument given for it there.
- Proposition `prop:A2` (C l.646–648, E l.701–703, tagged \rigD) is followed directly by `\section{Dimension twelve}` with no proof environment.

### Counts
Differences found: 11 (4 linking sentences, 7 paragraph-break changes adding 25 breaks; 0 reorderings; 0 rewordings). SAME: 11. MOVED: 0. NOT SURE: 0.

### What I read
- `/home/dhiren/MEF_Proof/CLAUDE.md`: l.1–97, whole file.
- `/home/dhiren/MEF_Proof/tools/Paper_assembly_protocol.md`: l.37–41 only (the three table rows and the paragraph "A sentence that states mathematics").
- `/home/dhiren/MEF_Proof/papers/M1/build_v7/passE.tex`: read in full l.286–335, 478–600, 676–712, 755–820, 1050–1080. Also the `\section`/`\subsection` heading lines of the whole file, all marker lines, and the single lines returned by a grep for positional phrases ("this section", "above", "below", "next proposition", "last sentence", "A2" and the like), each cut at 220 characters. The rest of the file (l.1–285, 336–477, 601–675, 713–754, 821–1049, 1081–1240) was not read as prose; it is identical to C by the diff and the token comparison.
- `/home/dhiren/MEF_Proof/papers/M1/build_v7/passC.tex`: every changed line in full through the diff (l.321, 498, 540, 542, 544, 752, 1006); the lines round each change (l.293–297, 319–322, 474–479, 496–499, 536–546, 640–647, 704–709, 750–753, 1004–1007) cut at 160 characters; the whole file mechanically through the diff and the token comparison. Not read as prose beyond that.
- No other file was read; no file was edited.
