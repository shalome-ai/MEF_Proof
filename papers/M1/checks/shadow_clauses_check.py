# Check for papers/M1/SHADOW_TWO_CLAUSES.md (10 Nov 2026).
# States on the fibre torus E = C/(Z + tau Z) for a line of degree d, how the fold z -> -z acts on them,
# and which structures the drive carries to themselves.  numpy only.
# Run: python3 papers/M1/checks/shadow_clauses_check.py
import itertools, math, cmath
import numpy as np
rng = np.random.default_rng(7)
tau = complex(0.31, 1.17)
q = cmath.exp(1j * math.pi * tau)
def theta1(z):                                  # odd, simple zeros exactly at the lattice points
    z = np.asarray(z, dtype=complex)
    return sum(2 * (-1) ** n * q ** ((n + 0.5) ** 2) * np.sin((2 * n + 1) * math.pi * z) for n in range(0, 30))
P = {1: 0.0, 2: 0.5, 3: tau / 2, 4: (1 + tau) / 2}
ok = True
def report(tag, cond, text):
    global ok; ok = ok and bool(cond); print(f"({tag}) {'PASS' if cond else 'FAIL'}: {text}")

# --- Z1: the four spin structures of the flat torus, no flux: lowest eigenvalue of the Dirac operator ---------
# spinors psi(x + l) = chi(l) psi(x); D^2 = -Laplacian; eigenvalues 4 pi^2 |k + a/2|^2, k in Z^2, a in {0,1}^2 (unit square torus)
low = {}
for a in itertools.product((0, 1), repeat=2):
    low[a] = min(2 * math.pi * math.hypot(k1 + a[0] / 2, k2 + a[1] / 2) for k1 in range(-3, 4) for k2 in range(-3, 4))
report("Z1", low[(0, 0)] == 0 and abs(low[(1, 0)] - math.pi) < 1e-12 and abs(low[(0, 1)] - math.pi) < 1e-12
       and abs(low[(1, 1)] - math.pi * math.sqrt(2)) < 1e-12,
       "no flux: the untwisted structure has zero modes (constants); each of the three half-turn twists has none "
       "(lowest |eigenvalue| pi, pi, pi*sqrt(2) on the unit square torus)")

# --- the space L(D) of functions with poles bounded by D, and the fold on it ----------------------------------
def basis_functions(D, count):
    poles = [P[i] for i in sorted(D) for _ in range(D[i])]
    d = len(poles); fs = []
    for _ in range(count):
        a = [complex(rng.uniform(-.4, .4), rng.uniform(-.4, .4)) for _ in range(d - 1)]
        a.append(sum(poles) - sum(a))                                   # sum of zeros = sum of poles: an elliptic function
        fs.append(lambda z, a=a: np.prod([theta1(z - x) for x in a], axis=0) / np.prod([theta1(z - p) for p in poles], axis=0))
    return fs
def analyse(D):
    d = sum(D.values())
    zs = np.array([complex(rng.uniform(.07, .43), rng.uniform(.09, .5)) for _ in range(60)])
    fs = basis_functions(D, d + 2)
    F = np.array([f(zs) for f in fs]).T                                 # samples x (d + 2)
    sv = np.linalg.svd(F, compute_uv=False); sv = sv / sv[0]
    rank = int((sv > 1e-8).sum())
    B = F[:, :d]; G = np.array([f(-zs) for f in fs[:d]]).T
    A = np.linalg.lstsq(B, G, rcond=None)[0]                            # f_j(-z) = sum_k A_kj f_k(z)
    ev = np.linalg.eigvals(A)
    plus, minus = int((abs(ev - 1) < 1e-5).sum()), int((abs(ev + 1) < 1e-5).sum())
    return rank, plus, minus
def pattern(D):
    p = tuple((-1) ** D.get(i, 0) for i in (1, 2, 3, 4))
    return p if p[0] == 1 else tuple(-x for x in p)                     # up to the overall sign
drive = {1: 1, 2: 3, 3: 4, 4: 2}
def moved(D): return {drive[i]: m for i, m in D.items()}
def period(D):
    n, E = 1, moved(D)
    while pattern(E) != pattern(D): n, E = n + 1, moved(E)
    return n
def name(D): return " + ".join((f"{m}" if m > 1 else "") + f"P{i}" for i, m in sorted(D.items()))

rows = []
for d in (1, 2, 3, 4):
    for mult in itertools.product(range(d + 1), repeat=4):
        if sum(mult) != d: continue
        D = {i + 1: m for i, m in enumerate(mult) if m}
        rank, plus, minus = analyse(D)
        pat = pattern(D)
        expect = (d + sum((-1) ** D.get(i, 0) for i in (1, 2, 3, 4)) / 2) / 2
        rows.append((d, name(D), rank, plus, minus, pat, period(D), expect))
report("Z2", all(r[2] == r[0] for r in rows), "dim L(D) = deg D for every divisor on the corners up to degree 4 (numerical rank)")
report("Z3", all(r[3] + r[4] == r[0] for r in rows), "the fold acts on L(D) with eigenvalues +1 and -1 only")
report("Z4", all(abs(r[3] - r[7]) < 1e-9 for r in rows), "number of even states = (deg D + half the sum of the corner signs)/2 in every case")
report("Z5", all((r[6] == 1) == (r[5] in ((1, 1, 1, 1), (1, -1, -1, -1))) for r in rows) and all(r[6] in (1, 3) for r in rows),
       "the drive carries a pattern to itself only if all corners are alike or the odd corner is P1; every other pattern returns after three steps")
print("\n deg  divisor                rank  even odd  pattern(P1..P4)    period under the drive")
for r in rows: print(f"  {r[0]}   {r[1]:<22} {r[2]}     {r[3]}    {r[4]}   {str(r[5]):<18} {r[6]}")

def least(test):
    for d in (1, 2, 3, 4):
        hit = [r for r in rows if r[0] == d and test(r)]
        if hit: return d, hit
R1 = lambda r: r[6] != 1                               # not carried to itself by the drive
R2 = lambda r: max(r[3], r[4]) >= 2                    # two independent states on the pillowcase, for one of the two lifts
R2torus = lambda r: r[0] >= 2                          # two independent states on the torus
d1, h1 = least(R1); d2, h2 = least(R2); d12, h12 = least(lambda r: R1(r) and R2(r)); d12t, h12t = least(lambda r: R1(r) and R2torus(r))
print(f"\n least degree with a structure the drive moves (clause I alone, with flux): {d1}: {[r[1] for r in h1]}")
print(f" least degree with two states on the pillowcase (clause II alone): {d2}: {[r[1] for r in h2]}")
print(f" least degree with both: {d12}: {[(r[1], 'even/odd', r[3], r[4], r[5]) for r in h12]}")
print(f" if the two states are counted on the torus instead: {d12t}: {[(r[1], r[3], r[4], r[5]) for r in h12t]}")
report("Z6", d2 == 2 and all(r[6] == 1 for r in h2), "clause II alone: two units, and every such structure is one the drive leaves in place")
report("Z7", d12 == 3 and all(sorted(r[5]).count(-1) in (1, 3) for r in h12), "clauses I and II together: three units, one odd corner, a cycled one")
report("Z8", d12t == 2, "with states counted on the torus the least is two units (two corners of each sign)")
print("ALL PASS" if ok else "SOME FAILED")
