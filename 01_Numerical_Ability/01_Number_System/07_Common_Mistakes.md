# Common Mistakes: Number System

Avoid these 15 common conceptual, calculation, and procedural traps during the exam.

---

## 🚫 The 15 Main Traps

### 1. Non-Prime Bases in Factors Counting
- *Mistake*: Applying $(a+1)(b+1)$ to composite base exponents directly.
- *Example*: For $12^3$, stating factors $= (3+1) = 4$.
- *Correction*: Factorize base first: $(2^2 \times 3)^3 = 2^6 \times 3^3 \implies$ factors $= (6+1)(3+1) = 28$.

### 2. Remainder cycle 0 division index error
- *Mistake*: Stating unit digit is $D^0$ when exponent divides by 4.
- *Example*: $2^8 \implies 8 \pmod 4 = 0 \implies 2^0 = 1$.
- *Correction*: Remainder $0 \implies$ use power cycle 4 ($2^4 = 6$).

### 3. GCD / LCM Remainder swapping
- *Mistake*: Subtracting remainders after finding LCM, or adding remainders to HCF.
- *Correction*: For LCM, add/subtract after finding LCM. For HCF, subtract remainders from numbers *before* finding HCF.

### 4. Alternating position sums sign swap
- *Mistake*: Subtracting even-position sums from odd-position sums with incorrect signs in divisibility by 11.
- *Correction*: Keep calculations absolute: $| \text{Odd Sum} - \text{Even Sum} |$.

### 5. Composite Modular Divisions
- *Mistake*: Dividing modular congruences directly without adjusting the modulo divisor:
  $$2x \equiv 2y \pmod 6 \implies x \equiv y \pmod 6$$
- *Correction*: Divide modulo by $\gcd(2, 6) \implies x \equiv y \pmod 3$.

### 6. Divisibility of 8 check omissions
- *Mistake*: Checking only the last two digits for divisibility by 8.
- *Correction*: You must check the last three digits for divisibility by 8.

### 7. Prime check limits
- *Mistake*: Testing divisibility by all numbers up to $N/2$ to check if $N$ is prime.
- *Correction*: Test only prime numbers up to $\sqrt{N}$.

### 8. Even factors count omission of 2
- *Mistake*: Forgetting to exclude odd factors from total factors to get even factors.
- *Correction*: Even factors $=$ Total factors $-$ Odd factors.

### 9. Consecutive numbers average offsets
- *Mistake*: Averaging consecutive numbers by dividing the sum of first and last by something other than 2.
- *Correction*: Average is always $\frac{\text{First} + \text{Last}}{2}$.

### 10. Fermat's Theorem Non-Coprime Base
- *Mistake*: Applying $a^{p-1} \equiv 1 \pmod p$ when base $a$ is a multiple of prime $p$.
- *Correction*: Confirm $\gcd(a, p) = 1$ first.

### 11. HCF of fractions denominator LCM
- *Mistake*: Calculating HCF of fractions as HCF of numerators over HCF of denominators.
- *Correction*: HCF of fractions $= \frac{\text{HCF of Numerators}}{\text{LCM of Denominators}}$.

### 12. Alternating LCM subtraction offsets
- *Mistake*: Subtracting the same remainder offset when divisors have different remainder offsets.
- *Correction*: If remainders are $R_i$ for divisors $d_i$, confirm $d_i - R_i = K$ is constant. Then subtract $K$ from LCM.

### 13. Unit digit cyclicity swaps
- *Mistake*: Using a cycle length of 4 for bases like 9 (which has a cycle of 2).
- *Correction*: Although 4 works, using it increases calculation time. Cycle for 9 is odd (9), even (1).

### 14. Factor counting including the number itself
- *Mistake*: Forgetting to exclude 1 or the number itself if the question asks for "proper factors."
- *Correction*: Proper factors count $=$ Total factors $- 1$ (excluding $N$).

### 15. Unit digit summation calculations
- *Mistake*: Summing unit digits without checking if intermediate product terms carry over.
- *Correction*: Add or multiply unit digits step-by-step, applying modulo 10 at each step.
