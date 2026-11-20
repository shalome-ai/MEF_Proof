# Blind numerical check of the algebra for Q1-Q5 (exact truncated-Taylor "jet" arithmetic in (x,y,s), mpmath 30 digits)
import random, cmath, math
# mpmath is not installed on this machine: IEEE double precision (standard library only)
mpf = float; mpc = complex; pi = math.pi; mexp = cmath.exp
class _mp:
    @staticmethod
    def nstr(v, n): return f'{float(v):.3e}'
mp = _mp
I = 1j

class J:
    def __init__(s, c, d): s.c = c; s.d = d
    @staticmethod
    def const(v, d): return J({(0,0,0): mpc(v)}, d)
    @staticmethod
    def var(idx, v0, d):
        k = [0,0,0]; k[idx] = 1
        c = {(0,0,0): mpc(v0)}
        if d >= 1: c[tuple(k)] = mpc(1)
        return J(c, d)
    def __add__(a, b):
        if not isinstance(b, J): b = J.const(b, a.d)
        d = min(a.d, b.d); c = {}
        for k, v in a.c.items():
            if sum(k) <= d: c[k] = v
        for k, v in b.c.items():
            if sum(k) <= d: c[k] = c.get(k, 0) + v
        return J(c, d)
    __radd__ = __add__
    def __neg__(a): return J({k: -v for k, v in a.c.items()}, a.d)
    def __sub__(a, b): return a + (-b if isinstance(b, J) else -mpc(b))
    def __rsub__(a, b): return (-a) + b
    def __mul__(a, b):
        if not isinstance(b, J):
            b = mpc(b); return J({k: v*b for k, v in a.c.items()}, a.d)
        d = min(a.d, b.d); c = {}
        for k1, v1 in a.c.items():
            s1 = sum(k1)
            if s1 > d: continue
            for k2, v2 in b.c.items():
                if s1 + sum(k2) > d: continue
                k = (k1[0]+k2[0], k1[1]+k2[1], k1[2]+k2[2])
                c[k] = c.get(k, 0) + v1*v2
        return J(c, d)
    __rmul__ = __mul__
    def val(a):
        assert a.d >= 0
        return a.c.get((0,0,0), mpc(0))
    def diff(a, idx):
        c = {}
        for k, v in a.c.items():
            if k[idx] > 0:
                kk = list(k); kk[idx] -= 1; c[tuple(kk)] = v*k[idx]
        return J(c, a.d - 1)
    def exp(a):
        c0 = a.val(); dl = a - c0
        res = J.const(1, a.d); term = J.const(1, a.d)
        for n in range(1, a.d + 1):
            term = term*dl*(1.0/n); res = res + term
        return res*mexp(c0)
    def inv(a):
        c0 = a.val(); dl = (a - c0)*(1/c0)
        res = J.const(1, a.d); term = J.const(1, a.d)
        for n in range(1, a.d + 1):
            term = term*dl*(-1); res = res + term
        return res*(1/c0)

class Ctx:
    def __init__(c, kappa, e1, e2, p, s0, d):
        c.kappa = mpf(kappa); c.e1 = e1; c.e2 = e2; c.d = d
        c.x = J.var(0, p[0], d); c.y = J.var(1, p[1], d); c.s = J.var(2, s0, d)
        c.E = (c.s*c.kappa).exp(); c.Ei = (c.s*(-c.kappa)).exp()
        c.z = c.Ei*c.y + I*(c.E*c.x); c.zb = c.Ei*c.y - I*(c.E*c.x)
        c.w1 = c.Ei*e1[1] + I*(c.E*e1[0]); c.w1b = c.Ei*e1[1] - I*(c.E*e1[0])
        c.w2 = c.Ei*e2[1] + I*(c.E*e2[0]); c.w2b = c.Ei*e2[1] - I*(c.E*e2[0])
        c.w1i = c.w1.inv(); c.tau = c.w2*c.w1i
        c.B = c.kappa*(c.zb - c.z*c.w1b*c.w1i)
        c.A = -c.kappa/(6*pi)
    def ds(c, F): return F.diff(2)
    def dz(c, F): return 0.5*(c.E*F.diff(1) - I*(c.Ei*F.diff(0)))
    def dzb(c, F): return 0.5*(c.E*F.diff(1) + I*(c.Ei*F.diff(0)))
    def theta(c, j, N=40):
        res = J.const(0, c.d); u = c.z*c.w1i
        for m in range(-N, N + 1):
            n = mpf(m) + mpf(j)/3
            res = res + (c.tau*(3*pi*I*n*n) + u*(6*pi*I*n)).exp()
        return res
    def L(c, F):
        d1 = c.dz(F)
        return c.ds(F) + c.A*c.dz(d1) + c.B*d1
    def g(c):  # multiplier under p -> p+e2
        return ((c.tau + 2*c.z*c.w1i)*(-3*pi*I)).exp()

