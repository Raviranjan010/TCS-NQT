---
title: "Permutations & Combinations - Practice Intermediate"
section: "Numerical Ability"
---

# Permutation & Combination Intermediate Practice

## Practice Questions

**Q1.** In how many ways can the letters of the word "LEADER" be arranged such that the vowels are always together?

> 🎯 Hint: Group the vowels E, A, E together as a single unit, and remember that 'E' is repeating.

<details>
<summary>✅ Solution</summary>

**Approach:** String / Tie-Together Method with duplicates.

**Step-by-Step:**
1. Word "LEADER" has $n = 6$ letters.
   *   Vowels: E, A, E (Total = 3, 'E' repeats 2 times).
   *   Consonants: L, D, R (Total = 3, distinct).
2. Tie vowels into a single unit `(EAE)`.
3. Total units to arrange: 3 consonants + 1 block $= 4$ units. All consonants are distinct, so:
   $$\text{Outer Ways} = 4! = 24$$
4. Arrange vowels internally: 3 vowels with 'E' repeating 2 times:
   $$\text{Inner Ways} = \frac{3!}{2!} = 3$$
5. Multiply:
   $$\text{Total Ways} = 24 \times 3 = 72$$

**Answer:** **72**

**Shortcut:** $4! \times \frac{3!}{2!} = 24 \times 3 = 72$.

**Common Mistake:** Forgetting that 'E' is repeated in "LEADER", leading to an outer arrangement of $\frac{4!}{2!}$ or forgetting the division in the inner arrangement.

**Difficulty:** ⭐⭐⭐☆☆ | **Target Time:** 45 seconds

</details>

---

**Q2.** How many distinct diagonals can be drawn in a regular octagon (8-sided polygon)?

> 🎯 Hint: Apply the formula $D = \frac{n(n-3)}{2}$.

<details>
<summary>✅ Solution</summary>

**Approach:** Diagonal formula.

**Step-by-Step:**
1. Identify vertices/sides: $n = 8$.
2. Apply formula:
   $$\text{Diagonals} = \frac{8 \times (8 - 3)}{2}$$
3. Calculate:
   $$\frac{8 \times 5}{2} = 20$$

**Answer:** **20**

**Shortcut:** $^8C_2 - 8 = 28 - 8 = 20$.

**Common Mistake:** Using $^8C_2 = 28$ without subtracting the 8 outer boundary edges.

**Difficulty:** ⭐⭐☆☆☆ | **Target Time:** 30 seconds

</details>

---

**Q3.** A committee of 4 members is to be selected from a group of 5 men and 3 women. In how many ways can this committee be formed if it must contain exactly 2 women?

> 🎯 Hint: Since there are exactly 2 women, the remaining members must be men. Select them independently.

<details>
<summary>✅ Solution</summary>

**Approach:** Independent combinations.

**Step-by-Step:**
1. The committee needs 4 members. It must have exactly 2 women $\implies$ must have exactly 2 men.
2. Select 2 women from 3:
   $$\text{Women Ways} = ^3C_2 = 3$$
3. Select 2 men from 5:
   $$\text{Men Ways} = ^5C_2 = 10$$
4. Apply the Product Rule:
   $$\text{Total Ways} = 3 \times 10 = 30$$

**Answer:** **30**

**Shortcut:** $^3C_2 \times ^5C_2 = 3 \times 10 = 30$.

**Common Mistake:** Adding the combinations ($3 + 10 = 13$) instead of multiplying them.

**Difficulty:** ⭐⭐☆☆☆ | **Target Time:** 35 seconds

</details>

---

**Q4.** In how many ways can 5 executives be seated around a circular conference table?

> 🎯 Hint: Seat one executive first to break rotation symmetry, leaving the rest to be arranged linearly.

<details>
<summary>✅ Solution</summary>

**Approach:** Circular Permutation ($(n-1)!$).

**Step-by-Step:**
1. Identify number of people: $n = 5$.
2. Apply circular formula:
   $$\text{Ways} = (5-1)! = 4!$$
3. Calculate:
   $$4 \times 3 \times 2 \times 1 = 24$$

**Answer:** **24**

**Shortcut:** $4! = 24$.

**Common Mistake:** Using linear permutation $5! = 120$ without accounting for rotational equivalence.

**Difficulty:** ⭐⭐☆☆☆ | **Target Time:** 20 seconds

</details>

---

**Q5.** How many distinct 3-digit numbers can be formed using the digits $\{1, 3, 5, 7, 8\}$ without repeating any digits?

> 🎯 Hint: This is equivalent to choosing and arranging 3 digits from a set of 5 distinct digits.

<details>
<summary>✅ Solution</summary>

**Approach:** Permutation ($^nP_r$).

**Step-by-Step:**
1. Identify variables: $n = 5$ (available digits), $r = 3$ (positions).
2. Apply permutation formula:
   $$^5P_3 = \frac{5!}{(5-3)!} = \frac{5!}{2!}$$
3. Calculate:
   $$5 \times 4 \times 3 = 60$$

**Answer:** **60**

**Shortcut:** $5 \times 4 \times 3 = 60$.

**Common Mistake:** Using combination $^5C_3 = 10$, which ignores the fact that different digit orders form different numbers (e.g. 135 vs 531).

**Difficulty:** ⭐⭐☆☆☆ | **Target Time:** 30 seconds

</details>
