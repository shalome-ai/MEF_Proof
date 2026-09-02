/-
  GBH_cert_exclusion.lean — rational layer of the exclusion dichotomy
  (Wave 2, amendment A3; Lemma lem:kasner-curv, Theorem thm:exclusion,
  Corollary cor:saturation)
  -----------------------------------------------------------------
  RE-ISSUE (September 2026, repair node F2): the pair-sum coefficient
  of the Kretschmann scalar was carried as 8 in the previous issue;
  the correct multiplicity is 4 (each independent frame component
  enters R_abcd R^abcd exactly four times, for both index types).
  Consequently C(w), C(2/3) and the Kgen normalisation change; every
  positivity, zero-locus and dichotomy statement is unchanged.  The
  certified values now agree with the exact Schwarzschild interior
  (K τ⁴ = 64/27) and with lem:gauss-budget.  Full symbolic
  re-contraction on file (G7_kretschmann_recontraction.py).
  -----------------------------------------------------------------
  SUPERSEDES GBH_cert_transmission_v2.lean (Wave 1): the frame-norm
  transmission route is withdrawn with amendment A3 — the frame-sup
  axiom is violated by the background under boosted frames — and the
  certified content is now the Kasner-family curvature dichotomy, the
  budget parametrisation, and the surviving divergence-witness
  machinery.  Namespace carries no framework identifier.

  Map to the .tex (Paper_GBH1_Schwarzschild_interior_v8.tex):
    C_def / C_expand      — the Kretschmann coefficient of the family
                            (p_r, w, w, 0⁸): from the component sum
                            4Σpᵢ²(1−pᵢ)² + 4Σ_{i<j}pᵢ²pⱼ² with
                            p_r = 1 − 2w, the closed form
                            C(w) = 24w²(1−2w)² + 8w²(1−w)² + 4w⁴
                            (eq:kasner-K).
    C_pos                 — C(w) > 0 for every w ≠ 0: the positivity
                            dichotomy (sum of squares; the middle term
                            controls 0 < w < 1, the last w ≥ 1).
    C_zero_iff            — C(w) = 0 ↔ w = 0: flat point only.
    C_at_vacuum           — C(2/3) = 64/27: the dynamical realisation
                            of the Schwarzschild-interior exponents is
                            curvature-singular (the winding immersion
                            is forced).
    Q_def                 — the budget parametrisation Q = 4w − 6w²
                            on the family (eq:Qw).
    Q_pos_forces_w_pos    — Q > 0 → w > 0 (with Q ≥ 0 ↔ w ∈ [0,2/3]
                            recorded as Q_range).
    Q_pos_forces_C_pos    — the theorem's arithmetic core: a non-zero
                            scalar amplitude forces divergent
                            curvature on the family.
    vacuum_two_solutions  — Q = 0 on the family ↔ w = 0 or w = 2/3:
                            the two vacuum data of cor:saturation.
    Kdiag / Kpair / Kgen  — general eleven-vector coefficient (round-2
                            extension, node R1): Kgen = 4·Kdiag +
                            2·Kpair, with 2·Kpair = 4·Σ_{i<j} pᵢ²pⱼ².
    Kgen_nonneg / Kdiag_nonneg / Kpair_nonneg
                          — non-negativity (sum-of-squares structure).
    Kgen_pos_of_amplitude — Σp = 1, Σp² = 1 − A, A > 0 ⇒ Kgen > 0:
                            the theorem's general amplitude clause.
    Kgen_pos_of_pair      — two distinct non-zero entries force
                            Kgen > 0: the sphere pair of any collapse
                            datum covers excited internals and the
                            vacuum point uniformly.  (Kpair_ge_pair's
                            sum splits are carried as named equalities
                            e1/e2/f1/f2 in the forward direction of
                            add_sum_erase and closed by nlinarith —
                            no rewriting on sums.)
    Kgen_frozen_eq_C      — on the frozen family Kgen reduces to C(w):
                            consistency of the two certified routes.
    stiff_diverges /      — divergence witness and exclusion
    exclusion_dichotomy     dichotomy, carried over unchanged (the
                            algebraic core of s = 0).
    escape_lapse /        — escape-rate arithmetic for lem:escape,
    escape_diverges         carried over unchanged.

  Status: CERT-pending — for PI local compile (Lean 4 + Mathlib).
