---
title: "Permutations & Combinations - Solved Examples"
section: "Numerical Ability"
---

# Permutation & Combination Solved Examples

This guide contains 10 progressive worked examples, ranging from Easy to Hard difficulty.

---

## 1. Easy Solved Examples

**Q1.** Find the number of distinct ways to arrange the letters of the word "APPLE".

> 🎯 Hint: Count the total letters and divide by the factorial of the count of repeating letters.

<details>
<summary>✅ Solution</summary>

**Approach:** Permutations with identical objects.

**Step-by-Step:**
1. Count total letters: $n = 5$ ('A', 'P', 'P', 'L', 'E').
2. Count repeating letters: 'P' repeats 2 times.
3. Apply formula:
   $$\text{Total Ways} = \frac{5!}{2!}$$
4. Calculate:
   $$\text{Total Ways} = \frac{120}{2} = 60$$

**Answer:** **60**

**Shortcut:** Write out the factors and cancel: $5 \times 4 \times 3 = 60$.

**Common Mistake:** Forgetting the duplicate 'P' and writing $5! = 120$ directly.

**Difficulty:** ⭐☆☆☆☆ | **Target Time:** 30 seconds

</details>

---

**Q2.** How many diagonals can be drawn in a regular decagon (10-sided polygon)?

> 🎯 Hint: Use the formula derived from choosing any two vertices and subtracting the boundary edges.

<details>
<summary>✅ Solution</summary>

**Approach:** Polygon diagonal formula: $\frac{n(n-3)}{2}$.

**Step-by-Step:**
1. Identify the number of sides: $n = 10$.
2. Substitute into formula:
   $$\text{Diagonals} = \frac{10 \times (10 - 3)}{2}$$
3. Simplify:
   $$\text{Diagonals} = \frac{10 \times 7}{2} = 35$$

**Answer:** **35**

**Shortcut:** $^{10}C_Decagon - 10 = 45 - 10 = 35$.

**Common Mistake:** Using $^nC_2$ (45) directly, which mistakenly counts the 10 outer boundaries as diagonals.

**Difficulty:** ⭐☆☆☆☆ | **Target Time:** 30 seconds

</details>

---

**Q3.** There are 12 people at a meeting. If everyone shakes hands with everyone else exactly once, how many handshakes take place?

> 🎯 Hint: A handshake requires selecting a pair of 2 distinct people out of the total.

<details>
<summary>✅ Solution</summary>

**Approach:** Combination selection of 2 people ($^nC_2$).

**Step-by-Step:**
1. Identify total people: $n = 12$.
2. Write combination formula:
   $$\text{Handshakes} = ^{12}C_2$$
3. Calculate using the shortcut:
   $$\frac{12 \times 11}{2 \times 1} = 66$$

**Answer:** **66**

**Shortcut:** $\frac{n(n-1)}{2} = \frac{12 \times 11}{2} = 66$.

**Common Mistake:** Using permutations ($^{12}P_2 = 132$) which double-counts every handshake (e.g., A shaking B and B shaking A as separate events).

**Difficulty:** ⭐☆☆☆☆ | **Target Time:** 30 seconds

</details>

---

## 2. Medium Solved Examples

**Q4.** In how many ways can the letters of the word "CORPORATION" be arranged so that the vowels are always together?

> 🎯 Hint: Group all the vowels together as a single entity (string method), then arrange the remaining letters.

<details>
<summary>✅ Solution</summary>

**Approach:** String / Tie-Together Method.

**Step-by-Step:**
1. Identify letters in "CORPORATION" (Total = 11).
   *   Vowels: O, O, A, I, O (Total = 5, where 'O' repeats 3 times).
   *   Consonants: C, R, P, R, T, N (Total = 6, where 'R' repeats 2 times).
2. Tie vowels into a single unit `(OOAIO)`.
3. Total units to arrange: 6 consonants + 1 vowel-block = 7 units (with 'R' repeating 2 times).
   $$\text{Outer Ways} = \frac{7!}{2!} = \frac{5040}{2} = 2520$$
4. Arrange vowels internally: 5 vowels where 'O' repeats 3 times.
   $$\text{Inner Ways} = \frac{5!}{3!} = \frac{120}{6} = 20$$
5. Multiply:
   $$\text{Total Ways} = 2520 \times 20 = 50400$$

**Answer:** **50400**

**Shortcut:** $\frac{7!}{2!} \times \frac{5!}{3!} = 2520 \times 20 = 50,400$.

**Common Mistake:** Forgetting to divide by duplicates either in the outer consonants ('R' twice) or the inner vowels ('O' three times).

