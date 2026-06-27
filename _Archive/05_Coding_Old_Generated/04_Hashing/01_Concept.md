# Hashing - Concept Guide

## 1. One-Line Intuition
> **Hashing = map keys to values in $O(1)$ average time to enable instantaneous lookups, frequency counting, and uniqueness checks.**

---

## 2. ASCII Trace: Two Sum using Hash Map
Given array `[3, 8, 5, 2]` and Target Sum $= 10$.

```text
Initialize Empty Hash Map: companion_indices = {}

Step 1: Inspect element 3 (index 0).
        - Compute Companion: companion = Target - element = 10 - 3 = 7.
        - Check: Is 7 in companion_indices? No.
        - Action: Store current element and index: companion_indices[3] = 0.
        - Hash Map State: {3: 0}

Step 2: Inspect element 8 (index 1).
        - Companion = 10 - 8 = 2.
        - Check: Is 2 in companion_indices? No.
        - Action: Store current element and index: companion_indices[8] = 1.
        - Hash Map State: {3: 0, 8: 1}

Step 3: Inspect element 5 (index 2).
        - Companion = 10 - 5 = 5.
        - Check: Is 5 in companion_indices? No.
        - Action: Store current element and index: companion_indices[5] = 2.
        - Hash Map State: {3: 0, 8: 1, 5: 2}

Step 4: Inspect element 2 (index 3).
        - Companion = 10 - 2 = 8.
        - Check: Is 8 in companion_indices? YES! (index 1)
        - Action: Target met! Return [companion_indices[8], current_index] -> [1, 3].
```

---

## 3. C++14 Templates

### Template A: Frequency Map (Counting Element Occurrences)
```cpp
#include <unordered_map>
#include <vector>

std::unordered_map<int, int> countFrequencies(const std::vector<int>& elements) {
    std::unordered_map<int, int> frequency_map;
    for (int item : elements) {
        frequency_map[item]++;
    }
    return frequency_map;
}
```

### Template B: Hash Set for Uniqueness / Visited Checks
```cpp
#include <unordered_set>
#include <vector>

std::vector<int> findDuplicates(const std::vector<int>& nums) {
    std::unordered_set<int> visited_elements;
    std::vector<int> duplicate_elements;
    for (int num : nums) {
        if (visited_elements.count(num)) {
            duplicate_elements.push_back(num);
        } else {
            visited_elements.insert(num);
        }
    }
    return duplicate_elements;
}
```

### Template C: Index Lookup Map (Two Sum)
```cpp
#include <unordered_map>
#include <vector>
#include <utility>

std::pair<int, int> twoSumHashMap(const std::vector<int>& nums, int target) {
    std::unordered_map<int, int> visited_indices; // element -> index
    for (int idx = 0; idx < nums.size(); idx++) {
        int companion = target - nums[idx];
        if (visited_indices.count(companion)) {
            return {visited_indices[companion], idx};
        }
        visited_indices[nums[idx]] = idx;
    }
    return {-1, -1};
}
```


---

## 4. Recognition Patterns
**Use Hashing when you see:**
*   **Duplicate/Exist Checks:** "Check if there is a pair with sum...", "Find if any element appears twice."
*   **Frequency/Count queries:** "Find the element that appears most frequently", "Check if two strings are anagrams."
*   **Instant Lookups:** "Find the index of...", "Check if key exists in $O(1)$ time."
*   **Unordered Uniqueness:** Elements where relative sorting order is not required.

---

## 5. When Hashing Fails vs When it Works

### ❌ When Hashing Fails (Counter-Example: Ordered Queries / Memory Constraints)
*   **Context:** Find all elements in an array within a range $[L, R]$ in sorted order, or find the maximum element.
*   **Why Hashing Fails:**
    *   Hash Maps do not maintain order. The elements are stored based on hash functions (unordered).
    *   To find elements in range $[L, R]$, we must scan the entire hash table ($O(N)$), which destroys the $O(1)$ lookup advantage.
    *   Moreover, hashing requires auxiliary memory to store keys and pointers, causing overhead.
*   **Reason for Failure:** Lack of ordering and high memory overhead.
*   **Correct Alternative:** Use a **Self-Balancing Binary Search Tree** (like `std::set` or `std::map` in C++, which keeps elements sorted in $O(\log N)$) or sort the array.

