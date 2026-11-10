# Does anything double the pillowcase's six? (10 Nov 2026)
# PROTOCOL, fixed before running. The PI's candidate for the last factor of 2 is "the warp" (the two sides,
# psi and its chiral twin), with "the spin" as the alternative. Each candidate is turned into a definite
# group acting on the torus, and the SAME counting formula that gave six is applied to each, unchanged:
#     count(G) = (1/|G|) * sum over commuting pairs (g,h) in G of chi( common fixed set of g and h on T^2 ).
# Every candidate's count is reported. Nothing is multiplied or combined afterwards.
#   G1  the fold alone, Z2 = {1, -I}                                   (the baseline that gave six)
#   G2  the warp's exchange as a symmetry of the torus: the quarter-turn S, Z4 = {1, S, -I, S^3}
#       (in M2 the exchange is S together with a reversal of the flow, and its square is the fold)
#   G3  the spin: the fold lifted to spinors. A turn by pi lifts to an element J with J^2 = -1, so the
#       group acting on spinors is Z4 = {1, J, -1, -J}; on the torus J and -J act as the fold, 1 and -1 as nothing
#   G4  both: the quarter-turn lifted to spinors, Z8, acting on the torus through Z4
from fractions import Fraction as Fr
I2 = ((1, 0), (0, 1)); S = ((0, 1), (-1, 0)); F = ((-1, 0), (0, -1)); S3 = ((0, -1), (1, 0))
def act(A, p): return ((A[0][0]*p[0] + A[0][1]*p[1]) % 1, (A[1][0]*p[0] + A[1][1]*p[1]) % 1)
pts = [(Fr(a, 4), Fr(b, 4)) for a in range(4) for b in range(4)]       # contains every fixed point of S, -I, S^3
def chi_common_fixed(A, B):
    if A == I2 and B == I2: return 0                                   # the whole torus, chi = 0
    return sum(1 for p in pts if act(A, p) == p and act(B, p) == p)    # finitely many points
def count(elements):                                                    # elements: list of matrices (repeats allowed = non-effective action)
    n = len(elements)                                                   # all groups here are cyclic, so every pair commutes
    return Fr(sum(chi_common_fixed(g, h) for g in elements for h in elements), n)
G1 = [I2, F]
G2 = [I2, S, F, S3]
G3 = [I2, F, I2, F]                       # 1, J, -1, -J acting on the torus as 1, fold, 1, fold
G4 = [I2, S, F, S3, I2, S, F, S3]         # Z8 acting through Z4
print("fixed points on the torus:  S:", chi_common_fixed(S, S), "  fold:", chi_common_fixed(F, F), "  S^3:", chi_common_fixed(S3, S3))
for name, G, what in (("G1", G1, "the fold alone"), ("G2", G2, "the warp's exchange as a quarter-turn of the torus"),
                      ("G3", G3, "the spin lift of the fold"), ("G4", G4, "the spin lift of the quarter-turn")):
    print("%s  %-52s |G| = %d   count = %s" % (name, what, len(G), count(G)))
print()
print("General fact used by G3 and G4, checked on these cases: if a subgroup K of G acts as nothing on the torus,")
print("count(G) = |K| * count(G/K).  G3: 2 * %s = %s.  G4: 2 * %s = %s." % (count(G1), 2*count(G1), count(G2), 2*count(G2)))