-/

import Mathlib

namespace SchwarzschildLift.Exclusion

/-! ### The Kretschmann coefficient of the family -/

/-- C(w): the closed form of eq:kasner-K. -/
def C (w : Rat) : Rat := 24*w^2*(1-2*w)^2 + 8*w^2*(1-w)^2 + 4*w^4

/-- The closed form agrees with the component sum
    4[p_r²(1−p_r)² + 2w²(1−w)²] + 4[2p_r²w² + w⁴] at p_r = 1 − 2w:
    the expansion step of lem:kasner-curv. -/
theorem C_expand (w : Rat) :
    C w = 4*((1-2*w)^2*(1-(1-2*w))^2 + 2*w^2*(1-w)^2)
        + 4*(2*(1-2*w)^2*w^2 + w^4) := by
  unfold C; ring

/-- Positivity dichotomy: C(w) > 0 for every w ≠ 0. -/
theorem C_pos (w : Rat) (hw : w ≠ 0) : 0 < C w := by
  unfold C
  rcases lt_or_gt_of_ne hw with h | h
  · nlinarith [sq_nonneg w, sq_nonneg (1-2*w), sq_nonneg (1-w),
      sq_nonneg (w*(1-w)), sq_nonneg (w*(1-2*w)), sq_nonneg (w^2)]
  · nlinarith [sq_nonneg w, sq_nonneg (1-2*w), sq_nonneg (1-w),
      sq_nonneg (w*(1-w)), sq_nonneg (w*(1-2*w)), sq_nonneg (w^2)]

/-- C vanishes only at the flat point: C(w) = 0 ↔ w = 0. -/
theorem C_zero_iff (w : Rat) : C w = 0 ↔ w = 0 := by
  constructor
  · intro h
    by_contra hw
    exact absurd h (ne_of_gt (C_pos w hw))
  · intro h; subst h; unfold C; norm_num

/-- At the vacuum (Schwarzschild-interior) point w = 2/3:
    C = 64/27 > 0 — the dynamical realisation is singular; this is
    the value K τ⁴ of the exact Schwarzschild interior at its singular
    locus (K = 48G²M²/r⁶ on r³ = (9GM/2)τ²). -/
theorem C_at_vacuum : C (2/3) = 64/27 := by
  unfold C; norm_num

/-! ### The budget parametrisation (eq:Qw) -/

/-- Q(w) = 4w − 6w²: the scalar-amplitude coordinate on the family,
    from p_r + 2w = 1 and p_r² + 2w² = 1 − Q with p_r = 1 − 2w. -/
def Q (w : Rat) : Rat := 4*w - 6*w^2

/-- The parametrisation is the constraint pair: with p_r = 1 − 2w,
    p_r + 2w = 1 and p_r² + 2w² = 1 − Q(w). -/
theorem Q_def (w : Rat) :
    (1 - 2*w) + 2*w = 1 ∧ (1 - 2*w)^2 + 2*w^2 = 1 - Q w := by
  constructor
  · ring
  · unfold Q; ring

/-- Admissible amplitude range: 0 ≤ Q(w) ↔ 0 ≤ w ≤ 2/3. -/
theorem Q_range (w : Rat) : 0 ≤ Q w ↔ (0 ≤ w ∧ w ≤ 2/3) := by
  unfold Q
  constructor
  · intro h
    constructor <;> nlinarith [sq_nonneg w, sq_nonneg (w - 2/3)]
  · rintro ⟨h0, h23⟩
    nlinarith

