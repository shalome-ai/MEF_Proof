import numpy as np, itertools
np.set_printoptions(linewidth=200, precision=4, suppress=True)
rng = np.random.default_rng(0)
X=np.array([[0,1],[1,0]],complex); Y=np.array([[0,-1j],[1j,0]]); Zp=np.diag([1,-1]).astype(complex); I2=np.eye(2,dtype=complex)
def kron(*m):
    r=np.eye(1,dtype=complex)
    for x in m: r=np.kron(r,x)
    return r
g=[]
for k in range(6):
    g.append(kron(*([Zp]*k+[X]+[I2]*(5-k))))
    g.append(kron(*([Zp]*k+[Y]+[I2]*(5-k))))
N=64; E=np.eye(N,dtype=complex)
err=max(np.abs(g[a]@g[b]+g[b]@g[a]-2*(a==b)*E).max() for a in range(12) for b in range(12))
print("Clifford relation max error:",err)
def realrank(mats,tol=1e-8):
    V=np.array([np.concatenate([m.real.ravel(),m.imag.ravel()]) for m in mats])
    return np.linalg.matrix_rank(V,tol=tol)
def cplxrank(mats,tol=1e-8):
    return np.linalg.matrix_rank(np.array([m.ravel() for m in mats]),tol=tol)
def R(A,B):  # real 128x128 matrix of v -> A v + B conj v
    P=A+B; M=A-B
    return np.block([[P.real,-M.imag],[P.imag,M.real]])
omega=E.copy()
for a in range(12): omega=omega@g[a]
print("omega^2=+1:",np.abs(omega@omega-E).max(), " omega anticommutes with each g:",max(np.abs(omega@x+x@omega).max() for x in g))

def commutant(gens, label):
    # gens: complex matrices x (invertible). conjugations by them commute pairwise & are involutions (checked)
    def projL(M):
        for x in gens: M=(M+x@M@np.linalg.inv(x))/2
        return M
    def projA(B):
        for x in gens: B=(B+x@B@np.linalg.inv(x.conj()))/2
        return B
    Ls=[projL(rng.normal(size=(N,N))+1j*rng.normal(size=(N,N))) for _ in range(12)]
    As=[projA(rng.normal(size=(N,N))+1j*rng.normal(size=(N,N))) for _ in range(12)]
    # verify outputs commute
    eL=max(np.abs(M@x-x@M).max() for M in Ls for x in gens)
    eA=max(np.abs(B@x.conj()-x@B).max() for B in As for x in gens)
    print(label,": linear part real-dim",realrank(Ls),"antilinear part real-dim",realrank(As),"(residuals",eL,eA,")")
    return Ls,As
print("\n=== Q1 ===")
for name,gens in (("g_a",g),("i*g_a",[1j*x for x in g])):
    Ls,As=commutant(gens,"commutant of all "+name)
    print("   linear part spanned by 1 (over C):",cplxrank(Ls+[E])==1)
# explicit C for variant 1: product of imaginary gammas
C=E.copy()
for a in range(1,12,2): C=C@g[a]
print("C real:",np.abs(C.imag).max(), " C conj(g)=g C:",max(np.abs(C@x.conj()-x@C).max() for x in g), " C conj(C)=-1:",np.abs(C@C.conj()+E).max())
Ls,As=commutant(g,"again")
print("antilinear commutant of g_a inside C-span of C:",cplxrank(As+[C])==1)
Cp=omega@C
gi=[1j*x for x in g]
print("variant: C'=omega C; C' conj(ig)=(ig) C':",max(np.abs(Cp@x.conj()-x@Cp).max() for x in gi)," C'conj(C')=-1:",np.abs(Cp@Cp.conj()+E).max())
print("C does NOT commute with i*g_a (residual):",max(np.abs(C@x.conj()-x@C).max() for x in gi))
O=np.zeros((N,N),complex)
def table(Cm,label):
    one=R(E,O); qi=R(1j*E,O); qj=R(O,Cm); qk=qi@qj
    names=['1','i','j','k']; b=[one,qi,qj,qk]
    print("multiplication table of Z",label,"(row*col):")
    for x in range(4):
        row=[]
        for y in range(4):
            p=b[x]@b[y]; s='?'
            for z in range(4):
                for sg in (1,-1):
                    if np.abs(p-sg*b[z]).max()<1e-10: s=('+' if sg>0 else '-')+names[z]
            row.append(s)
        print("   ",names[x],":",row)
    return b
