#!/usr/bin/env python3
"""Card S14 (the fibre at one time): the finite and numerical parts.

Reads nothing. Usage, from the repository root:
  python3 papers/M2/checks/S14_fibre.py

(1) The twenty divisors D = a1 P1 + a2 P2 + a3 P3 + a4 P4 of flux three on the
    corners (M1, Definition 7.4). For each, the lift with two states on the
    pillowcase (first lift: 1 + sum floor(a_i/2) states, M1 Lemma 7.5(b), taken
    as given; second lift: 3 less that number) and its signs at the corners
    (first lift (-1)^{a_i}, second lift the negatives), as in
    papers/M2/checks/S04b_lift_signs.py. The divisors whose lift with two states
    has the signs +1,+1,+1,-1 are listed: there are five.
(2) The divisors of four functions, written in by hand from Whittaker and
    Watson, section 20.32, with P1 the origin:
      wp - e_k  : 2 P_k - 2 P1   (k = 2, 3, 4), an even function;
      wp'       : P2 + P3 + P4 - 3 P1, an odd function.
    For each of the twenty divisors D, with P_k the odd corner of its lift with
    two states, integers (c2, c3, c4, ch) are found with
      D - 3 P_k = c2 (2P2 - 2P1) + c3 (2P3 - 2P1) + c4 (2P4 - 2P1) + ch (P2+P3+P4 - 3P1),
    and it is checked that ch is odd exactly when the lift with two states is
    the second lift (the multiplier is then an odd function).
(3) Numerically, for three lattices: wp is even and wp' odd; wp'(P_k) = 0 for
    k = 2, 3, 4; wp - e_k and its first derivative vanish at P_k and the second
    derivative does not (a double zero); wp(P_k) are three different numbers.
    The Weierstrass function is summed over a square block of the lattice; the
    tolerance says how far the truncated sum is trusted.
(4) Numerically: for a function f and g(z) = f(-z), the derivative of g in
    zbar at z is minus that of f at -z (the hand step behind "the fold commutes
    with the operator").
"""
import itertools, cmath, sys

bad = 0
def check(name, ok):
    global bad
    print(("ok   " if ok else "FAIL ") + name)
    if not ok:
        bad += 1

# ---------- (1)
divs = [a for a in itertools.product(range(4), repeat=4) if sum(a) == 3]
check("(1) twenty divisors of flux three", len(divs) == 20)
def states_first(a): return 1 + sum(x // 2 for x in a)
def two_state(a):
    """('first'|'second', signs) of the lift with two states."""
    s1 = states_first(a); s2 = 3 - s1
    assert (s1 == 2) != (s2 == 2)
    first = [(-1) ** x for x in a]
    return ("first", first) if s1 == 2 else ("second", [-x for x in first])
def odd_corner(a):
    lift, s = two_state(a)
    k = [i for i in range(4) if s[i] == -1]
    assert len(k) == 1 and all(s[i] == 1 for i in range(4) if i != k[0])
    return k[0]
five = [a for a in divs if two_state(a)[1] == [1, 1, 1, -1]]
print("    the divisors with signs +,+,+,-:", five, [two_state(a)[0] for a in five])
check("(1) exactly five divisors have the signs +,+,+,-",
      sorted(five) == sorted([(0, 0, 0, 3), (2, 0, 0, 1), (0, 2, 0, 1), (0, 0, 2, 1), (1, 1, 1, 0)]))
check("(1) each corner is the odd corner of five divisors",
      all(sum(1 for a in divs if odd_corner(a) == k) == 5 for k in range(4)))

# ---------- (2)
G = {2: (-2, 2, 0, 0), 3: (-2, 0, 2, 0), 4: (-2, 0, 0, 2)}
H = (-3, 1, 1, 1)
def comb(c2, c3, c4, ch):
    return tuple(c2 * G[2][i] + c3 * G[3][i] + c4 * G[4][i] + ch * H[i] for i in range(4))
ok_all = True; par_ok = True
for a in divs:
    k = odd_corner(a)
    target = tuple(a[i] - (3 if i == k else 0) for i in range(4))
    found = None
    for c in itertools.product(range(-3, 4), repeat=3):
        for ch in (0, 1, -1):
            if comb(c[0], c[1], c[2], ch) == target:
                found = (c[0], c[1], c[2], ch); break
        if found: break
    if not found:
        ok_all = False; continue
    lift = two_state(a)[0]
    if (found[3] % 2 == 1) != (lift == "second"):
        par_ok = False
    if k == 3:
        print("    D =", a, "lift:", lift, " D - 3P4 = c2,c3,c4,ch =", found)
check("(2) every D differs from 3 P_k (k its odd corner) by a combination of the four divisors", ok_all)
check("(2) the coefficient of the divisor of wp' is odd exactly for the second lift", par_ok)

# ---------- (3)
def make_wp(w1, w2, n=60):
    lat = [2 * m * w1 + 2 * k * w2 for m in range(-n, n + 1) for k in range(-n, n + 1) if (m, k) != (0, 0)]
    def wp(z):  return 1 / z**2 + sum(1 / (z - w)**2 - 1 / w**2 for w in lat)
    def wp1(z): return -2 / z**3 - 2 * sum(1 / (z - w)**3 for w in lat)
    def wp2(z): return 6 / z**4 + 6 * sum(1 / (z - w)**4 for w in lat)
    return wp, wp1, wp2
tol = 2e-2
for (w1, w2) in [(0.5, 0.5j), (0.5, 0.2 + 0.6j), (0.5, 0.5 * cmath.exp(1j * cmath.pi / 3))]:
    wp, wp1, wp2 = make_wp(w1, w2)
    half = {2: w1, 3: w2, 4: w1 + w2}          # P2, P3, P4 (P1 is the origin)
    z0 = 0.13 + 0.21j
    check("(3) wp even, wp' odd  [%s]" % (w2,),
          abs(wp(z0) - wp(-z0)) < tol and abs(wp1(z0) + wp1(-z0)) < tol)
    check("(3) wp'(P_k) = 0, k = 2,3,4  [%s]" % (w2,), all(abs(wp1(half[k])) < tol for k in half))
    check("(3) wp - e_k has a double zero at P_k (second derivative not 0)  [%s]" % (w2,),
          all(abs(wp2(half[k])) > 1 for k in half))
    e = [wp(half[k]) for k in (2, 3, 4)]
    check("(3) e_2, e_3, e_4 different  [%s]" % (w2,),
          min(abs(e[0] - e[1]), abs(e[0] - e[2]), abs(e[1] - e[2])) > 1)

# ---------- (4)
def dbar(f, z, h=1e-5):
    fx = (f(z + h) - f(z - h)) / (2 * h); fy = (f(z + 1j * h) - f(z - 1j * h)) / (2 * h)
    return 0.5 * (fx + 1j * fy)
f = lambda z: z.conjugate() ** 2 * z + 3 * z.conjugate() + cmath.exp(z)   # not holomorphic
g = lambda z: f(-z)
z0 = 0.3 - 0.4j
check("(4) dbar of f(-z) at z is minus dbar f at -z", abs(dbar(g, z0) + dbar(f, -z0)) < 1e-6)

print("FAILED: %d" % bad if bad else "all checks pass")
sys.exit(1 if bad else 0)
