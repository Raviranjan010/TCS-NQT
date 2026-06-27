# Top Coding Patterns and Abstractions

## Arrays Patterns
## Pattern 1 — Kadane's Algorithm (Maximum Subarray)

**Problem:** Find the contiguous subarray with the largest sum.

**Core idea:** At each position, decide: is it better to extend the current subarray, or start fresh from this element?

```cpp
#include <vector>
#include <algorithm>

int maxSubArray(const std::vector<int>& nums) {
    int maxSum = nums[0], currentSum = nums[0];
    for (size_t i = 1; i < nums.size(); ++i) {
        currentSum = std::max(nums[i], currentSum + nums[i]);
        maxSum = std::max(maxSum, currentSum);
    }
    return maxSum;
}
```

**Why it works:** `currentSum + nums[i]` extends the subarray. `nums[i]` alone starts fresh. We keep whichever is larger — this is optimal by induction.

**Variants:**
- Maximum product subarray: track both max and min (negatives flip sign)
- Circular maximum subarray: max(Kadane's result, total_sum − Kadane's on negated array)

## Pattern 2 — Prefix Sum

**Problem:** Answer multiple range-sum queries efficiently.

**Core idea:** Build an auxiliary array where `prefix[i] = nums[0] + nums[1] + ... + nums[i-1]`.
Then sum of range [l, r] = `prefix[r+1] - prefix[l]` in O(1).

```cpp
std::vector<int> prefix(n + 1, 0);
for (int i = 0; i < n; ++i) {
    prefix[i + 1] = prefix[i] + nums[i];
}
// Sum from index l to r (0-indexed, inclusive):
int rangeSum = prefix[r + 1] - prefix[l];
```

**TCS use case:** Subarray sum equals K — use `std::unordered_map` of prefix sums to count in O(n).

```cpp
#include <unordered_map>

int subarraySum(const std::vector<int>& nums, int k) {
    std::unordered_map<int, int> prefix_map;
    prefix_map[0] = 1;
    int sum = 0, count = 0;
    for (int num : nums) {
        sum += num;
        if (prefix_map.count(sum - k)) {
            count += prefix_map[sum - k];
        }
        prefix_map[sum]++;
    }
    return count;
}
```

## Strings Patterns
## HashMap Patterns
## Searching Patterns
## Sorting Patterns
## Easy Patterns
## Stack Patterns
## LinkedList Patterns
## Matrix Patterns
