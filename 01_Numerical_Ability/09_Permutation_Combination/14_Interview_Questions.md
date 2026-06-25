---
title: "Permutations & Combinations - Interview Questions"
section: "Numerical Ability"
---

# Permutation & Combination Interview Questions

This document covers the conceptual and coding questions on Permutations & Combinations commonly asked in TCS Digital, Ninja, and Prime technical interviews.

---

## 1. Conceptual Q&A

### Q1. What is the fundamental difference between Permutations and Combinations?
**Answer**: 
*   **Permutations** count the number of ordered arrangements. The sequence in which elements are placed matters. For example, the arrangements `AB` and `BA` are counted as 2 distinct permutations.
*   **Combinations** count the number of selections. The order of selection is irrelevant. For example, selecting a set `{A, B}` is the same as selecting `{B, A}`, representing 1 combination.

### Q2. Why do we divide by $(n-1)!$ in circular seating, but divide by $n!$ in linear seating for duplicates?
**Answer**:
*   In circular arrangements, rotational shifts do not create new arrangements (e.g. `ABC` is rotationally identical to `BCA` and `CAB`). Since there are $n$ rotational symmetries for $n$ items, we divide the linear permutation count $n!$ by $n$, giving $\frac{n!}{n} = (n-1)!$.
*   For duplicates in a word (e.g. "ALL"), swapping identical letters (the two 'L's) does not create a new word. Since $p$ identical items can be arranged among themselves in $p!$ ways, we divide by $p!$ to remove these identical arrangements.

---

## 2. Coding Problem 1: Unique Permutations of a String (Duplicates Handled)

### Problem Description
Given a string containing duplicate characters, return all unique permutations of the string in alphabetical order.

### C++ Implementation
```cpp
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

using namespace std;

// Backtracking function to generate unique permutations
void backtrack(string &s, vector<bool> &visited, string &current, vector<string> &result) {
    if (current.length() == s.length()) {
        result.push_back(current);
        return;
    }
    
    for (int i = 0; i < s.length(); i++) {
        // If character already used in current branch, skip
        if (visited[i]) continue;
        
        // Skip duplicate characters to avoid duplicate branches
        if (i > 0 && s[i] == s[i - 1] && !visited[i - 1]) continue;
        
        visited[i] = true;
        current.push_back(s[i]);
        
        backtrack(s, visited, current, result);
        
        // Backtrack: Undo choice
        current.pop_back();
        visited[i] = false;
    }
}

vector<string> uniquePermutations(string s) {
    vector<string> result;
    string current = "";
    vector<bool> visited(s.length(), false);
    
    // Sorting is critical to group identical characters together
    sort(s.begin(), s.end());
    
    backtrack(s, visited, current, result);
    return result;
}

int main() {
    string input = "AAB";
    vector<string> permutations = uniquePermutations(input);
    
    cout << "Unique permutations of " << input << ":" << endl;
    for (const string &str : permutations) {
        cout << str << endl;
    }
    return 0;
}
```

### Complexity Analysis
*   **Time Complexity**: $O(N \times N!)$ where $N$ is the length of the string. There are at most $N!$ permutations, and copying each to the results takes $O(N)$ time.
*   **Space Complexity**: $O(N)$ auxiliary space for recursion stack and the `visited` array (excluding output space).

### Edge Cases
*   **Single character string**: e.g., `"A"` $\implies$ immediately returns `["A"]`.
*   **All characters identical**: e.g., `"AAAA"` $\implies$ correctly returns exactly 1 permutation: `["AAAA"]` because `s[i] == s[i-1] && !visited[i-1]` skips redundant paths.

### Backtracking Dry Run (Input: `"AAB"`)

