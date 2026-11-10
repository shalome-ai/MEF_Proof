# Counts on the pillowcase and its drive, written before any comparison with a target (10 Nov 2026).
# PROTOCOL (fixed before running): count, in M1's geometry only, every natural finite set attached to
# "what the drive's flow returns to the pillowcase", and the pillowcase's own counting invariants.
# Report every count, whatever it is. No count is adjusted, combined or multiplied after the run.
from fractions import Fraction as Fr
from itertools import product
def mat_pow(n):
    a, b, c, d = 1, 0, 0, 1
    for _ in range(n): a, b, c, d = 2*a + b, a + b, 2*c + d, c + d      # multiply by M0 = [[2,1],[1,1]] on the right
    return a, b, c, d
def apply(M, p): return ((M[0]*p[0] + M[1]*p[1]) % 1, (M[2]*p[0] + M[3]*p[1]) % 1)
def neg(p): return ((-p[0]) % 1, (-p[1]) % 1)
def torus_points(den): return [(Fr(a, den), Fr(b, den)) for a in range(den) for b in range(den)]

print("C1. Points of the pillowcase returned to themselves after n circuits of the drive (M0^n z = +z or -z, with z ~ -z):")
for n in (1, 2, 3, 4):
    M = mat_pow(n); tr = M[0] + M[3]
    den = (tr + 2)*(tr - 2)                     # every solution has order dividing det(M-I)*det(M+I)
    plus  = [p for p in torus_points(abs(den)) if apply(M, p) == p]
    minus = [p for p in torus_points(abs(den)) if apply(M, p) == neg(p)]
    both = set(plus) | set(minus)
    classes = {tuple(sorted([p, neg(p)])) for p in both}
    corners = [c for c in classes if c[0] == neg(c[0])]
    halfturn = {tuple(sorted([p, neg(p)])) for p in minus if p != neg(p)}
    print("  n=%d: trace(M0^n)=%d | on the torus: %d with +z, %d with -z, %d in all | on the pillowcase: %d points = %d corners + %d ordinary; of the ordinary, %d return with a half-turn (as -z)"
          % (n, tr, len(plus), len(minus), len(both), len(classes), len(corners), len(classes) - len(corners), len(halfturn)))
print()
print("C2. The four corners under the drive: orbits =", "{P1} fixed; {P2,P3,P4} one cycle of length 3")
print()
print("C3. Counting invariants of the pillowcase T^2/(z ~ -z) itself:")
print("  topological Euler characteristic: (chi(T^2) + #fixed)/2 = (0 + 4)/2 =", (0 + 4)//2)
print("  Betti numbers of the underlying sphere: (1, 0, 1); sum =", 1 + 0 + 1)
pairs = [(g, h) for g, h in product((0, 1), repeat=2)]            # commuting pairs in Z_2
chi_fix = {(0, 0): 0, (0, 1): 4, (1, 0): 4, (1, 1): 4}              # chi of the common fixed set: torus (0) or four points
print("  orbifold (sector-counting) Euler number: (1/2) * sum over the four sectors of chi(fixed set) = (1/2)*(%s) = %s"
      % (" + ".join(str(chi_fix[p]) for p in pairs), Fr(sum(chi_fix.values()), 2)))
print("    sectors contributing zero: 1 (the untwisted one); sectors contributing: 3; contribution of each: 4/2 =", Fr(4, 2))
print()
print("C4. Counting invariants of the other factors (M1 Thm 7.6): Betti sums  CP^2: 3 (1,0,1,0,1);  S^2: 2 (1,0,1)")
print("    product over K_8 with the topological count of the pillowcase: 3 * 2 * 2 =", 3*2*2)
print("    product over K_8 with the sector count of the pillowcase:      3 * 2 * 6 =", 3*2*6)
