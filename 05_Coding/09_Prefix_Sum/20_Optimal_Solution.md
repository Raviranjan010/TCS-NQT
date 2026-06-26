# Prefix Sum - Optimal Solution

## Description
The optimal approach reduces the time complexity to $O(N)$ using hashing or two pointers.

## C++ Implementation
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>

using namespace std;

// Time Complexity: O(N)
// Space Complexity: O(N)
void solveOptimal(const vector<int>& arr) {
    unordered_map<int, int> mp;
    for (int x : arr) {
        mp[x]++;
    }
}
```
