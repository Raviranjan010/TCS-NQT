# Hashing Techniques - Timed Practice

Simulate the actual TCS NQT coding round. You have **45 minutes** to solve these 3 questions. Ensure you write clean, compilable C++17 code and handle all boundary constraints.

---

## ⏱️ Recommended Schedule & Time Budget
*   **Total Duration**: 45 Minutes
*   **Question 1 (Easy)**: 10 Minutes
*   **Question 2 (Medium)**: 15 Minutes
*   **Question 3 (Medium-Hard)**: 20 Minutes

---

## 🟢 Question 1: Find All Pairs with Sum K (Time Limit: 10 mins)

### Problem Statement
Given an array `arr` of size $N$ and an integer $K$, find the total number of pairs of elements in the array whose sum is equal to $K$. Note that different pairs can consist of elements with the same value, but at different indices.

*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^9 \le \text{arr}[i], K \le 10^9$
*   **Sample Input**: `arr = [1, 5, 7, -1]`, `K = 6` $\implies$ **Sample Output**: `2` (Pairs: $(1, 5)$, $(7, -1)$)
*   **Sample Input**: `arr = [1, 1, 1, 1]`, `K = 2` $\implies$ **Sample Output**: `6` (Pairs at indices: $(0,1)$, $(0,2)$, $(0,3)$, $(1,2)$, $(1,3)$, $(2,3)$)

### 💡 Hint
Use a Hash Map to store the frequencies of the numbers visited so far. For each number $x$, the number of valid pairs ending at the current element is equal to the frequency of $K - x$ in the visited map.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

int getPairsCount(const std::vector<int>& arr, int k) {
    std::unordered_map<int, int> visited_counts;
    int pair_count = 0;
    
    for (int num : arr) {
        int complement = k - num;
        if (visited_counts.count(complement)) {
            pair_count += visited_counts[complement];
        }
        visited_counts[num]++;
    }
    return pair_count;
}
```
*   **Time Complexity**: $O(N)$ — Single pass through the array.
*   **Space Complexity**: $O(N)$ — Auxiliary space to store frequencies in the hash map.

---

## 🟡 Question 2: Subarray Sums Divisible by K (Time Limit: 15 mins)

### Problem Statement
Given an integer array `nums` and an integer $K$, return the number of non-empty **contiguous subarrays** that have a sum divisible by $K$.

*   **Constraints**:
    *   $1 \le N \le 3 \times 10^4$
    *   $2 \le K \le 10^4$
    *   $-10^4 \le \text{nums}[i] \le 10^4$
*   **Sample Input**: `nums = [4, 5, 0, -2, -3, 1]`, `K = 5` $\implies$ **Sample Output**: `7` (Subarrays: `[5]`, `[5, 0]`, `[0]`, `[0, -2, -3]`, `[-2, -3]`, `[5, 0, -2, -3]`, `[4, 5, 0, -2, -3, 1]`)

### 💡 Hint
A subarray sum between indices $i+1$ and $j$ is divisible by $K$ if the prefix sum remainders are equal:
$$P[j] \equiv P[i] \pmod K \implies P[j] - P[i] = m \cdot K$$
Keep a running prefix sum modulo $K$ and count the frequencies of each remainder in a hash map. Initialize `rem_counts[0] = 1`. Handle negative remainders by adjusting `rem = (rem + K) % K`.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

int subarraysDivByK(const std::vector<int>& nums, int k) {
    std::unordered_map<int, int> rem_counts;
    rem_counts[0] = 1; // Base case: prefix sum 0 is divisible by k
    
    int running_sum = 0;
    int result_count = 0;
    
    for (int num : nums) {
        running_sum += num;
        int rem = running_sum % k;
        
        // Handle negative remainders in C++
        if (rem < 0) rem += k;
        
        if (rem_counts.count(rem)) {
            result_count += rem_counts[rem];
        }
        rem_counts[rem]++;
    }
    return result_count;
}
```
*   **Time Complexity**: $O(N)$ — Single pass to calculate remainder frequencies and count subarrays.
*   **Space Complexity**: $O(K)$ — The hash map stores at most $K$ unique remainder frequencies.

---

## 🔴 Question 3: Longest Consecutive Sequence (Time Limit: 20 mins)

### Problem Statement
Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence. The algorithm must run in $O(N)$ time.

*   **Constraints**:
    *   $0 \le N \le 10^5$
    *   $-10^9 \le \text{nums}[i] \le 10^9$
*   **Sample Input**: `nums = [100, 4, 200, 1, 3, 2]` $\implies$ **Sample Output**: `4` (Sequence: `[1, 2, 3, 4]`)

### 💡 Hint
1. Insert all numbers into an unordered set.
2. Iterate through each number `num` in the set.
3. Check if `num - 1` is in the set. If it is NOT, then `num` is the starting point of a sequence.
4. Keep incrementing `num` by 1 and check if it exists in the set to count the length of the sequence. Track the maximum length found.

### 🛠️ Detailed Solution
```cpp
#include <iostream>
#include <vector>
#include <unordered_set>
#include <algorithm>

int longestConsecutive(const std::vector<int>& nums) {
    std::unordered_set<int> num_set(nums.begin(), nums.end());
    int longest_streak = 0;
    
    for (int num : num_set) {
        // Only start sequence if num is the beginning of the sequence
        if (!num_set.count(num - 1)) {
            int current_num = num;
            int current_streak = 1;
            
            while (num_set.count(current_num + 1)) {
                current_num++;
                current_streak++;
            }
            longest_streak = std::max(longest_streak, current_streak);
        }
    }
    return longest_streak;
}
```
*   **Time Complexity**: $O(N)$ — Although it contains a nested loop, each number is visited at most twice (once in the outer loop, once in the inner `while` sequence building).
*   **Space Complexity**: $O(N)$ — Auxiliary space to store array elements in the set.
