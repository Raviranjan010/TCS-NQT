# Simple & Compound Interest — Tricks & Traps

This guide focuses on option estimation, compounding traps, and shortcut elimination for interest calculations.

---

## 1. Option Range Estimation

### The "Interest Bound" Trick
Compound Interest (CI) is *always* greater than Simple Interest (SI) for the same principal, rate, and time (for $T > 1$ year):
$$CI > SI$$
*   **The Trick:** Calculate the Simple Interest first (which is very easy: $P 	imes R 	imes T / 100$). Any options for CI that are $\le SI$ can be instantly eliminated.

### The "Linear vs Exponential" Margin
*   For 2 years, $CI - SI = P(R/100)^2$. Since this difference is usually very small relative to the principal, the correct CI option must be slightly higher than the SI value.
*   **Application:** If $SI = 1200$, CI must be around $1230-1280$. Eliminate options like $1100$ or $1800$.

---

## 2. TCS Compounding Traps

### Trap 1: The "Compounded Quarterly" Rate Mistake
*   **The Trap:** Candidates multiply the time by 4 but forget to divide the annual rate by 4.
*   **The Fix:** If the annual rate is $20\%$ and compounding is quarterly, the rate per quarter is $5\%$.

### Trap 2: Direct Installment Ratio Mismatch
*   **The Trap:** In CI installments, assuming the annual payment is simply total debt divided by years.
*   **The Fix:** Annual installment is determined by discounting future payments to present value. Use the formula:
    $$P = rac{x}{1+r} + rac{x}{(1+r)^2}$$\n