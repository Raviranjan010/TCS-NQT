# Interview Questions: Percentages

This file covers 10 conceptual interview questions and answers exploring percentages, multipliers, successive shifts, and data representation.

---

## 💬 Interview Questions & Answers

### Q1: Explain why a percentage increase followed by the same percentage decrease results in a net loss
Why does this happen, and what is the mathematical formula to calculate it?

**Answer:**
- A percentage change modifies the base value for the subsequent operation.
- The decrease is applied to a larger base value than the original, resulting in a larger absolute reduction.
- The net change is always a loss of:
  $$\text{Net Loss} = \left(\frac{x}{10}\right)^2\%$$

---

### Q2: Compare using fraction equivalents vs decimal multipliers for mental calculations
What are the tradeoffs in speed and accuracy?

**Answer:**
- **Fraction Equivalents**: Converting $16.67\%$ to $1/6$ allows exact integer division, reducing calculation time.
- **Decimal Multipliers**: Using $1.1667$ is more suitable for calculator-based compounding but takes longer mentally.
- **Tradeoff**: Fractions are preferred for manual test environments, while decimals are used in computational algorithms.

---

### Q3: How do you prove the successive change formula $x + y + \frac{xy}{100}$?
Provide the algebraic derivation.

**Answer:**
- Let the initial value be $V$.
- After the first change: $V_1 = V\left(1 + \frac{x}{100}\right)$.
- After the second change:
  $$V_2 = V_1\left(1 + \frac{y}{100}\right) = V\left(1 + \frac{x}{100}\right)\left(1 + \frac{y}{100}\right)$$
- Expanding this expression:
  $$V_2 = V\left(1 + \frac{x + y}{100} + \frac{xy}{10000}\right) = V\left(1 + \frac{x + y + xy/100}{100}\right)$$
- Thus, the net percentage change is $x + y + \frac{xy}{100}$.

---

### Q4: Explain the concept of Product Constancy and its application in daily scenarios
How does it help solve price-consumption problems?

**Answer:**
- Product constancy applies when the product of two variables is constant: $A \times B = K$.
- If $A$ increases by a fraction $a/b$, $B$ must decrease to keep $K$ constant.
- The required decrease is always:
  $$\text{Decrease} = \frac{a}{a+b}$$

---

### Q5: How do you handle percentage calculations when negative values are involved?
What is the base anchor rule?

**Answer:**
- The base of any percentage calculation must be the original (initial) value.
- If initial is negative, the absolute value is used in the denominator to keep the direction of change correct:
  $$\text{Percentage Change} = \frac{\text{Final} - \text{Initial}}{|\text{Initial}|} \times 100$$

---

### Q6: What is the difference between percentage points and percent changes?
Provide a clear example.

**Answer:**
- **Percentage Points**: The simple arithmetic difference between two percentages.
- **Percent Change**: The relative rate of change of the percentage value itself.
- **Example**: If interest rate rises from $10\%$ to $12\%$, it is a $2$ percentage point increase, but a $20\%$ increase in the rate.

---

### Q7: Why do we use prime factorization when calculating divisor counts?
How does it connect to percentages?

**Answer:**
- Prime factorization breaks a number down into its unique building blocks.
- Divisors represent combinations of these prime bases.
- This is useful for finding percentage shares of divisors or matching divisibility rules.

---

### Q8: Explain the mathematical anchor in fresh vs dry fruit problems
Why does pulp weight remain constant?

**Answer:**
- Grapes lose water due to evaporation when drying, but the solid pulp does not evaporate.
- Therefore, pulp weight remains constant throughout the process.
- We set the initial pulp weight equal to the final pulp weight to solve for the missing variable.

---

### Q9: How does the choice of base value affect data interpretation in business reports?
Give an example of base-value manipulation.

**Answer:**
- Using a smaller base value makes subsequent percentage increases appear larger.
- Conversely, using a larger base value makes decreases appear smaller.
- **Example**: A drop from $100$ to $50$ is a $50\%$ decrease, but recovering from $50$ to $100$ requires a $100\%$ increase.

---

### Q10: How do you optimize successive percentage loops in software applications?
What is the most efficient way to compute cumulative compound interest?

**Answer:**
- Avoid looping and applying percentage adjustments step-by-step.
- Pre-calculate the product of all multiplying factors.
- Multiply the initial value by the pre-calculated factor in a single $O(1)$ operation.
