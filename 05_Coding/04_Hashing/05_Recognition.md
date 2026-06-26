# Hashing Techniques - Pattern Recognition Guide

Use this chart to instantly map keywords in TCS NQT coding questions to the optimal hashing technique, data structure, and C++ template.

---

## Hashing Pattern Recognition Chart

| If the Question Says (Keywords) | Immediate Algorithmic Technique | Target C++ Structure | Time & Space Complexity | Example Question |
| :--- | :--- | :--- | :---: | :--- |
| **"Find a pair that sums to $T$"** | Search complement ($T - \text{current}$) in visited elements. | `std::unordered_map<int, int>` (val $\to$ index) | Time: $O(N)$<br>Space: $O(N)$ | [Two Sum] |
| **"Check for duplicate elements"** | Insert into set. If element exists, duplicate found. | `std::unordered_set<int>` | Time: $O(N)$<br>Space: $O(N)$ | [Contains Duplicate] |
| **"First non-repeating character"** or **"Anagram match"** | Two-pass frequency count. First pass counts, second checks. | `std::vector<int> freq(256)` (for ASCII) | Time: $O(N)$<br>Space: $O(1)$ | [First Unique Character] |
| **"Subarray sum equals $K$"** | Prefix sum lookup: search for $(\text{running\_sum} - K)$ in map. | `std::unordered_map<int, int>` (sum $\to$ freq) | Time: $O(N)$<br>Space: $O(N)$ | [Subarray Sum Equals K] |
| **"Longest subarray with sum $K$"** | Prefix sum index lookup: store earliest index of prefix sum. | `std::unordered_map<int, int>` (sum $\to$ first_idx) | Time: $O(N)$<br>Space: $O(N)$ | [Longest Subarray with Sum K] |
| **"Subarray sum divisible by $K$"** | Modulo prefix sum lookup: search for $(\text{running\_sum} \pmod K + K) \pmod K$ in map. | `std::unordered_map<int, int>` (mod $\to$ freq) | Time: $O(N)$<br>Space: $O(N)$ | [Subarray Sums Divisible by K] |
| **"Distinct elements in each window of size $W$"** | Sliding window: increment incoming element count, decrement outgoing element count. | `std::unordered_map<int, int>` | Time: $O(N)$<br>Space: $O(W)$ | [Distinct Elements in Window] |
| **"Find elements with frequency $> N/3$"** | Frequency counting or Boyer-Moore Voting (if space must be $O(1)$). | `std::unordered_map<int, int>` | Time: $O(N)$<br>Space: $O(N)$ | [Majority Element II] |

---

## 💡 Pro-Tip for TCS NQT:
When the keyword **"contiguous subarray"** is paired with any sum constraint, **Prefix Sum + Hashing** is almost always the required approach if negative numbers are allowed. If only positive numbers are present, **Two Pointers (Sliding Window)** is more optimal since it uses $O(1)$ space.
