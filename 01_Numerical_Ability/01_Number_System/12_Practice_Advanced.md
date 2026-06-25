# Practice Set: Advanced Number System

This practice set contains 20 advanced-level questions focusing on modular arithmetic, Euler's totient theorem, and complex cryptarithmetic properties.

---

## 📝 Practice Booklet

### Q1. Modular Congruence with composite modulo division
**Question**: Solve the modular equivalence for $x$: $3x \equiv 3 \pmod 9$. (MCQ)
- **Options**: A. $x \equiv 1 \pmod 9$, B. $x \equiv 1 \pmod 3$, C. $x \equiv 3 \pmod 9$, D. $x \equiv 1 \pmod 1$
- **Hint**: Divide the congruence by 3, and divide the modulus by $\gcd(3, 9)$.
- **Detailed Solution**:
  - Equation: $3x \equiv 3 \pmod 9$.
  - Divide by $3 \implies x \equiv 1 \pmod{9 / \gcd(3,9)}$.
  - Modulus becomes $9 / 3 = 3 \implies x \equiv 1 \pmod 3$.
- **Shortcut**:
  $$x \equiv 1 \pmod 3$$
- **Common Mistake**: Dividing by 3 but keeping the modulus as 9 ($x \equiv 1 \pmod 9$).

---

### Q2. Euler's Totient Power reductions composite mod
**Question**: Find the remainder when $7^{100}$ is divided by 10. (FIB)
- **Hint**: Apply Euler's totient theorem: $\phi(10) = 10(1/2)(4/5) = 4$.
- **Detailed Solution**:
  - Since $\gcd(7, 10) = 1$, $7^4 \equiv 1 \pmod{10}$.
  - Exponent mod 4: $100 \pmod 4 = 0 \implies$ use $R=4$.
  - $7^{100} \equiv 7^4 \pmod{10} = 2401 \pmod{10} = 1$.
- **Shortcut**: Cycle of 7 is 4. Power divisible by 4 ends in 1.
- **Common Mistake**: Stating remainder is $7^0 = 1$ without confirming Euler's totient cycle.

---

### Q3. Cryptarithmetic column carries
**Question**: In the cryptarithmetic addition $SEND + MORE = MONEY$, find the value of $D + E + Y$. (FIB)
- **Hint**: Standard NQT cryptarithmetic assignment: $M=1, O=0, S=9, E=5, N=6, D=7, R=8, Y=2$.
- **Detailed Solution**:
  - Using unique digit rules:
    - $SEND \rightarrow 9567$.
    - $MORE \rightarrow 1085$.
    - $MONEY \rightarrow 10652$.
  - $D = 7, E = 5, Y = 2$.
  - Sum $= 7 + 5 + 2 = 14$.
- **Shortcut**: Memorize the standard $SEND+MORE=MONEY$ digit mappings.
- **Common Mistake**: Assuming different letters can have the same digit.

---

### Q4. Product of coprime remainders
**Question**: Find the remainder when $7^{200}$ is divided by 15. (FIB)
- **Hint**: $15 = 3 \times 5$. Solve modulo 3 and modulo 5 separately.
- **Detailed Solution**:
  - Modulo 3: $7 \equiv 1 \pmod 3 \implies 7^{200} \equiv 1^{200} \equiv 1 \pmod 3$.
  - Modulo 5: $7 \equiv 2 \pmod 5 \implies 7^{200} \equiv 2^{200} \pmod 5$.
    Since $\phi(5) = 4$, $2^4 \equiv 1 \pmod 5$. Exponent $200 \pmod 4 = 0 \implies 2^4 \equiv 1 \pmod 5$.
  - Since remainder is 1 modulo 3 and 1 modulo 5, it must be 1 modulo 15.
- **Shortcut**: Euler totient $\phi(15) = 15(2/3)(4/5) = 8$. Exponent $200 \pmod 8 = 0 \implies 7^8 \equiv 1 \pmod{15}$.
- **Common Mistake**: Dividing the exponent directly by 15.

---

### Q5. Remainder of large power composite base prime divisor
**Question**: Find the remainder when $3^{1000}$ is divided by 7. (FIB)
- **Hint**: Apply Fermat's Little Theorem ($3^6 \equiv 1 \pmod 7$).
- **Detailed Solution**:
  - Exponent mod 6: $1000 \pmod 6 = 4$.
  - $3^{1000} \equiv 3^4 \pmod 7 = 81 \pmod 7 = 4$.
- **Shortcut**: $3^2 = 9 \equiv 2 \pmod 7 \implies 3^4 \equiv 4 \pmod 7$.
- **Common Mistake**: Calculating $3^{1000}$ directly.

---

