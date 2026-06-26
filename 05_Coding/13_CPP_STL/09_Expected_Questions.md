# C++ STL - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on C++ Standard Template Library (STL).

---

## 1. STL-01: Vector Operations & Memory Resizing

*   **Problem Statement**: Write a program to demonstrate vector operations (`push_back`, dynamic resizing, `capacity` vs `size`, and clearing elements). Trace capacity increments.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   *Sample Input*: Insert numbers $1 \dots 5$ $\implies$ *Sample Output*: `size=5 capacity=8` (varies by compiler)

### Approach Comparison
| Feature | `std::vector` | `std::list` | `std::deque` |
| :--- | :--- | :--- | :--- |
| **Structure** | Contiguous array | Doubly linked list | Block of chunks |
| **Lookup** | $O(1)$ | $O(N)$ | $O(1)$ |
| **End Insertion** | $O(1)$ amortized | $O(1)$ | $O(1)$ |
| **Memory** | Contiguous (low overhead) | Nodes (high pointers overhead) | Segmented |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

void traceVectorResizing() {
    std::vector<int> vec;
    
    for (int i = 1; i <= 5; i++) {
        vec.push_back(i);
        std::cout << "Element=" << i 
                  << " Size=" << vec.size() 
                  << " Capacity=" << vec.capacity() << "\n";
    }
}
```

### Dry Run Table (Typical GCC Compiler)
Input: Push elements $1 \dots 5$.

| Push Element | `size` after push | `capacity` before | `capacity` after | Description |
| :---: | :---: | :---: | :---: | :--- |
| 1 | 1 | 0 | 1 | Allocates space for 1 element. |
| 2 | 2 | 1 | 2 | Double capacity to 2. |
| 3 | 3 | 2 | 4 | Double capacity to 4. |
| 4 | 4 | 4 | 4 | No resize needed. |
| 5 | 5 | 4 | 8 | Double capacity to 8. |

### Complexity Analysis
*   **Time Complexity**: $O(1)$ amortized per `push_back`. The copy operation on resize takes $O(N)$, but since it happens exponentially infrequently, the amortized cost per push is constant.
*   **Space Complexity**: $O(N)$ — Dynamic array size scales with element count.

### Shortcut & Math Derivation
*   **Derivation**: Why double the capacity? If we grow capacity by a constant amount $C$ (e.g. 10 elements):
    Total copy work for $N$ pushes is:
    $$\sum_{i=1}^{N/C} i \cdot C \approx O(N^2) \implies O(N) \text{ average per push.}$$
    If we grow capacity by doubling (multiplier 2), the sum of copy work is:
    $$\sum_{i=0}^{\log N} 2^i \approx 2N \implies O(1) \text{ average per push (amortized).}$$
*   **Real Number Demo**: Resizing to 8 capacity covers pushes 5, 6, 7, 8 without any copying.

### Variation & Trap
*   **Trap**: Not calling `reserve` when number of elements is known beforehand. This causes multiple unnecessary reallocations and copies.
*   **Variation**: Deallocating memory. `vec.clear()` sets size to 0, but does *not* reduce capacity. Use `vec.shrink_to_fit()` or swap with empty vector to free memory.

---

## 2. STL-02: Map vs Unordered Map

*   **Problem Statement**: Compare `std::map` and `std::unordered_map` operations under search, insertion, and sorting constraints.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   *Sample Input*: Insert `{"banana": 2, "apple": 5, "cherry": 3}` $\implies$ *Sample Output (Ordered Map Keys)*: `apple banana cherry`

### Approach Comparison
| Feature | `std::map` | `std::unordered_map` |
| :--- | :--- | :--- |
| **Underlying Data Structure** | Self-balancing Red-Black Tree | Hash Table |
| **Search / Insertion Time** | $O(\log N)$ | $O(1)$ average, $O(N)$ worst case |
| **Element Order** | Sorted by key | Unordered |
| **Iterator Direction** | Bidirectional | Forward |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <string>
#include <map>
#include <unordered_map>

void demonstrateMaps() {
    // 1. Sorted Map
    std::map<std::string, int> ordered_map;
    ordered_map["banana"] = 2;
    ordered_map["apple"] = 5;
    ordered_map["cherry"] = 3;
    
    // Prints: apple banana cherry (sorted)
    for (const auto& pair : ordered_map) {
        std::cout << pair.first << " -> " << pair.second << "\n";
    }
    
    // 2. Unordered Map (faster lookups)
    std::unordered_map<std::string, int> unordered_map;
    unordered_map["banana"] = 2;
    unordered_map["apple"] = 5;
    unordered_map["cherry"] = 3;
}
```

