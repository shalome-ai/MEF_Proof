#!/usr/bin/env python3
"""S04c (along time): the finite and numerical parts.

Notation as in the write-up log from M2-W039: A = M0^3 acts on E = R^2/Z^2
(coordinates (theta_psi, theta_omega), M1 Appendix B) by its matrix (M1
Section 4.1); the fibre at s + 3L is joined to the fibre at s by A (M1
Proposition 5.8, three times; M1 Corollary 7.8).  phi = (1 + sqrt 5)/2.

What is checked.
 (1) A = M0^3 = [[13, 8], [8, 5]] (M1 Corollary 7.8), det A = 1, A symmetric,
     trace 18; A = I mod 2, so that A carries each corner C_{m,n} = (m/2, n/2)
     to itself modulo Z^2; A(-v) = -(Av).
 (2) A is positive definite: 13 (13a^2 + 16ab + 5b^2) = (13a + 8b)^2 + b^2
     (identity of polynomials, checked on a grid), so that (1-t)I + tA is
     invertible for 0 <= t <= 1 (checked at sample t).
 (3) In Z[phi]: phi^6 = 5 + 8 phi, phi^-6 = 13 - 8 phi; A (phi, 1) = phi^6 (phi, 1)
     and A (1, -phi) = phi^-6 (1, -phi), with (1, -phi) = S (phi, 1), S the
     quarter-turn of M1; det[(phi,1), (1,-phi)] = -(2 + phi) < 0, so that the
     coordinates (x, y) along v1, v2 of M1 Proposition 5.8 are ordered against
     the handedness of (theta_psi, theta_omega), and (y, x) with it.
 (4) The lengths of M1 Proposition 5.8 with e^{kappa L} = phi^2 (sample values
     of L): z_s = e^{-kappa s} y + i e^{kappa s} x has |dz_s|^2 =
     e^{2 kappa s} dx^2 + e^{-2 kappa s} dy^2, keeps the handedness (positive
     Jacobian in (theta_psi, theta_omega)), and z_s(A p) = z_{s+3L}(p) at sample
     points p and s: the step joins the complex structures with delta = 1
     (the letter of M2-W048).  Also the one-step join of M1 Proposition 5.8:
     with (p, s+L) and (M0 p, s) one point, the length of a vector u at s+L
     equals that of M0 u at s (M2-W039).
 (5) For sample complex structures z = theta_psi + tau theta_omega (tau in the
     upper half-plane, square and hexagonal among them) and for the
     structures z_s of (4): the function rho(alpha) = z(u)/z(A u),
     u = (cos alpha, sin alpha), has winding number 0 about 0 and
     rho(alpha + pi) = rho(alpha) (it is unchanged by the fold).
 (6) The integer step of the even logarithm (M2-W045 in the plan): for an
     even beta = e^{2 pi i (mu theta_psi + nu theta_omega)} e^{eta}, the
     quantity F = eta(-theta) - eta(theta) - 4 pi i (mu theta_psi + nu theta_omega)
     changes by -4 pi i mu when theta_psi grows by 1, so mu = 0: checked
     numerically on a sample eta, and on sample mu != 0 the function is not
     even.

What is not checked.  The cited theorems (Hatcher, Proposition 1.33; Segal,
Proposition (1.3) and the clutching statement); anything continuous beyond
the sample points; that the constructions are bundles.
"""
import cmath
import math
import random
from fractions import Fraction

random.seed(20261118)

# (1)
M0 = [[2, 1], [1, 1]]


def mat(a, b):
    return [[sum(a[i][k] * b[k][j] for k in range(2)) for j in range(2)] for i in range(2)]


A = mat(mat(M0, M0), M0)
assert A == [[13, 8], [8, 5]]
assert A[0][0] * A[1][1] - A[0][1] * A[1][0] == 1
assert A[0][1] == A[1][0] and A[0][0] + A[1][1] == 18
for m in (0, 1):
    for n in (0, 1):
        img = (Fraction(A[0][0] * m + A[0][1] * n, 2), Fraction(A[1][0] * m + A[1][1] * n, 2))
        diff = (img[0] - Fraction(m, 2), img[1] - Fraction(n, 2))
        assert diff[0].denominator == 1 and diff[1].denominator == 1, (m, n)
