# Simple & Compound Interest — Exam Shortcuts & Hacks

These shortcuts are designed to bypass long exponentiation and multi-variable equations in compound interest and installments.

---

## 1. Effective Interest Rate (Successive Percentage Method)

Instead of calculating $P(1 + R/100)^T$, find the effective interest rate using successive percentage changes:
$$	ext{Effective Rate for 2 Years} = 2R + rac{R^2}{100}$$

### Example
Find the CI on 10,000 Rupees at $8\%$ per annum for 2 years.
*   $R = 8\%$
*   Effective Rate = $2(8) + rac{64}{100} = 16 + 0.64 = 16.64\%$.
*   $$	ext{CI} = 16.64\% 	ext{ of } 10,000 = 1,664 	ext{ Rupees}$$.
*   *Time saved:* Under 10 seconds compared to calculating $10000 	imes 1.08 	imes 1.08 - 10000$.

---

## 2. Compounding Interval Rate Scaling

When compounding interval changes, adjust the interest rate and time period accordingly:

| Interval | Rate to Use ($R'$) | Time Period to Use ($T'$) |
| :---: | :---: | :---: |
| **Half-Yearly** | $R / 2$ | $2T$ |
| **Quarterly** | $R / 4$ | $4T$ |

---

## 3. SI-CI Difference Shortcuts

Use these direct relations to solve difference problems under 30 seconds:

*   **For 2 Years:**
    $$D_2 = P \left(rac{R}{100}ight)^2$$
*   **For 3 Years:**
    $$D_3 = D_2 \left(rac{300 + R}{100}ight)$$

---

## 4. Installment Fraction Shortcuts (Compound Interest)

If the rate is $R\%$, express the multiplier as a fraction in simplest terms:
$$k = 1 + rac{R}{100}$$
For $n$ installments, the payment ratio is given by the sum of reciprocal powers:
$$P = x \left(rac{1}{k} + rac{1}{k^2} + \dots + rac{1}{k^n}ight)$$\n