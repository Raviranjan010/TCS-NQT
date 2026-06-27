# Percentage — Worked Examples

This document contains 5 detailed, step-by-step worked examples representing common percentage questions in the TCS NQT.

---

## Example 1 — Successive Changes in Population

### Problem Statement
The population of a town increases by $10\%$ in the first year and decreases by $20\%$ in the second year. If the current population is $22,000$, what was the population two years ago?

### Step-by-Step Solution

1.  **Define the Variables:**
    Let the population two years ago be $P_0$.
    Let the population after the first year be $P_1$.
    Let the population after the second year (current) be $P_2 = 22,000$.

2.  **Express the Successive Multipliers:**
    *   First year increase is $10\%$. Multiplier $M_1 = 1 + \frac{10}{100} = 1.10$.
    *   Second year decrease is $20\%$. Multiplier $M_2 = 1 - \frac{20}{100} = 0.80$.

3.  **Formulate the Equation:**
    $$P_2 = P_0 \times M_1 \times M_2$$
    $$22,000 = P_0 \times 1.10 \times 0.80$$

4.  **Solve for $P_0$:**
    $$22,000 = P_0 \times 0.88$$
    $$P_0 = \frac{22,000}{0.88}$$
    $$P_0 = \frac{2,200,000}{88}$$
    $$P_0 = \frac{200,000}{8} = 25,000$$

### Final Answer
The population of the town two years ago was **25,000**.

---

## Example 2 — Product Constancy Application

### Problem Statement
If the price of petrol is increased by $25\%$, by what percentage must a motorist reduce his consumption of petrol so that his expenditure remains unchanged?

### Step-by-Step Solution

1.  **Understand the Mathematical Relationship:**
    $$\text{Expenditure} = \text{Price} \times \text{Consumption}$$
    We want the Expenditure to remain constant.

2.  **Apply the Fractional Shortcut:**
    *   The price increases by $25\%$.
    *   Express $25\%$ as a fraction: $25\% = \frac{25}{100} = \frac{1}{4}$.
    *   Here, $x = 4$. The increase is $\frac{1}{x} = \frac{1}{4}$.

3.  **Calculate the Required Decrease:**
    *   According to the product-constancy rule, if a factor increases by $\frac{1}{x}$, the other factor must decrease by:
        $$\text{Fractional Decrease} = \frac{1}{x + 1} = \frac{1}{4 + 1} = \frac{1}{5}$$
    *   Convert the fraction to a percentage:
        $$\text{Percentage Decrease} = \frac{1}{5} \times 100 = 20\%$$

### Final Answer
The motorist must reduce his consumption by **20%** to keep his expenditure constant.

---

## Example 3 — Exam Pass Marks and Percentages

### Problem Statement
A student has to score $40\%$ marks to pass an exam. He gets 178 marks and fails by 22 marks. What are the maximum marks of the exam?

### Step-by-Step Solution

1.  **Calculate the Pass Marks:**
    *   The student scored 178 marks.
    *   He failed by 22 marks, meaning he needed 22 more marks to pass.
    *   $$\text{Pass Marks} = 178 + 22 = 200 \text{ marks}$$

2.  **Set up the Percentage Equation:**
    *   Let the maximum marks of the exam be $M$.
    *   We are given that the pass marks represent $40\%$ of the maximum marks:
        $$40\% \text{ of } M = 200$$
        $$\frac{40}{100} \times M = 200$$

3.  **Solve for $M$:**
    *   $$0.40 \times M = 200$$
        $$M = \frac{200}{0.40} = 500 \text{ marks}$$

### Final Answer
The maximum marks of the exam are **500**.

---

## Example 4 — Salary Allocations & Remaining Balance

### Problem Statement
A man spends $30\%$ of his monthly income on food, $20\%$ of the remaining on rent, and $10\%$ of the balance on education. If he is left with 10,080 Rupees at the end of the month, what is his monthly income?

### Step-by-Step Solution

1.  **Define Monthly Income:**
    Let the monthly income of the man be $I$.

2.  **Track the Remaining Balance Successively:**
    *   **Food:** Spends $30\%$.
        $$\text{Remaining}_1 = I \times (1 - 0.30) = 0.70I$$
    *   **Rent:** Spends $20\%$ of the *remaining*.
        $$\text{Remaining}_2 = (0.70I) \times (1 - 0.20) = 0.70I \times 0.80 = 0.56I$$
    *   **Education:** Spends $10\%$ of the *balance*.
        $$\text{Remaining}_3 = (0.56I) \times (1 - 0.10) = 0.56I \times 0.90 = 0.504I$$

3.  **Equate to the Leftover Savings:**
    *   We are given that the final remaining balance is 10,080 Rupees.
        $$0.504I = 10,080$$

4.  **Solve for $I$:**
    *   $$I = \frac{10,080}{0.504}$$
        $$I = \frac{10,080,000}{504}$$
        Since $504 \times 2 = 1008$:
        $$I = 20,000 \text{ Rupees}$$

### Final Answer
His monthly income is **20,000 Rupees**.

---

## Example 5 — Votes and Elections

### Problem Statement
In an election between two candidates, the candidate who gets $57\%$ of the votes polled is elected by a majority of 420 votes. What was the total number of votes polled?

### Step-by-Step Solution

1.  **Define Total Votes:**
    Let the total number of votes polled be $V$.

2.  **Determine Vote Shares:**
    *   Winner's share = $57\%$ of $V$.
    *   Since there are only two candidates, the loser's share is the remaining portion:
        $$\text{Loser's share} = 100\% - 57\% = 43\% \text{ of } V$$

3.  **Formulate the Majority Equation:**
    *   The winner wins by a majority of 420 votes:
        $$\text{Winner's Votes} - \text{Loser's Votes} = 420$$
        $$57\% \text{ of } V - 43\% \text{ of } V = 420$$
        $$(57\% - 43\%) \text{ of } V = 420$$
        $$14\% \text{ of } V = 420$$

4.  **Solve for $V$:**
    *   $$\frac{14}{100} \times V = 420$$
        $$V = \frac{420 \times 100}{14}$$
        Since $420 / 14 = 30$:
        $$V = 30 \times 100 = 3000$$

### Final Answer
The total number of votes polled was **3000**.
