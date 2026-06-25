# Cheat Sheet: Number System

A single-page reference for number classifications, formulas, and remainder rules.

---

## ⚡ Pattern Recognition Matrix

| If the question asks for... | ...Apply this formula or rule |
| :--- | :--- |
| "ones digit of power $A^B$..." | **Cycle mod 4 of $B$** (if remainder is 0, use power 4) |
| "least number divided by $X, Y, Z$ leaving remainder $R$..." | **$\text{LCM}(X, Y, Z) + R$** |
| "greatest number dividing $A, B$ leaving remainders $r_1, r_2$..." | **$\text{HCF}(A-r_1, B-r_2)$** |
| "how many numbers divide $N$..." | **$(a+1)(b+1)(c+1)$** from prime factors |
| "remainder when $A^B$ is divided by prime $P$..." | **Fermat's Little Theorem: $a^{p-1} \equiv 1 \pmod p$** |

---

## 📐 Mathematical Formulas

### 1. Factors count
- **Total Factors**: $(a+1)(b+1)(c+1)$
- **Sum of Factors**: $\frac{p^{a+1}-1}{p-1} \times \frac{q^{b+1}-1}{q-1}$
- **Product of Factors**: $N^{\frac{\text{Total Factors}}{2}}$
- **Odd Factors**: Omit base 2 exponents.
- **Even Factors**: Total factors $-$ Odd factors.

### 2. Modulo Arithmetic Rules
- $(A + B) \pmod M = ((A \pmod M) + (B \pmod M)) \pmod M$
- $(A \times B) \pmod M = ((A \pmod M) \times (B \pmod M)) \pmod M$

### 3. Fermat's Little Theorem
$$a^{p-1} \equiv 1 \pmod p \quad [\text{where } p \text{ is prime}, \gcd(a, p) = 1]$$

### 4. Euler's Totient Theorem
$$a^{\phi(n)} \equiv 1 \pmod n \quad [\text{where } \gcd(a, n) = 1]$$
$$\phi(n) = n\left(1 - \frac{1}{p_1}\right)\left(1 - \frac{1}{p_2}\right)\dots$$
