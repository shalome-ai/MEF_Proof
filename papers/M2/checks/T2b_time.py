#!/usr/bin/env python3
"""T2b_time.py -- chat C13, the time part of card T2 reopened (Decision Log P296).

The test, said before it was run: is there a way to differentiate a smooth
state along time, written from the coordinates z_s, the divisor and the
product alone, that carries states at rest to states at rest?

What this script checks, and how:
  A  (numerical)     d/ds z_s = -kappa conj(z_s);  [d/ds, d/dzbar_s] = kappa d/dz_s.
  B  (numerical)     for f = z_s^2, holomorphic on each fibre, d/dzbar_s (d/ds f) is not zero.
  C  (numerical)     the lattice of the fibre: area 1, tau' = 2 i kappa / w1^2.
  D  (numerical)     the series theta_j of the fibre at the time s satisfy
                        d/ds|_p Theta = (kappa/(6 pi)) d^2/dz^2 Theta + g d/dz Theta,
                     g = kappa (z conj(w1)/w1 - conj z).
  E  (numerical)     the operator H = d/ds - (kappa/(6 pi)) d^2/dz^2 - g d/dz commutes with d/dzbar_s.
  F  (numerical)     for each of the five divisors there is, up to a factor, one combination
                     Sigma_D of the theta_j with the zeros of D; theta_k / Sigma_D are functions
                     on the fibre.
  G  (numerical)     the two names (p, s+3L) and (M0^3 p, s) of a point: the frames theta_k/Sigma_D
                     made from the two bases of the lattice differ by a matrix that is, from one
                     time to another, a constant matrix times a number.

  F3 (numerical)     Theta_D written out as a product of the series of level one.
  H  (H0 exact; H1, H2 numerical)  the corners under M0 and S; the step; R.
  I  (numerical)     once round the time circle: the matrix, its factors, twice round is the fold.
  G0 and H0 compare whole numbers exactly; every other check is numerical.

Names: in the write-up log Sigma_D is Theta_D, theta_j / Theta are vartheta_j, tau is
upsilon_s, w1 is varpi_2 and w2 is varpi_1.
The numerical checks are at sample points and are not proofs.
z_s = exp(-kappa s) y + i exp(kappa s) x, x and y along v1, v2 (M2-W048, M2-W069).
w1 = z_s(1,0), w2 = z_s(0,1) (in M2-W221 these are varpi_2 and varpi_1).
"""
import cmath, math, sys
import numpy as np
ok = True
def report(name, cond, extra=""):
    global ok
    ok = ok and bool(cond)
    print(("PASS " if cond else "FAIL ") + name + (("  " + extra) if extra else ""))

# ---------------------------------------------------------------- A, B, E
# by finite differences (five-point stencil) on a test function of (x, y, s) that is
# not special in any way; numerical, to the accuracy of the stencil.
_phi = (1 + math.sqrt(5))/2
_k = math.log(_phi**2)
_h = 1e-2
def d(F, i):
    def G(X):
        e = np.zeros(3); e[i] = _h
        return (-F(X+2*e) + 8*F(X+e) - 8*F(X-e) + F(X-2*e))/(12*_h)
    return G
