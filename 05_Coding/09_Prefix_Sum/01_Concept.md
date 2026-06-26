# Prefix Sum Technique - Concept Guide

## 1. One-Line Intuition
> **Prefix Sum = precompute cumulative sums of an array so that range sum queries can be answered in $O(1)$ time.**

---

## 2. ASCII Trace: Range Sum Query
Given array `A = [3, 4, -2, 5, 8]`. We want to answer queries of the form $\text{Sum}(L, R)$.

```text
Step 1: Construct Prefix Sum Array P where P[i] represents sum from A[0] to A[i-1].
        Let P have size N + 1, with P[0] = 0.
        P[0] = 0
        P[1] = P[0] + A[0] = 0 + 3 = 3
        P[2] = P[1] + A[1] = 3 + 4 = 7
        P[3] = P[2] + A[2] = 7 + (-2) = 5
        P[4] = P[3] + A[3] = 5 + 5 = 10
        P[5] = P[4] + A[4] = 10 + 8 = 18

        A:    [  3,   4,  -2,   5,   8]
        P: [0,   3,   7,   5,  10,  18]
        Idx:0    1    2    3    4    5

Step 2: Answer Query: Sum of subarray from index L = 1 to R = 3 (elements A[1] + A[2] + A[3] = 4 + -2 + 5 = 7).
        Formula: Sum(L, R) = P[R + 1] - P[L]
        Calculation:
          Sum(1, 3) = P[4] - P[1]
                    = 10 - 3
                    = 7
        Time taken: O(1) instead of traversing index 1 to 3!
```

---

## 3. Python Templates

### Template A: 1D Prefix Sum (Range Sum Query)
```python
def build_prefix_sum(nums: list[int]) -> list[int]:
    n = len(nums)
    prefix = [0] * (n + 1)
    
    for i in range(n):
        prefix[i + 1] = prefix[i] + nums[i]
        
    return prefix

def query_range_sum(prefix: list[int], left: int, right: int) -> int:
    # Sum of nums[left...right] (inclusive)
    return prefix[right + 1] - prefix[left]
```

### Template B: 2D Prefix Sum (Matrix Range Sum)
```python
def build_2d_prefix_sum(matrix: list[list[int]]) -> list[list[int]]:
    rows = len(matrix)
    cols = len(matrix[0]) if rows > 0 else 0
    prefix = [[0] * (cols + 1) for _ in range(rows + 1)]
    
    for r in range(rows):
        for c in range(cols):
            prefix[r + 1][c + 1] = (matrix[r][c] + 
                                    prefix[r][c + 1] + 
                                    prefix[r + 1][c] - 
                                    prefix[r][c])
    return prefix

def query_2d_range_sum(prefix: list[list[int]], r1: int, c1: int, r2: int, c2: int) -> int:
    return (prefix[r2 + 1][c2 + 1] - 
            prefix[r1][c2 + 1] - 
            prefix[r2 + 1][c1] + 
            prefix[r1][c1])
```

### Template C: Prefix Sum with Hashing (Subarray Sum Equals K)
```python
def count_subarray_sum_equals_k(nums: list[int], k: int) -> int:
    prefix_counts = {0: 1}  # Initialize with base case: prefix sum 0 occurs once
    current_prefix_sum = 0
    match_count = 0
    
    for num in nums:
        current_prefix_sum += num
        # If (current_prefix_sum - k) is found, a valid subarray exists
        target_prefix = current_prefix_sum - k
        if target_prefix in prefix_counts:
            match_count += prefix_counts[target_prefix]
            
        prefix_counts[current_prefix_sum] = prefix_counts.get(current_prefix_sum, 0) + 1
        
    return match_count
```

---

## 4. Recognition Patterns
**Use Prefix Sum when you see:**
*   **Subarray Sum Queries:** "Find sum of elements between index L and R repeatedly."
*   **Equal Sum Targets:** "Subarrays whose sum equals K", "Find partition point where left sum equals right sum."
*   **Static Matrices:** Grid range queries (2D Prefix Sum).
*   **Difference Arrays:** Range updates on an array (combining prefix sum with range update templates).

---

## 5. When Prefix Sum Fails vs When it Works

### ❌ When Prefix Sum Fails (Counter-Example: Dynamic Updates)
*   **Context:** Array `A = [1, 2, 3, 4]`. We need to alternate between two queries:
    1. Update index `i` to value `v`.
    2. Query range sum from `L` to `R`.
