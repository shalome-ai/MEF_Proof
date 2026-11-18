#!/usr/bin/env python3
"""Cut quotations out of M1 v7.3 by line: the checklist of papers/M2/DAG.md, section 3, rule 10.

Cards S01 and S02 were withdrawn (Decision Log P188): what this script makes is a
working aid, not a source, and no entry of the write-up log is made from it.

What it does
  * reads canon/M1/Paper_M1_Six_Axioms_v7_3.tex and nothing else;
  * works out the printed number of every \\label (sections, subsections,
    theorem-like statements, equations) by counting, as LaTeX does;
  * for each item of the spec file given on the command line, takes the named
    lines, drops the comment lines (% COMPOSED, % LINK, % GLOSSARY), joins the
    lines as TeX joins them, and, if anchors are given, cuts from the first
    anchor to the end of the last one. Each anchor must occur exactly once;
  * writes each quotation twice: as it stands in M1, and with every
    cross-reference of M1 printed as M1's printed number (presentation: M2's
    paper has none of M1's labels).

Nothing is retyped: every quotation is a substring of the joined lines of M1.
The script fails if a line range is empty, an anchor is missing or repeated, or
a label is unknown.

Usage (from the repository root):
  python3 papers/M2/checks/m1_quote.py papers/M2/checks/S01_S02_spec.json out.md   the quotations, for reading
  python3 papers/M2/checks/m1_quote.py papers/M2/checks/S01_S02_spec.json --log    append the entries to the write-up log
  python3 papers/M2/checks/m1_quote.py papers/M2/checks/S01_S02_spec.json --check  every logged statement is the cut of M1 again
"""
import json
import re
import sys

M1 = "canon/M1/Paper_M1_Six_Axioms_v7_3.tex"
THM = {"theorem": "Theorem", "proposition": "Proposition", "lemma": "Lemma",
       "corollary": "Corollary", "definition": "Definition", "remark": "Remark"}
COMMENT = re.compile(r"^\s*%")


def numbering(lines):
    """label -> printed number, by counting."""
    nums = {}
    sec = sub = thm = eq = ax = 0
    appendix = False
    pending = None
    for ln in lines:
        if COMMENT.match(ln):
            continue
        if "\\appendix" in ln:
            appendix, sec = True, 0
        m = re.match(r"\\section\{", ln)
        if m:
            sec += 1
            sub = thm = 0
            pending = chr(64 + sec) if appendix else str(sec)
        m = re.match(r"\\subsection\{", ln)
        if m:
            sub += 1
            pending = "%s.%d" % (chr(64 + sec) if appendix else str(sec), sub)
        m = re.match(r"\\begin\{(\w+)\}", ln)
        if m and m.group(1) in THM:
            thm += 1
            pending = "%s.%d" % (chr(64 + sec) if appendix else str(sec), thm)
        if m and m.group(1) == "axiom":
            ax += 1
            pending = str(ax)
        if m and m.group(1) == "equation":
            eq += 1
            pending = str(eq)
        for lab in re.findall(r"\\label\{([^}]+)\}", ln):
            if pending is None:
                sys.exit("label with no number: " + lab)
            nums[lab] = pending
    return nums


def join(lines, a, b):
    """Lines a..b (1-based, inclusive) joined as TeX joins them."""
    out = ""
    for ln in lines[a - 1:b]:
        if COMMENT.match(ln):
            continue
        ln = ln.rstrip("\n")
        if ln.strip() == "":
            out = out.rstrip(" ") + "\n\n"
            continue
        if ln.endswith("%") and not ln.endswith("\\%"):
            out += ln[:-1]            # a line ending in % joins with no space
        else:
            out += ln + " "
    out = re.sub(r"[ ]{2,}", " ", out)
    out = re.sub(r" \n\n", "\n\n", out)
    return out.strip()


def cut(text, start, end, ident):
    if start:
        if text.count(start) != 1:
            sys.exit("%s: start anchor occurs %d times" % (ident, text.count(start)))
        text = text[text.index(start):]
    if end:
        if text.count(end) != 1:
            sys.exit("%s: end anchor occurs %d times" % (ident, text.count(end)))
        text = text[:text.index(end) + len(end)]
    return text


def printed(text, nums, ident):
    def one(m):
        if m.group(1) not in nums:
            sys.exit("%s: unknown label %s" % (ident, m.group(1)))
        return nums[m.group(1)]
    text = re.sub(r"\\eqref\{([^}]+)\}", lambda m: "(" + one(m) + ")", text)
    text = re.sub(r"\\ref\{([^}]+)\}", one, text)
    return re.sub(r"\\label\{[^}]+\}", "", text)


TAGS = {"\\rigR": "[R]", "\\rigD": "[D]", "\\rigM": "[M]", "\\rigG": "[G]"}
DATE = "18 November 2026"


