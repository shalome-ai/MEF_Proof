"""Card T3 (chat C10): the candidates of order zero and of order one.
Standard library only; exact rational arithmetic.  The finite parts of the card; the rest is by
hand in the write-up log.

A smooth state is psi = psi' + dzbar ^ psi''  (M2-W185(iii)).  The terms from which a condition is
made (the reading confirmed at Decision Log P280) are, with complex numbers in front:
   order zero:  psi, psi', psi''
   order one :  X psi, X psi', X psi''   for X = d_Sigma, d_B, dbar_F .
Every term is written on sixteen slots: the eight symbols
   psi', psi'', dS psi', dS psi'', dB psi', dB psi'', del psi', del psi''   (del = d/d zbar_s)
in the part with no dzbar (part 0) and as the coefficient of dzbar (part 1).

Part A, the terms.
 (A1) the twelve terms span a space of dimension eleven (dbar_F psi = dbar_F psi');
 (A2) the span is exactly that of eleven slots: psi', psi'', dS psi', dS psi'', dB psi', dB psi''
      in part 0, and psi'', dS psi'', dB psi'', del psi', del psi'' in part 1;
 (A3) the three terms of order zero span psi' and psi'' in part 0 and psi'' in part 1.
Part B, the fold.  L = (epsilon times the pull-back by the fold) has L psi' = psi', L psi'' = -psi'';
      it commutes with d_Sigma and d_B (M2-W185(ii)) and anticommutes with del (M2-W179).
 (B1) on polynomials in (a,b), z = a+ib, the map f -> f(-a,-b) anticommutes with
      del = (d/da + i d/db)/2 (checked on every monomial of degree at most six);
 (B2) the sign of L on each of the eleven slots; they fall into four groups, the conditions
      (I) to (IV) of the proposition:
        (I)   part 0, sign +:  psi', dS psi', dB psi'
        (II)  part 0, sign -:  psi'', dS psi'', dB psi''
        (III) part 1, sign of the coefficient -:  psi'', dS psi'', dB psi'', del psi'
        (IV)  part 1, sign of the coefficient +:  del psi''
Part C, the degrees.  A form of time, space and the base has a degree (p,q): p on time and space,
      q on the base.  d_Sigma raises p by one and d_B raises q by one.
 (C1) on a graded space with grades 0..7 and a map N that raises the grade by one or more,
      a + N has no kernel for a != 0 (checked on 200 random N with integer entries and rational a: a + N is triangular with
      a on the diagonal, and its determinant is a^n).
Part D, order zero.
 (D1) over all choices of which of the three numbers of order zero are zero, the conditions are
      exactly four: none; psi' = 0; psi'' = 0; psi' = 0 and psi'' = 0.
"""
from fractions import Fraction as Fr
from itertools import product
import random
import sys

FAIL = []


def check(name, ok):
    print(("pass  " if ok else "FAIL  ") + name)
    if not ok:
        FAIL.append(name)


SYM = ["psi'", "psi''", "dS psi'", "dS psi''", "dB psi'", "dB psi''", "del psi'", "del psi''"]
SLOTS = [(part, s) for part in (0, 1) for s in SYM]


def vec(d):
    return [Fr(d.get(sl, 0)) for sl in SLOTS]


# psi = psi' + dzbar^psi''.  X(dzbar ^ u) = -dzbar ^ X u for X = d_Sigma, d_B (dzbar is pulled back
# from Y and has degree one).  dbar_F psi = dzbar ^ del psi'; dbar_F of the section psi'' is
# dzbar ^ del psi''.
TERMS = {
    "psi": {(0, "psi'"): 1, (1, "psi''"): 1},
    "psi'": {(0, "psi'"): 1},
    "psi''": {(0, "psi''"): 1},
    "dS psi": {(0, "dS psi'"): 1, (1, "dS psi''"): -1},
    "dS psi'": {(0, "dS psi'"): 1},
    "dS psi''": {(0, "dS psi''"): 1},
    "dB psi": {(0, "dB psi'"): 1, (1, "dB psi''"): -1},
    "dB psi'": {(0, "dB psi'"): 1},
    "dB psi''": {(0, "dB psi''"): 1},
    "dbarF psi": {(1, "del psi'"): 1},
    "dbarF psi'": {(1, "del psi'"): 1},
    "dbarF psi''": {(1, "del psi''"): 1},
}


def rank(rows):
    m = [r[:] for r in rows]
    rk = 0
    ncol = len(m[0]) if m else 0
    for c in range(ncol):
        piv = next((i for i in range(rk, len(m)) if m[i][c] != 0), None)
        if piv is None:
            continue
        m[rk], m[piv] = m[piv], m[rk]
        for i in range(len(m)):
            if i != rk and m[i][c] != 0:
                f = m[i][c] / m[rk][c]
                m[i] = [x - f * y for x, y in zip(m[i], m[rk])]
        rk += 1
    return rk


# ---- Part A
rows = [vec(t) for t in TERMS.values()]
check("A1 twelve terms, rank eleven", len(rows) == 12 and rank(rows) == 11)

