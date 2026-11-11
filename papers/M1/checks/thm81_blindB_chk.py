import itertools, math
# Prop one-drive: p^2+t p q+q^2=-1 solutions in box
for t in range(3,13):
    s=[(p,q) for p in range(-300,301) for q in range(-300,301) if p*p+t*p*q+q*q==-1]
    print(t,len(s),s[:4])
# intertwiner check
def mul(A,B): return [[sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
for t in range(3,8):
  for p,q in [(1,-1),(2,5),(-3,4)]:
    P=[[p,q],[t*p+q,-p]]; A=[[t,-1],[1,0]]; Ai=[[0,1],[-1,t]]
    assert mul(P,A)==mul(Ai,P); assert P[0][0]*P[1][1]-P[0][1]*P[1][0]==-(p*p+t*p*q+q*q)
# classes of trace t in SL2(Z) by brute-force conjugation orbit on small matrices
def classes(t,B=12):
    mats=[(a,b,c,t-a) for a in range(-B,B+1) for b in range(-B,B+1) for c in range(-B,B+1) if a*(t-a)-b*c==1]
    S=set(mats); par={m:m for m in mats}
    def f(x):
        while par[x]!=x:
            par[x]=par[par[x]]; x=par[x]
        return x
    gens=[[[1,1],[0,1]],[[1,-1],[0,1]],[[0,1],[-1,0]],[[0,-1],[1,0]]]
    inv={0:1,1:0,2:3,3:2}
    for m in mats:
        M=[[m[0],m[1]],[m[2],m[3]]]
        for i,g in enumerate(gens):
            N=mul(mul(g,M),gens[inv[i]]); n=(N[0][0],N[0][1],N[1][0],N[1][1])
            if n in S: par[f(m)]=f(n)
    reps={f(m) for m in mats if max(abs(x) for x in m)<=4}
    return len(reps)
for t in range(3,9): print('trace',t,'classes (upper bound, small reps)',classes(t))
# entropy monotone
print([round(math.log((t+math.sqrt(t*t-4))/2),4) for t in range(3,7)])
# M2(R) transpose: skew elements multiples of J, J^2=-I
J=[[0,1],[-1,0]]; print(mul(J,J))
# worked conjugators
M0=[[2,1],[1,1]]
for A,S in [([[3,-1],[1,0]],[[-2,1],[-1,0]]),([[1,-1],[-1,2]],[[-1,-1],[2,1]]),([[0,-1],[1,3]],[[-2,-1],[3,1]])]:
    d=S[0][0]*S[1][1]-S[0][1]*S[1][0]; print(d, mul(S,A)==mul(M0,S))
