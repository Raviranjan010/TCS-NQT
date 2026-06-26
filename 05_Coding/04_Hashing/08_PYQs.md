# Hashing Techniques - Past Year Questions (PYQs)

This guide contains official-style high-frequency TCS NQT Past Year Questions (PYQs), formatted with Pattern IDs, Approach derivations, complete C++17 code, dry run tables, complexity analyses, speed-run shortcuts, and variations & traps.

---

## 🟢 PYQ 1: Longest Subarray with Sum K (Negative Numbers Allowed)

### Problem Statement
Given an array `arr` of size $N$ and an integer $K$, find the length of the longest contiguous subarray whose sum is equal to $K$.

*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^9 \le \text{arr}[i], K \le 10^9$
*   **Sample Input**: `arr = [10, 5, 2, 7, 1, 9]`, `K = 15` $\implies$ **Sample Output**: `4` (Subarray `[5, 2, 7, 1]`)

### 🔍 Pattern ID
`HASH-PYQ-01` (Prefix Sum Index Mapping)

### 🛠️ Approach
1. Define a running prefix sum $S_j = \sum_{a=0}^j \text{arr}[a]$.
2. If the subarray from index $i+1$ to $j$ sums to $K$, then:
   $$S_j - S_i = K \implies S_i = S_j - K$$
3. As we iterate through the array, we search if prefix sum $S_i = S_j - K$ was encountered previously. If yes, the length of that subarray is $j - i$.
4. To maximize this length, we want the earliest possible index $i$. Therefore, we use a hash map to store the **first occurrence** of each prefix sum.

### 💻 C++17 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>
#include <algorithm>

