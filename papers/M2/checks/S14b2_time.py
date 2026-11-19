#!/usr/bin/env python3
"""Card S14b2 (the direction of time, one divisor at a time): the finite and
numerical parts.

Reads nothing. Usage, from the repository root:
  python3 papers/M2/checks/S14b2_time.py

Notation as in the write-up log: x, y the components on the fibre along v1, v2
(M1, Proposition 5.8); s the length along time; L = 1 and kappa = 2 log(phi),
so that e^{kappa L} = phi^2; z_s = e^{-kappa s} y + i e^{kappa s} x (M2-W048).
Near a corner P_i the coordinate z_{s,i} = z_s - z_s(P_i) is z_s of the
difference p - P_i (M2-W117), so that here (x, y) are taken from the corner.
In the coordinates (s, x, y) the join is (s, x, y) -> (s - 3L, phi^6 x,
phi^-6 y), the step is (s, x, y) -> (s - L, phi^2 x, phi^-2 y) (M2-W071), the
fold is (s, x, y) -> (s, -x, -y), and the map of M1, Proposition 5.8, is
(s, x, y) -> (-s, -y, x).

(1) The lengths ds^2 + e^{2 kappa s} dx^2 + e^{-2 kappa s} dy^2: d/ds has
    length one and is at right angles to the fibre; a vector at right angles
    to the fibre is a multiple of d/ds.
(2) The join, the step and the fold carry d/ds to d/ds; the map of M1,
    Proposition 5.8, keeps the lengths and carries d/ds to -d/ds.
(3) dz_s/ds = -kappa conj(z_s) at a fixed point of the fibre.
(4) dzbar_s = e^{-kappa s} dy - i e^{kappa s} dx; its derivative in s,
    coefficient by coefficient in dx and dy, is -kappa dz_s; and z_{s'} is a
    complex multiple of z_s only for s' = s.
(5) The two frames: for f = g z^{-a}, (df/ds) z^{a} = dg/ds
    + a kappa (zbar/z) g, by finite differences, for a = 1, 2, 3.
(6) zbar/z has modulus one and, on the ray of angle theta from the corner,
    the value e^{-2 i theta}: the term a kappa (zbar/z) g has different
    limits along two rays where g is not 0, and tends to 0 where g is 0.
(7) The step: for h(q, t) = f(M0^{-1} q, t + L), dh/dt at (q, t) is df/ds at
    (M0^{-1} q, t + L); with a factor c(t) in front, the two differ by c' f.
(8) A cut-off: with chi = 1 near the corner, A_1 = -a kappa chi zbar/z, the
    function (df/ds + A_1 f) z^{a} is dg/ds + a kappa (1 - chi)(zbar/z) g,
    which is dg/ds near the corner.
(9) Finite: each of the twenty divisors of flux three on the corners has a
    corner with a_i not 0; the corners with a_i not 0 for the five divisors
    of M2-W106(iv).
"""
import cmath
import itertools
import math
import sys

PHI = (1 + math.sqrt(5)) / 2
KAPPA = 2 * math.log(PHI)
L = 1.0
H = 1e-6
checks = []


def ok(name, cond):
    checks.append((name, bool(cond)))
    print(("ok   " if cond else "FAIL ") + name)


def z(s, x, y):
    return math.exp(-KAPPA * s) * y + 1j * math.exp(KAPPA * s) * x


def lengths(s):
    """The matrix of the lengths in (s, x, y)."""
    return [1.0, math.exp(2 * KAPPA * s), math.exp(-2 * KAPPA * s)]


def inner(s, a, b):
    g = lengths(s)
    return sum(g[i] * a[i] * b[i] for i in range(3))


SAMPLES = [(-1.3, 0.21, -0.17), (0.0, 0.4, 0.3), (0.7, -0.33, 0.12),
           (2.2, 0.05, 0.45)]

