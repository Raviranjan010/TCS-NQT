---
title: "Permutations & Combinations - Shortcuts & Speed Hacks"
section: "Numerical Ability"
---

# Permutation & Combination Shortcuts

## 1. Fast Calculation of $^nC_r$
Instead of writing out the entire formula $\frac{n!}{r!(n-r)!}$, use the descending product trick.

### The Shortcut:
1.  Use the property: $^nC_r = ^nC_{n-r}$ if $r > n/2$ (e.g., replace $^{10}C_8$ with $^{10}C_2$).
2.  Write the numerator by counting down $r$ factors starting from $n$.
3.  Write the denominator as $r!$ (multiplying from $1$ to $r$).

#### Demonstration:
Calculate $^{11}C_3$:
*   Standard: $\frac{11!}{3! \times 8!} = \frac{11 \times 10 \times 9 \times 8!}{6 \times 8!}$
*   Shortcut: Count down 3 numbers from 11 in the numerator, and write $3!$ in the denominator:
    $$\frac{11 \times 10 \times 9}{3 \times 2 \times 1}$$
*   Cancel 9 with 3 (leaving 3) and 10 with 2 (leaving 5):
    $$11 \times 5 \times 3 = 165$$

---

## 2. Dictionary Rank of a Word (No Letter Repetition)
Find the alphabetical rank of a word (e.g., "MOTHER") if all permutations are listed in a dictionary.

### The Cross-Out Shortcut (using "MOTHER"):
1.  **Alphabetize** the letters: `E, H, M, O, R, T` (Positions: E=1, H=2, M=3, O=4, R=5, T=6).
2.  Write the word **MOTHER** and assign factorials from right to left, starting from $0!$ under the last letter:
    ```
    M    O    T    H    E    R
    5!   4!   3!   2!   1!   0!
    ```
3.  For each letter, count how many **unused** letters are alphabetically smaller than it:
    *   **M**: Letters smaller are `E, H` (Count = 2). Cross out M. Remaining: `E, H, O, R, T`.
    *   **O**: Letters smaller are `E, H` (Count = 2). Cross out O. Remaining: `E, H, R, T`.
    *   **T**: Letters smaller are `E, H, R` (Count = 3). Cross out T. Remaining: `E, H, R`.
    *   **H**: Letters smaller is `E` (Count = 1). Cross out H. Remaining: `E, R`.
    *   **E**: No letters smaller (Count = 0). Cross out E. Remaining: `R`.
    *   **R**: No letters smaller (Count = 0). Cross out R.
4.  **Multiply** counts by the factorials and sum:
    $$\text{Sum} = (2 \times 5!) + (2 \times 4!) + (3 \times 3!) + (1 \times 2!) + (0 \times 1!) + (0 \times 0!)$$
    $$\text{Sum} = (2 \times 120) + (2 \times 24) + (3 \times 6) + (1 \times 2) + 0 + 0$$
    $$\text{Sum} = 240 + 48 + 18 + 2 = 308$$
5.  **Final Rank** $= \text{Sum} + 1 = 308 + 1 = 309$.

> 💡 **TCS NQT Save Time**: This takes 20 seconds, whereas writing words out takes 5 minutes.

---

## 3. Dictionary Rank of a Word (With Letter Repetition)
Find the alphabetical rank of a word with duplicate letters (e.g., "INDIA").

### The Modified Cross-Out Shortcut (using "INDIA"):
1.  **Alphabetize** the letters: `A, D, I, I, N`.
2.  Write the word **INDIA** with factorials underneath from right to left:
    ```
    I    N    D    I    A
    4!   3!   2!   1!   0!
    ```
3.  For each letter, count how many letters to its right are alphabetically smaller than it:
    *   **I** (first): Smaller to its right are `D, A` (Count = 2).
    *   **N**: Smaller to its right are `D, I, A` (Count = 3).
    *   **D**: Smaller to its right is `A` (Count = 1).
    *   **I** (second): Smaller to its right is `A` (Count = 1).
    *   **A**: Smaller to its right is None (Count = 0).
4.  **Divide** each term by the duplicate factorials of the letters from that position to the right (inclusive):
    *   At **I** (first position `I-N-D-I-A`): 'I' repeats 2 times $\implies$ divide by $2!$. Term $= \frac{2}{2!} \times 4! = 24$.
    *   At **N** (position `N-D-I-A`): 'I' repeats 2 times $\implies$ divide by $2!$. Term $= \frac{3}{2!} \times 3! = 9$.
    *   At **D** (position `D-I-A`): No duplicates $\implies$ divide by $1!$. Term $= \frac{1}{1!} \times 2! = 2$.
    *   At **I** (second position `I-A`): No duplicates $\implies$ divide by $1!$. Term $= \frac{1}{1!} \times 1! = 1$.
    *   At **A** (position `A`): No duplicates $\implies$ divide by $1!$. Term $= \frac{0}{1!} \times 0! = 0$.
5.  **Sum and Add 1**:
    $$\text{Sum} = 24 + 9 + 2 + 1 + 0 = 36$$
    $$\text{Rank} = 36 + 1 = 37$$

---

## 4. Word Constraints Shortcuts (String vs Gap Methods)

### A. "Together" Constraint (String Method)
If $k$ items must always sit together, treat them as a single "mega-item".

#### Demonstration (using "DIRECTOR", vowels always together):
*   Letters: D, I, R, E, C, T, O, R (Total = 8, R repeats 2 times).
*   Vowels: I, E, O (Total = 3, distinct).
*   Consonants: D, R, C, T, R (Total = 5, R repeats 2 times).
1.  **Tie the vowels**: `(IEO)` becomes 1 item.
2.  **Count items to arrange**: 5 consonants + 1 vowel-block = 6 items (where R repeats 2 times).
    $$\text{Outer arrangements} = \frac{6!}{2!} = \frac{720}{2} = 360$$
3.  **Arrange inside the block**: The 3 vowels `I, E, O` can be arranged in $3! = 6$ ways.
4.  **Multiply**:
    $$\text{Total Ways} = 360 \times 6 = 2160$$

### B. "No Two Together" Constraint (Gap Method)
If specific items must never sit next to each other, place the other items first and insert the restricted items into the gaps.

#### Demonstration (using "DIRECTOR", no two vowels together):
1.  **Arrange the consonants first**: D, R, C, T, R (5 letters, R repeats 2 times).
    $$\text{Consonant Arrangements} = \frac{5!}{2!} = 60$$
2.  **Identify gaps**: There are $5 + 1 = 6$ gaps around the 5 consonants:
    ` _ C_1 _ C_2 _ C_3 _ C_4 _ C_5 _ `
3.  **Choose gaps and arrange vowels**: Select 3 gaps out of the 6 for the 3 distinct vowels:
    $$\text{Ways to place vowels} = ^6C_3 \times 3! = 20 \times 6 = 120$$
4.  **Multiply**:
    $$\text{Total Ways} = 60 \times 120 = 7200$$
