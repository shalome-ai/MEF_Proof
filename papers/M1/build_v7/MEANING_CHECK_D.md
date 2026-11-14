# Meaning check of Pass D against Pass C (M1 v7.0)

**14 November 2026.** `tools/Paper_assembly_protocol.md`, "Check D against C; Pass E". One fresh reader, given `passC.tex`, `passD.tex`, `CLAUDE.md` and the three rows of the protocol that say what Pass D may do, and no conclusion; not given `edits_D.py` or any list of the changes. Its report is below, whole and unedited.

**What was done with it (the architect, who wrote Pass D and does not judge it).** Each finding was checked against the two files and found to describe them correctly. Every item the reader marked MOVED or NOT SURE was put back from Pass C by copying (`edits_E.py`): items 2 and 3 (the reordering of the opening of Section 4 undone); item 15, and item 16 with it (the two paragraph breaks in the deflationary reading removed); item 11 (LINK 4 removed, LINK 5 renumbered 4). Kept in Pass E: the paragraph breaks at sentence ends in seven proof paragraphs, and four linking sentences. Line numbers in the report are of `passC.tex` and `passD.tex`.

---

# Check of Pass D against Pass C (M1 build v7)

Pass D does not mean quite what Pass C means in two places, and I could not decide two more. I found 16 differences: 12 SAME, 2 MOVED, 2 NOT SURE. No sentence of C is reworded, dropped or added in D apart from the five linking sentences. No formula, label, tag, citation or reference differs.

Files compared: `/home/dhiren/MEF_Proof/papers/M1/build_v7/passC.tex` (1174 lines) and `/home/dhiren/MEF_Proof/papers/M1/build_v7/passD.tex` (1247 lines).

## Differences, in the order of the paper

### 1. LINK 1 inserted — C: none (between 294 and 296); D 296–298. Section "The drive", before `\subsection{Hyperbolicity}`
D adds, as a paragraph of its own between the section heading and the first subsection heading:
> "This section takes up the drive, under three headings: hyperbolicity, the least drive and its uniqueness, and worked cases."

**SAME.** The three subsections of the section in D are "Hyperbolicity" (300), "The least drive and its uniqueness" (332) and "Worked cases" (386). Count and list are right, and nothing is asserted about the mathematics.

### 2. Two paragraphs moved in front of the paragraph that defines "step" — C 298–302; D 302–306. Subsection "Hyperbolicity", before Proposition `prop:hyp`
C order (298, 300, 302):
- P1: "Let the fibre of $F$ carrying the drive be a torus $\Ttwo=\R^{2}/\Z^{2}$; that it is one is proved in Section~\ref{sec:fibre} (Proposition~\ref{prop:surface}), and nothing in the present section is used there. The drive of A4 acts on $\Ttwo$ by its return map, an element $M\in\mathrm{SL}_{2}(\Z)$ with trace $t$. One application of this map is a \emph{step} of the drive. Whether one circuit of the time circle is one step or several is not assumed in this section; Corollary~\ref{cor:timecircle} settles it."
- P2: "Time is a circle, and the internal piece is carried round it by a map of itself. That map is a whole number of applications of one map, the step of the drive; how many is settled by Corollary~\ref{cor:timecircle}."
- P3: "The flow of Definition~\ref{def:A4} moves the fibre of $F$ that carries the drive and nothing else of the internal piece: on the rest of $F$ it is the identity. No axiom asks the drive to move more. This is a choice and is not derived."

D order: P2 (302), P3 (304), P1 (306).

**MOVED.**
- In C, "a \emph{step} of the drive" is defined in P1 as one application of the return map $M$ on $\Ttwo$, before P2 uses "the step of the drive".
- In D, P2's "one map, the step of the drive" is the first use in the section, and the defining sentence comes two paragraphs later.
- In D, P1's "its return map" and "this map" now follow P2's "a map of itself" and "That map" (the map once round the time circle), so a reader can take the return map to be that map. In C nothing precedes P1.
- P1's last sentence ("Whether one circuit … is not assumed") limits this but comes after.
- Line 161 of both files says the word "step" is "made exact where [it is] used, in Sections~\ref{sec:drive}…"; in D the use now precedes the making exact.
- P3's own "This" still points inside its own paragraph, and P3 uses nothing from P1; the movement is in P2 against P1.

