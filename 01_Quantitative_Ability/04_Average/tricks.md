# Average — Tricks & Traps

This document highlights option elimination, bounds check, and speed estimation tricks for averages in the TCS NQT.

---

## 1. Option Bounding & Estimation

### The "Averages Bound" Rule
An average value must *always* lie strictly between the minimum and maximum values of the observations.
*   **The Trick:** In weighted average or mixture problems, if Group 1 average is $A_1$ and Group 2 average is $A_2$ (where $A_1 < A_2$), the combined average $A_c$ must satisfy:
    $$A_1 < A_c < A_2$$
*   **Application:** Eliminate any options that are $\le A_1$ or $\ge A_2$.

### The "Alligation Midpoint" Rule
*   If Group 1 has more elements than Group 2 ($n_1 > n_2$), the combined average must be closer to $A_1$ than to $A_2$.
*   If Group 2 has more elements ($n_2 > n_1$), the combined average must be closer to $A_2$.
*   **Application:** Calculate the midpoint $M = \frac{A_1 + A_2}{2}$. If $n_1 > n_2$, eliminate any options that are $\ge M$.

---

## 2. Average Speed Tricks

### The Arithmetic Mean Bound
*   **The Trap:** When traveling at $v_1$ and $v_2$ for equal distances, the average speed is *always* less than the arithmetic mean:
    $$v_{\text{avg}} < \frac{v_1 + v_2}{2}$$
*   **Application:** If a round trip is made at 40 km/h and 60 km/h, the average speed *must* be less than the arithmetic mean $50$ km/h. Look at the options and eliminate any options $\ge 50$ (specifically, the answer is $48$ km/h).

---

## 3. The "Arithmetic Mean Scale" Trick
If every element in a group is multiplied, divided, added, or subtracted by a constant $k$, the average of the group changes by the exact same operation.
*   **Application:** If the average age of a group of 12 people is 28 years, the average age of the same group 3 years ago was simply $28 - 3 = 25$ years. No need to sum individual ages or set up equations!
*   **Scaling:** If the average salary of 10 workers is 15,000 Rupees and each receives a $10\%$ hike, the new average is simply $15,000 \times 1.10 = 16,500$ Rupees.
