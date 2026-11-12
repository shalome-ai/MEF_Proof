#!/usr/bin/env python3
"""j2_cover_blind.py -- blind independent check (written from the prompt only).

Setting: T = R^2/Z^2, half-lattice points P1..P4, A = [[2,1],[1,1]].
Branched double covers of T branched exactly at P1..P4 are represented by
Z/2-valued classes phi on loops of T minus {P1..P4}:
    phi_{(al,be)}(loop) = (parity of crossings with a fixed cut system)
                          + al*dx + be*dy   (mod 2),
where (dx,dy) in Z^2 is the class of the loop in H_1(T).
Everything is exact (fractions.Fraction) except where floats are flagged.
"""
from fractions import Fraction as F
from itertools import product
import math, cmath

# ---------------------------------------------------------------- geometry
def orient(p, q, r):
    v = (q[0]-p[0])*(r[1]-p[1]) - (q[1]-p[1])*(r[0]-p[0])
    return (v > 0) - (v < 0)

def onseg(p, q, r):  # r collinear with pq assumed
    return (min(p[0], q[0]) <= r[0] <= max(p[0], q[0]) and
            min(p[1], q[1]) <= r[1] <= max(p[1], q[1]))

class Degenerate(Exception):
    pass

def crosses(p, q, a, b):
    """1 if segments pq and ab cross transversally, 0 if disjoint,
    raises Degenerate on any touching / collinear overlap."""
    o1, o2, o3, o4 = orient(p, q, a), orient(p, q, b), orient(a, b, p), orient(a, b, q)
    if o1*o2 < 0 and o3*o4 < 0:
        return 1
    if (o1 == 0 and onseg(p, q, a)) or (o2 == 0 and onseg(p, q, b)) or \
       (o3 == 0 and onseg(a, b, p)) or (o4 == 0 and onseg(a, b, q)):
        raise Degenerate((p, q, a, b))
    return 0

def cross_parity(loop, cuts):
    """loop: list of vertices in R^2 (a lift), last - first in Z^2.
    cuts: list of segments in R^2; all integer translates are used."""
    tot = 0
    for p, q in zip(loop, loop[1:]):
        xlo, xhi = min(p[0], q[0]), max(p[0], q[0])
        ylo, yhi = min(p[1], q[1]), max(p[1], q[1])
        for a, b in cuts:
            for m in range(math.floor(xlo) - 2, math.ceil(xhi) + 2):
                for n in range(math.floor(ylo) - 2, math.ceil(yhi) + 2):
                    tot += crosses(p, q, (a[0]+m, a[1]+n), (b[0]+m, b[1]+n))
    return tot % 2

def hclass(loop):
    dx, dy = loop[-1][0]-loop[0][0], loop[-1][1]-loop[0][1]
    assert dx.denominator == 1 and dy.denominator == 1
    return int(dx) % 2, int(dy) % 2

def phi(cover, loop, cuts):
    al, be = cover
    dx, dy = hclass(loop)
    return (cross_parity(loop, cuts) + al*dx + be*dy) % 2

def apply(M, loop):
    (a, b, c, d), (tx, ty) = M
    return [(a*x + b*y + tx, c*x + d*y + ty) for x, y in loop]

def mmul(X, Y):
    a, b, c, d = X; e, f, g, h = Y
    return (a*e+b*g, a*f+b*h, c*e+d*g, c*f+d*h)

def mpow(X, n):
    R = (1, 0, 0, 1)
    for _ in range(n):
        R = mmul(R, X)
    return R

# ---------------------------------------------------------------- data
P = {1: (F(0), F(0)), 2: (F(1, 2), F(0)), 3: (F(0), F(1, 2)), 4: (F(1, 2), F(1, 2))}
A = (2, 1, 1, 1)
B = (1, 1, 1, 0)
Z0 = (F(0), F(0))

# three different cut systems (each a mod-2 1-chain with boundary P1+P2+P3+P4)
CUTS = {
    "horizontal  P1P2 + P3P4": [(P[1], P[2]), (P[3], P[4])],
    "vertical    P1P3 + P2P4": [(P[1], P[3]), (P[2], P[4])],
    "star        P1P2 + P1P3 + P1P4": [(P[1], P[2]), (P[1], P[3]), (P[1], P[4])],
}

