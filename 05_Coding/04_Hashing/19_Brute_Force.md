# Hashing Techniques - Brute Force vs. Hashing

This guide analyzes how brute-force approaches are designed, why they fail under TCS NQT time constraints, and how hashing optimizes these operations.

---

## 1. Case Study: Subarray Sum Equals K

*   **Problem**: Given an array of size $N$, count all contiguous subarrays whose sum equals $K$.
*   **Constraints**: $N = 10^5$, elements can be negative. Time Limit: 1.0 Second.

---

## 2. Brute Force Approaches

### Approach A: Cubic Time $O(N^3)$
Generate all possible subarrays by choosing starting index $i$ and ending index $j$. Then, run a third loop from $i$ to $j$ to compute the sum.
```cpp
// O(N^3) Code
int countSubarraysCubic(const std::vector<int>& arr, int k) {
    int count = 0;
    int n = arr.size();
    for (int i = 0; i < n; ++i) {
        for (int j = i; j < n; ++j) {
            int sum = 0;
            for (int m = i; m <= j; ++m) {
                sum += arr[m];
            }
            if (sum == k) count++;
        }
    }
    return count;
}
```

### Approach B: Quadratic Time $O(N^2)$
Optimize by calculating the running sum in the second loop directly, avoiding the third loop.
```cpp
// O(N^2) Code
int countSubarraysQuadratic(const std::vector<int>& arr, int k) {
    int count = 0;
    int n = arr.size();
    for (int i = 0; i < n; ++i) {
        int sum = 0;
        for (int j = i; j < n; ++j) {
            sum += arr[j];
            if (sum == k) count++;
        }
    }
    return count;
}
```

---

## 3. Why Brute Force Fails: Math Derivation of TLE

### Operation Count Derivation
The number of times the inner sum statement is executed in the quadratic $O(N^2)$ approach is:
$$\text{Total Loops} = \sum_{i=1}^{N} (N - i + 1) = \frac{N(N + 1)}{2}$$

For $N = 10^5$:
$$\text{Total Loops} = \frac{10^5 \times (10^5 + 1)}{2} \approx 5 \times 10^9 \text{ operations}$$

### Execution Time Projection
*   A standard CPU executes approximately $10^8$ basic instructions per second.
*   The required execution time is:
    $$\text{Time} = \frac{5 \times 10^9 \text{ operations}}{10^8 \text{ operations/sec}} = 50 \text{ seconds}$$
*   Since the NQT platform has a strict **1.0 second time limit**, this solution triggers a **Time Limit Exceeded (TLE)** error.

---

## 4. Hashing Optimization: Linear Time $O(N)$

By utilizing a Hash Map to store running prefix sums, we reduce the search from a nested loop scan to a single $O(1)$ map lookup.

```cpp
// O(N) Optimized Code
#include <unordered_map>

int countSubarraysOptimal(const std::vector<int>& arr, int k) {
    std::unordered_map<int, int> prefix_counts;
    prefix_counts[0] = 1;
    
    int current_sum = 0;
    int count = 0;
    
    for (int num : arr) {
        current_sum += num;
        if (prefix_counts.count(current_sum - k)) {
            count += prefix_counts[current_sum - k];
        }
        prefix_counts[current_sum]++;
    }
    return count;
}
```

### Operation Count Projection
*   For $N = 10^5$, the loop runs exactly $10^5$ times.
*   Total operations $\approx 10^5$ hash map updates/lookups.
*   **Execution Time**: $< 5 \text{ milliseconds}$ (Instant Pass!).
