# Math Problems - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Mathematical Operations.

---

## 1. MATH-01: Sieve of Eratosthenes

*   **Problem Statement**: Write a program to find and print all prime numbers up to $N$. Derive the composite marking boundary and prove why the loop runs up to $\sqrt{N}$.
*   **Constraints**:
    *   $1 \le N \le 10^6$
    *   *Sample Input*: $N = 10$ $\implies$ *Sample Output*: `2 3 5 7`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Trial Division** | Test each number up to $N$ for primality using $O(\sqrt{i})$ divisor scan. | $O(N \sqrt{N})$ | $O(1)$ | Slow for $N = 10^6$. |
| **Optimal Sieve** | Allocate boolean array. Mark multiples of each prime starting from $p^2$. | $O(N \log \log N)$ | $O(N)$ | Highly efficient, standard prime generator. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

std::vector<int> generatePrimes(int n) {
    std::vector<bool> is_prime(n + 1, true);
    if (n >= 0) is_prime[0] = false;
    if (n >= 1) is_prime[1] = false;
    
    // Mark composites from prime_idx^2
    for (int p = 2; p * p <= n; p++) {
        if (is_prime[p]) {
            // Start marking from p^2, lower multiples are already marked
            for (int i = p * p; i <= n; i += p) {
                is_prime[i] = false;
            }
        }
    }
    
    std::vector<int> primes;
    for (int i = 2; i <= n; i++) {
        if (is_prime[i]) {
            primes.push_back(i);
        }
    }
    return primes;
}
```

### Dry Run Table
Input: $N = 10$. Initial state: all true (except 0, 1).

| Prime `p` | `p * p <= 10` | Inner loop start `p * p` | Multiples marked | `is_prime` state |
| :---: | :---: | :---: | :--- | :--- |
| 2 | $4 \le 10$ (True) | 4 | `4, 6, 8, 10` | `2, 3, 5, 7` remain true |
| 3 | $9 \le 10$ (True) | 9 | `9` | `9` becomes false |
| 4 | $16 \le 10$ (False) | — | Loop ends | Final: `2, 3, 5, 7` |

### Complexity Analysis
*   **Time Complexity**: $O(N \log \log N)$ — Sum of reciprocals of primes up to $N$.
*   **Space Complexity**: $O(N)$ — To store the boolean prime flags grid.

### Shortcut & Math Derivation
*   **Derivation**: Why do we run outer loop up to $\sqrt{N}$ and start marking from $p^2$?
    *   If a number $M \le N$ is composite, it has a prime factor $p \le \sqrt{M} \le \sqrt{N}$. If we check up to $\sqrt{N}$, all composites will have been marked.
    *   Any multiple $k \cdot p$ where $k < p$ (e.g. $2p, 3p$) has a prime factor smaller than $p$ and was already marked when processing that smaller factor. Therefore, the first unique multiple of $p$ we need to mark is $p \cdot p = p^2$.
*   **Real Number Demo**: For $p = 5$, multiples $10$ ($2 \times 5$), $15$ ($3 \times 5$), $20$ ($4 \times 5$) were already marked when we processed $2, 3,$ and $2$ again. The first unmarked multiple is $5 \times 5 = 25$.

### Variation & Trap
*   **Trap**: Allocating `vector<bool>` dynamically inside loops. Always allocate once at start.
*   **Variation**: Segmented Sieve. Used when range is $[L, R]$ where $R$ is huge but $R - L$ is small ($O(10^5)$).

---

## 2. MATH-02: Euclid's GCD (Euclid's Division Theorem)

*   **Problem Statement**: Implement Greatest Common Divisor (GCD) using the Euclidean algorithm. Derive the division theorem and trace calculations.
*   **Constraints**:
    *   $0 \le A, B \le 2 \times 10^9$
    *   *Sample Input*: $A = 48, B = 18$ $\implies$ *Sample Output*: `6`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Subtractive Method** | Subtract smaller from larger repeatedly. | $O(\max(A, B))$ | $O(1)$ | Slow if one number is huge (e.g., $10^9$ and 1). |
| **Optimal Division Method** | $\text{gcd}(a, b) = \text{gcd}(b, a \bmod b)$. | $O(\log(\min(A, B)))$ | $O(1)$ | Extremely fast, terminates in log steps. |

### Optimal C++14 Solution
```cpp
#include <iostream>

