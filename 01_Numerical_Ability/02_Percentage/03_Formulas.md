# Percentage Formula Sheet

## 1. Fraction-to-Percentage Conversion Table
Converting percentages to fractions speeds up mental arithmetic. Memorize this scale:

| Fraction | Percentage | Fraction | Percentage |
| :--- | :--- | :--- | :--- |
| $\frac{1}{2}$ | $50\%$ | $\frac{1}{8}$ | $12.5\%$ |
| $\frac{1}{3}$ | $33.33\%$ | $\frac{1}{9}$ | $11.11\%$ |
| $\frac{1}{4}$ | $25\%$ | $\frac{1}{10}$ | $10\%$ |
| $\frac{1}{5}$ | $20\%$ | $\frac{1}{11}$ | $9.09\%$ |
| $\frac{1}{6}$ | $16.67\%$ | $\frac{1}{12}$ | $8.33\%$ |
| $\frac{1}{7}$ | $14.28\%$ | $\frac{1}{15}$ | $6.67\%$ |

---

## 2. Basic Percentage Change
$$\text{Percentage Change} = \frac{\text{Final Value} - \text{Initial Value}}{\text{Initial Value}} \times 100$$

### Derivation:
The change in value is $(\text{Final} - \text{Initial})$. To express this change as a fraction of the original starting point, we divide by the $\text{Initial Value}$ and multiply by $100$ to scale it to percentage form.

### Worked Example:
A product's price increases from ₹80 to ₹100. Find the percentage increase.

#### Solution:
*   Initial Value $= 80$
*   Final Value $= 100$
*   Calculation:
    $$\text{Percentage Change} = \frac{100 - 80}{80} \times 100 = \frac{20}{80} \times 100 = \frac{1}{4} \times 100 = 25\%$$

---

## 3. Net Successive Percentage Change (2 Variables)
$$\text{Net Change} = \left(x + y + \frac{xy}{100}\right)\%$$

*   Use positive values for increases ($+$).
*   Use negative values for decreases ($-$).

### Derivation:
Let the original value be $100$.
1.  After the first change $x\%$, value becomes:
    $$V_1 = 100 \times \left(1 + \frac{x}{100}\right) = 100 + x$$
2.  After the second change $y\%$ on $V_1$:
    $$V_2 = (100 + x) \left(1 + \frac{y}{100}\right) = 100 + x + y + \frac{xy}{100}$$
3.  The net change relative to the initial $100$ is:
    $$V_2 - 100 = \left(x + y + \frac{xy}{100}\right)\%$$

### Worked Example:
A shopkeeper increases prices by $30\%$, but due to low sales, gives a discount of $20\%$ on the marked price. Find the net profit/loss percentage.

#### Solution:
*   $x = +30$ (markup)
*   $y = -20$ (discount)
*   Calculation:
    $$\text{Net Change} = 30 + (-20) + \frac{30 \times (-20)}{100} = 10 - 6 = +4\%$$
    (Since it is positive, it is a $4\%$ net profit).

---

## 4. Net Successive Percentage Change (3 Variables)
$$\text{Net Change} = \left(x + y + z + \frac{xy + yz + zx}{100} + \frac{xyz}{10000}\right)\%$$

### Derivation:
Expanding the compounding term $(1 + \frac{x}{100})(1 + \frac{y}{100})(1 + \frac{z}{100})$ and subtracting the baseline of $1$ yields this combined coefficient formula.

### Worked Example:
The length, width, and height of a cuboid are increased by $10\%$, $20\%$, and $30\%$ respectively. Find the percentage change in volume.

#### Solution:
*   $x = 10$, $y = 20$, $z = 30$.
*   Calculation:
    $$\text{Sum} = 10 + 20 + 30 = 60$$
    $$\text{Pair Sums} = \frac{10(20) + 20(30) + 30(10)}{100} = \frac{200 + 600 + 300}{100} = 11$$
    $$\text{Triple Product} = \frac{10 \times 20 \times 30}{10000} = \frac{6000}{10000} = 0.6$$
    $$\text{Net Change} = 60 + 11 + 0.6 = 71.6\%$$

---

## 5. Product Constancy & Base Adjustment
$$\text{If A is } x\% \text{ more than B, B is less than A by } \left(\frac{x}{100 + x} \times 100\right)\%$$
$$\text{If A is } x\% \text{ less than B, B is more than A by } \left(\frac{x}{100 - x} \times 100\right)\%$$

### Derivation:
Let $B = 100$. If $A$ is $x\%$ more than $B$, then $A = 100 + x$.
The absolute difference is $x$.
To find what percentage B is less than A, the base shifts to $A$:
$$\text{Percentage Less} = \frac{\text{Difference}}{A} \times 100 = \frac{x}{100 + x} \times 100\%$$

### Worked Example:
If A's salary is $50\%$ more than B's, by what percentage is B's salary less than A's?

#### Solution:
*   $x = 50$
*   Calculation:
    $$\text{Percentage Less} = \frac{50}{100 + 50} \times 100 = \frac{50}{150} \times 100 = \frac{1}{3} \times 100 = 33.33\%$$
