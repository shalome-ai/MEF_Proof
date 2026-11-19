#!/usr/bin/env python3
"""Card S14b (the fibre at every time, the join and the step): the finite and
numerical parts.

Reads nothing. Usage, from the repository root:
  python3 papers/M2/checks/S14b_fibre_time.py

Notation as in the write-up log: E = R^2/Z^2 with the coordinates
(theta_psi, theta_omega); M0 = [[2,1],[1,1]]; v1 the unit eigenvector of M0
with eigenvalue phi^2, v2 = S v1 with S = [[0,1],[-1,0]]; x, y the components
along v1, v2; L = 1 and kappa = 2 log(phi), so that e^{kappa L} = phi^2
(M1, Proposition 5.8); z_s = e^{-kappa s} y + i e^{kappa s} x (M2-W048).

(1) The coordinates: z_s o M0^3 = z_{s+3L} and z_{s-L} o M0 = z_s, at sample
    points and times (the statements of M2-W048 and M2-W071, checked again).
(2) The complex structure J_s of z_s keeps the lengths
    e^{2 kappa s} dx^2 + e^{-2 kappa s} dy^2 of the fibre at s and the
    handedness of (theta_psi, theta_omega); of the maps of the plane that keep
    these lengths and have square -1, scanned as rotations and reflections in
    coordinates in which the lengths are the standard ones, the only ones are
    J_s and -J_s, and -J_s reverses the handedness.
(3) The derivative in zbar under the join and under the step: for a function F
    of a complex variable that is not holomorphic, and h = F o z_t on the fibre
    at t, the derivative of h o M in zbar_s at p is the derivative of h in
    zbar_t at M p, for (M, s, t) = (M0, s, s-L) and (M0^3, s+3L, s). Finite
    differences.
(4) No single complex structure: over the integers p, q, r, s in a range, the
    matrix J = [[p,q],[r,s]] commutes with M0 exactly when r = q and s = p - q;
    the square of such a J has p^2 + q^2 in its first place, which is not -1.
    For real entries, at sample values, the same two linear conditions and the
    same first place.
(5) The divisors moved by the step: M0 leaves P1 in place and carries P2 to P3,
    P3 to P4, P4 to P2 (M1, Proposition 4.4). For a divisor D = sum a_i P_i the
    moved divisor D' has at P_i the integer of D at M0 P_i. For the twenty
    divisors of flux three: D' has flux three; the signs of the first lift of
    D' at P_i are those of D at M0 P_i; moving three times gives D back; and
    3P4 -> 3P3 -> 3P2 -> 3P4.
(6) The frames under the step: for p near P_i, the coordinate of the fibre at
    s-L centred at M0 P_i, taken at M0 p, is the coordinate of the fibre at s
    centred at P_i, taken at p.
(7) Three steps: M0^3 = [[13,8],[8,5]], M0 M0^3 = M0^3 M0, and M0^3 leaves each
    corner in place modulo Z^2.
"""
import math, cmath, itertools, random, sys

bad = 0
def check(name, ok):
    global bad
    print(("ok   " if ok else "FAIL ") + name)
    if not ok:
        bad += 1

phi = (1 + math.sqrt(5)) / 2
L = 1.0
kappa = 2 * math.log(phi)
n1 = math.hypot(phi, 1.0)
v1 = (phi / n1, 1.0 / n1)
v2 = (v1[1], -v1[0])            # S v1, S = [[0,1],[-1,0]]
M0 = ((2, 1), (1, 1))

def mat(M, p):
    return (M[0][0] * p[0] + M[0][1] * p[1], M[1][0] * p[0] + M[1][1] * p[1])
