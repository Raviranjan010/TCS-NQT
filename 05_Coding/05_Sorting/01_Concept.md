# Sorting - Concept Guide

## 1. One-Line Intuition
> **Sorting = arrange elements in a specific order (ascending/descending) to simplify subsequent search, selection, or comparison operations.**

---

## 2. ASCII Trace: Merge Sort Partitioning & Merging
Given array `[4, 1, 3, 2]`.

```text
Step 1: Partition (Divide phase)
                 [4, 1, 3, 2]
                /            \
            [4, 1]          [3, 2]
           /      \        /      \
         [4]      [1]    [3]      [2]   (Leaf nodes / base cases reached)

Step 2: Merge (Conquer phase)
         [4]  +   [1]    [3]  +   [2]
           \      /        \      /
            [1, 4]          [2, 3]
               \              /
                \            /
                 [1, 2, 3, 4]           (Final sorted array)

Merge Subroutine Trace [1, 4] and [2, 3]:
- Left array:  [1, 4], pointer i = 0
- Right array: [2, 3], pointer j = 0
- Merge array: []

- Compare Left[0] (1) with Right[0] (2): 1 < 2 -> Append 1, i++
  Merge state: [1]
- Compare Left[1] (4) with Right[0] (2): 4 >= 2 -> Append 2, j++
  Merge state: [1, 2]
- Compare Left[1] (4) with Right[1] (3): 4 >= 3 -> Append 3, j++
  Merge state: [1, 2, 3]
- Right array is exhausted. Append remaining Left array [4]:
  Merge state: [1, 2, 3, 4]
```

---

## 3. Python Templates

### Template A: Custom Object Sorting (Intervals by End Time)
```python
class Interval:
    def __init__(self, start: int, end: int):
        self.start = start
        self.end = end

def sort_intervals_by_end(intervals: list[Interval]) -> list[Interval]:
    # Sorts in-place using key function
    intervals.sort(key=lambda item: item.end)
    return intervals
```

### Template B: Divide & Conquer Sorting (Merge Sort)
```python
def merge_sort(arr: list[int]) -> list[int]:
    if len(arr) <= 1:
        return arr
        
    mid = len(arr) // 2
    left_sorted = merge_sort(arr[:mid])
    right_sorted = merge_sort(arr[mid:])
    
    # Merge sorted subsegments
    merged = []
    i = j = 0
    while i < len(left_sorted) and j < len(right_sorted):
        if left_sorted[i] <= right_sorted[j]:
            merged.append(left_sorted[i])
            i += 1
        else:
            merged.append(right_sorted[j])
            j += 1
            
    merged.extend(left_sorted[i:])
    merged.extend(right_sorted[j:])
    return merged
```

### Template C: Linear Time Counting Sort (For bounded integers)
```python
def counting_sort(arr: list[int]) -> list[int]:
    if not arr:
        return arr
        
    min_val, max_val = min(arr), max(arr)
    value_range = max_val - min_val + 1
    
    # Initialize count array
    count_array = [0] * value_range
    for num in arr:
        count_array[num - min_val] += 1
        
    # Reconstruct sorted array
    sorted_idx = 0
    for offset_val in range(value_range):
        while count_array[offset_val] > 0:
            arr[sorted_idx] = offset_val + min_val
            sorted_idx += 1
            count_array[offset_val] -= 1
            
    return arr
```

---

## 4. Recognition Patterns
**Use Sorting when you see:**
*   **Rank/Position queries:** "Find the median...", "Find the Kth largest element...", "Find the top 3 items."
*   **Interval Merging/Scheduling:** "Merge overlapping time blocks", "Find minimum meeting rooms required."
*   **Proximity problems:** "Find the pair of points closest to each other", "Group similar strings."
*   **Optimizing Subroutine:** Sorting to prepare data for $O(\log N)$ Binary Search or $O(N)$ Two Pointers.

---

## 5. When Sorting Fails vs When it Works

### ❌ When Sorting is Inefficient (Counter-Example: Small Selection Targets)
*   **Context:** Find the single largest element in an unsorted array of size $10^7$.
*   **Why Sorting Fails/Is Slow:**
    *   Sorting the entire array takes $O(N \log N) \approx 2.3 \times 10^8$ operations.
    *   But wait! We only need the *single* largest element. A simple linear scan takes only $O(N) \approx 10^7$ operations.
*   **Reason for Failure:** Sorting solves a much harder problem (arranging all elements) than what is requested (finding a single extreme value).
*   **Correct Alternative:** Use a linear scan ($O(N)$) or a Max-Heap / QuickSelect ($O(N)$ average time) if selecting the $K$th element.

