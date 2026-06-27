# Hashing Techniques - Common Mistakes & Traps

This guide highlights the top technical mistakes candidates make when using hashing in C++ under TCS NQT exam conditions, along with side-by-side bad vs. good code examples.

---

## 🚫 Mistake 1: Deterministic Hash Collision TLE in `std::unordered_map`

### Trap
C++’s default hash function for integers in `std::unordered_map` is the identity function (`hash(x) = x`). Test cases in competitive exams are often specifically designed with elements that have identical hashes modulo the bucket size (e.g., multiples of a large power of 2 like $10^5$ or prime spacing). This forces all elements into a single bucket, collapsing lookup/insert time from $O(1)$ to $O(N)$, resulting in a Time Limit Exceeded (TLE) error.

### Code Comparison

#### ❌ Bad Code (Vulnerable to TLE)
```cpp
#include <unordered_map>
#include <vector>

int countElements(const std::vector<int>& nums) {
    // Default hashing is deterministic and vulnerable to custom anti-hash test cases
    std::unordered_map<int, int> counts;
    for (int num : nums) {
        counts[num]++;
    }
    return counts.size();
}
```

####  Good Code (Safe from Hash Collisions)
```cpp
#include <unordered_map>
#include <vector>
#include <chrono>

// Custom high-performance, collision-resistant hash function
struct SafeHash {
    static uint64_t splitmix64(uint64_t x) {
        x += 0x9e3779b97f4a7c15;
        x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9;
        x = (x ^ (x >> 27)) * 0x94d049bb133111eb;
        return x ^ (x >> 31);
    }

    size_t operator()(uint64_t x) const {
        static const uint64_t FIXED_RANDOM = std::chrono::steady_clock::now().time_since_epoch().count();
        return splitmix64(x + FIXED_RANDOM);
    }
};

int countElementsSafe(const std::vector<int>& nums) {
    // Reserves space to avoid rehashing, uses randomized custom hash function
    std::unordered_map<int, int, SafeHash> counts;
    counts.reserve(nums.size()); 
    for (int num : nums) {
        counts[num]++;
    }
    return counts.size();
}
```

---

## 🚫 Mistake 2: Missing Base Case for Prefix Sums in Subarray Sum Equals K

### Trap
When finding subarrays that sum to $K$, the algorithm calculates a running prefix sum $S_j$ and searches for $S_j - K$ in the map. If a subarray starting at index 0 sums to $K$, then $S_j - K = 0$. If we have not initialized the map with a base case for sum $0$, this subarray will not be counted, leading to an incorrect result.

### Code Comparison

#### ❌ Bad Code (Misses prefix subarrays)
```cpp
#include <unordered_map>
#include <vector>

int subarraySum(const std::vector<int>& nums, int k) {
    std::unordered_map<int, int> prefix_counts;
    int current_sum = 0, count = 0;
    
    for (int num : nums) {
        current_sum += num;
        // If current_sum == k, it is NOT counted if prefix_counts[0] is not set!
        if (prefix_counts.count(current_sum - k)) {
            count += prefix_counts[current_sum - k];
        }
        prefix_counts[current_sum]++;
    }
    return count;
}
```

####  Good Code (Correctly initialized base case)
```cpp
#include <unordered_map>
#include <vector>

int subarraySumCorrect(const std::vector<int>& nums, int k) {
    std::unordered_map<int, int> prefix_counts;
    // CRITICAL: Initialize prefix sum 0 with frequency 1
    prefix_counts[0] = 1; 
    
    int current_sum = 0, count = 0;
    for (int num : nums) {
        current_sum += num;
        if (prefix_counts.count(current_sum - k)) {
            count += prefix_counts[current_sum - k];
        }
        prefix_counts[current_sum]++;
    }
    return count;
}
```

---

## 🚫 Mistake 3: Compilation Error when using `std::pair` in `std::unordered_map`

### Trap
In C++, there is no default hash function provided in `std::hash` for `std::pair<T1, T2>`. Trying to compile `std::unordered_map<std::pair<int, int>, int>` results in a massive compiler error.

### Code Comparison

#### ❌ Bad Code (Will NOT Compile)
```cpp
#include <unordered_map>
#include <utility>

void storeCoordinates() {
    // COMPILER ERROR: std::hash is not defined for std::pair
    std::unordered_map<std::pair<int, int>, int> coord_map; 
    coord_map[{1, 2}] = 5; 
}
```

####  Good Code (Using custom pair hasher or std::map)
```cpp
#include <unordered_map>
#include <map>
#include <utility>

// Solution A: Provide a custom hash function for the pair
struct PairHash {
    template <class T1, class T2>
    std::size_t operator () (const std::pair<T1, T2> &p) const {
        auto h1 = std::hash<T1>{}(p.first);
        auto h2 = std::hash<T2>{}(p.second);
        // XOR hash values combined with a prime seed to avoid collisions
        return h1 ^ (h2 + 0x9e3779b9 + (h1 << 6) + (h1 >> 2));
    }
};

void storeCoordinatesCorrect() {
    // Works! Uses custom hash
    std::unordered_map<std::pair<int, int>, int, PairHash> coord_map_unordered;
    coord_map_unordered[{1, 2}] = 5;

    // Alternative Solution B: Use std::map (which uses operator< which IS defined for pairs)
    // Time complexity changes from O(1) average to O(log N)
    std::map<std::pair<int, int>, int> coord_map_ordered;
    coord_map_ordered[{1, 2}] = 5;
}
```
