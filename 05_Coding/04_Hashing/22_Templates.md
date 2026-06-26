# Hashing Techniques - Compilable Templates

These complete C++17 programs serve as boilerplate templates for common hashing designs. Copy and run them directly in your compiler.

---

## 📄 Template 1: Prefix Sum + Frequency Map (Subarray Sum equals K)

This program counts the number of contiguous subarrays that sum to a given value $K$.

```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

// Counts subarrays summing to target K
int subarraySum(const std::vector<int>& nums, int k) {
    std::unordered_map<int, int> prefix_counts;
    prefix_counts[0] = 1; // Base case: prefix sum 0 occurs once
    
    int current_sum = 0;
    int count = 0;
    
    for (int num : nums) {
        current_sum += num;
        
        // If (current_sum - k) is found, add its count to the result
        if (prefix_counts.count(current_sum - k)) {
            count += prefix_counts[current_sum - k];
        }
        
        prefix_counts[current_sum]++;
    }
    return count;
}

int main() {
    std::vector<int> nums = {3, 4, 7, 2, -3, 1, 4, 2};
    int k = 7;
    
    int result = subarraySum(nums, k);
    std::cout << "Total subarrays with sum " << k << " = " << result << std::endl;
    // Expected Output: 4 (Subarrays: [7], [3,4], [2,-3,1,4,2], [1,4,2])
    
    return 0;
}
```

---

## 📄 Template 2: Custom Hash for `std::pair` in Unordered Containers

This program demonstrates how to map coordinates (represented as `std::pair<int, int>`) using a custom hash functor.

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
        // Combine hashes securely
        return h1 ^ (h2 + 0x9e3779b9 + (h1 << 6) + (h1 >> 2));
    }
};

int main() {
    // Declaring unordered_map with PairHash
    std::unordered_map<std::pair<int, int>, std::string, PairHash> grid;
    
    grid[{0, 0}] = "Start Node";
    grid[{1, 2}] = "Obstacle Node";
    grid[{5, 5}] = "End Node";
    
    std::pair<int, int> query = {1, 2};
    if (grid.count(query)) {
        std::cout << "Node at (1,2) is: " << grid[query] << std::endl;
    }
    
    return 0;
}
```

---

## 📄 Template 3: Sliding Window Distinct Elements Counter

This program counts the number of distinct elements in every sliding window of size $K$.

```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

std::vector<int> countDistinct(const std::vector<int>& arr, int k) {
    std::vector<int> result;
    if (arr.empty() || k > arr.size()) return result;
    
    std::unordered_map<int, int> window_counts;
    
    // Step 1: Initialize first window
    for (int i = 0; i < k; ++i) {
        window_counts[arr[i]]++;
    }
    result.push_back(window_counts.size());
    
    // Step 2: Slide the window
    for (int i = k; i < arr.size(); ++i) {
        int outgoing = arr[i - k];
        int incoming = arr[i];
        
        // Remove/Decrement outgoing element
        window_counts[outgoing]--;
        if (window_counts[outgoing] == 0) {
            window_counts.erase(outgoing);
        }
        
        // Add incoming element
        window_counts[incoming]++;
        
        result.push_back(window_counts.size());
    }
    return result;
}

int main() {
    std::vector<int> arr = {1, 2, 1, 3, 4, 2, 3};
    int k = 4;
    
    std::vector<int> result = countDistinct(arr, k);
    
    std::cout << "Distinct counts in windows: ";
    for (int val : result) {
        std::cout << val << " ";
    }
    std::cout << std::endl;
    // Expected Output: 3 4 4 3
    
    return 0;
}
```
