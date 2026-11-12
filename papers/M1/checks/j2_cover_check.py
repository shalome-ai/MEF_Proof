#!/usr/bin/env python3
"""J2 of the audit of Theorem 8.1 (M1 v6.3): the architect's check of the lead in
papers/M1/J2_COVER_LEAD.md.  Written after sections 1-3 of that note, 12 Nov 2026.

What is checked (exact rational arithmetic unless said):
 S1  M0^2 = (5 3; 3 2); Dathe's two branch points are fixed by it and exchanged by -I.
 S2  The four double covers of the torus branched at the four half-lattice points,
     each given by its Z/2 monodromy; which of them M0, M0^2, M0^3 carry to themselves.
 S3  Riemann-Hurwitz: the genus of the cover.
 S4  Periodic points of M0: det(M0^n - I) != 0, so they are rational points.
 S5  The lift at a branch point is not additive, hence not differentiable there (floating point).
 S6  Least spectral radius among hyperbolic integer matrices of determinant +1 or -1.
What is NOT checked: that a monodromy-preserving map lifts (covering-space theory);
entropy; anything about other smooth structures.
"""
from fractions import Fraction as Fr
from math import floor, sqrt
import cmath, itertools

def mat(a, b, c, d): return ((a, b), (c, d))
def mul(A, B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def app(A, v): return (A[0][0]*v[0] + A[0][1]*v[1], A[1][0]*v[0] + A[1][1]*v[1])
def det(A): return A[0][0]*A[1][1] - A[0][1]*A[1][0]
def tr(A): return A[0][0] + A[1][1]
I2 = mat(1, 0, 0, 1)
M0 = mat(2, 1, 1, 1)

ok = True
def report(name, cond, extra=""):
    global ok
    ok = ok and bool(cond)
    print(f"{name}: {'PASS' if cond else 'FAIL'} {extra}")

# ---- S1
M02 = mul(M0, M0)
frac = lambda x: x - floor(x)
pts = [(Fr(1, 5), Fr(2, 5)), (Fr(4, 5), Fr(3, 5))]
fixed = all(tuple(map(frac, app(M02, p))) == p for p in pts)
swapped = tuple(map(frac, (-pts[0][0], -pts[0][1]))) == pts[1]
report("S1 M0^2 = (5 3; 3 2)", M02 == mat(5, 3, 3, 2))
report("S1 Dathe's branch points fixed by M0^2", fixed)
report("S1 Dathe's branch points exchanged by -I", swapped)

# ---- S2  covers by monodromy
# Cuts: the segments y = h, x in [j, j+1/2], for every h in (1/2)Z and integer j.
# They join P1-P2 (h integer) and P3-P4 (h half-integer); each P_i ends exactly one cut.
# mu_{a,b}(loop) = (crossings with the cuts) + a*m + b*n mod 2, (m, n) the class of the loop in H_1(T^2).
def crossings(p, q):
    """transverse crossings of the straight segment p->q with the cuts; asserts genericity"""
    (x1, y1), (x2, y2) = p, q
    if y1 == y2:
        assert frac(2*y1) != 0
        return 0
    lo, hi = min(y1, y2), max(y1, y2)
    n, h = 0, Fr(floor(2*lo), 2)
    while h <= hi:
        if lo < h < hi:
            x = x1 + (h - y1)*(x2 - x1)/(y2 - y1)
            f = frac(x)
            assert f != 0 and f != Fr(1, 2), "not generic"
            if f < Fr(1, 2): n += 1
        else:
            assert h != lo and h != hi or h < lo or h > hi, "endpoint on a cut line"
        h += Fr(1, 2)
    return n

def mu(a, b, poly):
    """poly: list of points of a closed loop lifted to the plane (last - first is an integer vector)"""
    c = sum(crossings(poly[i], poly[i+1]) for i in range(len(poly)-1))
    m, n = poly[-1][0] - poly[0][0], poly[-1][1] - poly[0][1]
    assert m == floor(m) and n == floor(n)
    return (c + a*int(m) + b*int(n)) % 2

s = Fr(1, 7); e = Fr(1, 50)
alpha = [(Fr(0), s), (Fr(1), s)]                 # class (1,0)
beta  = [(s, s), (s, s + 1)]                     # class (0,1)
def square(c, r=e):
    x, y = c
    return [(x-r, y-r*Fr(9, 10)), (x+r, y-r*Fr(9, 10)), (x+r, y+r*Fr(11, 10)), (x-r, y+r*Fr(11, 10)), (x-r, y-r*Fr(9, 10))]
P = [(Fr(0), Fr(0)), (Fr(1, 2), Fr(0)), (Fr(0), Fr(1, 2)), (Fr(1, 2), Fr(1, 2))]
generic = (Fr(3, 11), Fr(2, 7))

sane = all(mu(a, b, square(p)) == 1 for a in (0, 1) for b in (0, 1) for p in P) and \
       all(mu(a, b, square(generic)) == 0 for a in (0, 1) for b in (0, 1))
report("S2 every cover has monodromy 1 round each P_i and 0 round a generic point", sane)
report("S2 the four covers are distinct (mu on alpha, beta)",
       len({(mu(a, b, alpha), mu(a, b, beta)) for a in (0, 1) for b in (0, 1)}) == 4)

def invariant(a, b, B):
    """is mu_{a,b} carried to itself by B?  Tested on alpha, beta and the four small loops,
    which generate H_1 of the four-times-punctured torus."""
    img = lambda poly: [app(B, v) for v in poly]
    loops = [alpha, beta] + [square(p) for p in P]
    return all(mu(a, b, img(l)) == mu(a, b, l) for l in loops)

for name, B in (("M0", M0), ("M0^2", M02), ("M0^3", mul(M02, M0))):
    inv = [(a, b) for a in (0, 1) for b in (0, 1) if invariant(a, b, B)]
    print(f"   covers (a,b) carried to themselves by {name}: {inv}")
    if name == "M0":   report("S2 exactly one of the four covers is carried to itself by M0", len(inv) == 1)
    if name == "M0^2": report("S2 exactly one by M0^2", len(inv) == 1)
    if name == "M0^3": report("S2 all four by M0^3", len(inv) == 4)

# ---- S3
chi = 2*(0 - 4) + 4
report("S3 Riemann-Hurwitz: chi = 2(0-4)+4 = -4, genus 3", chi == -4 and (2 - chi)//2 == 3)

# ---- S4
A, good = I2, True
for n in range(1, 41):
    A = mul(A, M0)
    good = good and det(mat(A[0][0]-1, A[0][1], A[1][0], A[1][1]-1)) != 0
report("S4 det(M0^n - I) != 0 for n = 1..40 (periodic points are rational points)", good)

# ---- S5  the lift near a branch point: w -> sqrt(A(w^2)), A z = al*z + be*conj(z)
al, be = complex(1.5, 0), complex(0.5, 1.0)      # M0: (2x+y) + i(x+y)
chk = all(abs((al*z + be*z.conjugate()) - complex(2*z.real + z.imag, z.real + z.imag)) < 1e-12
          for z in (1+0j, 1j, 0.3-0.7j))
report("S5 M0 z = (3/2) z + ((1+2i)/2) conj(z), both coefficients non-zero", chk and al != 0 and be != 0)
G = lambda w: cmath.sqrt(al*w*w + be*(w*w).conjugate())      # defined up to sign; homogeneous of degree one
w1, w2 = 1+0j, 1j
gaps = [abs(abs(G(w1+w2)) - abs(s1*G(w1) + s2*G(w2))) for s1 in (1, -1) for s2 in (1, -1)]
report("S5 the lift is not additive for any choice of signs, so not differentiable at the branch point",
       min(gaps) > 1e-3, f"(least gap {min(gaps):.4f})")

# ---- S6
best = {}
R = range(-4, 5)
for a, b, c, d in itertools.product(R, R, R, R):
    A = mat(a, b, c, d); dt, t = det(A), tr(A)
    if dt not in (1, -1): continue
    disc = t*t - 4*dt
    if disc < 0: continue                         # complex eigenvalues, modulus one (det = +1)
    rho = (abs(t) + sqrt(disc))/2
    if abs(rho - 1) < 1e-12: continue             # eigenvalue of modulus one
    best.setdefault(dt, []).append((rho, t))
phi = (1 + sqrt(5))/2
m_plus, m_minus = min(best[1]), min(best[-1])
print(f"   least spectral radius, det +1: {m_plus[0]:.6f} at |trace| {abs(m_plus[1])};  det -1: {m_minus[0]:.6f} at |trace| {abs(m_minus[1])}")
report("S6 det +1: least radius phi^2 at |trace| 3;  det -1: least radius phi at |trace| 1",
       abs(m_plus[0] - phi**2) < 1e-12 and abs(m_plus[1]) == 3 and abs(m_minus[0] - phi) < 1e-12 and abs(m_minus[1]) == 1)
F = mat(1, 1, 1, 0)
report("S6 the Fibonacci matrix has det -1, trace 1, F^2 = M0, and commutes with -I",
       det(F) == -1 and tr(F) == 1 and mul(F, F) == M0 and mul(F, mat(-1, 0, 0, -1)) == mul(mat(-1, 0, 0, -1), F))

print("ALL PASS" if ok else "SOME FAIL")
