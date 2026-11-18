#!/usr/bin/env python3
"""S04 (where states live): the degree-two part of the Kuenneth product.

What is checked.  Given the ranks of the integer cohomology groups of CP^2,
S^2, S^3 and S^1 (each group free; Hatcher Theorem 3.19, Corollaries 2.14 and
3.3), the Kuenneth formula for free, finitely generated cohomology (Hatcher
Theorem 3.15) gives the rank of H^k of a product as the coefficient of t^k in
the product of the polynomials of its factors.  The script multiplies them,
for
  (1) CP^2 x S^2 x S^3                    (M2-W009, Proposition "the base and space"),
  (2) CP^2 x S^2 x S^3 x S^1 x S^1        (M2-W014, the fibre before it is folded; T^2 = S^1 x S^1),
and prints the ranks in degrees 1 and 2 and the factors the classes come from.

What is not checked.  The cited theorems; that the groups are free (an input
here, from the same citations); anything about Spin^c structures.
"""
from itertools import product

CP2 = {0: 1, 2: 1, 4: 1}   # Hatcher, Theorem 3.19, n = 2
S2 = {0: 1, 2: 1}          # Hatcher, Corollaries 2.14 and 3.3, n = 2
S3 = {0: 1, 3: 1}          # Hatcher, Corollaries 2.14 and 3.3, n = 3
S1 = {0: 1, 1: 1}          # Hatcher, Corollaries 2.14 and 3.3, n = 1


def kuenneth(factors):
    ranks, sources = {}, {}
    for combo in product(*[f.items() for f in factors]):
        k = sum(d for d, _ in combo)
        r = 1
        for _, m in combo:
            r *= m
        ranks[k] = ranks.get(k, 0) + r
        sources.setdefault(k, []).append(tuple(d for d, _ in combo))
    return ranks, sources


# (1) the base and space
ranks, sources = kuenneth([CP2, S2, S3])
for k in (1, 2):
    print(f"(1) rank H^{k}(CP2 x S2 x S3; Z) = {ranks.get(k, 0)}   from degrees (CP2, S2, S3): {sorted(sources.get(k, []))}")
assert ranks.get(1, 0) == 0
assert ranks.get(2, 0) == 2
assert sorted(sources[2]) == [(0, 2, 0), (2, 0, 0)]
assert sum(ranks.values()) == 3 * 2 * 2

# (2) with the torus before it is folded
ranks, sources = kuenneth([CP2, S2, S3, S1, S1])
for k in (1, 2):
    print(f"(2) rank H^{k}(CP2 x S2 x S3 x S1 x S1; Z) = {ranks.get(k, 0)}   from degrees (CP2, S2, S3, S1, S1): {sorted(sources.get(k, []))}")
assert ranks.get(1, 0) == 2                       # both from the torus
assert ranks.get(2, 0) == 3
assert sorted(sources[2]) == [(0, 0, 0, 1, 1), (0, 2, 0, 0, 0), (2, 0, 0, 0, 0)]
# no mixed term: no class of degree two has degree one on the torus and degree one elsewhere
assert all(not (s[3] + s[4] == 1) for s in sources[2])

print("OK: (1) rank 2, one class from CP2 and one from S2; (2) rank 3, one class from each of CP2, S2 and the torus, no mixed term.")
