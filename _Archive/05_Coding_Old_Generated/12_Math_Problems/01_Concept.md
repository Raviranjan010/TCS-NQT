# Mathematical Coding Problems - Concept Guide

## 1. One-Line Intuition
> **Math Problems = utilize mathematical properties (divisibility, prime numbers, GCD/LCM, modular arithmetic) to avoid expensive simulations.**

---

## 2. ASCII Trace: Euclidean Algorithm for GCD
Find the Greatest Common Divisor (GCD) of $48$ and $18$ using the recurrence: $\text{gcd}(a, b) = \text{gcd}(b, a \pmod b)$.

```text
Step 1: Compute remainder of 48 / 18.
        - a = 48, b = 18
        - 48 % 18 = 12
        - Update: a = 18, b = 12
        State: gcd(48, 18) -> gcd(18, 12)

Step 2: Compute remainder of 18 / 12.
        - a = 18, b = 12
        - 18 % 12 = 6
        - Update: a = 12, b = 6
        State: gcd(18, 12) -> gcd(12, 6)

Step 3: Compute remainder of 12 / 6.
        - a = 12, b = 6
        - 12 % 6 = 0
        - Update: a = 6, b = 0
        State: gcd(12, 6) -> gcd(6, 0)

Step 4: Since b = 0, termination condition met.
        - Return a = 6.
        Result: GCD is 6.
```

---

## 3. C++14 Templates

### Template A: Primality Check & Sieve of Eratosthenes
```cpp
#include <vector>

bool isPrimeOptimized(int n) {
    if (n <= 1) return false;
    if (n <= 3) return true;
    if (n % 2 == 0 || n % 3 == 0) return false;
    
    for (int divisor = 5; divisor * divisor <= n; divisor += 6) {
        if (n % divisor == 0 || n % (divisor + 2) == 0) {
            return false;
        }
    }
    return true;
}

std::vector<int> sieveOfEratosthenes(int limit) {
    std::vector<bool> is_prime(limit + 1, true);
    if (limit >= 0) is_prime[0] = false;
    if (limit >= 1) is_prime[1] = false;
    
    for (int prime_idx = 2; prime_idx * prime_idx <= limit; prime_idx++) {
        if (is_prime[prime_idx]) {
            for (int multiple = prime_idx * prime_idx; multiple <= limit; multiple += prime_idx) {
                is_prime[multiple] = false;
            }
        }
    }
    
    std::vector<int> primes;
    for (int val = 2; val <= limit; val++) {
        if (is_prime[val]) {
            primes.push_back(val);
        }
    }
    return primes;
}
```

### Template B: Euclidean GCD & LCM
```cpp
#include <algorithm>

int calculateGCD(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

int calculateLCM(int a, int b) {
    if (a == 0 || b == 0) return 0;
    // Divide first to prevent integer overflow
    return (std::abs(a) / calculateGCD(a, b)) * std::abs(b);
}
```

### Template C: Fast Exponentiation / Power Modulo
```cpp
long long modularExponentiation(long long base, long long exponent, long long modulus) {
    if (modulus == 1) return 0;
    
    long long result = 1;
    base = base % modulus;
    
    while (exponent > 0) {
        if (exponent % 2 == 1) {
            result = (result * base) % modulus;
        }
        exponent = exponent / 2;
        base = (base * base) % modulus;
    }
    return result;
}
```


---

## 4. Recognition Patterns
**Use mathematical properties when you see:**
*   **Divisibility & Primes:** "Check if a number is prime", "Find prime factors", "Find count of common divisors".
*   **GCD/LCM cycles:** "Trains meeting at stations", "Find the largest square tile size to fit a floor".
*   **Large Modular Arithmetic:** "Compute $A^B \pmod C$ where $B \le 10^9$".
*   **Combinatorial Counts:** "Find number of trailing zeros in a factorial", "Compute Catalan numbers".

---

## 5. When Naive Simulation Fails vs When Math Works

### ❌ When Naive Simulation Fails (Counter-Example: Large Exponents)
*   **Context:** Compute $3^{10^9} \pmod{10^9+7}$.
*   **Why Naive Loop Fails:**
    *   Multiplying $3$ continuously $10^9$ times takes $10^9$ loop iterations.
    *   This will trigger a **Time Limit Exceeded (TLE)** error on all online judges (runs for >5 seconds).
*   **Reason for Failure:** Linear complexity $O(E)$ is too slow when exponent $E$ is large.
*   **Correct Alternative:** Use **Binary Exponentiation** (Template C). The exponent is divided by 2 at each step, reducing time to $O(\log E) \approx 30$ iterations.

