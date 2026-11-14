"""Pass E of M1 v7.0: what the meaning check of Pass D against Pass C puts back
(tools/Paper_assembly_protocol.md, "Check D against C; Pass E").  Applied to passD.tex by
`python3 tools/m1_build_v7_0.py E`.  The reader's report is in MEANING_CHECK_D.md.

Put back from Pass C, by copying, wherever the reader said MOVED or NOT SURE (the architect
wrote Pass D and does not judge it; a "not sure" is treated as moved):
  item 2  (MOVED)    and item 3 (NOT SURE): the reordering D-1 of the opening of Section 4 is undone;
  item 15 (MOVED)    and item 16 (SAME by itself, but a further division under the one heading
                     phrase): the two paragraph breaks D-9 and D-10 in the deflationary reading are removed;
  item 11 (NOT SURE): LINK 4 (the opening of Section 6) is removed; LINK 5 becomes LINK 4.
Kept: the paragraph breaks in proofs (D-2 to D-8) and LINKS 1, 2, 3 and 5, each found SAME.
"""


def apply(t, W):
    i = t.s.index("Let the fibre of $F$ carrying the drive be a torus")
    p298 = t.s[i:t.s.index("\n", i)]
    assert p298.endswith(r"Corollary~\ref{cor:timecircle} settles it.")
    t.sub("E-1 the opening of Section 4 as Pass C has it (D-1 undone)",
          "\n\n".join([W(9), W(4), p298, W(5), W(1)]),
          "\n\n".join([p298, W(9), W(4), W(1), W(5)]))
    t.sub("E-2 deflationary reading: the first break removed (D-9 undone)",
          "fails the first five axioms.\n\n% COMPOSED 8: begin",
          "fails the first five axioms. \n% COMPOSED 8: begin")
    t.sub("E-3 deflationary reading: the second break removed (D-10 undone)",
          "The overall size is not an input: under the sixth axiom it has no meaning.\n\nThe three clauses of",
          " The overall size is not an input: under the sixth axiom it has no meaning. The three clauses of")
    t.delete("E-4 LINK 4 removed (D-14 undone)",
             "\n\n% LINK 4: begin\nThis section takes up the dimension: the theorem and its proof, a remark, and worked cases.\n% LINK 4: end")
    t.sub("E-5 LINK 5 renumbered 4 (begin)", "% LINK 5: begin", "% LINK 4: begin")
    t.sub("E-6 LINK 5 renumbered 4 (end)", "% LINK 5: end", "% LINK 4: end")
