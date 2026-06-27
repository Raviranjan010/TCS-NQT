# Average — Formulas & Derivations

This document compiles the essential mathematical formulas, derivations, and quick revision resources for Average, Weighted Average, Average Speed, and Group Deviation.

---

## 1. Core Mathematical Expressions

### Basic Arithmetic Mean
$$\text{Average } (A) = \frac{\text{Sum of all elements } (S)}{\text{Number of elements } (N)}$$
*   **Derivation:** An average is a uniform redistribution of the total sum across $N$ elements. Therefore, $S = A \times N$.

### Weighted Average
$$A_{\text{weighted}} = \frac{n_1 A_1 + n_2 A_2 + \dots + n_k A_k}{n_1 + n_2 + \dots + n_k}$$
*   **Derivation:** Sum of elements in Group $i$ is $n_i A_i$. Combining $k$ groups, the total sum is $\sum n_i A_i$, and the total count is $\sum n_i$. Dividing the total sum by the total count yields the weighted average.

---

## 2. Average Speed Formulas

### Case 1: Equal Distances (2 Speeds)
$$v_{\text{avg}} = \frac{2 v_1 v_2}{v_1 + v_2}$$
*   **Derivation:** Let distance of each segment be $D$.
    $$\text{Average Speed} = \frac{2D}{\frac{D}{v_1} + \frac{D}{v_2}} = \frac{2}{\frac{v_2 + v_1}{v_1 v_2}} = \frac{2 v_1 v_2}{v_1 + v_2}$$

### Case 2: Equal Distances (3 Speeds)
$$v_{\text{avg}} = \frac{3 v_1 v_2 v_3}{v_1 v_2 + v_2 v_3 + v_3 v_1}$$
*   **Derivation:** Let distance of each segment be $D$.
    $$\text{Average Speed} = \frac{3D}{\frac{D}{v_1} + \frac{D}{v_2} + \frac{D}{v_3}} = \frac{3 v_1 v_2 v_3}{v_2 v_3 + v_1 v_3 + v_1 v_2}$$

---

## 3. Quick Revision Reference Table

| Formula Name | Algebraic Expression | Standard Application |
| :--- | :--- | :--- |
| Arithmetic Mean | $A = \frac{\sum X}{N}$ | Standard average calculation |
| Weighted Average | $A_w = \frac{\sum n_i A_i}{\sum n_i}$ | Combining classes or sections |
| Average Speed (Equal D) | $v_{\text{avg}} = \frac{2v_1v_2}{v_1+v_2}$ | Round trips, two equal halves |
| Average Speed (Equal T) | $v_{\text{avg}} = \frac{v_1+v_2}{2}$ | Uniform travel time periods |
| Addition Deviation | $\text{New} = \text{New Avg} + N(\Delta A)$ | New candidate joining group |
| Removal Deviation | $\text{Removed} = \text{Old Avg} + (N-1)(\Delta A)$ | Member leaving a team |
| Substitution Deviation | $\text{New} = \text{Replaced} + N(\Delta A)$ | Replacing member in a group |
| Consecutive AP Sum | $\text{Avg} = \frac{\text{First} + \text{Last}}{2}$ | Arithmetic progression series |
