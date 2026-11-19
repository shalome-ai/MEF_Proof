# S05 — a blind second derivation of the step of M2-W074 (a working aid)

**What this is.** The report, word for word, of a fresh sub-agent that chat C4 asked, on 19 November 2026, to work out the pull-back of a twist with its lift of the fold by the step $M_{0}$ (the computation of write-up log M2-W074), at the PI's word that the weakest step of card S05 be strengthened (Decision Log P212, P213). The sub-agent was given a self-contained statement of the setting and the task, **not the result, not the route of M2-W074, and no file of the repository**; it was told to say where its argument has a gap. Its letters are its own: its $A$ is M1's $M_{0}$, its $\pi$ is the permutation of the corners by $M_{0}$, its $T$ is a lift of the fold.

**What it is not.** It is not a source, not a register and not part of the paper; no entry of the write-up log cites it. Statements in it marked RECALLED are recalled by the sub-agent and are not verified; nothing in it enters an entry until it is verified (CLAUDE.md §4). Its script was written in a temporary folder and is not kept here, so its numerical checks are reported and cannot be run again from the repository.

**What chat C4 checked of it** (Learnings L21): its result is the statement of M2-W074 (the same $D'$, whose integer at $P_{i}$ is that of $D$ at $M_{0}P_{i}$, and the same signs); the lemma of its Step 4 was checked by hand (the real determinant of $\zeta\mapsto\alpha\zeta+\beta\bar\zeta$ is $\lvert\alpha\rvert^{2}-\lvert\beta\rvert^{2}$). Its route is another one than that of M2-W050 and M2-W074: it uses of the map only that its entries are whole numbers and its determinant is $+1$. Whether that route should take the place of the hand argument is a matter for package N4 (the list of weak steps in `papers/M2/STEP_AUDIT.md`).

---

REPORT: pull-back of O(D) with its lift of ι under A = [[2,1],[1,1]]

Worked only from the task statement. No repository file was read or searched, no web. Checks were run in a fresh temporary directory (a script, standard library only, and its full output).
(Disclosure: the harness itself auto-saved one oversized stdout to a tool-results file; I did not read it.)

Marks used: PROVED (full argument below), CHECKED (numerically, script above), RECALLED (standard fact, not proved here).

====================================================================
(a) THE RESULT
====================================================================
Let π be the permutation of {1,2,3,4} defined by A·P_i = P_π(i) mod Z^2. For A = [[2,1],[1,1]] (exact computation):
  A·P1 = P1,  A·P2 = (1,1/2) ≡ P3,  A·P3 = (1/2,1/2) = P4,  A·P4 = (3/2,1) ≡ P2,
so π(1)=1, π(2)=3, π(3)=4, π(4)=2.

THEOREM (PROVED). Let D = a_1P1 + a_2P2 + a_3P3 + a_4P4, a_i ≥ 0, and put
  D' := Σ_i a_π(i) P_i   (the preimage divisor A^(-1)(D); for this A:  D' = a_1 P1 + a_3 P2 + a_4 P3 + a_2 P4).
Then there is a continuous isomorphism of complex line bundles Φ: O(D') → A*O(D), covering the identity of E, with Φ∘T' = T^A∘Φ, where T' is the first lift on O(D') and T^A is the pulled-back first lift on A*O(D). The same Φ intertwines the second lift of O(D') with the pulled-back second lift. So: yes, A*O(D) with its pulled-back first (second) lift is isomorphic in the required sense to O(D') with its first (second) lift.

Signs. The sign of the pulled-back lift at P_i is the sign of the original lift at A·P_i = P_π(i). With s_i the sign of the original lift at P_i and s'_i the sign of the pulled-back lift at P_i:
  s'_1 = s_1,  s'_2 = s_3,  s'_3 = s_4,  s'_4 = s_2.
(For the first lift s_i = (−1)^(a_i); for the second lift s_i = −(−1)^(a_i). Both PROVED in Step 1.)