/-- A non-zero amplitude forces w off the flat point: Q(w) > 0 → w > 0. -/
theorem Q_pos_forces_w_pos (w : Rat) (hQ : 0 < Q w) : 0 < w := by
  unfold Q at hQ
  nlinarith [sq_nonneg w]

/-- The theorem's arithmetic core: a non-zero scalar amplitude forces
    a strictly positive Kretschmann coefficient on the family —
    divergent invariants, hence (in the .tex) incompleteness. -/
theorem Q_pos_forces_C_pos (w : Rat) (hQ : 0 < Q w) : 0 < C w :=
  C_pos w (ne_of_gt (Q_pos_forces_w_pos w hQ))

/-- The two vacuum data of cor:saturation: on the family,
    Q(w) = 0 ↔ w = 0 (flat; excluded by the collapse boundary data)
    or w = 2/3 (the Schwarzschild-interior exponents). -/
theorem vacuum_two_solutions (w : Rat) :
    Q w = 0 ↔ (w = 0 ∨ w = 2/3) := by
  unfold Q
  constructor
  · intro h
    have : w * (4 - 6*w) = 0 := by ring_nf; linarith [h]
    rcases mul_eq_zero.mp this with h0 | h1
    · exact Or.inl h0
    · right; linarith
  · rintro (h | h) <;> subst h <;> norm_num

/-! ### The general eleven-vector coefficient (round-2 extension, R1)
    Kgen p = 4·Σᵢ pᵢ²(1−pᵢ)² + 4·Σ_{i<j} pᵢ²pⱼ², carried here in the
    equivalent form 4·Kdiag + 2·Kpair with
    Kpair = (Σᵢ pᵢ²)² − Σᵢ pᵢ⁴ = 2·Σ_{i<j} pᵢ²pⱼ². -/

open Finset

/-- Diagonal part: Σᵢ pᵢ²(1−pᵢ)². -/
def Kdiag (p : Fin 11 → Rat) : Rat := ∑ i, (p i)^2 * (1 - p i)^2

/-- Pair part: (Σᵢ pᵢ²)² − Σᵢ pᵢ⁴  ( = 2·Σ_{i<j} pᵢ²pⱼ² ). -/
def Kpair (p : Fin 11 → Rat) : Rat := (∑ i, (p i)^2)^2 - ∑ i, (p i)^4

/-- The general Kretschmann coefficient. -/
def Kgen (p : Fin 11 → Rat) : Rat := 4 * Kdiag p + 2 * Kpair p

/-- Auxiliary, over any index subset: for non-negative terms,
    Σ_{k∈s} xₖ² ≤ (Σ_{k∈s} xₖ)². -/
theorem sum_sq_le_sq_sum (s : Finset (Fin 11)) (x : Fin 11 → Rat)
    (hx : ∀ k, 0 ≤ x k) :
    (∑ k ∈ s, (x k)^2) ≤ (∑ k ∈ s, x k)^2 := by
  have h : ∀ k ∈ s, (x k)^2 ≤ x k * (∑ m ∈ s, x m) := by
    intro k hk
    have hle : x k ≤ ∑ m ∈ s, x m :=
      Finset.single_le_sum (fun m _ => hx m) hk
    have := mul_le_mul_of_nonneg_left hle (hx k)
    simpa [pow_two] using this
  calc (∑ k ∈ s, (x k)^2) ≤ ∑ k ∈ s, x k * (∑ m ∈ s, x m) :=
        Finset.sum_le_sum h
    _ = (∑ k ∈ s, x k) * (∑ m ∈ s, x m) := by rw [← Finset.sum_mul]
    _ = (∑ k ∈ s, x k)^2 := by ring

/-- Kdiag is non-negative. -/
theorem Kdiag_nonneg (p : Fin 11 → Rat) : 0 ≤ Kdiag p := by
  unfold Kdiag
  exact Finset.sum_nonneg (fun i _ => by positivity)

