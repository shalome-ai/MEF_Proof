# F1 Erratum & Convention Note — canonical form of the Master Equation dilaton term

**Ruling (PI, 10 July 2026, this session):** the Master Equation's dilaton term is the **canonical scalar stress tensor**, displayed in the compact form. This note is the citable record of the ruling; it governs all new documents.

---

## 1. The canonical form (mandatory in all new documents)

$$G_{MN} \;=\; 8\pi G_{\mathrm{eff}}\, T_{MN} \;+\; \zeta\, T^{\Phi}_{MN} \;+\; \Lambda_{\mathrm{eff}}\, g_{MN}\,, \qquad T^{\Phi}_{MN} \;\equiv\; \nabla_M \Phi_{\mathrm{QC}}\, \nabla_N \Phi_{\mathrm{QC}} \;-\; \tfrac{1}{2}\, g_{MN}\, \lvert \nabla \Phi_{\mathrm{QC}} \rvert^2$$

with ζ = 12π and Φ_QC = ω(ψ − ψ̄)² unchanged. Surgical LaTeX: `F1_eq_master_canonical.tex` (Option 2 is primary per the ruling). Consequences fixed by the form: the contracted Bianchi identity yields **□Φ_QC = 0** on the support of ∇Φ_QC; the stiff identity ρ_Φ = p_Φ = ½ζΦ̇² is a theorem of the equation; the budget display `eq:budget` is unchanged, with the normalisation note simplifying to q̃² = q².

## 2. Why (the three selectors — the evidence base of the ruling)

The outer-product form alone, via Bianchi consistency, forces 2Φ̈ + θΦ̇ = 0, hence ρ_Φ ∝ a⁻³ (dust-like), and the logarithmic Kasner profile fails to solve its equation of motion (WP6 symbolic layer, machine-verified). The corpus's own [R] results select canonical: (i) `prop:eos`(i) stiff p = ρ; (ii) `prop:eos`(iii) a⁻⁶ domination; (iii) `prop:nogo`'s log profile. The physics of the corpus was canonical throughout; the ruling makes the typeset equation match the derived corpus.

## 3. Blast radius (audited, this session)

- **Gradient-inactive sites** (Φ enters by value: Φ₀ > 0, mass bilinear, vacuum sectors) and **stress-free sites** (Betti/monodromy/corner/torsion results, incl. Paper 3 C1v2/C4v2: zero grep hits): both forms identical or irrelevant — **no action**.
- **Gradient-active dynamical sites** (collapse cluster, budget, no-go): canonical behaviour already used — **no action; consistency improves**.
- **Paper 5 v3 (BF, accepted draft): zero hits — no action.** Gates untouched.
- **One derivation-class touchpoint:** appendix C Λ_dilaton uplift bookkeeping (lines 876–935) read the outer-product form literally with active gradients — **targeted recomputation queued** (CC/sequestering strand, island Paper 2 territory; not part of G-BH-1R). Secondary prose recheck: Paper III Addendum line 1425 (coupling-existence claim; expected to survive verbatim).

## 4. Fossil ruling for existing displays

Existing corpus displays of the outer-product form (Paper I Addendum, Papers II, XI, XX, XXI, XXIII, appendix C/D, dead Paper 5 drafts v1–v2) are **fossil prose**: time-stamps, not verdicts, per the standing ledger methodology. They are corrected opportunistically when each document is next revised. The island-programme papers reproduce every equation fresh in-document and therefore inherit the canonical form natively at build time — no retrofit pass is needed for the five papers.

## 5. Staged deltas for the two governing files (PI banks; Claude never edits sources)

**Delta A — `MEF_Source_of_Truth` (Master Equation entry), replace the display with:**
> G_MN = 8πG_eff T_MN + ζ T^Φ_MN + Λ_eff g_MN,  T^Φ_MN ≡ ∇_M Φ_QC ∇_N Φ_QC − ½ g_MN |∇Φ_QC|²,  ζ = 12π, Φ_QC = ω(ψ−ψ̄)².
> *Convention note (F1 erratum, 10 Jul 2026): the dilaton term is the canonical scalar stress tensor; earlier displays showing the outer product alone are fossil prose. Induced scalar equation: □Φ_QC = 0.*

**Delta B — proof/derivation ledger (`eq:master` row), append:**
> *F1 erratum (10 Jul 2026): canonical completion ruled (PI). Selectors: prop:eos(i)[R], prop:eos(iii)[R], prop:nogo log profile. Old outer-product displays = fossil. Open follow-on: appendix C Λ_dilaton recomputation (CC strand). q̃ normalisation note: q̃² = q² under canonical.*

## 6. Mechanical guard (lint for all new documents)

Before circulating any new `.tex`/`.md`, run:

```
grep -n "nabla_M *\\\\QCD *\\\\nabla_N *\\\\QCD\|nabla_M \\\\Phi.*nabla_N \\\\Phi" FILE \
 | grep -v "tfrac{1}{2}\|frac{1}{2}.*g_{MN}\|T^{\\\\QCD}\|T\\^{\\\\Phi}"
```

**Any hit = violation** (outer product displayed without its trace companion or the T^Φ definition on the same construction). The WP6 pipeline default is already canonical (`scalar='canonical'`), with the as-written branch retained solely as the documented comparison switch.

## 7. Status effects (recorded in the WP8/WP9 registers)

H1 **discharged** (canonical ruled). WP1 §3 E4 repointed to □Φ_QC = 0 (surgical edit applied to `WP1_N1_reduced_system.tex`, this session). The E1 route fork is now the sole blocker on WP8 completion, alongside the PI items already queued (V-ruling, WP3 certificate, Lean compiles, Q1, calibration).
