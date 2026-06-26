# Recursion - Concept Guide

## 1. One-Line Intuition
> **Recursion = solve a large problem by breaking it down into smaller subproblems of the same form, solved via self-referential calls.**

---

## 2. ASCII Trace: Recursion Tree for Fibonacci (Fib(4))
Computing the 4th Fibonacci number using the mathematical recurrence: $F(n) = F(n-1) + F(n-2)$ with base cases $F(0)=0, F(1)=1$.

```text
Recursion Tree:
                      Fib(4)
                     /      \
                Fib(3)      Fib(2)
               /      \     /      \
          Fib(2)    Fib(1) Fib(1)  Fib(0)
          /    \       |      |       |
      Fib(1)  Fib(0)   1      1       0
        |       |
        1       0

Step-by-Step Traversal Order (Depth-First Search):
1. Call Fib(4)
2.   Call Fib(3) (Left branch of Fib(4))
3.     Call Fib(2) (Left branch of Fib(3))
4.       Call Fib(1) -> returns 1
5.       Call Fib(0) -> returns 0
6.     Fib(2) returns 1 + 0 = 1
7.     Call Fib(1) -> returns 1 (Right branch of Fib(3))
8.   Fib(3) returns 1 + 1 = 2
9.   Call Fib(2) (Right branch of Fib(4))
10.    Call Fib(1) -> returns 1
11.    Call Fib(0) -> returns 0
12.  Fib(2) returns 1 + 0 = 1
13. Fib(4) returns 2 + 1 = 3
```
*Notice that `Fib(2)` is computed twice. This redundancy is the core weakness of naive recursion.*

---

## 3. Python Templates

### Template A: Basic Linear Recursion (Factorial)
```python
def linear_recursion_factorial(n: int) -> int:
    # 1. Base case: termination condition to prevent infinite recursion
    if n <= 1:
        return 1
        
    # 2. Recursive step: reduce the problem size and call self
    subproblem_result = linear_recursion_factorial(n - 1)
    
    # 3. Combine step: use the result of subproblem to build solution
    return n * subproblem_result
```

### Template B: Divide & Conquer Tree Recursion (Merge Sort)
```python
def divide_and_conquer_merge_sort(arr: list[int]) -> list[int]:
    # Base case: arrays of size 0 or 1 are already sorted
    if len(arr) <= 1:
        return arr
        
    # Divide step: split the array into halves
    middle_idx = len(arr) // 2
    left_half = arr[:middle_idx]
    right_half = arr[middle_idx:]
    
    # Conquer step: recursively sort both halves
    sorted_left = divide_and_conquer_merge_sort(left_half)
    sorted_right = divide_and_conquer_merge_sort(right_half)
    
    # Combine step: merge the sorted halves
    return merge(sorted_left, sorted_right)

def merge(left: list[int], right: list[int]) -> list[int]:
    merged_list = []
    i = j = 0
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            merged_list.append(left[i])
            i += 1
        else:
            merged_list.append(right[j])
            j += 1
    merged_list.extend(left[i:])
    merged_list.extend(right[j:])
    return merged_list
```

### Template C: Recursion with Memoization (Top-Down Dynamic Programming)
```python
def fibonacci_memoized(n: int, memo_table: dict = None) -> int:
    if memo_table is None:
        memo_table = {}
        
    # Check if value is already computed
    if n in memo_table:
        return memo_table[n]
        
    # Base cases
    if n == 0:
        return 0
    if n == 1:
        return 1
        
    # Recursive computation and storage
    memo_table[n] = fibonacci_memoized(n - 1, memo_table) + fibonacci_memoized(n - 2, memo_table)
    return memo_table[n]
```

---

## 4. Recognition Patterns
**Use Recursion when you see:**
*   **Hierarchical Structures:** Trees, graphs, folders, HTML DOM elements.
*   **Combinatorial Searches:** "Find all permutations...", "Generate all subsets/combinations...", "Solve the sudoku/puzzle (Backtracking)".
*   **Divide and Conquer:** Binary search, sorting algorithms (Merge/Quick sort), power functions ($x^n$).
*   **Inductive Definition:** Problem is mathematically defined in terms of itself (e.g. Factorials, Catalan numbers, Fibonacci).

---

## 5. When Recursion Fails vs When it Works

### ❌ When Recursion Fails (Counter-Example: High Depth / Redundant Calls)
*   **Context:** Calculating `Fibonacci(100)` using the naive recursion $F(n) = F(n-1) + F(n-2)$.
*   **Why Naive Recursion Fails:**
    *   The height of the recursion tree is $N$. At each node, we branch into 2 calls.
    *   The total number of calls is $O(2^N) = 2^{100} \approx 10^{30}$ calculations. The sun will die before this completes!
    *   In addition, if $N$ is too large (e.g. $10,000$), call stacks overflow, throwing a **StackOverflowError** (Python limit is 1000).
*   **Reason for Failure:** Overlapping subproblems are resolved repeatedly, leading to exponential time, and linear call stack memory.
*   **Correct Alternative:** Use Iterative DP or Memoization to store subproblem outputs, reducing time complexity to $O(N)$ and space to $O(1)$ (iterative).