/-- Kpair is non-negative. -/
theorem Kpair_nonneg (p : Fin 11 → Rat) : 0 ≤ Kpair p := by
  unfold Kpair
  have h := sum_sq_le_sq_sum univ (fun k => (p k)^2)
      (fun k => sq_nonneg _)
  have h4 : (∑ k, ((p k)^2)^2) = ∑ k, (p k)^4 :=
    Finset.sum_congr rfl (fun k _ => by ring)
  simp only [h4] at h
  linarith

/-- Kgen is non-negative. -/
theorem Kgen_nonneg (p : Fin 11 → Rat) : 0 ≤ Kgen p := by
  unfold Kgen
  linarith [Kdiag_nonneg p, Kpair_nonneg p]

/-- General amplitude clause: on the constraint surface with a
    non-zero amplitude, the diagonal part is strictly positive —
    if every pᵢ²(1−pᵢ)² vanished, every pᵢ would be 0 or 1, whence
    Σ pᵢ² = Σ pᵢ = 1 and the amplitude would vanish. -/
theorem Kdiag_pos_of_amplitude (p : Fin 11 → Rat) (A : Rat)
    (hsum : (∑ i, p i) = 1) (hsq : (∑ i, (p i)^2) = 1 - A)
    (hA : 0 < A) : 0 < Kdiag p := by
  rcases lt_or_eq_of_le (Kdiag_nonneg p) with h | h
  · exact h
  · exfalso
    have hnn : ∀ i ∈ (univ : Finset (Fin 11)),
        (0:Rat) ≤ (p i)^2 * (1 - p i)^2 := fun i _ => by positivity
    have hz := (Finset.sum_eq_zero_iff_of_nonneg hnn).mp h.symm
    have hsq_eq : ∀ i, (p i)^2 = p i := by
      intro i
      have hzi := hz i (mem_univ i)
      have hcases : p i = 0 ∨ p i = 1 := by
        rcases mul_eq_zero.mp hzi with h1 | h1
        · left; exact pow_eq_zero_iff (n := 2) (by norm_num) |>.mp h1
        · right
          have h2 : 1 - p i = 0 :=
            pow_eq_zero_iff (n := 2) (by norm_num) |>.mp h1
          linarith
      rcases hcases with h1 | h1 <;> rw [h1] <;> ring
    have heq : (∑ i, (p i)^2) = (∑ i, p i) :=
      Finset.sum_congr rfl (fun i _ => hsq_eq i)
    rw [hsum, hsq] at heq
    linarith

/-- Kgen is strictly positive under a non-zero amplitude. -/
theorem Kgen_pos_of_amplitude (p : Fin 11 → Rat) (A : Rat)
    (hsum : (∑ i, p i) = 1) (hsq : (∑ i, (p i)^2) = 1 - A)
    (hA : 0 < A) : 0 < Kgen p := by
  unfold Kgen
  linarith [Kdiag_pos_of_amplitude p A hsum hsq hA, Kpair_nonneg p]

/-- Pair clause, decomposition step: with x = p², S = Σx, T = Σx²,
    and R the rest-sum over univ minus {i, j},
    S² − T ≥ 2·xᵢ·xⱼ.  The two sphere exponents of any collapse datum
    supply the pair, so excited internals and the vacuum point are
    covered uniformly. -/
