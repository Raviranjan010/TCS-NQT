# Percentage — Common Candidate Mistakes

This document details the most common traps candidates fall into during percentage calculations in the TCS NQT exam and how to avoid them.

---

## 1. The Incorrect Base Trap
*   **The Mistake:** Using the wrong denominator when calculating a percentage change.
*   **The Scenario:** If a salary increases from 80 Rupees to 100 Rupees, candidates often calculate the percentage increase on the final value (100) instead of the initial base value (80), resulting in $\frac{20}{100} = 20\%$ instead of the correct $\frac{20}{80} = 25\%$.
*   **The Fix:** Always remember that percent changes are calculated with the **initial/original** value as the base.

## 2. Direct Addition of Successive Changes
*   **The Mistake:** Adding successive percentages arithmetically (e.g., $10\% + 20\% = 30\%$).
*   **The Scenario:** A price is increased by $10\%$ and then by $20\%$. Candidates assume the net increase is $30\%$.
*   **The Fix:** Use the compounding formula: $A + B + \frac{AB}{100} \rightarrow 10 + 20 + 2 = 32\%$.

## 3. Confusing Percentage Points (pp) with Percent Change (%)
*   **The Mistake:** Treating a change in percentage values as a direct percentage change.
*   **The Scenario:** If interest rate increases from $10\%$ to $12\%$, the increase is $2$ percentage points, but the percentage growth is $\frac{2}{10} \times 100 = 20\%$.
*   **The Fix:** Read the question carefully to distinguish between "percent increase" and "increase in percentage points."

## 4. Ordering Successive Changes Incorrectly
*   **The Mistake:** Thinking that the order of applying successive changes affects the final result.
*   **The Scenario:** Candidates waste exam time calculating the final price of an item first increased by $20\%$ then discounted by $10\%$ vs. first discounted by $10\%$ then increased by $20\%$.
*   **The Fix:** The order does not matter; both yield a multiplier of $1.20 \times 0.90 = 1.08$ (8% net increase).

## 5. Mixture Addition Fallacy
*   **The Mistake:** Adding percentages of different mixtures directly.
*   **The Scenario:** Mixing 1 liter of $10\%$ acid solution with 1 liter of $20\%$ acid solution does not make a $30\%$ solution; it makes a $\frac{10\% + 20\%}{2} = 15\%$ solution.
*   **The Fix:** Convert to absolute values (grams/liters) before adding, or use the weighted average formula.

## 6. Price-Consumption Shortcut Inverse
*   **The Mistake:** Applying the direct fraction formula for consumption decreases instead of increases.
*   **The Scenario:** If price decreases by $20\%$ ($\frac{1}{5}$), consumption must increase. Candidates write $\frac{1}{5+1} = 16.67\%$ instead of the correct $\frac{1}{5-1} = 25\%$.
*   **The Fix:** If the first variable decreases, use $\frac{1}{x-1}$ for the other's increase.

## 7. The Integer Split Trap
*   **The Mistake:** Neglecting that counts of physical items (like people or votes) must be integers.
*   **The Scenario:** Solving a system of equations that yields $14.5$ students.
*   **The Fix:** If a percentage implies a fractional person, check your base value or your equation.

## 8. Rounding Too Early
*   **The Mistake:** Rounding intermediate values in multi-step calculations.
*   **The Scenario:** Working with $\frac{1}{3} \approx 0.33$, and then multiplying by $300$ to get $99$ instead of $100$.
*   **The Fix:** Keep values in fraction form until the final calculation step.
