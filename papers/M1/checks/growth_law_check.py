# Check for papers/M1/GROWTH_LAW_17_20.md (10 Nov 2026): M1 Def 2.2 (A2, formal) tested against
# (a) the drive's stretch of the torus along time, (b) a function of position on the pillowcase.
# Plain Python; exact arithmetic in Q(sqrt5) (numbers a + b*sqrt5 with a, b rational).
# Run: python3 papers/M1/checks/growth_law_check.py
from fractions import Fraction as Fr
import math

class Q5:
    def __init__(s, a, b=0): s.a, s.b = Fr(a), Fr(b)
    def __add__(s, o): o = q(o); return Q5(s.a + o.a, s.b + o.b)
    __radd__ = __add__
    def __neg__(s): return Q5(-s.a, -s.b)
    def __sub__(s, o): return s + (-q(o))
    def __rsub__(s, o): return q(o) - s
    def __mul__(s, o): o = q(o); return Q5(s.a * o.a + 5 * s.b * o.b, s.a * o.b + s.b * o.a)
    __rmul__ = __mul__
    def inv(s): n = s.a * s.a - 5 * s.b * s.b; return Q5(s.a / n, -s.b / n)
    def __eq__(s, o): o = q(o); return s.a == o.a and s.b == o.b
    def __float__(s): return float(s.a) + float(s.b) * 5 ** 0.5
def q(x): return x if isinstance(x, Q5) else Q5(x)

