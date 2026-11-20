"""Card T2 (chat C9): the operations of order one that what is given determines.
Standard library only; rational arithmetic, and complex floats at a few sample points (exact for the
values used).  The finite parts of the card; the rest is by hand
in the write-up log.
Part A, the divisors of flux three on the corners (M1, Definition 7.4):
 (A1) there are twenty divisors D = sum a_i P_i with a_i >= 0 and sum a_i = 3;
 (A2) the corner signs (-1)^{a_i}, taken up to one overall sign, have exactly one odd corner
      for every one of the twenty, and each corner is the odd one for exactly five;
 (A3) the five whose odd corner is P_4 are 3P4, 2P1+P4, 2P2+P4, 2P3+P4, P1+P2+P3;
 (A5) for each of the five, with e = +1 if a_4 is odd and e = -1 if a_4 is even, the signs
      e(-1)^{a_i} are (+,+,+,-);
 (A4) for each of the five, of the first lift (signs (-1)^{a_i}, 1 + sum floor(a_i/2) states on
      the pillowcase, M1 Lemma 7.5(b)) and the second (the opposite signs, 3 less that number),
      the one with two states has the signs (+,+,+,-).
Part B, the five are carried one to another by the functions of Verified Reference V-M2-13:
      with P1 the origin and P2, P3, P4 the half-periods w1, w2, w3,
      div(p - e_k) = 2 P_{k+1} - 2 P_1  (k = 1,2,3)  and  div(p') = P2 + P3 + P4 - 3 P1.
 (B1) each of the five, less 3P4, is an integer combination of these four divisors, which is
      written down; (B2) the combination has p' an even number of times exactly when the two
      divisors have the same lift (first or second) with the signs (+,+,+,-): p - e_k is even
      and p' is odd.
Part C, the coordinate of the fibre along time, z_s = e^{-ks} y + i e^{ks} x (M2-W048):
 (C1) written on the pair of functions (e^{-ks} y, i e^{ks} x), z_s = (1,1), its conjugate
      (1,-1), and d/ds multiplies the first by -k and the second by +k: d z_s/ds = -k conj(z_s);
 (C2) the function conj(w)/w has the value +1 at real w and -1 at imaginary w (checked at
      sample points; by hand for every such w other than 0), so it has no limit at w = 0;
 (C3) the function conj(w)^2/w^2 has the value +1 at real w and -1 at w = t(1+i), so it has
      no limit at w = 0.
Run: python3 papers/M2/checks/T2_operations.py"""
from fractions import Fraction as Fr
from itertools import product
import sys
ok=True
def chk(name,cond):
    global ok; print(("PASS " if cond else "FAIL ")+name); ok=ok and bool(cond)
# ---- Part A
divs=[a for a in product(range(4),repeat=4) if sum(a)==3]
chk("A1 twenty divisors of flux three on the corners", len(divs)==20)
def odd_corner(a):
    s=[(-1)**x for x in a]
    odd=[i for i in range(4) if sum(1 for j in range(4) if s[j]==s[i])==1]
    return odd[0] if len(odd)==1 else None
chk("A2 every one has exactly one odd corner; five for each corner",
    all(odd_corner(a) is not None for a in divs) and all(sum(1 for a in divs if odd_corner(a)==c)==5 for c in range(4)))
five=sorted(a for a in divs if odd_corner(a)==3)
chk("A3 the five with the odd corner P4", five==sorted([(0,0,0,3),(2,0,0,1),(0,2,0,1),(0,0,2,1),(1,1,1,0)]))
def lift_with_two_states(a):
    first=1+sum(x//2 for x in a); second=3-first
    signs=[(-1)**x for x in a]
    if first==2 and second!=2: return "first",signs
    if second==2 and first!=2: return "second",[-x for x in signs]
    return None,None
chk("A4 for each of the five the lift with two states has the signs (+,+,+,-)",
    all(lift_with_two_states(a)[1]==[1,1,1,-1] for a in five))
chk("A5 with e = +1 for a_4 odd and -1 for a_4 even, the signs e(-1)^{a_i} are (+,+,+,-)",
    all([(1 if a[3]%2 else -1)*(-1)**x for x in a]==[1,1,1,-1] for a in five))
# ---- Part B
gen={ "p-e1":(-2,2,0,0), "p-e2":(-2,0,2,0), "p-e3":(-2,0,0,2), "p'":(-3,1,1,1) }
base=(0,0,0,3)
comb={ (0,0,0,3):{}, (2,0,0,1):{"p-e3":-1}, (0,2,0,1):{"p-e1":1,"p-e3":-1},
       (0,0,2,1):{"p-e2":1,"p-e3":-1}, (1,1,1,0):{"p'":1,"p-e3":-2} }
def total(c): return tuple(sum(n*gen[g][i] for g,n in c.items()) for i in range(4))
chk("B1 each of the five, less 3P4, is the written combination",
    all(total(comb[a])==tuple(a[i]-base[i] for i in range(4)) for a in five))
chk("B2 p' enters an odd number of times exactly when the lift with two states changes its name",
    all((comb[a].get("p'",0)%2==1)==(lift_with_two_states(a)[0]!=lift_with_two_states(base)[0]) for a in five))
# ---- Part C
k=Fr(1)                      # the rate, set to one: the identity is linear in it
z=(Fr(1),Fr(1)); zbar=(Fr(1),Fr(-1))
dz=(-k*z[0], k*z[1])
chk("C1 d z_s / ds = -k conj(z_s)", dz==tuple(-k*c for c in zbar))
vals_real=[complex(t,0).conjugate()/complex(t,0) for t in (1,-1,2,-3)]
vals_imag=[complex(0,t).conjugate()/complex(0,t) for t in (1,-1,2,-3)]
chk("C2 conj(w)/w is +1 on the real axis and -1 on the imaginary axis", all(v==1 for v in vals_real) and all(v==-1 for v in vals_imag))
def q(w): return (w.conjugate()**2)/(w**2)
chk("C3 conj(w)^2/w^2 is +1 on the real axis and -1 along 1+i", all(q(complex(t,0))==1 for t in (1,-2,3)) and all(q(complex(t,t))==-1 for t in (1,-2,3)))
print("ALL PASS" if ok else "SOME FAIL"); sys.exit(0 if ok else 1)
