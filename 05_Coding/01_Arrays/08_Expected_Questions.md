---
title: "Arrays - Expected Questions"
section: "Coding"
---

# Array Expected Coding Questions (2026 Predictions)

> [!NOTE]
> These are **high-probability predicted patterns** for upcoming TCS NQT exams. Every solution includes C++14, Java, and Python 3.

---

## 📊 Pattern Recognition Chart
Use this reference table during revision to map problem characteristics to the correct algorithm:

| If you see keywords like... | ...then choose this method | Pattern ID | Target Complexity |
| :--- | :--- | :--- | :---: |
| "sort array of 0s, 1s, and 2s in-place" | Dutch National Flag algorithm | `EXP-ARR-01` | $O(N)$ |
| "product of array except self without division" | Prefix & Suffix running products | `EXP-ARR-02` | $O(N)$ |
| "find a peak element in logarithmic time" | Binary Search on values | `EXP-ARR-03` | $O(\log N)$ |
| "merge sorted arrays into first array in-place" | Backwards Three-Pointer merge | `EXP-ARR-04` | $O(M+N)$ |
| "continuous subarray summing to S" | Sliding Window (Two Pointers) | `EXP-ARR-05` | $O(N)$ |
| "find Kth smallest element in unsorted list" | Max Priority Queue / Min Heap | `EXP-ARR-06` | $O(N \log K)$ |
| "minimal length of subarray sum >= S" | Variable Sliding Window | `EXP-ARR-07` | $O(N)$ |
| "max subsequence sum with no adjacent elements" | Dynamic Programming (Decisions) | `EXP-ARR-08` | $O(N)$ |
| "count subarrays with XOR sum equal to M" | Prefix XOR Hashing | `EXP-ARR-09` | $O(N)$ |
| "one repeating element in range [1, N-1]" | XOR / Floyd's Cycle Detection | `EXP-ARR-10` | $O(N)$ |
| "find element appearing more than N/2 times" | Moore's Voting Algorithm | `EXP-ARR-11` | $O(N)$ |
| "calculate trapped rainwater between bars" | Precomputed Min-Max / Two Pointers | `EXP-ARR-12` | $O(N)$ |

---

## 1. EXP-ARR-01: Sort Array of 0s, 1s, and 2s (Dutch National Flag)

*   **Problem Statement**: Sort an array containing only `0`s, `1`s, and `2`s in-place in $O(N)$ time and $O(1)$ space.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $arr[i] \in \{0, 1, 2\}$
    *   *Sample Input*: `[2, 0, 2, 1, 1, 0]` $\implies$ *Sample Output*: `[0, 0, 1, 1, 2, 2]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Counting Sort**| Count number of 0s, 1s, 2s, then rewrite the array. | $O(N)$ | $O(1)$ | Requires two passes over the array. |
| **Dutch Flag** | Maintain three pointers (`low`, `mid`, `high`) to sort in-place. | $O(N)$ | $O(1)$ | Optimal; single-pass swap-based sorting. |

### C++14 Solution
```cpp
#include <vector>
#include <algorithm>

void sortColors(std::vector<int>& nums) {
    int low = 0, mid = 0, high = nums.size() - 1;
    while (mid <= high) {
        if (nums[mid] == 0) {
            std::swap(nums[low], nums[mid]);
            low++;
            mid++;
        } else if (nums[mid] == 1) {
            mid++;
        } else { // nums[mid] == 2
            std::swap(nums[mid], nums[high]);
            high--;
        }
    }
}
```

### Java Solution
```java
public class Solution {
    public static void sortColors(int[] nums) {
        int low = 0, mid = 0, high = nums.length - 1;
        while (mid <= high) {
            if (nums[mid] == 0) {
                int temp = nums[low];
                nums[low] = nums[mid];
                nums[mid] = temp;
                low++;
                mid++;
            } else if (nums[mid] == 1) {
                mid++;
            } else {
                int temp = nums[high];
                nums[high] = nums[mid];
                nums[mid] = temp;
                high--;
            }
        }
    }
}
```

### Python 3 Solution
```python
def sort_colors(nums):
    low, mid, high = 0, 0, len(nums) - 1
    while mid <= high:
        if nums[mid] == 0:
            nums[low], nums[mid] = nums[mid], nums[low]
            low += 1
            mid += 1
        elif nums[mid] == 1:
            mid += 1
        else:
            nums[mid], nums[high] = nums[high], nums[mid]
            high -= 1
