# Hashing Techniques - Revision Notes

Review these 10 core points before entering the exam hall.

---

## ⚡ Top 10 Revision Points for Hashing

1.  **Fundamental Intuition**: Hashing maps arbitrary keys to bucket indices, enabling $O(1)$ average time complexity for insertion, deletion, and lookup.
2.  **C++ STL Containers**:
    *   `std::unordered_map` / `std::unordered_set`: Based on Hash Tables. $O(1)$ average, $O(N)$ worst-case.
    *   `std::map` / `std::set`: Based on Red-Black Trees. $O(\log N)$ guaranteed time complexity.
3.  **Load Factor ($\alpha$)**: Defined as $\alpha = n / m$. It represents average bucket density. In open addressing, keep $\alpha < 0.7$ to prevent severe primary clustering.
4.  **Prefix Sum + Hashing**: The ultimate tool for subarray sum queries (e.g. subarray sum equals $K$). Running prefix sum $S_j$ checks for complement $S_j - K$ in the hash map.
5.  **Zero-Sum Reduction Trick**: Convert equal-frequency binary string problems (like equal 0s and 1s) by mapping `0` to `-1` and finding a subarray with sum `0`.
6.  **Sliding Window rolling updates**: Slide a window of size $K$ in $O(1)$ time by decrementing outgoing element frequencies and incrementing incoming frequencies, avoiding rebuilds.
7.  **Direct Access Table (DAT)**: If keys are bounded (like ASCII characters or range $[0, 10^5]$), use raw arrays `int freq[256]` to bypass map overhead and prevent compiler TLE.
8.  **Palindrome Permutation rule**: A string can be rearranged into a palindrome if and only if at most one character has an odd frequency (XOR bitmask $\text{mask} \ \& \ (\text{mask}-1) == 0$).
9.  **Worst-Case Degradation**: Unordered map operations degrade to $O(N)$ during hash collision attacks. Avoid this by using custom hashers with runtime random seeds.
10. **Composite Keys**: `std::unordered_map` cannot hash `std::pair` or `std::vector` by default in C++. Provide a custom hash functor or use `std::map`.
