# Formal verification suite — Supplementary Information

Companion to: "A gauge-independent mass gap for a class of Kaluza–Klein-reduced
theories from the two-torsion geometry of a torus quotient".

## Contents
Ten Lean 4 source files (Certificates 1–9 of Appendix A; Certificate 8 comprises
TransitParity.lean and its extension TransitParityExt.lean), plus the axiom-audit
driver output (axiom_audit_output.txt).

## Toolchain pins
- Lean 4, toolchain **4.15.0** (leanprover/lean4:v4.15.0)
- Mathlib, tag **v4.15.0**

## Compilation
Place the files in a directory `YML/` inside a Mathlib v4.15.0 checkout with its
build cache present (`lake exe cache get`), then, from the checkout root, compile
in dependency order:

    for m in Corners Gap Identification Transfer Scope BettiParity \
             OddDivisors TransitParity TransitParityExt Witness Audit; do
      lake env sh -c "LEAN_PATH=\"$LEAN_PATH:$PWD\" lean -o YML/$m.olean YML/$m.lean"
    done

Every file compiles with zero errors and contains no `sorry`. Compiling Audit.lean
re-runs the axiom audit and reproduces axiom_audit_output.txt.

## Axiom audit
`axiom_audit_output.txt` records `#print axioms` for the thirteen headline
declarations: each depends only on `propext`, `Classical.choice`, `Quot.sound`
(with `TransitParityExt.chi_gamma12` additionally choice-free).