```

### Dry Run
Input: `[2, 0, 2, 1, 1, 0]`.

| Step | Array State | `low` | `mid` | `high` | Val `nums[mid]` | Action |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| Init | `[2, 0, 2, 1, 1, 0]` | 0 | 0 | 5 | 2 | Swap `nums[mid]`, `nums[high]`; `high--` |
| 1 | `[0, 0, 2, 1, 1, 2]` | 0 | 0 | 4 | 0 | Swap `nums[mid]`, `nums[low]`; `low++`, `mid++` |
| 2 | `[0, 0, 2, 1, 1, 2]` | 1 | 1 | 4 | 0 | Swap `nums[mid]`, `nums[low]`; `low++`, `mid++` |
| 3 | `[0, 0, 2, 1, 1, 2]` | 2 | 2 | 4 | 2 | Swap `nums[mid]`, `nums[high]`; `high--` |
| 4 | `[0, 0, 1, 1, 2, 2]` | 2 | 2 | 3 | 1 | Value is 1; `mid++` |
| 5 | `[0, 0, 1, 1, 2, 2]` | 2 | 3 | 3 | 1 | Value is 1; `mid++` |
| End | `[0, 0, 1, 1, 2, 2]` | 2 | 4 | 3 | — | Loop ends (`mid > high`) |

### Shortcut & Math Derivation
*   **Derivation**: Array is partitioned into 4 zones:
    1.  `nums[0 ... low-1]` containing only 0s.
    2.  `nums[low ... mid-1]` containing only 1s.
    3.  `nums[mid ... high]` containing unsorted values.
    4.  `nums[high+1 ... N-1]` containing only 2s.
    As `mid` traverses, it resolves elements in Zone 3 and shrinks it until `mid > high`, leaving the array fully sorted in $O(N)$ steps.

### Variation & Trap
*   **Trap**: Forgetting that `mid` is **not** incremented when swapping with `high` (because the swapped element from `high` is unexamined). Always keep `mid` at the same index in the `else` block.

---

## 2. EXP-ARR-02: Product of Array Except Self

*   **Problem Statement**: Given an array of $N$ integers, return an array `output` such that `output[i]` is equal to the product of all elements of the array except `arr[i]`. Solve in $O(N)$ time without using the division operator.
*   **Constraints**:
    *   $2 \le N \le 10^5$, $-30 \le arr[i] \le 30$
    *   *Sample Input*: `[1, 2, 3, 4]` $\implies$ *Sample Output*: `[24, 12, 8, 6]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Division** | Find total product, divide by `arr[i]` for each index. | $O(N)$ | $O(1)$ | Fails if the array contains zero. |
| **Prefix/Suffix** | Compute cumulative prefix products and suffix products on the fly. | $O(N)$ | $O(1)$ | Handles zeros correctly without division. |

### C++14 Solution
```cpp
#include <vector>

std::vector<int> productExceptSelf(const std::vector<int>& nums) {
    int n = nums.size();
    std::vector<int> res(n, 1);
    
    int prefix = 1;
    for (int i = 0; i < n; i++) {
        res[i] = prefix;
        prefix *= nums[i];
    }
    
    int suffix = 1;
    for (int i = n - 1; i >= 0; i--) {
        res[i] *= suffix;
        suffix *= nums[i];
    }
    return res;
}
```

### Java Solution
```java
public class Solution {
    public static int[] productExceptSelf(int[] nums) {
        int n = nums.length;
        int[] res = new int[n];
        
        int prefix = 1;
        for (int i = 0; i < n; i++) {
            res[i] = prefix;
            prefix *= nums[i];
        }
        
        int suffix = 1;
        for (int i = n - 1; i >= 0; i--) {
            res[i] *= suffix;
            suffix *= nums[i];
        }
        return res;
    }
}
```

### Python 3 Solution
```python
def product_except_self(nums):
    n = len(nums)
    res = [1] * n
    
    prefix = 1
    for i in range(n):
        res[i] = prefix
        prefix *= nums[i]
        
    suffix = 1
    for i in range(n - 1, -1, -1):
        res[i] *= suffix
        suffix *= nums[i]
        
    return res
```

### Dry Run
Input: `[1, 2, 3, 4]`.
*   Prefix Pass:
    *   `res[0] = 1`, `prefix = 1 * 1 = 1`
    *   `res[1] = 1`, `prefix = 1 * 2 = 2`
    *   `res[2] = 2`, `prefix = 2 * 3 = 6`
    *   `res[3] = 6`, `prefix = 6 * 4 = 24`
    *   Array state: `[1, 1, 2, 6]`
*   Suffix Pass (from $i=3$ to $0$):
    *   `i = 3`: `res[3] = 6 * 1 = 6`, `suffix = 1 * 4 = 4`
    *   `i = 2`: `res[2] = 2 * 4 = 8`, `suffix = 4 * 3 = 12`
    *   `i = 1`: `res[1] = 1 * 12 = 12`, `suffix = 12 * 2 = 24`
    *   `i = 0`: `res[0] = 1 * 24 = 24`, `suffix = 24 * 1 = 24`
    *   Final: `[24, 12, 8, 6]`.

### Shortcut & Math Derivation
*   **Derivation**: Let $P[i] = \prod_{j \neq i} arr[j]$. We split this product into:
    $$P[i] = \left(\prod_{j=0}^{i-1} arr[j]\right) \times \left(\prod_{j=i+1}^{n-1} arr[j]\right) = \text{Prefix}[i] \times \text{Suffix}[i]$$
    By running a forward scan to store prefix products in the output array, and then a backward scan tracking a running `suffix` product, we achieve $O(1)$ auxiliary space.

### Variation & Trap
*   **Trap**: Multiple zeros (e.g. `[0, 0, 5]`). Output should be `[0, 0, 0]`. Our running multiplier handles this without divide-by-zero crashes.

---

## 3. EXP-ARR-03: Find Peak Element

*   **Problem Statement**: A peak element is strictly greater than its neighbors. Find the index of any peak element in an array in $O(\log N)$ time.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $arr[i] \neq arr[i+1]$
    *   *Sample Input*: `[1, 2, 3, 1]` $\implies$ *Sample Output*: `2` (Index of value 3)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Scan** | Compare each element to its neighbors. | $O(N)$ | $O(1)$ | Slow; fails the $O(\log N)$ constraint. |
| **Binary Search** | Probe middle, step in direction of the larger neighbor. | $O(\log N)$ | $O(1)$ | Highly optimal; works on unsorted arrays. |