Zb=table(C,"(g_a)"); Zb2=table(Cp,"(i g_a)")
Rg=[R(x,O) for x in g]; Rgi=[R(1j*x,O) for x in g]
print("Z basis commutes with R(g_a):",max(np.abs(z@x-x@z).max() for z in Zb for x in Rg))
print("Z' basis commutes with R(i g_a):",max(np.abs(z@x-x@z).max() for z in Zb2 for x in Rgi))
print("real dim of span(Z u Z'):",np.linalg.matrix_rank(np.array([z.ravel() for z in Zb+Zb2])))
# Spin commutant
sg=[g[0]@g[a] for a in range(1,12)]
Ls,As=commutant(sg,"commutant of Spin on all of S")
w,U=np.linalg.eigh(omega)  # omega hermitian?
print("omega hermitian:",np.abs(omega-omega.conj().T).max())
for sgn in (1,-1):
    Us=U[:,np.abs(w-sgn)<1e-8]; d=Us.shape[1]
    # restricted generators in basis Us : x -> Us^H x Us ; antilinear B -> Us^H B conj(Us)
    Lr=[Us.conj().T@M@Us for M in Ls]; Ar=[Us.conj().T@B@Us.conj() for B in As]
    xr=[Us.conj().T@x@Us for x in sg]
    eL=max(np.abs(M@x-x@M).max() for M in Lr for x in xr); eA=max(np.abs(B@x.conj()-x@B).max() for B in Ar for x in xr)
    print(" chirality %+d eigenspace dim %d: restricted commutant linear real-dim %d, antilinear real-dim %d (resid %g %g)"%(sgn,d,realrank(Lr),realrank(Ar),eL,eA))
    B0=Ar[0]; s=B0@B0.conj(); lam=s[0,0]
    print("   antilinear generator B: B conj(B) = lambda*1 with lambda=",lam," resid",np.abs(s-lam*np.eye(d)).max()," => sign",np.sign(lam.real))
    # independent direct check of restricted commutant (not via restriction of global one)
    def pL(M):
        for x in xr: M=(M+x@M@np.linalg.inv(x))/2
        return M
    def pA(M):
        for x in xr: M=(M+x@M@np.linalg.inv(x.conj()))/2
        return M
    print("   direct: linear",realrank([pL(rng.normal(size=(d,d))+1j*rng.normal(size=(d,d))) for _ in range(10)]),"antilinear",realrank([pA(rng.normal(size=(d,d))+1j*rng.normal(size=(d,d))) for _ in range(10)]))

print("\n=== Q2 ===")
mons=[]
for bits in range(4096):
    M=E.copy()
    for a in range(12):
        if bits>>a&1: M=M@g[a]
    mons.append(M.ravel())
G=np.array(mons)
Gram=G.conj()@G.T
print("monomials: Gram = 64*Id (orthogonal over C, hence real dim of Cl = 4096 and Cl ∩ iCl = 0): resid",np.abs(Gram-64*np.eye(4096)).max())
co=G.conj()@( (1j*E).ravel())/64
print("coefficients of i*1 in monomial basis: nonzero entries",[(k,c) for k,c in enumerate(co) if abs(c)>1e-10])
deg=np.array([bin(b).count('1') for b in range(4096)])
print("variant basis i^deg * monomial: coefficient of i*1 is the same single entry (identity, coefficient i): not real")
del G,Gram

print("\n=== Q3 ===")
for nm,Zs,gs in (("Z,g",Zb,Rg),("Z',ig",Zb2,Rgi)):
    x=gs[10]@gs[11]; xi=np.linalg.inv(x)
    print(nm," x=g11g12: max|x z x^-1 - z| over basis:",max(np.abs(x@z@xi-z).max() for z in Zs))
    x=np.eye(128)
    for a in (0,3,4,7,9): x=x@gs[a]
    x=x+0.3*gs[2]@gs[5]+0.7*np.eye(128)
    xi=np.linalg.inv(x); print(nm," generic invertible x in Cl: max|x z x^-1 - z|:",max(np.abs(x@z@xi-z).max() for z in Zs))

