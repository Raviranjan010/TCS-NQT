---
title: "Permutations & Combinations - Timed Practice"
section: "Numerical Ability"
---

# Permutation & Combination Timed Mock Test

### ⏱ Instructions
*   **Time Limit**: 12 minutes (approx. 72 seconds per question).
*   **Format**: Non-MCQ style (Fill-in-the-Blank). Enter numbers only.
*   **Rules**: Do not use calculators. Keep a scratch pad ready.

---

## 📝 Mock Test Questions

**Q1.** A team of 5 members is to be formed from 6 software developers and 4 quality analysts. In how many ways can the team be formed if it must contain exactly 3 software developers?

**Q2.** In a group of 10 people, everyone shakes hands with everyone else, except two people who refuse to shake hands with each other. How many handshakes occur in total?

**Q3.** In how many ways can 5 distinct beads be arranged to make a circular necklace?

**Q4.** Find the number of distinct ways to arrange the letters of the word "MISSISSIPPI".

**Q5.** In how many ways can 8 identical coins be distributed among 4 beggars such that each beggar gets at least one coin?

**Q6.** A robot needs to travel from grid coordinate $(0,0)$ to $(3,3)$ using only Right and Up moves. How many distinct shortest paths are possible?

**Q7.** How many 3-digit numbers divisible by 5 can be formed using the digits $\{2, 3, 5, 6, 8, 9\}$ if digit repetition is not allowed?

**Q8.** How many diagonals can be drawn in a regular pentagon (5-sided polygon)?

**Q9.** In how many ways can the letters of the word "EIGHT" be arranged such that the vowels (E and I) are never together?

**Q10.** What is the alphabetical dictionary rank of the word "NQT"?

---

## 📊 Scoring Guide
*   **8–10 Correct**: 🥇 **NQT Elite** — Excellent speed and conceptual accuracy. Ready for the Advanced section.
*   **6–7 Correct**: 🥈 **NQT Clear** — Good performance, but watch out for small calculation traps.
*   **Under 6 Correct**: 🥉 **Aptitude Builder** — Review the [Shortcuts Guide](file:///d:/Temp/TCS-NQT/01_Numerical_Ability/09_Permutation_Combination/04_Shortcuts.md) and retry the practice sets.

---

## ✅ Collapsible Solutions

<details>
<summary>View Solution to Q1</summary>

**Approach:** Combination selection.
*   Select 3 developers from 6:
    $$^6C_3 = \frac{6 \times 5 \times 4}{3 \times 2 \times 1} = 20$$
*   Select 2 analysts from 4:
    $$^4C_2 = \frac{4 \times 3}{2 \times 1} = 6$$
*   Multiply:
    $$\text{Ways} = 20 \times 6 = 120$$

**Answer:** **120**

</details>

<details>
<summary>View Solution to Q2</summary>

**Approach:** Subtraction from total handshakes.
*   Total handshakes without constraints for 10 people:
    $$^{10}C_2 = \frac{10 \times 9}{2} = 45$$
*   Subtract the 1 handshake that does not occur between the two disputing people:
    $$45 - 1 = 44$$

**Answer:** **44**

</details>

<details>
<summary>View Solution to Q3</summary>

**Approach:** Circular permutation with flip symmetry.
*   Formula: $\frac{(n-1)!}{2}$
*   Calculate:
    $$\frac{(5-1)!}{2} = \frac{4!}{2} = \frac{24}{2} = 12$$

**Answer:** **12**

</details>

<details>
<summary>View Solution to Q4</summary>

**Approach:** Permutation with identical objects.
*   Total letters $n = 11$.
*   Duplicates: 'I' (4 times), 'S' (4 times), 'P' (2 times), 'M' (1 time).
*   Calculate:
    $$\text{Ways} = \frac{11!}{4! 4! 2!} = \frac{11 \times 10 \times 9 \times 8 \times 7 \times 6 \times 5 \times 4!}{4! \times 24 \times 2}$$
    $$\text{Ways} = \frac{11 \times 10 \times 9 \times 8 \times 7 \times 6 \times 5}{48} = 34,650$$

**Answer:** **34650**

</details>

<details>
<summary>View Solution to Q5</summary>

**Approach:** Beggar's method ($1+$ constraint).
*   Formula: $^{N-1}C_{R-1}$ with $N = 8, R = 4$.
*   Calculate:
    $$^{8-1}C_{4-1} = ^7C_3 = \frac{7 \times 6 \times 5}{3 \times 2 \times 1} = 35$$

**Answer:** **35**

</details>

<details>
<summary>View Solution to Q6</summary>

**Approach:** Grid Path formula.
*   Right moves $R = 3$, Up moves $C = 3$.
*   Calculate:
    $$^{3+3}C_3 = ^6C_3 = \frac{6 \times 5 \times 4}{3 \times 2 \times 1} = 20$$

**Answer:** **20**

</details>

<details>
<summary>View Solution to Q7</summary>

**Approach:** Slot filling with divisibility constraint.
*   Set: $\{2, 3, 5, 6, 8, 9\}$ (6 digits). Divisibility by 5 requires units slot to be `5` (1 choice).
*   Units slot: 1 choice (`5`).
*   Hundreds slot: 5 remaining choices.
*   Tens slot: 4 remaining choices.
*   Calculate:
    $$5 \times 4 \times 1 = 20$$

**Answer:** **20**

</details>

<details>
<summary>View Solution to Q8</summary>

**Approach:** Polygon diagonal formula.
*   Sides $n = 5$.
*   Calculate:
    $$D = \frac{5 \times (5 - 3)}{2} = \frac{5 \times 2}{2} = 5$$

**Answer:** **5**

</details>

<details>
<summary>View Solution to Q9</summary>

**Approach:** Complementary counting.
*   Total arrangements of "EIGHT" (5 distinct letters):
    $$5! = 120$$
*   Arrangements where vowels (E, I) are together:
    *   Tie vowels: `(EI)`. Arrange 3 consonants + 1 block $= 4! = 24$.
    *   Arrange inside block: $2! = 2$.
    *   Total together $= 24 \times 2 = 48$.
*   Subtract:
    $$\text{Never together} = 120 - 48 = 72$$

**Answer:** **72**

</details>

<details>
<summary>View Solution to Q10</summary>

**Approach:** Dictionary rank shortcut.
*   Letters: `N, Q, T`. Alphabetical order is `N, Q, T` (already in order).
*   Since the word matches the alphabetical starting sequence, its rank is the very first one: $1$.

**Answer:** **1**

</details>