### C++14 Solution
```cpp
#include <vector>

int findPeakElement(const std::vector<int>& nums) {
    int low = 0, high = nums.size() - 1;
    while (low < high) {
        int mid = low + (high - low) / 2;
        if (nums[mid] < nums[mid + 1]) {
            low = mid + 1;
        } else {
            high = mid;
        }
    }
    return low;
}
```

### Java Solution
```java
public class Solution {
    public static int findPeakElement(int[] nums) {
        int low = 0, high = nums.length - 1;
        while (low < high) {
            int mid = low + (high - low) / 2;
            if (nums[mid] < nums[mid + 1]) {
                low = mid + 1;
            } else {
                high = mid;
            }
        }
        return low;
    }
}
```

### Python 3 Solution
```python
def find_peak_element(nums):
    low, high = 0, len(nums) - 1
    while low < high:
        mid = low + (high - low) // 2
        if nums[mid] < nums[mid + 1]:
            low = mid + 1
        else:
            high = mid
    return low
```

### Dry Run
Input: `[1, 2, 3, 1]`.
*   Init: `low = 0`, `high = 3`.
    *   `mid = 1 (value 2)`.
    *   `nums[1] < nums[2]` ($2 < 3$) $\implies$ `low = mid + 1 = 2`.
*   Iteration 2: `low = 2`, `high = 3`.
    *   `mid = 2 (value 3)`.
    *   `nums[2] >= nums[3]` ($3 \ge 1$) $\implies$ `high = mid = 2`.
*   Loop ends because `low == high == 2`. Returns `2`.

### Shortcut & Math Derivation
*   **Logarithmic Partitioning Principle**:
    We compare `nums[mid]` and `nums[mid+1]`.
    *   If $nums[mid] < nums[mid+1]$, we are on an ascending slope. A peak must lie to the right ($mid+1 \dots high$).
    *   If $nums[mid] > nums[mid+1]$, we are on a descending slope. A peak must lie to the left ($low \dots mid$).
    Since the search space is halved at each step, iterations count:
    $$\text{Iterations} = \lceil\log_2 N\rceil$$
    For $N=10^5$, maximum loops is 17.

### Variation & Trap
*   **Trap**: Out-of-bounds comparisons for boundary elements. We prevent this by comparing `mid` to `mid + 1` (guaranteed safe as `mid < high`).

---

## 4. EXP-ARR-04: Merge Sorted Arrays In-Place

*   **Problem Statement**: Merge two sorted arrays `arr1` of size $M$ (containing $M$ elements and buffered with $N$ extra zeros) and `arr2` of size $N$ into a single sorted array of size $M+N$ in-place.
*   **Constraints**:
    *   $1 \le M, N \le 10^5$
    *   *Sample Input*: `arr1 = [1, 2, 3, 0, 0, 0]`, $M = 3$, `arr2 = [2, 5, 6]`, $N = 3$ $\implies$ *Output*: `[1, 2, 2, 3, 5, 6]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **New Array** | Merge into a temporary array of size $M+N$, copy back. | $O(M + N)$ | $O(M+N)$ | Simple but wastes memory. |
| **Backward Pointers**| Compare elements starting from the end of both arrays. | $O(M + N)$ | $O(1)$ | Optimal, avoids overwriting unmerged values. |

### C++14 Solution
```cpp
#include <vector>

void merge(std::vector<int>& nums1, int m, const std::vector<int>& nums2, int n) {
    int i = m - 1;
    int j = n - 1;
    int k = m + n - 1;
    
    while (i >= 0 && j >= 0) {
        if (nums1[i] > nums2[j]) {
            nums1[k--] = nums1[i--];
        } else {
            nums1[k--] = nums2[j--];
        }
    }
    while (j >= 0) {
        nums1[k--] = nums2[j--];
    }
}
```

### Java Solution
```java
public class Solution {
    public static void merge(int[] nums1, int m, int[] nums2, int n) {
        int i = m - 1;
        int j = n - 1;
        int k = m + n - 1;
        
        while (i >= 0 && j >= 0) {
            if (nums1[i] > nums2[j]) {
                nums1[k] = nums1[i];
                i--;
            } else {
                nums1[k] = nums2[j];
                j--;
            }
            k--;
        }
        while (j >= 0) {
            nums1[k] = nums2[j];
            j--;
            k--;
        }
    }
}
```

### Python 3 Solution
```python
def merge(nums1, m, nums2, n):
    i = m - 1
    j = n - 1
    k = m + n - 1
    
    while i >= 0 and j >= 0:
        if nums1[i] > nums2[j]:
            nums1[k] = nums1[i]
            i -= 1
        else:
            nums1[k] = nums2[j]
            j -= 1
        k -= 1
        
    while j >= 0:
        nums1[k] = nums2[j]
        j -= 1
        k -= 1
