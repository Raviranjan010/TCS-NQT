# Concept Guide: Number System

This file explains the foundational mechanics of the Number System, covering prime factorization, divisibility, and remainder cycles.

---

## ⚓ Real-World Anchor: The Assembly Line

Imagine a parcel sorting facility where items are grouped into boxes.

```
Incoming Items:  ●  ●  ●  ●  ●  ●  ●  ●  ●  ●  ●  ●
Container (Size 4): [● ● ● ●] [● ● ● ●] [● ● ● ●]  --> Leftover: 0
Container (Size 5): [● ● ● ● ●] [● ● ● ● ●]        --> Leftover: 2
```

- When grouped in 4s, no items remain (Remainder $= 0$).
- When grouped in 5s, 2 items remain (Remainder $= 2$).
- This leftover tracking is the basis of modular arithmetic and divisibility rules in NQT.

---

## 📐 Formal Definitions & Classifications

Numbers are grouped into specific classes based on their algebraic properties:

| Set Name | Symbol | Definition | Example |
| :--- | :--- | :--- | :--- |
| **Natural Numbers** | $\mathbb{N}$ | Counting numbers starting from 1 | $1, 2, 3\dots$ |
| **Whole Numbers** | $\mathbb{W}$ | Natural numbers plus 0 | $0, 1, 2, 3\dots$ |
| **Integers** | $\mathbb{Z}$ | Positive, negative, and zero whole values | $-3, 0, 5\dots$ |
| **Prime Numbers** | $P$ | Natural numbers $> 1$ with exactly 2 factors | $2, 3, 5, 7, 11\dots$ |
| **Composite Numbers** | $C$ | Numbers with more than 2 factors | $4, 6, 8, 9\dots$ |

---

## 🎯 Core Insight: Unique Prime Factorization

Every composite number can be uniquely factored into a product of prime numbers:
$$N = p_1^{a_1} \cdot p_2^{a_2} \cdot p_3^{a_3}\dots$$
This prime profile acts as a unique mathematical fingerprint, determining:
1. All factors and their sums.
2. Divisibility behavior.
3. Common divisors (GCD) and multiples (LCM).

---

## 🔗 Connections to Other Sections
- **Percentages**: Finding rates of divisible counts.
- **Advanced Quant**: Used in modular congruences, Fermat's Little Theorem, and Euler's totient calculations.
- **Coding**: Standard index checks, hash mappings, and prime number checks.
