---
title: "Permutations & Combinations - Practice Advanced"
section: "Numerical Ability"
---

# Permutation & Combination Advanced Practice

## Practice Questions

**Q1.** In how many ways can the letters of the word "STRATEGY" be arranged such that no two vowels are together?

> 🎯 Hint: Use the Gap Method. Arrange the consonants first, and then place the vowels into the gaps between them.

<details>
<summary>✅ Solution</summary>

**Approach:** Gap Method with repeating consonants.

**Step-by-Step:**
1. Identify letters in "STRATEGY" (Total = 8).
   *   Vowels: A, E (Total = 2, distinct).
   *   Consonants: S, T, R, T, G, Y (Total = 6, 'T' repeats 2 times).
2. Arrange consonants first:
   $$\text{Consonant Arrangements} = \frac{6!}{2!} = \frac{720}{2} = 360$$
3. Consonants create $6 + 1 = 7$ gaps:
   ` _ S _ T _ R _ T _ G _ Y _ `
4. Select 2 gaps out of the 7 for the 2 distinct vowels, and arrange them:
   $$\text{Vowel Ways} = ^7C_2 \times 2! = 21 \times 2 = 42$$
5. Apply the Product Rule:
   $$\text{Total Ways} = 360 \times 42 = 15,120$$

**Answer:** **15120**

**Shortcut:** $\frac{6!}{2!} \times ^7P_2 = 360 \times 42 = 15,120$.

**Common Mistake:** Forgetting to divide by $2!$ for the double 'T' when arranging consonants, leading to an incorrect result of 30,240.

**Difficulty:** ⭐⭐⭐⭐☆ | **Target Time:** 60 seconds

</details>

---

**Q2.** In how many ways can 10 identical toy cars be distributed among 3 children (A, B, and C) such that A gets at least 1, B gets at least 2, and C gets at least 3 cars?

> 🎯 Hint: Subtract the minimum required cars from the total first, then apply the unconstrained Beggar's Method formula.

<details>
<summary>✅ Solution</summary>

**Approach:** Shifted Base Beggar's Method.

**Step-by-Step:**
1. Let cars received be $x_A, x_B, x_C$.
   $$x_A + x_B + x_C = 10 \quad \text{where } x_A \ge 1, x_B \ge 2, x_C \ge 3$$
2. Distribute the minimums first:
   *   A gets 1 car.
   *   B gets 2 cars.
   *   C gets 3 cars.
   *   Total distributed $= 1 + 2 + 3 = 6$ cars.
3. Remaining cars to distribute:
   $$N' = 10 - 6 = 4\text{ cars}$$
