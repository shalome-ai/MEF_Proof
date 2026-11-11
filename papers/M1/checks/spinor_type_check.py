"""Type (real / complex / quaternionic) of the half-spin representations of Spin(n).

Audit of M1 Theorem 8.1, finding J1 (STEP_AUDIT.md section 11): is a spinor in
twelve dimensions complex of itself?

Method (no table is assumed).  Build complex gamma matrices g_1..g_n (n even),
g_a g_b + g_b g_a = 2 delta_ab, of size 2^(n/2).  The Lie algebra of Spin(n) acts by
s_ab = g_a g_b / 2 (a<b).  Restrict to the +1 eigenspace S+ of the chirality element.
Solve for all matrices B with   B conj(s_ab) = s_ab B   for every a<b.
 - no solution B != 0  : S+ is not equivalent to its conjugate  -> COMPLEX type
 - solution, B conj(B) = +c, c>0 : an invariant real structure  -> REAL type
 - solution, B conj(B) = -c, c>0 : an invariant quaternionic structure -> QUATERNIONIC
Also reports dim of the space of solutions (1 when S+ is irreducible and self-conjugate)
and the dimension of the commutant of Spin(n) on S+ (1 = irreducible, Schur).
"""
import numpy as np, itertools, sys
s1=np.array([[0,1],[1,0]],complex); s2=np.array([[0,-1j],[1j,0]]); s3=np.diag([1,-1]).astype(complex); I2=np.eye(2,dtype=complex)
def kron(*m):
    out=np.eye(1,dtype=complex)
    for x in m: out=np.kron(out,x)
    return out
def gammas(n):
    k=n//2; g=[]
    for j in range(k):
        g.append(kron(*([s3]*j+[s1]+[I2]*(k-j-1))))
        g.append(kron(*([s3]*j+[s2]+[I2]*(k-j-1))))
    return g
def nullspace(A,tol=1e-9):
    u,s,vh=np.linalg.svd(A,full_matrices=True)
    rank=(s>tol*max(1,s[0])).sum()
    return vh[rank:].conj().T
def analyse(n):
    g=gammas(n); N=2**(n//2)
    for a in range(n):
        for b in range(n):
            assert np.allclose(g[a]@g[b]+g[b]@g[a], 2*(a==b)*np.eye(N))
    chi=np.eye(N,dtype=complex)
    for x in g: chi=chi@x
    chi=chi*(1j)**(n//2)                    # chi^2 = 1
    assert np.allclose(chi@chi,np.eye(N))
    w,v=np.linalg.eigh(chi); P=v[:,w>0]     # basis of S+
    d=P.shape[1]
    # generators suffice: s_{a,a+1}
    S=[P.conj().T@(g[a]@g[a+1]/2)@P for a in range(n-1)]
    for a,x in enumerate(S): assert np.allclose(P@x, (g[a]@g[a+1]/2)@P)   # S+ is invariant
    Id=np.eye(d)
    comm=np.vstack([np.kron(Id,x)-np.kron(x.T,Id) for x in S])        # X s = s X  (column-stacked vec)
    cdim=nullspace(comm).shape[1]
    inter=np.vstack([np.kron(x.conj().T,Id)-np.kron(Id,x) for x in S]) # B conj(s) = s B
    ns=nullspace(inter)
    if ns.shape[1]==0: return d,cdim,0,"COMPLEX"
    B=ns[:,0].reshape(d,d,order="F")
    for x in S: assert np.allclose(B@x.conj(), x@B, atol=1e-7)
    BB=B@B.conj(); c=BB[0,0]
    assert np.allclose(BB,c*np.eye(d),atol=1e-7) and abs(c.imag)<1e-7
    return d,cdim,ns.shape[1],("REAL" if c.real>0 else "QUATERNIONIC")
if __name__=="__main__":
    for n in (2,4,6,8,10,12):
        d,cdim,k,t=analyse(n)
        print(f"n={n:2d}  dim_C S+ = {d:3d}  commutant dim = {cdim}  conj-intertwiners = {k}  type = {t}")
