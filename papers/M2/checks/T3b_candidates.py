#!/usr/bin/env python3
"""T3b_candidates.py -- chat C14, card T3b (Decision Log P303).

The test of the card, said before it was run: at least one candidate with a rule along
time in it has a solution other than zero on the whole of Y and meets M2-W165 and M2-W214.

What this script checks, and how:
  P  the proof that the matrix once round the time circle is C (M2-W244(iii); M2-W236(iii) when the script was written):
     P1 (numerical)  the maps U, V on the series: U theta_j = zeta^j theta_j, V theta_j = theta_{j+1}.
     P2 (numerical)  W_a W_b = e(3 a1 b2) W_{a+b}, on a function that is not special.
     P3 (numerical)  W_b (g X'oA) = ph(b) g (W'_{Ab} X')oA, on a function that is not special.
     P4 (exact)      the whole numbers: the inverse of M0^3, the two even entries, the residues,
                     and that the two rules for the matrix give the table of C and no other.
     P5 (numerical)  g theta_k(Ap, s-3L) = c sum_l C_kl theta_l(p, s), one number c for k = 0,1,2.
     P6 (numerical)  for each of the five divisors, g Theta_D(Ap, s-3L) / Theta_D(p, s) is the same
                     at every point of the fibre, and f_k(Ap, s-3L) = xi sum_l C_kl f_l(p, s).
  D  the operation along the fibre used to write solutions:
     D1 (exact)      on all monomials z^a zbar^b, a+b <= 4, in an algebra of polynomials with the
                     rules d_s z = -kappa zbar, d_s varpi_2 = -kappa conj(varpi_2):
                     [d_zbar, N] = -3 pi;  [H, N] = kappa d_zbar;  [H, d_zbar] = 0;
                     H = d_s + W - (kappa/6 pi) N^2.
     D2 (numerical)  G_t = theta_j(z+t) exp(3 pi t (rho z - zbar) + (3 pi/2) rho t^2):
                     the two rules of the set XX; d_zbar G_t = -3 pi t G_t; d_t G_t = N G_t;
                     (H + (3 pi kappa/2) t^2) G_t = 0.
     D3 (numerical)  the two names: g G'_t,k (Ap, s-3L) = c sum_l C_kl G_t,l (p, s), the c of P5.
     D4 (numerical)  the fold: G_t[theta_j](-p) = G_{-t}[theta_{-j}](p).
  S  the list:
     S1 (exact)      fifteen terms span a space of dimension fourteen.
     S2 (numerical)  the rows alpha with alpha C = mu alpha, and the ratios of the three mu.

Names: N is the operation written $\mathcal{N}$ in the write-up log on the set XX, and
$\mathcal{N}_{D}$ on sections of the twist; varpi1 = z_s(0,1), varpi2 = z_s(1,0) as in M2-W221.
The numerical checks are at sample points and are not proofs.  L = 1.
"""
import cmath, math, sys, itertools
from fractions import Fraction as Fr
import numpy as np
ok = True
def report(name, cond, extra=""):
    global ok
    ok = ok and bool(cond)
    print(("PASS " if cond else "FAIL ") + name + (("  " + extra) if extra else ""))

phi = (1 + math.sqrt(5))/2
kap = math.log(phi**2)
v1 = np.array([phi, 1.0])/math.sqrt(phi**2 + 1)
v2 = np.array([v1[1], -v1[0]])
pi = math.pi
def e(x): return cmath.exp(2j*pi*x)
zeta = e(1/3)
def zs(p, s):
    p = np.asarray(p, dtype=float)
    return math.exp(-kap*s)*(p @ v2) + 1j*math.exp(kap*s)*(p @ v1)
def basis(s): return zs((0, 1), s), zs((1, 0), s)        # varpi1, varpi2
def nterms(a, b):
    """the least N with exp(-a n^2 + b n) < 1e-18 for n > N (a > 0, b >= 0), plus a margin."""
    return int((b + math.sqrt(b*b + 4*a*42))/(2*a)) + 4
