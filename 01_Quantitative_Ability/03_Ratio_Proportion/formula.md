# Ratio & Proportion — Formulas & Derivations

This document compiles the algebraic formulas, derivations, and quick revision resources for Ratio, Proportion, Partnership, and Mixture & Alligation.

---

## 1. Ratio & Proportion Relations

### Duplicate and Triplicate Ratios
$$\text{Duplicate Ratio of } a:b = a^2:b^2$$
$$\text{Triplicate Ratio of } a:b = a^3:b^3$$
*   **Derivation:** Compound the ratio with itself once ($a/b \times a/b = a^2/b^2$) or twice ($a/b \times a/b \times a/b = a^3/b^3$).

### Mean Proportional
$$b = \sqrt{ac}$$
*   **Derivation:** If $a, b, c$ are in continued proportion, then $\frac{a}{b} = \frac{b}{c} \implies b^2 = ac \implies b = \sqrt{ac}$.

### Third Proportional
$$c = \frac{b^2}{a}$$
*   **Derivation:** From $\frac{a}{b} = \frac{b}{c}$, cross-multiplying gives $ac = b^2 \implies c = \frac{b^2}{a}$.

### Fourth Proportional
$$d = \frac{bc}{a}$$
*   **Derivation:** If $a, b, c, d$ are in proportion, then $\frac{a}{b} = \frac{c}{d} \implies ad = bc \implies d = \frac{bc}{a}$.

---

## 2. Partnership Profits

$$\text{Profit}_A : \text{Profit}_B = (I_A \times T_A) : (I_B \times T_B)$$
*   **Derivation:** Profit sharing is directly proportional to the capital invested ($I$) and the time ($T$) for which the capital is deployed. Thus, $\text{Profit} \propto I \times T$.

---

## 3. Alligation & Replacement Formulas

### Alligation Equation
$$\frac{q_c}{q_d} = \frac{D - M}{M - C}$$
*   **Derivation:** Total Cost of Cheaper ($q_c \times C$) + Total Cost of Dearer ($q_d \times D$) = Total Cost of Mixture ($[q_c + q_d] \times M$).
    $$q_c C + q_d D = q_c M + q_d M \implies q_d(D - M) = q_c(M - C) \implies \frac{q_c}{q_d} = \frac{D - M}{M - C}$$

### Successive Dilution / Replacement Formula
$$Q_n = Q_0 \times \left(1 - \frac{x}{V}\right)^n$$
*   **Derivation:** Each operation removes a fraction $\frac{x}{V}$ of the active liquid, leaving a fraction $\left(1 - \frac{x}{V}\right)$. Over $n$ steps, the remaining fraction scales exponentially.

---

## 4. Quick Revision Reference Table

| Formula Name | Algebraic Expression | Standard Application |
| :--- | :--- | :--- |
| Mean Proportional | $b = \sqrt{ac}$ | Mid-term in continued proportion |
| Third Proportional | $c = b^2 / a$ | Third term in continued proportion |
| Fourth Proportional | $d = bc / a$ | Finding missing term in proportion |
| Compound Ratio | $\frac{a}{b} \times \frac{c}{d} = \frac{ac}{bd}$ | Combining independent ratios |
| Simple Partnership | $P_A : P_B = I_A : I_B$ | Invested for equal time |
| Compound Partnership | $P_A:P_B = I_A T_A : I_B T_B$ | Invested for unequal time |
| Alligation Rule | $\frac{q_c}{q_d} = \frac{D - M}{M - C}$ | Finding mixing ratios |
| Successive Dilution | $Q_n = Q_0(1 - x/V)^n$ | Milk-water replacement problems |
