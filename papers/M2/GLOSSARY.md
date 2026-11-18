# M2 — glossary (M2's own entries)

**What this is (CLAUDE.md §6; `tools/PAPER_FORMAT.md`, "Glossary"; Decision Log P173, P177).** The terms and names that M2 introduces, in the order of first use. Opened 18 November 2026 (Decision Log P183), with no entry.

**Rules.**
- "The glossary" of M2 is two things together: Appendix B, "Names and glossary", of `canon/M1/Paper_M1_Six_Axioms_v7_3.tex`, and then this file. M1's entries are not copied here and none of them is changed. They are read where they stand.
- Before a name or a term is used in M2, both are looked at, and the term is used as it stands there. One thing has one name, in M2 and across the series.
- A term that M2 introduces is defined by the architect at its first use, as a sentence of the paper: an entry of `papers/M2/WRITE_LOG.md`, logged and confirmed as CLAUDE.md §10 says. Its glossary entry is added here in the same chat.
- An entry is: the term; the words that define it, copied as they stand from the entry of the write-up log that states them; and where they stand, which here is that entry's number. When the paper is assembled the entry is made by script from the body of the paper, by exact match, and its place is the printed place.
- An entry is not revised afterwards. The PI (P177): "You define when it is first used, it goes into Glossary, that becomes canonical, any future reference refers to the Glossary. Glossary is carried forward to Mx+1 , new terms are added. There is no backwards revision".
- The same entry is copied, in the same chat, into M2's section of `registers/Definitions_Register.md`, with the number of its write-up log entry. This file is the canonical text and the register row is its copy.
- When the paper is assembled, its appendix "Names and glossary" is M1's entries, copied by script from M1's source, followed by the entries of this file.

**Format of an entry.**

    - **term** · "the defining words, copied" · M2-Wnnn

## Entries

- **state (of the geometry)** · "A \emph{state} of the geometry is a section of the spinor bundle of M1, Definition~2.7, over $\Mtwelve$." · M2-W005
- **lift of the fold** (to a line on the covering torus; to the spinor bundle of the fibre) · "A \emph{lift of the fold} to $N$ is a continuous map $\lambda\colon N\to N$ that carries the fibre of $N$ over each point $p$ of $E$ to the fibre over $\iota(p)$, is linear on each fibre, and applied twice is the identity." … "the \emph{lift of the fold} to it that $\lambda$ defines is $\iota^{*}\otimes\lambda$, where $\iota^{*}$ is the pull-back of functions and $(0,1)$-forms by the fold, as in M1, Section~7.4 ($\iota^{*}\mathrm{d}\bar z=-\mathrm{d}\bar z$)" · M2-W022
- **sign** (of a lift of the fold, at a corner) · "At a corner $P_{i}$, which the fold leaves in place, $\lambda$ acts on the fibre over $P_{i}$ as multiplication by a number whose square is $1$; this number, $+1$ or $-1$, is the \emph{sign} of $\lambda$ at $P_{i}$." · M2-W022
- **covering torus carried round time** $Y$ · "The \emph{covering torus carried round time} is the space $Y$ of the pairs $(p,s)$, $p\in E$, $s\in\R$, in which $(p,s+3L)$ and $(M_{0}^{3}p,s)$ are one point." · M2-W039
- **corner circles** (of $Y$) · "The fold acts on $Y$ by $(p,s)\mapsto(\iota(p),s)$, and it leaves in place exactly the points of the four \emph{corner circles}, $\{(P_{i},s)\colon s\in\R\}$ for $i=1,\dots,4$." · M2-W039
- **lift of the fold** (to a line on the covering torus carried round time) · "A \emph{lift of the fold} to a complex line bundle $N_{Y}$ on $Y$ is a continuous map $\lambda_{Y}\colon N_{Y}\to N_{Y}$ that carries the fibre of $N_{Y}$ over each point $y$ of $Y$ to the fibre over the image of $y$ under the fold, is linear on each fibre, and applied twice is the identity." · M2-W039
- **sign** (of a lift of the fold to a line on $Y$, on a corner circle) · "On each corner circle $\lambda_{Y}$ acts on every fibre as multiplication by one and the same number, $+1$ or $-1$, the \emph{sign} of $\lambda_{Y}$ on that circle." · M2-W039
- **family of complex structures carried round time** · "A \emph{family of complex structures carried round time} is, for each $s$, a complex structure $J_{s}$ on $E$ as in Definition~\ref{def:lift}, with a coordinate $z_{s}$ linear in $(\theta_{\psi},\theta_{\omega})$ and depending continuously on $s$, such that $M_{0}^{3}$ is holomorphic from $(E,J_{s+3L})$ to $(E,J_{s})$." · M2-W040
- **spinor bundle of the fibre carried round time** (and its lift of the fold) · "For such a family, and for a line $N_{Y}$ on $Y$ with a lift of the fold $\lambda_{Y}$, the \emph{spinor bundle of the fibre carried round time} is the bundle on $Y$ whose fibre over $(p,s)$ is that of $\Lambda^{0,*}_{J_{s}}\otimes N_{Y}$, the spinor bundle of Definition~\ref{def:lift} for $J_{s}$, the $(0,1)$-forms at $(M_{0}^{3}p,s)$ and at $(p,s+3L)$ being joined by the pull-back by $M_{0}^{3}$; its \emph{lift of the fold} is $\iota^{*}\otimes\lambda_{Y}$." · M2-W040
