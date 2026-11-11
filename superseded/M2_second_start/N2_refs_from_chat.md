# Reference verification

Date: 11 November 2026.

Tools: web search, web page fetching, and a Linux container (curl, pdftotext, pdftoppm). Where a PDF was a scan, or its text layer was damaged, I rendered the page and read the image; each entry says which. Could not open: Project Euclid (Sampson–Washnitzer), because bot protection blocked every request; item B was read from a copy you supplied in chat. Also could not open the Elsevier/ScienceDirect page for Hitchin, for the same reason. Not opened because I found no open legitimate copy: Hartshorne, Griffiths–Harris, Mumford, Lawson–Michelsohn, Friedrich, Morgan, Berline–Getzler–Vergne, and the body of the printed AMS edition of Nicolaescu.

Note on quotation: each "Statement" field gives the full mathematical content of the statement, with its hypotheses, plus at most one short verbatim anchor phrase in quotation marks. The complete verbatim wording is not reproduced here. It should be transcribed directly from the source at the place given; every source marked SEEN-IN-SOURCE is freely readable at the URL listed.

## Summary table

| Item | Source (short) | Place | Mark | URL |
|---|---|---|---|---|
| A | Serre, FAC (1955) | n° 65, Prop. 8, pp. 258–259; also n° 54 p. 247, n° 62 pp. 255–256, n° 66 p. 259 | SEEN-IN-SOURCE | https://www.college-de-france.fr/media/jean-pierre-serre/UPL5435398796951750634_Serre_FAC.pdf |
| B | Sampson–Washnitzer (1959) | §6, Theorem 1 and Remark, p. 400 | SEEN-IN-SOURCE | copy supplied by you in chat (Project Euclid blocked) |
| C | Kaup (1967) | Theorem I, p. 166; intro p. 158 | SEEN-IN-SOURCE | https://gdz.sub.uni-goettingen.de/download/pdf/PPN266833020_0097/LOG_0025.pdf |
| D | Serre, GAGA (1956) | n° 12, Théorèmes 1–3, pp. 19–20 | SEEN-IN-SOURCE | https://www.numdam.org/item/10.5802/aif.59.pdf |
| E | Line bundles on a genus-one curve | — | NOT FOUND | — |
| F1a | Hitchin (1974) | Theorem 2.1, p. 13 | SEEN-IN-SOURCE | https://users.math.msu.edu/users/parker/GT/Harmonic%20Spinors.pdf |
| F1b | Hitchin (1974) | Theorem 2.2, p. 14 | SEEN-IN-SOURCE | same |
| F2a | Hitchin (1974) | proof of Thm 2.2, part (4), pp. 15–16 | SEEN-IN-SOURCE | same |
| F2b | Nicolaescu, hosted version | Prop. 1.4.25 | SECONDARY | https://www3.nd.edu/~lnicolae/swnotes.pdf |
| F3 | Nicolaescu, hosted version | §1.3.3 end; Prop. 1.4.25 | SECONDARY | https://www3.nd.edu/~lnicolae/swnotes.pdf |
| G | Hitchin (1974) | §1.4, Remark (4), p. 12 | SEEN-IN-SOURCE | https://users.math.msu.edu/users/parker/GT/Harmonic%20Spinors.pdf |
| H | Nicolaescu, AMS GSM 28 (print) | numbering not seen in print | NOT FOUND | https://www.ams.org/books/gsm/028/gsm028-endmatter.pdf |
| I1 | Degree via divisors | — | NOT FOUND | — |
| I2 | Degree of canonical bundle | — | NOT FOUND | — |

## A. Cohomology of line bundles on projective space (Serre, FAC)

- **Full citation:** J.-P. Serre, "Faisceaux algébriques cohérents", Annals of Mathematics (2) 61, no. 2 (March 1955), 197–278.
- **Identifier / DOI:** JSTOR stable URL printed on the scan: http://links.jstor.org/sici?sici=0003-486X%28195503%292%3A61%3A2%3C197%3AFAC%3E2.0.CO%3B2-C. I did not verify a DOI.
- **URL read:** https://www.college-de-france.fr/media/jean-pierre-serre/UPL5435398796951750634_Serre_FAC.pdf (JSTOR scan hosted on Serre's Collège de France page).
- **Edition / version read:** the original journal printing. PDF page 1 is the JSTOR cover; printed page = PDF page + 195.
- **Place:**
  - Main statement: n° 65, Proposition 8, printed pp. 258–259 (PDF pp. 63–64).
  - Supporting statements: n° 54 (definition of $\mathcal O(n)$, from p. 246; remark on global sections, p. 247 = PDF p. 52); n° 62, Proposition 2 and Corollaires 1–3 (pp. 255–256 = PDF pp. 60–61); n° 66, Théorème 1 (p. 259 = PDF p. 64).