rng = random.Random(20261120)
def sample():
    kappa = rng.choice([-1, 1])*rng.uniform(0.3, 1.5)
    s0 = rng.uniform(-0.5, 0.5)
    x1 = rng.choice([-1, 1])*rng.uniform(0.4, 1.0); y1 = rng.choice([-1, 1])*rng.uniform(0.4, 1.0)
    x2 = rng.uniform(-1, 1); y2 = (x2*y1 - 1)/x1       # x2*y1 - x1*y2 = 1  <=> Im(w2 conj w1) = 1
    p = (rng.uniform(-1, 1), rng.uniform(-1, 1))
    return kappa, (mpf(x1), mpf(y1)), (mpf(x2), mpf(y2)), (mpf(p[0]), mpf(p[1])), mpf(s0)

def testG(c):
    x, y, s = c.x, c.y, c.s
    lin = x + 2*(y*s) + 0.5*s
    return (0.3*x - 0.2*y + 0.1*(s*x*y) + 0.25*s).exp() + (lin*lin*lin)*mpc(0.7, 0.2) + (x*y*y)*mpc(0.1, -0.4)

def report(name, n, worst, extra=""):
    print(f"{name}: {n} comparisons, worst error = {mp.nstr(worst, 5)} {extra}")

# ---- T0: setting sanity: area, d_s tau ----
w = mpf(0); w2_ = mpf(0); n0 = 0
for _ in range(20):
    k, e1, e2, p, s0 = sample(); c = Ctx(k, e1, e2, p, s0, 2)
    w = max(w, abs((c.w2*c.w1b).val().imag - 1)); n0 += 1
    w2_ = max(w2_, abs((c.ds(c.tau) - 2*I*c.kappa*c.w1i*c.w1i).val()))
    assert c.tau.val().imag > 0
report("T0a area Im(w2 conj w1)=1", n0, w)
report("T0b d_s tau = 2 i kappa / w1^2", n0, w2_)

# ---- T1: Q1 ----
wa = wb = wc = wd = mpf(0); n1 = 0
for _ in range(20):
    k, e1, e2, p, s0 = sample(); c = Ctx(k, e1, e2, p, s0, 3)
    wa = max(wa, abs((c.ds(c.z) + c.kappa*c.zb).val()), abs((c.ds(c.zb) + c.kappa*c.z).val()))
    wd = max(wd, abs(c.dz(c.z).val() - 1), abs(c.dzb(c.z).val()), abs(c.dz(c.zb).val()), abs(c.dzb(c.zb).val() - 1))
    G = testG(c)
    wb = max(wb, abs((c.ds(c.dzb(G)) - c.dzb(c.ds(G)) - c.kappa*c.dz(G)).val()))
    wc = max(wc, abs((c.ds(c.dz(G)) - c.dz(c.ds(G)) - c.kappa*c.dzb(G)).val()))
    n1 += 1
report("T1a d_s z = -kappa zbar (and conj)", n1, wa)
report("T1b Wirtinger normalisation dz z=1, dzb z=0", n1, wd)
report("T1c [d_s,d_zbar] G = kappa d_z G (non-holomorphic test G)", n1, wb)
report("T1d [d_s,d_z] G = kappa d_zbar G", n1, wc)

# ---- T2: Q2: L theta_j = 0 ----
wabs = wrel = mpf(0); n2 = 0; wneg = mpf(10); whol = mpf(0)
for _ in range(12):
    k, e1, e2, p, s0 = sample(); c = Ctx(k, e1, e2, p, s0, 2)
    for j in range(3):
        th = c.theta(j)
        d1 = c.dz(th); t1 = c.ds(th).val(); t2 = (c.A*c.dz(d1)).val(); t3 = (c.B*d1).val()
        scale = abs(t1) + abs(t2) + abs(t3)
        wabs = max(wabs, abs(t1 + t2 + t3)); wrel = max(wrel, abs(t1 + t2 + t3)/scale)
        wneg = min(wneg, abs(t1 + t2 - t3)/scale)   # power check: wrong sign of B
        whol = max(whol, abs(c.dzb(th).val())/abs(th.val()))
        n2 += 1