theorem Kpair_ge_pair (p : Fin 11 → Rat) (i j : Fin 11) (hij : i ≠ j) :
    2 * (p i)^2 * (p j)^2 ≤ Kpair p := by
  unfold Kpair
  set x : Fin 11 → Rat := fun k => (p k)^2 with hxdef
  have hxnn : ∀ k, 0 ≤ x k := fun k => sq_nonneg _
  have hj' : j ∈ (univ : Finset (Fin 11)).erase i :=
    Finset.mem_erase.mpr ⟨fun h => hij h.symm, mem_univ j⟩
  -- split the sums explicitly: univ = {i} ⊔ {j} ⊔ rest.
  -- (Forward direction of add_sum_erase; if the name differs in the
  --  local Mathlib, sum_erase_add is the commuted form.)
  have e1 : x i + ∑ k ∈ (univ : Finset (Fin 11)).erase i, x k
      = ∑ k, x k :=
    Finset.add_sum_erase _ x (mem_univ i)
  have e2 : x j + ∑ k ∈ ((univ : Finset (Fin 11)).erase i).erase j, x k
      = ∑ k ∈ (univ : Finset (Fin 11)).erase i, x k :=
    Finset.add_sum_erase _ x hj'
  have f1 : (x i)^2 + ∑ k ∈ (univ : Finset (Fin 11)).erase i, (x k)^2
      = ∑ k, (x k)^2 :=
    Finset.add_sum_erase _ (fun k => (x k)^2) (mem_univ i)
  have f2 : (x j)^2
        + ∑ k ∈ ((univ : Finset (Fin 11)).erase i).erase j, (x k)^2
      = ∑ k ∈ (univ : Finset (Fin 11)).erase i, (x k)^2 :=
    Finset.add_sum_erase _ (fun k => (x k)^2) hj'
  set R : Rat := ∑ k ∈ ((univ : Finset (Fin 11)).erase i).erase j, x k
    with hRdef
  set T2 : Rat :=
      ∑ k ∈ ((univ : Finset (Fin 11)).erase i).erase j, (x k)^2
    with hT2def
  have hRnn : 0 ≤ R := Finset.sum_nonneg (fun k _ => hxnn k)
  have hTrest : T2 ≤ R^2 := sum_sq_le_sq_sum _ x hxnn
  have hT4 : (∑ k, (p k)^4) = ∑ k, (x k)^2 :=
    Finset.sum_congr rfl (fun k _ => by simp [hxdef]; ring)
  -- assembled split equalities (linear consequences of e1/e2, f1/f2)
  have hSsum : (∑ k, x k) = x i + x j + R := by
    rw [← e1, ← e2]; ring
  have hTsum : (∑ k, (x k)^2) = (x i)^2 + (x j)^2 + T2 := by
    rw [← f1, ← f2]; ring
  have hxi : x i = (p i)^2 := rfl
  have hxj : x j = (p j)^2 := rfl
  have hxi0 : 0 ≤ x i := hxnn i
  have hxj0 : 0 ≤ x j := hxnn j
  rw [hT4, hSsum, hTsum, ← hxi, ← hxj]
  nlinarith [hTrest, mul_nonneg hxi0 hRnn, mul_nonneg hxj0 hRnn,
    mul_nonneg hxi0 hxj0, sq_nonneg R]

/-- Kgen is strictly positive whenever two distinct entries are
    non-zero — in particular for the two sphere exponents p_Ω of any
    collapse datum, whatever the internal excitation. -/
theorem Kgen_pos_of_pair (p : Fin 11 → Rat) (i j : Fin 11) (hij : i ≠ j)
    (hi : p i ≠ 0) (hj : p j ≠ 0) : 0 < Kgen p := by
  unfold Kgen
  have h1 : 0 < 2 * (p i)^2 * (p j)^2 := by positivity
  linarith [Kpair_ge_pair p i j hij, Kdiag_nonneg p]

/-- Consistency: on the frozen family (1−2w, w, w, 0⁸) the general
    form reduces to C(w) — a rational identity in w, with the family
    sums written out (the Fin-vector instantiation is the display in
    the .tex). -/
theorem Kgen_frozen_eq_C (w : Rat) :
    4*((1-2*w)^2*(1-(1-2*w))^2 + 2*(w^2*(1-w)^2))
      + 2*((((1-2*w)^2 + 2*w^2)^2) - ((1-2*w)^4 + 2*w^4))
    = C w := by
  unfold C; ring