def Dzb(F): return lambda X: (math.exp(_k*X[2])*d(F, 1)(X) + 1j*math.exp(-_k*X[2])*d(F, 0)(X))/2
def Dz(F):  return lambda X: (math.exp(_k*X[2])*d(F, 1)(X) - 1j*math.exp(-_k*X[2])*d(F, 0)(X))/2
def Ds(F):  return d(F, 2)
zf  = lambda X: math.exp(-_k*X[2])*X[1] + 1j*math.exp(_k*X[2])*X[0]
zbf = lambda X: math.exp(-_k*X[2])*X[1] - 1j*math.exp(_k*X[2])*X[0]
ftest = lambda X: cmath.exp((0.3+0.2j)*X[0] - (0.25-0.1j)*X[1] + 0.15*X[2]) * (1 + 0.5j*X[0]*X[1]) + math.cos(0.7*X[2]*X[0])
Xs = [np.array([0.31, -0.42, 0.27]), np.array([-0.55, 0.18, 0.9])]
def worst(F): return max(abs(F(X)) for X in Xs)
tol = 1e-5
report("A1 dz/dzbar = 0, dz/dz = 1", worst(Dzb(zf)) < tol and worst(lambda X: Dz(zf)(X) - 1) < tol)
report("A2 d/ds z_s = -kappa conj(z_s)", worst(lambda X: Ds(zf)(X) + _k*zbf(X)) < tol)
report("A3 [d/ds, d/dzbar] = kappa d/dz", worst(lambda X: Ds(Dzb(ftest))(X) - Dzb(Ds(ftest))(X) - _k*Dz(ftest)(X)) < tol)
report("A4 [d/ds, d/dz] = kappa d/dzbar", worst(lambda X: Ds(Dz(ftest))(X) - Dz(Ds(ftest))(X) - _k*Dzb(ftest)(X)) < tol)
z2 = lambda X: zf(X)**2
report("B1 d/dzbar (d/ds z^2) = -2 kappa z, not zero", worst(lambda X: Dzb(Ds(z2))(X) + 2*_k*zf(X)) < tol and abs(zf(Xs[0])) > 0.1)
_x0, _y0 = 0.6, -0.8        # any fixed point other than the origin, in the place of (1,0)
w1f = lambda X: zf(np.array([_x0, _y0, X[2]]))
gf = lambda X: _k*(zf(X)*w1f(X).conjugate()/w1f(X) - zbf(X))
def H(F): return lambda X: Ds(F)(X) - (_k/(6*math.pi))*Dz(Dz(F))(X) - gf(X)*Dz(F)(X)
report("E1 H commutes with d/dzbar", worst(lambda X: H(Dzb(ftest))(X) - Dzb(H(ftest))(X)) < 1e-4,
       "worst %.1e" % worst(lambda X: H(Dzb(ftest))(X) - Dzb(H(ftest))(X)))
report("E2 d/dzbar g = -kappa", worst(lambda X: Dzb(gf)(X) + _k) < tol)

# ---------------------------------------------------------------- numerics
phi = (1 + math.sqrt(5))/2
L = 1.0
kap = math.log(phi**2)/L
M0 = np.array([[2, 1], [1, 1]])
v1 = np.array([phi, 1.0]); v1 = v1/np.linalg.norm(v1)
S = np.array([[0, 1], [-1, 0]])
v2 = S @ v1
report("C0 v1, v2 eigenvectors of M0 for phi^2, phi^-2",
       np.allclose(M0 @ v1, phi**2*v1) and np.allclose(M0 @ v2, phi**-2*v2))

def zs(p, t):
    p = np.asarray(p, dtype=float)
    return math.exp(-kap*t)*(p @ v2) + 1j*math.exp(kap*t)*(p @ v1)

def theta(j, u, tau, d=0, N=30):
    tot = 0j
    for m in range(-N, N+1):
        n = m + j/3.0
        tot += (6j*math.pi*n)**d * cmath.exp(3j*math.pi*n*n*tau + 6j*math.pi*n*u)
    return tot

class Basis:
    """A basis E1, E2 of Z^2 (columns of the integer matrix E)."""
    def __init__(self, E):
        self.E = np.array(E, dtype=float)
        self.Einv = np.linalg.inv(self.E)
    def w(self, t):
        return zs(self.E[:, 0], t), zs(self.E[:, 1], t)
    def tau(self, t):
        w1, w2 = self.w(t); return w2/w1
    def u(self, p, t):
        return zs(p, t)/self.w(t)[0]
    def Theta(self, j, p, t, d=0):
        return theta(j, self.u(p, t), self.tau(t), d)
    def sigma_coeffs(self, D, t):
        """the combination of theta_0,1,2 with the zeros of D = (a1,a2,a3,a4) at the corners"""
        corners = [(0, 0), (.5, 0), (0, .5), (.5, .5)]
        rows = []
        for a, P in zip(D, corners):
            for d in range(a):
                rows.append([self.Theta(j, P, t, d) for j in range(3)])
        A = np.array(rows)
        U, sv, Vh = np.linalg.svd(A)
        return Vh[-1].conj(), sv
    def frame(self, D, p, t):
        c, _ = self.sigma_coeffs(D, t)
        th = np.array([self.Theta(j, p, t) for j in range(3)])
        return th/(c @ th)

