# Hashing Techniques - Practice Intermediate

This sheet contains intermediate-level practice questions. Every question includes a Hint and a compilable C++17 Solution with time and space complexity analysis.

---

## 🟡 Question 1: Find the First Repeating Element

### Problem Statement
Given an array `arr` of size $N$, find the first repeating element. Specifically, find the element that occurs more than once and whose index of first occurrence is smallest.

*   **Sample Input**: `arr = [10, 5, 3, 4, 3, 5, 6]` $\implies$ **Sample Output**: `5` (Both `5` and `3` repeat, but `5` appears first at index 1, while `3` appears first at index 2).

### 💡 Hint
Iterate through the array from right to left. Use an unordered set to track visited elements. If the current element is already in the set, update a variable `first_repeating` with this element. By traversing right-to-left, the last update will correspond to the repeating element with the smallest index.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_set>

int firstRepeatingElement(const std::vector<int>& arr) {
    std::unordered_set<int> visited;
    int min_idx_element = -1;
    
    // Traverse from right to left
    for (int i = arr.size() - 1; i >= 0; --i) {
        if (visited.count(arr[i])) {
            min_idx_element = arr[i]; // Potential answer (earlier repeating index)
        } else {
            visited.insert(arr[i]);
        }
    }
    return min_idx_element; // Returns -1 if no element repeats
}
```
*   **Time Complexity**: $O(N)$ — Single pass right-to-left. Set operations take $O(1)$ on average.
*   **Space Complexity**: $O(N)$ — Auxiliary space to store up to $N$ unique elements in the set.

---

## 🟡 Question 2: Sort Characters by Frequency

### Problem Statement
Given a string `s`, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string. Return the sorted string.

*   **Sample Input**: `s = "tree"` $\implies$ **Sample Output**: `"eert"` or `"eetr"` (`'e'` appears twice, `'r'` and `'t'` appear once).

### 💡 Hint
1. Count the frequency of each character using a frequency array of size 256 (for ASCII).
2. Create a vector of pairs containing the character and its frequency.
3. Sort this vector based on the frequency in descending order.
4. Construct the output string by repeating each character according to its frequency.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

std::string frequencySort(std::string s) {
    std::vector<int> freq(256, 0);
    for (char c : s) {
        freq[c]++;
    }
    
    std::vector<std::pair<char, int>> char_freqs;
    for (int i = 0; i < 256; ++i) {
        if (freq[i] > 0) {
            char_freqs.push_back({static_cast<char>(i), freq[i]});
        }
    }
    
    // Sort in descending order based on frequency
    std::sort(char_freqs.begin(), char_freqs.end(), [](const auto& a, const auto& b) {
        return a.second > b.second;
    });
    
    std::string result = "";
    for (const auto& p : char_freqs) {
        result.append(p.second, p.first);
    }
    return result;
}
```
*   **Time Complexity**: $O(N + C \log C)$ — Where $N$ is string length and $C$ is alphabet size (at most 256). Since $C$ is constant, sorting takes $O(1)$ time, yielding $O(N)$ overall time.
*   **Space Complexity**: $O(C) = O(1)$ — Array and vector sizes are bounded by the size of the character set (256).

---

## 🟡 Question 3: Check Array Pairs Divisibility by K

### Problem Statement
Given an integer array `arr` of even length $N$ and an integer $k$, determine if the array can be partitioned into $N/2$ pairs such that the sum of each pair is divisible by $k$.

*   **Sample Input**: `arr = [1, 2, 3, 4, 5, 10, 6, 7, 8, 9]`, `k = 5` $\implies$ **Sample Output**: `true` (Pairs: $(1, 9)$, $(2, 8)$, $(3, 7)$, $(4, 6)$, $(5, 10)$ are all divisible by 5).

### 💡 Hint
Calculate the remainder of each element when divided by $k$. For a sum of two numbers to be divisible by $k$, the sum of their remainders modulo $k$ must be either $0$ or $k$.
1. Store frequencies of remainders: `rem_count[(num % k + k) % k]++` (handling negatives).
2. For remainder `0`, its count must be even (since elements with remainder 0 must pair with other elements with remainder 0).
3. For remainder `r` ($r \neq 0$), its count must equal the count of remainder `k - r`.
4. If $k$ is even, for remainder $k/2$, its count must be even.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

bool canArrange(const std::vector<int>& arr, int k) {
    std::unordered_map<int, int> rem_counts;
    
    // Count remainders
    for (int num : arr) {
        int rem = ((num % k) + k) % k;
        rem_counts[rem]++;
    }
    
    for (const auto& pair : rem_counts) {
        int rem = pair.first;
        int count = pair.second;
        
        if (rem == 0) {
            // Remainder 0 elements must pair with themselves
            if (count % 2 != 0) return false;
        } else if (2 * rem == k) {
            // Remainder k/2 elements must pair with themselves (for even k)
            if (count % 2 != 0) return false;
        } else {
            // Remainder r must match remainder k - r
            int complement = k - rem;
            if (rem_counts[complement] != count) {
                return false;
            }
        }
    }
    return true;
}
```
*   **Time Complexity**: $O(N)$ — Single pass to calculate remainder counts, and a traversal of remainder keys (at most $k$ keys).
*   **Space Complexity**: $O(K)$ — Map size is bounded by $K$ unique remainder groups.
