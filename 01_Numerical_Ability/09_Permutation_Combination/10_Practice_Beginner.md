---
title: "Permutations & Combinations - Practice Beginner"
section: "Numerical Ability"
---

# Permutation & Combination Beginner Practice

## Practice Questions

**Q1.** In how many ways can the letters of the word "MATH" be arranged?

> 🎯 Hint: Count the total number of distinct letters and arrange them linearly.

<details>
<summary>✅ Solution</summary>

**Approach:** Linear permutation of distinct objects ($n!$).

**Step-by-Step:**
1. Word "MATH" has $n = 4$ letters. All are distinct.
2. Apply factorial formula:
   $$\text{Total Arrangements} = 4!$$
3. Calculate:
   $$4 \times 3 \times 2 \times 1 = 24$$

**Answer:** **24**

**Shortcut:** $4! = 24$.

**Common Mistake:** Confusing it with combination and selecting.

**Difficulty:** ⭐☆☆☆☆ | **Target Time:** 15 seconds

</details>

---

**Q2.** A fruit basket contains 6 different fruits. In how many ways can you choose exactly 2 fruits from the basket?

> 🎯 Hint: Order of selection does not matter; use the basic combination formula.

<details>
<summary>✅ Solution</summary>

**Approach:** Combination selection ($^nC_r$).

**Step-by-Step:**
1. Identify variables: $n = 6$ (total fruits), $r = 2$ (to select).
2. Set up combination:
   $$\text{Ways} = ^6C_2$$
3. Compute using the shortcut:
   $$\text{Ways} = \frac{6 \times 5}{2 \times 1} = 15$$

**Answer:** **15**

**Shortcut:** $\frac{6 \times 5}{2} = 15$.

**Common Mistake:** Using permutations ($^6P_2 = 30$) which double-counts selections.

**Difficulty:** ⭐☆☆☆☆ | **Target Time:** 20 seconds

</details>

---

**Q3.** In how many ways can 4 people sit on a row of 4 chairs?

> 🎯 Hint: This is an arrangement of 4 distinct people in 4 linear positions.

<details>
<summary>✅ Solution</summary>

**Approach:** Linear permutation ($n!$).

**Step-by-Step:**
1. Identify number of people: $n = 4$.
2. Calculate:
   $$4! = 24$$

**Answer:** **24**

**Shortcut:** $4! = 24$.

**Common Mistake:** Subtracting 1 for circular seating, which only applies to round table arrangements.

**Difficulty:** ⭐☆☆☆☆ | **Target Time:** 15 seconds

</details>

---

**Q4.** There are 8 tennis players at a tournament. If every player plays a match against every other player exactly once, how many matches are played in total?

> 🎯 Hint: A match requires selecting exactly 2 players from the group of 8.

<details>
<summary>✅ Solution</summary>

**Approach:** Combination selection of pairs ($^nC_2$).

**Step-by-Step:**
1. Identify variables: $n = 8$ (players).
2. Set up combination:
   $$\text{Matches} = ^8C_2$$
3. Compute:
   $$\text{Matches} = \frac{8 \times 7}{2 \times 1} = 28$$

**Answer:** **28**

**Shortcut:** $\frac{n(n-1)}{2} = \frac{8 \times 7}{2} = 28$.

**Common Mistake:** Multiplying $8 \times 7 = 56$, which double-counts each match (e.g. Player 1 vs Player 2 and Player 2 vs Player 1).

**Difficulty:** ⭐☆☆☆☆ | **Target Time:** 20 seconds

</details>

---

**Q5.** In how many distinct ways can the letters of the word "BEE" be arranged?

> 🎯 Hint: Divide the total factorial by the factorial of the repeating letter.

<details>
<summary>✅ Solution</summary>

**Approach:** Permutation with identical objects ($\frac{n!}{p!}$).

**Step-by-Step:**
1. Count total letters: $n = 3$.
2. Count repeating letter: 'E' repeats 2 times.
3. Apply formula:
   $$\text{Ways} = \frac{3!}{2!}$$
4. Calculate:
   $$\frac{6}{2} = 3$$

**Answer:** **3**

**Shortcut:** $3 \times 1 = 3$.

**Common Mistake:** Writing $3! = 6$ without dividing by duplicate 'E's.

**Difficulty:** ⭐☆☆☆☆ | **Target Time:** 15 seconds

</details>
