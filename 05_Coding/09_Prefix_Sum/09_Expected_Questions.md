# Prefix Sum - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Prefix Sum.

---

## 1. PF-01: Equilibrium Index of an Array

*   **Problem Statement**: Find the equilibrium index of an array. An equilibrium index is an index such that the sum of elements at lower indices is equal to the sum of elements at higher indices. If no equilibrium index exists, return -1.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^5 \le \text{arr}[i] \le 10^5$
    *   *Sample Input*: `[-7, 1, 5, 2, -4, 3, 0]` $\implies$ *Sample Output*: `3` (since sum of elements before index 3 is $-7+1+5 = -1$, and sum of elements after index 3 is $-4+3+0 = -1$)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | For each index, calculate left and right sums using nested loops. | $O(N^2)$ | $O(1)$ | Easy, but triggers TLE. |
| **Optimal Prefix Sum** | Precompute total sum. Traverse array keeping running sum of left elements; right sum is calculated as `total - left - current`. | $O(N)$ | $O(1)$ | Fast, single pass, zero extra space. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <numeric>

int findEquilibriumIndex(const std::vector<int>& arr) {
    long long total_sum = 0;
    for (int num : arr) total_sum += num;
    
    long long left_sum = 0;
    for (int i = 0; i < arr.size(); i++) {
        long long right_sum = total_sum - left_sum - arr[i];
        
        if (left_sum == right_sum) {
            return i;
        }
        left_sum += arr[i];
    }
    return -1;
}
```

### Dry Run Table
Input: `[-7, 1, 5, 2, -4, 3, 0]`. `total_sum = 0`.

| Index $i$ | Element `arr[i]` | `left_sum` | `right_sum` (`0 - left_sum - arr[i]`) | Check: `left_sum == right_sum` | Action |
| :---: | :---: | :---: | :---: | :---: | :--- |
| 0 | -7 | 0 | 7 | $0 \ne 7$ | Update `left_sum` = -7 |
| 1 | 1 | -7 | 6 | $-7 \ne 6$ | Update `left_sum` = -6 |
| 2 | 5 | -6 | 1 | $-6 \ne 1$ | Update `left_sum` = -1 |
| 3 | 2 | -1 | -1 | $-1 == -1$ (True) | Return index 3 |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Two sequential scans (one for total sum, one for checking equilibrium).
*   **Space Complexity**: $O(1)$ — Only a few registers/variables are allocated.

### Shortcut & Math Derivation
*   **Derivation**: Let $S$ be total sum of array elements, $L_i$ be sum up to index $i-1$, and $R_i$ be sum after index $i$. The relationship is:
    $$L_i + A[i] + R_i = S \implies R_i = S - L_i - A[i]$$
    For equilibrium:
    $$L_i = R_i \implies L_i = S - L_i - A[i]$$
    This equation allows us to find the equilibrium point using only the running left sum $L_i$ and the constant total sum $S$.
*   **Real Number Demo**: With sum $S = 10$. If $A[i] = 2$, and $L_i = 4$, then $R_i = 10 - 4 - 2 = 4$. Since $L_i = R_i = 4$, $i$ is the equilibrium index.

### Variation & Trap
*   **Trap**: Starting the loop from index 1. Index 0 can be an equilibrium index if elements from 1 to $N-1$ sum to 0.
*   **Variation**: Find equilibrium split point where array is partitioned into two subarrays of equal sum (excluding no elements). Equation becomes $L_i = S - L_i$.

---

## 2. PF-02: Subarray Sum Divisible by K

*   **Problem Statement**: Given an integer array `nums` and an integer $K$, return the number of non-empty subarrays that have a sum divisible by $K$.
*   **Constraints**:
    *   $1 \le \text{nums.size()} \le 10^5$
    *   $-10^4 \le \text{nums}[i] \le 10^4$
    *   $2 \le K \le 10^4$
    *   *Sample Input*: `nums = [4, 5, 0, -2, -3, 1]`, K = `5` $\implies$ *Sample Output*: `7`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | Try all subarrays. | $O(N^2)$ | $O(1)$ | Triggers TLE for $N = 10^5$. |
| **Optimal Modulo Map** | Compute prefix sum modulo K. If two prefix sums have same remainder, subarray between them is divisible by K. | $O(N)$ | $O(K)$ | Fast, solves in linear time. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

int subarraysDivByK(const std::vector<int>& nums, int k) {
    // Array to store frequencies of remainders (faster than map since remainders < k)
    std::vector<int> remainder_counts(k, 0);
    remainder_counts[0] = 1; // Base case: prefix sum divisible by k directly
    
    int current_sum = 0;
    int count = 0;
    
    for (int num : nums) {
        current_sum += num;
        int rem = current_sum % k;
        
        // Handle negative remainders in C++
        if (rem < 0) {
            rem += k;
        }
        
        count += remainder_counts[rem];
        remainder_counts[rem]++;
    }
    return count;
}
```