- **Mark:** SEEN-IN-SOURCE (page images viewed).
- **Statement:**
  - n° 65, Proposition 8: for $X=\mathbf P_r(K)$, $H^q(X,\mathcal O(n))=0$ for $0<q<r$, and $H^r(X,\mathcal O(n))$ is a $K$-vector space of dimension $\binom{-n-1}{r}$. A basis is given by the cohomology classes of the alternating cocycles of $\mathfrak U$, $f_{01\cdots r}=1/t_0^{\beta_0}\cdots t_r^{\beta_r}$ with $\beta_i>0$ and $\sum_{i=0}^{r}\beta_i=-n$.
  - Remark following the proof (p. 259): $H^r(X,\mathcal O(-r-1))$ is one-dimensional, with basis the class of $f_{01\cdots r}=1/t_0\cdots t_r$.
  - n° 54, remark after Proposition 1 (p. 247): a section of $\mathcal O'(n)\cong\mathcal O(n)$ over $X$ is a regular function on $Y$, homogeneous of degree $n$. For $r\ge1$ it is identically zero when $n<0$, and is a homogeneous polynomial of degree $n$ when $n\ge0$. Anchor phrase: « c'est un polynôme homogène de degré n pour n ≧ 0 ».
  - n° 62, Corollaire 3 to Proposition 2 (pp. 255–256): $\alpha:S_n\to H^0(S(n))$ is bijective if $r\ge1$ or $n\ge0$; $H^q(S(n))=0$ for $0<q<r$; $H^r(S(n))$ has dimension $\binom{-n-1}{r}$. The proof states the convention that $\binom{a}{r}=0$ when $a<r$.
  - n° 66, Théorème 1 (p. 259): for a closed subvariety $V$ of $\mathbf P_r(K)$ and a coherent algebraic sheaf $\mathcal F$ on $V$, the groups $H^q(V,\mathcal F)$ are finite-dimensional and zero for $q>\dim V$.
- **Translation (mine):** of the anchor phrase: "it is a homogeneous polynomial of degree n for n ≥ 0".
- **Hypotheses and notation:**
  - From the start of Chapter II (p. 222): $K$ is a commutative field, algebraically closed, of arbitrary characteristic.
  - n° 51 (p. 243): $X=\mathbf P_r(K)$ is the quotient of $Y=K^{r+1}-\{0\}$ by $K^*$; $t_i$ are the coordinate functions; $U_i$ is the open set where $t_i\ne0$; $\mathfrak U=\{U_i\}$.
  - n° 54 (pp. 246–247): $\mathcal F(n)$ is obtained by gluing with the multiplications by $t_j^n/t_i^n$, and $\mathcal O(n)$ is the case $\mathcal F=\mathcal O$. $S=K[t_0,\dots,t_r]$, and $S(n)$ is $S$ with grading shifted by $n$.
- **Notes:**
  - Your location (n° 65, Proposition 8) is correct.
  - Prop. 8 states only the cases $0<q<r$ and $q=r$. It says nothing about $H^0$ and nothing about $q>r$. Those come from n° 54 / n° 62 Cor. 3 and from n° 66 Théorème 1 respectively.
  - Prop. 8 is stated over an algebraically closed field $K$, not over $\mathbf C$ specifically.

## B. Künneth formula for coherent algebraic sheaves (Sampson–Washnitzer)

- **Full citation:** J. H. Sampson and G. Washnitzer, "A Künneth formula for coherent algebraic sheaves", Illinois J. Math. 3(3) (September 1959), 389–402.
- **Identifier / DOI:** 10.1215/ijm/1255455260 (Project Euclid, open access).
- **URL read:** none. Project Euclid blocked every automated request. I read a PDF you supplied in chat (file name `a-kunneth-formula-for-coherent-algebraic-sheaves-1jyfukh7g0.pdf`). I don't know where that copy was downloaded from.
- **Edition / version read:** scan of the journal printing, pp. 389–402, with running heads and the "Received April 5, 1958" line. It has 14 PDF pages; printed page = PDF page + 388. Read from the page images.
- **Place:**
  - Theorem 1 and the Remark following it: §6, printed p. 400 (PDF p. 12).
  - Set-up of §6: p. 399 (PDF p. 11).
  - Local form, Proposition 8: §3, p. 392 (PDF p. 4).
  - Reciprocal images defined: §3, p. 391 (PDF p. 3).
