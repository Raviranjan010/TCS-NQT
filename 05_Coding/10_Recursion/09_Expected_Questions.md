# Recursion - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Recursion.

---

## 1. REC-01: Fibonacci Number

*   **Problem Statement**: Write a function to compute the N-th Fibonacci number. Provide recurrence tree analysis and optimizations.
*   **Constraints**:
    *   $0 \le N \le 45$
    *   *Sample Input*: $N = 6$ $\implies$ *Sample Output*: `8`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Naive Recursion** | $F(N) = F(N-1) + F(N-2)$ | $O(2^N)$ | $O(N)$ | Simple but triggers TLE for $N > 35$. |
| **Optimal Iterative** | Keep last two values. | $O(N)$ | $O(1)$ | Optimal, fits within memory constraints. |

### Optimal C++14 Solution
```cpp
#include <iostream>

long long getFibonacci(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    
    long long prev2 = 0;
    long long prev1 = 1;
    long long current = 0;
    
    for (int i = 2; i <= n; i++) {
        current = prev1 + prev2;
        prev2 = prev1;
        prev1 = current;
    }
    return current;
}
```

### Dry Run Table
Input: $N = 4$

| Step $i$ | `prev2` | `prev1` | `current` | State transition |
| :---: | :---: | :---: | :---: | :--- |
| Init | 0 | 1 | — | Base cases. |
| 2 | 0 | 1 | $1 + 0 = 1$ | `prev2 = 1, prev1 = 1` |
| 3 | 1 | 1 | $1 + 1 = 2$ | `prev2 = 1, prev1 = 2` |
| 4 | 1 | 2 | $2 + 1 = 3$ | `prev2 = 2, prev1 = 3` |

Returns 3.

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single loop from 2 to $N$.
*   **Space Complexity**: $O(1)$ — Only three numeric variables are allocated.

### Shortcut & Math Derivation
*   **Derivation**: Naive recursive Fibonacci recurrence relation is:
    $$T(N) = T(N-1) + T(N-2) + O(1)$$
    By solving using characteristic equations, we find:
    $$T(N) \approx \Theta\left(\phi^N\right) \quad \text{where } \phi = \frac{1+\sqrt{5}}{2} \approx 1.618$$
    This is an exponential time complexity of $O(1.618^N)$.
*   **Real Number Demo**: Computing $F(4)$ naively calls $F(2)$ twice, doing duplicate work. Iterative approach tracks only last two values, bypassing the recursion stack entirely.

### Variation & Trap
*   **Trap**: Using naive recursion without memoization. Any values above 35 will result in time limit exceeded errors during exams.
*   **Variation**: Matrix Exponentiation. Solves N-th Fibonacci in $O(\log N)$ time by computing $\begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}^N$.

---

## 2. REC-02: Power Function (Logarithmic)

*   **Problem Statement**: Implement $x^n$ (calculates $x$ raised to the power $n$) in $O(\log n)$ time.
*   **Constraints**:
    *   $-100.0 < x < 100.0$
    *   $-2^{31} \le n \le 2^{31} - 1$
    *   *Sample Input*: $x = 2.0, n = 10$ $\implies$ *Sample Output*: `1024.0`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Simulation** | Multiply $x$ by itself $n$ times. | $O(n)$ | $O(1)$ | Very slow, triggers TLE for large $n$. |
| **Optimal Divide & Conquer** | If $n$ is even, $x^n = (x^2)^{n/2}$. If $n$ is odd, $x^n = x \cdot (x^2)^{(n-1)/2}$. | $O(\log n)$ | $O(\log n)$ | Fast, logarithmic depth. |

### Optimal C++14 Solution
```cpp
double myPow(double x, long long n) {
    if (n == 0) return 1.0;
    if (n < 0) {
        x = 1.0 / x;
        n = -n;
    }
    
    double half = myPow(x, n / 2);
    if (n % 2 == 0) {
        return half * half;
    } else {
        return x * half * half;
    }
}
```

### Dry Run Table
Input: $x = 2.0, n = 5$

