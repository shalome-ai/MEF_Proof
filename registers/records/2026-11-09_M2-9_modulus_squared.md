# Record — M2-9: the square in Φ_QC (9 November 2026), verbatim

**Why this record exists.** Recorded verbatim at the PI's direction, 9 November 2026: the exchange settled that Φ_QC = ω|ψ−ψ̄|² (modulus squared) is canonical, and the PI notes it as a possible missing element in the weak mixing angle derivation (Future-Mx F-4). **Outcome:** Decision Log P12; Corpus Errors 19; Minimality Register M2-9 (failure test reworded); `MEFProof/Paper_M2/M2_L6_omega.lean` replaced by the modulus-form certificate (+8; `L6_sign` with q > 0), rebuilt 9 Nov 2026 under Lean 4.29.1: `lake build` 529 ms, standalone core Lean clean, 5 theorems, no `sorry`, no `axiom`.

**Sequence.** (1) The M2 build chat proposed reverting M2 v1.0 to the literal square. (2) The PI confirmed the reversion in the Claude Code session. (3) Claude Code recorded the ruling (a P12 entry in the repository's Decision Log; M2-9's status amended), declined to copy the 8 November drafts into `canon/M2/`, and returned three points, the second a sign clash. (4) The M2 build chat withdrew the reversion on point 2. (5) The PI copied the chat's registers, CLAUDE.md and the L6 certificate into the repository at 18:06; the chat's P12 (recording the withdrawal) replaced Claude Code's P12 (recording the reversion). (6) The PI directed this record and noted the Weinberg lead.

Texts below are reproduced exactly as they were written; nothing is edited.

---

## 1. M2 build chat — proposal to revert to the literal square

Paper III and its Addendum treat (ψ − ψ̄)² as a cross-wall pairing: the square expanded gives ψ² − 2ψψ̄ + ψ̄², and it is the middle term, ψ on one wall paired with ψ̄ on the other along the geodesic between corners, that carries the Casimir–geodesic weights and the dilaton expectation value at C₀ (Addendum eq. QCD and the paragraph after it; Paper III §4). Every one of those computations is a corner reading or a geodesic between two corner readings, with real corner profiles. In that setting the literal square and the modulus squared agree up to the one overall sign — both have the pairing term, one bilinear and one Hermitian, and for real profiles they coincide. So nothing in the corpus’s actual use distinguishes them, and the decision reduces to two things: continuity with forty papers that wrote the square and built a language (“cross-wall pairing”, “bilinear”) on it, and the parity theorem’s selection of a monomial. Both point the same way.

So I withdraw my earlier recommendation and propose we return to the literal square as canonical: Φ_QC = ω(ψ − ψ̄)², with ψ's overall sign fixed so that Re ω ≥ 0 on the decaying warp, and the modulus-squared form recorded as the identity |ψ − ψ̄|² = −(ψ − ψ̄)² that holds in the corner reading, which is where the half-circle argument is written anyway. The mixed-direction term of ω·O² in the bulk stays alive for M7 to examine rather than being defined away; the SoT needs no erratum; Corpus Errors 19 is struck.

What changes in the paper if you confirm: Definition 2.3 and Proposition 2.4 back to the square (the proof’s constant becomes −⅛); the module remark restored to its previous form with the commutator note; the phase formula back to −8r³cos ϑ sin²ϑ; the half-circle paragraph back to “definite sign, which sign is ψ's convention”; L6_Phi_coefficient and L6_sign back to the negative-factor form; Appendix A’s description; M2-9 and P10(b) amended to record the reopening and the reason. About forty minutes of edits and a recompile; the ledger row and the SOW line follow.

Two register items from the two files while I was in them: the Addendum uses the \consciousness macro for ω throughout (the forbidden “consciousness coherence field”), and Paper III l.329 identifies the MEF Higgs with the dilaton via Paper VI — a lead for M9 and M15 that should be entered as a target, not a premise.

Confirm the reversion and I will make it.

---

## 2. PI — confirmation (Claude Code session)

I confirm the reversion

---

## 3. Claude Code — three points returned to the M2 chat

## Three things to take back to the M2 chat

