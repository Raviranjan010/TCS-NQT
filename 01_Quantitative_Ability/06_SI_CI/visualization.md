# Simple & Compound Interest — Visual Diagrams

This file visualizes the differences in growth between linear (SI) and exponential (CI) interest rates and loan installment timelines.

---

## 1. Linear vs. Exponential Growth Flow

This diagram illustrates how SI remains constant over time while CI compounds iteratively on accumulated interest.

```mermaid
graph TD
    A[Principal P] -->|Year 1| B[SI: Earns on P]
    A -->|Year 1| C[CI: Earns on P]
    B -->|Year 2| D[SI: Earns ONLY on P]
    C -->|Year 2| E["CI: Earns on (P + Year 1 Interest)"]
```

---

## 2. Installment Present Value Discounting (CI)

This diagram visualizes how future payments are discounted to equal the current borrowed amount.

```mermaid
graph LR
    P[Borrowed Principal P]
    X1[Installment Year 1] -->|Discount / k| P
    X2[Installment Year 2] -->|Discount / k^2| P
    X3[Installment Year 3] -->|Discount / k^3| P
```

---

## 3. Comparison Summary
1.  **Simple Interest:** Fixed growth, constant rate per year.
2.  **Compound Interest:** compounding growth, rate scales exponentially over periods.
3.  **Installments:** Present value represents the sum of discounted cash flows.\n