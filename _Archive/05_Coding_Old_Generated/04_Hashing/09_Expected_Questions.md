# Hashing - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Hashing Techniques.

---

## 1. HASH-01: Two Sum

*   **Problem Statement**: Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
*   **Constraints**:
    *   $2 \le \text{nums.size()} \le 10^5$
    *   $-10^9 \le \text{nums}[i] \le 10^9$
    *   $-10^9 \le \text{target} \le 10^9$
    *   *Sample Input*: `nums = [2, 7, 11, 15]`, target = `9` $\implies$ *Sample Output*: `0 1`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | Check all pairs using nested loops. | $O(N^2)$ | $O(1)$ | Simple but triggers TLE. |
| **Optimal Hash Map** | Store visited numbers and their indices. Check if `target - nums[i]` exists. | $O(N)$ | $O(N)$ | Highly efficient, single pass. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

std::vector<int> twoSum(const std::vector<int>& nums, int target) {
    std::unordered_map<int, int> visited;
    for (int i = 0; i < nums.size(); i++) {
        int complement = target - nums[i];
        if (visited.count(complement)) {
            return {visited[complement], i};
        }
        visited[nums[i]] = i;
    }
    return {};
}
```

### Dry Run Table
Input: `nums = [2, 7, 11, 15]`, target = `9`

| Index $i$ | Element `nums[i]` | Complement `9 - nums[i]` | Check in Map | Map State (Value $\rightarrow$ Index) | Output |
| :---: | :---: | :---: | :---: | :--- | :---: |
| 0 | 2 | 7 | No | `{2: 0}` | — |
| 1 | 7 | 2 | Yes (Index 0) | `{2: 0}` | `{0, 1}` |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass through the array. Hash map insertions and searches take $O(1)$ on average.
*   **Space Complexity**: $O(N)$ — In the worst case, we store $N$ elements in the hash map.

### Shortcut & Math Derivation
*   **Derivation**: Let $A[i] + A[j] = T$. We can rewrite this as $A[j] = T - A[i]$. As we scan the array and treat the current element as $A[j]$, we search if its complement $T - A[j]$ was already processed and stored in our hash map.
*   **Real Number Demo**: Target sum $T=15$. If current element is $6$, we look for $15-6 = 9$ in the map. If $9$ was seen at index $2$, output is $\{2, current\_index\}$.

### Variation & Trap
*   **Trap**: Returning duplicate elements when target is double of an element (e.g. nums=`[3, 2, 4]`, target=`6`). Map must only match companion indexes that are *different* from the current element's index.
*   **Variation**: Find the actual values instead of indices. Can sort the array first and use two-pointers in $O(N \log N)$ time and $O(1)$ space.

---

## 2. HASH-02: Subarray with Sum 0

*   **Problem Statement**: Given an array of integers, find if there is a subarray (of size at least 1) with a sum of 0.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^5 \le \text{arr}[i] \le 10^5$
    *   *Sample Input*: `[4, 2, -3, 1, 6]` $\implies$ *Sample Output*: `true` (subarray `[2, -3, 1]`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | Generate all subarrays and compute their sums. | $O(N^2)$ | $O(1)$ | Triggers TLE for $N = 10^5$. |
| **Optimal Prefix Sum Set** | If prefix sum repeats or is 0, a subarray with sum 0 exists. | $O(N)$ | $O(N)$ | Fast $O(N)$ time lookup. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_set>

bool hasZeroSumSubarray(const std::vector<int>& arr) {
    std::unordered_set<int> prefix_sums;
    int current_sum = 0;
    
    for (int num : arr) {
        current_sum += num;
        
        // If current prefix sum is 0, or already exists in set
        if (current_sum == 0 || prefix_sums.count(current_sum)) {
            return true;
        }
        prefix_sums.insert(current_sum);
    }
    return false;
}
```

### Dry Run Table
Input: `[4, 2, -3, 1, 6]`

