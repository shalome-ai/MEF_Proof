# Re-check of the blind referee's computations for the M1 v3 step audit (10 Nov 2026). Plain Python, exact fractions.
from fractions import Fraction as Fr
import math
def M0(p): return ((2*p[0] + p[1]) % 1, (p[0] + p[1]) % 1)
def neg(p): return ((-p[0]) % 1, (-p[1]) % 1)
N = 60
grid = [(Fr(a, N), Fr(b, N)) for a in range(N) for b in range(N)]      # contains all points of order dividing 60
fix_plus  = [p for p in grid if M0(p) == p]
fix_minus = [p for p in grid if M0(p) == neg(p)]
print("(C1) points of the torus with M0 z = z :", [(str(x), str(y)) for x, y in fix_plus], "(det(M0 - I) = -1: exactly one)")
print("(C2) points of the torus with M0 z = -z:", [(str(x), str(y)) for x, y in fix_minus], "(det(M0 + I) = 5: exactly five)")
classes = {tuple(sorted([p, neg(p)])) for p in fix_plus + fix_minus}
print("     as points of the pillowcase (z ~ -z):", len(classes), "points fixed by the drive:",
      [(str(c[0][0]), str(c[0][1])) for c in sorted(classes)])
print("     so on the PILLOWCASE the drive returns three points to themselves: the corner P1 and two regular points.")
print("(C3) an exponential w(s) = w0 e^{kappa s}, kappa != 0, is not periodic: w(s+1)/w(s) = e^kappa =", round(math.exp(math.log((3+5**0.5)/2)), 4),
      "for kappa = log(phi^2). It is single-valued on the closed time circle only through the gluing by M0, whose eigenvalue is e^kappa.")
