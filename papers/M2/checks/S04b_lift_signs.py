#!/usr/bin/env python3
"""S04b (the bundle over the pillowcase): the finite and arithmetic parts.

Corners, as M1 v7.3 Appendix B names them: P1=(0,0), P2=(1/2,0), P3=(0,1/2),
P4=(1/2,1/2); C_{m,n}=(m/2,n/2), so P1=C00, P2=C10, P3=C01, P4=C11.

What is checked.
 (1) Over the twenty divisors D = a1 P1 + ... + a4 P4 with a_i >= 0 and
     sum a_i = 3 (flux three, M1 Definition 7.4):
     - the signs of the first lift at the corners are (-1)^{a_i} (M1 Def. 7.4,
       "corner sign"), those of the second lift their negatives (M1 Def. 7.4,
       the second lift is f(z) -> -f(-z));
     - the product of the four signs is -1 for both lifts;
     - the number of states on the pillowcase is 1 + sum floor(a_i/2) for the
       first lift and 3 minus that for the second (M1 Lemma 7.5(b)); exactly
       one of the two lifts has two states;
     - the twist has one odd corner (M1 Def. 7.4: the corner whose sign
       differs from that of the other three);
     - the lift with two states has sign -1 at the odd corner and +1 at the
       other three;
     - with the odd corner at P4 (M1 Cor. 7.7's naming), that lift has the
       signs (+,+,+,-) at (P1,P2,P3,P4), which is (-1)^{mn} at C_{m,n};
     - the sign patterns met, over all twenty divisors and both lifts, are
       exactly the eight patterns of four signs with product -1.
 (2) The corner values of g (gamma in M2-W036) = exp(2 pi i (mu x + nu y)) exp(psi) when
     psi(-z) + psi(z) = 2 pi i ell: at C_{m,n} the value is
     (-1)^{mu m + nu n + ell}; over mu, nu, ell mod 2 the product of the four
     values is +1, and the four values are all +1 exactly when mu, nu, ell
     are all even.  (mu, nu, ell are the letters of write-up log M2-W035 to
     M2-W037, which write theta_psi, theta_omega for x, y, eta for psi, gamma
     for g and beta for h; m, n index the corners as in M1.)
 (3) A numerical check of the construction in the proof: for mu, nu, ell even
     and psi = pi i ell + chi(z) - chi(-z) with chi periodic, the function
     h = exp(-pi i (mu x + nu y)) exp(-psi/2) is periodic and satisfies
     h(-z)/h(z) = g(z) at sample points; and g(-z) g(z) = 1.

What is not checked.  The cited theorems; M1's Lemma 7.5(b), whose count is
taken as given (as M1's own certificate L6 does); that every g with
g(-z)g(z)=1 has the exponential form (that is the lifting criterion, Hatcher
Prop. 1.33); anything continuous beyond the sample points of (3).
"""
from itertools import product
import cmath, math, random

CORNERS = ["P1", "P2", "P3", "P4"]
MN = {"P1": (0, 0), "P2": (1, 0), "P3": (0, 1), "P4": (1, 1)}

# (1) the twenty divisors of flux three on the corners
divisors = [a for a in product(range(4), repeat=4) if sum(a) == 3]
assert len(divisors) == 20

patterns = set()
for a in divisors:
    s1 = tuple((-1) ** ai for ai in a)                 # first lift
    s2 = tuple(-x for x in s1)                         # second lift
    for s in (s1, s2):
        assert math.prod(s) == -1
        patterns.add(s)
    n1 = 1 + sum(ai // 2 for ai in a)                  # M1 Lemma 7.5(b)
    n2 = 3 - n1
    assert sorted((n1, n2)) == [1, 2], (a, n1, n2)
    chosen = s1 if n1 == 2 else s2
    # the odd corner of the twist (M1 Def. 7.4), from the corner signs s1
    odd = [i for i in range(4) if sum(1 for j in range(4) if s1[j] == s1[i]) == 1]
    assert len(odd) == 1, (a, s1)
    o = odd[0]
    assert chosen[o] == -1 and all(chosen[j] == 1 for j in range(4) if j != o), (a, chosen)
    if CORNERS[o] == "P4":
        assert chosen == (1, 1, 1, -1)
        assert chosen == tuple((-1) ** (MN[c][0] * MN[c][1]) for c in CORNERS)
    print(f"D = {a}: first-lift signs {s1}, states {n1}/{n2}; odd corner {CORNERS[o]}; "
          f"the lift with two states is the {'first' if n1 == 2 else 'second'}, signs {chosen}")

all8 = {s for s in product((1, -1), repeat=4) if math.prod(s) == -1}
assert len(all8) == 8 and patterns == all8
print("(1) OK: twenty divisors; product -1 for both lifts; the lift with two states has -1 at the odd corner "
      "and +1 elsewhere; odd corner P4 gives (+,+,+,-) = (-1)^{mn}; all eight patterns of product -1 occur.")

# (2) corner values of g
for mu, nu, ell in product(range(2), repeat=3):
    vals = [(-1) ** (mu * MN[c][0] + nu * MN[c][1] + ell) for c in CORNERS]
    assert math.prod(vals) == 1
    assert (all(v == 1 for v in vals)) == (mu == 0 and nu == 0 and ell == 0)
print("(2) OK: product of the four corner values is +1; all four are +1 iff mu, nu, ell are even.")

# (3) numerical check of the construction
random.seed(1)
def chi(x, y, coeffs):
    return sum(c * cmath.exp(2j * math.pi * (p * x + q * y)) for (p, q, c) in coeffs)
for trial in range(5):
    mu, nu, ell = (2 * random.randint(-2, 2) for _ in range(3))
    coeffs = [(random.randint(-2, 2), random.randint(-2, 2), complex(random.gauss(0, .3), random.gauss(0, .3)))
              for _ in range(4)]
    psi = lambda x, y: math.pi * 1j * ell + chi(x, y, coeffs) - chi(-x, -y, coeffs)
    g = lambda x, y: cmath.exp(2j * math.pi * (mu * x + nu * y)) * cmath.exp(psi(x, y))
    h = lambda x, y: cmath.exp(-1j * math.pi * (mu * x + nu * y)) * cmath.exp(-psi(x, y) / 2)
    for _ in range(50):
        x, y = random.random(), random.random()
        assert abs(g(-x, -y) * g(x, y) - 1) < 1e-9
        assert abs(h(-x, -y) / h(x, y) - g(x, y)) < 1e-9
        assert abs(h(x + 1, y) - h(x, y)) < 1e-9 and abs(h(x, y + 1) - h(x, y)) < 1e-9
print("(3) OK: for mu, nu, ell even, h is periodic and h(-z)/h(z) = g(z) at the sample points; g(-z)g(z) = 1.")
