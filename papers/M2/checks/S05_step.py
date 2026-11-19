#!/usr/bin/env python3
"""S05 (the fold and the drive on states): the finite and numerical parts.

Notation as in the write-up log from M2-W069.  E = R^2/Z^2 with the
coordinates (theta_psi, theta_omega) of M1 Appendix B; M0 = [[2, 1], [1, 1]]
is the step of M1 and A = M0^3; Y is the covering torus carried round time
(M2-W039): the pairs (p, s), with (p, s + 3L) and (A p, s) one point.  The
map examined is

    tau(p, s) = (M0 p, s - L)

on Y (the identity on space and the base is not modelled).  The corners are
P1 = (0, 0), P2 = (1/2, 0), P3 = (0, 1/2), P4 = (1/2, 1/2).  The lengths
are those of M1 Proposition 5.8, ds^2 + e^{2 kappa s} dx^2 + e^{-2 kappa s}
dy^2 with e^{kappa L} = phi^2, x and y the components along v1 and
v2 = S v1; the complex coordinates are z_s = e^{-kappa s} y + i e^{kappa s} x
(M2-W048).

What is checked.
 (1) M0 A = A M0.  tau is well defined on Y (the images of two pairs that
     are one point are one point); tau applied three times is the identity
     of Y; tau and tau^2 move every sample point; tau commutes with the
     fold; tau carries the corner circle of P_i to that of M0 P_i, which is
     P1 -> P1, P2 -> P3, P3 -> P4, P4 -> P2.  Exact, in rationals, on
     samples.
 (2) tau keeps the lengths: the squared length of a vector u at (p, s)
     equals that of its image at tau(p, s), on samples; and for the maps
     (p, s) -> (M0 p, s + c) the two agree for c = -L and fail for the
     other sample values of c.
 (3) z_{s-L}(M0 p) = z_s(p) on samples (M0 is holomorphic from the fibre
     at s to the fibre at s - L); and, for each of five fixed times s,
     z_s(M0 p) is not a constant complex multiple of z_s(p) as p varies
     (M0 at one time is not holomorphic).  (The second half held s fixed
     only from P213 on: before, s varied with p.)
 (4) M0 is symmetric and (1 - t) I + t M0 has determinant 1 + t - t^2 > 0
     for 0 <= t <= 1; the winding of z / M0 z round the origin is 0, and
     z / M0 z is unchanged by z -> -z, for sample complex structures.
 (5) Sign patterns on the four corner circles.  Pulling a pattern back by
     tau gives the pattern i -> pattern(M0 P_i).  The patterns with one
     sign -1 at P_k (k = 2, 3, 4) and +1 elsewhere: the pull-back of the
     pattern of P2 is that of P4, of P3 that of P2, of P4 that of P3; three
     pull-backs return each; none is carried to itself or to its negative;
     no two of the three are equal or opposite.  Of the eight patterns
     with product -1, those carried to themselves are the two with the odd
     corner at P1 (recorded; it is M1 Lemma 7.5(c)).
 (6) det(A - I) = -16, and a row (a, b) of integers with (a, b)(A - I) =
     (0, 0) is (0, 0): on a box.
 (7) In the integer model of the quaternions, (2w)^3 = -8 and (-2w)^3 = 8
     for 2w = 1 + i + j + k (M1 Section 5.5 and Corollary 7.8: w^3 = -1,
     (-w)^3 = +1).
 (8) The logarithm of z / M0 z followed continuously round the origin
     (M2-W074, with the argument of M2-W050): after a half-turn and after a
     full turn it returns to its starting value, for the same sample complex
     structures; so the multiplier made from it is one function near the
     corner and is unchanged by the fold.  (Added at P212.)

What is not checked.  Anything of bundles, lifts, sections or states; the
cited statements; anything continuous beyond the sample points.
"""
import cmath
import math
import itertools
import random
from fractions import Fraction as Fr

random.seed(5)


def mul(a, b):
    return [[sum(a[i][k] * b[k][j] for k in range(2)) for j in range(2)] for i in range(2)]


def act(a, p):
    return (a[0][0] * p[0] + a[0][1] * p[1], a[1][0] * p[0] + a[1][1] * p[1])


