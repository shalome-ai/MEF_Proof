#!/usr/bin/env python3
"""Consequences of ruling (b) (Decision Log P28): numbers for a time circle of three steps of the drive.
Protocol fixed first: (1) M0^3, its trace, eigenvalue, entropy; (2) points of the pillowcase returned
by M0^n, n = 1, 2, 3; (3) the least hyperbolic trace among symmetries that fix all four corners
(identity modulo 2), and whether such a least element is a power of anything; (4) S M0^3 S^-1 = M0^-3."""
import math
def mm(A, B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def inv(A): (p, q), (r, s) = A; return ((s, -q), (-r, p))
M0 = ((2, 1), (1, 1)); S = ((0, -1), (1, 0)); phi = (1 + 5 ** .5) / 2
M3 = mm(M0, mm(M0, M0))
t = M3[0][0] + M3[1][1]
print("(1) M0^3 =", M3, " trace", t, " identity mod 2:", all((M3[i][j] - (i == j)) % 2 == 0 for i in range(2) for j in range(2)))
print("    stretch over three steps: phi^6 =", round(phi ** 6, 4), "= (t+sqrt(t^2-4))/2 =", round((t + (t*t - 4) ** .5) / 2, 4),
      "; entropy 6 log phi =", round(6 * math.log(phi), 4), " (per step 2 log phi =", round(2 * math.log(phi), 4), ")")
def returned(M):
    tr = M[0][0] + M[1][1]; return tr          # blind check of 10 Nov: points of the pillowcase returned = trace (odd or even checked below)
def returned_brute(M):
    (p, q), (r, s) = M; tr = p + s; N = (tr - 2) * (tr + 2); pts = set()
    for x in range(N):
        for y in range(N):
            X, Y = (p*x + q*y) % N, (r*x + s*y) % N
            if (X, Y) in ((x, y), ((-x) % N, (-y) % N)): pts.add(min((x, y), ((-x) % N, (-y) % N)))
    return len(pts)
P = M0
for n in (1, 2, 3):
    print(f"(2) n = {n}: trace {P[0][0]+P[1][1]}, points of the pillowcase returned: {returned_brute(P)}"); P = mm(P, M0)
best = None
for a in range(-9, 10, 2):
    for d in range(-9, 10, 2):
        for b in range(-8, 9, 2):
            for c in range(-8, 9, 2):
                if a*d - b*c == 1 and abs(a + d) > 2:
                    if best is None or abs(a + d) < best[0]: best = (abs(a + d), ((a, b), (c, d)))
print("(3) least |trace| of a hyperbolic symmetry fixing all four corners:", best[0], " e.g.", best[1],
      " entropy", round(math.log((best[0] + (best[0] ** 2 - 4) ** .5) / 2), 4))
print("    is trace 6 the trace of a square or cube in SL(2,Z)?  t^2-2=6:", any(x*x - 2 == 6 for x in range(10)),
      "  t^3-3t=6:", any(x**3 - 3*x == 6 for x in range(10)))
print("(4) S M0^3 S^-1 = M0^-3 :", mm(mm(S, M3), inv(S)) == inv(M3))
