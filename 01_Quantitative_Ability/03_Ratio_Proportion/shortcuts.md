# Ratio & Proportion — Exam Shortcuts & Hacks

These shortcuts are designed to bypass long systems of algebraic equations in the TCS NQT.

---

## 1. Ratio Balancing (The "N" Method)

When given two overlapping ratios (e.g., $A:B$ and $B:C$), you can combine them into a single continuous ratio $A:B:C$ in one step.

### The Algorithm
Given:
$$A:B = x:y$$
$$B:C = z:w$$

Multiply the terms along the paths:
1.  **A's term:** $x \times z$ (vertical left)
2.  **B's term:** $y \times z$ (diagonal)
3.  **C's term:** $y \times w$ (vertical right)

$$A:B:C = (x \times z) : (y \times z) : (y \times w)$$

### Example
Combine $A:B = 2:3$ and $B:C = 4:5$.
*   **Step 1:** $A = 2 \times 4 = 8$
*   **Step 2:** $B = 3 \times 4 = 12$
*   **Step 3:** $C = 3 \times 5 = 15$
*   **Result:** $A:B:C = 8:12:15$

---

## 2. The Cross-Multiplication Method (Age & Salary Problems)

This shortcut solves problems of the type: "The ratio of two numbers is $A:B$. If $X$ is added to both, the new ratio becomes $C:D$. Find the numbers."

### Formula
Let the initial numbers be $Ax$ and $Bx$.
$$\text{Difference multiplier } (x) = \frac{\text{Change } (X) \times \text{Difference of new ratio terms } |C - D|}{\text{Cross-product difference of ratios } |AD - BC|}$$

### Example
The ratio of incomes of A and B is $3:2$, and their expenditure ratio is $5:3$. If each saves 1000 Rupees, find their incomes.
*   Initial Ratio = $3:2$ (A:B)
*   Final Ratio = $5:3$ (C:D)
*   Change ($X$) = $-1000$ (savings are income minus expenditure)
*   $$x = \frac{1000 \times |5 - 3|}{|3 \times 3 - 2 \times 5|} = \frac{1000 \times 2}{|9 - 10|} = \frac{2000}{1} = 2000$$
*   A's Income = $3 \times 2000 = 6000$ Rupees.
*   B's Income = $2 \times 2000 = 4000$ Rupees.
*   *Time saved:* Under 15 seconds compared to solving $3x - 5y = 1000$ and $2x - 3y = 1000$.
