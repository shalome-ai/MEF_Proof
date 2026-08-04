/- CERT-W12: the modular-permutation and normalisation spine of
   prop:sector-functions, thm:genus-jacobi and cor:sector-rep
   (core Lean, no Mathlib).
   Certifies: (1) the T-transformation sign combinatorics — n² ≡ n
   (mod 2), so the term-wise phase (-1)^{n²} on the θ₃ system is
   (-1)^n, which is the θ₄ system (the exchange R₃ ↔ R₄); and
   k(k+1) is even, so on the odd-square support (2k+1)² = 4k(k+1)+1
   (CERT-W1 `exponent_identity`) the T-phase is the uniform e^{iπ/4}
   (R₂ fixed). (2) The Euler normalisation ½(0+4+4+4) = 6. (3) The
   transpositions (3 4) and (2 4) on the sector triple generate all
   six permutations, pairwise distinct; both preserve the coordinate
   sum, and fix the all-ones vector — so the span splits into the
   invariant line and the sum-zero complement, whose irreducibility
   is CERT-W7. The analytic content — the free-field evaluation of the
   sector traces, the S-transformation (Poisson summation), and the
   elliptic shift laws — is human-audited with cited termini
   (Mumford; Dabholkar–Murthy–Zagier), outside scope. -/

/-- (1a) n² and n have the same parity: the θ₃ ↔ θ₄ exchange under T. -/
theorem sq_parity (n : Nat) : (n * n) % 2 = n % 2 := by
  have h : n % 2 = 0 ∨ n % 2 = 1 := by omega
  rcases h with h | h
  · have : n * n % 2 = 0 := Nat.mul_mod n n 2 ▸ by rw [h]
    omega
  · have : n * n % 2 = 1 := Nat.mul_mod n n 2 ▸ by rw [h]
    omega

/-- (1b) k(k+1) is even: the uniform θ₂ phase under T. -/
theorem consec_even (k : Nat) : (k * (k + 1)) % 2 = 0 := by
  have h : k % 2 = 0 ∨ k % 2 = 1 := by omega
  have hm := Nat.mul_mod k (k + 1) 2
  rcases h with h | h
  · rw [hm, h]; simp
  · have h1 : (k + 1) % 2 = 0 := by omega
    rw [hm, h1]; simp

/-- (2) The orbifold Euler normalisation: ½(0 + 4 + 4 + 4) = 6. -/
theorem euler_normalisation : (0 + 4 + 4 + 4) / 2 = 6 := rfl

/-- (3) Permutations of the sector triple (R₂, R₃, R₄) as functions on
    Fin-3-like indices 0,1,2 ↦ sectors 2,3,4, encoded as triples of
    images. tT = (3 4) — indices (0)(1 2); tS = (2 4) — indices (0 2)(1). -/
def pget (f : Nat × Nat × Nat) (i : Nat) : Nat :=
  match i with | 0 => f.1 | 1 => f.2.1 | _ => f.2.2

def pcomp (f g : Nat × Nat × Nat) : Nat × Nat × Nat :=
  (pget f g.1, pget f g.2.1, pget f g.2.2)

def pid : Nat × Nat × Nat := (0, 1, 2)
def tT : Nat × Nat × Nat := (0, 2, 1)
def tS : Nat × Nat × Nat := (2, 1, 0)

/-- The words 1, tT, tS, tT·tS, tS·tT, tT·tS·tT are pairwise distinct:
    the two transpositions generate all six elements of S₃. -/
def sixPerms : List (Nat × Nat × Nat) :=
  [pid, tT, tS, pcomp tT tS, pcomp tS tT, pcomp tT (pcomp tS tT)]

theorem s3_generated : sixPerms.Pairwise (· ≠ ·) ∧
    (pcomp tT tT = pid ∧ pcomp tS tS = pid) := by decide

/-- The permutation action on a coordinate triple. -/
def vget (v : Int × Int × Int) (i : Nat) : Int :=
  match i with | 0 => v.1 | 1 => v.2.1 | _ => v.2.2

def pact (f : Nat × Nat × Nat) (v : Int × Int × Int) : Int × Int × Int :=
  (vget v f.1, vget v f.2.1, vget v f.2.2)

/-- Both generators preserve the coordinate sum (universal over ℤ):
    the sum-zero complement is invariant. -/
theorem sum_preserved (a b c : Int) :
    (pact tT (a, b, c)).1 + (pact tT (a, b, c)).2.1
      + (pact tT (a, b, c)).2.2 = a + b + c ∧
    (pact tS (a, b, c)).1 + (pact tS (a, b, c)).2.1
      + (pact tS (a, b, c)).2.2 = a + b + c := by
  simp [pact, vget, tT, tS]; omega

/-- Both generators fix the all-ones vector: the invariant line. -/
theorem ones_fixed :
    pact tT (1, 1, 1) = (1, 1, 1) ∧ pact tS (1, 1, 1) = (1, 1, 1) := by
  decide

#print axioms sq_parity
#print axioms consec_even
#print axioms s3_generated
#print axioms sum_preserved
#print axioms ones_fixed
