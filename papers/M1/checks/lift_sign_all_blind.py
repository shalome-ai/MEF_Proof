# Independent check. Exact arithmetic in Q(sqrt2): numbers are pairs (a,b) = a + b*sqrt2, Fractions.
from fractions import Fraction as F
from itertools import product, permutations
from collections import Counter

def R(a, b=0): return (F(a), F(b))
Z0, O1 = R(0), R(1)
def radd(x, y): return (x[0]+y[0], x[1]+y[1])
def rneg(x): return (-x[0], -x[1])
def rmul(x, y): return (x[0]*y[0]+2*x[1]*y[1], x[0]*y[1]+x[1]*y[0])
def qmul(p, q):
    a1,b1,c1,d1 = p; a2,b2,c2,d2 = q
    m = rmul
    def s(*t):
        r = Z0
        for sg, x in t: r = radd(r, x if sg > 0 else rneg(x))
        return r
    return (s((1,m(a1,a2)),(-1,m(b1,b2)),(-1,m(c1,c2)),(-1,m(d1,d2))),
            s((1,m(a1,b2)),(1,m(b1,a2)),(1,m(c1,d2)),(-1,m(d1,c2))),
            s((1,m(a1,c2)),(-1,m(b1,d2)),(1,m(c1,a2)),(1,m(d1,b2))),
            s((1,m(a1,d2)),(1,m(b1,c2)),(-1,m(c1,b2)),(1,m(d1,a2))))
def qconj(q): return (q[0], rneg(q[1]), rneg(q[2]), rneg(q[3]))
def qneg(q): return tuple(rneg(x) for x in q)
def qpow(q, n):
    r = ONE
    for _ in range(n): r = qmul(r, q)
    return r
ONE = (O1, Z0, Z0, Z0); MONE = qneg(ONE)
I_ = (Z0, O1, Z0, Z0); J_ = (Z0, Z0, O1, Z0); K_ = (Z0, Z0, Z0, O1)
E = [I_, J_, K_]
assert qmul(I_, J_) == K_ and qmul(J_, K_) == I_ and qmul(K_, I_) == J_
def norm(q):
    r = Z0
    for x in q: r = radd(r, rmul(x, x))
    return r
def Ad(q):
    """3x3 matrix (tuple of columns) of x -> q x q^-1 on (i,j,k); q unit."""
    cols = []
    for e in E:
        y = qmul(qmul(q, e), qconj(q))
        assert y[0] == Z0
        cols.append(y[1:])
    return tuple(cols)
def signed_perm(A):
    """If A maps each axis to +-axis, return tuple of (target index, sign); else None."""
    out = []
    for col in A:
        nz = [(t, col[t]) for t in range(3) if col[t] != Z0]
        if len(nz) != 1 or nz[0][1] not in (O1, rneg(O1)): return None
        out.append((nz[0][0], 1 if nz[0][1] == O1 else -1))
    return tuple(out)
def name(q):
    def rs(x):
        a, b = x
        if b == 0: return str(a)
        if a == 0: return f"{b}*r2"
        return f"({a}+{b}*r2)"
    return "(" + ",".join(rs(x) for x in q) + ")"
def closure(gens, mul, one):
    S = {one}; fr = [one]
    while fr:
        nf = []
        for x in fr:
            for g in gens:
                y = mul(x, g)
                if y not in S: S.add(y); nf.append(y)
        fr = nf
    return S

# ---------- T0 ----------
def mm(A, B): return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def minv(A):
    (p,q),(r,s) = A; assert p*s-q*r == 1
    return ((s,-q),(-r,p))
Id = ((1,0),(0,1)); mId = ((-1,0),(0,-1))
S = ((0,-1),(1,0)); a = ((1,1),(0,1)); b = ((1,0),(-1,1)); U = mm(a, b); M0 = ((2,1),(1,1))
Ui = minv(U)
print("T0: U =", U)
print("T0: S^2 == -I:", mm(S,S) == mId, "| U^3 == -I:", mm(U,mm(U,U)) == mId,
      "| M0 == U^-1 S U^-2 S:", mm(mm(mm(Ui,S),mm(Ui,Ui)),S) == M0)