- **Mark:** SEEN-IN-SOURCE (page images of the copy you supplied).
- **Statement:**
  - Theorem 1 (p. 400): let $\mathcal F$ be a coherent sheaf on a variety $X$ and $\mathcal G$ a coherent sheaf on a variety $Y$. The projections from $X\times Y$ to $X$ and to $Y$ induce a canonical isomorphism (10): $H(X,\mathcal F)\otimes_K H(Y,\mathcal G)\cong H(X\times Y,\mathcal F^*\otimes_{\mathcal O^*}\mathcal G^*)$. Here $\mathcal F^*,\mathcal G^*$ are the reciprocal images of $\mathcal F,\mathcal G$ on $X\times Y$, and $\mathcal O^*$ is the sheaf of local rings on $X\times Y$.
  - The theorem goes on to state (11): $H(X,\mathcal O_X)\otimes_K H(Y,\mathcal O_Y)\cong H(X\times Y,\mathcal O^*)$.
  - It also states (12): if one of the varieties, say $X$, is affine, then (10) reduces to $\Gamma(X,\mathcal F)\otimes_K H^n(Y,\mathcal G)\cong H^n(X\times Y,\mathcal F^*\otimes_{\mathcal O^*}\mathcal G^*)$ for $n\ge0$.
  - Remark following Theorem 1 (p. 400): in virtue of Serre's GAGA ([5], n° 12, Théorèmes 1, 2 and 3), the isomorphism (10) remains valid when $X$ and $Y$ are projective varieties over $\mathbf C$ and $\mathcal F,\mathcal G$ are coherent analytic sheaves. In that case $\mathcal O^*$ is to be read as the sheaf of germs of holomorphic functions on $X\times Y$. The Remark says a similar statement holds for (11), but that (12) is not valid for analytic sheaves. Anchor phrase: "remains valid if X and Y are projective varieties over the field of complex numbers".
- **Hypotheses and notation:**
  - §2 (p. 390) and §6 (p. 399): $K$ is an algebraically closed ground field. $X$ and $Y$ are algebraic varieties in the sense of Serre's FAC.
  - §3 (p. 391): for $\mathcal F$ on $U$, the reciprocal image is $\mathcal F^*=\mathcal O_{U\times V}\otimes_{\mathcal O_U}\mathcal F$, and similarly for $\mathcal G$. Both $\mathcal O_U^*$ and $\mathcal O_V^*$ are identified with $\mathcal O_{U\times V}=\mathcal O^*$.
  - $H(\cdot,\cdot)$ without an index denotes the full graded cohomology. The proof on p. 399 obtains (10) from the Künneth theorem of Cartan–Eilenberg (Ch. VI, Thm 3.1) applied to Čech complexes of finite affine coverings. Theorem 1 does not write out the degree-wise form.
  - Proposition 8 (p. 392), the local form for affine $U$ and $V$: $\Gamma(U,\mathcal F)\otimes_K\Gamma(V,\mathcal G)\to\Gamma(U\times V,\mathcal F^*\otimes_{\mathcal O^*}\mathcal G^*)$ is an isomorphism.
- **Notes:**
  - Theorem 1 itself carries no completeness, projectivity or compactness hypothesis. It holds for arbitrary varieties over an algebraically closed field.
  - The extension to the analytic case is only a remark, deduced from GAGA. It requires $X$ and $Y$ to be projective over $\mathbf C$, and no proof is given beyond the citation.
  - The Remark explicitly excludes (12) in the analytic case.
  - Theorem 1 is graded only implicitly, as explained under "Hypotheses and notation".
  - My earlier report of the phrase "not valid for analytic sheaves" is now confirmed in context: it refers to (12) only.

## C. Künneth formula for Fréchet sheaves (Kaup)

- **Full citation:** L. Kaup, "Eine Künnethformel für Fréchetgarben", Math. Z. 97 (1967), 158–168.
- **Identifier / DOI:** 10.1007/BF01111357. Also EuDML urn:eudml:doc:170711; GDZ PPN266833020_0097, LOG_0025.
- **URL read:** https://gdz.sub.uni-goettingen.de/download/pdf/PPN266833020_0097/LOG_0025.pdf (linked from https://eudml.org/doc/170711).
- **Edition / version read:** GDZ scan of the journal printing, with no text layer; I transcribed from the page images. PDF page 1 is the GDZ cover; printed page = PDF page + 156.
- **Place:**
  - Theorem I, §4, printed p. 166 (PDF p. 10).
  - Definition 4.1, p. 166.
  - Korollar 1, p. 166; Korollare 2–4, p. 167 (PDF p. 11).
  - Introduction (§0), formulas (0.1)–(0.3), p. 158 (PDF p. 2).
  - Remark deferring the coherent case, p. 159 (PDF p. 3).