```

### Dry Run
Input: `nums1 = [1, 2, 3, 0, 0, 0]`, $M=3$, `nums2 = [2, 5, 6]`, $N=3$.
*   Init pointers: `i = 2 (3)`, `j = 2 (6)`, `k = 5`.
    *   Compare $nums1[2]$ and $nums2[2]$ ($3 < 6$) $\implies$ `nums1[5] = 6`, `j = 1`, `k = 4`.
*   Iteration 2: `i = 2 (3)`, `j = 1 (5)`, `k = 4`.
    *   Compare $3 < 5$ $\implies$ `nums1[4] = 5`, `j = 0`, `k = 3`.
*   Iteration 3: `i = 2 (3)`, `j = 0 (2)`, `k = 3`.
    *   Compare $3 > 2$ $\implies$ `nums1[3] = 3`, `i = 1`, `k = 2`.
*   Iteration 4: `i = 1 (2)`, `j = 0 (2)`, `k = 2`.
    *   Compare $2 \le 2$ $\implies$ `nums1[2] = 2`, `j = -1`, `k = 1`.
*   `j < 0` ends the loop. Remaining `i` elements in `nums1` are already sorted. Final array: `[1, 2, 2, 3, 5, 6]`.

### Shortcut & Math Derivation
*   **Logic**: Merging backwards guarantees that we write to the empty buffer indices (indices $M \dots M+N-1$) of `nums1` first, which protects unread elements in `nums1` from being overwritten.

### Variation & Trap
*   **Trap**: Forgetting to process leftover elements in `nums2` when `nums1` elements run out first. Always include the loop `while (j >= 0)`.

---

## 5. EXP-ARR-05: Subarray Sum equals Target (Non-Negatives)

*   **Problem Statement**: Find a continuous subarray that sums to a given target $S$ in an array of non-negative integers. Return 1-based start and end indices.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $0 \le arr[i] \le 10^9$
    *   *Sample Input*: `[1, 2, 3, 7, 5]`, target $= 12$ $\implies$ *Sample Output*: `[2, 4]` (Subarray `[2, 3, 7]`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Nested Loops** | Generate sum for all subarrays. | $O(N^2)$ | $O(1)$ | Causes TLE on large arrays. |
| **Sliding Window**| Dynamically expand `right` and contract `left` pointers. | $O(N)$ | $O(1)$ | Highly optimal, linear runtime. |

### C++14 Solution
```cpp
#include <vector>
#include <utility>

std::pair<int, int> subarraySum(const std::vector<int>& arr, long long targetSum) {
    int start = 0;
    long long currentSum = 0;
    for (int end = 0; end < arr.size(); end++) {
        currentSum += arr[end];
        while (currentSum > targetSum && start < end) {
            currentSum -= arr[start];
            start++;
        }
        if (currentSum == targetSum) {
            return {start + 1, end + 1}; // 1-based indexing
        }
    }
    return {-1, -1};
}
```

### Java Solution
```java
public class Solution {
    public static int[] subarraySum(int[] arr, long targetSum) {
        int start = 0;
        long currentSum = 0;
        for (int end = 0; end < arr.length; end++) {
            currentSum += arr[end];
            while (currentSum > targetSum && start < end) {
                currentSum -= arr[start];
                start++;
            }
            if (currentSum == targetSum) {
                return new int[]{start + 1, end + 1};
            }
        }
        return new int[]{-1, -1};
    }
}
```

### Python 3 Solution
```python
def subarray_sum(arr, target_sum):
    start = 0
    current_sum = 0
    for end in range(len(arr)):
        current_sum += arr[end]
        while current_sum > target_sum and start < end:
            current_sum -= arr[start]
            start += 1
        if current_sum == target_sum:
            return [start + 1, end + 1]
    return [-1, -1]
```

### Dry Run
Input: `[1, 2, 3, 7, 5]`, Target $= 12$.

| End Index | Element | `currentSum` | While Condition (`currentSum > 12`) | `start` | Match? |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 1 | 1 | No | 0 | No |
| 1 | 2 | 3 | No | 0 | No |
| 2 | 3 | 6 | No | 0 | No |
| 3 | 7 | 13 | Yes ($13 > 12$) $\implies$ Subtract `arr[0]`: `currentSum = 12` | 1 | Yes ($12 == 12$) $\implies$ Output `[2, 4]` |

### Shortcut & Math Derivation
*   **Window Invariant**: Since all elements are positive, adding elements always increases the sum, and removing elements always decreases it. This monotonic property guarantees that the window borders only need to move forward, yielding a time complexity of $2N \implies O(N)$ steps.

### Variation & Trap
*   **Trap**: If the array can contain negative values, this window strategy fails because sum behavior is no longer monotonic. In that case, use Prefix Sum + Hashing ($O(N)$ time & space).

---

## 6. EXP-ARR-06: Kth Smallest Element

*   **Problem Statement**: Find the Kth smallest element in an unsorted array of size $N$.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $1 \le K \le N$
    *   *Sample Input*: `[7, 10, 4, 3, 20, 15]`, $K = 3$ $\implies$ *Sample Output*: `7`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sorting** | Sort the array and return `arr[K-1]`. | $O(N \log N)$ | $O(1)$ | Simple, but slow for large arrays. |
| **Max Heap** | Maintain a Max Heap of size $K$ to track smallest values. | $O(N \log K)$ | $O(K)$ | Optimal for streaming or large arrays. |

### C++14 Solution
```cpp
#include <vector>
#include <queue>

int findKthSmallest(const std::vector<int>& arr, int k) {
    std::priority_queue<int> maxHeap;
    for (int num : arr) {
        maxHeap.push(num);
        if (maxHeap.size() > k) {
            maxHeap.pop();
        }
    }
    return maxHeap.top();
}
```

### Java Solution
```java
import java.util.PriorityQueue;
import java.util.Collections;

public class Solution {
    public static int findKthSmallest(int[] arr, int k) {
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
        for (int num : arr) {
            maxHeap.add(num);
            if (maxHeap.size() > k) {
                maxHeap.poll();
            }
        }
        return maxHeap.peek();
    }
}
```

### Python 3 Solution
```python
import heapq

def find_kth_smallest(arr, k):
    # Max heap using negated numbers in Python's default min heap
    max_heap = []
    for num in arr:
        heapq.heappush(max_heap, -num)
        if len(max_heap) > k:
            heapq.heappop(max_heap)
    return -max_heap[0]
