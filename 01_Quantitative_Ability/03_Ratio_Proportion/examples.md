# Ratio & Proportion — Worked Examples

This document contains 5 detailed, step-by-step worked examples representing common ratio, partnership, and alligation questions in the TCS NQT.

---

## Example 1 — Age Calculations using Ratios

### Problem Statement
The ratio of the ages of A and B is $4:5$. Six years hence, the ratio of their ages will become $11:13$. What is the present age of B?

### Step-by-Step Solution

1.  **Define Present Ages:**
    Let the present age of A be $4x$ and B be $5x$.

2.  **Formulate the Equation for Six Years Later:**
    *   Age of A six years later = $4x + 6$.
    *   Age of B six years later = $5x + 6$.
    *   The new ratio is given as $11:13$:
        $$\frac{4x + 6}{5x + 6} = \frac{11}{13}$$

3.  **Cross-Multiply and Solve for $x$:**
    $$13(4x + 6) = 11(5x + 6)$$
    $$52x + 78 = 55x + 66$$
    $$78 - 66 = 55x - 52x$$
    $$12 = 3x \implies x = 4$$

4.  **Find B's Present Age:**
    *   B's present age = $5x = 5 \times 4 = 20$ years.

### Final Answer
The present age of B is **20 years**.

---

## Example 2 — Partnership Profit Distribution

### Problem Statement
A, B, and C invest capital in the ratio $5:6:8$. At the end of the business year, they receive profits in the ratio $5:3:12$. Find the ratio of time periods for which they invested their capital.

### Step-by-Step Solution

1.  **Recall the Partnership Rule:**
    $$\text{Profit} = \text{Investment} \times \text{Time}$$
    $$\text{Time} = \frac{\text{Profit}}{\text{Investment}}$$

2.  **Define the Ratios:**
    *   Investment ratio ($I_A : I_B : I_C$) = $5:6:8$.
    *   Profit ratio ($P_A : P_B : P_C$) = $5:3:12$.

3.  **Calculate the Time Ratio ($T_A : T_B : T_C$):**
    $$T_A : T_B : T_C = \frac{P_A}{I_A} : \frac{P_B}{I_B} : \frac{P_C}{I_C}$$
    $$T_A : T_B : T_C = \frac{5}{5} : \frac{3}{6} : \frac{12}{8}$$
    $$T_A : T_B : T_C = 1 : \frac{1}{2} : \frac{3}{2}$$

4.  **Convert to Integer Ratio (Multiply by 2):**
    $$T_A : T_B : T_C = 2 : 1 : 3$$

### Final Answer
The ratio of their investment time periods was **2 : 1 : 3**.

---

## Example 3 — Alligation Application on Profit Margin

### Problem Statement
A merchant has 100 kg of sugar, part of which he sells at $8\%$ profit and the rest at $18\%$ profit. He gains $14\%$ on the whole. What is the quantity of sugar sold at $18\%$ profit?

### Step-by-Step Solution

1.  **Identify the Variables for Alligation:**
    *   Cheaper profit rate ($C$) = $8\%$
    *   Dearer profit rate ($D$) = $18\%$
    *   Mean profit rate ($M$) = $14\%$

2.  **Apply the Alligation Formula:**
    $$\frac{\text{Quantity at Cheaper (8\%)}}{\text{Quantity at Dearer (18\%)}} = \frac{D - M}{M - C}$$
    $$\text{Ratio} = \frac{18 - 14}{14 - 8} = \frac{4}{6} = \frac{2}{3}$$
    *   Therefore, the ratio of quantities is $2:3$.

3.  **Determine the Quantity Sold at 18%:**
    *   Total sugar = 100 kg.
    *   Sum of ratio parts = $2 + 3 = 5$.
    *   Quantity at $18\%$ profit = $\frac{3}{5} \times 100 = 60$ kg.

### Final Answer
The quantity of sugar sold at $18\%$ profit was **60 kg**.

---

## Example 4 — Successive Dilution of Acid

### Problem Statement
A container contains 40 liters of pure hydrochloric acid. 4 liters of acid is drawn out and replaced with water. This process is repeated two more times. How many liters of pure acid are left in the container now?

### Step-by-Step Solution

1.  **Identify the Variables:**
    *   Initial volume ($Q_0$) = 40 liters.
    *   Volume removed/replaced ($x$) = 4 liters.
    *   Number of cycles ($n$) = 3 (since it was done once, and then repeated two *more* times).

2.  **Apply the Successive Replacement Formula:**
    $$Q_3 = Q_0 \times \left(1 - \frac{x}{V}\right)^3$$
    $$Q_3 = 40 \times \left(1 - \frac{4}{40}\right)^3$$
    $$Q_3 = 40 \times \left(1 - \frac{1}{10}\right)^3$$
    $$Q_3 = 40 \times (0.9)^3$$

3.  **Perform the Calculation:**
    $$Q_3 = 40 \times 0.729$$
    $$Q_3 = 4 \times 7.29 = 29.16 \text{ liters}$$

### Final Answer
The volume of pure acid left in the container is **29.16 liters**.

---

## Example 5 — Coin Ratio Calculations

### Problem Statement
A bag contains coins of 1 Rupee, 50 Paise, and 25 Paise in the ratio $5:6:8$. If the total value of these coins is 210 Rupees, find the number of 50 Paise coins.

### Step-by-Step Solution

1.  **Convert Denominations to Rupees:**
    *   1 Rupee = 1.00 Rupee.
    *   50 Paise = 0.50 Rupee.
    *   25 Paise = 0.25 Rupee.

2.  **Define Coin Counts using Ratios:**
    Let the number of 1 Rupee, 50p, and 25p coins be $5x$, $6x$, and $8x$ respectively.

3.  **Formulate the Value Equation:**
    $$\text{Value} = (5x \times 1.00) + (6x \times 0.50) + (8x \times 0.25) = 210$$
    $$5x + 3x + 2x = 210$$
    $$10x = 210 \implies x = 21$$

4.  **Find the Count of 50 Paise Coins:**
    *   Number of 50 Paise coins = $6x = 6 \times 21 = 126$ coins.

### Final Answer
The number of 50 Paise coins in the bag is **126**.
