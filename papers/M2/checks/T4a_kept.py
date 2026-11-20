"""Card T4a (chat C11): the candidates that the maps keep.
Standard library only; exact arithmetic over the Gaussian rationals.  The finite parts of the
card; the rest is by hand in the write-up log.

Model.  S^3 = Sp(1) is the unit sphere of the quaternions q = q0 + q1 i + q2 j + q3 k.  The vector
fields e_1, e_2, e_3 that left translation makes from i, j, k (M2-W053) are q -> q i, q j, q k; they
are linear vector fields on R^4, so they act on polynomials in q0..q3, and a polynomial stands for
its restriction to S^3.  Forms on time and space are written on ds, e^1, e^2, e^3 with polynomial
coefficients.  theta = ds - i e^1 and eta = e^2 - i e^3 span the (0,1)-forms of J_0 (M2-W170(ii)).

Part A, the frame.
 (A1) the matrices of e_1, e_2, e_3 are antisymmetric (the fields are tangent to the spheres) and
      have trace zero;
 (A2) [e_1,e_2] = 2 e_3, [e_2,e_3] = 2 e_1, [e_3,e_1] = 2 e_2 (on every monomial of degree at
      most three);
 (A3) with d e^1 = -2 e^2 e^3, d e^2 = -2 e^3 e^1, d e^3 = -2 e^1 e^2 the derivative along space,
      applied twice, is zero (on functions and on forms); with the opposite sign it is not.
Part B, the map A (theta -> -theta; e^1, e^2, e^3 to themselves; products kept).
 (B1) A applied twice is the identity; A(theta) = -theta, A(eta) = eta;
 (B2) for u = alpha + theta ^ beta with alpha, beta in the span of 1 and eta:
      d_Sigma(A u) - A(d_Sigma u) = 2i de^1 ^ beta = -4i beta_0 e^2 e^3,
      beta_0 the part of beta with no eta.
Part C, the part of degree two.  For u_1 = F theta + G eta:
 (C1) the part of d_Sigma u_1 that has ds is -ds ^ d_Sigma F;
 (C2) the coefficient of e^2 e^3 in d_Sigma u_1 is 2iF - i(e_2 - i e_3)G;
 (C3) theta ^ eta has no e^2 e^3, and its part with ds is ds ^ eta (for a multiple W theta ^ eta
      the same follows by hand);
 (C4) ds ^ eta has the coefficients 0, 1, -i on ds e^1, ds e^2, ds e^3 (that a form
      ds ^ (c_1 e^1 + c_2 e^2 + c_3 e^3) is ds ^ (W eta) only if c_1 = 0 and c_3 = -i c_2 follows
      by hand).
Part D, on S^3.
 (D1) (e_2 + i e_3)(e_2 - i e_3) = e_2^2 + e_3^2 - 2i e_1, on every monomial of degree at most
      three;
 (D2) the integral over S^3 of e_a g is zero, on every monomial g of degree at most five
      (a model of the general statement, which is by hand from (A1));
 (D3) the integral over S^3 of g (e_a h) + (e_a g) h is zero, on a sample of pairs of monomials
      of degree at most three (every third against every fifth).
      D2 and D3 use a formula for the mean of a monomial over S^3 (in `sphere_integral`) that is
      RECALLED and was read at no source; one value of it is checked (the mean of q0^2 is 1/4).
      They are an illustration and carry nothing: the statement is by hand, from (A1).
Part E, the fibre.  R is z -> -i z from the fibre at s to the fibre at -s (M2-W167(iv)).
 (E1) for G = F o R^{-1}, that is G(z) = F(iz): dG/dzbar = -i (dF/dzbar) o R^{-1}
      (on every monomial in (a,b), z = a + ib, of degree at most six);
 (E2) (-i)^2 = -1 (what follows for the lift applied twice is by hand).
Part F, the corners and the divisors.
 (F1) S fixes P_1 and P_4 and exchanges P_2 and P_3 (modulo Z^2);
 (F2) of the five divisors of flux three whose odd corner is P_4, three have a_2 = a_3 and R
      exchanges the other two.
"""
from fractions import Fraction as Fr
from itertools import product
import sys

FAIL = []
RUN = []


def check(name, ok):
    RUN.append(name)
    print(("pass  " if ok else "FAIL  ") + name)
    if not ok:
        FAIL.append(name)


# ---- Gaussian rationals as pairs
Z0 = (Fr(0), Fr(0))
ONE = (Fr(1), Fr(0))
I = (Fr(0), Fr(1))


def g(x, y=0):
    return (Fr(x), Fr(y))


def gadd(x, y):
    return (x[0] + y[0], x[1] + y[1])


def gmul(x, y):
    return (x[0] * y[0] - x[1] * y[1], x[0] * y[1] + x[1] * y[0])