# (1)
DS, DX, DY = (1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0)
c1 = True
for (s, x, y) in SAMPLES:
    c1 &= abs(inner(s, DS, DS) - 1) < 1e-12
    c1 &= abs(inner(s, DS, DX)) < 1e-12 and abs(inner(s, DS, DY)) < 1e-12
    # a vector (a, b, c) at right angles to d/dx and d/dy has b = c = 0
    g = lengths(s)
    for (a, b, c) in itertools.product([-1.0, 0.0, 0.5, 2.0], repeat=3):
        perp = abs(g[1] * b) < 1e-12 and abs(g[2] * c) < 1e-12
        c1 &= (perp == (b == 0.0 and c == 0.0))
ok("(1) d/ds has length one, is at right angles to the fibre, and spans "
   "the vectors that are", c1)


# (2)
def join(p):
    s, x, y = p
    return (s - 3 * L, PHI ** 6 * x, PHI ** -6 * y)


def step(p):
    s, x, y = p
    return (s - L, PHI ** 2 * x, PHI ** -2 * y)


def fold(p):
    s, x, y = p
    return (s, -x, -y)


def back(p):
    s, x, y = p
    return (-s, -y, x)


def push(m, p, vec):
    """The image of the vector vec at p under the map m (finite difference)."""
    a = m(tuple(p[i] + H * vec[i] for i in range(3)))
    b = m(tuple(p[i] - H * vec[i] for i in range(3)))
    return tuple((a[i] - b[i]) / (2 * H) for i in range(3))


def close(a, b, tol=1e-6):
    return all(abs(a[i] - b[i]) < tol for i in range(len(a)))


c2 = True
for p in SAMPLES:
    for m in (join, step, fold):
        c2 &= close(push(m, p, DS), DS)
ok("(2a) the join, the step and the fold carry d/ds to d/ds", c2)
c2 = True
for p in SAMPLES:
    c2 &= close(push(back, p, DS), (-1.0, 0.0, 0.0))
    q = back(p)
    for vec in [(1.0, 0.3, -0.2), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0),
                (0.4, -1.1, 0.7)]:
        w = push(back, p, vec)
        c2 &= abs(inner(q[0], w, w) - inner(p[0], vec, vec)) < 1e-6
ok("(2b) the map of M1, Proposition 5.8, keeps the lengths and carries d/ds "
   "to -d/ds", c2)
c2 = True
for p in SAMPLES:
    q = step(p)
    for vec in [(1.0, 0.3, -0.2), (0.4, -1.1, 0.7)]:
        w = push(step, p, vec)
        c2 &= abs(inner(q[0], w, w) - inner(p[0], vec, vec)) < 1e-6
    q = join(p)
    for vec in [(1.0, 0.3, -0.2), (0.4, -1.1, 0.7)]:
        w = push(join, p, vec)
        c2 &= abs(inner(q[0], w, w) - inner(p[0], vec, vec)) < 1e-5
ok("(2c) the join and the step keep the lengths (M2-W071, checked again)", c2)

# (3)
c3 = True
for (s, x, y) in SAMPLES:
    d = (z(s + H, x, y) - z(s - H, x, y)) / (2 * H)
    c3 &= abs(d + KAPPA * z(s, x, y).conjugate()) < 1e-6
ok("(3) dz_s/ds = -kappa conj(z_s) at a fixed point of the fibre", c3)


# (4)
def dzbar_coeffs(s):
    """dzbar_s = A dx + B dy."""
    return (-1j * math.exp(KAPPA * s), math.exp(-KAPPA * s))


def dz_coeffs(s):
    return (1j * math.exp(KAPPA * s), math.exp(-KAPPA * s))


