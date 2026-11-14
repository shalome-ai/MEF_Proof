#!/usr/bin/env python3
"""Build M1 v7.0 from canon v6.3 and the active entries of papers/M1/WRITE_LOG.md,
by tools/Paper_assembly_protocol.md (Decision Log P159-P162; papers/M1/HANDOVER_BUILD.md).

  python3 tools/m1_build_v7_0.py A     # canon v6.3            -> papers/M1/build_v7/passA.tex
  python3 tools/m1_build_v7_0.py B     # passA.tex + edits B   -> papers/M1/build_v7/passB.tex
  python3 tools/m1_build_v7_0.py C     # passB.tex + edits C   -> papers/M1/build_v7/passC.tex
  python3 tools/m1_build_v7_0.py D     # passC.tex + edits D   -> papers/M1/build_v7/passD.tex
  python3 tools/m1_build_v7_0.py E     # passD.tex + edits E   -> papers/M1/build_v7/passE.tex

Run from the repository root.  Rules:
- A statement of the write-up log is never typed here: it is taken from the log by its number, W(n).
- Every edit is named and must match exactly once.
- Pass A: the thirty-five active entries go in word for word, each at its place
  (HANDOVER_BUILD section 4); nothing else of v6.3 is touched.
- Passes B and C: delete or copy, never compose.  The edits are in
  papers/M1/build_v7/edits_B.py and edits_C.py, each tied to an error of the log before it.
- Pass D: flow, fenced (edits_D.py): paragraphs reordered, paragraph breaks, marked linking
  sentences; no sentence reworded (tools/passD_check.py).  Pass E: what the meaning check of
  D against C puts back, by copying (edits_E.py).
"""
import importlib.util, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CANON = ROOT / "canon/M1/Paper_M1_Six_Axioms_v6_3.tex"
OUT = ROOT / "papers/M1/build_v7"
LOG = ROOT / "papers/M1/WRITE_LOG.md"


def log_entries():
    spec = importlib.util.spec_from_file_location("wlc", ROOT / "tools/writelog_check.py")
    m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m)
    return {e[0]: (e[1], e[2]) for e in m.entries(LOG.read_text(encoding="utf-8"))}


ENTRIES = log_entries()
USED = []


def W(n):
    """The statement of entry M1-Wnnn, exactly as logged.  Only an active entry may be used."""
    eid = f"M1-W{n:03d}"
    status, st = ENTRIES[eid]
    assert status == "active", f"{eid} is {status}"
    USED.append(eid)
    return st.strip("\n")


class Text:
    def __init__(self, s):
        self.s, self.n, self.names = s, 0, []

    def sub(self, name, old, new):
        c = self.s.count(old)
        assert c == 1, f"[{name}] {c} matches for: {old[:80]!r}"
        self.s = self.s.replace(old, new); self.n += 1; self.names.append(name)

    def after(self, name, anchor, new, sep="\n\n"):
        self.sub(name, anchor, anchor + sep + new)

    def before(self, name, anchor, new, sep="\n\n"):
        self.sub(name, anchor, new + sep + anchor)

    def delete(self, name, old):
        self.sub(name, old, "")


