#!/usr/bin/env bash
# Run gates on a working pass of the assembly protocol (HANDOVER_BUILD section 12):
# the pass stands in papers/Mx/ as the main .tex for the run and is removed afterwards.
#   tools/gates_on_pass.sh M1 papers/M1/build_v7/passA.tex [gate numbers]
set -u
pid="$1"; pass="$2"; shift 2
tmp="papers/$pid/_pass_under_test.tex"
cp "$pass" "$tmp"
python3 tools/gates.py "$pid" "$@"; rc=$?
rm -f "$tmp"
mkdir -p "build/gates/$pid/$(basename "$pass" .tex)"
cp build/gates/$pid/_pass_under_test.* "build/gates/$pid/$(basename "$pass" .tex)/" 2>/dev/null
exit $rc
