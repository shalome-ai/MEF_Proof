# How an Mx paper is written and set

Moved here from CLAUDE.md §9 on 11 November 2026 (Decision Log P49, P50), word for word. The general style guide is `canon/MEF_Academic_Register_Guide.md`; this file holds what is specific to the Mx series.

## Content and register

Per `canon/MEF_Academic_Register_Guide.md`: title a descriptive noun phrase; abstract setting → results → applications → strongest consequence, 100–200 words, no adjectives of praise; §1 opens "The purpose of this paper is…", states results, closes with the organisation map; plain-English opening readable by a first-year student, then the formal register (Hori–Tong connective tissue; Bruinier–Funke for theorem/proof); every load-bearing link derived or reduced to a cited result or a stated reading; a second route where one exists; the smallest case by hand; Lean certificates in an appendix with the build record and the files verbatim; Appendix B the cumulative symbol table of M1…M(x−1) extended; the AI statement exactly once in the acknowledgements in the mandated wording; `mef_macros.tex` inputted, no local symbol redefinitions. The deflationary reading stated where it belongs.

## Layout

**Layout (PI, 10 November 2026, on reading M1 v4.1: "the layout is much better - include that as part of the briefing for subsequent papers").** Every paper of the series is set as M1 v4.1 is:
- line spacing 1.2 throughout (`\linespread{1.2}`), with a small space between paragraphs (`\parskip` 3pt); Lean listings keep single spacing;
- **in every proof and every worked case, each step starts on its own line**: a new line at each sentence end, never inside mathematics; proof steps are set flush left with a 5pt gap between them (`\AtBeginEnvironment{proof}`);
- `\emergencystretch` 4em so that certificate names in `\texttt` do not run into the margin (gate 2 still applies);
- dense proofs written as one paragraph are not acceptable: if a proof has more than one step, the steps are visibly separate.
The preamble lines and the sentence-splitting pass are in `tools/m1_build_v4.py` (the block headed "typesetting"); reuse them, or the template built from them, for M2 onward.
