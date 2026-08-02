#!/usr/bin/env bash
# MEF_Proof — remediation round 2: the failures found by the first real CI build.
# Run from the repository root. RB1_certificate is excluded (already fixed by hand).
#
# All six changes are Lean 4.15 -> 4.29 drift: renamed Mathlib modules and lemmas,
# missing imports, and tactics whose behaviour tightened.

set -euo pipefail
[ -f lakefile.toml ] || { echo "ERROR: run from the repository root."; exit 1; }
echo "==> MEF_Proof remediation, round 2"

python3 - <<'PY'
import re, sys

def edit(path, fn, label):
    s = open(path, encoding="utf-8").read()
    t = fn(s)
    if t == s:
        print(f"  !! NO CHANGE: {label} ({path}) -- check manually")
        return
    open(path, "w", encoding="utf-8").write(t)
    print(f"  ok  {label}")

def drop_ring_after_field_simp(s, lineno):
    """Delete the `ring` on 1-based `lineno`, which follows a field_simp that
    now closes the goal on its own."""
    L = s.split("\n")
    if L[lineno - 1].strip() != "ring":
        print(f"  !! line {lineno} is not `ring`: {L[lineno-1]!r}")
        return s
    del L[lineno - 1]
    return "\n".join(L)

# ---------------------------------------------------------------------------
# 1. Sec3_Z2_Involution: uses ![...] vector notation and fin_cases but imports
#    neither. Without VecNotation, Lean read ![P1,P2,P3,P4] as a plain List.
# ---------------------------------------------------------------------------
edit("MEFProof/Paper_3/Sec3_Z2_Involution.lean",
     lambda s: s.replace(
        "import Mathlib.Data.Real.Basic\nimport Mathlib.Tactic.Linarith",
        "import Mathlib.Data.Real.Basic\nimport Mathlib.Tactic.Linarith\n"
        "import Mathlib.Data.Fin.VecNotation\nimport Mathlib.Tactic.FinCases"),
     "Sec3_Z2_Involution: add VecNotation + FinCases imports")

# ---------------------------------------------------------------------------
# 2. AddCircle was split into a directory; coe_eq_zero_iff now lives in Defs.
#    This single import broke YM_L2, YM_C1, YM_P2 and the library root too.
# ---------------------------------------------------------------------------
edit("MEFProof/Paper_YM_Foundation/YM_L1_corner_distinctness.lean",
     lambda s: s.replace(
        "import Mathlib.Topology.Instances.AddCircle\n",
        "import Mathlib.Topology.Instances.AddCircle.Defs\n"),
     "YM_L1: AddCircle -> AddCircle.Defs")

# ---------------------------------------------------------------------------
# 3. div_le_iff was renamed div_le_iff0, and field_simp now closes the goal
#    that the following `ring` was there to finish.
# ---------------------------------------------------------------------------
edit("MEFProof/Paper_5/GBH4_evaluation_core.lean",
     lambda s: drop_ring_after_field_simp(s, 85).replace(
        "div_le_iff hR", "div_le_iff\u2080 hR"),
     "GBH4_evaluation_core: div_le_iff -> div_le_iff0; drop redundant ring")

edit("MEFProof/Paper_5/GBH4_N2b_ground_sector.lean",
     lambda s: drop_ring_after_field_simp(
                 drop_ring_after_field_simp(s, 101), 79),
     "GBH4_N2b_ground_sector: drop two redundant ring calls")

# ---------------------------------------------------------------------------
# 4. `unfold` now fails if a named constant is absent from the goal. Each goal
#    here mentions only one of step0..step3. `simp only` tolerates absentees.
# ---------------------------------------------------------------------------
edit("MEFProof/Paper_U_Uniqueness_Discriminant_Topology/RB_retraction_certificate.lean",
     lambda s: s.replace(
        "unfold step0 step1 step2 step3",
        "simp only [step0, step1, step2, step3]"),
     "RB_retraction_certificate: unfold -> simp only (6 sites)")

# ---------------------------------------------------------------------------
# 5. Complex.abs is gone; the norm is written directly. normSq_eq_abs is now
#    normSq_eq_norm_sq (Mathlib/Analysis/Complex/Norm.lean:148).
# ---------------------------------------------------------------------------
edit("MEFProof/CFM_Mechanism/CFM_Certificates.lean",
     lambda s: s.replace("(hz : Complex.abs z = 1)", "(hz : \u2016z\u2016 = 1)")
                .replace("Complex.normSq_eq_abs", "Complex.normSq_eq_norm_sq"),
     "CFM_Certificates: Complex.abs -> norm; normSq_eq_abs -> normSq_eq_norm_sq")
PY

echo
echo "==> Review, then commit:"
echo "    git diff --stat"
echo "    git add -A && git commit -m 'Fix Mathlib 4.29 drift: renamed modules and lemmas, missing imports, tightened tactics'"
echo "    git push"
