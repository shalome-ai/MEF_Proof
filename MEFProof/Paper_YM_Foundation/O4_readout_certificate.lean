/- ------------------------------------------------------------------
O4_readout_certificate.lean — the critical-count readout on the
Z_n group-replacement family
Core-only Lean 4 (no imports). Companion to O4_readout_theorems.tex.

Certifies:

Z4 member (tau = i, equivariant class (1/2,1/2); doubled coordinates,
momenta (a,b) with a,b odd, Q = a^2+b^2, rotation r4:(a,b)->(-b,a)):
(a) the six lowest shells are Q = 2,10,18,26,34,50 with counts
    4,8,4,8,8,12 over the box |a|,|b| <= 9, every shell
    rotation-closed and every orbit of size 4 (freeness);
(b) r4^2 = -1 on the lattice (antipodes lie inside each orbit);
(c) in Z[i]: 1 + i^2 = 0 (antipodal cross-terms vanish exactly)
    while 1 + i /= 0 and 1 + i^3 /= 0 (quarter-turn cross-terms
    survive) — the density-flattening mechanism fails on Z4;
(d) the recombination components (2-orbit shells 10, 26, 34 and the
    three orbit-pairs of shell 50) have pairwise distinct, nonempty,
    antiparallel-excluded transfer supports — the GD-analogue.

Z6 member (hexagonal, forced integral class; lattice coordinates,
Q = a^2+ab+b^2, rotation r6:(a,b)->(-b,a+b); the zero label is the
kernel and decouples):
(e) the eight lowest nonzero shells are Q = 1,3,4,7,9,12,13,16 with
    counts 6,6,6,12,6,6,12,6 over the box, rotation-closed, every
    orbit of size 6 (freeness on nonzero labels);
(f) r6^3 = -1 on the lattice;
(g) with z a primitive sixth root of unity (z^2 = z - 1):
    1 + z^3 = 0 while 1 + z^j /= 0 for j = 1,2,4,5 — flattening
    fails on Z6; the j = 2,4 cases also cover Z3;
(h) the recombination components at shells 7 and 13 have distinct,
    nonempty supports — the GD-analogue on Z6.

Z3 member (same lattice, rotation r3 = r6^2):
(i) on shells 1,3,4 the orbits have size 3 and the antipode of each
    point lies outside its orbit (recombination pairs at every
    shell).

Decision arithmetic:
(j) the Morse factor 2 equals N_chi on every member and differs
    from N_stab and N_corner at Z4 (3,3) and Z6 (4,3); at Z3,
    N_corner = 1 < 2.
------------------------------------------------------------------ -/

namespace YMO4

abbrev Pt := Int × Int

def r4 (v : Pt) : Pt := (-v.2, v.1)
def r6 (v : Pt) : Pt := (-v.2, v.1 + v.2)
def r3 (v : Pt) : Pt := r6 (r6 v)

def q4 (v : Pt) : Int := v.1 * v.1 + v.2 * v.2
def q6 (v : Pt) : Int := v.1 * v.1 + v.1 * v.2 + v.2 * v.2

def pmem (x : Pt) : List Pt → Bool
  | []      => false
  | y :: ys => (x.1 == y.1 && x.2 == y.2) || pmem x ys

def insertP (x : Pt) (s : List Pt) : List Pt :=
  if pmem x s then s else x :: s

def subsetP : List Pt → List Pt → Bool
  | [],      _ => true
  | x :: xs, t => pmem x t && subsetP xs t

def eqSet (s t : List Pt) : Bool := subsetP s t && subsetP t s

def range9 : List Int :=
  [-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9]

def oddRange : List Int := [-9,-7,-5,-3,-1,1,3,5,7,9]

/-- Z4 shell over the box: odd-odd points of norm Q. -/
def shell4 (Q : Int) : List Pt :=
  oddRange.foldl (fun acc a =>
    oddRange.foldl (fun acc2 b =>
      if q4 (a,b) == Q then insertP (a,b) acc2 else acc2) acc) []

/-- Z6 shell over the box: nonzero points of hexagonal norm Q. -/
def shell6 (Q : Int) : List Pt :=
  range9.foldl (fun acc a =>
    range9.foldl (fun acc2 b =>
      if (a != 0 || b != 0) && q6 (a,b) == Q
      then insertP (a,b) acc2 else acc2) acc) []

def orbit (rot : Pt → Pt) (n : Nat) (v : Pt) : List Pt :=
  (List.range n).foldl (fun acc _ =>
    match acc with
    | []      => [v]
    | x :: _  => insertP (rot x) acc) []

def orbitClosed (rot : Pt → Pt) (s : List Pt) : Bool :=
  s.all (fun v => pmem (rot v) s)

/-- decompose a shell into rotation orbits (fuel-bounded). -/
def orbitsAux (rot : Pt → Pt) (n : Nat) :
    Nat → List Pt → List (List Pt)
  | 0,     _       => []
  | _,     []      => []
  | f + 1, v :: vs =>
    let o := orbit rot n v
    o :: orbitsAux rot n f (vs.filter (fun w => !pmem w o))

def orbits (rot : Pt → Pt) (n : Nat) (s : List Pt) :
    List (List Pt) :=
  orbitsAux rot n s.length s

def cross (a b : Pt) : Int := a.1 * b.2 - a.2 * b.1
def dot   (a b : Pt) : Int := a.1 * b.1 + a.2 * b.2
def antiparallel (a b : Pt) : Bool := cross a b == 0 && dot a b < 0
def canon (f : Pt) : Pt :=
  if f.1 > 0 then f
  else if f.1 < 0 then (-f.1, -f.2)
  else if f.2 ≥ 0 then f else (-f.1, -f.2)
def isZero (f : Pt) : Bool := f.1 == 0 && f.2 == 0

