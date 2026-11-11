# tools/ — the paper gates (CLAUDE.md §8)

```bash
python3 tools/gates.py M3          # all five gates on paper M3
python3 tools/gates.py M3 3 4 5    # lint, Lean, names only (no TeX needed)
```

The paper is `papers/Mx/` if that folder holds a main `.tex`, otherwise `canon/Mx/`. Certificates are read from `MEFProof/Paper_Mx/`. Exit status is 0 only if every selected gate passes.

| Gate | Checks | Needs |
|---|---|---|
| 1 | XeLaTeX three passes; zero errors; zero undefined references; page count against the stored PDF if there is one | XeLaTeX |
| 2 | zero overfull boxes; no ink more than 1 mm into the side or top margins, or more than 2 mm below the text block (the last line's depth), except the footer page number; Lean listing frames count (Decision Log P15) | gate 1's build; PyMuPDF |
| 3 | forbidden ω names (`canon/omega-definition-usage_v2.md` §6a); "I" voice outside the acknowledgements; US spellings; hard-coded section numbers (a section of another Mx paper, e.g. "M1 §7", is allowed); `\cite` of an MEF corpus paper (keys in `sources/MEF-Bibliography.tex`, or a bibitem by Master that is not an Mx canon title); `!` in prose; bullets or boxes | — |
| 4 | `lake build` of the paper's certificates; no `sorry`, no `axiom` (comments ignored); no Mathlib import; each file compiles standalone on core Lean | elan / Lake |
| 5 | every `\texttt{Lx_...}` in the paper is a theorem in the paper's certificates; names found only in an earlier Mx paper's certificates pass as cross-references | — |

**XeLaTeX.** `$XELATEX` if set, else `xelatex` on the PATH, else the newest Windows TeX Live under `C:\texlive` (called from WSL). The build runs in a mirror of the repository layout (in the Windows `%TEMP%` for a Windows TeX), with the certificates placed both at `MEFProof/Paper_Mx/` and at `Mx_lean/` beside the `.tex`, so either appendix layout compiles. Nothing is written inside `canon/` or `papers/`. The log and PDF are copied to `build/gates/Mx/` (git-ignored).

**PyMuPDF.** `python3 -m pip install --user pymupdf`.

**Known results on the frozen papers (9 Nov 2026), accepted by the PI (P15).** M1 and M2 pass gates 1, 4, 5 (gate 1's page counts match the stored PDFs: 26 and 30). Gate 2 finds, in both, only the Lean listing frames of Appendix A, 4.6 pt into the right margin; they stay as frozen, and from M3 on the template sets the frames inside the text block. Gate 3 finds four items in M1, kept as they stand (l.562 "coherence field"; l.58 "I" voice ×2; l.139 "toward"), and none in M2.

## `redflags.py` — the red-flag scan (gate 7)

```bash
python3 tools/redflags.py <file> [lines]
```

Moved here from CLAUDE.md §2b.4 on 11 November 2026 (Decision Log P49, P50), word for word:

**Red-flag scan (a gate).** Every source is scanned with `python3 tools/redflags.py <file> [lines]` before it is used, and the hits at the steps consumed are entered in the step audit: "∝" or "up to normalisation" where a number appears; a key step that refers forward; "standard, taken as given" for something specific; a rigour label attached to a numerical test; agreement with a known target; a choice made after the answer is known. A hit proves nothing; it says where to look.
