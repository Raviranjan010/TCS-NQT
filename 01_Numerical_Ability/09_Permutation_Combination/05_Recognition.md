---
title: "Permutations & Combinations - Pattern Recognition Guide"
section: "Numerical Ability"
---

# Permutation & Combination Pattern Recognition

## 1. The 5-Second Identification Rule
During the TCS NQT, you have an average of 75 seconds per question. To succeed, you must classify the problem within the first 5 seconds of reading it using these key phrase triggers.

```
                           Read the Question
                                   |
              Look for the Core Action Verb in the sentence
                                   |
         +-------------------------+-------------------------+
         |                                                   |
      ARRANGE / FORM                                      SELECT / CHOOSE
         |                                                   |
         v                                                   v
    PERMUTATION                                         COMBINATION
  - "Find number of words..."                         - "Select a committee..."
  - "Form a 4-digit number..."                        - "A hand of cards..."
  - "People seated in a row..."                       - "Handshakes in a room..."
  - "Letters of the word..."                          - "Draw green and red balls..."
```

---

## 2. Key Phrase to Math Setup Translation Chart

| If the NQT question says... | It implies this category... | Use this formula / method... |
| :--- | :--- | :--- |
| **"vowels must occupy odd positions"** | Position-Constrained Permutation | 1. Identify and count the odd index slots.<br>2. Arrange vowels in these slots ($^{slots}P_{vowels}$).<br>3. Arrange consonants in remaining slots. |
| **"no two vowels are together"** | Mutual Exclusion Permutation | **Gap Method**: Arrange consonants first, then place vowels in the gaps. |
| **"vowels are always together"** | Block Permutation | **String Method**: Group vowels into 1 unit. Arrange the group and other letters, then arrange vowels internally. |
| **"find the rank of word X"** | Lexicographical Order | **Dictionary Rank Shortcut**: Cross-out method with descending factorials (and division by repetitions if duplicate letters). |
| **"how many diagonals"** | Polygon Geometry | $$D = \frac{n(n-3)}{2}$$ |
| **"N collinear points out of M"** | Constrained Geometry | **Lines**: $^{M}C_2 - ^{N}C_2 + 1$<br>**Triangles**: $^{M}C_3 - ^{N}C_3$ |
| **"handshakes between everyone"** | Pairwise Combinations | $$H = \frac{N(N-1)}{2}$$ |
| **"distribute N identical items"** | Non-distinct Partitioning | **Beggar's Method**: $^{N+R-1}C_{R-1}$ (if $0+$) or $^{N-1}C_{R-1}$ (if each gets $\ge 1$). |
| **"robot paths / grid directions"** | Identical Step Arrangement | **Grid Paths**: $^{R+C}C_R$ |
| **"at least one item"** | Power set selection | **Distinct**: $2^N - 1$<br>**Duplicates of size $p, q$**: $(p+1)(q+1) - 1$ |
| **"round table seating"** | Circular Arrangement | **Relative Order**: $(N-1)!$ |
| **"beads / flowers on a loop"** | Circular Symmetry | **Flipped Circle**: $\frac{(N-1)!}{2}$ |

---

## 3. Trigger Word Match Scenarios

### Scenario A: Word Arrangements
*   *Trigger Word*: `"Vowels together"` $\implies$ String Method.
*   *Trigger Word*: `"Vowels never together"` or `"No two vowels adjacent"` $\implies$ Gap Method.
*   *Trigger Word*: `"Letters of word ARRANGEMENT"` $\implies$ Permutation with repetitions.

### Scenario B: Numbers / Digits
*   *Trigger Word*: `"Form even numbers without repeating digits"` $\implies$ Base-10 slot filling. Always fill the units slot first (restricted position), followed by the highest position (which cannot be 0).
*   *Trigger Word*: `"Divisible by 5"` $\implies$ Last slot must be `0` or `5`. Calculate these two cases separately if repeating is not allowed to prevent base confusion.

### Scenario C: Groups / Bins
*   *Trigger Word*: `"Identical coins/balls to distinct people"` $\implies$ Beggar's Method (Stars & Bars).
*   *Trigger Word*: `"Distinct toys to distinct children"` $\implies$ Power Distribution ($R^N$ where $R$ is choices per toy).
*   *Trigger Word*: `"Select a committee containing at least 2 women"` $\implies$ Sum of combinations over each valid case ($W_2M_{rem} + W_3M_{rem} + \dots$).
