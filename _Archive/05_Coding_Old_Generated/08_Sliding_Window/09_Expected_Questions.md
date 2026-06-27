# Sliding Window - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Sliding Window.

---

## 1. SW-01: Maximum Sum of Subarray of Size K

*   **Problem Statement**: Given an array of integers `arr` and a number $K$, find the maximum sum of any contiguous subarray of size $K$.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $1 \le K \le N$
    *   $-10^5 \le \text{arr}[i] \le 10^5$
    *   *Sample Input*: `arr = [2, 1, 5, 1, 3, 2]`, K = `3` $\implies$ *Sample Output*: `9` (subarray `[5, 1, 3]`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | Compute sum for all subarrays of size K using nested loops. | $O(N \cdot K)$ | $O(1)$ | Triggers TLE for large $N$ and $K$. |
| **Optimal Sliding Window** | Compute initial sum of size K. Slide window right by adding next element and subtracting outgoing element. | $O(N)$ | $O(1)$ | Optimal, runs in linear time. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

long long maxSubarraySumOfSizeK(const std::vector<int>& arr, int k) {
    int n = arr.size();
    if (n < k) return 0;
    
    long long current_window_sum = 0;
    for (int i = 0; i < k; i++) {
        current_window_sum += arr[i];
    }
    
    long long max_sum = current_window_sum;
    
    for (int right = k; right < n; right++) {
        current_window_sum += arr[right] - arr[right - k];
        max_sum = std::max(max_sum, current_window_sum);
    }
    return max_sum;
}
```

### Dry Run Table
Input: `arr = [2, 1, 5, 1, 3, 2]`, K = `3`

| Step | Window range | Element added | Element removed | `current_window_sum` | `max_sum` |
| :---: | :--- | :---: | :---: | :---: | :---: |
| Init | `[2, 1, 5]` | — | — | $2+1+5 = 8$ | 8 |
| 1 | `[1, 5, 1]` | 1 | 2 | $8 + 1 - 2 = 7$ | 8 |
| 2 | `[5, 1, 3]` | 3 | 1 | $7 + 3 - 1 = 9$ | 9 |
| 3 | `[1, 3, 2]` | 2 | 5 | $9 + 2 - 5 = 6$ | 9 |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass scan across the array.
*   **Space Complexity**: $O(1)$ — Only a few variables allocated.

### Shortcut & Math Derivation
*   **Derivation**: Let $S_i = \sum_{j=i}^{i+K-1} A[j]$. For the next window, the sum is:
    $$S_{i+1} = \sum_{j=i+1}^{i+K} A[j] = S_i + A[i+K] - A[i]$$
    This allows us to compute the next window sum in $O(1)$ operations instead of re-summing $K$ elements.
*   **Real Number Demo**: With window `[2, 1, 5]` (sum = 8), sliding right adds `1` and removes `2`, yielding $8 + 1 - 2 = 7$.

### Variation & Trap
*   **Trap**: Not handling arrays of size smaller than $K$. Always check if $N < K$ and handle the boundary properly.
*   **Variation**: Find the subarray with the minimum sum of size $K$. Change `std::max` to `std::min`.

---

## 2. SW-02: Longest Substring Without Repeating Characters

*   **Problem Statement**: Given a string `s`, find the length of the longest substring without repeating characters.
*   **Constraints**:
    *   $0 \le \text{s.length()} \le 10^5$
    *   `s` consists of English letters, digits, symbols and spaces.
    *   *Sample Input*: `s = "abcabcbb"` $\implies$ *Sample Output*: `3` (substring `"abc"`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | Generate all substrings, check each for duplicates using set. | $O(N^3)$ | $O(\min(N, M))$ | Triggers TLE. |
| **Optimal Sliding Window** | Maintain left and right pointers. Expand right, update char indexes in map. If duplicate is found in window, contract left. | $O(N)$ | $O(\min(N, \Sigma))$ | Fast, single pass. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

int lengthOfLongestSubstring(const std::string& s) {
    // Array to store last seen index of characters (faster than hash map)
    std::vector<int> last_seen(256, -1);
    
    int max_len = 0;
    int left = 0;
    
    for (int right = 0; right < s.length(); right++) {
        char current_char = s[right];
        
        // If character was seen and lies inside current window
        if (last_seen[current_char] >= left) {
            left = last_seen[current_char] + 1; // Move window start past duplicate
        }
        
        last_seen[current_char] = right;
        max_len = std::max(max_len, right - left + 1);
    }
    return max_len;
}
```

### Dry Run Table
Input: `"abcab"`

| `right` | `s[right]` | `last_seen[s[right]]` | `left` value | Current Window | `right - left + 1` | `max_len` |
| :---: | :---: | :---: | :---: | :--- | :---: | :---: |
| 0 | 'a' | -1 | 0 | `"a"` | 1 | 1 |
| 1 | 'b' | -1 | 0 | `"ab"` | 2 | 2 |
| 2 | 'c' | -1 | 0 | `"abc"` | 3 | 3 |
| 3 | 'a' | 0 ($\ge 0$) | 1 | `"bca"` | 3 | 3 |
| 4 | 'b' | 1 ($\ge 1$) | 2 | `"cab"` | 3 | 3 |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — The `right` pointer walks the string once, and `left` is updated in $O(1)$ operations.
*   **Space Complexity**: $O(\Sigma)$ — Auxiliary vector of size 256 to track ASCII character indices.

### Shortcut & Math Derivation
*   **Derivation**: Rather than sliding `left` step-by-step using a while loop, we store the *last seen index* of every character. If we see a repeating character, we can jump `left` directly to `last_seen[char] + 1`, skipping useless states.
*   **Real Number Demo**: In `"abca"`, when we see the second `'a'`, we look up its last index (0) and jump `left` straight to 1. The active window becomes `"bca"`.

### Variation & Trap
*   **Trap**: Jumping `left` backward. When processing `"tmmzuxt"`, when we inspect the last `'t'`, its last seen index is 0. But `left` is already at 2 (due to `'m'`). We must check `last_seen[char] >= left` to prevent `left` from moving backward.
*   **Variation**: Find the longest substring with at most $K$ distinct characters.

---

## 3. SW-03: Minimum Window Substring

*   **Problem Statement**: Given two strings $S$ and $T$, return the minimum window substring of $S$ such that every character in $T$ (including duplicates) is included in the window. If no such substring exists, return the empty string `""`.
*   **Constraints**:
    *   $1 \le S\text{.length()}, T\text{.length()} \le 10^5$
    *   *Sample Input*: $S = \text{"ADOBECODEBANC"}, T = \text{"ABC"}$ $\implies$ *Sample Output*: `"BANC"`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force Substrings** | Check all substrings of $S$ to see if they contain $T$. | $O(N^2)$ | $O(\Sigma)$ | Triggers TLE. |
| **Optimal Sliding Window** | Expand right pointer until window contains all chars of $T$. Shrink left pointer to minimize length while keeping condition. | $O(N)$ | $O(\Sigma)$ | Highly optimized, linear time complexity. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

std::string minWindow(const std::string& s, const std::string& t) {
    std::vector<int> t_freq(128, 0);
    for (char c : t) t_freq[c]++;
    
    std::vector<int> window_freq(128, 0);
    int required_count = 0;
    for (int count : t_freq) {
        if (count > 0) required_count++;
    }
    
    int left = 0, right = 0;
    int formed_count = 0;
    int min_len = 1e9;
    int start_idx = -1;
    
    while (right < s.length()) {
        char c = s[right];
        window_freq[c]++;
        
        if (t_freq[c] > 0 && window_freq[c] == t_freq[c]) {
            formed_count++;
        }
        
        // Try to contract the window
        while (left <= right && formed_count == required_count) {
            char left_char = s[left];
            int window_len = right - left + 1;
            
            if (window_len < min_len) {
                min_len = window_len;
                start_idx = left;
            }
            
            window_freq[left_char]--;
            if (t_freq[left_char] > 0 && window_freq[left_char] < t_freq[left_char]) {
                formed_count--;
            }
            left++;
        }
        right++;
    }
    return start_idx == -1 ? "" : s.substr(start_idx, min_len);
}
```

### Dry Run Table
Input: $S = \text{"ADOBECODEBANC"}, T = \text{"ABC"}$

| Pointer State | Current Window | `formed_count` | `required_count` | Condition Met? | Action |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `right=5` | `"ADOBEC"` | 3 | 3 | Yes | Record `"ADOBEC"`, shift `left` to 1 |
| `left=1` | `"DOBEC"` | 2 | 3 | No | Shift `right` to expand |
| `right=10` | `"DOBECODEBA"` | 3 | 3 | Yes | Shift `left` to contract |
| `right=12` | `"BANC"` (best) | 3 | 3 | Yes | Record `"BANC"`, loop ends |

### Complexity Analysis
*   **Time Complexity**: $O(|S| + |T|)$ — Pointers `left` and `right` traverse $S$ at most once.
*   **Space Complexity**: $O(\Sigma)$ — Constant space for character arrays of size 128.

### Shortcut & Math Derivation
*   **Derivation**: Rather than verifying the entire map contents on every expansion, we maintain a `formed_count` counter. A character matches required count if its freq in window equals its freq in target $T$. This makes window verification $O(1)$ time.
*   **Real Number Demo**: If $T$ needs $\{A:1, B:1\}$, and window has $\{A:1, B:0\}$. `formed_count = 1` (needs 2). Adding `'B'` increases `formed_count` to 2. We can now begin shrinking `left` to find optimal substring.

### Variation & Trap
*   **Trap**: Not keeping track of duplicate target characters. Ensure to compare `window_freq[c] == t_freq[c]` exactly to increment matches.
*   **Variation**: Find the shortest substring containing all unique characters of the string itself.
