# Expected Questions: Number System (2026 Exam Cycle)

This file contains 10 predicted practice questions modeled after recent TCS NQT exam trends, focusing on prime factorization, modular congruences, and divisor properties.

---

## 📋 Expected Questions Booklet

### Q1. Divisibility check for 11 and 9 combined (99)
**Question**: If the 8-digit number $34A56B12$ is divisible by 99, find the value of $A + B$. (FIB)
- **Hint**: Divisible by 9 and 11.
- **Detailed Solution**:
  - Divisibility by 9: Sum $= 3+4+A+5+6+B+1+2 = 21 + A + B \implies A+B = 6$ or $15$.
  - Divisibility by 11: Odd sum $= 2 + B + 5 + 4 = 11 + B$.
  - Even sum $= 1 + 6 + A + 3 = 10 + A$.
  - Difference $= (11 + B) - (10 + A) = 1 + B - A$.
  - For difference to be $0 \implies A - B = 1$.
  - If $A - B = 1$ and $A + B = 15 \implies 2A = 16 \implies A=8, B=7$ (Valid digits).
  - So $A+B = 15$.
- **Shortcut**: Sum of digits modulo 9 and alternating sum modulo 11.
- **Common Mistake**: Assuming $A+B$ must equal 6 without verifying if the difference fits the 11-divisibility rule.

---

### Q2. Total proper factors count
**Question**: Find the number of proper factors of $360$. (FIB)
- **Hint**: Proper factors exclude the number itself.
- **Detailed Solution**:
  - Prime factorization: $360 = 2^3 \times 3^2 \times 5^1$.
  - Total factors $= (3+1)(2+1)(1+1) = 4 \times 3 \times 2 = 24$.
  - Proper factors $= 24 - 1 = 23$ (excluding $360$).
- **Shortcut**: Calculate total factors and subtract 1.
- **Common Mistake**: Excluding both 1 and $360$ (subtracting 2). Proper factors only exclude the number itself.

---

### Q3. High exponent remainder prime divisor
**Question**: Find the remainder when $5^{2026}$ is divided by 13. (FIB)
- **Hint**: Apply Fermat's Little Theorem ($5^{12} \equiv 1 \pmod{13}$).
- **Detailed Solution**:
  - Exponent mod 12: $2026 \pmod{12} = 10$.
  - $5^{2026} \equiv 5^{10} \pmod{13}$.
  - $5^2 = 25 \equiv -1 \pmod{13} \implies 5^{10} = (5^2)^5 \equiv (-1)^5 \equiv -1 \equiv 12 \pmod{13}$.
- **Shortcut**: $5^2 \equiv -1 \implies 5^{10} \equiv (-1)^5 \equiv -1 \equiv 12$.
- **Common Mistake**: Calculating $5^{10}$ directly without using negative modular residues.

---

### Q4. Product of factors count
**Question**: Find the product of all factors of $180$. (FIB)
- **Hint**: Use formula: $Product = N^{\frac{\text{Total Factors}}{2}}$.
- **Detailed Solution**:
  - $180 = 2^2 \times 3^2 \times 5^1 \implies \text{Factors} = (3)(3)(2) = 18$.
  - Product $= 180^{18/2} = 180^9$.
- **Shortcut**: Pre-calculate total factor count, then raise the base to half that power.
- **Common Mistake**: Using incorrect total factor count.

---

### Q5. Alternating LCM remainders
**Question**: Find the least number which when divided by 12, 15, and 20 leaves remainders 8, 11, and 16 respectively. (FIB)
- **Hint**: Divisors $-$ Remainders $= K$. Check if $K$ is constant.
- **Detailed Solution**:
  - $12 - 8 = 4$, $15 - 11 = 4$, $20 - 16 = 4 \implies K = 4$.
  - $\text{LCM}(12, 15, 20) = 60$.
  - Number $= 60 - 4 = 56$.
- **Shortcut**: Subtract constant difference from LCM.
- **Common Mistake**: Adding the remainder offset instead of subtracting it.

---

### Q6. HCF of large integers
**Question**: Find the HCF of $2^3 \times 3^2 \times 5^5$ and $2^2 \times 3^3 \times 5^2 \times 7^1$. (MCQ)
- **Options**: A. $300$, B. $900$, C. $450$, D. $180$
- **Hint**: Take the lowest exponent of common prime factors.
- **Detailed Solution**:
  - Common bases are $2, 3, 5$.
  - Lowest exponents: $2^2, 3^2, 5^2$.
  - $\text{HCF} = 2^2 \times 3^2 \times 5^2 = 4 \times 9 \times 25 = 900$.
- **Shortcut**: $2^2 \times 5^2 = 100 \implies \text{HCF} = 100 \times 9 = 900$.
- **Common Mistake**: Including 7 in HCF calculation.

---

### Q7. Unit digit of factorial sum
**Question**: Find the unit digit of: $1! + 2! + 3! + \dots + 100!$. (FIB)
- **Hint**: Factorials from $5!$ onwards end in 0.
- **Detailed Solution**:
  - $1! = 1$
  - $2! = 2$
  - $3! = 6$
  - $4! = 24 \implies 4$
  - $5! = 120 \implies 0$
  - Sum unit digit $= 1 + 2 + 6 + 4 = 13 \implies 3$.
- **Shortcut**: Stop summation check at $4!$.
- **Common Mistake**: Calculating factorials beyond $5!$ manually.

---

### Q8. Divisors count divisible by 6
**Question**: How many factors of $360$ are divisible by 6? (FIB)
- **Hint**: Factor out 6: $360 = 6 \times (2^2 \times 3^1 \times 5^1)$.
- **Detailed Solution**:
  - Remaining part: $2^2 \times 3^1 \times 5^1$.
  - Factors count $= (2+1)(1+1)(1+1) = 3 \times 2 \times 2 = 12$.
- **Shortcut**: Divide number by 6, find factors of remaining quotient.
- **Common Mistake**: Counting all factors and dividing by 6.

---

### Q9. Prime numbers count in ranges
**Question**: How many prime numbers are there between 50 and 100? (FIB)
- **Hint**: List them out systematically.
- **Detailed Solution**:
  - Primes are: $53, 59, 61, 67, 71, 73, 79, 83, 89, 97$.
  - Total count $= 10$.
- **Shortcut**: Remember count between 1-50 is 15, and 1-100 is 25 $\implies 25 - 15 = 10$.
- **Common Mistake**: Counting composite numbers ending in 7 (like 57, 87) as prime.

---

### Q10. Remainder of large power composite divisor
**Question**: Find the remainder when $2^{100}$ is divided by 9. (FIB)
- **Hint**: Apply Euler's totient theorem ($\phi(9) = 9(2/3) = 6$).
- **Detailed Solution**:
  - Since $\gcd(2, 9) = 1$, $2^6 \equiv 1 \pmod 9$.
  - Reduce power: $100 \pmod 6 = 4$.
  - $2^{100} \equiv 2^4 \pmod 9 = 16 \pmod 9 = 7$.
- **Shortcut**: $2^3 = 8 \equiv -1 \pmod 9 \implies 2^{100} = (2^3)^{33} \cdot 2^1 \equiv (-1)^{33} \cdot 2 \equiv -2 \equiv 7 \pmod 9$.
- **Common Mistake**: Divisor is composite, so using prime mod rules fails.
