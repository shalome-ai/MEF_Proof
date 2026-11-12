#!/usr/bin/env python3
"""Gate 8 (CLAUDE.md s.8, s.10): every ACTIVE statement of a paper's write-up log
appears in the paper word for word (white space apart).

usage: python3 tools/writelog_check.py Mx path/to/paper.tex
Reads papers/Mx/WRITE_LOG.md.  An entry is a line '### <id> · active|retired'
(not indented) followed by the first fenced ```tex block, which is its statement.
"""
import re, sys
def norm(s): return re.sub(r"\s+", " ", s).strip()
def entries(text):
    out, cur, in_block, buf = [], None, False, []
    for line in text.split("\n"):
        m = re.match(r"^### (\S+) · (active|retired)\s*$", line)
        if m and not in_block:
            cur = [m.group(1), m.group(2), None]; out.append(cur); continue
        if cur is not None and cur[2] is None:
            if not in_block and line.strip() == "```tex": in_block, buf = True, []; continue
            if in_block and line.strip() == "```": in_block = False; cur[2] = "\n".join(buf); continue
            if in_block: buf.append(line)
    return out
def main():
    if len(sys.argv) != 3: sys.exit(__doc__)
    paper, tex = sys.argv[1], norm(open(sys.argv[2], encoding="utf-8").read())
    es = entries(open(f"papers/{paper}/WRITE_LOG.md", encoding="utf-8").read())
    active = [e for e in es if e[1] == "active"]
    bad = 0
    for eid, _, st in active:
        if st is None or not norm(st): print(f"{eid}: NO STATEMENT BLOCK"); bad += 1
        elif norm(st) not in tex: print(f"{eid}: NOT IN THE PAPER WORD FOR WORD"); bad += 1
    print(f"{len(active)} active, {len(es) - len(active)} retired; {bad} failing")
    sys.exit(1 if bad else 0)
if __name__ == "__main__": main()