### Q6. HCF of decimals equal positions complex
**Question**: Find the HCF of $0.9, 0.18$, and $0.027$. (MCQ)
- **Options**: A. $0.009$, B. $0.09$, C. $0.9$, D. $0.027$
- **Hint**: Make decimal places equal: $0.900, 0.180, 0.027$. Find HCF of $900, 180, 27$.
- **Detailed Solution**:
  - $\text{HCF}(900, 180, 27) = 9$.
  - Re-apply decimal shift $\implies 0.009$.
- **Shortcut**: Shift decimal, find HCF, shift back.
- **Common Mistake**: Finding HCF of 9, 18, and 27 directly to get $0.09$.

---

### Q7. Unit digit of factorial sum complex
**Question**: Find the unit digit of: $1! + 2! + 3! + \dots + 100!$. (FIB)
- **Hint**: Factorials from $5!$ onwards end in 0.
- **Detailed Solution**:
  - Sum unit digit is determined by $1! + 2! + 3! + 4! = 1 + 2 + 6 + 24 = 33 \implies 3$.
- **Shortcut**: Ignore terms from $5!$ onwards.
- **Common Mistake**: Calculating factorials beyond $5!$ manually.

---

### Q8. Divisors count divisible by K complex
**Question**: Find the number of factors of $1800$ that are divisible by 15. (FIB)
- **Hint**: Factor out 15: $1800 = 15 \times (2^3 \times 3^1 \times 5^1)$.
- **Detailed Solution**:
  - Remaining part: $2^3 \times 3^1 \times 5^1$.
  - Factors count $= (3+1)(1+1)(1+1) = 16$.
- **Shortcut**: $1800 / 15 = 120$. Factors count of $120 = 2^3 \times 3^1 \times 5^1 \implies 16$.
- **Common Mistake**: Counting all factors.

---

### Q9. Prime numbers count in ranges complex
**Question**: How many prime numbers are there between 50 and 100? (FIB)
- **Hint**: List them out systematically.
- **Detailed Solution**:
  - Primes are: $53, 59, 61, 67, 71, 73, 79, 83, 89, 97$.
  - Total count $= 10$.
- **Shortcut**: Remember count between 1-50 is 15, and 1-100 is 25 $\implies 25 - 15 = 10$.
- **Common Mistake**: Counting composite numbers ending in 7 (like 57, 87) as prime.

---

### Q10. Remainder of large power composite divisor Euler complex
**Question**: Find the remainder when $2^{100}$ is divided by 9. (FIB)
- **Hint**: Apply Euler's totient theorem ($\phi(9) = 9(2/3) = 6$).
- **Detailed Solution**:
  - Since $\gcd(2, 9) = 1$, $2^6 \equiv 1 \pmod 9$.
  - Reduce power: $100 \pmod 6 = 4$.
  - $2^{100} \equiv 2^4 \pmod 9 = 16 \pmod 9 = 7$.
- **Shortcut**: $2^3 = 8 \equiv -1 \pmod 9 \implies 2^{100} = (2^3)^{33} \cdot 2^1 \equiv (-1)^{33} \cdot 2 \equiv -2 \equiv 7 \pmod 9$.
- **Common Mistake**: Divisor is composite, so using prime mod rules fails.

---

### Q11. Divisibility check for 72 complex
**Question**: If the 8-digit number $342X18Y2$ is divisible by 72, find $X + Y$. (FIB)
- **Hint**: Divisible by 8 (last 3 digits $8Y2$) and 9.
- **Detailed Solution**:
  - Divisible by 8: last 3 digits $8Y2 \implies 832/8 = 104 \implies Y = 3$ or $Y=7$.
  - Case A ($Y=3$): Sum $= 3+4+2+X+1+8+3+2 = 23+X \implies X=4$. $X+Y = 7$.
  - Case B ($Y=7$): Sum $= 3+4+2+X+1+8+7+2 = 27+X \implies X=0$ or $9$. $X+Y = 7$ or $16$.
- **Shortcut**: Alternating checks.
- **Common Mistake**: Swapping $X$ and $Y$ values.

---

### Q12. Proper factors count of prime power product complex
**Question**: Find the proper factors count of $120$. (FIB)
- **Hint**: Total factors $- 1$.
- **Detailed Solution**:
  - $120 = 2^3 \times 3^1 \times 5^1 \implies \text{Total} = (4)(2)(2) = 16$.
  - Proper factors $= 15$.
- **Shortcut**: Subtract 1 from total factors.
- **Common Mistake**: Subtracting 2.

---

### Q13. Remainder of large power composite base prime divisor complex
**Question**: Find the remainder when $3^{1000}$ is divided by 7. (FIB)
- **Hint**: Apply Fermat's Little Theorem ($3^6 \equiv 1 \pmod 7$).
- **Detailed Solution**:
  - Exponent mod 6: $1000 \pmod 6 = 4$.
  - $3^{1000} \equiv 3^4 \pmod 7 = 81 \pmod 7 = 4$.