int lenOfLongestSubarr(const std::vector<int>& arr, int k) {
    std::unordered_map<int, int> prefix_map;
    prefix_map[0] = -1; // Base case: prefix sum 0 occurs before the first index
    
    int max_len = 0;
    int current_sum = 0;
    
    for (int i = 0; i < arr.size(); ++i) {
        current_sum += arr[i];
        
        // Check if prefix sum (current_sum - k) was seen before
        if (prefix_map.count(current_sum - k)) {
            max_len = std::max(max_len, i - prefix_map[current_sum - k]);
        }
        
        // Store only the first occurrence of the prefix sum
        if (!prefix_map.count(current_sum)) {
            prefix_map[current_sum] = i;
        }
    }
    return max_len;
}
```

### 📋 Dry Run Table
Input: `arr = [10, 5, 2, 7, 1, 9]`, $K = 15$. Initial map: `{0: -1}`.

| Index $i$ | Element | `current_sum` | Target `current_sum - K` | Seen? (Index) | Length | Map Update | Max Length |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- | :---: |
| 0 | 10 | 10 | $10 - 15 = -5$ | No | — | `{0:-1, 10:0}` | 0 |
| 1 | 5 | 15 | $15 - 15 = 0$ | Yes (-1) | $1 - (-1) = 2$ | `{0:-1, 10:0, 15:1}` | 2 |
| 2 | 2 | 17 | $17 - 15 = 2$ | No | — | `{..., 17:2}` | 2 |
| 3 | 7 | 24 | $24 - 15 = 9$ | No | — | `{..., 24:3}` | 2 |
| 4 | 1 | 25 | $25 - 15 = 10$ | Yes (0) | $4 - 0 = 4$ | `{..., 25:4}` | 4 |
| 5 | 9 | 34 | $34 - 15 = 19$ | No | — | `{..., 34:5}` | 4 |

*   **Final Output**: `4`.

### 📊 Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass to compute prefix sums and check map.
*   **Space Complexity**: $O(N)$ — Hash map stores up to $N$ unique prefix sums.

### ⚡ Shortcut & Math Derivation
*   **Shortcut**: If the array only contains positive numbers, you do not need a hash map. You can use the **Two Pointers / Sliding Window** technique. It reduces the space complexity to $O(1)$ while keeping the time complexity at $O(N)$.
*   **Real Number Demo (Two Pointers)**:
    For positive-only array `[10, 5, 2, 7, 1]`, if window sum $> 15$, contract left pointer. If sum $< 15$, expand right pointer.

### ⚠️ Variation & Trap
*   **Trap (Off-by-One)**: Forgetting `prefix_map[0] = -1`. If subarray `[10, 5]` sums to $15$ at index 1, $S_1 - K = 15 - 15 = 0$. Without `prefix_map[0] = -1`, we miss this subarray.
*   **Variation**: Longest subarray with sum divisible by $K$. (Store prefix sum mod $K$).

---

## 🟡 PYQ 2: Distinct Elements in Every Window of Size K

### Problem Statement
Given an array `arr` of size $N$ and an integer $K$, return an array containing the count of distinct elements in every contiguous sliding window of size $K$.

*   **Constraints**:
    *   $1 \le K \le N \le 10^5$
    *   $-10^5 \le \text{arr}[i] \le 10^5$
*   **Sample Input**: `arr = [1, 2, 1, 3, 4, 2, 3]`, `K = 4` $\implies$ **Sample Output**: `3 4 4 3`

### 🔍 Pattern ID
`HASH-PYQ-02` (Sliding Window Hash Counting)

### 🛠️ Approach
1. Build a frequency hash map for the first window of size $K$ (indices $0$ to $K-1$). The size of the map gives the distinct element count for the first window.
2. Slide the window one element at a time:
    - Decrement the count of the outgoing element `arr[i - K]`. If its count becomes $0$, erase it from the hash map.
    - Increment the count of the incoming element `arr[i]`.
    - Record the size of the map as the distinct count for this window.

### 💻 C++17 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

std::vector<int> countDistinct(const std::vector<int>& arr, int k) {
    std::vector<int> result;
    std::unordered_map<int, int> window_counts;
    
    // Step 1: Count elements in the first window of size k
    for (int i = 0; i < k; ++i) {
        window_counts[arr[i]]++;
    }
    result.push_back(window_counts.size());
    
    // Step 2: Slide the window from index k to N-1
    for (int i = k; i < arr.size(); ++i) {
        int outgoing = arr[i - k];
        int incoming = arr[i];
        
        // Remove outgoing element from frequency count
        window_counts[outgoing]--;
        if (window_counts[outgoing] == 0) {
            window_counts.erase(outgoing);
        }
        
        // Add incoming element
        window_counts[incoming]++;
        
        result.push_back(window_counts.size());
    }
    return result;
}
```

### 📋 Dry Run Table
Input: `arr = [1, 2, 1, 3, 4]`, $K = 3$.

| Window Index $i$ | Incoming | Outgoing | Map Operations | Map State | Size (Distinct Count) |
| :---: | :---: | :---: | :--- | :--- | :---: |
| First Window (0 to 2) | — | — | Add `1` (freq 2), `2` (freq 1) | `{1: 2, 2: 1}` | **2** |
| 3 (Window 1 to 3) | `3` | `1` | Decrement `1` $\to 1$. Add `3` | `{1: 1, 2: 1, 3: 1}` | **3** |
| 4 (Window 2 to 4) | `4` | `2` | Decrement `2` $\to 0$ (Erase!). Add `4` | `{1: 1, 3: 1, 4: 1}` | **3** |

*   **Final Output**: `[2, 3, 3]`.

### 📊 Complexity Analysis
*   **Time Complexity**: $O(N)$ — The loop runs $N - K$ times. Each window slide performs constant number of operations ($O(1)$ average map insertions/deletions).
*   **Space Complexity**: $O(K)$ — The hash map stores at most $K$ elements at any given time.

### ⚡ Shortcut & Math Derivation
*   **Shortcut**: Since elements are bounded in a range $[-10^5, 10^5]$, we can optimize lookup speed by mapping elements to an offset array `int count_array[200005]` and maintaining a single integer `distinct_count`.
*   **Real Number Demo (Offset Array)**:
    Index offset: $idx = \text{arr}[i] + 10^5$.
    If `count_array[idx]` goes from $0 \to 1$, increment `distinct_count`. If it goes $1 \to 0$, decrement `distinct_count`. This avoids all hash map hashing overhead.

