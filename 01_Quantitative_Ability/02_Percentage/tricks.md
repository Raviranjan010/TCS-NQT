# Percentage — Tricks & Traps

This guide focuses on option elimination, pattern recognition, and avoiding common traps in TCS NQT percentage problems.

---

## 1. Option Elimination Tricks

### The "Base Value Shift" Check
If a question asks: "A's income is 25% more than B's. By how much percent is B's income less than A's?", you can eliminate options immediately using this trick:
*   **The Trick:** The percentage decrease must *always* be numerically smaller than the percentage increase because the base value has shifted to a larger number (A's income).
*   **Application:** Eliminate any options that are $\ge 25\%$. The answer must be $< 25\%$ (specifically, $20\%$).

### Divisibility Checking
Many percentage problems involve a whole number of items or people (e.g., candidates in an exam, employees in a firm).
*   **The Trick:** If a problem states that $14.28\%$ of the employees are engineers, convert $14.28\%$ to its fraction equivalent: $\frac{1}{7}$. 
*   **Application:** Since the number of employees must be an integer, the total number of employees in the firm *must* be a multiple of 7. Look at the options and eliminate any that are not divisible by 7!

---

## 2. TCS-Specific Traps

### Trap 1: The "Successive Order" Trick
TCS NQT often presents scenarios where a quantity is increased by $X\%$ and then decreased by $Y\%$ in two different orders (e.g., first increased then decreased vs. first decreased then increased).
*   **The Trap:** Candidates think that changing the order changes the final value.
*   **The Fix:** The order of successive changes does **not** matter. $X \times 1.10 \times 0.90$ is exactly identical to $X \times 0.90 \times 1.10$. Both result in a net $1\%$ decrease.

### Trap 2: The "Sales Tax / VAT" Trap
A dealer marks up price by $30\%$, then gives a discount of $10\%$, and then adds a tax of $5\%$.
*   **The Trap:** Applying the tax on the Cost Price instead of the final Selling Price.
*   **The Fix:** Taxes are calculated on the actual transaction value (SP), not the CP. Apply successive multiplications: $\text{Final Price} = \text{CP} \times 1.30 \times 0.90 \times 1.05$.