```

### Dry Run
Input: `[7, 10, 4, 3, 20, 15]`, $K = 3$.
*   Insert `7`: Heap $= [7]$
*   Insert `10`: Heap $= [10, 7]$
*   Insert `4`: Heap $= [10, 7, 4]$
*   Insert `3`: Heap becomes $[10, 7, 4, 3]$ (size 4 > 3) $\implies$ pop maximum element `10`. Heap $= [7, 4, 3]$.
*   Insert `20`: Heap becomes $[20, 7, 4, 3]$ (size 4 > 3) $\implies$ pop maximum element `20`. Heap $= [7, 4, 3]$.
*   Insert `15`: Heap becomes $[15, 7, 4, 3]$ (size 4 > 3) $\implies$ pop maximum element `15`. Heap $= [7, 4, 3]$.
*   Final Peek: Maximum in heap is `7` $\implies$ returns `7`.

### Shortcut & Math Derivation
*   **Complexity Bounds**:
    Inserting $N$ elements into a heap of size $K$ takes $O(N \log K)$ operations.
    When $K \ll N$, this is significantly faster than sorting, which takes $O(N \log N)$ operations.

### Variation & Trap
*   **Trap**: Finding the Kth *largest* element. To do this, change to a Min-Heap (or default Python heap) and keep heap size to $K$.

---

## 7. EXP-ARR-07: Minimum Size Subarray Sum

*   **Problem Statement**: Find the minimal length of a contiguous subarray of which the sum is $\ge S$. If none exists, return 0.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $1 \le S \le 10^9$
    *   *Sample Input*: `[2, 3, 1, 2, 4, 3]`, $S = 7$ $\implies$ *Sample Output*: `2` (Subarray is `[4, 3]`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Nested Loops** | Check all subarray sums and track minimum length. | $O(N^2)$ | $O(1)$ | Causes TLE. |
| **Sliding Window**| Expand `right` pointer, shrink `left` when sum $\ge S$. | $O(N)$ | $O(1)$ | Optimal linear scan. |

### C++14 Solution
```cpp
#include <vector>
#include <algorithm>
#include <climits>

int minSubArrayLen(int s, const std::vector<int>& nums) {
    int left = 0;
    int sum = 0;
    int min_len = INT_MAX;
    
    for (int right = 0; right < nums.size(); right++) {
        sum += nums[right];
        while (sum >= s) {
            min_len = std::min(min_len, right - left + 1);
            sum -= nums[left];
            left++;
        }
    }
    return (min_len == INT_MAX) ? 0 : min_len;
}
```

### Java Solution
```java
public class Solution {
    public static int minSubArrayLen(int s, int[] nums) {
        int left = 0;
        int sum = 0;
        int minLen = Integer.MAX_VALUE;
        
        for (int right = 0; right < nums.length; right++) {
            sum += nums[right];
            while (sum >= s) {
                minLen = Math.min(minLen, right - left + 1);
                sum -= nums[left];
                left++;
            }
        }
        return (minLen == Integer.MAX_VALUE) ? 0 : minLen;
    }
}
```

### Python 3 Solution
```python
def min_sub_array_len(s, nums):
    left = 0
    current_sum = 0
    min_len = float('inf')
    
    for right in range(len(nums)):
        current_sum += nums[right]
        while current_sum >= s:
            min_len = min(min_len, right - left + 1)
            current_sum -= nums[left]
            left += 1
            
    return 0 if min_len == float('inf') else min_len
```

### Dry Run
Input: `nums = [2, 3, 1, 2, 4, 3]`, $S = 7$.
*   `right = 0`: sum $= 2 < 7$
*   `right = 1`: sum $= 5 < 7$
*   `right = 2`: sum $= 6 < 7$
*   `right = 3`: sum $= 8 \ge 7$ $\implies$ `min_len = min(inf, 4) = 4`. Shrink: sum $= 6$, `left = 1`.
*   `right = 4`: sum $= 10 \ge 7$ $\implies$ `min_len = min(4, 4) = 4`. Shrink: sum $= 7 \ge 7 \implies$ `min_len = min(4, 3) = 3`, `left = 2`. Shrink: sum $= 4$, `left = 3`.
*   `right = 5`: sum $= 7 \ge 7$ $\implies$ `min_len = min(3, 3) = 3`. Shrink: sum $= 5 \ge 7$ (False).
*   Wait, during `right = 5` iteration, window is `nums[3...5] = [2, 4, 3]`, sum $=9 \ge 7 \implies$ `min_len = min(3, 3) = 3`. Shrink: sum $=7$, `left = 4`. Loop condition `sum >= 7` is True $\implies$ `min_len = min(3, 2) = 2`, `left = 5`.
*   Result: `2`.

### Shortcut & Math Derivation
*   **Window Contraction Property**:
    Since we want to minimize length, as soon as a valid window is found, we eagerly move `left` forward to find smaller valid prefixes, resolving the optimal subarray in $O(N)$ operations.

### Variation & Trap
*   **Trap**: If no subarray sums to $S$, return `0` instead of a stale maximum value. Always check if the length changed from its initial value.

---

## 8. EXP-ARR-08: Maximum Sum of Non-Adjacent Elements

*   **Problem Statement**: Find the maximum sum of a subsequence in an array such that no two elements in the subsequence are adjacent.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $0 \le arr[i] \le 10^5$
    *   *Sample Input*: `[5, 5, 10, 100, 10, 5]` $\implies$ *Sample Output*: `110` (Subsequence `[5, 100, 5]`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Recursion** | Try both decisions (include or exclude) for every index. | $O(2^N)$ | $O(N)$ | Triggers TLE. |
| **DP (Constant Space)**| Track max sum including and excluding the current element. | $O(N)$ | $O(1)$ | Optimal DP state optimization. |

### C++14 Solution
```cpp
#include <vector>
#include <algorithm>

