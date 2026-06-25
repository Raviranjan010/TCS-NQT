---
title: "Permutations & Combinations - Expected Questions"
section: "Numerical Ability"
---

# Permutation & Combination Expected Questions (2026 Predictions)

These 5 predicted questions cover advanced patterns aligned with the latest TCS NQT testing trends.

---

**Q1.** In how many ways can the letters of the word "DANGER" be arranged such that the vowels only occupy odd positions?

> 🎯 Hint: Label positions 1 to 6. Identify the odd positions, arrange vowels in them first, and then arrange consonants.

<details>
<summary>✅ Solution</summary>

**Approach:** Slot-based constrained permutation.

**Step-by-Step:**
1. Word "DANGER" has $n = 6$ letters.
   *   Vowels: A, E (Total = 2).
   *   Consonants: D, N, G, R (Total = 4).
2. Set up positions: `1, 2, 3, 4, 5, 6`.
   *   Odd positions: `1, 3, 5` (Total = 3 odd positions).
3. Select and arrange the 2 vowels in these 3 odd positions:
   $$\text{Vowel Ways} = ^3P_2 = \frac{3!}{(3-2)!} = 3 \times 2 = 6$$
4. Arrange the 4 consonants in the remaining 4 positions:
   $$\text{Consonant Ways} = 4! = 24$$
5. Apply the Product Rule to combine:
   $$\text{Total Ways} = 6 \times 24 = 144$$

**Answer:** **144**

**Shortcut:** $^3P_2 \times 4! = 6 \times 24 = 144$.

**Common Mistake:** Using combinations $^3C_2 = 3$ for the vowels instead of permutations $^3P_2 = 6$, which forgets that 'A' and 'E' can swap positions.

**Difficulty:** ⭐⭐⭐☆☆ | **Target Time:** 45 seconds

</details>

---

**Q2.** In how many ways can 15 identical apples be distributed among 3 children such that each child receives at least 2 apples?

> 🎯 Hint: Give each child 2 apples first, then distribute the remaining apples using the standard Beggar's Method ($0+$) formula.

<details>
<summary>✅ Solution</summary>

**Approach:** Shifted Base Beggar's Method.

**Step-by-Step:**
1. Let the apples received by the children be $x_1, x_2, x_3$.
   $$x_1 + x_2 + x_3 = 15 \quad \text{where } x_i \ge 2$$
2. Let $y_i = x_i - 2$, so $y_i \ge 0$. Substitute $x_i = y_i + 2$:
   $$(y_1 + 2) + (y_2 + 2) + (y_3 + 2) = 15$$
   $$y_1 + y_2 + y_3 + 6 = 15 \implies y_1 + y_2 + y_3 = 9 \quad \text{where } y_i \ge 0$$
