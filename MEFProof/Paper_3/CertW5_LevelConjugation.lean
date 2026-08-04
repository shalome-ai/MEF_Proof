/- CERT-W5: group arithmetic of the thm:level-stabiliser proof repair
   (core Lean, no Mathlib). Certifies: (1) parity/divisibility of the
   diag(2,1)-conjugate of a Γ₀(4) element (entries a,d odd; 2b, c/2 even);
   (2) the reverse inclusion arithmetic; (3) triviality of the Γ(2)
   action on two-torsion labels. Cusp counts and modular-curve facts
   are cited (Diamond–Shurman), outside scope. -/

/-- (1) The conjugate of a Γ₀(4) element lies in Γ(2). -/
theorem gamma04_conj_in_gamma2 (a b c d : Int)
    (hc : c % 4 = 0) (hdet : a*d - b*c = 1) :
    a % 2 = 1 ∧ d % 2 = 1 ∧ (2*b) % 2 = 0 ∧ (c/2) % 2 = 0 := by
  obtain ⟨e, he⟩ : ∃ e, c = 2*e := ⟨c/2, by omega⟩
  have hbc : b*c = 2*(b*e) := by
    rw [he, Int.mul_left_comm]
  refine ⟨?_, ?_, by omega, by omega⟩
  · rcases Int.emod_two_eq a with h0 | h0
    · exfalso
      obtain ⟨s, hs⟩ : ∃ s, a = 2*s := ⟨a/2, by omega⟩
      have had : a*d = 2*(s*d) := by rw [hs, Int.mul_assoc]
      rw [had, hbc] at hdet
      omega
    · exact h0
  · rcases Int.emod_two_eq d with h0 | h0
    · exfalso
      obtain ⟨s, hs⟩ : ∃ s, d = 2*s := ⟨d/2, by omega⟩
      have had : a*d = 2*(a*s) := by rw [hs, Int.mul_left_comm]
      rw [had, hbc] at hdet
      omega
    · exact h0

/-- (2) Reverse inclusion: a Γ(2) element returns to Γ₀(4). -/
theorem gamma2_conj_in_gamma04 (b c : Int)
    (hb : b % 2 = 0) (hc : c % 2 = 0) :
    (2*c) % 4 = 0 ∧ 2*(b/2) = b := ⟨by omega, by omega⟩

/-- (3) Γ(2) acts trivially on the two-torsion labels. -/
theorem gamma2_trivial_on_twotorsion (a b c d m n : Int)
    (ha : a % 2 = 1) (hb : b % 2 = 0) (hc : c % 2 = 0) (hd : d % 2 = 1) :
    (a*m + b*n) % 2 = m % 2 ∧ (c*m + d*n) % 2 = n % 2 := by
  obtain ⟨s, hs⟩ : ∃ s, a = 2*s + 1 := ⟨a/2, by omega⟩
  obtain ⟨t, ht⟩ : ∃ t, b = 2*t := ⟨b/2, by omega⟩
  obtain ⟨u, hu⟩ : ∃ u, c = 2*u := ⟨c/2, by omega⟩
  obtain ⟨w, hw⟩ : ∃ w, d = 2*w + 1 := ⟨d/2, by omega⟩
  have h1 : a*m = 2*(s*m) + m := by
    rw [hs, Int.add_mul, Int.one_mul, Int.mul_assoc]
  have h2 : b*n = 2*(t*n) := by rw [ht, Int.mul_assoc]
  have h3 : c*m = 2*(u*m) := by rw [hu, Int.mul_assoc]
  have h4 : d*n = 2*(w*n) + n := by
    rw [hw, Int.add_mul, Int.one_mul, Int.mul_assoc]
  rw [h1, h2, h3, h4]
  omega

#print axioms gamma04_conj_in_gamma2
#print axioms gamma2_conj_in_gamma04
#print axioms gamma2_trivial_on_twotorsion
