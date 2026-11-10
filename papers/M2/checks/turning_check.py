# The lead: "zeta couples the pillowcase to spacetime through the fibres" -- an accumulated angle along the fibres.
# PROTOCOL fixed before running. Name the additive quantity FIRST, then compute it; report whatever comes out.
#   Q1. Turning accumulated in one circuit of time along each fibre of the drive's flow that closes after one circuit
#       (the three returned points of the pillowcase), and its sum. Turning = the rotation part of the return map there.
#   Q2. Turning of the drive itself and of the pillowcase's symmetries, measured by the one additive count the torus's
#       symmetry group carries: write the element as a product of the two elementary shears a, b and their inverses,
#       and add the exponents. (Additive by construction; defined up to the relations of the group.)
import math
def mul(X, Y): return ((X[0][0]*Y[0][0] + X[0][1]*Y[1][0], X[0][0]*Y[0][1] + X[0][1]*Y[1][1]),
                       (X[1][0]*Y[0][0] + X[1][1]*Y[1][0], X[1][0]*Y[0][1] + X[1][1]*Y[1][1]))
def word(*ms):
    r = ((1, 0), (0, 1))
    for m in ms: r = mul(r, m)
    return r
a  = ((1, 1), (0, 1)); ai = ((1, -1), (0, 1))
b  = ((1, 0), (-1, 1)); bi = ((1, 0), (1, 1))
I  = ((1, 0), (0, 1)); F = ((-1, 0), (0, -1)); S = ((0, 1), (-1, 0)); M0 = ((2, 1), (1, 1))
print("Q1. Rotation part of the return map at the three returned points, per circuit:")
print("    corner P1: return map M0, both eigenvalues positive -> rotation part 0")
print("    two ordinary points: return map -M0 = (half-turn) x M0 -> rotation part pi each")
print("    sum per circuit: 0 + pi + pi = %.4f = 2 pi" % (2*math.pi))
print()
print("Q2. The elementary shears a = [[1,1],[0,1]], b = [[1,0],[-1,1]].")
print("    relation a b a = b a b :", word(a, b, a) == word(b, a, b))
print("    quarter-turn  S  = a b a           :", word(a, b, a) == S, "   -> 3 shears")
print("    the fold     -I  = (a b)^3         :", word(a, b, a, b, a, b) == F, "   -> 6 shears")
print("    full turn     I  = (a b)^6         :", word(*([a, b]*6)) == I, "   -> 12 shears")
print("    the drive    M0  = a b^-1          :", word(a, bi) == M0, "   -> 1 - 1 = 0 shears net")
print("    so, in shears:  quarter-turn 3,  fold 6,  full turn 12,  drive 0.   One shear = 1/12 of a full turn = pi/6.")
print("    the count is defined only up to 12, because (a b)^6 = I has 12 letters and is the identity.")