*   **Why Prefix Sum Fails:**
    *   Constructing Prefix Sum takes $O(N)$ time.
    *   If we update index `0` to `5`, we must update all subsequent prefix values `P[1], P[2], P[3], P[4]`. This takes $O(N)$ time.
    *   For $Q$ queries with updates, the total time complexity is $O(Q \times N)$, which is too slow.
*   **Reason for Failure:** Prefix sum is a static precomputation. It cannot handle dynamic changes efficiently.
*   **Correct Alternative:** Use a **Segment Tree** or a **Fenwick Tree (Binary Indexed Tree)**, which can handle both updates and queries in $O(\log N)$ time.

### Algorithm Comparison Table:
| Feature | Prefix Sum | Naive Querying | Segment Tree / Fenwick Tree |
| :--- | :--- | :--- | :--- |
| **Query Complexity** | $O(1)$ | $O(N)$ | $O(\log N)$ |
| **Update Complexity** | $O(N)$ | $O(1)$ | $O(\log N)$ |
| **Applicability** | Static Arrays | Small $N$ | Dynamic Arrays |

---

## 6. TCS NQT-Style Problems

### Problem 1: Subarray Sum Equals K
**Problem Statement:** Given an array of integers `nums` and an integer `k`, return the total number of continuous subarrays whose sum equals to `k`.

#### 1. Brute Force Approach
*   **Concept:** Use two nested loops to check all possible subarrays and calculate their sums.
*   **Complexity:** Time: $O(N^2)$, Space: $O(1)$.

#### 2. Prefix Sum + Hash Map Optimization
*   **Concept:** Let prefix sum up to index $i$ be $S_i$. A subarray from index $j+1$ to $i$ has sum $k$ if $S_i - S_j = k \implies S_j = S_i - k$. We store prefix sums in a hash map to look up their frequencies in $O(1)$ time.
*   **C++ & Python Code Solutions:**

```python
# Python: Subarray Sum Equals K
def subarray_sum(nums: list[int], k: int) -> int:
    prefix_map = {0: 1}
    current_sum = 0
    count = 0
    
    for num in nums:
        current_sum += num
        if (current_sum - k) in prefix_map:
            count += prefix_map[current_sum - k]
        prefix_map[current_sum] = prefix_map.get(current_sum, 0) + 1
        
    return count
```

```cpp
// C++: Subarray Sum Equals K
#include <iostream>
#include <vector>
#include <unordered_map>

int subarraySum(std::vector<int>& nums, int k) {
    std::unordered_map<int, int> prefixMap;
    prefixMap[0] = 1;
    
    int currentSum = 0;
    int count = 0;
    
    for (int num : nums) {
        currentSum += num;
        if (prefixMap.find(currentSum - k) != prefixMap.end()) {
            count += prefixMap[currentSum - k];
        }
        prefixMap[currentSum]++;
    }
    return count;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N)$ (one pass over the array).
    *   **Space Complexity:** $O(N)$ to store prefix sums in hash map.

---

### Problem 2: Find Equilibrium Index of Array
**Problem Statement:** Find the index in an array such that the sum of elements at lower indices is equal to the sum of elements at higher indices.

#### 1. Brute Force Approach
*   **Concept:** For each index $i$, calculate left sum by running a loop from $0$ to $i-1$, and right sum by running a loop from $i+1$ to $N-1$.
*   **Complexity:** Time: $O(N^2)$, Space: $O(1)$.

#### 2. Prefix Sum (Total Sum Optimization)
*   **Concept:** First calculate total sum of the array. Maintain a running left sum as we traverse. The right sum at index $i$ is calculated as $\text{Total Sum} - \text{Left Sum} - \text{Element}_i$.
*   **C++ & Python Code Solutions:**

```python
# Python: Equilibrium Index
def find_equilibrium_index(nums: list[int]) -> int:
    total_sum = sum(nums)
    left_sum = 0
    
    for idx, val in enumerate(nums):
        # right_sum is total_sum - left_sum - val
        if left_sum == (total_sum - left_sum - val):
            return idx
        left_sum += val
        
    return -1
```

```cpp
// C++: Equilibrium Index
#include <iostream>
#include <vector>
#include <numeric>

int findEquilibriumIndex(std::vector<int>& nums) {
    int totalSum = std::accumulate(nums.begin(), nums.end(), 0);
    int leftSum = 0;
    
    for (int i = 0; i < nums.size(); ++i) {
        if (leftSum == (totalSum - leftSum - nums[i])) {
            return i;
        }
        leftSum += nums[i];
    }
    return -1;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N)$ (two passes: one for total sum, one for equilibrium check).
    *   **Space Complexity:** $O(1)$ auxiliary space.