Two cautions.
1. The direction matters: D' is A^(-1)(D) = Σ a_π(i) P_i, not the push-forward A(D) = Σ a_i P_π(i). For this A the two differ (π has order 3).
2. The isomorphism is NOT "f ↦ f∘A" and not the identity on the stated frames. Because A is not holomorphic, that naive map is discontinuous at every corner where a_π(i) > 0 (Remark R1). A correcting factor φ is needed; it exists because det A > 0.

D' is not unique as a divisor (Remark R2; its "if" half rests on RECALLED facts): O(D'') with first lift is isomorphic to A*O(D) with pulled-back first lift iff deg D'' = deg D and a''_i ≡ a_π(i) mod 2 for all i; O(D'') with SECOND lift is isomorphic to it iff deg D'' = deg D and a''_i ≢ a_π(i) mod 2 for all four i. Example: D = P1+P2 gives D' = P1+P4 (first lift), and also O(P2+P3) with the second lift.

====================================================================
(b) THE ARGUMENT, STEP BY STEP
====================================================================
Hypotheses throughout: a, b ∈ C linearly independent over R; z(v) = a v_1 + b v_2 for v ∈ R^2; A an integer 2×2 matrix with det A = 1; a_i ≥ 0 integers. |·| is the Euclidean norm on R^2, ‖A‖ the operator norm.

Step 0 (charts at the corners).
0.1 For 0 < R ≤ 1/2 put B_i(R) := {P_i + v mod Z^2 : |v| < R}. The vector v is unique: if P_i+v ≡ P_i+v' then v−v' ∈ Z^2 and |v−v'| < 2R ≤ 1, so v = v'. Hence z_i(P_i+v) := z(v) is a well-defined continuous function on B_i(1/2); this is "z − z(P_i)".
0.2 Two distinct corners differ by a class in (½Z^2)/Z^2 all of whose representatives have norm ≥ 1/2. So B_i(1/2) contains no corner other than P_i, and for R ≤ 1/4 the four B_i(R) are pairwise disjoint.
0.3 ι(P_i+v) = −P_i−v ≡ P_i−v because 2P_i ∈ Z^2. So ι(B_i(R)) = B_i(R) and z_i∘ι = −z_i.
0.4 U_0 := E minus the four corners.

Step 1 (O(D) and its lifts in frames). As the statement prescribes, L := O(D) has the continuous frame e_0 ("the function 1") over U_0 and the continuous frame e_i ("the function z_i^(−a_i)") over B_i(1/2), with e_i = z_i^(−a_i)·e_0 on B_i(1/2)∖{P_i}.
A bundle map T covering ι acts on a section s by (Ts)(p) = T(s(ιp)). "f ↦ f∘ι on sections" says f·e_0 ↦ (f∘ι)·e_0, i.e. T(e_0(q)) = e_0(ιq) for q ∈ U_0. Then on B_i(1/2)∖{P_i}, using 0.3,
  T(e_i(q)) = z_i(q)^(−a_i) e_0(ιq) = z_i(q)^(−a_i) z_i(ιq)^(a_i) e_i(ιq) = (−1)^(a_i) e_i(ιq),
and by continuity also at q = P_i. So the first lift has sign (−1)^(a_i) at P_i and the second lift has sign −(−1)^(a_i).

Step 2 (A on the corners; uses: integer entries, det = ±1). A and A^(-1) are integer matrices, so A induces a continuous group automorphism of E. It commutes with ι and maps the set {p : 2p = 0} = {P1,...,P4} bijectively to itself. So π is a permutation and A(U_0) = U_0 = A^(-1)(U_0). π for the given A is computed in (a).

