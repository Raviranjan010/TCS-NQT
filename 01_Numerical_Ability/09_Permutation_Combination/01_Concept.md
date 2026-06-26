# Permutation & Combination - Concept Guide

## 1. Fundamental Principles of Counting
*   **Addition Rule:** If event A can occur in $m$ ways and event B in $n$ ways, and they cannot occur together, then A or B can occur in $m + n$ ways.
*   **Multiplication Rule:** If event A can occur in $m$ ways followed by event B in $n$ ways, then both can occur in $m \times n$ ways.

### Immediate Worked Example:
A city has 3 cinemas and 4 theatres. In how many ways can a person visit a cinema followed by a theatre?
*   **Apply Multiplication Rule:**
    $$\text{Ways} = 3 \times 4 = 12\text{ ways}$$

---

## 2. Permutation vs Combination
*   **Permutation (Arrangement):** Order matters.
    $$^nP_r = \frac{n!}{(n-r)!}$$
*   **Combination (Selection):** Order does not matter.
    $$^nC_r = \frac{n!}{r!(n-r)!}$$

### Derivation of Combination Formula from Permutations:
1.  Selecting $r$ items from $n$ distinct items can be done in $^nC_r$ ways.
2.  Once selected, these $r$ items can be arranged in $r!$ ways.
3.  By the multiplication rule, total arrangements (permutations) is:
    $$^nP_r = ^nC_r \times r! \implies ^nC_r = \frac{^nP_r}{r!} = \frac{n!}{r!(n-r)!}$$

### Immediate Worked Example:
Out of 5 players, in how many ways can a committee of 3 be chosen?
*   **Apply Combination:**
    $$^5C_3 = \frac{5 \times 4 \times 3}{3 \times 2 \times 1} = 10\text{ ways}$$