- **Mark:** SEEN-IN-SOURCE (page images viewed).
- **Statement:**
  - Theorem I (Künnethformel), p. 166. Let $X$ and $Y$ be topological spaces with countable topology. Let $\mathcal F$ on $X$ and $\mathcal G$ on $Y$ be Fréchet-$n$-sheaves for all $n\ge0$, with $\mathcal F$ or $\mathcal G$ nuclear. Then there is an isomorphism of topological vector spaces $H(X,\mathcal F)\,\varepsilon\,H(Y,\mathcal G)\cong H(X\times Y,\mathcal F\,\varepsilon\,\mathcal G)$ (4.4). It respects the grading: $\prod_{p+q=n}H^p(X,\mathcal F)\,\varepsilon\,H^q(Y,\mathcal G)\cong H^n(X\times Y,\mathcal F\,\varepsilon\,\mathcal G)$ (4.5).
  - Introduction, p. 158. When $X$ and $Y$ are complex spaces (in Grauert's sense) and $\mathcal F,\mathcal G$ are coherent analytic sheaves, (0.2) gives $\mathcal F\,\varepsilon\,\mathcal G=\mathcal F^*\otimes_{\mathcal O^*}\mathcal G^*$, where $\mathcal F^*$ (resp. $\mathcal G^*$) is the analytic inverse-image sheaf under the projection of $X\times Y$ to $X$ (resp. $Y$). The same paragraph states that every coherent analytic sheaf is nuclear, and that to apply Theorem I one need only verify the cohomology spaces are Hausdorff. Anchor phrase: „Diese hinreichende Bedingung ist etwa dann erfüllt, wenn X und Y kompakt sind."
- **Translation (mine):** of the anchor phrase: "This sufficient condition is satisfied, for example, when X and Y are compact."
- **Hypotheses and notation:**
  - Definition 4.1 (p. 166): a Fréchet sheaf $\mathcal F$ on $X$ (on which arbitrarily fine Leray coverings exist) is a Fréchet-$n$-sheaf if some Leray covering $\mathfrak M$ of $X$ has $H^p(\mathfrak M,\mathcal F)$ Hausdorff for all $0\le p\le n$.
  - Nuclear: Definition 2.2 (cited on p. 158; I did not transcribe it).
  - $\varepsilon$ is Schwartz's completed ε-tensor product (§1–2, from p. 159).
  - "Mit abzählbarer Topologie" means having a countable basis of the topology.
  - The original prints "toplogische" (sic) in Theorem I.
- **Notes:**
  - The paper contains no theorem stated specifically for coherent analytic sheaves on complex spaces. Theorem I is stated for Fréchet sheaves on topological spaces.
  - Coherent analytic sheaves appear only in the introduction, where (0.2), nuclearity and the compactness sufficient condition are asserted, not proved.
  - On p. 159 Kaup says that because these applications to coherent analytic sheaves use methods other than those of Theorem I, they are to be treated elsewhere („an anderer Stelle").
  - No compactness hypothesis appears in Theorem I itself. Compactness enters only as the sufficient condition for Hausdorffness quoted above.

## D. GAGA comparison theorems (Serre)

- **Full citation:** J.-P. Serre, "Géométrie algébrique et géométrie analytique", Annales de l'Institut Fourier 6 (1956), 1–42.
- **Identifier / DOI:** 10.5802/aif.59; Numdam AIF_1956__6__1_0.
- **URL read:** https://www.numdam.org/item/10.5802/aif.59.pdf
- **Edition / version read:** Numdam scan of the journal printing. PDF page 1 is the Numdam cover; printed page = PDF page − 1.
- **Place:**
  - n° 12, "Variétés projectives. Énoncé des théorèmes": Théorèmes 1 and 2 on p. 19 (PDF p. 20), Théorème 3 and Remarques 1–2 on p. 20 (PDF p. 21).
  - Definition of $\mathcal F^h$: n° 9, Définition 2, p. 16 (PDF p. 17).
  - Definition of $\varepsilon$: n° 11, pp. 18–19.
- **Mark:** SEEN-IN-SOURCE (page images viewed for pp. 19–20; p. 16 read from the text layer only).
- **Statement:**
  - Standing hypothesis of n° 12: $X$ is a projective variety, that is, a Z-closed subvariety of a projective space $\mathbf P_r(\mathbf C)$.
  - Théorème 1: for every coherent algebraic sheaf $\mathcal F$ on $X$ and every integer $q\ge0$, the homomorphism $\varepsilon:H^q(X,\mathcal F)\to H^q(X^h,\mathcal F^h)$ defined in n° 11 is bijective. For $q=0$ this gives an isomorphism $\Gamma(X,\mathcal F)\cong\Gamma(X^h,\mathcal F^h)$.
  - Théorème 2: if $\mathcal F$ and $\mathcal G$ are coherent algebraic sheaves on $X$, every analytic homomorphism $\mathcal F^h\to\mathcal G^h$ comes from one and only one algebraic homomorphism $\mathcal F\to\mathcal G$.
  - Théorème 3: for every coherent analytic sheaf $\mathcal M$ on $X^h$ there is a coherent algebraic sheaf $\mathcal F$ on $X$ with $\mathcal F^h\cong\mathcal M$, and this property determines $\mathcal F$ uniquely up to isomorphism.
  - Anchor phrase (n° 12): « une sous-variété Z-fermée d'un espace projectif ».
- **Translation (mine):** of the anchor phrase: "a Z-closed subvariety of a projective space".
- **Hypotheses and notation:**
  - $X^h$ is the analytic space associated with $X$ (n° 5).
  - n° 9, Définition 2 (p. 16; text layer only): $\mathcal F^h=\mathcal F'\otimes_{\mathcal O'}\mathcal H$, where $\mathcal F'$ is $\mathcal F$ regarded as a sheaf on $X^h$ and $\mathcal H$ is the sheaf of germs of holomorphic functions on $X^h$.
  - Z = Zariski topology.
- **Notes:**
  - Remarque 1 (p. 20): the theorems depend on $X$ being projective and are false even for an affine variety.
  - Remarque 2 (p. 20): the analogous map with $\mathcal F'$ in place of $\mathcal F^h$ is not bijective in general.
  - The theorems are stated over $\mathbf C$ only.

## E. Cohomology of a line bundle of degree d on a genus-one curve

- **Full citation:** none obtained.
- **Identifier / DOI:** —
- **URL read:** —
- **Edition / version read:** —
- **Place:** —
- **Mark:** NOT FOUND
- **Statement:** —
- **Hypotheses and notation:** —
- **Notes:** I found no open, legitimate copy of Hartshorne, Griffiths–Harris or Mumford, and did not use copies on other hosts. None of the sources I did open (A, C, D, F1) states these dimensions for degree $d$ on a curve of genus one.

## F1a. Harmonic spinors for the canonical Spin^c structure (Hitchin, Theorem 2.1)

- **Full citation:** N. Hitchin, "Harmonic spinors", Advances in Mathematics 14 (1974), 1–55.
- **Identifier / DOI:** 10.1016/0001-8708(74)90021-8.
- **URL read:** https://users.math.msu.edu/users/parker/GT/Harmonic%20Spinors.pdf
- **Edition / version read:** scan of the published Academic Press printing (the 1974 copyright line is on p. 1). The publisher's page would not open, so I used this copy on a university faculty course page; it is not one of your preferred hosts. PDF page = printed page.
- **Place:** §2.1, Theorem 2.1, p. 13.
- **Mark:** SEEN-IN-SOURCE (page image viewed).
- **Statement:** let $X$ be a Kähler manifold. With respect to the canonical Spin$^c$ structure, $H^+\cong H^{\text{even}}(X,\mathcal O)$ and $H^-\cong H^{\text{odd}}(X,\mathcal O)$, where $\mathcal O$ is the sheaf of germs of local holomorphic functions on $X$. Anchor phrase: "with respect to the canonical Spin$^c$ structure".
- **Hypotheses and notation:**
  - The canonical Spin$^c$ structure is defined on p. 12 by the lifting $U(n)\to\mathrm{Spin}^c(2n)$ over $U(n)\to SO(2n)$ (citing [10], Atiyah–Bott–Shapiro).
  - $H^\pm$ are the spaces of positive and negative harmonic spinors (§1.1, p. 5).
  - Standing hypothesis of §1.1 (p. 4): $X$ is compact, oriented and Riemannian.
  - In the proof, the Dirac operator is identified with $\sqrt2(\bar\partial+\bar\partial^*)$ on $\Lambda^*T^{0,1}$, using the Riemannian (Levi-Civita) connection and the Kähler condition.
- **Notes:** the theorem says "a Kähler manifold"; compactness comes only from the standing hypothesis of §1.1. No twisting line bundle appears in Theorem 2.1.

## F1b. Harmonic spinors on a compact Kähler spin manifold (Hitchin, Theorem 2.2)

- **Full citation:** as F1a.
- **Identifier / DOI:** 10.1016/0001-8708(74)90021-8.
- **URL read:** as F1a.
- **Edition / version read:** as F1a.
- **Place:** §2.1, Theorem 2.2, p. 14; proof pp. 14–16.
- **Mark:** SEEN-IN-SOURCE (page image viewed).
- **Statement:** let $X$ be a compact Kähler manifold. Then:
  1. $X$ is spin if and only if the canonical bundle $K$ has a square root, i.e. a complex line bundle $L$ with $L\otimes L\cong K$;
  2. there is a one-to-one correspondence between spin structures on $X$ and holomorphic square roots of $K$;
  3. under this correspondence, $H^+\cong H^{\text{even}}(X,\mathcal O(L))$ and $H^-\cong H^{\text{odd}}(X,\mathcal O(L))$.

  Anchor phrase: "holomorphic square roots of K".
- **Hypotheses and notation:** $H^\pm$ and $\mathcal O$ as in F1a. $\mathcal O(L)$ is the sheaf of germs of holomorphic sections of $L$. Part (3) of the proof shows the spinor bundle is isomorphic to $\Lambda^*T^{0,1}\otimes L$ and the Dirac operator is $\sqrt2(\bar\partial+\bar\partial^*)$ for the Dolbeault complex of $L$.
- **Notes:**
  - Earlier I flagged the even/odd assignment as unconfirmed because the text layer was damaged. It is now confirmed from the page image of p. 14.
  - The isomorphism is with sheaf cohomology of $\mathcal O(L)$ for $L$ a square root of $K$.

## F2a. Twisted version in Hitchin (proof of Theorem 2.2, part (4))

- **Full citation:** as F1a.
- **Identifier / DOI:** 10.1016/0001-8708(74)90021-8.
- **URL read:** as F1a.
- **Edition / version read:** as F1a.
- **Place:** part (4) of the proof of Theorem 2.2, pp. 15–16.
- **Mark:** SEEN-IN-SOURCE (read from the text layer only; I did not check the page images of pp. 15–16).
- **Statement:**
  - Spinors may be taken with coefficients in a vector bundle $E$ with connection.
  - If $X$ is Kähler and $E$ is a holomorphic Hermitian vector bundle with the unique unitary connection whose connection matrix in a local holomorphic frame has entries of type $(1,0)$, then the twisted Dirac operator is $\sqrt2(\bar\partial+\bar\partial^*)$.
  - In particular, the harmonic spinors with coefficients in $E$ are identified with $H^*(X,\mathcal O(L\otimes E))$, with $L$ as in F1b.
- **Hypotheses and notation:** as F1b, with $E$ and its connection as stated.
- **Notes:**
  - This twists the spin case (spinor bundle $\Lambda^{0,*}\otimes L$ with $L^2=K$), not the canonical Spin$^c$ structure.
  - It sits inside a proof, not in a numbered statement.
  - Your question asked for a Spin$^c$ statement in one of the four books; none of them was opened (see F2b and the final section).

## F2b. Spin^c twisted by a Hermitian line bundle (Nicolaescu, hosted version)

- **Full citation:** L. I. Nicolaescu, Notes on Seiberg-Witten Theory. Read in the author-hosted version; the published edition is Graduate Studies in Mathematics 28, AMS, 2000.
- **Identifier / DOI:** published edition 10.1090/gsm/028.
- **URL read:** https://www3.nd.edu/~lnicolae/swnotes.pdf. A second hosted version is at https://www3.nd.edu/~lnicolae/new1.pdf (see H).
- **Edition / version read:** author-hosted version (swnotes.pdf), text layer. Its pagination differs from the printed edition (see H).
- **Place:** §1.4.3, Proposition 1.4.25, pp. 81–82 of swnotes.pdf. Proposition 1.4.23 is on p. 77.
- **Mark:** SECONDARY (author-hosted notes, not the printed edition).
- **Statement:**
  - Proposition 1.4.23: for $(M,g,J)$ almost Kähler of dimension $2n$, with the canonical Hermitian Dirac operator $\mathfrak D_c$ of the Spin$^c$ structure induced by $J$ (spinor bundle $\Lambda^{0,*}T^*M$, connection from Levi-Civita and the Chern connection on $K_M^{-1}$), one has $\mathfrak D_c=\sqrt2(\bar\partial+\bar\partial^*)$.
  - Proposition 1.4.25: suppose $(M,g,J)$ is almost Kähler of dimension $2n$, $L\to M$ is a Hermitian line bundle and $B$ is a Hermitian connection on $L$.
    - $L$ defines a Spin$^c$ structure $\sigma_L=\sigma_c\otimes L$, where $\sigma_c$ is the Spin$^c$ structure induced by $J$, and $\det(\sigma_L)=K_M^{-1}\otimes L^2$.
    - Using the Chern connection $A_0$ and $B$, one obtains the connection $A=A_0\otimes B^{\otimes2}$ on $\det(\sigma_L)$, and a geometric Dirac operator $\mathfrak D_A$ on $S_{\sigma_L}=\Omega^{0,*}(L)$.
    - Then $\mathfrak D_A=\sqrt2(\bar\partial_B+\bar\partial_B^*)$.
  - Anchor phrase: "L defines a spin$^c$ structure $\sigma_L=\sigma_c\otimes L$".
- **Hypotheses and notation:** $K_M=\Lambda^{n,0}T^*M$. The proof of Proposition 1.4.25 is left to the reader.
- **Notes:**
  - Prop. 1.4.25 describes the operator, not its kernel. It does not itself state the kernel in terms of Dolbeault or sheaf cohomology.
  - The identification of the kernel needs, in addition, the Hodge and Dolbeault theorems (3.1.8 and 3.1.7; see H). In the hosted version, 3.1.7–3.1.8 are stated for holomorphic bundles over complex manifolds with Hermitian metrics.
  - The hypothesis on $B$ in 1.4.25 is only "Hermitian connection". The notation $\bar\partial_B$ presupposes a holomorphic structure; the statement does not say that $B$ must be compatible with one.

## F3. Determinant line of the canonical Spin^c structure and of its twist

- **Full citation:** as F2b.
- **Identifier / DOI:** published edition 10.1090/gsm/028.
- **URL read:** https://www3.nd.edu/~lnicolae/swnotes.pdf
- **Edition / version read:** author-hosted version, text layer.
- **Place:**
  - End of §1.3.3, pp. 44–45 of swnotes.pdf (the canonical Spin$^c$ structure of an almost complex manifold).
  - §1.4.3 opening, p. 77.
  - Proposition 1.4.25, pp. 81–82.
- **Mark:** SECONDARY (author-hosted notes).
- **Statement:**
  - §1.3.3: an almost complex manifold of dimension $2k$ has a canonical Spin$^c$ structure, induced by $\xi:U(k)\to\mathrm{Spin}^c(2k)$. Its associated line bundle is given by the $S^1$-cocycle $\det_{\mathbf C}(h_{\alpha\beta})$ and is the determinant line bundle $\det_{\mathbf C}T^{1,0}M=\Lambda^{k,0}TM$, i.e. $K_M^{-1}$, where $K_M=\Lambda^{k,0}T^*M$. Anchor phrase: "the line bundle associated to this spin$^c$ structure".
  - Prop. 1.4.25: twisting by $L$ gives $\det(\sigma_L)=K_M^{-1}\otimes L^2$.
- **Hypotheses and notation:** "associated line bundle" is Nicolaescu's term for the determinant line of the Spin$^c$ structure.
- **Notes:**
  - Hitchin (p. 5) states only that a Spin$^c$ structure defines a Hermitian line bundle. He gives no formula for it in the almost complex case.
  - Lawson–Michelsohn, Friedrich, Morgan and Berline–Getzler–Vergne were not opened.

## G. Harmonic spinors on a Riemannian product

- **Full citation:** as F1a.
- **Identifier / DOI:** 10.1016/0001-8708(74)90021-8.
- **URL read:** https://users.math.msu.edu/users/parker/GT/Harmonic%20Spinors.pdf
- **Edition / version read:** as F1a.
- **Place:** §1.4, after Proposition 1.3, Remark (4), p. 12.
- **Mark:** SEEN-IN-SOURCE (page image viewed).
- **Statement:**
  - If $X$ and $Y$ are spin manifolds and $X\times Y$ carries the product metric, the dimension $h$ of the space of harmonic spinors on the product is related to the dimensions $h_1,h_2$ on the factors by the Künneth formula for the tensor product of elliptic complexes (citing Atiyah–Bott [9]). The relations are:
    - even × even: $h^+=h_1^+h_2^++h_1^-h_2^-$ and $h^-=h_1^+h_2^-+h_1^-h_2^+$;
    - even × odd: $h=(h_1^++h_1^-)h_2$;
    - odd × odd: $h^+=h^-=h_1h_2$.
  - Consequence stated in the remark: of the $2^n$ spin structures on the flat torus $T^n=S^1\times\cdots\times S^1$, only the trivial lifting admits a harmonic spinor.
  - Anchor phrase: "the Künneth formula for the tensor product of elliptic complexes".
- **Hypotheses and notation:**
  - Compact oriented Riemannian spin manifolds (standing hypothesis of §1.1, p. 4); product metric.
  - The parity cases refer to the dimensions of the factors.
  - In odd dimensions $h$ denotes the dimension of the kernel of the Dirac operator on the full spinor bundle (p. 5).
- **Notes:**
  - It is a remark, without proof in this paper.
  - It concerns only the dimensions of the kernels (harmonic spinors). It does not describe the operator, its square or its spectrum.
  - It is stated for spin, not Spin$^c$, manifolds.

## H. Numbering in the printed AMS edition of Nicolaescu

- **Full citation:** L. I. Nicolaescu, Notes on Seiberg-Witten Theory, Graduate Studies in Mathematics 28, American Mathematical Society, Providence RI, 2000. ISBN 978-0-8218-2145-9.
- **Identifier / DOI:** 10.1090/gsm/028.
- **URL read:**
  - https://www.ams.org/books/gsm/028/gsm028-endmatter.pdf: the publisher's free front and back matter of the printed edition, comprising the title page, copyright page "© 2000", contents, bibliography and index.
  - For comparison: https://www3.nd.edu/~lnicolae/swnotes.pdf and https://www3.nd.edu/~lnicolae/new1.pdf
- **Edition / version read:** printed edition, front and back matter only. The body chapters are paywalled and I did not see them.
- **Place:** see the table below.
- **Mark:** NOT FOUND (the numbered statements were not seen in the print).
- **Statement:** n/a. The table compares pages; the fourth column is what I could see of the printed edition.

| Your item | swnotes.pdf (hosted) | new1.pdf (hosted) | Printed edition, from its contents and index |
|---|---|---|---|
| §1.3.3 "Spin and spin$^c$ structures" | starts p. 39; canonical Spin$^c$ paragraph pp. 44–45 | Spin$^c$ material in §1.3 (not paginated further) | §1.3.3 starts p. 40 (contents) |
| §1.4.3 "Dirac operators on almost Kähler manifolds" | starts p. 77 | — | §1.4.3 starts p. 80 (contents) |
| Proposition 1.4.23 | p. 77 | p. 63 | not seen |
| Proposition 1.4.25 | pp. 81–82 | p. 66 | not seen |
| Theorem 3.1.7 (Dolbeault) | p. 199 | p. 159 | index entry "theorem, Dolbeault, 201"; number not seen |
| Theorem 3.1.8 (Hodge) | p. 199–200 | p. 159 | index entry "theorem, Hodge, 202"; number not seen |

- **Hypotheses and notation:** —
- **Notes:**
  - The two hosted versions use the same statement numbers as each other (1.4.23, 1.4.25, 3.1.7, 3.1.8) but different page numbers.
  - Neither hosted version matches the printed pagination: the contents put §1.4.3 at p. 80 in print, against p. 77 in swnotes.pdf.
  - I could not confirm that the printed edition uses the same statement numbers.
  - The printed index places the Dolbeault and Hodge theorems at pp. 201 and 202. That is a constant +2 offset from swnotes.pdf (pp. 199–200), matching the +2 offset of the Chapter 3 start (p. 195 in print, p. 193 in the swnotes contents).
  - The printed pages for Propositions 1.4.23 and 1.4.25 cannot be read off the index.
  - To confirm the numbering: the AMS eBook chapter PDF for Chapter 1 or Chapter 3, or a library copy.

## I1. Degree of a line bundle via zeros minus poles / divisors

- **Full citation:** none obtained.
- **Identifier / DOI:** —
- **URL read:** —
- **Edition / version read:** —
- **Place:** —
- **Mark:** NOT FOUND
- **Statement:** —
- **Hypotheses and notation:** —
- **Notes:** no open, legitimate copy of a suitable published textbook was located. None of the sources opened for A–H states this.

## I2. Degree of the canonical bundle of a compact Riemann surface; the Riemann sphere

- **Full citation:** none obtained.
- **Identifier / DOI:** —
- **URL read:** —
- **Edition / version read:** —
- **Place:** —
- **Mark:** NOT FOUND
- **Statement:** —
- **Hypotheses and notation:** —
- **Notes:**
  - Hitchin (§2.2, p. 17) states only that a surface of genus $g$ has $2^{2g}$ spin structures and geometric genus $p_g=g$. He does not state $\deg K=2g-2$.

## Not found or not opened

- **B. Sampson–Washnitzer.** Project Euclid blocked every automated request (the HTML page and both download URLs). Resolved by reading the copy you supplied in chat.
- **E. Hartshorne IV §1, Griffiths–Harris, Mumford §16.** Searched for open legitimate copies and found none; did not use copies on other hosts.
- **F2 / F3 books (Lawson–Michelsohn App. D, Friedrich, Morgan, Berline–Getzler–Vergne).** Searched and found no open legitimate copy.
  - For Morgan, a contents page found by search lists §3.4 "The Case of Complex Manifolds" at p. 48. I did not open the text.
- **H. Body of the printed AMS edition.** Paywalled. Only the free front and back matter was read.
- **I1, I2.** No open legitimate textbook copy located.
- **Hitchin, Elsevier's own page (DOI above).** Would not open. The faculty-hosted scan of the printed article was used instead.
- **Hitchin pp. 15–16 (F2a).** Read from the text layer only; the page images were not checked.
