---
title: "Permutations & Combinations - Revision Guides"
section: "Numerical Ability"
---

# Permutation & Combination Revision Guide

---

### ⚡ 1-Minute Revision
*   **Permutations vs Combinations**: Permutations are for *order-sensitive arrangements* (AB $\neq$ BA); Combinations are for *selection-only groupings* ({A, B} $\equiv$ {B, A}).
*   **Fundamental Principles**: Connected by **AND** $\implies$ Multiply ($m \times n$); Connected by **OR** $\implies$ Add ($m + n$).
*   **Seating Symmetry**: Linear row seating is $N!$; Circular table seating is $(N-1)!$; Garland/necklace seating is $\frac{(N-1)!}{2}$.
*   **Beggar's (Stars & Bars)**: No constraints (can get $0$) $\implies$ $^{N+R-1}C_{R-1}$; Positive constraint (each gets $\ge 1$) $\implies$ $^{N-1}C_{R-1}$.
*   **Dictionary Rank**: Assign descending factorials right-to-left, write the count of smaller unused characters to the right, multiply, sum, and add 1.

---

### ⏱ 5-Minute Revision
Review these key formulas and applications:

1.  **Duplicate Permutations**:
    $$\text{Ways} = \frac{N!}{p! q! r!}$$
    *   *Example*: Arrange letters of "ERROR" $\implies \frac{5!}{3!} = 20\text{ ways}$ ('R' repeats 3 times).
2.  **Handshakes & Polygons**:
    $$\text{Handshakes} = ^nC_2, \quad \text{Diagonals} = ^nC_2 - n$$
    *   *Example*: Decagon (10 vertices) diagonals $\implies ^{10}C_2 - 10 = 45 - 10 = 35$.
3.  **Grid Paths**:
    $$\text{Paths} = ^{R+C}C_R$$
    *   *Example*: Paths from $(0,0)$ to $(3,2) \implies ^{3+2}C_3 = ^5C_3 = 10$.
4.  **Together Constraint (String Method)**:
    *   *Example*: Arrange "DOG" such that vowels (O) are together. Treat (O) as 1. Total units to arrange $= 3 \implies 3! \times 1! = 6$.

---

### 📖 15-Minute Revision
Review this conceptual summary and attempt the 3 quick questions.

#### Concept Recap:
P&C is about logical partitions. For digit formation, always evaluate if `0` is in the set. If yes, the highest place value slot cannot contain `0`, which forces you to split odd/even configurations into separate cases depending on whether `0` was used in the units place. For word arrangements, check if vowels are together (string method) or separated (gap method). In grid pathing, if a path must pass through a mid-point, multiply the paths of the two distinct legs.

#### Quick Test Questions:

**Q1.** How many 3-letter words can be formed from the letters of the word "COMPUTER" (8 distinct letters) if repetition is not allowed?
*   *Solution*: Selecting and arranging 3 letters from 8:
    $$^8P_3 = 8 \times 7 \times 6 = 336$$

**Q2.** In how many ways can 6 unique keys be arranged on a circular key ring?
*   *Solution*: A key ring can be flipped over, so use the flipped circular permutation formula:
    $$\frac{(n-1)!}{2} = \frac{(6-1)!}{2} = \frac{5!}{2} = \frac{120}{2} = 60$$

**Q3.** Find the rank of the word "CAT" in a dictionary.
*   *Solution*: Alphabetical: `A, C, T`.
    *   **C**: Smaller to right is `A` (Count = 1) $\implies 1 \times 2! = 2$.
    *   **A**: Smaller to right is None (Count = 0) $\implies 0 \times 1! = 0$.
    *   **T**: Smaller to right is None (Count = 0) $\implies 0 \times 0! = 0$.
    *   Rank $= 2 + 0 + 0 + 1 = 3$.

---

### 🌙 Night-Before-Exam Revision
*   **Formula Check**: Make sure you remember the Beggar's Method formulas and don't mix up $N$ and $R$.
*   **Word Rank Check**: Remember to divide by duplicate factorials when calculating dictionary rank for repeating words (e.g. "INDIA" $\implies$ divide by $2!$ for 'I').
*   **Top 3 Traps to Avoid**:
    1.  Entering percentage symbols or currency units into non-MCQ blanks. (Only enter the raw numerical result).
    2.  Forgetting to divide circular necklaces or garlands by 2.
    3.  Applying $^nC_r$ instead of $^nP_r$ when the order of selection matters (e.g., number formation).

---

### 🏃 Exam-Hall Revision (30 seconds)
Use this single comparison table for rapid reference right before entering the exam:

| Question Wording | Core Formula | Speed Hack / Check |
| :--- | :--- | :--- |
| **"Arrangements with duplicates"** | $\frac{N!}{p! q! r!}$ | Look for duplicate letter counts first. |
| **"At least one item chosen"** | $2^N - 1$ | If distinct. For duplicates: $(p+1)(q+1)\dots - 1$. |
| **"A and B always together"** | $2! \times (N-1)!$ | Treat A and B as 1 unit. |
| **"A and B never together"** | $\text{Total} - \text{Together}$ | Or use Gap method if multiple items are restricted. |
| **"Beggar's: Each gets at least 1"** | $^{N-1}C_{R-1}$ | N stars, R beggars. Make sure items are identical. |
| **"Beggar's: Each gets at least 0"** | $^{N+R-1}C_{R-1}$ | Stars and bars alignment. |