### Dry Run Table
Input: `[4, 5, 0]`, K = `5`

| Index | Element | `current_sum` | `rem` (`current_sum % 5`) | Matches Added | `remainder_counts` State | Total Count |
| :---: | :---: | :---: | :---: | :---: | :--- | :---: |
| — | — | 0 | — | — | `{0: 1, 1: 0, 2: 0, 3: 0, 4: 0}` | 0 |
| 0 | 4 | 4 | 4 | 0 | `{0: 1, 4: 1}` | 0 |
| 1 | 5 | 9 | 4 | 1 | `{0: 1, 4: 2}` | 1 |
| 2 | 0 | 9 | 4 | 2 | `{0: 1, 4: 3}` | 3 |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass through the array.
*   **Space Complexity**: $O(K)$ — Array of size $K$ to store modulo remainders.

### Shortcut & Math Derivation
*   **Derivation**: Let $S_i$ and $S_j$ be prefix sums. Subarray sum is divisible by $K$ if:
    $$(S_j - S_i) \pmod K = 0 \implies S_j \pmod K = S_i \pmod K$$
    So if two prefix sums leave the same remainder when divided by $K$, the sum of elements between them is a multiple of $K$.
*   **Real Number Demo**: With $K=5$, prefix sum 4 leaves remainder 4. Adding 5 changes prefix sum to 9, which still leaves remainder 4. The added element (5) is divisible by 5.

### Variation & Trap
*   **Trap**: Negative remainders in C++ (e.g. `-3 % 5 = -3`). We must adjust negative remainders by adding $K$: `(rem + k) % k` to ensure they fall in range $[0, K-1]$.
*   **Variation**: Find the longest subarray divisible by $K$. Store first index of remainder in map instead of counts.

---

## 3. PF-03: Prefix Range Sum Queries

*   **Problem Statement**: Design a data structure that supports range sum queries on an array that does not change.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $1 \le Q \le 10^5$
    *   $-10^5 \le \text{arr}[i] \le 10^5$
    *   *Sample Input*: `arr = [1, 3, 5, 7]`, query `(1, 3)` $\implies$ *Sample Output*: `15` (since $3+5+7 = 15$)

### Approach Comparison
| Approach | Logic | Time per query | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Scan** | Loop from L to R on each query. | $O(N)$ | $O(1)$ | $O(N \cdot Q)$ overall, causes TLE. |
| **Prefix Sum Array** | Compute prefix sum. Query is answered as `prefix[R+1] - prefix[L]`. | $O(1)$ | $O(N)$ | $O(N + Q)$ overall, highly optimal. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

class RangeSumQuery {
private:
    std::vector<long long> prefix;
public:
    RangeSumQuery(const std::vector<int>& arr) {
        int n = arr.size();
        prefix.resize(n + 1, 0);
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + arr[i];
        }
    }
    
    long long query(int left, int right) {
        if (left < 0 || right >= prefix.size() - 1 || left > right) return 0;
        return prefix[right + 1] - prefix[left];
    }
};
```

### Dry Run Table
Input: `arr = [1, 3, 5, 7]`. `prefix = [0, 1, 4, 9, 16]`.

| Query (L, R) | Formula | Calculation | Output |
| :---: | :--- | :--- | :---: |
| (1, 3) | `prefix[4] - prefix[1]` | $16 - 1 = 15$ | 15 |
| (0, 2) | `prefix[3] - prefix[0]` | $9 - 0 = 9$ | 9 |
| (2, 2) | `prefix[3] - prefix[2]` | $9 - 4 = 5$ | 5 |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ for initialization; $O(1)$ per query. Total time for $Q$ queries is $O(N + Q)$.
*   **Space Complexity**: $O(N)$ to store the prefix sum array.

### Shortcut & Math Derivation
*   **Derivation**: Sum of subarray from index $L$ to $R$ is:
    $$\sum_{i=L}^R A[i] = \sum_{i=0}^R A[i] - \sum_{i=0}^{L-1} A[i] = P[R+1] - P[L]$$
    This subtraction isolates the desired subarray elements, making query time independent of range size.
*   **Real Number Demo**: With array `[1, 3, 5]`, prefix sums are `[0, 1, 4, 9]`. Sum of elements from idx 1 to 2 (`[3, 5]`) is $9 - 1 = 8$.

### Variation & Trap
*   **Trap**: Not resizing prefix array to $N+1$. Having prefix size $N$ requires awkward check for $L=0$. Storing size $N+1$ simplifies equation to `prefix[R+1] - prefix[L]`.
*   **Variation**: 2D Range Sum Query. Stored prefix is $P[R+1][C+1]$. Formula is $P[r_2+1][c_2+1] - P[r_1][c_2+1] - P[r_2+1][c_1] + P[r_1][c_1]$.
