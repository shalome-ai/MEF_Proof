/-
  ICO_C7 : Icosian membership pattern and generation arithmetic
  Source: The_Icosian_Completion_of_K8_v2.tex
    - Theorem 3 (thm:icosian)(i):
        (a) the coefficient vector of q₅ is the even permutation
            (1 4)(2 3) of the standard icosian unit pattern
            ½(0, 1, phi⁻¹, phi)                                  [R]
        (b) the stable-branch unit pattern is the odd permutation (1 4)
            of the same pattern (GR-2 confirmation)              [R]
        (c) lcm(24, 10) = 120 = |2I|  (generation arithmetic)    [R]
  Encoding: coefficient 4-tuples over Zphi := Int × Int (scaled by 2, as
  in ICO_C6); permutations of positions {1,2,3,4} given as explicit
  transpositions t14, t23 on Fin 4, with the target permutation exhibited
  as their composition — evenness is thereby witnessed constructively
  (a product of exactly two disjoint transpositions).
  Deflationary reading: that the even coordinate permutations of
  ½(0, 1, phi⁻¹, phi) enumerate icosian units is the classical
  Conway–Sloane tabulation [cite-only in the source]; certified here is
  the arithmetic fact that q₅'s coefficient vector IS the stated even
  permutation of that pattern (and the stable branch the odd one), plus
  the lcm computation driving |⟨2T, q₅⟩| ≥ 120. The ADE classification
  and the 2O-exclusion (√2 ∉ Q(√5)) are classical/human-auditable and
  are NOT certified (the latter flagged at scope confirmation: a Lean
  proof would want Mathlib).
  Lean 4.15.0 core only. No axioms beyond kernel defaults. Zero sorry.
-/

namespace ICOC7

abbrev Zphi := Int × Int

/-- Coefficient 4-tuples (r, i, j, k) over Zphi, scaled by 2. -/
abbrev Coeffs := Zphi × Zphi × Zphi × Zphi

/-- The standard icosian unit pattern ½(0, 1, phi⁻¹, phi), scaled:
    (0, 1, phi − 1, phi). -/
def pattern : Coeffs := ((0,0), (1,0), (-1,1), (0,1))

/-- Q5 coefficients, scaled: (phi, phi⁻¹, 1, 0) — cf. ICO_C6. -/
def q5c : Coeffs := ((0,1), (-1,1), (1,0), (0,0))

/-- Stable-branch coefficients (one sign representative), scaled:
    (phi, 1, phi⁻¹, 0) — the (1 4) image of the pattern. -/
def stablec : Coeffs := ((0,1), (1,0), (-1,1), (0,0))

/-- Transposition (1 4) on positions. -/
def t14 (c : Coeffs) : Coeffs := (c.2.2.2, c.2.1, c.2.2.1, c.1)

/-- Transposition (2 3) on positions. -/
def t23 (c : Coeffs) : Coeffs := (c.1, c.2.2.1, c.2.1, c.2.2.2)

/-- (a) q₅'s coefficient vector is the EVEN permutation (1 4)(2 3) of
    the standard icosian pattern — exhibited as the composition of two
    disjoint transpositions, witnessing evenness. Hence q₅ ∈ 2I = 𝕀¹. -/
theorem q5_is_even_perm_of_pattern : t14 (t23 pattern) = q5c := by decide

/-- The two transpositions are disjoint and commute on the pattern
    (order of composition immaterial). -/
theorem transpositions_commute : t23 (t14 pattern) = q5c := by decide

/-- (b) The stable-branch unit is the ODD permutation (1 4) alone of the
    same pattern — it lies in a conjugate maximal order (GR-2:
    orientation reversal of S¹_Sol lands in the conjugate order). -/
theorem stable_is_odd_perm_of_pattern : t14 pattern = stablec := by decide

/-- The even and odd images differ: the two branches are genuinely in
    different coordinate orbits. -/
theorem branches_differ : q5c ≠ stablec := by decide

/-- (c) lcm(24, 10) = 120: since 2T ⊆ ⟨2T, q₅⟩ and ord(q₅) = 10
    (ICO_C6), |⟨2T, q₅⟩| is divisible by 120 = |2I|. -/
theorem lcm_24_10 : Nat.lcm 24 10 = 120 := by decide

/-- Supporting arithmetic: |2T| = 24 divides 120 and ord(q₅) = 10
    divides 120, while 120 = |2I|. -/
theorem divisibility : 120 % 24 = 0 ∧ 120 % 10 = 0 := by decide

#print axioms q5_is_even_perm_of_pattern
#print axioms transpositions_commute
#print axioms stable_is_odd_perm_of_pattern
#print axioms branches_differ
#print axioms lcm_24_10
#print axioms divisibility

end ICOC7