print("T0 extra: a == U^-1 S^-1:", mm(Ui, minv(S)) == a, "| b == S U^2:", mm(S, mm(U,U)) == b)
corners = [(1,0),(0,1),(1,1)]  # P2,P3,P4 <-> i,j,k
def cperm(A):
    return tuple(corners.index(tuple((A[i][0]*v[0]+A[i][1]*v[1]) % 2 for i in range(2))) for v in corners)
pS, pU = cperm(S), cperm(U)
print("T0: corner perm of S (index of image of P2,P3,P4):", pS, " of U:", pU)

# ---------- T1 ----------
h = F(1,2); r2h = (F(0), F(1,2))  # sqrt2/2
cand = set()
for pos in range(4):
    for sg in (1,-1):
        q = [Z0]*4; q[pos] = R(sg); cand.add(tuple(q))
for sg in product((1,-1), repeat=4):
    cand.add(tuple(R(F(s,2)) for s in sg))
for p1 in range(4):
    for p2 in range(p1+1, 4):
        for s1, s2 in product((1,-1), repeat=2):
            q = [Z0]*4; q[p1] = (F(0), F(s1,2)); q[p2] = (F(0), F(s2,2)); cand.add(tuple(q))
G48 = cand
assert all(norm(q) == O1 for q in G48)
print("T1: candidates:", len(G48), "| all preserve line set:", all(signed_perm(Ad(q)) is not None for q in G48),
      "| closed under mult:", all(qmul(x,y) in G48 for x in G48 for y in G48))
imgs = {signed_perm(Ad(q)) for q in G48}
# all signed permutation matrices of det +1
def det_sp(sp):
    perm = [t for t,_ in sp]; sgn = 1
    for i in range(3):
        for j in range(i+1,3):
            if perm[i] > perm[j]: sgn = -sgn
    for _,s in sp: sgn *= s
    return sgn
allsp = {tuple(zip(p, sg)) for p in permutations(range(3)) for sg in product((1,-1), repeat=3)}
rot = {sp for sp in allsp if det_sp(sp) == 1}
print("T1: signed perm matrices det+1:", len(rot), "| image of the 48 under Ad equals that set:", imgs == rot,
      "| fibres all of size 2:", all(sum(1 for q in G48 if signed_perm(Ad(q)) == sp) == 2 for sp in rot))
print("T1: order distribution:", sorted(Counter(next(n for n in range(1,25) if qpow(q,n) == ONE) for q in G48).items()))

# ---------- T2 ----------
def lineperm(q): return tuple(t for t,_ in signed_perm(Ad(q)))
def qinv(q): return qconj(q)
pairs = []
for s in G48:
    if qpow(s,4) != ONE or lineperm(s) != pS: continue
    for u in G48:
        if lineperm(u) != pU or qpow(s,2) != qpow(u,3): continue
        pairs.append((s,u))
print("T2: number of s satisfying (i),(iii):", len({s for s,_ in pairs}), "| total pairs:", len(pairs))
def spmul(A, B):  # compose signed perms: (A o B)
    return tuple((A[t][0], A[t][1]*sg) for t, sg in B)
spid = tuple((t,1) for t in range(3))
rows = []
for s,u in pairs:
    ui = qinv(u)
    d = qmul(qmul(qmul(ui, s), qmul(ui, ui)), s)
    d3 = qpow(d,3); s2 = qpow(s,2)
    As, Au = signed_perm(Ad(s)), signed_perm(Ad(u))
    Hgrp = closure([As, Au], spmul, spid)
    Ggrp = closure([s, u], qmul, ONE)
    rows.append(dict(s=s,u=u,d=d,d3=d3,s2=s2,H=len(Hgrp),G=len(Ggrp),As=As,Au=Au,
                     dord=next(n for n in range(1,49) if qpow(d,n) == ONE)))
def key(r): return (name(r['d3']), name(r['s2']), r['H'], r['G'])
tab = Counter(key(r) for r in rows)
print("T2 table: (d^3, s^2, |H|, |G|) -> count")
for k_, v in sorted(tab.items(), key=lambda t: (t[0][2], t[0][0])): print("   ", k_, "->", v)
print("T2: orders of d by row:", sorted(Counter((key(r), r['dord']) for r in rows).items(), key=str))

