# Probability - Solved Examples

## 🟢 Easy-Level Examples
### Example 1. Tossing two dice
*   **Question:** Two dice are thrown. Find the probability that the sum is 7.
*   **Solution:**
    *   Total outcomes $= 6 \times 6 = 36$.
    *   Favorable sums $= \{(1,6), (2,5), (3,4), (4,3), (5,2), (6,1)\} \implies 6$ outcomes.
    *   $P = 6/36 = 1/6$.

## 🟡 Medium-Level Examples
### Example 2. Marble drawing
*   **Question:** A bag contains 4 red and 6 blue marbles. If 3 marbles are drawn, find the probability that exactly 2 are red.
*   **Solution:**
    *   Total ways $= ^{10}C_3 = 120$.
    *   Favorable $= (^4C_2 \times ^6C_1) = 6 \times 6 = 36$.
    *   $P = 36/120 = 3/10 = 0.3$.

## 🔴 Hard-Level Examples
### Example 3. Infinite Game turns
*   **Question:** A and B throw a die alternately. Whoever rolls a '6' first wins. If A starts, find A's probability of winning.
*   **Solution:** Let $p = 1/6$ (getting 6) and $q = 5/6$ (not getting 6).
    *   A can win on 1st turn ($p$), 3rd turn ($q \cdot q \cdot p$), 5th turn ($q^4 p$), etc.
    *   This is an infinite GP with $a = p$ and $r = q^2$.
    *   Sum $= \frac{a}{1-r} = \frac{1/6}{1 - 25/36} = \frac{1/6}{11/36} = \frac{6}{11}$.
