"""Card T4b, with card S08 (chat C12): the candidates, the fifth axiom (M2-W165) and the first
axiom (M2-W214).
Standard library only.  The finite and the numerical parts of the card; the rest is by hand in the
write-up log.  A numerical check here is a check at sample points, to a tolerance; it is not a proof.

Setting.  A smooth state is psi = psi' + dzbar ^ psi'' (M2-W185(iii)); a candidate is the form of
M2-W187(i) with its eleven numbers a0,b0,c0,a1,b1,c1,a2,b2,c2,g0,g1, and a smooth state is a
solution exactly when (I) to (IV) of M2-W187(ii) hold.

Part A, the two families of states that are tried.
   family 1:  psi' = f,  psi'' = 0,   f a function pulled back from Y with del f = 0
   family 2:  psi' = 0,  psi'' = v,   v a function pulled back from Y with del v = 0
   (del = d/d zbar_s;  d_Sigma and d_B of a function pulled back from Y are zero, M2-W183).
 (A1) BY HAND, not checked here: on the eleven slots of M2-W187(i), family 1 has the left
      sides  I = a0 f,  II = 0,  III = 0,  IV = 0;  family 2 has  I = 0,  II = a1 v,
      III = a2 v,  IV = 0.  The function left_sides below writes this down; it does not test it.
 (A2) over the eight choices of which of a0, a1, a2 are zero:  family 1 is a solution with f != 0
      exactly when a0 = 0;  family 2 is one with v != 0 exactly when a1 = a2 = 0;  one of the two
      families gives a solution other than zero exactly when  a0 = 0  or  a1 = a2 = 0.
      (A table made from A1; exact.)
 (A3) the other case, a0 != 0 and one of a1, a2 not zero: (I) gives psi' = 0 (M2-W187(iii));
      then (II), if a1 != 0, or (III) with psi' = 0, if a2 != 0, is  a psi'' + N psi'' = 0  with
      a != 0 and N raising a degree: on a graded space with grades 0..5 (p+q, p = 0,1,2 and
      q = 0..3), a + N has no kernel (200 random N; a model of the induction of M2-W191, not
      the induction).
Part B, the functions.  The coordinate of the fibre at the time s is
        z_s = exp(-kappa s) y + i exp(kappa s) x          (M2-W069, M2-W048),
   x and y being the components of a point along the orthonormal eigenvectors v1, v2 of M0
   (v1 a multiple of (phi, 1), v2 = S v1 the same multiple of (1, -phi); M2-W048), and
   exp(kappa L) = phi^2 (M1, Proposition 5.8).  The points of the fibre are written (t1, t2) in
   the coordinates (theta_psi, theta_omega) of M1, Appendix B, in which the lattice is Z^2 and
   P1 = (0,0), P2 = (1/2,0), P3 = (0,1/2), P4 = (1/2,1/2) (M1 l.434).  Let
        p1 = z_s(0,1),   p2 = z_s(1,0),   p3 = (p1 + p2)/2,
   so that the fibre at s is C modulo Z p1 + Z p2 and z_s carries P1, P2, P3, P4 to
   0, p2/2, p1/2, p3.   Let
        X(z) = sum over n in Z of  pi / ( p1 sin( pi (z - n p2) / p1 ) ).
 (B0) p2/p1 is not real, at the sample times (numerical).
 (B1) X(-z) = -X(z);  X(z + p1) = -X(z);  X(z + p2) = X(z);  z X(z) -> 1 at z = 0  (numerical).
 (B2) the four functions, their parity under z -> -z, their periods, and their poles (numerical):
        h = 1                    even;  no pole
        K1 = X(z) X(z - p1/2)    odd;   simple poles at P1 and P3 at most
        K2 = X(z) X(z - p3)      odd;   simple poles at P1 and P4 at most
        K3 = X(z - p3) X'(z - p3) odd;  a pole of order three at P4 at most
      each is unchanged by z -> z + p1 and z -> z + p2, is finite at the other corners, and is
      not zero at a sample point.
 (B3) EXACT, a test of the tables written down below and not of the functions: for each of the
      three divisors and each of the two families, the function taken has the parity that the
      family needs (family 1: epsilon f(-z) = f(z); family 2: epsilon v(-z) = -v(z)) and its
      poles are bounded by the divisor.
 (B4) d/d zbar of each function is zero at sample points (a central difference; numerical).
Part C, the shadows.  Time is the circle of length 3L.  Let U be an arc of time of length less
   than L.
 (C1) in an integer model (L = 4 units, U the units 1, 2, 3 of 0..11), U moved by -L, modulo 3L,
      has no point in common with U (exact).
   BY HAND, not checked here: for a function with two different values at two times of U,
      m1 + m2 k = 0 at both times gives m1 = m2 = 0.
Part D, once round time (card S08).  The fibre at s+3L is joined to the fibre at s by M0^3
   (M2-W039), M0 = [[2,1],[1,1]] in the coordinates (theta_psi, theta_omega).
 (D0) z_s(M0^3 t) = z_{s+3L}(t) at sample points t (numerical; M2-W048 proves it).
 (D1) M0^3 = [[13,8],[8,5]], its inverse is [[5,-8],[-8,13]], and both are the identity
      modulo 2 (exact).
 (D2) the function X made for the time s and taken at z_s(M0^3 t) agrees with the function X
      made for the time s+3L and taken at z_{s+3L}(t); the same for K1, K2 and K3, with the
      sign +1 (numerical; the series of the skew basis cut at |n| <= 8000).  This tests the two
      names of a point of Y directly.
 (D3) M0^-3(0,1) = (0,1) + 2(-4,6) and M0^-3(1,0) = (1,0) + 2(2,-4); 6 and 6-4 are even (exact;
      the integers of the hand argument of the write-up log).
"""
import cmath
import math
import random
import sys
from fractions import Fraction as Fr
from itertools import product

