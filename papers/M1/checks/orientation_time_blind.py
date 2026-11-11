#!/usr/bin/env python3
"""Blind check: classes of trace-t matrices in SL2(Z) under N1..N4. Exact integers.
Method A: reduced indefinite forms + cycles.  Method B: cyclic L/R words.
Method C: bounded-box union-find by explicit conjugation (small t)."""
import random, itertools, math
from math import isqrt, gcd

def mul(X,Y):
    return ((X[0][0]*Y[0][0]+X[0][1]*Y[1][0], X[0][0]*Y[0][1]+X[0][1]*Y[1][1]),
            (X[1][0]*Y[0][0]+X[1][1]*Y[1][0], X[1][0]*Y[0][1]+X[1][1]*Y[1][1]))
def det(X): return X[0][0]*X[1][1]-X[0][1]*X[1][0]
def inv(X):
    e=det(X); assert e in (1,-1)
    return ((X[1][1]*e,-X[0][1]*e),(-X[1][0]*e,X[0][0]*e))
def form(M): return (M[1][0], M[1][1]-M[0][0], -M[0][1])
def mat(f,t):
    A,B,C=f; assert (t-B)%2==0
    return (((t-B)//2,-C),(A,(t+B)//2))
def act(f,g):  # f(px+qy, rx+sy)
    A,B,C=f; (p,q),(r,s)=g
    return (A*p*p+B*p*r+C*r*r, 2*A*p*q+B*(p*s+q*r)+2*C*r*s, A*q*q+B*q*s+C*s*s)

# --- dictionary test: form(g M g^-1) = det(g) * act(form(M), g^-1), all g in GL2(Z)
def rand_gl(rng):
    g=((1,0),(0,1))
    gens=[((1,1),(0,1)),((1,0),(1,1)),((0,1),(-1,0)),((1,-1),(0,1))]
    for _ in range(rng.randint(1,8)): g=mul(g,rng.choice(gens))
    if rng.random()<0.5: g=mul(g,((1,0),(0,-1)))
    return g
rng=random.Random(1)
for _ in range(3000):
    g=rand_gl(rng); h=rand_gl(rng)
    M=mul(h,((2,1),(1,1))) if det(h)==1 else mul(mul(h,((1,0),(0,-1))),((3,2),(1,1)))
    if det(M)!=1: continue
    e=det(g); f=act(form(M),inv(g))
    assert form(mul(mul(g,M),inv(g)))==tuple(e*x for x in f)
    assert form(inv(M))==tuple(-x for x in form(M))
print("dictionary matrix<->form (equivariance, inverse = -f): CHECKED on random samples")

# --- Method A
def is_red(f,D):
    A,B,C=f; a2=2*abs(A)
    if not (B>0 and B*B<D): return False
    if not (D<(a2+B)**2): return False
    return a2-B<0 or (a2-B)**2<D
def rho(f,D):
    A,B,C=f; c=abs(C); s=isqrt(D)
    if c*c<D:   # |C|<sqrtD : B' largest <= floor(sqrtD), B' = -B mod 2c
        Bp=s-((s+B)%(2*c))
    else:         # -c < B' <= c
        Bp=(-B)%(2*c)
        if Bp>c: Bp-=2*c
    k,rem=divmod(Bp+B,2*C); assert rem==0
    g=((0,-1),(1,k)); f2=act(f,g)
    assert f2[0]==C and f2[1]==Bp
    return f2
def reduce_(f,D):
    n=0
    while not is_red(f,D):
        f=rho(f,D); n+=1; assert n<10000
    return f
def reduced_forms(D):
    out=[]
    for B in range(1,isqrt(D)+1):
        if (B-D)%2: continue
        n=(D-B*B)//4   # A*C = -n
        assert (D-B*B)%4==0
        for a in range(1,n+1):
            if n%a: continue
            for A in (a,-a):
                f=(A,B,-n//A)
                if is_red(f,D): out.append(f)
    return out
class UF:
    def __init__(s,xs): s.p={x:x for x in xs}
    def f(s,x):
        while s.p[x]!=x: s.p[x]=s.p[s.p[x]]; x=s.p[x]
        return x
    def u(s,x,y): s.p[s.f(x)]=s.f(y)
    def n(s): return len({s.f(x) for x in s.p})
def methodA(t):
    D=t*t-4; assert isqrt(D)**2!=D
    R=reduced_forms(D); res=[]
    neg=lambda f:(-f[0],-f[1],-f[2])
    mir=lambda f:(-f[0],f[1],-f[2])   # conj by diag(1,-1)
    for ops in ([],[neg],[mir],[neg,mir]):
        uf=UF(R)
        for f in R:
            r=rho(f,D); assert is_red(r,D); uf.u(f,r)
            for o in ops: uf.u(f,reduce_(o(f),D))
        res.append(uf.n())
    return tuple(res)

# --- Method B: positive words in R=[[1,1],[0,1]], L=[[1,0],[1,1]] up to cyclic rotation
Rm=((1,1),(0,1)); Lm=((1,0),(1,1)); TMAX=30
words={t:[] for t in range(3,TMAX+1)}
def dfs(w,M):
    tr=M[0][0]+M[1][1]
    if tr>TMAX or len(w)>TMAX: return
    if tr>=3: words[tr].append(w)
    dfs(w+'R',mul(M,Rm)); dfs(w+'L',mul(M,Lm))
dfs('R',Rm); dfs('L',Lm)
def canon(w): return min(w[i:]+w[:i] for i in range(len(w)))
sw=lambda w: w.translate(str.maketrans('RL','LR'))
def methodB(t):
    ws={canon(w) for w in words[t]}; res=[]
    invw=lambda w: canon(sw(w[::-1]))   # M^-1 ~SL2 reversed+swapped
    mirw=lambda w: canon(sw(w))         # conj by [[0,1],[1,0]]
    for ops in ([],[invw],[mirw],[invw,mirw]):
        uf=UF(ws)
        for w in ws:
            for o in ops: uf.u(w,o(w))
        res.append(uf.n())
    return tuple(res)
# check the word operations on actual matrices
def wm(w):
    M=((1,0),(0,1))
    for ch in w: M=mul(M,Rm if ch=='R' else Lm)
    return M
Sm=((0,1),(-1,0)); Jm=((0,1),(1,0))
for w in ['RRL','RLLRL','RLRRRLL']:
    assert mul(mul(Jm,wm(w)),inv(Jm))==wm(sw(w))
    assert mul(mul(Sm,inv(wm(w))),inv(Sm))==wm(sw(w[::-1]))
print("word operations (mirror = swap, inverse = reverse+swap): CHECKED")

# --- Method C: brute force in a box
def methodC(t,K):
    box=set()
    for a in range(-K,K+1):
        d=t-a; n=a*d-1
        if abs(d)>K: continue
        if n==0:
            for x in range(-K,K+1): box.add(((a,x),(0,d))); box.add(((a,0),(x,d)))
        else:
            for b in range(1,min(abs(n),K)+1):
                if n%b==0:
                    for bb in (b,-b):
                        c=n//bb
                        if abs(c)<=K: box.add(((a,bb),(c,d)))
    T=((1,1),(0,1)); Ti=inv(T); P=((1,0),(0,-1))
    small=[M for M in box if max(abs(x) for r in M for x in r)<=t]
    res=[]
    for useinv,usemir in ((0,0),(1,0),(0,1),(1,1)):
        uf=UF(box)
        for M in box:
            for g in (Sm,T,Ti)+((P,) if usemir else ()):
                N=mul(mul(g,M),inv(g))
                if N in box: uf.u(M,N)
            if useinv:
                N=inv(M)
                if N in box: uf.u(M,N)
        res.append(len({uf.f(M) for M in small}))
    return tuple(res)

tab={}
print("\n t    D   N1 N2 N3 N4   (A: forms; B: words; C: box brute force, t<=12)")
for t in range(3,31):
    a=methodA(t); b=methodB(t); c=methodC(t,8*t) if t<=12 else None
    assert a==b, (t,a,b)
    if c is not None: assert a==c,(t,a,c)
    tab[t]=a
    print(f"{t:2d} {t*t-4:4d}   {a[0]:2d} {a[1]:2d} {a[2]:2d} {a[3]:2d}   B={'ok'} C={'ok' if c else '-'}")
for i,nm in enumerate(['N1','N2','N3','N4']):
    print(nm,"exactly one class at t =",[t for t in tab if tab[t][i]==1])

# --- B5 side check: all homs SL2(Z)->Dic3 (as unit quaternions, floats)
def qm(x,y):
    a,b,c,d=x; e,f,g,h=y
    return (a*e-b*f-c*g-d*h, a*f+b*e+c*h-d*g, a*g-b*h+c*e+d*f, a*h+b*g-c*f+d*e)
def qpow(x,n):
    r=(1.0,0,0,0)
    for _ in range(n): r=qm(r,x)
    return r
close=lambda x,y: all(abs(u-v)<1e-9 for u,v in zip(x,y))
a_=(0.5,0.5,0.5,0.5); r2=2**-0.5; b_=(0,r2,-r2,0)
G=[]
for m in range(6):
    for e in range(2): G.append(qm(qpow(a_,m),qpow(b_,e)))
assert len({tuple(round(v,6) for v in g) for g in G})==12
one=(1.0,0,0,0); cnt=0
qinv=lambda x:(x[0],-x[1],-x[2],-x[3])
for s in G:
    for u in G:
        if not (close(qpow(s,4),one) and close(qpow(s,2),qpow(u,3))): continue
        gen={tuple(round(v,6) for v in one)}; fr=[one]
        while fr:
            x=fr.pop()
            for y in (s,u):
                z=qm(x,y); k=tuple(round(v,6) for v in z)
                if k not in gen: gen.add(k); fr.append(z)
        if len(gen)!=12: continue
        cnt+=1
        # T^-1 = S^3 U ; L^-1 = S T S^-1 ; M0 = T L
        Tq=qinv(qm(qpow(s,3),u)); Lq=qinv(qm(qm(s,Tq),qinv(s))); d=qm(Tq,Lq)
        assert close(qpow(d,3),one) and close(qpow(qinv(d),3),one)
        # mirror P=diag(1,-1): P T P^-1 = T^-1, P L P^-1 = L^-1
        d2=qm(qinv(Tq),qinv(Lq)); assert close(qpow(d2,3),one)
print(f"B5: {cnt} surjective homs SL2(Z)->Dic3; rho(M0)^3=+1, rho(M0^-1)^3=+1, rho(P M0 P^-1)^3=+1 for all: CHECKED")
Um=((0,1),(-1,1)); Tm=((1,1),(0,1))
assert mul(Sm,Um)==((-1,1),(0,-1)) and mul(mul(Sm,Tm),inv(Sm))==inv(Lm) and mul(Tm,Lm)==((2,1),(1,1))
print("matrix identities S U = -T^-1, S T S^-1 = L^-1, M0 = T L: CHECKED")
