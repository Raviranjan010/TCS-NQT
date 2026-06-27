# Profit & Loss — Common Candidate Mistakes

This document details the most common traps candidates fall into during profit, loss, and discount calculations in the TCS NQT exam and how to avoid them.

---

## 1. Calculating Profit or Loss on the Selling Price
*   **The Mistake:** Using SP as the denominator when calculating the profit or loss percentage.
*   **The Scenario:** An item is bought for 80 Rupees and sold for 100 Rupees. Candidates write $rac{20}{100} = 20\%$ instead of $rac{20}{80} = 25\%$.
*   **The Fix:** Profit and loss are strictly calculated with **Cost Price (CP)** as the base, unless the question explicitly asks for profit margin on Selling Price.

## 2. Arithmetic Addition of Successive Discounts
*   **The Mistake:** Adding successive discount rates arithmetically (e.g., $10\% + 20\% = 30\%$).
*   **The Scenario:** A store offers successive discounts of $10\%$ and $20\%$. Candidates assume the net discount is $30\%$.
*   **The Fix:** Use the compound discount formula: $d_1 + d_2 - rac{d_1 d_2}{100} ightarrow 10 + 20 - 2 = 28\%$.

## 3. Applying Discounts to the Cost Price
*   **The Mistake:** Multiplying CP by the discount multiplier.
*   **The Scenario:** A dealer marks up goods by $30\%$ and offers a $10\%$ discount. Candidates write $SP = CP 	imes 1.30 	imes 0.90$, which is correct, but if asked for discount value, they calculate $10\% 	ext{ of } CP$ instead of $10\% 	ext{ of } MP$.
*   **The Fix:** Discounts are strictly calculated with **Marked Price (MP)** as the base.

## 4. Reversing Dishonest Dealer Ratios
*   **The Mistake:** Multiplying by $rac{	ext{False Weight}}{	ext{True Weight}}$ instead of $rac{	ext{True Weight}}{	ext{False Weight}}$ when calculating revenue.
*   **The Scenario:** A dealer uses a 900g weight instead of 1kg.
*   **The Fix:** Because he delivers less weight for the same price, his profit increases. The multiplier must be $> 1$, which is $rac{1000}{900} pprox 1.11$, not $0.90$.

## 5. Misapplying the "Same SP" Loss Formula to "Same CP"
*   **The Mistake:** Using $rac{X^2}{100}\%$ loss when two items have the same Cost Price.
*   **The Scenario:** Two items are bought for 1,000 Rupees each. One is sold at a $10\%$ gain, and the other at a $10\%$ loss. Candidates write $1\%$ loss.
*   **The Fix:** If the Cost Prices are the same, there is **No Profit, No Loss** (net profit = $10\% - 10\% = 0\%$). The formula only applies when the Selling Prices are equal.\n