/-
  M2_L13_operations.lean — Paper M2, card T2: the operations of order one that
  what is given determines (chat C9).
  Lean 4 core only: no Mathlib, no `sorry`, no `axiom`, no `native_decide`.

  What is certified: the finite arithmetic of card T2.

  * The five divisors of flux three on the corners whose odd corner is P4,
    3P4, 2P1+P4, 2P2+P4, 2P3+P4 and P1+P2+P3, each have flux three
    (`L13_flux`) and exactly the corner P4 odd (`L13_odd_P4`).
  * For each of the five, of the two lifts of M1, Definition 7.4, the one with
    two states on the pillowcase (counted as M1, Lemma 7.5(b), counts them) has
    the signs (+,+,+,−) (`L13_two_states`).
  * With div(℘ − e_k) = 2P_{k+1} − 2P_1 and div(℘′) = P2 + P3 + P4 − 3P1, each of
    the five less 3P4 is the integer combination written here (`L13_combination`).
  * On the pair (e^{−κs} y, i e^{κs} x): z_s = (1,1), its conjugate (1,−1), and
    differentiation along s, with κ = 1, is (−1, +1) times the entries:
    ∂_s z_s = −conj(z_s) (`L13_dz`).

  What is not certified: that the divisors named are those of the functions
  named (Verified Reference V-M2-13); anything about bundles, sections,
  smoothness or operations; those parts are by hand in the write-up log.
-/
namespace MEFProof.Paper_M2.L13

abbrev Dv := Int × Int × Int × Int

def add (a b : Dv) : Dv := (a.1 + b.1, a.2.1 + b.2.1, a.2.2.1 + b.2.2.1, a.2.2.2 + b.2.2.2)
def smul (n : Int) (a : Dv) : Dv := (n * a.1, n * a.2.1, n * a.2.2.1, n * a.2.2.2)
def flux (a : Dv) : Int := a.1 + a.2.1 + a.2.2.1 + a.2.2.2

def d3P4 : Dv := (0, 0, 0, 3)
def d2P1 : Dv := (2, 0, 0, 1)
def d2P2 : Dv := (0, 2, 0, 1)
def d2P3 : Dv := (0, 0, 2, 1)
def d111 : Dv := (1, 1, 1, 0)
def five : List Dv := [d3P4, d2P1, d2P2, d2P3, d111]

theorem L13_flux : five.all (fun a => flux a == 3) = true := by decide

/-- the parities of the four integers: `true` is odd. -/
def par (a : Dv) : Bool × Bool × Bool × Bool :=
  (a.1 % 2 != 0, a.2.1 % 2 != 0, a.2.2.1 % 2 != 0, a.2.2.2 % 2 != 0)

/-- P4 is the odd corner: its parity differs from that of the other three, which agree. -/
def oddP4 (a : Dv) : Bool :=
  let p := par a
  (p.1 == p.2.1) && (p.2.1 == p.2.2.1) && (p.2.2.2 != p.1)

theorem L13_odd_P4 : five.all oddP4 = true := by decide

/-- the number of states on the pillowcase under the first lift (M1, Lemma 7.5(b)). -/
def first (a : Dv) : Int := 1 + a.1 / 2 + a.2.1 / 2 + a.2.2.1 / 2 + a.2.2.2 / 2

/-- the signs of the lift with two states, written as parities: `true` is −1.
    Under the first lift they are the parities; under the second, their opposites. -/
def signsTwo (a : Dv) : Bool × Bool × Bool × Bool :=
  let p := par a
  if first a == 2 then p else (!p.1, !p.2.1, !p.2.2.1, !p.2.2.2)

theorem L13_two_states :
    five.all (fun a => (first a == 2 || 3 - first a == 2) && (signsTwo a == (false, false, false, true))) = true := by
  decide

def pe1 : Dv := (-2, 2, 0, 0)
def pe2 : Dv := (-2, 0, 2, 0)
def pe3 : Dv := (-2, 0, 0, 2)
def pp : Dv := (-3, 1, 1, 1)

theorem L13_combination :
    add d3P4 (smul (-1) pe3) = d2P1 ∧
    add d3P4 (add pe1 (smul (-1) pe3)) = d2P2 ∧
    add d3P4 (add pe2 (smul (-1) pe3)) = d2P3 ∧
    add d3P4 (add pp (smul (-2) pe3)) = d111 := by decide

/-- z_s and its conjugate on the pair (e^{−κs} y, i e^{κs} x); ∂_s with κ = 1. -/
def z : Int × Int := (1, 1)
def zbar : Int × Int := (1, -1)
def ds (v : Int × Int) : Int × Int := (-v.1, v.2)

theorem L13_dz : ds z = (-zbar.1, -zbar.2) := by decide

end MEFProof.Paper_M2.L13