# ---- polynomials in n variables: {exponents: coefficient}
def padd(f, h):
    r = dict(f)
    for k, v in h.items():
        w = gadd(r.get(k, Z0), v)
        if w == Z0:
            r.pop(k, None)
        else:
            r[k] = w
    return r


def pscale(c, f):
    return {k: gmul(c, v) for k, v in f.items() if gmul(c, v) != Z0}


def pmul(f, h):
    r = {}
    for k1, v1 in f.items():
        for k2, v2 in h.items():
            k = tuple(a + b for a, b in zip(k1, k2))
            w = gadd(r.get(k, Z0), gmul(v1, v2))
            if w == Z0:
                r.pop(k, None)
            else:
                r[k] = w
    return r


def pdiff(f, i):
    r = {}
    for k, v in f.items():
        if k[i] > 0:
            kk = k[:i] + (k[i] - 1,) + k[i + 1:]
            r[kk] = gmul(g(k[i]), v)
    return r


def var(i, n=4):
    return {tuple(1 if j == i else 0 for j in range(n)): ONE}


def mono(k):
    return {tuple(k): ONE}


# ---- the fields: (q u_a) as a row of linear forms; e_a f = sum_j (q u_a)_j df/dq_j
# q i = (-q1, q0, q3, -q2); q j = (-q2, -q3, q0, q1); q k = (-q3, q2, -q1, q0)
MAT = {
    1: [[0, -1, 0, 0], [1, 0, 0, 0], [0, 0, 0, 1], [0, 0, -1, 0]],
    2: [[0, 0, -1, 0], [0, 0, 0, -1], [1, 0, 0, 0], [0, 1, 0, 0]],
    3: [[0, 0, 0, -1], [0, 0, 1, 0], [0, -1, 0, 0], [1, 0, 0, 0]],
}
# MAT[a][j][l]: the coefficient of q_l in the j-th component of q u_a


def e(a, f):
    r = {}
    for j in range(4):
        dj = pdiff(f, j)
        for l in range(4):
            c = MAT[a][j][l]
            if c:
                r = padd(r, pscale(g(c), pmul(var(l), dj)))
    return r


check("A1 the matrices are antisymmetric with trace zero",
      all(MAT[a][j][l] == -MAT[a][l][j] for a in MAT for j in range(4) for l in range(4))
      and all(sum(MAT[a][j][j] for j in range(4)) == 0 for a in MAT))

MONOS3 = [k for k in product(range(4), repeat=4) if sum(k) <= 3]


def bracket(a, b, f):
    return padd(e(a, e(b, f)), pscale(g(-1), e(b, e(a, f))))


check("A2 [e1,e2]=2e3, [e2,e3]=2e1, [e3,e1]=2e2",
      all(bracket(a, b, mono(k)) == pscale(g(2), e(c, mono(k)))
          for (a, b, c) in ((1, 2, 3), (2, 3, 1), (3, 1, 2)) for k in MONOS3))

# ---- forms on ds, e^1, e^2, e^3: {mask: polynomial}; bit 0 = ds, bit a = e^a
def fadd(u, v):
    r = dict(u)
    for m, p in v.items():
        w = padd(r.get(m, {}), p)
        if w:
            r[m] = w
        else:
            r.pop(m, None)
    return r


def fscale(c, u):
    r = {}
    for m, p in u.items():
        w = pscale(c, p)
        if w:
            r[m] = w
    return r


def wsign(m1, m2):
    """sign of (basis form m1) ^ (basis form m2), or 0"""
    if m1 & m2:
        return 0
    s = 0
    for b in range(4):
        if m2 >> b & 1:
            s += bin(m1 >> (b + 1)).count("1")
    return -1 if s % 2 else 1


def wedge(u, v):
    r = {}
    for m1, p1 in u.items():
        for m2, p2 in v.items():
            s = wsign(m1, m2)
            if s:
                r = fadd(r, {m1 | m2: pscale(g(s), pmul(p1, p2))})
    return r


C1 = {(0, 0, 0, 0): ONE}
DS, E1, E2, E3 = ({1: C1}, {2: C1}, {4: C1}, {8: C1})
GEN = [DS, E1, E2, E3]


def dgen(sign):
    # d e^1 = sign*2 e^2 e^3, d e^2 = sign*2 e^3 e^1, d e^3 = sign*2 e^1 e^2 ; d ds = 0
    return [{}, fscale(g(2 * sign), wedge(E2, E3)), fscale(g(2 * sign), wedge(E3, E1)),
            fscale(g(2 * sign), wedge(E1, E2))]