### Algorithm Comparison Table:
| Sorting Algorithm | Best Case Time | Worst Case Time | Space Complexity | Stability |
| :--- | :--- | :--- | :--- | :--- |
| **Bubble Sort** | $O(N)$ | $O(N^2)$ | $O(1)$ | Stable |
| **Merge Sort** | $O(N \log N)$ | $O(N \log N)$ | $O(N)$ | Stable |
| **Quick Sort** | $O(N \log N)$ | $O(N^2)$ | $O(\log N)$ | Unstable |
| **Counting Sort** | $O(N + K)$ | $O(N + K)$ | $O(N + K)$ | Stable |

---

## 6. TCS NQT-Style Problems

### Problem 1: Merge Overlapping Intervals
**Problem Statement:** Given an array of intervals where `intervals[i] = [start_i, end_i]`, merge all overlapping intervals, and return an array of the non-overlapping intervals.

#### 1. Brute Force Approach
*   **Concept:** For each interval, compare it with all other intervals to check for overlaps. If overlapping, merge them. Repeat this process until no more merges are possible.
*   **Complexity:** Time: $O(N^2)$, Space: $O(N)$ for output.

#### 2. Sorting-Based Optimization
*   **Concept:** Sort the intervals by their start times first. This guarantees that any overlapping intervals are adjacent to each other. We iterate through the sorted intervals, merging them in a single pass.
*   **C++ & Python Code Solutions:**

```python
# Python: Merge Intervals
def merge_intervals(intervals: list[list[int]]) -> list[list[int]]:
    if not intervals:
        return []
        
    # Step 1: Sort by start times
    intervals.sort(key=lambda x: x[0])
    
    merged = [intervals[0]]
    
    for i in range(1, len(intervals)):
        current_start, current_end = intervals[i]
        last_added_start, last_added_end = merged[-1]
        
        # If overlap exists, merge
        if current_start <= last_added_end:
            merged[-1][1] = max(last_added_end, current_end)
        else:
            merged.append(intervals[i])
            
    return merged
```

```cpp
// C++: Merge Intervals
#include <iostream>
#include <vector>
#include <algorithm>

std::vector<std::vector<int>> mergeIntervals(std::vector<std::vector<int>>& intervals) {
    if (intervals.empty()) return {};
    
    // Sort intervals by start time
    std::sort(intervals.begin(), intervals.end(), [](const std::vector<int>& a, const std::vector<int>& b) {
        return a[0] < b[0];
    });
    
    std::vector<std::vector<int>> merged;
    merged.push_back(intervals[0]);
    
    for (int i = 1; i < intervals.size(); ++i) {
        if (intervals[i][0] <= merged.back()[1]) {
            merged.back()[1] = std::max(merged.back()[1], intervals[i][1]);
        } else {
            merged.push_back(intervals[i]);
        }
    }
    return merged;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N \log N)$ due to sorting. The linear scan takes $O(N)$ time.
    *   **Space Complexity:** $O(\log N)$ or $O(1)$ auxiliary space for sorting.

---

### Problem 2: Sort elements by Frequency
**Problem Statement:** Given an array of integers, sort the array according to frequency of elements. If frequencies of two elements are same, then sort by element value in ascending order.

#### 1. Brute Force Approach
*   **Concept:** For each element, count its frequency using nested loops. Create a custom structure of element-frequency pairs and sort using a bubble-sort-like comparator.
*   **Complexity:** Time: $O(N^2)$, Space: $O(N)$.

#### 2. Hashing + Custom Comparator Sorting
*   **Concept:** Use a Hash Map to record occurrences. Retrieve unique keys and sort them using a custom comparator that evaluates frequency first (descending) and value second (ascending). Reconstruct the final list.
*   **C++ & Python Code Solutions:**

```python
# Python: Sort by Frequency
from collections import Counter

def sort_by_frequency(arr: list[int]) -> list[int]:
    # Pass 1: Build frequency map
    frequency_counts = Counter(arr)
    
    # Custom sort: frequency descending (negative sign), then value ascending
    arr.sort(key=lambda num: (-frequency_counts[num], num))
    return arr
```

```cpp
// C++: Sort by Frequency
#include <iostream>
#include <vector>
#include <unordered_map>
#include <algorithm>

std::vector<int> sortByFrequency(std::vector<int>& arr) {
    std::unordered_map<int, int> frequencyMap;
    for (int num : arr) {
        frequencyMap[num]++;
    }
    
    // Sort array elements with custom lambda comparator
    std::sort(arr.begin(), arr.end(), [&](int a, int b) {
        if (frequencyMap[a] != frequencyMap[b]) {
            return frequencyMap[a] > frequencyMap[b]; // Descending frequency
        }
        return a < b; // Ascending value
    });
    return arr;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N \log N)$ (building map is $O(N)$, sorting $N$ elements takes $O(N \log N)$).
    *   **Space Complexity:** $O(N)$ to store frequencies in Hash Map.
