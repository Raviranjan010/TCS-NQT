# Practice Set: Beginner Number System

This practice set contains 20 beginner-level questions focusing on divisibility rules, unit digits, and basic prime properties.

---

## 📝 Practice Booklet

### Q1. Unit digit of simple powers
**Question**: Find the unit digit of $7^{45}$. (FIB)
- **Hint**: Cycle of 7 is 4. Find exponent modulo 4.
- **Detailed Solution**:
  - Exponent $= 45 \pmod 4 = 1$.
  - Unit digit $= 7^1 = 7$.
- **Shortcut**: Last digit of power $\implies 45 \pmod 4 = 1 \implies 7$.
- **Common Mistake**: Calculating $7^5$ directly.

---

### Q2. Divisibility check for 3
**Question**: Find the value of $X$ if $52X31$ is divisible by 3. (MCQ)
- **Options**: A. 0, B. 1, C. 2, D. 3
- **Hint**: Sum of digits must be divisible by 3.
- **Detailed Solution**:
  - Sum $= 5 + 2 + X + 3 + 1 = 11 + X$.
  - Next multiple is $12 \implies X = 1$.
- **Shortcut**: $11 + X = 12 \implies X=1$.
- **Common Mistake**: Assuming 0 is the smallest digit.

---

### Q3. Factors of simple composite
**Question**: Find the total factors of 36. (FIB)
- **Hint**: Prime factorization: $36 = 2^2 \times 3^2$.
- **Detailed Solution**:
  - Factors count $= (2+1)(2+1) = 3 \times 3 = 9$.
- **Shortcut**: Divisors of $36$ are: $1, 2, 3, 4, 6, 9, 12, 18, 36$.
- **Common Mistake**: Forgetting that 36 is a perfect square, so factors count is odd.

---

### Q4. Prime check up to 50
**Question**: How many prime numbers are there between 1 and 20? (FIB)
- **Hint**: List all primes less than 20.
- **Detailed Solution**:
  - Primes: $2, 3, 5, 7, 11, 13, 17, 19$.
  - Total count $= 8$.
- **Shortcut**: Manual count of small primes.
- **Common Mistake**: Including 1 as a prime number.

---

### Q5. LCM of consecutive numbers
**Question**: Find the LCM of 12, 15, and 18. (FIB)
- **Hint**: Use prime factorization method.
- **Detailed Solution**:
  - $12 = 2^2 \times 3^1$.
  - $15 = 3^1 \times 5^1$.
  - $18 = 2^1 \times 3^2$.
  - $\text{LCM} = 2^2 \times 3^2 \times 5^1 = 4 \times 9 \times 5 = 180$.
- **Shortcut**: Check multiples of 18 that are divisible by 15.
- **Common Mistake**: Multiplying numbers directly ($12 \times 15 \times 18 = 3240$).

---

### Q6. HCF of simple integers
**Question**: Find the HCF of 24 and 36. (FIB)
- **Hint**: Greatest common divisor.
- **Detailed Solution**:
  - Common factors: 12 divides both.
  - $\text{HCF} = 12$.
- **Shortcut**: Difference between 36 and 24 is 12, which divides both.
- **Common Mistake**: Stating 6 is the HCF (it is a common factor but not the highest).

---

### Q7. Unit digit of even base
**Question**: Find the unit digit of $8^{20}$. (FIB)
- **Hint**: Exponent mod 4 is 0. Use power 4.
- **Detailed Solution**:
  - Exponent $= 20 \pmod 4 = 0 \implies$ use $R=4$.
  - Unit digit $= 8^4 \pmod{10} = 4096 \pmod{10} = 6$.
- **Shortcut**: Cycle of 8 is $8, 4, 2, 6$. Power divisible by 4 ends in 6.
- **Common Mistake**: Stating unit digit is $8^0 = 1$.

---

### Q8. Divisibility check for 4
**Question**: Which of the following numbers is divisible by 4? (MCQ)
- **Options**: A. 123456, B. 987654, C. 345618, D. 111122
- **Hint**: Check last two digits.
- **Detailed Solution**:
  - Last 2 digits: 56 is divisible by 4.
- **Shortcut**: Last 2 digits must divide by 4.
- **Common Mistake**: Adding digits (rules for 3 and 9).

---

### Q9. Prime factorization representation
**Question**: Express $60$ in prime factorization form. (MCQ)
- **Options**: A. $2^2 \times 3 \times 5$, B. $2 \times 3^2 \times 5$, C. $4 \times 15$, D. $6 \times 10$
- **Hint**: Base must be prime numbers.
- **Detailed Solution**:
  - $60 = 4 \times 15 = 2^2 \times 3^1 \times 5^1$.