for _ in range(100):
    v = (random.randint(-50, 50), random.randint(-50, 50))
    Av = (A[0][0] * v[0] + A[0][1] * v[1], A[1][0] * v[0] + A[1][1] * v[1])
    Amv = (A[0][0] * -v[0] + A[0][1] * -v[1], A[1][0] * -v[0] + A[1][1] * -v[1])
    assert Amv == (-Av[0], -Av[1])
print("(1) A = M0^3 = [[13,8],[8,5]], det 1, symmetric, trace 18; fixes the four corners mod Z^2; commutes with -I")

# (2)
for a in range(-30, 31):
    for b in range(-30, 31):
        assert 13 * (13 * a * a + 16 * a * b + 5 * b * b) == (13 * a + 8 * b) ** 2 + b * b
for k in range(101):
    t = k / 100
    B = [[(1 - t) + t * 13, t * 8], [t * 8, (1 - t) + t * 5]]
    assert B[0][0] * B[1][1] - B[0][1] * B[1][0] > 0
print("(2) 13(13a^2+16ab+5b^2) = (13a+8b)^2 + b^2 on a grid; det((1-t)I+tA) > 0 at 101 values of t")

# (3) Z[phi]: (a, b) = a + b phi, phi^2 = phi + 1


def zmul(p, q):
    a, b = p
    c, d = q
    return (a * c + b * d, a * d + b * c + b * d)


phi = (0, 1)
p6 = (1, 0)
for _ in range(6):
    p6 = zmul(p6, phi)
assert p6 == (5, 8)
assert zmul((13, -8), (5, 8)) == (1, 0)
v1 = (phi, (1, 0))          # (phi, 1)
v2 = ((1, 0), (0, -1))      # (1, -phi) = S (phi, 1)
assert (v1[1], (-v1[0][0], -v1[0][1])) == v2  # S(a, b) = (b, -a)


def zadd(p, q):
    return (p[0] + q[0], p[1] + q[1])


def zsc(n, p):
    return (n * p[0], n * p[1])


def Aact(v):
    return (zadd(zsc(A[0][0], v[0]), zsc(A[0][1], v[1])), zadd(zsc(A[1][0], v[0]), zsc(A[1][1], v[1])))


assert Aact(v1) == (zmul(p6, v1[0]), zmul(p6, v1[1]))
assert Aact(v2) == (zmul((13, -8), v2[0]), zmul((13, -8), v2[1]))
det12 = zadd(zmul(v1[0], v2[1]), zsc(-1, zmul(v1[1], v2[0])))
assert det12 == (-2, -1)
PHI = (1 + math.sqrt(5)) / 2
assert -2 - PHI < 0
print("(3) phi^6 = 5 + 8phi, phi^-6 = 13 - 8phi; A(phi,1) = phi^6 (phi,1); A(1,-phi) = phi^-6 (1,-phi); det[v1,v2] = -(2+phi) < 0")

# (4) lengths along time
n1 = math.hypot(PHI, 1.0)
e1 = (PHI / n1, 1.0 / n1)         # unit eigenvector, eigenvalue phi^2 of M0
e2 = (e1[1], -e1[0])              # S e1


def xy(th):
    return (th[0] * e1[0] + th[1] * e1[1], th[0] * e2[0] + th[1] * e2[1])


def Ath(th):
    return (A[0][0] * th[0] + A[0][1] * th[1], A[1][0] * th[0] + A[1][1] * th[1])


for L in (0.5, 1.0, 2.3):
    kappa = math.log(PHI ** 2) / L

    def z(s, th):
        x, y = xy(th)
        return math.exp(-kappa * s) * y + 1j * math.exp(kappa * s) * x

    for _ in range(50):
        s = random.uniform(-3, 3)
        th = (random.uniform(-1, 1), random.uniform(-1, 1))
        lhs, rhs = z(s, Ath(th)), z(s + 3 * L, th)
        assert abs(lhs - rhs) < 1e-9 * max(1.0, abs(rhs)), (L, s, th, lhs, rhs)
        # metric: |dz_s(u)|^2 = e^{2 kappa s} x(u)^2 + e^{-2 kappa s} y(u)^2
        u = (random.uniform(-1, 1), random.uniform(-1, 1))
        x, y = xy(u)
        assert abs(abs(z(s, u)) ** 2 - (math.exp(2 * kappa * s) * x * x + math.exp(-2 * kappa * s) * y * y)) < 1e-9 * (1 + abs(z(s, u)) ** 2)
        # handedness: Jacobian of (Re z_s, Im z_s) in (theta_psi, theta_omega)
        c1, c2 = z(s, (1, 0)), z(s, (0, 1))
        assert c1.real * c2.imag - c1.imag * c2.real > 0
        # one step: |u|_{s+L} = |M0 u|_s
        M0u = (2 * u[0] + u[1], u[0] + u[1])
        assert abs(abs(z(s + L, u)) - abs(z(s, M0u))) < 1e-9 * (1 + abs(z(s, M0u)))