def th(j, z, s):
    w1, w2 = basis(s); ups = w1/w2; u = z/w2
    N = nterms(3*pi*ups.imag, 6*pi*abs(u.imag))
    return sum(cmath.exp(3j*pi*(m + j/3)**2*ups + 6j*pi*(m + j/3)*u) for m in range(-N, N+1))
def th1(u, ups):
    N = nterms(pi*ups.imag, 2*pi*abs(u.imag))
    return sum(cmath.exp(1j*pi*m*m*ups + 2j*pi*m*u) for m in range(-N, N+1))
DIV = {"3P4": (0, 0, 0, 3), "2P1+P4": (2, 0, 0, 1), "2P2+P4": (0, 2, 0, 1), "2P3+P4": (0, 0, 2, 1), "P1+P2+P3": (1, 1, 1, 0)}
KD = {"3P4": 0, "2P1+P4": 1, "2P2+P4": 1, "2P3+P4": 0, "P1+P2+P3": 1}
def ThetaD(name, z, s):
    w1, w2 = basis(s); ups = w1/w2; u = z/w2
    us = [-(1 + ups)/2, -ups/2, -0.5, 0.0]
    out = cmath.exp(2j*pi*KD[name]*u)
    for a, ui in zip(DIV[name], us): out *= th1(u - ui, ups)**a
    return out
A = np.array([[13, 8], [8, 5]]); Q = np.array([[5, -8], [-8, 13]])
C = [[1, zeta, zeta], [zeta**2, zeta**2, zeta], [zeta**2, zeta, zeta**2]]
EXP = [[0, 1, 1], [2, 2, 1], [2, 1, 2]]                    # C_kl = zeta^EXP[k][l]
pts = [np.array([0.13, 0.27]), np.array([-0.31, 0.44]), np.array([0.52, -0.19])]
times = [0.2, 0.71, -0.4]

# ------------------------------------------------------------------ P1, P2, P3
def Wop(a, F, s):
    """(W_a F)(p) = e(3 a2^2 ups/2 + 3 a2 u(p)) F(p + a), for the basis of the time s."""
    w1, w2 = basis(s); ups = w1/w2
    return lambda p: e(1.5*a[1]**2*ups + 3*a[1]*zs(p, s)/w2)*F(np.asarray(p) + np.asarray(a))
worst = 0
for s in times:
    for j in range(3):
        F = lambda p, j=j, s=s: th(j, zs(p, s), s)
        for p in pts:
            worst = max(worst, abs(Wop((1/3, 0), F, s)(p) - zeta**j*F(p)),
                        abs(Wop((0, 1/3), F, s)(p) - th((j+1) % 3, zs(p, s), s)),
                        abs(Wop((1, 0), F, s)(p) - F(p)), abs(Wop((0, 1), F, s)(p) - F(p)))
report("P1 U theta_j = zeta^j theta_j, V theta_j = theta_{j+1}, W_(1,0) = W_(0,1) = 1 on the series", worst < 1e-9, "worst %.1e" % worst)
gen = lambda p: cmath.exp((0.3 + 0.2j)*p[0] - (0.25 - 0.1j)*p[1]) + 0.4*math.cos(1.3*p[0]*p[1])
worst = 0
for (a, b) in [((0.37, -0.21), (0.11, 0.63)), ((-1.2, 0.4), (0.5, -0.8))]:
    for p in pts:
        s = 0.2
        lhs = Wop(a, Wop(b, gen, s), s)(p)
        rhs = e(3*a[0]*b[1])*Wop((a[0]+b[0], a[1]+b[1]), gen, s)(p)
        worst = max(worst, abs(lhs - rhs)/abs(rhs))
report("P2 W_a W_b = e(3 a1 b2) W_{a+b}", worst < 1e-10, "worst %.1e" % worst)
def gfun(p, s):
    w1, w2 = basis(s); ups = w1/w2; u = zs(p, s)/w2
    return cmath.exp(-3j*pi*Q[1, 0]*u*u/(Q[0, 0] + Q[1, 0]*ups))
