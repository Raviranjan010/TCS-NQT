# Two Pointers Technique - Concept Guide

## 1. One-Line Intuition
> **Two Pointers = use two indices to scan the array from different directions or at different speeds to avoid nested loops.**

---

## 2. ASCII Trace: Two Sum (Sorted Array)
Given a sorted array `[2, 3, 5, 8, 9, 10, 11]` and Target Sum $= 13$.

```text
Initialize Left = 0 (pointing to 2), Right = 6 (pointing to 11).

Step 1:
        Left (idx 0) -> 2
        Right (idx 6) -> 11
        Sum = 2 + 11 = 13
        Action: Target met! Return [0, 6].

Let's trace another target, Target Sum = 17:
Step 1:
        [2, 3, 5, 8, 9, 10, 11]
         L                  R
        Sum = 2 + 11 = 13 < 17. Since array is sorted, increment Left to increase the sum.
        Action: Left++

Step 2:
        [2, 3, 5, 8, 9, 10, 11]
            L               R
        Sum = 3 + 11 = 14 < 17.
        Action: Left++

Step 3:
        [2, 3, 5, 8, 9, 10, 11]
               L            R
        Sum = 5 + 11 = 16 < 17.
        Action: Left++

Step 4:
        [2, 3, 5, 8, 9, 10, 11]
                  L         R
        Sum = 8 + 11 = 19 > 17. Since sum is too large, decrement Right to decrease the sum.
        Action: Right--

Step 5:
        [2, 3, 5, 8, 9, 10, 11]
                  L      R
        Sum = 8 + 10 = 18 > 17.
        Action: Right--

Step 6:
        [2, 3, 5, 8, 9, 10, 11]
                  L   R
        Sum = 8 + 9 = 17.
        Action: Target met! Return [3, 4].
```

---

## 3. Python Templates

### Template A: Opposing Pointers (Two Sum on Sorted Array)
```python
def two_sum_sorted(nums: list[int], target: int) -> tuple[int, int]:
    left_ptr = 0
    right_ptr = len(nums) - 1
    
    while left_ptr < right_ptr:
        current_sum = nums[left_ptr] + nums[right_ptr]
        if current_sum == target:
            return left_ptr, right_ptr
        elif current_sum < target:
            left_ptr += 1  # Need a larger sum
        else:
            right_ptr -= 1  # Need a smaller sum
            
    return -1, -1
```

### Template B: Fast & Slow Pointers (Cycle Detection)
```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def has_cycle(head: ListNode) -> bool:
    slow_ptr = head
    fast_ptr = head
    
    while fast_ptr and fast_ptr.next:
        slow_ptr = slow_ptr.next
        fast_ptr = fast_ptr.next.next  # Moves twice as fast
        
        if slow_ptr == fast_ptr:
            return True  # Fast pointer lapped the slow pointer
            
    return False
```

### Template C: Three Pointers (Dutch National Flag / Sort 0s, 1s, 2s)
```python
def sort_colors(nums: list[int]) -> None:
    low_ptr = 0
    mid_ptr = 0
    high_ptr = len(nums) - 1
    
    while mid_ptr <= high_ptr:
        if nums[mid_ptr] == 0:
            nums[low_ptr], nums[mid_ptr] = nums[mid_ptr], nums[low_ptr]
            low_ptr += 1
            mid_ptr += 1
        elif nums[mid_ptr] == 1:
            mid_ptr += 1
        else:  # nums[mid_ptr] == 2
            nums[mid_ptr], nums[high_ptr] = nums[high_ptr], nums[mid_ptr]
            high_ptr -= 1
```

---

## 4. Recognition Patterns
**Use Two Pointers when you see:**
*   **Sorted Data:** "Given a sorted array...", "After sorting the list..."
*   **Pair/Triplet Queries:** "Find two numbers that add up to...", "Find triplets with zero sum."
*   **In-Place Operations:** "Reverse the array in-place", "Remove duplicates in-place".
*   **Cycle/Middle Detection:** "Find the middle element of the linked list", "Check if there is a cycle."

---

## 5. When Two Pointers Fails vs When it Works

### ❌ When Two Pointers Fails (Counter-Example: Unsorted Array with Negative Elements)
*   **Context:** Find if there is a pair with sum $= 5$ in `nums = [1, -4, 8, 3, -2, 9]`.
*   **Failed Two Pointers Attempt:**
    *   Initialize `left = 0`, `right = 5`. `Sum = 1 + 9 = 10 > 5`.
    *   Decrement `right`? But the array is not sorted! Moving `right` to `-2` makes `Sum = 1 - 2 = -1 < 5`, but moving it to `3` makes it `4`. The search direction has no mathematical monotonicity.
*   **Reason for Failure:** Without sorting, the relative value of `nums[left] + nums[right]` is chaotic. Pointers cannot make logical traversal decisions. Sorting first ($O(N \log N)$) or Hashing ($O(N)$ Space) is required.

### Algorithm Comparison Table:
| Feature | Two Pointers | Naive Nested Loops |
| :--- | :--- | :--- |
| **Monotonic Assumption** | Yes (Requires sorted/logical progression) | No (Compares all pairs) |
| **Time Complexity** | $O(N)$ | $O(N^2)$ |
| **Space Complexity** | $O(1)$ | $O(1)$ |

