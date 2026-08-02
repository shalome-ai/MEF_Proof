/-
  GBH4_evaluation_core.lean
  ─────────────────────────────────────────────────────────────────────────
  Machine-checked core of the G-BH-4 evaluation layer (nodes N3–N6).
  Companion note: GBH4_Evaluation_N3_N6.tex.
  Status: CERT-pending (PI local compile outstanding).

  ── DECLARED-INPUT BOUNDARY (NOT formalised) ──
    (i)   the emission-model premise (Motivated; this file certifies
          arithmetic and algebra conditional on it, never the premise);
    (ii)  the N2b ground-sector pattern (GBH4_N2b_ground_sector.lean);
    (iii) the general Rule-1 statement d_odd(2^a·m) = d_odd(m) — [R] at
          the corpus canonical site; certified here at instances;
    (iv)  the hydrodynamic bound ℓ_κ ≳ ξ (EXT, Living Reviews).

  ── LEAN ↔ STATEMENT CORRESPONDENCE ──
    gbh4_dodd_singlets / _doublets / _triplet   protected values (Rule 4
                                                instances)
    gbh4_octave_6_3 / _12_3 / _18_9 / _10_5     octave symmetry instances
                                                (Rule 1 instances)
    gbh4_local_mean                             mean over n = 1..12 is 7/4
    gbh4_depths                                 exact depths −3/7, 1/7, 5/7
    gbh4_comb_identity                          2π·τ_eff·T = ω₀ under the
                                                Boltzmann-matching def.
    gbh4_taueff_ratio                           (c/R)/(c/ℓ) = ℓ/R
    gbh4_window_iff                             ℓ/R ≤ ε ↔ ℓ ≤ ε·R (R > 0)
  ── OFFLINE BUILD ── Lean 4 + mathlib; conservative tactics.
  ─────────────────────────────────────────────────────────────────────────
-/

import Mathlib

namespace GBH4Eval

/-- Odd-divisor count, computable (same definition as the N2b cert). -/
def dodd (n : ℕ) : ℕ :=
  (List.range (n + 1)).countP (fun d => d ≠ 0 && n % d == 0 && d % 2 == 1)

/-! ### Rule-4 instances: protected values -/

theorem gbh4_dodd_singlets :
    dodd 1 = 1 ∧ dodd 2 = 1 ∧ dodd 4 = 1 ∧ dodd 8 = 1 ∧ dodd 16 = 1 := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;> decide

theorem gbh4_dodd_doublets :
    dodd 3 = 2 ∧ dodd 5 = 2 ∧ dodd 7 = 2 ∧ dodd 11 = 2 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> decide

theorem gbh4_dodd_triplet : dodd 9 = 3 := by decide

/-! ### Rule-1 instances: the octave symmetry d_odd(2m) = d_odd(m) -/

theorem gbh4_octave_6_3 : dodd 6 = dodd 3 := by decide
theorem gbh4_octave_12_3 : dodd 12 = dodd 3 := by decide
theorem gbh4_octave_18_9 : dodd 18 = dodd 9 := by decide
theorem gbh4_octave_10_5 : dodd 10 = dodd 5 := by decide

/-! ### N3 core: local mean and the exact depths -/

/-- Mean of d_odd over n = 1..12 is exactly 7/4 (the N3 window). -/
theorem gbh4_local_mean :
    ((1 + 1 + 2 + 1 + 2 + 2 + 2 + 1 + 3 + 2 + 2 + 2 : ℚ)) / 12 = 7 / 4 := by
  norm_num

/-- Exact fractional depths against the local mean 7/4:
singlets −3/7, doublets +1/7, the n = 9 triplet +5/7. -/
theorem gbh4_depths :
    ((1 : ℚ) - 7 / 4) / (7 / 4) = -3 / 7 ∧
    ((2 : ℚ) - 7 / 4) / (7 / 4) = 1 / 7 ∧
    ((3 : ℚ) - 7 / 4) / (7 / 4) = 5 / 7 := by
  refine ⟨?_, ?_, ?_⟩ <;> norm_num

/-! ### N4 core: the comb and τ_eff algebra (p stands for π, abstract) -/

/-- Boltzmann matching: with τ_eff := ω₀/(2pT), the comb spacing
2p·τ_eff·T recovers ω₀ exactly (p, T ≠ 0). -/
theorem gbh4_comb_identity (p T w0 : ℝ) (hp : p ≠ 0) (hT : T ≠ 0) :
    2 * p * (w0 / (2 * p * T)) * T = w0 := by
  field_simp

/-- τ_eff = ω₀/κ = (c/R)/(c/ℓ) = ℓ/R for c, R, ℓ ≠ 0. -/
theorem gbh4_taueff_ratio (c R l : ℝ) (hc : c ≠ 0) (hR : R ≠ 0) (hl : l ≠ 0) :
    (c / R) / (c / l) = l / R := by
  field_simp

/-- The platform window: ℓ/R ≤ ε ↔ ℓ ≤ ε·R for R > 0 — the inequality
behind R_eff ≳ 1.7ℓ_κ (doublet) and ≳ 6.3ℓ_κ (triplet). -/
theorem gbh4_window_iff (l R eps : ℝ) (hR : 0 < R) :
    l / R ≤ eps ↔ l ≤ eps * R :=
  div_le_iff₀ hR

/-! ### Assembly remark (comment-level)

The instance certificates realise Rules 1 and 4 on every value the notes
use; the exact rationals replace the N3 decimals (−0.429 → −3/7 etc.); the
comb and window algebra is the entire quantitative content of N4/N5's
formulas. The general Rule-1/Rule-4 statements remain [R] at the corpus
canonical site (declared input iii) — instances here, theorems there. -/

end GBH4Eval
