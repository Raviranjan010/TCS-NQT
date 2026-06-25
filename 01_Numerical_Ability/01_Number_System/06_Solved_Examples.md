# Solved Examples: Number System

This file contains 10 solved examples categorized by difficulty, with detailed calculations and verification checks.

---

## 🟢 Easy-Level Examples

### Example 1. Unit digit of multiplication
- **Question**: Find the unit digit of the expression: $423 \times 587 \times 912 \times 304$.
- **Approach**: Multiply the unit digits of individual numbers.
- **Solution**:
  - Unit digits are: $3, 7, 2, 4$.
  - Product $= (3 \times 7 \times 2 \times 4) \pmod{10} = 168 \pmod{10} = 8$.
- **Verification**: $(3 \times 7 = 21 \rightarrow 1) \times (2 \times 4 = 8 \rightarrow 8) = 8$. Correct.

### Example 2. Basic divisibility check
- **Question**: What is the smallest digit to replace $X$ in $451X603$ so it is divisible by 9?
- **Approach**: Sum of digits must be divisible by 9.
- **Solution**:
  - Sum $= 4 + 5 + 1 + X + 6 + 0 + 3 = 19 + X$.
  - Next multiple of 9 is $27 \implies X = 27 - 19 = 8$.
- **Verification**: $19 + 8 = 27$ (divisible). Correct.

### Example 3. Divisors count of small composite
- **Question**: Find the number of divisors of $75$.
- **Approach**: Prime factorization: $75 = 3^1 \times 5^2$.
- **Solution**:
  - Factors $= (1+1)(2+1) = 2 \times 3 = 6$.
- **Verification**: Divisors are: $1, 3, 5, 15, 25, 75$. Correct.

---

## 🟡 Medium-Level Examples

### Example 4. Divisors with conditions
- **Question**: How many factors of $720$ are even?
- **Approach**: Prime factorization: $720 = 2^4 \times 3^2 \times 5^1$. Even factors must have $2^1$ or higher.
- **Solution**:
  - Factor out $2^1 \implies 720 = 2^1 \times (2^3 \times 3^2 \times 5^1)$.
  - Total factors of remaining $= (3+1)(2+1)(1+1) = 4 \times 3 \times 2 = 24$.
- **Verification**: Total factors $= (5)(3)(2) = 30$. Odd factors $= (3)(2) = 6$. Even factors $= 30 - 6 = 24$. Correct.

### Example 5. Divisibility check for 72
- **Question**: If 8-digit number $342X18Y2$ is divisible by $72$, find $X + Y$.
- **Approach**: Divisible by 8 and 9.
- **Solution**:
  - Divisible by 8: last 3 digits $8Y2$ must divide by 8 $\implies 832/8 = 104 \implies Y = 3$ or $Y=7$.
  - Case A ($Y=3$): Sum $= 3+4+2+X+1+8+3+2 = 23+X \implies X=4$. $X+Y = 7$.
  - Case B ($Y=7$): Sum $= 3+4+2+X+1+8+7+2 = 27+X \implies X=0$ or $9$. $X+Y = 7$ or $16$.
- **Verification**: Both fit the requirements.

### Example 6. Constant remainder LCM
- **Question**: Find the least number which when divided by 15, 20, and 30 leaves remainder 7 in each case.
- **Approach**: $\text{LCM}(15, 20, 30) + 7$.
- **Solution**:
  - $\text{LCM} = 60$.
  - Number $= 60 + 7 = 67$.
- **Verification**: $67/15 = 4 \text{ rem } 7$. Correct.

### Example 7. Different remainders HCF
- **Question**: Find the greatest number that divides 148, 246, and 623 leaving remainders 4, 6, and 11 respectively.
- **Approach**: Find $\text{HCF}(148-4, 246-6, 623-11) = \text{HCF}(144, 240, 612)$.
- **Solution**:
  - Difference list: $240-144 = 96$, $612-240 = 372$.
  - $\text{HCF}(144, 240, 612) = 12$.
- **Verification**: $148/12 = 12 \text{ rem } 4$. Correct.

---

## 🔴 Hard-Level Examples

### Example 8. High exponent remainder
- **Question**: Find the remainder when $2^{2023}$ is divided by $17$.
- **Approach**: Apply Fermat's Little Theorem ($2^{16} \equiv 1 \pmod{17}$).
- **Solution**:
  - Reduce power: $2023 \pmod{16} = 7$.
  - $2^{2023} \equiv 2^7 \pmod{17} = 128 \pmod{17}$.
  - $17 \times 7 = 119 \implies 128 - 119 = 9$.
- **Verification**: $2^4 = 16 \equiv -1 \pmod{17} \implies 2^7 = 2^3 \cdot 2^4 \equiv 8 \cdot (-1) \equiv -8 \equiv 9 \pmod{17}$. Correct.

### Example 9. Advanced cryptarithmetic carry
- **Question**: In $TO + GO = OUT$, if different letters represent unique digits, find the maximum possible value of $OUT$.
- **Approach**: Set up column additions: $O + O = T \text{ or } 10+T$.
- **Solution**:
  - Carry-over to hundreds place must be $O = 1$ (since $T+G + \text{carry} = 10 \cdot O + U \implies O=1$).
  - If $O=1$, then $1 + 1 = 2 \implies T=2$.
  - $T + G + \text{carry} = 10 \cdot 1 + U \implies 2 + G + 0 = 10 + U \implies G = 8 + U$.
  - For max value, let $G=9 \implies U=1$ (but $O$ is already 1, digits must be unique).
  - Let $G=8 \implies U=0$.
  - $OUT = 102$.
- **Verification**: $21 + 81 = 102$. All digits are unique. Correct.

### Example 10. Coprime factors division remainder
- **Question**: Find the remainder when $5^{100}$ is divided by $12$.
- **Approach**: Since $12 = 3 \times 4$ (coprime bases), check modular congruences for 3 and 4.
- **Solution**:
  - Modulo 3: $5 \equiv -1 \pmod 3 \implies 5^{100} \equiv (-1)^{100} \equiv 1 \pmod 3$.
  - Modulo 4: $5 \equiv 1 \pmod 4 \implies 5^{100} \equiv 1^{100} \equiv 1 \pmod 4$.
  - Since remainder is 1 for both 3 and 4, it must be 1 for their product 12.
- **Verification**: $5^2 = 25 \equiv 1 \pmod{12} \implies 5^{100} = (5^2)^{50} \equiv 1^{50} \equiv 1 \pmod{12}$. Correct.
