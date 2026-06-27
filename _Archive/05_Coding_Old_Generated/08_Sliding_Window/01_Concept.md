# Sliding Window Technique - Concept Guide

## 1. One-Line Intuition
> **Sliding Window = maintain a contiguous subsegment of an array/string as it expands or shrinks to avoid recomputing overlaps.**

---

## 2. ASCII Trace: Max Sum Subarray of Size K
Given array `[2, 1, 5, 1, 3, 2]` and $K = 3$.

```text
Step 1: Compute sum of first window from index 0 to 2.
        [2, 1, 5, 1, 3, 2]
        |_______|
        Window sum = 2 + 1 + 5 = 8.
        Max sum = 8.

Step 2: Slide window right (add next element index 3, subtract outgoing element index 0).
        [2, 1, 5, 1, 3, 2]
           |_______|
        Window sum = 8 - 2 + 1 = 7.
        Max sum = max(8, 7) = 8.

Step 3: Slide window right.
        [2, 1, 5, 1, 3, 2]
              |_______|
        Window sum = 7 - 1 + 3 = 9.
        Max sum = max(8, 9) = 9.

Step 4: Slide window right.
        [2, 1, 5, 1, 3, 2]
                 |_______|
        Window sum = 9 - 5 + 2 = 6.
        Max sum = max(9, 6) = 9.

Final Result: Max sum of subarray of size 3 is 9.
```

---

## 3. C++14 Templates

### Template A: Fixed-Size Window (Size K)
```cpp
#include <vector>
#include <numeric>
#include <algorithm>

int maxSumSubarrayFixed(const std::vector<int>& nums, int k) {
    if (nums.size() < k) return 0;
    
    // Calculate sum of initial window
    int current_window_sum = 0;
    for (int i = 0; i < k; i++) {
        current_window_sum += nums[i];
    }
    int max_sum = current_window_sum;
    
    // Slide the window across the array
    for (int right_ptr = k; right_ptr < nums.size(); right_ptr++) {
        // Add the incoming element and subtract the outgoing element
        current_window_sum += nums[right_ptr] - nums[right_ptr - k];
        max_sum = std::max(max_sum, current_window_sum);
    }
    return max_sum;
}
```

### Template B: Variable-Size Window (Longest Window / Expansion)
```cpp
#include <string>
#include <unordered_map>
#include <algorithm>

int longestSubstringNoRepeats(const std::string& s) {
    std::unordered_map<char, int> char_indices;
    int left_ptr = 0;
    int max_length = 0;
    
    for (int right_ptr = 0; right_ptr < s.length(); right_ptr++) {
        char incoming_char = s[right_ptr];
        
        // If character is already in window, contract the window
        if (char_indices.count(incoming_char) && char_indices[incoming_char] >= left_ptr) {
            left_ptr = char_indices[incoming_char] + 1;
        }
        
        char_indices[incoming_char] = right_ptr;
        // Calculate current window length
        max_length = std::max(max_length, right_ptr - left_ptr + 1);
    }
    return max_length;
}
```

### Template C: Variable-Size Window (Shortest Window / Shrinking)
```cpp
#include <vector>
#include <algorithm>

int minSubarrayLen(int target, const std::vector<int>& nums) {
    int left_ptr = 0;
    int current_window_sum = 0;
    int min_length = 1e9; // representing infinity
    
    for (int right_ptr = 0; right_ptr < nums.size(); right_ptr++) {
        current_window_sum += nums[right_ptr];
        
        // Shrink the window from the left as long as the condition is met
        while (current_window_sum >= target) {
            min_length = std::min(min_length, right_ptr - left_ptr + 1);
            current_window_sum -= nums[left_ptr];
            left_ptr++;
        }
    }
    return min_length == 1e9 ? 0 : min_length;
}
```


---

## 4. Recognition Patterns
**Use Sliding Window when you see:**
*   **Contiguity Requirement:** "contiguous subarray", "continuous substring".
*   **Dimensional Constraint:** "subarrays of size K", "window of length L".
*   **Optimizing Bounds:** "longest subarray satisfying a condition", "minimum length substring containing all target characters".
*   **Linear Computations:** Running sums, running frequencies, or running sets on elements within contiguous segments.

---

## 5. When Sliding Window Fails vs When it Works

### ❌ When Sliding Window Fails (Counter-Example: Negative Numbers)
*   **Context:** Find the shortest subarray that sums to at least $6$ in `nums = [2, -1, 2, 4, 3]`.
*   **Why Naive Sliding Window Fails:**
    *   Expand `right` to check sum: `[2]` (sum 2), `[2, -1]` (sum 1), `[2, -1, 2]` (sum 3), `[2, -1, 2, 4]` (sum 7 $\ge 6$).
    *   Since target sum is reached, shrink `left` by discarding `2`: `[-1, 2, 4]` (sum 5 $< 6$). Stop shrinking.
    *   But wait! What if there are negative numbers like `[-1, 2, 4, 3]`? Expanding or shrinking does not have monotonic behavior. A sum can decrease upon expansion, meaning we cannot guarantee that shrinking the left boundary is safe.