# generating loops of H_1(T - 4 points): two torus cycles + small loops
def small(c):
    offs = [(F(1, 23), F(1, 31)), (F(-1, 29), F(1, 37)), (F(-1, 41), F(-1, 27)), (F(1, 33), F(-1, 43))]
    pts = [(c[0]+u, c[1]+v) for u, v in offs]
    return pts + [pts[0]]

GEN = {
    "h": [(F(1, 17), F(3, 11)), (F(1, 17) + 1, F(3, 11))],
    "v": [(F(8, 11), F(2, 19)), (F(8, 11), F(2, 19) + 1)],
    "c1": small(P[1]), "c2": small(P[2]), "c3": small(P[3]), "c4": small(P[4]),
}
COVERS = list(product((0, 1), repeat=2))

def section(t):
    print("\n" + "=" * 72 + "\n" + t + "\n" + "=" * 72)

# ---------------------------------------------------------------- Q1
section("Q1  covers and which maps lift")
print("action of A on half-lattice points:")
for k, p in P.items():
    img = ((2*p[0]+p[1]) % 1, (p[0]+p[1]) % 1)
    print("   P%d -> P%d" % (k, [j for j, q in P.items() if q == img][0]))

MAPS = [("A", (A, Z0)), ("A^2", (mpow(A, 2), Z0)), ("A^3", (mpow(A, 3), Z0)),
        ("A^4", (mpow(A, 4), Z0)), ("A^6", (mpow(A, 6), Z0)),
        ("A^-1", ((1, -1, -1, 2), Z0)),
        ("B=[[1,1],[1,0]]", (B, Z0)), ("-I", ((-1, 0, 0, -1), Z0)),
        ("U=[[1,1],[0,1]]", ((1, 1, 0, 1), Z0)), ("L=[[1,0],[1,1]]", ((1, 0, 1, 1), Z0)),
        ("S=[[0,-1],[1,0]]", ((0, -1, 1, 0), Z0)), ("swap=[[0,1],[1,0]]", ((0, 1, 1, 0), Z0)),
        ("transl (1/2,0)", ((1, 0, 0, 1), (F(1, 2), F(0)))),
        ("transl (0,1/2)", ((1, 0, 0, 1), (F(0), F(1, 2)))),
        ("transl (1/2,1/2)", ((1, 0, 0, 1), (F(1, 2), F(1, 2))))]

intrinsic = {}
for cname, cuts in CUTS.items():
    print("\n--- cut system:", cname)
    # sanity: every candidate class is 1 on each small loop (genuinely branched)
    for cov in COVERS:
        vals = [phi(cov, GEN[g], cuts) for g in ("c1", "c2", "c3", "c4")]
        assert vals == [1, 1, 1, 1], (cov, vals)
    print("all 4 classes take value 1 on each small loop c1..c4: True")
    print("values (phi(h),phi(v)) of the four classes:",
          {cov: (phi(cov, GEN["h"], cuts), phi(cov, GEN["v"], cuts)) for cov in COVERS})
    base = (cross_parity(GEN["h"], cuts), cross_parity(GEN["v"], cuts))
    for mname, M in MAPS:
        table, fixed = {}, []
        for cov in COVERS:
            pulled = {g: phi(cov, apply(M, loop), cuts) for g, loop in GEN.items()}
            assert all(pulled[g] == 1 for g in ("c1", "c2", "c3", "c4"))
            new = ((pulled["h"] - base[0]) % 2, (pulled["v"] - base[1]) % 2)
            # full check on all six generating loops
            assert all(phi(new, GEN[g], cuts) == pulled[g] for g in GEN)
            table[cov] = new
            if new == cov:
                fixed.append(cov)
        print("  %-20s pull-back permutes classes: %s ; invariant: %d %s"
              % (mname, " ".join("%s->%s" % (c, table[c]) for c in COVERS), len(fixed), fixed))
        if mname == "A":
            assert len(fixed) == 1
            cov = fixed[0]
            intrinsic[cname] = (phi(cov, GEN["h"], cuts), phi(cov, GEN["v"], cuts))
print("\nA-invariant class, intrinsic values on the fixed loops (h,v), per cut system:")
for k, v in intrinsic.items():
    print("   %-34s (phi(h),phi(v)) = %s" % (k, v))
