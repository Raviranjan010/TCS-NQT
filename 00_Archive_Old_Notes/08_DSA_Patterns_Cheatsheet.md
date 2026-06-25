# TCS NQT 2026 — DSA C++ Cheatsheet
### Quick-Reference C++11 Coding Templates · Exam: June 28, 2026

---

## 🗺️ DSA Pattern Selector

```
                         What is the primary problem goal?
                                         |
             +---------------------------+---------------------------+
             |                                                       |
             v                                                       v
     Optimize Search?                                        Graph Traversal?
             |                                                       |
     +-------+-------+                                       +-------+-------+
     |               |                                       |               |
     v               v                                       v               v
Sorted Array?   Subset/Sum?                                Shortest Path?  Connected?
Binary Search   DP / Sliding Window                        BFS (Queue)     DSU / DFS
```

---

# SECTION 1: C++ STL Standard Templates

---

## 1. Binary Search Boilerplate

* **Complexity**: Time Complexity: $O(\log N)$, Space Complexity: $O(1)$.
* **Edge Cases**: Empty array, single element, target out of bounds, duplicate targets.
* **C++ Code**:
```cpp
#include <vector>
using namespace std;

int binarySearch(vector<int>& arr, int target) {
    int low = 0, high = arr.size() - 1;
    while (low <= high) {
        int mid = low + (high - low) / 2;
        if (arr[mid] == target) return mid;
        else if (arr[mid] < target) low = mid + 1;
        else high = mid - 1;
    }
    return -1;
}
```

---

## 2. Sliding Window (Fixed Size)

* **Complexity**: Time Complexity: $O(N)$, Space Complexity: $O(1)$.
* **Edge Cases**: Array size smaller than $K$, $K \le 0$, large values causing sum overflow.
* **C++ Code**:
```cpp
#include <vector>
#include <algorithm>
using namespace std;

int maxSubarraySum(vector<int>& arr, int k) {
    int n = arr.size();
    if (n < k) return 0;
    int curr_sum = 0;
    for (int i = 0; i < k; i++) curr_sum += arr[i];
    int max_sum = curr_sum;
    for (int i = k; i < n; i++) {
        curr_sum += arr[i] - arr[i-k];
        max_sum = max(max_sum, curr_sum);
    }
    return max_sum;
}
```

---

## 3. Disjoint Set Union (DSU)

* **Complexity**: Time Complexity: $O(\alpha(N))$ (nearly $O(1)$ per operation), Space Complexity: $O(N)$.
* **Edge Cases**: Single-node graphs, self-loops, disjoint components.
* **C++ Code**:
```cpp
#include <vector>
#include <numeric>
using namespace std;

class DSU {
    vector<int> parent, rank;
public:
    DSU(int n) {
        parent.resize(n);
        iota(parent.begin(), parent.end(), 0);
        rank.resize(n, 0);
    }
    
    int find(int i) {
        if (parent[i] == i) return i;
        return parent[i] = find(parent[i]); // Path compression
    }
    
    void unite(int i, int j) {
        int root_i = find(i);
        int root_j = find(j);
        if (root_i != root_j) {
            if (rank[root_i] < rank[root_j]) parent[root_i] = root_j;
            else if (rank[root_i] > rank[root_j]) parent[root_j] = root_i;
            else {
                parent[root_j] = root_i;
                rank[root_i]++;
            }
        }
    }
};
```