### 3. Two paragraphs swapped — C 304–306; D 308–310. Same subsection, immediately before Proposition `prop:hyp`
C order (304, 306):
- P4: "A step of the drive keeps the handedness that Definition~\ref{def:levels} fixes on the internal piece: as a map of $\Ttwo=\R^{2}/\Z^{2}$ it preserves orientation, and its matrix $M$ has determinant $+1$, so that $M\in\mathrm{SL}_{2}(\Z)$. The Fibonacci matrix $F=\bigl(\begin{smallmatrix}1&1\\1&0\end{smallmatrix}\bigr)$ has determinant $-1$: it reverses the handedness and is not a step. Its square $M_{0}=F^{2}=\bigl(\begin{smallmatrix}2&1\\1&1\end{smallmatrix}\bigr)$ has determinant $(-1)^{2}=+1$ and is the least power of $F$ that is a step."
- P5: "The step of the drive is taken to be the linear map of its matrix: for $M\in\mathrm{SL}_{2}(\Z)$ it is the map $x\mapsto Mx \bmod \Z^{2}$ of $\Ttwo=\R^{2}/\Z^{2}$. Definition~\ref{def:A4} asks only for a smooth flow. That the step is the linear one is a choice and is not derived."

D order: P5 (308), P4 (310).

**NOT SURE.**
- In C, "its matrix $M$" is introduced in P4 for a step that is only "a map of $\Ttwo$" keeping the handedness; P5's "the linear map of its matrix" then refers back to it.
- In D, P5's "its matrix" is the first occurrence of "matrix" for the step in the section (P1 says only "an element $M\in\mathrm{SL}_{2}(\Z)$").
- In D, P4's "as a map of $\Ttwo$ it preserves orientation, and its matrix $M$ has determinant $+1$, so that $M\in\mathrm{SL}_{2}(\Z)$" is read after the choice that the step is linear, so it may appear to rest on that choice. In C it is stated before it.
- Both orders have $M\in\mathrm{SL}_{2}(\Z)$ already in P1, so I cannot say a reader would take a different mathematical content.

### 4. One paragraph split into three — C 321; D 325–329. Proof of Proposition `prop:hyp`, last paragraph
C, one paragraph; D, each sentence its own paragraph:
> "Let $M\in\mathrm{SL}_{2}(\Z)$ have trace $t$ with $\lvert t\rvert>2$." / "A point of $\Ttwo=\R^{2}/\Z^{2}$ is carried back to itself by some number $n\ge1$ of steps of $M$ if and only if both its coordinates are rational." / "No other point of the torus ever returns."

**SAME.** The hypothesis sentence still immediately precedes the statement, and "No other point" still immediately follows the sentence it qualifies; all three remain inside the same proof.

### 5. LINK 2 inserted — C: none (between 474 and 476); D 485–487. Section "The fibre", before its first subsection
> "This section takes up the fibre, under six headings: its algebra, the four corners, the surface, the collapse at the corners, worked cases, and the pillowcase."

**SAME.** The section in D has six subsections: "The fibre algebra is the quaternions" (489), "The four corners" (521), "The fibre is a surface, and a torus" (543), "The collapse at the corners" (607), "Worked cases" (629), "The pillowcase and its cones" (673). The list names them in order in shortened words and says nothing of what they conclude.

### 6. One paragraph split into two — C 498; D 510–512. Proof of Proposition `prop:H`
> "A1 requires every factor to close, and this is read as asking that the unit group of $\R\oplus\R u$ be compact for every $u\neq0$ of $\mathcal{A}$ with $u^{*}=-u$." / "By Lemma~\ref{lem:norm}, $N(a)>0$ for every $a\neq0$, and $a\cdot a^{*}/N(a)=a^{*}/N(a)\cdot a=1$: every non-zero element of $\mathcal{A}$ has an inverse, and $\mathcal{A}$ is a division algebra."

