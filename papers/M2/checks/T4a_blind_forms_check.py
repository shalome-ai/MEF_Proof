# Blind check: differential forms on T x S^3 (x passive B). Standard library only.
import random, itertools
random.seed(20261120)
TOL = 1e-9

class Poly:
    def __init__(s, d=None): s.d = {k: v for k, v in (d or {}).items() if abs(v) > TOL}
    def __add__(s, o):
        r = dict(s.d)
        for k, v in o.d.items(): r[k] = r.get(k, 0) + v
        return Poly(r)
    def __neg__(s): return Poly({k: -v for k, v in s.d.items()})
    def __sub__(s, o): return s + (-o)
    def __mul__(s, o):
        if not isinstance(o, Poly): return Poly({k: v * o for k, v in s.d.items()})
        r = {}
        for k1, v1 in s.d.items():
            for k2, v2 in o.d.items():
                k = tuple(a + b for a, b in zip(k1, k2)); r[k] = r.get(k, 0) + v1 * v2
        return Poly(r)
    __rmul__ = __mul__
    def deriv(s, i):
        r = {}
        for k, v in s.d.items():
            if k[i]:
                kk = list(k); kk[i] -= 1; r[tuple(kk)] = r.get(tuple(kk), 0) + v * k[i]
        return Poly(r)
    def zero(s): return not s.d
    def __repr__(s): return repr(s.d) if s.d else '0'

def var(i): return Poly({tuple(1 if j == i else 0 for j in range(4)): 1})
x = [var(i) for i in range(4)]
ONE = Poly({(0, 0, 0, 0): 1})
R2 = x[0]*x[0] + x[1]*x[1] + x[2]*x[2] + x[3]*x[3]

# q = x0 + x1 i + x2 j + x3 k.  e_a(q) = q*i, q*j, q*k  (hand-multiplied; re-derived below by qmul)
def qmul(p, q):
    a0,a1,a2,a3 = p; b0,b1,b2,b3 = q
    return [a0*b0 - a1*b1 - a2*b2 - a3*b3,
            a0*b1 + a1*b0 + a2*b3 - a3*b2,
            a0*b2 - a1*b3 + a2*b0 + a3*b1,
            a0*b3 + a1*b2 - a2*b1 + a3*b0]
Z = Poly()
units = {1: [Z, ONE, Z, Z], 2: [Z, Z, ONE, Z], 3: [Z, Z, Z, ONE]}
E = {a: qmul(x, units[a]) for a in (1, 2, 3)}
print("e_1 =", E[1]); print("e_2 =", E[2]); print("e_3 =", E[3])

def vf(a, f):
    r = Poly()
    for k in range(4): r = r + E[a][k] * f.deriv(k)
    return r
def rpoly(deg=3, n=6):
    r = {}
    for _ in range(n):
        m = [0]*4
        for _ in range(random.randint(0, deg)): m[random.randrange(4)] += 1
        r[tuple(m)] = complex(random.randint(-3, 3), random.randint(-3, 3))
    return Poly(r)

print("\n== Q1: brackets and structure constants ==")
C = {}
for a, b in ((1, 2), (2, 3), (3, 1)):
    br = [Poly() for _ in range(4)]
    for k in range(4):
        br[k] = vf(a, E[b][k]) - vf(b, E[a][k])     # [e_a,e_b]^k = e_a(e_b^k) - e_b(e_a^k)
    c = 6 - a - b
    ok = all((br[k] - 2 * E[c][k]).zero() for k in range(4))
    print(f"[e_{a},e_{b}] = 2 e_{c}:", ok)
    C[(a, b)] = (c, 2)
for a in (1, 2, 3):
    div = Poly()
    for k in range(4): div = div + E[a][k].deriv(k)
    tang = Poly()
    for k in range(4): tang = tang + E[a][k] * x[k]
    print(f"div_R4 e_{a} = {div},  <e_{a}, q> = {tang}")
# independent ambient check: e^a = sum_k (e_a)_k dx_k ; evaluate d e^a on (e_b,e_c)
for a in (1, 2, 3):
    for b, c in ((1, 2), (2, 3), (3, 1)):
        val = Poly()
        for j in range(4):
            for k in range(4):
                val = val + E[a][k].deriv(j) * (E[b][j] * E[c][k] - E[b][k] * E[c][j]) * 1.0
        # d(sum w_k dx_k)(U,V) = sum_{j,k} d_j w_k (U_j V_k - U_k V_j)
        print(f"  (d e^{a})(e_{b},e_{c}) = {val}")
print("  (on S^3, |q|^2 = 1: so d e^1 = -2 e^2^e^3, d e^2 = -2 e^3^e^1, d e^3 = -2 e^1^e^2)")

