/- CERT-W2: sign clause of prop:appell3 (core Lean 4.15.0, no Mathlib).
   Certifies (-1)^((n-1)/2) = χ₋₄(n) on odd n. The χ₋₄ infrastructure is
   duplicated from CERT-W1 per the island rule. The monodromy reading is
   the paper's [D]-grade identification, outside scope. -/

namespace CertW2

def chi4 (n : Nat) : Int :=
  match n % 4 with
  | 1 => 1
  | 3 => -1
  | _ => 0

theorem neg_one_pow_eq (k : Nat) :
    (-1 : Int)^k = if k % 2 = 0 then 1 else -1 := by
  induction k with
  | zero => rfl
  | succ n ih =>
    rw [Int.pow_succ, ih]
    rcases Nat.mod_two_eq_zero_or_one n with h0 | h0
    · have h1 : (n+1) % 2 = 1 := by omega
      simp [h0, h1]
    · have h1 : (n+1) % 2 = 0 := by omega
      simp [h0, h1]

theorem odd_mod_four (k : Nat) :
    (2*k+1) % 4 = if k % 2 = 0 then 1 else 3 := by
  rcases Nat.mod_two_eq_zero_or_one k with h0 | h0
  · simp [h0]; omega
  · simp [h0]; omega

theorem chi4_odd (k : Nat) : chi4 (2*k+1) = (-1 : Int)^k := by
  rw [neg_one_pow_eq, chi4, odd_mod_four]
  rcases Nat.decEq (k % 2) 0 with h | h
  · simp [h]
  · simp [h]

/-- Main statement: on odd n, the Appell–Lerch sign equals χ₋₄. -/
theorem chi4_sign_odd (n : Nat) (h : n % 2 = 1) :
    chi4 n = (-1 : Int)^((n-1)/2) := by
  obtain ⟨k, rfl⟩ : ∃ k, n = 2*k+1 := ⟨n/2, by omega⟩
  have hk : (2*k+1-1)/2 = k := by omega
  rw [hk, chi4_odd]

#print axioms chi4_sign_odd

end CertW2
