# Past Year Questions (PYQs): Number System

This file contains 10 solved past NQT questions, analyzed with shortcuts and potential traps.

---

## ✏️ Past Year Questions

### PYQ 1. Divisibility by 72
- **Question**: If the 9-digit number $389X6378Y$ is divisible by 72, find the value of $\sqrt{6X + 7Y}$.
- **Pattern ID**: NS_DIV_72_PYQ
- **Approach**: Check divisibility by 8 (last 3 digits $78Y$) and 9 (sum of digits).
- **Solution**:
  - Divisibility by 8: $78Y \implies 784/8 = 98 \implies Y = 4$.
  - Divisibility by 9: Sum $= 3+8+9+X+6+3+7+8+4 = 48 + X \implies X = 6$.
  - Output $= \sqrt{6(6) + 7(4)} = \sqrt{36 + 28} = \sqrt{64} = 8$.
- **Shortcut**: $78Y \implies 780 + Y = 8 \times 97 + (4 + Y) \implies Y=4$.
- **Variation & Trap**: If $Y$ has multiple solutions, check which makes the root an integer.

---

### PYQ 2. Remainder of large power
- **Question**: Find the remainder when $3^{102}$ is divided by 11.
- **Pattern ID**: NS_REM_FLT
- **Approach**: Apply Fermat's Little Theorem ($3^{10} \equiv 1 \pmod{11}$).
- **Solution**:
  - $102 \pmod{10} = 2$.
  - $3^{102} \equiv 3^2 \pmod{11} = 9$.
- **Shortcut**: Subtract multiples of 10 from the exponent.
- **Variation & Trap**: If base is not coprime to prime, FLT cannot be used.

---

### PYQ 3. Number of even factors
- **Question**: Find the number of even factors of $240$.
- **Pattern ID**: NS_EVEN_FACT
- **Approach**: Prime factorization: $240 = 2^4 \times 3^1 \times 5^1$.
- **Solution**:
  - Total factors $= (4+1)(1+1)(1+1) = 20$.
  - Odd factors $= (1+1)(1+1) = 4$.
  - Even factors $= 20 - 4 = 16$.
- **Shortcut**: Factor out $2^1 \implies 2 \times (2^3 \times 3^1 \times 5^1) \implies 4 \times 2 \times 2 = 16$.
- **Variation & Trap**: Do not include $2^0$ row in selection table.

---

### PYQ 4. Unit digit sum
- **Question**: Find the unit digit of $23^{34} + 37^{45}$.
- **Pattern ID**: NS_UNIT_SUM
- **Approach**: Find unit digit of each term and add them.
- **Solution**:
  - $23^{34} \equiv 3^{34 \pmod 4} \equiv 3^2 \equiv 9$.
  - $37^{45} \equiv 7^{45 \pmod 4} \equiv 7^1 \equiv 7$.
  - Sum $= 9 + 7 = 16 \implies 6$.
- **Shortcut**: Exponent remainder power check.
- **Variation & Trap**: Carry-over from addition does not affect unit digit.

---

### PYQ 5. LCM with different remainders
- **Question**: Find the smallest number which when divided by 20, 25, and 35 leaves remainders 14, 19, and 29 respectively.
- **Pattern ID**: NS_LCM_DIFF_REM
- **Approach**: Divisors $-$ Remainders $= K$. Check if $K$ is constant.
- **Solution**:
  - $20 - 14 = 6$, $25 - 19 = 6$, $35 - 29 = 6 \implies K = 6$.
  - $\text{LCM}(20, 25, 35) = 700$.
  - Number $= 700 - 6 = 694$.
- **Shortcut**: Check options. Add 6 and check divisibility by 25 (ends in 00, 25, 50, 75).
- **Variation & Trap**: Do not add the remainder offset ($700 + 6 = 706$, which is incorrect).

---

### PYQ 6. Factors divisible by 12
- **Question**: Find the number of factors of $1800$ that are divisible by 15.
- **Pattern ID**: NS_FACT_DIV_15
- **Approach**: Factor out 15: $1800 = 15 \times (2^3 \times 3^1 \times 5^1)$.
- **Solution**:
  - Remaining part: $2^3 \times 3^1 \times 5^1$.
  - Factors count $= (3+1)(1+1)(1+1) = 16$.
- **Shortcut**: $1800 / 15 = 120$. Factors count of $120 = 2^3 \times 3^1 \times 5^1 \implies 16$.
- **Variation & Trap**: Ensure the dividing factor is completely extracted.

---

### PYQ 7. Divisibility check for 11 digits
- **Question**: Find the value of $A$ if the 7-digit number $54A3215$ is divisible by 11.
- **Pattern ID**: NS_DIV_11_PYQ
- **Approach**: $| \text{Odd Sum} - \text{Even Sum} | = 0 \text{ or multiple of } 11$.
- **Solution**:
  - Odd positions (from right): $5, 2, A, 5 \implies \text{Sum} = 12 + A$.
  - Even positions: $1, 3, 4 \implies \text{Sum} = 8$.
  - Difference $= (12 + A) - 8 = 4 + A$.
  - Set $4 + A = 11 \implies A = 7$.
- **Shortcut**: Group in pairs: $05, 4A, 32, 15 \implies 5 + 40 + A + 32 + 15 = 92 + A \equiv 4 + A \pmod{11} \implies A=7$.
- **Variation & Trap**: Digits must be single integers $0 \le A \le 9$.

---

### PYQ 8. Product of prime factors
- **Question**: How many distinct prime factors does $2310$ have?
- **Pattern ID**: NS_PRIME_DISTINCT
- **Approach**: Find the prime factorization of 2310.
- **Solution**:
  - $2310 = 10 \times 231 = 2 \times 5 \times 3 \times 7 \times 11$.
  - Distinct prime factors are $2, 3, 5, 7, 11$ (5 prime factors).
- **Shortcut**: Divide step-by-step by small primes.
- **Variation & Trap**: Do not count duplicate prime factors.

---

### PYQ 9. HCF of decimals
- **Question**: Find the HCF of $0.6, 9.6$, and $0.36$.
- **Pattern ID**: NS_HCF_DECIMAL
- **Approach**: Make decimal places equal: $0.60, 9.60, 0.36$. Find HCF of integers $60, 960, 36$.
- **Solution**:
  - $\text{HCF}(60, 960, 36) = 12$.
  - Re-apply decimal places $\implies 0.12$.
- **Shortcut**: Convert to equal decimal positions, find HCF, shift decimal back.
- **Variation & Trap**: Converting to fractions without simplifying can lead to incorrect HCF values.

---

### PYQ 10. GCD of large numbers remainder
- **Question**: What is the largest number that divides 729 and 901 leaving remainders 9 and 5 respectively?
- **Pattern ID**: NS_GCD_REM_PYQ
- **Approach**: Find $\text{HCF}(729-9, 901-5) = \text{HCF}(720, 896)$.
- **Solution**:
  - Difference $= 896 - 720 = 176$.
  - Factors of $176$: $1, 2, 4, 8, 16, 11, 22, 44, 88, 176$.
  - $720/16 = 45$, $896/16 = 56 \implies \text{HCF} = 16$.
- **Shortcut**: Check options starting with the largest.
- **Variation & Trap**: Do not find HCF of original numbers and subtract remainders.