print("(4) with e^{kappa L} = phi^2: z_s keeps the handedness, |dz_s|^2 is the lengths at s, |u|_{s+L} = |M0 u|_s, and z_s(Ap) = z_{s+3L}(p) (delta = 1)")

# (5) winding of z(u)/z(Au) and evenness


def winding(f, steps=20000):
    total, prev = 0.0, cmath.phase(f(0.0))
    for k in range(1, steps + 1):
        cur = cmath.phase(f(2 * math.pi * k / steps))
        d = cur - prev
        while d > math.pi:
            d -= 2 * math.pi
        while d < -math.pi:
            d += 2 * math.pi
        total += d
        prev = cur
    return round(total / (2 * math.pi), 6)


taus = [1j, cmath.exp(1j * math.pi / 3), 0.3 + 2.1j, -0.7 + 0.4j]
for tau in taus:
    def zt(th, tau=tau):
        return th[0] + tau * th[1]

    def rho(al, zt=zt):
        u = (math.cos(al), math.sin(al))
        return zt(u) / zt(Ath(u))

    assert winding(rho) == 0, tau
    for k in range(64):
        al = 2 * math.pi * k / 64
        assert abs(rho(al + math.pi) - rho(al)) < 1e-12
kappa = math.log(PHI ** 2)
for s in (-1.0, 0.0, 0.7):
    def rho(al, s=s):
        u = (math.cos(al), math.sin(al))
        x, y = xy(u)
        zu = math.exp(-kappa * s) * y + 1j * math.exp(kappa * s) * x
        x2, y2 = xy(Ath(u))
        zA = math.exp(-kappa * s) * y2 + 1j * math.exp(kappa * s) * x2
        return zu / zA

    assert winding(rho) == 0, s
print("(5) z(u)/z(Au) has winding 0 and is unchanged by u -> -u, for four flat structures and three of the lengths")

# (6) the even logarithm: mu = 0


def eta(t1, t2):
    # a sample continuous even function of period one
    return 0.3 * math.cos(2 * math.pi * t1) + 0.2j * math.cos(2 * math.pi * (t1 + t2)) + 0.1 * math.cos(4 * math.pi * t2)


for mu, nu in ((0, 0), (1, 0), (0, -2), (3, 1)):
    def F(t1, t2, mu=mu, nu=nu):
        return eta(-t1, -t2) - eta(t1, t2) - 4j * math.pi * (mu * t1 + nu * t2)

    for _ in range(20):
        t1, t2 = random.uniform(-1, 1), random.uniform(-1, 1)
        assert abs((F(t1 + 1, t2) - F(t1, t2)) - (-4j * math.pi * mu)) < 1e-9
        assert abs((F(t1, t2 + 1) - F(t1, t2)) - (-4j * math.pi * nu)) < 1e-9

    def beta(t1, t2, mu=mu, nu=nu):
        return cmath.exp(2j * math.pi * (mu * t1 + nu * t2)) * cmath.exp(eta(t1, t2))

    even = all(abs(beta(-t1, -t2) - beta(t1, t2)) < 1e-9
               for t1, t2 in ((0.13, 0.4), (0.37, -0.21), (0.5, 0.25)))
    assert even == (mu == 0 and nu == 0), (mu, nu)
print("(6) F changes by -4 pi i mu (resp. -4 pi i nu) when theta_psi (resp. theta_omega) grows by one; beta is even only for mu = nu = 0 on the sample")

print("OK: S04c finite and numerical parts.")
