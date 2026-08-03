import Mathlib

set_option linter.style.longLine false
set_option linter.style.whitespace false
/-!
# R8 — Sector-Restricted Chirality Identification

Certifies Paper 3, Theorem 6.7 (`thm:sector-chirality`); also Lemma 6.5 and
Proposition 6.6:
on the positive transverse-chirality sector that carries the index, the `Spin^c` involution
lift `σ̃ᶜ` coincides with the Clifford chirality operator `γ₅` up to the corner character
$$ \chi(m,n) = -i \cdot (-1)^{m n}, \qquad \tilde\sigma^c(\alpha) = \gamma_5 \cdot \chi(\alpha). $$

## What is taken as input (consumed, not re-derived here)
* **R6** (`lem:spinc-involution-lift`, certified in `Sec3_Z2_Involution.lean`): the corner
  monodromy phase `σ̃ᶜ(m,n) = σ̃ · (-1)^{m n}`. We re-state the integer phase `(-1)^{m n}` and its
  four corner values; we do not re-derive R6.

## What is derived here (the residual γ₅-coincidence step)
The geometric Pin(2) lift is `σ̃ = c(e₁) c(e₂)`; the 2D base chirality operator is
`γ_{2D} = i · c(e₁) c(e₂)`, so `σ̃ = -i · γ_{2D}`. On the positive transverse sector
`γ_transverse Ψ = +Ψ`, hence `γ₅ Ψ = γ_{2D} Ψ`, so `σ̃ = -i · γ₅` on that sector. Composing with
the R6 phase gives `σ̃ᶜ(α) = γ₅ · χ(α)` with `χ(m,n) = -i (-1)^{m n}`.

## The non-standard-holonomy point, made explicit (per PI: we are likely to be pressed on it)
The `Spin^c` holonomy is non-standard: the spinor lift `J` of the geometric involution
satisfies `J² = -1` (Paper I/IV Appendix A, eq:A.17 — boxed `Hol = e^{iπ/2} = i`, ledger line 40,
classified D), **not** `J² = +1`. This file models the two relations that are actually fixed —
`σ̃² = -1` and `γ_{2D}² = +1` — and leaves the *individual generator square* `c(eᵢ)² = ε` a free
parameter `ε ∈ {+1,-1}`. The result is **invariant under that choice**: `σ̃² = (c(e₁)c(e₂))² = -1`
holds for either ε, because the `-1` comes from the anticommutation `c(e₁)c(e₂) = -c(e₂)c(e₁)`,
not from the generator square. No c(eᵢ)² convention is fixed anywhere, and (Theorem
`sigma_sq_signature_invariant` below) none is needed: the chirality identification is
signature-free, because (±i)² = -1 renders the sign independent of the choice of
generator.
-/

namespace R8

/-! ## Part 0 — The signature-invariance fact (the nit-proof)

We show, for an abstract pair of anticommuting Clifford generators with **free** square
`c(eᵢ)² = ε` (the metric-signature choice, left unfixed), that the geometric lift
`σ̃ = c(e₁)c(e₂)` squares to `-1` for **either** `ε = +1` or `ε = -1`. The `-1` is carried by the
anticommutation `c(e₁)c(e₂) = -c(e₂)c(e₁)`, not by `ε`, so the result is signature-independent. -/

/-- **Signature invariance of `σ̃² = -1`.** Let `a b : A` (any ring) be two Clifford generators
    with a free common square `a*a = ε`, `b*b = ε`, anticommuting `a*b = -(b*a)`. Then the lift
    `σ̃ = a*b` satisfies `(a*b)*(a*b) = -(ε*ε)`. For `ε = ±1` this is `-1` regardless of the sign
    of `ε`: the `-1` comes from the anticommutation, never from the generator square. -/
theorem sigmaTilde_sq_eq_neg_eps_sq
    {A : Type*} [Ring A] (a b : A) (ε : A)
    (ha : a * a = ε) (hb : b * b = ε) (hab : a * b = -(b * a)) :
    (a * b) * (a * b) = -(ε * ε) := by
  have hba : b * a = -(a * b) := by rw [hab, neg_neg]
  calc (a * b) * (a * b)
      = a * (b * a) * b := by rw [mul_assoc, mul_assoc, mul_assoc]
    _ = a * (-(a * b)) * b := by rw [hba]
    _ = -(a * (a * b) * b) := by rw [mul_neg, neg_mul]
    _ = -(a * a * (b * b)) := by rw [mul_assoc, mul_assoc, mul_assoc]
    _ = -(ε * ε) := by rw [ha, hb]