def passA():
    src = CANON.read_text(encoding="utf-8")
    L = src.split("\n")
    t = Text(src)

    def line(n, starts):
        """Line n of canon v6.3 (1-based), checked against its opening words."""
        s = L[n - 1]
        assert s.startswith(starts), f"canon l.{n} does not start with {starts!r}: {s[:60]!r}"
        return s

    # ---- entries that replace a canon passage one for one ----
    t.sub("W025 Definition 2.4", line(190, "A geometry satisfies A2 if: (i) at least one product"), W(25))
    t.sub("W016 Definition 2.7", line(214, "The fibre algebra acts on the geometry at two levels"), W(16))
    t.sub("W021 Definition 2.8", line(220, "A homogeneous space $G/H$ formed from"), W(21))
    t.sub("W006 Definition 2.9", line(232, "A geometry satisfies A4 if"), W(6))
    t.sub("W027 Definition 3.1", line(258, r"A \emph{modulus} of a geometry"), W(27))
    t.sub("W012 Definition 3.2, opening", line(262, r"A geometry satisfying A1--A5 satisfies A6"), W(12))
    t.sub("W010 Definition 3.2, clause (c)", line(268, "(c) what is needed is least"), W(10))
    l449 = line(449, r"Let $\iota$ act on the fibre algebra")
    assert l449.endswith(r" \rigR")
    t.sub("W017 Lemma 5.1 (the tag of canon kept)", l449, W(17) + r" \rigR")
    t.sub("W015 step of the proof of Proposition 5.2", line(467, "A1 requires every factor, the corner fibres included"), W(15))
    t.sub("W029 Proposition 5.6", line(521, r"Let $\langle\iota,M_{0}\rangle$ act on"), W(29))
    t.sub("W019 Proposition 7.2", line(677, "Let the three imaginary units be made complex-valued"), W(19))
    t.sub("W024 Definition 7.4, second paragraph", line(719, r"A \emph{state of the fibre at rest} is"), W(24))
    t.sub("W023 Definition 7.4, last paragraph", line(725, "Two states of the fibre at rest have the same shadow"), W(23))
    t.sub("W028 Theorem 8.1, the declared input", "with the aspect ratio of the fibre held by a declared sector,", W(28))
    t.sub("W037 row E2", line(1003, r"$D\not\equiv0\ (4)$"), W(37))
    t.sub("W038 row E3", line(1004, "$D=4$, $D=8$"), W(38))
    t.sub("W040 row E8", line(1009, r"$T^{n}$, $n\neq2$, as fibre"), W(40))
    t.sub("W041 row E9", line(1010, r"$T^{4}/\Z_{2}$, K3 as internal factor"), W(41))
    t.sub("W043 row E11", line(1012, "spin bases:"), W(43))
    t.sub("W030 row E12", line(1013, "bases with moduli:"), W(30))

    # ---- entries that are new, or not one for one: inserted whole, canon round them left standing ----
    t.after("W035 the tenth choice (after the paragraph that follows Definition 2.7)",
            line(217, "An almost-complex structure $I$ is a rule"), W(35))
    t.after("W032 Definition: the same geometry; unique (after Definition 3.2 and its paragraph)",
            line(271, "Clause~(a) is the statement that a geometry with a dial"),
            W(32) + "\n\n" + "\\begin{remark}[mirror image and run backwards]\\label{rem:mirror}\n" + W(34) + "\n\\end{remark}")
    t.after("W009, W004, W001, W005 (after the opening paragraph of Section 4)",
            line(277, "Let the fibre of $F$ carrying the drive be a torus"),
            W(9) + "\n\n" + W(4) + "\n\n" + W(1) + "\n\n" + W(5))
    t.after("W007 the points that return (in the proof of Proposition 4.1)",
            line(290, r"If $\lvert t\rvert>2$ the eigenvalues are real"), W(7))
    t.before("W013, W003, W008 (at the head of the proof of Proposition 5.5)",
             line(505, r"If $\dim X=2$, Franks' theorem"),
             W(13) + "\n\n" + W(3) + "\n\n" + W(8))
    t.after("W026 the geometry satisfies A2 (new proposition, at the end of Section 5)",
            line(602, "The four cone points are the geometry of Proposition"),
            "\\begin{proposition}[the geometry satisfies A2]\\label{prop:A2}\n" + W(26) + "\n\\end{proposition}")
    assert L[625] == r"\end{proof}" and L[627].startswith(r"\subsection{Worked cases}\label{sec:dim-worked}")
    t.before("W031 remark: where the quaternionic structure carries information (after Theorem 6.1)",
             r"\subsection{Worked cases}\label{sec:dim-worked}", W(31))
    t.after("W036 the integer two on S^2 (in the paragraph of l.712)",
            "and the canonical structure has zero on the torus.", W(36), sep=" ")
    t.after("W020 the base has no further factor (proof of Theorem 7.10)",
            line(953, r"Propositions~\ref{prop:S2}, \ref{prop:CP2}, \ref{prop:spinc}, \ref{prop:S3} supply the factors."),
            W(20))

    active = sorted(k for k, v in ENTRIES.items() if v[0] == "active")
    assert sorted(USED) == active, f"entries not placed exactly once: {set(active) ^ set(USED)}"
    return t


def later_pass(src_name, edits_name):
    t = Text((OUT / src_name).read_text(encoding="utf-8"))
    spec = importlib.util.spec_from_file_location(edits_name, OUT / f"{edits_name}.py")
    m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m)
    m.apply(t, W)
    return t


def main():
    stage = sys.argv[1] if len(sys.argv) == 2 else ""
    OUT.mkdir(parents=True, exist_ok=True)
    if stage == "A":
        t, dst = passA(), "passA.tex"
    elif stage == "B":
        t, dst = later_pass("passA.tex", "edits_B"), "passB.tex"
    elif stage == "C":
        t, dst = later_pass("passB.tex", "edits_C"), "passC.tex"
    elif stage == "D":
        t, dst = later_pass("passC.tex", "edits_D"), "passD.tex"
    elif stage == "E":
        t, dst = later_pass("passD.tex", "edits_E"), "passE.tex"
    else:
        sys.exit(__doc__)
    (OUT / dst).write_text(t.s, encoding="utf-8")
    print(f"{t.n} edits applied; written papers/M1/build_v7/{dst}")
    for nm in t.names:
        print("  -", nm)


if __name__ == "__main__":
    main()
