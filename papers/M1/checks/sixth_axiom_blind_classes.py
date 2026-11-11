#!/usr/bin/env python3
"""Conjugacy classes of trace-t matrices in SL(2,Z). Three methods.
A: cycles of reduced indefinite binary quadratic forms of discriminant t^2-4
   (matrix (a,b;c,d) <-> form (c, d-a, -b); SL-conjugation <-> proper equivalence).
B: cyclic words in L=(1,0;1,1), R=(1,1;0,1) (each hyperbolic class of positive
   trace contains a positive word with both letters, unique up to rotation).
C: brute-force union-find in a box (small t), conjugating by S and T^{+-1}.
"""
import sys
from math import isqrt
sys.setrecursionlimit(10000)
def mul(A,B):
    return (A[0]*B[0]+A[1]*B[2], A[0]*B[1]+A[1]*B[3], A[2]*B[0]+A[3]*B[2], A[2]*B[1]+A[3]*B[3])
def inv(A): return (A[3],-A[1],-A[2],A[0])
I=(1,0,0,1); L=(1,0,1,1); R=(1,1,0,1); S=(0,-1,1,0); E=(1,0,0,-1)

# ---------- Method A ----------
def reduced(f,D):
    a,b,c=f; s=isqrt(D)  # D non-square: b<sqrtD <=> b<=s
    return 0<b<=s and (s-b)<2*abs(a) and 2*abs(a)<=s+b and (2*abs(a)-b)**2 < D if False else \
           (0<b<=s and (D > (2*abs(a)-b)**2 if 2*abs(a)>=b else False or D < (b-2*abs(a))**2) and (2*abs(a)-b)<=s)
def is_red(f,D):
    a,b,c=f; s=isqrt(D)
    if not (0<b<=s): return False
    x=2*abs(a)
    # sqrtD - b < x < sqrtD + b  (exact, D non-square)
    lo = (x+b)**2 > D            # x+b > sqrtD
    hi = (x-b)<=s                # x-b < sqrtD
    return lo and hi
