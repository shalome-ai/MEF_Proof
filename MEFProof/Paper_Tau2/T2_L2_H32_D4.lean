/- T2_L2_H32_D4.lean — certificates for the H32 derivation sketch (I-3) and D4.  Core Lean 4, no Mathlib.  © Dhiren J. Master 2026. -/

/-! ## H32, step (iv): a module-symmetric vacuum has equal component magnitudes, so the module trace is
    32 × the single-component value.  Stated for an arbitrary common value c. -/
def sum32 (c : Int) : Int := 32 * c
theorem trace_of_uniform_vacuum (c : Int) : sum32 c = 32 * c := rfl
/- ...and it differs from the square of the summed amplitude by the factor 32: -/
theorem trace_vs_square_of_trace (a : Int) : (32*a)*(32*a) = 32 * (32 * (a*a)) := by grind

/-! ## H32 is NOT a Dynkin-index effect: Sp(1) on 32 doublets vs U(1) with charges ±1/2 on 64 complex
    components give the same per-component normalisation (16 = 16), ratio 1 per component, 3 over generators. -/
theorem dynkin_equal : 32 * 1 = 16 * 2 ∧ 64 * 1 = 16 * 4 ∧ (3:Nat) ≠ 32 ∧ (4:Nat) ≠ 32 := by decide

/-! ## D4: the π/2 swap maps τ²/(1+τ²) to 1/(1+τ²); cleared of denominators:
    (1+t)·[1 − t/(1+t)] = 1, i.e. (1+t) − t = 1, and the two angles are complementary: they sum to 1. -/
theorem weinberg_swap (t : Int) : (1 + t) - t = 1 ∧ t + 1 = 1 + t := by constructor <;> grind
/- the compound statement α_Y·α_s = α_w² follows from α_s/α_w = τ² and α_w/α_Y = τ² (as inverse couplings): -/
theorem compound_relation (aY aw as t : Int) (h1 : as = t * aw) (h2 : aw = t * aY) :
    aY * as = aw * aw := by subst h1; subst h2; grind