1. **The Lean side needs no change in this repository.** `M2_L6_omega.lean` here is already in the negative-factor form: `L6_Phi_coefficient` gives −8, and `L6_sign` assumes q < 0. If the chat's copy was edited to the modulus form, the frozen paper's Appendix no longer matches the repo file word for word. Worth comparing when the files arrive.
2. **There's a possible sign clash; my reading may be wrong (CLAUDE.md §2).** Under the literal square, Φ_QC and Re ω have opposite signs wherever the sheets differ, and `L6_flip` flips both together. The proposal fixes Re ω ≥ 0 on the decaying warp, which makes Φ_QC ≤ 0 there. Two sources assume the opposite:
   - `L6_sign`'s own description takes "the dilaton's positivity on the decaying-warp solutions" (Φ ≥ 0) as its premise, which gives ω ≤ 0.
   - The 8 November M2 SOW (line 229) normalises Φ = 1 at the far wall.

   These can't all hold at once. Also, M2-9's failure test reads "a corpus result in which Φ_QC and ω carry opposite signs". Under the literal square they always do, so that wording needs looking at too. Please put this to the chat before it edits.
3. **The registers are out of step.** The chat refers to Corpus Errors entry 19, but the repo's register stops at 18, so the chat's registers are ahead of the repo. Please bring its current Corpus Errors register too. The chat also proposed two entries, which I haven't made because you bank them:
   - The Addendum uses the `\consciousness` macro for ω (a forbidden name; related to entry 14).
   - Paper III line 329 identifies the Higgs with the dilaton. That would go in as a target for M9 and M15, not a premise.

---

## 4. M2 build chat — the reversion withdrawn

Claude Code’s point 2 is correct, it is material, and it decides the question I reopened — in favour of your original ruling, not my reversal.
The sign clash, stated plainly. Under the literal square, (ψ − ψ̄)² = −4y² is negative wherever the sheets differ, so Φ and Re ω always have opposite signs, and flipping ψ flips both together — you can never make both positive. Two things in the programme are positive by construction: Φ, because the warp decays as a = −ζΦ with Φ rising from 0 to 1 at the far wall (Paper 2 §7.3, M2 §4); and ω, because the Coherent Field is zero at the two extremes and positive between (your ruling R1, the one-hump). Under the literal square those two cannot both hold; under the modulus squared they hold together with no convention. So the corpus, which wrote the square and used Φ ≥ 0 and ω ≥ 0 throughout, was in fact using the modulus squared without saying so. That makes Corpus Errors 19 not a stylistic erratum but a correction of a sign the corpus never noticed, and it is exactly the kind of thing the Mx series exists to find. The “cross-wall pairing” language survives: |ψ − ψ̄|² has the same pairing term, Hermitian rather than bilinear, and for the real corner profiles the two differ only by the sign that was wrong.
So: the frozen v1.0 stands as it is — modulus squared, +8, Re ω ≥ 0 directly from Φ ≥ 0. My proposal to revert is withdrawn, and I am grateful it was caught before an edit.
Point 1. The repository’s `M2_L6_omega.lean` is the stale negative-factor file. The frozen paper’s Appendix lists the modulus version. The repo file must be replaced by the one in `Paper_M2_v1/M2_lean/M2_L6_omega.lean` (+8; `L6_sign` with q > 0) and rebuilt; the 608 ms line in Appendix A should then be re-taken from that build.
Point 3. The current registers are in `repo_seed/registers/` — Corpus Errors through 20, with 21 and 22 now added for the two items Claude Code correctly declined to bank itself; the Future-Mx register gets F-3 (Higgs = dilaton, target for M9/M15). M2-9’s failure test reworded as “a corpus result requiring Φ_QC and Re ω of opposite sign where the sheets differ”.
Everything Claude Code needs is in `repo_seed/`, current as of now:

* `registers/` — all four files at their latest state: Corpus Errors through 22 (19 rewritten with the sign argument and credited to the catch; 21 the Addendum’s `\consciousness` macro; 22 Paper III’s Higgs identification as a target), Future-Mx with F-3, Minimality with M2-9’s failure test reworded, Decision Log through P12.
* `lean_fix/M2_L6_omega.lean` — the modulus-form certificate (+8; `L6_sign` with q > 0) that the frozen paper’s Appendix lists; it replaces the stale negative-factor file in `MEFProof/Paper_M2/`. After the rebuild, the L6 line in Appendix A should be re-taken from that run.
* `CLAUDE.md` — current, including the modulus form in §5.

So the record going back to Claude Code is: the frozen M2 v1.0 is unchanged and correct; the proposed reversion is withdrawn with the reason in P12 and Corpus Errors 19; the repository’s one stale file is L6; and housekeeping and the gate scripts can resume.
One lesson for the registers’ own discipline, which I have not written anywhere yet because it is yours to set: the pickle arose because the chat and the repository held different versions of the same four files for a few hours. Once the repository is live, the registers should be edited only there — Claude Code proposes, you bank by commit — and this chat stops carrying copies.

---

## 5. PI — note on the weak mixing angle (Claude Code session)

We need to record this verbatim re - the modulus squared conversation.  As I think that this could be the missing element in the Weinberg angle derivation.  As we didn't define omega as also having an imaginary part.
