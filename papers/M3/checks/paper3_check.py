# Independent checks of statements READ in sources/Paper3_v13_Ramanujan.tex, ll.376-630. Plain Python.
import cmath, math
from fractions import Fraction as Fr
pi = math.pi
print("(1) Chiral telescoping (Lemma at l.416): squares of mu+ = m+3/2 and mu- = -m+1/2, m = 0..199")
plus  = [Fr(2*m+3, 2)**2 for m in range(200)]
minus = [Fr(-2*m+1, 2)**2 for m in range(202)]
left = list(minus)
for s in plus: left.remove(s)                 # cancel each mu+ square against one mu- square
print("    uncancelled mu- squares:", [str(x) for x in left], "-> trace = -%d e^{-t/4} per corner" % len(left))
print("(2) Corner sum with phases (-1)^{mn}:", sum((-1)**(m*n) for m in (0,1) for n in (0,1)), "x (-2 e^{-t/4})")
print("(3) Jacobi: eta(2 tau)^3 = sum (-1)^k (2k+1) q^{(2k+1)^2/4}. Expand q^{1/4} prod (1-q^{2n})^3 to q^{1/4+30}:")
N = 31; poly = [0]*N; poly[0] = 1
for n in range(1, N):
    for _ in range(3):
        new = poly[:]
        for i in range(N - 2*n):
            if i + 2*n < N: new[i+2*n] -= poly[i]
        poly = new
print("    nonzero coefficients (exponent, coeff):", [(str(Fr(1,4)+i), c) for i, c in enumerate(poly) if c])
print("    predicted                            :", [(str(Fr((2*k+1)**2, 4)), (-1)**k*(2*k+1)) for k in range(6) if Fr((2*k+1)**2,4)-Fr(1,4) < N])
print("(4) Sector functions R_i = theta_i(tau,z)/theta_i(tau,0) (Thm at l.603): S and T actions, tau=0.3+1.1i, z=0.27+0.05i")
def th(i, tau, z):
    p = cmath.exp(1j*pi*tau); s = 0
    if i == 2: return sum(2*p**((n+0.5)**2)*cmath.cos((2*n+1)*pi*z) for n in range(60))
    sg = 1 if i == 3 else -1
    return 1 + sum(2*(sg**n)*p**(n*n)*cmath.cos(2*n*pi*z) for n in range(1, 60))
R = lambda i, tau, z: th(i, tau, z)/th(i, tau, 0)
tau, z = 0.3+1.1j, 0.27+0.05j
f = cmath.exp(1j*pi*z*z/tau)
print("    S: |R2(-1/tau,z/tau) - e^{i pi z^2/tau} R4| =", abs(R(2,-1/tau,z/tau) - f*R(4,tau,z)))
print("    S: |R3(-1/tau,z/tau) - e^{i pi z^2/tau} R3| =", abs(R(3,-1/tau,z/tau) - f*R(3,tau,z)))
print("    S: |R4(-1/tau,z/tau) - e^{i pi z^2/tau} R2| =", abs(R(4,-1/tau,z/tau) - f*R(2,tau,z)))
print("    T: |R2(tau+1) - R2|, |R3(tau+1) - R4|, |R4(tau+1) - R3| =", abs(R(2,tau+1,z)-R(2,tau,z)), abs(R(3,tau+1,z)-R(4,tau,z)), abs(R(4,tau+1,z)-R(3,tau,z)))
print("    Z_orb(tau,0) = 2(R2+R3+R4)(tau,0) =", 2*(R(2,tau,0)+R(3,tau,0)+R(4,tau,0)))
print("(5) Is the single surviving exponential the whole shadow? g = -eta(2tau)^3 on tau = i y, ratio of 2nd to 1st term:")
for y in (0.5, 1.0, 1.8466):
    q = math.exp(-2*pi*y); print("    y = %.4f : |3 q^{9/4}| / |q^{1/4}| = %.3e" % (y, 3*q**2))