4. Distribute 4 identical cars to 3 children with no further constraints:
   $$\text{Ways} = ^{N'+R-1}C_{R-1} = ^{4+3-1}C_{3-1} = ^6C_2$$
5. Calculate:
   $$\text{Ways} = \frac{6 \times 5}{2} = 15$$

**Answer:** **15**

**Shortcut:** $^{10 - (1+2+3) + 3 - 1}C_{3-1} = ^6C_2 = 15$.

**Common Mistake:** Applying $^{10-1}C_{3-1} = ^9C_2 = 36$, which only satisfies the "at least 1" constraint for everyone.

**Difficulty:** ⭐⭐⭐⭐☆ | **Target Time:** 45 seconds

</details>

---

**Q3.** There are 15 points in a plane, of which exactly 6 are collinear. How many distinct straight lines can be formed by joining these points?

> 🎯 Hint: Subtract the lines lost within the collinear points, but remember to add 1 back because those collinear points still form exactly one line.

<details>
<summary>✅ Solution</summary>

**Approach:** Geometry point combinations for lines ($^nC_2 - ^mC_2 + 1$).

**Step-by-Step:**
1. Total points $n = 15$. Selecting 2 points forms a line.
   $$\text{Total Lines} = ^{15}C_2 = \frac{15 \times 14}{2} = 105$$
2. Identify lines lost within the 6 collinear points:
   $$\text{Collinear Lines} = ^6C_2 = \frac{6 \times 5}{2} = 15$$
3. Apply formula and add 1 for the collinear line itself:
   $$\text{Lines} = 105 - 15 + 1 = 91$$

**Answer:** **91**

**Shortcut:** $^{15}C_2 - ^6C_2 + 1 = 105 - 15 + 1 = 91$.

**Common Mistake:** Forgetting to add $1$ back, leading to the incorrect answer of $90$.

**Difficulty:** ⭐⭐⭐⭐☆ | **Target Time:** 50 seconds

</details>

---

**Q4.** What is the alphabetical dictionary rank of the word "SMALL"?

> 🎯 Hint: Write the letters in alphabetical order: A, L, L, M, S. Apply the duplicate-handling cross-out rank shortcut.

<details>
<summary>✅ Solution</summary>

**Approach:** Dictionary Rank with Repetitions.

**Step-by-Step:**
1. Alphabetical order of letters: `A, L, L, M, S`.
2. Write "SMALL" and count smaller letters to the right, dividing by duplicates:
   *   **S**: letters smaller to its right are `M, A, L, L` (Count = 4). Duplicates to right: 'L' repeats twice. Term $= \frac{4}{2!} \times 4! = 48$.
   *   **M**: letters smaller to its right are `A, L, L` (Count = 3). Duplicates to right: 'L' repeats twice. Term $= \frac{3}{2!} \times 3! = 9$.
   *   **A**: no letters smaller to its right (Count = 0). Term $= 0$.
   *   **L** (first): no letters smaller to its right (Count = 0). Term $= 0$.
   *   **L** (second): no letters smaller to its right (Count = 0). Term $= 0$.
3. Sum the values:
   $$\text{Sum} = 48 + 9 + 0 + 0 + 0 = 57$$
4. Add 1 for the final rank:
   $$\text{Rank} = 57 + 1 = 58$$

**Answer:** **58**

**Shortcut:**
$$\text{Rank} = \left(\frac{4}{2} \times 24\right) + \left(\frac{3}{2} \times 6\right) + 0 + 0 + 0 + 1 = 48 + 9 + 1 = 58$$

**Common Mistake:** Forgetting to divide by $2!$ for the repeating 'L' in the first two stages, yielding a rank of $115$.

**Difficulty:** ⭐⭐⭐⭐⭐ | **Target Time:** 75 seconds

</details>

---

**Q5.** In how many ways can 7 people be seated around a circular table if A and B must sit together, but C must not sit next to A or B?

> 🎯 Hint: First tie A and B together. Place the other 4 people in a circle. Identify the gaps around them where A and B can be placed without touching C.

<details>
<summary>✅ Solution</summary>

**Approach:** circular relative gap permutation.

**Step-by-Step:**
1. Total people: A, B, C, D, E, F, G (Total = 7).
2. Seat D, E, F, G and C first:
   *   Arrange $\{C, D, E, F, G\}$ (5 people) in a circle: $(5-1)! = 4! = 24$ ways.
3. These 5 people create 5 gaps in the circle. Identify which gaps are safe for `(AB)`:
   *   The 5 people in the circle are seated as: `... - D - E - F - G - C - ...`
   *   Since `(AB)` cannot sit next to C, we cannot place `(AB)` in the gap to the left of C, nor the gap to the right of C.
   *   This leaves $5 - 2 = 3$ safe gaps out of the 5 gaps.
4. Select 1 gap out of the 3 for the block `(AB)`:
   $$\text{Gap selection} = 3\text{ choices}$$
5. Arrange A and B internally inside the block:
   $$\text{Inner ways} = 2! = 2\text{ ways}$$
6. Multiply the stages:
   $$\text{Total Ways} = 24 \times 3 \times 2 = 144\text{ ways}$$

**Answer:** **144**

**Shortcut:** $(5-1)! \times (5 - 2) \times 2 = 24 \times 3 \times 2 = 144$.

**Common Mistake:** Using simple subtraction from total without verifying circular neighbor positions, which often leads to undercounting constraints.

**Difficulty:** ⭐⭐⭐⭐⭐ | **Target Time:** 75 seconds

</details>
