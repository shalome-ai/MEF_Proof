/-
  GBH4_N2b_ground_sector.lean
  ─────────────────────────────────────────────────────────────────────────
  Machine-checked algebraic core of node N2b (G-BH-4 programme):
  ground-sector exactness of the warped Kaluza–Klein tower and the
  warp-neutral relative pattern  𝒜(n)/𝒜(1) = d_odd(n)·E(n)/E(1).

  Companion note: GBH4_N2b_Ground_Sector.tex.
  Status: CERT-pending (certificate delivered; PI local compile outstanding).

  ── DECLARED-INPUT BOUNDARY (analytic layer, NOT formalised) ──
  Consumed at their stated grades, per the island-cert pattern:
    (i)   the warped-product Dirac decomposition and the spin-connection
          ∂A term it produces (standard KK reduction; EXT);
    (ii)  self-adjointness/extension conventions at the warp kinks
          (corner parity conventions, companion notes);
    (iii) the emission-model premise (Motivated; weights ∝ d_odd(n) —
          this file certifies algebra, never the premise);
    (iv)  the constant-density input from Ca_constant_critical.lean
          (ca_projected_density_const) — cross-note declared input;
    (v)   the antiderivative step for the cell average (that
          θ ↦ −e^{−2kθ}/(2k) differentiates to e^{−2kθ}; standard calculus,
          EXT) — this file certifies the resulting algebraic evaluation.

  ── LEAN ↔ STATEMENT CORRESPONDENCE ──
    n2b_warp_cancel      Lemma 1  (rescaling exponent kills the ∂A term:
                                   the exponent identity)
    n2b_measure_cancel   Lemma 2  (density × measure = unwarped density)
    n2b_pattern_ratio    Prop.    (common factors cancel from 𝒜(n)/𝒜(1))
    n2b_envelope_ratio   Prop.    (geometric envelope: q^{n−1} form,
                                   multiplicative statement, no division)
    n2b_cell_average     Remark   (algebraic evaluation of ⟨e^{2A}⟩ given
                                   the antiderivative values)
    n2b_dodd_1/2/3/9     text     (spot checks of d_odd values used)

  ── OFFLINE BUILD ──
  Lean 4 + mathlib.  lake new gbh4_cert math ; add file ; lake exe cache get ;
  lake build.  Conservative tactics throughout (ring, field_simp, simp,
  decide) to minimise mathlib API drift.
  ─────────────────────────────────────────────────────────────────────────
-/

import Mathlib

namespace GBH4N2b

/-! ### Lemma 1 core — the warp-cancellation exponent identity

The rescaling χ = e^{−(d/2)A} χ̃ eliminates the (d/2)∂A spin-connection
term because the prefactor's logarithmic derivative is exactly −(d/2)∂A.
The algebraic content certified here: the product of the squared rescaling
prefactor with the measure factor e^{dA} is 1 — the exponent bookkeeping
that Lemmas 1 and 2 of the note both rest on. Stated for arbitrary real
d and warp value a (pointwise in the fibre coordinate). -/

theorem n2b_warp_cancel (d a : ℝ) :
    Real.exp (-(d / 2) * a) ^ 2 * Real.exp (d * a) = 1 := by
  rw [sq, ← Real.exp_add, ← Real.exp_add]
  have h : -(d / 2) * a + -(d / 2) * a + d * a = 0 := by ring
  rw [h, Real.exp_zero]

/-- Lemma 2 in density form: |χ|² e^{dA} = |χ̃|², i.e. the warped density of
the rescaled spinor equals the unwarped density — pointwise, identically in
the warp value. -/
theorem n2b_measure_cancel (d a ρ : ℝ) :
    (Real.exp (-(d / 2) * a) ^ 2 * Real.exp (d * a)) * ρ = ρ := by
  rw [n2b_warp_cancel]; ring

/-! ### Proposition core — the pattern ratio

𝒜(n) = g · dₙ · Eₙ · c · W with g (ground multiplicity), c (locus factor),
W (absolute warp normalisation) common to all n. Given the common factors
and the reference-mode factors are nonzero, they cancel exactly. -/

theorem n2b_pattern_ratio (g c W d1 dn E1 En : ℝ)
    (hg : g ≠ 0) (hc : c ≠ 0) (hW : W ≠ 0) (hd1 : d1 ≠ 0) (hE1 : E1 ≠ 0) :
    (g * dn * En * c * W) / (g * d1 * E1 * c * W) = (dn * En) / (d1 * E1) := by
  field_simp

/-- Geometric envelope: E(n) = qⁿ gives E(n)/E(1) = q^{n−1}. Stated
multiplicatively (q^{n−1} · q = qⁿ for n ≥ 1) so no nonzero hypothesis or
division is needed. -/
theorem n2b_envelope_ratio (q : ℝ) (n : ℕ) (hn : 1 ≤ n) :
    q ^ (n - 1) * q = q ^ n := by
  rw [← pow_succ]
  congr 1
  omega

/-! ### Remark core — the cell-average evaluation

Given the antiderivative values of e^{−2kθ} at the endpoints (declared
input (v)), the cell average over [0, L] evaluates algebraically to
(1 − e^{−2kL})/(2kL). Certified: the algebraic step from endpoint values to
the closed form. -/

theorem n2b_cell_average (k L : ℝ) (hk : k ≠ 0) (hL : L ≠ 0) :
    ((1 / (2 * k)) - Real.exp (-(2 * k * L)) / (2 * k)) / L
      = (1 - Real.exp (-(2 * k * L))) / (2 * k * L) := by
  field_simp

/-! ### d_odd spot checks (values used in the note and the N0 tables) -/

/-- Odd-divisor count, computable. -/
def dodd (n : ℕ) : ℕ :=
  (List.range (n + 1)).countP (fun d => d ≠ 0 && n % d == 0 && d % 2 == 1)

theorem n2b_dodd_1 : dodd 1 = 1 := by decide
theorem n2b_dodd_2 : dodd 2 = 1 := by decide
theorem n2b_dodd_3 : dodd 3 = 2 := by decide
theorem n2b_dodd_9 : dodd 9 = 3 := by decide

/-! ### Assembly remark (comment-level)

n2b_warp_cancel + n2b_measure_cancel make every ground-sector norm and
overlap warp-free, so the tower labelling and all inter-mode ratios are
those of the flat problem; n2b_pattern_ratio + n2b_envelope_ratio then give
𝒜(n)/𝒜(1) = d_odd(n) q^{n−1} within the declared emission model. The model
itself (input iii) is never certified — only the algebra conditional on
it. -/

end GBH4N2b
