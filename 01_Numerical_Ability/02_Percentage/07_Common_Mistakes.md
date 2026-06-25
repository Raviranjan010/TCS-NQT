# Percentage Common Mistakes & Traps

Avoid these 15 common mistakes in the TCS NQT exam to ensure you don't fall for the trap options in the MCQs.

---

### 1. Direct Addition of Successive Percentages
*   **The Trap**: Adding $+10\%$ and $-10\%$ to get $0\%$.
*   **The Reality**: Successive changes alter the base of the second operation.
*   **Correction**: Use $10 - 10 + \frac{10 \times (-10)}{100} = -1\%$. A net $1\%$ decrease occurs.

### 2. Base Confusion: "More Than" vs. "Less Than"
*   **The Trap**: If A is $20\%$ more than B, assuming B is $20\%$ less than A.
*   **The Reality**: The reference base changes from B (in first statement) to A (in second).
*   **Correction**: Since A $= 1.2B$, the reduction is $\frac{1.2B - B}{1.2B} = \frac{0.2}{1.2} = \frac{1}{6} = 16.67\%$ less.

### 3. Confusing "Increases BY" with "Increases TO"
*   **The Trap**: Treating "value increased to $150\%$ of original" as a $+150\%$ change.
*   **The Reality**: "Increased TO $150\%$" means final value is $1.5X$ (a $50\%$ increase). "Increased BY $150\%$" means final value is $2.5X$ (a $150\%$ increase).
*   **Correction**: Always check the preposition: "By" = Additive Change; "To" = Final State.

### 4. Ignoring Invalid/Illegal Votes in Election Problems
*   **The Trap**: Setting Winner's Votes $+$ Loser's Votes $= 100\%$ when some votes are invalid.
*   **The Reality**: Invalid/illegal votes must be deducted before partitioning winner/loser shares.
*   **Correction**: $\text{Valid Votes} = \text{Total Polled} - \text{Invalid Votes}$. Partition candidates relative to valid votes.

### 5. Multi-Stage Percentage Reductions on Wrong Bases
*   **The Trap**: Spends $30\%$ on rent, and $20\%$ of remaining on food. Student subtracts $30\% + 20\% = 50\%$.
*   **The Reality**: The $20\%$ is calculated on the remaining $70\%$, not the original $100\%$.
*   **Correction**: Remaining amount $= \text{Total} \times 0.70 \times 0.80 = 56\%$ of Total.

### 6. Using Raw Decimals for Complex Fractions
*   **The Trap**: Writing $16.67\%$ as $0.1667$ and doing long multiplication.
*   **The Reality**: Leads to rounding errors and consumes valuable time.
*   **Correction**: Convert instantly to fractions: $16.67\% = \frac{1}{6}$.
    *   *Example*: $16.67\%$ of $360 = \frac{1}{6} \times 360 = 60$.

### 7. Incorrect Denominator in Percentage Change
*   **The Trap**: Dividing the change by the final value instead of the initial value.
*   **The Reality**: Percentage change is always calculated relative to the *original* state.
*   **Correction**: Denominator must be the initial value.
    *   *Example*: Price drops from $100$ to $80$. Decrease $= \frac{20}{100} = 20\%$ (not $\frac{20}{80} = 25\%$).

### 8. Compound Interest Base Scaling
*   **The Trap**: Assuming population growth over multiple years is simple interest (linear).
*   **The Reality**: Population growth is compounding (successive).
*   **Correction**: A population of $1000$ growing at $10\%$ for 2 years becomes $1000 \times 1.1 \times 1.1 = 1210$ (not $1200$).

### 9. Successive Discount Summation Trap
*   **The Trap**: Thinking a buy 1 get 1 free is the same as $50\% + 50\% = 100\%$ discount.
*   **The Reality**: Discounts compound.
*   **Correction**: Two successive $50\%$ discounts lead to:
    $$\text{Discount} = 50 + 50 - \frac{50 \times 50}{100} = 75\% \text{ net discount.}$$

### 10. Percentage Point Changes vs. Percentage Changes
*   **The Trap**: If interest rate rises from $10\%$ to $12\%$, calling it a $2\%$ increase.
*   **The Reality**: It is a $2\text{ percentage point}$ increase, but a $20\%$ relative increase in the rate itself.
*   **Correction**: Percentage change $= \frac{12-10}{10} \times 100 = 20\%$.

### 11. Unit Discrepancies in Numeric Inputs
*   **The Trap**: Typing percentages in whole number answer blanks.
*   **The Reality**: TCS NQT numerical input fields only accept integer digits.
*   **Correction**: If the question asks "what is the profit percent", type `8` (do not type `8%` or `0.08`).

### 12. Direct Addition of Ratios in Mixtures
*   **The Trap**: Adding percentage shares of components directly without normalizing volume.
*   **The Reality**: You can only add percentages directly if the total volumes are equal.
*   **Correction**: Convert percentages to absolute values first, add them, then find the net percentage.

### 13. Double Counting in Venn Diagram Problems
*   **The Trap**: Adding student percentages directly: $60\%$ passed English, $50\%$ passed Math, assuming total is $110\%$.
*   **The Reality**: Some students passed both subjects and are counted twice.
*   **Correction**: Use set formula: $\text{Total} = A\% + B\% - (A \cap B)\%$.

### 14. Calculating Discounts on the Cost Price (CP)
*   **The Trap**: Deducting discount from Cost Price.
*   **The Reality**: Discounts are always calculated on the Marked Price (MP).
*   **Correction**: $\text{Selling Price (SP)} = \text{Marked Price (MP)} - \text{Discount}$.

### 15. Forgetting Negative Signs for Depreciation
*   **The Trap**: Treating machine depreciation as a positive growth rate.
*   **The Reality**: Depreciation is a negative rate of change.
*   **Correction**: If a machine depreciates by $10\%$ annually, use $r = -10\%$ in your equations.
    *   *Example*: Value after 2 years $= \text{Initial} \times (0.9)^2$.
