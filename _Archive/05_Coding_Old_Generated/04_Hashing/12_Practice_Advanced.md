# Hashing Techniques - Practice Advanced

This sheet contains advanced-level practice questions. Every question includes a Hint and a compilable C++17 Solution with time and space complexity analysis.

---

## 🔴 Question 1: Longest Substring Without Repeating Characters

### Problem Statement
Given a string `s`, find the length of the longest substring without repeating characters.

*   **Sample Input**: `s = "abcabcbb"` $\implies$ **Sample Output**: `3` (Substrings: `"abc"`, `"bca"`, `"cab"`)

### 💡 Hint
Use a sliding window with two pointers `left` and `right`. Store the last seen index of each character in an index map. If the character at `right` is already present and its last seen index is within the current window ($\ge \text{left}$), move `left` to `last_seen_index + 1`.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

int lengthOfLongestSubstring(std::string s) {
    // Array map for ASCII characters (optimization over unordered_map)
    std::vector<int> last_seen(256, -1);
    
    int max_len = 0;
    int left = 0;
    
    for (int right = 0; right < s.length(); ++right) {
        char current_char = s[right];
        
        // If character has been seen within the current window
        if (last_seen[current_char] >= left) {
            left = last_seen[current_char] + 1; // Slide left pointer past the duplicate
        }
        
        last_seen[current_char] = right; // Update index of current character
        max_len = std::max(max_len, right - left + 1);
    }
    return max_len;
}
```
*   **Time Complexity**: $O(N)$ — Where $N$ is string length. Each character is visited at most once by the right pointer.
*   **Space Complexity**: $O(1)$ — The frequency map uses a constant auxiliary size of 256.

---

## 🔴 Question 2: Minimum Window Substring

### Problem Statement
Given two strings `s` and `t`, return the minimum window substring of `s` such that every character in `t` (including duplicates) is included in the window. If there is no such substring, return the empty string `""`.

*   **Sample Input**: `s = "ADOBECODEBANC"`, `t = "ABC"` $\implies$ **Sample Output**: `"BANC"`

### 💡 Hint
Use two pointers for a sliding window. Build a frequency count map of `t`. Maintain a window frequency map. Keep track of how many characters in `t` have their frequency requirements met in the current window.
1. Expand the right pointer to include elements until all character frequency conditions are met.
2. Once met, record the current window, then contract the left pointer to see if a smaller valid window can be found.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <string>
#include <vector>
#include <climits>

std::string minWindow(std::string s, std::string t) {
    if (s.length() < t.length()) return "";
    
    std::vector<int> target_counts(128, 0);
    for (char c : t) {
        target_counts[c]++;
    }
    
    std::vector<int> window_counts(128, 0);
    int required = 0; // Number of unique characters in t
    for (int count : target_counts) {
        if (count > 0) required++;
    }
    
    int left = 0, right = 0;
    int formed = 0; // Tracks unique characters meeting count in current window
    
    int min_len = INT_MAX;
    int min_left = 0;
    
    while (right < s.length()) {
        char c = s[right];
        window_counts[c]++;
        
        // If the frequency of character matches target, increment formed
        if (target_counts[c] > 0 && window_counts[c] == target_counts[c]) {
            formed++;
        }
        
        // Contract the window from left
        while (left <= right && formed == required) {
            c = s[left];
            
            // Record minimum window
            if (right - left + 1 < min_len) {
                min_len = right - left + 1;
                min_left = left;
            }
            
            window_counts[c]--;
            if (target_counts[c] > 0 && window_counts[c] < target_counts[c]) {
                formed--;
            }
            left++;
        }
        right++;
    }
    return (min_len == INT_MAX) ? "" : s.substr(min_left, min_len);
}
```
*   **Time Complexity**: $O(|S| + |T|)$ — In the worst case, both left and right pointers traverse the string `s` once.
*   **Space Complexity**: $O(1)$ — Maps are represented by fixed ASCII arrays of size 128.

---

## 🔴 Question 3: Continuous Subarray Sum

### Problem Statement
Given an integer array `nums` and an integer `k`, return `true` if `nums` has a continuous subarray of size **at least two** whose elements sum up to a multiple of `k`, otherwise return `false`.

*   **Sample Input**: `nums = [23, 2, 4, 6, 7]`, `k = 6` $\implies$ **Sample Output**: `true` (Subarray `[2, 4]` sums to 6, which is $1 \times 6$).

### 💡 Hint
Use running prefix sum modulo $k$. Store the first occurrence index of each remainder.
1. Running sum modulo $k$: `rem = current_sum % k`. (Normalize negative mod results).
2. If `rem` has been seen before at index `i`, then the subarray from index `i + 1` to `current_index` has a sum that is a multiple of $k$.
3. Check if the length of this subarray ($\text{current\_index} - i$) is $\ge 2$.
4. Initialize the map with `{0: -1}` to handle cases where prefix sum is a multiple of $k$ from the beginning.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

bool checkSubarraySum(const std::vector<int>& nums, int k) {
    std::unordered_map<int, int> rem_map;
    rem_map[0] = -1; // Base case: remainder 0 at index -1
    
    int current_sum = 0;
    for (int i = 0; i < nums.size(); ++i) {
        current_sum += nums[i];
        int rem = (k == 0) ? current_sum : (current_sum % k);
        
        // Handle negative modulo in C++
        if (rem < 0) rem += k;
        
        if (rem_map.count(rem)) {
            // Check if subarray length is at least 2
            if (i - rem_map[rem] >= 2) {
                return true;
            }
        } else {
            rem_map[rem] = i; // Store only the first occurrence to maximize subarray length
        }
    }
    return false;
}
```
*   **Time Complexity**: $O(N)$ — Single pass to calculate modulo prefix sum and query map.
*   **Space Complexity**: $O(\min(N, K))$ — Hash map stores up to $K$ distinct modulo remainders or $N$ elements.