def ph(b):
    return e(-1.5*(Q[1, 0]*Q[1, 1]*b[0]**2 - 2*Q[1, 0]*Q[0, 1]*b[0]*b[1] + Q[0, 0]*Q[0, 1]*b[1]**2))
genz = lambda z: cmath.exp((0.2 - 0.3j)*z + 0.1*z.conjugate()) + 0.3*math.cos(abs(z))   # a function of the place
worst = 0
for s in times:
    w1p, w2p = basis(s - 3); upsp = w1p/w2p
    Y = lambda p, s=s: gfun(p, s)*genz(zs(p, s))
    for b in [(0.37, -0.21), (1/3, 0), (5/3, -8/3), (-8/3, 13/3), (2.0, -1.0)]:
        ap = A @ np.array(b)
        for p in pts:
            z = zs(p, s)
            rhs = ph(b)*gfun(p, s)*e(1.5*ap[1]**2*upsp + 3*ap[1]*z/w2p)*genz(z + zs(b, s))
            worst = max(worst, abs(Wop(b, Y, s)(p) - rhs)/abs(rhs))
report("P3 W_b (g X'oA) = ph(b) g (W'_{Ab} X')oA", worst < 1e-8, "worst %.1e" % worst)

# ------------------------------------------------------------------ P4 (exact)
good = (A @ Q == np.eye(2, dtype=int)).all() and Q[0, 1] % 2 == 0 and Q[1, 0] % 2 == 0
good = good and (-Q[0, 0]*Q[1, 0]) == 40 and 40 % 6 == 4 and (-Q[0, 1]*Q[1, 1]) == 104 and 104 % 6 == 2
# b = Q(1/3,0) = (5/3,-8/3): W_b = zeta^{-mn} U^m V^n with m = 5, n = -8;  b = Q(0,1/3) = (-8/3,13/3): m = -8, n = 13
good = good and (-(5*-8)) % 3 == 1 and 5 % 3 == 2 and (-8) % 3 == 1 and (-(-8*13)) % 3 == 2 and 13 % 3 == 1
# the two rules: C_{k,m} = zeta^{2m-k-1} C_{k,m-1};  C_{k+1,m} = zeta^{m+1} C_{k,m-1}
rules = all((EXP[k][m] - EXP[k][(m-1) % 3] - (2*m - k - 1)) % 3 == 0 and
            (EXP[(k+1) % 3][m] - EXP[k][(m-1) % 3] - (m + 1)) % 3 == 0 for k in range(3) for m in range(3))
T = [[None]*3 for _ in range(3)]; T[0][0] = 0                # the table made from the rules alone
for m in (1, 2): T[0][m] = (T[0][m-1] + 2*m - 0 - 1) % 3
for k in (0, 1):
    for m in range(3): T[k+1][m] = (T[k][(m-1) % 3] + m + 1) % 3
report("P4 the whole numbers; the two rules hold for the table of C and give no other table", good and rules and T == EXP)

# ------------------------------------------------------------------ P5, P6
worst = 0; cs = {}
for s in times:
    vals = []
    for p in pts:
        z = zs(p, s)
        for k in range(3):
            vals.append(gfun(p, s)*th(k, z, s - 3)/sum(C[k][l]*th(l, z, s) for l in range(3)))
    cs[s] = vals[0]
    worst = max(worst, max(abs(v - vals[0])/abs(vals[0]) for v in vals))
report("P5 g theta_k(Ap, s-3L) = c sum_l C_kl theta_l(p, s), one c for the three k and every point", worst < 1e-8, "worst %.1e" % worst)
worst = 0
for name in DIV:
    for s in times:
        r = [gfun(p, s)*ThetaD(name, zs(p, s), s - 3)/ThetaD(name, zs(p, s), s) for p in pts]
        worst = max(worst, max(abs(x - r[0])/abs(r[0]) for x in r))
        xi = None
        for p in pts:
            z = zs(p, s)
            for k in range(3):
                lhs = th(k, z, s - 3)/ThetaD(name, z, s - 3)
                rhs = sum(C[k][l]*th(l, z, s) for l in range(3))/ThetaD(name, z, s)
                xi = lhs/rhs if xi is None else xi
                worst = max(worst, abs(lhs/rhs - xi)/abs(xi))
