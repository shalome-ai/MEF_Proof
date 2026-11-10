# Independent check, plain Python (double precision).
# Question: is the function Paper XI calls "the Appell-Lerch sum",
#   mu(tau,z) = sum_{n>=1} q^n / ((1 - y q^n)(1 - q^n / y)),
# an elementary function of J = (1/2 pi i) d/dz log theta_1, and how does J transform?
# theta_1 is computed from its SERIES (not the product), so check (1) is not circular.
import cmath, math
pi = math.pi
def theta1(tau, z, d=0):
    p = cmath.exp(1j*pi*tau); s = 0
    for n in range(0, 60):
        c = 2*(-1)**n * p**((n+0.5)**2); a = (2*n+1)*pi
        s += c*(cmath.sin(a*z) if d == 0 else a*cmath.cos(a*z))
    return s
def J(tau, z): return theta1(tau, z, 1)/theta1(tau, z)/(2j*pi)
def mu(tau, z):
    q, y = cmath.exp(2j*pi*tau), cmath.exp(2j*pi*z)
    return sum(q**n/((1-y*q**n)*(1-q**n/y)) for n in range(1, 400))
def closed(tau, z):
    y = cmath.exp(2j*pi*z); return (0.5*(y+1)/(y-1) - J(tau, z))/(y - 1/y)
def Jhat(tau, z): return J(tau, z) + (z - z.conjugate())/(tau - tau.conjugate())
for tau, z in [(1.8466j, 0.15+0j), (0.3+1.1j, 0.27+0.05j), (-0.4+0.8j, 0.11-0.02j)]:
    print("tau =", tau, " z =", z)
    print("  (1) |mu - [ (1/2)(y+1)/(y-1) - J ] / (y - 1/y)| =", abs(mu(tau, z) - closed(tau, z)))
    print("  (2) |J(-1/tau, z/tau) - (tau*J(tau,z) + z)|      =", abs(J(-1/tau, z/tau) - (tau*J(tau, z) + z)))
    print("  (3) |Jhat(-1/tau, z/tau) - tau*Jhat(tau,z)|      =", abs(Jhat(-1/tau, z/tau) - tau*Jhat(tau, z)))
N = 15; coef = [0]*(N+1)
for n in range(1, N+1):
    for a in range(0, N+1):
        m = n*(1+2*a)          # term y^(a-b) q^(n(1+a+b)); the y^0 part has a = b
        if m <= N: coef[m] += 1
print("(4) y^0 coefficients of mu, m = 1..15 :", coef[1:])
print("    number of odd divisors            :", [sum(1 for d in range(1, m+1, 2) if m % d == 0) for m in range(1, 16)])
print("    sum of odd divisors               :", [sum(d for d in range(1, m+1, 2) if m % d == 0) for m in range(1, 16)])