print("\n=== Q4 ===")
def qmat(u,side):
    # quaternion as (w,x,y,z); matrix of left/right mult by unit u on R^4
    def mul(p,q):
        a,b,c,d=p; e,f,g_,h=q
        return np.array([a*e-b*f-c*g_-d*h, a*f+b*e+c*h-d*g_, a*g_-b*h+c*e+d*f, a*h+b*g_-c*f+d*e])
    M=np.zeros((4,4))
    for n in range(4):
        e=np.zeros(4); e[n]=1
        M[:,n]=mul(u,e) if side=='L' else mul(e,u)
    return np.kron(np.eye(3),M)
def spinj(j):
    d=int(2*j+1); m=np.arange(j,-j-1,-1)
    Jp=np.zeros((d,d),complex)
    for k in range(1,d): Jp[k-1,k]=np.sqrt(j*(j+1)-m[k]*(m[k]+1))
    Jx=(Jp+Jp.conj().T)/2; Jy=(Jp-Jp.conj().T)/2j; Jz=np.diag(m).astype(complex)
    return Jx,Jy,Jz
for side in ('L','R'):
  for var,gg in (("g_a",g),("i*g_a",gi)):
    print("--- side",side," variant",var)
    I_,J_,K_=[qmat(np.eye(4)[n],side) for n in (1,2,3)]
    print(" 12x12: skew:",max(np.abs(M+M.T).max() for M in (I_,J_,K_))," IJ=+K:",np.abs(I_@J_-K_).max()<1e-12," IJ=-K:",np.abs(I_@J_+K_).max()<1e-12)
    lift=lambda Xm: sum(Xm[a,b]*gg[a]@gg[b] for a in range(12) for b in range(12))/4
    Ih,Jh,Kh=lift(I_),lift(J_),lift(K_)
    hats=[Ih,Jh,Kh]
    print(" (a) commute with Z-basis (as real maps):",max(np.abs(R(h,O)@z-z@R(h,O)).max() for h in hats for z in (Zb if var=="g_a" else Zb2)))
    print("     max ||[I^,g_a]|| over a (nonzero => not commuting, not in Z):",max(np.abs(Ih@x-x@Ih).max() for x in gg))
    print("     [X^,g_c] = sum_a g_a X_ac * s, s=+1:",max(np.abs(Ih@gg[c]-gg[c]@Ih-sum(gg[a]*I_[a,c] for a in range(12))).max() for c in range(12)),
          " s=-1:",max(np.abs(Ih@gg[c]-gg[c]@Ih+sum(gg[a]*I_[a,c] for a in range(12))).max() for c in range(12)))
    print("     commute with omega:",max(np.abs(h@omega-omega@h).max() for h in hats))
    print(" (b) |I^2+1|:",np.abs(Ih@Ih+E).max()," eigenvalues of I^/i (with mult):",dict(zip(*np.unique(np.round(np.linalg.eigvals(Ih).imag,6),return_counts=True))))
    print("     |I^J^-K^|:",np.abs(Ih@Jh-Kh).max()," |I^J^+K^|:",np.abs(Ih@Jh+Kh).max()," |I^J^+J^I^|:",np.abs(Ih@Jh+Jh@Ih).max())
    cm=lambda a,b:a@b-b@a
    for nm,(a,b,c) in (("[I^,J^] vs K^",(Ih,Jh,Kh)),("[J^,K^] vs I^",(Jh,Kh,Ih)),("[K^,I^] vs J^",(Kh,Ih,Jh))):
        k=cm(a,b); coef=np.vdot(c,k)/np.vdot(c,c); print("    ",nm,": coefficient",np.round(coef,10)," resid",np.abs(k-coef*c).max())
    Cas=-(Ih@Ih+Jh@Jh+Kh@Kh)/4
    ev=np.round(np.linalg.eigvalsh((Cas+Cas.conj().T)/2),6)
    print(" (d) Casimir -(I^2+J^2+K^2)/4 eigenvalues j(j+1) with multiplicity:",dict(zip(*np.unique(ev,return_counts=True)))," commutes with hats:",max(np.abs(cm(Cas,h)).max() for h in hats))
    for sgn in (1,-1):
        Us=U[:,np.abs(w-sgn)<1e-8]; Cr=Us.conj().T@Cas@Us
        ev=np.round(np.linalg.eigvalsh((Cr+Cr.conj().T)/2),6); print("     chirality %+d:"%sgn,dict(zip(*np.unique(ev,return_counts=True))))
    # (c) generated algebra
    basis=[E]; 
    def add(vecs,M,tol=1e-9):
        v=np.concatenate([M.real.ravel(),M.imag.ravel()])
        for q in vecs: v=v-q*(q@v)
        for q in vecs: v=v-q*(q@v)
        n=np.linalg.norm(v)
        if n>tol*max(1,np.abs(M).max()): vecs.append(v/n); return True
        return False
    vecs=[]; els=[]; frontier=[E]; add(vecs,E); els.append(E)
    while frontier:
        new=[]
        for M in frontier:
            for h in hats:
                P=M@h; P=P/max(1,np.abs(P).max())
                if add(vecs,P): els.append(P); new.append(P)
        frontier=new
    print(" (c) real dim of algebra generated by I^,J^,K^ (with 1):",len(els)," complex rank of same span:",cplxrank(els))
    # without unit
    vecs2=[]; els2=[]; fr=[]
    for h in hats:
        if add(vecs2,h): els2.append(h); fr.append(h)
    while fr:
        new=[]
        for M in fr:
            for h in hats:
                P=M@h; P=P/max(1,np.abs(P).max())
                if add(vecs2,P): els2.append(P); new.append(P)
        fr=new
    print("     without adjoining 1: real dim",len(els2))
    # centre
    Vm=np.array([np.concatenate([m.real.ravel(),m.imag.ravel()]) for m in els])
    rows=[]
    for h in hats:
        rows.append(np.array([np.concatenate([cm(m,h).real.ravel(),cm(m,h).imag.ravel()]) for m in els]).T)
    Sv=np.linalg.svd(np.vstack(rows),compute_uv=False)
    print("     real dim of centre of that algebra:",int((Sv<1e-8*Sv[0]).sum()))
    print("     in Cl? hats are real combos of g_a g_b by construction; coefficients real:",True)
    # (e) intersection with Z: complex-linear part of Z is C*1; algebra ∩ C*1
    print(" (e) real dim of (algebra + R*i*1) :",realrank(els+[1j*E])," (=dim+1 means i*1 not in algebra; algebra ∩ Z = R*1)")