| Index $i$ | Element `arr[i]` | `current_sum` | Sum == 0? | In Set? | Set State | Output |
| :---: | :---: | :---: | :---: | :---: | :--- | :---: |
| 0 | 4 | 4 | No | No | `{4}` | — |
| 1 | 2 | 6 | No | No | `{4, 6}` | — |
| 2 | -3 | 3 | No | No | `{4, 6, 3}` | — |
| 3 | 1 | 4 | No | Yes (repeats) | `{4, 6, 3}` | `true` |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single scan. Set insertion and find operations are $O(1)$ average.
*   **Space Complexity**: $O(N)$ — Stores up to $N$ unique prefix sums in the set.

### Shortcut & Math Derivation
*   **Derivation**: Let $P[i]$ be the prefix sum up to index $i$. The sum of elements from index $L$ to $R$ is $P[R] - P[L - 1]$. For this sum to be 0:
    $$P[R] - P[L - 1] = 0 \implies P[R] = P[L - 1]$$
    Therefore, if any prefix sum repeats, the subarray between the two occurrences must sum to 0.
*   **Real Number Demo**: Prefix sums of `[4, 2, -3, 1]` are `[4, 6, 3, 4]`. The prefix sum `4` repeats at index 0 and index 3. The subarray after index 0 up to index 3 is `[2, -3, 1]`, which sums to $2 - 3 + 1 = 0$.

### Variation & Trap
*   **Trap**: Forgetting to check if `current_sum == 0` directly. If the first element is 0 or a prefix sum from the start is 0, it means a prefix subarray sums to 0.
*   **Variation**: Find the length of the longest subarray with sum 0. Store index of prefix sum in map rather than a set, and calculate index difference.

---

## 3. HASH-03: Subarray with Given Sum (Negatives Allowed)

