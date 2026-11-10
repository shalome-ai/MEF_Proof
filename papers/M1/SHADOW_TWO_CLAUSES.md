# The fifth axiom in two clauses, and what each forces on the fibre

**10 November 2026.** Directed by the PI (assumptions 1–6 of this exchange, agreed; record §26; Decision Log P33). The PI's idea: the shadow does two things, "the same shadow can be describing two different objects, and a single object can have multiple shadows", and one twist of the fibre causes each. This note states the two halves as formal clauses and tests what each forces. **Nothing in the M1 draft has been edited.**

**Result in one line.** Taken together, with the least flux, the two clauses force three units of flux on the fibre torus with one odd corner, a cycled one. That is the datum Corollary 7.4 lacked (`CORNER_LIFT_DERIVATION.md`). It holds when the states are counted on the pillowcase; counted on the covering torus the answer is two units.

**Disclosure (CLAUDE.md §2b).** The wanted answer (three, one odd corner) was known to me before I computed. Two choices in what follows were made by me and both affect the answer; they are marked **[choice]** and set out in §4. The computation was given to a blind checker as a neutral problem with no target; it derived the same numbers by an independent method (§5). **Check script:** `checks/shadow_clauses_check.py` (Z1–Z8 pass).

## 1. The terms

| Term | Meaning here | Status |
|---|---|---|
| fibre | the pillowcase T²/ι of M1 Thm 5.7, with covering torus E | M1 |
| flux d | the degree on E of the line by which the fibre's spinors are twisted | `CORNER_LIFT_DERIVATION.md` D7–D8 |
| half-turn (Möbius) twist | one of the three flat twists, i.e. the three spin structures of E other than the one every symmetry preserves | same, D1–D4 |
| corner pattern | the signs with which the lifted fold acts at the four corners, up to one overall sign | same, §1 |
| state | a state of the fibre at rest: for d ≥ 1 a holomorphic section of the degree-d line; equivalently a function on E with poles bounded by a divisor D of degree d on the corners | **[choice]**, the PI's assumption 2 as I formalised it. That the states at rest of the twisted Dirac operator are these sections is standard and **RECALLED**, not verified against a reference |
| state on the pillowcase | a state unchanged by the lifted fold | follows from "the fibre is the pillowcase" |
| shadow of a state | what is left of it when the fibre is forgotten; two states of the fibre at rest over the same point of T × Σ have the same shadow | **[choice]**, as above |

## 2. The two clauses

- **Clause I (one object, several shadows).** The structure carried by the fibre is not carried to itself by one step of the drive.
- **Clause II (one shadow, several objects).** The fibre has at least two independent states with the same shadow.

The plain projection of the draft's Definition 2.1 satisfies neither in this sense: it gives each object one image, and with no flux and no twist the fibre has no multiplicity of states that a twist could account for.

## 3. What is forced

| # | Statement | Status |
|---|---|---|
| F1 | A line of degree d ≥ 1 on E has exactly d independent sections | **CHECKED**: numerical rank for every divisor on the corners up to degree 4 (Z2); blind check by Riemann–Roch |
| F2 | The fold acts on them with eigenvalues ±1; the number unchanged by the fold is (d + half the sum of the four corner signs)/2 | **CHECKED** in all 70 cases (Z3, Z4). Blind check: proved in general by a different route (even functions are functions on the quotient sphere), and the same formula |
| F3 | The drive carries a corner pattern to itself only if all four corners are alike or the odd corner is P₁; every other pattern returns after three steps | **CHECKED** (Z5; `corner_lift_check.py` K8); blind check agrees |
| F4 | With no flux: the untwisted structure has states at rest (the constants); each of the three half-turn twists has none | **CHECKED** by hand (a harmonic spinor on a flat torus is constant, and a constant has the wrong periodicity unless the twist is trivial) and Z1. *My recalled value "lowest eigenvalue π" was wrong for one of the three (it is π√2 on the square torus); corrected by the check* |
| **G1** | **Clause I alone**, least flux: no flux and a half-turn twist. Three of them, cycled by the drive: one structure, three appearances, and a time circle of three steps. The fibre then has no state at rest: it is hidden | follows from F3, F4; minimality on the flux **[choice of criterion]** |
| **G2** | **Clause II alone**, least flux: two units, with all four corners alike. Every such structure is one the drive leaves in place | **CHECKED** (Z6); blind check agrees |
| **G3** | **Clauses I and II together**, least flux: **three units; one corner odd; the odd corner one of the three the drive cycles.** Two states on the pillowcase and one removed by the fold | **CHECKED** (Z7). Blind check: "R1 and R2 together: least degree 3"; degree 2 fails because two states on the pillowcase force all corners alike, which the drive fixes; in degree three, three structures, "cyclically permuted by M₀", each with a two-dimensional invariant space for one lift |
| G4 | If the two states of Clause II are counted on the covering torus, not on the pillowcase: two units, two corners of each sign | **CHECKED** (Z8); blind check agrees ("drops to degree 2") |

