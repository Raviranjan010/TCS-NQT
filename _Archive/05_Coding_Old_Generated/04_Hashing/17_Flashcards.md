# Hashing Techniques - Flashcards

Use these active-recall flashcards to test your knowledge of hash tables, collisions, complexities, and standard library behaviors.

---

## 🎴 Flashcards List

### Card 1: What is a hash collision?
*   **Answer**: A collision occurs when two distinct keys yield the identical bucket index after hashing:
    $$\text{Hash}(K_1) \pmod m == \text{Hash}(K_2) \pmod m \quad (\text{where } K_1 \neq K_2)$$
    It requires a resolution technique like chaining or open addressing to store both items.

---

### Card 2: What is the load factor ($\alpha$), and what is its threshold for open addressing?
*   **Answer**: The load factor is $\alpha = n / m$ (number of elements divided by table capacity). For open addressing, $\alpha$ should remain $< 0.70$. Beyond this, clustering becomes severe, significantly increasing search probe counts.

---

### Card 3: What is the worst-case time complexity of `std::unordered_map` and how does it happen?
*   **Answer**: The worst-case is $O(N)$ for lookup, insertion, and deletion. It happens when all elements hash to the same bucket (e.g. hash collisions), transforming the hash table into a single linked list.

---

### Card 4: Why cannot `std::pair<int, int>` be used as a key in `std::unordered_map` directly?
*   **Answer**: C++ does not provide a default specialization of `std::hash` for `std::pair` in the `<utility>` or `<unordered_map>` header. You must write a custom hash functor or use a sorted `std::map`.

---

### Card 5: How does prefix sum hashing detect a subarray that sums to $K$?
*   **Answer**: If a subarray between indices $i+1$ and $j$ sums to $K$, then:
    $$S_j - S_i = K \implies S_i = S_j - K$$
    At each index $j$, we check if $S_j - K$ is in our prefix sum map. If it is, the subarray exists.

---

### Card 6: When is Two Pointers / Sliding Window preferred over Hash Maps for subarray sum queries?
*   **Answer**: When the input array contains **only non-negative numbers**. Two pointers can solve this in $O(N)$ time with $O(1)$ space, whereas Hash Maps require $O(N)$ space.

---

### Card 7: What is the difference in lookup time between `std::map` and `std::unordered_map`?
*   **Answer**:
    *   `std::map`: $O(\log N)$ guaranteed (using Red-Black Tree).
    *   `std::unordered_map`: $O(1)$ average, $O(N)$ worst-case (using Hash Table).

---

### Card 8: How does the bitmask palindrome check shortcut work?
*   **Answer**: Since at most one character count can be odd in a palindrome, we use an integer mask and toggle the $i$-th bit for each character. If $\text{mask} \ \& \ (\text{mask}-1) == 0$, the mask has $\le 1$ bit set, verifying a valid palindrome permutation.
