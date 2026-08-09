# Formal verification suite — Supplementary Information

Companion to: "A gauge-independent mass gap for a class of Kaluza–Klein-reduced
theories from the two-torsion geometry of a torus quotient".

## Contents
Ten Lean 4 source files (Certificates 1–9 of Appendix A; Certificate 8 comprises
TransitParity.lean and its extension TransitParityExt.lean), the audit driver
(Audit.lean), the axiom-audit driver output (axiom_audit_output.txt), and the
toolchain pin files (lean-toolchain, lakefile.toml, lake-manifest.json).

## Toolchain pins
- Lean 4, toolchain **4.29.1** (leanprover/lean4:v4.29.1)
- Mathlib, tag **v4.29.1** (commit 5e932f97dd25535344f80f9dd8da3aab83df0fe6)

## Compilation
Create a Lake package containing the supplied lakefile.toml, lean-toolchain and
lake-manifest.json, place the Lean sources in a subdirectory `YML/`, fetch the
Mathlib build cache, and build the audit driver, which compiles the full suite
in dependency order:

    lake exe cache get
    lake build YML.Audit

Every file compiles with zero errors and contains no `sorry`. Compiling Audit.lean
re-runs the axiom audit and reproduces axiom_audit_output.txt.

## Axiom audit
`axiom_audit_output.txt` records `#print axioms` for the thirteen headline
declarations: each depends only on `propext`, `Classical.choice`, `Quot.sound`.
