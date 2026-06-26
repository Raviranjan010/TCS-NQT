# TCS NQT 2025 Pattern: Coding Mock Test 1

This mock test contains 2 coding problems matching the TCS NQT 2025 Prime section difficulty.

*   **Total Problems:** 2
*   **Total Time Allowed:** 45 minutes
*   **Target Score:** 100/100 (Full marks required for Prime/9 LPA cut-off)

---

## 💻 Mock Test Problems

### Q1. Minimum Refueling Stops
**Question:** A car starts from position 0 with `initial_fuel` liters. The target destination is `D` miles away. There are gas stations located along the road, each represented as `[station_position, fuel_available]`. Find the minimum number of refueling stops required to reach the destination. If it is impossible to reach the destination, return -1.

*   *Sample Case:* `target = 100`, `initial_fuel = 10`, `stations = [[10, 60], [20, 30], [30, 30], [60, 40]]`
*   *Options:*
    *   A) 1
    *   B) 2
    *   C) 3
    *   D) 4

*   **Answer:** B
*   **Solution:**
    1.  Maintain a max-heap of fuel capacities of all gas stations we have passed.
    2.  As we drive, deduct fuel proportional to distance.
    3.  If current fuel becomes negative before reaching the next station, pop the largest fuel station from our heap (refuel) and add it to our fuel capacity.
    4.  Repeat until current fuel is non-negative. If heap is empty and fuel is still negative, return -1.
*   **Time target:** 1200 seconds (20 minutes)
*   **Difficulty:** Medium
*   **Topic:** Greedy / Heap

---

### Q2. Longest Subarray with at most K Unique Elements
**Question:** Given an array of integers `nums` and an integer `K`, find the length of the longest contiguous subarray that contains at most `K` unique integers.

*   *Sample Case:* `nums = [1, 2, 1, 2, 3]`, `K = 2`
*   *Options:*
    *   A) 2
    *   B) 3
    *   C) 4
    *   D) 5

*   **Answer:** C
*   **Solution:**
    1.  Use a sliding window with two pointers (`left` and `right`) and a hash map to count occurrences.
    2.  Expand the window by moving `right` and adding `nums[right]` to the hash map.
    3.  If the number of unique elements (size of the hash map) exceeds `K`, shrink the window by moving `left` and decrementing count of `nums[left]` until unique count is $\le K$.
    4.  Calculate maximum length at each step: `max_len = max(max_len, right - left + 1)`.
*   **Time target:** 1500 seconds (25 minutes)
*   **Difficulty:** Hard
*   **Topic:** Sliding Window / Hash Map

---

## 📊 Answer Key Summary

| Question | Answer | Topic | Difficulty | Target Time |
| :--- | :--- | :--- | :--- | :--- |
| **Q1** | B | Greedy / Heap | Medium | 20 minutes |
| **Q2** | C | Sliding Window | Hard | 25 minutes |

---

## 📈 Topic-wise Question Count

*   **Greedy & Heaps:** 1 Question
*   **Sliding Window & Hash Maps:** 1 Question

---

## ⏳ Time Management Tips for this Section

1.  **Divide the 45 minutes strictly:** Spend 20 minutes on Q1 (Medium) and 25 minutes on Q2 (Hard).
2.  **Read and write templates in the first 2 minutes:** Include your libraries, header settings, and fast I/O setup immediately.
3.  **Use the 90-Second rule for manual dry runs:** If your code fails sample cases, manually trace it with a 3-element array on paper for 90 seconds instead of randomly modifying boundary markers.

---

## 🚨 5 Most Important Things to Remember

1.  **Fast I/O is crucial:** Include `cin.tie(NULL)` or equivalent in Python/Java to avoid execution timeout on large NQT test cases.
2.  **Check constraint ranges:** If $N \ge 10^5$, any $O(N^2)$ brute force will lead to a Time Limit Exceeded (TLE) result. You must write an $O(N)$ or $O(N \log N)$ solution.
3.  **Handle array empty/boundary cases:** Always check edge cases where $N = 1$ or $K = 0$.
4.  **Watch memory limits:** Do not create large 2D auxiliary matrices unless explicitly necessary.
5.  **Submit early if correct:** TCS NQT monitors code submission times and compiler run frequencies as part of tie-breaking scores.