| Level | `n` | `n % 2` | Calculation | Return value |
| :---: | :---: | :---: | :--- | :---: |
| 1 | 5 | Odd | $2.0 \times \text{myPow}(2.0, 2) \times \text{myPow}(2.0, 2)$ | $2.0 \times 4.0 \times 4.0 = 32.0$ |
| 2 | 2 | Even | $\text{myPow}(2.0, 1) \times \text{myPow}(2.0, 1)$ | $2.0 \times 2.0 = 4.0$ |
| 3 | 1 | Odd | $2.0 \times \text{myPow}(2.0, 0) \times \text{myPow}(2.0, 0)$ | $2.0 \times 1.0 \times 1.0 = 2.0$ |
| 4 | 0 | Base | returns 1.0 | 1.0 |

### Complexity Analysis
*   **Time Complexity**: $O(\log N)$ — The value of exponent $n$ is halved at each recursion step.
*   **Space Complexity**: $O(\log N)$ — Recursion call stack depth is $\log N$.

### Shortcut & Math Derivation
*   **Derivation**: The exponent is represented in binary. For $n = 5$ ($101_2$):
    $$x^5 = x^{2^2 \cdot 1 + 2^1 \cdot 0 + 2^0 \cdot 1} = x^4 \cdot x^1$$
    By using recursion to divide the exponent by 2, we dynamically build powers of $x^{2^k}$ in $O(\log n)$ steps.
*   **Real Number Demo**: Calculating $2^8 = (2^4)^2 = ((2^2)^2)^2$. We only perform 3 multiplications instead of 8.

### Variation & Trap
*   **Trap**: Handling $n = -2^{31}$. Negating it directly causes integer overflow (since maximum positive integer is $2^{31}-1$). Always cast to `long long` before negation.
*   **Variation**: Modular exponentiation $(x^n) \pmod M$. Wrap every multiplication step with modulo operator.

---

## 3. REC-03: Tower of Hanoi

*   **Problem Statement**: Solve the Tower of Hanoi puzzle for $N$ disks. Print steps and derive the mathematical formula for minimum steps.
*   **Constraints**:
    *   $1 \le N \le 15$
    *   *Sample Input*: $N = 3$ $\implies$ *Sample Output*: `Move disk 1 from A to C ... Total Steps = 7`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Recursive** | Move $N-1$ disks to aux, move last disk to dest, move $N-1$ disks to dest. | $O(2^N)$ | $O(N)$ | Standard, optimal because puzzle requires exponential steps. |

### Optimal C++14 Solution
```cpp
#include <iostream>

void towerOfHanoi(int n, char from_rod, char to_rod, char aux_rod, long long& step_count) {
    if (n == 0) return;
    
    // Step 1: Move n-1 disks from Source to Aux
    towerOfHanoi(n - 1, from_rod, aux_rod, to_rod, step_count);
    
    // Step 2: Move n-th disk from Source to Destination
    step_count++;
    std::cout << "Move disk " << n << " from " << from_rod << " to " << to_rod << "\n";
    
    // Step 3: Move n-1 disks from Aux to Destination
    towerOfHanoi(n - 1, aux_rod, to_rod, from_rod, step_count);
}
```

### Dry Run Table
Input: $N = 2$, source='A', dest='C', aux='B'.

| Step | Call State | Action | `step_count` |
| :---: | :--- | :--- | :---: |
| 1 | `towerOfHanoi(1, 'A', 'B', 'C')` | Move disk 1 from A to B | 1 |
| 2 | `towerOfHanoi(2, 'A', 'C', 'B')` | Move disk 2 from A to C | 2 |
| 3 | `towerOfHanoi(1, 'B', 'C', 'A')` | Move disk 1 from B to C | 3 |

Total steps $= 3$.

### Complexity Analysis
*   **Time Complexity**: $O(2^N)$ — The number of steps doubles with each disk.
*   **Space Complexity**: $O(N)$ — Maximum recursion stack depth is $N$.