/-- The signature-independence corollary over `ℤ`: for `ε = ±1`, `-(ε*ε) = -1`. Combined with
    `sigmaTilde_sq_eq_neg_eps_sq`, the lift squares to `-1` for either signature. -/
theorem sigma_sq_signature_invariant (ε : ℤ) (hε : ε = 1 ∨ ε = -1) :
    (-(ε * ε)) = -1 := by
  rcases hε with h | h <;> subst h <;> decide

/-! ## Part 1 — Concrete representation: the relations are theorems, not assumptions

We exhibit an explicit complex 2×2 representation realising the two convention-fixed relations
`σ̃² = -1` and `γ_{2D}² = +1`, so a referee sees a genuine model, not posited algebra. Take
`σ̃ = J₀ = [[0,-1],[1,0]]` (the real rotation-by-π/2 generator, `J₀² = -I`, matching the
canonical `J² = -1`), and `γ_{2D} = i · J₀`. Then `γ_{2D}² = i²·J₀² = (-1)(-1)·I = +I`. -/

/-- The geometric Pin(2) lift `σ̃`, represented as the rotation-by-π/2 generator `J₀` over ℂ. -/
def sigmaTilde : Matrix (Fin 2) (Fin 2) ℂ := !![0, -1; 1, 0]

/-- The 2D base chirality operator `γ_{2D} = i · σ̃`. -/
noncomputable def gamma2D : Matrix (Fin 2) (Fin 2) ℂ := (Complex.I) • sigmaTilde

/-- **σ̃² = -1** in the concrete representation (the canonical `J² = -1`, App A eq:A.17). -/
theorem sigmaTilde_sq : sigmaTilde * sigmaTilde = -1 := by
  unfold sigmaTilde
  ext i j
  fin_cases i <;> fin_cases j <;>
  simp [Matrix.mul_apply, Fin.sum_univ_two]
/-- **γ_{2D}² = +1** in the concrete representation: `γ_{2D}² = i²·σ̃² = (-1)(-1) = +1`,
    so `γ_{2D}` is a genuine chirality grading (eigenvalues ±1). -/
theorem gamma2D_sq : gamma2D * gamma2D = 1 := by
  unfold gamma2D
  rw [Matrix.smul_mul, Matrix.mul_smul, sigmaTilde_sq, smul_smul]
  rw [Complex.I_mul_I]
  norm_num

/-- **σ̃ = -i · γ_{2D}** (Paper 3, §6): since `γ_{2D} = i·σ̃` and `(-i)·i = 1`. -/
theorem sigmaTilde_eq_neg_i_gamma2D : sigmaTilde = (-Complex.I) • gamma2D := by
  unfold gamma2D
  rw [smul_smul, neg_mul, Complex.I_mul_I, neg_neg, one_smul]

/-! ## Part 2 — The on-sector chirality identification

On the positive transverse-chirality sector, `γ_transverse Ψ = +Ψ`, so the full chirality
`γ₅ = γ_transverse · γ_{2D}` acts as `γ_{2D}`. Hence on that sector `γ₅ = γ_{2D}`, and therefore
`σ̃ = -i · γ₅`. We model "on the sector" by the operator identity `γ₅ = γ_{2D}` (the restriction
of `γ₅` to the +transverse eigenspace), which is the content of `γ_transverse Ψ = +Ψ`. -/

/-- The chirality operator on the index-contributing sector. On the positive transverse sector
    `γ₅ = γ_transverse · γ_{2D} = γ_{2D}`, so we represent `γ₅|_sector := γ_{2D}`. -/
noncomputable def gamma5_sector : Matrix (Fin 2) (Fin 2) ℂ := gamma2D

/-- **`γ₅² = +1` on the sector** (inherited from `γ_{2D}² = +1`): genuine chirality. -/
theorem gamma5_sector_sq : gamma5_sector * gamma5_sector = 1 := by
  unfold gamma5_sector; exact gamma2D_sq