3. Apply unconstrained Beggar's Method formula with $N' = 9$ and $R = 3$:
   $$\text{Ways} = ^{N'+R-1}C_{R-1} = ^{9+3-1}C_{3-1} = ^{11}C_2$$
4. Compute:
   $$\text{Ways} = \frac{11 \times 10}{2} = 55$$

**Answer:** **55**

**Shortcut:**
$$\text{Remaining apples} = 15 - (3 \times 2) = 9$$
$$\text{Ways} = ^{9+3-1}C_{3-1} = ^{11}C_2 = 55$$

**Common Mistake:** Using $N=15$ in the standard positive integer formula $^{N-1}C_{R-1} = ^{14}C_2 = 91$.

**Difficulty:** ⭐⭐⭐⭐☆ | **Target Time:** 60 seconds

</details>

---

**Q3.** There are 12 points in a plane, of which exactly 5 points lie on a single straight line. How many distinct triangles can be formed by joining these points?

> 🎯 Hint: Subtract the invalid triangles formed by selecting 3 points from the collinear group from the total possible combinations.

<details>
<summary>✅ Solution</summary>

**Approach:** Geometry point subtraction combination.

**Step-by-Step:**
1. Total points $n = 12$. Triangles require selecting any 3 points.
   $$\text{Total Combinations} = ^{12}C_3 = \frac{12 \times 11 \times 10}{3 \times 2 \times 1} = 220$$
2. Calculate invalid triangles formed from the 5 collinear points:
   $$\text{Collinear Combinations} = ^5C_3 = ^5C_2 = \frac{5 \times 4}{2} = 10$$
3. Subtract invalid cases from total:
   $$\text{Triangles} = 220 - 10 = 210$$

**Answer:** **210**

**Shortcut:** $^{12}C_3 - ^5C_3 = 220 - 10 = 210$.

**Common Mistake:** Forgetting to subtract the collinear combinations, or subtracting them but adding 1 back (which is only done for straight line problems, not triangle problems).

**Difficulty:** ⭐⭐⭐☆☆ | **Target Time:** 45 seconds

</details>

---

**Q4.** In how many ways can 6 people be seated around a circular table if two particular people must always sit next to each other?

> 🎯 Hint: Tie the two adjacent people together into a single block (string method) and arrange them in the circle.

<details>
<summary>✅ Solution</summary>

**Approach:** Circular Permutation with String Method.

**Step-by-Step:**
1. Total people $n = 6$. Let the two adjacent people be A and B.
2. Tie A and B as 1 unit: `(AB)`.
3. Total units to arrange: 4 others + 1 block $= 5$ units.
4. Arrange 5 units in a circle:
   $$\text{Outer circular arrangements} = (5 - 1)! = 4! = 24$$
5. Arrange A and B internally inside the block:
   $$\text{Inner arrangements} = 2! = 2$$
6. Multiply the stages:
   $$\text{Total Ways} = 24 \times 2 = 48$$

**Answer:** **48**

**Shortcut:** $2 \times (n-2)! = 2 \times 4! = 48$.

**Common Mistake:** Arranging the outer group linearly ($5! = 120$) instead of circularly ($(5-1)! = 24$).

**Difficulty:** ⭐⭐⭐☆☆ | **Target Time:** 45 seconds

</details>

---

**Q5.** How many 5-digit numbers divisible by 5 can be formed using the digits $\{0, 1, 2, 3, 5, 7, 8\}$ without repeating any digits?

> 🎯 Hint: Divisibility by 5 requires the units slot to be `0` or `5`. Because `0` cannot be in the first digit position, split the calculation into two cases based on the units digit.

<details>
<summary>✅ Solution</summary>

**Approach:** Multi-case slot filling.

**Step-by-Step:**
*   **Case 1: The number ends in 0**
    *   Units slot: 1 choice (`0`).
    *   First slot (Ten-thousands): 6 choices (digits $\{1,2,3,5,7,8\}$).
    *   Second slot: 5 choices.
    *   Third slot: 4 choices.
    *   Fourth slot: 3 choices.
    *   $$\text{Ways}_1 = 6 \times 5 \times 4 \times 3 \times 1 = 360$$
*   **Case 2: The number ends in 5**
    *   Units slot: 1 choice (`5`).
    *   First slot (Ten-thousands): 5 choices (cannot be `0` and cannot be `5`).
    *   Second slot: 5 choices (can now include `0`).
    *   Third slot: 4 choices.
    *   Fourth slot: 3 choices.
    *   $$\text{Ways}_2 = 5 \times 5 \times 4 \times 3 \times 1 = 300$$
*   Sum the cases:
    $$\text{Total Numbers} = 360 + 300 = 660$$

**Answer:** **660**

**Shortcut:** $(6 \times 5 \times 4 \times 3) + (5 \times 5 \times 4 \times 3) = 360 + 300 = 660$.

**Common Mistake:** Combining the cases to write $6 \times 5 \times 4 \times 3 \times 2 = 720$, which incorrectly counts numbers starting with `0` when `5` is at the units place.

**Difficulty:** ⭐⭐⭐⭐☆ | **Target Time:** 60 seconds

</details>
