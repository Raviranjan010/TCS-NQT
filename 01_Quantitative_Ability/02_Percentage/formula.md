# Percentage — Formulas & Derivations

This document compiles the essential formulas for solving Percentage problems in the TCS NQT.

---

## 1. Core Mathematical Expressions

### Basic Percentage Formula
$$P\% \text{ of } X = \frac{P}{100} \times X$$
*   **Derivation:** A percent represents parts per hundred. Therefore, $P\%$ translates to the fraction $\frac{P}{100}$, which is multiplied by the base value $X$.

### Percentage Increase
$$\text{New Value} = X \times \left(1 + \frac{P}{100}\right)$$
*   **Derivation:** An increase of $P\%$ on $X$ means adding $P\%$ of $X$ to $X$: $X + \left(\frac{P}{100} \times X\right) = X\left(1 + \frac{P}{100}\right)$.

### Percentage Decrease
$$\text{New Value} = X \times \left(1 - \frac{P}{100}\right)$$
*   **Derivation:** A decrease of $P\%$ on $X$ means subtracting $P\%$ of $X$ from $X$: $X - \left(\frac{P}{100} \times X\right) = X\left(1 - \frac{P}{100}\right)$.

### Percentage Change
$$\text{Change \%} = \frac{\text{Final Value} - \text{Initial Value}}{\text{Initial Value}} \times 100$$
*   **Derivation:** The relative growth is calculated by finding the absolute difference and dividing it by the initial base value, normalized to a percentage.

---

## 2. Advanced & Successive Formulas

### Successive Percentage Change (2 Variables)
$$\text{Net \% Change} = A + B + \frac{AB}{100}$$
*   **Derivation:** Let a value $X$ increase by $A\%$, becoming $X(1 + a/100)$. Increasing it by $B\%$ yields:
    $$X\left(1 + \frac{A}{100}\right)\left(1 + \frac{B}{100}\right) = X\left(1 + \frac{A}{100} + \frac{B}{100} + \frac{AB}{10000}\right) = X\left(1 + \frac{A + B + \frac{AB}{100}}{100}\right)$$

### Successive Change (Population Growth / Depreciation)
$$P_{\text{final}} = P_{\text{initial}} \times \left(1 \pm \frac{R}{100}\right)^n$$
*   **Derivation:** This is compound growth where the base value changes at each interval. Over $n$ periods with a constant rate $R$, the multiplier is applied $n$ times.

---

## 3. Quick Revision Reference Table

| Formula Name | Algebraic Expression | Standard Application |
| :--- | :--- | :--- |
| Basic Calculation | $\text{Value} = \text{Base} \times \frac{P}{100}$ | Standard calculations |
| Growth Multiplier | $\text{Multiplier} = 1 + \frac{P}{100}$ | Finding final salary or cost |
| Successive Net Change | $A + B + \frac{AB}{100}$ | Multi-step price markups |
| Product Constancy | $\text{Decrease} = \frac{x}{100 + x} \times 100$ | Balancing price and consumption |
| Population Growth | $P_n = P_0(1 + r/100)^n$ | Compound annual growth |
| Population Depreciation | $P_n = P_0(1 - r/100)^n$ | Machinery value depreciation |
| Percentage Points | $\text{pp} = P_{\text{final}} - P_{\text{initial}}$ | Graph calculations |
| Fraction Conversion | $\text{Fraction} = \frac{P}{100}$ | Solving arithmetic quickly |