report("T2a (d_s + A dz^2 + B dz) theta_j = 0, absolute", n2, wabs)
report("T2b same, relative to sum of |terms|", n2, wrel)
report("T2c power check: with B -> -B the smallest relative residual is", n2, wneg, "(not small)")
report("T2d d_zbar theta_j / theta_j", n2, whol)

# ---- T3: Q2 uniqueness: Wronskian in z nonzero at sampled points; count zeros per cell ----
def thder(u, tau, j, k, N=40):
    tot = 0j
    for m in range(-N, N + 1):
        n = m + j/3
        tot += (6j*math.pi*n)**k*cmath.exp(3j*math.pi*n*n*tau + 6j*math.pi*n*u)
    return tot
def wron(u, tau):
    M = [[thder(u, tau, j, k) for j in range(3)] for k in range(3)]
    return (M[0][0]*(M[1][1]*M[2][2] - M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2] - M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1] - M[1][1]*M[2][0]))
counts = []
for _ in range(4):
    k, e1, e2, p, s0 = sample(); c = Ctx(k, e1, e2, p, s0, 0)
    tau = complex(c.tau.val()); a = complex(0.137, 0.071*tau.imag)
    M = 600; pts = []
    for t in range(M): pts.append(a + t/M)
    for t in range(M): pts.append(a + 1 + tau*t/M)
    for t in range(M): pts.append(a + 1 + tau - t/M)
    for t in range(M): pts.append(a + tau - tau*t/M)
    vals = [wron(u, tau) for u in pts]
    tot = 0.0; maxstep = 0.0
    for i in range(len(vals)):
        dphi = cmath.phase(vals[(i + 1) % len(vals)]/vals[i]); tot += dphi; maxstep = max(maxstep, abs(dphi))
    counts.append((round(tot/(2*math.pi), 6), round(maxstep, 3), tau))
print("T3 number of zeros of the Wronskian W(theta_0,theta_1,theta_2) in one period cell (winding number, max phase step, tau):")
for cc in counts: print("    ", cc)
# zeros at the 3-torsion-type points?  test W at u = (a + b tau)/3 + shift candidates
k, e1, e2, p, s0 = sample(); c = Ctx(k, e1, e2, p, s0, 0); tau = complex(c.tau.val())
ref = max(abs(wron(complex(0.21, 0.13) + 0.1*i, tau)) for i in range(5))
best = {}
for sh in [0, 0.5, tau/2, (1 + tau)/2, 1/6, tau/6, (1 + tau)/6]:
    best[str(sh)] = max(abs(wron(sh + (a_ + b_*tau)/3, tau)) for a_ in range(3) for b_ in range(3))/ref
print("T3b max |W| over the 9 points shift+(a+b tau)/3, relative to generic |W|:", {k_: f"{v:.2e}" for k_, v in best.items()})

# ---- T4: Q3: [L, d_zbar] = 0 on non-holomorphic G ----
w4 = mpf(0); w4rel = mpf(0); n4 = 0; w4pow = mpf(10)
for _ in range(10):
    k, e1, e2, p, s0 = sample(); c = Ctx(k, e1, e2, p, s0, 5)
    G = testG(c); a = c.L(c.dzb(G)).val(); b = c.dzb(c.L(G)).val()
    w4 = max(w4, abs(a - b)); w4rel = max(w4rel, abs(a - b)/(abs(a) + abs(b)))
    # power: d_s + A dz^2 alone (drop B) does not commute
    H = c.dzb(G); a2 = (c.ds(H) + c.A*c.dz(c.dz(H))).val(); b2 = c.dzb(c.ds(G) + c.A*c.dz(c.dz(G))).val()
    w4pow = min(w4pow, abs(a2 - b2)/(abs(a2) + abs(b2)))
    n4 += 1
report("T4a [L,d_zbar] G = 0, absolute", n4, w4)
report("T4b same, relative", n4, w4rel)
report("T4c power check: dropping B, smallest relative commutator residual", n4, w4pow, "(not small)")