random.seed(12)
results = []


def check(name, ok):
    results.append((name, bool(ok)))
    print(("PASS  " if ok else "FAIL  ") + name)


# ---------------------------------------------------------------- Part A
NUM = ["a0", "b0", "c0", "a1", "b1", "c1", "a2", "b2", "c2", "g0", "g1"]


def left_sides(num, fam):
    """The left sides of (I) to (IV) as coefficients of the one non-zero function of the family.
    Slots that are zero for the family (d_Sigma, d_B and del of the function) are dropped."""
    if fam == 1:      # psi' = f, psi'' = 0 ; dS f = dB f = del f = 0
        return (num["a0"], 0, 0, 0)
    else:             # psi' = 0, psi'' = v ; dS v = dB v = del v = 0
        return (0, num["a1"], num["a2"], 0)


ok = True
table = {}
for z0, z1, z2 in product([True, False], repeat=3):          # True: the number is zero
    num = {k: Fr(1) for k in NUM}
    num["a0"] = Fr(0) if z0 else Fr(3)
    num["a1"] = Fr(0) if z1 else Fr(5)
    num["a2"] = Fr(0) if z2 else Fr(7)
    s1 = all(x == 0 for x in left_sides(num, 1))
    s2 = all(x == 0 for x in left_sides(num, 2))
    ok &= (s1 == z0) and (s2 == (z1 and z2))
    table[(z0, z1, z2)] = s1 or s2
    ok &= (s1 or s2) == (z0 or (z1 and z2))
check("A2 a solution other than zero from the two families exactly when a0=0 or a1=a2=0", ok)
n_yes = sum(1 for v in table.values() if v)
check("A2 five of the eight patterns have one, three have none from the families", n_yes == 5)

# A3: grades 0..5 ; N strictly raises the grade
grades = [p + q for p in range(3) for q in range(4)]            # twelve pieces u_{p,q}
order = sorted(range(12), key=lambda i: grades[i])


def det(M):
    n = len(M)
    M = [row[:] for row in M]
    d = Fr(1)
    for i in range(n):
        piv = next((r for r in range(i, n) if M[r][i] != 0), None)
        if piv is None:
            return Fr(0)
        if piv != i:
            M[i], M[piv] = M[piv], M[i]
            d = -d
        d *= M[i][i]
        for r in range(i + 1, n):
            f = M[r][i] / M[i][i]
            for c in range(i, n):
                M[r][c] -= f * M[i][c]
    return d


ok = True
for _ in range(200):
    a = Fr(random.choice([-3, -2, -1, 1, 2, 3]), random.randint(1, 4))
    M = [[Fr(0)] * 12 for _ in range(12)]
    for i in range(12):
        M[i][i] = a
        for j in range(12):
            if grades[i] > grades[j]:                           # N carries grade of j up to grade of i
                M[i][j] = Fr(random.randint(-3, 3))
    ok &= det(M) == a ** 12
check("A3 a + N has no kernel for a != 0 (200 samples; a model of the induction)", ok)