Step 3 (the pull-back in frames). A*L := {(p,ℓ) ∈ E×L : ℓ ∈ L_(Ap)} with the subspace topology. If e is a continuous frame of L over an open W, then (A*e)(p) := (p, e(Ap)) is a continuous frame of A*L over A^(-1)(W).
 - f_0 := A*e_0 is a frame over A^(-1)(U_0) = U_0.
 - Fix r with 0 < r ≤ 1/4 and ‖A‖·r ≤ 1/2 (for the given A, ‖A‖ = (3+√5)/2 ≈ 2.618 and r = 1/8 will do). For p = P_i+v ∈ B_i(r): Ap ≡ P_π(i) + Av with |Av| < 1/2, so Ap ∈ B_π(i)(1/2) and z_π(i)(Ap) = z(Av). Hence f_i := A*e_π(i) is a continuous frame over B_i(r), and on B_i(r)∖{P_i}
     f_i = w_i^(−a_π(i)) · f_0,   where w_i(P_i+v) := z(Av).
 - Pulled-back lift: T^A(p,ℓ) := (ιp, Tℓ); it lands in the right fibre because L_(ιAp) = L_(Aιp). By Step 1: T^A(f_0(p)) = f_0(ιp) on U_0, and T^A(f_i(p)) = (−1)^(a_π(i)) f_i(ιp) on B_i(r). In particular, for either lift, the sign of the pulled-back lift at P_i equals the sign of the given lift at A·P_i = P_π(i) (the fibre of A*L over P_i is L over A·P_i with the same map).

Step 4 (Lemma; the only place det A > 0 is used). There are unique α, β ∈ C with
  z(Av) = α·z(v) + β·conj(z(v))  for all v ∈ R^2,   and   |α|^2 − |β|^2 = det A = 1.
Hence α ≠ 0 and κ := β/α satisfies |κ| < 1.
Proof. z: R^2 → C is an R-linear bijection. g := z∘A∘z^(-1): C → C is R-linear, so g(ζ) = αζ + β·conj(ζ) with α = (g(1) − i·g(i))/2, β = (g(1) + i·g(i))/2, uniquely. Writing α = α_1+iα_2, β = β_1+iβ_2, the matrix of g in the real basis (1,i) is [[α_1+β_1, −α_2+β_2],[α_2+β_2, α_1−β_1]], of determinant |α|^2 − |β|^2; and det g = det A. ∎
(Example, z = θ1 + iθ2: α = 3/2, β = 1/2 + i, 9/4 − 5/4 = 1.)

Step 5 (an even logarithm). For v ≠ 0 put λ(v) := Log(1 + κ·conj(z(v))/z(v)), Log the principal branch. The argument lies in {u : |u−1| ≤ |κ| < 1}, inside Re u > 0, where Log is continuous. So λ is continuous on R^2∖{0}; λ(−v) = λ(v); λ(tv) = λ(v) for real t ≠ 0; and by Step 4
  z(Av)/z(v) = α·exp(λ(v)).

Step 6 (the gluing function φ). Let ρ: [0,∞) → [0,1] be continuous, ρ = 1 on [0, r/3], ρ = 0 on [2r/3, ∞). Define μ_i on E∖{P_i} by μ_i(P_i+v) := ρ(|v|)·λ(v) for 0 < |v| < r and μ_i := 0 outside B_i(r). It is continuous (the open sets B_i(r)∖{P_i} and E∖closure(B_i(2r/3)) cover E∖{P_i}, and both definitions give 0 where they overlap) and μ_i∘ι = μ_i (0.3 and evenness of λ). Put a'_i := a_π(i) and
  φ := exp(−Σ_i a'_i μ_i) : U_0 → C∖{0}.
φ is continuous and φ∘ι = φ. On B_i(r/3)∖{P_i} one has φ = exp(−a'_i λ(v)), because the B_j(r) are pairwise disjoint (0.2).

Step 7 (the isomorphism Φ). L' := O(D') has frames e'_0 over U_0 and e'_i over B_i(1/2), e'_i = z_i^(−a'_i) e'_0 (Step 1 for D'). Define
  Φ(c·e'_0(p)) := c·φ(p)·f_0(p)  for p ∈ U_0, c ∈ C;     Φ(c·e'_i(P_i)) := c·α^(a'_i)·f_i(P_i).
On B_i(r)∖{P_i}, in the frames e'_i and f_i:
  Φ(e'_i) = z_i^(−a'_i) φ f_0 = φ·(w_i/z_i)^(a'_i)·f_i =: ψ_i·f_i,
and on B_i(r/3)∖{P_i}, by Steps 5 and 6, ψ_i = exp(−a'_i λ)·α^(a'_i)·exp(a'_i λ) = α^(a'_i), a non-zero constant. So over B_i(r/3) Φ is multiplication by the constant α^(a'_i) in the frames (e'_i, f_i), and over U_0 it is multiplication by the continuous nowhere-zero φ in the frames (e'_0, f_0). Hence Φ is continuous, complex-linear and bijective on each fibre, covers id_E, and its inverse is continuous for the same reason (factors 1/φ and α^(−a'_i)).

Step 8 (Φ intertwines the lifts). Let T' be the first lift on L'. For p ∈ U_0:
  Φ(T'(e'_0(p))) = Φ(e'_0(ιp)) = φ(ιp) f_0(ιp),    T^A(Φ(e'_0(p))) = φ(p)·T^A(f_0(p)) = φ(p) f_0(ιp),
