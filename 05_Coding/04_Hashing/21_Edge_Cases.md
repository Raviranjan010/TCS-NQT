# Hashing Techniques - Boundary Edge Cases

Ensure your hashing solutions handle these critical edge cases, which frequently appear in TCS NQT test suites to verify code resilience.

---

## 🚨 Checklist of Critical Edge Cases

### 1. Modulo Arithmetic with Negative Numbers
In C++14/17, the `%` operator maintains the sign of the numerator:
$$-7 \pmod 5 = -2$$
If you are tracking remainders using a frequency map, negative remainders will not match positive ones.
*   **Corrective Action**: Always normalize remainders to be strictly non-negative:
    ```cpp
    int rem = current_sum % k;
    if (rem < 0) rem += k;
    ```

---

### 2. Running Sum Integer Overflow
If the array contains $N = 10^5$ elements, each up to $10^9$, the prefix sum can reach $10^{14}$, which exceeds the maximum limit of a standard 32-bit signed integer (`INT_MAX` $\approx 2.14 \times 10^9$). This triggers integer overflow and causes map lookup errors.
*   **Corrective Action**: Use `long long` for prefix sums:
    ```cpp
    long long current_sum = 0;
    std::unordered_map<long long, int> prefix_map;
    ```

---

### 3. Duplicate Elements in Two Sum
If the target is $6$ and the array is `[3, 2, 4]`, when inspecting the element `3` at index 0, the complement is $6 - 3 = 3$. If we check the map for `3`, we must ensure we do not match the element with its own index.
*   **Corrective Action**: Verify index uniqueness or insert the current element into the map *after* checking for the complement:
    ```cpp
    int complement = target - nums[i];
    if (visited.count(complement)) {
        return {visited[complement], i};
    }
    visited[nums[i]] = i; // Insert after checking
    ```

---

### 4. Sliding Window Size Larger than Array Length
If the window size $K = 5$ but the array size $N = 3$, accessing elements up to $K-1$ will cause an out-of-bounds compilation or runtime segmentation fault.
*   **Corrective Action**: Add a check at the beginning of the function:
    ```cpp
    if (k > nums.size()) {
        return {}; // Or appropriate fallback/error code
    }
    ```

---

### 5. Array of Size 1 (Single Element)
If $N = 1$, check how your loops behave. For prefix sums, make sure the loop runs once and checks correctly. For subset checks, make sure you don't access unallocated elements.

---

### 6. Empty Input ($N = 0$)
Always check if the input is empty at the entry point of the function to avoid undefined behaviors:
```cpp
if (nums.empty()) {
    return 0; // Or appropriate empty container
}
```