### Dry Run Table (Lookup steps)
Looking up key `"apple"` in both maps containing $N$ elements.

| Step | `std::map` Action | `std::unordered_map` Action |
| :---: | :--- | :--- |
| 1 | Compare `"apple"` with root key `"banana"`. | Calculate hash of `"apple"`. |
| 2 | `"apple" < "banana"` $\implies$ move to left child. | Map hash to bucket index. |
| 3 | Compare with `"apple"`. Match found! | Check bucket list. Match found! |
| **Complexity** | $O(\log N)$ steps | $O(1)$ step |

### Complexity Analysis
*   **Time Complexity**:
    *   `std::map`: $O(\log N)$ for find/insert/delete.
    *   `std::unordered_map`: $O(1)$ average, $O(N)$ worst case (due to hash collisions).
*   **Space Complexity**: $O(N)$ to store nodes and pointers.

### Shortcut & Math Derivation
*   **Derivation**: A Red-Black Tree is a balanced binary tree, meaning its height $H$ satisfies $H \le 2 \log_2(N + 1)$. This guarantees search path length is bounded by $\log N$.
*   **Real Number Demo**: For $N = 1000$ elements, `std::map` takes at most $\approx 20$ comparisons. `std::unordered_map` hashes key to an array index and performs lookup in 1 step.

### Variation & Trap
*   **Trap**: Using custom structs as keys in `std::unordered_map` without providing custom hash functions. For `std::map`, you only need to overload the `<` operator.
*   **Variation**: Multimaps (`std::multimap` and `std::unordered_multimap`) allowing duplicate keys.

---

## 3. STL-03: Stack, Queue, and Deque Boundaries

*   **Problem Statement**: Show insertion/deletion at boundaries for Stack, Queue, and Deque. Explain Deque's advantages over vectors for front insertion.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   *Sample Input*: Push elements $1 \dots 3$ $\implies$ *Sample Output (Deque front/back push)*: `front=9 back=3`

### Approach Comparison
| Operation | `std::vector` | `std::deque` | `std::list` |
| :--- | :--- | :--- | :--- |
| **push_back** | $O(1)$ amortized | $O(1)$ | $O(1)$ |
| **push_front** | $O(N)$ (requires shifting) | $O(1)$ | $O(1)$ |
| **Random Access**| $O(1)$ | $O(1)$ | $O(N)$ |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <deque>
#include <stack>
#include <queue>