/-! ### Divergence witness and exclusion dichotomy
    (carried over unchanged; the algebraic core of s = 0). -/

/-- Stiff divergence witness: for any s > 0 and any threshold B ≥ 0,
    the density s/t² exceeds B at the explicit rational witness
    t = min(1, s/(B+s)) — no limit machinery needed. -/
theorem stiff_diverges (s B : Rat) (hs : 0 < s) (hB : 0 ≤ B) :
    ∃ t : Rat, 0 < t ∧ t ≤ 1 ∧ B < s/t^2 := by
  refine ⟨min 1 (s/(B+s)), ?_, min_le_left _ _, ?_⟩
  · have h1 : (0:Rat) < s/(B+s) := by positivity
    exact lt_min one_pos h1
  · have hden : (0:Rat) < B + s := by linarith
    have hle : min 1 (s/(B+s)) ≤ s/(B+s) := min_le_right _ _
    have hpos : (0:Rat) < min 1 (s/(B+s)) := by
      have h1 : (0:Rat) < s/(B+s) := by positivity
      exact lt_min one_pos h1
    have hsq : (min 1 (s/(B+s)))^2 ≤ (s/(B+s))^2 := by nlinarith [hle, hpos]
    have hsqpos : (0:Rat) < (min 1 (s/(B+s)))^2 := by positivity
    have key : B * (s/(B+s))^2 < s := by
      rw [div_pow]
      rw [mul_div_assoc']
      rw [div_lt_iff₀ (by positivity)]
      have h_pos : 0 < s * B^2 + B * s^2 + s^3 := by positivity
      have h_eq : s * B^2 + B * s^2 + s^3 = s * (B + s)^2 - B * s^2 := by ring
      linarith
    have h_bound : B * (min 1 (s/(B+s)))^2 < s :=
      lt_of_le_of_lt (by nlinarith [hsq, hB]) key
    calc B = B * (min 1 (s/(B+s)))^2 / (min 1 (s/(B+s)))^2 := by field_simp
         _ < s / (min 1 (s/(B+s)))^2 := by gcongr

/-- If the stiff density s/t² is bounded by B across arbitrarily
    small t, then s = 0. -/
theorem exclusion_dichotomy (s B : Rat) (hs : 0 ≤ s) (hB : 0 ≤ B)
    (hbound : ∀ t : Rat, 0 < t → t ≤ 1 → s/t^2 ≤ B) : s = 0 := by
  by_contra hne
  have hspos : 0 < s := lt_of_le_of_ne hs (Ne.symm hne)
  obtain ⟨t, ht0, ht1, hgt⟩ := stiff_diverges s B hspos hB
  exact absurd (hbound t ht0 ht1) (not_le.mpr hgt)

/-! ### Escape-rate arithmetic (lem:escape, carried over unchanged) -/

/-- The lapse inequality: for t > 0, (1/(3t))² ≤ 1 + 1/(9t²). -/
theorem escape_lapse (t : Rat) (ht : 0 < t) :
    (1/(3*t))^2 ≤ 1 + 1/(9*t^2) := by
  have h9 : (0:Rat) < 9*t^2 := by positivity
  have : (1/(3*t))^2 = 1/(9*t^2) := by
    field_simp
    ring
  rw [this]
  linarith

/-- Divergence of the escape rate: 1/(3t) exceeds any threshold B ≥ 0
    at the explicit witness t = 1/(3(B+1)). -/
theorem escape_diverges (B : Rat) (hB : 0 ≤ B) :
    ∃ t : Rat, 0 < t ∧ B < 1/(3*t) := by
  refine ⟨1/(3*(B+1)), by positivity, ?_⟩
  have hpos : (0:Rat) < 3*(B+1) := by linarith
  have : (1:Rat)/(3*(1/(3*(B+1)))) = B + 1 := by
    field_simp
  rw [this]
  linarith

end SchwarzschildLift.Exclusion
