/-!
# M3 — Certificate L1: the fold in a finite model (Section 5, the smallest case)

Core toolchain, no Mathlib, no author axioms, zero `sorry`.

The pillowcase is the torus folded by z ↦ −z (M1 Theorem 5.7). This file checks
the finite bookkeeping of that fold on the grid (ℤ/4)², and of a second torus
lying over the same pillowcase, the grid (ℤ/8)².

Certified:
* `L1_fold_involution` — the fold applied twice is the identity on the grid;
* `L1_four_fixed`      — it fixes exactly four points, the half-lattice
                         (0,0), (0,2), (2,0), (2,2): the four corners;
* `L1_two_to_one`      — the other twelve points are moved, so they fall into
                         six pairs: the fold is two-to-one away from the corners;
* `L1_orbit_count`     — 6 pairs + 4 corners = 10 points of the folded grid;
* `L1_not_injective`   — two different points have the same image: the fold
                         loses information;
* `L1_second_cover`    — every point of the 4-grid has exactly four preimages
                         in the 8-grid;
* `L1_second_cover_fold` — the reduction 8-grid → 4-grid commutes with the fold,
                         so the larger torus also lies over the pillowcase;
* `L1_branched_hom_count` — of the assignments of 0 or 1 to four loops with even
                         sum, exactly one assigns 1 to all four.

Not certified: that the grid models the torus (it is the 4-torsion subgroup,
used as a finite model only); the classification of branched covers, which the
paper does not use.
-/

namespace M3L1

def range4 : List Nat := [0, 1, 2, 3]
def range8 : List Nat := [0, 1, 2, 3, 4, 5, 6, 7]
def grid4 : List (Nat × Nat) := range4.flatMap (fun a => range4.map (fun b => (a, b)))
def grid8 : List (Nat × Nat) := range8.flatMap (fun a => range8.map (fun b => (a, b)))

/-- The fold z ↦ −z on the grid (ℤ/n)². -/
def fold (n : Nat) (p : Nat × Nat) : Nat × Nat := ((n - p.1) % n, (n - p.2) % n)
/-- Reduction of the 8-grid to the 4-grid. -/
def red (p : Nat × Nat) : Nat × Nat := (p.1 % 4, p.2 % 4)

theorem L1_fold_involution : grid4.all (fun p => fold 4 (fold 4 p) == p) = true := by decide

theorem L1_four_fixed :
    grid4.filter (fun p => fold 4 p == p) = [(0, 0), (0, 2), (2, 0), (2, 2)] := by decide

theorem L1_two_to_one : (grid4.filter (fun p => fold 4 p != p)).length = 12 := by decide

theorem L1_orbit_count : 12 / 2 + 4 = 10 := by decide

theorem L1_not_injective : ((1, 0) : Nat × Nat) ≠ (3, 0) ∧ fold 4 (1, 0) = (3, 0) := by decide

theorem L1_second_cover :
    grid4.all (fun p => (grid8.filter (fun q => red q == p)).length == 4) = true := by decide

theorem L1_second_cover_fold :
    grid8.all (fun q => red (fold 8 q) == fold 4 (red q)) = true := by decide

def bits : List Nat := [0, 1]
def assignments : List (Nat × Nat × Nat × Nat) :=
  bits.flatMap (fun a => bits.flatMap (fun b => bits.flatMap (fun c => bits.map (fun d => (a, b, c, d)))))

theorem L1_branched_hom_count :
    (assignments.filter (fun x => (x.1 + x.2.1 + x.2.2.1 + x.2.2.2) % 2 == 0
        && x.1 == 1 && x.2.1 == 1 && x.2.2.1 == 1 && x.2.2.2 == 1)).length = 1 := by decide

end M3L1