- **Shortcut**: Check prime base compliance.
- **Common Mistake**: Selecting options with composite bases.

---

### Q10. Basic remainder calculation
**Question**: What is the remainder when $145$ is divided by 13? (FIB)
- **Hint**: Divisor calculation.
- **Detailed Solution**:
  - $145 = 13 \times 11 + 2$.
  - Remainder $= 2$.
- **Shortcut**: Mental subtraction of multiples of 13.
- **Common Mistake**: Writing quotient instead of remainder.

---

### Q11. Unit digit of base 5
**Question**: Find the unit digit of $125^{987}$. (FIB)
- **Hint**: Base ends in 5.
- **Detailed Solution**:
  - Any power of a number ending in 5 has a unit digit of 5.
- **Shortcut**: Constant cycle for 5.
- **Common Mistake**: Dividing exponent by 4.

---

### Q12. Divisibility check for 11 simple
**Question**: Find $X$ if $12X21$ is divisible by 11. (FIB)
- **Hint**: $|(1+X+1) - (2+2)| = 0$.
- **Detailed Solution**:
  - Odd sum $= 1 + X + 1 = 2 + X$.
  - Even sum $= 2 + 2 = 4$.
  - Difference $= 2 + X - 4 = X - 2 = 0 \implies X = 2$.
- **Shortcut**: Alternating digit difference.
- **Common Mistake**: Assuming $X=0$.

---

### Q13. Odd factors count
**Question**: Find the number of odd factors of 120. (FIB)
- **Hint**: $120 = 2^3 \times 3^1 \times 5^1$.
- **Detailed Solution**:
  - Omit base 2 exponents $\implies$ factors of $3^1 \times 5^1$.
  - Odd factors $= (1+1)(1+1) = 4$.
- **Shortcut**: Factors count of odd bases.
- **Common Mistake**: Counting all factors.

---

### Q14. Unit digit of base 9
**Question**: Find the unit digit of $19^{42}$. (FIB)
- **Hint**: Exponent is even.
- **Detailed Solution**:
  - Cycle of 9: Odd power $= 9$, Even power $= 1$.
  - Exponent 42 is even $\implies 1$.
- **Shortcut**: Even exponent ends in 1.
- **Common Mistake**: Dividing by 4.

---

### Q15. LCM of prime numbers
**Question**: Find the LCM of 11, 13, and 17. (FIB)
- **Hint**: Product of prime numbers.
- **Detailed Solution**:
  - $\text{LCM} = 11 \times 13 \times 17 = 143 \times 17 = 2431$.
- **Shortcut**: Since they are coprime, multiply them.
- **Common Mistake**: Finding HCF instead of LCM.

---

### Q16. Divisibility check for 5
**Question**: Which number is divisible by 5? (MCQ)
- **Options**: A. 1234, B. 5554, C. 9875, D. 1111
- **Hint**: Last digit is 0 or 5.
- **Detailed Solution**:
  - $9875$ ends in 5.
- **Shortcut**: Last digit check.
- **Common Mistake**: Summing digits.

---

### Q17. Greatest divisor of small group
**Question**: Find the greatest common divisor of 15, 25, and 45. (FIB)
- **Hint**: Peak factor check.
- **Detailed Solution**:
  - Common factors: 5.
  - $\text{HCF} = 5$.
- **Shortcut**: 5 is the largest common divisor.
- **Common Mistake**: Stating 15 is HCF.

---

### Q18. Alternating sum multiples
**Question**: Check if $121$ is divisible by 11. (MCQ)
- **Options**: A. Yes, B. No
- **Hint**: $11 \times 11 = 121$.
- **Detailed Solution**:
  - $(1+1) - 2 = 0 \implies$ Yes.
- **Shortcut**: Direct square verification.
- **Common Mistake**: None.

---

### Q19. Divisors count of power of prime
**Question**: Find the number of factors of $2^5$. (FIB)
- **Hint**: Exponent $+ 1$.
- **Detailed Solution**:
  - Factors count $= 5 + 1 = 6$.
- **Shortcut**: Prime base $\implies$ power $+ 1$.
- **Common Mistake**: Stating factors count is 5.

---

### Q20. Remainder of simple divisibility
**Question**: What is the remainder when $100$ is divided by 7? (FIB)
- **Hint**: $14 \times 7 = 98$.
- **Detailed Solution**:
  - $100 - 98 = 2$.
- **Shortcut**: Multiples subtraction.
- **Common Mistake**: Writing quotient.
