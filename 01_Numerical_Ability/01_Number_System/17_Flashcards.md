# Flashcards: Number System

Use these 20 active-recall flashcards to test your knowledge of Number System concepts.

---

## 📇 Flashcard Deck

### Card 1: Prime factorization divisor count
What is the formula to count total factors of $N = p^a \cdot q^b$?
<details>
<summary>Reveal Answer</summary>

$$(a + 1)(b + 1)$$
- **a, b**: Exponents of prime factors $p, q$.
- **p, q**: Prime bases.
</details>

---

### Card 2: Sum of factors
What is the formula for the sum of all factors of $N = p^a \cdot q^b$?
<details>
<summary>Reveal Answer</summary>

$$\frac{p^{a+1} - 1}{p - 1} \times \frac{q^{b+1} - 1}{q - 1}$$
</details>

---

### Card 3: Proper factors definition
What is the difference between total factors and proper factors?
<details>
<summary>Reveal Answer</summary>

Proper factors exclude the number itself ($N$).
- **Proper Factors Count** $=$ Total Factors $- 1$.
</details>

---

### Card 4: Unit digit cycle length
What is the maximum cycle length for any unit digit exponent power?
<details>
<summary>Reveal Answer</summary>

**4**
- Digits 2, 3, 7, 8 have a cycle of 4.
- Digits 4, 9 have a cycle of 2.
- Digits 0, 1, 5, 6 have a cycle of 1.
</details>

---

### Card 5: Divisibility rule of 11
What is the alternating sum divisibility check for 11?
<details>
<summary>Reveal Answer</summary>

$$| \text{Odd Sum} - \text{Even Sum} | = 0 \text{ or multiple of } 11$$
- Digits are summed in odd positions and even positions starting from the right.
</details>

---

### Card 6: HCF of fractions
What is the formula for the HCF of fractions $\frac{a}{b}$ and $\frac{c}{d}$?
<details>
<summary>Reveal Answer</summary>

$$\text{HCF} = \frac{\text{HCF}(a, c)}{\text{LCM}(b, d)}$$
</details>

---

### Card 7: LCM of fractions
What is the formula for the LCM of fractions $\frac{a}{b}$ and $\frac{c}{d}$?
<details>
<summary>Reveal Answer</summary>

$$\text{LCM} = \frac{\text{LCM}(a, c)}{\text{HCF}(b, d)}$$
</details>

---

### Card 8: Fermat's Little Theorem
What is the condition and equation for Fermat's Little Theorem?
<details>
<summary>Reveal Answer</summary>

$$a^{p-1} \equiv 1 \pmod p$$
- **Condition**: $p$ must be a prime number, and $\gcd(a, p) = 1$.
</details>

---

### Card 9: Euler's totient function for primes
What is the totient value $\phi(p)$ for a prime number $p$?
<details>
<summary>Reveal Answer</summary>

$$\phi(p) = p - 1$$
- **Reason**: Every positive integer $< p$ is coprime to $p$.
</details>

---

### Card 10: Product of factors
What is the formula for the product of all factors of $N$?
<details>
<summary>Reveal Answer</summary>

$$\text{Product} = N^{\frac{\text{Total Factors}}{2}}$$
</details>

---

### Card 11: Perfect square factors property
Why do perfect squares always have an odd number of factors?
<details>
<summary>Reveal Answer</summary>

- All exponents in its prime factorization are even.
- Therefore, the terms $(a+1), (b+1)\dots$ in the factor formula are odd.
- The product of odd numbers is always odd.
</details>

---

### Card 12: Divisibility of 8 check
What is the divisibility rule for 8?
<details>
<summary>Reveal Answer</summary>

The last three digits of the number must be divisible by 8.
</details>

---

### Card 13: Divisibility of 11 in pairs
What is the grouping shortcut check for 11?
<details>
<summary>Reveal Answer</summary>

Group digits in pairs from right to left, sum them, and check if the sum divides by 11.
</details>

---

### Card 14: Unit digit exponent 0
If exponent mod 4 is 0, what power should be used to find the unit digit?
<details>
<summary>Reveal Answer</summary>

**4**
- A remainder of 0 indicates the completion of a full cycle (e.g. use $D^4$).
</details>

---

### Card 15: Odd factors count
How do you calculate the count of odd factors from the prime factorization $2^a \cdot 3^b \cdot 5^c$?
<details>
<summary>Reveal Answer</summary>

Omit the base 2 exponent:
$$\text{Odd Factors} = (b+1)(c+1)$$
</details>

---

### Card 16: Divisibility by 6 check
What are the two conditions for a number to be divisible by 6?
<details>
<summary>Reveal Answer</summary>

It must be divisible by both 2 (even last digit) and 3 (digit sum divisible by 3).
</details>

---

### Card 17: Co-prime numbers definition
What makes two numbers $A$ and $B$ coprime?
<details>
<summary>Reveal Answer</summary>

Their greatest common divisor is 1:
$$\text{HCF}(A, B) = 1$$
</details>

---

### Card 18: LCM different remainders formula
If dividing by $d_1, d_2$ leaves remainders $r_1, r_2$ where $d_1-r_1 = d_2-r_2 = K$, what is the number?
<details>
<summary>Reveal Answer</summary>

$$\text{LCM}(d_1, d_2) - K$$
</details>

---

### Card 19: Cryptarithmetic carry limit
What is the maximum carry-over from adding two columns in cryptarithmetic?
<details>
<summary>Reveal Answer</summary>

**1**
- Even with a carry-over, $9+9+1 = 19$, so carry-over cannot exceed 1.
</details>

---

### Card 20: Divisibility by 72 check
What two smaller divisor checks are combined to verify divisibility by 72?
<details>
<summary>Reveal Answer</summary>

Divisibility by **8** and **9** (since they are coprime and $8 \times 9 = 72$).
</details>
