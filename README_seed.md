# Seed for MEF_Proof (9 Nov 2026)

Drop these into the repository root:
- `CLAUDE.md`
- `sow/Mx_Series_SOW.md`, `sow/M3_SOW_DAG.md`
- `ledger/M-Derivation-Proof-Ledger.md`
- `registers/Decision_Log.md`, `registers/Minimality_Register.md`, `registers/Corpus_Errors_and_Future_Mx_delta.md`

Then:
- `canon/M1/` ← Paper_M1_Four_Axioms_v2.tex (+ its fragments if any) ; `lean/Paper_M1/` already present.
- `canon/M2/` ← contents of `Paper_M2_v1/` (main, fragments, AppB, mef_macros) once the PI freezes; `lean/Paper_M2/` ← `M2_lean/*.lean` (remove `M2_L2_reduction.lean` from the tree).
- Lean tree stays `MEFProof/` (see `lean_fix/DIRECTORY_STRUCTURE.md`); replace the root module with `lean_fix/MEFProof.lean`; `lakefile.toml` unchanged.
- `tools/`: lint (forbidden ω names, "I " voice, US spellings, hard-coded Section~N, MEF-paper cites), margin scan (pymupdf), overfull count, `lake build` + sorry/axiom grep. Claude Code writes these in the first session from the specification in CLAUDE.md §8.