void demonstrateAdapters() {
    // 1. Deque operations
    std::deque<int> dq;
    dq.push_back(10);
    dq.push_front(20);
    dq.pop_back();
    dq.pop_front();
    
    // 2. Stack (LIFO - uses deque internally by default)
    std::stack<int> st;
    st.push(5);
    st.pop();
    
    // 3. Queue (FIFO - uses deque internally by default)
    std::queue<int> q;
    q.push(8);
    q.pop();
}
```

### Dry Run Table (Front Insert in Deque vs Vector)
Inserting element `9` at the front of a sequence `[1, 2, 3]`.

| Step | Vector Action | Deque Action |
| :---: | :--- | :--- |
| 1 | Allocate new space (if capacity exceeded). | Allocate new block chunk (if current block is full). |
| 2 | Shift `3` to index 3, `2` to index 2, `1` to index 1. | Place `9` directly in the previous slot of block. |
| 3 | Write `9` at index 0. | No element shifts required! |
| **Complexity**| $O(N)$ operations | $O(1)$ operation |

### Complexity Analysis
*   **Time Complexity**: $O(1)$ for Stack, Queue, and Deque insert/delete boundaries.
*   **Space Complexity**: $O(N)$ to store elements.

### Shortcut & Math Derivation
*   **Derivation**: A Deque (double-ended queue) uses a map of pointers to fixed-size blocks. Since blocks are preallocated, inserting at the front simply writes to the next empty index in the first block. If the first block is full, a new block is allocated and its address is prepended to the pointer map. This avoids shifting elements.
*   **Real Number Demo**: With block size 4, inserting 8 elements at the front allocates 2 blocks. Elements write in $O(1)$ steps without any copy loops.

### Variation & Trap
*   **Trap**: Attempting random access on `std::stack` or `std::queue`. They are container adapters that restrict access to top/front/back. Use `std::deque` if random access `[]` is needed.
*   **Variation**: Stack implemented with vector: `std::stack<int, std::vector<int>> st;`.

---

## 4. STL-04: Custom Comparators for Priority Queues

*   **Problem Statement**: Implement a Min-Heap and a custom priority queue that stores elements (ID, Priority) and processes them in order of highest priority (smallest priority number) first.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   *Sample Input*: `{1, 50}`, `{2, 10}`, `{3, 30}` $\implies$ *Sample Output*: `Processed ID=2 priority=10`

### Approach Comparison
| Type | Default Comparator | Top Element | Implementation |
| :--- | :--- | :--- | :--- |
| **Max-Heap (Default)** | `std::less<T>` | Largest element | `std::priority_queue<int>` |
| **Min-Heap** | `std::greater<T>` | Smallest element | `std::priority_queue<int, vector<int>, greater<int>>` |
| **Custom Heap** | User-defined struct | Custom rule matching | `std::priority_queue<T, vector<T>, CustomStruct>` |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <queue>
#include <vector>

struct Task {
    int id;
    int priority;
};

// Custom comparator struct for min-heap
struct CompareTask {
    bool operator()(const Task& a, const Task& b) {
        // True means 'a' has lower priority than 'b', so 'b' goes to top
        // This creates a Min-Heap based on priority values
        return a.priority > b.priority;
    }
};

void runCustomPriorityQueue() {
    std::priority_queue<Task, std::vector<Task>, CompareTask> pq;
    
    pq.push({101, 5});
    pq.push({102, 1});
    pq.push({103, 3});
    
    while (!pq.empty()) {
        Task t = pq.top();
        std::cout << "Task ID=" << t.id << " Priority=" << t.priority << "\n";
        pq.pop();
    }
}
```

### Dry Run Table
Pushes: `{101, 5}`, `{102, 1}`, `{103, 3}`.

| Operation | Heap Array State (Task ID: Priority) | `top()` Element | Description |
| :---: | :--- | :---: | :--- |
| Push `{101, 5}` | `[{101: 5}]` | `{101: 5}` | Initial heap root. |
| Push `{102, 1}` | `[{102: 1}, {101: 5}]` | `{102: 1}` | Heapify up: swap root since $5 > 1$. |
| Push `{103, 3}` | `[{102: 1}, {101: 5}, {103: 3}]` | `{102: 1}` | Heapify up: $5 > 3$ swap. |
| Pop | `[{103: 3}, {101: 5}]` | `{103: 3}` | Move last element to root, heapify down. |

### Complexity Analysis
*   **Time Complexity**: $O(\log N)$ for `push()` and `pop()`; $O(1)$ for `top()`.
*   **Space Complexity**: $O(N)$ to store elements in the heap array.

### Shortcut & Math Derivation
*   **Derivation**: A binary heap of size $N$ is represented as a complete binary tree. Height is bounded by $\log_2 N$. When inserting, we place the element at the bottom-right leaf and bubble it up (at most $\log N$ swaps). When popping, we swap root with last leaf, delete last, and bubble root down (at most $\log N$ swaps).
*   **Real Number Demo**: With 7 elements, height is $\log_2 7 = 2$. Insertion does at most 2 swaps.

### Variation & Trap
*   **Trap**: The comparator logic in priority queue is reversed compared to `std::sort`.
    *   In `std::sort`, returning `a.val < b.val` sorts ascending.
    *   In `std::priority_queue`, returning `a.val > b.val` puts the smallest element on top (Min-Heap). Remember: `operator()` returning `true` means $a$ has lower priority than $b$, shifting $a$ down.
*   **Variation**: Sorting a stream of numbers using a running Min-Heap of size $K$ to find the Kth largest element in $O(\log K)$ per number.
