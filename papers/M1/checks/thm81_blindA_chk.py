from fractions import Fraction as Fr
import itertools
def mm(A,B): return [[sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
def inv(A):
    (a,b),(c,d)=A; D=a*d-b*c; return [[Fr(d,D),Fr(-b,D)],[Fr(-c,D),Fr(a,D)]]
def det(A): return A[0][0]*A[1][1]-A[0][1]*A[1][0]
M0=[[2,1],[1,1]]
for A,S in [([[3,-1],[1,0]],[[-2,1],[-1,0]]),([[1,-1],[-1,2]],[[-1,-1],[2,1]]),([[0,-1],[1,3]],[[-2,-1],[3,1]])]:
    print('detS',det(S),'SAS^-1==M0',mm(mm(S,A),inv(S))==M0,'S M0 S^-1==A',mm(mm(S,M0),inv(S))==A)
S=[[0,1],[-1,0]];U=[[0,1],[-1,1]]
print('SM0S^-1==M0^-1',mm(mm(S,M0),inv(S))==inv(M0),'S^2',mm(S,S),'U^3',mm(U,mm(U,U)))
Ui=inv(U);Si=inv(S)
print('M0==U^-1 S^-1 U^-2 S^-1',mm(mm(mm(Ui,Si),mm(Ui,Ui)),Si)==M0)
M3=mm(M0,mm(M0,M0));print('M0^3',M3)
half=[(0,0),(Fr(1,2),0),(0,Fr(1,2)),(Fr(1,2),Fr(1,2))]
def act(A,p): return ((A[0][0]*p[0]+A[0][1]*p[1])%1,(A[1][0]*p[0]+A[1][1]*p[1])%1)
for name,A in [('M0',M0),('S',S),('U',U),('even',[[2,1],[3,2]]),('M0^3',M3)]:
    print(name,[half.index(act(A,p))+1 for p in half])
perm={0:0,1:2,2:3,3:1}
def norm(s): s=tuple(s); t=tuple(-x for x in s); return max(s,t)
def moved(a):
    s=[(-1)**x for x in a]; s2=[0]*4
    for i in range(4): s2[perm[i]]=s[i]
    return norm(s)!=norm(s2)
for d in (1,2,3):
    for a in itertools.product(range(d+1),repeat=4):
        if sum(a)!=d: continue
        first=1+sum(x//2 for x in a)
        print(d,a,'at rest',d,'lift1',first,'lift2',d-first,'moved by step',moved(a))
# Q(sqrt2) numbers as (p,q)=p+q*sqrt2
class Z:
    def __init__(s,p,q=0): s.p=Fr(p); s.q=Fr(q)
    def __add__(s,o): return Z(s.p+o.p,s.q+o.q)
    def __sub__(s,o): return Z(s.p-o.p,s.q-o.q)
    def __mul__(s,o): return Z(s.p*o.p+2*s.q*o.q,s.p*o.q+s.q*o.p)
    def __neg__(s): return Z(-s.p,-s.q)
    def __eq__(s,o): return s.p==o.p and s.q==o.q
    def __hash__(s): return hash((s.p,s.q))
    def __repr__(s): return f'{s.p}' if s.q==0 else f'({s.p}+{s.q}r2)'
def qmul(p,q):
    a,b,c,d=p;e,f,g,h=q
    return (a*e-b*f-c*g-d*h,a*f+b*e+c*h-d*g,a*g-b*h+c*e+d*f,a*h+b*g-c*f+d*e)
def qinv(p): a,b,c,d=p; return (a,-b,-c,-d)
def qpow(p,n):
    r=one
    for _ in range(n): r=qmul(r,p)
    return r
z=Z(0);one=(Z(1),z,z,z);h=Z(0,Fr(1,2))
qi=(z,Z(1),z,z)
for si,sj in itertools.product([1,-1],repeat=2):
    s=(z,Z(0,Fr(si,2)),Z(0,Fr(sj,2)),z)
    for e in itertools.product([1,-1],repeat=3):
        u=(Z(Fr(1,2)),)+tuple(Z(Fr(x,2)) for x in e)
        img=qmul(qmul(u,qi),qinv(u))
        d=qmul(qmul(qmul(qinv(u),qinv(s)),qpow(qinv(u),2)),qinv(s))
        d3=qpow(d,3)
        G={one}; fr=[one]
        while fr:
            n=[]
            for g in fr:
                for hh in (s,u):
                    k=qmul(g,hh)
                    if k not in G: G.add(k); n.append(k)
            fr=n
        print('s',s[1:3],'u',e,'Ad_u(i)',img,'s2==u3',qpow(s,2)==qpow(u,3),'d',d,'d^3',d3[0],'|G|',len(G))
