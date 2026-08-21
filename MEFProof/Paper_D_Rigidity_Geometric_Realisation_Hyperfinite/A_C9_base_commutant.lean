/-
  A_C9_base_commutant.lean  —  Paper A certificate C9.
  Statement certified: the commutant of λ(ℍ) in the 4×4 model is ρ(ℍ).
  Concretely, in the basis {1, i, j, k}: if a 4×4 matrix M commutes with
  λ(i) and λ(j) (which generate the image of λ on the model), then M is
  the linear combination
      M = m₀₀·ρ(1) + m₁₀·ρ(i) + m₂₀·ρ(j) + m₃₀·ρ(k),
  i.e. M = ρ(q) for the quaternion q = M·1 read off the first column;
  the converse inclusion ρ(ℍ) ⊆ λ(ℍ)′ is certificate C6 (lam_rho_comm),
  restated here at matrix level for completeness       [rho_in_commutant].
  Two formulations are certified:
    (1) the coordinate form: the sixteen commutation equations force the
        twelve determination equations                  [commutant_coords]
    (2) the matrix form over the Fin-4 model            [commutant_matrix].
  The equation set was generated symbolically and the forced solution
  verified with a computer-algebra cross-check before transcription.
  Scope note for the C6–C9 suite: these certificates cover the
  finite-dimensional algebraic spine of Paper A §§4–5. The analytic
  content of the rigidity theorem — weak closures, the trace, spectral
  functional calculus, and the cocycle argument — is not formalised and
  remains human-audited, as in the paper.
  Lean 4.15.0, core only.  Zero `sorry`, zero declared axioms.
-/

namespace AC9

/-- (1)  Coordinate form. Hypotheses: the entrywise content of
    λ(i)M = Mλ(i) and λ(j)M = Mλ(j). Conclusion: every entry of M is the
    stated signed copy of a first-column entry, so M = ρ(q) with
    q = (m00, m10, m20, m30). -/
theorem commutant_coords
    (m00 m01 m02 m03 m10 m11 m12 m13
     m20 m21 m22 m23 m30 m31 m32 m33 : Int)
    -- λ(i)M = Mλ(i):
    (h₁ : -m01 - m10 = 0) (h₂ : m00 - m11 = 0)
    (h₃ : -m03 - m12 = 0) (h₄ : m02 - m13 = 0)
    (h₅ : -m21 - m30 = 0) (h₆ : m20 - m31 = 0)
    (h₇ : -m23 - m32 = 0) (h₈ : m22 - m33 = 0)
    -- λ(j)M = Mλ(j):
    (h₉ : -m02 - m20 = 0) (h₁₀ : m03 - m21 = 0)
    (h₁₁ : m00 - m22 = 0) (h₁₂ : -m01 - m23 = 0)
    (_h₁₃ : -m12 + m30 = 0) (_h₁₄ : m13 + m31 = 0)
    (_h₁₅ : m10 + m32 = 0) (_h₁₆ : -m11 + m33 = 0) :
    m01 = -m10 ∧ m02 = -m20 ∧ m03 = -m30 ∧
    m11 =  m00 ∧ m12 =  m30 ∧ m13 = -m20 ∧
    m21 = -m30 ∧ m22 =  m00 ∧ m23 =  m10 ∧
    m31 =  m20 ∧ m32 = -m10 ∧ m33 =  m00 := by
  omega

/- ## Matrix form -/

def Mat4 := Fin 4 → Fin 4 → Int

def mul (A B : Mat4) : Mat4 :=
  fun r c => A r 0 * B 0 c + A r 1 * B 1 c + A r 2 * B 2 c + A r 3 * B 3 c

def lamI : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 1 => -1 | 1, 0 => 1 | 2, 3 => -1 | 3, 2 => 1 | _, _ => 0
def lamJ : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 2 => -1 | 1, 3 => 1 | 2, 0 => 1 | 3, 1 => -1 | _, _ => 0
def lamK : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 3 => -1 | 1, 2 => -1 | 2, 1 => 1 | 3, 0 => 1 | _, _ => 0

/-- ρ(q) for q = (q₀, q₁, q₂, q₃): the right-multiplication matrix. -/
def rhoOf (q0 q1 q2 q3 : Int) : Mat4 := fun r c =>
  match r.val, c.val with
  | 0, 0 => q0 | 0, 1 => -q1 | 0, 2 => -q2 | 0, 3 => -q3
  | 1, 0 => q1 | 1, 1 =>  q0 | 1, 2 =>  q3 | 1, 3 => -q2
  | 2, 0 => q2 | 2, 1 => -q3 | 2, 2 =>  q0 | 2, 3 =>  q1
  | 3, 0 => q3 | 3, 1 =>  q2 | 3, 2 => -q1 | 3, 3 =>  q0
  | _, _ => 0

