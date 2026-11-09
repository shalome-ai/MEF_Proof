# HANDOVER — 9 November 2026 (first Claude Code session; current paper M3)

## What was built
- **M2-9 settled and recorded.** The modulus squared stands, Φ_QC = ω|ψ−ψ̄|² (Decision Log P12; Corpus Errors 19). The exchange is kept verbatim in `registers/records/2026-11-09_M2-9_modulus_squared.md`. `MEFProof/Paper_M2/M2_L6_omega.lean` replaced by the modulus-form certificate and rebuilt (Lake 529 ms; standalone core Lean clean). Future-Mx F-4 entered on the PI's word (lead for M13).
- **Registers.** Synced to the M2 chat's state; from now on edited only in this repository (P13; CLAUDE.md §6). Stale `Minimality_Register_v1.md` removed.
- **Housekeeping (P14).** Per-paper SOWs at `sow/M2/SOW_DAG.md`, `sow/M3/SOW_DAG.md`; `canon/omega-definition-usage_v2.md` moved from `sources/`; series SOW status column, vocabulary and open items brought current; M3 SOW state OPEN; CLAUDE.md §§3, 6, 7, 8 updated.
- **Canon in git (P15).** `canon/` and `papers/` `.tex`/`.pdf` now tracked; `canon/M1/` and `canon/M2/` committed, including M2's body files (verified as the frozen set) and M2's original PDF (restored from the PI's copy and checked against a rebuild: 30 pages, identical text, no rendered differences).
- **Gates.** `tools/gates.py` and `tools/README.md` implement CLAUDE.md §8, with gate 2 as ruled in P15. Results on the frozen papers, accepted as they stand (P15):

| Gate | M1 | M2 |
|---|---|---|
| 1 XeLaTeX | PASS (26 pp., matches stored PDF) | PASS (30 pp., matches stored PDF) |
| 2 overfull / margin | known finding: 0 overfull; Lean listing frames 4.6 pt into the right margin (pp. 17–25) | known finding: 0 overfull; listing frames 4.6 pt right (pp. 19–28) |
| 3 lint | known findings, kept: l.562 "coherence field"; l.58 "I" voice (×2); l.139 "toward" | PASS |
| 4 Lean | PASS (5 files, 49 theorems) | PASS (7 files, 54 declarations; 55 recorded per P14(b)) |
| 5 names | PASS (39 cited) | PASS (24 cited; 3 cross-references to M1) |

- **Commits:** `5e9d328` (M2-9 sync), `8627bee` (housekeeping), `abf3e2c` (gates), and the commit carrying this file (canon tracked; P15). Pushed to `origin/main` at the end of the session.

- **`canon/MEF_Academic_Register_Guide.md`** (CLAUDE.md §9) added by the PI and committed.

## What is open
1. **Next session: M3 WP0, the inventory** (PI to start it in a new session from this file). Read order per CLAUDE.md §0: `CLAUDE.md` → `sow/Mx_Series_SOW.md` → `sow/M3/SOW_DAG.md` → `registers/Decision_Log.md` (latest: P12–P15) → this file. WP0 is mechanical (no ruling), per `sow/M3/SOW_DAG.md` §2:
   - **I.1** — transcribe the twenty axioms verbatim, with their Paper XX locations, into Appendix A of M3 as data, not citation: Σ at ll.335–545, 𝓜 at ll.639–770 of `sources/Paper_XX_New_Axioms_for_Old_Problems_v10.tex` (present locally, untracked).
   - **I.2** — for each axiom, list the M1/M2 results that touch it, by label, from `ledger/M-Derivation-Proof-Ledger.md`.
   - After WP0: the WP1–WP4 classifications are the architect's proposals from the M2 chat and are re-verified against the M1/M2 text, item by item, before the PI confirms and before any prose (M3 SOW §6).
2. The M3 template must set the Lean listing frames inside the text block (P15(b)) so that gate 2 passes.

## What needs a ruling
Nothing outstanding from this session.
