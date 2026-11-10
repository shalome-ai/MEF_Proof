# Independent checks for the step audit of the theorems M1 inherits from v2 (STEP_AUDIT.md section 9).
# Plain Python.  Run: python3 papers/M1/checks/inherited_checks.py
import itertools, math
from fractions import Fraction as Fr
ok = True
def report(tag, cond, text):
    global ok; ok = ok and bool(cond); print(f"({tag}) {'PASS' if cond else 'FAIL'}: {text}")
def mul(A, B): return ((A[0]*B[0]+A[1]*B[2], A[0]*B[1]+A[1]*B[3]), (A[2]*B[0]+A[3]*B[2], A[2]*B[1]+A[3]*B[3]))
def M(a, b, c, d): return (a, b, c, d)
def mm(A, B): return (A[0]*B[0]+A[1]*B[2], A[0]*B[1]+A[1]*B[3], A[2]*B[0]+A[3]*B[2], A[2]*B[1]+A[3]*B[3])
def inv(A): return (A[3], -A[1], -A[2], A[0])
def conj(g, A): return mm(mm(g, A), inv(g))
M0 = (2, 1, 1, 1); T = (1, 1, 0, 1); Ti = (1, -1, 0, 1); S = (0, 1, -1, 0)

# --- I1 (Theorem 4.2): every trace-three element of SL2(Z) with small entries is conjugate to M0 -------------
# Breadth-first search of the conjugacy orbit of M0 under the generators S, T of SL2(Z), entries bounded by B.
B, N = 400, 40
orbit, frontier = {M0}, [M0]
while frontier:
    nxt = []
    for A in frontier:
        for g in (S, T, Ti):
            C = conj(g, A)
            if max(map(abs, C)) <= B and C not in orbit: orbit.add(C); nxt.append(C)
    frontier = nxt
allt3 = [(a, b, c, 3 - a) for a in range(-N, N + 1) for b in range(-N, N + 1) if b != 0
         for c in [Fr(a * (3 - a) - 1, b)] if c.denominator == 1 and abs(c) <= N for c in [int(c)]]
missing = [A for A in allt3 if A not in orbit]
report("I1", len(allt3) >= 50 and not missing,
       f"all {len(allt3)} elements of SL2(Z) of trace 3 with entries up to {N} lie in the conjugacy orbit of M0 (a check, not a proof; M1 Thm 4.2)")
report("I2", conj(S, M0) == inv(M0), "S M0 S^-1 = M0^-1")

# --- I3 (Proposition 4.1): trace and type, on a sample -----------------------------------------------------
def order(A, cap=13):
    P = A
    for n in range(1, cap):
        if P == (1, 0, 0, 1): return n
        P = mm(P, A)
    return None
sample = [(a, b, c, d) for a, b, c, d in itertools.product(range(-3, 4), repeat=4) if a * d - b * c == 1]
report("I3", all((order(A) is not None) == (abs(A[0] + A[3]) < 2 or A in ((1, 0, 0, 1), (-1, 0, 0, -1))) for A in sample),
       "in a sample of SL2(Z): finite order exactly when |trace| < 2 (or the matrix is +-1)")
lam = (3 + 5 ** 0.5) / 2
report("I4", abs(lam - ((1 + 5 ** 0.5) / 2) ** 2) < 1e-12 and abs(math.log(lam) - 0.9624236501) < 1e-9, "eigenvalue of M0 is phi^2, entropy 2 log phi = 0.962424")

# --- I5 (Theorem 5.7, Theorem 7.10): Euler characteristics ---------------------------------------------------
chi_orb = 2 - 4 * Fr(1, 2); chi_pillow = Fr(0 + 4, 2)
report("I5", chi_orb == 0 and chi_pillow == 2 and 3 * 2 * 2 == 12, "orbifold Euler characteristic 0; chi(pillowcase) = (0 + 4)/2 = 2; chi(K8) = 3*2*2 = 12")

