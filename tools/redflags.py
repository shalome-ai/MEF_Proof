#!/usr/bin/env python3
"""Red-flag scan of a source before it is used (CLAUDE.md s.2b, measure 4; Decision Log P21).

Usage: python3 tools/redflags.py <file.tex> [first_line last_line]

Lists the places where an argument most often hides an ungrounded step. A hit proves
nothing; it says where to look. The output is pasted into the step audit of the theorem
concerned.
"""
import re, sys

FLAGS = [
    ("proportional / up to normalisation", r"\\propto|up to (the |an? )?(overall )?(normali[sz]ation|constant|sign|factor)|normali[sz]ation absorbed"),
    ("taken as given / standard",          r"taken as given|we take (it|them) as given|is standard|are standard|standard result|well[- ]known|as is known"),
    ("identified with / read off",         r"identif(y|ied|ication) (with|as)|we identify|is read off|are read off|read off"),
    ("forward reference for a step",       r"(fixed|proved|established|derived|shown|identified) (independently )?(in|by) (Proposition|Lemma|Theorem|Corollary|Section|\\S)~?\\ref\{[^}]*\}\s*below|\bbelow\b"),
    ("rigour label on a numerical test",   r"Classification:\s*\\?(textbf\{)?\s*(Rigorous|Derived)|verified numerically|numerical(ly)? (test|verif|confirm)|to machine precision"),
    ("agreement with a known target",      r"in agreement with|agrees with (the )?(observed|measured|Planck|PDG|experimental)|matches the (observed|measured)|to \$?[0-9.]+\\?%"),
    ("choice or assumption words",         r"\bwe (choose|assume|declare|posit|adopt|require)\b|\bby hand\b|natural(ly)? (choice|identification)|the natural\b"),
]

def main(argv):
    if not argv:
        print(__doc__); return 2
    lines = open(argv[0], encoding="utf-8", errors="replace").read().split("\n")
    a, b = (int(argv[1]), int(argv[2])) if len(argv) >= 3 else (1, len(lines))
    total = 0
    for name, pat in FLAGS:
        rx = re.compile(pat, re.I)
        hits = []
        for n in range(a, min(b, len(lines)) + 1):
            line = lines[n - 1]
            if line.lstrip().startswith("%"): continue
            for m in rx.finditer(line):
                s = max(0, m.start() - 45); e = min(len(line), m.end() + 45)
                hits.append((n, line[s:e].strip()))
        total += len(hits)
        print("== %s: %d" % (name, len(hits)))
        for n, ctx in hits[:60]:
            print("   l.%d  ...%s..." % (n, ctx))
        if len(hits) > 60: print("   (%d more)" % (len(hits) - 60))
    print("TOTAL flags in ll.%d-%d: %d" % (a, b, total))
    return 0

if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
