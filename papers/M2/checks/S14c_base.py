#!/usr/bin/env python3
"""Card S14c: checks for Proposition `prop:wholesupply` (the base and the whole geometry).

(1) On the sphere, in the coordinates z and w = 1/z of M1, l.827, the part of
    type (0,1) of the exterior derivative of a function is the same form
    whichever coordinate is used (numerical, at sample points, with z and its
    conjugate as independent variables, on polynomials with random
    coefficients of degree at most 3 in each variable).
(2) The same on the projective plane for the coordinates (z1, z2) and
    (w1, w2) = (1/z1, z2/z1), numerical, at sample points, on polynomials
    with random coefficients.
(3) The counts: the base has complex dimension 4/2 + 2/2 = 3; the forms of
    type (0,q) of the base have ranks C(3,q) = 1, 3, 3, 1 for q = 0..3 and
    C(3,4) = 0; with ranks 2 along the fibre and 4 on time and space, the
    spinor bundle has rank 2*4*8 = 64 = 2^6, 6 = 12/2.
What is not checked here: the hand steps of the proof (that the operator does
not depend on a basis, and that it commutes with a linear map that does not
depend on the point of the base); they are in the marks of the entries.
Usage, from the repository root:  python3 papers/M2/checks/S14c_base.py
"""
import sys, itertools, random
from math import comb
random.seed(14)
bad = 0
def say(ok, text):
    global bad
    print(("ok   " if ok else "FAIL ") + text); bad += (not ok)
def rc():
    return complex(random.uniform(-1, 1), random.uniform(-1, 1))
def pt():
    return complex(random.uniform(0.5, 1.5), random.uniform(0.5, 1.5))
H = 1e-5
def num_d(fun, args, k):
    """central difference of fun in its k-th argument (the arguments are independent complex variables)"""
    a = list(args); b = list(args); a[k] += H; b[k] -= H
    return (fun(*a) - fun(*b)) / (2 * H)

# (1) the sphere: g(w, wb) = sum c_ij w^i wb^j; w = 1/z, wb = 1/zb
worst = 0.0
for trial in range(20):
    c = {(i, j): rc() for i in range(4) for j in range(4)}
    g = lambda w, wb: sum(v * w**i * wb**j for (i, j), v in c.items())
    g_wb = lambda w, wb: sum(v * j * w**i * wb**(j - 1) for (i, j), v in c.items() if j)
    gz = lambda z, zb: g(1 / z, 1 / zb)
    z, zb = pt(), pt()
    # (dg/dwb) dwb with dwb = -dzb/zb^2, against the derivative of g in zb
    lhs = g_wb(1 / z, 1 / zb) * (-1 / zb**2)
    worst = max(worst, abs(lhs - num_d(gz, (z, zb), 1)))
say(worst < 1e-6, "(1) sphere: the (0,1) part agrees in z and in w = 1/z (20 samples, worst difference %.1e)" % worst)
say(abs(num_d(lambda z, zb: 1 / zb, (pt(), pt()), 0)) < 1e-12, "(1) sphere: dwb has no dz component")

# (2) the projective plane: (w1, w2) = (1/z1, z2/z1)
worst = 0.0
for trial in range(20):
    c = {e: rc() for e in itertools.product(range(3), repeat=4)}
    g = lambda w1, w2, w1b, w2b: sum(v * w1**a * w2**b * w1b**p * w2b**q for (a, b, p, q), v in c.items())
    g1b = lambda w1, w2, w1b, w2b: sum(v * p * w1**a * w2**b * w1b**(p - 1) * w2b**q for (a, b, p, q), v in c.items() if p)
    g2b = lambda w1, w2, w1b, w2b: sum(v * q * w1**a * w2**b * w1b**p * w2b**(q - 1) for (a, b, p, q), v in c.items() if q)
    gz = lambda z1, z2, z1b, z2b: g(1 / z1, z2 / z1, 1 / z1b, z2b / z1b)
    z1, z2, z1b, z2b = pt(), pt(), pt(), pt()
    W = (1 / z1, z2 / z1, 1 / z1b, z2b / z1b)
    # coefficient of dz1b: g1b * d(1/z1b)/dz1b + g2b * d(z2b/z1b)/dz1b ; of dz2b: g2b / z1b
    lhs1 = g1b(*W) * (-1 / z1b**2) + g2b(*W) * (-z2b / z1b**2)
    lhs2 = g2b(*W) / z1b
    worst = max(worst, abs(lhs1 - num_d(gz, (z1, z2, z1b, z2b), 2)), abs(lhs2 - num_d(gz, (z1, z2, z1b, z2b), 3)))
say(worst < 1e-5, "(2) projective plane: the (0,1) part agrees in (z1,z2) and in (1/z1, z2/z1) (20 samples, worst difference %.1e)" % worst)

# (3) counts
say(4 // 2 + 2 // 2 == 3, "(3) complex dimension of the base is 3")
say([comb(3, q) for q in range(5)] == [1, 3, 3, 1, 0], "(3) ranks of the types (0,q): 1, 3, 3, 1, and none of type (0,4)")
say(sum(comb(3, q) for q in range(4)) == 8 and 2 * 4 * 8 == 64 == 2**6 and 12 // 2 == 6, "(3) rank 2*4*8 = 64 = 2^6")
print("FAILED" if bad else "all checks passed"); sys.exit(1 if bad else 0)