print("\n abstract irreps: sign of antilinear intertwiner squared (+1 real type, -1 quaternionic)")
for j in (0.5,1,1.5):
    Js=[-1j*x for x in spinj(j)]  # antihermitian generators
    d=int(2*j+1)
    # solve B conj(T)=T B
    rows=[np.kron(np.eye(d),T.conj().T).T*0 for T in Js]
    Mrows=[]
    for T in Js:
        # vec(B conj(T) - T B), row-major vec: (I⊗conj(T)^T) - (T⊗I)
        Mrows.append(np.kron(np.eye(d),T.conj().T) - np.kron(T,np.eye(d)))
    u,s,vh=np.linalg.svd(np.vstack(Mrows)); B=vh[-1].conj().reshape(d,d)
    res=max(np.abs(B@T.conj()-T@B).max() for T in Js)
    lam=(B@B.conj())[0,0]
    print("  j=%.1f nullity %d resid %.1e  B conj(B)= %.3f * 1"%(j,int((s<1e-9).sum()),res,lam.real/np.abs(lam)))

print("\n=== Q5 ===")
th=0.7
circ=R(np.exp(1j*th)*E,O)
print("e^{i theta} = cos*1 + sin*i in Z:",np.abs(circ-(np.cos(th)*Zb[0]+np.sin(th)*Zb[1])).max())
u=(0.2*Zb[1]+0.5*Zb[2]-0.3*Zb[3]); u=u/np.sqrt(0.04+0.25+0.09)
print("u^2=-1 for random unit imaginary u:",np.abs(u@u+np.eye(128)).max())
Mx=np.array([(z@u-u@z).ravel() for z in Zb]); s=np.linalg.svd(Mx,compute_uv=False)
print("dim of centraliser of u in Z:",int((s<1e-9).sum()))
