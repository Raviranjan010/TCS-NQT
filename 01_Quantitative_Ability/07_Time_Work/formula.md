# Time & Work — Formulas & Derivations

This document compiles the core formulas and algebraic derivations for rate-efficiency models, LCM methods, pipes and cisterns, and wages.

---

## 1. Core Formulas

### Rate and Time Inverse Relation
$$T = rac{W}{R}$$
*   **Derivation:** Work is defined as Rate $	imes$ Time. For a constant amount of work $W$, rate and time are inversely proportional: $R_1 T_1 = R_2 T_2$.

### Time Taken by Two People Together
$$T_{AB} = rac{A 	imes B}{A + B}$$
*   **Derivation:** Let A take $A$ days and B take $B$ days.
    *   Daily rate of A = $1/A$, daily rate of B = $1/B$.
    *   Combined daily rate = $rac{1}{A} + rac{1}{B} = rac{A + B}{A 	imes B}$.
    *   Time taken = reciprocal of combined rate = $rac{A 	imes B}{A + B}$.

---

## 2. Pipes & Cisterns Relations

### Filling Tank with a Leak
$$T_{	ext{net}} = rac{E 	imes F}{E - F}$$
*   **Derivation:** Let inlet fill tank in $F$ hours and leak empty it in $E$ hours.
    *   Inlet rate = $1/F$ (positive).
    *   Leak rate = $1/E$ (negative).
    *   $$	ext{Net Rate} = rac{1}{F} - rac{1}{E} = rac{E - F}{E 	imes F}$$.
    *   $$T_{	ext{net}} = 	ext{reciprocal} = rac{E 	imes F}{E - F}$$.

---

## 3. Work-Wages & Chain Rule

### Man-Days-Hours Chain Rule
$$rac{M_1 D_1 H_1}{W_1} = rac{M_2 D_2 H_2}{W_2}$$
*   **Derivation:** Total work done is directly proportional to number of men ($M$), days ($D$), and hours per day ($H$). Hence, $rac{M 	imes D 	imes H}{W} = 	ext{constant}$.

### Wage Partition Formula
$$	ext{Wage}_A = 	ext{Total Wage} 	imes \left(rac{R_A 	imes T_A}{	ext{Total Work Done}}ight)$$
*   **Derivation:** Wages are paid for the actual fraction of total work performed.\n