# ---------------------------------------------------------------- Part B
PHI = (1 + math.sqrt(5)) / 2
LSTEP = 1.0
KAPPA = 2 * math.log(PHI) / LSTEP                 # exp(kappa L) = phi^2
NRM = math.sqrt(PHI * PHI + 1)
V1 = (PHI / NRM, 1 / NRM)
V2 = (1 / NRM, -PHI / NRM)


def zs(t, s):
    """z_s of the point t = (theta_psi, theta_omega)."""
    x = t[0] * V1[0] + t[1] * V1[1]
    y = t[0] * V2[0] + t[1] * V2[1]
    return math.exp(-KAPPA * s) * y + 1j * math.exp(KAPPA * s) * x


def basis(s):
    return zs((0, 1), s), zs((1, 0), s)


def nterms(p1, p2):
    im = abs((p2 / p1).imag)
    return min(8000, int(45 / (math.pi * im)) + 20)


def X(z, p1, p2, N=None):
    N = nterms(p1, p2) if N is None else N
    tot = 0j
    for n in range(-N, N + 1):
        tot += math.pi / (p1 * cmath.sin(math.pi * (z - n * p2) / p1))
    return tot


def dX(z, p1, p2, N=None):
    N = nterms(p1, p2) if N is None else N
    tot = 0j
    for n in range(-N, N + 1):
        u = math.pi * (z - n * p2) / p1
        tot += -(math.pi / p1) ** 2 * cmath.cos(u) / cmath.sin(u) ** 2
    return tot


def funcs(s):
    p1, p2 = basis(s)
    p3 = (p1 + p2) / 2
    return {
        "h": lambda z: 1 + 0j,
        "K1": lambda z: X(z, p1, p2) * X(z - p1 / 2, p1, p2),
        "K2": lambda z: X(z, p1, p2) * X(z - p3, p1, p2),
        "K3": lambda z: X(z - p3, p1, p2) * dX(z - p3, p1, p2),
    }


def close(x, y, tol=1e-8):
    return abs(x - y) <= tol * (1 + abs(x) + abs(y))


SAMPLES_S = [-0.3, 0.0, 0.2, 0.45]
check("B0 p2/p1 is not real at the sample times",
      all(abs((basis(s)[1] / basis(s)[0]).imag) > 1e-3 for s in SAMPLES_S))

ok = True
for s in SAMPLES_S:
    p1, p2 = basis(s)
    for _ in range(4):
        z = random.uniform(0.1, 0.4) * p1 + random.uniform(0.1, 0.4) * p2
        ok &= close(X(-z, p1, p2), -X(z, p1, p2), 1e-7)
        ok &= close(X(z + p1, p1, p2), -X(z, p1, p2), 1e-7)
        ok &= close(X(z + p2, p1, p2), X(z, p1, p2), 1e-6)
    e = 1e-5 * p1
    ok &= close(e * X(e, p1, p2), 1, 1e-6)
check("B1 X is odd, changes sign under z -> z+p1, is unchanged under z -> z+p2, residue 1 at 0", ok)

PARITY = {"h": +1, "K1": -1, "K2": -1, "K3": -1}
# the greatest order of pole allowed at (P1, P2, P3, P4)
POLES = {"h": (0, 0, 0, 0), "K1": (1, 0, 1, 0), "K2": (1, 0, 0, 1), "K3": (0, 0, 0, 3)}
CORNERS = [(0, 0), (0.5, 0), (0, 0.5), (0.5, 0.5)]

ok_par = ok_per = ok_pole = ok_nz = True
for s in SAMPLES_S:
    p1, p2 = basis(s)
    fs = funcs(s)
    for name, f in fs.items():
        for _ in range(3):
            z = random.uniform(0.12, 0.38) * p1 + random.uniform(0.12, 0.38) * p2
            ok_par &= close(f(-z), PARITY[name] * f(z), 1e-6)
            ok_per &= close(f(z + p1), f(z), 1e-6) and close(f(z + p2), f(z), 1e-6)
            ok_nz &= abs(f(z)) > 1e-9
        for P, k in zip(CORNERS, POLES[name]):
            zP = zs(P, s)
            r = abs(p1)
            for dirn in (1, 1j, (1 + 1j) / abs(1 + 1j)):
                v1 = abs(f(zP + 1e-3 * r * dirn)) * (1e-3 * r) ** k
                v2 = abs(f(zP + 1e-4 * r * dirn)) * (1e-4 * r) ** k
                ok_pole &= v2 < 3 * v1 + 1e-6
check("B2 the parity of h, K1, K2, K3", ok_par)
check("B2 each is unchanged by the two periods", ok_per)
check("B2 the poles are at most of the orders named, at the corners named", ok_pole)
check("B2 none is zero at the sample points", ok_nz)

