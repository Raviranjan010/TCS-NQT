# Simple and Compound Interest - Concept Guide

## 1. Simple Interest (SI)
Simple Interest is calculated only on the original principal amount. The interest earned each year remains constant.

### Derivation of the SI Formula:
Since interest is directly proportional to the Principal ($P$), Rate of interest per year ($R\%$), and Time duration in years ($T$):
$$\text{Interest} \propto P \times R \times T$$
With rate $R$ expressed as a fraction $R/100$, the constant of variation is $1/100$. Thus:
$$\text{SI} = \frac{P \cdot R \cdot T}{100}$$

### Immediate Worked Example:
Calculate the SI on ₹8,000 at $10\%$ per annum for 3 years.
*   **Step 1:** Identify parameters: $P = 8000$, $R = 10$, $T = 3$.
*   **Step 2:** Apply formula:
    $$\text{SI} = \frac{8000 \times 10 \times 3}{100} = ₹2,400$$

---

## 2. Compound Interest (CI)
Compound Interest is calculated on the principal plus the accumulated interest of previous periods (interest on interest).

### Derivation of the CI Amount Formula:
*   Year 1: Principal is $P$. Interest is $P \times \frac{R}{100}$.
    $$\text{Amount } A_1 = P + P\left(\frac{R}{100}\right) = P\left(1 + \frac{R}{100}\right)$$
*   Year 2: Principal is now $A_1$.
    $$\text{Amount } A_2 = A_1\left(1 + \frac{R}{100}\right) = P\left(1 + \frac{R}{100}\right)^2$$
*   Inductively for $T$ years:
    $$A = P\left(1 + \frac{R}{100}\right)^T$$
$$\text{Compound Interest (CI)} = A - P = P\left[\left(1 + \frac{R}{100}\right)^T - 1\right]$$

### Immediate Worked Example:
Find the CI on ₹8,000 at $10\%$ p.a. compounded annually for 2 years.
*   **Step 1:** Find Amount:
    $$A = 8000 \times \left(1 + \frac{10}{100}\right)^2 = 8000 \times (1.1)^2 = 8000 \times 1.21 = ₹9,680$$
*   **Step 2:** Interest:
    $$\text{CI} = 9680 - 8000 = ₹1,680$$
