---
title: "Permutations & Combinations - Visual Learning Guide"
section: "Numerical Ability"
---

# Permutation & Combination Visual Learning Guide

## 1. Concept Strategy Decision Tree
Use this decision tree during the exam to instantly identify whether a counting problem requires a permutation or a combination formula.

```
                           Read the Question
                                   |
                Does the order of items matter?
                                   |
         +-------------------------+-------------------------+
         | (Yes)                                             | (No)
         v                                                   v
   PERMUTATION (Arrangement)                           COMBINATION (Selection)
         |                                                   |
   Are items placed in a circle?                       Are items divided into groups?
         |                                                   |
  +------+------+                                     +------+------+
  | (Yes)       | (No)                                | (Yes)       | (No)
  v             v                                     v             v
Circular P.   Linear P.                             Beggar's/     Simple nCr
(n-1)!        n! / (n-r)!                           Group division
```

---

## 2. Word Arrangement Constraints Flowchart
Follow this logic when dealing with word problems that impose constraints on specific letters (like vowels).

```
                      Word Constraint Problem
                                 |
                 Are specific letters restricted?
                                 |
         +-----------------------+-----------------------+
         | (Yes)                                         | (No)
         v                                               v
   What is the constraint type?                    Arrangement of duplicates:
         |                                         Total! / (Duplicate_1! * Duplicate_2!)
         +-----------------------+
         |                       |
   "Always Together"       "Never Together"
         v                       v
    TIE-TOGETHER /           GAP METHOD
    STRING METHOD                |
         |                       v
         v                  1. Arrange remaining letters first.
   1. Tie group as 1 unit.  2. Identify "gaps" between them (N + 1 gaps).
   2. Arrange overall items. 3. Select gaps for restricted letters:
   3. Arrange within group.     Total Ways = (Arranged_Rem) * (Gaps_Selection) * (Arranged_Restricted)
```

---

## 3. Comparison Table: Linear vs Circular Permutations

| Arrangement Type | Visual Model | Distinct Directions | Mathematical Formula | Worked Example ($N=4$) |
| :--- | :--- | :--- | :--- | :--- |
| **Linear** | `[A] - [B] - [C] - [D]` | Start and end points are fixed. | $$P = N!$$ | Arranging 4 people in a row: $4! = 24$. |
| **Circular (People)** | Circular table (relative spacing matters). | Clockwise $\neq$ Counter-clockwise (Left vs Right neighbors change). | $$P = (N - 1)!$$ | Arranging 4 people at a round table: $(4-1)! = 6$. |
| **Circular (Beads)** | Garland / Necklace (can be flipped). | Clockwise $\equiv$ Counter-clockwise (Flipping turns CW into CCW). | $$P = \frac{(N - 1)!}{2}$$ | Arranging 4 unique beads on a string: $\frac{(4-1)!}{2} = 3$. |

---

## 4. Pattern Recognition Chart
Instant translation keys for the NQT exam:

| If you see this phrasing in the question: | Translate it mathematically to: | Action: |
| :--- | :--- | :--- |
| *"In how many ways can letters of word X be arranged..."* | Permutation with duplicates | $\frac{\text{Total Length}!}{\prod (\text{Count of each letter}!)}$ |
| *"vowels are always together"* | String Method | Group vowels as 1 item. Find total ways. |
| *"no two vowels are together"* | Gap Method | Arrange consonants. Insert vowels in gaps. |
| *"At least one item is chosen"* | Subset selection | $2^n - 1$ (if distinct); $(p+1)(q+1)\dots - 1$ (if identical). |
| *"Number of handshakes in a room of N people"* | Pairwise selection | $^nC_2 = \frac{n(n-1)}{2}$ |
| *"Number of diagonals in an N-sided polygon"* | Points minus lines | $^nC_2 - n = \frac{n(n-3)}{2}$ |
| *"X identical coins distributed to Y beggars"* | Beggar's Method | $^{N+R-1}C_{R-1}$ (if $0+$ allowed); $^{N-1}C_{R-1}$ (if $\ge 1$ required). |
| *"Find the rank of word X in a dictionary"* | Dictionary Rank | Alphabetize, count preceding permutations, sum. |