def dbasis(m, DG):
    """d of the basis form of mask m, by the rule d(a^b) = da^b + (-1)^deg(a) a^db"""
    bits = [b for b in range(4) if m >> b & 1]
    r = {}
    for idx, b in enumerate(bits):
        left = {0: C1}
        for bb in bits[:idx]:
            left = wedge(left, GEN[bb])
        right = {0: C1}
        for bb in bits[idx + 1:]:
            right = wedge(right, GEN[bb])
        term = wedge(wedge(left, DG[b]), right)
        r = fadd(r, fscale(g((-1) ** idx), term))
    return r


def dS(u, DG):
    r = {}
    for m, p in u.items():
        for a in (1, 2, 3):
            r = fadd(r, wedge({1 << a: e(a, p)}, {m: C1}))
        r = fadd(r, wedge({0: p}, dbasis(m, DG)))
    return r


DG = dgen(-1)
DGwrong = dgen(+1)
FUN = [mono(k) for k in product(range(3), repeat=4) if 1 <= sum(k) <= 2]
TESTFORMS = [{0: f} for f in FUN[:6]] + [wedge({0: f}, w) for f in FUN[:4] for w in (DS, E1, E2, E3)] \
    + [wedge({0: f}, wedge(E1, E2)) for f in FUN[:3]]
check("A3 d_Sigma applied twice is zero with de^1 = -2 e^2 e^3 (cyclic), and is not with +2",
      all(dS(dS(u, DG), DG) == {} for u in TESTFORMS)
      and any(dS(dS(u, DGwrong), DGwrong) != {} for u in TESTFORMS))

THETA = fadd(DS, fscale(g(0, -1), E1))
ETA = fadd(E2, fscale(g(0, -1), E3))
A_GEN = [fadd(fscale(g(-1), DS), fscale(g(0, 2), E1)), E1, E2, E3]   # A(ds) = -ds + 2i e^1


def A(u):
    r = {}
    for m, p in u.items():
        img = {0: p}
        for b in range(4):
            if m >> b & 1:
                img = wedge(img, A_GEN[b])
        r = fadd(r, img)
    return r


check("B1 A(theta) = -theta, A(eta) = eta, A applied twice is the identity",
      A(THETA) == fscale(g(-1), THETA) and A(ETA) == ETA
      and all(A(A(u)) == u for u in TESTFORMS))

P = [mono((1, 0, 0, 0)), mono((0, 1, 1, 0)), padd(mono((0, 0, 0, 2)), pscale(I, mono((1, 1, 0, 0)))),
     padd(mono((2, 0, 1, 0)), mono((0, 0, 0, 1))), mono((0, 2, 0, 1)), padd(mono((1, 0, 1, 1)), pscale(g(3), mono((0, 0, 1, 0))))]
ok = True
for (a0, a1, b0, b1) in [(P[0], P[1], P[2], P[3]), (P[4], P[5], P[1], P[0]), (P[2], P[3], P[5], P[4]), ({}, {}, C1, {})]:
    alpha = fadd({0: a0} if a0 else {}, wedge({0: a1}, ETA) if a1 else {})
    beta = fadd({0: b0} if b0 else {}, wedge({0: b1}, ETA) if b1 else {})
    u = fadd(alpha, wedge(THETA, beta))
    lhs = fadd(dS(A(u), DG), fscale(g(-1), A(dS(u, DG))))
    rhs1 = fscale(g(0, 2), wedge(dS(E1, DG), beta))
    rhs2 = wedge({0: pscale(g(0, -4), b0)}, wedge(E2, E3)) if b0 else {}
    ok = ok and lhs == rhs1 == rhs2
check("B2 d_Sigma A u - A d_Sigma u = 2i de^1 ^ beta = -4i beta_0 e^2 e^3", ok)

ok1 = ok2 = True
for F, G in [(P[0], P[1]), (P[2], P[3]), (P[4], P[5]), (C1, P[2]), (P[3], {})]:
    u1 = fadd(wedge({0: F}, THETA), wedge({0: G}, ETA) if G else {})
    d = dS(u1, DG)
    dspart = {m: p for m, p in d.items() if m & 1}
    ok1 = ok1 and dspart == fscale(g(-1), wedge(DS, dS({0: F}, DG)))
    want = padd(pscale(g(0, 2), F),
                pscale(g(0, -1), padd(e(2, G), pscale(g(0, -1), e(3, G)))) if G else {})
    ok2 = ok2 and d.get(4 | 8, {}) == want
check("C1 the part of d_Sigma(F theta + G eta) with ds is -ds ^ d_Sigma F", ok1)
check("C2 its coefficient of e^2 e^3 is 2iF - i(e_2 - i e_3)G", ok2)

TE = wedge(THETA, ETA)
check("C3 theta ^ eta has no e^2 e^3, and its part with ds is ds ^ eta",
      (4 | 8) not in TE and {m: p for m, p in TE.items() if m & 1} == wedge(DS, ETA))
