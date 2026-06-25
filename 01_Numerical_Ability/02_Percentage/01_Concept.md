# Percentage Concept Guide

## 1. Introduction to Percentages
### What is this?
A percentage is a way of expressing any number as a fraction of 100 (literally "per cent" or "per hundred"), allowing us to compare different scales directly.

### Why does TCS ask this?
TCS NQT tests percentages to verify your quick-calculation speed and your ability to solve multi-stage growth problems (e.g., compound interest, population shifts, and profit margins).

### How do I recognize it?
Look for trigger words like: *"percent increase/decrease"*, *"successive change"*, *"consumption reduction"*, or *"net change"*.

### What is the fastest way to solve it?
Use **fraction equivalents** (e.g., instead of multiplying by $0.25$, use $\frac{1}{4}$) and **multiplying factors** (e.g., a $20\%$ increase means multiplying by $1.20$, or $\frac{6}{5}$).

### What is the most common trap?
Assuming percentages can be added directly (e.g., a $+10\%$ change followed by a $-10\%$ change is NOT a $0\%$ change).

### What does a hard version look like?
A multi-stage problem where the base shifts repeatedly and uses fractional percentage changes (e.g., $16.67\%$ increase followed by a $14.28\%$ decrease).

---

## 2. The Core Concept: Base & Comparison
Every percentage statement requires a **Base** (the reference point).
$$\text{Percentage} = \frac{\text{Part}}{\text{Whole (Base)}} \times 100$$

Here is the mental model for identifying the base:

```
           "Is X what percent of Y?"
                       |
        +--------------+--------------+
        |                             |
     What is X?                  Compared to Y?
    (Numerator)                   (Denominator)
```

### Immediate Worked Example 1 (Simple Comparison):
In a class of 80 students, 32 are female. What percentage of the class is female?

#### Step-by-Step Solution:
1. Identify the part: Females = 32.
2. Identify the whole (base): Total class = 80.
3. Apply formula:
   $$\text{Percentage} = \frac{32}{80} \times 100 = \frac{2}{5} \times 100 = 40\%$$

---

## 3. Percentage Increase & Decrease (Multiplying Factors)
When a value changes, we calculate the change relative to the *original* value (which is always the base).

| Percentage Change | Fraction Equivalent | Multiplying Factor (MF) | Example calculation with $X = 500$ |
| :--- | :--- | :--- | :--- |
| $+10\%$ (Increase) | $+\frac{1}{10}$ | $1 + \frac{1}{10} = \frac{11}{10} = 1.1$ | $500 \times 1.1 = 550$ |
| $-20\%$ (Decrease) | $-\frac{1}{5}$ | $1 - \frac{1}{5} = \frac{4}{5} = 0.8$ | $500 \times 0.8 = 400$ |
| $+12.5\%$ (Increase)| $+\frac{1}{8}$ | $1 + \frac{1}{8} = \frac{9}{8} = 1.125$ | $500 \times \frac{9}{8} = 562.5$ |

### Immediate Worked Example 2 (Increase):
The price of a book rises from ₹400 by $15\%$. What is the new price?

#### Step-by-Step Solution:
1. Identify the original price (base): ₹400.
2. Identify the multiplying factor:
   $$\text{MF} = 1 + \frac{15}{100} = 1.15$$
3. Calculate:
   $$\text{New Price} = 400 \times 1.15 = 460$$

---

## 4. Product Constancy & Base Adjustment
Often, a percentage increase in one variable must be balanced by a percentage decrease in another variable to keep their product constant.
$$\text{Product} = \text{Variable}_A \times \text{Variable}_B$$

```
                   Variable A Increases
                            |
             How to keep Product Constant?
                            |
           Variable B MUST Decrease (Adjusted Base)
```

### The Base Adjustment Rule (Fraction Scale):
If Variable A increases by $\frac{1}{x}$, Variable B must decrease by $\frac{1}{x+1}$ to keep the product constant.
If Variable A decreases by $\frac{1}{x}$, Variable B must increase by $\frac{1}{x-1}$.

### Immediate Worked Example 3 (Consumption & Price):
The price of petrol rises by $25\%$. By how much percent must a driver decrease consumption to keep expenditure constant?

#### Step-by-Step Solution:
1. Express the increase as a fraction:
   $$25\% = \frac{25}{100} = \frac{1}{4}\text{ increase}$$
2. Apply the adjustment rule:
   $$\text{Decrease required} = \frac{1}{4+1} = \frac{1}{5}$$
3. Convert fraction back to percentage:
   $$\frac{1}{5} \times 100 = 20\%$$

---

## 5. Successive Percentage Changes
Successive changes occur when a value is changed by a percentage, and the resulting new value is changed again by another percentage.

### Derivation of the Net Formula:
Let the initial value be $100$.
1. First change of $x\%$ yields:
   $$100 \times \left(1 + \frac{x}{100}\right) = 100 + x$$
2. Second change of $y\%$ on the new value yields:
   $$(100 + x) \times \left(1 + \frac{y}{100}\right) = 100 + x + y + \frac{xy}{100}$$
3. The net change from the original $100$ is:
   $$\text{Net Change} = \left(x + y + \frac{xy}{100}\right)\%$$

### Immediate Worked Example 4 (Successive Change):
A salary is increased by $20\%$ and then decreased by $10\%$. What is the net percentage change?

#### Step-by-Step Solution:
1. Assign values: $x = +20$, $y = -10$.
2. Substitute into formula:
   $$\text{Net Change} = 20 + (-10) + \frac{20 \times (-10)}{100} = 10 - 2 = +8\%$$
3. Since the result is positive, it is a **$8\%$ net increase**.
