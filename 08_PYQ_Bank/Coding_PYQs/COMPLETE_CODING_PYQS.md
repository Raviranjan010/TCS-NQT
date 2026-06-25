# COMPLETE_CODING_PYQS: 20 NQT Practice Problems

This file contains 20 coding problems (10 Easy, 10 Medium) in C++14 with brute force descriptions, optimal implementations, dry runs, and complexity analyses.

---

## 📌 Problems Directory

### Easy-Level Problems (35-Minute Tier)
- [Problem 1: Second Largest Element](#problem-1-second-largest-element)
- [Problem 2: Reverse Array in Place](#problem-2-reverse-array-in-place)
- [Problem 3: Remove Duplicates from Sorted Array](#problem-3-remove-duplicates-from-sorted-array)
- [Problem 4: Find the Missing Number](#problem-4-find-the-missing-number)
- [Problem 5: Count Occurrences](#problem-5-count-occurrences)
- [Problem 6: Check if Sorted](#problem-6-check-if-sorted)
- [Problem 7: Find Peak Element](#problem-7-find-peak-element)
- [Problem 8: Move Zeroes to End](#problem-8-move-zeroes-to-end)
- [Problem 9: Sum Except Self Naive](#problem-9-sum-except-self-naive)
- [Problem 10: Sorted Pair Target Sum](#problem-10-sorted-pair-target-sum)

### Medium-Level Problems (55-Minute Tier)
- [Problem 11: Two Sum (Hash Map)](#problem-11-two-sum-hash-map)
- [Problem 12: Max Subarray Sum (Kadane's)](#problem-12-max-subarray-sum-kadanes)
- [Problem 13: Equilibrium Index](#problem-13-equilibrium-index)
- [Problem 14: Rotate Array by K Steps](#problem-14-rotate-array-by-k-steps)
- [Problem 15: Sort 012 (Dutch National Flag)](#problem-15-sort-012-dutch-national-flag)
- [Problem 16: Container With Most Water](#problem-16-container-with-most-water)
- [Problem 17: Longest Subarray with Sum K](#problem-17-longest-subarray-with-sum-k)
- [Problem 18: Product except Self](#problem-18-product-except-self)
- [Problem 19: First Missing Positive](#problem-19-first-missing-positive)
- [Problem 20: Trapping Rain Water](#problem-20-trapping-rain-water)

---

## Easy-Level Problems (35-Minute Tier)

### Problem 1: Second Largest Element
- **Problem Statement**: Find the second largest distinct element in an array of size $N$. Return $-1$ if it doesn't exist.
- **Constraints**: $2 \le N \le 10^5$, $-10^9 \le \text{arr}[i] \le 10^9$.
- **Example**: Input: `[12, 35, 1, 10, 34, 1]`, Output: `34`.
- **Brute Force**: Sort the array in descending order and scan for the first element smaller than the largest. Time: $O(N \log N)$, Space: $O(1)$.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <algorithm>
  
  int getSecondLargest(const std::vector<int>& arr) {
      if (arr.size() < 2) return -1;
      int largest = -1e9;
      int second_largest = -1e9;
      for (int x : arr) {
          if (x > largest) {
              second_largest = largest;
              largest = x;
          } else if (x > second_largest && x != largest) {
              second_largest = x;
          }
      }
      return (second_largest == -1e9) ? -1 : second_largest;
  }
  ```
- **Dry Run Table**: Input `[10, 10, 5]`
  | Step | Element | Largest | Second Largest |
  | :--- | :--- | :--- | :--- |
  | Init | - | -1e9 | -1e9 |
  | 1 | 10 | 10 | -1e9 |
  | 2 | 10 | 10 | -1e9 |
  | 3 | 5 | 10 | 5 |
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 2: Reverse Array in Place
- **Problem Statement**: Reverse the elements of an array without using auxiliary space.
- **Constraints**: $1 \le N \le 10^5$, $-10^9 \le \text{arr}[i] \le 10^9$.
- **Example**: Input: `[1, 2, 3, 4]`, Output: `[4, 3, 2, 1]`.
- **Brute Force**: Copy elements to another array in reverse order, then copy back. Time: $O(N)$, Space: $O(N)$.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <utility>
  
  void reverseArray(std::vector<int>& arr) {
      int left = 0, right = arr.size() - 1;
      while (left < right) {
          std::swap(arr[left], arr[right]);
          left++;
          right--;
      }
  }
  ```
- **Dry Run Table**: Input `[1, 2, 3, 4]`
  | Step | Left Index | Right Index | Swapped Elements | Array State |
  | :--- | :--- | :--- | :--- | :--- |
  | Init | 0 | 3 | - | `[1, 2, 3, 4]` |
  | 1 | 1 | 2 | `1 <-> 4` | `[4, 2, 3, 1]` |
  | 2 | 2 | 1 | `2 <-> 3` | `[4, 3, 2, 1]` |
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 3: Remove Duplicates from Sorted Array
- **Problem Statement**: Remove duplicate values in-place from a sorted array. Return new size.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[1, 1, 2]`, Output: New size `2`, array starts with `[1, 2]`.
- **Brute Force**: Copy unique elements to a set, then overwrite array. Time: $O(N)$, Space: $O(N)$.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  
  int removeDuplicates(std::vector<int>& arr) {
      if (arr.empty()) return 0;
      int i = 0;
      for (size_t j = 1; j < arr.size(); j++) {
          if (arr[j] != arr[i]) {
              i++;
              arr[i] = arr[j];
          }
      }
      return i + 1;
  }
  ```
- **Dry Run Table**: Input `[1, 1, 2]`
  | Step | `j` | `arr[j]` | `i` | Array State |
  | :--- | :--- | :--- | :--- | :--- |
  | Init | - | - | 0 | `[1, 1, 2]` |
  | 1 | 1 | 1 | 0 | `[1, 1, 2]` |
  | 2 | 2 | 2 | 1 | `[1, 2, 2]` |
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 4: Find the Missing Number
- **Problem Statement**: Given an array of size $N-1$ containing integers in range $[1, N]$ with one missing, find it.
- **Constraints**: $2 \le N \le 10^5$.
- **Example**: Input: `[1, 2, 4]`, Output: `3`.
- **Brute Force**: Scan array elements one-by-one looking for each number from 1 to $N$. Time: $O(N^2)$, Space: $O(1)$.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <numeric>
  
  int getMissingNumber(const std::vector<int>& arr) {
      long long n = arr.size() + 1;
      long long expected_sum = n * (n + 1) / 2;
      long long actual_sum = 0;
      for (int x : arr) actual_sum += x;
      return expected_sum - actual_sum;
  }
  ```
- **Dry Run Table**: Input `[1, 2, 4]` (size 3, $N=4$)
  | Step | Expected Sum | Actual Sum Accumulator | Output |
  | :--- | :--- | :--- | :--- |
  | Init | $4 \times 5 / 2 = 10$ | 0 | - |
  | 1 | 10 | $0 + 1 = 1$ | - |
  | 2 | 10 | $1 + 2 = 3$ | - |
  | 3 | 10 | $3 + 4 = 7$ | $10 - 7 = 3$ |
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 5: Count Occurrences
- **Problem Statement**: Find the frequency of element $X$ in an array.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[1, 2, 2, 3]`, $X=2$, Output: `2`.
- **Brute Force / Optimal**: Scan the array once, incrementing a counter when element matches $X$.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  
  int getCount(const std::vector<int>& arr, int target) {
      int count = 0;
      for (int x : arr) {
          if (x == target) count++;
      }
      return count;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 6: Check if Sorted
- **Problem Statement**: Return true if the array is sorted in non-decreasing order.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[1, 2, 5, 4]`, Output: `false`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  
  bool isSorted(const std::vector<int>& arr) {
      for (size_t i = 1; i < arr.size(); i++) {
          if (arr[i] < arr[i - 1]) return false;
      }
      return true;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 7: Find Peak Element
- **Problem Statement**: Find a peak element (not smaller than its neighbors).
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[1, 2, 3, 1]`, Output: Index `2` (value 3).
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  
  int findPeak(const std::vector<int>& arr) {
      int n = arr.size();
      if (n == 1) return 0;
      if (arr[0] >= arr[1]) return 0;
      if (arr[n - 1] >= arr[n - 2]) return n - 1;
      for (int i = 1; i < n - 1; i++) {
          if (arr[i] >= arr[i - 1] && arr[i] >= arr[i + 1]) return i;
      }
      return -1;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 8: Move Zeroes to End
- **Problem Statement**: Move all 0s to the end of the array while maintaining the relative order of non-zero elements.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[0, 1, 0, 3, 12]`, Output: `[1, 3, 12, 0, 0]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <utility>
  
  void moveZeroes(std::vector<int>& arr) {
      int insert_pos = 0;
      for (size_t i = 0; i < arr.size(); i++) {
          if (arr[i] != 0) {
              std::swap(arr[insert_pos], arr[i]);
              insert_pos++;
          }
      }
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 9: Sum Except Self Naive
- **Problem Statement**: Replace each element with sum of all other elements.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[1, 2, 3]`, Output: `[5, 4, 3]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <numeric>
  
  void sumExceptSelf(std::vector<int>& arr) {
      long long total_sum = 0;
      for (int x : arr) total_sum += x;
      for (size_t i = 0; i < arr.size(); i++) {
          arr[i] = total_sum - arr[i];
      }
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 10: Sorted Pair Target Sum
- **Problem Statement**: Given a sorted array, check if there exists a pair summing to $K$.
- **Constraints**: $2 \le N \le 10^5$.
- **Example**: Input: `[1, 2, 4, 6]`, $K=6$, Output: `false`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  
  bool checkPairSum(const std::vector<int>& arr, int target) {
      int l = 0, r = arr.size() - 1;
      while (l < r) {
          int cur = arr[l] + arr[r];
          if (cur == target) return true;
          else if (cur < target) l++;
          else r--;
      }
      return false;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

## Medium-Level Problems (55-Minute Tier)

### Problem 11: Two Sum (Hash Map)
- **Problem Statement**: Find indices of the two elements in an unsorted array that sum to $K$.
- **Constraints**: $2 \le N \le 10^5$.
- **Example**: Input: `[3, 2, 4]`, $K=6$, Output: `[1, 2]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <unordered_map>
  
  std::vector<int> twoSum(const std::vector<int>& arr, int target) {
      std::unordered_map<int, int> seen;
      for (int i = 0; i < (int)arr.size(); i++) {
          int complement = target - arr[i];
          if (seen.count(complement)) {
              return {seen[complement], i};
          }
          seen[arr[i]] = i;
      }
      return {};
  }
  ```
- **Complexity**: Time: $O(N)$ average, Space: $O(N)$.

---

### Problem 12: Max Subarray Sum (Kadane's)
- **Problem Statement**: Find the contiguous subarray with the largest sum.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[-2, 1, -3, 4, -1, 2, 1, -5, 4]`, Output: `6` (subarray `[4, -1, 2, 1]`).
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <algorithm>
  
  long long maxSubarraySum(const std::vector<int>& arr) {
      long long max_so_far = arr[0];
      long long curr_max = arr[0];
      for (size_t i = 1; i < arr.size(); i++) {
          curr_max = std::max((long long)arr[i], curr_max + arr[i]);
          max_so_far = std::max(max_so_far, curr_max);
      }
      return max_so_far;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 13: Equilibrium Index
- **Problem Statement**: Find an index where sum of elements on left equals sum on right.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[-7, 1, 5, 2, -4, 3, 0]`, Output: `3`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <numeric>
  
  int findEquilibrium(const std::vector<int>& arr) {
      long long total_sum = 0;
      for (int x : arr) total_sum += x;
      long long left_sum = 0;
      for (int i = 0; i < (int)arr.size(); i++) {
          total_sum -= arr[i];
          if (left_sum == total_sum) return i;
          left_sum += arr[i];
      }
      return -1;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 14: Rotate Array by K Steps
- **Problem Statement**: Rotate array of size $N$ to the right by $K$ steps.
- **Constraints**: $1 \le N \le 10^5$, $0 \le K \le 10^6$.
- **Example**: Input: `[1, 2, 3, 4, 5]`, $K=2$, Output: `[4, 5, 1, 2, 3]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <algorithm>
  
  void rotateArray(std::vector<int>& arr, int k) {
      int n = arr.size();
      k = k % n;
      std::reverse(arr.begin(), arr.end());
      std::reverse(arr.begin(), arr.begin() + k);
      std::reverse(arr.begin() + k, arr.end());
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 15: Sort 012 (Dutch National Flag)
- **Problem Statement**: Sort an array containing only 0s, 1s, and 2s in-place.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[2, 0, 2, 1, 1, 0]`, Output: `[0, 0, 1, 1, 2, 2]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <utility>
  
  void sort012(std::vector<int>& arr) {
      int low = 0, mid = 0, high = arr.size() - 1;
      while (mid <= high) {
          if (arr[mid] == 0) {
              std::swap(arr[low], arr[mid]);
              low++;
              mid++;
          } else if (arr[mid] == 1) {
              mid++;
          } else {
              std::swap(arr[mid], arr[high]);
              high--;
          }
      }
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 16: Container With Most Water
- **Problem Statement**: Find two vertical lines that together with the x-axis form a container holding the most water.
- **Constraints**: $2 \le N \le 10^5$.
- **Example**: Input: `[1, 8, 6, 2, 5, 4, 8, 3, 7]`, Output: `49`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <algorithm>
  
  int maxArea(const std::vector<int>& height) {
      int max_val = 0;
      int l = 0, r = height.size() - 1;
      while (l < r) {
          int w = r - l;
          int h = std::min(height[l], height[r]);
          max_val = std::max(max_val, w * h);
          if (height[l] < height[r]) l++;
          else r--;
      }
      return max_val;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 17: Longest Subarray with Sum K
- **Problem Statement**: Find the length of the longest contiguous subarray summing to $K$ (contains positives and negatives).
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[10, 5, 2, 7, 1, 9]`, $K=15$, Output: `4` (subarray `[5, 2, 7, 1]`).
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <unordered_map>
  #include <algorithm>
  
  int longestSubarray(const std::vector<int>& arr, int k) {
      std::unordered_map<long long, int> prefix_sums;
      long long current_sum = 0;
      int max_len = 0;
      for (int i = 0; i < (int)arr.size(); i++) {
          current_sum += arr[i];
          if (current_sum == k) {
              max_len = i + 1;
          }
          if (prefix_sums.count(current_sum - k)) {
              max_len = std::max(max_len, i - prefix_sums[current_sum - k]);
          }
          if (!prefix_sums.count(current_sum)) {
              prefix_sums[current_sum] = i;
          }
      }
      return max_len;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(N)$.

---

### Problem 18: Product except Self
- **Problem Statement**: Find products of elements except self without using division.
- **Constraints**: $2 \le N \le 10^5$.
- **Example**: Input: `[1, 2, 3, 4]`, Output: `[24, 12, 8, 6]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  
  std::vector<int> productExceptSelf(const std::vector<int>& arr) {
      int n = arr.size();
      std::vector<int> result(n, 1);
      int left_product = 1;
      for (int i = 0; i < n; i++) {
          result[i] = left_product;
          left_product *= arr[i];
      }
      int right_product = 1;
      for (int i = n - 1; i >= 0; i--) {
          result[i] *= right_product;
          right_product *= arr[i];
      }
      return result;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$ auxiliary.

---

### Problem 19: First Missing Positive
- **Problem Statement**: Find the smallest missing positive integer in an unsorted array.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[3, 4, -1, 1]`, Output: `2`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <utility>
  
  int firstMissingPositive(std::vector<int>& arr) {
      int n = arr.size();
      for (int i = 0; i < n; i++) {
          while (arr[i] >= 1 && arr[i] <= n && arr[arr[i] - 1] != arr[i]) {
              std::swap(arr[i], arr[arr[i] - 1]);
          }
      }
      for (int i = 0; i < n; i++) {
          if (arr[i] != i + 1) return i + 1;
      }
      return n + 1;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 20: Trapping Rain Water
- **Problem Statement**: Given an array representing elevation maps, compute how much water it can trap after raining.
- **Constraints**: $1 \le N \le 10^5$.
- **Example**: Input: `[0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]`, Output: `6`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <algorithm>
  
  int trap(const std::vector<int>& height) {
      if (height.empty()) return 0;
      int l = 0, r = height.size() - 1;
      int left_max = 0, right_max = 0;
      int water = 0;
      while (l < r) {
          if (height[l] < height[r]) {
              if (height[l] >= left_max) left_max = height[l];
              else water += left_max - height[l];
              l++;
          } else {
              if (height[r] >= right_max) right_max = height[r];
              else water += right_max - height[r];
              r--;
          }
      }
      return water;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.