### Shortcut & Math Derivation
*   **Derivation**: Let $T(N)$ be the steps for $N$ disks.
    $$T(N) = 2T(N-1) + 1, \quad T(1) = 1$$
    Using substitution:
    $$T(N) = 2(2T(N-2) + 1) + 1 = 4T(N-2) + 2 + 1 = 2^k T(N-k) + \sum_{i=0}^{k-1} 2^i$$
    For $k = N-1$:
    $$T(N) = 2^{N-1} T(1) + (2^{N-1} - 1) = 2^{N-1} + 2^{N-1} - 1 = 2^N - 1$$
*   **Real Number Demo**: For $N=3$, minimum steps $= 2^3 - 1 = 7$.

### Variation & Trap
*   **Trap**: Attempting to print steps for $N > 25$. It will freeze execution and print millions of lines, triggering TLE. Only print steps if $N$ is small.
*   **Variation**: Find the position of disk $D$ after $K$ moves.

---

## 4. REC-04: Subset Generation

*   **Problem Statement**: Given a set of unique integers `nums`, return all possible subsets (the power set).
*   **Constraints**:
    *   $1 \le \text{nums.size()} \le 15$
    *   $-10 \le \text{nums}[i] \le 10$
    *   *Sample Input*: `[1, 2]` $\implies$ *Sample Output*: `[[], [1], [2], [1, 2]]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Backtracking (Recursive)** | For each element, decide whether to include or exclude it, and recurse. | $O(2^N)$ | $O(N)$ | Intuitive, standard backtracking template. |
| **Bit Manipulation (Iterative)** | Loop from $0$ to $2^N - 1$. Use bit mask to select elements. | $O(N \cdot 2^N)$ | $O(1)$ | Simple, iterative, no recursion overhead. |

### Optimal C++14 Solution (Backtracking)
```cpp
#include <vector>

void backtrack(int index, const std::vector<int>& nums, std::vector<int>& current, 
               std::vector<std::vector<int>>& result) {
    result.push_back(current);
    
    for (int i = index; i < nums.size(); i++) {
        current.push_back(nums[i]); // Include element
        backtrack(i + 1, nums, current, result); // Recurse
        current.pop_back(); // Exclude element (backtrack)
    }
}

std::vector<std::vector<int>> subsets(const std::vector<int>& nums) {
    std::vector<std::vector<int>> result;
    std::vector<int> current;
    backtrack(0, nums, current, result);
    return result;
}
```

### Dry Run Table
Input: `nums = [1, 2]`

| Step | Index | Loop `i` | `current` state | `result` additions | Action |
| :---: | :---: | :---: | :--- | :--- | :--- |
| 1 | 0 | — | `[]` | `[]` | Recurse with index 0 |
| 2 | 0 | 0 | `[1]` | `[1]` | Recurse with index 1 |
| 3 | 1 | 1 | `[1, 2]` | `[1, 2]` | Recurse with index 2 (returns) |
| 4 | — | backtrack | `[1]` | — | Loop increments `i` to 1 (returns) |
| 5 | — | backtrack | `[]` | — | Loop increments `i` to 1 |
| 6 | 1 | 1 | `[2]` | `[2]` | Recurse with index 2 (returns) |

### Complexity Analysis
*   **Time Complexity**: $O(2^N)$ — A power set of size $2^N$ is generated.
*   **Space Complexity**: $O(N)$ — Stack depth and `current` storage is at most $N$.

### Shortcut & Math Derivation
*   **Derivation**: A set of size $N$ has $2^N$ subsets. This is because for each element, we have a binary choice: include (1) or exclude (0).
    $$\sum_{k=0}^N \binom{N}{k} = 2^N$$
*   **Real Number Demo**: With `nums = [1, 2]`. $N=2 \implies 2^2 = 4$ subsets.
    *   `00` $\implies$ `[]`
    *   `01` $\implies$ `[2]`
    *   `10` $\implies$ `[1]`
    *   `11` $\implies$ `[1, 2]`

### Variation & Trap
*   **Trap**: Forgetting to remove the last added element (`pop_back()`) before backtracking, which pollutes subsequent subset branches.
*   **Variation**: Subsets II. Input contains duplicate elements; sort array first and skip duplicate checks inside backtrack loop to avoid duplicate subsets.
