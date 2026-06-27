# Ratio & Proportion — Common Candidate Mistakes

This document details the most common traps candidates fall into during ratio and mixture calculations in the TCS NQT exam and how to avoid them.

---

## 1. Mixing Different Denomination Units
*   **The Mistake:** Multiplying coins by their count without converting values to a single unit.
*   **The Scenario:** Given a coin ratio $5:6:8$ for 1 Rupee, 50p, and 25p. Candidates write $5x \times 1 + 6x \times 50 + 8x \times 25 = \text{Total Value}$ in Rupees, mixing Rupees and Paise.
*   **The Fix:** Always convert denominations to Rupees: $1.0$, $0.50$, and $0.25$.

## 2. Partnership Investment Time Base Value
*   **The Mistake:** Using wrong investment durations in compound partnerships.
*   **The Scenario:** A starts a business. B joins after 4 months. In a 1-year profit calculation, candidates use 4 months as B's time instead of B's active duration of $12 - 4 = 8$ months.
*   **The Fix:** The time variable $T$ is the **active duration** the capital remained in the business, not the joining offset.

## 3. The Alligation Scale Unit Mismatch
*   **The Mistake:** Mixing different properties in the alligation cross-diagram.
*   **The Scenario:** Mixing CP of sugar A, SP of sugar B, and mean SP of the mixture.
*   **The Fix:** All three values ($C$, $D$, and $M$) must represent the **same property** (e.g., all must be Cost Prices). If given Selling Price with a profit margin, calculate the Cost Price first before using the alligation diagram.

## 4. Wrong Successive Dilution Base
*   **The Mistake:** Applying the formula for the added liquid instead of the original liquid.
*   **The Scenario:** Evaporating/replacing milk with water. Candidates calculate water volume using $Q_n = Q_0(1 - x/V)^n$.
*   **The Fix:** The dilution formula tracks the concentration of the **original pure liquid** that is being diluted, not the added agent (water). Find the final milk volume first, then subtract from total volume to get water volume.

## 5. False Ratio Balancing
*   **The Mistake:** Balancing ratios without matching the common variable.
*   **The Scenario:** Combining $A:B = 2:3$ and $C:B = 4:5$ by multiplying diagonal terms directly without reversing the second ratio.
*   **The Fix:** Align the ratios so the common variable is in the middle: $A:B = 2:3$ and $B:C = 5:4$.

## 6. Arithmetic Alligation Sum
*   **The Mistake:** Averaging concentrations arithmetically.
*   **The Scenario:** Mixing equal volumes of $10\%$ and $20\%$ milk. That is $15\%$. But mixing unequal volumes like 1 liter of $10\%$ and 2 liters of $20\%$ is not $15\%$.
*   **The Fix:** Use weighted averages: $\frac{1(10) + 2(20)}{3} = 16.67\%$.

## 7. Active Partner Profit Allocation Order
*   **The Mistake:** Distributing the total profit first and then subtracting salary.
*   **The Scenario:** Active partner gets $10\%$ of total profit as salary, and the rest is shared.
*   **The Fix:** Subtract the active partner's salary from the total profit **first**, then distribute the remaining profit according to the investment ratios.

## 8. Proportionality constant omission
*   **The Mistake:** Dropping the proportionality constant in joint variation.
*   **The Scenario:** If $z \propto xy$, writing $z = xy$ instead of $z = kxy$.
*   **The Fix:** Solve for the constant $k$ first using the initial values before computing new values.