equal since φ∘ι = φ. At P_i: Φ(T' e'_i(P_i)) = (−1)^(a'_i) α^(a'_i) f_i(P_i) and T^A(Φ e'_i(P_i)) = α^(a'_i)(−1)^(a_π(i)) f_i(P_i), equal since a'_i = a_π(i). So Φ∘T' = T^A∘Φ on all of L'. Multiplying by −1: Φ∘(−T') = (−T^A)∘Φ, and −T^A is the pull-back of the second lift −T. ∎

Remark R1 (why the naive identification fails; PROVED). With φ ≡ 1 the map e'_0 ↦ f_0 reads, in the frames near P_i, as multiplication by (w_i/z_i)^(a'_i) = α^(a'_i)·(1 + κ·conj(z_i)/z_i)^(a'_i), which depends on the direction of approach and has no limit at P_i when β ≠ 0 and a'_i > 0. For the given A, β ≠ 0 for every admissible (a,b): if β = 0 then z∘A∘z^(-1) is multiplication by α with |α| = 1, so A would have eigenvalues of modulus 1, but its eigenvalues are (3 ± √5)/2. The correction is possible because w_i/z_i is even and has winding number 0 about P_i, which is exactly |α| > |β|.

Remark R2 (non-uniqueness of D'; "only if" essentially PROVED, "if" rests on RECALLED facts). Claim: for D1 = Σ a_i P_i, D2 = Σ b_i P_i (a_i, b_i ≥ 0) and ε1, ε2 ∈ {+1 = first lift, −1 = second lift}, (O(D1), ε1) and (O(D2), ε2) are isomorphic in the required sense iff Σ a_i = Σ b_i and ε1(−1)^(a_i) = ε2(−1)^(b_i) for i = 1..4.
 Only if: an intertwining isomorphism is linear on the fibre over P_i, where both lifts are scalars, so the signs agree (PROVED). Equality of degrees: such an isomorphism is e_0 ↦ χ e_0 on U_0 with χ·z_i^(b_i − a_i) extending continuously and without zero to P_i, so χ has winding number a_i − b_i about P_i; the sum of the winding numbers of a continuous nowhere-zero function on U_0 about the four punctures is 0 (RECALLED standard fact).
 If: when ε1 = ε2, D1 − D2 = Σ 2c_i P_i with Σ c_i = 0, and g = Π_(j=2,3,4) (℘ − ℘(z(P_j)))^(c_j) is an even elliptic function with divisor D1 − D2, so f ↦ f·g is a holomorphic isomorphism O(D1) → O(D2) commuting with f ↦ ±f∘ι. When ε1 = −ε2, multiply further by the odd function ℘' (divisor P2+P3+P4 − 3P1). RECALLED facts used: existence of the Weierstrass ℘ of the lattice Za+Zb, even, periodic, with a double pole exactly at the lattice points; and "a non-constant elliptic function has as many zeros as poles in a period parallelogram, with multiplicity" (which gives: ℘ − ℘(ω) has exactly a double zero at each half-period ω; ℘' has simple zeros exactly at the three half-periods).