**Difficulty:** ⭐⭐⭐☆☆ | **Target Time:** 60 seconds

</details>

---

**Q5.** How many 4-digit odd numbers can be formed using the digits $\{2, 3, 5, 6, 8, 9\}$ without repeating any digits?

> 🎯 Hint: Always fill the restricted slot (units position) first, then fill the remaining slots from left to right.

<details>
<summary>✅ Solution</summary>

**Approach:** Product Rule slot filling.

**Step-by-Step:**
1. Set up 4 slots: `[Thousand] [Hundred] [Ten] [Unit]`.
2. Restrict the units position for odd numbers. Odd digits in set: $\{3, 5, 9\}$ (3 choices).
   `[ ] [ ] [ ] [3 choices]`
3. Fill Thousand position: 5 remaining digits (5 choices).
   `[5 choices] [ ] [ ] [3 choices]`
4. Fill Hundred position: 4 remaining digits (4 choices).
   `[5] [4 choices] [ ] [3]`
5. Fill Ten position: 3 remaining digits (3 choices).
   `[5] [4] [3 choices] [3]`
6. Apply Product Rule:
   $$\text{Total Numbers} = 5 \times 4 \times 3 \times 3 = 180$$

**Answer:** **180**

**Shortcut:** $3 \times ^5P_3 = 3 \times 60 = 180$.

**Common Mistake:** Filling the Thousand slot first, which ignores the odd units constraint, leading to incorrect combinations.

**Difficulty:** ⭐⭐⭐☆☆ | **Target Time:** 50 seconds

</details>

---

**Q6.** A committee of 5 members is to be selected from a group of 6 men and 4 women. In how many ways can this committee be formed if it must contain at least 2 women?

> 🎯 Hint: Break this into mutually exclusive cases for 2, 3, or 4 women in the committee, then add the ways.

<details>
<summary>✅ Solution</summary>

**Approach:** Combination cases with Sum Rule.

**Step-by-Step:**
*   **Case 1: Exactly 2 women and 3 men**
    $$\text{Ways} = ^4C_2 \times ^6C_3 = 6 \times 20 = 120$$
*   **Case 2: Exactly 3 women and 2 men**
    $$\text{Ways} = ^4C_3 \times ^6C_2 = 4 \times 15 = 60$$
*   **Case 3: Exactly 4 women and 1 man**
    $$\text{Ways} = ^4C_4 \times ^6C_1 = 1 \times 6 = 6$$
*   Add the ways of all mutually exclusive cases:
    $$\text{Total Ways} = 120 + 60 + 6 = 186$$

**Answer:** **186**

**Shortcut:** Rapidly compute $^6C_3=20$, $^6C_2=15$, and perform mental multiplication.

**Common Mistake:** Selecting 2 women first ($^4C_2$) and then selecting the remaining 3 members from the remaining 8 people ($^8C_3$), which results in severe overcounting of overlapping committees.

**Difficulty:** ⭐⭐⭐☆☆ | **Target Time:** 70 seconds

</details>

---

## 3. Hard Solved Examples

**Q7.** In how many ways can 6 people sit around a circular table if 2 particular people refuse to sit next to each other?

> 🎯 Hint: Calculate the total circular arrangements without constraints and subtract the arrangements where they sit together.

<details>
<summary>✅ Solution</summary>

**Approach:** Complementary Counting with Circular Seating.

**Step-by-Step:**
1. Calculate total circular arrangements for 6 people:
   $$\text{Total} = (6 - 1)! = 5! = 120$$
2. Calculate arrangements where the 2 particular people (A & B) sit together:
   *   Tie A and B as 1 unit: `(AB)`.
   *   Total units to seat in circle: 4 others + 1 unit $= 5$ units.
   *   Circular arrangements of 5 units $= (5-1)! = 4! = 24$.
   *   Internal arrangements of A and B $= 2! = 2$.
   *   Total "Together" arrangements $= 24 \times 2 = 48$.
3. Subtract from total:
   $$\text{Never Together} = 120 - 48 = 72$$

**Answer:** **72**

**Shortcut:** $(N-2) \times (N-2)! = (6-2) \times 4! = 4 \times 24 = 72$.

**Common Mistake:** Applying linear formula $(5! - 2 \times 4!)$ or forgetting to arrange A and B internally inside the tied block.

**Difficulty:** ⭐⭐⭐⭐☆ | **Target Time:** 60 seconds

</details>

---

**Q8.** In how many ways can 10 identical chocolate coins be distributed among 4 children such that each child gets at least one chocolate coin?

