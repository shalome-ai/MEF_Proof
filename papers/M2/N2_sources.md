# M2 — node N2: outside results, read at source

**Working note, 11 November 2026. Nothing here is banked; no row has been written to Verified References.** The PI banks.

Marks. **READ**: the architect read the statement in the source's own pages (text layer of the saved PDF; ligatures and script letters are garbled in extraction, the statements legible). **SUB-AGENT**: a sub-agent reported it from the source; the architect has not read the page. **SECONDARY**: seen only in a draft, a restatement or a snippet. **CHECKED**: hand computation given here. **GAP**: not read at source by anyone this session.

Copies were fetched from open archives by a sub-agent told to report what each source says and not to confirm an answer. They are in the session's scratch folder and are **not** in the repository.

## 1. What M2 would rest on, and where each statement stands

| # | Statement | Source and place | Mark |
|---|---|---|---|
| S1 | An almost complex structure gives a Spin^c structure whose line is K⁻¹, the dual of the canonical line | L. I. Nicolaescu, *Notes on Seiberg–Witten Theory*, Graduate Studies in Mathematics 28, AMS 2000, §1.3.3, pp. 44–45 | READ (author-hosted version; numbering to be checked against the print) |
| S2 | For that structure on an almost Kähler manifold the spinors are the forms of type (0, ∗): S ≅ Λ^{0,∗}T∗M | same, §1.4.3, p. 77 | READ |
| S3 | Its Dirac operator is √2(∂̄ + ∂̄∗) | same, Proposition 1.4.23, p. 77 | READ |
| S4 | Twisting by a Hermitian line L with connection B: the line becomes K⁻¹ ⊗ L², the spinors Ω^{0,∗}(L), the operator √2(∂̄_B + ∂̄_B∗) | same, Proposition 1.4.25, pp. 81–82 | READ. The source says "Its proof is left to the reader" |
| S5 | Dolbeault: H^q(M, O^p(E)) ≅ H^{p,q}_∂̄(M, E) | same, Theorem 3.1.7, p. 199 | READ |
| S6 | Hodge: the harmonic forms of type (p, q) with values in E are finite-dimensional and map isomorphically to H^{p,q}_∂̄(M, E) | same, Theorem 3.1.8, p. 200 | READ |
| S7 | On projective space of dimension r: H^i(O(n)) can be non-zero only for i = 0, n ≥ 0 and for i = r, n ≤ −(r + 1); H⁰ is the polynomials of degree n | A. Grothendieck, EGA III (première partie), Publ. Math. IHÉS 11 (1961), Proposition (2.1.12) and Corollaire (2.1.13), pp. 98–99 | READ (OCR of the scan) |
| S7′ | The same for H^q, 0 < q < r, and the dimension of H^r | J.-P. Serre, Faisceaux algébriques cohérents, Ann. of Math. 61 (1955), n° 65, Proposition 8, pp. 258–259 | SUB-AGENT (scan without text layer) |
| S8 | Künneth for coherent sheaves on a product, algebraic: H^n of the product is the sum over n₁ + n₂ = n of the tensor products | A. Grothendieck, EGA III (seconde partie), Publ. Math. IHÉS 17 (1963), Théorème (6.7.8), pp. 29–30 | READ (OCR; hypotheses on flatness, automatic over a field — that remark is the architect's) |
| S8′ | The same for coherent analytic sheaves on complex projective varieties | J. H. Sampson and G. Washnitzer, Illinois J. Math. 3 (1959) 389–402, Theorem 1 and the remark after it, p. 400 | SUB-AGENT |
| S8″ | The same for coherent analytic sheaves on compact complex spaces | L. Kaup, Math. Z. 97 (1967) 158–168, Theorem I, p. 166 | SUB-AGENT (scan without text layer) |
| S9 | The passage from algebraic to holomorphic bundles on projective varieties (GAGA) | J.-P. Serre, Ann. Inst. Fourier 6 (1956) | **GAP** |
| S10 | On a curve of genus one, a line of degree d ≥ 1 has d sections and no first cohomology | R. Vakil, draft of *The Rising Sea*, §19.9 | SECONDARY. The d sections are M1's own Lemma 7.5(a), proved there by hand; the vanishing of the first cohomology is a **GAP** |
| S11 | Harmonic spinors on a Kähler manifold as sheaf cohomology, in one statement | N. Hitchin, Harmonic spinors, Adv. Math. 14 (1974) 1–55 | **GAP**: not read. A restatement for the spin case was seen in D. Kotschick, arXiv:alg-geom/9502028 (SECONDARY) |
| S12 | The kernel of the Dirac operator on a Riemannian product | — | **GAP**: no source found |

Lawson–Michelsohn, Friedrich and Griffiths–Harris, which M1 cites, were not opened: no open copy.

## 2. What follows by combination (the architect's, not any source's)
1. **States at rest are holomorphic sections, and more.** S4 with S5 and S6 at p = 0: on a compact Kähler manifold, for the canonical structure twisted by a holomorphic Hermitian line L, the kernel of the Dirac operator is the sum over q of H^q(M, O(L)). No source read states this in one sentence. M1 uses it as motivation only (l.728).
2. **This agrees with M1 at two places (READ in M1).** M1 says a twist by a line of degree d adds 2d to the integer of the determinant line (l.712): S4 has K⁻¹ ⊗ L². M1 says the untwisted spinors of the fibre are "the functions and the (0,1)-forms" (l.728): S2.

## 3. The sphere's own winding is two (CHECKED; the gap of P85)
The canonical line K of the sphere is the line of its differentials. Take the differential dz in the coordinate z. It has no zero and no pole where z is finite. In the coordinate w = 1/z at the remaining point, dz = −dw/w²: a pole of order two. The degree of a line is the number of zeros less the number of poles of any meromorphic section of it; so K has degree −2 and K⁻¹ degree 2. With S1, the integer of the determinant line of the canonical structure on S² is 2.

Used and not read at source: that the degree of a line is zeros less poles of a meromorphic section. Second route, in M1's own terms: the integer is the Euler number of the tangent bundle, and M1 has χ(S²) = 2 (l.949), as it has ∫c₂ = 3 = χ for CP² (l.683).

## 4. The counts behind P85
| Piece | Line | Cohomology | From |
|---|---|---|---|
| CP² | trivial (canonical structure, no further line) | H⁰ of dimension one; H¹ = H² = 0 | S7 with r = 2, n = 0 |
| S² with integer 2 | trivial | H⁰ of dimension one; H¹ = 0 | S7 with r = 1, n = 0 |
| S² with integer 0 | a further line of degree −1 | H⁰ = 0 and H¹ = 0: no state | S7 with r = 1, n = −1 |
| S² with integer 4 | a further line of degree 1 | H⁰ of dimension two | S7 with r = 1, n = 1 |
| The fibre, flux three | degree three | H⁰ of dimension three (M1 Lemma 7.5(a)); H¹ = 0 | M1; S10 (**GAP** for H¹) |
| The product | — | the tensor product: 1 × 1 × 3 in degree nought, nothing else | S8 |

So with the integer two on S² the states at rest on the whole internal piece are M1's three, two of them kept by the fold, and with nought there is none. The hand count recorded in the step audit agrees with S7.

## 5. What this does not yet establish
- **The hypotheses.** S2–S6 are for an almost Kähler, and for the cohomology a Kähler, manifold. The counts of §4 hold for a product of Kähler lengths on CP², S² and the fibre. The lengths of M2's shape are an unknown (N1); for other lengths the number of states at rest is not given by §4. Requirement Q4 is therefore established only at shapes whose internal piece carries such lengths. To be named as a hypothesis wherever Q4 is used.
- **Algebraic to holomorphic** (S9), **the first cohomology on the fibre** (S10), **Hitchin** (S11): gaps.
- **The pillowcase.** The sources are for manifolds. The fibre is the torus folded; M1 handles the fold by the states that a lift of the fold keeps (ll.719, 763). Nothing read here says more.
- **The block of time and space, and the drive.** Nothing read here concerns them.

## 6. Proposed rows for Verified References (not written; the PI banks)
Nicolaescu 2000 (S1–S6), with the print's numbering checked first; EGA III 1961 (S7); EGA III 1963 (S8); Serre 1955 (S7′), Sampson–Washnitzer 1959 (S8′) and Kaup 1967 (S8″) once the architect has read the pages. Not proposed until read: Serre 1956 (GAGA), Hitchin 1974, a source for S10.

## 7. A practical note
The machine has no tool to render PDF pages (`pdftoppm` is not installed), so scanned sources without a text layer (Serre 1955, Kaup 1967) could not be read by the architect. A text extractor was installed into the session's scratch folder only.
