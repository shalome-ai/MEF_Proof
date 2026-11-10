/-!
# M3 — Certificate L3: corners, the fold, the drive and the sheet exchange (Section 3)

Core toolchain, no Mathlib, no author axioms, zero `sorry`.

The four corners of the pillowcase are the half-lattice points, written here with
coordinates doubled and reduced mod 2: P₁ = (0,0), P₂ = (1,0), P₃ = (0,1),
P₄ = (1,1) (M1 Appendix B). Three operations act on them: the fold −I, the drive
M₀ = ((2,1),(1,1)), and the quarter-turn S = ((0,1),(−1,0)) of the sheet
exchange τ (M2 Proposition 2.6).

Certified:
* `L3_fold_fixes_corners` — the fold fixes each of the four corners;
* `L3_drive_corners`      — the drive fixes P₁ and carries P₂ → P₃ → P₄ → P₂
                            (M1 Proposition 4.4);
* `L3_exchange_corners`   — S fixes P₁ and P₄ and exchanges P₂ and P₃
                            (M2 `L5_tau_corners`, re-derived);
* `L3_exchange_squared`   — S applied twice is the fold, entry by entry: S² = −I;
* `L3_exchange_not_symmetry_of_corners` — S does not commute with the drive on
                            the corners: S M₀ ≠ M₀ S at P₂;
* `L3_lift_signs`         — the corner signs (−1)^{mn} are +,+,+,− with product −1
                            (M1 Corollary 7.4);
* `L3_chirality_sum`      — opposite handedness: (+1) + (−1) = 0.
-/

namespace M3L3

def P1 : Nat × Nat := (0, 0)
def P2 : Nat × Nat := (1, 0)
def P3 : Nat × Nat := (0, 1)
def P4 : Nat × Nat := (1, 1)
def corners : List (Nat × Nat) := [P1, P2, P3, P4]

/-- −I mod 2. -/
def foldC (p : Nat × Nat) : Nat × Nat := ((2 - p.1) % 2, (2 - p.2) % 2)
/-- M₀ = ((2,1),(1,1)) mod 2. -/
def drive (p : Nat × Nat) : Nat × Nat := ((2 * p.1 + p.2) % 2, (p.1 + p.2) % 2)
/-- S = ((0,1),(−1,0)) mod 2: (x, y) ↦ (y, −x). -/
def exch (p : Nat × Nat) : Nat × Nat := (p.2 % 2, (2 - p.1) % 2)

theorem L3_fold_fixes_corners : corners.all (fun p => foldC p == p) = true := by decide

theorem L3_drive_corners :
    drive P1 = P1 ∧ drive P2 = P3 ∧ drive P3 = P4 ∧ drive P4 = P2 := by decide

theorem L3_exchange_corners :
    exch P1 = P1 ∧ exch P4 = P4 ∧ exch P2 = P3 ∧ exch P3 = P2 := by decide

/-- S² = −I over the integers: ((0,1),(−1,0))² = ((−1,0),(0,−1)). -/
theorem L3_exchange_squared :
    ((0:Int) * 0 + 1 * (-1), (0:Int) * 1 + 1 * 0, (-1:Int) * 0 + 0 * (-1), (-1:Int) * 1 + 0 * 0)
      = (-1, 0, 0, -1) := by decide

theorem L3_exchange_not_symmetry_of_corners : exch (drive P2) ≠ drive (exch P2) := by decide

def liftSign (p : Nat × Nat) : Int := if p.1 * p.2 % 2 = 0 then 1 else -1

theorem L3_lift_signs :
    corners.map liftSign = [1, 1, 1, -1] ∧ liftSign P1 * liftSign P2 * liftSign P3 * liftSign P4 = -1 := by decide

theorem L3_chirality_sum : (1 : Int) + (-1) = 0 := by decide

end M3L3