c4 = True
for s in (-1.3, 0.0, 0.7, 2.2):
    a1, b1 = dzbar_coeffs(s + H)
    a0, b0 = dzbar_coeffs(s - H)
    da, db = (a1 - a0) / (2 * H), (b1 - b0) / (2 * H)
    ea, eb = dz_coeffs(s)
    c4 &= abs(da + KAPPA * ea) < 1e-6 and abs(db + KAPPA * eb) < 1e-6
    # -kappa dz_s is not a multiple of dzbar_s: the 2 x 2 determinant is not 0
    fa, fb = dzbar_coeffs(s)
    c4 &= abs(ea * fb - eb * fa) > 1e-3
ok("(4a) the derivative in s of dzbar_s is -kappa dz_s, which is no multiple "
   "of dzbar_s", c4)
c4 = True
times = (-1.3, 0.0, 0.7, 2.2)
for s in times:
    for t in times:
        # z_t = c z_s for a complex c exactly when the coefficients of x and
        # of y have the same ratio
        rx = math.exp(KAPPA * t) / math.exp(KAPPA * s)
        ry = math.exp(-KAPPA * t) / math.exp(-KAPPA * s)
        c4 &= ((abs(rx - ry) < 1e-12) == (s == t))
ok("(4b) z_t is a complex multiple of z_s only for t = s", c4)


# (5)
def g_test(s, x, y):
    """A function that is not holomorphic and is not 0 at the corner."""
    return (1.3 + 0.4j) + (0.7 - 0.2j) * x + 0.5j * y + 0.3 * s * x \
        + (0.2 + 0.1j) * math.sin(s) + 0.6 * x * y


def g_zero(s, x, y):
    """A function that is 0 on the corner circle."""
    return (0.7 - 0.2j) * x + 0.5j * y + 0.3 * s * x + 0.6 * x * y


def dds(fn, s, x, y):
    return (fn(s + H, x, y) - fn(s - H, x, y)) / (2 * H)


c5 = True
worst = 0.0
for a in (1, 2, 3):
    def f(s, x, y, a=a):
        return g_test(s, x, y) * z(s, x, y) ** (-a)
    for (s, x, y) in SAMPLES + [(0.3, 0.02, -0.01), (-0.5, -0.03, 0.04)]:
        zz = z(s, x, y)
        lhs = dds(f, s, x, y) * zz ** a
        rhs = dds(g_test, s, x, y) \
            + a * KAPPA * (zz.conjugate() / zz) * g_test(s, x, y)
        err = abs(lhs - rhs) / (1 + abs(rhs))
        worst = max(worst, err)
        c5 &= err < 1e-4
ok("(5) for f = g z^-a: (df/ds) z^a = dg/ds + a kappa (zbar/z) g, a = 1, 2, 3"
   " (worst relative error %.1e)" % worst, c5)

# (6)
c6 = True
s0 = 0.3
for theta in (0.0, 0.4, 1.1, 2.0, 3.0):
    for r in (1e-2, 1e-4, 1e-6):
        # the point of the fibre at s0 with z = r e^{i theta}
        u, v = r * math.cos(theta), r * math.sin(theta)
        x, y = v * math.exp(-KAPPA * s0), u * math.exp(KAPPA * s0)
        zz = z(s0, x, y)
        q = zz.conjugate() / zz
        c6 &= abs(abs(q) - 1) < 1e-9
        c6 &= abs(q - cmath.exp(-2j * theta)) < 1e-6
ok("(6a) zbar/z has modulus one and is e^{-2 i theta} on the ray of angle "
   "theta", c6)
c6 = True
for a in (1, 2, 3):
    vals = []
    zero_vals = []
    for theta in (0.0, math.pi / 2):
        r = 1e-6
        u, v = r * math.cos(theta), r * math.sin(theta)
        x, y = v * math.exp(-KAPPA * s0), u * math.exp(KAPPA * s0)
        zz = z(s0, x, y)
        vals.append(a * KAPPA * (zz.conjugate() / zz) * g_test(s0, x, y))
        zero_vals.append(a * KAPPA * (zz.conjugate() / zz)
                         * g_zero(s0, x, y))
    g0 = g_test(s0, 0.0, 0.0)
    c6 &= abs(vals[0] - vals[1]) > 1.9 * a * KAPPA * abs(g0)
    c6 &= all(abs(w) < 1e-4 for w in zero_vals)