ELEVEN = [(0, "psi'"), (0, "psi''"), (0, "dS psi'"), (0, "dS psi''"), (0, "dB psi'"), (0, "dB psi''"),
          (1, "psi''"), (1, "dS psi''"), (1, "dB psi''"), (1, "del psi'"), (1, "del psi''")]
unit = [vec({sl: 1}) for sl in ELEVEN]
check("A2 the span is that of the eleven slots",
      rank(rows + unit) == 11 and rank(unit) == 11)

zero_rows = [vec(TERMS[t]) for t in ("psi", "psi'", "psi''")]
zero_unit = [vec({sl: 1}) for sl in [(0, "psi'"), (0, "psi''"), (1, "psi''")]]
check("A3 order zero: psi', psi'' in part 0 and psi'' in part 1",
      rank(zero_rows) == 3 and rank(zero_rows + zero_unit) == 3)

# ---- Part B
# polynomials in (a,b) with complex rational coefficients: dict {(i,j): (re, im)}


def cadd(x, y):
    return (x[0] + y[0], x[1] + y[1])


def cmul(x, y):
    return (x[0] * y[0] - x[1] * y[1], x[0] * y[1] + x[1] * y[0])


def padd(f, g):
    h = dict(f)
    for k, v in g.items():
        h[k] = cadd(h.get(k, (Fr(0), Fr(0))), v)
    return {k: v for k, v in h.items() if v != (Fr(0), Fr(0))}


def pscale(c, f):
    return {k: cmul(c, v) for k, v in f.items() if cmul(c, v) != (Fr(0), Fr(0))}


def d_a(f):
    return {(i - 1, j): cmul((Fr(i), Fr(0)), v) for (i, j), v in f.items() if i > 0}


def d_b(f):
    return {(i, j - 1): cmul((Fr(j), Fr(0)), v) for (i, j), v in f.items() if j > 0}


def delbar(f):
    return pscale((Fr(1, 2), Fr(0)), padd(d_a(f), pscale((Fr(0), Fr(1)), d_b(f))))


def flip(f):
    return {(i, j): cmul((Fr((-1) ** (i + j)), Fr(0)), v) for (i, j), v in f.items()}


ok = True
for i in range(7):
    for j in range(7 - i):
        f = {(i, j): (Fr(1), Fr(0))}
        lhs = delbar(flip(f))
        rhs = pscale((Fr(-1), Fr(0)), flip(delbar(f)))
        ok = ok and lhs == rhs
check("B1 del(f o fold) = -(del f) o fold on monomials of degree <= 6", ok)

SIGN = {"psi'": 1, "psi''": -1}
for s in list(SIGN):
    SIGN["dS " + s] = SIGN[s]
    SIGN["dB " + s] = SIGN[s]
    SIGN["del " + s] = -SIGN[s]
groups = {}
for part, s in ELEVEN:
    groups.setdefault((part, SIGN[s]), []).append(s)
expect = {
    (0, 1): ["psi'", "dS psi'", "dB psi'"],
    (0, -1): ["psi''", "dS psi''", "dB psi''"],
    (1, -1): ["psi''", "dS psi''", "dB psi''", "del psi'"],
    (1, 1): ["del psi''"],
}
check("B2 the eleven slots fall into the four groups (I) to (IV)", groups == expect)
check("B2 the groups have 3 + 3 + 4 + 1 = 11 slots",
      sorted(len(v) for v in groups.values()) == [1, 3, 3, 4])

# ---- Part C
random.seed(3)


def det(m):
    m = [r[:] for r in m]
    n = len(m)
    d = Fr(1)
    for c in range(n):
        piv = next((i for i in range(c, n) if m[i][c] != 0), None)
        if piv is None:
            return Fr(0)
        if piv != c:
            m[c], m[piv] = m[piv], m[c]
            d = -d
        d *= m[c][c]
        for i in range(c + 1, n):
            f = m[i][c] / m[c][c]
            m[i] = [x - f * y for x, y in zip(m[i], m[c])]
    return d


ok = True
grades = [g for g in range(8) for _ in range(2)]  # two basis vectors in each grade 0..7
n = len(grades)
for _ in range(200):
    a = Fr(random.choice([-3, -2, -1, 1, 2, 5]), random.choice([1, 2, 3]))
    m = [[Fr(0)] * n for _ in range(n)]
    for r in range(n):
        for c in range(n):
            if grades[r] > grades[c]:
                m[r][c] = Fr(random.randint(-4, 4))
        m[r][r] = a
    ok = ok and det(m) == a ** n
check("C1 a + N has determinant a^n, N raising the grade (200 samples)", ok)

# ---- Part D
conds = set()
for a0, a1, a2 in product((0, 1), repeat=3):
    c = []
    if a0:
        c.append("psi' = 0")          # (I)
    if a1 or a2:
        c.append("psi'' = 0")         # (II), (III)
    conds.add(tuple(c))
check("D1 order zero: exactly four conditions",
      conds == {(), ("psi' = 0",), ("psi'' = 0",), ("psi' = 0", "psi'' = 0")})

print()
print("%d failed" % len(FAIL))
sys.exit(1 if FAIL else 0)
