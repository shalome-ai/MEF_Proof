# M2 — node N1: what varies, and when two geometries are the same

**Working note, 11 November 2026. Not paper text. Nothing here is banked.** Line numbers are those of canon M1 v6.3. Every definition below is DECLARED and is the architect's proposal; the PI banks. Marks: READ (line), CHECKED (hand computation given), RECALLED (listed apart in §6, used nowhere).

## 1. What is held (READ)
- The manifold with every piece, the twist and every whole number (ll.967–971; P72).
- The division into what is seen and what is not, and the projection π (ll.146–154).
- The fold ι and its four corners (ll.501, 583); the step M₀ and the three-step time circle, glued once round by M₀³ (ll.300, 837).
- The classes of the Spin^c line and of the twist (ll.693, 763).
- "Product" only names the pieces: the internal piece is carried round time by a map of itself (l.163).

## 2. Definitions proposed (for the Definitions Register before use)
**Shape.** A shape is a choice, on the held manifold, of all the continuous data of N0, such that Definitions 2.1–2.8 of M1 hold with M1's whole numbers. Its parts are named in §3.

**Admissible relabelling.** A smooth invertible map of the held manifold to itself that keeps the division into what is seen and what is not (it carries each fibre of π to a fibre of π), keeps the orientation, keeps the direction of time, and keeps the fold with its corners.

**The same.** Two shapes are the same when an admissible relabelling carries one to the other, or when they differ only in overall size, or both.

**Small movement.** The rate of change, at its start, of a smooth one-parameter family of shapes. Two small movements are counted as one when they differ by the rate of change of a family of shapes that are all the same as the first. A small movement that is counted as none is *trivial*.

**Modulus** stays as M1 defines it (l.258). In these terms: a family of shapes, not all the same, along which the stationarity conditions hold.

## 3. Where each of the eight rows sits
| Row | Datum | Sits in | Standing |
|---|---|---|---|
| 5 | The metric on each piece | **g**, the way lengths are measured on the whole manifold | Unknown. Rows 1–4 and half of row 6 are named parts of g |
| 4 | Relative sizes of the pieces | part of g | Unknown |
| 3 | w₀ | part of g, and **the same datum as a relative size (row 4)** | CHECKED: if lengths are g_B + w²g_F with w = w₀e^{κs}, changing w₀ to c·w₀ is the same as scaling g_F by c². Not a separate row |
| 3 | κ | part of g | Unknown. Only κ times a length is a proportion (ll.255, 258) |
| 2 | Which piece is scaled, and by a function on which | part of g | Unknown; M1 owes it to M2 (l.127) |
| 1 | The flat shape of the fibre and how it is carried round time | part of g | Unknown. See §4: it is a function of time and cannot be constant |
| 6 | Length of the time circle | part of g (a relative size) | Unknown |
| 6 | The parametrisation of the flow | **V**, the vector field of the flow of A4 on time with the internal piece (l.232) | Separate from g. M1 fixes its return map only and states no relation between V and g (READ: none found) |
| 7 | The almost-quaternionic structure | **Q**, a rank-three subbundle (l.214) | Separate from g. M1 states no compatibility between Q and g (READ: none found) |
| 8 | The connections on the Spin^c line and on the twist | **∇** | Separate from g. M1 fixes the classes only |

So a shape is (g, V, Q, ∇). By P76 there is, for M2, also one field; what it is belongs to N3 and it is not among the parts of a shape here.

Assumption A2 of the SOW (the unknowns of the equation are among the eight rows) is therefore refined: the candidates are g, V, Q, ∇, and the field of P76. Whether V, Q and ∇ are unknowns of the equation, or are fixed by g, is **not settled by N1**: M1 gives no relation, and none is assumed.

## 4. The fibre carried round time (CHECKED)
M1 uses the flat metric on the fibre (ll.593, 598). Suppose, for this computation only, that lengths on the fibre at time t are flat and have no cross term with time. In the coordinates of the lattice the fibre's lengths at time t are then a positive-definite symmetric 2×2 matrix G(t). The fold z ↦ −z keeps every such G.