print("same class in all three cut systems:", len(set(intrinsic.values())) == 1)

# abstract cross-check: affine action on F_2^2
At2 = [[2 % 2, 1 % 2], [1 % 2, 1 % 2]]
fixedvecs = [v for v in COVERS if ((At2[0][0]*v[0] + At2[1][0]*v[1]) % 2, (At2[0][1]*v[0] + At2[1][1]*v[1]) % 2) == v]
print("vectors of F_2^2 fixed by A^T mod 2:", fixedvecs, " (only 0 => exactly one invariant class)")
print("A^3 mod 2 =", tuple(x % 2 for x in mpow(A, 3)), "; A^2+A+I mod 2 =",
      tuple((x+y+z) % 2 for x, y, z in zip(mpow(A, 2), A, (1, 0, 0, 1))))

# ---------------------------------------------------------------- Q2
section("Q2  topology of S")
chiT, deg, nbr = 0, 2, 4
chiS = deg*chiT - nbr*(2-1)
print("Riemann-Hurwitz: chi(S) = 2*chi(T) - 4 =", chiS, "; genus (if connected, orientable) =", (2-chiS)//2)
print("fixed points of tau = branch points:", nbr)

# ---------------------------------------------------------------- Q3
section("Q3  periodic points of A (downstairs)")
for n in range(1, 9):
    An = mpow(A, n)
    D = abs((An[0]-1)*(An[3]-1) - An[1]*An[2])
    line = "n=%d  tr(A^n)=%d  |det(A^n-I)|=%d" % (n, An[0]+An[3], D)
    if D <= 900:
        cnt = sum(1 for x in range(D) for y in range(D)
                  if ((An[0]-1)*x + An[1]*y) % D == 0 and (An[2]*x + (An[3]-1)*y) % D == 0)
        line += "  brute-force #Fix(A^n) on (1/D)Z^2/Z^2 = %d  match=%s" % (cnt, cnt == D)
    line += "  (1/n)log = %.6f" % (math.log(D)/n if D > 1 else 0.0)
    print(line)
print("every point of (1/q)Z^2/Z^2 is A-periodic (A permutes a finite set); least common period:")
for q in (2, 3, 4, 5, 6, 7, 10, 12):
    per = 1; M = A
    while tuple(x % q for x in M) != (1, 0, 0, 1):
        M = mmul(M, A); per += 1
    print("   q=%-3d order of A mod q = %d" % (q, per))

# ---------------------------------------------------------------- Q4
section("Q4  local form of the lift at a branch point")
a, b, c, d = A
al = complex(a+d, c-b)/2
be = complex(a-d, c+b)/2
print("A(z) = alpha*z + beta*conj(z), alpha =", al, " beta =", be)
print("exact: |alpha|^2-|beta|^2 =", F((a+d)**2+(c-b)**2, 4) - F((a-d)**2+(c+b)**2, 4), "(= det A)")
for z in (1+0j, 1j, 0.3-0.7j):
    assert abs(al*z + be*z.conjugate() - complex(a*z.real+b*z.imag, c*z.real+d*z.imag)) < 1e-12
def f(w):  # lift, principal root (Re(alpha+beta*u)>0 for |u|=1, so continuous)
    if w == 0: return 0j
    return w*cmath.sqrt(al + be*(w.conjugate()/w)**2)
print("min over |u|=1 of Re(alpha+beta*u) >= alpha-|beta| = %.6f > 0" % (al.real-abs(be)))
err = max(abs(f(w)**2 - (al*w*w + be*(w*w).conjugate())) for w in
          [cmath.rect(r, 2*math.pi*k/360) for r in (0.1, 1, 3) for k in range(360)])
print("max |f(w)^2 - A(w^2)| on samples (float):", err)
print("f(tw)=t f(w), t>0 (degree-1 homogeneous): max err",
      max(abs(f(2.5*w)-2.5*f(w)) for w in [cmath.rect(1, k/7) for k in range(44)]))
print("f(-w) = -f(w) (commutes with tau: w->-w): max err",
      max(abs(f(-w)+f(w)) for w in [cmath.rect(1, k/7) for k in range(44)]))
print("f(1)^2 = alpha+beta =", al+be, "; f(i)^2 = -(alpha+beta) ; f(1+i)^2 = 2i(alpha-beta) =", 2j*(al-be))
print("additivity test: f(1)+f(i) =", f(1+0j)+f(1j), "  f(1+i) =", f(1+1j))
print("   (f(1)+f(i))^2 = 2i(alpha+beta) =", 2j*(al+be), " != 2i(alpha-beta) =", 2j*(al-be),
      "  => f not additive => not R-linear => not differentiable at 0")
rs = [abs(f(cmath.rect(1, 2*math.pi*k/3600))) for k in range(3600)]
lam = (3+math.sqrt(5))/2
print("|f(w)|/|w| ranges over [%.6f, %.6f]; sqrt(lambda^-1), sqrt(lambda) = %.6f, %.6f"
      % (min(rs), max(rs), lam**-0.5, lam**0.5))
print("|f(e^{i th})| has period pi/2 in th: max err",
      max(abs(rs[k]-rs[(k+900) % 3600]) for k in range(3600)))
# prongs: preimage of the two eigen-lines under w -> w^2
print("eigen-directions of A through the branch point lift to 4 half-rays each "
      "(z-angle t -> w-angles t/2, t/2+pi, and (t+pi)/2, (t+pi)/2+pi): 4 contracting + 4 expanding prongs")

# ---------------------------------------------------------------- Q5
section("Q5  entropy numbers")
print("lambda = (3+sqrt5)/2 = %.12f ; log lambda = %.12f" % (lam, math.log(lam)))
print("chi(S) =", chiS, "(non-zero)")

# ---------------------------------------------------------------- Q6
section("Q6  least spectral radius among hyperbolic GL(2,Z) matrices")
def unit_modulus_root(t, dd):
    # x^2 - t x + dd ; exact test for a root of modulus one
    if 1 - t + dd == 0 or 1 + t + dd == 0:      # root +1 or -1
        return True
    if t*t - 4*dd < 0 and dd == 1:              # complex pair, |root|^2 = dd
        return True
    return False
def rho(t, dd):
    disc = t*t - 4*dd
    return (abs(t) + math.sqrt(disc))/2 if disc >= 0 else math.sqrt(dd)
N = 8
best = {}
count = 0
for a_, b_, c_, d_ in product(range(-N, N+1), repeat=4):
    dd = a_*d_ - b_*c_
    if dd not in (1, -1): continue
    t = a_ + d_
    if unit_modulus_root(t, dd): continue
    count += 1
    best.setdefault((abs(t), dd), []).append((a_, b_, c_, d_))
print("entries in [-%d,%d]: %d hyperbolic matrices of det +-1" % (N, N, count))
ranked = sorted(best, key=lambda k: rho(k[0], k[1]))
for k in ranked[:5]:
    print("   |trace|=%d det=%+d  spectral radius=%.12f  #matrices in box=%d" % (k[0], k[1], rho(*k), len(best[k])))
k0 = ranked[0]
print("minimum:", k0, " rho = %.12f ; golden ratio = %.12f" % (rho(*k0), (1+math.sqrt(5))/2))
print("examples of minimisers:", best[k0][:6])
print("all minimisers have det", {a_*d_-b_*c_ for a_, b_, c_, d_ in best[k0]},
      "and trace in", sorted({a_+d_ for a_, b_, c_, d_ in best[k0]}))
mI = (-1, 0, 0, -1)
print("all commute with -I:", all(mmul(m, mI) == mmul(mI, m) for m in best[k0]))
kd1 = [k for k in ranked if k[1] == 1][0]
print("least among det=+1:", kd1, "rho = %.12f" % rho(*kd1), "; A in that set:", A in best[kd1])
print("rho(A) = %.12f = rho_min^2 = %.12f" % (rho(3, 1), rho(*k0)**2))
print("B^2 == A:", mmul(B, B) == A, "; minimisers M with M^2 == A:", [m for m in best[k0] if mmul(m, m) == A])
print("exact monotonicity check, t=1..50: (t+sqrt(t^2+4))/2 and (t+sqrt(t^2-4))/2 increasing:",
      all(rho(t, -1) < rho(t+1, -1) for t in range(1, 50)) and all(rho(t, 1) < rho(t+1, 1) for t in range(3, 50)))
print("\nDONE (no assertion failed, no degenerate crossing met)")
