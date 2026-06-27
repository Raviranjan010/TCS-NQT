# Hashing Techniques - FAQ

These Frequently Asked Questions address common queries about hashing, C++ libraries, and platform compiler behavior on the TCS NQT exam.

---

## ❓ Frequently Asked Questions

### 1. Does the TCS NQT compiler support C++11, C++14, or C++17?
*   **Answer**: Yes. The TCS NQT coding compiler supports standard C++ compilers (like GCC) and typically compiles with C++14 or C++17 flags. Features like `std::unordered_map` (C++11), `std::unordered_set` (C++11), and structured bindings (C++17) are fully supported.

### 2. Can I use header files like `<bits/stdc++.h>` on the platform?
*   **Answer**: Yes, `<bits/stdc++.h>` is supported on the GCC-based compiler used by TCS. While using this header imports all standard libraries (including `<unordered_map>`, `<vector>`, `<algorithm>`), it can increase compilation time. It is safer and cleaner to explicitly include required headers:
    ```cpp
    #include <iostream>
    #include <vector>
    #include <unordered_map>
    ```

### 3. How do I avoid "Memory Limit Exceeded" (MLE) errors when using hash maps?
*   **Answer**: Hash maps use more memory than raw arrays due to dynamic allocation of nodes for buckets and chains. To prevent MLE:
    - Avoid storing redundant information in your map.
    - If the input key range is small (e.g., $0 \le \text{val} \le 10^5$), use `std::vector<int>` or a raw array instead of `std::unordered_map`.
    - Call `map.clear()` to free up memory if you are processing multiple test cases in a loop.

### 4. Why does my $O(N)$ hash map solution TLE on large arrays?
*   **Answer**: This can happen due to three reasons:
    1.  **Hash Collisions**: High collision rates degrade lookups to $O(N)$. Resolve this by using a custom hasher with a random seed.
    2.  **Frequent Rehashing**: If the map grows dynamically from 1 to $10^5$, it rehashes multiple times. Prevent this by reserving the size upfront: `map.reserve(100000)`.
    3.  **IO Bottleneck**: If your program prints a lot of output, add `std::ios_base::sync_with_stdio(false); std::cin.tie(NULL);` at the start of `main()` to optimize C++ standard streams.

### 5. If `unordered_map` is faster on average, why would I ever use `std::map` in the exam?
*   **Answer**: You should use `std::map` (ordered) in two specific scenarios during the NQT:
    - When the problem explicitly requires you to process keys in sorted order.
    - When you need to find elements within a range (e.g., finding the smallest element greater than or equal to $X$, which can be done in $O(\log N)$ using `map::lower_bound`).
