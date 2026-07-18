import Mathlib.Data.Rat.Defs
import Mathlib.Tactic
set_option linter.style.longLine false
/-!
# MEF Formalization: R9 — The $\vartheta_2$ Fractional Spectrum and the Absence of the $q^1$ Mode

This file formalizes the arithmetic core of Proposition R9 of Paper XXII (§ "The
fractional-mode spectral structure"). The $\mathcal{K}_8$ corner link carries the
$\mathrm{Spin}^c$-shifted spectrum whose $\tau$-domain $q$-series has Fourier exponents
$(2k+1)^2/4$ for $k \geq 0$:
$$
\tilde F_{\text{corner}}(q) \;\propto\; \sum_{k \ge 0} q^{(2k+1)^2/4}
   \;=\; q^{1/4} + q^{9/4} + q^{25/4} + q^{49/4} + \cdots,
$$
which is (up to normalisation) the Jacobi theta function $\vartheta_2$.

The content certified here is the **spectral-incidence** statement: every exponent in this
spectrum is a strictly fractional rational with denominator $4$, never an integer. In
particular the integer Fourier exponent $1$ does not occur, so the $q^1$ coefficient is
**structurally absent** (eq:q1-absent). The mechanism is elementary and exact: an odd square is
always congruent to $1$ modulo $4$, hence $(2k+1)^2$ is never divisible by $4$, hence
$(2k+1)^2/4$ is never an integer.

Working over `ℤ` for the congruence core, then over `ℚ` for the not-an-integer / not-equal-to-1
statements that match the $q$-exponent reading.
-/

namespace R9

/-- The $\tau$-domain Fourier exponent attached to the $k$-th mode of the corner link spectrum,
    `e k = (2k+1)^2 / 4`, as a rational number. The theta-series $\vartheta_2$ has its mass on
    exactly these exponents. -/
def exponent (k : ℕ) : ℚ := ((2 * (k : ℤ) + 1) ^ 2 : ℚ) / 4

/-! ## The integer core: odd squares modulo 4 -/

/-- The numerator of every exponent is an odd integer squared. -/
theorem numerator_is_odd_sq (k : ℕ) :
    ∃ j : ℤ, (2 * (k : ℤ) + 1) ^ 2 = (2 * j + 1) ^ 2 := by
  exact ⟨(k : ℤ), rfl⟩

/-- **Odd-square residue.** An odd square is congruent to `1` modulo `4`.
    This is the arithmetic engine of the whole result. -/
theorem odd_sq_mod_four (j : ℤ) : (2 * j + 1) ^ 2 % 4 = 1 := by
  have h : (2 * j + 1) ^ 2 = 4 * (j ^ 2 + j) + 1 := by ring
  rw [h]
  omega

/-- The exponent numerator `(2k+1)^2` is never divisible by `4`. -/
theorem numerator_not_div_four (k : ℕ) :
    ¬ (4 ∣ (2 * (k : ℤ) + 1) ^ 2) := by
  rintro ⟨c, hc⟩
  -- (2k+1)^2 = 4*(k^2+k) + 1, so 4*c = 4*(k^2+k) + 1, impossible mod 4.
  have hexp : (2 * (k : ℤ) + 1) ^ 2 = 4 * ((k : ℤ) ^ 2 + (k : ℤ)) + 1 := by ring
  rw [hexp] at hc
  omega

/-! ## The rational reading: exponents are strictly fractional -/

/-- **No exponent is an integer.** For every mode `k`, the exponent `(2k+1)^2/4` is not an
    integer: there is no `z : ℤ` equal to it. This is the spectral-incidence statement —
    the corner-link spectrum has no integer-exponent modes. -/
theorem exponent_not_integer (k : ℕ) :
    ¬ ∃ z : ℤ, exponent k = (z : ℚ) := by
  rintro ⟨z, hz⟩
  -- exponent k = (2k+1)^2 / 4 = z  ⟹  (2k+1)^2 = 4 z  ⟹  4 ∣ (2k+1)^2
  unfold exponent at hz
  -- Clear the denominator: multiply both sides by 4.
  have heq : ((2 * (k : ℤ) + 1) ^ 2 : ℚ) = 4 * (z : ℚ) := by
    have h4 : (4 : ℚ) ≠ 0 := by norm_num
    rw [div_eq_iff h4] at hz
    linarith [hz]
  -- Descend to ℤ.
  have heqZ : (2 * (k : ℤ) + 1) ^ 2 = 4 * z := by exact_mod_cast heq
  exact numerator_not_div_four k ⟨z, heqZ⟩

/-- **Absence of the `q^1` mode.** The integer exponent `1` is not attained by any mode of the
    corner-link spectrum. This is eq:q1-absent: the `q^1` Fourier coefficient of the corner trace
    is `0` by spectral incidence, since no mode sits at exponent `1`. -/
theorem q1_absent (k : ℕ) : exponent k ≠ 1 := by
  intro h
  exact exponent_not_integer k ⟨1, by rw [h]; norm_num⟩

/-- The smallest case worked by hand: the ground mode `k = 0` sits at exponent `1/4`, not `1`.
    (The lowest exponent in the spectrum is `1/4`, strictly between `0` and `1`.) -/
theorem ground_mode_is_quarter : exponent 0 = 1 / 4 := by
  unfold exponent; norm_num

/-- The exponents are strictly increasing in `k`, so once past the ground mode the spectrum only
    climbs; the gap straddling the integer `1` (between `1/4` at `k=0` and `9/4` at `k=1`) is
    therefore never closed. The `k=1` mode sits at `9/4 > 1`. -/
theorem first_excited_above_one : exponent 1 = 9 / 4 := by
  unfold exponent; norm_num

end R9

#print axioms R9.odd_sq_mod_four
#print axioms R9.numerator_not_div_four
#print axioms R9.exponent_not_integer
#print axioms R9.q1_absent
#print axioms R9.ground_mode_is_quarter
#print axioms R9.first_excited_above_one