# ---- exterior algebra on frame (0=ds, 1,2,3 = e^1,e^2,e^3, 4 = passive closed B one-form) ----
def fadd(A, B, sb=1):
    r = dict(A)
    for I, f in B.items(): r[I] = r.get(I, Poly()) + f * sb
    return {I: f for I, f in r.items() if not f.zero()}
def psign(L):
    L = list(L); s = 1
    for i in range(len(L)):
        for j in range(i + 1, len(L)):
            if L[i] > L[j]: s = -s
    return s
def wedge(A, B):
    r = {}
    for I, f in A.items():
        for J, g in B.items():
            if set(I) & set(J): continue
            K = I + J; s = psign(K); K = tuple(sorted(K))
            r[K] = r.get(K, Poly()) + f * g * s
    return {I: f for I, f in r.items() if not f.zero()}
def fz(A): return not A
def one(i, c=1): return {(i,): ONE * c}
def scal(f): return {(): f}
SIGN = -2   # d e^1 = SIGN e^2^e^3 etc.
def dframe(i, sign):
    if i in (0, 4): return {}
    b, c = {1: (2, 3), 2: (3, 1), 3: (1, 2)}[i]
    return wedge(one(b, sign), one(c))
def d(A, sign=None):
    sign = SIGN if sign is None else sign
    r = {}
    for I, f in A.items():
        for a in (1, 2, 3):
            r = fadd(r, wedge(one(a), {I: vf(a, f)}))
        for p, i in enumerate(I):
            t = wedge(wedge({I[:p]: ONE}, dframe(i, sign)), {I[p+1:]: ONE})
            r = fadd(r, wedge(scal(f), t), (-1) ** p)
    return r

print("\n== d_Sigma o d_Sigma = 0 ==")
f = rpoly(); w = fadd(fadd(wedge(scal(rpoly()), one(1)), wedge(scal(rpoly()), one(2))), wedge(scal(rpoly()), one(3)))
print("dd f = 0 with constant -2:", fz(d(d(f_ := scal(f)))), "| dd(1-form) = 0:", fz(d(d(w))))
print("dd f = 0 with constant +2:", fz(d(d(scal(f), +2), +2)), "| with constant -1:", fz(d(d(scal(f), -1), -1)))

I_ = 1j
theta = fadd(one(0), one(1, -I_)); thetab = fadd(one(0), one(1, I_))
eta = fadd(one(2), one(3, -I_)); etab = fadd(one(2), one(3, I_))
print("\n== d theta, d eta ==")
print("d theta = eta ^ etabar:", fz(fadd(d(theta), wedge(eta, etab), -1)))
print("d theta = -i d e^1 = 2i e^2^e^3:", fz(fadd(d(theta), wedge(one(2, 2j), one(3)), -1)))
print("d eta = thetabar^eta - theta^eta:", fz(fadd(d(eta), fadd(wedge(thetab, eta), wedge(theta, eta), -1), -1)))
print("d eta = 2i e^1 ^ eta:", fz(fadd(d(eta), wedge(one(1, 2j), eta), -1)))

def Xb(f): return (vf(2, f) - vf(3, f) * I_) * 0.5
def Xu(f): return (vf(2, f) + vf(3, f) * I_) * 0.5
print("\n== commutators ==")
g = rpoly()
print("[e_1,Xbar] = 2i Xbar:", (vf(1, Xb(g)) - Xb(vf(1, g)) - Xb(g) * 2j).zero())
print("[X,Xbar] = -i e_1:", (Xu(Xb(g)) - Xb(Xu(g)) + vf(1, g) * I_).zero())
dg = d(scal(g))
pred = fadd(fadd(fadd(wedge(theta, scal(vf(1, g) * 0.5j)), wedge(thetab, scal(vf(1, g) * -0.5j))), wedge(eta, scal(Xu(g)))), wedge(etab, scal(Xb(g))))
print("d_Sigma g = (i/2)e_1g theta - (i/2)e_1g thetabar + Xg eta + Xbar g etabar:", fz(fadd(dg, pred, -1)))

print("\n== Q2 ==")
def rform_no_ds(extra=False):
    r = {}
    idx = [1, 2, 3] + ([4] if extra else [])
    for k in range(len(idx) + 1):
        for I in itertools.combinations(idx, k):
            if random.random() < 0.7: r[I] = rpoly(2, 3)
    return {I: f for I, f in r.items() if not f.zero()}
def Amap(A):
    # multiplicative, ds -> -ds + 2i e^1 (equivalently theta -> -theta), e^a, B-forms, functions fixed
    r = {}
    for I, f in A.items():
        t = scal(f)
        for i in I:
            t = wedge(t, fadd(one(0, -1), one(1, 2j)) if i == 0 else one(i))
        r = fadd(r, t)
    return r
