# ζ — a count on the pillowcase, made blind to twelve (10 November 2026)

**Asked by the PI:** "do the count blind to twelve (and we must rule out why it is not 2, 4 and 6 - because there are '3 generations' it has to be at least 3 x 2 = 6, and either the spinc or warp (i think it is the warp) introduces another factor of 2." Sent while the count was running: "Or its 4 corners x 3 generations".

**Protocol, fixed before running** (`checks/count_blind.py`, header): count, in M1's geometry only, every natural finite set attached to what the drive's flow returns to the pillowcase, and the pillowcase's own counting invariants; report every count; adjust, combine or multiply nothing afterwards.

## Results (all CHECKED by `checks/count_blind.py`)

| # | What is counted | Result |
|---|---|---|
| 1 | Points of the pillowcase the drive returns to themselves every circuit | **3** = 1 corner (P₁) + 2 ordinary points. This equals the trace of the drive; in general the number returned after n circuits is the trace of M₀ⁿ: 3, 7, 18, 47 |
| 2 | Of those three, how many return with a half-turn (as −z on the torus) | **2** (the two ordinary points); P₁ is the cone point |
| 3 | The same set counted on the unfolded torus | **5** = 1 + 4 |
| 4 | Corners of the pillowcase | **4** = 1 fixed by the drive + 3 in one cycle |
| 5 | Topological Euler characteristic of the pillowcase; Betti sum | **2** |
| 6 | Sector-counting (orbifold) Euler number of the pillowcase: ½(0 + 4 + 4 + 4) | **6** = 3 sectors that contribute × 2 each; the fourth, untwisted, sector contributes 0 |
| 7 | Betti sums of the other factors (M1 Thm 7.6) | ℂP²: 3; S²: 2 |

**No single count on the pillowcase gives twelve.** The pillowcase alone gives 2, 3, 4, 5 and 6, depending on what is counted. Twelve appears only as a product of counts: 3 · 2 · 2 with the 3 and one 2 taken from ℂP² and S² (M1's χ(K₈)); or 6 × 2, or 4 × 3, by multiplying two pillowcase counts together, which the protocol does not allow me to do after the run.

## What the counts say about 2, 4 and 6

- **Why not 2.** Two is the pillowcase seen as a bare surface (its Euler characteristic). It ignores the corners' sectors altogether.
- **Why not 4.** There are four corners, but they are not four equal things: the drive fixes one and cycles three, and in the sector count the fourth sector contributes nothing (count 6: "sectors contributing zero: 1"). Paper 3 states the same: the untwisted sector "vanishes" through the odd theta characteristic (ll.580–583, READ; the value 6 CHECKED in `papers/M3/checks/paper3_check.py` item 4).
- **Six is a real count of the pillowcase on its own:** three sectors, each contributing two. That is the PI's "at least 3 × 2 = 6". Paper 3 identifies the two per sector as "a two-state ground doublet of half-integer charge" (l.586, READ): the 2 in the 6 is already of the kind the PI calls spin.
- **A further factor of 2,** to reach twelve from six, is not present in any count of the pillowcase I ran. If it is the warp (the two sides, ψ and its chiral twin), it has to be shown to double the six, and that has not been done.

## On "4 corners × 3 generations"

Paper III Addendum has this factorisation: "χ(K₈) = 12 = 4 × 3 (four pillowcase corners × three generations)" (l.1196, READ). Against the counts above: the four corners are 1 + 3 under the drive, and the three cycled corners are themselves one candidate for the three generations, so 4 × 3 risks using the same three twice; and in the sector count only three of the four corners' sectors contribute. On these counts 3 × 2 × 2 (three sectors, a doublet, the two sides) fits the structure better than 4 × 3. Neither is derived.

## Status

A count is not a derivation of ζ. What the count establishes: the pillowcase by itself carries a six, as three times two, by a standard counting formula; M1's twelve uses the pillowcase only as a 2. What remains: the last factor of 2; why each unit contributes π; why the units add; and why a turn of 12π shows as a growth.

---

## The last factor of 2: does the warp, or the spin, double the six? (10 November 2026)

**Asked by the PI:** "take the first", i.e. check whether the two sides of the warp really double the pillowcase's six; the PI's guess was "either the spinc or warp (i think it is the warp)".

**Protocol** (`checks/double_check.py`, header). Each candidate is turned into a definite group acting on the torus, and the same counting formula that gave six is applied to each, unchanged; every result is reported.

**Disclosure.** This was not fully blind. I worked two of the cases in my head while choosing the candidates, and so knew that one of them gives twelve before the script was written. The protocol was then fixed to include every candidate with one formula and to report all four.

| Candidate | The group | Count |
|---|---|---|
| G1 the fold alone (the baseline) | ℤ₂ = {1, −I} | **6** |
| G2 the warp's exchange, taken as a quarter-turn of the torus | ℤ₄ = {1, S, −I, S³} | **9** |
| G3 the spin: the fold lifted to spinors, where a turn by π lifts to J with J² = −1 | ℤ₄ = {1, J, −1, −J}, acting on the torus as {1, fold, 1, fold} | **12** |
| G4 both: the quarter-turn lifted to spinors | ℤ₈ acting through ℤ₄ | **18** |

All CHECKED by the script; fixed points used: S has 2, the fold 4.

**What this says.**

1. **The warp, taken as a symmetry of the torus, does not double the six.** It gives nine.
2. **The spin does.** Lifting the fold to spinors doubles the count exactly: twelve. The extra element is the −1 that a full turn gives a spinor.
3. **So on this count the factors are 3 (sectors) × 2 (the doublet in each sector) × 2 (the spin lift of the fold) = 12, on the pillowcase alone**, and the last 2 is the spin, not the warp.

**What it does not say, and why it must not be over-read.**

- **The doubling in G3 is a property of the formula.** If part of a group acts as nothing on the space, the formula multiplies the count by the size of that part (checked: 2 × 6 = 12, 2 × 9 = 18). So the question is not whether the arithmetic gives twelve, but whether the count *should* be taken with the lifted group. For spinors there is a reason to: the −1 does act on them, though not on the torus. That is an identification step, of the kind CLAUDE.md §2b names as the weak point; it is not proved here. A related statement from the physics literature, that such a count describes two copies of the original, is RECALLED and unverified.
- **The six is 3 × 2 in one arrangement and 2 + 4 in another.** Sorted by which sector the states live in, the six is two states of the bulk plus one at each of the four corners. Both arrangements are the same six.
- **The warp and the spin are not independent in M2.** The warp's exchange τ squares to the fold (M2 Prop 2.6), and the fold's lift to spinors squares to −1. They are successive links of one chain, which may be why the last factor of 2 can be attributed to either. Taken together (G4) they give eighteen, not twelve.
- **A count is still not a derivation of ζ.** Open as before: why each unit contributes π, why the units add, and why a turn shows as a growth.