*   **Reason for Failure:** Monotonicity is broken. Adding an element doesn't always increase the sum (due to negative numbers), and removing an element doesn't always decrease the sum.
*   **Correct Alternative:** Prefix sums combined with a Monotonic Queue (sliding window minimum) or dynamic programming.

### Algorithm Comparison Table:
| Feature | Sliding Window | Naive Recalculation |
| :--- | :--- | :--- |
| **Overlapping State Reuse** | Yes ($O(1)$ updates per step) | No (Recalculates from scratch) |
| **Time Complexity** | $O(N)$ | $O(N^2)$ |
| **Monotonicity Required** | Yes (elements must be non-negative/monotonic) | No |

---

## 6. TCS NQT-Style Problems

### Problem 1: Max Consecutive Ones III (Longest Subarray with at most K zeros)
**Problem Statement:** Given a binary array `nums` and an integer `k`, return the maximum number of consecutive `1`s in the array if you can flip at most `k` `0`s.

#### 1. Brute Force Approach
*   **Concept:** Generate all subarrays. For each subarray, count the number of `0`s. If the count of `0`s is $\le K$, calculate the length. Find the maximum length.
*   **Complexity:** Time: $O(N^2)$, Space: $O(1)$.

#### 2. Sliding Window Optimization
*   **Concept:** Maintain a window `[left, right]` with at most `k` zeros. Expand the window by moving `right`. If the number of zeros in the window exceeds `k`, shrink the window from the `left` until the zero count is back to $\le k$.
*   **C++ & Python Code Solutions:**

```python
# Python: Max Consecutive Ones III
def longest_ones(nums: list[int], k: int) -> int:
    left_ptr = 0
    zero_count = 0
    max_consecutive = 0
    
    for right_ptr in range(len(nums)):
        if nums[right_ptr] == 0:
            zero_count += 1
            
        # Shrink window if zero budget exceeded
        while zero_count > k:
            if nums[left_ptr] == 0:
                zero_count -= 1
            left_ptr += 1
            
        max_consecutive = max(max_consecutive, right_ptr - left_ptr + 1)
        
    return max_consecutive
```

```cpp
// C++: Max Consecutive Ones III
#include <iostream>
#include <vector>
#include <algorithm>

int longestOnes(std::vector<int>& nums, int k) {
    int leftPtr = 0;
    int zeroCount = 0;
    int maxConsecutive = 0;
    int n = nums.size();
    
    for (int rightPtr = 0; rightPtr < n; ++rightPtr) {
        if (nums[rightPtr] == 0) {
            zeroCount++;
        }
        
        while (zeroCount > k) {
            if (nums[leftPtr] == 0) {
                zeroCount--;
            }
            leftPtr++;
        }
        maxConsecutive = std::max(maxConsecutive, rightPtr - leftPtr + 1);
    }
    return maxConsecutive;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N)$ (both pointers scan the array once).
    *   **Space Complexity:** $O(1)$ auxiliary space.

---

### Problem 2: Smallest Subarray with Sum Greater than X
**Problem Statement:** Given an array of positive integers and a number $X$, find the minimum length of a contiguous subarray whose sum is strictly greater than $X$.

#### 1. Brute Force Approach
*   **Concept:** Check every possible subarray sum using nested loops and track the minimum length that exceeds $X$.
*   **Complexity:** Time: $O(N^2)$, Space: $O(1)$.

#### 2. Sliding Window Optimization
*   **Concept:** Since all elements are positive, the window sum is monotonic. Expand `right` until sum $> X$, then continuously shrink `left` to minimize length while maintaining sum $> X$.
*   **C++ & Python Code Solutions:**

```python
# Python: Smallest Subarray with Sum Greater than X
def smallest_subarray_with_sum(nums: list[int], x: int) -> int:
    left_ptr = 0
    current_sum = 0
    min_length = float('inf')
    
    for right_ptr in range(len(nums)):
        current_sum += nums[right_ptr]
        
        # Shrink the window as much as possible while maintaining condition
        while current_sum > x:
            min_length = min(min_length, right_ptr - left_ptr + 1)
            current_sum -= nums[left_ptr]
            left_ptr += 1
            
    return min_length if min_length != float('inf') else 0
```

```cpp
// C++: Smallest Subarray with Sum Greater than X
#include <iostream>
#include <vector>
#include <algorithm>

int smallestSubarrayWithSum(std::vector<int>& nums, int x) {
    int leftPtr = 0;
    int currentSum = 0;
    int minLength = nums.size() + 1; // Sentinel value
    int n = nums.size();
    
    for (int rightPtr = 0; rightPtr < n; ++rightPtr) {
        currentSum += nums[rightPtr];
        
        while (currentSum > x) {
            minLength = std::min(minLength, rightPtr - leftPtr + 1);
            currentSum -= nums[leftPtr];
            leftPtr++;
        }
    }
    return (minLength == n + 1) ? 0 : minLength;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N)$ (linear scanning with left/right pointers).
    *   **Space Complexity:** $O(1)$ auxiliary space.
