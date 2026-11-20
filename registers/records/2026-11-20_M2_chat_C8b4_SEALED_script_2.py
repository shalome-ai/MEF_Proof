"""Chat C8b4: the test of a LEAD on the whole geometry (Decision Log P259, P260); no entry uses it.
The exchange on time and the fibre is (p,s) -> (S p, -s) (M1 v7.3 l.704). On the directions of time and
of space M2-W053 has J0 with J0 d_s = e1, J0 e2 = e3, e_i the left-invariant fields of S^3 = Sp(1).
Checks, at random points of S^3:
 (A) with the identity on space, the exchange carries J0 to a structure of the OPPOSITE handedness:
     the hypothesis "keeps the handedness of J0" of M2-W054(vi) fails.
 (B) with quaternion conjugation u -> conj(u) on space: the map of time and space keeps the lengths in
     which d_s,e1,e2,e3 are orthonormal, keeps the handedness (determinant +1), applied twice is the
     identity, and carries J0 to J0'' = a J0 a^-1 with a = 1 (+) rotation, a depending on the point of
     S^3 only: the hypotheses of M2-W054(vi) hold.
 (C) the same for u -> -conj(u)."""
import random, math
def qm(a,b):
    return (a[0]*b[0]-a[1]*b[1]-a[2]*b[2]-a[3]*b[3], a[0]*b[1]+a[1]*b[0]+a[2]*b[3]-a[3]*b[2],
            a[0]*b[2]-a[1]*b[3]+a[2]*b[0]+a[3]*b[1], a[0]*b[3]+a[1]*b[2]-a[2]*b[1]+a[3]*b[0])
cj=lambda a:(a[0],-a[1],-a[2],-a[3])
U=[(0,1,0,0),(0,0,1,0),(0,0,0,1)]
def det(m):
    n=len(m)
    if n==1: return m[0][0]
    return sum((-1)**j*m[0][j]*det([r[:j]+r[j+1:] for r in m[1:]]) for j in range(n))
def mm(A,B): return [[sum(A[i][k]*B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]
T=lambda A:[list(r) for r in zip(*A)]
J0=[[0,-1,0,0],[1,0,0,0],[0,0,0,-1],[0,0,1,0]]     # columns: images of d_s,e1,e2,e3: J0 d_s=e1, J0 e2=e3
close=lambda A,B:max(abs(A[i][j]-B[i][j]) for i in range(len(A)) for j in range(len(A)))<1e-9
I4=[[float(i==j) for j in range(4)] for i in range(4)]
# (A) identity on space: differential diag(-1,1,1,1)
D=[[-1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]
assert det(D)==-1                                   # handedness of time and space reversed
random.seed(2)
for sign in (1,-1):                                  # (B) u->conj(u); (C) u->-conj(u)
    for _ in range(100):
        u=[random.gauss(0,1) for _ in range(4)]; n=math.sqrt(sum(c*c for c in u)); u=tuple(c/n for c in u)
        v=tuple(sign*c for c in cj(u))               # image point
        # differential on space: tangent u*q_i -> sign*conj(u*q_i); in the left frame at v: conj(v)*that
        C=[[0]*3 for _ in range(3)]
        for i,q in enumerate(U):
            w=qm(cj(v),tuple(sign*c for c in cj(qm(u,q))))
            assert abs(w[0])<1e-12
            for r in range(3): C[r][i]=w[r+1]
        D=[[-1,0,0,0]]+[[0]+C[r] for r in range(3)]
        assert close(mm(T(D),D),I4) and abs(det(D)-1)<1e-9      # keeps the lengths; keeps the handedness
        Jpp=mm(mm(D,J0),T(D))                                   # image structure
        Rot=[[-C[r][i] for i in range(3)] for r in range(3)]
        a=[[1,0,0,0]]+[[0]+Rot[r] for r in range(3)]
        assert abs(det(a)-1)<1e-9 and close(mm(T(a),a),I4) and close(Jpp,mm(mm(a,J0),T(a)))
        assert close(mm(Jpp,Jpp),[[-x for x in r] for r in I4])
        # applied twice: the identity on space
        assert max(abs(sign*cj(v)[k]-u[k]) for k in range(4))<1e-12
print('all checks pass')