# --- I6 (Proposition 5.5): an orientation-preserving involution of the torus with isolated fixed points -------
# Riemann-Hurwitz for the quotient Q with k cone points of order 2: 0 = chi(T^2) = 2 (chi(Q) - k/2).
sols = [(chiQ, k) for chiQ in (2, 0) for k in range(0, 9) if 2 * (chiQ - Fr(k, 2)) == 0]
report("I6", sols == [(2, 4), (0, 0)], "the quotient is a sphere with exactly four cone points, or a torus with none: four fixed points are forced in dimension two")

# --- I7 (Theorem 6.1): the dimension arithmetic -----------------------------------------------------------------
report("I7", [D for D in range(4, 17) if D % 4 == 0 and (D - 4) // 4 >= 2] == [12, 16], "D divisible by four with an internal factor of quaternionic dimension at least two: 12, 16, ...")
report("I8", sorted((s, b) for s in range(0, 10) for b in range(0, 10) if s + b == 9 and (s + 1) % 4 == 0 and (b + 2) % 4 == 0) == [(3, 6), (7, 2)],
       "the split within twelve: (3, 6) and (7, 2) meet the congruences")

# --- I9 (Proposition 7.2, 7.3): Chern class of CP^2 ----------------------------------------------------------------
c = [math.comb(3, k) for k in range(3)]                      # (1 + h)^3 mod h^3
report("I9", c == [1, 3, 3] and 3 % 2 == 1, "c(TCP^2) = 1 + 3h + 3h^2; c1 = 3h is odd, so w2 = h mod 2 is not zero")

# --- I10 (Proposition 8.2): the cubic ---------------------------------------------------------------------------
f = lambda u: 6 * u**3 + u**2 - 72 * u - 4
u = 3.4
for _ in range(60): u = u - f(u) / (18 * u * u + 2 * u - 72)
Qw, Qc = 6, 3
report("I10", abs(f(u)) < 1e-9 and abs(u ** 0.5 - 1.8466) < 5e-5 and abs(Qw**2 * (18*u + 1) - Qc**2 * u**2 * (6*u + 1)) < 1e-6,
       f"the cubic has the positive root u = {u:.6f}, sqrt = {u**0.5:.4f}, and satisfies the constraint at (3, 6)")
# --- I11 (Theorem 4.2, the descent): conjugation by T^k and S alone carries every trace-three element to M0 ------
def descend(A, cap=200):
    a, b, c, d = A; steps = 0
    while steps < cap:
        steps += 1
        if c == 0 or b == 0: return None, steps                 # impossible for trace three, determinant one
        k = round((3 - 2 * a) / (2 * c)); A = conj((1, k, 0, 1), A); a, b, c, d = A      # now |2a - 3| <= |c|
        if abs(2 * a - 3) > abs(c): return None, steps
        if abs(c) == 1:
            k = (2 - a) if c == 1 else (a - 1); A = conj((1, k, 0, 1), A)                 # a = 2 (c = 1) or a = 1 (c = -1)
            if A == M0: return A, steps
            if A == inv(M0): return conj(S, inv(M0)) if conj(S, inv(M0)) == M0 else None, steps
            # c = -1 normalised the other way round: one quarter-turn and repeat
            A = conj(S, A); a, b, c, d = A; continue
        if abs(c) % 2 == 0 or abs(b) >= abs(c): return None, steps      # c is always odd, and |b| < |c| after the shift
        A = conj(S, A); a, b, c, d = A                                    # the lower-left entry becomes -b: smaller
    return None, steps
import random
random.seed(3)
big = []
for _ in range(400):                                   # random conjugates of M0 with large entries
    A = M0
    for _ in range(random.randint(5, 40)): A = conj(random.choice((S, T, Ti)), A)
    big.append(A)
res = [descend(A) for A in allt3 + big]
report("I11", all(r[0] == M0 for r in res),
       f"the descent of M1 Thm 4.2 (shift a by T^k until |2a-3| <= |c|, then a quarter-turn) reaches M0 from all {len(allt3)} small and {len(big)} large trace-three matrices; longest run {max(r[1] for r in res)} steps")
report("I12", all((a * a - 3 * a + 1) % 2 == 1 for a in range(-50, 51)), "a^2 - 3a + 1 is odd for every integer a: b and c are odd, and |c| = 2 never occurs")
print("ALL PASS" if ok else "SOME FAILED")