> 🎯 Hint: Apply the positive integer version of Beggar's method (Stars & Bars).

<details>
<summary>✅ Solution</summary>

**Approach:** Beggar's Method ($1+$ constraint): $^{N-1}C_{R-1}$.

**Step-by-Step:**
1. Identify variables: $N = 10$ (identical chocolates), $R = 4$ (distinct children).
2. Set up the formula:
   $$\text{Ways} = ^{10-1}C_{4-1} = ^9C_3$$
3. Compute using the shortcut:
   $$\text{Ways} = \frac{9 \times 8 \times 7}{3 \times 2 \times 1} = 84$$

**Answer:** **84**

**Shortcut:** $\frac{9 \times 8 \times 7}{6} = 3 \times 4 \times 7 = 84$.

**Common Mistake:** Using the unconstrained formula $^{N+R-1}C_{R-1} = ^{13}C_3 = 286$, which permits children to receive zero chocolates.

**Difficulty:** ⭐⭐⭐⭐☆ | **Target Time:** 60 seconds

</details>

---

**Q9.** If the letters of the word "SECRET" are arranged in all possible ways and listed alphabetically as in a dictionary, what is the rank of the word "SECRET"?

> 🎯 Hint: Alphabetize the letters and apply the cross-out rank shortcut, keeping track of duplicate letters.

<details>
<summary>✅ Solution</summary>

**Approach:** Dictionary Rank with Repetitions.

**Step-by-Step:**
1. Alphabetical order of letters: `C, E, E, R, S, T`.
2. Write "SECRET" and count smaller letters to the right:
   *   **S**: letters smaller than S to its right are `E, C, R, E` (Count = 4). Duplicates to right: two E's $\implies$ Term $= \frac{4}{2!} \times 5! = 240$.
   *   **E** (first): letters smaller to its right is `C` (Count = 1). Duplicates to right: two E's $\implies$ Term $= \frac{1}{2!} \times 4! = 12$.
   *   **C**: no letters smaller to its right (Count = 0) $\implies$ Term $= 0$.
   *   **R**: letters smaller to its right is `E` (Count = 1). No duplicates to right $\implies$ Term $= \frac{1}{1!} \times 2! = 2$.
   *   **E** (second): no letters smaller to its right (Count = 0) $\implies$ Term $= 0$.
   *   **T**: no letters smaller to its right (Count = 0) $\implies$ Term $= 0$.
3. Sum the values:
   $$\text{Sum} = 240 + 12 + 0 + 2 + 0 + 0 = 254$$
4. Add 1 for the final rank:
   $$\text{Rank} = 254 + 1 = 255$$

**Answer:** **255**

**Shortcut:** Cross-out math: $(2 \times 120) + (12) + 0 + 2 + 0 + 1 = 255$.

**Common Mistake:** Failing to divide by $2!$ for the double 'E' in the denominator when processing letters before both 'E's have been crossed out.

**Difficulty:** ⭐⭐⭐⭐⭐ | **Target Time:** 75 seconds

</details>

---

**Q10.** Find the number of shortest paths for a grid robot to travel from corner $(0,0)$ to $(5,4)$ if it must pass through the junction $(2,2)$.

> 🎯 Hint: Break the path into two stages: $(0,0) \rightarrow (2,2)$ and then $(2,2) \rightarrow (5,4)$. Apply the grid path formula to each stage and multiply the results.

<details>
<summary>✅ Solution</summary>

**Approach:** Multi-stage Grid Path formula: $^{R_1+C_1}C_{R_1} \times ^{R_2+C_2}C_{R_2}$.

**Step-by-Step:**
1. **Stage 1: $(0,0) \rightarrow (2,2)$**
   *   Right steps $R_1 = 2$, Up steps $C_1 = 2$.
   *   Paths $= ^{2+2}C_2 = ^4C_2 = 6$.
2. **Stage 2: $(2,2) \rightarrow (5,4)$**
   *   Right steps $R_2 = 5 - 2 = 3$, Up steps $C_2 = 4 - 2 = 2$.
   *   Paths $= ^{3+2}C_3 = ^5C_3 = ^5C_2 = 10$.
3. Apply Product Rule to combine stages:
   $$\text{Total Paths} = 6 \times 10 = 60$$

**Answer:** **60**

**Shortcut:** $^4C_2 \times ^5C_2 = 6 \times 10 = 60$.

**Common Mistake:** Adding the paths of the two stages ($6 + 10 = 16$) instead of multiplying them.

**Difficulty:** ⭐⭐⭐⭐☆ | **Target Time:** 60 seconds

</details>