def mod1(p):
    return (p[0] % 1, p[1] % 1)


M0 = [[2, 1], [1, 1]]
A = mul(mul(M0, M0), M0)
Ainv = [[5, -8], [-8, 13]]
I2 = [[1, 0], [0, 1]]
assert A == [[13, 8], [8, 5]] and mul(A, Ainv) == I2

L = Fr(1)  # the length of one step, as a unit


def canon(pt):
    """The representative of a point of Y with 0 <= s < 3L.
    (q, t) and (A q, t - 3L) are one point."""
    p, s = pt
    k = math.floor(s / (3 * L))
    m = A if k >= 0 else Ainv
    for _ in range(abs(k)):
        p = act(m, p)
    return (mod1(p), s - 3 * L * k)


def tau(pt):
    p, s = pt
    return (act(M0, p), s - L)


def fold(pt):
    p, s = pt
    return ((-p[0], -p[1]), s)


def rnd_pt():
    return ((Fr(random.randint(0, 96), 97), Fr(random.randint(0, 100), 101)),
            Fr(random.randint(-900, 900), 100))


# (1)
assert mul(M0, A) == mul(A, M0)
for _ in range(400):
    p, s = rnd_pt()
    # well defined: (p, s + 3L) and (A p, s) are one point; so are their images
    assert canon((p, s + 3 * L)) == canon((act(A, p), s))
    assert canon(tau((p, s + 3 * L))) == canon(tau((act(A, p), s)))
    # three times is the identity
    assert canon(tau(tau(tau((p, s))))) == canon((p, s))
    # tau and tau^2 move the point
    assert canon(tau((p, s))) != canon((p, s))
    assert canon(tau(tau((p, s)))) != canon((p, s))
    # commutes with the fold
    assert canon(tau(fold((p, s)))) == canon(fold(tau((p, s))))
P = {1: (Fr(0), Fr(0)), 2: (Fr(1, 2), Fr(0)), 3: (Fr(0), Fr(1, 2)), 4: (Fr(1, 2), Fr(1, 2))}
sigma = {}
for i, Pi in P.items():
    img = mod1(act(M0, Pi))
    sigma[i] = [j for j, Pj in P.items() if Pj == img][0]
    # every power of A leaves the corner in place, so the circle is well defined
    assert mod1(act(A, Pi)) == Pi and mod1(act(Ainv, Pi)) == Pi
    for s in (Fr(0), Fr(7, 3), Fr(-11, 4)):
        q, t = canon(tau((Pi, s)))
        assert q == P[sigma[i]]
assert sigma == {1: 1, 2: 3, 3: 4, 4: 2}
print("(1) M0 A = A M0; tau well defined on Y, tau^3 = id, tau and tau^2 move every sample point,")
print("    tau commutes with the fold; corner circles: P1->P1, P2->P3, P3->P4, P4->P2: ok")

# (2), (3): the lengths and the complex coordinates
phi = (1 + math.sqrt(5)) / 2
Lf = 1.0
kappa = 2 * math.log(phi) / Lf
nrm = math.sqrt(phi * phi + 1)
v1 = (phi / nrm, 1 / nrm)
v2 = (v1[1], -v1[0])  # S v1 with S = [[0, 1], [-1, 0]]


def xy(u):
    return (u[0] * v1[0] + u[1] * v1[1], u[0] * v2[0] + u[1] * v2[1])


def sqlen(u, ds, s):
    x, y = xy(u)
    return ds * ds + math.exp(2 * kappa * s) * x * x + math.exp(-2 * kappa * s) * y * y


def M0f(u):
    return (2 * u[0] + u[1], u[0] + u[1])


# M0 v1 = phi^2 v1 and M0 v2 = phi^-2 v2
a1 = M0f(v1)
a2 = M0f(v2)
assert abs(a1[0] - phi ** 2 * v1[0]) < 1e-12 and abs(a1[1] - phi ** 2 * v1[1]) < 1e-12
assert abs(a2[0] - phi ** -2 * v2[0]) < 1e-12 and abs(a2[1] - phi ** -2 * v2[1]) < 1e-12