*   **Problem Statement**: Given an array of integers and a value `target`, find the count of subarrays whose sum is equal to `target`.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^9 \le \text{arr}[i] \le 10^9$
    *   *Sample Input*: `[10, 2, -2, -20, 10]`, target = `-10` $\implies$ *Sample Output*: `3` (subarrays `[10, 2, -2, -20]`, `[2, -2, -20, 10]`, `[-20, 10]`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Two Pointers (Sliding Window)** | Expand and contract window. | $O(N)$ | $O(1)$ | **FAILS** when array contains negative numbers. |
| **Optimal Prefix Map** | Track frequency of prefix sums. For current sum $S$, check frequency of $S - \text{target}$. | $O(N)$ | $O(N)$ | Works for all numbers (positive and negative). |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

int subarraySum(const std::vector<int>& nums, int k) {
    std::unordered_map<int, int> prefix_counts;
    prefix_counts[0] = 1; // Base case: prefix sum 0 occurs once
    
    int current_sum = 0;
    int result = 0;
    
    for (int num : nums) {
        current_sum += num;
        int complement = current_sum - k;
        
        if (prefix_counts.count(complement)) {
            result += prefix_counts[complement];
        }
        prefix_counts[current_sum]++;
    }
    return result;
}
```

### Dry Run Table
Input: `[10, 2, -2]`, target = `10`

| Index | Element | `current_sum` | Complement `current_sum - 10` | Matches Found | Map State | Total count |
| :---: | :---: | :---: | :---: | :---: | :--- | :---: |
| — | — | 0 | — | — | `{0: 1}` | 0 |
| 0 | 10 | 10 | 0 | 1 | `{0: 1, 10: 1}` | 1 |
| 1 | 2 | 12 | 2 | 0 | `{0: 1, 10: 1, 12: 1}` | 1 |
| 2 | -2 | 10 | 0 | 1 | `{0: 1, 10: 2, 12: 1}` | 2 |

### Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass with $O(1)$ map operations.
*   **Space Complexity**: $O(N)$ — Stores up to $N$ prefix sums in map.

### Shortcut & Math Derivation
*   **Derivation**: Let $S_j$ be prefix sum up to index $j$, and $S_i$ be prefix sum up to index $i$ ($i < j$). Subarray sum between $i+1$ and $j$ is $S_j - S_i$. We want:
    $$S_j - S_i = k \implies S_i = S_j - k$$
    So at each index $j$, we count how many times prefix sum $S_j - k$ has occurred in the past.
*   **Real Number Demo**: With target $k = -10$, if our running sum reaches $12$, we search for prefix sum $12 - (-10) = 22$. If $22$ occurred twice previously, it implies two distinct subarrays ending at the current index sum to $-10$.

### Variation & Trap
*   **Trap**: Initializing map without `{0: 1}` base case. If a prefix sum equals $k$ directly, $S_j - k = 0$. Without `{0: 1}`, this subarray would not be counted.
*   **Variation**: Find the minimum length of subarray summing to $k$. Store first index of prefix sum instead of frequencies.

---

## 4. HASH-04: Group Anagrams

*   **Problem Statement**: Given an array of strings `strs`, group the anagrams together.
*   **Constraints**:
    *   $1 \le \text{strs.length} \le 10^4$
    *   $0 \le \text{strs}[i]\text{.length} \le 100$
    *   *Sample Input*: `["eat", "tea", "tan", "ate", "nat", "bat"]` $\implies$ *Sample Output*: `[["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force Pairs** | Compare every string with all others using sorting checks. | $O(N^2 \cdot L \log L)$ | $O(N \cdot L)$ | Very slow, triggers TLE. |
| **Optimal Hash Map** | Sort each string to create a key, and insert it into a map of `sorted_key -> vector of strings`. | $O(N \cdot L \log L)$ | $O(N \cdot L)$ | Standard and fast for most word lengths. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>
#include <algorithm>

std::vector<std::vector<std::string>> groupAnagrams(const std::vector<std::string>& strs) {
    std::unordered_map<std::string, std::vector<std::string>> groups;
    
    for (const std::string& s : strs) {
        std::string key = s;
        std::sort(key.begin(), key.end()); // Anagrams will have same sorted string key
        groups[key].push_back(s);
    }
    
    std::vector<std::vector<std::string>> result;
    for (const auto& pair : groups) {
        result.push_back(pair.second);
    }
    return result;
}
```

### Dry Run Table
Input: `["eat", "tea", "tan", "ate"]`

| String `s` | Sorted Key | Map State (Key $\rightarrow$ Vector) |
| :--- | :--- | :--- |
| `"eat"` | `"aet"` | `{"aet": ["eat"]}` |
| `"tea"` | `"aet"` | `{"aet": ["eat", "tea"]}` |
| `"tan"` | `"ant"` | `{"aet": ["eat", "tea"], "ant": ["tan"]}` |
| `"ate"` | `"aet"` | `{"aet": ["eat", "tea", "ate"], "ant": ["tan"]}` |

### Complexity Analysis
*   **Time Complexity**: $O(N \cdot L \log L)$ — $N$ is the number of strings, $L$ is the max string length. Sorting each string takes $O(L \log L)$.
*   **Space Complexity**: $O(N \cdot L)$ — Space used to store the strings in the map groups.

### Shortcut & Math Derivation
*   **Derivation**: Anagrams are words composed of the exact same characters in different orders. Sorting any anagram word yields the alphabetical base representation.
*   **Real Number Demo**: `"eat"`, `"tea"`, and `"ate"` all contain characters $\{a:1, e:1, t:1\}$. Sorting them alphabetically always produces `"aet"`. Using `"aet"` as the hash key groups them correctly.

### Variation & Trap
*   **Trap**: For long strings, sorting $O(L \log L)$ can be slow. Can optimize by using a custom character frequency string count key like `"1#0#0...#1"` (counts of a-z separated by `#`) to achieve $O(N \cdot L)$ time.
*   **Variation**: Check if only two strings are anagrams. Use single hash frequency array of size 256.
