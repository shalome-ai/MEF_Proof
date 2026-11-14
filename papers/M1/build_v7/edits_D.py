"""Pass D of M1 v7.0: flow (tools/Paper_assembly_protocol.md, "Pass D"; HANDOVER_BUILD section 2).
Applied to passC.tex by `python3 tools/m1_build_v7_0.py D`.

Fenced, and stricter than the fence (assumption 5 of the session, confirmed by the PI): NO sentence
of Pass C is reworded, whether it states mathematics or not.  Pass D is Pass C with
  (1) one reordering of whole paragraphs (the opening of Section 4);
  (2) paragraph breaks added at sentence ends, in proofs (tools/PAPER_FORMAT.md: each step on its
      own line) and in the paragraph of the deflationary reading: white space only;
  (3) five linking sentences, each between `% LINK n: begin` and `% LINK n: end`, with no
      mathematics and no claim of their own.
`python3 tools/passD_check.py passC.tex passD.tex` confirms that every sentence of C is unchanged
in D and that nothing is added but the marked links.  Statements of the log are taken by W(n).
"""
import importlib.util
from pathlib import Path

_spec = importlib.util.spec_from_file_location("pdc", Path(__file__).resolve().parents[3] / "tools/passD_check.py")
_pdc = importlib.util.module_from_spec(_spec); _spec.loader.exec_module(_pdc)


def link(n, text):
    return f"% LINK {n}: begin\n{text}\n% LINK {n}: end"


def steps(par):
    """The paragraph with a paragraph break at each sentence end; no word changed."""
    s = _pdc.sentences([par])
    assert len(s) > 1 and " ".join(s) == _pdc.norm(par)
    return "\n\n".join(s)


def apply(t, W):
    # ---- (1) the opening of Section 4: time and what the flow moves first, then the torus and
    #          its return map, then the two paragraphs on the matrix of the step ----
    i = t.s.index("Let the fibre of $F$ carrying the drive be a torus")
    p298 = t.s[i:t.s.index("\n", i)]
    assert p298.endswith(r"Corollary~\ref{cor:timecircle} settles it.")
    t.sub("D-1 the five opening paragraphs of Section 4 reordered",
          "\n\n".join([p298, W(9), W(4), W(1), W(5)]),
          "\n\n".join([W(9), W(4), p298, W(5), W(1)]))

    # ---- (2) each step of a proof on its own line (white space only) ----
    for name, par in [("D-2 proof of Proposition 4.1, last step (M1-W007)", W(7)),
                      ("D-3 proof of Proposition 5.2, the step of M1-W015", W(15)),
                      ("D-4 proof of Proposition 5.5, M1-W013", W(13)),
                      ("D-5 proof of Proposition 5.5, M1-W003", W(3)),
                      ("D-6 proof of Proposition 5.5, M1-W008", W(8)),
                      ("D-7 proof of Proposition 7.3, one step of two sentences",
                       r"A $\Spinc$ structure therefore suffices. A larger structure group, such as that of a $\mathrm{Spin}^{h}$ structure, is not needed, and clause~(b) does not admit it."),
                      ("D-8 proof of Theorem 7.10, M1-W020", W(20))]:
        if name.startswith("D-4"):
            # M1-W013's first sentence also stands, alone, as the hypotheses of the statement:
            # match the paragraph of the proof by what precedes it.
            t.sub(name, "\\begin{proof}\n" + par, "\\begin{proof}\n" + steps(par))
        else:
            t.sub(name, par, steps(par))

    # ---- (2) the paragraph of the deflationary reading, in three paragraphs ----
    t.sub("D-9 deflationary reading: a paragraph break before the declared input",
          "fails the first five axioms. \n% COMPOSED 8: begin",
          "fails the first five axioms.\n\n% COMPOSED 8: begin")
    t.sub("D-10 deflationary reading: a paragraph break before the three clauses",
          " The overall size is not an input: under the sixth axiom it has no meaning. The three clauses of",
          "The overall size is not an input: under the sixth axiom it has no meaning.\n\nThe three clauses of")

    # ---- (3) linking sentences: an opening for each of Sections 4 to 7 (Register Guide 3.1),
    #          made of the section's own headings, and one before the new proposition ----
    t.after("D-11 LINK 1, opening of Section 4", "\\section{The drive}\\label{sec:drive}",
            link(1, "This section takes up the drive, under three headings: hyperbolicity, the least drive and its uniqueness, and worked cases."))
    t.after("D-12 LINK 2, opening of Section 5", "\\section{The fibre}\\label{sec:fibre}",
            link(2, "This section takes up the fibre, under six headings: its algebra, the four corners, the surface, the collapse at the corners, worked cases, and the pillowcase."))
    t.before("D-13 LINK 3, before the proposition of M1-W026",
             "\\begin{proposition}[the geometry satisfies A2]\\label{prop:A2}",
             link(3, "We return to the second axiom."))
    t.after("D-14 LINK 4, opening of Section 6", "\\section{Dimension twelve}\\label{sec:dimension}",
            link(4, "This section takes up the dimension: the theorem and its proof, a remark, and worked cases."))
    t.after("D-15 LINK 5, opening of Section 7", "\\section{The base}\\label{sec:base}",
            link(5, "This section takes up the base, under six headings: the sphere of imaginary units, the space of complex directions, the twist that is necessary, the twist of the fibre, worked cases, and the spatial factor."))