B = Basis([[1, 0], [0, 1]])
times = [0.13, 0.71, 1.9, 2.6]
good = True
for t in times:
    w1, w2 = B.w(t)
    area = (w2*w1.conjugate()).imag
    h = 1e-6
    dtau = (B.tau(t+h) - B.tau(t-h))/(2*h)
    good = good and abs(area - 1) < 1e-12 and B.tau(t).imag > 0 and abs(dtau - 2j*kap/w1**2) < 1e-6
report("C1 area of the fibre 1, Im tau > 0, tau' = 2 i kappa / w1^2", good)

pts = [(0.21, 0.37), (0.83, 0.12), (0.45, 0.91)]
worst = 0
for t in times[:3]:
    w1 = B.w(t)[0]
    for p in pts:
        for j in range(3):
            h = 1e-5
            lhs = (B.Theta(j, p, t+h) - B.Theta(j, p, t-h))/(2*h)
            zz = zs(p, t)
            gg = kap*(zz*w1.conjugate()/w1 - zz.conjugate())
            rhs = (kap/(6*math.pi))*B.Theta(j, p, t, 2)/w1**2 + gg*B.Theta(j, p, t, 1)/w1
            worst = max(worst, abs(lhs - rhs)/max(1, abs(lhs)))
report("D1 d/ds Theta_j = (kappa/6pi) d2/dz2 Theta_j + g d/dz Theta_j", worst < 1e-6, "worst %.1e" % worst)

divisors = {"3P4": (0, 0, 0, 3), "2P1+P4": (2, 0, 0, 1), "2P2+P4": (0, 2, 0, 1),
            "2P3+P4": (0, 0, 2, 1), "P1+P2+P3": (1, 1, 1, 0)}
good = True; worst = 0
for name, D in divisors.items():
    for t in times[:2]:
        c, sv = B.sigma_coeffs(D, t)
        good = good and sv[-1] < 1e-9*sv[0] and sv[-2] > 1e-4*sv[0]
        for p in pts:
            f0 = B.frame(D, p, t)
            for e in [(1, 0), (0, 1), (3, -2)]:
                f1 = B.frame(D, (p[0]+e[0], p[1]+e[1]), t)
                worst = max(worst, np.max(np.abs(f1 - f0))/max(1, np.max(np.abs(f0))))
report("F1 one combination Sigma_D with the zeros of D, for each of the five", good)
report("F2 theta_k / Sigma_D are functions on the fibre", worst < 1e-7, "worst %.1e" % worst)

# G: the basis of the second name, M0^-3 applied to (1,0), (0,1)
M3inv = np.array([[5, -8], [-8, 13]])
report("G0 M0^3 = [[13,8],[8,5]], inverse [[5,-8],[-8,13]], identity mod 2",
       (np.linalg.matrix_power(M0, 3) == np.array([[13, 8], [8, 5]])).all()
       and (np.linalg.matrix_power(M0, 3) @ M3inv == np.eye(2)).all() and ((M3inv - np.eye(2)) % 2 == 0).all())
B2 = Basis(M3inv)       # columns M0^-3 (1,0), M0^-3 (0,1)
samp = [(0.21, 0.37), (0.83, 0.12), (0.45, 0.91), (0.66, 0.58), (0.09, 0.74), (0.31, 0.05)]
def change(D, t):
    FA = np.array([B.frame(D, p, t) for p in samp])       # rows: points, columns: k
    FB = np.array([B2.frame(D, p, t) for p in samp])
    m, res, rk, sv = np.linalg.lstsq(FA, FB, rcond=None)
    return m.T, np.max(np.abs(FA @ m - FB))
good = True; worst = 0; wres = 0
for name, D in divisors.items():
    m0, r0 = change(D, 0.2)
    good = good and B2.tau(0.2).imag > 0
    for t in [0.5, 0.9]:
        m1, r1 = change(D, t)
        Q = m1 @ np.linalg.inv(m0)
        q = np.trace(Q)/3
        worst = max(worst, np.max(np.abs(Q - q*np.eye(3)))/abs(q))
        wres = max(wres, r0, r1)
report("G1 the two frames span the same space", wres < 1e-6, "worst residual %.1e" % wres)
report("G2 the change of frame is, from one time to another, a number times a constant matrix",
       good and worst < 1e-5, "worst %.1e" % worst)

