# TCS NQT 2026 — Numerical Ability Study Notes & PYQs
**Prep Focus: Quantitative Aptitude (20 Questions, 25 Minutes)**

This guide provides speed math tricks, topic summaries, and Previous Year Questions (PYQs) with step-by-step shortcuts to help you clear the Numerical Ability section.

---

## ⚡ Speed Math & Calculation Shortcuts

### 1. The Digital Sum (Root Sum) Technique
* Use this to check options for complex calculations (multiplication, division, percentages).
* **Concept**: Sum the digits of a number until a single digit is left. (Ignore 9s; they sum to 0 in digital sum).
* *Example*: $234 \times 56 = 13104$
  * Digital sum of $234 = 2+3+4 = 9 \equiv 0$
  * Digital sum of $56 = 5+6 = 11 \to 1+1 = 2$
  * Product digital sum $= 0 \times 2 = 0$ (or 9)
  * Verify RHS: $1+3+1+0+4 = 9 \equiv 0$. Verified!

### 2. Fraction to Percentage Conversions
Memorize these to solve Profit/Loss, SI/CI, and Data Interpretation in seconds:
* $1/2 = 50\%$
* $1/3 = 33.33\%$
* $1/4 = 25\%$
* $1/5 = 20\%$
* $1/6 = 16.67\%$
* $1/7 = 14.28\%$
* $1/8 = 12.5\%$
* $1/9 = 11.11\%$
* $1/11 = 9.09\%$
* $1/12 = 8.33\%$

### 3. Divisibility Shortcuts
* **Divisibility by 7**: Double the last digit and subtract it from the remaining number. If the result is divisible by 7, the number is.
* **Divisibility by 11**: Difference between sum of digits at odd places and even places must be $0$ or a multiple of $11$.
* **Divisibility by 13**: Multiply the last digit by 4 and add it to the remaining digits. Repeat if needed.

---

## 📘 Topic-wise Formulas & Solved PYQs

### 1. Number Systems & Divisibility
* **Concept**: Remainder Theorem, Units Digit, trailing zeroes.
* **Unit Digit Pattern**: $2, 3, 7, 8$ have a cyclicity of 4. $0, 1, 5, 6$ stay the same. $4$ and $9$ have cyclicity of 2.

> [!TIP]
> **TCS NQT PYQ 1**: Find the unit digit of $7^{95} - 3^{58}$.
> * **Solution**: 
>   * Cyclicity of 7 is 4. Divide power 95 by 4. Remainder $= 3$. So, unit digit of $7^{95} = 7^3 = 343 \to 3$.
>   * Cyclicity of 3 is 4. Divide power 58 by 4. Remainder $= 2$. So, unit digit of $3^{58} = 3^2 = 9$.
>   * Unit digit difference $= 3 - 9 = -6$. 
>   * Since unit digit cannot be negative, add 10: $-6 + 10 = 4$.
>   * **Answer**: `4`

---

### 2. HCF & LCM
* **Formula**: $\text{Product of two numbers} = \text{HCF} \times \text{LCM}$
* **For Fractions**: 
  * $\text{HCF} = \frac{\text{HCF of numerators}}{\text{LCM of denominators}}$
  * $\text{LCM} = \frac{\text{LCM of numerators}}{\text{HCF of denominators}}$

> [!TIP]
> **TCS NQT PYQ 2**: Three bells toll together at intervals of 9, 12, and 15 minutes respectively. If they toll together now, after how many hours will they toll together next?
> * **Solution**:
>   * Find LCM of 9, 12, and 15.
>   * $9 = 3^2$
>   * $12 = 2^2 \times 3$
>   * $15 = 3 \times 5$
>   * $\text{LCM} = 2^2 \times 3^2 \times 5 = 4 \times 9 \times 5 = 180\text{ minutes}$.
>   * Convert to hours: $180 / 60 = 3\text{ hours}$.
>   * **Answer**: `3`

---

### 3. Percentages, Profit & Loss
* **Successive Percentage Change Formula**: $x + y + \frac{xy}{100}$
* **Profit/Loss**: 
  * $\text{Profit \%} = \frac{SP - CP}{CP} \times 100$
  * $\text{Discount \%} = \frac{MP - SP}{MP} \times 100$ (Discount is always calculated on Marked Price).
* **Faulty Weights**: $\text{Profit \%} = \frac{\text{True Weight} - \text{False Weight}}{\text{False Weight}} \times 100$

> [!TIP]
> **TCS NQT PYQ 3**: A merchant buys goods at $25\%$ cheaper than list price and sells them at $10\%$ dearer than list price. What is his percentage profit?
> * **Solution**:
>   * Let List Price $= 100$.
>   * Cost Price (CP) $= 100 - 25\% \text{ of } 100 = 75$.
>   * Selling Price (SP) $= 100 + 10\% \text{ of } 100 = 110$.
>   * Profit $= 110 - 75 = 35$.
>   * Profit % $= (35 / 75) \times 100 = (7/15) \times 100 = 46.67\%$.
>   * **Answer** (if FIB): `47` (or `46.67` as specified in prompt)

---

