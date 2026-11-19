#!/usr/bin/env python3
"""S04d (the pieces together): the finite and numerical parts.

Notation as in the write-up log from M2-W052 (M2-W064 to M2-W067 replace
M2-W057 to M2-W059 and M2-W061, P208): A = M0^3 acts on E = R^2/Z^2
(coordinates (theta_psi, theta_omega), M1 Appendix B) by its matrix; Y is
the covering torus carried round time (M2-W039); a line on Y of degree
three on the fibre is made from a line N on E and a map Phi over A
(M2-W043), and two such maps differ by a function beta on E with no zero,
beta = e^{2 pi i (mu theta_psi + nu theta_omega)} e^{eta} (M2-W035), mu and
nu integers: the winding numbers of beta.

What is checked.
 (1) A = M0^3 = [[13, 8], [8, 5]]; A - I = 4 U with U = [[3, 2], [2, 1]],
     det U = -1, U U' = I for U' = [[-1, 2], [2, -3]]; A = U U.
 (2) The winding numbers of p -> beta(A p) are (mu, nu) A =
     (13 mu + 8 nu, 8 mu + 5 nu): counted numerically along the two
     coordinate loops for sample beta.
 (3) For integers mu, nu in a box: there are integers m, n with
     (mu, nu) A = (m, n)(A - I) exactly when 4 divides mu and 4 divides nu;
     for (mu, nu) = (4a, 4b) the pair is (m, n) = (3a + 2b, 2a + b).
     There are 16 pairs (mu mod 4, nu mod 4).
 (4) The isomorphism of the "if" part, at sample points: with
     h = e^{2 pi i (m theta_psi + n theta_omega)} and
     theta(p, s) = h(p) e^{(1 - s/3L) eta(p)}, the condition
     theta(A p, 0) = beta(A p) theta(p, 3L) holds.
 (5) Of the 16 pairs (mu mod 4, nu mod 4), those equal to their negatives
     modulo 4 are four, (0, 0) among them.  Recorded only: no statement
     uses it.  (That a function unchanged by the fold has mu = nu = 0 is
     M2-W045 and is not checked here.)
 (6) The integers: (3, 2, 0) + 2 (n1, n2, n3) = (3, 2, 6) only for
     (n1, n2, n3) = (0, 0, 3).
 (7) Counts: dimensions 3 + 3 + 4 + 2 = 12 (and 1 + 3 + 4 + 2 + 2 = 12);
     the slices have dimensions 9 and 11; the count 2^1 * 2^5 = 2^6 = 64
     (the ranks of the (0,*)-forms, which are powers of two by hand);
     the Betti numbers of S^3 x CP^2 x S^2 in degrees 0, 1, 2 are 1, 0, 2.
 (8) The Betti number of S^1 x S^3 in degree 2 is 0 (M2-W067, its step (g)).

What is not checked.  The cited theorems (Hatcher; Nicolaescu; Gompf;
Segal); anything continuous beyond the sample points; that the
constructions are bundles or Spin^c structures.
"""
import cmath
import math
import itertools
from fractions import Fraction

PI2 = 2 * math.pi


def mul(a, b):
    return [[sum(a[i][k] * b[k][j] for k in range(2)) for j in range(2)] for i in range(2)]


def det(a):
    return a[0][0] * a[1][1] - a[0][1] * a[1][0]


M0 = [[2, 1], [1, 1]]
A = mul(mul(M0, M0), M0)
I2 = [[1, 0], [0, 1]]
U = [[3, 2], [2, 1]]
Uinv = [[-1, 2], [2, -3]]

# (1)
assert A == [[13, 8], [8, 5]]
assert [[A[i][j] - I2[i][j] for j in range(2)] for i in range(2)] == [[4 * U[i][j] for j in range(2)] for i in range(2)]
assert det(U) == -1
assert mul(U, Uinv) == I2 and mul(Uinv, U) == I2
assert mul(U, U) == A
print("(1) A = M0^3 = [[13,8],[8,5]]; A - I = 4 U, U = [[3,2],[2,1]], det U = -1; A = U U: ok")


def row_times(v, a):
    """row vector v times matrix a"""
    return (v[0] * a[0][0] + v[1] * a[1][0], v[0] * a[0][1] + v[1] * a[1][1])


def eta(x, y):
    """a sample continuous function of period one in each variable"""
    return 0.3 * math.cos(PI2 * x) + 0.2j * math.sin(PI2 * (x + 2 * y)) + 0.1 * math.cos(PI2 * y)


def beta(mu, nu):
    return lambda x, y: cmath.exp(1j * PI2 * (mu * x + nu * y)) * cmath.exp(eta(x, y))


def winding(f, steps=4000):
    """winding number about 0 of the closed loop t -> f(t), t in [0,1]"""
    total = 0.0
    prev = f(0.0)
    for k in range(1, steps + 1):
        cur = f(k / steps)
        total += cmath.phase(cur / prev)
        prev = cur
    return round(total / PI2)


def windings(g):
    """winding numbers of g on E along the theta_psi loop and the theta_omega loop"""
    return (winding(lambda t: g(t, 0.137)), winding(lambda t: g(0.291, t)))


