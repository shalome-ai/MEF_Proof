"""Chat C8b4: the test of a LEAD (Decision Log P259), not of an entry.
Mirror 3 = M1's exchange of growth and decay, (s,x,y) -> (-s,-y,x) (M1 v7.3 l.704).
Checks, on time together with the fibre only:
 (1) the exchange is the quarter-turn S on the torus with s -> -s; it is well defined on Y
     (S M0^3 = M0^-3 S); applied twice it is the fold; it keeps the lengths of M1 Prop 5.8.
 (2) it is holomorphic from the fibre at s to the fibre at -s: z_{-s}(S p) = -i z_s(p).
 (3) it leaves P1 and P4 in place and exchanges P2 and P3 (so the odd corner stays at P4).
 (4) at s=0 the lattice is square, the Weierstrass function has wp(-i z) = -wp(z), e4 = 0;
     the two states on the pillowcase for 3P4, 1 and 1/(wp-e4), are carried by the pull-back
     to +1 and -1 times themselves; the third state wp'/(wp-e4)^2 is odd under the fold.
 (5) with psi = a + b/(wp-e4) and psibar its image, Phi = psibar*psi*(psi-psibar)^2 is not zero.
Nothing here is used by any entry."""
import math, cmath, random
def mul(A,B): return [[sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
M0=[[2,1],[1,1]]; M0i=[[1,-1],[-1,2]]; S=[[0,1],[-1,0]]; Si=[[0,-1],[1,0]]
assert mul(M0,M0i)==[[1,0],[0,1]] and mul(S,Si)==[[1,0],[0,1]]
assert mul(mul(S,M0),Si)==M0i                                   # S M0 S^-1 = M0^-1 (exact)
M3=mul(M0,mul(M0,M0)); M3i=mul(M0i,mul(M0i,M0i))
assert mul(S,M3)==mul(M3i,S) and mul(S,S)==[[-1,0],[0,-1]]      # well defined on Y; twice = the fold
phi=(1+math.sqrt(5))/2; n=math.hypot(phi,1); v1=(phi/n,1/n); v2=(v1[1],-v1[0])   # v2 = S v1
ap=lambda A,v:(A[0][0]*v[0]+A[0][1]*v[1],A[1][0]*v[0]+A[1][1]*v[1])
assert max(abs(ap(M0,v1)[i]-phi**2*v1[i]) for i in (0,1))<1e-12 and max(abs(ap(M0,v2)[i]-phi**-2*v2[i]) for i in (0,1))<1e-12
random.seed(1); kap=2*math.log(phi)
for _ in range(200):
    x,y,s=[random.uniform(-2,2) for _ in range(3)]
    p_=(x*v1[0]+y*v2[0],x*v1[1]+y*v2[1]); q=ap(S,p_)
    xs=q[0]*v1[0]+q[1]*v1[1]; ys=q[0]*v2[0]+q[1]*v2[1]
    assert abs(xs+y)<1e-12 and abs(ys-x)<1e-12                  # (1) S is (x,y)->(-y,x)
    z=lambda s_,x_,y_: math.exp(-kap*s_)*y_+1j*math.exp(kap*s_)*x_
    assert abs(z(-s,-y,x)+1j*z(s,x,y))<1e-9                     # (2) z_{-s}(S p) = -i z_s(p)
    # lengths of a tangent vector (ds,dx,dy) at s and of its image (-ds,-dy,dx) at -s
    ds,dx,dy=[random.uniform(-1,1) for _ in range(3)]
    L1=ds**2+math.exp(2*kap*s)*dx**2+math.exp(-2*kap*s)*dy**2
    L2=ds**2+math.exp(-2*kap*s)*dy**2+math.exp(2*kap*s)*dx**2
    assert abs(L1-L2)<1e-9
from fractions import Fraction as Fr
h=Fr(1,2); P={1:(Fr(0),Fr(0)),2:(h,Fr(0)),3:(Fr(0),h),4:(h,h)}
img={i:tuple(c%1 for c in ap(S,P[i])) for i in P}
assert img[1]==P[1] and img[4]==P[4] and img[2]==P[3] and img[3]==P[2]      # (3)
w1=complex(v2[0],v1[0]); w2=complex(v2[1],v1[1]); assert abs(w2-1j*w1)<1e-12  # (4) square lattice at s=0
N=40
L=[m*w1+k_*w2 for m in range(-N,N+1) for k_ in range(-N,N+1) if m or k_]
wp=lambda u:1/u**2+sum(1/(u-l)**2-1/l**2 for l in L)
wpp=lambda u:-2/u**3+sum(-2/(u-l)**3 for l in L)
u=0.137*w1+0.291*w2; e4=wp((w1+w2)/2)
print('wp(-iu)+wp(u) =',abs(wp(-1j*u)+wp(u)),'  e4 (truncated sum, N=40) =',abs(e4))
assert abs(wp(-1j*u)+wp(u))<1e-9 and abs(e4)<5e-2   # e4: the truncated sum is periodic only up to O(1/N)
e4=0   # exact: e4 = wp(P4) = -wp(-i P4) = -wp(P4 - w2) = -e4
f2=lambda u_:1/(wp(u_)-e4); f3=lambda u_:wpp(u_)/(wp(u_)-e4)**2
assert abs(f2(1j*u)+f2(u))<1e-9 and abs(f2(-u)-f2(u))<1e-9      # second state: -1 under the exchange, even under the fold
assert abs(f3(-u)+f3(u))<1e-6                                    # third state: odd under the fold
A,B=0.7,1.3
psi=A+B*f2(u); psib=A+B*f2(1j*u); Phi=psib*psi*(psi-psib)**2
print('psi-psibar =',psi-psib); print('Phi =',Phi)
assert abs(Phi-4*B**2*f2(u)**2*(A**2-B**2*f2(u)**2))<1e-9 and abs(Phi)>1e-6
print('all checks pass')