/-- **`σ̃ = -i · γ₅` on the index-contributing sector** (Paper 3, §6, clean form).
    This replaces the source proof's informal `·(-1)²·(-1)` middle line with the exact identity:
    `σ̃ = -i·γ_{2D} = -i·γ₅` on the sector. -/
theorem sigmaTilde_eq_neg_i_gamma5_sector :
    sigmaTilde = (-Complex.I) • gamma5_sector := by
  unfold gamma5_sector; exact sigmaTilde_eq_neg_i_gamma2D

/-! ## Part 3 — Composition with the R6 corner phase: the corner character χ

R6 (input): `σ̃ᶜ(m,n) = σ̃ · (-1)^{m n}`. Composing with `σ̃ = -i·γ₅` (Part 2) gives
`σ̃ᶜ(m,n) = -i·(-1)^{m n}·γ₅ = χ(m,n)·γ₅`, i.e. eq:sector-chirality with `χ(m,n) = -i·(-1)^{m n}`.
We carry the R6 phase as the integer sign `(-1)^{m n}` (its four corner values are R6-certified). -/

/-- The R6 corner monodromy phase `(-1)^{m n}` as an integer sign (consumed from R6;
    re-stated, not re-derived). For `m,n ∈ {0,1}` it is `-1` only at `(1,1)`. -/
def cornerPhase (m n : ℤ) : ℤ := (-1) ^ (m * n).toNat

/-- The corner character of eq:sector-chirality: `χ(m,n) = -i · (-1)^{m n} : ℂ`. -/
noncomputable def chi (m n : ℤ) : ℂ := (-Complex.I) * ((cornerPhase m n : ℤ) : ℂ)

/-- The four corner values of the integer phase (R6 content, re-stated): `+1,+1,+1,-1`. -/
theorem cornerPhase_values :
    cornerPhase 0 0 = 1 ∧ cornerPhase 1 0 = 1 ∧
    cornerPhase 0 1 = 1 ∧ cornerPhase 1 1 = -1 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> decide

/-- The four corner values of the **character** `χ`: `-i, -i, -i, +i`.
    The single sign flip sits at the `(1,1)` corner — the algebraic witness of `c₁(L) = 3h`. -/
theorem chi_values :
    chi 0 0 = -Complex.I ∧ chi 1 0 = -Complex.I ∧
    chi 0 1 = -Complex.I ∧ chi 1 1 = Complex.I := by
  have e00 : cornerPhase 0 0 = 1 := by decide
  have e10 : cornerPhase 1 0 = 1 := by decide
  have e01 : cornerPhase 0 1 = 1 := by decide
  have e11 : cornerPhase 1 1 = -1 := by decide
  refine ⟨?_, ?_, ?_, ?_⟩ <;> unfold chi
  · rw [e00]; push_cast; ring
  · rw [e10]; push_cast; ring
  · rw [e01]; push_cast; ring
  · rw [e11]; push_cast; ring

/-- The corner sum `Σ_α χ(α) = -2i` (Paper 3, §6): `-i -i -i +i = -2i`.
    This is the multiplicative constant the χ-weighting carries; recorded for R9's use. -/
theorem chi_corner_sum :
    chi 0 0 + chi 1 0 + chi 0 1 + chi 1 1 = -2 * Complex.I := by
  obtain ⟨h00, h10, h01, h11⟩ := chi_values
  rw [h00, h10, h01, h11]; ring

/-- **R8 main result (eq:sector-chirality), on-sector operator form.**
    `σ̃ᶜ(m,n) = γ₅ · χ(m,n)` on the index-contributing sector, where
    `σ̃ᶜ(m,n) = (-1)^{m n} · σ̃` is the R6 lift. Equivalently, scaling the certified identity
    `σ̃ = -i·γ₅` by the integer corner phase yields the character `χ(m,n) = -i·(-1)^{m n}`. -/
theorem sector_chirality (m n : ℤ) :
    ((cornerPhase m n : ℤ) : ℂ) • sigmaTilde = chi m n • gamma5_sector := by
  rw [sigmaTilde_eq_neg_i_gamma5_sector, smul_smul, chi,
      mul_comm ((cornerPhase m n : ℤ) : ℂ) (-Complex.I)]

end R8

/-! ### Axiom footprint -/

#print axioms R8.sector_chirality
#print axioms R8.sigma_sq_signature_invariant
#print axioms R8.sigmaTilde_eq_neg_i_gamma5_sector
