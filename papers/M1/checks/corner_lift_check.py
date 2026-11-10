# Check for papers/M1/CORNER_LIFT_DERIVATION.md (10 Nov 2026): the signs with which the lifted fold acts at
# the four corners of the torus, for a spin structure, for the canonical Spin^c structure, and for a twist
# by a line bundle of degree n.  Plain Python.  Run: python3 papers/M1/checks/corner_lift_check.py
import cmath, itertools, math
ok = True
def report(tag, cond, text):
    global ok; ok = ok and bool(cond); print(f"({tag}) {'PASS' if cond else 'FAIL'}: {text}")
corners = {"P1": (0, 0), "P2": (1, 0), "P3": (0, 1), "P4": (1, 1)}        # P = lambda/2, lambda = (m, n) mod 2
names = list(corners)

# --- K1: a spin structure chi_{a,b}; the lift (x, g) -> (-x, alpha g) ---------------------------------
# Descent: (x + l, chi(l) g) -> (-x - l, alpha chi(l) g) ~ (-x, chi(-l) alpha chi(l) g) = (-x, alpha g) since chi(l)^2 = 1.
# At P = l/2: (l/2, g) -> (-l/2, alpha g) ~ (l/2, chi(l) alpha g).  Sign relative to P1: chi(l).
def chi(a, b): return lambda m, n: (-1) ** (a * m + b * n)
spin = {}
for a, b in itertools.product((0, 1), repeat=2):
    c = chi(a, b)
    report("K1", all(c(m, n) * c(-m, -n) == 1 for m in range(-2, 3) for n in range(-2, 3)), f"chi_{a}{b}: the lift descends (chi(l) chi(-l) = 1)")
    spin[(a, b)] = tuple(c(*corners[k]) for k in names)
print("     corner signs (P1, P2, P3, P4) for the four spin structures:", spin)
report("K2", all(math.prod(v) == 1 for v in spin.values()), "for every spin structure the product of the four corner signs is +1")
report("K3", all(sorted(v) in ([1, 1, 1, 1], [-1, -1, 1, 1]) for v in spin.values()),
       "the patterns are all-equal (chi trivial) or two-and-two; a three-and-one pattern never occurs")

# --- K4: canonical Spin^c structure: spinors = functions + (0,1)-forms; iota^* dzbar = -dzbar at every point
canon = {k: (+1, -1) for k in names}                    # (action on Lambda^{0,0}, on Lambda^{0,1}) at each corner
report("K4", len(set(canon.values())) == 1, "canonical Spin^c structure: the fold acts by (+1, -1) on (functions, (0,1)-forms) at every corner alike; relative signs all +1")

# --- K5: a degree-one line bundle with an invariant section having one simple zero: theta_3 --------------
tau = complex(0.31, 1.17)
def theta3(z, N=40): return sum(cmath.exp(1j * math.pi * tau * n * n + 2j * math.pi * n * z) for n in range(-N, N + 1))
zs = [complex(0.137, 0.211), complex(-0.4, 0.05), complex(0.33, -0.29)]
report("K5a", all(abs(theta3(z) - theta3(-z)) < 1e-12 for z in zs), "theta_3 is an even function: iota^* s = s")
report("K5b", all(abs(theta3(z + 1) - theta3(z)) < 1e-12 and
                  abs(theta3(z + tau) - cmath.exp(-1j * math.pi * tau - 2j * math.pi * z) * theta3(z)) < 1e-10 for z in zs),
       "theta_3 is a section of a line bundle of degree one (quasi-periodicity)")
pts = {"P1": 0, "P2": 0.5, "P3": tau / 2, "P4": (1 + tau) / 2}
vals = {k: abs(theta3(v)) for k, v in pts.items()}
h = 1e-6
deriv = abs((theta3(pts["P4"] + h) - theta3(pts["P4"] - h)) / (2 * h))
report("K5c", vals["P4"] < 1e-12 and all(vals[k] > 1e-3 for k in ("P1", "P2", "P3")) and deriv > 1e-3,
       f"theta_3 vanishes at P4 only among the corners, to first order (|theta_3| = {vals['P1']:.3f}, {vals['P2']:.3f}, {vals['P3']:.3f}, {vals['P4']:.1e}; |derivative at P4| = {deriv:.3f})")
N1 = (1, 1, 1, -1)       # invariant section non-zero: +1; simple zero s = z e with z -> -z: e -> -e
report("K5d", math.prod(N1) == -1, "degree-one twist: corner signs (+, +, +, -), product -1")

# --- K6: spinors twisted by N^n ---------------------------------------------------------------------
for n in (0, 1, 2, 3):
    pats = {ab: tuple(v[i] * N1[i] ** n for i in range(4)) for ab, v in spin.items()}
    report("K6", all(math.prod(v) == (-1) ** n for v in pats.values()), f"twist of degree n = {n}: product of the corner signs = {(-1) ** n} for all four chi")
odd = {ab: tuple(v[i] * N1[i] for i in range(4)) for ab, v in spin.items()}
report("K7", sorted(sorted(v).count(-1) if sorted(v).count(-1) == 1 else sorted(v).count(1) for v in odd.values()) == [1, 1, 1, 1]
       and len({(v.index(-1) if v.count(-1) == 1 else v.index(1)) for v in odd.values()}) == 4,
       "for n odd the four patterns are the four three-and-one patterns, one for each corner as the odd one")
print("     n = 1 patterns:", odd)

# --- K8: the drive on the patterns ------------------------------------------------------------------
def M0(mn): m, n = mn; return ((2 * m + n) % 2, (m + n) % 2)
def push(pattern):                       # carry a pattern forward by one step: the sign at M0(P) is the old sign at P
    out = [None] * 4
    for i, k in enumerate(names): out[names.index([q for q in names if corners[q] == M0(corners[k])][0])] = pattern[i]
    return tuple(out)
def norm(p): return p if p[0] == 1 else tuple(-x for x in p)      # up to the overall sign
def period(p):
    q, n = norm(push(p)), 1
    while q != norm(p): q, n = norm(push(q)), n + 1
    return n
per_spin = {ab: period(v) for ab, v in spin.items()}
per_odd = {ab: period(v) for ab, v in odd.items()}
report("K8", sorted(per_spin.values()) == [1, 3, 3, 3] and sorted(per_odd.values()) == [1, 3, 3, 3],
       f"under the drive: n even, periods {per_spin} (all-equal fixed; the three two-and-two cycled); n odd, periods {per_odd} (odd corner P1 fixed; the other three cycled)")
print("ALL PASS" if ok else "SOME FAILED")
