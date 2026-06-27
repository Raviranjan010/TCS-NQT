# Ratio & Proportion — Previous Year Questions (PYQs)

*   **TCS NQT PYQ Bank:** Actual exam variations from 2021-2025.
*   **Assessment Goal:** Familiarity with TCS NQT language, data types, and scaling.

---

### PYQ1 — Coins Count Partition
A bag contains 1 Rupee, 50 Paise, and 25 Paise coins. The ratio of their values in the bag is $30:11:7$ respectively. If the total number of coins in the bag is 480, find the number of 50 Paise coins.
*   **Difficulty:** Medium | **Expected Time:** 90s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Let the values of 1 Rupee, 50p, and 25p coins be $30x, 11x, 7x$.
    *   Number of 1 Rupee coins = $30x / 1 = 30x$.
    *   Number of 50p coins = $11x / 0.5 = 22x$.
    *   Number of 25p coins = $7x / 0.25 = 28x$.
    *   Total coins = $30x + 22x + 28x = 80x = 480 \implies x = 6$.
    *   Number of 50p coins = $22 \times 6 = 132$.
*   **Faster Method:**
    *   Ratio of coin counts is $30 : 22 : 28$. Sum = 80 parts.
    *   Multiplier = $480 / 80 = 6$.
    *   50p coins = $22 \times 6 = 132$.

---

### PYQ2 — Partnership Time Frame
A starts a business with 3,500 Rupees. After 5 months, B joins as a partner. At the end of the year, the profit is divided in the ratio $2:3$. How much capital did B invest?
*   **Difficulty:** Easy | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   A's investment = 3500 for 12 months.
    *   B's investment = $I_B$ for 7 months.
    *   $$\frac{3500 \times 12}{I_B \times 7} = \frac{2}{3} \implies \frac{500 \times 12}{I_B} = \frac{2}{3} \implies \frac{6000}{I_B} = \frac{2}{3} \implies I_B = 9,000 \text{ Rupees}$$.
*   **Faster Method:**
    *   A's unit-time product = $3500 \times 12 = 42000$.
    *   B's profit is $1.5$ times A's, so B's unit-time product must be $42000 \times 1.5 = 63000$.
    *   B's capital = $63000 / 7 = 9000$ Rupees.

---

### PYQ3 — Gold Bar Splitting
A diamond worth 10,000 Rupees is broken into two pieces whose weights are in the ratio $2:3$. If the value of the diamond is directly proportional to the square of its weight, find the loss incurred due to breaking.
*   **Difficulty:** Medium | **Expected Time:** 90s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Unbroken weight = 5 parts. Unbroken value = $5^2 = 25$ units = 10,000 Rupees $\implies$ 1 unit = 400 Rupees.
    *   Broken value = $2^2 + 3^2 = 4 + 9 = 13$ units.
    *   Loss = $25 - 13 = 12$ units.
    *   Loss in Rupees = $12 \times 400 = 4,800$ Rupees.
*   **Faster Method:**
    *   Loss ratio = $\frac{12}{25} = 48\%$.
    *   Loss = $48\%$ of 10,000 = 4,800 Rupees.

---

### PYQ4 — Salary and Savings Ratio
The ratio of incomes of A and B is $5:4$ and the ratio of their expenditures is $3:2$. If each saves 1,600 Rupees, find A's income.
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$\frac{5x - 1600}{4x - 1600} = \frac{3}{2} \implies 10x - 3200 = 12x - 4800 \implies 2x = 1600 \implies x = 800$$.
    *   A's income = $5x = 4,000$ Rupees.
*   **Faster Method (Cross Multiplication):**
    *   $$x = \frac{1600 \times (3 - 2)}{|10 - 12|} = 800$$.
    *   A's income = $5 \times 800 = 4,000$.

---

### PYQ5 — Third Proportional
Find the third proportional to 4 and 12.
*   **Difficulty:** Easy | **Expected Time:** 20s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$c = \frac{12^2}{4} = \frac{144}{4} = 36$$.
*   **Faster Method:**
    *   Scaling factor from 4 to 12 is $\times 3$. Apply same scale to 12 $\rightarrow 12 \times 3 = 36$.

---

### PYQ6 — Milk Dilution Successive
A jar contains 80 liters of pure milk. 8 liters of milk is taken out and replaced with water. This process is repeated one more time. Find the ratio of milk to water in the final mixture.
*   **Difficulty:** Medium | **Expected Time:** 90s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$\text{Final Milk} = 80 \times \left(1 - \frac{8}{80}\right)^2 = 80 \times 0.81 = 64.8 \text{ liters}$$.
    *   Water = $80 - 64.8 = 15.2$ liters.
    *   Ratio = $64.8 : 15.2 = 648 : 152 = 81 : 19$.
