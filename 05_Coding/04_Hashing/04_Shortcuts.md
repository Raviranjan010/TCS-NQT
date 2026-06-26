# Hashing Techniques - Shortcuts & Speed Hacks

These shortcuts are designed to help you write faster-executing code and optimize memory usage during the 90-minute TCS NQT coding round.

---

## ⚡ Shortcut 1: Direct Access Table (DAT) instead of `std::unordered_map`

### Logic
If the range of keys $[Min, Max]$ is small and dense (e.g., lowercase English alphabets $[0, 25]$, ASCII characters $[0, 255]$, or integers in range $[0, 10^5]$), use a flat `std::vector<int>` or raw array initialized to zero. 
Avoid `std::unordered_map`, which carries significant overhead due to hash calculations, bucket chain traversals, and dynamic memory allocations.

### Real Number Demo
*   **Problem**: Find the frequency of characters in a string of length $N = 10^6$.
*   **Approach A (Generic)**: Use `std::unordered_map<char, int>`. Each insertion/update computes a hash code, finds the bucket index, and handles potential collision chains.
*   **Approach B (Shortcut DAT)**: Use `int freq[256] = {0}`. For each character `c`, directly increment `freq[c]`.
*   **Performance Comparison**:
    *   `unordered_map`: Runs in $\approx 85 \text{ ms}$ due to hashing overhead.
    *   `DAT array`: Runs in $\approx 4 \text{ ms}$ (20x speedup). This prevents Time Limit Exceeded (TLE) on large inputs.

---

## ⚡ Shortcut 2: Bitmask Parity Hashing for Palindromic Permutations

### Logic
To check if a string's characters can be rearranged to form a palindrome, at most one character can have an odd frequency. Instead of storing character counts in a map, use a single 32-bit integer `mask` as a set of toggles. 
The $i$-th bit of `mask` represents whether the $(i)$-th alphabet has an odd count. We toggle the bit using the XOR operator:
$$\text{mask} = \text{mask} \oplus (1 \ll \text{char\_index})$$
At the end, check if the mask has at most one bit set by validating if $\text{mask} \ \& \ (\text{mask} - 1) == 0$.

### Step-by-Step Derivation
If a number has exactly one bit set (e.g., $8 = 1000_2$), subtracting 1 flips all bits up to that bit ($7 = 0111_2$). Performing bitwise AND results in 0:
$$1000_2 \ \& \ 0111_2 = 0000_2$$
If the number has multiple bits set (e.g., $10 = 1010_2$), subtracting 1 yields $9 = 1001_2$. Performing bitwise AND leaves other set bits intact:
$$1010_2 \ \& \ 1001_2 = 1000_2 \neq 0$$

### Real Character Demo
*   **String**: `"aabbc"`
*   **Dry Run**:
    *   Initialize `mask = 0` (binary `00000`).
    *   Char `'a'` (index 0): `mask ^= (1 << 0) = 1` (binary `00001`)
    *   Char `'a'` (index 0): `mask ^= (1 << 0) = 0` (binary `00000`)
    *   Char `'b'` (index 1): `mask ^= (1 << 1) = 2` (binary `00010`)
    *   Char `'b'` (index 1): `mask ^= (1 << 1) = 0` (binary `00000`)
    *   Char `'c'` (index 2): `mask ^= (1 << 2) = 4` (binary `00100`)
*   **Verification**:
    $$\text{mask} \ \& \ (\text{mask} - 1) \implies 4 \ \& \ (4 - 1) \implies 4 \ \& \ 3 \implies 0100_2 \ \& \ 0011_2 = 0$$
    Since the result is $0$, the string can form a palindrome. Space complexity is $O(1)$ and time is $O(N)$ with near-zero constant factor.

---

## ⚡ Shortcut 3: Rolling Window State Updates (Sliding Window)

### Logic
When analyzing all subarrays of size $K$ in an array of size $N$, do not rebuild a hash map for each window from scratch. Rebuilding takes $O(N \cdot K)$ time. 
Instead, initialize the map for the first window. Then, slide the window by subtracting the outgoing element's frequency and adding the incoming element's frequency. This reduces the transition to $O(1)$ per step, yielding $O(N)$ total time.

### Real Number Demo
*   **Array**: `[4, 1, 1, 2]`, window size $K = 3$.
*   **Step 1 (First Window: `[4, 1, 1]`)**:
    *   `freq[4] = 1`, `freq[1] = 2`. Distinct elements count = $2$.
*   **Step 2 (Slide Window to `[1, 1, 2]`)**:
    *   Outgoing element at index 0 is `4`. Decrement `freq[4]`. Since `freq[4]` becomes $0$, erase `4` from map.
    *   Incoming element at index 3 is `2`. Increment `freq[2]` $\implies$ `freq[2] = 1`.
    *   Updated map: `freq[1] = 2`, `freq[2] = 1`. Distinct elements count = $2$.
*   **Time Savings**: Rebuilding the map for $N = 10^5, K = 10^4$ would require $10^9$ operations. The rolling update requires $2 \times 10^5$ operations, rendering it $5000\times$ faster.
