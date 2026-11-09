# tools/ — the paper gates (CLAUDE.md §8)

```bash
python3 tools/gates.py M3          # all five gates on paper M3
python3 tools/gates.py M3 3 4 5    # lint, Lean, names only (no TeX needed)
```

The paper is `papers/Mx/` if that folder holds a main `.tex`, otherwise `canon/Mx/`. Certificates are read from `MEFProof/Paper_Mx/`. Exit status is 0 only if every selected gate passes.

| Gate | Checks | Needs |
|---|---|---|
| 1 | XeLaTeX three passes; zero errors; zero undefined references; page count against the stored PDF if there is one | XeLaTeX |
| 2 | zero overfull boxes; no ink more than 1 mm into the 25 mm margin except the footer page number | gate 1's build; PyMuPDF |
| 3 | forbidden ω names (`canon/omega-definition-usage_v2.md` §6a); "I" voice outside the acknowledgements; US spellings; hard-coded section numbers (a section of another Mx paper, e.g. "M1 §7", is allowed); `\cite` of an MEF corpus paper (keys in `sources/MEF-Bibliography.tex`, or a bibitem by Master that is not an Mx canon title); `!` in prose; bullets or boxes | — |
| 4 | `lake build` of the paper's certificates; no `sorry`, no `axiom` (comments ignored); no Mathlib import; each file compiles standalone on core Lean | elan / Lake |
| 5 | every `\texttt{Lx_...}` in the paper is a theorem in the paper's certificates; names found only in an earlier Mx paper's certificates pass as cross-references | — |

**XeLaTeX.** `$XELATEX` if set, else `xelatex` on the PATH, else the newest Windows TeX Live under `C:\texlive` (called from WSL). The build runs in a mirror of the repository layout (in the Windows `%TEMP%` for a Windows TeX), with the certificates placed both at `MEFProof/Paper_Mx/` and at `Mx_lean/` beside the `.tex`, so either appendix layout compiles. Nothing is written inside `canon/` or `papers/`. The log and PDF are copied to `build/gates/Mx/` (git-ignored).

**PyMuPDF.** `python3 -m pip install --user pymupdf`.

**Known results on the frozen papers (9 Nov 2026).** M1 and M2 pass gates 1, 4, 5. Gate 2 finds, in both, the Lean listing frames of Appendix A about 4.6 pt into the right margin (frame corners 3.5 pt below the block) and a few subscripts on a page's last line 3–5 pt below the block. Gate 3 finds four items in M1 (l.562 "coherence field"; l.58 "I" voice ×2; l.139 "toward") and none in M2.