int findMaxSum(const std::vector<int>& arr) {
    if (arr.empty()) return 0;
    int incl = arr[0];
    int excl = 0;
    
    for (size_t i = 1; i < arr.size(); i++) {
        int temp = std::max(incl, excl);
        incl = excl + arr[i];
        excl = temp;
    }
    return std::max(incl, excl);
}
```

### Java Solution
```java
public class Solution {
    public static int findMaxSum(int[] arr) {
        if (arr == null || arr.length == 0) return 0;
        int incl = arr[0];
        int excl = 0;
        
        for (int i = 1; i < arr.length; i++) {
            int temp = Math.max(incl, excl);
            incl = excl + arr[i];
            excl = temp;
        }
        return Math.max(incl, excl);
    }
}
```

### Python 3 Solution
```python
def find_max_sum(arr):
    if not arr:
        return 0
    incl = arr[0]
    excl = 0
    
    for i in range(1, len(arr)):
        temp = max(incl, excl)
        incl = excl + arr[i]
        excl = temp
        
    return max(incl, excl)
```

### Dry Run
Input: `[5, 5, 10, 100, 10, 5]`.

| Index $i$ | Value | Previous `incl` | Previous `excl` | New `incl` (`excl + val`) | New `excl` (`max(incl, excl)`) |
| :---: | :---: | :---: | :---: | :---: | :---: |
| Init | — | 5 | 0 | — | — |
| 1 | 5 | 5 | 0 | $0 + 5 = 5$ | $\max(5, 0) = 5$ |
| 2 | 10 | 5 | 5 | $5 + 10 = 15$ | $\max(5, 5) = 5$ |
| 3 | 100 | 15 | 5 | $5 + 100 = 105$ | $\max(15, 5) = 15$ |
| 4 | 10 | 105 | 15 | $15 + 10 = 25$ | $\max(105, 15) = 105$ |
| 5 | 5 | 25 | 105 | $105 + 5 = 110$ | $\max(25, 105) = 105$ |

Max sum is $\max(110, 105) = 110$.

### Shortcut & Math Derivation
*   **DP State Transitions**:
    Let $DP[i][0]$ be the max sum at index $i$ excluding $arr[i]$, and $DP[i][1]$ be the max sum including $arr[i]$.
    $$DP[i][0] = \max(DP[i-1][0], DP[i-1][1])$$
    $$DP[i][1] = DP[i-1][0] + arr[i]$$
    Since these transitions only depend on the values at $i-1$, we can optimize the space from $O(N)$ to $O(1)$ by using two variables: `incl` and `excl`.

### Variation & Trap
*   **Trap**: Negative numbers. If all numbers are negative, return `0` (empty subsequence).

---

## 9. EXP-ARR-09: Count Subarrays with Given XOR

*   **Problem Statement**: Count the number of subarrays having XOR sum equal to $M$.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $0 \le arr[i], M \le 10^6$
    *   *Sample Input*: `[4, 2, 2, 6, 4]`, $M = 6$ $\implies$ *Sample Output*: `4`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Nested Loops** | Compute XOR of all subarrays. | $O(N^2)$ | $O(1)$ | Causes TLE on large arrays. |
| **Prefix XOR Map** | Track cumulative XOR counts in a hash map. | $O(N)$ | $O(N)$ | Optimal; uses the property $Y = XR \oplus M$. |

### C++14 Solution
```cpp
#include <vector>
#include <unordered_map>

int countSubarraysXOR(const std::vector<int>& arr, int m) {
    std::unordered_map<int, int> visitedXOR;
    int count = 0;
    int xr = 0;
    visitedXOR[0] = 1;
    
    for (int num : arr) {
        xr = xr ^ num;
        int target = xr ^ m;
        if (visitedXOR.find(target) != visitedXOR.end()) {
            count += visitedXOR[target];
        }
        visitedXOR[xr]++;
    }
    return count;
}
```

### Java Solution
```java
import java.util.HashMap;

public class Solution {
    public static int countSubarraysXOR(int[] arr, int m) {
        HashMap<Integer, Integer> visitedXOR = new HashMap<>();
        int count = 0;
        int xr = 0;
        visitedXOR.put(0, 1);
        
        for (int num : arr) {
            xr = xr ^ num;
            int target = xr ^ m;
            if (visitedXOR.containsKey(target)) {
                count += visitedXOR.get(target);
            }
            visitedXOR.put(xr, visitedXOR.getOrDefault(xr, 0) + 1);
        }
        return count;
    }
}
```

### Python 3 Solution
```python
def count_subarrays_xor(arr, m):
    visited_xor = {0: 1}
    count = 0
    xr = 0
    
    for num in arr:
        xr = xr ^ num
        target = xr ^ m
        if target in visited_xor:
            count += visited_xor[target]
        visited_xor[xr] = visited_xor.get(xr, 0) + 1
        
    return count
