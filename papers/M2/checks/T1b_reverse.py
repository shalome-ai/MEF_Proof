"""Card T1b (chat C9): time run backwards together with the quarter-turn, R(p,s,r) = (Sp,-s,r),
and the spinor bundle S_4 with its lift of the fold.  Exact arithmetic, standard library only.
Part A, the line N_4:
 (A1) S has determinant +1 (it keeps the handedness of the fibre, so the degree three is kept);
 (A2) the signs of the lift of the fold pulled back by R, corner by corner: the sign over the
      corner circle of P_i is the sign over that of S P_i; they are (+,+,+,-) again;
 (A3) R commutes with the fold on the fibre (S(-p) = -S p) and M0^3 S M0^3 = S (R is a map of Y).
Part B, the forms of time and of space, in the frame (d_s, e1, e2, e3) and its dual (ds, e^1, e^2, e^3):
 (B1) J0 (J0 d_s = e1, J0 e2 = e3) has square -1; R acts on the frame by D = diag(-1,1,1,1);
      J0R = D J0 D^-1 has J0R d_s = -e1, J0R e2 = e3, square -1, and is not J0 nor -J0;
 (B2) handedness: the frame (v, Jv, w, Jw) of J0 has determinant +1, that of J0R determinant -1;
 (B3) the (0,1)-forms: tb1 = ds - i e^1 and tb2 = e^2 - i e^3 vanish on the (1,0)-vectors of J0;
      t1 = ds + i e^1 and tb2 vanish on the (1,0)-vectors of J0R;
 (B4) the pull-back by R^-1 carries tb1 to -t1 and tb2 to tb2: (0,1)-forms of J0 to (0,1)-forms of J0R;
 (B5) on the fibre, z_{-s} o R = -i z_s (T1_maps.py), so the pull-back by R^-1 carries
      d(zbar_s) to -i d(zbar_{-s}): the conjugate of the number c with z_s o R^-1 = c z_{-s}, c = i.
Run: python3 papers/M2/checks/T1b_reverse.py"""
from fractions import Fraction as Fr
import sys
ok=True
def chk(name,cond):
    global ok; print(("PASS " if cond else "FAIL ")+name); ok=ok and bool(cond)
def mm(A,B):
    n=len(A); return [[sum(A[i][k]*B[k][j] for k in range(n)) for j in range(n)] for i in range(n)]
def mp(A,k):
    R=[[int(i==j) for j in range(len(A))] for i in range(len(A))]
    for _ in range(k): R=mm(R,A)
    return R
def det(A):
    n=len(A)
    if n==1: return A[0][0]
    return sum((-1)**j*A[0][j]*det([r[:j]+r[j+1:] for r in A[1:]]) for j in range(n))
# ---- Part A
M0=[[2,1],[1,1]]; S=[[0,1],[-1,0]]; N=[[-1,0],[0,-1]]
chk("A1 det S = +1", det(S)==1)
P={1:(Fr(0),Fr(0)),2:(Fr(1,2),Fr(0)),3:(Fr(0),Fr(1,2)),4:(Fr(1,2),Fr(1,2))}
def act(A,k):
    p=P[k]; q=tuple((A[i][0]*p[0]+A[i][1]*p[1])%1 for i in range(2))
    return [j for j,w in P.items() if w==q][0]
sign={1:1,2:1,3:1,4:-1}
pulled={k:sign[act(S,k)] for k in P}
chk("A2 the signs pulled back by R are (+,+,+,-)", [pulled[k] for k in (1,2,3,4)]==[1,1,1,-1])
others=[{1:1,2:-1,3:1,4:1},{1:1,2:1,3:-1,4:1}]
chk("A2' the signs (+,-,+,+) and (+,+,-,+) are exchanged by R, not kept", {k:others[0][act(S,k)] for k in P}==others[1])
chk("A3 S commutes with the fold; M0^3 S M0^3 = S", mm(S,N)==mm(N,S) and mm(mm(mp(M0,3),S),mp(M0,3))==S)
# ---- Part B.  Matrices act on column vectors of components in the frame (d_s,e1,e2,e3).
J0=[[0,-1,0,0],[1,0,0,0],[0,0,0,-1],[0,0,1,0]]            # J0 d_s = e1, J0 e1 = -d_s, J0 e2 = e3, J0 e3 = -e2
D=[[-1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]              # R: d_s -> -d_s, e_a -> e_a ; D = D^-1
m1=[[-int(i==j) for j in range(4)] for i in range(4)]
J0R=mm(mm(D,J0),D)
col=lambda A,j:[A[i][j] for i in range(4)]
chk("B1 J0^2 = -1 and J0R^2 = -1", mm(J0,J0)==m1 and mm(J0R,J0R)==m1)
chk("B1 J0R d_s = -e1 and J0R e2 = e3", col(J0R,0)==[0,-1,0,0] and col(J0R,2)==[0,0,0,1])
chk("B1 J0R is neither J0 nor -J0", J0R!=J0 and J0R!=[[-x for x in r] for r in J0])
def hand(J):  # determinant of the frame (d_s, J d_s, e2, J e2), written as columns
    cols=[[1,0,0,0],col(J,0),[0,0,1,0],col(J,2)]
    return det([[cols[j][i] for j in range(4)] for i in range(4)])
chk("B2 handedness of J0 is +1 and of J0R is -1", hand(J0)==1 and hand(J0R)==-1)
# forms as rows of complex components on (ds,e^1,e^2,e^3); a (1,0)-vector of J is v - i J v
def v10(J,j): return [complex(int(i==j)) - 1j*J[i][j] for i in range(4)]
pair=lambda f,v: sum(a*b for a,b in zip(f,v))
tb1=[1,-1j,0,0]; tb2=[0,0,1,-1j]; t1=[1,1j,0,0]
chk("B3 tb1, tb2 vanish on the (1,0)-vectors of J0", all(pair(f,v10(J0,j))==0 for f in (tb1,tb2) for j in range(4)))
chk("B3 t1, tb2 vanish on the (1,0)-vectors of J0R", all(pair(f,v10(J0R,j))==0 for f in (t1,tb2) for j in range(4)))
chk("B3 tb1 does not vanish on the (1,0)-vectors of J0R", any(pair(tb1,v10(J0R,j))!=0 for j in range(4)))
pb=lambda f:[sum(f[i]*D[i][j] for i in range(4)) for j in range(4)]   # pull-back of a form by R^-1 (D = D^-1)
chk("B4 the pull-back by R^-1 carries tb1 to -t1 and tb2 to tb2", pb(tb1)==[-x for x in t1] and pb(tb2)==tb2)
c=1/(-1j)                                                            # z_s o R^-1 = c z_{-s}, from z_{-s} o R = -i z_s
chk("B5 z_s o R^-1 = i z_{-s}, so d(zbar_s) is carried to -i d(zbar_{-s})", c==1j and c.conjugate()==-1j)
print("ALL PASS" if ok else "SOME FAIL"); sys.exit(0 if ok else 1)