report("P6 the five divisors: g Theta_D(Ap, s-3L)/Theta_D(p, s) constant on the fibre; f_k(Ap, s-3L) = xi sum C_kl f_l(p, s)", worst < 1e-7, "worst %.1e" % worst)

# ------------------------------------------------------------------ D1 (exact)
# polynomials in z, zb, w (= varpi_2, whole powers, negative allowed), wb, pi, kappa with coefficients in Q[i].
# a polynomial is a dict {(ez, ezb, ew, ewb, epi, ek): (re, im)} with Fractions.
def padd(P, R, c=(Fr(1), Fr(0))):
    out = dict(P)
    for m, (a, b) in R.items():
        x, y = out.get(m, (Fr(0), Fr(0)))
        na, nb = x + a*c[0] - b*c[1], y + a*c[1] + b*c[0]
        if na == 0 and nb == 0: out.pop(m, None)
        else: out[m] = (na, nb)
    return out
def pmul(P, R):
    out = {}
    for m, (a, b) in P.items():
        for n, (c, d) in R.items():
            out = padd(out, {tuple(i + j for i, j in zip(m, n)): (a*c - b*d, a*d + b*c)})
    return out
def mono(*ex, c=(1, 0)): return {tuple(ex): (Fr(c[0]), Fr(c[1]))}
def dvar(P, i):
    out = {}
    for m, (a, b) in P.items():
        if m[i] != 0:
            n = list(m); n[i] -= 1
            out = padd(out, {tuple(n): (a*m[i], b*m[i])})
    return out
Z, ZB, W_, WB, PI, K = (mono(*[1 if i == j else 0 for i in range(6)]) for j in range(6))
WINV = mono(0, 0, -1, 0, 0, 0)
def scal(P, re, im=0): return padd({}, P, (Fr(re), Fr(im)))
dz = lambda P: dvar(P, 0)
dzb = lambda P: dvar(P, 1)
def ds(P):      # at a fixed point: z -> -k zb, zb -> -k z, w -> -k wb, wb -> -k w
    out = pmul(pmul(dvar(P, 0), ZB), scal(K, -1))
    out = padd(out, pmul(pmul(dvar(P, 1), Z), scal(K, -1)))
    out = padd(out, pmul(pmul(dvar(P, 2), WB), scal(K, -1)))
    out = padd(out, pmul(pmul(dvar(P, 3), W_), scal(K, -1)))
    return out
RHO = pmul(WB, WINV)
BETA = scal(pmul(PI, padd(pmul(Z, RHO), ZB, (Fr(-1), Fr(0)))), 3)          # 3 pi (z rho - zb)
GAM = pmul(K, padd(pmul(Z, RHO), ZB, (Fr(-1), Fr(0))))                     # kappa (z rho - zb)
SIXPI_INV = mono(0, 0, 0, 0, -1, 0, c=(Fr(1, 6), 0))
Nop = lambda P: padd(dz(P), pmul(BETA, P))
Hop = lambda P: padd(padd(ds(P), scal(pmul(pmul(K, SIXPI_INV), dz(dz(P))), -1)), scal(pmul(GAM, dz(P)), -1))
Wfun = pmul(pmul(K, SIXPI_INV), padd(pmul(BETA, BETA), scal(pmul(PI, RHO), 3)))
good = True
for a in range(5):
    for b in range(5 - a):
        P = mono(a, b, 0, 0, 0, 0)
        c1 = padd(padd(dzb(Nop(P)), Nop(dzb(P)), (Fr(-1), Fr(0))), scal(pmul(PI, P), 3))            # [dzb,N] + 3 pi
        c2 = padd(padd(Hop(Nop(P)), Nop(Hop(P)), (Fr(-1), Fr(0))), scal(pmul(K, dzb(P)), -1))       # [H,N] - k dzb
        c3 = padd(Hop(dzb(P)), dzb(Hop(P)), (Fr(-1), Fr(0)))                                        # [H,dzb]
        alt = padd(padd(ds(P), pmul(Wfun, P)), scal(pmul(pmul(K, SIXPI_INV), Nop(Nop(P))), -1))     # d_s + W - (k/6pi) N^2
        c4 = padd(Hop(P), alt, (Fr(-1), Fr(0)))
        good = good and not c1 and not c2 and not c3 and not c4