**SAME.** The second sentence still directly follows the sentence giving the compactness it uses through Lemma `lem:norm`. The other paragraphs of this proof were already one sentence each in C.

### 7. One paragraph split into ten — C 540; D 554–572. Proof of Proposition `prop:surface`, first paragraph
The ten sentences, unchanged and in the same order:
1. "Let the fibre $X$ of $F$ carrying the drive be a compact connected manifold without boundary, and let the fold $\iota$ be a continuous involution of $X$ with exactly four fixed points, each isolated."
2. "If $X$ has dimension zero it is a point, and $\iota$ has one fixed point."
3. "If $X$ has dimension one it is a circle."
4. "Suppose $\iota$ fixes a point $p$ of it."
5. "Then $\iota$ maps the open arc $X\setminus\{p\}$ to itself, one-to-one and continuously, and so is increasing or decreasing there."
6. "If it is increasing it is the identity, since $\iota(x)>x$ would give $x=\iota(\iota(x))>\iota(x)$ and $\iota(x)<x$ would give $x=\iota(\iota(x))<\iota(x)$; its fixed points are then not isolated, which the hypothesis excludes."
7. "If it is decreasing it fixes exactly one point of the arc, and $\iota$ has exactly two fixed points."
8. "So $\iota$ has no fixed point or exactly two, and not four."
9. "No such $X$ has dimension less than two, and the torus $\Ttwo$ with $z\mapsto-z$ is one of dimension two."
10. "Under clause~(c) of Definition~\ref{def:minimal} the fibre is a surface."

**SAME.** Each "it", "Then", "So" and "No such $X$" still follows the sentence it points to. What is lost is only the visible grouping of the proof into three stages (C 540, 542, 544); the proof's later paragraphs (C 546 onward) were already one sentence each.

### 8. One paragraph split into eight — C 542; D 574–588. Same proof, second paragraph
1. "Let $X$ be a compact connected surface without boundary that carries a handedness, and let $\iota$ be an involution of $X$ that keeps the handedness and has exactly four fixed points, each isolated."
2. "Then $X/\iota$ is a compact connected surface without boundary."
3. "Take a triangulation of $X/\iota$ having the images of the four fixed points among its vertices: every cell of it is the image of two cells of $X$, except those four vertices, each of which is the image of one."
4. "Hence $\chi(X)=2\chi(X/\iota)-4$."
5. "Since $\chi(X/\iota)\le2$, with equality only when $X/\iota$ is a sphere, $\chi(X)\le0$: $X$ is not a sphere, and $\chi(X)=0$ exactly when $X/\iota$ is a sphere."
6. "A compact connected surface without boundary that carries a handedness and has $\chi=0$ is the torus $\Ttwo$, which has one handle, and every other such surface with $\chi<0$ has more than one."
7. "The torus $\Ttwo=\R^{2}/\Z^{2}$ carries such an involution: $z\mapsto-z$ fixes exactly the four points with $2z\in\Z^{2}$."
8. "Under clause~(c) of Definition~\ref{def:minimal} the fibre is therefore the torus."

**SAME.** Order unchanged; "Then", "Hence", "such an involution" and "therefore" keep their antecedents in the immediately preceding sentences.

### 9. One paragraph split into four — C 544; D 590–596. Same proof, third paragraph
1. "The drive is a map of the folded fibre $\Ttwo/\iota$."
2. "A one-to-one continuous map $f$ of $\Ttwo$ that gives a map of $\Ttwo/\iota$ carries each pair $\{x,\iota x\}$ to such a pair, so that $f(\iota x)$ is $f(x)$ or $\iota f(x)$."
3. "Where $\iota x\neq x$ it is not $f(x)$, since $f$ is one-to-one, and so $f(\iota x)=\iota f(x)$."
4. "The fixed points of $\iota$ are isolated, and by continuity $f\iota=\iota f$ on the whole of $\Ttwo$: the drive commutes with the fold."

**SAME.** "it" in sentence 3 still points to $f(\iota x)$ in the sentence directly before.

### 10. LINK 3 inserted — C: none (between 642 and 644); D 697–699. Subsection "The pillowcase and its cones", before Proposition `prop:A2`
> "We return to the second axiom."