def items(spec, lines, nums):
    """Every item of the spec with its quotation, in the order of the spec."""
    for part in spec:
        for it in part["items"]:
            a, b = it["lines"]
            ident = "%s/%d" % (part["step"], it["place"])
            raw = cut(join(lines, a, b), it.get("start"), it.get("end"), ident)
            if not raw:
                sys.exit(ident + ": empty")
            if "label" in it and it["label"] not in nums:
                sys.exit(ident + ": unknown label " + it["label"])
            yield part, it, raw, printed(raw, nums, ident)


def statement(it, quoted):
    return "\\emph{M1, %s.}\n\\begin{quote}\n%s\n\\end{quote}" % (it["where"], quoted)


def entry(n, part, it, quoted):
    a, b = it["lines"]
    tags = [v for k, v in TAGS.items() if k in quoted]
    lab = " (`%s`)" % it["label"] if "label" in it else ""
    where = it["where"].replace("~", " ").replace("``", '"').replace("''", '"')
    return "\n".join([
        "### M2-W%03d · active" % n,
        "- **Statement (as it will be printed):**",
        "```tex", statement(it, quoted), "```",
        "- **Place:** `m1 %03d`; a quotation of M1 v7.3 under the head \"%s\", among the entries of %s" % (it["place"], it["head"].replace("``", '"').replace("''", '"'), part["step"]),
        "- **Step:** %s" % part["step"],
        "- **Rests on:** M1 v7.3, %s%s. Nothing else: the entry is a quotation and states nothing of its own." % (where, lab),
        "- **Mark:** READ (`%s`, ll.%d–%d), cut by `papers/M2/checks/m1_quote.py` from `papers/M2/checks/S01_S02_spec.json`; in the quotation each cross-reference of M1 is printed as M1's printed number" % (M1, a, b),
        "- **Tag:** %s" % ("%s, the tag M1 prints on it; none is added" % ", ".join(tags) if tags else "none in the quoted words; none is added"),
        "- **Failure test:** the quoted words do not stand at ll.%d–%d of M1 v7.3; or a later version of M1 changes them, and the entry is then retired and cut again." % (a, b),
        "- **Confirmed:** checked, not read back, %s (Decision Log P188)" % DATE,
        "- **Retires / retired by:** none",
        ""])


def main():
    spec = json.load(open(sys.argv[1]))
    lines = open(M1, encoding="utf-8").readlines()
    nums = numbering(lines)
    if "--log" in sys.argv:            # append the entries to the write-up log
        sys.exit("withdrawn (Decision Log P188): S01 and S02 are not logged; the quotations are a checklist only")
        log = "papers/M2/WRITE_LOG.md"
        text = open(log, encoding="utf-8").read()
        if "### M2-W001" in text:
            sys.exit("the log already has entries; not appended")
        out = [entry(n, part, it, q) for n, (part, it, raw, q) in enumerate(items(spec, lines, nums), 1)]
        text = text.replace("The next number is **M2-W001**.", "The next number is **M2-W%03d**." % (len(out) + 1))
        open(log, "w", encoding="utf-8").write(text.rstrip("\n") + "\n\n" + "\n".join(out))
        print("%d entries appended; next number M2-W%03d" % (len(out), len(out) + 1))
        return
    if "--check" in sys.argv:          # every logged statement is the cut of M1 again
        text = open("papers/M2/WRITE_LOG.md", encoding="utf-8").read()
        logged = re.findall(r"### (M2-W\d+) · active\n- \*\*Statement \(as it will be printed\):\*\*\n```tex\n(.*?)\n```", text, re.S)
        want = [statement(it, q) for part, it, raw, q in items(spec, lines, nums)]
        bad = [k for (k, got), w in zip(logged, want) if got != w]
        ok = len(logged) == len(want) and not bad
        print("%d logged, %d in the spec, %d differ: %s" % (len(logged), len(want), len(bad), "PASS" if ok else "FAIL " + " ".join(bad)))
        sys.exit(0 if ok else 1)
    out = ["# Quotations of M1 v7.3 for S01 and S02 (made by m1_quote.py; not edited by hand)", ""]
    for part, it, raw, q in items(spec, lines, nums):
        a, b = it["lines"]
        out += ["### %s · m1 %03d · %s · M1 v7.3 ll.%d–%d" % (part["step"], it["place"], it["where"], a, b),
                "", "- **Head:** " + it["head"], "- **As it stands in M1:**", "```tex", raw, "```",
                "- **With M1's printed numbers:**", "```tex", q, "```", ""]
    open(sys.argv[2], "w", encoding="utf-8").write("\n".join(out))
    print("%d quotations written to %s" % (sum(len(p["items"]) for p in spec), sys.argv[2]))


if __name__ == "__main__":
    main()
