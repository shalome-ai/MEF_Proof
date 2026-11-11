#!/usr/bin/env python3
"""Clause (a) and the two hypotheses "no mirror" and "time has a direction" (11 Nov 2026; Decision Log P61, P62).

PROTOCOL, PART A, FIXED BEFORE RUNNING.  For every trace t = 3..60 count the hyperbolic matrices of SL2(Z)
of trace t up to four notions of "the same drive":
   N1  conjugacy by SL2(Z)                              (no mirror; backwards is different)
   N2  conjugacy by SL2(Z), and M ~ M^-1                (no mirror; backwards is the same)
   N3  conjugacy by GL2(Z)                              (mirror allowed; backwards is different)
   N4  conjugacy by GL2(Z), and M ~ M^-1                (mirror allowed; backwards is the same)
and list, for each notion, the traces with exactly one class.
Method A: cycles of reduced indefinite binary quadratic forms of discriminant t^2 - 4 (classes under SL2(Z));
  the mirror diag(1,-1) sends the form (A,B,C) to (-A,B,-C); inversion of the matrix sends the form f to -f.
Method B (independent, small traces): brute force on matrices in a box, joining by generators.
Standard library only.
"""
import math
def mat_to_form(m):
    (a, b), (c, d) = m
    return (c, d - a, -b)
def reduced(f, D):
    a, b, c = f; r = math.sqrt(D)
    return 0 < b < r and r - b < 2 * abs(a) < r + b
def rho(f, D):
    a, b, c = f; r = math.isqrt(D); ac = abs(c)
    hi = r if ac <= r else ac
    k0 = (hi + b) // (2 * ac)
    k = k0 if c > 0 else -k0
    bp = 2 * c * k - b; cp = a - b * k + c * k * k
    assert bp * bp - 4 * c * cp == D
    return (c, bp, cp)
def reduce(f, D):
    for _ in range(10000):
        if reduced(f, D): return f
        f = rho(f, D)
    raise RuntimeError("no reduction")
def cycle_of(f, D):
    f = reduce(f, D); cyc = [f]; g = rho(f, D)
    while g != f:
        cyc.append(g); g = rho(g, D)
    return frozenset(cyc)

def counts(t):
    D = t * t - 4; forms = []
    for b in range(1, math.isqrt(D) + 1):
        if (b * b - D) % 4: continue
        n = (b * b - D) // 4
        for a in range(-math.isqrt(D) - 1, math.isqrt(D) + 2):
            if a and n % a == 0 and reduced((a, b, n // a), D): forms.append((a, b, n // a))
    cyc = sorted({cycle_of(f, D) for f in forms}, key=lambda c: sorted(c))
    idx = {g: i for i, c in enumerate(cyc) for g in c}
    mirror = [idx[reduce((-a, b, -c), D)] for (a, b, c) in (next(iter(cc)) for cc in cyc)]
    inverse = [idx[reduce((-a, -b, -c), D)] for (a, b, c) in (next(iter(cc)) for cc in cyc)]
    def ncls(ops):
        par = list(range(len(cyc)))
        def find(i):
            while par[i] != i: i = par[i]
            return i
        for op in ops:
            for i, j in enumerate(op): par[find(i)] = find(j)
        return len({find(i) for i in range(len(cyc))})
    return ncls([]), ncls([inverse]), ncls([mirror]), ncls([mirror, inverse])

def brute(t, B, mirror, inverse):
    mats = [((a, b), (c, t - a)) for a in range(-B, B + 1) for b in range(-B, B + 1) for c in range(-B, B + 1)
            if abs(t - a) <= B and a * (t - a) - b * c == 1]
    idx = {m: i for i, m in enumerate(mats)}; par = list(range(len(mats)))
    def find(i):
        while par[i] != i:
            par[i] = par[par[i]]; i = par[i]
        return i
    mul = lambda x, y: tuple(tuple(sum(x[i][k] * y[k][j] for k in range(2)) for j in range(2)) for i in range(2))
    gens = [(((1, 1), (0, 1)), ((1, -1), (0, 1))), (((1, -1), (0, 1)), ((1, 1), (0, 1))), (((0, 1), (-1, 0)), ((0, -1), (1, 0)))]
    if mirror: gens.append((((1, 0), (0, -1)), ((1, 0), (0, -1))))
    for m in mats:
        for g, gi in gens:
            n = mul(mul(g, m), gi)
            if n in idx: par[find(idx[m])] = find(idx[n])
        if inverse:
            (a, b), (c, d) = m; n = ((d, -b), (-c, a))
            if n in idx: par[find(idx[m])] = find(idx[n])
    return len({find(i) for i in range(len(mats))})

T = 60
res = {t: counts(t) for t in range(3, T + 1)}
print("trace :  N1  N2  N3  N4")
for t in range(3, 23): print(f"  {t:3d} : " + " ".join(f"{x:3d}" for x in res[t]))
names = ["N1 no mirror, backwards different", "N2 no mirror, backwards the same", "N3 mirror, backwards different", "N4 mirror, backwards the same"]
for k, nm in enumerate(names):
    print(f"{nm:36s}: one class at traces {[t for t in range(3, T + 1) if res[t][k] == 1]}")
ok = True
for t in range(3, 9):
    for B in (40,):
        got = (brute(t, B, False, False), brute(t, B, False, True), brute(t, B, True, False), brute(t, B, True, True))
        same = got == res[t]; ok &= same
        print(f"method B, trace {t}, box {B}: {got}  {'agrees' if same else 'DIFFERS from ' + str(res[t])}")
print("ALL AGREE" if ok else "DISAGREEMENT")