**SAME.** The proposition it introduces is "[the geometry satisfies A2]", and the second axiom was taken up earlier (subsection `sec:A2`, D 183; Proposition `prop:H`, "Under A1, A2 and A3"). The proposition stays in the same subsection and section as in C.

### 11. LINK 4 inserted — C: none (between 648 and 650); D 707–709. Section "Dimension twelve", before Theorem `thm:dim`
> "This section takes up the dimension: the theorem and its proof, a remark, and worked cases."

**NOT SURE.** The section in D holds Theorem `thm:dim` (711), its proof (715–731), Remark `rem:whereH` (733–735) and the subsection "Worked cases" (737). It also holds a second remark, `rem:split` (761–763), which lies inside "Worked cases". So "a remark" is right for what precedes the worked cases but the section contains two remark environments.

### 12. LINK 5 inserted — C: none (between 704 and 706); D 767–769. Section "The base", before its first subsection
> "This section takes up the base, under six headings: the sphere of imaginary units, the space of complex directions, the twist that is necessary, the twist of the fibre, worked cases, and the spatial factor."

**SAME.** The six subsections in D are "The sphere of imaginary units" (771), "The space of complex directions" (791), "The twist is necessary" (805), "The twist of the fibre" (827), "Worked cases" (1013), "The spatial factor" (1057). "the twist that is necessary" repeats the heading's own words as a noun phrase.

### 13. One paragraph split into two — C 752; D 816–818. Proof of Proposition `prop:spinc`
> "A $\Spinc$ structure therefore suffices." / "A larger structure group, such as that of a $\mathrm{Spin}^{h}$ structure, is not needed, and clause~(b) does not admit it."

**SAME.** "therefore" still follows the sentence ending "so $\Spinc$ exists and $c_{1}(L)$ is odd" (D 814), and "it" stays inside its own sentence.

### 14. One paragraph split into three — C 1006; D 1072–1076. Proof of Theorem `thm:base`
> "Definition~\ref{def:orbits} calls for two factors of the base, $\Stwo$ (Proposition~\ref{prop:S2}) and $\CPtwo$ (Proposition~\ref{prop:CP2}), of dimensions two and four." / "Clause~(b) of Definition~\ref{def:minimal} admits no further factor: it would be an object that A1--A5 do not require." / "The base is therefore $\CPtwo\times\Stwo$, of dimension six, the dimension that Remark~\ref{rem:split} leaves for it."

**SAME.** "no further factor" and "therefore" still directly follow the sentences they rest on.

### 15. Paragraph break added after the "deflationary reading" sentences — C 1053–1054; D 1123–1125. After the proof of Theorem `thm:main`
In C, line 1053 ends "…fails the first five axioms. " with a trailing space, and `% COMPOSED 8: begin` follows on the next line with no blank line. So the text from "The deflationary reading." down to "…is tagged \rigD." is one paragraph. In D a blank line (1124) follows the sentence:
> "The theorem asserts uniqueness among minimal realisations under the stated readings; it does not assert that a non-minimal geometry, one of dimension sixteen or with a lens-space spatial factor, fails the first five axioms."

A new paragraph then begins with the composed sentence:
> "That the continuous data of the geometry that this paper does not derive are held fixed is the one declared input of the theorem; it would fail if a continuous datum of the geometry that this paper does not derive were not held fixed, and the geometry would then not meet clause~(a)."

The trailing space is removed; nothing else changes.

**MOVED.** In C the run-in heading phrase "The deflationary reading." stands at the head of a single paragraph that also holds the declared-input sentence, "The overall size is not an input…", and the sentences on the three clauses and the readings. In D it heads only the four sentences on the fifth axiom, and the rest stands outside it. This is a break that changes what a heading phrase covers.

### 16. Paragraph break added after "…it has no meaning." — C 1057; D 1128–1130. Same place
C 1057 is one line, beginning with a space:
> " The overall size is not an input: under the sixth axiom it has no meaning. The three clauses of Definition~\ref{def:minimal} are readings of the sixth axiom and its words do not force them: a reader who does not take clause~(c) has dimension twelve,"

