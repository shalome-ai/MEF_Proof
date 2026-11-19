#!/usr/bin/env python3
"""Card S14b2b (the five divisors together in time): the numerical parts.

Reads nothing. Usage, from the repository root:
  python3 papers/M2/checks/S14b2b_five.py

Notation as in the write-up log: x, y the components on the covering torus
along v1, v2 (M1, Proposition 5.8); s the length along time; L = 1 and
kappa = 2 log(phi), so that e^{kappa L} = phi^2; z_s = e^{-kappa s} y +
i e^{kappa s} x (M2-W048), a linear function on R^2. The lattice at the time s
is z_s(Z^2). The Weierstrass function at the time s is summed over the points
of that lattice of modulus at most RMAX (a truncation that depends on the
lattice only, not on a basis of it), so every check is numerical, at sample
points and times, to the tolerance printed.

 (1) c |n| <= |z_s(n)| <= C |n| for 0 <= s <= 3L, c = e^{-3 kappa L}, C = 1/c.
 (2) Phi(p, s) = wp_s(z_s(p)): Phi(M0 p, s - L) = Phi(p, s) and
     Phi(M0^3 p, s) = Phi(p, s + 3L); the same for wp'.
 (3) d/ds Phi at a fixed point p, by finite differences, is the series
     2 kappa sum [ h(z - w) - h(w) ], h(u) = conj(u)/u^3 (the term of w = 0
     being h(z)); and Phi is not holomorphic in the time: d/ds Phi is not 0.
 (4) (wp(z + w_k) - e_k)(wp(z) - e_k) does not depend on z, k = 2, 3, 4.
 (5) wp'^2 = 4 (wp - e_2)(wp - e_3)(wp - e_4); the e_k are different.
 (6) The five multipliers m_D of M2-W106(iv): near the corner P_i,
     m z_{s,i}^{b_i - a_i} has one limit along two rays, not 0, where
     D = sum a_i P_i and 3P_4 = sum b_i P_i.
 (7) The join: m_D(p, s + 3L) = m_D(M0^3 p, s). Parity: the first four are
     even and the fifth odd.
 (8) (d/ds m)/m + (a_i - b_i) kappa conj(z_{s,i})/z_{s,i} has one limit
     along two rays at the corner P_i (finite differences in s).
 (9) For the four divisors other than 3P_4, (d/ds m)/m takes different
     values at two points of the covering torus at one time: it is not a
     function of the time alone, and in particular not 0.
(10) The product rule that carries the derivative in s across a multiplier:
     d/ds (m f) = m (d/ds f + ((d/ds m)/m) f), by finite differences.
(11) The bounds of the proof, for |z| <= |w| / 2, w not 0, at random complex
     z and w: |1/(z-w)^2 - 1/w^2| <= 10 |z| / |w|^3;
     |h(w - z) - h(w)| <= 46 |z| / |w|^3, with h even; |1/(z-w)^3| <= 8/|w|^3;
     |conj(u)/u^4| <= 8/|w|^3 for u = z - w.
(12) d/ds of z_s(u)^-2 is 2 kappa h(z_s(u)) and d/ds of z_s(u)^-3 is
     3 kappa conj(z_s(u)) / z_s(u)^4, by finite differences.
(13) wp'' = (c_0 / 2) sum over k of the products of the two wp - e_j, j not k,
     with c_0 = 4, wp'' by finite differences of wp' along the covering torus.
"""
import numpy as np, sys

phi = (1 + 5 ** 0.5) / 2
L = 1.0
kappa = 2 * np.log(phi)
nrm = (phi * phi + 1) ** 0.5
v1 = np.array([phi, 1.0]) / nrm
v2 = np.array([1.0, -phi]) / nrm
M0 = np.array([[2.0, 1.0], [1.0, 1.0]])
M03 = M0 @ M0 @ M0
P = {1: np.array([0.0, 0.0]), 2: np.array([0.5, 0.0]),
     3: np.array([0.0, 0.5]), 4: np.array([0.5, 0.5])}
