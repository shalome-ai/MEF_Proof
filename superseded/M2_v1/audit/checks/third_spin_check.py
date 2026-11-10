#!/usr/bin/env python3
"""Re-check of the blind check on the PI's guess 'needs 3 spins to get back to unity' (10 Nov 2026).
For each drive: number of points of the pillowcase it returns, and the number of circuits
until every corner is back (order of the matrix modulo 2).  R(X_n) = deficit pi x total
length of the corner curves in the n-circuit shape = 4 pi n."""
from fractions import Fraction as Fr
def fixed_on_pillowcase(M, N=None):
    (p, q), (r, s) = M
    t = p + s
    N = (t - 2) * (t + 2)                      # all solutions of Mz = +-z have denominator dividing this
    pts = set()
    for x in range(N):
        for y in range(N):
            X, Y = (p*x + q*y) % N, (r*x + s*y) % N
            if (X, Y) == (x, y) or (X, Y) == ((-x) % N, (-y) % N):
                pts.add(min((x, y), ((-x) % N, (-y) % N)))
    return len(pts)
def mul(A, B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def period(M):
    I = ((1, 0), (0, 1)); X = M; n = 1
    while tuple(tuple(x % 2 for x in r) for r in X) != I: X = mul(X, M); n += 1
    return n
print("drive            trace  points returned on pillowcase  circuits until all corners back")
for M in [((2,1),(1,1)), ((4,1),(3,1)), ((6,1),(5,1)), ((5,3),(3,2)), ((3,2),(1,1)), ((5,2),(2,1))]:
    print(f"{str(M):<17}{M[0][0]+M[1][1]:<7}{fixed_on_pillowcase(M):<31}{period(M)}")
print("R on the n-circuit shape (units of pi):", {n: 4*n for n in (1, 2, 3, 6)})