report("D1 [d_zbar,N] = -3 pi; [H,N] = kappa d_zbar; [H,d_zbar] = 0; H = d_s + W - (kappa/6pi) N^2 (exact, monomials of degree <= 4)", good)

# ------------------------------------------------------------------ D2, D3, D4
def G(t, j, z, zb, s):
    w1, w2 = basis(s); rho = w2.conjugate()/w2
    return th(j, z + t, s)*cmath.exp(3*pi*t*(rho*z - zb) + 1.5*pi*rho*t*t)
h = 2e-3
def fd(F, X, i):
    ee = np.zeros(3); ee[i] = h
    return (-F(X + 2*ee) + 8*F(X + ee) - 8*F(X - ee) + F(X - 2*ee))/(12*h)
zX = lambda X: math.exp(-kap*X[2])*X[1] + 1j*math.exp(kap*X[2])*X[0]
Dzb = lambda F: (lambda X: (math.exp(kap*X[2])*fd(F, X, 1) + 1j*math.exp(-kap*X[2])*fd(F, X, 0))/2)
Dz = lambda F: (lambda X: (math.exp(kap*X[2])*fd(F, X, 1) - 1j*math.exp(-kap*X[2])*fd(F, X, 0))/2)
Ds = lambda F: (lambda X: fd(F, X, 2))
def Hnum(F):
    def out(X):
        w1, w2 = basis(X[2]); z = zX(X)
        return Ds(F)(X) - kap/(6*pi)*Dz(Dz(F))(X) - kap*(z*w2.conjugate()/w2 - z.conjugate())*Dz(F)(X)
    return out
worst_q = worst_b = worst_t = worst_h = 0
for t in [0.3 - 0.2j, -0.5 + 0.1j]:
    for j in range(3):
        for s in [0.2, -0.4]:
            w1, w2 = basis(s); ups = w1/w2
            for p in pts:
                z = zs(p, s)
                g0 = G(t, j, z, z.conjugate(), s)
                # the two rules are tested at points with p2 near -1/2, so that the point and its
                # image under p -> p+(0,1) lie at the same distance from the real axis of u and the
                # series is summed without loss of digits at both
                zq = zs((p[0], -0.5 + 0.1*p[1]), s); gq = G(t, j, zq, zq.conjugate(), s)
                z1 = zq + w2; z2 = zq + w1
                worst_q = max(worst_q, abs(G(t, j, z1, z1.conjugate(), s) - gq)/abs(gq),
                              abs(G(t, j, z2, z2.conjugate(), s) - cmath.exp(-3j*pi*(ups + 2*zq/w2))*gq)/abs(gq))
                dt = 1e-4
                dG = (G(t + dt, j, z, z.conjugate(), s) - G(t - dt, j, z, z.conjugate(), s))/(2*dt)
                X0 = np.array([p @ v1, p @ v2, s])
                F = lambda X, t=t, j=j: G(t, j, zX(X), zX(X).conjugate(), X[2])
                rho = w2.conjugate()/w2
                NG = Dz(F)(X0) + 3*pi*(rho*z - z.conjugate())*g0
                worst_t = max(worst_t, abs(dG - NG)/abs(g0))
                worst_b = max(worst_b, abs(Dzb(F)(X0) + 3*pi*t*g0)/abs(g0))
                worst_h = max(worst_h, abs(Hnum(F)(X0) + 1.5*pi*kap*t*t*g0)/abs(g0))