### 4. Simple & Compound Interest
* **Simple Interest (SI)**: $SI = \frac{P \times R \times T}{100}$
* **Compound Interest (CI)**: $Amount = P(1 + \frac{R}{100})^T$
* **Difference between CI and SI for 2 Years**: $CI - SI = P(\frac{R}{100})^2$
* **Difference between CI and SI for 3 Years**: $CI - SI = P(\frac{R}{100})^2 (3 + \frac{R}{100})$

> [!TIP]
> **TCS NQT PYQ 4**: The difference between simple interest and compound interest compounded annually on a sum of money for 2 years at $10\%$ per annum is ₹65. Find the sum.
> * **Solution**:
>   * Use formula: $CI - SI = P(R/100)^2$
>   * $65 = P(10/100)^2$
>   * $65 = P(1/10)^2 \implies 65 = P/100$
>   * $P = 6500$.
>   * **Answer**: `6500`

---

### 5. Ratio, Proportion & Averages
* **Concept**: Partnership: $\text{Ratio of Profit} = \text{Ratio of (Investment} \times \text{Time)}$
* **Average of Speed (Equal Distances)**: $\text{Average Speed} = \frac{2xy}{x+y}$

> [!TIP]
> **TCS NQT PYQ 5**: A, B, and C enter into partnership. A invests 3 times as much as B and B invests two-third of what C invests. At the end of year, total profit is ₹6600. What is B's share?
> * **Solution**:
>   * Let C's investment $= 3x$.
>   * Then B's investment $= (2/3) \times 3x = 2x$.
>   * A's investment $= 3 \times 2x = 6x$.
>   * Ratio of investment (A:B:C) $= 6:2:3$.
>   * Total parts $= 6 + 2 + 3 = 11$.
>   * B's share $= (2/11) \times 6600 = 2 \times 600 = 1200$.
>   * **Answer**: `1200`

---

### 6. Time and Work
* **Concept**: Efficiency is inversely proportional to time taken. $\text{Total Work} = \text{Efficiency} \times \text{Time}$
* **Formula**: $\frac{M_1 D_1 H_1}{W_1} = \frac{M_2 D_2 H_2}{W_2}$

> [!TIP]
> **TCS NQT PYQ 6**: A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is:
> * **Solution**:
>   * LCM of 15 and 20 $= 60$ (Total Work).
>   * Efficiency of A $= 60/15 = 4$.
>   * Efficiency of B $= 60/20 = 3$.
>   * Combined Efficiency $= 4 + 3 = 7$.
>   * Work done in 4 days $= 7 \times 4 = 28$.
>   * Work left $= 60 - 28 = 32$.
>   * Fraction of work left $= 32 / 60 = 8 / 15$.
>   * **Answer**: `8/15` (or decimal equivalents if specified)

---

### 7. Time, Speed & Distance
* **Formula**: $\text{Speed} = \text{Distance} / \text{Time}$
* **Conversion**: $1\text{ km/h} = \frac{5}{18}\text{ m/s}$; $1\text{ m/s} = \frac{18}{5}\text{ km/h}$
* **Relative Speed**:
  * Opposite directions: Add speeds ($S_1 + S_2$)
  * Same direction: Subtract speeds ($S_1 - S_2$)
* **Boats and Streams**: 
  * Downstream Speed $= U + V$
  * Upstream Speed $= U - V$ (where $U$ is speed of boat in still water and $V$ is stream speed).

> [!TIP]
> **TCS NQT PYQ 7**: A train 150m long passes a pole in 15 seconds and another train of same length travelling in opposite direction in 8 seconds. What is the speed of the second train in km/h?
> * **Solution**:
>   * Speed of Train 1 ($S_1$) $= \text{Distance} / \text{Time} = 150 / 15 = 10\text{ m/s}$.
>   * When passing each other in opposite directions:
>     * $\text{Total Distance} = D_1 + D_2 = 150 + 150 = 300\text{ m}$.
>     * Relative Speed $= S_1 + S_2 = 10 + S_2$.
>     * Time $= 8\text{ seconds}$.
>     * $300 / (10 + S_2) = 8 \implies 300 = 80 + 8 \cdot S_2 \implies 8 \cdot S_2 = 220 \implies S_2 = 27.5\text{ m/s}$.
>   * Convert to km/h: $27.5 \times (18/5) = 5.5 \times 18 = 99\text{ km/h}$.
>   * **Answer**: `99`

---

### 8. Probability & Permutations/Combinations
* **Permutations** (Arrangement): $P(n, r) = \frac{n!}{(n-r)!}$
* **Combinations** (Selection): $C(n, r) = \frac{n!}{r!(n-r)!}$
* **Probability**: $P(A) = \frac{\text{Favorable Outcomes}}{\text{Total Outcomes}}$

> [!TIP]
> **TCS NQT PYQ 8**: In a box, there are 8 red, 7 blue, and 6 green balls. One ball is picked up randomly. What is the probability that it is neither red nor green?
> * **Solution**:
>   * Total balls $= 8 + 7 + 6 = 21$.
>   * Probability of neither red nor green means it must be blue.
>   * Favorable outcomes (blue balls) $= 7$.
>   * $P = 7 / 21 = 1 / 3$.
>   * **Answer**: `1/3`
