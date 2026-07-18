# CFM appendix — defect note (Lean 4.15.0 / Mathlib v4.15.0)

Corrections found while discharging the machine-verifiable statements A.1–A.13 of
`CFM_Mechanism_Formal_Foundations_v12.tex` against a real toolchain. These are for
you to bank into the source `.tex`; the paper itself was not edited. Every item below
is confirmed by compilation — the corrected forms are what ships in
`CFM_Certificates.lean`.

## A. Proofs that did not compile as printed

**A.13 — `coupling_multiplier_lower_bound`.** The draft closes with
`simpa using Real.add_one_le_exp (c*d)`. In Mathlib v4.15.0 the lemma
`Real.add_one_le_exp` states `x + 1 ≤ exp x`, whereas the goal is `1 + c*d ≤ exp (c*d)`;
`simpa` does not bridge the `add_comm`. **Fix:** `have := Real.add_one_le_exp (c*d); linarith`.
The hypothesis `hc : 0 ≤ c` is unused; kept for signature fidelity per ruling D2.

**A.2 — `counterwound_no_common_invariance`.** The draft's `nlinarith [this]` after
`exp_injective` is fragile. **Fix:** `exp_injective` → `b*α = −(b*α)` → `linarith` to
`b*α = 0` → `mul_eq_zero` with `hb : b ≠ 0`.

## B. Proofs shipped as placeholders (`...` or `sorry`) — now written

- **A.3** (`no_rotation_exchanges_shells`) — was literal `...`. Proof: evaluate the
  universally-quantified hypothesis at θ = 0 (gives `exp(−bα) = 1`) and θ = 1, cancel
  `a0 > 0`, obtain `exp b = exp(−b)`, then `exp_injective` and `b ≠ 0` give the
  contradiction.
- **A.4** (`potential_unique_global_min`) — was `...`. The global-minimum inequality is
  proved via the exact factorisation
  `g(x) − g(x⋆) = bet · (1/4)(x − x⋆)²(4x³ + 3x⋆x² + 2x⋆²x + x⋆³)`,
  valid under the critical-point relation `4·lam + 5·bet·x⋆ = 0`; every factor is
  non-negative for `x, x⋆ > 0`. (This replaces a bare `nlinarith`, which cannot find the
  degree-5 factorisation unaided.)
- **A.5** (`reservoir_nonneg_and_bounded`) — was `...`. Same factorisation supplies the
  non-negativity. *Scope note:* the certificate proves the **lower** bound
  `ρ_res ≥ 0` on `0 < x ≤ x⋆`. The strict **upper** bound `ρ_res < ρ_sup` in the printed
  statement is an open/∞-limit statement (`ρ_res ↗ ρ_sup as Φ → ∞`); it is not part of the
  compiled certificate and is left as prose. Flagging in case you want the signature in the
  paper narrowed to match what is machine-checked.
- **A.6** (`quarter_turn_is_phi`) — was `...`. Proof: `(2 ln φ / π)(π/2) = ln φ` by
  `field_simp`, then `exp_log` with `φ > 0`.
- **A.8** (`holonomy_neutral_bilinear`) — was `sorry`. Proved in the **general
  finite-dimensional form** (no n = 1 fallback needed, so ruling D3 was not invoked):
  `|z| = 1 ⇒ conj z · z = 1` via `normSq`, then the `smul` pulls through `star`,
  `mulVec`, and `dotProduct`.
- **A.9** (`cycle_work_null`) — was `sorry`. Proved by rewriting the integrand as
  `deriv (G ∘ phi)` (chain rule) and applying FTC-2
  (`intervalIntegral.integral_deriv_eq_sub`), with `phi T = phi 0` collapsing the result.

## C. Signature deviation requiring your sign-off

**A.9 hypotheses strengthened.** The printed signature assumes
`Differentiable ℝ G` and `Differentiable ℝ phi`. FTC-2 additionally requires the
derivative to be **interval-integrable**, which bare differentiability does not deliver.
The certificate therefore assumes `ContDiff ℝ 1 G` and `ContDiff ℝ 1 phi` (C¹), which is
faithful to the intended object (a smooth drive cycle) and standard for an
equilibrium-response null, but is a genuine strengthening of the printed hypotheses.
**Decision for you:** either (a) update the paper's A.9 signature to `ContDiff ℝ 1`, or
(b) keep `Differentiable` in prose and carry the C¹ certificate as the machine witness
with a one-line footnote. I did not choose; it changes a printed statement.

## D. Group-B certificates added (marked "Yes (algebra)" in the ledger, no signature drafted)

- **B.14** (`em_channel_derivative`, Cor. `cor:channel`): `d/dΦ[¼·g⁻²(Φ)·F] = ¼·(dg⁻²/dΦ)·F`
  for fixed field `F`, via `deriv_const_mul`.
- **B.16** (`weinberg_angle_dilaton_independent`, Cor. `cor:weinberg`): with the coupling
  ratio `r` constant in Φ, `d/dΦ[(1+r)⁻¹] = 0`.

Group-B #15 (energy-balance identity) was **dropped** per ruling D1: it reduces to a
vacuous rearrangement of undefined symbols and is not a genuine mathematical certificate.

## E. Typesetting note (not a defect)

The certified listings contain Unicode Lean notation (ℝ, ≠, ·, ∘, ∫, ∀, ∃, ⬝ᵥ) beyond the
paper's current `\DeclareUnicodeCharacter` table. Per the corpus convention, compile the
appendix under **XeLaTeX with DejaVu Sans Mono** (fontspec) when these listings are
present, or extend the Unicode declarations for pdflatex.