Once round the time circle, of length L, the fibre is glued to itself by A = M₀³ (l.837). The gluing is a map that keeps lengths exactly when

  G(t + L) = Bᵀ G(t) B,  with B = A or A⁻¹ according to the convention of the gluing.

1. **The shape of the fibre cannot be the same at all times.** If G(t) = a(t)G₀, then BᵀG₀B = cG₀ with c > 0. Determinants give c² = 1, so c = 1, so B keeps the lengths G₀ and its eigenvalues have modulus one. The eigenvalues of M₀³ are φ^{±6} (ll.300, 892). Contradiction.
2. **The datum is a function, not two numbers.** Any path G(t) on [0, L] with G(L) = BᵀG(0)B extends to all t. Row 1 is therefore a path of flat shapes with a condition on its ends, unless something further fixes the path.
3. **"The aspect ratio" (l.602) is not one number of the geometry** unless a time is named or a rule is given for the whole path. M1 gives neither.

What this does not show: that the fibre's lengths must be flat at every time, or that there is no cross term with time. Both are suppositions of this section and are open.

## 5. Choices declared in N1, each with its alternative
| # | Choice | Alternative | Ground | What would show it wrong |
|---|---|---|---|---|
| N1-a | Movements stay among shapes that satisfy A1–A5 | Lengths vary freely and M1's shape is asked to be stationary among all | M1 defines a modulus "of a geometry satisfying A1–A5" (l.258) | If the equation of N4 cannot be stated without movements that leave A1–A5 |
| N1-b | A relabelling must keep the division, the orientation and the direction of time | Every smooth invertible map counts | M1 counts drives up to orientation-keeping relabelling (l.264); the direction of the rule is part of the universe (Rulings §3, P66); a relabelling that mixed seen and unseen would change what is a shadow (l.154) | If M1's geometry has a symmetry that reverses orientation or time: M1 says its count of drives would then fail (l.442) |
| N1-c | Whether the lengths on S³, CP² and S² are the most symmetric ones is left open | Impose it | M1 makes them homogeneous spaces (l.220) and says nothing of lengths | — |

Which option the sixth axiom selects in N1-a and N1-b has not been argued. Until it is, neither carries a tag and neither is entered in the Minimality Register.

## 6. RECALLED (used nowhere above; not premises)
- A movement of the points by a vector field changes measured lengths unless it is a symmetry.
- The eight three-dimensional model geometries include Sol, in which lengths in the two eigen-directions of the fibre grow and decay exponentially along time.

## 7. An observation for N5, not a premise
The odd place P74(i) assumed that the warping function is a function on a closed piece. §4 shows a second way the text could be read: a function along the time line that is not the same after one circuit, the gluing taking up the difference. On that reading the argument of P74(i) does not apply. Against it: M1 says the exchange of growth and decay is the fold (l.193), and the fold keeps every G(t), so it does not exchange a growing direction of the fibre with a decaying one; and M1's display puts the warp between the base and the fibre (l.125). Not adopted. Recorded so that N5 tests it.

## 8. Step table
| Step | Mark |
|---|---|
| What is held (§1) | READ, lines given |
| Definitions of §2 | DECLARED |
| w₀ is a relative size (§3) | CHECKED |
| V, Q, ∇ are not tied to g by M1 (§3) | READ (absence; the independent check of N0 is asked the same) |
| The gluing condition and its three consequences (§4) | CHECKED, under two suppositions named there |
| Choices N1-a, N1-b, N1-c (§5) | DECLARED; the sixth axiom's selection not yet argued — GAP |
| Completeness of the list of N0 | Independent check returned; amendments confirmed (P77): Q includes the spinor bundle and the Clifford action; ∇ includes the Hermitian metrics on the two lines and the forms that carry the flux |