# ---------------------------------------------------------------- H: the step and R
# A frame of states at rest that the rule leaves unchanged, up to a factor that depends on the
# time alone, is theta_k / Sigma_D.  Two such frames of one space differ, from one time to
# another, by a constant matrix times a number exactly when the two rules agree up to a
# function of the time alone.
def compare(F1, F2, t0, ts):
    def m_at(t):
        A = np.array([F1(p, t) for p in samp]); Bm = np.array([F2(p, t) for p in samp])
        m, *_ = np.linalg.lstsq(A, Bm, rcond=None)
        return m.T, np.max(np.abs(A @ m - Bm))
    m0, r0 = m_at(t0); wq = 0; wr = r0
    for t in ts:
        m1, r1 = m_at(t)
        Q = m1 @ np.linalg.inv(m0); q = np.trace(Q)/3
        wq = max(wq, np.max(np.abs(Q - q*np.eye(3)))/abs(q)); wr = max(wr, r1)
    return wr, wq, m0

def moved(D, perm):          # the divisor with the number of D at P_i put at P_perm(i)
    out = [0, 0, 0, 0]
    for i, a in enumerate(D): out[perm[i]] = a
    return tuple(out)
corner = [np.array(c) for c in [(0, 0), (.5, 0), (0, .5), (.5, .5)]]
def perm_of(A):
    return [next(j for j in range(4) if np.allclose((A @ corner[i] - corner[j]) % 1, 0)) for i in range(4)]
pM, pS = perm_of(M0), perm_of(S)
report("H0 M0 moves P4 to P2, P2 to P3, P3 to P4; S exchanges P2 and P3", pM == [0, 2, 3, 1] and pS == [0, 2, 1, 3])
# The step.  z_{s-L}(M0 p) = z_s(p): the step keeps the coordinate.  It moves the odd corner
# (H0), so the image of D is not one of the five divisors, and its frame is made from the basis
# M0(1,0), M0(0,1), in which the odd corner of the image is again the middle of the cell.  The
# check is that the frame of D at (p, s) is, up to the one factor of Sigma_D, the frame of the image at
# (M0 p, s-L): the step carries the construction to the construction.  That the rule does not
# depend on the basis is the statement of uniqueness, shown by hand; G2 and H2 test it for the
# bases of the two names and for R.
BM = Basis(M0)
wz = wf = 0
for name, D in divisors.items():
    Dt = moved(D, pM)
    for t in [0.2, 0.9]:
        q = None        # Sigma_D is fixed up to one factor at each time; the frames are compared up to it
        for p in samp[:3]:
            wz = max(wz, abs(zs(M0 @ np.array(p), t - L) - zs(p, t)))
            f1 = B.frame(D, p, t); f2 = BM.frame(Dt, M0 @ np.array(p), t - L)
            if q is None: q = f1[0]/f2[0]
            wf = max(wf, np.max(np.abs(f1 - q*f2))/np.max(np.abs(f1)))
report("H1 the step keeps z_s and carries the frame of D to the frame of its image made from the carried basis",
       wz < 1e-12 and wf < 1e-8, "worst %.1e, %.1e" % (wz, wf))
wr = wq = 0
for name, D in divisors.items():
    Dr = moved(D, pS)        # R(p,s) = (Sp, -s)
    r, q, _ = compare(lambda p, t: B.frame(D, p, t),
                      lambda p, t: B.frame(Dr, S @ np.array(p), -t), 0.2, [0.5, 0.9])
    wr = max(wr, r); wq = max(wq, q)
report("H2 R carries the solutions of the rule for D to those for its image, up to a function of the time",
       wr < 1e-6 and wq < 1e-5, "residual %.1e, worst %.1e" % (wr, wq))

# ---------------------------------------------------------------- I: once round the time circle
# At the point with the names (p, s+3L) and (M0^3 p, s) the frame made at the time s+3L from the
# basis (1,0),(0,1) and the frame made at the time s from the same basis and read at M0^3 p
# (which is the frame of the basis M0^-3(1,0), M0^-3(0,1) at s+3L) differ by a matrix.
print("--- once round the time circle (numerical; the matrix is fixed up to one number) ---")
for name, D in divisors.items():
    _, _, m = compare(lambda p, t: B.frame(D, p, t), lambda p, t: B2.frame(D, p, t), 0.2, [0.5])
    ev = np.linalg.eigvals(m)
    ev = ev/ev[np.argmax(np.abs(ev))]
    m4 = np.linalg.matrix_power(m, 4); q4 = np.trace(m4)/3
    m2 = np.linalg.matrix_power(m, 2); q2 = np.trace(m2)/3
    print("%-9s eigenvalue ratios: %s   |m^4 - number*1| = %.1e   |m^2 - number*1| = %.1e"
          % (name, np.round(ev, 6), np.max(np.abs(m4 - q4*np.eye(3)))/abs(q4), np.max(np.abs(m2 - q2*np.eye(3)))/abs(q2)))

