# Simple & Compound Interest — Formulas & Derivations

This document compiles the core formulas and algebraic derivations for Simple Interest (SI), Compound Interest (CI), multi-year difference relations, and installment models.

---

## 1. Interest Formulations

### Simple Interest
$$SI = rac{P 	imes R 	imes T}{100}$$
*   **Derivation:** Simple Interest is calculated strictly on the original Principal ($P$). For rate $R\%$ per annum, the interest earned in 1 year is $P 	imes (R / 100)$. Over $T$ years, it grows linearly: $SI = P 	imes rac{R}{100} 	imes T$.

### Compound Interest
$$A = P 	imes \left(1 + rac{R}{100}ight)^T$$
$$CI = A - P = P 	imes \left[\left(1 + rac{R}{100}ight)^T - 1ight]$$
*   **Derivation:** In CI, interest earned is added to the principal at the end of each compounding period.
    *   End of Year 1: $A_1 = P(1 + R/100)$.
    *   End of Year 2: $A_2 = A_1(1 + R/100) = P(1 + R/100)^2$.
    *   End of Year $T$: $A_T = P(1 + R/100)^T$.

---

## 2. Multi-Year SI-CI Difference Relations

### Two-Year Difference ($D_2$)
$$D_2 = P 	imes \left(rac{R}{100}ight)^2$$
*   **Derivation:**
    *   $SI_2 = rac{2PR}{100}$.
    *   $CI_2 = P\left(1 + rac{R}{100}ight)^2 - P = P\left(rac{2R}{100} + rac{R^2}{10000}ight) = rac{2PR}{100} + rac{PR^2}{10000}$.
    *   $$D_2 = CI_2 - SI_2 = rac{PR^2}{10000} = P\left(rac{R}{100}ight)^2$$.

### Three-Year Difference ($D_3$)
$$D_3 = P 	imes \left(rac{R}{100}ight)^2 	imes \left(rac{300 + R}{100}ight) = D_2 	imes \left(rac{300 + R}{100}ight)$$
*   **Derivation:** Expand the binomial equation for $CI_3 = P(1 + R/100)^3 - P$ and subtract $SI_3 = rac{3PR}{100}$. Simplification yields the relation.

---

## 3. Installment Formulas

### Simple Interest Loan Installments
Let $A$ be the total debt due at the end of $T$ years. The annual installment $x$ is:
$$A = x 	imes T + rac{x 	imes R 	imes T(T - 1)}{200}$$
*   **Derivation:** Each installment paid continues to accumulate simple interest until the end of the loan term. The sum of the paid installments plus their interest must equal the total debt $A$.

### Compound Interest Loan Installments
For principal $P$ borrowed at rate $R\%$, to be repaid in $n$ equal annual installments $x$:
$$P = rac{x}{\left(1 + R/100ight)^1} + rac{x}{\left(1 + R/100ight)^2} + \dots + rac{x}{\left(1 + R/100ight)^n}$$
*   **Derivation:** The present value of all future installments paid must equal the initial principal borrowed ($P$).\n