long long getGCD(long long a, long long b) {
    while (b != 0) {
        long long temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}
```

### Dry Run Table
Input: $A = 48, B = 18$

| Step | `a` value | `b` value | Remainder `a % b` | Action |
| :---: | :---: | :---: | :---: | :--- |
| 1 | 48 | 18 | $48 \bmod 18 = 12$ | `a = 18, b = 12` |
| 2 | 18 | 12 | $18 \bmod 12 = 6$ | `a = 12, b = 6` |
| 3 | 12 | 6 | $12 \bmod 6 = 0$ | `a = 6, b = 0` |
| 4 | 6 | 0 | Loop terminates | Return `a` (6) |

### Complexity Analysis
*   **Time Complexity**: $O(\log(\min(A, B)))$ — Lame's Theorem proves the number of steps is at most 5 times the number of digits in the smaller number.
*   **Space Complexity**: $O(1)$ — No recursion stack, iterative swaps only.

### Shortcut & Math Derivation
*   **Derivation**: Let $d$ be common divisor of $a$ and $b$. Then $a = x \cdot d$ and $b = y \cdot d$.
    By division algorithm, $a = q \cdot b + r \implies r = a - q \cdot b$.
    Substitute $a$ and $b$:
    $$r = x \cdot d - q \cdot (y \cdot d) = (x - q \cdot y) \cdot d$$
    This proves that $d$ also divides the remainder $r$. Hence, the common divisors of $a$ and $b$ are identical to the common divisors of $b$ and $r$ ($a \bmod b$).
*   **Real Number Demo**: If $\text{gcd}(48, 18) = 6$:
    $48 = 2 \times 18 + 12$. Remainder $12$ is also divisible by $6$.

### Variation & Trap
*   **Trap**: Divisor $B$ can be 0. Ensure base case `b == 0` is handled (returns `a`).
*   **Variation**: Extended Euclidean Algorithm. Finds integers $x$ and $y$ such that $a \cdot x + b \cdot y = \text{gcd}(a, b)$, used in finding modular multiplicative inverses.

---

## 3. MATH-03: Prime Factorization

*   **Problem Statement**: Find all prime factors of a given number $N$.
*   **Constraints**:
    *   $2 \le N \le 10^9$
    *   *Sample Input*: $N = 315$ $\implies$ *Sample Output*: `3 3 5 7`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Scan** | Test divisibility for all numbers up to $N$. | $O(N)$ | $O(1)$ | Slow for prime inputs like $10^9+7$. |
| **Optimal Divisor Scan** | Test divisibility up to $\sqrt{N}$. Divide out factors completely. | $O(\sqrt{N})$ | $O(\log N)$ | Fast, terminates quickly as $N$ shrinks. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

std::vector<int> getPrimeFactors(int n) {
    std::vector<int> factors;
    
    // Divide out 2s
    while (n % 2 == 0) {
        factors.push_back(2);
        n /= 2;
    }
    
    // Divide out odd numbers up to sqrt(n)
    for (int i = 3; i * i <= n; i += 2) {
        while (n % i == 0) {
            factors.push_back(i);
            n /= i;
        }
    }
    
    // If n is still greater than 2, then remaining n is prime
    if (n > 2) {
        factors.push_back(n);
    }
    return factors;
}
```

### Dry Run Table
Input: $N = 315$

| Step | `i` value | `n` value | `n % i == 0` | Action | Factors List |
| :---: | :---: | :---: | :---: | :--- | :--- |
| Init | 2 | 315 | $315 \bmod 2 \ne 0$ | Skip 2 | `[]` |
| 1 | 3 | 315 | $315 \bmod 3 == 0$ | Divide out 3, `n` becomes 105 | `[3]` |
| 2 | 3 | 105 | $105 \bmod 3 == 0$ | Divide out 3, `n` becomes 35 | `[3, 3]` |
| 3 | 3 | 35 | $35 \bmod 3 \ne 0$ | Loop increments `i` to 5 | `[3, 3]` |
| 4 | 5 | 35 | $35 \bmod 5 == 0$ | Divide out 5, `n` becomes 7 | `[3, 3, 5]` |
| 5 | 5 | 7 | $7 \bmod 5 \ne 0$ | Loop terminates since $7 \times 7 > 7$ | `[3, 3, 5]` |
| End | — | 7 | $7 > 2$ | Add remaining factor 7 | `[3, 3, 5, 7]` |

### Complexity Analysis
*   **Time Complexity**: $O(\sqrt{N})$ — Worst case when $N$ is prime. Best case is $O(\log N)$ when $N$ is a power of 2.
*   **Space Complexity**: $O(1)$ auxiliary space (excluding output factors storage).

### Shortcut & Math Derivation
*   **Derivation**: Fundamental Theorem of Arithmetic states every integer $N > 1$ can be uniquely represented as a product of prime powers:
    $$N = p_1^{a_1} \cdot p_2^{a_2} \dots p_k^{a_k}$$
    If we divide out each prime factor completely as we find it, we guarantee that the next divisor that divides the remaining quotient must also be a prime.
*   **Real Number Demo**: For $N = 12$. We divide out 2 twice, $n$ becomes 3. 4 ($i=4$) will not divide 3 because all multiples of 2 were already cleared.

### Variation & Trap
*   **Trap**: Loop condition `i <= n` instead of `i * i <= n`. This reverts time complexity to $O(N)$.
*   **Variation**: Print prime factors with their powers (e.g. $3^2 \times 5^1 \times 7^1$). Use a frequency tracking loop.