### Algorithm Comparison Table:
| Operation | Naive Approach | Mathematical Approach |
| :--- | :--- | :--- |
| **Primality check** | $O(N)$ (check all up to $N$) | $O(\sqrt{N})$ (check up to $\sqrt{N}$) |
| **Primes generation** | $O(N\sqrt{N})$ (check each individually) | $O(N \log \log N)$ (Sieve of Eratosthenes) |
| **GCD calculation** | $O(\min(a,b))$ (check all factors) | $O(\log(\min(a,b)))$ (Euclidean algorithm) |
| **Power Calculation** | $O(N)$ (multiply $N$ times) | $O(\log N)$ (Fast Exponentiation) |

---

## 6. TCS NQT-Style Problems

### Problem 1: Sieve of Eratosthenes (Count Primes)
**Problem Statement:** Count the number of prime numbers less than a given non-negative number $N$.

#### 1. Brute Force Approach
*   **Concept:** Iterate through all numbers from $2$ to $N-1$, testing each for primality using the $O(\sqrt{X})$ trial division method.
*   **Complexity:** Time: $O(N \sqrt{N})$, Space: $O(1)$.

#### 2. Sieve of Eratosthenes Optimization
*   **Concept:** Create a boolean array `is_prime` of size $N$. Initialize all entries as true. Starting from $2$, for every prime number we find, mark all of its multiples as composite (false) up to $N$.
*   **C++ & Python Code Solutions:**

```python
# Python: Count Primes
def count_primes(n: int) -> int:
    if n <= 2:
        return 0
        
    is_prime = [True] * n
    is_prime[0] = is_prime[1] = False
    
    for i in range(2, int(n**0.5) + 1):
        if is_prime[i]:
            # Mark multiples starting from i*i
            for j in range(i * i, n, i):
                is_prime[j] = False
                
    return sum(is_prime)
```

```cpp
// C++: Count Primes
#include <iostream>
#include <vector>
#include <numeric>

int countPrimes(int n) {
    if (n <= 2) return 0;
    
    std::vector<bool> isPrime(n, true);
    isPrime[0] = isPrime[1] = false;
    
    for (int i = 2; i * i < n; ++i) {
        if (isPrime[i]) {
            for (int j = i * i; j < n; j += i) {
                isPrime[j] = false;
            }
        }
    }
    
    int primeCount = 0;
    for (int i = 2; i < n; ++i) {
        if (isPrime[i]) primeCount++;
    }
    return primeCount;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N \log \log N)$ (proved by prime harmonic series summation).
    *   **Space Complexity:** $O(N)$ to maintain the prime flags array.

---

### Problem 2: Smallest Common Multiple (LCM of Array)
**Problem Statement:** Given an array of integers, find the Least Common Multiple (LCM) of all elements.

#### 1. Brute Force Approach
*   **Concept:** Start from the maximum element in the array and keep incrementing it by 1, checking if it is divisible by all array elements.
*   **Complexity:** Time: $O(\infty)$ in worst case (extremely slow if LCM is large).

#### 2. Euclidean GCD-Based Calculation
*   **Concept:** The LCM of two numbers $x$ and $y$ is given by $\frac{x \times y}{\text{gcd}(x, y)}$. We calculate the LCM of the array elements incrementally: $\text{lcm}(a_1, a_2, \dots, a_k) = \text{lcm}(\text{lcm}(a_1, a_2), a_3) \dots$.
*   **C++ & Python Code Solutions:**

```python
# Python: LCM of Array
def calculate_gcd(a: int, b: int) -> int:
    while b != 0:
        a, b = b, a % b
    return a

def calculate_lcm(a: int, b: int) -> int:
    if a == 0 or b == 0:
        return 0
    return (a * b) // calculate_gcd(a, b)

def find_array_lcm(nums: list[int]) -> int:
    if not nums:
        return 0
    current_lcm = nums[0]
    for i in range(1, len(nums)):
        current_lcm = calculate_lcm(current_lcm, nums[i])
    return current_lcm
```

```cpp
// C++: LCM of Array
#include <iostream>
#include <vector>
#include <numeric>

long long calculateGcd(long long a, long long b) {
    while (b != 0) {
        long long temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

long long calculateLcm(long long a, long long b) {
    if (a == 0 || b == 0) return 0;
    return (a / calculateGcd(a, b)) * b; // Divide first to prevent overflow
}

long long findArrayLcm(std::vector<int>& nums) {
    if (nums.empty()) return 0;
    long long currentLcm = nums[0];
    for (size_t i = 1; i < nums.size(); ++i) {
        currentLcm = calculateLcm(currentLcm, nums[i]);
    }
    return currentLcm;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N \log(\min(A_i)))$ where $\log(\min(A_i))$ is the cost of Euclidean GCD calculations.
    *   **Space Complexity:** $O(1)$ auxiliary space.