DIVISORS = {"3P4": (0, 0, 0, 3), "2P1+P4": (2, 0, 0, 1), "P1+P2+P3": (1, 1, 1, 0)}
TAKEN = {  # (family 1, family 2)
    "3P4": ("h", "K3"),
    "2P1+P4": ("h", "K2"),
    "P1+P2+P3": ("K1", "h"),
}
ok = True
for name, a in DIVISORS.items():
    ok &= sum(a) == 3
    eps = +1 if a[3] % 2 == 1 else -1
    f1, f2 = TAKEN[name]
    ok &= eps * PARITY[f1] == +1          # epsilon f(-z) = f(z)
    ok &= eps * PARITY[f2] == -1          # epsilon v(-z) = -v(z)
    for fn in (f1, f2):
        ok &= all(POLES[fn][i] <= a[i] for i in range(4))
check("B3 (exact, on the tables) for each divisor and family: the parity needed, the poles bounded by D", ok)

ok = True
for s in SAMPLES_S:
    p1, p2 = basis(s)
    fs = funcs(s)
    for name, f in fs.items():
        z = 0.23 * p1 + 0.31 * p2
        d = 1e-5 * abs(p1)
        dzbar = ((f(z + d) - f(z - d)) / (2 * d) + 1j * (f(z + 1j * d) - f(z - 1j * d)) / (2 * d)) / 2
        ok &= abs(dzbar) < 1e-4 * (1 + abs(f(z)) / abs(p1))
check("B4 d/dzbar of each function is zero at the sample points", ok)

# ---------------------------------------------------------------- Part C
Lu = 4
U = {1, 2, 3}
moved = {(t - Lu) % (3 * Lu) for t in U}
check("C1 an arc shorter than L, moved by -L on the circle of length 3L, misses itself", not (U & moved))

# ---------------------------------------------------------------- Part D
def mat(A, B):
    return [[sum(A[i][k] * B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]


def app(A, t):
    return (A[0][0] * t[0] + A[0][1] * t[1], A[1][0] * t[0] + A[1][1] * t[1])


M0 = [[2, 1], [1, 1]]
M03 = mat(M0, mat(M0, M0))
INV = [[5, -8], [-8, 13]]
PTS = [(0.137, 0.291), (0.41, 0.12)]

ok = True
for s in (-0.3, 0.0):
    for t in PTS:
        ok &= close(zs(app(M03, t), s), zs(t, s + 3 * LSTEP), 1e-9)
check("D0 z_s(M0^3 t) = z_{s+3L}(t) at the sample points", ok)

check("D1 M0^3 = [[13,8],[8,5]], its inverse, and both are the identity modulo 2",
      M03 == [[13, 8], [8, 5]] and mat(M03, INV) == [[1, 0], [0, 1]]
      and all((M03[i][j] - (i == j)) % 2 == 0 and (INV[i][j] - (i == j)) % 2 == 0
              for i in range(2) for j in range(2)))

ok = True
worst = 0.0
for s in (-1.5, -1.2):                       # s and s+3L on the two sides of 0: both bases usable
    fa, fb = funcs(s), funcs(s + 3 * LSTEP)
    p1a, p2a = basis(s)
    p1b, p2b = basis(s + 3 * LSTEP)
    for t in PTS:
        za, zb = zs(app(M03, t), s), zs(t, s + 3 * LSTEP)
        pairs = [(X(za, p1a, p2a), X(zb, p1b, p2b))] + [(fa[k](za), fb[k](zb)) for k in ("K1", "K2", "K3")]
        for u, v in pairs:
            ok &= close(u, v, 1e-4)
            worst = max(worst, abs(u - v) / (1 + abs(u)))
check("D2 X, K1, K2, K3 for the two names of a point of Y agree, with the sign +1 (worst %.1e)" % worst, ok)

check("D3 M0^-3(0,1) = (0,1) + 2(-4,6) and M0^-3(1,0) = (1,0) + 2(2,-4); 6 and 6-4 are even",
      (INV[0][1], INV[1][1]) == (2 * -4, 1 + 2 * 6) and (INV[0][0], INV[1][0]) == (1 + 2 * 2, 2 * -4)
      and 6 % 2 == 0 and (6 - 4) % 2 == 0)

bad = [n for n, o in results if not o]
print(f"\n{len(results)} checks, {len(results) - len(bad)} pass")
sys.exit(1 if bad else 0)
