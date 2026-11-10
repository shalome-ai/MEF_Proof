/-!
# M2 — Certificate L3: the arithmetic face of ζ = 12π (Section 4 / WP4)

Core toolchain, Lean 4.15.0, no Mathlib, no author axioms, zero `sorry`.

What this certifies, and what it does not. ζ = 12π is derived in M2 §4 as the
total warp exponent k_ω L_ω = N π of the two-dimensional Einstein–Maxwell
system on the pillowcase with N = χ(K₈) flux units (BPS completion, Dirac
quantisation, kink balance, Gauss–Bonnet normalisation κ₂² = 2/L_ω). That
derivation is analytic and is in the text. This file certifies only its
integer skeleton, with π carried as a formal unit (all angles in units of π):

* `L3_chi_K8`        — χ(K₈) = χ(ℂP²)·χ(S²)·χ(T²/ℤ₂) = 3·2·2 = 12 (M1 Thm 7.6);
* `L3_deficit_each`  — a cone of angle π has deficit 2π − π = π;
* `L3_deficit_total` — four such cones total 4π = 2π·χ(S²), χ = 2 (Gauss–Bonnet);
* `L3_zeta_units`    — ζ/π = N = χ(K₈) = 12, and 12 = 4·3 = (4π/π)·χ(ℂP²):
                        the cone-deficit reading and the χ(K₈) reading are one
                        identity read in two orders (Künneth), not two routes.
-/

namespace M2L3

def chi_CP2    : Nat := 3   -- M1 Prop 7.2 (L4_chi_counts)
def chi_S2     : Nat := 2
def chi_pillow : Nat := 2   -- M1 Thm 5.7 (L2_chi_pillowcase)
def chi_K8     : Nat := chi_CP2 * chi_S2 * chi_pillow   -- M1 Thm 7.6 (L3_chi_K8)

theorem L3_chi_K8 : chi_K8 = 12 := by decide

/-- Angles in units of π: a full turn is 2, a cone point of the pillowcase is 1. -/
def fullTurn  : Nat := 2
def coneAngle : Nat := 1
def deficit   : Nat := fullTurn - coneAngle
def nCones    : Nat := 4

theorem L3_deficit_each : deficit = 1 := by decide
/-- Total deficit 4π equals 2π·χ(pillowcase) with χ = 2 (Gauss–Bonnet, M1 Thm 5.7). -/
theorem L3_deficit_total : nCones * deficit = fullTurn * chi_pillow := by decide

/-- ζ in units of π equals the flux number N = χ(K₈) (tadpole, M2 §4). -/
def N_flux     : Nat := chi_K8
def zeta_units : Nat := N_flux

theorem L3_zeta_units : zeta_units = 12 := by decide
/-- The cone-deficit reading: (total deficit / π) × χ(ℂP²) = 4·3 = 12. -/
theorem L3_cone_reading : nCones * deficit * chi_CP2 = zeta_units := by decide
/-- The two readings coincide identically by the Künneth factorisation. -/
theorem L3_one_identity :
    nCones * deficit * chi_CP2 = chi_CP2 * chi_S2 * chi_pillow := by decide

end M2L3
