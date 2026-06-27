# Permutation & Combination — Formulas

## Core Formulas

| Formula | Definition | When |
|---------|-----------|------|
| nPr = n!/(n-r)! | Ordered selections | Arrangements, codes |
| nCr = n!/r!(n-r)! | Unordered selections | Teams, groups |
| (n-1)! | Circular arrangement | Seating around table |
| (n-1)!/2 | Circular + mirror | Necklace problems |
| n!/p!q!... | Repeated elements | Anagrams |
| n^r | Repetition allowed | Passwords from alphabet |

## Derivation of nCr from nPr
- nPr counts all ordered arrangements.
- For each selection of r items, there are r! ways to order them.
- So nCr = nPr / r! = n! / (r!(n-r)!)

## Pascal's Triangle Identity
$$nCr = (n-1)C(r-1) + (n-1)Cr$$

## Sum Identity
$$nC0 + nC1 + ... + nCn = 2^n$$

This means: total subsets of n items = 2^n.

## Handshake Formula
n people, each shaking hands once with every other:
$$= nC2 = \frac{n(n-1)}{2}$$

## Triangle from n Points (No 3 Collinear)
$$= nC3 = \frac{n(n-1)(n-2)}{6}$$
