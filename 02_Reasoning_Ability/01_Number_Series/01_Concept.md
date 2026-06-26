# Concept Guide: Number Series

This guide covers the core logical patterns, classifications, and step-by-step methods for solving Number Series problems in the TCS NQT exam.

---

## ⚓ Real-World Anchor: The Stepping Stones

Imagine crossing a river using a path of stepping stones. Each stone is placed at a specific interval. 

```
Stones:        [ 2 ]  ----(+3)---->  [ 5 ]  ----(+5)---->  [ 10 ]  ----(+7)---->  [ 17 ]  ----(+9)---->  [ ? ]
Differences:           +3                     +5                     +7                     +9
```

*   If the spacing grows by a constant amount ($+2$ each time), we can easily predict where the next stone must lie.
*   In the NQT, identifying this "spacing rule" is the key to solving number series questions quickly.

---

## 📐 Formal Definitions & Classifications

Number series are categorized based on the mathematical relation between consecutive terms:

| Series Type | Definition | Mathematical Pattern | Example |
| :--- | :--- | :--- | :--- |
| **Arithmetic Series** | Constant difference between consecutive terms | $T_n = T_{n-1} + d$ | $3, 7, 11, 15, \mathbf{19}\dots$ ($d = +4$) |
| **Geometric Series** | Constant ratio between consecutive terms | $T_n = T_{n-1} \times r$ | $2, 6, 18, 54, \mathbf{162}\dots$ ($r = \times 3$) |
| **Power/Exponent** | Terms are based on squares or cubes | $T_n = n^2 \pm c$ or $n^3 \pm c$ | $2, 5, 10, 17, \mathbf{26}\dots$ ($n^2 + 1$) |
| **Fibonacci-style** | Each term is a function of previous terms | $T_n = T_{n-1} + T_{n-2}$ | $1, 1, 2, 3, 5, 8, \mathbf{13}\dots$ |
| **Alternating Series** | Two distinct series interwoven together | $T_{2n}$ and $T_{2n-1}$ separate | $2, 10, 4, 20, 6, 30, \mathbf{8}\dots$ |

---

## 🎯 Core Insight: Visual Decision Tree

When presented with any number series, follow this path to identify the rule:

```
                         Analyze the Series Flow
                                   |
                   Is the growth slow or explosive?
                                   |
           +-----------------------+-----------------------+
           |                                               |
         [Slow]                                       [Explosive]
   (Check Differences)                             (Check Products/Powers)
           |                                               |
    Is diff constant?                               Is ratio constant?
    - Yes: Arithmetic                               - Yes: Geometric
    - No: Check 2nd level diff                      - No: Check square/cube + offset
```

---

## 🛠️ Step-by-Step Method & Demonstration

To solve a series systematically:
1.  **Check Direction & Speed:** Is it increasing, decreasing, or fluctuating?
2.  **Find Differences (1st Level):** Write down the difference between adjacent terms.
3.  **Find Differences of Differences (2nd Level):** If the 1st level differences don't show a clear pattern, find the differences between those differences.
4.  **Test Alternate Positions:** If the numbers fluctuate up and down, separate odd and even indices.

### Worked Example:
Solve the series: $4, 11, 30, 67, 128, \dots$

*   **Step 1 (First differences):**
    *   $11 - 4 = 7$
    *   $30 - 11 = 19$
    *   $67 - 30 = 37$
    *   $128 - 67 = 61$
    *   *First differences:* $7, 19, 37, 61$ (No obvious pattern)
*   **Step 2 (Second differences):**
    *   $19 - 7 = 12$
    *   $37 - 19 = 18$
    *   $61 - 37 = 24$
    *   *Second differences:* $12, 18, 24$ (These are multiples of 6!)
*   **Step 3 (Extend pattern):**
    *   Next second difference $= 30$
    *   Next first difference $= 61 + 30 = 91$
    *   Next term $= 128 + 91 = 219$
*   **Alternative Power Check:** Notice that $1^3 + 3 = 4$, $2^3 + 3 = 11$, $3^3 + 3 = 30$, $4^3 + 3 = 67$.
    *   Therefore, the 6th term is $6^3 + 3 = 216 + 3 = 219$.

---

## ✏️ TCS NQT Solved Questions

### Question 1 (Squares with Constant Offset)
*   **Question:** Find the next term in the series: $2, 9, 28, 65, 126, \dots$
*   **Solution:**
    1.  Analyze values: They are close to perfect cubes.
    2.  Write down cubes: $1^3=1, 2^3=8, 3^3=27, 4^3=64, 5^3=125$.
    3.  Find the offset:
        $$1^3 + 1 = 2$$
        $$2^3 + 1 = 9$$
        $$3^3 + 1 = 28$$
        $$4^3 + 1 = 65$$
        $$5^3 + 1 = 126$$
    4.  Next term is $6^3 + 1 = 216 + 1 = 217$.
*   **Answer:** $217$

### Question 2 (Prime Number Differences)
*   **Question:** Find the missing term: $4, 6, 9, 14, 21, 32, \dots$
*   **Solution:**
    1.  Calculate differences:
        *   $6 - 4 = 2$
        *   $9 - 6 = 3$
        *   $14 - 9 = 5$
        *   $21 - 14 = 7$
        *   $32 - 21 = 11$
    2.  The differences sequence is $2, 3, 5, 7, 11$, which are consecutive **prime numbers**.
    3.  The next prime number is $13$.
    4.  Next term $= 32 + 13 = 45$.
*   **Answer:** $45$

### Question 3 (Alternating Interwoven Series)
*   **Question:** Complete the sequence: $3, 4, 5, 12, 7, 36, 9, \dots$
*   **Solution:**
    1.  Observe fluctuation: The numbers go up and down. This suggests an alternating series.
    2.  Split into odd and even positions:
        *   Odd positions: $3, 5, 7, 9 \dots$ (Arithmetic progression with $+2$)
        *   Even positions: $4, 12, 36 \dots$ (Geometric progression with $\times 3$)
    3.  The next missing term is at an even position (8th term).
    4.  Next term $= 36 \times 3 = 108$.
*   **Answer:** $108$
