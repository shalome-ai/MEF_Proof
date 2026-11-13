"""Pass B of M1 v7.0: the errors of ERROR_LOG_A.md fixed by deleting or by copying.
Applied to passA.tex by `python3 tools/m1_build_v7_0.py B`.  Every edit matches exactly once and
names the error (A-n) it fixes.  A sentence that could not be had by deleting or copying is set
between `% COMPOSED n: begin` and `% COMPOSED n: end` and listed in COMPOSED.md.
"""
import re


def composed(n, text):
    return f"% COMPOSED {n}: begin\n{text}\n% COMPOSED {n}: end"


def first_sentence(st):
    """The opening sentence of a logged statement, copied."""
    return st[:st.index(". ") + 1]


def apply(t, W):
    # ---- presentation: the name of the version (not an error; HANDOVER_BUILD section 12) ----
    t.sub("version: header comment",
          "% Base paper of the Master Equation Framework series.  v6.3, canon, 11 Nov 2026",
          "% Base paper of the Master Equation Framework series.  v7.0, working pass of the assembly protocol (not canon), 13 Nov 2026")
    t.sub("version: build line",
          "v6.3 built from v6.2 by tools/m1_build_v6_3.py (Decision Log P61-P64).  Supersedes v6.2, v6.1, v6.0 and v5.0 (canon/M1/superseded/).",
          "v6.3 built from v6.2 by tools/m1_build_v6_3.py (Decision Log P61-P64).  v7.0 built from v6.3 and the write-up log by tools/m1_build_v7_0.py (Decision Log P159-P162).")
    t.sub("version: date", r"\date{11 November 2026 (v6.3)}", r"\date{13 November 2026 (v7.0)}")

    # ---- A-3, A-4, A-5, A-25: the count "six" of the choices of Section 2 (deleted) ----
    t.sub("A-3", "is the first of the six choices this section records.", "is the first of the choices this section records.")
    t.sub("A-4", "and that is the third of the six choices.", "and that is the third of the choices.")
    t.sub("A-5", "Clause~(i) is the fourth of the six choices:", "Clause~(i) is the fourth of the choices:")
    t.sub("A-25", r"the six readings of Section~\ref{sec:axioms} and the three of Section~\ref{sec:minimal}",
          r"the readings of Section~\ref{sec:axioms} and the three of Section~\ref{sec:minimal}")

    # ---- A-8: the count and the list of the choices of Section 2 ----
    t.sub("A-8 (count deleted)", "and in doing so six choices were made and numbered:", "and in doing so choices were made and numbered:")
    w35 = W(35)
    clause = w35[len("The "):w35.index(": the three imaginary units")]
    assert clause.startswith("spinor bundle of Definition") and clause.endswith("are complex-valued")
    t.sub("A-8 (the tenth choice added to the list; COMPOSED 3)",
          r"and that the sphere of alternatives is part of the shape (Definition~\ref{def:orbits}).",
          r"and that the sphere of alternatives is part of the shape (Definition~\ref{def:orbits})%" + "\n"
          + composed(3, "; and that the " + clause + ".") + "\n")
    # the tenth choice is named where it is stated, so that "(the tenth choice)" of M1-W019 has its referent
    t.after("A-8 (the tenth choice named; COMPOSED 2)", w35,
            composed(2, "This is the tenth choice of this paper, and the seventh of this section."), sep="\n")

    # ---- A-6: the cross-reference "Section 7, where the other possible reading is set out" ----
    t.sub("A-6", r"of Section~\ref{sec:base}, where the other possible reading is set out.", r"of Section~\ref{sec:base}.")

    # ---- A-7: "typical", "of measure zero" (the sentence deleted; M1-W007 says which points return) ----
    t.delete("A-7", " And ``never comes to the same point again'' means that although time itself is a circle, a typical state of the universe does not return: the points that do return are exceptional, of measure zero.")

    # ---- A-9: the aspect ratio as the declared input ----
    t.delete("A-9", " One proportion is not derived in this paper, the aspect ratio of the internal fibre, and the final theorem states it as its declared input.")

    # ---- A-10: "the four it names"; "applied after clause (b)" ----
    w12 = W(12)
    prevails = w12[w12.index("clause~(b) over clause~(c)"):].rstrip(".")
    assert prevails == "clause~(b) over clause~(c)"
    t.sub("A-10 (COMPOSED 4)",
          " Clause~(c) selects the gentlest drive that still drives, the fewest dimensions, the least flux and the shortest time circle; the quantities to which it applies are the four it names, and it is applied after clause~(b), so that it does not replace a structure that needs no further object by one with a smaller integer.",
          "\n" + composed(4, "Clause~(b) prevails over clause~(c), so that clause~(c) does not replace a structure that needs no further object by one with a smaller integer.") + "\n")

    # ---- A-11, A-12: measure in the proof of Proposition 4.1 ----
    t.sub("A-11", r"contradicting two clauses of Definition~\ref{def:A4}.", r"contradicting Definition~\ref{def:A4}.")
    t.sub("A-12", r"its entropy is $\log\lvert\lambda\rvert>0$, its periodic points are exactly the rational points, which have measure zero, and the induced flow",
          r"its entropy is $\log\lvert\lambda\rvert>0$, and the induced flow")

    # ---- A-13: canon l.442, the clause on the geometry run backwards ----
    t.delete("A-13", "; and the definitions use a direction of time without saying that the geometry run backwards is another geometry")

    # ---- A-14, A-15: the superseded proof of Lemma 5.1; the hand check of the Mark of M1-W017 copied in its place ----
    mark = ("With $x=(a+a^{*})/2$ and $u=(a-a^{*})/2$, by linearity and $(a^{*})^{*}=a$, $x^{*}=x$, so $x$ is real, and $u^{*}=-u$, and $a^{*}=x-u$; "
            "$(u^{2})^{*}=u^{*}u^{*}=(-u)(-u)=u^{2}$, so $u^{2}$ is fixed and therefore real; "
            "$x$ is real and commutes with $u$, so $aa^{*}=(x+u)(x-u)=x^{2}-u^{2}$ and $a^{*}a=(x-u)(x+u)=x^{2}-u^{2}$; "
            "if $u=r\\cdot1$ for a real $r$ then $u^{*}=u$, so $u=-u$ and $u=0$, hence for $u\\neq0$ the elements $1$ and $u$ are independent and $(x,y)\\mapsto x+yu$ is one-to-one; "
            "the curve $x^{2}-u^{2}y^{2}=1$ is an ellipse if $u^{2}<0$, the two lines $x=\\pm1$ if $u^{2}=0$ and a hyperbola if $u^{2}>0$, so it is compact (closed and bounded in the plane) exactly when $u^{2}<0$; "
            "if $u^{2}<0$ for every $u\\neq0$ with $u^{*}=-u$ then $N(a)=x^{2}-u^{2}>0$ unless $x=0$ and $u=0$; "
            "conversely $N(u)=-u^{2}>0$ gives $u^{2}<0$.")
    # the text above must be the Mark of M1-W017 as logged, its first letter and last stop apart
    log = open("papers/M1/WRITE_LOG.md", encoding="utf-8").read()
    assert ("w" + mark[1:]) in log, "the proof of Lemma 5.1 is not the Mark of M1-W017 word for word"
    t.sub("A-14, A-15 (COMPOSED 5)",
          "$(aa^{*})^{*}=aa^{*}$, so $N$ is $*$-fixed.\n\n"
          "On $\\R\\oplus\\R u$ the unit group is $\\{x+yu:\\,x^{2}-u^{2}y^{2}=1\\}$, a circle if $u^{2}=-1$ and a hyperbola if $u^{2}=+1$; compactness is $u^{2}=-1$, i.e.\\ $N(u)=1>0$ on every such line, which is positive-definiteness of $N$ on the span.",
          composed(5, mark))

    # ---- A-16: "a corner", "the corner fibres included", before the corners are counted ----
    t.delete("A-16", "; what rules them out is that a corner whose unit group is a hyperbola is not compact, and A1 requires every factor, the corner fibres included, to close")

    # ---- A-17, A-18, A-19: Proposition 5.5, "Anosov", "commuting with iota", Franks ----
    t.sub("A-17 (hypotheses: the first sentence of M1-W013, copied)",
          r"Let the fibre $X$ that carries the involution of A2 be compact and connected, with the involution $\iota$ having exactly four isolated fixed points and the drive of A4 acting as an Anosov diffeomorphism commuting with $\iota$.",
          first_sentence(W(13)))
    w3 = W(3)
    concl = w3[w3.index("Under clause~(c) of Definition~\\ref{def:minimal} the fibre is therefore the torus"):]
    assert concl == "Under clause~(c) of Definition~\\ref{def:minimal} the fibre is therefore the torus."
    t.sub("A-17 (conclusion: the words of M1-W003, copied)",
          r"Then the least-dimensional such $X$ is the torus $\Ttwo$, on which",
          r"Under clause~(c) of Definition~\ref{def:minimal} the fibre is the torus $\Ttwo$, on which")
    t.delete("A-18", "If $\\dim X=2$, Franks' theorem \\cite{Franks1970} states that every Anosov diffeomorphism of a compact surface lives on $\\Ttwo$ and is topologically conjugate to a hyperbolic linear automorphism.\n\n")
    t.delete("A-19", "\n\nClause~(c) of Definition~\\ref{def:minimal} selects the least dimension; the selection is unconditional, resting on Franks' theorem at the minimal case, while the non-existence of exotic Anosov manifolds in dimension four and above, an open conjecture, is not needed.")

    # ---- A-20, A-21, A-22: "stabiliser" for the algebra at a point ----
    w29 = W(29)
    fixed = "the subalgebra of $\\Hquat$ fixed by those of the fold and one step of the drive that leave the point in place"
    assert fixed in w29
    t.sub("A-20 (the words of M1-W029, copied)", "and the surviving algebra at a point is what its stabiliser fixes.",
          "and the surviving algebra at a point is " + fixed + ".")
    t.sub("A-21 (COMPOSED 6)",
          r"A point with trivial stabiliser, which by Definition~\ref{def:A4}(iii) is a generic point, has nothing fixed and carries $\Hquat$.",
          composed(6, r"A point that neither the fold nor one step of the drive leaves in place has nothing fixed and carries $\Hquat$."))
    t.sub("A-22 (COMPOSED 7)",
          r"\emph{The stabilisers.} Under $\langle\iota,M_{0}\rangle$ on $\Ttwo$: $P_{1}$ has stabiliser $\langle\iota,M_{0}\rangle$ and algebra $\Fix(\text{conj})\cap\Fix(\Ad_{w})=\R$; $P_{2},P_{3},P_{4}$ have stabiliser $\langle\iota\rangle$ and algebras $\C_{j},\C_{i},\C_{k}$ (Appendix~\ref{app:labels}); a point such as $(\tfrac13,0)$ is moved by $\iota$ to $(\tfrac23,0)$ and by $M_{0}$ to $(\tfrac23,\tfrac13)$, has trivial stabiliser, and carries $\Hquat$.",
          composed(7, r"\emph{The algebra at a point.} $P_{1}$ is left in place by $\iota$ and by $M_{0}$, and its algebra is $\Fix(\text{conj})\cap\Fix(\Ad_{w})=\R$; $P_{2},P_{3},P_{4}$ are left in place by $\iota$ and not by $M_{0}$, and their algebras are $\C_{j},\C_{i},\C_{k}$ (Appendix~\ref{app:labels}); a point such as $(\tfrac13,0)$ is moved by $\iota$ to $(\tfrac23,0)$ and by $M_{0}$ to $(\tfrac23,\tfrac13)$, is left in place by neither, and carries $\Hquat$."))

    # ---- A-23: the aspect ratio as the one continuous datum of the fibre ----
    t.delete("A-23", r", and the ratio of the periods is the one continuous datum of the fibre, its aspect ratio $\tautwo=L_{\omega}/L_{\psi}$, which this paper does not fix")

    # ---- A-24, A-28: the "two readings" of Proposition 7.2 ----
    t.delete("A-24", "Two readings enter and are named: that complexification is forced, which is Proposition~\\ref{prop:spinc}'s statement that spinor-valued data are complex; and that the geometry records directions rather than vectors, which is the scale-freeness of A3 together with the absence of an overall scale (Section~\\ref{sec:minimal}).\n\n")
    t.sub("A-28", r"is the least direct step and is tagged \rigD\ with its two readings named.", r"is the least direct step and is tagged \rigD.")

    # ---- A-26, A-27: the aspect ratio in the deflationary reading; the failure sentence ----
    t.delete("A-26", ", and it does not derive the aspect ratio of the fibre")
    w28 = W(28)
    assert w28 == "with the continuous data of the geometry that this paper does not derive held fixed, which is its one declared input,"
    t.sub("A-27 (COMPOSED 8)",
          "That this proportion is fixed is the declared input of the theorem; it would fail if the stationarity conditions of the geometry's energy left it free, and the geometry would then not meet clause~(a).",
          "\n" + composed(8, "That the continuous data of the geometry that this paper does not derive are held fixed is the one declared input of the theorem; it would fail if a continuous datum of the geometry that this paper does not derive were not held fixed, and the geometry would then not meet clause~(a).") + "\n")

    # ---- A-29: "corner unit groups" in row E7 ----
    t.sub("A-29", r"$M_{2}(\R)$ as fibre algebra & non-compact corner unit groups &", r"$M_{2}(\R)$ as fibre algebra & non-compact unit groups &")

    # ---- ruled at P159: the statement of Theorem 8.1 lists the integer two on S^2 (COMPOSED 1) ----
    assert "On $\\Stwo$ the canonical structure has the integer two." in W(36)
    t.sub("P159 (COMPOSED 1)", r"determinant line $\Oline{3}$, $\chi(\Keight)=12$ and dimension twelve.",
          r"determinant line $\Oline{3}$," + "\n" + composed(1, r"the integer two on $\Stwo$,") + "\n" + r"$\chi(\Keight)=12$ and dimension twelve.")
