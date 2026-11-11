# Check for papers/M1/SIXTH_AXIOM_MINIMALITY.md (11 Nov 2026).
# How many drives are there at each hyperbolic trace, up to relabelling the torus?
# Counts conjugacy classes of matrices in SL2(Z) of trace t, under SL2(Z) and under GL2(Z).
# Two methods that share no code:
#   A. cycles of reduced indefinite binary quadratic forms of discriminant t^2 - 4 (Gauss);
#   B. brute force: matrices of trace t with bounded entries, joined when conjugate by a generator.
# Standard library only.  Run: python3 papers/M1/checks/sixth_axiom_check.py
import math, itertools

ok = True
def report(tag, cond, text):
    global ok; ok = ok and bool(cond); print(f"({tag}) {'PASS' if cond else 'FAIL'}: {text}")

# ---------- Method A: forms -----------------------------------------------------------------------------------
# A matrix ((a,b),(c,d)) of trace t and determinant 1 <-> the form c x^2 + (d-a) xy - b y^2 of discriminant t^2-4.
# Conjugation of the matrix by g in SL2(Z) <-> the action of g on the form.  M^-1 <-> the negative form.
def mat_to_form(m):
    (a, b), (c, d) = m
    return (c, d - a, -b)
def form_to_mat(f, t):
    A, B, C = f
    a = (t - B) // 2
    return ((a, -C), (A, t - a))
def reduced(f, D):
    a, b, c = f; r = math.sqrt(D)
    return 0 < b < r and r - b < 2 * abs(a) < r + b
def rho(f, D):
    # f(x,y) -> f(-y, x + k y): an SL2(Z) equivalence for every integer k.  New form (c, 2ck - b, a - bk + ck^2).
    a, b, c = f; r = math.isqrt(D)
    # choose k so that b' = 2ck - b lies in the window (r - 2|c|, r] if |c| <= r, else in (-|c|, |c|]
    ac = abs(c)
    hi = r if ac <= r else ac
    k0 = (hi + b) // (2 * ac)            # largest k with 2|c|k - b <= hi
    k = k0 if c > 0 else -k0
    bp = 2 * c * k - b
    cp = a - b * k + c * k * k
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
def classes(t):
    D = t * t - 4; r = math.sqrt(D); forms = []
    for b in range(1, math.isqrt(D) + 1):
        if (b * b - D) % 4: continue
        n = (b * b - D) // 4                     # a*c = n < 0
        for a in range(-math.isqrt(D) - 1, math.isqrt(D) + 2):
            if a and n % a == 0 and reduced((a, b, n // a), D): forms.append((a, b, n // a))
    cyc = {cycle_of(f, D) for f in forms}
    assert all(reduced(g, D) for c in cyc for g in c)
    # SL2 classes = cycles.  GL2: conjugating the matrix by diag(1,-1) sends the form (A,B,C) to (-A,B,-C).  Inverse: f -> -f.
    cyc = sorted(cyc, key=lambda c: sorted(c))
    idx = {g: i for i, c in enumerate(cyc) for g in c}
    par = list(range(len(cyc)))
    def find(i):
        while par[i] != i: i = par[i]
        return i
    for c in cyc:
        a, b, cc = next(iter(c))
        j = idx[reduce((-a, b, -cc), D)]
        par[find(idx[(a, b, cc)])] = find(j)
    n_gl = len({find(i) for i in range(len(cyc))})
    principal = idx[reduce(mat_to_form(((t, -1), (1, 0))), D)]
    inv = idx[reduce(tuple(-x for x in mat_to_form(((t, -1), (1, 0)))), D)]
    return len(cyc), n_gl, principal == inv

# ---------- Method B: brute force on matrices ------------------------------------------------------------------
def brute(t, B, gl=False):
    mats = [((a, b), (c, t - a)) for a in range(-B, B + 1) for b in range(-B, B + 1) for c in range(-B, B + 1)
            if abs(t - a) <= B and a * (t - a) - b * c == 1]
    idx = {m: i for i, m in enumerate(mats)}; par = list(range(len(mats)))
    def find(i):
        while par[i] != i:
            par[i] = par[par[i]]; i = par[i]
        return i
    def conj(m, g, gi):
        mul = lambda x, y: tuple(tuple(sum(x[i][k] * y[k][j] for k in range(2)) for j in range(2)) for i in range(2))
        return mul(mul(g, m), gi)
    gens = [(((1, 1), (0, 1)), ((1, -1), (0, 1))), (((1, -1), (0, 1)), ((1, 1), (0, 1))),
            (((0, 1), (-1, 0)), ((0, -1), (1, 0)))]
    if gl: gens.append((((1, 0), (0, -1)), ((1, 0), (0, -1))))
    for m in mats:
        for g, gi in gens:
            n = conj(m, g, gi)
            if n in idx: par[find(idx[m])] = find(idx[n])
    return len({find(i) for i in range(len(mats))})

# ---------- the checks -----------------------------------------------------------------------------------------
T = 60
res = {t: classes(t) for t in range(3, T + 1)}
print("trace : classes under SL2(Z), under GL2(Z), M ~ M^-1 in SL2(Z)?")
for t in range(3, 13): print(f"  {t:3d} : {res[t][0]:3d} {res[t][1]:3d}   {res[t][2]}")

report("S1", res[3] == (1, 1, True), "trace 3: one class under SL2(Z); the drive and its inverse are conjugate")
report("S2", all(res[t][0] >= 2 for t in range(4, T + 1)),
       f"every trace 4..{T}: at least two classes under SL2(Z)")
gl_one = [t for t in range(3, T + 1) if res[t][1] == 1]
report("S3", gl_one[:3] == [3, 4, 5], f"traces 3..{T} with ONE class under GL2(Z) (relabelling allowed to reverse orientation): {gl_one}")
selfinv = [t for t in range(3, T + 1) if res[t][2]]
report("S4", selfinv == [3], f"the drive is conjugate in SL2(Z) to its inverse at trace 3 and at no other trace up to {T}")
# S6: method B agrees with method A for small traces (box large enough that the count has stopped changing)
for t, B in ((3, 12), (4, 14), (5, 16), (6, 20)):
    b1, b2 = brute(t, B), brute(t, B + 4)
    g1 = brute(t, B + 4, gl=True)
    report(f"S6.{t}", b1 == b2 == res[t][0] and g1 == res[t][1],
           f"trace {t}: brute force gives {b2} classes under SL2(Z) and {g1} under GL2(Z); forms give {res[t][0]}, {res[t][1]}")
# S7: trace -3.  Classes of trace -t are the negatives of the classes of trace t; -M0 is hyperbolic with the same entropy.
M0 = ((2, 1), (1, 1)); negM0 = ((-2, -1), (-1, -1))
ent = lambda m: math.log(max(abs((m[0][0] + m[1][1] + s * math.sqrt((m[0][0] + m[1][1]) ** 2 - 4)) / 2) for s in (1, -1)))
half = [(0, 0), (1, 0), (0, 1), (1, 1)]          # corners, in units of 1/2
act = lambda m, p: ((m[0][0] * p[0] + m[0][1] * p[1]) % 2, (m[1][0] * p[0] + m[1][1] * p[1]) % 2)
report("S7", abs(ent(M0) - ent(negM0)) < 1e-12 and all(act(M0, p) == act(negM0, p) for p in half)
       and brute(-3, 12) == 1,
       "-M0 (trace -3) has the same entropy as M0, the same action on the four corners, and is the one class of trace -3")
print("ALL PASS" if ok else "SOME FAIL")
