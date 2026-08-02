#!/usr/bin/env bash
# MEF_Proof — remediation for the empty library root and the defects it concealed.
# Run from the repository root (the directory containing lakefile.toml).
# Every step is verified locally under Lean 4.29.1 except the Mathlib-dependent
# certificates, which GitHub Actions will build.

set -euo pipefail
[ -f lakefile.toml ] || { echo "ERROR: run from the repository root."; exit 1; }
echo "==> MEF_Proof remediation"

# ---------------------------------------------------------------------------
# 1. Deprecated core lemma: Nat.pos_pow_of_pos was removed after Lean 4.15.
# ---------------------------------------------------------------------------
sed -i 's/exact Nat\.pos_pow_of_pos n (by decide)/exact Nat.pow_pos (by decide)/' \
  MEFProof/Paper_C_Equivalent_Dirac/C_C2_corner_count.lean
echo "  [1/6] C_C2_corner_count: Nat.pos_pow_of_pos -> Nat.pow_pos"

# ---------------------------------------------------------------------------
# 2. Imports pointing at a non-existent 'YML' library.
# ---------------------------------------------------------------------------
P=MEFProof.Paper_YM_Foundation
for f in MEFProof/Paper_YM_Foundation/YM_L2_positivity.lean \
         MEFProof/Paper_YM_Foundation/YM_C1_scope.lean \
         MEFProof/Paper_YM_Foundation/YM_P2_gauge_transfer.lean; do
  sed -i "s|^import YML\.YM_L1$|import ${P}.YM_L1_corner_distinctness|" "$f"
  sed -i "s|^import YML\.YM_L2$|import ${P}.YM_L2_positivity|"          "$f"
  sed -i "s|^import YML\.YM_P1$|import ${P}.YM_P1_identification|"      "$f"
done
echo "  [2/6] YM imports repointed to real module paths"

# ---------------------------------------------------------------------------
# 3. Namespace the two certificates that declared Pt, cross, dot, canon ...
#    at top level and therefore collided with each other.
# ---------------------------------------------------------------------------
python3 - <<'PY'
for path, ns, line in [
    ("MEFProof/Paper_YM_Foundation/GD_certificate.lean",        "YMGD", 27),
    ("MEFProof/Paper_YM_Foundation/O4_readout_certificate.lean","YMO4", 45)]:
    L = open(path, encoding="utf-8").read().split("\n")
    if any(l.startswith(f"namespace {ns}") for l in L):
        continue
    L.insert(line - 1, f"namespace {ns}\n")
    open(path, "w", encoding="utf-8").write(
        "\n".join(L).rstrip("\n") + f"\n\nend {ns}\n")
PY
echo "  [3/6] GD_certificate -> YMGD, O4_readout_certificate -> YMO4"

# ---------------------------------------------------------------------------
# 4. Per-paper namespaces on the island-rule duplicates (PI ruling).
#    Paper 3 and Paper 5 each keep their own copy; the namespaces now differ.
# ---------------------------------------------------------------------------
python3 - <<'PY'
import re
for paper, tag in [("Paper_3", "Paper3"), ("Paper_5", "Paper5")]:
    for fn, ns in [("A3_chain_core.lean", "A3ChainCore"),
                   ("Ca_constant_critical.lean", "CaConstantCritical")]:
        p = f"MEFProof/{paper}/{fn}"
        s = open(p, encoding="utf-8").read()
        s = re.sub(rf"^namespace {ns}\s*$", f"namespace {tag}.{ns}", s, flags=re.M)
        s = re.sub(rf"^end {ns}\s*$",       f"end {tag}.{ns}",       s, flags=re.M)
        open(p, "w", encoding="utf-8").write(s)
PY
echo "  [4/6] A3ChainCore / CaConstantCritical namespaced per paper"

# ---------------------------------------------------------------------------
# 5. Remove the duplicated directory and the superseded certificate.
#    Paper_Schwarzchild was byte-identical to Paper_GBH_Schwarzchild.
#    P2_L3_stability_v2 is a strict superset of v1.
# ---------------------------------------------------------------------------
git rm -r -q MEFProof/Paper_Schwarzchild
git rm    -q MEFProof/Paper_2/P2_L3_stability_v1.lean
git mv MEFProof/Paper_GBH_Schwarzchild MEFProof/Paper_GBH1_Schwarzschild
echo "  [5/6] duplicate directory and superseded v1 removed; spelling corrected"

# ---------------------------------------------------------------------------
# 6. The library root. Previously imported nothing, so `lake build` verified a
#    single stub theorem. Now imports every certificate.
# ---------------------------------------------------------------------------
python3 - <<'PY'
import os
mods = []
for root, _, files in os.walk("MEFProof"):
    for fn in sorted(files):
        if fn.endswith(".lean"):
            mods.append(os.path.join(root, fn)[:-5].replace(os.sep, "."))
mods.sort()
groups = {}
for m in mods:
    parts = m.split(".")
    groups.setdefault(parts[1] if len(parts) > 2 else "Root", []).append(m)
out = ["""/-!
# MEF_Proof — machine-checked certificates

This is the library root. It imports every certificate in the repository, so
that `lake build` compiles and verifies the whole collection. Each module is a
self-contained certificate; the grouping below follows the paper it supports.
-/
"""]
for g in ["Paper_1", "Paper_2", "Paper_3", "Paper_4", "Paper_5",
          "Paper_A_Hyperfinite_Quaternionic", "Paper_C_Equivalent_Dirac",
          "Paper_U_Uniqueness_Discriminant_Topology", "Paper_YM_Foundation",
          "Paper_GBH1_Schwarzschild", "Paper_Icosian_CFM", "CFM_Mechanism", "Root"]:
    if g not in groups:
        continue
    out.append(f"-- {g.replace('_', ' ')}")
    out += [f"import {m}" for m in groups[g]]
    out.append("")
open("MEFProof.lean", "w", encoding="utf-8").write("\n".join(out))
print(f"        {len(mods)} imports written to MEFProof.lean")
PY
echo "  [6/6] library root rebuilt"

echo
echo "==> Review, then commit:"
echo "    git add -A && git status --short"
echo "    git commit -m 'Fix library root to import all certificates; repair YML imports, deprecated lemma, and declaration collisions'"
echo "    git push"
