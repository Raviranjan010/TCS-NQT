# Average — Revision Notes (Quick Summary)

This document is a one-page summary designed for last-minute revision before the TCS NQT exam.

---

## 1. Fundamentals

### Arithmetic Mean
*   $$\text{Average} = \frac{\text{Sum}}{\text{Count}}$$
*   $$\text{Sum} = \text{Average} \times \text{Count}$$

### Consecutive Series (AP)
For any series with a common difference (e.g., consecutive numbers, evens, odds):
*   $$\text{Average} = \frac{\text{First Term} + \text{Last Term}}{2}$$
*   The average is the exact middle term of the series.

---

## 2. Weighted Average & Speed

### Weighted Average
$$A_w = \frac{n_1 A_1 + n_2 A_2 + \dots}{n_1 + n_2 + \dots}$$
*   **Shortcut:** You can simplify the group counts ($n_i$) into their simplest ratio before applying the formula.

### Average Speed
$$\text{Average Speed} = \frac{\text{Total Distance}}{\text{Total Time}}$$
*   **Equal segments (2 speeds):** $v_{\text{avg}} = \frac{2v_1v_2}{v_1+v_2}$ (Harmonic Mean).
*   **Equal segments (3 speeds):** $v_{\text{avg}} = \frac{3v_1v_2v_3}{v_1v_2 + v_2v_3 + v_3v_1}$.
*   **Equal time intervals:** $v_{\text{avg}} = \frac{v_1 + v_2}{2}$ (Arithmetic Mean).

---

## 3. Group Changes (Deviation Method)

Instead of multiplying large numbers, track the net changes in the average:

*   **Addition:** $\text{New Value} = \text{New Average} + N \times (\text{Average Increase})$
*   **Removal:** $\text{Removed Value} = \text{Old Average} + (N-1) \times (\text{Average Decrease})$
*   **Substitution:** $\text{New Value} = \text{Replaced Value} + N \times (\text{Average Increase})$
    *   *where $N$ is the count of the final group (or initial group in substitution).*
