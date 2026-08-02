/-
  Ca_constant_critical.lean
  ─────────────────────────────────────────────────────────────────────────
  Machine-checked core of Proposition C-a (Node C, A3/Hodge reduction chain):
  "The constant configurations form a critical stratum of the rigidity
   functional ω on X, for every window."

  Companion note: NodeC_Reduction.md  (§1.2–§1.4).
  Status: CERT-pending (certificate delivered; PI local compile outstanding).

  ── DECLARED-INPUT BOUNDARY (the [D] analytic layer, NOT formalised) ──
  The following are consumed as analytic inputs at grade [D], per the
  island-note pattern (cf. C4_euler_twelve.lean scope section):
    (i)   Bourguignon–Gauduchon first variation of Dirac eigenvalues,
          conformal case:  δλ_k = −ζ λ_k ∫ δΦ |χ_k|² dv   (Node B §2);
    (ii)  the unfolding chain rule on the fixed-area slice (Node B §3);
    (iii) the envelope theorem for the Dyson–Mehta Δ₃ minimisation and the
          jump convention for ∂Δ₃/∂x_k (Node B §4);
    (iv)  the block-trace contraction at degenerate levels (Node C §1.4).
  What THIS file certifies is the finite/algebraic core that, combined with
  (i)–(iv), yields Proposition C-a:
    L1  the σ-action on the shifted momentum lattice is FREE
        (mechanism: c₁(L) = 3 is odd — 2n = 3 has no integer solution);
    L2  σ-partners are exactly degenerate (λ² invariant under the pairing),
        plus the m ↦ −m reflection degeneracy that builds generic blocks;
    L3  the σ-parity selection identity: the spinor-lift expectation and the
        raw k ↔ −k overlap both vanish in the positive-energy polarisation
        u = (1, z), z on the unit circle;
    L4  consequently the σ-projected eigenspinor density is independent of
        the position phase — the cross-term coefficient is the L3 zero.

  ── LEAN ↔ STATEMENT CORRESPONDENCE ──
    ca_sigma_free                 L1   Node C §1.2  (freeness; 2n = 3 impossible)
    ca_partner_degenerate         L2   Node C §1.2  (σ-orbit degeneracy)
    ca_reflection_degenerate      L2′  Node B §2 flag (generic-block degeneracy)
    ca_sigma3_expectation_zero    L3   Node C §1.3  (u†σ³u = 0)
    ca_overlap_zero               L3′  Node C §1.3  (u(k)†u(−k) = 0)
    ca_projected_density_const    L4   Node C §1.3–1.4 (density is x-independent)

  ── OFFLINE BUILD ──
  Toolchain: Lean 4 + mathlib (tested style: mathlib4, 2025-era API).
  Minimal project:
      lake new ca_cert math        -- or add to an existing mathlib project
      # place this file in the package, then:
      lake exe cache get
      lake build
  The single broad `import Mathlib` is deliberate (robust to module moves).

  Conventions: eigenvalue squares are certified up to the overall positive
  factor (2π/τ₂)² — irrelevant to degeneracy — via the ×4-cleared form
  4m² + (2n−3)²·t with t a formal parameter standing for τ₂² > 0 in any
  commutative ring. Spinor normalisation 1/√2 is dropped: vanishing of the
  relevant sesquilinear quantities is normalisation-independent.
  ─────────────────────────────────────────────────────────────────────────
-/

import Mathlib

namespace Paper5.CaConstantCritical
/-! ### L1 — the σ-action on the shifted momentum lattice is free

σ sends the lattice label (m, n) to (−m, 3 − n) (Node C §1.2). A fixed label
would need `n = 3 − n`, i.e. `2n = 3` in ℤ — impossible. The `3` here is
c₁(L) = 3h: the freeness is forced by c₁ being ODD. -/

theorem ca_sigma_free (m n : ℤ) : ¬ (m = -m ∧ n = 3 - n) := by
  rintro ⟨_, hn⟩
  omega

/-- The same fact stated positively: the σ-pairing has no diagonal, i.e. for
every label the partner differs (in the n-coordinate alone, already). -/
theorem ca_sigma_moves (n : ℤ) : n ≠ 3 - n := by
  omega

