# HANDOVER — 9 November 2026 (first Claude Code session; current paper M3)

## What was built
- **M2-9 settled and recorded.** The modulus squared stands, Φ_QC = ω|ψ−ψ̄|² (Decision Log P12; Corpus Errors 19). The exchange is kept verbatim in `registers/records/2026-11-09_M2-9_modulus_squared.md`. `MEFProof/Paper_M2/M2_L6_omega.lean` replaced by the modulus-form certificate and rebuilt (Lake 529 ms; standalone core Lean clean). Future-Mx F-4 entered on the PI's word (lead for M13).
- **Registers.** Synced to the M2 chat's state; from now on edited only in this repository (P13; CLAUDE.md §6). Stale `Minimality_Register_v1.md` removed.
- **Housekeeping (P14).** Per-paper SOWs at `sow/M2/SOW_DAG.md`, `sow/M3/SOW_DAG.md`; `canon/omega-definition-usage_v2.md` moved from `sources/`; series SOW status column, vocabulary and open items brought current; M3 SOW state OPEN; CLAUDE.md §§3, 6, 7, 8 updated.
- **`canon/M2/` body files** placed by the PI and verified as the frozen set (modulus form throughout; all twelve labels the main file expects; L7 material). Local only: see Open 1.
- **Gates.** `tools/gates.py` and `tools/README.md` implement CLAUDE.md §8. Results on the frozen papers:

| Gate | M1 | M2 |
|---|---|---|
| 1 XeLaTeX | PASS (26 pp., matches stored PDF) | PASS (30 pp.) |
| 2 overfull / margin | FAIL: 0 overfull; listing frames 4.6 pt into the right margin (pp. 17–25); last-line subscripts 3.5–5.0 pt below the block | FAIL: 0 overfull; listing frames 4.6 pt right (pp. 19–28); last-line subscripts 3.0–3.5 pt below |
| 3 lint | FAIL: l.562 "coherence field"; l.58 "I" voice (×2); l.139 "toward" | PASS |
| 4 Lean | PASS (5 files, 49 theorems) | PASS (7 files, 54 declarations; 55 recorded per P14(b)) |
| 5 names | PASS (39 cited) | PASS (24 cited; 3 cross-references to M1) |

- **Commits:** `5e9d328` (M2-9 sync), `8627bee` (housekeeping), and the gates commit that carries this file. Not pushed.

## What is open
1. `.gitignore` l.12 ignores every `.tex` and `.pdf` ("Manuscripts — canonical home is Zenodo"): nothing in `canon/M1/` or `canon/M2/` except the Reading Map is in git; the canon exists only on this machine.
2. `canon/M2/Paper_M2_Master_Equation_v1.pdf` has been absent since the PI's 18:25 copy. A rebuild from the frozen sources (30 pp.) is at `build/gates/M2/`.
3. `canon/MEF_Academic_Register_Guide.md` (CLAUDE.md §9) is not in the repository.
4. M3 WP0 (inventory) not started.
5. The three commits are local; `origin/main` is at `ad2aefd`.

## What needs a ruling
1. Whether `canon/` (and `papers/`) `.tex`/`.pdf` are tracked in git (Open 1).
2. Gate 2's definition: are the Appendix A listing frames (4.6 pt) and last-line subscripts (3–5 pt) violations, or allowances to write into the gate?
3. M1's three lint findings (l.562, l.58, l.139): erratum to M1, or accepted as they stand.
4. M2's PDF: restore the original or adopt the rebuild (Open 2).