```

### Dry Run
Input: `[4, 2, 2, 6, 4]`, $M = 6$.
*   `visited_xor = {0: 1}`
*   `num = 4`: `xr = 4`, `target = 4 ^ 6 = 2`. Not in map. `visited_xor` updated to `{0:1, 4:1}`.
*   `num = 2`: `xr = 4 ^ 2 = 6`, `target = 6 ^ 6 = 0`. Present in map (count 1) $\implies$ `count = 1`. Map $= \{0:1, 4:1, 6:1\}$.
*   `num = 2`: `xr = 6 ^ 2 = 4`, `target = 4 ^ 6 = 2`. Not in map. Map $= \{0:1, 4:2, 6:1\}$.
*   `num = 6`: `xr = 4 ^ 6 = 2`, `target = 2 ^ 6 = 4`. Present in map (count 2) $\implies$ `count = 1 + 2 = 3`. Map $= \{0:1, 4:2, 6:1, 2:1\}$.
*   `num = 4`: `xr = 2 ^ 4 = 6`, `target = 6 ^ 6 = 0`. Present in map (count 1) $\implies$ `count = 3 + 1 = 4`.
*   Result: `4`.

### Shortcut & Math Derivation
*   **XOR Inversion Property**:
    Let prefix XOR up to index $i$ be $XR_i$. The XOR sum of a subarray $arr[j \dots i]$ is:
    $$\text{Subarray XOR} = XR_i \oplus XR_{j-1}$$
    If we want this subarray XOR to equal $M$:
    $$XR_i \oplus XR_{j-1} = M \implies XR_i \oplus M = XR_{j-1}$$
    By storing count of visited prefix XORs in a hash map, we can count matching $XR_{j-1}$ prefixes in $O(1)$ time.

### Variation & Trap
*   **Trap**: Forgetting to initialize the hash map with `{0: 1}`. This base case is required to count subarrays that start at index 0 and match $M$ directly.

---

## 10. EXP-ARR-10: Duplicate Find in range [1, N-1]

*   **Problem Statement**: In an array of size $N$ containing elements from $1$ to $N-1$ where exactly one element repeats, find the repeating number.
*   **Constraints**:
    *   $2 \le N \le 10^5$
    *   *Sample Input*: `[1, 3, 2, 1]` $\implies$ *Sample Output*: `1`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sum Difference** | Subtract sum of $1 \dots N-1$ from the array sum. | $O(N)$ | $O(1)$ | Simple but watch out for arithmetic overflow. |
| **XOR Method** | XOR all array elements and indices from $1$ to $N-1$. | $O(N)$ | $O(1)$ | Optimal, prevents overflow. |

### C++14 Solution
```cpp
#include <vector>

int findDuplicateXOR(const std::vector<int>& arr) {
    int res = 0;
    for (int val : arr) res ^= val;
    for (int i = 1; i < arr.size(); i++) res ^= i;
    return res;
}
```

### Java Solution
```java
public class Solution {
    public static int findDuplicateXOR(int[] arr) {
        int res = 0;
        for (int val : arr) res ^= val;
        for (int i = 1; i < arr.length; i++) res ^= i;
        return res;
    }
}
```

### Python 3 Solution
```python
def find_duplicate_xor(arr):
    res = 0
    for val in arr:
        res ^= val
    for i in range(1, len(arr)):
        res ^= i
    return res
```

### Dry Run
Input: `[1, 3, 2, 1]`, $N = 4$.
*   `XOR(arr) = 1 ^ 3 ^ 2 ^ 1`
*   `XOR(1..N-1) = 1 ^ 2 ^ 3`
*   `res = (1 ^ 3 ^ 2 ^ 1) ^ (1 ^ 2 ^ 3) = 1` (cancels out duplicate pairs).

### Shortcut & Math Derivation
*   **XOR Cancellation**:
    Since only one element $D$ repeats, the array values are the numbers $1 \dots N-1$ plus the extra duplicate element $D$.
    $$\text{XOR}(\text{arr}) = (1 \oplus 2 \oplus \dots \oplus N-1) \oplus D$$
    XORing this result with $(1 \oplus 2 \oplus \dots \oplus N-1)$ yields $D$.

### Variation & Trap
*   **Variation**: If values are modified in-place, we can also use Floyd's Cycle Finding algorithm (treating the array indices as pointer nodes) to find the start of the cycle.

---

## 11. EXP-ARR-11: Majority Element (Moore's Voting Algorithm)

*   **Problem Statement**: Find the majority element in an array of size $N$ (the element that appears more than $\lfloor N/2 \rfloor$ times). You may assume that a majority element always exists.
*   **Constraints**:
    *   $1 \le N \le 10^6$, $-10^9 \le arr[i] \le 10^9$
    *   *Sample Input*: `[2, 2, 1, 1, 1, 2, 2]` $\implies$ *Sample Output*: `2`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Frequency Map** | Count frequencies in a hash map, check values $> N/2$. | $O(N)$ | $O(N)$ | Simple but uses extra memory. |
| **Boyer-Moore** | Maintain candidate and count; increment/decrement count. | $O(N)$ | $O(1)$ | Optimal, runs in a single pass with constant space. |

### C++14 Solution
```cpp
#include <vector>

int majorityElement(const std::vector<int>& nums) {
    int candidate = nums[0];
    int count = 0;
    
    for (int num : nums) {
        if (count == 0) {
            candidate = num;
        }
        count += (num == candidate) ? 1 : -1;
    }
    return candidate;
}
```

### Java Solution
```java
public class Solution {
    public static int majorityElement(int[] nums) {
        int candidate = nums[0];
        int count = 0;
        
        for (int num : nums) {
            if (count == 0) {
                candidate = num;
            }
            count += (num == candidate) ? 1 : -1;
        }
        return candidate;
    }
}
```

### Python 3 Solution
```python
def majority_element(nums):
    candidate = nums[0]
    count = 0
    for num in nums:
        if count == 0:
            candidate = num
        count += 1 if num == candidate else -1
    return candidate