def rho(f,D):
    a,b,c=f; s=isqrt(D); m=2*abs(c)
    if abs(c)*abs(c) > D:        # |c|>sqrtD: -|c| < r <= |c|
        r=(-b)%m
        if r>abs(c): r-=m
    else:                        # sqrtD-2|c| < r < sqrtD : largest r<=s, r==-b mod m
        r=s-((s+b)%m)
    return (c,r,(r*r-D)//(4*c))
def reduce_(f,D):
    n=0
    while not is_red(f,D):
        f=rho(f,D); n+=1
        assert n<10000
    return f
def methodA(t):
    D=t*t-4; s=isqrt(D); assert s*s!=D
    red=[]
    for b in range(1,s+1):
        if (b*b-D)%4: continue
        N=(b*b-D)//4   # = a*c, negative
        for a in range(1,abs(N)+1):
            if N%a==0:
                for aa in (a,-a):
                    f=(aa,b,N//aa)
                    if is_red(f,D): red.append(f)
    cyc={}; k=0
    for f in red:
        if f in cyc: continue
        g=f
        while g not in cyc:
            cyc[g]=k; g=rho(g,D); assert is_red(g,D)
        assert g==f or cyc[g]==k
        k+=1
    nSL=k
    # GL: (A,B,C)->(-A,B,-C)
    par=list(range(k))
    def find(x):
        while par[x]!=x: x=par[x]
        return x
    for f in red:
        g=(-f[0],f[1],-f[2]); assert g in cyc
        par[find(cyc[f])]=find(cyc[g])
    nGL=len({find(x) for x in range(k)})
    # companion matrix (t,-1;1,0) -> form (1,-t,1); inverse -> (-1,t,-1)
    f0=reduce_((1,-t,1),D); f1=reduce_((-1,t,-1),D)
    return nSL,nGL,cyc[f0]==cyc[f1]

# ---------- Method B ----------
def neck(w): return min(w[i:]+w[:i] for i in range(len(w)))
def word_of(M):
    # M with nonneg entries, det 1 -> word in L,R (unique)
    a,b,c,d=M; w=''
    while (a,b,c,d)!=I:
        if a>=c and b>=d: a,b=a-c,b-d; w+='R'     # M = R*M'
        elif c>=a and d>=b: c,d=c-a,d-b; w+='L'   # M = L*M'
        else: return None
        if min(a,b,c,d)<0: return None
    return w
def methodB(t):
    words=set()
    def dfs(M,w):
        if len(w)>t-1: return
        tr=M[0]+M[3]
        if tr>t: return
        if tr==t: words.add(neck(w))   # tr>2 forces both letters
        for ch,X in (('L',L),('R',R)): dfs(mul(M,X),w+ch)
    dfs(I,'')
    sw=lambda w: w.translate(str.maketrans('LR','RL'))
    nSL=len(words)
    nGL=len({min(w,neck(sw(w))) for w in words})
    # companion matrix: find a conjugate with nonneg entries by small search
    A=(t,-1,1,0); wA=None
    rng=range(-3,4)
    for p in rng:
        for q in rng:
            for r in rng:
                for s_ in rng:
                    if p*s_-q*r!=1: continue
                    P=(p,q,r,s_); B=mul(mul(P,A),inv(P))
                    if min(B)>=0:
                        w=word_of(B)
                        if w:
                            # verify word really multiplies to B
                            X=I
                            for ch in w: X=mul(X,L if ch=='L' else R)
                            assert X==B
                            wA=neck(w); break
                if wA: break
            if wA: break
        if wA: break
    assert wA in words
    selfinv = (neck(sw(wA[::-1]))==wA)
    return nSL,nGL,selfinv,wA
def check_identities():
    # inverse of a positive word W equals E * (reversed word) * E ; J R J = L
    import random
    J=(0,1,1,0)
    assert mul(mul(J,R),J)==L
    for _ in range(200):
        w=''.join(random.choice('LR') for _ in range(random.randint(1,12)))
        X=I
        for ch in w: X=mul(X,L if ch=='L' else R)
        Y=I
        for ch in w[::-1]: Y=mul(Y,L if ch=='L' else R)
        assert inv(X)==mul(mul(E,Y),E)

# ---------- Method C ----------
def methodC(t,B=400):
    mats=[]
    for a in range(-B,B+1):
        d=t-a
        if abs(d)>B: continue
        N=a*d-1  # = b*c
        if N==0:
            for x in range(-B,B+1):
                mats.append((a,x,0,d)); 
                if x: mats.append((a,0,x,d))
            continue
        for b in range(1,min(B,abs(N))+1):
            if N%b==0 and abs(N//b)<=B:
                mats.append((a,b,N//b,d)); mats.append((a,-b,-(N//b),d))
    idx={m:i for i,m in enumerate(mats)}
    par=list(range(len(mats)))
    def find(x):
        while par[x]!=x:
            par[x]=par[par[x]]; x=par[x]
        return x
    T=R
    for m in mats:
        for P in (S,T,inv(T)):
            g=mul(mul(P,m),inv(P))
            if g in idx: par[find(idx[m])]=find(idx[g])
    comps={find(i) for i in range(len(mats))}
    # GL: add E
    for m in mats:
        g=mul(mul(E,m),E)
        if g in idx: par[find(idx[m])]=find(idx[g])
    compsGL={find(i) for i in range(len(mats))}
    return len(comps),len(compsGL)

def direct_inverse_test(t,B=300):
    # PA=A^{-1}P, det P=1  <=>  P=(p,q;q+tp,-p), p^2+t p q+q^2=-1
    for p in range(-B,B+1):
        for q in range(-B,B+1):
            if p*p+t*p*q+q*q==-1: return (p,q)
    return None

if __name__=='__main__':
    check_identities()
    hi=int(sys.argv[1]) if len(sys.argv)>1 else 30
    print(" t | SL(A) SL(B) | GL(A) GL(B) | comp~inv(A) (B) | word of (t,-1;1,0)")
    ok=True; ones=[];onesGL=[]
    for t in range(3,hi+1):
        a=methodA(t); b=methodB(t) if t<=30 else (a[0],a[1],a[2],'-')
        ok &= (a[0]==b[0] and a[1]==b[1] and a[2]==b[2])
        if a[0]==1: ones.append(t)
        if a[1]==1: onesGL.append(t)
        print(f"{t:2d} | {a[0]:5d} {b[0]:5d} | {a[1]:5d} {b[1]:5d} | {str(a[2]):5s} {str(b[2]):5s} | {b[3]}")
    print("methods A and B agree on all rows:",ok)
    print("traces with exactly one SL class:",ones,"; one GL class:",onesGL)
    print("Method C (box union-find; component count is an upper bound that is exact once the box is large enough):")
    for t in range(3,9):
        print(t,methodC(t), "solution of p^2+tpq+q^2=-1 with |p|,|q|<=300:",direct_inverse_test(t))
    # (5)
    M=(2,1,1,1); mM=tuple(-x for x in M)
    pts=[(0,0),(1,0),(0,1),(1,1)]  # numerators over 2
    act=lambda A:[((A[0]*x+A[1]*y)%2,(A[2]*x+A[3]*y)%2) for x,y in pts]
    print("M on half-points:",act(M)); print("-M on half-points:",act(mM)); print("same:",act(M)==act(mM))
    # classes of trace -3: negation bijection; also by box search
    print("trace -3 box components (SL,GL):",methodC(-3))