RMAX = 45.0
fails = 0

def check(name, ok, extra=""):
    global fails
    print(("PASS  " if ok else "FAIL  ") + name + ("   " + extra if extra else ""))
    if not ok:
        fails += 1

def zs(p, s):
    p = np.asarray(p, float)
    return np.exp(-kappa * s) * (p @ v2) + 1j * np.exp(kappa * s) * (p @ v1)

_lat = {}
def lattice(s):
    key = round(s, 12)
    if key not in _lat:
        c = np.exp(-kappa * abs(s)) if abs(s) > 1e-15 else 1.0
        N = int(RMAX / c) + 2
        r = np.arange(-N, N + 1)
        a, b = np.meshgrid(r, r, indexing="ij")
        w = (np.exp(-kappa * s) * (a * v2[0] + b * v2[1])
             + 1j * np.exp(kappa * s) * (a * v1[0] + b * v1[1])).ravel()
        w = w[(np.abs(w) <= RMAX) & (np.abs(w) > 1e-12)]
        _lat[key] = w
    return _lat[key]

def wp(z, s):
    w = lattice(s)
    return 1 / z ** 2 + np.sum(1 / (z - w) ** 2 - 1 / w ** 2)

def wp1(z, s):
    w = lattice(s)
    return -2 / z ** 3 - 2 * np.sum(1 / (z - w) ** 3)

def Phi(p, s):  return wp(zs(p, s), s)
def Phi1(p, s): return wp1(zs(p, s), s)
def e(k, s):    return Phi(P[k], s)

def h(u): return np.conj(u) / u ** 3
def dsPhi_series(p, s):
    z = zs(p, s); w = lattice(s)
    return 2 * kappa * (h(z) + np.sum(h(z - w) - h(w)))

# the five divisors (a_1, a_2, a_3, a_4) and their multipliers, M2-W106(iv)
FIVE = {"3P4": (0, 0, 0, 3), "2P1+P4": (2, 0, 0, 1), "2P2+P4": (0, 2, 0, 1),
        "2P3+P4": (0, 0, 2, 1), "P1+P2+P3": (1, 1, 1, 0)}
B = (0, 0, 0, 3)
def mult(name, p, s):
    W = Phi(p, s)
    if name == "3P4":      return 1.0 + 0j
    if name == "2P1+P4":   return 1 / (W - e(4, s))
    if name == "2P2+P4":   return (W - e(2, s)) / (W - e(4, s))
    if name == "2P3+P4":   return (W - e(3, s)) / (W - e(4, s))
    if name == "P1+P2+P3": return Phi1(p, s) / (W - e(4, s)) ** 2

def ds(F, s, d=1e-4):
    return (F(s + d) - F(s - d)) / (2 * d)

TOL = 2e-2          # the truncation at RMAX leaves an error of the order of |z| / RMAX
pts = [np.array([0.13, 0.31]), np.array([0.37, -0.22]), np.array([-0.29, 0.44])]
times = [0.0, 0.35, 0.8]

# (1)
ok = True
c = np.exp(-3 * kappa * L); C = 1 / c
rng = np.random.default_rng(1)
for s in np.linspace(0, 3 * L, 13):
    for n in rng.integers(-50, 51, size=(200, 2)):
        if not n.any(): continue
        r = abs(zs(n, s)); m = np.hypot(*n)
        ok &= (c * m <= r * (1 + 1e-12)) and (r <= C * m * (1 + 1e-12))
check("(1) c|n| <= |z_s(n)| <= C|n| on 0 <= s <= 3L", ok)

# (2)
worst = 0
for p in pts:
    for s in times:
        worst = max(worst, abs(Phi(M0 @ p, s - L) - Phi(p, s)),
                    abs(Phi1(M0 @ p, s - L) - Phi1(p, s)))
check("(2) Phi and wp' are carried to themselves by the step", worst < TOL, "max diff %.1e" % worst)
worst = 0
for p in pts[:2]:
    for s in (0.0, 0.35):
        worst = max(worst, abs(Phi(M03 @ p, s) - Phi(p, s + 3 * L)),
                    abs(Phi1(M03 @ p, s) - Phi1(p, s + 3 * L)))
