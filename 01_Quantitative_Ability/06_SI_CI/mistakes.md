# Simple & Compound Interest — Common Candidate Mistakes

This document details the most common traps candidates fall into during interest and installment calculations in the TCS NQT exam and how to avoid them.

---

## 1. Compounding Period Rate Division Omission
*   **The Mistake:** Using the annual rate ($R$) directly when compounding is semi-annual or quarterly.
*   **The Scenario:** Interest rate is $12\%$ compounded quarterly. Candidates calculate quarterly growth using $12\%$ instead of $3\%$.
*   **The Fix:** Always scale the rate: $R' = R / 4$ for quarterly, and time $T' = 4T$.

## 2. Confusing Simple Interest and Compound Interest Installments
*   **The Mistake:** Using the CI present value formula for an SI installment loan, or vice-versa.
*   **The Scenario:** Given an SI installment question, candidates discount payments using $rac{x}{1+r}$.
*   **The Fix:** Verify the interest type first:
    *   *SI Installment:* $A = xT + rac{xRT(T-1)}{200}$
    *   *CI Installment:* $P = rac{x}{1+r} + rac{x}{(1+r)^2}$

## 3. Days Count Leap Year Error
*   **The Mistake:** Assuming every year has 365 days in day-based simple interest questions.
*   **The Scenario:** Calculating simple interest for 73 days in a leap year. Candidates divide by 365 instead of 366.
*   **The Fix:** Check the year. If the year is divisible by 4 (and not a century year, unless divisible by 400), it has 366 days.

## 4. Subtracting Compound Interest Amount Directly
*   **The Mistake:** Forgetting to subtract the principal ($P$) when asked for Compound Interest.
*   **The Scenario:** Calculating $CI = P(1+R/100)^T$ and choosing that option.
*   **The Fix:** The formula $P(1+R/100)^T$ gives the **total Amount ($A$)**. To find the interest, subtract the principal: $CI = A - P$.

## 5. Exponentiation Multiplier Mismatch
*   **The Mistake:** Multiplying rate by time instead of raising to the power in CI.
*   **The Scenario:** Calculating CI for 3 years at $10\%$. Candidates write $10\% 	imes 3 = 30\%$ effective rate instead of $33.1\%$.
*   **The Fix:** CI grows exponentially ($1.1^3 = 1.331$), whereas SI grows linearly ($1 + 3 	imes 0.1 = 1.3$).\n