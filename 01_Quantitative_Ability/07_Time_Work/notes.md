# Time & Work — Complete Notes

---

## 1. The Rate-Efficiency Principle

The fundamental relationship governing all work and flow systems is:
$$	ext{Work } (W) = 	ext{Rate } (R) 	imes 	ext{Time } (T)$$

*   **Work ($W$):** By default, assumed to be $1$ (representing $100\%$ task completion).
*   **Rate/Efficiency ($R$):** The fraction of work completed per unit time. If a person completes a task in $D$ days, their daily rate is $R = rac{1}{D}$.
*   **Time ($T$):** The duration for which the work is performed.

### Combined Rates
If multiple people work together, their individual rates add up linearly:
$$R_{	ext{total}} = R_A + R_B + R_C = rac{1}{D_A} + rac{1}{D_B} + rac{1}{D_C}$$

---

## 2. The LCM Method (Avoid Fractions)

Instead of using fractions, assume the **Total Work** is the Least Common Multiple (LCM) of the days taken by the individuals.

### The Algorithm
Let A take 10 days and B take 15 days to complete a task.
1.  **Assume Total Work:** LCM of 10 and 15 = 30 units.
2.  **Find Daily Efficiencies:**
    *   A's Efficiency = $30 / 10 = 3$ units per day.
    *   B's Efficiency = $30 / 15 = 2$ units per day.
3.  **Combine Efficiencies:**
    *   Total Daily Efficiency = $3 + 2 = 5$ units per day.
4.  **Find Time Taken Together:**
    *   Time taken = $rac{	ext{Total Work}}{	ext{Total Efficiency}} = rac{30}{5} = 6$ days.

---

## 3. Pipes & Cisterns & Negative Work

Pipes and cisterns are identical to Time & Work, with one key distinction: **Negative Work**.

*   **Inlet Pipes:** Perform positive work (add water to the tank). Rate is positive ($+R$).
*   **Outlet Pipes / Leaks:** Perform negative work (remove water from the tank). Rate is negative ($-R$).

### The Flow Equation
If an inlet pipe fills a tank in $F$ hours and a leak empties it in $E$ hours (where $E > F$ to allow filling):
$$	ext{Net Rate} = rac{1}{F} - rac{1}{E}$$
$$	ext{Net Time to Fill} = rac{E 	imes F}{E - F} 	ext{ hours}$$

---

## 4. Work and Wages

Wages are distributed among workers based on the actual work done by each individual.

*   If workers work for the **same time duration**, their wages are shared in the ratio of their **efficiencies/rates**.
*   If they work for **different durations**, wages are shared in the ratio of the **actual work completed** by each:
    $$	ext{Wage Ratio} = (R_A 	imes T_A) : (R_B 	imes T_B) : (R_C 	imes T_C)$$

---

## 5. Cross-References & Overlapping Topics

*   **Ratios & Proportions:** Time taken and efficiency are inversely proportional. See [Ratio & Proportion Notes](../03_Ratio_Proportion/notes.md#2-direct-and-inverse-proportion) to review inverse relationships.
*   **Chain Rule:** Work is proportional to manpower and days: $rac{M_1 D_1 T_1}{W_1} = rac{M_2 D_2 T_2}{W_2}$.\n