| Recursion Level | Loop Index $i$ | Current Char | Visited Array | Current String | Action |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **0** | $i = 0$ | `'A'` (index 0) | `[T, F, F]` | `"A"` | Recurse to Level 1 |
| **1** | $i = 0$ | - | `[T, F, F]` | `"A"` | Skip (visited) |
| **1** | $i = 1$ | `'A'` (index 1) | `[T, T, F]` | `"AA"` | Recurse to Level 2 |
| **2** | $i = 2$ | `'B'` (index 2) | `[T, T, T]` | `"AAB"` | Reached leaf. Save `"AAB"`. Backtrack. |
| **1** | $i = 2$ | `'B'` (index 2) | `[T, F, T]` | `"AB"` | Recurse to Level 2 |
| **2** | $i = 1$ | `'A'` (index 1) | `[T, T, T]` | `"ABA"` | Reached leaf. Save `"ABA"`. Backtrack. |
| **0** | $i = 1$ | `'A'` (index 1) | - | - | Skip (duplicate: `s[1] == s[0]` and index 0 is not visited) |
| **0** | $i = 2$ | `'B'` (index 2) | `[F, F, T]` | `"B"` | Recurse to Level 1 |
| **1** | $i = 0$ | `'A'` (index 0) | `[T, F, T]` | `"BA"` | Recurse to Level 2 |
| **2** | $i = 1$ | `'A'` (index 1) | `[T, T, T]` | `"BAA"` | Reached leaf. Save `"BAA"`. Backtrack. |

---

## 3. Coding Problem 2: Combinations of size $k$ from $1 \dots n$

### Problem Description
Given two integers $n$ and $k$, return all possible combinations of $k$ numbers chosen from the range $[1, n]$.

### C++ Implementation
```cpp
#include <iostream>
#include <vector>

using namespace std;

// Backtracking helper to generate combinations
void combineHelper(int start, int n, int k, vector<int> &current, vector<vector<int>> &result) {
    if (current.size() == k) {
        result.push_back(current);
        return;
    }
    
    // Loop boundary optimized to prune impossible search branches
    for (int i = start; i <= n - (k - current.size()) + 1; i++) {
        current.push_back(i);
        
        // Recurse with elements strictly greater than current choice
        combineHelper(i + 1, n, k, current, result);
        
        // Backtrack
        current.pop_back();
    }
}

vector<vector<int>> combine(int n, int k) {
    vector<vector<int>> result;
    vector<int> current;
    combineHelper(1, n, k, current, result);
    return result;
}

int main() {
    int n = 4, k = 2;
    vector<vector<int>> combinations = combine(n, k);
    
    cout << "Combinations of size " << k << " from 1 to " << n << ":" << endl;
    for (const auto &combination : combinations) {
        cout << "[ ";
        for (int val : combination) {
            cout << val << " ";
        }
        cout << "]" << endl;
    }
    return 0;
}
```

### Complexity Analysis
*   **Time Complexity**: $O(k \times ^nC_k)$ where $^nC_k$ is the number of combinations. Copying each solution to the results takes $O(k)$ time.
*   **Space Complexity**: $O(k)$ auxiliary space for the recursion stack and the `current` path buffer.

### Edge Cases
*   $k = n$: e.g., $n=3, k=3 \implies$ returns exactly 1 combination: `[[1, 2, 3]]`.
*   $k = 1$: e.g., $n=3, k=1 \implies$ returns single element choices: `[[1], [2], [3]]`.
*   $k > n$: returns empty set `[]` due to loop pruning `i <= n - (k - current.size()) + 1`.

### Backtracking Dry Run (Input: $n = 4, k = 2$)

```
combineHelper(start=1)
 │
 ├── Choose 1 (current = [1]) -> recurse start=2
 │    ├── Choose 2 (current = [1, 2]) -> Save! Backtrack to [1]
 │    ├── Choose 3 (current = [1, 3]) -> Save! Backtrack to [1]
 │    └── Choose 4 (current = [1, 4]) -> Save! Backtrack to [1]
 │
 ├── Choose 2 (current = [2]) -> recurse start=3
 │    ├── Choose 3 (current = [2, 3]) -> Save! Backtrack to [2]
 │    └── Choose 4 (current = [2, 4]) -> Save! Backtrack to [2]
 │
 └── Choose 3 (current = [3]) -> recurse start=4
      └── Choose 4 (current = [3, 4]) -> Save! Backtrack to [3]
```
*(Note: Loop at Level 0 does not try $i=4$ because $4 > 4 - (2-0) + 1 \implies 4 > 3$, pruning unnecessary recursion).*
