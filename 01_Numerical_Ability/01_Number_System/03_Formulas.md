# Formula Guide: Number System

This guide covers the derivations and formulas for factor counting, summation, and remainders, with immediate worked examples.

---

## 📐 Formulas & Derivations

### 1. Total Number of Factors
- **Formula**: For a number $N = p^a \cdot q^b \cdot r^c\dots$ where $p, q, r$ are prime factors:
  $$\text{Total Factors} = (a + 1)(b + 1)(c + 1)\dots$$
- **Derivation**: Each prime factor $p$ can be chosen in $(a+1)$ ways (from $p^0$ to $p^a$). By the multiplication rule, the total selections form the set of divisors.
- **Worked Example**: Find total factors of $24$.
  - $24 = 2^3 \times 3^1 \implies \text{Total Factors} = (3 + 1)(1 + 1) = 8$.
  - Factors are: $1, 2, 3, 4, 6, 8, 12, 24$.

---

### 2. Sum of All Factors
- **Formula**:
  $$\text{Sum} = \frac{p^{a+1} - 1}{p - 1} \times \frac{q^{b+1} - 1}{q - 1}\dots$$
- **Derivation**: The sum of factors is the expansion of:
  $$(p^0 + p^1 + \dots + p^a)(q^0 + q^1 + \dots + q^b)\dots$$
  Applying the geometric progression sum formula for each bracket:
  $$\sum_{i=0}^{a} p^i = \frac{p^{a+1} - 1}{p - 1}$$
- **Worked Example**: Find sum of factors of $12 = 2^2 \times 3^1$.
  - $\text{Sum} = \frac{2^3 - 1}{2 - 1} \times \frac{3^2 - 1}{3 - 1} = \frac{7}{1} \times \frac{8}{2} = 7 \times 4 = 28$.
  - Checking manually: $1 + 2 + 3 + 4 + 6 + 12 = 28$.

---

### 3. Unit Digit Cycles
- **Formula**: For base $D$ and exponent $E$, the unit digit is:
  $$\text{Unit Digit} = D^{R} \pmod{10}$$
  where $R = E \pmod 4$. If $R = 0$, set $R = 4$.
- **Worked Example**: Find unit digit of $3^{42}$.
  - Here $D = 3, E = 42 \implies R = 42 \pmod 4 = 2$.
  - $\text{Unit Digit} = 3^2 \pmod{10} = 9$.

---

### 4. Product of Factors
- **Formula**:
  $$\text{Product} = N^{\frac{\text{Total Factors}}{2}}$$
- **Worked Example**: Find product of factors of $12$.
  - Total Factors $= 6$.
  - $\text{Product} = 12^{6/2} = 12^3 = 1728$.
  - Checking: $(1 \times 12) \times (2 \times 6) \times (3 \times 4) = 12 \times 12 \times 12 = 1728$.