ok("(6b) a kappa (zbar/z) g: two limits along two rays where g is not 0; "
   "limit 0 where g is 0", c6)


# (7)  in the coordinates (x, y), M0^{-1} is (x, y) -> (phi^-2 x, phi^2 y)
def f7(s, x, y):
    return (0.9 - 0.3j) + (0.4 + 0.2j) * x * s + 0.7j * y \
        + 0.25 * math.cos(s) * x * y


def h7(t, x, y):
    return f7(t + L, PHI ** -2 * x, PHI ** 2 * y)


def c_fun(t):
    return 1.5 + 0.4 * math.sin(0.8 * t)


def ch7(t, x, y):
    return c_fun(t) * h7(t, x, y)


c7 = True
for (t, x, y) in SAMPLES:
    lhs = dds(h7, t, x, y)
    rhs = dds(f7, t + L, PHI ** -2 * x, PHI ** 2 * y)
    c7 &= abs(lhs - rhs) < 1e-6
    lhs = dds(ch7, t, x, y)
    cprime = (c_fun(t + H) - c_fun(t - H)) / (2 * H)
    c7 &= abs(lhs - (c_fun(t) * rhs + cprime * h7(t, x, y))) < 1e-6
    c7 &= abs(cprime * h7(t, x, y)) > 1e-3
ok("(7) the step carries df/ds to dh/ds; with a factor c(t) the difference "
   "is c' times the image", c7)


# (8)
def chi(r):
    """1 for r <= 0.1, 0 for r >= 0.2, continuous."""
    if r <= 0.1:
        return 1.0
    if r >= 0.2:
        return 0.0
    return (0.2 - r) / 0.1


c8 = True
for a in (1, 2, 3):
    def f(s, x, y, a=a):
        return g_test(s, x, y) * z(s, x, y) ** (-a)
    for (s, x, y) in [(0.3, 0.02, -0.01), (-0.5, -0.03, 0.04),
                      (0.1, 0.11, 0.05), (0.0, 0.4, 0.3)]:
        zz = z(s, x, y)
        r = abs(zz)
        q = zz.conjugate() / zz
        a1 = -a * KAPPA * chi(r) * q
        lhs = (dds(f, s, x, y) + a1 * f(s, x, y)) * zz ** a
        rhs = dds(g_test, s, x, y) \
            + a * KAPPA * (1 - chi(r)) * q * g_test(s, x, y)
        c8 &= abs(lhs - rhs) / (1 + abs(rhs)) < 1e-4
        if r <= 0.1:
            c8 &= abs(lhs - dds(g_test, s, x, y)) \
                / (1 + abs(lhs)) < 1e-4
ok("(8) with the cut-off the corrected derivative is dg/ds near the corner",
   c8)

# (9)
divisors = [d for d in itertools.product(range(4), repeat=4) if sum(d) == 3]
c9 = len(divisors) == 20 and all(any(a != 0 for a in d) for d in divisors)
ok("(9a) twenty divisors of flux three; each has a corner with a_i not 0", c9)
five = {(0, 0, 0, 3): {4}, (2, 0, 0, 1): {1, 4}, (0, 2, 0, 1): {2, 4},
        (0, 0, 2, 1): {3, 4}, (1, 1, 1, 0): {1, 2, 3}}
c9 = all(d in divisors and {i + 1 for i in range(4) if d[i] != 0} == want
         for d, want in five.items())
ok("(9b) the corners with a_i not 0 for the five divisors of M2-W106(iv)", c9)

bad = [n for n, c in checks if not c]
print("%d checks, %d failed" % (len(checks), len(bad)))
sys.exit(1 if bad else 0)