### Algorithm Comparison Table:
| Feature | Hash Map (Unordered) | Self-Balancing Tree (Ordered) |
| :--- | :--- | :--- |
| **Lookup Time** | $O(1)$ average | $O(\log N)$ |
| **Insertion Time** | $O(1)$ average | $O(\log N)$ |
| **Memory Overhead** | High (Hash tables / buckets) | Medium (Node pointers) |
| **Ordering** | Unordered | Strictly sorted |

---

## 6. TCS NQT-Style Problems

### Problem 1: Longest Consecutive Sequence
**Problem Statement:** Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence. The algorithm must run in $O(N)$ time.

#### 1. Brute Force Approach
*   **Concept:** Sort the array first ($O(N \log N)$), then traverse to find the longest sequence.
*   **Complexity:** Time: $O(N \log N)$, Space: $O(1)$ (ignoring sorting overhead).

#### 2. HashSet Optimization ($O(N)$ Time)
*   **Concept:** Insert all numbers into a HashSet. Loop through the array. For each number `num`, check if `num - 1` is in the set. If it is NOT, then `num` is the starting point of a sequence. Keep incrementing the number and check if it exists in the set to compute length.
*   **C++ & Python Code Solutions:**

```python
# Python: Longest Consecutive Sequence
def longest_consecutive(nums: list[int]) -> int:
    num_set = set(nums)
    longest_streak = 0
    
    for num in num_set:
        # Check if num is the start of a sequence
        if (num - 1) not in num_set:
            current_num = num
            current_streak = 1
            
            while (current_num + 1) in num_set:
                current_num += 1
                current_streak += 1
                
            longest_streak = max(longest_streak, current_streak)
            
    return longest_streak
```

```cpp
// C++: Longest Consecutive Sequence
#include <iostream>
#include <vector>
#include <unordered_set>
#include <algorithm>

int longestConsecutive(std::vector<int>& nums) {
    std::unordered_set<int> numSet(nums.begin(), nums.end());
    int longestStreak = 0;
    
    for (int num : numSet) {
        // Only start building sequence if num is the beginning
        if (numSet.find(num - 1) == numSet.end()) {
            int currentNum = num;
            int currentStreak = 1;
            
            while (numSet.find(currentNum + 1) != numSet.end()) {
                currentNum++;
                currentStreak++;
            }
            longestStreak = std::max(longestStreak, currentStreak);
        }
    }
    return longestStreak;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N)$ (although there is a nested loop, we only visit each number at most twice: once during iteration, and once during sequence building).
    *   **Space Complexity:** $O(N)$ to store array elements in HashSet.

---

### Problem 2: First Non-Repeating Character in a String
**Problem Statement:** Given a string, find the first non-repeating character in it and return its index. If it does not exist, return -1.

#### 1. Brute Force Approach
*   **Concept:** For each character in the string, run a nested loop to check if it appears elsewhere in the string.
*   **Complexity:** Time: $O(N^2)$, Space: $O(1)$.

#### 2. Hash Map / Frequency Array Optimization
*   **Concept:** Build a frequency map of characters in a single pass. In the second pass, iterate through the string and return the index of the first character with frequency 1.
*   **C++ & Python Code Solutions:**

```python
# Python: First Non-Repeating Character
def first_uniq_char(s: str) -> int:
    char_counts = {}
    
    # Pass 1: Build frequency map
    for char in s:
        char_counts[char] = char_counts.get(char, 0) + 1
        
    # Pass 2: Find first character with count 1
    for idx, char in enumerate(s):
        if char_counts[char] == 1:
            return idx
            
    return -1
```

```cpp
// C++: First Non-Repeating Character
#include <iostream>
#include <string>
#include <vector>

int firstUniqChar(std::string s) {
    std::vector<int> charCounts(26, 0); // Optimization: Array instead of HashMap for ASCII 
    
    for (char c : s) {
        charCounts[c - 'a']++;
    }
    
    for (int i = 0; i < s.length(); ++i) {
        if (charCounts[s[i] - 'a'] == 1) {
            return i;
        }
    }
    return -1;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N)$ (two linear passes).
    *   **Space Complexity:** $O(1)$ auxiliary space (frequency map size is capped at 26 characters).
