# Percentage Visual Learning Guide

## 1. Percentage Strategy Decision Tree
Use this decision tree during the exam to instantly select the fastest solving technique for any percentage problem.

```
                           Read Percentage Problem
                                      |
         +----------------------------+----------------------------+
         |                                                         |
  Is it a Successive Change?                              Is it a Product relationship?
  (e.g., population, compound discounts)                  (e.g., Price * Consumption = Expense)
         |                                                         |
         +---> Are numbers clean? (e.g., 10%, 20%)                 +---> Is product constant?
         |     |                                                   |     |
         |     +--[YES]--> Use Formula: x + y + xy/100             |     +--[YES]--> Use Base Adjustment:
         |     |                                                   |     |           1/x increase -> 1/(x+1) decrease
         |     +--[NO]---> Use Multiplying Factors (MF)            |     |
         |                                                         |     +--[NO]----> Use Successive Change
         |                                                         |                  on the components
         v                                                         v
  Is it a Simple Comparison? (e.g., A is what % of B?)     Is it Fractional/Tricky %? (e.g., 16.67%)
         |                                                         |
         +-------------> Use Fraction Conversion Scale ------------+---> Convert directly to fraction 
                                                                         (e.g., 16.67% = 1/6)
```

---

## 2. Successive Change Flowchart
Follow this step-by-step logic to solve successive increase/decrease questions without sign errors.

```
+-------------------------------------------------------------+
| Step 1: Identify variables and their signs                  |
| Increase = (+) Positive  |  Decrease = (-) Negative         |
+-------------------------------------------------------------+
                               |
                               v
+-------------------------------------------------------------+
| Step 2: Choose Method based on values                       |
| - Standard integer percentages -> Use Formula Method        |
| - Fractional/Fraction-friendly values -> Use Ratio Method    |
+-------------------------------------------------------------+
             |                                   |
             | (Formula)                         | (Ratio)
             v                                   v
+-----------------------------+    +-----------------------------+
| Step 3A: Apply x+y+xy/100   |    | Step 3B: Convert % to       |
| Net % = x + y + (x*y)/100   |    | fractions. Multiply MFs:    |
| Remember: keep signs!       |    | New = Old * (MF_1) * (MF_2) |
+-----------------------------+    +-----------------------------+
             |                                   |
             +-----------------+-----------------+
                               |
                               v
+-------------------------------------------------------------+
| Step 4: Verify Final Sign                                   |
| (+) Result = Net Increase | (-) Result = Net Decrease       |
+-------------------------------------------------------------+
```

---

## 3. Comparison Table: Solving Methods

| Method | Best Used For | Pros | Cons |
| :--- | :--- | :--- | :--- |
| **Formula Method**<br>($x + y + \frac{xy}{100}$) | Two successive changes with round integers (e.g., $+20\%$, $-10\%$). | Extremely fast; minimal writing. | Hard to use with three or more successive changes. |
| **Multiplying Factor**<br>($V_f = V_i \times MF_1 \times MF_2$) | Complex multi-stage changes, fractional bases, population growth. | Highly structured; handles $N$ successive changes. | Requires decimal multiplication. |
| **Ratio / Fraction Scale**<br>($\frac{1}{x} \rightarrow \frac{1}{x+1}$) | Product constancy (price-consumption) and fractional rates (e.g., $16.67\%$). | Eliminates division; mental calculation. | Must memorize fraction-to-percentage table. |

---

## 4. Pattern Recognition Chart
Instant conversion rules for the NQT exam:

| If you see this phrasing in the question: | Interpret it mathematically as: | Action: |
| :--- | :--- | :--- |
| *"A is what percent of B?"* | $\frac{A}{B} \times 100$ | Set $B$ as the base (denominator). |
| *"A is what percent more than B?"* | $\frac{A-B}{B} \times 100$ | Set $B$ as base. Difference is numerator. |
| *"Price of X rises... reduce consumption to keep cost constant"* | Product Constancy | If increase is $\frac{1}{x}$, reduction is $\frac{1}{x+1}$. |
| *"Successive discounts of $d_1\%$ and $d_2\%$"* | Successive change with negative signs | Net Discount $= d_1 + d_2 - \frac{d_1 d_2}{100}\%$. |