In D the leading space is gone, "The overall size is not an input: under the sixth axiom it has no meaning." ends a paragraph (1128), and "The three clauses of Definition~\ref{def:minimal} are readings of the sixth axiom and its words do not force them: a reader who does not take clause~(c) has dimension twelve," begins the next (1130).

**SAME** taken by itself. No pronoun crosses the break, and the `% COMPOSED 8` and `% COMPOSED 9` markers stay alone on their lines and paired. It does add a further division inside what C had under the one heading phrase of item 15.

## The linking sentences

| Link | D lines | Sentence | (a) No mathematics | (b) No claim of its own | (c) True of the text |
|---|---|---|---|---|---|
| 1 | 296–298 | "This section takes up the drive, under three headings: hyperbolicity, the least drive and its uniqueness, and worked cases." | Yes | Yes | Yes: three subsections, as listed |
| 2 | 485–487 | "This section takes up the fibre, under six headings: its algebra, the four corners, the surface, the collapse at the corners, worked cases, and the pillowcase." | Yes | Yes | Yes: six subsections, in this order; the names are shortened |
| 3 | 697–699 | "We return to the second axiom." | Yes | Yes; "return" says only that the axiom was taken up before, which it was | Yes: the next item is Proposition `prop:A2` |
| 4 | 707–709 | "This section takes up the dimension: the theorem and its proof, a remark, and worked cases." | Yes | Yes | Not sure: the section has two remarks, `rem:whereH` (733) and `rem:split` (761), the second inside "Worked cases" |
| 5 | 767–769 | "This section takes up the base, under six headings: the sphere of imaginary units, the space of complex directions, the twist that is necessary, the twist of the fibre, worked cases, and the spatial factor." | Yes | Yes | Yes: six subsections, in this order |

Markers, checked by script on both files:
- D has 10 `% LINK` lines, each alone on its line, in begin/end pairs numbered 1 to 5; C has none.
- Both files have 24 `% COMPOSED` lines, each alone on its line and paired.
- Each link is a paragraph of its own with a blank line on either side.

## Other

- Not a difference: line 244 of both files ends "(Definition~\ref{def:orbits})%" directly before `% COMPOSED 3: begin`. The `%` only comments out the line end, no words follow it, and the marker is alone on its own line.
- Noticed in passing, not pursued: in the paragraph at C 304 / D 310 the letter $F$ names "The Fibonacci matrix $F=\bigl(\begin{smallmatrix}1&1\\1&0\end{smallmatrix}\bigr)$", while elsewhere in the same subsection $F$ is the internal piece ("the fibre of $F$ carrying the drive", C 298 / D 306). This is the same in both files.
- Noticed in passing, not pursued: the last three sentences of the proof of Proposition `prop:hyp` (C 321 / D 325–329) concern which points return, whereas the proposition states "A4 holds for the return map $M$ if and only if $\lvert t\rvert>2$." This is the same in both files.
- Items 3 and 11 are the ones I could not decide.

## Counts

Differences found: 16. SAME: 12 (items 1, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 16). MOVED: 2 (items 2, 15). NOT SURE: 2 (items 3, 11).

## What I read

- **`CLAUDE.md`**: lines 1–97, from disk.
- **`tools/Paper_assembly_protocol.md`**: lines 37, 38 and 41 in full. A grep also showed me the first 200 characters of lines 39, 55, 64 and 66, which I did not use.
- **`passC.tex`**: lines 286–345, 472–546, 636–652, 700–708 and 1048–1060 (line 1053 seen in full through the diff), plus every C line in the full `diff` output.
- **`passD.tex`**: lines 242–248, 286–350, 478–606, 627–632, 664–770, 805–832, 1057–1136 and 1121–1131 with line ends shown. I also read a listing of every section, subsection, theorem-like environment, proof and marker line (58–1215), and grep extracts (lines cut short) for "step" and for positional words ("preceding", "above", "below", "next", "following").
- **Not read**: the remaining lines of both files. That they are identical between C and D rests on `diff`, which reported no other differing line.
- No other file was read and none was edited.
