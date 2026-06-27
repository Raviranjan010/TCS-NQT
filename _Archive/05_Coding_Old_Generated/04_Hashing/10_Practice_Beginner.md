# Hashing Techniques - Practice Beginner

This sheet contains beginner-level practice questions. Every question includes a Hint and a compilable C++17 Solution with time and space complexity analysis.

---

## 🟢 Question 1: Check for Duplicates in Array

### Problem Statement
Given an integer array `nums`, return `true` if any value appears at least twice in the array, and return `false` if every element is distinct.

*   **Sample Input**: `nums = [1, 2, 3, 1]` $\implies$ **Sample Output**: `true`

### 💡 Hint
Use a Hash Set to track visited numbers. As you iterate through the array, if the current number is already in the set, you have found a duplicate.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_set>

bool containsDuplicate(const std::vector<int>& nums) {
    std::unordered_set<int> visited;
    for (int num : nums) {
        if (visited.count(num)) {
            return true; // Duplicate found
        }
        visited.insert(num);
    }
    return false; // All elements unique
}
```
*   **Time Complexity**: $O(N)$ — Single pass traversal. Hash set lookup and insertion take $O(1)$ time on average.
*   **Space Complexity**: $O(N)$ — Auxiliary space to store up to $N$ unique elements in the set.

---

## 🟢 Question 2: Query Element Frequency

### Problem Statement
Given an integer array `nums` and a list of query numbers `queries`, return the frequency of each queried number in the array.

*   **Sample Input**: `nums = [2, 4, 2, 4, 4]`, `queries = [2, 4, 5]` $\implies$ **Sample Output**: `[2, 3, 0]`

### 💡 Hint
Precompute frequencies using a Hash Map. For each query, look up its frequency in the map in $O(1)$ time. If the query does not exist in the map, return 0.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

std::vector<int> queryFrequencies(const std::vector<int>& nums, const std::vector<int>& queries) {
    std::unordered_map<int, int> freq_map;
    // Step 1: Precompute frequencies
    for (int num : nums) {
        freq_map[num]++;
    }
    
    // Step 2: Answer queries in O(1) time each
    std::vector<int> result;
    for (int q : queries) {
        if (freq_map.count(q)) {
            result.push_back(freq_map[q]);
        } else {
            result.push_back(0);
        }
    }
    return result;
}
```
*   **Time Complexity**: $O(N + Q)$ — $O(N)$ to build the frequency map and $O(Q)$ to process $Q$ queries.
*   **Space Complexity**: $O(N)$ — Hash map stores up to $N$ unique frequencies.

---

## 🟢 Question 3: Intersection of Two Arrays

### Problem Statement
Given two integer arrays `nums1` and `nums2`, return an array of their intersection. Each element in the result must be **unique** and you may return the result in any order.

*   **Sample Input**: `nums1 = [1, 2, 2, 1]`, `nums2 = [2, 2]` $\implies$ **Sample Output**: `[2]`

### 💡 Hint
Insert all elements of the first array into an unordered set. Then, iterate through the second array. If an element exists in the set, add it to your results and erase it from the set to prevent duplicate listings in the output.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_set>

std::vector<int> intersection(const std::vector<int>& nums1, const std::vector<int>& nums2) {
    std::unordered_set<int> set1(nums1.begin(), nums1.end());
    std::vector<int> result;
    
    for (int num : nums2) {
        if (set1.count(num)) {
            result.push_back(num);
            set1.erase(num); // Erase to ensure unique elements in result
        }
    }
    return result;
}
```
*   **Time Complexity**: $O(N + M)$ — Where $N$ is size of `nums1` and $M$ is size of `nums2`. Set creation takes $O(N)$ and lookup/removal takes $O(M)$.
*   **Space Complexity**: $O(N)$ — To store the unique elements of `nums1` in `set1`.
