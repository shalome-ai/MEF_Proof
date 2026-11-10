#!/usr/bin/env python3
"""Test of M1 Cor 7.4 (the corner signs of the lifted fold) against the drive (10 Nov 2026).
Protocol, fixed before running: list the eight functions q:(Z/2)^2 -> Z/2 with q(0,0)=0 of
M1's worked case; for each, the corner signs and their product; then how the drive M0 and
each symmetry that fixes all four corners moves it; orbits and periods."""
from itertools import product
pts = [(0, 0), (1, 0), (0, 1), (1, 1)]            # P1, P2, P3, P4 (doubled coordinates)
def act(M, p): return ((M[0][0]*p[0] + M[0][1]*p[1]) % 2, (M[1][0]*p[0] + M[1][1]*p[1]) % 2)
M0 = ((2, 1), (1, 1))
def mm(A, B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def signs(q): return "".join("+" if q[p] == 0 else "-" for p in pts)
def push(M, q):                                   # the pattern after the drive has moved the corners
    return {act(M, p): q[p] for p in pts}
fs = []
for c, a, b in product((0, 1), repeat=3):
    q = {(m, n): (c*m*n + a*m + b*n) % 2 for m, n in pts}
    fs.append((("mn+" if c else "") + f"{a}m+{b}n", c, q))
print("function        signs at P1 P2 P3 P4   product   class        after one circuit   period under the drive")
for nm, c, q in fs:
    prod = (-1) ** sum(q.values()); q1 = push(M0, q); n = 1; x = q1
    while x != q: x = push(M0, x); n += 1
    print(f"{nm:<15} {signs(q):<22} {prod:+d}        {'refinement' if c else 'character ':<12} {signs(q1):<19} {n}")
print()
print("Symmetries that fix all four corners (identity modulo 2) leave every pattern alone:",
      all(push(g, q) == q for _, _, q in fs for g in [((1, 2), (0, 1)), ((1, 0), (2, 1)), ((-1, 0), (0, -1)), ((5, 2), (2, 1))]))
M3 = mm(M0, mm(M0, M0))
print("Three circuits (M0^3 =", M3, ") leave every pattern alone:", all(push(M3, q) == q for _, _, q in fs))
