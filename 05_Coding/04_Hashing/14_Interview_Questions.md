# Hashing Techniques - Interview Questions & Answers

This sheet contains the top 5 technical interview questions on Hashing asked by TCS panel interviewers, along with detailed, production-quality answers and code snippets.

---

## 🙋 Question 1: What is the difference between `std::map` and `std::unordered_map` in C++?

### Answer
The primary differences lie in their underlying data structures, time complexities, memory usage, and ordering of elements:

| Feature | `std::map` | `std::unordered_map` |
| :--- | :--- | :--- |
| **Underlying Structure** | Self-Balancing Binary Search Tree (usually Red-Black Tree). | Hash Table (using bucket array with chaining). |
| **Time Complexity** | $O(\log N)$ for search, insert, and delete. | $O(1)$ average; $O(N)$ worst-case for search, insert, delete. |
| **Space Complexity** | $O(N)$ (lower memory overhead per node than hash buckets). | $O(N)$ (higher overhead due to table sizing and bucket chains). |
| **Key Ordering** | Elements are stored in strictly sorted order. | Elements are stored in arbitrary/unordered order. |
| **Requirements** | Key must support `operator<` (less-than comparison). | Key must support `std::hash` and `operator==` (equality). |

### Choice Criteria
*   Choose `std::unordered_map` when you need **fastest possible lookups/inserts** (average $O(1)$) and order does not matter.
*   Choose `std::map` when you require **sorted traversal** of keys, range-based queries (e.g., finding the closest element greater than $X$ using `lower_bound`), or when memory footprint must be minimized.

---

## 🙋 Question 2: What are Hash Collisions, and how do we resolve them?

### Answer
A **Hash Collision** occurs when two distinct keys produce the same hash code and map to the identical bucket index in the hash table:
$$\text{Hash}(K_1) \pmod m = \text{Hash}(K_2) \pmod m \quad (\text{where } K_1 \neq K_2)$$

### Collision Resolution Techniques

#### 1. Chaining (Open Hashing)
Each slot in the bucket array points to a linked list of records that hash to the same value.
*   **Pros**: Simple insertion, table size does not limit element count.
*   **Cons**: Extra pointer overhead, poor cache locality.

#### 2. Open Addressing (Closed Hashing)
All elements are stored directly inside the bucket array itself. If a collision occurs, we probe for the next empty slot using a probe sequence:
*   **Linear Probing**: Probe index $i$ sequentially:
    $$h(k, i) = (h'(k) + i) \pmod m$$
    *(Suffers from primary clustering)*
*   **Quadratic Probing**: Probe index using a quadratic offset:
    $$h(k, i) = (h'(k) + c_1 i + c_2 i^2) \pmod m$$
    *(Reduces primary clustering, but can lead to secondary clustering)*
*   **Double Hashing**: Probe index using a second hash function as the step size:
    $$h(k, i) = (h_1(k) + i \cdot h_2(k)) \pmod m$$
    *(Virtually eliminates clustering)*

---

## 🙋 Question 3: Explain the concept of "Rehashing". When is it triggered and what is its complexity?

### Answer
**Rehashing** is the process of doubling the size of the underlying bucket array in a hash table and re-mapping all existing elements to new bucket indices based on the expanded capacity.

### Trigger Condition
It is triggered when the load factor $\alpha = n / m$ exceeds a predefined threshold (in C++'s standard library, `max_load_factor()` defaults to $1.0$, though many implementations rehash when $\alpha \ge 0.75$).

### Complexity Analysis
*   **Single Rehash**: $O(N)$ time, where $N$ is the number of elements. Every element must be rehashed using the new table size and inserted into the new bucket array.
*   **Amortized Complexity**: Although a single rehashing step takes $O(N)$, it occurs infrequently (only after $O(N)$ insertions). Thus, when averaged over all insertions, the cost added per insertion is $O(1)$. This maintains the $O(1)$ amortized insertion complexity.

---

## 🙋 Question 4: How can we use custom structures (like `std::pair<int, int>`) as keys in `std::unordered_map`?

### Answer
In C++, the standard template library (`std::hash`) does not provide hash functions for composite types like `std::pair` or `std::vector`. To use them as keys in `std::unordered_map`, you must supply a custom hash functor that combines the hashes of the constituent members, and ensure the type has equality comparison `operator==`.

### C++17 Implementation
```cpp
#include <iostream>
#include <unordered_map>
#include <utility>

// Custom hash structure for std::pair
struct PairHash {
    template <class T1, class T2>
    std::size_t operator () (const std::pair<T1, T2> &p) const {
        auto h1 = std::hash<T1>{}(p.first);
        auto h2 = std::hash<T2>{}(p.second);
        // Combine hashes using a bitwise combination and prime offset
        return h1 ^ (h2 + 0x9e3779b9 + (h1 << 6) + (h1 >> 2));
    }
};

int main() {
    // Map with custom PairHash
    std::unordered_map<std::pair<int, int>, int, PairHash> grid;
    grid[{1, 2}] = 100;
    
    std::cout << "Value at (1,2): " << grid[{1, 2}] << std::endl;
    return 0;
}
```

---

## 🙋 Question 5: What is a "Hash Collision Attack" (Hash Flooding), and how do we prevent it in C++?

### Answer
A **Hash Collision Attack** occurs when an external attacker sends a carefully crafted set of inputs designed to map to the exact same hash bucket in the hash table. 

### Impact
This forces the hash map lookup and insertion complexity to degrade from average $O(1)$ to worst-case $O(N)$. For an input of size $N = 10^5$, this causes operations to jump from $10^5$ to $10^{10}$ cycles, causing the server to hang or trigger a TLE in competitive tests.

### Prevention
1.  **Custom Random Seed**: Introduce a randomized prefix offset at runtime so that the hash value of a key cannot be predicted before execution starts.
2.  **Use `std::map`**: If the test suite is known to contain anti-hash test cases, fallback to `std::map`. It uses a Red-Black tree and guarantees $O(N \log N)$ worst-case execution time for all operations.