def mul(A, B):
    return tuple(tuple(sum(A[i][k] * B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
M03 = mul(M0, mul(M0, M0))

def x(p): return p[0] * v1[0] + p[1] * v1[1]
def y(p): return p[0] * v2[0] + p[1] * v2[1]
def z(s, p): return math.exp(-kappa * s) * y(p) + 1j * math.exp(kappa * s) * x(p)

random.seed(7)
pts = [(random.uniform(-1, 1), random.uniform(-1, 1)) for _ in range(8)]
times = [-1.3, 0.0, 0.4, 2.1]
tol = 1e-9

# (1)
ok1 = all(abs(z(s, mat(M03, p)) - z(s + 3 * L, p)) < tol for s in times for p in pts)
ok2 = all(abs(z(s - L, mat(M0, p)) - z(s, p)) < tol for s in times for p in pts)
check("(1) z_s o M0^3 = z_{s+3L}", ok1)
check("(1) z_{s-L} o M0 = z_s", ok2)

# (2)
def frame(s):
    """vectors a, b of the plane with z_s(a) = 1 and z_s(b) = i"""
    za, zb = z(s, (1.0, 0.0)), z(s, (0.0, 1.0))
    det = (za.real * zb.imag - za.imag * zb.real)
    a = (zb.imag / det, -za.imag / det)
    b = (-zb.real / det, za.real / det)
    return a, b
def length2(s, v):
    return math.exp(2 * kappa * s) * x(v) ** 2 + math.exp(-2 * kappa * s) * y(v) ** 2
okJ = True; okH = True; okOnly = True
for s in times:
    a, b = frame(s)
    # J_s a = b, J_s b = -a
    def J(v, a=a, b=b):
        det = a[0] * b[1] - a[1] * b[0]
        ca = (v[0] * b[1] - v[1] * b[0]) / det
        cb = (a[0] * v[1] - a[1] * v[0]) / det
        return (ca * b[0] - cb * a[0], ca * b[1] - cb * a[1])
    for v in pts:
        okJ &= abs(length2(s, J(v)) - length2(s, v)) < tol
        okJ &= abs(z(s, J(v)) - 1j * z(s, v)) < tol
        Jv = J(v)
        okH &= (v[0] * Jv[1] - v[1] * Jv[0]) > 0          # (v, J v) has the handedness of (theta_psi, theta_omega)
    # in the coordinates (Y, X) = (e^{-ks} y, e^{ks} x) the lengths are standard;
    # the maps that keep them are the rotations and the reflections
    found = []
    N = 3600
    for k in range(N):
        t = 2 * math.pi * k / N
        c, sn = math.cos(t), math.sin(t)
        for R in (((c, -sn), (sn, c)), ((c, sn), (sn, -c))):
            R2 = mul(R, R)
            if abs(R2[0][0] + 1) < 1e-12 and abs(R2[1][1] + 1) < 1e-12 and abs(R2[0][1]) < 1e-12 and abs(R2[1][0]) < 1e-12:
                found.append(R)
    okOnly &= len(found) == 2 and all(abs(R[0][0]) < 1e-12 and abs(abs(R[1][0]) - 1) < 1e-12 for R in found)
check("(2) J_s keeps the lengths of the fibre at s and is the structure of z_s", okJ)
check("(2) J_s keeps the handedness of (theta_psi, theta_omega)", okH)
check("(2) the only length-keeping maps with square -1 are the two quarter-turns", okOnly)

# (3)
def F(w):
    return w * w.conjugate() + 0.3 * w.conjugate() ** 2 + cmath.exp(0.2 * w) + 0.7 * w.conjugate()
def dbar(s, h, p, eps=1e-6):
    a, b = frame(s)
    da = (h((p[0] + eps * a[0], p[1] + eps * a[1])) - h((p[0] - eps * a[0], p[1] - eps * a[1]))) / (2 * eps)
    db = (h((p[0] + eps * b[0], p[1] + eps * b[1])) - h((p[0] - eps * b[0], p[1] - eps * b[1]))) / (2 * eps)
    return 0.5 * (da + 1j * db)
ok3a = ok3b = True
small = [(0.3 * p[0], 0.3 * p[1]) for p in pts]
for s in [0.0, 0.4]:
    for p in small:
        h = lambda q, s=s: F(z(s - L, q))
        g = lambda q, h=h: h(mat(M0, q))
        ok3a &= abs(dbar(s, g, p) - dbar(s - L, h, mat(M0, p))) < 1e-5
        h3 = lambda q, s=s: F(z(s, q))
        g3 = lambda q, h3=h3: h3(mat(M03, q))
        ok3b &= abs(dbar(s + 3 * L, g3, p) - dbar(s, h3, mat(M03, p))) < 1e-4
check("(3) the step carries the derivative in zbar at s-L to that at s", ok3a)
check("(3) the join carries the derivative in zbar at s to that at s+3L", ok3b)
nonhol = abs(dbar(0.0, lambda q: F(z(0.0, q)), small[0])) > 1e-3
check("(3) the test function is not holomorphic", nonhol)

# (4)
R = range(-6, 7)
ok4 = True; ok4b = True
for p, q, r, s in itertools.product(R, R, R, R):
    Jm = ((p, q), (r, s))
    com = mul(M0, Jm) == mul(Jm, M0)
    ok4 &= com == (r == q and s == p - q)
    if com:
        J2 = mul(Jm, Jm)
        ok4b &= J2[0][0] == p * p + q * q and J2 != ((-1, 0), (0, -1))
check("(4) integer J commutes with M0 exactly when r = q and s = p - q", ok4)
check("(4) such a J has p^2 + q^2 in the first place of its square, and its square is not -1", ok4b)
ok4c = True
for _ in range(200):
    p, q = random.uniform(-3, 3), random.uniform(-3, 3)
    Jm = ((p, q), (q, p - q))
    A, B = mul(M0, Jm), mul(Jm, M0)
    ok4c &= all(abs(A[i][j] - B[i][j]) < 1e-12 for i in range(2) for j in range(2))
    ok4c &= abs(mul(Jm, Jm)[0][0] - (p * p + q * q)) < 1e-12
check("(4) real J = [[p,q],[q,p-q]] commutes with M0 and has p^2 + q^2 in the first place of its square", ok4c)

# (5)
corners = [(0, 0), (1, 0), (0, 1), (1, 1)]            # twice the corners P1..P4
def img(i):
    m, n = corners[i]
    w = ((2 * m + n) % 2, (m + n) % 2)
    return corners.index(w)
perm = [img(i) for i in range(4)]                     # M0 P_i = P_perm[i]
check("(5) M0 leaves P1 in place and carries P2 to P3, P3 to P4, P4 to P2", perm == [0, 2, 3, 1])
def moved(a): return tuple(a[perm[i]] for i in range(4))
divs = [a for a in itertools.product(range(4), repeat=4) if sum(a) == 3]
check("(5) twenty divisors of flux three", len(divs) == 20)
check("(5) the moved divisor has flux three", all(sum(moved(a)) == 3 for a in divs))
check("(5) signs of the first lift of D' at P_i are those of D at M0 P_i",
      all([(-1) ** moved(a)[i] for i in range(4)] == [(-1) ** a[perm[i]] for i in range(4)] for a in divs))
check("(5) moved three times, a divisor is itself", all(moved(moved(moved(a))) == a for a in divs))
check("(5) 3P4 -> 3P3 -> 3P2 -> 3P4",
      moved((0, 0, 0, 3)) == (0, 0, 3, 0) and moved((0, 0, 3, 0)) == (0, 3, 0, 0) and moved((0, 3, 0, 0)) == (0, 0, 0, 3))

# (6)
ok6 = True
for s in times:
    for i in range(4):
        Pi = (corners[i][0] / 2, corners[i][1] / 2)
        MPi = mat(M0, Pi)
        for d in small:
            p = (Pi[0] + 0.1 * d[0], Pi[1] + 0.1 * d[1])
            Mp = mat(M0, p)
            lhs = z(s - L, (Mp[0] - MPi[0], Mp[1] - MPi[1]))
            rhs = z(s, (p[0] - Pi[0], p[1] - Pi[1]))
            ok6 &= abs(lhs - rhs) < tol
check("(6) the frame coordinate at M0 P_i at the time s-L, carried back by M0, is that at P_i at the time s", ok6)

# (7)
check("(7) M0^3 = [[13,8],[8,5]]", M03 == ((13, 8), (8, 5)))
check("(7) M0 M0^3 = M0^3 M0", mul(M0, M03) == mul(M03, M0))
check("(7) M0^3 leaves each corner in place modulo Z^2",
      all(((13 * m + 8 * n) % 2, (8 * m + 5 * n) % 2) == (m, n) for m, n in corners))

print("FAILED: %d" % bad if bad else "all checks passed")
sys.exit(1 if bad else 0)