Remark R3 (det = −1; not asked, sketch only). Then |α| < |β|, w_i/z_i has winding number ∓2 about each corner, Step 5 fails, and A*O(D) has degree −deg D, so it is not any O(D') with D' ≥ 0 unless D = 0.

====================================================================
(c) FACTS ABOUT A THAT THE ARGUMENT USES
====================================================================
F1. Integer entries (Step 2): A is a map of E commuting with ι.
F2. det A = ±1 (Step 2): A is a bijection of E, so it permutes the four corners and A^(-1)(U_0) = U_0.
F3. det A > 0 (Step 4): gives |α| > |β|, hence the even continuous logarithm of w_i/z_i. This is the only step that separates SL_2(Z) from GL_2(Z).
F4. The reduction of A mod 2, i.e. the permutation π. It enters only the answer (which D', which sign goes where), not the proof.
F5. ‖A‖ < ∞, only to choose r (true of every matrix).
NOT used: the trace, hyperbolicity, symmetry, eigenvalues, any entry beyond its parity, and non-holomorphy (the proof also covers β = 0).

A^3 = [[13,8],[8,5]]: integer, det 1, and ≡ identity mod 2, so π = id. The argument goes through verbatim (with r ≤ 1/(2‖A^3‖) ≈ 0.0278): (A^3)*O(D) with pulled-back first/second lift ≅ O(D) with first/second lift, D' = D, all four signs unchanged.
Arbitrary M ∈ SL_2(Z): the argument goes through verbatim. D' = Σ a_π(i) P_i with π the action of M mod 2 on the corners; P1 is always fixed, and the six classes of SL_2(Z/2) give the six permutations of P2, P3, P4; D' = D exactly when M ≡ identity mod 2 (or D is π-invariant).
det = −1: fails at F3.

====================================================================
(d) GAPS, CITED THEOREMS, WHAT IS ONLY NUMERICAL
====================================================================
- Main theorem (Steps 0–8): no theorem is cited and no step rests on a numerical check. I know of no gap. Used without proof, all elementary: every R-linear map C → C is ζ ↦ αζ + β·conj(ζ); the principal Log is continuous on Re > 0; a function continuous on each set of an open cover is continuous; a pulled-back frame is a continuous frame of the pull-back bundle.
- Identifications I made that no computation certifies, so the reader should check them against the intended meaning: (i) the continuous structure of O(D) is the one given by the stated frames, taken over U_0 and over B_i(1/2); (ii) the formula T(e_0(q)) = e_0(ιq) read off from "f ↦ f∘ι"; (iii) the fibre of A*O(D) over P_i is the fibre of O(D) over A·P_i (as the statement says), which fixes the direction of π; (iv) "sign at P_i" is the scalar by which the lift acts on that fibre.
- Remark R2: the "if" half uses the RECALLED Weierstrass facts listed there; they are only CHECKED numerically (Check G, three lattices, truncated series). The degree part of "only if" uses a RECALLED standard fact. R2 is not needed for the theorem.
- Remark R3 is a sketch.
- Not used, RECALLED only: the classification of equivariant complex line bundles by Borel cohomology H^2_G(X;Z) (Hattori–Yoshida; Lashof–May–Segal) would give an independent route via the invariants (degree, four signs). I did not verify its hypotheses and did not rely on it.

====================================================================
(e) NUMERICAL CHECKS AND THEIR OUTPUTS
====================================================================
Complex coordinates tried: (a,b) = (1, i); (1, 0.3+1.7i); (1, −i) [z reverses the θ-orientation]; (2−i, 0.5+0.2i); (−0.7+0.4i, 1.1−2.3i). Matrices: A, A^3, [[1,3],[0,1]], [[1,−2],[0,1]] (det 1), and controls [[2,1],[1,0]], [[0,1],[1,0]] (det −1).

Check A (exact rational arithmetic) – the corner permutation, Step 2 and F4.
  A: P1→P1, P2→P3, P3→P4, P4→P2.  A^2 and A^(-1): P1→P1, P2→P4, P3→P2, P4→P3.  A^3 = [[13,8],[8,5]]: identity on the corners.
  400 random words in S, T, T^(-1): the permutation depends only on M mod 2; all 6 classes seen; P1 fixed in all.

Check B – the Lemma of Step 4.
  |α|^2 − |β|^2 = +1.000000000000 for all four det-1 matrices and all five (a,b); = −1.000000000000 for both det −1 controls. Max residual of z(Av) = αz(v) + β·conj(z(v)) over 200 random v per case: ≤ 1.5e-14. (A with a=1, b=i: |α| = 1.500000, |β| = 1.118034. A^3: |β/α| between 0.9938 and 0.9982.)

Check C – winding numbers (z_i ; w_i ; w_i/z_i) on a small circle about each corner, anticlockwise in θ; tests the orientation point behind Step 5.
  det-1 matrices: (+1.000, +1.000, 0.000) at all four corners when z preserves the θ-orientation, (−1.000, −1.000, 0.000) when z reverses it.
  det −1 controls: (+1.000, −1.000, −2.000), resp. (−1.000, +1.000, +2.000). So the check can fail, and does where the argument says it must.

Check D – the constructed φ and the local expression ψ_i = φ·(w_i/z_i)^(a'_i) of Φ (Steps 6–8); 30 cases (4 matrices × 3 coordinates × divisors among [0,1,0,0], [1,2,3,4], [3,0,2,5], [2,1,1,0]).
  D1 evenness, max relative |φ(−p) − φ(p)| over 9000 points per case: worst 5.8e-11.
  D2 well-definedness on E, max relative |φ(p+n) − φ(p)|, n ∈ Z^2: worst 1.8e-09.
  D3 limit at the corners, max relative |ψ_i − α^(a'_i)| on radii (r/3)·10^(−k), k = 0..12, 96 directions, four corners: worst 2.2e-13.
  D4 WITHOUT φ: spread over directions of (w_i/z_i)^(a'_i)/α^(a'_i) at radius (r/3)·1e-12: between 0.971 and 35.087, never 0 (e.g. 1.587 = 2|β/α| for A, b = 0.3+1.7i, D = P2). This is Remark R1: the naive map has no limit at the corner.
  D5 non-vanishing: min |ψ_i|/|α^(a'_i)| equals the proved lower bound (1 − |β/α|)^(a'_i) to the printed digits in all 30 cases (smallest value 9.741e-12, for A^3 with a' = 4, |β/α| = 0.99823).
  D5c continuity on the punctured disc: max relative jump between neighbouring samples at three successive refinements halves each time in all 30 cases (e.g. 0.2786, 0.1371, 0.0681 for A, D = [1,2,3,4]; 0.1909, 0.1000, 0.0512 for A^3). A first version of this test on a fixed 240×480 grid was under-resolved for A^3 and did not show the halving; the angular step now scales with 1 − |β/α|.
  D6 winding of φ about each corner at radius r/6 and 0.9r: 0 in all cases (largest deviation 4.0e-15).
  D' printed by the script: A, D = [1,2,3,4] → [1,3,4,2]; A, D = [0,1,0,0] → [0,0,0,1]; A^3 → D' = D.

Check E (exact) – signs and the direction of π.
  For A and for A^3, all 256 divisors with 0 ≤ a_i ≤ 3: pulled-back first-lift signs = first-lift signs of O(D') and deg D' = deg D: True; same for second lifts: True.
  The other candidate Σ a_i P_π(i) (push-forward) has the wrong signs for 192 of 256 divisors under A (0 of 256 under A^3, where π = id).
  Example D = P2 under A: signs of first lift (+,−,+,+); pulled-back signs at P1..P4 (+,+,+,−); D' = P4.

Check F – an even nowhere-zero function on a punctured disc has even winding number (used in R2). Test functions z^m·exp(even perturbation), m = −3..3: windings −3,−2,−1,0,+1,+2,+3; the function is even exactly for m even.

Check G – the RECALLED Weierstrass facts of R2 only; truncated lattice sum |m|,|n| ≤ 10, three lattices; winding numbers about P1..P4 in the z-orientation.
  ℘ − ℘(z(P_j)): −2 at P1, +2 at P_j, 0 at the other two (j = 2,3,4, all three lattices).  ℘': −3, +1, +1, +1.
  The truncated series is not exactly periodic (relative evenness defect about P_j between 2.8e-05 and 1.6e-02), so this is a plausibility check, not a proof.