report("D2a G_t obeys the two rules of the set XX", worst_q < 1e-9, "worst %.1e" % worst_q)
report("D2b d_zbar G_t = -3 pi t G_t and d_t G_t = N G_t", worst_b < 1e-5 and worst_t < 1e-5, "worst %.1e, %.1e" % (worst_b, worst_t))
report("D2c (H + (3 pi kappa/2) t^2) G_t = 0", worst_h < 1e-4, "worst %.1e (finite differences, step %.0e)" % (worst_h, h))
worst = 0
for t in [0.3 - 0.2j, -0.5 + 0.1j]:
    for s in times:
        for p in pts:
            z = zs(p, s)
            for k in range(3):
                lhs = gfun(p, s)*G(t, k, z, z.conjugate(), s - 3)
                rhs = cs[s]*sum(C[k][l]*G(t, l, z, z.conjugate(), s) for l in range(3))
                worst = max(worst, abs(lhs - rhs)/abs(rhs))
report("D3 the two names: g G'_t,k(Ap, s-3L) = c sum_l C_kl G_t,l(p, s), with the c of P5", worst < 1e-7, "worst %.1e" % worst)
worst = 0
for t in [0.3 - 0.2j]:
    for j in range(3):
        for p in pts:
            z = zs(p, 0.2)
            worst = max(worst, abs(G(t, j, -z, -z.conjugate(), 0.2) - G(-t, (-j) % 3, z, z.conjugate(), 0.2)))
report("D4 the fold: G_t[theta_j](-p) = G_{-t}[theta_{-j}](p)", worst < 1e-9, "worst %.1e" % worst)

# ------------------------------------------------------------------ S1 (exact), S2
forms = ["p1", "p2", "dS p1", "dS p2", "dB p1", "dB p2", "dzb p2", "dzb dS p2", "dzb dB p2", "dzb del p1", "dzb del p2", "T p1", "T p2", "dzb T p2"]
def vec(d): return [Fr(d.get(f, 0)) for f in forms]
terms = [vec({"p1": 1, "dzb p2": 1}), vec({"p1": 1}), vec({"p2": 1}),
         vec({"dS p1": 1, "dzb dS p2": -1}), vec({"dS p1": 1}), vec({"dS p2": 1}),
         vec({"dB p1": 1, "dzb dB p2": -1}), vec({"dB p1": 1}), vec({"dB p2": 1}),
         vec({"dzb del p1": 1}), vec({"dzb del p1": 1}), vec({"dzb del p2": 1}),
         vec({"T p1": 1, "dzb T p2": 1}), vec({"T p1": 1}), vec({"T p2": 1})]
def rank(M):
    M = [r[:] for r in M]; rk = 0
    for c in range(len(M[0])):
        piv = next((i for i in range(rk, len(M)) if M[i][c] != 0), None)
        if piv is None: continue
        M[rk], M[piv] = M[piv], M[rk]
        for i in range(len(M)):
            if i != rk and M[i][c] != 0:
                f = M[i][c]/M[rk][c]; M[i] = [a - f*b for a, b in zip(M[i], M[rk])]
        rk += 1
    return rk
report("S1 fifteen terms, fourteen forms, rank fourteen; the twelve old terms have rank eleven", len(terms) == 15 and rank(terms) == 14 and rank(terms[:12]) == 11)
Cm = np.array(C)
r3 = math.sqrt(3)
rows = {r3: np.array([1 + r3, zeta, zeta]), -r3: np.array([1 - r3, zeta, zeta]), -1j*r3: np.array([0, 1, -1])}
good = all(np.allclose(a @ Cm, mu*a) for mu, a in rows.items())
good = good and abs((-r3)/r3 + 1) < 1e-12 and abs((-1j*r3)/r3 + 1j) < 1e-12
report("S2 the rows with alpha C = mu alpha for mu = sqrt3, -sqrt3, -i sqrt3; the ratios of the mu are -1 and -i", good)

print("ALL PASS" if ok else "SOME FAIL")
sys.exit(0 if ok else 1)