phi = Q5(Fr(1, 2), Fr(1, 2))
phi2, phim2 = phi * phi, (phi * phi).inv()
def mat(A, v): return [A[0][0] * v[0] + A[0][1] * v[1], A[1][0] * v[0] + A[1][1] * v[1]]
def mm(A, B): return [[sum(A[i][k] * B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
M0, M0inv = [[2, 1], [1, 1]], [[1, -1], [-1, 2]]
S, Sinv = [[0, 1], [-1, 0]], [[0, -1], [1, 0]]
fold = [[-1, 0], [0, -1]]
ok = True
def report(tag, cond, text):
    global ok
    ok = ok and bool(cond)
    print(f"({tag}) {'PASS' if cond else 'FAIL'}: {text}")

# --- (a) the drive's stretch ---------------------------------------------------------------
vu, vs = [phi, Q5(1)], [Q5(1), -phi]
report("C1", mat(M0, vu) == [phi2 * vu[0], phi2 * vu[1]] and mat(M0, vs) == [phim2 * vs[0], phim2 * vs[1]],
       "M0 has eigenvalues phi^2, phi^-2 on the directions (phi,1), (1,-phi)")
report("C2", vu[0] * vs[0] + vu[1] * vs[1] == 0, "the two eigen-directions are orthogonal")
# Sol metric on R^2 x R: g = ds^2 + e^{-2ks} du^2 + e^{+2ks} dv^2, u, v the coordinates along vu, vs, e^k := phi^2.
# Under the gluing (x, s) -> (M0 x, s+1): du -> phi^2 du, dv -> phi^-2 dv, e^{-2ks} -> phi^-4 e^{-2ks}, e^{2ks} -> phi^4 e^{2ks}.
report("C3", (phim2 * phim2) * (phi2 * phi2) == 1 and (phi2 * phi2) * (phim2 * phim2) == 1,
       "the metric ds^2 + e^{-2ks}du^2 + e^{2ks}dv^2 with e^k = phi^2 is carried to itself by (x,s) -> (M0 x, s+1)")
kappa = math.log(float(phi2))
report("C4", abs(kappa - 2 * math.log(float(phi))) < 1e-15,
       f"the length factor w = e^(ks) obeys dw/ds = k w with constant k = log(phi^2) = {kappa:.6f} per step")
report("C5", phi2 * phim2 == 1 and M0[0][0] * M0[1][1] - M0[0][1] * M0[1][0] == 1,
       "the two factors are w and 1/w: the area of the torus does not change along time (det M0 = 1)")
report("C6", not (phi2 == 1),
       "w(s+1)/w(s) = phi^2, not 1: w is not a single-valued function on the time circle; it closes only through the gluing by M0")

# --- which map exchanges k and -k ----------------------------------------------------------
report("C7", mat(S, vu) == vs and mat(S, vs) == [-vu[0], -vu[1]],
       "the quarter-turn S carries the stretched direction to the squeezed one and back (S vu = vs, S vs = -vu)")
report("C8", mm(S, S) == fold and mm(mm(S, M0), Sinv) == M0inv and mm(M0, M0inv) == [[1, 0], [0, 1]],
       "S^2 = -1 (the fold) and S M0 S^-1 = M0^-1: S has order four on the torus, order two on the pillowcase")
report("C9", mat(fold, vu) == [-vu[0], -vu[1]] and mm(mm(fold, M0), fold) == M0,
       "the fold z -> -z keeps each eigen-direction and commutes with M0: it does not exchange k and -k")
h = Fr(1, 2)
P = {1: (Fr(0), Fr(0)), 2: (h, Fr(0)), 3: (Fr(0), h), 4: (h, h)}
def act(A, p): r = mat(A, p); return (r[0] % 1, r[1] % 1)
def neg(p): return ((-p[0]) % 1, (-p[1]) % 1)
img = {i: [j for j in P if act(S, P[i]) == P[j]][0] for i in P}
report("C10", img == {1: 1, 2: 3, 3: 2, 4: 4}, f"on the corners S acts as {img}: fixes P1 and P4, exchanges P2 and P3")
# fixed points of S on the pillowcase: S z = z or S z = -z on the torus; det(S - 1) = det(S + 1) = 2, so all such z have order 2
N = 12
grid = [(Fr(a, N), Fr(b, N)) for a in range(N) for b in range(N)]
fixS = sorted({min(p, neg(p)) for p in grid if act(S, p) == p or act(S, p) == neg(p)})
report("C11", fixS == [(Fr(0), Fr(0)), (h, h)],
       f"points of the pillowcase fixed by S: {[(str(a), str(b)) for a, b in fixS]} -- two, where the fold on the torus has four")

# --- (b) a function of position on the pillowcase -------------------------------------------
# A smooth positive function on a closed piece has a maximum, where its derivative vanishes, so dw/ds = k w (k != 0, w > 0)
# fails there. The fold-symmetric solution of dw/dt = -+ k w in a torus coordinate t in [-L, L] (period 2L) is w = e^{-k|t|}.
k, L, e = 0.7, 1.3, 1e-6
w = lambda t: math.exp(-k * abs(((t + L) % (2 * L)) - L))
slope = lambda t: (w(t + e) - w(t)) / e
j0 = slope(0.0) - slope(-e)
jL = slope(L) - slope(L - e)
report("C12", abs(j0 + 2 * k) < 1e-4 and abs(jL - 2 * k * math.exp(-k * L)) < 1e-4 and abs(w(0.4) - w(-0.4)) < 1e-15,
       f"w = e^(-k|t|) is fold-symmetric and exponential on each half; its slope jumps by {j0:.4f} = -2k at t = 0 and by {jL:.4f} = 2k e^(-kL) at t = L: not smooth on two lines")

# --- what the drive does to the sphere of units ----------------------------------------------
R = [[0, 0, 1], [1, 0, 0], [0, 1, 0]]                       # i -> j -> k -> i
def mm3(A, B): return [[sum(A[i][n] * B[n][j] for n in range(3)) for j in range(3)] for i in range(3)]
I3 = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
RT = [list(r) for r in zip(*R)]
det = (R[0][0] * (R[1][1] * R[2][2] - R[1][2] * R[2][1]) - R[0][1] * (R[1][0] * R[2][2] - R[1][2] * R[2][0])
       + R[0][2] * (R[1][0] * R[2][1] - R[1][1] * R[2][0]))
report("C13", mm3(RT, R) == I3 and det == 1 and mm3(R, mm3(R, R)) == I3,
       "the cycle i -> j -> k of the units is a rotation of order three: it does not change the radius of the sphere of units")

print("ALL PASS" if ok else "SOME FAILED")
