"""Pass C of M1 v7.0: the errors that remain in ERROR_LOG_B.md, fixed by the same rule
(delete or copy; a composed sentence is marked).  Applied to passB.tex by
`python3 tools/m1_build_v7_0.py C`.  The PI's direction after the stop: Decision Log P165.
B-2 (the sentence on the symbol x_w) is NOT changed here: the PI's words on it were a musing
and are returned as a read-back (CLAUDE.md section 3).
"""


def composed(n, text):
    return f"% COMPOSED {n}: begin\n{text}\n% COMPOSED {n}: end"


def apply(t, W):
    # ---- B-4: the list of what a reader loses without clause (c) did not name the fibre ----
    assert "the fibre is therefore the torus" in W(3) and "the fibre of $F$ carrying the drive" in W(10)
    t.sub("B-4 (COMPOSED 9)",
          "a reader who does not take clause~(c) has dimension twelve, flux three and three steps as the least admissible values",
          "a reader who does not take clause~(c) has dimension twelve,\n"
          + composed(9, r"the torus $\Ttwo$ as the fibre of $F$ carrying the drive,")
          + "\nflux three and three steps as the least admissible values")

    # ---- B-3: Proposition 7.1, "If a Spin^c structure selects one unit" ----
    t.sub("B-3 (COMPOSED 10)",
          r"If a $\Spinc$ structure selects one unit $i$, its stabiliser is $U(1)$ and the orbit of $i$ is $\mathrm{Sp}(1)/U(1)=\Stwo$.",
          "\n" + composed(10, r"If one unit $i$ is selected, its stabiliser is $U(1)$ and the orbit of $i$ is $\mathrm{Sp}(1)/U(1)=\Stwo$.") + "\n")

    # ---- B-5: the readings named in the hypotheses of Theorem 8.1 ----
    w28 = W(28)
    t.sub("B-5 (COMPOSED 11)",
          r"\ref{def:levels} and~\ref{def:orbits}, " + w28,
          r"\ref{def:levels} and~\ref{def:orbits}" + "\n" + composed(11, "and the tenth choice,") + "\n" + w28)

    # ---- disclosed in COMPOSED.md and noted by the reader of Pass B (its D.12): the joined
    #      conclusion of Proposition 5.5 now carries its mark ----
    t.sub("Proposition 5.5, conclusion marked (COMPOSED 12)",
          r" Under clause~(c) of Definition~\ref{def:minimal} the fibre is the torus $\Ttwo$, on which $\iota$ is inversion $z\mapsto-z$ and the drive is a hyperbolic element of $\mathrm{SL}_{2}(\Z)$.",
          "\n" + composed(12, r"Under clause~(c) of Definition~\ref{def:minimal} the fibre is the torus $\Ttwo$, on which $\iota$ is inversion $z\mapsto-z$ and the drive is a hyperbolic element of $\mathrm{SL}_{2}(\Z)$.") + "\n")
