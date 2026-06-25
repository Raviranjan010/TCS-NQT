---
title: "Permutations & Combinations - Common Mistakes"
section: "Numerical Ability"
---

# Permutation & Combination Common Mistakes

Avoid these 7 common traps during the TCS NQT to prevent losing easy marks.

---

## Trap 1: Overcounting in Committee Selection (The "Choose First" Trap)
*   **The Scenario**: Selecting a committee of 5 members from 6 men and 4 women, containing *at least* 2 women.
*   **The Wrong Approach**: 
    1.  Select 2 women first: $^4C_2 = 6$.
    2.  Select the remaining 3 members from the remaining 8 people (2 women + 6 men): $^8C_3 = 56$.
    3.  Multiply: $6 \times 56 = 336$ ways.
*   **Why it's wrong**: This overcounts overlapping groups. For instance, if women are $W_1, W_2, W_3, W_4$. Choosing $\{W_1, W_2\}$ first and then $\{W_3, M_1, M_2\}$ is identical to choosing $\{W_1, W_3\}$ first and then $\{W_2, M_1, M_2\}$.
*   **The Correct Approach**: Separate the problem into disjoint, mutually exclusive cases and sum them:
    *   2 Women + 3 Men $= ^4C_2 \times ^6C_3 = 120$
    *   3 Women + 2 Men $= ^4C_3 \times ^6C_2 = 60$
    *   4 Women + 1 Man $= ^4C_4 \times ^6C_1 = 6$
    *   Total $= 120 + 60 + 6 = 186$ ways.

---

## Trap 2: Incorrect Circular Seating Division (The "Necklace" Trap)
*   **The Scenario**: Arranging 5 people around a table vs arranging 5 unique flowers on a circular garland.
*   **The Wrong Approach**: Using $(n-1)! = 4! = 24$ for both cases.
*   **Why it's wrong**: For people around a table, a clockwise arrangement (A on B's left) is physically different from counter-clockwise (A on B's right). For garlands or necklaces, the arrangement can be flipped upside down. Flipping turns a CW order into a CCW order. Thus, CW and CCW are identical states.
*   **The Correct Approach**:
    *   People around table: $(n-1)! = (5-1)! = 24\text{ ways}$.
    *   Flowers on garland: $\frac{(n-1)!}{2} = \frac{4!}{2} = 12\text{ ways}$.

---

## Trap 3: Digit Formation with Zero (The "Leading Zero" Trap)
*   **The Scenario**: Creating 4-digit numbers using the digits $\{0, 1, 2, 3, 4\}$ without repetition.
*   **The Wrong Approach**: Using $^5P_4 = \frac{5!}{1!} = 120$ numbers.
*   **Why it's wrong**: This counts arrangements starting with `0` (e.g., `0123`), which is actually a 3-digit number, not a 4-digit number.
*   **The Correct Approach**: Use slot filling.
    1.  The Thousands slot cannot be `0` $\implies$ 4 choices $\{1, 2, 3, 4\}$.
    2.  The Hundreds slot can be `0` and any remaining digit $\implies$ 4 choices.
    3.  Tens slot $\implies$ 3 choices.
    4.  Units slot $\implies$ 2 choices.
    5.  Total $= 4 \times 4 \times 3 \times 2 = 96$ numbers.

---

## Trap 4: Confusing Beggar's Method Conditions (The "At Least 0" vs "At Least 1" Trap)
*   **The Scenario**: Distributing 8 identical coins to 3 children.
*   **The Wrong Approach**: Applying the same formula without checking if children can get 0 coins.
*   **Why it's wrong**: 
    *   $^{N+R-1}C_{R-1}$ allows kids to get $0$ coins.
    *   $^{N-1}C_{R-1}$ requires each kid to get at least $1$ coin.
*   **The Correct Approach**:
    *   If kids can receive zero: $^{8+3-1}C_{3-1} = ^{10}C_2 = 45$ ways.
    *   If each kid must get at least one: $^{8-1}C_{3-1} = ^7C_2 = 21$ ways.

---

## Trap 5: Collinear Points in Geometry
*   **The Scenario**: Finding the number of triangles that can be formed from 10 points where 4 points are collinear.
*   **The Wrong Approach**: Writing $^{10}C_3 = 120$.
*   **Why it's wrong**: Any 3 points selected from the 4 collinear points lie on a straight line and cannot form a triangle.
*   **The Correct Approach**: Subtract the combinations of collinear points:
    $$\text{Triangles} = ^{10}C_3 - ^4C_3 = 120 - 4 = 116\text{ triangles}$$
*   *Note on Lines*: If the question asked for *straight lines*, subtracting collinear pairs is not enough. You must add $1$ back because the collinear points still form exactly 1 straight line:
    $$\text{Lines} = ^{10}C_2 - ^4C_2 + 1 = 45 - 6 + 1 = 40\text{ lines}$$

---

## Trap 6: Forgetting Letter Duplicates in Word Arrangements
*   **The Scenario**: Find the number of ways to arrange the letters of "TRUST".
*   **The Wrong Approach**: Total letters $= 5 \implies 5! = 120$.
*   **Why it's wrong**: The letter 'T' repeats twice. Swapping the first 'T' with the second 'T' does not create a new word.
*   **The Correct Approach**: Divide by the duplication factor:
    $$\text{Ways} = \frac{5!}{2!} = \frac{120}{2} = 60\text{ ways}$$

---

## Trap 7: Permutation vs Combination Confusion
*   **The Scenario**: Selecting a tennis doubles team of 4 players from 8 candidates.
*   **The Wrong Approach**: Using $^{8}P_4 = 1680$ ways.
*   **Why it's wrong**: Permutations assume the order of selection matters (e.g. selecting players A, B, C, D in that sequence is a different event than D, C, B, A). In a tennis team, the players selected are the same regardless of their selection order.
*   **The Correct Approach**: Use Combinations:
    $$^8C_4 = \frac{8 \times 7 \times 6 \times 5}{4 \times 3 \times 2 \times 1} = 70\text{ ways}$$
