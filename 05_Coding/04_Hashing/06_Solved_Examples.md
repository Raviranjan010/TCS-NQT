# Hashing Techniques - Solved Examples

This guide contains high-frequency TCS NQT problems with complete C++17 implementations, step-by-step dry run tables, complexity analysis, shortcuts, and common variations.

---

## 🟢 Example 1: Majority Element II (Frequency $> \lfloor N/3 \rfloor$)

### Problem Statement
Given an integer array `nums` of size $N$, find all elements that appear more than $\lfloor N/3 \rfloor$ times.

*   **Constraints**:
    *   $1 \le N \le 5 \times 10^4$
    *   $-10^9 \le \text{nums}[i] \le 10^9$
*   **Sample Input**: `nums = [3, 2, 3]` $\implies$ **Sample Output**: `[3]`
*   **Sample Input**: `nums = [1, 1, 1, 3, 3, 2, 2, 2]` $\implies$ **Sample Output**: `[1, 2]`

### 🔍 Pattern ID
`HASH-SE-01` (Frequency Threshold Search)

### 🛠️ Approach
1. Build a frequency count map of all elements in the array.
2. Iterate through the map and select elements whose frequency exceeds $\lfloor N/3 \rfloor$.

### 💻 C++17 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

std::vector<int> majorityElement(const std::vector<int>& nums) {
    int n = nums.size();
    int threshold = n / 3;
    std::unordered_map<int, int> counts;
    
    // Pass 1: Count occurrences of each number
    for (int num : nums) {
        counts[num]++;
    }
    
    // Pass 2: Filter elements exceeding threshold
    std::vector<int> result;
    for (const auto& pair : counts) {
        if (pair.second > threshold) {
            result.push_back(pair.first);
        }
    }
    return result;
}
```

### 📋 Dry Run Table
Input: `nums = [1, 1, 1, 3, 3, 2, 2, 2]`, $N = 8$, Threshold $\lfloor 8/3 \rfloor = 2$.

| Iteration | Element | Map State | Count > 2? | Result List |
| :---: | :---: | :--- | :---: | :--- |
| Initial | — | `{}` | — | `[]` |
| 1 | 1 | `{1: 1}` | No | `[]` |
| 2 | 1 | `{1: 2}` | No | `[]` |
| 3 | 1 | `{1: 3}` | No | `[]` |
| 4 | 3 | `{1: 3, 3: 1}` | No | `[]` |
| 5 | 3 | `{1: 3, 3: 2}` | No | `[]` |
| 6 | 2 | `{1: 3, 3: 2, 2: 1}` | No | `[]` |
| 7 | 2 | `{1: 3, 3: 2, 2: 2}` | No | `[]` |
| 8 | 2 | `{1: 3, 3: 2, 2: 3}` | — | Check in Pass 2 |
| Pass 2 | Map traversal | Key 1: count 3 > 2 (Add)<br>Key 3: count 2 not > 2<br>Key 2: count 3 > 2 (Add) | — | `[1, 2]` |

### 📊 Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass to count frequencies, and a traversal of unique keys (at most $N$ unique keys).
*   **Space Complexity**: $O(N)$ — In the worst case, the hash map stores $N$ unique elements.

### ⚡ Shortcut & Math Derivation
*   **Derivation**: Any array of size $N$ can have at most two elements with frequency strictly greater than $\lfloor N/3 \rfloor$. 
*   **Proof**: Let there be three such elements. Each must occur at least $\lfloor N/3 \rfloor + 1$ times.
    $$\text{Total count} \ge 3 \times (\lfloor N/3 \rfloor + 1) = 3 \times \lfloor N/3 \rfloor + 3 > N$$
    This is a contradiction.
*   **Boyer-Moore Voting Shortcut**: We can solve this in $O(N)$ time and $O(1)$ space by keeping track of at most two candidates and their counts.

### ⚠️ Variation & Trap
*   **Trap**: Elements might be printed multiple times if you check during the single pass instead of after. Use a separate hash map or pass to avoid duplicates.
*   **Variation**: Find elements appearing more than $\lfloor N/k \rfloor$ times. (Boyer-Moore can track $k-1$ candidates).

---

## 🟡 Example 2: Count Unique Pairs with Given Difference K

### Problem Statement
Given an integer array `nums` and an integer `k`, return the number of **unique** pairs $(i, j)$ such that $i < j$ and $|\text{nums}[i] - \text{nums}[j]| = k$.

*   **Constraints**:
    *   $1 \le N \le 10^4$
    *   $0 \le k \le 10^7$
*   **Sample Input**: `nums = [1, 5, 3, 4, 2]`, `k = 2` $\implies$ **Sample Output**: `3` (Pairs: $(1, 3)$, $(3, 5)$, $(4, 2)$)

### 🔍 Pattern ID
`HASH-SE-02` (Uniqueness Difference Matching)

### 🛠️ Approach
1. Insert all elements into a hash map mapping each number to its frequency.
2. If $k > 0$, for each unique number $x$ in the map, check if $x + k$ exists. If it does, increment our pair count.
3. If $k = 0$, a valid pair requires at least two copies of the same number. Increment count for every number with frequency $\ge 2$.

### 💻 C++17 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

int findPairs(const std::vector<int>& nums, int k) {
    if (k < 0) return 0;
    
    std::unordered_map<int, int> freq_map;
    for (int num : nums) {
        freq_map[num]++;
    }
    
    int count = 0;
    for (const auto& pair : freq_map) {
        int val = pair.first;
        int freq = pair.second;
        
        if (k > 0) {
            if (freq_map.count(val + k)) {
                count++;
            }
        } else { // k == 0
            if (freq >= 2) {
                count++;
            }
        }
    }
    return count;
}
```

