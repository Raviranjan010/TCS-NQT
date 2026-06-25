# Visual Guide: Number System

This file provides decision trees and mapping charts to help you visualize number patterns under exam conditions.

---

## 🗺️ Divisibility Rules Decision Tree

Use this flowchart to quickly identify how to check divisibility for different prime and composite numbers:

```
                            [Select Divisor Check]
                                      |
         +----------------------------+----------------------------+
         |                            |                            |
    [Last Digits]               [Digit Sums]               [Alternating Sum]
         |                            |                            |
  Divisors: 2, 4, 8            Divisors: 3, 9                 Divisor: 11
  - 2: Last digit is even      - 3: Sum is div by 3           - Odd sum - Even sum
  - 4: Last 2 digits div by 4  - 9: Sum is div by 9             must equal 0 or
  - 8: Last 3 digits div by 8                                   multiple of 11
```

---

## 🔄 Unit Digit Cycles (Power Cycle Map)

Unit digits repeat in cyclic intervals of 1, 2, or 4. Refer to this chart for rapid lookup:

| Unit Digit | Cycle Length | Cyclic Pattern | Example ($D^{\text{power}}$) |
| :---: | :---: | :--- | :--- |
| **0, 1, 5, 6** | 1 | Same digit always | $5^3 = \dots5$ |
| **4** | 2 | Odd: 4, Even: 6 | $4^2 = \dots6$, $4^3 = \dots4$ |
| **9** | 2 | Odd: 9, Even: 1 | $9^2 = \dots1$, $9^3 = \dots9$ |
| **2, 3, 7, 8** | 4 | Four distinct states | $2^1=2, 2^2=4, 2^3=8, 2^4=6$ |

---

## 📊 Prime Factorization Breakdowns

Visualizing factors of $12$ using a prime grid:
$$12 = 2^2 \times 3^1$$

```
           3^0      3^1
  2^0      1        3
  2^1      2        6
  2^2      4        12
```

- Each grid intersection represents a unique factor of the number.
- Total Factors $= (\text{exponent of } 2 + 1) \times (\text{exponent of } 3 + 1) = 3 \times 2 = 6$.
- Odd factors are in the row corresponding to $2^0$.