check("(2) Phi and wp' respect the join", worst < TOL, "max diff %.1e" % worst)

# (3)
worst = 0; least = 1e9
for p in pts:
    for s in times[1:]:
        fd = ds(lambda t: Phi(p, t), s)
        se = dsPhi_series(p, s)
        worst = max(worst, abs(fd - se)); least = min(least, abs(se))
check("(3) d/ds Phi is the series 2 kappa sum [h(z-w) - h(w)]", worst < TOL, "max diff %.1e" % worst)
check("(3) d/ds Phi is not 0 at the sample points", least > 0.1, "least modulus %.2f" % least)

# (4), (5)
worst = 0
for s in times:
    for k in (2, 3, 4):
        vals = [(Phi(p + P[k], s) - e(k, s)) * (Phi(p, s) - e(k, s)) for p in pts]
        i, j = [q for q in (2, 3, 4) if q != k]
        want = (e(k, s) - e(i, s)) * (e(k, s) - e(j, s))
        worst = max(worst, max(abs(v - want) / abs(want) for v in vals))
check("(4) (wp(z + w_k) - e_k)(wp(z) - e_k) = (e_k - e_i)(e_k - e_j)", worst < TOL, "max rel diff %.1e" % worst)
worst = 0; sep = 1e9
for s in times:
    for p in pts:
        lhs = Phi1(p, s) ** 2
        rhs = 4 * np.prod([Phi(p, s) - e(k, s) for k in (2, 3, 4)])
        worst = max(worst, abs(lhs - rhs) / abs(rhs))
    sep = min(sep, abs(e(2, s) - e(3, s)), abs(e(2, s) - e(4, s)), abs(e(3, s) - e(4, s)))
check("(5) wp'^2 = 4 (wp - e_2)(wp - e_3)(wp - e_4)", worst < TOL, "max rel diff %.1e" % worst)
check("(5) e_2, e_3, e_4 are different", sep > 0.1, "least gap %.2f" % sep)

# (6), (8): near the corners, along two rays
def ray(i, s, r, th):
    # the point p near P_i with z_{s,i}(p) = r e^{i th}
    zeta = r * np.exp(1j * th)
    y = zeta.real * np.exp(kappa * s); x = zeta.imag * np.exp(-kappa * s)
    return P[i] + x * v1 + y * v2
ok6 = True; ok8 = True; w6 = 0; w8 = 0
for name, a in FIVE.items():
    for i in (1, 2, 3, 4):
        for s in (0.35,):
            v = []; u = []
            for th in (0.3, 0.3 + np.pi / 2):
                # the same point of the covering torus at the times s +- d
                r = 2e-2
                p = ray(i, s, r, th)
                zi = lambda t: zs(p - P[i], t)
                hh = lambda t: mult(name, p, t) * zi(t) ** (B[i - 1] - a[i - 1])
                v.append(hh(s))
                dlog = ds(lambda t: mult(name, p, t), s) / mult(name, p, s)
                u.append(dlog + (a[i - 1] - B[i - 1]) * kappa * np.conj(zi(s)) / zi(s))
            ok6 &= abs(v[0]) > 1e-3 and abs(v[0] - v[1]) < 5e-2 * max(1, abs(v[0]))
            w6 = max(w6, abs(v[0] - v[1]) / max(1, abs(v[0])))
            ok8 &= abs(u[0] - u[1]) < 0.15 * max(1, abs(u[0]))
            w8 = max(w8, abs(u[0] - u[1]))
check("(6) m z^{b-a} has one limit, not 0, at each corner (two rays, r = 0.02)", ok6, "max rel diff %.1e" % w6)
check("(8) (d/ds m)/m + (a-b) kappa zbar/z has one limit at each corner (two rays, r = 0.02)", ok8, "max diff %.1e" % w8)

