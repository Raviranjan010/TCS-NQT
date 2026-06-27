# Hashing Techniques - Optimal Solution Blueprints

These blueprints represent the gold-standard C++17 templates for high-frequency hashing patterns. Copy and adapt these structures to speed up your coding.

---

## 🗂️ Template 1: General Frequency Counting (Dynamic Keys)

*   **Best Used For**: Frequency count of elements with large ranges or unknown strings.
*   **Time Complexity**: $O(N)$
*   **Space Complexity**: $O(N)$

```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

void solveFrequencyCounting(const std::vector<int>& arr) {
    std::unordered_map<int, int> freq_map;
    
    // Step 1: Populate frequencies
    for (int num : arr) {
        freq_map[num]++;
    }
    
    // Step 2: Iterate and process
    for (const auto& [key, value] : freq_map) {
        // Do work, e.g., std::cout << key << " occurs " << value << " times\n";
    }
}
```

---

## 🗂️ Template 2: Index Lookup Mapping (Two Sum Pattern)

*   **Best Used For**: Checking complements or previous indices of elements.
*   **Time Complexity**: $O(N)$
*   **Space Complexity**: $O(N)$

```cpp
#include <vector>
#include <unordered_map>

std::pair<int, int> solveTwoSum(const std::vector<int>& arr, int target) {
    std::unordered_map<int, int> val_to_idx; // Maps: element_value -> index
    
    for (int i = 0; i < arr.size(); ++i) {
        int complement = target - arr[i];
        
        // Check if complement exists in visited map
        if (val_to_idx.count(complement)) {
            return {val_to_idx[complement], i};
        }
        
        // Store current element index
        val_to_idx[arr[i]] = i;
    }
    return {-1, -1}; // Not found
}
```

---

## 🗂️ Template 3: Prefix Sum Tracking (Subarray Sum equals K Pattern)

*   **Best Used For**: Finding count/length of contiguous subarrays summing to $K$.
*   **Time Complexity**: $O(N)$
*   **Space Complexity**: $O(N)$

```cpp
#include <vector>
#include <unordered_map>
#include <algorithm>

int solveSubarraySum(const std::vector<int>& arr, int k) {
    std::unordered_map<int, int> prefix_counts;
    prefix_counts[0] = 1; // CRITICAL: Base case prefix sum 0 occurs once
    
    int running_sum = 0;
    int subarray_count = 0;
    
    for (int num : arr) {
        running_sum += num;
        
        // Check for complement (running_sum - k)
        if (prefix_counts.count(running_sum - k)) {
            subarray_count += prefix_counts[running_sum - k];
        }
        
        // Save running sum frequency
        prefix_counts[running_sum]++;
    }
    return subarray_count;
}
```

---

## 🗂️ Template 4: Sliding Window State Tracking

*   **Best Used For**: Continuous window calculations where elements enter and leave dynamically.
*   **Time Complexity**: $O(N)$
*   **Space Complexity**: $O(W)$ (where $W$ is the window size)

```cpp
#include <vector>
#include <unordered_map>

void solveSlidingWindow(const std::vector<int>& arr, int w) {
    std::unordered_map<int, int> window_map;
    
    // Step 1: Initialize the first window
    for (int i = 0; i < w; ++i) {
        window_map[arr[i]]++;
    }
    // Process first window state here
    
    // Step 2: Slide the window from index w to N-1
    for (int i = w; i < arr.size(); ++i) {
        int outgoing = arr[i - w];
        int incoming = arr[i];
        
        // Remove/Decrement outgoing element
        window_map[outgoing]--;
        if (window_map[outgoing] == 0) {
            window_map.erase(outgoing);
        }
        
        // Add/Increment incoming element
        window_map[incoming]++;
        
        // Process current window state here
    }
}
```
