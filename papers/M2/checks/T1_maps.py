"""Card T1 (chat C8b5): the finite and algebraic parts of the test of the maps.
Exact arithmetic, standard library only.
(1) integer matrices: the identities used for the join, the gluing of Y and the step;
(2) the action of S, M0, M0^2, M0^3 and the fold on the four corners and on the signs (+,+,+,-);
(3) the lengths of M1, Proposition 5.8, ds^2 + e^{2ks}dx^2 + e^{-2ks}dy^2, under each map.
    A map is (s,x,y) -> (eps*s + c, A(x,y)), A a 2x2 matrix of monomials q*e^{k*t}.
    A monomial is (q, (a,b,l)) standing for q*exp(k*(a*s + b*c + l*L)); e^{kL} = phi^2 is used
    only through the exponent l (M0 multiplies x by e^{kL} and y by e^{-kL}).
(4) the coordinate z_s = e^{-ks} y + i e^{ks} x under each map.
Run: python3 papers/M2/checks/T1_maps.py"""
from fractions import Fraction as Fr
import sys
ok=True
def chk(name,cond):
    global ok; print(("PASS " if cond else "FAIL ")+name); ok=ok and bool(cond)
def mm(A,B): return [[sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
def mp(A,n):
    R=[[1,0],[0,1]]
    for _ in range(n): R=mm(R,A)
    return R
M0=[[2,1],[1,1]]; M0i=[[1,-1],[-1,2]]; S=[[0,1],[-1,0]]; Si=[[0,-1],[1,0]]; I2=[[1,0],[0,1]]; N=[[-1,0],[0,-1]]
chk("M0 M0^-1 = 1", mm(M0,M0i)==I2)
chk("S M0 S^-1 = M0^-1", mm(mm(S,M0),Si)==M0i)
chk("M0 S M0 = S (R respects the join of one step)", mm(mm(M0,S),M0)==S)
chk("M0^3 S M0^3 = S (R respects the gluing of Y by M0^3)", mm(mm(mp(M0,3),S),mp(M0,3))==S)
chk("S^2 = -1 (R applied twice is the fold on the fibre)", mm(S,S)==N)
chk("S commutes with the fold; M0 commutes with the fold", mm(S,N)==mm(N,S) and mm(M0,N)==mm(N,M0))
P={1:(Fr(0),Fr(0)),2:(Fr(1,2),Fr(0)),3:(Fr(0),Fr(1,2)),4:(Fr(1,2),Fr(1,2))}
def act(A,k):
    p=P[k]; q=tuple((A[i][0]*p[0]+A[i][1]*p[1])%1 for i in range(2))
    return [j for j,w in P.items() if w==q][0]
perm=lambda A:[act(A,k) for k in (1,2,3,4)]
chk("S fixes P1 and P4 and exchanges P2 and P3", perm(S)==[1,3,2,4])
chk("M0 fixes P1 and cycles P2->P3->P4->P2", perm(M0)==[1,3,4,2])
chk("M0^2 carries P4 to P3", act(mp(M0,2),4)==3)
chk("M0^3 and the fold fix every corner", perm(mp(M0,3))==[1,2,3,4] and perm(N)==[1,2,3,4])
sign={1:1,2:1,3:1,4:-1}
keeps=lambda A: all(sign[k]==sign[act(A,k)] for k in P)
chk("signs (+,+,+,-) kept by S, by the fold and by M0^3", keeps(S) and keeps(N) and keeps(mp(M0,3)))
chk("signs (+,+,+,-) not kept by M0, nor by M0^2", (not keeps(M0)) and (not keeps(mp(M0,2))))
# (3) lengths. polynomial = dict exponent(a,b,l) -> coefficient
def pmul(p,q):
    r={}
    for e1,c1 in p.items():
        for e2,c2 in q.items():
            e=tuple(u+v for u,v in zip(e1,e2)); r[e]=r.get(e,0)+c1*c2
    return {e:c for e,c in r.items() if c!=0}
def padd(p,q):
    r=dict(p)
    for e,c in q.items(): r[e]=r.get(e,0)+c
    return {e:c for e,c in r.items() if c!=0}
one={(0,0,0):1}; zero={}
def mono(q,a=0,b=0,l=0): return {(a,b,l):q} if q else {}
def fibre_metric(eps,cflag,lshift):
    # e^{2k s'} and e^{-2k s'} with s' = eps*s + cflag*c + lshift*L
    return mono(1,2*eps,2*cflag,2*lshift), mono(1,-2*eps,-2*cflag,-2*lshift)
def pulled(eps,cflag,lshift,A):
    gx,gy=fibre_metric(eps,cflag,lshift)
    G=[[zero,zero],[zero,zero]]
    for i in range(2):
        for j in range(2):
            G[i][j]=padd(pmul(pmul(A[0][i],gx),A[0][j]),pmul(pmul(A[1][i],gy),A[1][j]))
    return G
target=[[mono(1,2),zero],[zero,mono(1,-2)]]
fold=[[mono(-1),zero],[zero,mono(-1)]]
step=[[mono(1,0,0,1),zero],[zero,mono(1,0,0,-1)]]      # x -> e^{kL} x, y -> e^{-kL} y, s -> s - L
Rm=[[zero,mono(-1)],[mono(1),zero]]                    # x' = -y, y' = x, s -> -s
idm=[[one,zero],[zero,one]]
chk("lengths kept by the fold (s,-x,-y)", pulled(1,0,0,fold)==target)
chk("lengths kept by the step (s-L, e^{kL}x, e^{-kL}y)", pulled(1,0,-1,step)==target)
chk("lengths kept by R (-s,-y,x)", pulled(-1,0,0,Rm)==target)
chk("lengths not kept by R without the reversal of time (s,-y,x)", pulled(1,0,0,Rm)!=target)
chk("lengths not kept by the reversal of time alone (-s,x,y)", pulled(-1,0,0,idm)!=target)
sh=pulled(1,1,0,idm)
chk("a shift of the time by c multiplies the two lengths by e^{2kc} and e^{-2kc}: kept only if c=0 (kappa not 0)", sh==[[mono(1,2,2),zero],[zero,mono(1,-2,-2)]] and sh!=target)
# (4) z_s = e^{-ks} y + i e^{ks} x : pair (coefficient of x, coefficient of y), each (complex q, exponent)
def z_after(eps,lshift,A):
    # z_{s'}(x',y') = e^{-k s'} y' + i e^{k s'} x', with (x',y') = A(x,y); returns coefficients of x and y
    ey=mono(1,-eps,0,-lshift); ex=mono(1j,eps,0,lshift)
    cx=padd(pmul(ey,A[1][0]),pmul(ex,A[0][0])); cy=padd(pmul(ey,A[1][1]),pmul(ex,A[0][1]))
    return cx,cy
zx,zy=mono(1j,1),mono(1,-1)
scal=lambda q,p:{e:q*c for e,c in p.items()}
chk("z_{-s} o R = -i z_s (R is holomorphic from the fibre at s to the fibre at -s)", z_after(-1,0,Rm)==(scal(-1j,zx),scal(-1j,zy)))
chk("z_{s-L} o step = z_s", z_after(1,-1,step)==(zx,zy))
chk("z_s o fold = -z_s", z_after(1,0,fold)==(scal(-1,zx),scal(-1,zy)))
print("ALL PASS" if ok else "SOME FAIL"); sys.exit(0 if ok else 1)
