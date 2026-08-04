/- CERT-W1: arithmetic spine of lem:shadow-classical (core Lean 4.15.0, no Mathlib)
   Certifies: (1) the exponent identity, (2) the sign/character identity,
   (3) coefficient agreement of the eta-product form with both closed forms
   to order x^50, (4) the level arithmetic. The infinite-series identity
   (Jacobi) and the Shimura residence are cited inputs, outside scope. -/

set_option maxRecDepth 40000

namespace CertW1

/-- Portable (index, value) enumeration: `List.enum` was removed from
    the 4.29 core library; `range`/`zip` exist in every toolchain. -/
def enumL {α : Type} (xs : List α) : List (Nat × α) :=
  (List.range xs.length).zip xs

def chi4 (n : Nat) : Int :=
  match n % 4 with
  | 1 => 1
  | 3 => -1
  | _ => 0

/-- (1) Exponent identity: (2k+1)² = 4·k(k+1) + 1. -/
theorem exponent_identity (k : Nat) : (2*k+1)*(2*k+1) = 4*(k*(k+1)) + 1 := by
  have h4 : 2*k*(2*k) = 4*(k*k) := by
    calc 2*k*(2*k) = 2*(k*(2*k)) := by rw [Nat.mul_assoc]
    _ = 2*(2*(k*k)) := by rw [Nat.mul_left_comm k 2 k]
    _ = 2*2*(k*k) := by rw [Nat.mul_assoc]
  have h5 : k*(k+1) = k*k + k := by rw [Nat.mul_add, Nat.mul_one]
  rw [Nat.add_mul, Nat.mul_add, Nat.one_mul, Nat.mul_one, h4, h5]
  omega

/-- Parity form of (−1)^k over ℤ. -/
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

/-- Residue of 2k+1 mod 4, by parity of k. -/
theorem odd_mod_four (k : Nat) :
    (2*k+1) % 4 = if k % 2 = 0 then 1 else 3 := by
  rcases Nat.mod_two_eq_zero_or_one k with h0 | h0
  · simp [h0]; omega
  · simp [h0]; omega

/-- (2) Sign identity: χ₋₄(2k+1) = (−1)^k. -/
theorem chi4_odd (k : Nat) : chi4 (2*k+1) = (-1 : Int)^k := by
  rw [neg_one_pow_eq, chi4, odd_mod_four]
  rcases Nat.decEq (k % 2) 0 with h | h
  · simp [h]
  · simp [h]

/-- Truncated polynomial arithmetic on coefficient lists (index = exponent). -/
def padd : List Int → List Int → List Int
  | [], ys => ys
  | xs, [] => xs
  | x :: xs, y :: ys => (x + y) :: padd xs ys

def psmulShift (c : Int) (k : Nat) (xs : List Int) : List Int :=
  List.replicate k 0 ++ xs.map (c * ·)

def pmulTrunc (n : Nat) (xs ys : List Int) : List Int :=
  ((enumL xs).foldl (fun acc (p : Nat × Int) =>
    padd acc (psmulShift p.2 p.1 ys)) []).take n

def cubeFactor (n m : Nat) : List Int :=
  let f : List Int := padd (List.replicate (8*m) 0 ++ [(-1 : Int)]) [1]
  pmulTrunc n (pmulTrunc n f f) f

/-- x · ∏_{m=1}^{M} (1 − x^{8m})³, truncated to order n. -/
def etaCubeTrunc (n M : Nat) : List Int :=
  let prod := (List.range M).foldl
    (fun acc m => pmulTrunc n (cubeFactor n (m+1)) acc) [1]
  (psmulShift 1 1 prod).take n

/-- Closed form Σ (−1)^k (2k+1) x^{(2k+1)²}, truncated. -/
def jacobiTrunc (n : Nat) : List Int :=
  (List.range n).map (fun e =>
    match (List.range n).find? (fun k => (2*k+1)*(2*k+1) == e) with
    | some k => (if k % 2 = 0 then 1 else -1) * (2*k+1)
    | none => 0)

/-- Closed form Σ χ₋₄(m) m x^{m²}, truncated. -/
def chiTrunc (n : Nat) : List Int :=
  (List.range n).map (fun e =>
    match (List.range n).find? (fun m => m*m == e) with
    | some m => chi4 m * m
    | none => 0)

/-- (3) Coefficient agreement to order x^50. -/
theorem product_eq_jacobi_50 : etaCubeTrunc 50 7 = jacobiTrunc 50 := by decide
theorem product_eq_chi_50 : etaCubeTrunc 50 7 = chiTrunc 50 := by decide

/-- (4) Level arithmetic at conductor four. -/
theorem level_sixty_four : 4 * 4^2 = 64 := rfl

#print axioms exponent_identity
#print axioms chi4_odd
#print axioms product_eq_jacobi_50
#print axioms product_eq_chi_50

end CertW1
