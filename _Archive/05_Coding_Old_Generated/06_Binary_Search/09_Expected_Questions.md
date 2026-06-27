# Binary Search - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Binary Search.

---

## 1. BS-01: Search in Rotated Sorted Array

*   **Problem Statement**: Given a sorted array of integers `nums` which is rotated at some pivot unknown to you beforehand, search for a target value. If found, return its index; otherwise, return -1.
*   **Constraints**:
    *   $1 \le \text{nums.size()} \le 10^5$
    *   $-10^9 \le \text{nums}[i] \le 10^9$
    *   All values in `nums` are unique.
    *   *Sample Input*: `nums = [4, 5, 6, 7, 0, 1, 2]`, target = `0` $\implies$ *Sample Output*: `4`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Scan** | Check every element sequentially. | $O(N)$ | $O(1)$ | Easy, but ignores rotation properties. |
| **Modified Binary Search** | Identify which half (left or right) is normally sorted, then check if target lies in that sorted half. | $O(\log N)$ | $O(1)$ | Optimal, meets tight execution targets. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

int searchRotated(const std::vector<int>& nums, int target) {
    int low = 0;
    int high = nums.size() - 1;
    
    while (low <= high) {
        int mid = low + (high - low) / 2;
        
        if (nums[mid] == target) return mid;
        
        // Check if left half is sorted
        if (nums[low] <= nums[mid]) {
            // Target lies in sorted left half
            if (target >= nums[low] && target < nums[mid]) {
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        } 
        // Right half is sorted
        else {
            // Target lies in sorted right half
            if (target > nums[mid] && target <= nums[high]) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
    }
    return -1;
}
```

### Dry Run Table
Input: `nums = [4, 5, 6, 7, 0, 1, 2]`, target = `0`

| Step | `low` | `high` | `mid` | `nums[mid]` | Sorted Half | Check Range | Action |
| :---: | :---: | :---: | :---: | :---: | :--- | :--- | :--- |
| 1 | 0 | 6 | 3 | 7 | Left (`[4..7]`) | $0 \in [4, 7)$ (False) | `low` = 4 |
| 2 | 4 | 6 | 5 | 1 | Right (`[1..2]`) | $0 \in (1, 2]$ (False) | `high` = 4 |
| 3 | 4 | 4 | 4 | 0 | Both | $0 == 0$ (True) | Return index 4 |

### Complexity Analysis
*   **Time Complexity**: $O(\log N)$ — Array size is halved in each step.
*   **Space Complexity**: $O(1)$ — Uses only index pointers.

### Shortcut & Math Derivation
*   **Derivation**: In any rotated sorted array, splitting it at any index `mid` yields at least one half that is fully sorted. By comparing `nums[low]` and `nums[mid]`, we instantly determine if the left half is sorted (`nums[low] <= nums[mid]`). If it is, and target is within bounds of that sorted segment, search left; else, search right.
*   **Real Number Demo**: With `[6, 7, 1, 2, 3]`, splitting at idx 2 gives element `1`. `6 <= 1` is false, indicating the right half `[1, 2, 3]` is sorted. If target is `2`, since $2 \in (1, 3]$, search right half.

### Variation & Trap
*   **Trap**: Not using `<=` in `nums[low] <= nums[mid]`. For arrays of size 1 or 2, `low` and `mid` can be equal, and using `<` causes errors.
*   **Variation**: Search in a rotated sorted array with duplicates (e.g. `[2, 5, 6, 0, 0, 1, 2]`). If `nums[low] == nums[mid] == nums[high]`, we cannot tell which half is sorted; increment `low` and decrement `high` by 1. Worst case becomes $O(N)$.

---

## 2. BS-02: First and Last Occurrence of Element

*   **Problem Statement**: Given a sorted array of integers `nums` and a target value, find the starting and ending position of the target. If target is not found, return `{-1, -1}`.
*   **Constraints**:
    *   $1 \le \text{nums.size()} \le 10^5$
    *   $-10^9 \le \text{nums}[i], \text{target} \le 10^9$
    *   *Sample Input*: `nums = [5, 7, 7, 8, 8, 10]`, target = `8` $\implies$ *Sample Output*: `3 4`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Search** | Scan left-to-right for first and last matches. | $O(N)$ | $O(1)$ | Simple, but fails performance constraints. |
| **Double Binary Search** | Run two separate binary searches: one tracking left-most match, one tracking right-most match. | $O(\log N)$ | $O(1)$ | Optimal, guaranteed $O(\log N)$. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <utility>

int findBound(const std::vector<int>& nums, int target, bool isFirst) {
    int low = 0, high = nums.size() - 1;
    int ans = -1;
    
    while (low <= high) {
        int mid = low + (high - low) / 2;
        if (nums[mid] == target) {
            ans = mid;
            if (isFirst) {
                high = mid - 1; // Look on left side
            } else {
                low = mid + 1;  // Look on right side
            }
        } else if (nums[mid] < target) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return ans;
}

std::pair<int, int> searchRange(const std::vector<int>& nums, int target) {
    int first = findBound(nums, target, true);
    int last = findBound(nums, target, false);
    return {first, last};
}
```

### Dry Run Table (First Occurrence)
Input: `nums = [5, 7, 7, 8, 8, 10]`, target = `8`, `isFirst = true`

| Step | `low` | `high` | `mid` | `nums[mid]` | Action | Record index |
| :---: | :---: | :---: | :---: | :---: | :--- | :---: |
| 1 | 0 | 5 | 2 | 7 | $7 < 8 \implies \text{low} = 3$ | — |
| 2 | 3 | 5 | 4 | 8 | Match! Move `high` left | `ans = 4`, `high = 3` |
| 3 | 3 | 3 | 3 | 8 | Match! Move `high` left | `ans = 3`, `high = 2` |
| Loop Ends | `low = 3`, `high = 2` | | Returns index 3 |

### Complexity Analysis
*   **Time Complexity**: $O(\log N)$ — Two independent binary searches.
*   **Space Complexity**: $O(1)$ — Constant space.

### Shortcut & Math Derivation
*   **Derivation**: When we find target at index `mid`, instead of stopping, we record index `mid` as a potential answer.
    *   To find first occurrence: We force search left by doing `high = mid - 1`.
    *   To find last occurrence: We force search right by doing `low = mid + 1`.
*   **Real Number Demo**: With `[8, 8, 8, 8]`, first search starts at `mid = 1`. We match `8`, record `ans = 1`, and search range `[0, 0]`. Next step finds `8` at index 0, records `ans = 0`, and range becomes `[0, -1]` (ends).

### Variation & Trap
*   **Trap**: Attempting to find first occurrence and then scanning linearly to find the last. If all elements in array are equal to target, linear scan degrades complexity to $O(N)$.
*   **Variation**: Find number of occurrences of target. Count $= \text{last} - \text{first} + 1$ (if first index $\ne -1$).

---

## 3. BS-03: Peak Element

*   **Problem Statement**: An element is a peak if it is strictly greater than its neighbors. Given an integer array `nums` where `nums[i] != nums[i+1]` for all valid $i$, find a peak element and return its index.
*   **Constraints**:
    *   $1 \le \text{nums.size()} \le 10^5$
    *   $-2^{31} \le \text{nums}[i] \le 2^{31} - 1$
    *   Assume $\text{nums}[-1] = \text{nums}[n] = -\infty$.
    *   *Sample Input*: `[1, 2, 3, 1]` $\implies$ *Sample Output*: `2` (value 3 is a peak)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Search** | Look for first element that is larger than next neighbor. | $O(N)$ | $O(1)$ | Simple, but fails constraints. |
| **Binary Search on Slopes** | Move in direction of the rising slope (towards the larger neighbor). | $O(\log N)$ | $O(1)$ | Optimal, guarantees peak identification. |

### Optimal C++14 Solution
```cpp
#include <vector>

int findPeakElement(const std::vector<int>& nums) {
    int low = 0;
    int high = nums.size() - 1;
    
    while (low < high) {
        int mid = low + (high - low) / 2;
        
        // We are on a falling slope, peak is on left (including mid)
        if (nums[mid] > nums[mid + 1]) {
            high = mid;
        } 
        // We are on a rising slope, peak is on right (excluding mid)
        else {
            low = mid + 1;
        }
    }
    return low;
}
```

### Dry Run Table
Input: `[1, 2, 3, 1]`

| Step | `low` | `high` | `mid` | `nums[mid]` | `nums[mid+1]` | Slope Direction | Action |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- | :--- |
| 1 | 0 | 3 | 1 | 2 | 3 | Rising | `low` = 2 |
| 2 | 2 | 3 | 2 | 3 | 1 | Falling | `high` = 2 |
| Loop Ends | `low == high == 2` | | Returns index 2 |

### Complexity Analysis
*   **Time Complexity**: $O(\log N)$ — Standard binary search.
*   **Space Complexity**: $O(1)$ — Constant space.

### Shortcut & Math Derivation
*   **Derivation**: Since `nums[-1] = nums[n] = -inf`, the array must rise at the start and fall at the end. Thus, at any element, if the next element is larger (`nums[mid] < nums[mid+1]`), there must be a peak on the right side of `mid` (rising slope). Conversely, if the next element is smaller, there must be a peak on the left side of `mid` (falling slope).
*   **Real Number Demo**: In `[1, 5, 2]`, `mid = 1` (value 5). Next is `2`. Since $5 > 2$, slope is falling, so we look left, enclosing index 1, which indeed is the peak.

### Variation & Trap
*   **Trap**: Attempting index check `nums[mid-1]` without checking bounds. Comparing with `nums[mid+1]` avoids index out of bounds since `mid < high`.
*   **Variation**: Find a peak in a 2D matrix. Solve in $O(C \log R)$ by binary searching rows and finding maximums in columns.

---

## 4. BS-04: Square Root of an Integer

*   **Problem Statement**: Given a non-negative integer $N$, compute and return the square root of $N$. If $N$ is not a perfect square, return the floor integer of $\sqrt{N}$. Do not use any built-in functions.
*   **Constraints**:
    *   $0 \le N \le 2^{31} - 1$
    *   *Sample Input*: $N = 8$ $\implies$ *Sample Output*: `2` (since $\sqrt{8} = 2.828$, floor value is 2)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Search** | Test numbers $1, 2, \dots$ until $i^2 > N$. | $O(\sqrt{N})$ | $O(1)$ | Slow for values near $2^{31}-1$. |
| **Binary Search on Range** | Search in range `[1, N]`. Test if $mid^2 \le N$. | $O(\log N)$ | $O(1)$ | Optimal, works instantly for large numbers. |

### Optimal C++14 Solution
```cpp
int mySqrt(int x) {
    if (x == 0 || x == 1) return x;
    
    int low = 1;
    int high = x;
    int ans = 0;
    
    while (low <= high) {
        int mid = low + (high - low) / 2;
        
        // Prevent overflow by using division: mid <= x / mid instead of mid * mid <= x
        if (mid <= x / mid) {
            ans = mid; // Potential floor answer
            low = mid + 1; // Try to find a larger value
        } else {
            high = mid - 1; // Value too large, look left
        }
    }
    return ans;
}
```

### Dry Run Table
Input: $x = 8$

| Step | `low` | `high` | `mid` | `x / mid` | Check: `mid <= x / mid` | Action | Record `ans` |
| :---: | :---: | :---: | :---: | :---: | :--- | :--- | :---: |
| 1 | 1 | 8 | 4 | 2 | $4 \le 2$ (False) | `high = 3` | — |
| 2 | 1 | 3 | 2 | 4 | $2 \le 4$ (True) | `low = 3` | `ans = 2` |
| 3 | 3 | 3 | 3 | 2 | $3 \le 2$ (False) | `high = 2` | `ans = 2` |
| Loop Ends | `low = 3, high = 2` | | Returns recorded `ans = 2` |

### Complexity Analysis
*   **Time Complexity**: $O(\log N)$ — Binary search range halved.
*   **Space Complexity**: $O(1)$ — No extra storage.

### Shortcut & Math Derivation
*   **Derivation**: The square root function is monotonic. We want to find the largest integer $Y$ such that:
    $$Y^2 \le N \implies Y \le \frac{N}{Y}$$
    By binary searching in the sorted integer range $[1, N]$, we check if $mid \le N / mid$. If true, $mid$ is a valid candidate for floor square root, and we attempt to find a larger candidate by moving right.
*   **Real Number Demo**: For $N=15$. Try $3 \le 15/3$ (True, record 3, range $[4, 15]$). Try $9 \le 15/9$ (False, range $[4, 8]$). Try $6 \le 15/6$ (False, range $[4, 5]$). Try $4 \le 15/4$ (False, range $[4, 3]$). Ends, returns 3.

### Variation & Trap
*   **Trap**: Writing `mid * mid <= x` which triggers integer overflow for $x$ close to $2^{31}-1$. Always use division `mid <= x / mid`.
*   **Variation**: Find square root with decimal precision. Perform binary search using floats with a precision threshold (e.g. `1e-6`).