/-! ### L2 — exact degeneracy of σ-partners

Cleared eigenvalue-square: `lamSq m n t = 4m² + (2n − 3)² t`, with `t` a
formal parameter (τ₂²) in an arbitrary commutative ring. Invariance under
(m, n) ↦ (−m, 3 − n) is the statement that σ-partners are degenerate;
invariance under m ↦ −m is the reflection degeneracy that assembles the
generic four-element torus blocks (Node B degeneracy flag). -/

variable {R : Type*} [CommRing R]

/-- Cleared eigenvalue square: `4 m² + (2n − 3)² t`  (t ↔ τ₂²). -/
def lamSq (m n : ℤ) (t : R) : R :=
  4 * (m : R) ^ 2 + ((2 * n - 3 : ℤ) : R) ^ 2 * t

theorem ca_partner_degenerate (m n : ℤ) (t : R) :
    lamSq m n t = lamSq (-m) (3 - n) t := by
  unfold lamSq
  push_cast
  ring

theorem ca_reflection_degenerate (m n : ℤ) (t : R) :
    lamSq m n t = lamSq (-m) n t := by
  unfold lamSq
  push_cast
  ring

/-! ### L3 — the σ-parity selection identity

Positive-energy 2D Dirac polarisation modelled as u = (1, z) with z on the
unit circle (z = e^{iθ_k}; the 1/√2 normalisation is irrelevant to the
vanishing). Two forms, per Node C §1.3:

* the spinor-lift expectation  u† σ³ u = |u₁|² − |u₂|² = 1 − z̄ z = 0;
* the raw overlap with the σ-partner polarisation u(−k) = (1, −z):
  u(k)† u(−k) = 1 + z̄ (−z) = 1 − z̄ z = 0.

Both are the single identity `1 − z̄ z = 0` on the unit circle. -/

theorem ca_sigma3_expectation_zero (z : ℂ) (hz : star z * z = 1) :
    star (1 : ℂ) * (1 : ℂ) - star z * z = 0 := by
  rw [hz]
  simp

theorem ca_overlap_zero (z : ℂ) (hz : star z * z = 1) :
    star (1 : ℂ) * (1 : ℂ) + star z * (-z) = 0 := by
  rw [mul_neg, hz]
  simp

/-! ### L4 — the projected density is position-independent

The σ-projected density at a point with position phase p = e^{2ik·x} has the
form  A + ε·Re(w·p)  with A the constant plane-wave part, ε = ±1 the parity,
and w the interference amplitude — which is exactly the L3 quantity. With
w = 0 the density equals A for EVERY phase p: no position dependence.
This is the algebraic content of "every pillowcase eigenspinor density at
the reference configuration is constant" (Node C §1.3), from which the
first-variation vanishing (Node C §1.4) follows through the declared-input
layer (i)–(iv). -/

theorem ca_projected_density_const
    (z : ℂ) (hz : star z * z = 1) (A ε : ℝ) (p : ℂ) :
    A + ε * (((star (1 : ℂ) * (1 : ℂ) - star z * z) * p).re) = A := by
  rw [ca_sigma3_expectation_zero z hz]
  simp

/-- Same constancy through the raw-overlap form of the amplitude. -/
theorem ca_projected_density_const'
    (z : ℂ) (hz : star z * z = 1) (A ε : ℝ) (p : ℂ) :
    A + ε * (((star (1 : ℂ) * (1 : ℂ) + star z * (-z)) * p).re) = A := by
  rw [ca_overlap_zero z hz]
  simp

/-! ### Assembly remark (comment-level, no further Lean content)

L1 guarantees every level is a genuine 2-element σ-orbit (no exceptional
σ-fixed modes anywhere in the spectrum); L2 places each orbit, and its
reflection partner, in a common degenerate block; L3/L4 make every
σ-projected density constant. Feeding these through the declared analytic
inputs (i)–(iv) yields Proposition C-a: the bracket Σ w_k λ_k |χ_k(x)|² in
the Node B first variation is a constant function, so the variation
vanishes for all mean-zero (slice-admissible) δΦ — at every window, with
the degenerate blocks handled by the trace contraction. -/

end Paper5.CaConstantCritical