---

## 6. TCS NQT-Style Problems

### Problem 1: Container with Most Water
**Problem Statement:** Given $N$ non-negative integers $a_1, a_2, \dots, a_n$ representing heights of vertical lines, find two lines that together with the x-axis form a container containing the most water.

#### 1. Brute Force Approach
*   **Concept:** Iterate through all pairs of heights and compute the area. Return the maximum area.
*   **Complexity:** Time: $O(N^2)$, Space: $O(1)$.

#### 2. Two Pointers Optimization
*   **Concept:** Place pointers at the beginning and end. Compute area based on width and the smaller height. To maximize height, move the pointer that points to the shorter line.
*   **C++ & Python Code Solutions:**

```python
# Python: Container with Most Water
def max_area(height: list[int]) -> int:
    left_ptr = 0
    right_ptr = len(height) - 1
    max_water = 0
    
    while left_ptr < right_ptr:
        width = right_ptr - left_ptr
        current_height = min(height[left_ptr], height[right_ptr])
        current_water = width * current_height
        max_water = max(max_water, current_water)
        
        # Move the pointer pointing to the shorter bar
        if height[left_ptr] < height[right_ptr]:
            left_ptr += 1
        else:
            right_ptr -= 1
            
    return max_water
```

```cpp
// C++: Container with Most Water
#include <iostream>
#include <vector>
#include <algorithm>

int maxArea(std::vector<int>& height) {
    int leftPtr = 0;
    int rightPtr = height.size() - 1;
    int maxWater = 0;
    
    while (leftPtr < rightPtr) {
        int width = rightPtr - leftPtr;
        int currentHeight = std::min(height[leftPtr], height[rightPtr]);
        int currentWater = width * currentHeight;
        maxWater = std::max(maxWater, currentWater);
        
        if (height[leftPtr] < height[rightPtr]) {
            leftPtr++;
        } else {
            rightPtr--;
        }
    }
    return maxWater;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N)$ (each element is processed at most once).
    *   **Space Complexity:** $O(1)$ auxiliary space.

---

### Problem 2: 3Sum (Triplets with Sum Zero)
**Problem Statement:** Given an array of integers, find all unique triplets in the array which give the sum of zero.

#### 1. Brute Force Approach
*   **Concept:** Three nested loops to check all triplets $(i, j, k)$ and a set to avoid duplicates.
*   **Complexity:** Time: $O(N^3)$, Space: $O(N)$ for duplicate storage.

#### 2. Two Pointers Optimization
*   **Concept:** Sort the array. Loop through the array, fixing the first element `nums[i]`. Use opposing two pointers on the remaining subarray to find pairs that sum to `-nums[i]`. Skip duplicates during traversal.
*   **C++ & Python Code Solutions:**

```python
# Python: 3Sum
def three_sum(nums: list[int]) -> list[list[int]]:
    nums.sort()
    triplets = []
    
    for i in range(len(nums) - 2):
        # Skip duplicate values for the first element
        if i > 0 and nums[i] == nums[i-1]:
            continue
            
        left_ptr = i + 1
        right_ptr = len(nums) - 1
        target = -nums[i]
        
        while left_ptr < right_ptr:
            current_sum = nums[left_ptr] + nums[right_ptr]
            if current_sum == target:
                triplets.append([nums[i], nums[left_ptr], nums[right_ptr]])
                # Skip duplicate values for left and right pointers
                while left_ptr < right_ptr and nums[left_ptr] == nums[left_ptr + 1]:
                    left_ptr += 1
                while left_ptr < right_ptr and nums[right_ptr] == nums[right_ptr - 1]:
                    right_ptr -= 1
                left_ptr += 1
                right_ptr -= 1
            elif current_sum < target:
                left_ptr += 1
            else:
                right_ptr -= 1
                
    return triplets
```

```cpp
// C++: 3Sum
#include <iostream>
#include <vector>
#include <algorithm>

std::vector<std::vector<int>> threeSum(std::vector<int>& nums) {
    std::sort(nums.begin(), nums.end());
    std::vector<std::vector<int>> triplets;
    int n = nums.size();
    
    for (int i = 0; i < n - 2; ++i) {
        if (i > 0 && nums[i] == nums[i - 1]) continue;
        
        int leftPtr = i + 1;
        int rightPtr = n - 1;
        int target = -nums[i];
        
        while (leftPtr < rightPtr) {
            int currentSum = nums[leftPtr] + nums[rightPtr];
            if (currentSum == target) {
                triplets.push_back({nums[i], nums[leftPtr], nums[rightPtr]});
                while (leftPtr < rightPtr && nums[leftPtr] == nums[leftPtr + 1]) leftPtr++;
                while (leftPtr < rightPtr && nums[rightPtr] == nums[rightPtr - 1]) rightPtr--;
                leftPtr++;
                rightPtr--;
            } else if (currentSum < target) {
                leftPtr++;
            } else {
                rightPtr--;
            }
        }
    }
    return triplets;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N^2)$ (sorting takes $O(N \log N)$, outer loop runs $N$ times, inner two-pointers runs in $O(N)$).
    *   **Space Complexity:** $O(\log N)$ or $O(1)$ auxiliary space (excluding space for sorting call stack and output).
