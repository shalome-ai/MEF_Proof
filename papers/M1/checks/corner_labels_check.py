"""Corner labels against the drive (Decision Log P174).
Checks, by exact arithmetic, which pairing of the cycled corners P2, P3, P4 with the
lines C_i, C_j, C_k is carried by the step M0 as Ad_w carries the units.
M0 = ((2,1),(1,1)); P2=(1/2,0), P3=(0,1/2), P4=(1/2,1/2); w = (1+i+j+k)/2, Ad_w(q) = w q w^-1.
"""
from fractions import Fraction as Fr
def qmul(p,q):
    a,b,c,d=p; e,f,g,h=q
    return (a*e-b*f-c*g-d*h, a*f+b*e+c*h-d*g, a*g-b*h+c*e+d*f, a*h+b*g-c*f+d*e)
w=(Fr(1,2),)*4; winv=(Fr(1,2),Fr(-1,2),Fr(-1,2),Fr(-1,2))
assert qmul(w,winv)==(1,0,0,0)
units={'i':(0,1,0,0),'j':(0,0,1,0),'k':(0,0,0,1)}
def name(q):
    for n,u in units.items():
        if q==u: return n
        if q==tuple(-x for x in u): return n   # the line R u, sign apart
Adw={n:name(qmul(qmul(w,u),winv)) for n,u in units.items()}
Adwinv={n:name(qmul(qmul(winv,u),w)) for n,u in units.items()}
print('Ad_w on the lines     :',Adw)
print('Ad_w^-1 on the lines  :',Adwinv)
P={'P2':(Fr(1,2),Fr(0)),'P3':(Fr(0),Fr(1,2)),'P4':(Fr(1,2),Fr(1,2))}
def M0(p): x,y=p; return ((2*x+y)%1,(x+y)%1)
step={n:[m for m,q in P.items() if q==M0(p)][0] for n,p in P.items()}
print('M0 on the corners     :',step)
for label,d in (('(a) Appendix B of v7.1: P2=C_j, P3=C_i, P4=C_k',{'P2':'j','P3':'i','P4':'k'}),
                ('(b) proof of Prop 5.6: P2=C_i, P3=C_j, P4=C_k',{'P2':'i','P3':'j','P4':'k'})):
    okw=all(Adw[d[c]]==d[step[c]] for c in P)
    oki=all(Adwinv[d[c]]==d[step[c]] for c in P)
    print(label,'| M0 with Ad_w:',okw,'| M0 with Ad_w^-1:',oki)
