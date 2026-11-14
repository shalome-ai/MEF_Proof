#!/usr/bin/env python3
"""The script of Pass D (tools/Paper_assembly_protocol.md, "Pass D"): every sentence of the
measured pass (Pass C) stands unchanged in the later pass (Pass D or Pass E), and whatever the
later pass adds is a marked linking sentence with no mathematics in it.

usage: python3 tools/passD_check.py path/to/passC.tex path/to/passD.tex [--moves]

Stricter than the protocol's fence: EVERY sentence of the measured pass is checked, not only
those that state mathematics.  White space is ignored (as gate 8 ignores it), so a paragraph
break added or removed at a sentence end is not a change; anything else is.

Checks, each of which must pass (exit status 0 only if all do):
 1. the preamble (everything before \\begin{document}) is the same, comment lines apart;
 2. the sentences of the measured pass and of the later pass, with its LINK blocks taken out,
    are the same collection: none missing, none added, none altered, each as many times;
 3. the comment lines of the body are the same collection, the LINK markers apart
    (so every `% COMPOSED n: begin|end` marker is still there);
 4. the text between each pair of COMPOSED markers is the same;
 5. each LINK block is `% LINK n: begin` / text / `% LINK n: end`, the markers alone on their
    lines, numbered 1, 2, ... in order, and its text has no `$`, `\\(`, `\\[`, `\\begin`,
    `\\ref`, `\\eqref`, `\\cite` or `%` in it.
With --moves it also prints the sentences whose order changed, as a help to the reader of the
meaning check.  It does not judge meaning.
"""
import difflib, re, sys
from collections import Counter

LINK_B = re.compile(r"^% LINK (\d+): begin\s*$")
LINK_E = re.compile(r"^% LINK (\d+): end\s*$")
COMP = re.compile(r"^% COMPOSED (\d+): (begin|end)\s*$")
FORBIDDEN_IN_LINK = ["$", r"\(", r"\[", r"\begin", r"\ref", r"\eqref", r"\cite", "%"]


def norm(s):
    return re.sub(r"\s+", " ", s).strip()


def split_doc(text):
    i = text.index(r"\begin{document}")
    return text[:i], text[i:]


def take_links(body, errs):
    """Return (body lines without LINK blocks, [(n, text)])."""
    out, links, cur = [], [], None
    for ln in body.split("\n"):
        b, e = LINK_B.match(ln), LINK_E.match(ln)
        if b:
            if cur is not None: errs.append(f"LINK {b.group(1)} opens inside LINK {cur[0]}")
            cur = [int(b.group(1)), []]; continue
        if e:
            if cur is None or cur[0] != int(e.group(1)): errs.append(f"LINK {e.group(1)}: end without its begin")
            else: links.append((cur[0], "\n".join(cur[1])))
            cur = None; continue
        if "% LINK" in ln and cur is None:
            errs.append(f"a LINK marker not alone on its line, or malformed: {ln[:80]!r}")
        (cur[1] if cur is not None else out).append(ln)
    if cur is not None: errs.append(f"LINK {cur[0]} is not closed")
    return out, links


def sentences(lines):
    """Comment lines out; paragraphs at blank lines; each paragraph split at sentence ends
    that lie outside $...$ mathematics.  Returns the list of normalised sentences in order."""
    paras, cur = [], []
    for ln in lines:
        if ln.lstrip().startswith("%"): continue
        if ln.strip() == "":
            if cur: paras.append(" ".join(cur)); cur = []
        else:
            cur.append(ln)
    if cur: paras.append(" ".join(cur))
    out = []
    for p in paras:
        p = norm(p); start = 0; in_math = False; i = 0
        while i < len(p):
            ch = p[i]
            if ch == "\\": i += 2; continue
            if ch == "$": in_math = not in_math
            elif ch in ".!?" and not in_math and i + 2 < len(p) and p[i + 1] == " " and (p[i + 2].isupper() or p[i + 2] in "\\$("):
                out.append(p[start:i + 1]); start = i + 2
            i += 1
        if p[start:]: out.append(p[start:])
    return out


def composed_blocks(lines):
    d, cur = {}, None
    for ln in lines:
        m = COMP.match(ln)
        if m and m.group(2) == "begin": cur = (m.group(1), [])
        elif m and m.group(2) == "end":
            if cur: d[cur[0]] = norm(" ".join(cur[1]))
            cur = None
        elif cur: cur[1].append(ln)
    return d


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    if len(args) != 2: sys.exit(__doc__)
    errs = []
    preC, bodyC = split_doc(open(args[0], encoding="utf-8").read())
    preD, bodyD = split_doc(open(args[1], encoding="utf-8").read())

    nocomment = lambda s: [l for l in s.split("\n") if not l.startswith("%")]
    if nocomment(preC) != nocomment(preD): errs.append("1. the preamble differs")

    linesC = bodyC.split("\n")
    linesD, links = take_links(bodyD, errs)
    if any("% LINK" in l for l in linesC): errs.append("the measured pass has a LINK marker")

    sC, sD = sentences(linesC), sentences(linesD)
    cC, cD = Counter(sC), Counter(sD)
    for s in (cC - cD): errs.append(f"2. missing or altered ({(cC - cD)[s]}x): {s[:160]}")
    for s in (cD - cC): errs.append(f"2. added or altered ({(cD - cC)[s]}x): {s[:160]}")

    comC = Counter(l.rstrip() for l in linesC if l.lstrip().startswith("%"))
    comD = Counter(l.rstrip() for l in linesD if l.lstrip().startswith("%"))
    if comC != comD:
        errs.append(f"3. comment lines differ: only in the first {list((comC - comD))[:5]}; only in the second {list((comD - comC))[:5]}")
    for l in linesC + linesD:
        if "% COMPOSED" in l and not COMP.match(l): errs.append(f"3. a COMPOSED marker not alone on its line: {l[:80]!r}")

    bC, bD = composed_blocks(linesC), composed_blocks(linesD)
    if bC != bD: errs.append(f"4. composed sentences differ: {sorted(k for k in set(bC) | set(bD) if bC.get(k) != bD.get(k))}")

    if [n for n, _ in links] != list(range(1, len(links) + 1)):
        errs.append(f"5. LINK numbers are not 1..{len(links)} in order: {[n for n, _ in links]}")
    for n, t in links:
        if not norm(t): errs.append(f"5. LINK {n} is empty")
        for f in FORBIDDEN_IN_LINK:
            if f in t: errs.append(f"5. LINK {n} contains {f!r}")

    print(f"{len(sC)} sentences in the measured pass; {len(sD)} in the later pass without its {len(links)} LINK block(s); "
          f"{len(bC)} composed sentences")
    for n, t in links: print(f"  LINK {n}: {norm(t)}")
    if "--moves" in sys.argv and cC == cD:
        sm = difflib.SequenceMatcher(None, sC, sD, autojunk=False)
        moved = [(tag, i1, i2, j1, j2) for tag, i1, i2, j1, j2 in sm.get_opcodes() if tag != "equal"]
        print(f"order: {'unchanged' if not moved else str(len(moved)) + ' block(s) differ in place'}")
        for tag, i1, i2, j1, j2 in moved:
            for s in sC[i1:i2]: print(f"  - leaves here: {s[:110]}")
            for s in sD[j1:j2]: print(f"  + arrives here: {s[:110]}")
    for e in errs: print("FAIL", e)
    print("PASS" if not errs else f"{len(errs)} failing")
    sys.exit(1 if errs else 0)


if __name__ == "__main__":
    main()
