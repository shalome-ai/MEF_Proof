# M2 — handover for the session that starts M2 (written 11 November 2026)

Rewritten from zero at the PI's direction (Decision Log P67). It replaces the brief of 10 November and its layered notes; the earlier text is in git history.

## How the session starts
1. The handshake and the reading order of CLAUDE.md §1.
2. **The PI opens the chat with a "my musings:" statement** of how the PI reads the six axioms and what that means for M2 (P67). A statement opened that way is narrative to be translated: not a ruling, not a premise (CLAUDE.md §3; P53). The session returns the translation, with where a physicist or a mathematician would hear something else, and waits.
3. Then the drafts of `registers/Rulings_In_Force.md` §4 are taken **one by one** through the read-back rule. **They are drafts and not rulings** (P52). None is a premise until the PI confirms its read-back.
4. Only then: the assumption list for the paper and its SOW/DAG (`sow/M2/SOW_DAG.md`, not yet written), shown to the PI before any derivation.

## The task
Write M2, the field equation on the geometry of M1, from scratch on M1 v6.3, as if no earlier M2 existed (P40, P41, P43). The PI supplies the axioms and direction; M2 is derived from M1; the old corpus and the PI's earlier texts are not used to derive and are compared with afterwards.

## The PI's direction on method (P67), in the PI's words, not yet read back
- "M2 must be derived as we first derived M2 looking at small movements around the shapes".
- "My musing: 'you are creating a vector field'".

Both are for the read-back at the start of the session. Two points the architect has put to the PI and that are **not settled**:
- "As we first derived M2" names the method of the withdrawn M2 v1.0, which this session must not read (below). The method is therefore to be stated by the PI in words; it is not to be looked up.
- "Small movements around the shapes" allows two meanings: moving the points of the shape along the shape, and changing the shape itself. Which is meant is asked, not inferred.

## What exists
- **M1 v6.3 in canon:** `canon/M1/Paper_M1_Six_Axioms_v6_3.tex` and `.pdf` (44 pp.; six axioms; nine numbered choices; certificates L1–L4, L6, L7 in `MEFProof/Paper_M1/`). The only paper M2 may cite, besides external peer-reviewed results. Numbering maps: `canon/M1/NUMBERING_v2_to_v5.md`, `NUMBERING_v5_to_v6.md`.
- **No M2:** no draft, no SOW/DAG, no assumption list, no certificates (`MEFProof/Paper_M2/` is to be created).
- **Rulings in force for M1:** `registers/Rulings_In_Force.md` §§1–3.

## What must not be read until the new derivation is written and recorded (P41, P43)
- `superseded/M2_v1/` (the withdrawn M2 v1.0, its certificates, plan and audit notes).
- The ledger's section on M2 v1.0 and the section of targets after it.
- The rows headed "M2 v1.0" in `registers/Minimality_Register.md`.
- Definitions Register rows that cite `M2_WP…`; Verified References rows that cite M2, its work packages or `papers/M2/…` notes.
- The display of the Master Equation in `canon/omega-definition-usage_v2.md` (its §6a, the forbidden names for ω, may be read).
- `papers/M1/LIFT_SIGN.md` §5 (it speaks of the old ζ count).
- The series plan's rows for M6, M7, M10 and M16 carry wording from the withdrawn paper.
- Do not search the ledger or the registers for "M2": a search of that kind broke blindness on 11 November.

When the derivation and its results are written and recorded, and only then, they are compared with the withdrawn paper and with the canonical form of the Master Equation.

The old corpus in `sources/` is read only to look for a datum when a step does not follow, and is never cited.

## What M1 v6.3 provides (M1's numbering)
- Six axioms. Nine numbered choices: Def 2.1(i); Def 2.1(ii), (iii); Def 2.3; Def 2.4(i); Def 2.7; Def 2.8; and clauses (a), (b), (c) of Def 3.2.
- Def 2.1: M = (T × Σ) × F; what is seen is the image under the projection that forgets F; the shadow, with its clauses (ii) and (iii). Rem 2.2.
- Def 2.4: the growth law, a warped product with dw/ds = κw and an involution exchanging κ and −κ. M1 does not say which piece is scaled or on which piece the function lives (P37).
- Def 3.2: the sixth axiom made formal as minimality: (a) nothing is left to be chosen, (b) nothing is present that is not needed, (c) what is needed is least. Clause (a) declares its count of drives: a mirror image is another drive, and a drive run backwards is another drive; neither is derived (P63, P66).
- The drive: one step is M₀ = ((2,1),(1,1)), trace three by clause (a), with least entropy agreeing; eigenvalues φ^{±2}; 2 log φ per step (Thm 4.2, Thm 4.3, Prop 4.4, Prop 4.5).
- The fibre: the quaternions; the torus with the fold; the four corners with algebras ℝ, ℂ_i, ℂ_j, ℂ_k; the pillowcase with four cone points of angle π (§5).
- Dimension twelve; the four-dimensional time–space block; the split (3, 6) (Thm 6.1, Rem 6.2).
- The base ℂP² × S²; a Spin^c structure with determinant line 𝒪(3) (Props 7.1–7.3).
- The twist of the fibre: flux three; one odd, cycled corner (Def 7.4, Lemma 7.5, Prop 7.6). The corner lift (Cor 7.7). The time circle of three steps, the drive on spinors being −w, of cube +1 (Cor 7.8; P58).
- Σ = S³; χ(K₈) = 12 (Prop 7.9, Thm 7.10).
- Thm 8.1: the shape. Overall size has no meaning; the aspect ratio of the fibre is the one declared input.
- ω, ψ, ψ̄ and Φ_QC do not appear in M1 (P43(1)).

## Open, carried into M2
- **Owed by M2:** which piece the warp scales, and how the display of K₈ is read or written (Future-Mx F-10; P30, P37; the PI's hypothesis that the order in the display should be reversed is recorded in P37 and is not a ruling).
- **For the PI, found while finishing M1:** M1 does not define when two geometries are the same (`papers/M1/ORIENTATION_AND_TIME.md` §4).
- **Declared in M1 and not derived:** the mirror half of the count of clause (a); that every symmetry of the torus is given an element on spinors (Cor 7.8).
- **References not read at source:** Gödel 1931 (V-25); the pages of Gauss (V-12) and of five other references that need a library copy (V-10, V-19, V-21, V-22, V-23).
- Leads, never premises: Decision Log P42, P46(4), P53, P63–P65, P67.

## Needs a ruling
- None before the PI's opening statement and the read-back of the drafts.
