# Simple & Compound Interest — Worked Examples

This document contains 5 detailed worked examples representing common interest and installment questions in the TCS NQT.

---

## Example 1 — SI-CI Difference for 2 Years

### Problem Statement
The difference between the compound interest and simple interest on a certain sum of money for 2 years at $5\%$ per annum is 15 Rupees. Find the principal sum.

### Step-by-Step Solution

1.  **Identify the Variables:**
    *   Time ($T$) = 2 years.
    *   Rate ($R$) = $5\%$.
    *   Difference ($D_2$) = 15 Rupees.

2.  **Apply the 2-Year Difference Shortcut:**
    $$D_2 = P 	imes \left(rac{R}{100}ight)^2$$
    $$15 = P 	imes \left(rac{5}{100}ight)^2$$

3.  **Perform the Calculation:**
    $$15 = P 	imes \left(rac{1}{20}ight)^2$$
    $$15 = P 	imes rac{1}{400}$$
    $$P = 15 	imes 400 = 6000 	ext{ Rupees}$$

### Final Answer
The principal sum is **6,000 Rupees**.

---

## Example 2 — Half-Yearly Compounding

### Problem Statement
Find the compound interest on 8,000 Rupees for 1 year at $10\%$ per annum compounded half-yearly.

### Step-by-Step Solution

1.  **Adjust Variables for Half-Yearly Compounding:**
    *   Adjusted rate ($R'$) = $10 / 2 = 5\%$ per half-year.
    *   Adjusted time ($T'$) = $1 	imes 2 = 2$ half-years.

2.  **Formulate the Amount Equation:**
    $$A = P 	imes \left(1 + rac{R'}{100}ight)^{T'}$$
    $$A = 8000 	imes \left(1 + rac{5}{100}ight)^2$$
    $$A = 8000 	imes \left(1.05ight)^2$$

3.  **Perform the Calculation:**
    $$A = 8000 	imes 1.1025$$
    $$A = 8820 	ext{ Rupees}$$

4.  **Calculate the Interest:**
    $$CI = A - P = 8820 - 8000 = 820 	ext{ Rupees}$$

### Final Answer
The compound interest is **820 Rupees**.

---

## Example 3 — CI Installment Plan

### Problem Statement
A sum of 3,280 Rupees is borrowed at $5\%$ per annum compound interest and is to be repaid in two equal annual installments. Find the value of each installment.

### Step-by-Step Solution

1.  **Identify the Variables:**
    *   Principal ($P$) = 3280 Rupees.
    *   Rate ($R$) = $5\%$.
    *   Compounding factor ($k$) = $1 + rac{5}{100} = 1.05 = rac{21}{20}$.

2.  **Set up the Installment Equation:**
    $$P = rac{x}{k} + rac{x}{k^2}$$
    $$3280 = x 	imes \left(rac{20}{21} + rac{400}{441}ight)$$

3.  **Simplify and Solve for $x$:**
    $$3280 = x 	imes \left(rac{420 + 400}{441}ight)$$
    $$3280 = x 	imes rac{820}{441}$$
    $$x = rac{3280 	imes 441}{820}$$
    *   Since $3280 = 820 	imes 4$:
        $$x = 4 	imes 441 = 1764 	ext{ Rupees}$$

### Final Answer
Each installment is **1,764 Rupees**.

---

## Example 4 — Sum Doubling in SI

### Problem Statement
A sum of money doubles itself in 10 years at simple interest. In how many years will it triple itself at the same rate of interest?

### Step-by-Step Solution

1.  **Analyze the First Condition:**
    *   Let Principal = $P$. Since it doubles, Amount = $2P ightarrow Interest = P$.
    *   $$SI = rac{P 	imes R 	imes 10}{100} = P \implies rac{10R}{100} = 1 \implies R = 10\%$$.

2.  **Analyze the Second Condition:**
    *   We want the sum to triple, so Amount = $3P ightarrow Interest = 2P$.
    *   $$2P = rac{P 	imes 10 	imes T}{100} \implies 2 = rac{T}{10} \implies T = 20 	ext{ years}$$.

### Final Answer
The sum of money will triple in **20 years**.

---

## Example 5 — Effective Rate Calculation

### Problem Statement
Find the effective rate of interest per annum equivalent to a nominal rate of $6\%$ per annum compounded half-yearly.

### Step-by-Step Solution

1.  **Identify the nominal parameters:**
    *   Nominal Rate = $6\%$.
    *   Compounded half-yearly $ightarrow$ Rate per period = $3\%$.
    *   Number of compounding periods in 1 year = 2.

2.  **Apply the Successive Percentage Formula:**
    $$	ext{Effective Rate} = R + R + rac{R^2}{100}$$
    $$	ext{Effective Rate} = 3 + 3 + rac{9}{100}$$
    $$	ext{Effective Rate} = 6 + 0.09 = 6.09\%$$

### Final Answer
The effective rate of interest is **6.09%** per annum.\n