### Algorithm Comparison Table:
| Feature | Naive Recursion | Memoized Recursion | Iteration (Loop) |
| :--- | :--- | :--- | :--- |
| **Time Complexity** | $O(2^N)$ (Fibonacci) | $O(N)$ | $O(N)$ |
| **Space Complexity** | $O(N)$ (Stack) | $O(N)$ (Stack + Table) | $O(1)$ |
| **Overflow Risk** | High | High | None |

---

## 6. TCS NQT-Style Problems

### Problem 1: N-Queens Problem (Backtracking)
**Problem Statement:** The N-Queens puzzle is the problem of placing $N$ chess queens on an $N \times N$ chessboard such that no two queens attack each other. Find the number of distinct solutions.

#### 1. Brute Force Approach
*   **Concept:** Place $N$ queens on all possible board positions and filter out non-attacking configurations. Since there are $N^2$ squares and we select $N$ of them, we check $^{N^2}C_N$ placements.
*   **Complexity:** Time: $O((N^2)!)$, which is completely infeasible even for $N=8$.

#### 2. Backtracking Optimization (Optimized Recursion)
*   **Concept:** Place queens column by column. For each column, try placing a queen in each row. Recursively check if the placement is safe. If safe, proceed to the next column. If we reach a dead end, backtrack (undo the placement) and try the next row.
*   **C++ & Python Code Solutions:**

```python
# Python: N-Queens Backtracking
def solve_n_queens(n: int) -> int:
    columns = set()
    positive_diagonals = set()  # (row + col) is constant
    negative_diagonals = set()  # (row - col) is constant
    solutions_count = 0
    
    def backtrack(row: int) -> None:
        nonlocal solutions_count
        if row == n:
            solutions_count += 1
            return
            
        for col in range(n):
            if col in columns or (row + col) in positive_diagonals or (row - col) in negative_diagonals:
                continue
                
            # Place queen (choose)
            columns.add(col)
            positive_diagonals.add(row + col)
            negative_diagonals.add(row - col)
            
            # Recurse
            backtrack(row + 1)
            
            # Undo placement (backtrack)
            columns.remove(col)
            positive_diagonals.remove(row + col)
            negative_diagonals.remove(row - col)
            
    backtrack(0)
    return solutions_count
```

```cpp
// C++: N-Queens Backtracking
#include <iostream>
#include <vector>
#include <unordered_set>

class NQueens {
private:
    int n;
    int solutionsCount = 0;
    std::unordered_set<int> cols;
    std::unordered_set<int> posDiag; // row + col
    std::unordered_set<int> negDiag; // row - col

    void backtrack(int row) {
        if (row == n) {
            solutionsCount++;
            return;
        }

        for (int col = 0; col < n; ++col) {
            if (cols.count(col) || posDiag.count(row + col) || negDiag.count(row - col)) {
                continue;
            }

            cols.insert(col);
            posDiag.insert(row + col);
            negDiag.insert(row - col);

            backtrack(row + 1);

            cols.erase(col);
            posDiag.erase(row + col);
            negDiag.erase(row - col);
        }
    }

public:
    int solve(int boardSize) {
        n = boardSize;
        solutionsCount = 0;
        backtrack(0);
        return solutionsCount;
    }
};
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N!)$ (there are at most $N$ choices for the first row, $N-2$ for the second, etc.).
    *   **Space Complexity:** $O(N)$ for recursion stack and hash sets.

---

### Problem 2: Power Function (Calculate $X^Y$)
**Problem Statement:** Given a double $x$ and integer $n$, calculate $x^n$ (i.e., $x$ raised to the power $n$).

#### 1. Naive Recursion
*   **Concept:** Calculate $x^n = x \times x^{n-1}$. This requires $n$ recursive steps.
*   **Complexity:** Time: $O(N)$, Space: $O(N)$ for call stack.

#### 2. Optimized Divide & Conquer (Binary Exponentiation)
*   **Concept:** If $n$ is even, $x^n = (x^{n/2})^2$. If $n$ is odd, $x^n = x \times (x^{n/2})^2$. This cuts the exponent in half at each step.
*   **C++ & Python Code Solutions:**

```python
# Python: Binary Exponentiation
def my_pow(x: float, n: int) -> float:
    # Base cases
    if n == 0:
        return 1.0
    if n < 0:
        x = 1.0 / x
        n = -n
        
    half_pow = my_pow(x, n // 2)
    
    if n % 2 == 0:
        return half_pow * half_pow
    else:
        return x * half_pow * half_pow
```

```cpp
// C++: Binary Exponentiation
#include <iostream>

double myPow(double x, long long n) {
    if (n == 0) return 1.0;
    if (n < 0) {
        x = 1.0 / x;
        n = -n;
    }
    
    double halfPow = myPow(x, n / 2);
    
    if (n % 2 == 0) {
        return halfPow * halfPow;
    } else {
        return x * halfPow * halfPow;
    }
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(\log N)$ (since exponent is divided by 2 at each recursive level).
    *   **Space Complexity:** $O(\log N)$ auxiliary space for call stack.
