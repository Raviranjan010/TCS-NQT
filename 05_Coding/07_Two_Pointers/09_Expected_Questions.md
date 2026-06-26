# Two Pointers - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Two Pointers.

---

## 1. TP-01: Pair with Given Sum (Sorted Array)

*   **Problem Statement**: Given a sorted array of integers `arr` and a target sum `target`, find if there exists any pair that sums up to `target`.
*   **Constraints**:
    *   $2 \le N \le 10^5$
    *   $-10^9 \le \text{arr}[i], \text{target} \le 10^9$
    *   *Sample Input*: `arr = [1, 2, 4, 7, 11]`, target = `9` $\implies$ *Sample Output*: `true` (pair `[2, 7]`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Nested Loop** | Check all possible pairs. | $O(N^2)$ | $O(1)$ | Simple but too slow. |
| **Optimal Two Pointers** | Set pointers at both ends. Move inward depending on compare of sum with target. | $O(N)$ | $O(1)$ | Optimal, runs in linear time. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

bool hasPairWithSum(const std::vector<int>& arr, int target) {
    int left = 0;
    int right = arr.size() - 1;
    
    while (left < right) {
        int current_sum = arr[left] + arr[right];
        if (current_sum == target) {
            return true;
        } else if (current_sum < target) {
            left++; // Need a larger sum
        } else {
            right--; // Need a smaller sum
        }
    }
    return false;
}
```

### Dry Run Table
Input: `arr = [1, 2, 4, 7, 11]`, target = `9`

| Step | `left` | `right` | `arr[left]` | `arr[right]` | `current_sum` | Action |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| 1 | 0 | 4 | 1 | 11 | 12 | $12 > 9 \implies \text{right}--$ |
| 2 | 0 | 3 | 1 | 7 | 8 | $8 < 9 \implies \text{left}++$ |
| 3 | 1 | 3 | 2 | 7 | 9 | $9 == 9 \implies \text{return true}$ |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass scan where pointers move inward.
*   **Space Complexity**: $O(1)$ — Only two index variables are allocated.

### Shortcut & Math Derivation
*   **Derivation**: Because the array is sorted, the sum is monotonically increasing with `left++` and decreasing with `right--`.
    *   If `arr[left] + arr[right] < target`: Since `arr[right]` is already the largest element in our active range, no other element paired with `arr[left]` can ever reach target. So `left` must be discarded (`left++`).
    *   If `arr[left] + arr[right] > target`: No other element paired with `arr[right]` can be small enough to reduce the sum to target. So `right` must be discarded (`right--`).
*   **Real Number Demo**: With target $9$, pairing $1$ and $11$ gives $12 > 9$. Moving $1$ right will only increase the sum, so we must discard $11$.

### Variation & Trap
*   **Trap**: Attempting this method on unsorted arrays. The monotonicity fails completely. Sort the array first ($O(N \log N)$) or use Hashing ($O(N)$ space).
*   **Variation**: Find the absolute index positions in the original array. Storing index-value pairs before sorting is required.

---

## 2. TP-02: 3-Sum

*   **Problem Statement**: Given an integer array `nums`, return all unique triplets `[nums[i], nums[j], nums[k]]` such that $i \ne j$, $i \ne k$, and $j \ne k$, and `nums[i] + nums[j] + nums[k] == 0`.
*   **Constraints**:
    *   $3 \le \text{nums.size()} \le 3000$
    *   $-10^5 \le \text{nums}[i] \le 10^5$
    *   *Sample Input*: `[-1, 0, 1, 2, -1, -4]` $\implies$ *Sample Output*: `[[-1, -1, 2], [-1, 0, 1]]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | Triple nested loops. | $O(N^3)$ | $O(1)$ | Triggers TLE. |
| **Optimal Sort + Two Pointers** | Sort array, fix element $i$, and use two-pointers for the remaining pair. Skip duplicate values to ensure uniqueness. | $O(N^2)$ | $O(\log N)$ or $O(1)$ | Highly optimized, guarantees no duplicates. |

### Optimal C++14 Solution
```cpp
#include <vector>
#include <algorithm>

std::vector<std::vector<int>> threeSum(std::vector<int>& nums) {
    std::vector<std::vector<int>> result;
    int n = nums.size();
    if (n < 3) return result;
    
    std::sort(nums.begin(), nums.end());
    
    for (int i = 0; i < n - 2; i++) {
        // Skip duplicate values for the first element
        if (i > 0 && nums[i] == nums[i - 1]) continue;
        
        int target = -nums[i];
        int left = i + 1;
        int right = n - 1;
        
        while (left < right) {
            int current_sum = nums[left] + nums[right];
            if (current_sum == target) {
                result.push_back({nums[i], nums[left], nums[right]});
                
                // Skip duplicate values for left and right
                while (left < right && nums[left] == nums[left + 1]) left++;
                while (left < right && nums[right] == nums[right - 1]) right--;
                
                left++;
                right--;
            } else if (current_sum < target) {
                left++;
            } else {
                right--;
            }
        }
    }
    return result;
}
```

### Dry Run Table
Input: Sorted `[-4, -1, -1, 0, 1, 2]`

| Fix $i$ | Target `-nums[i]` | `left` | `right` | `nums[left] + nums[right]` | Action |
| :---: | :---: | :---: | :---: | :---: | :--- |
| 0 (`-4`) | 4 | 1 (`-1`) | 5 (`2`) | $-1 + 2 = 1 < 4$ | `left` becomes 2 |
| | 4 | 2 (`-1`) | 5 (`2`) | $-1 + 2 = 1 < 4$ | `left` becomes 3 ... ends |
| 1 (`-1`) | 1 | 2 (`-1`) | 5 (`2`) | $-1 + 2 = 1 == 1$ | Save `{-1, -1, 2}`, skip duplicate `left/right` |
| | 1 | 3 (`0`) | 4 (`1`) | $0 + 1 = 1 == 1$ | Save `{-1, 0, 1}` |
| 2 (`-1`) | Duplicate | — | — | — | Skip loop iteration |

### Complexity Analysis
*   **Time Complexity**: $O(N^2)$ — Sorting takes $O(N \log N)$. The nested loop does $O(N)$ operations for each of the $N$ steps, giving $O(N^2)$ total.
*   **Space Complexity**: $O(1)$ auxiliary space if sorting is done in-place.

### Shortcut & Math Derivation
*   **Derivation**: The equation is $A + B + C = 0 \implies B + C = -A$.
    Fixing $A$ converts the problem into Two Sum on a sorted subarray with target $-A$. Monotonicity applies exactly, allowing us to find pairs in $O(N)$ time per element $A$.
*   **Real Number Demo**: With current element $A = -2$, target sum for the rest is $2$. If we have elements $0$ and $2$, $0+2 = 2$, triplet is $\{-2, 0, 2\}$.

### Variation & Trap
*   **Trap**: Forgetting to skip duplicate elements. Without the `while` duplicate-skipping loops, identical triplets like `{-1, 0, 1}` will be saved multiple times.
*   **Variation**: 3-Sum Closest. Find triplet whose sum is closest to a target value. Adjust two pointers based on absolute difference.

---

## 3. TP-03: Container with Most Water

*   **Problem Statement**: Given $N$ non-negative integers `height` where each represents a point at coordinate $(i, \text{height}[i])$, find two lines that together with the x-axis form a container, such that the container contains the most water.
*   **Constraints**:
    *   $2 \le N \le 10^5$
    *   $0 \le \text{height}[i] \le 10^4$
    *   *Sample Input*: `[1, 8, 6, 2, 5, 4, 8, 3, 7]` $\implies$ *Sample Output*: `49` (width = 7 between indices 1 and 8, height = min(8, 7) = 7, Area = $7 \times 7 = 49$)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | Calculate area for all possible pairs. | $O(N^2)$ | $O(1)$ | Simple but triggers TLE. |
| **Optimal Two Pointers** | Set pointers at both ends. Move the pointer with the smaller height inward. | $O(N)$ | $O(1)$ | Optimal, runs in linear time. |

### Optimal C++14 Solution
```cpp
#include <vector>
#include <algorithm>

int maxArea(const std::vector<int>& height) {
    int max_water = 0;
    int left = 0;
    int right = height.size() - 1;
    
    while (left < right) {
        int width = right - left;
        int current_height = std::min(height[left], height[right]);
        int current_water = width * current_height;
        
        max_water = std::max(max_water, current_water);
        
        // Move the pointer that points to the shorter line
        if (height[left] < height[right]) {
            left++;
        } else {
            right--;
        }
    }
    return max_water;
}
```

### Dry Run Table
Input: `[1, 8, 6, 2, 5, 4, 8, 3, 7]`

| Step | `left` | `right` | `height[left]` | `height[right]` | `width` | `current_water` | `max_water` | Pointer Action |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| 1 | 0 | 8 | 1 | 7 | 8 | $8 \times 1 = 8$ | 8 | `left++` |
| 2 | 1 | 8 | 8 | 7 | 7 | $7 \times 7 = 49$ | 49 | `right--` |
| 3 | 1 | 7 | 8 | 3 | 6 | $6 \times 3 = 18$ | 49 | `right--` |
| 4 | 1 | 6 | 8 | 8 | 5 | $5 \times 8 = 40$ | 49 | `right--` |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single scan through the array.
*   **Space Complexity**: $O(1)$ — No extra space is allocated.

### Shortcut & Math Derivation
*   **Derivation**: Water capacity is:
    $$\text{Water} = \text{width} \times \min(\text{height}[left], \text{height}[right])$$
    Moving pointers inward always decreases the `width`. To offset the loss of width, we must try to find a larger height. Since the current water limit is bounded by the shorter line, moving the taller line inward cannot possibly increase the area (width decreases, height is still restricted by the shorter line). Therefore, we must discard the shorter line (`left++` or `right--`).
*   **Real Number Demo**: Heights are $3$ (left) and $8$ (right). Area is limited by $3$. Moving $8$ inward decreases width, and the height remains $\le 3$. Thus, area must decrease. So we must move the pointer at $3$ inward.

### Variation & Trap
*   **Trap**: Not understanding why moving the taller line is useless. It guarantees a smaller area because width decreases and the height cannot exceed the original shorter line height.
*   **Variation**: Find peak water capacity when the width decreases exponentially.

---

## 4. TP-04: Sort 0s, 1s, and 2s (Dutch National Flag)

*   **Problem Statement**: Given an array `nums` with $N$ objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red (0), white (1), and blue (2).
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $\text{nums}[i] \in \{0, 1, 2\}$
    *   *Sample Input*: `[2, 0, 2, 1, 1, 0]` $\implies$ *Sample Output*: `0 0 1 1 2 2`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Counting Sort** | Count frequencies of 0, 1, 2 and rewrite array. | $O(N)$ | $O(1)$ | Requires two passes. |
| **Optimal 3-Pointer** | Segment array into three zones using three pointers (`low`, `mid`, `high`). Swap items in a single pass. | $O(N)$ | $O(1)$ | One pass, highly optimal. |

### Optimal C++14 Solution
```cpp
#include <vector>
#include <utility>

void sortColors(std::vector<int>& nums) {
    int low = 0;
    int mid = 0;
    int high = nums.size() - 1;
    
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

### Dry Run Table
Input: `[2, 0, 1]` (`low = 0, mid = 0, high = 2`)

| Step | `mid` val | Action | Low pointer | Mid pointer | High pointer | Array State |
| :---: | :---: | :--- | :---: | :---: | :---: | :--- |
| 1 | 2 | Swap `arr[mid]` & `arr[high]` | 0 | 0 | 1 | `[1, 0, 2]` |
| 2 | 1 | `mid++` | 0 | 1 | 1 | `[1, 0, 2]` |
| 3 | 0 | Swap `arr[low]` & `arr[mid]` | 1 | 2 | 1 | `[0, 1, 2]` |
| Loop Ends | `mid > high` (2 > 1) | | Final Sorted | | | `[0, 1, 2]` |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass through the array.
*   **Space Complexity**: $O(1)$ — Only three pointers used.

### Shortcut & Math Derivation
*   **Derivation**: We maintain the invariant:
    *   $\text{arr}[0 \dots \text{low}-1] = 0$
    *   $\text{arr}[\text{low} \dots \text{mid}-1] = 1$
    *   $\text{arr}[\text{mid} \dots \text{high}] = \text{unprocessed}$
    *   $\text{arr}[\text{high}+1 \dots N-1] = 2$
    Any time we see `0`, we swap it with `nums[low]` and increment `low` and `mid`. Any time we see `2`, we swap it with `nums[high]` and decrement `high` (re-evaluating the swapped value at `mid`).
*   **Real Number Demo**: With `[2, 0, 1]`, swapping `2` to the end places it correctly in the `2`s zone. The new element at `mid` is `1`, which requires another check.

### Variation & Trap
*   **Trap**: Incrementing `mid` after swapping `2`. The element swapped from `high` into `mid` is unprocessed and could be `0` or `2`. We must evaluate it at the next step without incrementing `mid`.
*   **Variation**: Partitioning an array around a pivot into elements less than, equal to, and greater than pivot. Same pointer swapping rules apply.
