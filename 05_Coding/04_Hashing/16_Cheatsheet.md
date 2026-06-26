# Hashing Techniques - Cheatsheet

A quick-reference guide for C++ STL hashing containers, time complexities, and standard code templates.

---

## 1. C++ STL Hashing Container Reference

| Container | Under the Hood | Lookup / Insert (Avg) | Lookup / Insert (Worst) | Key Constraints | Ordered? |
| :--- | :--- | :---: | :---: | :--- | :---: |
| `std::unordered_map<K, V>` | Hash Table (Chaining) | $O(1)$ | $O(N)$ | Needs hash function & `==` | No |
| `std::unordered_set<K>` | Hash Table (Chaining) | $O(1)$ | $O(N)$ | Needs hash function & `==` | No |
| `std::map<K, V>` | Red-Black Tree (BST) | $O(\log N)$ | $O(\log N)$ | Needs `operator<` | Yes |
| `std::set<K>` | Red-Black Tree (BST) | $O(\log N)$ | $O(\log N)$ | Needs `operator<` | Yes |

---

## 2. Common API Operations Cheat-Sheet

```cpp
#include <unordered_map>
#include <unordered_set>

void demonstrateAPI() {
    // 1. Initializing Containers
    std::unordered_map<std::string, int> myMap;
    std::unordered_set<int> mySet;

    // 2. Insertions
    myMap["apple"] = 10;
    myMap.insert({"banana", 20});
    mySet.insert(42);

    // 3. Search / Lookups
    if (myMap.count("apple")) {
        // "apple" exists
        int val = myMap["apple"];
    }
    
    auto it = mySet.find(42);
    if (it != mySet.end()) {
        // 42 exists in set
    }

    // 4. Deletions
    myMap.erase("apple");
    mySet.erase(42);

    // 5. Size Queries
    size_t mapSize = myMap.size();
    bool isSetEmpty = mySet.empty();

    // 6. Clear all elements
    myMap.clear();
    mySet.clear();
}
```

---

## 3. High-Frequency Syntax Snippets

### Frequency Counter (DAT)
```cpp
// For lowercase English characters 'a'-'z'
int freq[26] = {0};
for (char c : str) {
    freq[c - 'a']++;
}
```

### Safe Custom Hash for `std::unordered_map`
```cpp
#include <chrono>
struct SafeHash {
    size_t operator()(uint64_t x) const {
        static const uint64_t RANDOM = std::chrono::steady_clock::now().time_since_epoch().count();
        x ^= RANDOM;
        return std::hash<uint64_t>{}((x ^ (x >> 30)) * 0xbf58476d1ce4e5b9);
    }
};
std::unordered_map<int, int, SafeHash> safeMap;
```
