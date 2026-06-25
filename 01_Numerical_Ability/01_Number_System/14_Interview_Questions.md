# Interview Questions: Number System

This file covers 10 conceptual interview questions and answers exploring divisibility rules, prime properties, modular congruences, and algorithms.

---

## 💬 Interview Questions & Answers

### Q1: What is the mathematical explanation behind the divisibility rule of 9?
Why does summing the digits work?

**Answer:**
- Any number can be expanded in powers of 10:
  $$N = a_k 10^k + a_{k-1} 10^{k-1} + \dots + a_1 10^1 + a_0 10^0$$
- Since $10 \equiv 1 \pmod 9$, any power of 10 is also congruent to 1:
  $$10^k \equiv 1^k \equiv 1 \pmod 9$$
- Substituting this back into the expansion:
  $$N \equiv a_k(1) + a_{k-1}(1) + \dots + a_1(1) + a_0 \equiv \sum a_i \pmod 9$$
- Therefore, a number and the sum of its digits leave the same remainder when divided by 9.

---

### Q2: Explain the significance of Fermat's Little Theorem (FLT) in cryptographic algorithms
How does it help solve remainder problems?

**Answer:**
- FLT states that if $p$ is prime and $\gcd(a, p) = 1$, then $a^{p-1} \equiv 1 \pmod p$.
- It allows us to reduce huge exponents by dividing the exponent by $p-1$.
- This is a core property used in RSA cryptography to establish key pairs and perform modular exponentiations efficiently.

---

### Q3: What is the difference between prime factorization and prime factors?
Give an example.

**Answer:**
- **Prime Factorization**: The representation of a number as a product of prime powers (e.g., $12 = 2^2 \times 3^1$).
- **Prime Factors**: The set of unique prime numbers dividing the value (e.g., $\{2, 3\}$ for $12$).
- **Tradeoff**: Factorization preserves the exponents needed to count total divisors, while the set of prime factors is used to check coprimality.

---

### Q4: How does the cycle length of unit digits affect coding loops?
Why is it beneficial to know that the maximum cycle is 4?

**Answer:**
- Knowing the cycle length is at most 4 prevents us from running large power loops.
- We can compute $E \pmod 4$ in $O(1)$ time to find the unit digit of $D^E$.
- This saves CPU instructions, especially when $E \ge 10^9$.

---

### Q5: How do HCF and LCM calculations change when handling fraction inputs?
Why do we use the inverse operation in the denominator?

**Answer:**
- **HCF of Fractions**: $\frac{\text{HCF of Numerators}}{\text{LCM of Denominators}}$.
- **LCM of Fractions**: $\frac{\text{LCM of Numerators}}{\text{HCF of Denominators}}$.
- **Reason**: To maximize the fraction (LCM), we need the largest numerator and the smallest denominator. To minimize it (HCF), we need the smallest numerator and the largest denominator.

---

### Q6: Explain the difference between composite and prime modulo arithmetic division
What is the role of GCD in congruence division?

**Answer:**
- In prime modulo, we can divide both sides of a congruence directly if the base is not divisible by the modulus.
- In composite modulo ($ax \equiv ay \pmod m$), we can only divide if we also divide the modulus by $\gcd(a, m)$:
  $$x \equiv y \pmod{\frac{m}{\gcd(a, m)}}$$

---

### Q7: Prove that the number of factors of a perfect square is always odd
What is the mathematical rationale?

**Answer:**
- For any number $N = p^a q^b\dots$, the number of factors is $(a+1)(b+1)\dots$
- If $N$ is a perfect square, all exponents $a, b\dots$ must be even.
- Therefore, the terms $(a+1), (b+1)\dots$ are odd.
- The product of odd numbers is always odd, so the total factors count is odd.

---

### Q8: What is Euler's totient function, and when is it preferred over Fermat's Little Theorem?
Explain with modulus conditions.

**Answer:**
- Euler's totient function $\phi(n)$ counts numbers up to $n$ that are coprime to $n$.
- Euler's theorem states $a^{\phi(n)} \equiv 1 \pmod n$ if $\gcd(a, n) = 1$.
- It is preferred over FLT when the modulus $n$ is a composite number (FLT only works when the modulus is prime).

---

### Q9: How do you check if a large number is prime using the $6k \pm 1$ rule?
What are the limitations of this shortcut?

**Answer:**
- All primes $> 3$ can be written as $6k \pm 1$ because other forms ($6k, 6k+2, 6k+3, 6k+4$) are divisible by 2 or 3.
- **Limitation**: This is a necessary but not sufficient condition. Composite numbers like $25$ ($6 \times 4 + 1$) and $35$ ($6 \times 6 - 1$) also fit this form but are not prime.

---

### Q10: How does the carry-over mechanic function in Cryptarithmetic column additions?
Why is the maximum carry-over for two columns always 1?

**Answer:**
- The maximum digit value is 9.
- For two columns: $9 + 9 = 18$. Even with a previous carry of 1, the sum is $19$.
- The carry-over to the next column can never exceed 1.
- This constraint allows us to immediately identify the leading letter of the sum word as 1.
