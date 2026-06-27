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

## 3. C++14 Templates

### Template A: Basic Linear Recursion (Factorial)
```cpp
int linearRecursionFactorial(int n) {
    // 1. Base case
    if (n <= 1) return 1;
    
    // 2. Recursive step and 3. Combine step
    return n * linearRecursionFactorial(n - 1);
}
```

### Template B: Divide & Conquer Tree Recursion (Merge Sort)
```cpp
#include <vector>

void merge(std::vector<int>& arr, int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;
    std::vector<int> L(n1), R(n2);
    
    for (int i = 0; i < n1; i++) L[i] = arr[left + i];
    for (int j = 0; j < n2; j++) R[j] = arr[mid + 1 + j];
    
    int i = 0, j = 0, k = left;
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k++] = L[i++];
        } else {
            arr[k++] = R[j++];
        }
    }
    while (i < n1) arr[k++] = L[i++];
    while (j < n2) arr[k++] = R[j++];
}

void mergeSort(std::vector<int>& arr, int left, int right) {
    if (left >= right) return;
    int mid = left + (right - left) / 2;
    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);
    merge(arr, left, mid, right);
}
```

### Template C: Recursion with Memoization (Top-Down Dynamic Programming)
```cpp
#include <unordered_map>

int fibonacciMemoized(int n, std::unordered_map<int, int>& memo_table) {
    // Check if value is already computed
    if (memo_table.count(n)) {
        return memo_table[n];
    }
    
    // Base cases
    if (n == 0) return 0;
    if (n == 1) return 1;
    
    // Recursive computation and storage
    memo_table[n] = fibonacciMemoized(n - 1, memo_table) + fibonacciMemoized(n - 2, memo_table);
    return memo_table[n];
}
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