# I2: twice round is the fold, up to a number.  I3: the matrix once round, written out.
def fold_matrix(D, t):
    A = np.array([B.frame(D, p, t) for p in samp]); Bm = np.array([B.frame(D, (-p[0], -p[1]), t) for p in samp])
    m, *_ = np.linalg.lstsq(A, Bm, rcond=None)
    return m.T
good = True; worst = 0
for name, D in divisors.items():
    _, _, m = compare(lambda p, t: B.frame(D, p, t), lambda p, t: B2.frame(D, p, t), 0.2, [0.5])
    Pf = fold_matrix(D, 0.2)
    X = np.linalg.matrix_power(m, 2) @ np.linalg.inv(Pf); q = np.trace(X)/3
    worst = max(worst, np.max(np.abs(X - q*np.eye(3)))/abs(q))
    ev = np.linalg.eigvals(m); r = sorted(np.round(np.angle(ev/ev[0])/(math.pi/2)).astype(int) % 4)
    good = good and len(set(r)) == 3 and np.allclose(np.abs(ev/ev[0]), 1, atol=1e-6)
report("I1 once round: three different factors, each a fourth root of one times one common number", good)
report("I2 twice round is the fold, up to a number", worst < 1e-6, "worst %.1e" % worst)
zt = cmath.exp(2j*math.pi/3)
Cm = np.array([[1, zt, zt], [zt**2, zt**2, zt], [zt**2, zt, zt**2]])
worst = 0
for name, D in divisors.items():
    _, _, m = compare(lambda p, t: B.frame(D, p, t), lambda p, t: B2.frame(D, p, t), 0.2, [0.5])
    worst = max(worst, np.max(np.abs(m/m[0, 0] - Cm)))
report("I3 the matrix once round is, up to one number, [[1,z,z],[z^2,z^2,z],[z^2,z,z^2]], z a cube root of one, for each of the five",
       worst < 1e-6, "worst %.1e" % worst)
# Theta_D written out: exp(2 pi i k u) times the product of the series of level one moved to the corners
def th1(u, tau, N=40):
    return sum(cmath.exp(1j*math.pi*n*n*tau + 2j*math.pi*n*u) for n in range(-N, N+1))
kD = {"3P4": 0, "2P1+P4": 1, "2P2+P4": 1, "2P3+P4": 0, "P1+P2+P3": 1}
worst = 0
for name, D in divisors.items():
    for t in [0.2, 0.9]:
        tau = B.tau(t); cs = [-(1+tau)/2, -tau/2, -0.5, 0]
        c, _ = B.sigma_coeffs(D, t)
        rat = []
        for pnt in samp[:4]:
            u = B.u(pnt, t)
            prod = cmath.exp(2j*math.pi*kD[name]*u)
            for a, ci in zip(D, cs): prod *= th1(u - ci, tau)**a
            rat.append(prod/(c @ np.array([B.Theta(j, pnt, t) for j in range(3)])))
        worst = max(worst, max(abs(r/rat[0] - 1) for r in rat))
report("F3 Theta_D is exp(2 pi i k u) times the product of the series of level one moved to the corners", worst < 1e-7, "worst %.1e" % worst)
D = divisors["3P4"]
_, _, m = compare(lambda p, t: B.frame(D, p, t), lambda p, t: B2.frame(D, p, t), 0.2, [0.5])
m = m/m[0, 0] if abs(m[0, 0]) > 1e-9 else m
print("the matrix once round, for the frame theta_0, theta_1, theta_2, divided by its first entry:")
print(np.round(m, 6))
print("the fold in that frame:"); print(np.round(fold_matrix(D, 0.2), 6))

print("ALL PASS" if ok else "SOME FAIL")
sys.exit(0 if ok else 1)
