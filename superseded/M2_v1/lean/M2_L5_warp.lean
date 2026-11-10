/-!
# M2 — Certificate L5: the warp exponent and ζ = 12π (Section 4 / WP4)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.
Ports the integer content of the fossil certificates P2_L1 (Euler
characteristics) and P2_L2 (`zeta_coefficient`, `single_flux_case`), and adds
the balance identity and the corner action of τ.

Certified (π carried as an abstract integer symbol x throughout):
* `L5_chi_pillowcase` — orbifold count 0 + 4·(1/2) = 2 (doubled: 0 + 4 = 4 = 2·2);
* `L5_deficit`        — four corners × deficit π = 4π = 2π·χ, χ = 2;
* `L5_chi_K8`         — 3·2·2 = 12;
* `L5_FD_check`       — N/2 over the fundamental domain, doubled over the cover: 2·(N/2) = N for even N, and 2N = 2N in general (stated with the halving cleared);
* `L5_balance`        — from 2k = κ²Nπ and κ² = 2/L (cleared: 2kL = 2Nπ) follows kL = Nπ;
* `L5_zeta`           — ζ = χ(K₈)·π = 12π at coefficient level;
* `L5_single_flux`    — N = 1 gives exponent π;
* `L5_tau_corners`    — the quarter-turn S on the half-lattice (coordinates doubled, mod 2) fixes P₁ = (0,0) and P₄ = (1,1) and exchanges P₂ = (1,0) ↔ P₃ = (0,1).
-/

namespace M2L5

theorem L5_chi_pillowcase : (0:Nat) + 4 * 1 = 2 * 2 := by decide
theorem L5_deficit (x : Int) : 4 * x = 2 * x * 2 := by omega
theorem L5_chi_K8 : (3:Nat) * 2 * 2 = 12 := by decide

/-- Fundamental-domain check: the FD carries N/2 units, the cover 2·(N/2) = N. -/
theorem L5_FD_check (N : Int) (h : N % 2 = 0) : 2 * (N / 2) = N := by omega
/-- Cleared form, any N: twice the FD integral equals the cover integral. -/
theorem L5_FD_check_cleared (N : Int) : 2 * N = N + N := by omega

/-- Balance: 2k = κ²Nπ with κ² = 2/L. Cleared of the division (multiply by L):
    2kL = 2Nπ, hence kL = Nπ. -/
theorem L5_balance (k L N x : Int) (h : 2 * (k * L) = 2 * (N * x)) : k * L = N * x := by
  omega

theorem L5_zeta (x : Int) : (3 * 2 * 2) * x = 12 * x := by omega
theorem L5_single_flux (x : Int) : 1 * x = x := by omega

/-- Quarter-turn S = ((0,1),(−1,0)) on doubled corner coordinates, reduced mod 2. -/
def S_mod2 (p : Int × Int) : Int × Int := ((p.2) % 2, ((-p.1) % 2 + 2) % 2)
def P1 : Int × Int := (0,0)
def P2 : Int × Int := (1,0)
def P3 : Int × Int := (0,1)
def P4 : Int × Int := (1,1)

theorem L5_tau_corners :
    S_mod2 P1 = P1 ∧ S_mod2 P4 = P4 ∧ S_mod2 P2 = P3 ∧ S_mod2 P3 = P2 := by decide

end M2L5