/-- (2)  Matrix form: a matrix commuting entrywise with λ(i) and λ(j) is
    ρ(q) for q its first column. -/
theorem commutant_matrix (M : Mat4)
    (hi : ∀ r c, mul lamI M r c = mul M lamI r c)
    (hj : ∀ r c, mul lamJ M r c = mul M lamJ r c) :
    ∀ r c, M r c = rhoOf (M 0 0) (M 1 0) (M 2 0) (M 3 0) r c := by
  intro r c
  have e₁ := hi 0 0; have e₂ := hi 0 1; have e₃ := hi 0 2; have e₄ := hi 0 3
  have e₅ := hi 1 0; have e₆ := hi 1 1; have e₇ := hi 1 2; have e₈ := hi 1 3
  have e₉ := hi 2 0; have e₁₀ := hi 2 1; have e₁₁ := hi 2 2; have e₁₂ := hi 2 3
  have e₁₃ := hi 3 0; have e₁₄ := hi 3 1; have e₁₅ := hi 3 2; have e₁₆ := hi 3 3
  have f₁ := hj 0 0; have f₂ := hj 0 1; have f₃ := hj 0 2; have f₄ := hj 0 3
  have f₅ := hj 1 0; have f₆ := hj 1 1; have f₇ := hj 1 2; have f₈ := hj 1 3
  have f₉ := hj 2 0; have f₁₀ := hj 2 1; have f₁₁ := hj 2 2; have f₁₂ := hj 2 3
  have f₁₃ := hj 3 0; have f₁₄ := hj 3 1; have f₁₅ := hj 3 2; have f₁₆ := hj 3 3
  simp only [mul, lamI, lamJ] at e₁ e₂ e₃ e₄ e₅ e₆ e₇ e₈ e₉ e₁₀ e₁₁ e₁₂ e₁₃ e₁₄ e₁₅ e₁₆
  simp only [mul, lamI, lamJ] at f₁ f₂ f₃ f₄ f₅ f₆ f₇ f₈ f₉ f₁₀ f₁₁ f₁₂ f₁₃ f₁₄ f₁₅ f₁₆
  match r, c with
  | ⟨0,_⟩, ⟨0,_⟩ => simp [rhoOf]
  | ⟨0,_⟩, ⟨1,_⟩ => simp [rhoOf]; omega
  | ⟨0,_⟩, ⟨2,_⟩ => simp [rhoOf]; omega
  | ⟨0,_⟩, ⟨3,_⟩ => simp [rhoOf]; omega
  | ⟨1,_⟩, ⟨0,_⟩ => simp [rhoOf]
  | ⟨1,_⟩, ⟨1,_⟩ => simp [rhoOf]; omega
  | ⟨1,_⟩, ⟨2,_⟩ => simp [rhoOf]; omega
  | ⟨1,_⟩, ⟨3,_⟩ => simp [rhoOf]; omega
  | ⟨2,_⟩, ⟨0,_⟩ => simp [rhoOf]
  | ⟨2,_⟩, ⟨1,_⟩ => simp [rhoOf]; omega
  | ⟨2,_⟩, ⟨2,_⟩ => simp [rhoOf]; omega
  | ⟨2,_⟩, ⟨3,_⟩ => simp [rhoOf]; omega
  | ⟨3,_⟩, ⟨0,_⟩ => simp [rhoOf]
  | ⟨3,_⟩, ⟨1,_⟩ => simp [rhoOf]; omega
  | ⟨3,_⟩, ⟨2,_⟩ => simp [rhoOf]; omega
  | ⟨3,_⟩, ⟨3,_⟩ => simp [rhoOf]; omega

/-- The four basis right multiplications ρ(1), ρ(i), ρ(j), ρ(k). -/
def rhoBasis : Fin 4 → Mat4
  | ⟨0,_⟩ => rhoOf 1 0 0 0 | ⟨1,_⟩ => rhoOf 0 1 0 0
  | ⟨2,_⟩ => rhoOf 0 0 1 0 | ⟨3,_⟩ => rhoOf 0 0 0 1

/-- The converse inclusion: every ρ(q) commutes with λ(i), λ(j), λ(k).
    Verified for the generating values of q on the basis; linearity
    extends this in the paper (and A_C6 certifies the unit cases). -/
theorem rho_in_commutant :
    ∀ (e : Fin 4) (r c : Fin 4),
      mul lamI (rhoBasis e) r c = mul (rhoBasis e) lamI r c ∧
      mul lamJ (rhoBasis e) r c = mul (rhoBasis e) lamJ r c ∧
      mul lamK (rhoBasis e) r c = mul (rhoBasis e) lamK r c := by
  decide

#print axioms commutant_coords
#print axioms commutant_matrix
#print axioms rho_in_commutant

end AC9