```

### Dry Run
Input: `[2, 2, 1, 1, 1, 2, 2]`.

| Iteration | Element | `count` before | Candidate before | Action | `count` after | Candidate after |
| :---: | :---: | :---: | :---: | :--- | :---: | :---: |
| 1 | 2 | 0 | — | `count == 0` $\implies$ candidate = 2 | 1 | 2 |
| 2 | 2 | 1 | 2 | Match $\implies$ count++ | 2 | 2 |
| 3 | 1 | 2 | 2 | Mismatch $\implies$ count-- | 1 | 2 |
| 4 | 1 | 1 | 2 | Mismatch $\implies$ count-- | 0 | 2 |
| 5 | 1 | 0 | 2 | `count == 0` $\implies$ candidate = 1 | 1 | 1 |
| 6 | 2 | 1 | 1 | Mismatch $\implies$ count-- | 0 | 1 |
| 7 | 2 | 0 | 1 | `count == 0` $\implies$ candidate = 2 | 1 | 2 |

Returns candidate `2`.

### Shortcut & Math Derivation
*   **Derivation**: If we pair up different elements, each pair contains at most one majority element. Since the majority element appears more than $N/2$ times, it will always survive these cancellations. Boyer-Moore dynamically performs these pairings in a single linear pass.

### Variation & Trap
*   **Trap**: If the majority element is not guaranteed to exist, a second pass is required to verify that the candidate's frequency is strictly greater than $\lfloor N/2 \rfloor$.

---

## 12. EXP-ARR-12: Trapping Rain Water

*   **Problem Statement**: Given $N$ non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $0 \le arr[i] \le 10^5$
    *   *Sample Input*: `[0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]` $\implies$ *Sample Output*: `6`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Prefix/Suffix Arrays**| Store max values on the left and right in arrays. | $O(N)$ | $O(N)$ | Requires two extra arrays. |
| **Two Pointers** | Keep left/right pointers and track leftMax/rightMax. | $O(N)$ | $O(1)$ | Optimal, avoids extra memory. |

### C++14 Solution
```cpp
#include <vector>
#include <algorithm>

int trap(const std::vector<int>& height) {
    if (height.empty()) return 0;
    int left = 0, right = height.size() - 1;
    int left_max = 0, right_max = 0;
    int trapped_water = 0;
    
    while (left < right) {
        if (height[left] < height[right]) {
            if (height[left] >= left_max) {
                left_max = height[left];
            } else {
                trapped_water += left_max - height[left];
            }
            left++;
        } else {
            if (height[right] >= right_max) {
                right_max = height[right];
            } else {
                trapped_water += right_max - height[right];
            }
            right--;
        }
    }
    return trapped_water;
}
```

### Java Solution
```java
public class Solution {
    public static int trap(int[] height) {
        if (height == null || height.length == 0) return 0;
        int left = 0, right = height.length - 1;
        int leftMax = 0, rightMax = 0;
        int trappedWater = 0;
        
        while (left < right) {
            if (height[left] < height[right]) {
                if (height[left] >= leftMax) {
                    leftMax = height[left];
                } else {
                    trappedWater += leftMax - height[left];
                }
                left++;
            } else {
                if (height[right] >= rightMax) {
                    rightMax = height[right];
                } else {
                    trappedWater += rightMax - height[right];
                }
                right--;
            }
        }
        return trappedWater;
    }
}
```

### Python 3 Solution
```python
def trap(height):
    if not height:
        return 0
    left, right = 0, len(height) - 1
    left_max, right_max = 0, 0
    trapped_water = 0
    
    while left < right:
        if height[left] < height[right]:
            if height[left] >= left_max:
                left_max = height[left]
            else:
                trapped_water += left_max - height[left]
            left += 1
        else:
            if height[right] >= right_max:
                right_max = height[right]
            else:
                trapped_water += right_max - height[right]
            right -= 1
            
    return trapped_water
```

### Dry Run
Input: `height = [3, 0, 2]`.
*   Init: `left = 0 (3)`, `right = 2 (2)`, `left_max = 0`, `right_max = 0`, `trapped = 0`.
*   `height[0] > height[2]` ($3 > 2$) $\implies$ Go to `else` block (right pointer):
    *   $height[2] \ge right\_max$ ($2 \ge 0$) $\implies$ `right_max = 2`.
    *   `right--` $\implies$ `right = 1`.
*   Iteration 2: `left = 0 (3)`, `right = 1 (0)`.
    *   `height[0] > height[1]` ($3 > 0$) $\implies$ Go to `else` block:
    *   $height[1] < right\_max$ ($0 < 2$) $\implies$ `trapped += 2 - 0 = 2`.
    *   `right--` $\implies$ `right = 0`.
*   Loop ends because `left == right`. Trapped water $= 2$.

### Shortcut & Math Derivation
*   **Formula Derivation**: At any index $i$, the height of water trapped is bounded by the minimum of the maximum heights to its left and right:
    $$\text{Water}_i = \max\Big(0, \min\big(\text{MaxLeft}_i, \text{MaxRight}_i\big) - \text{height}[i]\Big)$$
    Using two pointers, we evaluate this condition in-place. If $height[left] < height[right]$, then $left\_max$ is the limiting boundary factor, allowing us to calculate water trapped at `left` without needing to precompute the full `MaxRight` array.

### Variation & Trap
*   **Trap**: Elevational steps at boundary edges (like `[5, 4, 3]`) trap no water because water leaks off the sides. The two-pointer bounds handle this naturally.