# ---------- T3 ----------
# X tested two ways: (a) on a^2, b^2, -I (generators of Gamma(2) -- RECALLED, Sanov);
# (b) brute force over all words in S,U up to length L whose matrix is = I mod 2.
def rho_word(word, s, u):
    q = ONE
    for c in word: q = qmul(q, s if c == 'S' else u)
    return q
def mat_word(word):
    A = Id
    for c in word: A = mm(A, S if c == 'S' else U)
    return A
wa2 = "UUUUUSSS"*2      # a = U^-1 S^-1 = U^5 S^3
wb2 = "SUU"*2
assert mat_word(wa2) == mm(a,a) and mat_word(wb2) == mm(b,b) and mat_word("SS") == mId
L = 12
words = [w for n in range(L+1) for w in map("".join, product("SU", repeat=n))]
Kwords = [w for w in words if all((mat_word(w)[i][j] - Id[i][j]) % 2 == 0 for i in range(2) for j in range(2))]
print("T3: words up to length", L, ":", len(words), "| of which in K:", len(Kwords),
      "| distinct K matrices:", len({mat_word(w) for w in Kwords}))
t3 = Counter()
for r in rows:
    s,u = r['s'], r['u']
    triv = lambda q: q in (ONE, MONE)
    Xa = all(triv(rho_word(w, s, u)) for w in (wa2, wb2, "SS"))
    Xb = all(triv(rho_word(w, s, u)) for w in Kwords)
    r['X'] = Xa and Xb
    t3[(r['H'], Xa, Xb)] += 1
print("T3: (|H|, X on generators, X on all K-words) -> count:", sorted(t3.items()))
print("T3: X <=> |H|==6 on all pairs:", all(r['X'] == (r['H'] == 6) for r in rows))

# ---------- T4 / T5 ----------
def sat(r, sigma):
    def ok(A, perm):
        res = []
        for eps in (1,-1):
            good = True
            for P in range(3):
                t, sg = A[P]            # Ad(e_P) = sg * e_t
                if t != perm[P] or sigma[P]*sg != eps*sigma[perm[P]]: good = False
            if good: res.append(eps)
        return res
    return ok(r['As'], pS), ok(r['Au'], pU)
for sigma in [(1,1,1), (-1,1,1), (1,-1,1), (1,1,-1)]:
    c = Counter(); eps = Counter()
    for r in rows:
        eS, eU = sat(r, sigma)
        if eS and eU:
            c[key(r)] += 1; eps[(tuple(eS), tuple(eU))] += 1
            r.setdefault('Lsig', []).append(sigma)
    print(("T4" if sigma == (1,1,1) else "T5"), "sigma =", sigma, ": satisfying pairs:", sum(c.values()))
    for k_, v in sorted(c.items()): print("    row", k_, "->", v, "of", tab[k_])
    print("    (eps_S, eps_U) values:", dict(eps))
print("T4: L => X on all pairs:", all(r['X'] for r in rows if (1,1,1) in r.get('Lsig', [])))
print("T4: X => L ?:", all((1,1,1) in r.get('Lsig', []) for r in rows if r['X']))
print("T5: every |H|=6 pair satisfies L' for exactly this many of the 4 patterns:",
      sorted(Counter(len(r.get('Lsig', [])) for r in rows if r['H'] == 6).items()))
print("T5: pairs with |H|!=6 satisfying any of the 4 patterns:", sum(1 for r in rows if r['H'] != 6 and r.get('Lsig')))
allsig = list(product((1,-1), repeat=3))
print("T5 extra: over all 8 patterns, number of patterns satisfied per |H|=6 pair:",
      sorted(Counter(sum(1 for sg in allsig if all(sat(r, sg))) for r in rows if r['H'] == 6).items()))
print("\nFull list of pairs:")
for r in sorted(rows, key=lambda r: (r['H'], name(r['s']), name(r['u']))):
    print("  s=", name(r['s']), " u=", name(r['u']), " d=", name(r['d']), " d^3=", name(r['d3']),
          " |H|=", r['H'], " |G|=", r['G'], " X=", r['X'], " L'patterns=", r.get('Lsig', []))
