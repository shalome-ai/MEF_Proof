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

## Glossary

**Glossary (PI, 14 November 2026, Decision Log P173–P175).** The PI: "There has to be a definitions / naming/glossary section in this paper - this is where the corners are named and it becomes canonical.  Each Mx paper carries the Glossary from the Mx-1 paper, follows the same naming convention and then adds any new terms introduced by that Mx paper". Every paper of the series ends, before the bibliography, with the appendix "Names and glossary", as M1 v7.3 has it (Appendix B; it is the "cumulative symbol table" that "Content and register" above asks of Appendix B):
- first the names that are conventions of the series (in M1: the four corners, their positions and their algebras); they are canonical from the paper that fixes them, and a later paper does not rename them;
- then the terms: each entry is the term, the words of the paper that define it, copied as they stand, and the place where they stand. The entries are made by script from the body of the paper, each by exact match, so that the glossary cannot drift from the text (the model is `tools/m1_glossary_v7_3.py`);
- Mx carries the entries of M(x−1) unchanged, each citing M(x−1) as its place, and adds its own;
- **the discipline (PI, P177): "You define when it is first used, it goes into Glossary, that becomes canonical, any future reference refers to the Glossary. Glossary is carried forward to Mx+1 , new terms are added. There is no backwards revision".** Claude writes the definition at the first use of a term, as a sentence of the paper (an entry of the write-up log), and the glossary entry is made from it at once; the entries stand in the order of first use; an entry stands alone, a sentence after its brackets saying what a symbol in the quoted words stands for where that is needed; no entry is changed in a later version or a later paper. (The model is `tools/m1_glossary_v7_3.py`, a copy of the script that made M1 v7.3 from v7.2; it is kept in `tools/` so that a chat on a later paper may read it.)
