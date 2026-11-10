# Finite checks for the M3 step audit. Plain Python.
from itertools import product
print("(B3) Homomorphisms pi_1(S^2 minus 4 points) -> Z/2: assignments (c1..c4) with c1+c2+c3+c4 = 0 mod 2")
homs = [c for c in product((0, 1), repeat=4) if sum(c) % 2 == 0]
print("     all homomorphisms:", len(homs))
branched_at_all_four = [c for c in homs if all(c)]
print("     with every puncture loop sent to the non-trivial element:", branched_at_all_four, "-> count", len(branched_at_all_four))
print("     for comparison, branched at exactly 2 of the 4 points:", len([c for c in homs if sum(c) == 2]), "(these covers are spheres, not tori)")
print("(B5) Riemann-Hurwitz: chi(cover) = 2*chi(S^2) - (number of branch points) =", 2*2 - 4, "-> genus", (2 - (2*2 - 4))//2)
print("(B1) Fixed points of z -> -z on T^2 = R^2/Z^2: half-lattice points:",
      [(a/2, b/2) for a in (0, 1) for b in (0, 1)])
print("(A1) The fold -I commutes with M0 = [[2,1],[1,1]]:",
      [[-2, -1], [-1, -1]] == [[2*-1 + 1*0, 2*0 + 1*-1], [1*-1 + 1*0, 1*0 + 1*-1]])
print("(A, setting) M0 has no invariant integer character except 0: solve (m,n) M0 = (m,n) over Z, |m|,|n| <= 50:",
      [(m, n) for m in range(-50, 51) for n in range(-50, 51) if (2*m + n, m + n) == (m, n)])
print("     so the only M0-invariant Fourier mode on T^2 is the constant one (each non-zero mode has an infinite orbit).")

print()
print("--- Re-check of the blind referee's claims (10 Nov 2026) ---")
def mul(A, B): return [[sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
M0 = [[2, 1], [1, 1]]; negM0 = [[-2, -1], [-1, -1]]
pts = [(0, 0), (1, 0), (0, 1), (1, 1)]                      # 2-torsion points, in units of 1/2
act = lambda A, p: ((A[0][0]*p[0] + A[0][1]*p[1]) % 2, (A[1][0]*p[0] + A[1][1]*p[1]) % 2)
print("(E1) M0 on the four fixed points of the fold:", {p: act(M0, p) for p in pts})
print("     -M0 acts on them identically:", all(act(M0, p) == act(negM0, p) for p in pts))
print("     so in the mapping torus the fixed locus is two circles: one through (0,0) covering the base once, one through the other three covering it three times")
det = lambda A: A[0][0]*A[1][1] - A[0][1]*A[1][0]
I = [[1, 0], [0, 1]]
sub = lambda A, B: [[A[i][j] - B[i][j] for j in range(2)] for i in range(2)]
print("(E2) trace and |eigenvalue|: M0 trace", M0[0][0]+M0[1][1], "; -M0 trace", negM0[0][0]+negM0[1][1], "; both have |lambda| = phi^2, the same entropy")
print("(E3) det(M0 - I) =", det(sub(M0, I)), " det(-M0 - I) =", det(sub(negM0, I)))
def coker_order(A):                                           # |coker| of an integer 2x2 matrix = |det| when nonzero
    return abs(det(A))
from math import gcd
def invariant_factors(A):
    g = gcd(gcd(abs(A[0][0]), abs(A[0][1])), gcd(abs(A[1][0]), abs(A[1][1])))
    return (g, abs(det(A))//g)
print("     invariant factors of M0 - I :", invariant_factors(sub(M0, I)), "-> fibre contributes no torsion to H_1 of the mapping torus of M0")
print("     invariant factors of -M0 - I:", invariant_factors(sub(negM0, I)), "-> fibre contributes Z/5 to H_1 of the mapping torus of -M0")
print("     (uses the standard formula H_1(mapping torus of A on T^2) = Z + coker(A - I); formula RECALLED, arithmetic CHECKED)")
print("(E4) M0 and -M0 induce the same map on T^2/(z ~ -z): -M0 z = M0(-z) ~ M0 z. True by inspection.")
