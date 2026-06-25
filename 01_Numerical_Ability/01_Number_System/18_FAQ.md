# Number System: Frequently Asked Questions (FAQ)

This FAQ answers common student questions on divisibility rules, remainder cycles, and factorization.

---

## 💬 Frequently Asked Questions

### Q1: Why does the unit digit power cycle repeat every 4 terms?
The base multiplication patterns repeat in cyclic blocks of at most 4.
- **Example**:
  $$2^1 = 2, \quad 2^2 = 4, \quad 2^3 = 8, \quad 2^4 = 6$$
  $$2^5 = 12 \rightarrow 2, \quad 2^6 = 24 \rightarrow 4$$
- Since there are only 10 possible unit digits, cycles must repeat quickly. The lowest common multiple of cycle lengths is 4.

---

### Q2: Can I apply Fermat's Little Theorem when the divisor is composite?
No, Fermat's Little Theorem only applies when the divisor is prime.
- If the divisor is composite, use Euler's totient theorem instead.
- **Formula**:
  $$a^{\phi(n)} \equiv 1 \pmod n \quad [\text{where } \gcd(a, n) = 1]$$

---

### Q3: What are proper factors?
Proper factors are all the factors of a number except the number itself.
- **Proper Factors Count** $=$ Total Factors $- 1$.
- **Example**: The proper factors of 6 are 1, 2, and 3 (excluding 6).

---

### Q4: How do I handle decimal divisors when finding HCF?
Equalize the number of decimal places across all inputs first.
- Find the HCF of the resulting integers.
- Shift the decimal point back by the same number of places.
- **Example**: $\text{HCF}(0.6, 0.36) = \text{HCF}(0.60, 0.36) \rightarrow \text{HCF}(60, 36)/100 = 0.12$.

---

### Q5: Why is the LCM subtraction offset used when remainders differ?
When remainders differ, we check if the difference between divisor and remainder ($d_i - r_i = K$) is constant.
- Subtracting $K$ from the LCM ensures that the resulting number leaves the required remainder for each divisor.
- **Formula**:
  $$\text{Number} = \text{LCM} - K$$

---

### Q6: What is a coprime pair?
A coprime pair is two numbers that have no common factors other than 1.
- **Formula**:
  $$\text{HCF}(A, B) = 1$$
- They do not need to be prime numbers themselves (e.g., 8 and 9 are coprime).

---

### Q7: Why do we factor out the divisor when counting restricted factors?
Factoring out the restricted divisor ensures that all counted combinations contain it.
- We then find the total factors of the remaining quotient.
- **Example**: Factors of 24 divisible by 6 $\implies 24 = 6 \times 4$. Factors of 4 is $3 \implies$ 3 factors.

---

### Q8: What does a carry-over of 1 in cryptarithmetic tell us?
It immediately identifies the value of the most significant letter in the sum word as 1.
- This is because adding two single digits can carry over at most 1.
- This provides a solid starting point for solving the rest of the puzzle.

---

### Q9: Why does the divisibility rule for 11 work in pairs?
Grouping digits in pairs is equivalent to expanding the number in base 100.
- Since $100 \equiv 1 \pmod{11} \implies 100^k \equiv 1^k \equiv 1 \pmod{11}$.
- This allows us to sum the pairs directly to check divisibility.

---

### Q10: How do I calculate the sum of divisors?
Use the sum of factors formula from prime factorization:
- **Formula**:
  $$\text{Sum} = \frac{p^{a+1} - 1}{p - 1} \times \frac{q^{b+1} - 1}{q - 1}\dots$$
- This is more efficient than listing and adding all divisors manually.