### 📋 Dry Run Table
Input: `nums = [1, 3, 1, 5, 4]`, $k = 2$.
*   **Map State**: `{1: 2, 3: 1, 4: 1, 5: 1}`

| Element `x` in Map | Check `x + k` (i.e. `x + 2`) | Exists in Map? | Count Updated |
| :---: | :---: | :---: | :---: |
| 1 | $1 + 2 = 3$ | Yes | $0 \to 1$ |
| 3 | $3 + 2 = 5$ | Yes | $1 \to 2$ |
| 4 | $4 + 2 = 6$ | No | 2 |
| 5 | $5 + 2 = 7$ | No | 2 |

*   **Final Output**: `2` (Pairs: $(1, 3)$, $(3, 5)$).

### 📊 Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass to build map, and a single pass to iterate over the unique keys. Map lookup is $O(1)$ average.
*   **Space Complexity**: $O(N)$ — Auxiliary space to store elements in the hash map.

### ⚡ Shortcut & Math Derivation
*   **Derivation**: Let $A - B = K$. If we search for $A = B + K$ for each unique element $B$, we guarantee that each pair is counted exactly once, preventing double counting (e.g. counting both $(1, 3)$ and $(3, 1)$).
*   **Real Number Demo**: With $K=2$, for $B=1$, check $1+2=3$. For $B=3$, check $3+2=5$. This naturally progresses forward.

### ⚠️ Variation & Trap
*   **Trap**: For $K = 0$, you must check if `freq >= 2`. If you search for `val + 0` in map, it will always find `val` itself (frequency 1), leading to an incorrect count of all unique elements instead of duplicates.

---

## 🔴 Example 3: Longest Subarray with Equal 0s and 1s

### Problem Statement
Given a binary array `nums` containing only `0`s and `1`s, find the maximum length of a contiguous subarray with an equal number of `0`s and `1`s.

*   **Constraints**:
    *   $1 \le N \le 10^5$
*   **Sample Input**: `nums = [0, 1]` $\implies$ **Sample Output**: `2`
*   **Sample Input**: `nums = [0, 1, 0]` $\implies$ **Sample Output**: `2` (Subarray `[0, 1]` or `[1, 0]`)

### 🔍 Pattern ID
`HASH-SE-03` (Zero-Sum Reduction)

### 🛠️ Approach
1. Convert all `0`s in the array to `-1`s. The problem is now equivalent to finding the **longest subarray with sum equal to 0**.
2. Keep a running prefix sum. If the prefix sum has been seen before, a subarray with sum 0 exists between the previous index and the current index.
3. Use a hash map to store the **earliest index** at which each prefix sum was seen.

### 💻 C++17 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>
#include <algorithm>

int findMaxLength(const std::vector<int>& nums) {
    std::unordered_map<int, int> prefix_map;
    prefix_map[0] = -1; // Base case: prefix sum 0 at index -1
    
    int max_len = 0;
    int running_sum = 0;
    
    for (int i = 0; i < nums.size(); ++i) {
        // Treat 0 as -1, and 1 as +1
        running_sum += (nums[i] == 0) ? -1 : 1;
        
        if (prefix_map.count(running_sum)) {
            // Subarray with sum 0 found from index prefix_map[running_sum] + 1 to i
            max_len = std::max(max_len, i - prefix_map[running_sum]);
        } else {
            // Only store the first occurrence to maximize the length
            prefix_map[running_sum] = i;
        }
    }
    return max_len;
}
```

### 📋 Dry Run Table
Input: `nums = [0, 1, 0, 0, 1]`, $N = 5$. Map state begins with `{0: -1}`.

| Index $i$ | Value | running_sum | Seen in Map? | Calculate Length | Map Update | Max Length |
| :---: | :---: | :---: | :---: | :---: | :--- | :---: |
| — | — | 0 | — | — | `{0: -1}` | 0 |
| 0 | 0 | -1 | No | — | `{0: -1, -1: 0}` | 0 |
| 1 | 1 | 0 | Yes (at -1) | $1 - (-1) = 2$ | No update | 2 |
| 2 | 0 | -1 | Yes (at 0) | $2 - 0 = 2$ | No update | 2 |
| 3 | 0 | -2 | No | — | `{0:-1, -1:0, -2:3}`| 2 |
| 4 | 1 | -1 | Yes (at 0) | $4 - 0 = 4$ | No update | 4 |

*   **Final Output**: `4` (Subarray from index 1 to 4: `[1, 0, 0, 1]`).

### 📊 Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass traversal. Hash map operations take $O(1)$ on average.
*   **Space Complexity**: $O(N)$ — Hash map stores up to $N$ unique prefix sum states.

### ⚡ Shortcut & Math Derivation
*   **Derivation**: Let $S_i$ be prefix sum up to index $i$. If $S_i = S_j$ ($i < j$), then:
    $$S_j - S_i = 0 \implies \sum_{idx = i+1}^j \text{nums}[idx] = 0$$
    To maximize the length of this zero-sum subarray ($j - i$), we must keep $i$ as small as possible. This is why we only store a prefix sum the first time it is encountered.
*   **Real Number Demo**: Prefix sum at index 0 is -1, and at index 4 is -1. The subarray `[1, 0, 0, 1]` (indices 1 to 4) has sum $-1 - (-1) = 0$. Length $= 4 - 0 = 4$.

### ⚠️ Variation & Trap
*   **Trap**: Overwriting the first occurrence of a prefix sum in the hash map. If you write `prefix_map[running_sum] = i` on every visit, you will get the *shortest* subarray instead of the *longest*.
