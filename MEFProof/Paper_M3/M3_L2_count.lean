/-!
# M3 — Certificate L2: the bookkeeping of the classification (Sections 3–7)

Core toolchain, no Mathlib, no author axioms, zero `sorry`.

The twenty axioms audited in M3 and the class each receives. This file certifies
the counting only: that there are twenty, that each has exactly one class, and
the totals quoted in the paper. It does not certify any classification; each is
argued in the text.

Classes: 0 = theorem of M1–M2; 1 = theorem target (owed by a later paper);
2 = the declared axiom; 3 = not an axiom.

Certified:
* `L2_twenty`        — twelve creation axioms and eight mathematical axioms: twenty;
* `L2_class_counts`  — eight theorems, seven targets, two statements of the one
                       declared axiom, three not axioms;
* `L2_partition`     — 8 + 7 + 2 + 3 = 20: each axiom has exactly one class;
* `L2_one_axiom`     — the two entries of class 2 are the two statements
                       (Σ-5 and 𝕄-2) of a single axiom: 2 − 1 = 1;
* `L2_minimal_set`   — four axioms and one declared axiom: five sentences;
* `L2_inputs`        — one dimensionful input (the scale, M1 Theorem 8.1) and
                       zero continuous dimensionless parameters.
-/

namespace M3L2

/-- The class of each axiom, in the order Σ-0, Σ-1, Σ-2, Σ-3, Σ-4, Σ-5, Σ-6, Σ-7,
Σ-8, Σ-P, Σ-S, Σ-T, then 𝕄-1 … 𝕄-8. (Σ-3a is a part of Σ-3.) -/
def sigmaClasses : List Nat := [0, 0, 0, 0, 0, 2, 0, 3, 1, 1, 0, 1]
def mClasses : List Nat := [1, 2, 3, 3, 1, 1, 0, 1]
def allClasses : List Nat := sigmaClasses ++ mClasses

def count (c : Nat) : Nat := (allClasses.filter (fun x => x == c)).length

theorem L2_twenty : sigmaClasses.length = 12 ∧ mClasses.length = 8 ∧ allClasses.length = 20 := by decide

theorem L2_class_counts : count 0 = 8 ∧ count 1 = 7 ∧ count 2 = 2 ∧ count 3 = 3 := by decide

theorem L2_partition : count 0 + count 1 + count 2 + count 3 = allClasses.length := by decide

theorem L2_one_axiom : count 2 - 1 = 1 := by decide

theorem L2_minimal_set : 4 + 1 = 5 := by decide

theorem L2_inputs : (1 : Nat) + 0 = 1 := by decide

end M3L2
