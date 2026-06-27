# Ratio & Proportion — Tricks & Traps

This document highlights option elimination, divisibility tests, and shortcut checks for the TCS NQT.

---

## 1. The Divisibility Filter Trick

This is the single most powerful trick for ratio problems. Because real-world items (coins, people, balls, years) must be integers, the answer options must align with the ratio factors.

### The Rule
*   If the question asks for the total quantity, and the ratio of parts is $A:B:C$, the total quantity must be a multiple of the sum of the ratio parts ($A + B + C$).
*   If the question asks for A's share, A's value must be a multiple of $A$.

### Example
A sum of money is divided among A, B, and C in the ratio $5 : 2 : 4$. If B's share is 400 Rupees, what is the total sum?
*   Ratio sum = $5 + 2 + 4 = 11$.
*   **The Trick:** Look at the options. The total sum *must* be divisible by 11.
*   **Application:** If options are: (A) 2000, (B) 2200, (C) 2400, (D) 2500. Only 2200 is divisible by 11. Mark (B) immediately without writing a single calculation.

---

## 2. Coin Problem Layout Trick

Problems involving coins of different denominations (e.g., 1 Rupee, 50p, 25p) in a given ratio can be solved in a grid:

$$\text{Value Ratio} = \text{Coin Ratio} \times \text{Denomination Value}$$

*   **The Trap:** Candidates multiply the number of coins by the denomination without converting them to the same units (either all Rupees or all Paise).
*   **The Fix:** Always write denominations in Rupees:
    *   1 Rupee = $1.0$
    *   50 Paise = $0.5$
    *   25 Paise = $0.25$
    *   10 Paise = $0.10$
*   Sum of Value Ratios $\times$ multiplier = Total Value in Rupees.
*   Find the multiplier and multiply by the coin ratio to find the count of any coin.
