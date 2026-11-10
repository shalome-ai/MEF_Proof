#!/usr/bin/env python3
"""The sign of the lift of the drive to the quaternion units (10 Nov 2026).
Protocol, fixed before running: (1) write the drive M0 as a word in the two generators
S (order 4) and U = ab (order 6) of SL(2,Z), S^2 = U^3 = -I; (2) list every assignment
S -> s, U -> u of unit quaternions that respects those relations and induces on i, j, k
the permutation action of M0 modulo 2 (the corner three-cycle); (3) report the image of M0
and its cube for each.  Also (4) the image of M0 in the abelianisation Z/12 of SL(2,Z)."""
from fractions import Fraction as F
from itertools import product
import math
def mm(A, B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def inv(A): (p, q), (r, s) = A; return ((s, -q), (-r, p))
S = ((0, -1), (1, 0)); a = ((1, 1), (0, 1)); b = ((1, 0), (-1, 1)); U = mm(a, b); M0 = ((2, 1), (1, 1))
Ui = inv(U)
word = mm(mm(mm(Ui, S), mm(Ui, Ui)), S)
print("(1) M0 = U^-1 S U^-2 S :", word == M0, "   S^2 = U^3 = -I :", mm(S, S) == mm(U, mm(U, U)) == ((-1, 0), (0, -1)))
print("    M0 = a b^-1 :", mm(a, inv(b)) == M0, " -> image in the abelianisation Z/12 (a -> 1, b -> 1): 1 - 1 = 0")
# quaternions as 4-tuples of floats
def qm(p, q):
    a1, b1, c1, d1 = p; a2, b2, c2, d2 = q
    return (a1*a2-b1*b2-c1*c2-d1*d2, a1*b2+b1*a2+c1*d2-d1*c2, a1*c2-b1*d2+c1*a2+d1*b2, a1*d2+b1*c2-c1*b2+d1*a2)
def qc(p): return (p[0], -p[1], -p[2], -p[3])
def close(p, q): return all(abs(x-y) < 1e-12 for x, y in zip(p, q))
one = (1.0, 0, 0, 0); mone = (-1.0, 0, 0, 0)
w = (0.5, 0.5, 0.5, 0.5); r = 1/math.sqrt(2)
def name(q):
    for nm, v in [("w", w), ("-w", tuple(-x for x in w)), ("w^-1", qc(w)), ("-w^-1", tuple(-x for x in qc(w))), ("1", one), ("-1", mone)]:
        if close(q, v): return nm
    return str(tuple(round(x, 3) for x in q))
# candidates: u a lift of a third of a turn about (1,1,1) (either sense, either sign);
# s a lift of a half-turn about an axis perpendicular to (1,1,1) exchanging two of i,j,k
us = [w, tuple(-x for x in w), qc(w), tuple(-x for x in qc(w))]
ss = [(0, r, -r, 0), (0, -r, r, 0), (0, r, 0, -r), (0, -r, 0, r), (0, 0, r, -r), (0, 0, -r, r)]
print("(2),(3) assignments respecting s^2 = u^3 and s^4 = u^6 = 1:")
seen = set()
for u, s in product(us, ss):
    if not close(qm(s, s), qm(u, qm(u, u))): continue
    ui = qc(u)
    m = qm(qm(qm(ui, s), qm(ui, ui)), s)
    cube = qm(m, qm(m, m))
    seen.add((name(u), name(m), name(cube)))
for row in sorted(seen): print("    U -> %-6s  M0 -> %-6s  (image of M0)^3 = %s" % row)
print("    w^3 =", name(qm(w, qm(w, w))), "   (-w)^3 =", name(qm(us[1], qm(us[1], us[1]))))
print("(5) -w as a turn: cos(half-angle) = -1/2, half-angle 2pi/3 about -(1,1,1): a turn of 4pi/3; three of them: 4pi")
print("    w  as a turn: cos(half-angle) = +1/2, half-angle  pi/3 about +(1,1,1): a turn of 2pi/3; three of them: 2pi")

print()
print("--- Re-check of the blind check's counterexample (the 48-element lift) ---")
s8 = (0, r, -r, 0); u8 = (0.5, 0.5, -0.5, -0.5)
print("    s = (i-j)/sqrt2, u = (1+i-j-k)/2 :  s^2 = u^3 = -1 :", close(qm(s8, s8), mone) and close(qm(u8, qm(u8, u8)), mone))
m8 = qm(qm(qm(qc(u8), s8), qm(qc(u8), qc(u8))), s8)
print("    image of M0 =", name(m8), "  cube =", name(qm(m8, qm(m8, m8))))
a8 = qm(qc(u8), s8)                       # a = U^-1 S
p = one; n = 0
while True:
    p = qm(p, a8); n += 1
    if close(p, one): break
print("    order of the image of the shear a:", n, " (in the 12-element lift it is",
      next(k for k in range(1, 25) if close(__import__('functools').reduce(qm, [qm(qc(w), (0, r, -r, 0))]*k, one), one)), ")")
for nm, v in [("i", (0, 1.0, 0, 0)), ("j", (0, 0, 1.0, 0)), ("k", (0, 0, 0, 1.0))]:
    img = qm(qm(u8, v), qc(u8)); print("    Ad_u:", nm, "->", tuple(round(x) for x in img[1:]))