for _ in range(400):
    u = (random.uniform(-1, 1), random.uniform(-1, 1))
    ds = random.uniform(-1, 1)
    s = random.uniform(-4, 4)
    # the differential of (p, s) -> (M0 p, s + c) carries (u, ds) to (M0 u, ds)
    here = sqlen(u, ds, s)
    assert abs(sqlen(M0f(u), ds, s - Lf) - here) < 1e-9 * (1 + here)
    for c in (0.0, Lf, -2 * Lf, 2 * Lf, -Lf / 2):
        there = sqlen(M0f(u), ds, s + c)
        assert abs(there - here) > 1e-6 * (1 + here), (c, there, here)
print("(2) tau keeps the lengths of M1 Proposition 5.8; (M0 p, s + c) does so for c = -L and for none of")
print("    c = 0, L, -2L, 2L, -L/2: ok on samples")


def z(s, u):
    x, y = xy(u)
    return math.exp(-kappa * s) * y + 1j * math.exp(kappa * s) * x


for _ in range(400):
    u = (random.uniform(-1, 1), random.uniform(-1, 1))
    s = random.uniform(-4, 4)
    assert abs(z(s - Lf, M0f(u)) - z(s, u)) < 1e-9 * (1 + abs(z(s, u)))
spreads = []
for s in (-2.0, -0.6, 0.0, 0.9, 3.1):  # the time held fixed
    ratios = []
    for _ in range(200):
        u = (random.uniform(-1, 1), random.uniform(-1, 1))
        if abs(z(s, u)) > 1e-3:
            ratios.append(z(s, M0f(u)) / z(s, u))
    spread = max(abs(r - ratios[0]) for r in ratios)
    assert spread > 0.1, (s, spread)
    spreads.append(spread)
print("(3) z_{s-L}(M0 p) = z_s(p); at each of five fixed times z_s(M0 p)/z_s(p) is not constant in p")
print("    (least spread %.3f): ok on samples" % min(spreads))

# (4)
assert M0[0][1] == M0[1][0]
for n in range(0, 1001):
    t = n / 1000
    d = ((1 - t) + 2 * t) * ((1 - t) + t) - t * t
    assert abs(d - (1 + t - t * t)) < 1e-12 and d >= 1 - 1e-12


def winding(f, steps=20000):
    tot = 0.0
    prev = f(0.0)
    for n in range(1, steps + 1):
        cur = f(2 * math.pi * n / steps)
        tot += cmath.phase(cur / prev)
        prev = cur
    return tot / (2 * math.pi)


def lin(coef):
    """The complex coordinate z = a theta_psi + b theta_omega."""
    a, b = coef
    return lambda u: a * u[0] + b * u[1]


structures = [(1, 1j), (1, 0.5 + 0.9j), (1, -0.3 + 2.1j), (1, 0.25 + 0.4j)]
zs = []
for a, b in structures:
    zs.append(lin((a, b)))
for s in (0.0, 0.7, -1.3):
    zs.append(lambda u, s=s: z(s, u))
for zz in zs:
    # the real-linear inverse of zz: solve zz(u) = e^{i alpha}
    c1, c2 = zz((1.0, 0.0)), zz((0.0, 1.0))
    dd = c1.real * c2.imag - c1.imag * c2.real
    assert abs(dd) > 1e-9

    def uof(w, c1=c1, c2=c2, dd=dd):
        return ((w.real * c2.imag - w.imag * c2.real) / dd, (c1.real * w.imag - c1.imag * w.real) / dd)

    def rho(al, zz=zz, uof=uof):
        w = cmath.exp(1j * al)
        return w / zz(M0f(uof(w)))

    wn = winding(rho)
    assert abs(wn) < 1e-6, wn
    for al in (0.1, 1.0, 2.5, 4.0):
        assert abs(rho(al + math.pi) - rho(al)) < 1e-9
print("(4) M0 symmetric; det((1-t)I + t M0) = 1 + t - t^2 >= 1 on [0,1]; winding of z/M0 z is 0 and")
print("    z/M0 z is unchanged by z -> -z, for %d complex structures: ok" % len(zs))


# (5) sign patterns
def pull(pat):
    """The pattern of the pull-back by tau: at P_i, the sign at M0 P_i."""
    return tuple(pat[sigma[i] - 1] for i in (1, 2, 3, 4))


