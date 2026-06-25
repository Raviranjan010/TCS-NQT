---
title: "Permutations & Combinations - FAQ"
section: "Numerical Ability"
---

# Permutation & Combination FAQ

Here are the answers to the 6 most common questions students ask about Permutations & Combinations for the TCS NQT.

---

### Q1. How do I know whether to use Permutation ($^nP_r$) or Combination ($^nC_r$) in a question?
**Answer**: Ask yourself: **"Does the order of the chosen items matter?"**
*   If yes, use **Permutation**. (e.g. forming a number like 123 vs 321, arranging people in a queue, assigning first/second/third prizes).
*   If no, use **Combination**. (e.g. choosing a committee of 3 people, picking 2 books to read, shaking hands).

---

### Q2. How do duplicate letters affect word arrangements?
**Answer**: If all letters in a word are unique (e.g., "CAT"), they can be arranged in $3! = 6$ ways. If there are duplicates (e.g., "EEE"), swapping the identical letters does not create a new word. To eliminate these redundant duplicates, you must divide by the factorials of each duplicate letter count.
*   "SECRET" has 6 letters, where 'E' repeats twice $\implies \frac{6!}{2!} = 360$ ways.
*   "GOOGLE" has 6 letters, where 'O' repeats twice, and 'G' repeats twice $\implies \frac{6!}{2! 2!} = 180$ ways.

---

### Q3. Why do we split digit formation problems into multiple cases when the digit pool contains `0`?
**Answer**: A valid $k$-digit number cannot start with a leading digit of `0` (e.g., `0123` is a 3-digit number, not 4-digit).
If a question asks for a 4-digit *even* number, the units place must end in an even digit (like `0, 2, 4`).
*   If the number ends in `0`, the thousands place has no risk of choosing `0` (since it is already used in the units place).
*   If the number ends in `2` or `4`, the thousands place still has the risk of choosing `0`, so we must manually exclude `0` from the choices for that position.
To avoid base confusion, we solve `ends-in-0` and `ends-in-other` as separate cases and add the counts.

---

### Q4. When should I divide circular permutations by 2?
**Answer**: Divide by 2 only when the circular arrangement can be flipped over in 3D space, which merges clockwise and counter-clockwise views.
*   **Do NOT divide by 2**: For people sitting around a round table, or keys placed on a fixed ring where side orientations differ. Formula $= (N-1)!$.
*   **DO divide by 2**: For beads on a necklace, flowers on a garland, or a key ring that can be flipped upside down. Formula $= \frac{(N-1)!}{2}$.

---

### Q5. What is the difference between the two Beggar's Method formulas?
**Answer**: The choice of formula depends on whether a group is allowed to receive **zero** items:
*   Use **$^{N+R-1}C_{R-1}$** (unconstrained) if some children/groups can receive 0 items.
*   Use **$^{N-1}C_{R-1}$** (constrained) if every child/group must receive at least 1 item.

---

### Q6. How should I type my answer for P&C questions on the TCS NQT exam screen?
**Answer**: Many P&C questions are non-MCQ Fill-in-the-Blank (FIB) questions.
*   **Rule**: Enter **whole numbers only** (e.g., `120`).
*   Do **NOT** type units, symbols, or spaces (do not write `120 ways`, `120.0`, or `120 `).
*   Typing letters or symbols will cause the automated grading compiler to mark your correct mathematical answer as wrong.
