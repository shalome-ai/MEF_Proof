#!/usr/bin/env python3
"""Build papers/M3/M3_AppA_axioms.tex from the Paper XX v10 source lines.
Usage: build_appA.py <source.tex> <out.tex>
Every edit is asserted to match exactly once, so the output differs from the
source only where the edits below say so."""
import re, sys

src = open(sys.argv[1], encoding="utf-8").read().split("\n")
def L(a, b):            # 1-indexed inclusive
    return "\n".join(src[a - 1:b])

MACROS = [  # Paper XX preamble ll.71-92, expanded (no local redefinitions in M3)
    (r"\Kman", r"K_8"), (r"\Ssol", r"S^1_{\mathrm{Sol}}"), (r"\Sthree", r"S^3"),
    (r"\CP", r"\mathbb{CP}"), (r"\Mpl", r"M_{\mathrm{Pl}}"),
    (r"\Leff", r"\Lambda_{\mathrm{eff}}"), (r"\Maxiom", r"\mathbb{M}"),
    (r"\vp", r"\phi"), (r"\SU", r"\mathrm{SU}"), (r"\UU", r"\mathrm{U}"),
    (r"\SL", r"\mathrm{SL}"), (r"\GL", r"\mathrm{GL}"),
]
def expand(t):
    for m, d in MACROS:
        t = re.sub(re.escape(m) + r"(?![A-Za-z])", lambda _: d, t)
    return t

def once(t, old, new):
    assert t.count(old) == 1, (t.count(old), old[:70])
    return t.replace(old, new)

OM = r"[\ldots]"
EDITS = {   # per axiom: (old, new) on the raw source text
 "S0": [(r"  Paper~IX~\cite{PaperIX} develops the baryogenesis instance formally.", " " + OM)],
 "S1": [(r"  Paper~I develops the construction formally.", " " + OM)],
 "S3": [(r"The $\omega$-axis: consciousness coherence, from low",
         r"The $\omega$-axis: [the Coherent Field], from low")],
 "S3a": [(r" (Paper~XIX; Paper~XXI~\S5~\cite{PaperXXI}).", " " + OM + "."),
         (r" (Paper~XVII; Paper~XXI~\S6).", " " + OM + "."),
         (r" (Paper~XVIII; Paper~XXI~\S7).", " " + OM + "."),
         (r"  Paper~XXII develops the quaternionic realisation formally.", " " + OM)],
 "S4": [(r"$\omega$: consciousness coherence field.", r"$\omega$: [the Coherent Field]."),
        (r"$\omega$ is consciousness coherence.", r"$\omega$ is [the Coherent Field].")],
 "S5": [(r", now extended from the abelian (complex-torus) to the non-abelian (quaternionic) setting in Paper~XXI.",
         " " + OM + ".")],
 "S6": [(r"  Paper~XVI derives the fine structure constant to $0.08\%$ accuracy as the load-bearing instance.",
         " " + OM)],
}

NOTE = "\n\n\\noindent\\emph{Note added in M3.}\\ "
NOTES = {   # per axiom: (end of the source paragraph the note follows, note text) -- PI, 10 Nov 2026
 "S1": [("Planck-scale tubes.  The dimensions are vast.",
         "A picture for the reader: the universe is like a set of nested Russian dolls. "
         "We are in the fourth doll, and we are contained within eight other, larger dolls, "
         "each larger than the one before.")],
 "S2": [(r"This is the \textbf{External Horizon} of the G\"odel Boundary.",
         "By M1 (Theorem~8.1, the minimality theorem) this is the minimal topology that "
         "satisfies the four axioms. There may well be higher dimensions of which this "
         "universe is a subset. That is unknowable from where we are.")],
 "S2f": [("The twist is what makes everything move, evolve, live.}",
          "The same condition says what the next time slice is to be, so that each time "
          "slice is different. In the series this is the content of A3 (each instance is "
          "unique) and of A4 (the universe never stands still), with the twist as their "
          "carrier. Time can move forward; without this condition everything would be frozen.")],
}
MATH_NOTES = {  # mathematical axiom number -> note (PI ruling, 10 Nov 2026)
 6: (r"Here $\dodd(n)$ is the number of odd divisors of $n$, not their sum: the Dirichlet "
     r"series $\zeta(s)^{2}(1-2^{-s})$ stated in the axiom is that of the count, "
     r"$\sum_{k\ \mathrm{odd}}q^{k}/(1-q^{k})=\sum_{m\geq1}\dodd(m)\,q^{m}$. "
     r"For example $\dodd(6)=2$."),
 7: (r"The eigenvalues are as stated: $\phi^{2}$ and $\phi^{-2}$ (M1, Theorem~4.2; M2, "
     r"certificate \texttt{L4\_eigen}). The Lyapunov exponent is therefore "
     r"$\ln\phi^{2}=2\ln\phi$, not $\ln\phi$ as written above; M2 has "
     r"$\kappa=\log\phi^{2}$."),
}
NOTE_HOME = {"S2f": "S2"}   # Sigma-2f sits inside the Sigma-2 block

def table_fix(t):   # layout only: float -> centred tabular (no float package assumed)
    t = once(t, "\\begin{table}[H]\n\\centering\n\\small\n", "\\begin{center}\n\\small\n")
    return once(t, "\\end{table}", "\\end{center}")