def neg(pat):
    return tuple(-x for x in pat)


def odd_at(k):
    return tuple(-1 if i == k else 1 for i in (1, 2, 3, 4))


assert pull(odd_at(2)) == odd_at(4)
assert pull(odd_at(3)) == odd_at(2)
assert pull(odd_at(4)) == odd_at(3)
for k in (2, 3, 4):
    pk = odd_at(k)
    assert pull(pull(pull(pk))) == pk
    assert pull(pk) != pk and pull(pk) != neg(pk)
    assert pull(pull(pk)) != pk and pull(pull(pk)) != neg(pk)
for k, k2 in itertools.combinations((2, 3, 4), 2):
    assert odd_at(k) != odd_at(k2) and odd_at(k) != neg(odd_at(k2))
eight = [p for p in itertools.product((1, -1), repeat=4) if p[0] * p[1] * p[2] * p[3] == -1]
assert len(eight) == 8
fixed = [p for p in eight if pull(p) == p]
assert sorted(fixed) == sorted([odd_at(1), neg(odd_at(1))])
print("(5) pull-back by tau: pattern of P2 -> that of P4, of P3 -> that of P2, of P4 -> that of P3;")
print("    three pull-backs return; none goes to itself or its negative; the three are pairwise neither")
print("    equal nor opposite; of the eight patterns with product -1 the fixed ones are", fixed, ": ok")

# (6)
AmI = [[A[0][0] - 1, A[0][1]], [A[1][0], A[1][1] - 1]]
assert AmI[0][0] * AmI[1][1] - AmI[0][1] * AmI[1][0] == -16
sol = [(a, b) for a in range(-40, 41) for b in range(-40, 41)
       if a * AmI[0][0] + b * AmI[1][0] == 0 and a * AmI[0][1] + b * AmI[1][1] == 0]
assert sol == [(0, 0)]
print("(6) det(A - I) = -16; (a, b)(A - I) = (0, 0) only for (0, 0), on a box: ok")


# (7) integer quaternions (a, b, c, d) = a + b i + c j + d k
def qmul(p, q):
    a, b, c, d = p
    e, f, g, h = q
    return (a * e - b * f - c * g - d * h,
            a * f + b * e + c * h - d * g,
            a * g - b * h + c * e + d * f,
            a * h + b * g - c * f + d * e)


w2 = (1, 1, 1, 1)
mw2 = (-1, -1, -1, -1)
assert qmul(qmul(w2, w2), w2) == (-8, 0, 0, 0)
assert qmul(qmul(mw2, mw2), mw2) == (8, 0, 0, 0)
print("(7) (2w)^3 = -8 and (-2w)^3 = 8: ok")


# (8) the logarithm followed continuously
def tracked_log(rho, al0, al1, steps=20000):
    """log rho(al1) - log rho(al0), following rho continuously from al0 to al1."""
    tot = 0.0 + 0.0j
    prev = rho(al0)
    for n in range(1, steps + 1):
        cur = rho(al0 + (al1 - al0) * n / steps)
        q = cur / prev
        tot += math.log(abs(q)) + 1j * cmath.phase(q)
        prev = cur
    return tot


for zz in zs:
    c1, c2 = zz((1.0, 0.0)), zz((0.0, 1.0))
    dd = c1.real * c2.imag - c1.imag * c2.real

    def uof(w, c1=c1, c2=c2, dd=dd):
        return ((w.real * c2.imag - w.imag * c2.real) / dd, (c1.real * w.imag - c1.imag * w.real) / dd)

    def rho(al, zz=zz, uof=uof):
        w = cmath.exp(1j * al)
        return w / zz(M0f(uof(w)))

    for al0 in (0.0, 0.9, 2.2):
        half = tracked_log(rho, al0, al0 + math.pi)
        full = tracked_log(rho, al0, al0 + 2 * math.pi)
        assert abs(half) < 1e-6, half
        assert abs(full) < 1e-6, full
print("(8) the logarithm of z/M0 z, followed continuously, returns after a half-turn and after a full turn,")
print("    for %d complex structures: ok" % len(zs))
print("S05: all checks passed")