# ---- T5: L preserves X (non-holomorphic element F = theta_0 * phi, phi doubly periodic) ----
def Fx(c):
    e1, e2 = c.e1, c.e2
    det = e1[0]*e2[1] - e1[1]*e2[0]
    al = (c.x*e2[1] - c.y*e2[0])*(1/det); be = (c.y*e1[0] - c.x*e1[1])*(1/det)   # p = al e1 + be e2
    ea = (al*(2*pi*I)).exp(); eb = (be*(2*pi*I)).exp()
    phi = (0.3*ea + 0.2*(eb*(1 + 0.5*c.s)) + 0.1*(ea*eb).inv()).exp()
    return c.theta(0)*phi + 0.5*c.theta(2)*(eb.inv())
w5 = [mpf(0)]*6; n5 = 0; w5pow = mpf(10)
for _ in range(6):
    k, e1, e2, p, s0 = sample()
    c0 = Ctx(k, e1, e2, p, s0, 2)
    c1 = Ctx(k, e1, e2, (p[0] + e1[0], p[1] + e1[1]), s0, 2)
    c2 = Ctx(k, e1, e2, (p[0] + e2[0], p[1] + e2[1]), s0, 2)
    F0, F1, F2 = Fx(c0), Fx(c1), Fx(c2); g = c0.g().val()
    f0 = F0.val()
    w5[0] = max(w5[0], abs(F1.val() - f0)/abs(f0)); w5[1] = max(w5[1], abs(F2.val() - g*f0)/abs(g*f0))
    l0, l1, l2 = c0.L(F0).val(), c1.L(F1).val(), c2.L(F2).val()
    w5[2] = max(w5[2], abs(l1 - l0)/abs(l0)); w5[3] = max(w5[3], abs(l2 - g*l0)/abs(g*l0))
    d0, d2 = c0.dz(F0).val(), c2.dz(F2).val()
    w5pow = min(w5pow, abs(d2 - g*d0)/abs(g*d0))
    h = -6*pi*I*c0.w1i.val()
    w5[4] = max(w5[4], abs(d2 - g*(d0 + h*f0))/abs(g*d0))
    w5[5] = max(w5[5], abs(c0.dzb(F0).val())/abs(f0))
    n5 += 1
report("T5a F(p+e1)=F(p) for the test element of X (relative)", n5, w5[0])
report("T5b F(p+e2)=g F(p) (relative)", n5, w5[1])
report("T5c (LF)(p+e1)=(LF)(p) (relative)", n5, w5[2])
report("T5d (LF)(p+e2)=g (LF)(p) (relative)", n5, w5[3])
report("T5e (d_z F)(p+e2) = g (d_z F - (6 pi i/w1) F)(p) (relative)", n5, w5[4])
report("T5f power: (d_z F)(p+e2) vs g d_z F(p), smallest relative gap", n5, w5pow, "(not small: d_z alone does not preserve X)")
print("     test element is not holomorphic: max |d_zbar F|/|F| =", mp.nstr(w5[5], 5))

# ---- T6: Q5 ----
w6 = mpf(0); w6b = mpf(0); n6 = 0; w6c = mpf(10)
for _ in range(8):
    k, e1, e2, p, s0 = sample(); c = Ctx(k, e1, e2, p, s0, 3)
    w6 = max(w6, abs(c.dzb(c.ds(c.z)).val() + c.kappa))
    for j in range(3):
        th = c.theta(j, N=30)
        lhs = c.dzb(c.ds(th)).val(); rhs = (-c.kappa*c.dz(th)).val()
        w6b = max(w6b, abs(lhs - rhs)/abs(rhs)); n6 += 1
    t0, t1 = c.theta(0, N=30), c.theta(1, N=30)
    w6c = min(w6c, abs((c.dz(t0)*t1 - c.dz(t1)*t0).val())/(abs(t0.val())*abs(c.dz(t1).val())))
report("T6a d_zbar(d_s z) = -kappa", 8, w6)
report("T6b d_zbar(d_s theta_j) = -kappa d_z theta_j (relative)", n6, w6b)
report("T6c theta_0' theta_1 - theta_1' theta_0 (relative size), smallest", 8, w6c, "(not zero)")