# (7)
worst = 0; par = True
for name in FIVE:
    for p in pts[:2]:
        worst = max(worst, abs(mult(name, p, 0.2 + 3 * L) - mult(name, M03 @ p, 0.2))
                    / max(1, abs(mult(name, M03 @ p, 0.2))))
        sgn = -1 if name == "P1+P2+P3" else 1
        par &= abs(mult(name, -p, 0.35) - sgn * mult(name, p, 0.35)) < TOL * max(1, abs(mult(name, p, 0.35)))
check("(7) the five multipliers respect the join", worst < TOL, "max rel diff %.1e" % worst)
check("(7) the first four multipliers are even and the fifth is odd", par)

# (9)
ok = True; least = 1e9
for name in FIVE:
    if name == "3P4": continue
    d = [ds(lambda t: mult(name, p, t), 0.35) / mult(name, p, 0.35) for p in pts]
    gap = max(abs(d[0] - d[1]), abs(d[0] - d[2]))
    least = min(least, gap, max(abs(x) for x in d))
    ok &= gap > 0.1
check("(9) (d/ds m)/m is not a function of the time alone, for the four divisors other than 3P4", ok, "least gap %.2f" % least)

# (10)
worst = 0
f = lambda p, t: np.exp(1j * (p @ np.array([1.0, 2.0]))) * (1 + 0.3 * t * t)
for name in FIVE:
    p = pts[0]; s = 0.35
    lhs = ds(lambda t: mult(name, p, t) * f(p, t), s)
    m = mult(name, p, s)
    rhs = m * (ds(lambda t: f(p, t), s) + ds(lambda t: mult(name, p, t), s) / m * f(p, s))
    worst = max(worst, abs(lhs - rhs) / max(1, abs(lhs)))
check("(10) d/ds (m f) = m (d/ds f + ((d/ds m)/m) f)", worst < 1e-6, "max rel diff %.1e" % worst)

# (11)
ok = True
for _ in range(20000):
    w = complex(rng.normal(), rng.normal()) * 10 ** rng.uniform(-1, 2)
    z = complex(rng.normal(), rng.normal()); z = z / abs(z) * abs(w) / 2 * rng.uniform(0, 1)
    A = abs(w) ** 3; e1 = 1 + 1e-9
    ok &= abs(1 / (z - w) ** 2 - 1 / w ** 2) <= 10 * abs(z) / A * e1
    ok &= abs(h(w - z) - h(w)) <= 46 * abs(z) / A * e1
    ok &= abs(h(-w) - h(w)) <= 1e-9 * abs(h(w))
    ok &= abs(1 / (z - w) ** 3) <= 8 / A * e1
    ok &= abs(np.conj(z - w) / (z - w) ** 4) <= 8 / A * e1
check("(11) the four bounds of the proof, at 20000 random pairs", bool(ok))

# (12)
worst = 0
for u in (np.array([0.7, -1.3]), np.array([2.0, 1.0])):
    for s in times:
        worst = max(worst, abs(ds(lambda t: zs(u, t) ** -2, s, 1e-5) - 2 * kappa * h(zs(u, s))),
                    abs(ds(lambda t: zs(u, t) ** -3, s, 1e-5) - 3 * kappa * np.conj(zs(u, s)) / zs(u, s) ** 4))
check("(12) the derivatives in s of z_s(u)^-2 and z_s(u)^-3", worst < 1e-6, "max diff %.1e" % worst)

# (13)
worst = 0
for s in times[:2]:
    for p in pts:
        z = zs(p, s); d = 1e-5
        w2 = (wp1(z + d, s) - wp1(z - d, s)) / (2 * d)
        E = [Phi(p, s) - e(k, s) for k in (2, 3, 4)]
        rhs = 2 * (E[0] * E[1] + E[0] * E[2] + E[1] * E[2])
        worst = max(worst, abs(w2 - rhs) / max(1, abs(rhs)))
check("(13) wp'' = 2 sum of the products of two of the wp - e_k", worst < TOL, "max rel diff %.1e" % worst)

print("\n%d check(s) failed" % fails if fails else "\nall checks passed")
sys.exit(1 if fails else 0)