SIGMA = [  # key, first, last
 ("S0", 335, 345), ("S1", 348, 360), ("S2", 363, 427), ("S3", 430, 449),
 ("S3a", 452, 473), ("S4", 476, 482), ("S5", 485, 495), ("S6", 498, 508),
 ("S7", 511, 517), ("S8", 520, 526), ("SP", 529, 535), ("SS", 538, 544),
 ("ST", 547, 555),
]
MATH = [(1, 639, 641), (2, 647, 649), (3, 722, 724), (4, 730, 732),
        (5, 740, 742), (6, 750, 752), (7, 760, 762), (8, 768, 770)]

out = []
out.append(r"""%%=====================================================================
%% M3 Appendix A -- the twenty axioms, transcribed as data (SOW node I.1).
%% GENERATED from sources/Paper_XX_New_Axioms_for_Old_Problems_v10.tex,
%% ll.335-555 (Sigma) and ll.639-770 (the eight axiom environments only).
%% Each block carries its source line range. Departures from the source,
%% all by PI ruling of 10 Nov 2026 (WP0 assumptions 4-6):
%%   (a) every reference to a paper of the earlier corpus is omitted and
%%       marked [\ldots]; external citations are kept;
%%   (b) the three places where omega is named in a superseded form carry
%%       the canonical name in square brackets;
%%   (c) the source's local macros are expanded; the rendered text is the same;
%%   (d) layout only: headings are unnumbered; the Sigma-3 table is not a float;
%%       the eight mathematical axioms are set under headings, not in an
%%       axiom environment; the labels of the source are dropped;
%%   (e) not transcribed: the Example paragraphs after each mathematical
%%       axiom, and the Fixed-Point Vanishing lemma block (ll.659-718).
%%   (f) five paragraphs headed "Note added in M3" are not source text: the
%%       PI's commentary of 10 Nov 2026 (Sigma-1, Sigma-2, Sigma-2f), the
%%       correction of the Lyapunov exponent in M-7 (P17), and the correction
%%       of d_odd in M-6 (number, not sum, of odd divisors).
%%   (g) layout only: the quoted text is set with extra line-breaking
%%       tolerance (the group opened after the source note and closed at the
%%       end of the file), so that no line overruns the text block.
%% External citation keys needed in M3's bibliography are listed at the end.
%%=====================================================================

\section{The twenty axioms, as stated}\label{app:axioms}

% PROVISIONAL source note (wording for the PI; no M3 prose is settled yet).
\noindent The twenty axioms audited in this paper are reproduced here as data.
The wording is that of the programme's earlier statement of them; that
document is superseded by the present series and is not cited. Line numbers
refer to its tenth version. An omission is marked $[\ldots]$; words in square
brackets replace a superseded name of~$\omega$. A paragraph headed \emph{Note
added in M3} is commentary of the present paper and is not part of the earlier
wording. The twelve creation axioms
come first ($\Sigma$-3a is a part of $\Sigma$-3), then the eight mathematical
axioms.

\begingroup\tolerance=3000\emergencystretch=4em
""")

def src_tag(a, b):
    return "\\noindent{\\small Source lines %d--%d.}\\par\\smallskip\n" % (a, b)

out.append("\n\\subsection*{The creation axioms}\n")
for key, a, b in SIGMA:
    t = L(a, b)
    for old, new in EDITS.get(key, []):
        t = once(t, old, new)
    for nk, items in NOTES.items():
        if NOTE_HOME.get(nk, nk) == key:
            for anchor, note in items:
                t = once(t, anchor, anchor + NOTE + note)
    if key == "S3":
        t = table_fix(t)
    t = expand(t)
    # headings: unnumbered, labels dropped
    t = re.sub(r"^\\subsection\{(.*?)\}(\\label\{[^}]*\})?$", lambda m: "\\subsection*{" + m.group(1) + "}", t, count=1, flags=re.M)
    t = t.replace("\\subsubsection{", "\\subsubsection*{")
    # put the source tag right after the heading line
    head, rest = t.split("\n", 1)
    out.append("%% ---- source ll.%d-%d ----\n%s\n%s%s\n" % (a, b, head, src_tag(a, b), rest.lstrip("\n")))

out.append("\n\\subsection*{The mathematical axioms}\n")
for n, a, b in MATH:
    t = L(a, b)
    m = re.match(r"\\begin\{axiom\}\[\\textbf\{(.*)\}\]\\label\{ax:M%d\}\n(.*)\n\\end\{axiom\}$" % n, t, re.S)
    assert m, n
    title, body = expand(m.group(1)), expand(m.group(2))
    if n in MATH_NOTES:
        body += NOTE + MATH_NOTES[n]
    out.append("%% ---- source ll.%d-%d ----\n\\subsubsection*{%s}\n%s%s\n" % (a, b, title, src_tag(a, b), body))

text = "\n".join(out)
keys = sorted(set(re.findall(r"\\cite\{([^}]*)\}", text)))
assert not any(k.startswith("Paper") for k in keys), keys
text += "\n\\endgroup\n"
text += "\n%% External citation keys used above (entries to be carried into M3's bibliography):\n"
text += "".join("%%   %s\n" % k for k in keys)
for bad in ("consciousness coherence", "coherence field", r"\ref{", r"\label{ax", "Paper~", "Papers~"):
    assert bad not in text, bad
assert text.count("Note added in M3.}") == 5
open(sys.argv[2], "w", encoding="utf-8").write(text)
print(len(text.split("\n")), "lines;", len(keys), "external keys:", " ".join(keys))
