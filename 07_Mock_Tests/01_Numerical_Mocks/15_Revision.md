# Numerical Ability - Revision Guide

This guide contains the essential formulas, rules, and mathematical models for quick revision.

---

## 1. Vedic Math Tricks

### Squaring Numbers Ending in 5
*   **Trick**: Multiply the first digit by its successor, and append `25` at the end.
*   **Mathematical Model**:
    $$(10x + 5)^2 = 100x(x + 1) + 25$$
*   **Real Number Demo**:
    *   $65^2 \implies 6 \times (6 + 1) = 42 \implies 4225$.
    *   $105^2 \implies 10 \times (10 + 1) = 110 \implies 11025$.

### Multiplication by 11
*   **Trick**: Place the outer digits at the ends. For intermediate positions, sum adjacent digits from right to left (carry over if needed).
*   **Real Number Demo**:
    *   $24 \times 11 \implies 2 \ [2+4] \ 4 = 264$.
    *   $58 \times 11 \implies 5 \ [5+8] \ 8 \implies 5 \ [13] \ 8 \implies [5+1] \ 3 \ 8 = 638$.

---

## 2. Divisibility Rules

| Divisor | Rule | Real Number Demo |
| :---: | :--- | :--- |
| **3** | Sum of digits must be divisible by 3. | $159 \implies 1+5+9 = 15$ (divisible). |
| **7** | Double the last digit, subtract it from the rest. The result must be a multiple of 7. | $343 \implies 34 - (3 \times 2) = 28$ (divisible). |
| **8** | Last 3 digits must form a number divisible by 8. | $1824 \implies 824 / 8 = 103$ (divisible). |
| **11** | Difference between sum of odd-placed digits and even-placed digits must be 0 or a multiple of 11. | $1331 \implies (1+3) - (3+1) = 0$ (divisible). |
| **13** | Quadruple the last digit, add it to the rest. The result must be a multiple of 13. | $143 \implies 14 + (3 \times 4) = 26$ (divisible). |

---

## 3. Percentage Fraction Equivalents

Use these equivalents to speed up calculations:
$$\frac{1}{2} = 50\% \quad | \quad \frac{1}{3} = 33.33\% \quad | \quad \frac{1}{4} = 25\% \quad | \quad \frac{1}{5} = 20\%$$
$$\frac{1}{6} = 16.67\% \quad | \quad \frac{1}{7} = 14.28\% \quad | \quad \frac{1}{8} = 12.5\% \quad | \quad \frac{1}{9} = 11.11\%$$
$$\frac{1}{10} = 10\% \quad | \quad \frac{1}{11} = 9.09\% \quad | \quad \frac{1}{12} = 8.33\% \quad | \quad \frac{1}{15} = 6.67\%$$
$$\frac{1}{20} = 5\%$$

---

## 4. AP & GP Sum Formulas

### Arithmetic Progression (AP)
*   N-th Term: $a_n = a + (n - 1)d$
*   Sum of $n$ Terms:
    $$S_n = \frac{n}{2} [2a + (n - 1)d] = \frac{n}{2} [a + a_n]$$

### Geometric Progression (GP)
*   N-th Term: $a_n = a \cdot r^{n-1}$
*   Sum of $n$ Terms (for $r < 1$):
    $$S_n = \frac{a(1 - r^n)}{1 - r}$$
*   Sum of Infinite Terms (for $|r| < 1$):
    $$S_\infty = \frac{a}{1 - r}$$

---

## 5. Permutation & Combination Shortcuts

### Beggar's Method (Identical distribution to distinct groups)
*   **Formula**: Number of ways to distribute $N$ identical items among $R$ distinct beggars:
    $$\text{Ways} = \binom{N + R - 1}{R - 1}$$
*   **Real Number Demo**: Distribute 10 identical chocolates among 3 children:
    $$\text{Ways} = \binom{10 + 3 - 1}{3 - 1} = \binom{12}{2} = \frac{12 \times 11}{2} = 66 \text{ ways}$$

### Dictionary Rank of a Word (without repetition)
*   **Word**: `"CAT"` (alphabetical: A, C, T)
*   **Shortcut**:
    *   Words starting with A: $2! = 2$.
    *   Words starting with C:
        *   Words starting with CA: $1! = 1$ (which is `"CAT"` itself).
    *   Rank of `"CAT"` $= 2 + 1 = 3$.