# C4: ds^(c1 e1 + c2 e2 + c3 e3) = ds ^ W (e2 - i e3)  iff  c1 = 0, c2 = W, c3 = -iW
check("C4 ds ^ eta has the coefficients (0, 1, -i) on ds e^1, ds e^2, ds e^3",
      wedge(DS, ETA) == {1 | 4: C1, 1 | 8: {(0, 0, 0, 0): g(0, -1)}})

ok = True
for k in MONOS3:
    f = mono(k)
    lhs = padd(e(2, padd(e(2, f), pscale(g(0, -1), e(3, f)))),
               pscale(I, e(3, padd(e(2, f), pscale(g(0, -1), e(3, f))))))
    rhs = padd(padd(e(2, e(2, f)), e(3, e(3, f))), pscale(g(0, -2), e(1, f)))
    ok = ok and lhs == rhs
check("D1 (e2 + i e3)(e2 - i e3) = e2^2 + e3^2 - 2i e1", ok)


def dfact(n):
    r = 1
    while n > 1:
        r *= n
        n -= 2
    return r


def sphere_integral(f):
    """the mean of a polynomial over S^3: mean of q^k is prod (k_i-1)!! / (4*6*...*(|k|+2)), all k_i even"""
    tot = Z0
    for k, v in f.items():
        if any(x % 2 for x in k):
            continue
        num = 1
        for x in k:
            num *= dfact(x - 1)
        den = 1
        for t in range(4, sum(k) + 3, 2):
            den *= t
        tot = gadd(tot, gmul(v, g(Fr(num, den))))
    return tot


check("D2 the integral over S^3 of e_a g is zero (monomials of degree at most five)",
      sphere_integral(mono((2, 0, 0, 0))) == g(Fr(1, 4))
      and all(sphere_integral(e(a, mono(k))) == Z0
              for a in (1, 2, 3) for k in product(range(6), repeat=4) if sum(k) <= 5))
check("D3 the integral of g (e_a h) + (e_a g) h is zero (monomials of degree at most three)",
      all(sphere_integral(padd(pmul(mono(k), e(a, mono(l))), pmul(e(a, mono(k)), mono(l)))) == Z0
          for a in (1, 2, 3) for k in MONOS3[::3] for l in MONOS3[::5]))

# ---- Part E: polynomials in (a, b), z = a + ib
def delbar(f):
    return pscale(g(Fr(1, 2)), padd(pdiff(f, 0), pscale(I, pdiff(f, 1))))


def compose_iz(f):
    """G(a,b) = F(-b, a): G(z) = F(iz)"""
    r = {}
    for (i, j), v in f.items():
        # a -> -b, b -> a :  a^i b^j -> (-b)^i a^j
        r = padd(r, {(j, i): gmul(g((-1) ** i), v)})
    return r


ok = True
for i in range(7):
    for j in range(7 - i):
        F = {(i, j): ONE}
        ok = ok and delbar(compose_iz(F)) == pscale(g(0, -1), compose_iz(delbar(F)))
check("E1 d/dzbar of F(iz) is -i (dF/dzbar)(iz)", ok)
check("E2 (-i)^2 = -1", gmul(g(0, -1), g(0, -1)) == g(-1))

# ---- Part F
S = ((0, 1), (-1, 0))
CORNER = {1: (Fr(0), Fr(0)), 2: (Fr(1, 2), Fr(0)), 3: (Fr(0), Fr(1, 2)), 4: (Fr(1, 2), Fr(1, 2))}


def act(M, p):
    return tuple((M[r][0] * p[0] + M[r][1] * p[1]) % 1 for r in range(2))


img = {i: next(j for j in CORNER if CORNER[j] == act(S, CORNER[i])) for i in CORNER}
check("F1 S fixes P1 and P4 and exchanges P2 and P3", img == {1: 1, 2: 3, 3: 2, 4: 4})
five = [a for a in product(range(4), repeat=4) if sum(a) == 3 and a[3] % 2 == 1
        and all(x % 2 == 0 for x in a[:3])] + \
       [a for a in product(range(4), repeat=4) if sum(a) == 3 and a[3] % 2 == 0
        and all(x % 2 == 1 for x in a[:3])]
# the corner signs epsilon*(-1)^{a_i} are +,+,+,- : a_4 odd with a_1,a_2,a_3 even, or a_4 even with the others odd
sym = [a for a in five if a[1] == a[2]]
other = [a for a in five if a[1] != a[2]]
check("F2 five divisors; three with a_2 = a_3; R exchanges the other two",
      len(five) == 5 and sorted(sym) == [(0, 0, 0, 3), (1, 1, 1, 0), (2, 0, 0, 1)]
      and sorted(other) == [(0, 0, 2, 1), (0, 2, 0, 1)]
      and (other[0][0], other[0][2], other[0][1], other[0][3]) == other[1])

print()
print("%d checks, %d failed" % (len(RUN), len(FAIL)))
sys.exit(1 if FAIL else 0)
