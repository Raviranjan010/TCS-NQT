# Recursion & Backtracking - Brute Force Solution

## Description
The naive approach uses nested loops to check all possible combinations.

## C++ Implementation
```cpp
#include <iostream>
#include <vector>

using namespace std;

// Time Complexity: O(N^2)
// Space Complexity: O(1)
void solveBruteForce(const vector<int>& arr) {
    for (size_t i = 0; i < arr.size(); ++i) {
        for (size_t j = i + 1; j < arr.size(); ++j) {
            // Naive comparison
        }
    }
}
```
