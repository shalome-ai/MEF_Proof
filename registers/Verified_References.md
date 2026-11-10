# Verified References — the Mx series

*Every external theorem a paper of the series cites, with the statement as used, the source and page, and how it was checked (CLAUDE.md §2a; Decision Log P20). Opened 10 November 2026. A row marked **RECALLED** is quarantined: it may not be cited or used as a premise until it is verified against the published reference and its status changed. Claude proposes; the PI banks.*

**Columns.** # · Statement as used · Source · Wanted by · Status (VERIFIED: how, by whom, date / READ in a corpus paper that cites it / RECALLED) · Notes.

| # | Statement as used | Source | Wanted by | Status | Notes |
|---|---|---|---|---|---|
| V-1 | A compact Riemannian manifold is geodesically complete | Hopf–Rinow theorem; a textbook reference with page is to be supplied | M3 (completeness half of the fifth axiom; GBH1 completeness) | **RECALLED** | Standard, but not yet checked against a named page |
| V-2 | The operator ξ_k = 2i y^k (∂/∂τ̄)‾ maps harmonic Maass forms of weight k onto cusp forms of weight 2−k, with kernel the weakly holomorphic modular forms: 0 → M_k^! → H_k → S_{2−k} → 0 is exact | Bruinier and Funke (2004), as cited in `sources/Paper3_v13_Ramanujan.tex` ll.113, 244–247, 526–537 | M3 (remark on shadows); M5 | **READ in a corpus paper that cites it**; original not checked | Applies to the cone-tip projection of Paper 3, not to the twisted elliptic genus |
| V-3 | Einstein metrics on a fixed closed manifold need not be unique | Böhm, Invent. Math. 134 (1998); Besse, *Einstein Manifolds*, ch. 12 | M3 (S.2: uniqueness does not follow) | **RECALLED** | Both references from memory; statement and pages unchecked |
| V-4 | A double cover of the sphere branched over four given points is unique | classification of branched double covers; Thurston, ch. 13, for the orbifold statement | M3 (S.3, the smallest case) | **RECALLED** | The argument by the homomorphism to ℤ₂ is elementary and is given in `papers/M3/M3_WP1-4_verification.md` §3; the reference is unchecked |
| V-5 | Jacobi: ∏(1−qⁿ)³ = Σ (−1)^k (2k+1) q^{k(k+1)/2} | cited in Paper 3 l.498 (Mumford; Zagier) | M5 | **CHECKED** to q³⁰ (`papers/M3/checks/paper3_check.py`, item 3), 10 Nov 2026; reference page unchecked | — |
