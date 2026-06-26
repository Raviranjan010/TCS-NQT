# Coding Mock Tests - Expected Questions

This file contains expected practice questions for the Coding Mock tests.

---

## 1. MOCK-COD-01: Balanced Parentheses

*   **Pattern ID**: `MOCK-COD-01`
*   **Problem Statement & Constraints**: Given a string containing just characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.
    *   $1 \le \text{s.length()} \le 10^5$
    *   *Sample Input*: `"{[]}"` $\implies$ *Sample Output*: `true`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **String Replace** | Replace `()`, `{}`, `[]` with `""` repeatedly. | $O(N^2)$ | $O(N)$ | Easy, but too slow for $N = 10^5$. |
| **Optimal Stack** | Push open brackets; match and pop closed brackets. | $O(N)$ | $O(N)$ | Fast, optimal, passes all tests. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <string>
#include <vector>

bool isValidParentheses(const std::string& s) {
    std::vector<char> stack;
    for (char c : s) {
        if (c == '(' || c == '{' || c == '[') {
            stack.push_back(c);
        } else {
            if (stack.empty()) return false;
            char top = stack.back();
            if ((c == ')' && top == '(') || 
                (c == '}' && top == '{') || 
                (c == ']' && top == '[')) {
                stack.pop_back();
            } else {
                return false;
            }
        }
    }
    return stack.empty();
}
```

### Dry Run Table
Input: `"{[]}"`

| Step | Char `c` | Stack state | Action | Output |
| :---: | :---: | :--- | :--- | :---: |
| 1 | `'{'` | `['{']` | Push | — |
| 2 | `'['` | `['{', '[']` | Push | — |
| 3 | `']'` | `['{']` | Match top `'['`, pop | — |
| 4 | `'}'` | `[]` | Match top `'{'`, pop | — |
| End | — | `[]` | Empty? Yes. | `true` |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass through string.
*   **Space Complexity**: $O(N)$ — Stack stores up to $N$ open brackets in worst case.

### Shortcut & Math Derivation
*   **Derivation**: Every closed bracket must match the most recently opened bracket. This fits the Last-In, First-Out (LIFO) property exactly, which is implemented using a stack.
*   **Real Number Demo**: With `({)}`, we push `(`, `{`. Then closed `}` does not match top `{`, instantly failing.

### Variation & Trap
*   **Trap**: Forgetting to check if stack is empty before calling `back()`, causing segment fault.
*   **Variation**: Find the minimum bracket additions to make string balanced.

---

## 2. MOCK-COD-02: Spiral Matrix Traversal

*   **Pattern ID**: `MOCK-COD-02`
*   **Problem Statement & Constraints**: Traverse a 2D matrix of size $M \times N$ in spiral order.
    *   $1 \le M, N \le 100$
    *   *Sample Input*: `[[1, 2], [3, 4]]` $\implies$ *Sample Output*: `1 2 4 3`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Simulation** | Walk boundary, shrink boundaries. | $O(M \cdot N)$ | $O(1)$ | Optimal, standard boundary shrinking. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

void printSpiral(const std::vector<std::vector<int>>& matrix) {
    if (matrix.empty() || matrix[0].empty()) return;
    int top = 0, bottom = matrix.size() - 1;
    int left = 0, right = matrix[0].size() - 1;
    
    while (top <= bottom && left <= right) {
        for (int i = left; i <= right; i++) std::cout << matrix[top][i] << " ";
        top++;
        for (int i = top; i <= bottom; i++) std::cout << matrix[i][right] << " ";
        right--;
        if (top <= bottom) {
            for (int i = right; i >= left; i--) std::cout << matrix[bottom][i] << " ";
            bottom--;
        }
        if (left <= right) {
            for (int i = bottom; i >= top; i--) std::cout << matrix[i][left] << " ";
            left++;
        }
    }
}
```

### Dry Run Table
Input: `[[1, 2], [3, 4]]`

| Boundary | Loop | Elements Printed |
| :--- | :--- | :--- |
| Top = 0, Bottom = 1 | Left to Right (row 0) | `1 2` |
| Left = 0, Right = 1 | Top to Bottom (col 1) | `4` |
| Top = 1, Bottom = 1 | Right to Left (row 1) | `3` |
| Ends (left > right) | — | Final: `1 2 4 3` |

### Complexity Analysis
*   **Time Complexity**: $O(M \cdot N)$ — Every cell is visited once.
*   **Space Complexity**: $O(1)$ — No extra arrays allocated.

### Shortcut & Math Derivation
*   **Derivation**: Maintain four pointers (`top`, `bottom`, `left`, `right`) representing the active boundary. Scan one edge, increment/decrement that boundary, and repeat.
*   **Real Number Demo**: For $2 \times 2$, boundary shrinks to single element after first ring.

### Variation & Trap
*   **Trap**: Forgetting `top <= bottom` check before the third loop. On single-row matrices, it results in duplicate printing.

---

## 3. MOCK-COD-03: Subarray Sum Divisible by K

*   **Pattern ID**: `MOCK-COD-03`
*   **Problem Statement & Constraints**: Find the number of subarrays with a sum divisible by $K$.
    *   $1 \le N \le 10^5$, $2 \le K \le 10^4$
    *   *Sample Input*: `[4, 5, 0, -2, -3, 1]`, K = 5 $\implies$ *Sample Output*: `7`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Optimal Prefix Map** | Map prefix sum remainders. | $O(N)$ | $O(K)$ | Fast, solves in linear time. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

int subarraysDivByK(const std::vector<int>& nums, int k) {
    std::vector<int> remainder_counts(k, 0);
    remainder_counts[0] = 1;
    
    int current_sum = 0;
    int count = 0;
    
    for (int num : nums) {
        current_sum += num;
        int rem = current_sum % k;
        if (rem < 0) rem += k;
        
        count += remainder_counts[rem];
        remainder_counts[rem]++;
    }
    return count;
}
```

### Dry Run Table
Input: `[4, 5]`, K = 5.

| Num | `current_sum` | `rem` | Add Matches | Counts update | Total |
| :---: | :---: | :---: | :---: | :--- | :---: |
| 4 | 4 | 4 | 0 | `counts[4]=1` | 0 |
| 5 | 9 | 4 | 1 | `counts[4]=2` | 1 |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single scan.
*   **Space Complexity**: $O(K)$ — Remainder tracking array of size $K$.

### Shortcut & Math Derivation
*   **Derivation**: Same remainder indicates intermediate sum is a multiple of $K$.
    $$(S_j - S_i) \bmod K = 0 \implies S_j \bmod K = S_i \bmod K$$

---

## 4. MOCK-COD-04: Sieve of Eratosthenes

*   **Pattern ID**: `MOCK-COD-04`
*   **Problem Statement & Constraints**: Find all prime numbers up to $N$.
    *   $1 \le N \le 10^6$
    *   *Sample Input*: $N = 10$ $\implies$ *Sample Output*: `2 3 5 7`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sieve** | Mark multiples of prime $p$ starting from $p^2$. | $O(N \log \log N)$ | $O(N)$ | Highly optimal. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

void printPrimes(int n) {
    std::vector<bool> is_prime(n + 1, true);
    if (n >= 0) is_prime[0] = false;
    if (n >= 1) is_prime[1] = false;
    
    for (int p = 2; p * p <= n; p++) {
        if (is_prime[p]) {
            for (int i = p * p; i <= n; i += p) {
                is_prime[i] = false;
            }
        }
    }
    
    for (int i = 2; i <= n; i++) {
        if (is_prime[i]) {
            std::cout << i << " ";
        }
    }
    std::cout << "\n";
}
```

### Dry Run Table
Input: $N = 10$. Primes marked: 2, 3. Output: `2 3 5 7`.

### Complexity Analysis
*   **Time Complexity**: $O(N \log \log N)$ — Sum of reciprocals of primes.
*   **Space Complexity**: $O(N)$ — Boolean vector of size $N+1$.
