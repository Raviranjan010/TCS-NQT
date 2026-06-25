# Shortcuts & Speed Hacks: Number System

This file outlines speed hacks for prime checking, division remainders, and unit digit cycles, with real number demonstrations.

---

## ⚡ 1. The last two digits exponent trick
- **Shortcut**: To compute $X^E \pmod 4$, look only at the last two digits of $E$.
- **Real Number Demo**: Find $7^{234582} \pmod{10}$.
  - The cycle of 7 is 4.
  - Divide the last two digits of the exponent ($82$) by 4: $82 \pmod 4 = 2$.
  - Unit digit $= 7^2 \pmod{10} = 9$.

---

## ⚡ 2. Prime Number verification ($6k \pm 1$)
- **Shortcut**: All prime numbers greater than 3 can be expressed in the form $6k \pm 1$.
- **Real Number Demo**: Verify if $101$ is prime.
  - Divide 101 by 6: $101 = 6 \times 16 + 5 = 6 \times 17 - 1 \implies$ fits $6k - 1$.
  - Test divisibility by primes up to $\sqrt{101} \approx 10$ ($2, 3, 5, 7$).
  - Not divisible by any. Confirmed Prime.

---

## ⚡ 3. Divisibility check for 11 alternating sum
- **Shortcut**: Alternating sum calculation: Group digits in pairs from right and sum them modulo 11.
- **Real Number Demo**: Check if $859424$ is divisible by 11.
  - Group in pairs: $85, 94, 24$.
  - Sum $= 85 + 94 + 24 = 203$.
  - Divide $203$ by 11: $203 = 11 \times 18 + 5 \implies$ Remainder $5 \implies$ Not divisible.

---

## ⚡ 4. Divisibility check for 7, 11, 13 (Triplets block)
- **Shortcut**: Split the number into blocks of 3 digits starting from the right. Subtract alternating blocks.
- **Real Number Demo**: Check if $124376$ is divisible by 7.
  - Split: $376$ and $124$.
  - Difference $= 376 - 124 = 252$.
  - $252 / 7 = 36 \implies$ Divisible.
