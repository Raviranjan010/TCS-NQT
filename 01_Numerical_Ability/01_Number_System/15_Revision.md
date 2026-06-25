# Revision Guide: Number System

A high-speed review checklist to reinforce divisibility, factorization, and remainders.

---

## ⚡ The 1-Minute Checklist

- [ ] **Unit Digit Exponent**: Exponent mod 4 gives the cycle state. Exponent mod $4 = 0 \implies$ use power 4.
- [ ] **Fermat's Theorem**: $a^{p-1} \equiv 1 \pmod p$ if $p$ is prime.
- [ ] **HCF of Fractions**: $\frac{\text{HCF of Numerators}}{\text{LCM of Denominators}}$.
- [ ] **LCM of Fractions**: $\frac{\text{LCM of Numerators}}{\text{HCF of Denominators}}$.

---

## ⏱️ The 5-Minute Checklist

- [ ] **Factors Count**: Prime factorize: $p^a q^b r^c \implies (a+1)(b+1)(c+1)$.
- [ ] **Sum of Factors**: $\frac{p^{a+1}-1}{p-1} \times \frac{q^{b+1}-1}{q-1}$.
- [ ] **Even Factors**: Total factors $-$ Odd factors.
- [ ] **LCM Constant Remainder**: $\text{LCM} + \text{Remainder}$.
- [ ] **LCM Different Remainders**: $\text{LCM} - K$ (where $K = \text{Divisor} - \text{Remainder}$).

---

## ⌛ The 15-Minute Checklist

Scan this checklist to debug common test case failures:

1. **Perfect Squares**: Remember that perfect squares always have an odd number of factors.
2. **Proper Factors**: Ensure you subtract 1 (excluding $N$) if asked for proper factors.
3. **Divisibility of 11**: Alternate digit sum difference: $| \text{Odd Sum} - \text{Even Sum} | = 0$ or multiple of 11.
4. **Divisibility of 72**: Check divisibility by both 8 and 9.
5. **Divisibility of 8**: Verify that the last three digits are divisible by 8.
6. **FIB answer formatting**: Enter numbers only; do not add text, decimals, or symbols.
