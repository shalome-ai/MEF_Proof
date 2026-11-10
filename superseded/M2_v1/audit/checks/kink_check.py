# Checks for the step audit of M2 Theorem 4.1 / Corollary 4.2 (zeta = 12 pi). Plain Python.
import math
print("(K3) The kink integral of M2 eq. (kink): integrate N*pi*delta(th_psi)*delta(th_omega) over th_omega in [-eps, eps].")
print("     Model each delta by a Gaussian of width s; the th_omega-integral is then N*pi*G_s(th_psi), a function of th_psi:")
def G(x, s): return math.exp(-x*x/(2*s*s))/(s*math.sqrt(2*math.pi))
N = 1
for s in (0.1, 0.01, 0.001):
    vals = [N*math.pi*G(x, s) for x in (0.0, 0.05, 0.3)]
    print("     width %-6g : value at th_psi = 0, 0.05, 0.3  ->  %.4g, %.4g, %.4g" % (s, *vals))
print("     -> not a number: it grows without bound at th_psi = 0 and vanishes elsewhere as the width shrinks.")
print("     The text's value, -kappa^2 * N * pi, is independent of th_psi; and (kappa^2/2)*N*pi would be the prefactor, not kappa^2*N*pi.")
print()
print("(K5) Sensitivity to the normalisation kappa_2^2 = c / L: from 2k = kappa_2^2 N pi,  k L = (c/2) N pi.")
for c in (1, 2, 3, 4, 2*math.pi):
    print("     c = %-6.4g -> k L = %.4g * N pi ;  with N = 12: zeta = %.4g pi" % (c, c/2, 12*c/2))
print()
print("(K6) Sensitivity to the flux number: zeta = N pi with N = chi(K8) = 12; chi/24 = %.3g, chi/2 = %g, chi = %g" % (12/24, 12/2, 12))

print()
print("--- Re-check of the blind referee's additional points (10 Nov 2026) ---")
print("(B1) Total flux of F = N*pi*delta*delta over the whole covering torus: N*pi; divided by 2*pi: N/2 (not N).")
print("     The origin is one point of the cover, so the delta is counted once. Value for N = 12:", 12*math.pi/(2*math.pi))
print("(B2) Integrating a FIRST-order equation dA/dtheta = -c*delta(theta) across [-eps, eps] gives A(eps) - A(-eps) = -c:")
print("     a jump in A itself, not in its slope. Numerically, with a Gaussian of width s for the delta and c = 1:")
for s in (0.1, 0.01):
    n = 20000; h = 2.0/n; A = 0.0; x = -1.0
    for i in range(n):
        A += -G(x + h/2, s)*h; x += h
    print("     width %-5g : A(1) - A(-1) = %.6f ; slope at +-1 = %.2e (zero on both sides: no kink in slope)" % (s, A, -G(1.0, s)))
print("(B3) No non-trivial periodic solution of dA/dtheta = -(kappa^2/2)|F|/sqrt(g) with a fixed sign:")
print("     the left side integrates to zero over a period (A single-valued); the right side is <= 0; so F = 0.")
print("     The profile A(0) - k|theta| has slope +k for theta < 0, i.e. it uses the opposite sign there, and by periodicity")
print("     it has a second kink of the opposite sense at theta = L, where the text places no flux.")