print("A(theta) = -theta:", fz(fadd(Amap(theta), theta)))
for trial in range(3):
    al, be = rform_no_ds(True), rform_no_ds(True)
    u = fadd(al, wedge(theta, be))
    lhs = fadd(d(Amap(u)), Amap(d(u)), -1)
    rhs = wedge(wedge(one(2, -4j), one(3)), be)
    rhs2 = wedge(d(one(1)), be)
    print(f" trial {trial}: dA u - A d u = -4i e^2^e^3^beta:", fz(fadd(lhs, rhs, -1)),
          "| = 2i de^1^beta:", fz(fadd(lhs, {I: f * 2j for I, f in rhs2.items()}, -1)),
          "| nonzero in general:", not fz(lhs))

print("\n== Q3: components of d_Sigma u containing thetabar or etabar ==")
# new basis: 0=theta, 1=thetabar, 2=eta, 3=etabar, 4=B one-form
SUB = {0: {(0,): 0.5, (1,): 0.5}, 1: {(0,): 0.5j, (1,): -0.5j},
       2: {(2,): 0.5, (3,): 0.5}, 3: {(2,): 0.5j, (3,): -0.5j}, 4: {(4,): 1}}
def tonew(A):
    r = {}
    for I, f in A.items():
        t = scal(f)
        for i in I: t = wedge(t, {K: ONE * c for K, c in SUB[i].items()})
        r = fadd(r, t)
    return r
def N(i): return one(i)
for qdeg in (0, 1):
    wB = one(4) if qdeg else scal(ONE)
    ph, F, G, H = rpoly(), rpoly(), rpoly(), rpoly()
    u = fadd(fadd(fadd(wedge(scal(ph), wB), wedge(theta, wedge(scal(F), wB))),
                  wedge(eta, wedge(scal(G), wB))), wedge(wedge(theta, eta), wedge(scal(H), wB)))
    du = tonew(d(u))
    bar = {I: f for I, f in du.items() if 1 in I or 3 in I}
    def W(*ix):
        t = scal(ONE)
        for i in ix: t = wedge(t, N(i))
        return t
    def term(ix, coef): return wedge(W(*ix), wedge(scal(coef), wB))
    pred = {}
    for ix, coef in [((1,), vf(1, ph) * -0.5j), ((3,), Xb(ph)),
                     ((2, 3), F - Xb(G)), ((0, 1), vf(1, F) * 0.5j), ((0, 3), -Xb(F)),
                     ((1, 2), G - vf(1, G) * 0.5j),
                     ((0, 1, 2), -H + vf(1, H) * 0.5j), ((0, 2, 3), Xb(H))]:
        pred = fadd(pred, term(ix, coef))
    print(f" B-degree {qdeg}: bar-part of d_Sigma u matches the eight predicted components:", fz(fadd(bar, pred, -1)),
          "| bar-types present:", sorted(tuple(i for i in I if i != 4) for I in bar))

print("\n== sanity: polynomial solutions (homogeneous degree n) ==")
def mons(n):
    return [m for m in itertools.product(range(n + 1), repeat=4) if sum(m) == n]
def rank(M):
    M = [r[:] for r in M]; rk = 0
    rows, cols = len(M), len(M[0])
    for c in range(cols):
        p = max(range(rk, rows), key=lambda r: abs(M[r][c]), default=None)
        if p is None or abs(M[p][c]) < 1e-9: continue
        M[rk], M[p] = M[p], M[rk]
        for r in range(rows):
            if r != rk and abs(M[r][c]) > 1e-12:
                fct = M[r][c] / M[rk][c]
                M[r] = [a - fct * b for a, b in zip(M[r], M[rk])]
        rk += 1
        if rk == rows: break
    return rk
def kerdim(n, ops):
    ms = mons(n); cols = []
    for m in ms:
        p = Poly({m: 1}); col = []
        for op in ops:
            r = op(p); col += [r.d.get(mm, 0) for mm in ms]
        cols.append(col)
    M = [[cols[j][i] for j in range(len(ms))] for i in range(len(cols[0]))]
    return len(ms) - rank(M)
for n in range(0, 5):
    kF = kerdim(n, [lambda p: vf(1, p), Xb])
    kG = kerdim(n, [lambda p: vf(1, p) + p * 2j, Xb])
    kGw = kerdim(n, [lambda p: vf(1, p) - p * 2j, Xb])
    print(f" degree {n}: dim{{e_1 f=0, Xbar f=0}} = {kF} ; dim{{e_1 g=-2i g, Xbar g=0}} = {kG} ; (opposite weight, e_1 g=+2i g, Xbar g=0: {kGw})")
print(" (in even degree n the kernel of {e_1, Xbar} is spanned by |q|^n, i.e. constants on S^3)")
print(" |q|^2 killed by e_1, Xbar:", vf(1, R2).zero(), Xb(R2).zero())