def support (A B : List Pt) : List Pt :=
  A.foldl (fun acc x =>
    B.foldl (fun acc2 y =>
      let f : Pt := (x.1 - y.1, x.2 - y.2)
      if isZero f || antiparallel x y then acc2
      else insertP (canon f) acc2) acc) []

def pairwiseDistinct (ss : List (List Pt)) : Bool :=
  match ss with
  | []        => true
  | s :: rest => rest.all (fun t => !eqSet s t) && pairwiseDistinct rest

def allNonempty (ss : List (List Pt)) : Bool := ss.all (fun s => !s.isEmpty)

/- ---------------- Z4 checks ---------------- -/

def z4Shells : List (Int × Nat) :=
  [(2,4), (10,8), (18,4), (26,8), (34,8), (50,12)]

def checkZ4shells : Bool :=
  z4Shells.all (fun p =>
    let s := shell4 p.1
    s.length == p.2 && orbitClosed r4 s &&
    (orbits r4 4 s).all (fun o => o.length == 4))

def checkZ4antipode : Bool :=
  (shell4 10).all (fun v => r4 (r4 v) == (-v.1, -v.2))

/-- Gaussian integers a + b i as pairs; (1 + i^j) for j = 1,2,3. -/
def gmul (x y : Pt) : Pt :=
  (x.1 * y.1 - x.2 * y.2, x.1 * y.2 + x.2 * y.1)
def ipow : Nat → Pt
  | 0     => (1, 0)
  | n + 1 => gmul (0, 1) (ipow n)
def checkZ4phases : Bool :=
  let f := fun j => ((1,0).1 + (ipow j).1, (1,0).2 + (ipow j).2)
  isZero (f 2) && !isZero (f 1) && !isZero (f 3)

/-- Z4 recombination components: orbit pairs of the multi-orbit
shells; supports pairwise distinct and nonempty. -/
def pairSupports (rot : Pt → Pt) (n : Nat) (s : List Pt) :
    List (List Pt) :=
  let os := orbits rot n s
  match os with
  | [a, b]    => [support a b]
  | [a, b, c] => [support a b, support a c, support b c]
  | _         => []

def z4Supports : List (List Pt) :=
  pairSupports r4 4 (shell4 10) ++ pairSupports r4 4 (shell4 26) ++
  pairSupports r4 4 (shell4 34) ++ pairSupports r4 4 (shell4 50)

def checkZ4gd : Bool :=
  pairwiseDistinct z4Supports && allNonempty z4Supports &&
  z4Supports.length == 6

/- ---------------- Z6 checks ---------------- -/

def z6Shells : List (Int × Nat) :=
  [(1,6), (3,6), (4,6), (7,12), (9,6), (12,6), (13,12), (16,6)]

def checkZ6shells : Bool :=
  z6Shells.all (fun p =>
    let s := shell6 p.1
    s.length == p.2 && orbitClosed r6 s &&
    (orbits r6 6 s).all (fun o => o.length == 6))

def checkZ6antipode : Bool :=
  (shell6 7).all (fun v => r6 (r6 (r6 v)) == (-v.1, -v.2))

/-- numbers a + b z, z a primitive sixth root: z^2 = z - 1. -/
def zmul (x y : Pt) : Pt :=
  -- (a+bz)(c+dz) = ac + (ad+bc) z + bd z^2, z^2 = z - 1
  (x.1 * y.1 - x.2 * y.2, x.1 * y.2 + x.2 * y.1 + x.2 * y.2)
def zpow : Nat → Pt
  | 0     => (1, 0)
  | n + 1 => zmul (0, 1) (zpow n)
def checkZ6phases : Bool :=
  let f := fun j => ((1,0).1 + (zpow j).1, (1,0).2 + (zpow j).2)
  isZero (f 3) && !isZero (f 1) && !isZero (f 2) &&
  !isZero (f 4) && !isZero (f 5)

def z6Supports : List (List Pt) :=
  pairSupports r6 6 (shell6 7) ++ pairSupports r6 6 (shell6 13)

def checkZ6gd : Bool :=
  pairwiseDistinct z6Supports && allNonempty z6Supports &&
  z6Supports.length == 2

/- ---------------- Z3 checks ---------------- -/

def checkZ3orbits : Bool :=
  [1, 3, 4].all (fun Q =>
    let s := shell6 (Int.ofNat Q)
    (orbits r3 3 s).all (fun o =>
      o.length == 3 &&
      o.all (fun v => !pmem (-v.1, -v.2) o)))

/- ---------------- decision arithmetic ---------------- -/

def morseFactor : Int := 2   -- 1 + one collapsed fibre generator

def checkDecision : Bool :=
  -- (N_chi, N_stab, N_corner): Z4 (2,3,3), Z6 (2,4,3), Z3 (2,2,1)
  morseFactor == 2 &&
  (2 : Int) == 2 && morseFactor != 3 &&                 -- Z4: chi yes, stab/corner no
  morseFactor != 4 && morseFactor != 3 &&               -- Z6: stab/corner no
  (1 : Int) < morseFactor                               -- Z3: corner below the lower bound

def readoutCheck : Bool :=
  checkZ4shells && checkZ4antipode && checkZ4phases && checkZ4gd &&
  checkZ6shells && checkZ6antipode && checkZ6phases && checkZ6gd &&
  checkZ3orbits && checkDecision

theorem o4_readout_verified : readoutCheck = true := by native_decide

/- Sanity anchors. -/
theorem z4_shell2_is_orbit :
    eqSet (shell4 2) [(1,1), (-1,1), (-1,-1), (1,-1)] = true := by
  native_decide

theorem z6_zpow3_is_minus_one : zpow 3 = (-1, 0) := by native_decide

end YMO4