def after_A(g):
    return lambda x, y: g(A[0][0] * x + A[0][1] * y, A[1][0] * x + A[1][1] * y)


# (2)
for mu, nu in [(1, 0), (0, 1), (2, -3), (-4, 4), (5, 7)]:
    b = beta(mu, nu)
    assert windings(b) == (mu, nu)
    assert windings(after_A(b)) == row_times((mu, nu), A) == (13 * mu + 8 * nu, 8 * mu + 5 * nu)
print("(2) winding numbers of beta(A p) are (mu, nu) A = (13 mu + 8 nu, 8 mu + 5 nu): ok on samples")

# (3)
AmI = [[12, 8], [8, 4]]
AmI_inv = [[Fraction(4, -16), Fraction(-8, -16)], [Fraction(-8, -16), Fraction(12, -16)]]
assert [[sum(AmI[i][k] * AmI_inv[k][j] for k in range(2)) for j in range(2)] for i in range(2)] == I2
box = range(-13, 14)
for mu, nu in itertools.product(box, box):
    lhs = row_times((mu, nu), A)
    m = lhs[0] * AmI_inv[0][0] + lhs[1] * AmI_inv[1][0]
    n = lhs[0] * AmI_inv[0][1] + lhs[1] * AmI_inv[1][1]
    solvable = (m.denominator == 1 and n.denominator == 1)
    assert solvable == (mu % 4 == 0 and nu % 4 == 0)
    if solvable:
        a, b = mu // 4, nu // 4
        assert (int(m), int(n)) == (3 * a + 2 * b, 2 * a + b)
        assert row_times((int(m), int(n)), AmI) == lhs
residues = list(itertools.product(range(4), range(4)))
assert len(residues) == 16
print("(3) (mu,nu) A = (m,n)(A - I) has an integer solution exactly when 4 | mu and 4 | nu; (m,n) = (3a+2b, 2a+b); 16 residues: ok")

# (4)
L3 = 3 * 0.7  # 3L for a sample L
for a, b in [(1, 0), (0, 1), (2, -1), (-3, 2)]:
    mu, nu = 4 * a, 4 * b
    m, n = 3 * a + 2 * b, 2 * a + b
    bt = beta(mu, nu)
    h = lambda x, y, m=m, n=n: cmath.exp(1j * PI2 * (m * x + n * y))
    theta = lambda x, y, s: h(x, y) * cmath.exp((1 - s / L3) * eta(x, y))
    for x, y in [(0.11, 0.73), (0.5, 0.25), (0.93, 0.02), (0.4, 0.6)]:
        Ax, Ay = A[0][0] * x + A[0][1] * y, A[1][0] * x + A[1][1] * y
        lhs = theta(Ax, Ay, 0.0)
        rhs = bt(Ax, Ay) * theta(x, y, L3)
        assert abs(lhs - rhs) < 1e-9 * max(1.0, abs(lhs)), (a, b, x, y, lhs, rhs)
print("(4) theta(A p, 0) = beta(A p) theta(p, 3L) for theta = h e^{(1 - s/3L) eta}: ok on samples")

# (5)
self_neg = [(mu, nu) for (mu, nu) in residues if ((-mu) % 4, (-nu) % 4) == (mu, nu)]
assert len(self_neg) == 4 and (0, 0) in self_neg
print("(5) residues equal to their negatives mod 4:", self_neg, "(recorded, not used in a statement)")

# (6)
sols = [t for t in itertools.product(range(-6, 7), repeat=3)
        if (3 + 2 * t[0], 2 + 2 * t[1], 0 + 2 * t[2]) == (3, 2, 6)]
assert sols == [(0, 0, 3)]
print("(6) (3,2,0) + 2(n1,n2,n3) = (3,2,6) only for (0,0,3): ok")

# (7)
assert 3 + 3 + 4 + 2 == 12 and 1 + 3 + 4 + 2 + 2 == 12
assert 3 + 4 + 2 == 9 and 2 + 3 + 4 + 2 == 11
assert 2 ** 1 * 2 ** 5 == 2 ** 6 == 64


def polymul(p, q):
    r = [0] * (len(p) + len(q) - 1)
    for i, x in enumerate(p):
        for j, y in enumerate(q):
            r[i + j] += x * y
    return r


S3 = [1, 0, 0, 1]
CP2 = [1, 0, 1, 0, 1]
S2 = [1, 0, 1]
R = polymul(polymul(S3, CP2), S2)
assert R[0:3] == [1, 0, 2]
print("(7) dimensions 12, 9, 11; ranks 2 * 32 = 64; Betti numbers of S^3 x CP^2 x S^2 in degrees 0,1,2 are", R[0:3], ": ok")
# (8)
S1 = [1, 1]
S1S3 = polymul(S1, S3)
assert S1S3[2] == 0 and S1S3 == [1, 1, 0, 1, 1]
print("(8) Betti numbers of S^1 x S^3:", S1S3, "; degree two is 0: ok")
print("S04d: all checks passed")
