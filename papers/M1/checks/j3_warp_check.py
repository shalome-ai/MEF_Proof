"""J3 (13 Nov 2026; Decision Log P138). Checks of the computations behind read-back R13.
Model: s along time, the fibre torus R^2/Z^2 with step M0 = (2 1; 1 1).
x, y are coordinates along unit eigenvectors v1 (eigenvalue phi^2) and v2 = S v1 (eigenvalue phi^-2),
S = (0 1; -1 0) the quarter-turn.  Lengths: ds^2 + e^{2ks} dx^2 + e^{-2ks} dy^2, i.e. on the fibre at time s
the inner product G(s) = e^{2ks} v1 v1^T + e^{-2ks} v2 v2^T.
The fibre at s+L is joined to the fibre at s by the step: (s+L, v) ~ (s, M0 v).
W1  v2 = S v1 is an eigenvector of M0 with eigenvalue phi^-2.
W2  the join keeps lengths, M0^T G(s) M0 = G(s+L), exactly when e^{kL} = phi^2 (tested at that value and at two others).
W3  E: (s, v) -> (-s, S v) keeps lengths: S^T G(-s) S = G(s).
W4  E respects the join: S M0 S^-1 = M0^-1.
W5  E applied twice is (s, v) -> (s, -v): S^2 = -I, the fold.
W6  the fold keeps lengths and does not exchange the two directions: G(s) unchanged, v1 -> -v1.
"""
import numpy as np
M0=np.array([[2.,1.],[1.,1.]]); S=np.array([[0.,1.],[-1.,0.]]); phi=(1+5**.5)/2
w,V=np.linalg.eigh(M0); v1=V[:,np.argmax(w)]; v2=S@v1
ok=lambda a,b: np.allclose(a,b,atol=1e-10)
print("W1", ok(M0@v1,phi**2*v1) and ok(M0@v2,phi**-2*v2) and ok(v1@v2,0))
def G(s,k): return np.exp(2*k*s)*np.outer(v1,v1)+np.exp(-2*k*s)*np.outer(v2,v2)
L=1.0
for name,k in (("k=2log(phi)/L",2*np.log(phi)/L),("k=log(phi)/L",np.log(phi)/L),("k=-2log(phi)/L",-2*np.log(phi)/L)):
    print("W2",name, all(ok(M0.T@G(s,k)@M0,G(s+L,k)) for s in (-.7,0,.3,2.1)))
k=2*np.log(phi)/L
print("W3", all(ok(S.T@G(-s,k)@S,G(s,k)) for s in (-.7,0,.3,2.1)))
print("W4", ok(S@M0@np.linalg.inv(S),np.linalg.inv(M0)))
print("W5", ok(S@S,-np.eye(2)))
print("W6", all(ok((-np.eye(2)).T@G(s,k)@(-np.eye(2)),G(s,k)) for s in (-.7,.3)))
print("coords: S(x v1 + y v2) = -y v1 + x v2:", ok(S@(0.3*v1+0.8*v2), -0.8*v1+0.3*v2))
