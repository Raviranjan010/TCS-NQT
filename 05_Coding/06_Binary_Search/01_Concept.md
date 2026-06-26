# Concept Guide: Binary Search

This file explains the foundational mechanics of Binary Search, covering key coding templates in Python, visualizations, common mistakes, and NQT-style problems.

---

## ⚓ 1. What it is & When to use it (Intuition)

*   **Definition:** Binary Search is a divide-and-conquer algorithm that finds the position of a target value within a sorted search space.
*   **Mechanics:** It works by comparing the target to the middle element and discarding the half of the search space where the target cannot exist.
*   **When to use:** Use it whenever the search space is sorted (monotonic) or when a clear condition allows you to discard half the search space at each step.

---

## 🖼️ 2. ASCII Visualization

Let's search for the target value **`7`** in the sorted array: `[1, 3, 4, 6, 7, 8, 10, 13, 14]`

### Step 1: Initial Setup
```
[ 1,  3,  4,  6,  7,  8,  10,  13,  14 ]
  ^               ^                  ^
left             mid                right
(idx 0)         (idx 4)            (idx 8)
Value: 1        Value: 7           Value: 14
```
*   `mid = 0 + (8 - 0) // 2 = 4`
*   `arr[4] = 7`
*   **Target found at index 4!** (Completed in 1 step).

*If target was `10` instead:*
```
Target (10) > mid (7) -> Discard left half, move left to mid + 1:
[ 1, 3, 4, 6, 7 ] | [ 8,  10,  13,  14 ]
                      ^    ^          ^
                    left  mid       right
                   (idx 5) (idx 6)  (idx 8)
* mid = 5 + (8 - 5) // 2 = 6
* arr[6] = 10 -> Target found!
```

---

## ⚙️ 3. Python Templates

### A. Basic Binary Search
```python
def binary_search(array: list[int], target_value: int) -> int:
    left_index = 0
    right_index = len(array) - 1
    
    while left_index <= right_index:
        # Prevents integer overflow in languages like C++/Java
        midpoint = left_index + (right_index - left_index) // 2
        
        if array[midpoint] == target_value:
            return midpoint
        elif array[midpoint] < target_value:
            left_index = midpoint + 1
        else:
            right_index = midpoint - 1
            
    return -1  # Target not found
```

### B. Search Insert Position
```python
def search_insert_position(array: list[int], target_value: int) -> int:
    left_index = 0
    right_index = len(array) - 1
    
    while left_index <= right_index:
        midpoint = left_index + (right_index - left_index) // 2
        
        if array[midpoint] == target_value:
            return midpoint
        elif array[midpoint] < target_value:
            left_index = midpoint + 1
        else:
            right_index = midpoint - 1
            
    return left_index  # Position where it should be inserted
```

### C. Search in Rotated Sorted Array
```python
def search_rotated_array(array: list[int], target_value: int) -> int:
    left_index = 0
    right_index = len(array) - 1
    
    while left_index <= right_index:
        midpoint = left_index + (right_index - left_index) // 2
        
        if array[midpoint] == target_value:
            return midpoint
            
        # Check if the left half is normally sorted
        if array[left_index] <= array[midpoint]:
            if array[left_index] <= target_value < array[midpoint]:
                right_index = midpoint - 1
            else:
                left_index = midpoint + 1
        # Otherwise, the right half must be normally sorted
        else:
            if array[midpoint] < target_value <= array[right_index]:
                left_index = midpoint + 1
            else:
                right_index = midpoint - 1
                
    return -1
```

---

## 🎯 4. Pattern Recognition

Use Binary Search when the question involves:
*   An explicitly **sorted array** or list of elements.
*   Finding the **first or last occurrence** of a target element.
*   **Optimization on a Range (Binary Search on Answer):** Keywords like *"minimize the maximum"* or *"maximize the minimum"* values (e.g., book allocation, aggressive cows).

---

## ⚠️ 5. Common Mistakes & Fixes

*   **Mistake 1: Midpoint Integer Overflow**
    *   *Bug:* `midpoint = (left_index + right_index) // 2`
    *   *Fix:* `midpoint = left_index + (right_index - left_index) // 2`
*   **Mistake 2: Infinite Loop due to Pointer Updates**
    *   *Bug:* `left_index = midpoint` or `right_index = midpoint`
    *   *Fix:* `left_index = midpoint + 1` and `right_index = midpoint - 1` to ensure the search space always shrinks.
*   **Mistake 3: Boundary Loop Check**
    *   *Bug:* `while left_index < right_index:` (misses the case when the array has only 1 element left)
    *   *Fix:* `while left_index <= right_index:`

---

## ✏️ TCS NQT Solved Questions

### Problem 1: Find Peak Element
*   **Question:** An array is in mountain shape (strictly increases then strictly decreases). Find the index of the peak element.
*   **Brute Force:** Linear scan $O(N)$ checking `arr[i] > arr[i+1]`.
*   **Optimal Transition:** Use binary search. Compare `mid` with `mid + 1`. If `arr[mid] < arr[mid+1]`, the peak lies to the right, so search `mid + 1` to `right`. Otherwise, search `left` to `mid`.
*   **Implementation:**
```python
def find_peak_element(arr: list[int]) -> int:
    left, right = 0, len(arr) - 1
    while left < right:
        mid = left + (right - left) // 2
        if arr[mid] < arr[mid + 1]:
            left = mid + 1
        else:
            right = mid
    return left
```
*   **Complexity:** Time: $O(\log N)$, Space: $O(1)$.

### Problem 2: Allocate Books (Advanced Section)
*   **Question:** Given $N$ books with pages and $M$ students. Allocate books such that the maximum pages assigned to a student is minimized. The books must be allocated in continuous order.
*   **Brute Force:** Exponential combinations of dividers $O(2^N)$ or high-degree recursion.
*   **Optimal Transition:** Binary search on the answer range. The minimum possible answer is `max(pages)` and the maximum possible answer is `sum(pages)`. For a guess `mid`, check if it's feasible to allocate books within $M$ students. Adjust the range accordingly.
*   **Implementation:**
```python
def is_feasible(pages: list[int], max_pages: int, students: int) -> bool:
    allocated_students = 1
    current_pages = 0
    for p in pages:
        if current_pages + p > max_pages:
            allocated_students += 1
            current_pages = p
            if allocated_students > students:
                return False
        else:
            current_pages += p
    return True

def allocate_books(pages: list[int], students: int) -> int:
    if len(pages) < students: return -1
    left = max(pages)
    right = sum(pages)
    ans = -1
    while left <= right:
        mid = left + (right - left) // 2
        if is_feasible(pages, mid, students):
            ans = mid
            right = mid - 1
        else:
            left = mid + 1
    return ans
```
*   **Complexity:** Time: $O(N \log(\text{sum} - \text{max}))$, Space: $O(1)$.