*   **Faster Method:**
    *   Remaining milk fraction = $(9/10)^2 = 81/100$.
    *   Therefore, milk : water = $81 : (100 - 81) = 81 : 19$.

---

### PYQ7 — Mean Proportional Decimal
What is the mean proportional between 0.4 and 0.9?
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   $$\text{Mean} = \sqrt{0.4 \times 0.9} = \sqrt{0.36} = 0.6$$.
*   **Faster Method:**
    *   $\sqrt{4 \times 9} / 10 = 6 / 10 = 0.6$.

---

### PYQ8 — Three Numbers Sum
Three numbers are in the ratio $3 : 4 : 5$. If the sum of their squares is 1,250, find the numbers.
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $(3x)^2 + (4x)^2 + (5x)^2 = 1250 \implies 9x^2 + 16x^2 + 25x^2 = 1250 \implies 50x^2 = 1250 \implies x^2 = 25 \implies x = 5$.
    *   Numbers are $15, 20, 25$.
*   **Faster Method:**
    *   Ratio sum parts $= 9 + 16 + 25 = 50$. Multiplier $= \sqrt{1250 / 50} = \sqrt{25} = 5$. Numbers $= 15, 20, 25$.

---

### PYQ9 — Direct Work Proportionality
If 20 weavers can weave 40 shawls in 30 days, how many weavers can weave 50 shawls in 25 days?
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   $$\frac{20 \times 30}{40} = \frac{M_2 \times 25}{50} \implies 15 = \frac{M_2}{2} \implies M_2 = 30 \text{ weavers}$$.
*   **Faster Method:**
    *   Work ratios show we need $30$ weavers.

---

### PYQ10 — Profit Allocation
A, B, and C invested capital in the ratio $1:2:4$. If the profits are shared in the ratio $1:1:1$ (equal), find the ratio of their investment durations.
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$\text{Time Ratio} = \frac{1}{1} : \frac{1}{2} : \frac{1}{4} = 4 : 2 : 1$$.
*   **Faster Method:**
    *   Inverse of investment ratio: $1, 1/2, 1/4 \rightarrow 4:2:1$.

---

### PYQ11 — Coin Value Sum
A box has 180 Rupees in total, containing 1 Rupee, 50p, and 25p coins in the ratio $2:3:4$. What is the number of 50p coins?
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Let coin counts be $2x, 3x, 4x$.
    *   $2x(1) + 3x(0.5) + 4x(0.25) = 180 \implies 2x + 1.5x + 1x = 180 \implies 4.5x = 180 \implies x = 40$.
    *   50p coins = $3 \times 40 = 120$.
*   **Faster Method:**
    *   Ratio values = $2 : 1.5 : 1$. Sum = 4.5 parts.
    *   Multiplier = $180 / 4.5 = 40$. 50p coins = $3 \times 40 = 120$.

---

### PYQ12 — Joint Income Variation
A's salary is $25\%$ more than B's salary. By how much percent is B's salary less than A's?
*   **Difficulty:** Easy | **Expected Time:** 20s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Let B = 100, A = 125. Difference = 25.
    *   Percentage = $\frac{25}{125} \times 100 = 20\%$.
*   **Faster Method:**
    *   $\frac{1}{4}$ increase implies $\frac{1}{4+1} = \frac{1}{5} = 20\%$ decrease.

---

### PYQ13 — Fourth Proportional Finding
Find the fourth proportional to 0.12, 0.21, and 8.
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   $$d = \frac{0.21 \times 8}{0.12} = \frac{21 \times 8}{12} = 14$$.
*   **Faster Method:**
    *   Ratio $12 : 21 = 4 : 7$. Since $4 \rightarrow 8$ ($\times 2$), $7 \rightarrow 14$.

---

### PYQ14 — Alligation on Cost Price
In what ratio should coffee costing 280 Rupees/kg be mixed with coffee costing 320 Rupees/kg to obtain a blend worth 300 Rupees/kg?
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$\text{Ratio} = \frac{320 - 300}{300 - 280} = \frac{20}{20} = 1:1$$.
*   **Faster Method:**
    *   Since 300 is the exact midpoint between 280 and 320, they must be mixed in equal parts $\rightarrow 1:1$.

---

### PYQ15 — Two Numbers Subtract
Two numbers are in the ratio $5:7$. If 9 is subtracted from each, the ratio becomes $7:11$. Find the difference between the numbers.
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$\frac{5x - 9}{7x - 9} = \frac{7}{11} \implies 55x - 99 = 49x - 63 \implies 6x = 36 \implies x = 6$$.
    *   Numbers are $30$ and $42$. Difference = 12.
*   **Faster Method (Cross Multiplication):**
    *   $$x = \frac{9 \times (11 - 7)}{|55 - 49|} = \frac{36}{6} = 6$$.
    *   Difference $= 2x = 12$.