G3 is, item for item, what M1 Corollary 7.4 asserts and Decision Log P28 rules: one odd corner, a cycled one, with the degree three that Paper XV takes as an external datum.

## 4. The two choices that decide the answer

1. **Where the states are counted.** On the pillowcase (unchanged by the fold) the answer is three; on the covering torus it is two (G4). M1's fibre is the pillowcase (Thm 5.7), so counting there is the reading M1 supports. But I looked at the torus count first, saw two, and then counted on the pillowcase. That order is a red flag under §2b.4 and I record it.
2. **The lift.** A structure has two lifts of the fold, differing by an overall sign, and they exchange "unchanged" and "removed". For three units one lift keeps two states and the other keeps one. G3 says a structure with two states on the pillowcase exists at three units and not below; it uses the freedom to take the lift that keeps two.

Also a choice, of a lesser kind: that "least flux" is the minimal option. It is a new use of the minimality principle and needs its register entry.

## 5. Blind check

A fresh sub-agent was given the torus, the fold, the drive's action on the corners, and the task of computing, for sixteen named divisors, the states kept and removed by the fold and the behaviour of the patterns under the drive, and then of finding the least degree meeting each requirement and both. It was not told what was wanted or what any of it was for. It worked by the classical functions (℘, ℘′) and not by my numerical method. Its answers: requirement I alone, degree one (zero if flat twists are allowed); requirement II alone, degree two; both, **degree three**; with the torus count, degree two. Its caveats, adopted:
- The drive is not a holomorphic map of E, so "the drive carries the structure" means a relabelling of the four corners. The counts depend only on the pattern, so the answers are unaffected.
- Which states count as kept belongs to the lift, not to the line alone (choice 2 above).
- Every symmetric line of a given degree is covered by the divisors on the corners, so no other line changes the answer.

## 6. What is not shown

- **That this three is the three of ℂP².** Here three is the least flux meeting both clauses. In M1 the three of ℂP² is its first Chern class. They are the same number; no step identifies them.
- **That the clauses are the fifth axiom.** They are my formalisation of the PI's two sentences. The identification of "object" with a state of the fibre at rest and of "shadow" with what is left when the fibre is forgotten is a reading (assumption 2), and it is the step no computation checks.
- **The energy.** "At rest" uses the Dirac operator of the Spin^c structure, which M1 has (Def 2.7 gives the spinor bundle) but does not use.

## 7. Failure tests

- G3 fails if the states of the fibre are to be counted on the covering torus (then two units, no odd corner).
- G3 fails if the lift of the fold is fixed by something else to be the one that keeps a single state at three units (then the least is four units, with two corners of each sign).
- Clause I fails as a requirement if the series needs a structure on the fibre that the drive leaves in place.
- The reading fails if a later paper needs the shadow of a state to retain its dependence on the fibre.

## 8. For the PI

1. Are Clauses I and II what you mean by the two things the shadow does?
2. Is the pillowcase the right place to count the states (choice 1)?
3. If yes to both: Corollary 7.4 would rest on the fifth axiom, with the degree three derived and not an external datum, and P32 ("nothing more") is superseded. Shall I write that into the M1 draft?