- **Shortcut**: $3^2 = 9 \equiv 2 \pmod 7 \implies 3^4 \equiv 4 \pmod 7$.
- **Common Mistake**: Calculating $3^{1000}$ directly.

---

### Q14. HCF of decimals equal positions complex 2
**Question**: Find the HCF of $0.6, 9.6$, and $0.36$. (MCQ)
- **Options**: A. $0.12$, B. $0.06$, C. $1.2$, D. $0.012$
- **Hint**: Equalize decimal places: $0.60, 9.60, 0.36$. Find HCF of $60, 960, 36$.
- **Detailed Solution**:
  - $\text{HCF}(60, 960, 36) = 12$.
  - Re-apply decimal shift $\implies 0.12$.
- **Shortcut**: Shift decimal, find HCF, shift back.
- **Common Mistake**: Finding HCF of 6, 96, and 36 directly.

---

### Q15. Unit digit of factorial sum complex 2
**Question**: Find the unit digit of: $1! + 2! + 3! + \dots + 100!$. (FIB)
- **Hint**: Factorials from $5!$ onwards end in 0.
- **Detailed Solution**:
  - Sum unit digit is determined by $1! + 2! + 3! + 4! = 1 + 2 + 6 + 24 = 33 \implies 3$.
- **Shortcut**: Ignore terms from $5!$ onwards.
- **Common Mistake**: Calculating factorials beyond $5!$ manually.

---

### Q16. Divisors count divisible by K complex 2
**Question**: Find the number of factors of $1800$ that are divisible by 15. (FIB)
- **Hint**: Factor out 15: $1800 = 15 \times (2^3 \times 3^1 \times 5^1)$.
- **Detailed Solution**:
  - Remaining part: $2^3 \times 3^1 \times 5^1$.
  - Factors count $= (3+1)(1+1)(1+1) = 16$.
- **Shortcut**: $1800 / 15 = 120$. Factors count of $120 = 2^3 \times 3^1 \times 5^1 \implies 16$.
- **Common Mistake**: Counting all factors.

---

### Q17. Prime numbers count in ranges complex 2
**Question**: How many prime numbers are there between 50 and 100? (FIB)
- **Hint**: List them out systematically.
- **Detailed Solution**:
  - Primes are: $53, 59, 61, 67, 71, 73, 79, 83, 89, 97$.
  - Total count $= 10$.
- **Shortcut**: Remember count between 1-50 is 15, and 1-100 is 25 $\implies 25 - 15 = 10$.
- **Common Mistake**: Counting composite numbers ending in 7 (like 57, 87) as prime.

---

### Q18. Remainder of large power composite divisor Euler complex 2
**Question**: Find the remainder when $2^{100}$ is divided by 9. (FIB)
- **Hint**: Apply Euler's totient theorem ($\phi(9) = 9(2/3) = 6$).
- **Detailed Solution**:
  - Since $\gcd(2, 9) = 1$, $2^6 \equiv 1 \pmod 9$.
  - Reduce power: $100 \pmod 6 = 4$.
  - $2^{100} \equiv 2^4 \pmod 9 = 16 \pmod 9 = 7$.
- **Shortcut**: $2^3 = 8 \equiv -1 \pmod 9 \implies 2^{100} = (2^3)^{33} \cdot 2^1 \equiv (-1)^{33} \cdot 2 \equiv -2 \equiv 7 \pmod 9$.
- **Common Mistake**: Divisor is composite, so using prime mod rules fails.

---

### Q19. Divisibility check for 72 complex 2
**Question**: If the 8-digit number $342X18Y2$ is divisible by 72, find $X + Y$. (FIB)
- **Hint**: Divisible by 8 (last 3 digits $8Y2$) and 9.
- **Detailed Solution**:
  - Divisible by 8: last 3 digits $8Y2 \implies 832/8 = 104 \implies Y = 3$ or $Y=7$.
  - Case A ($Y=3$): Sum $= 3+4+2+X+1+8+3+2 = 23+X \implies X=4$. $X+Y = 7$.
  - Case B ($Y=7$): Sum $= 3+4+2+X+1+8+7+2 = 27+X \implies X=0$ or $9$. $X+Y = 7$ or $16$.
- **Shortcut**: Alternating checks.
- **Common Mistake**: Swapping $X$ and $Y$ values.

---

### Q20. Proper factors count of prime power product complex 2
**Question**: Find the proper factors count of $120$. (FIB)
- **Hint**: Total factors $- 1$.
- **Detailed Solution**:
  - $120 = 2^3 \times 3^1 \times 5^1 \implies \text{Total} = (4)(2)(2) = 16$.
  - Proper factors $= 15$.
- **Shortcut**: Subtract 1 from total factors.
- **Common Mistake**: Subtracting 2.