### ⚠️ Variation & Trap
*   **Trap (Forgotten Erasure)**: Decrementing `window_counts[outgoing]` without checking if it hits 0 and erasing it. If you only do `window_counts[outgoing]--`, the key remains in the map with value `0`, and `window_counts.size()` will return an incorrect, higher count.

---

## 🔴 PYQ 3: Check if Two Arrays are Permutations of Each Other

### Problem Statement
Given two integer arrays `arr1` and `arr2` of size $N$, determine if `arr2` is a permutation of `arr1` (i.e. both arrays contain the exact same elements with the exact same frequencies).

*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^9 \le \text{arr1}[i], \text{arr2}[i] \le 10^9$
*   **Sample Input**: `arr1 = [1, 2, 5, 4, 3]`, `arr2 = [2, 4, 5, 1, 3]` $\implies$ **Sample Output**: `true`

### 🔍 Pattern ID
`HASH-PYQ-03` (Multiset Equality Check)

### 🛠️ Approach
1. Build a frequency count map of the first array `arr1`.
2. Iterate through the second array `arr2`. For each element, check if it exists in the map with frequency $> 0$.
    - If it does, decrement its frequency.
    - If it does not exist, or its frequency is already $0$, return `false`.
3. If we complete the iteration successfully, return `true`.

### 💻 C++17 Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

bool arePermutations(const std::vector<int>& arr1, const std::vector<int>& arr2) {
    if (arr1.size() != arr2.size()) {
        return false;
    }
    
    std::unordered_map<int, int> freq;
    for (int num : arr1) {
        freq[num]++;
    }
    
    for (int num : arr2) {
        if (freq[num] == 0) { // Element not in arr1 or frequency depleted
            return false;
        }
        freq[num]--;
    }
    return true;
}
```

### 📋 Dry Run Table
Input: `arr1 = [1, 2, 1]`, `arr2 = [2, 1, 1]`. Initial map from `arr1`: `{1: 2, 2: 1}`.

| Index $i$ | Element `arr2[i]` | Frequency in Map | Valid? | Action | Map State |
| :---: | :---: | :---: | :---: | :--- | :--- |
| 0 | 2 | 1 | Yes | Decrement freq | `{1: 2, 2: 0}` |
| 1 | 1 | 2 | Yes | Decrement freq | `{1: 1, 2: 0}` |
| 2 | 1 | 1 | Yes | Decrement freq | `{1: 0, 2: 0}` |

*   **Final Output**: `true`.

### 📊 Complexity Analysis
*   **Time Complexity**: $O(N)$ — Single pass to build frequency map and single pass to match elements.
*   **Space Complexity**: $O(N)$ — Hash map stores up to $N$ unique elements.

### ⚡ Shortcut & Math Derivation
*   **Vedic/Math Verification**: Checksum checks! Before doing hashing, calculate the sum and sum-of-squares of both arrays. If $\sum A \neq \sum B$ or $\sum A^2 \neq \sum B^2$, they cannot be permutations.
*   **Real Number Demo**:
    `arr1 = [1, 2, 3]`, sum = 6, sum of squares = 1 + 4 + 9 = 14.
    `arr2 = [2, 2, 2]`, sum = 6, sum of squares = 4 + 4 + 4 = 12.
    Sums match (6), but sum of squares do not (14 vs 12). Permutation check fails in $O(N)$ time with $O(1)$ space without hashing. (Note: Hash map is still required to guarantee correctness, but checksums serve as a fast negative filter).

### ⚠️ Variation & Trap
*   **Trap (Negative Frequencies)**: Using `freq.count(num)` instead of checking if `freq[num] > 0`. If `arr1 = [1, 2]` and `arr2 = [1, 1]`, the count of `1` is 2. The second `1` decrements freq of `1` to `0`. The next check for `1` finds it in the map (since key exists), but its frequency is 0. Checking `freq[num] == 0` is required to catch duplicates.
