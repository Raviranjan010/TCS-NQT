# TCS NQT 2026 — Medium Coding Guide (C++)
### Advanced Algorithms · Exam: June 28, 2026

> **Section Stats:** 1 Question · 55 Minutes · No Negative Marking
> 
> **TCS Compiler Rule:** Compile and save before submitting. Use `long long` for accumulators to prevent overflow.

---

## 🗺️ DP State Transition Grid ASCII Visualization

```
    For Grid problem, Cell [r][c] updates from its neighbors:
    
            [r-1][c] (Up)
               |
    [r][c-1] -> [r][c] (Current)
    (Left)
    
    Formula: dp[r][c] = min(dp[r-1][c], dp[r][c-1]) + grid[r][c]
```

---

# PART A: Core Medium Solutions

---

## 1. Minimum Cost Path in Grid

* **What is this?** Finding the path from top-left to bottom-right that minimizes the sum of traversed cell values.
* **Why does TCS ask this?** Tests standard 2D Dynamic Programming states.
* **Complexity**: Time Complexity: $O(M \times N)$, Space Complexity: $O(M \times N)$.
* **Edge Cases**: Single cell ($1 \times 1$), thin grids ($1 \times N$ or $M \times 1$), negative cell values.
* **C++ Solution**:
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int minPathSum(vector<vector<int>>& grid) {
    if (grid.empty() || grid[0].empty()) return 0;
    int m = grid.size();
    int n = grid[0].size();
    vector<vector<int>> dp(m, vector<int>(n, 1e9));
    dp[0][0] = grid[0][0];
    
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (i > 0) dp[i][j] = min(dp[i][j], dp[i-1][j] + grid[i][j]);
            if (j > 0) dp[i][j] = min(dp[i][j], dp[i][j-1] + grid[i][j]);
        }
    }
    return dp[m-1][n-1];
}

int main() {
    vector<vector<int>> grid = {{1, 3, 1}, {1, 5, 1}, {4, 2, 1}};
    cout << minPathSum(grid) << endl; // Output: 7 (Path: 1 -> 3 -> 1 -> 1 -> 1)
    return 0;
}
```

* **Dry Run Trace Table**: For input grid `[[1, 3], [1, 5]]`.
  * Initial: `dp[0][0] = 1`.
  * For $i=0, j=1$: `dp[0][1] = min(1e9, dp[0][0] + grid[0][1]) = 1 + 3 = 4`.
  * For $i=1, j=0$: `dp[1][0] = min(1e9, dp[0][0] + grid[1][0]) = 1 + 1 = 2`.
  * For $i=1, j=1$: `dp[1][1] = min(dp[0][1] + 5, dp[1][0] + 5) = min(4 + 5, 2 + 5) = 7`.
  * Return 7. Correct!

---

## 2. Task Scheduler with Cooldown

* **What is this?** Scheduling tasks on a CPU where identical tasks must be separated by at least $N$ cycles.
* **Why does TCS ask this?** Tests Greedy priority queue sorting and queue-based cooldown delays.
* **Complexity**: Time Complexity: $O(T \log A)$ (where $T$ is tasks count and $A$ is alphabet size), Space Complexity: $O(A)$.
* **Edge Cases**: Cooldown $N = 0$, all tasks unique, all tasks identical.
* **C++ Solution**:
```cpp
#include <iostream>
#include <vector>
#include <unordered_map>
#include <queue>

using namespace std;

int leastInterval(vector<char>& tasks, int n) {
    unordered_map<char, int> counts;
    for (char t : tasks) counts[t]++;
    priority_queue<int> max_heap;
    for (auto p : counts) max_heap.push(p.second);
    
    int time = 0;
    queue<pair<int, int>> cooldown; // {time_available, remaining_count}
    
    while (!max_heap.empty() || !cooldown.empty()) {
        time++;
        if (!max_heap.empty()) {
            int cnt = max_heap.top() - 1;
            max_heap.pop();
            if (cnt > 0) {
                cooldown.push({time + n, cnt});
            }
        }
        if (!cooldown.empty() && cooldown.front().first == time) {
            max_heap.push(cooldown.front().second);
            cooldown.pop();
        }
    }
    return time;
}

int main() {
    vector<char> tasks = {'A', 'A', 'A', 'B', 'B', 'B'};
    int n = 2;
    cout << leastInterval(tasks, n) << endl; // Output: 8 (A -> B -> idle -> A -> B -> idle -> A -> B)
    return 0;
}
```

---

# PART B: Practice Questions

---

## 3. Guided Practice Questions

**Q1.** Find the minimum row/column swaps to move the maximum element of an $N \times N$ matrix to the center.
* **Hint**: Calculate the Manhattan distance from the coordinates of the maximum element to the center `(N/2, N/2)`.
* **C++ Code**:
```cpp
#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

using namespace std;

int main() {
    int n = 3;
    vector<vector<int>> matrix = {{1, 2, 3}, {4, 9, 6}, {7, 8, 5}};
    int center = n / 2; // 1
    // 9 is at row 1, col 1 (already at center). Distance = |1 - 1| + |1 - 1| = 0.
    int max_val = -1e9;
    int best_dist = 1e9;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (matrix[i][j] > max_val) {
                max_val = matrix[i][j];
                best_dist = abs(i - center) + abs(j - center);
            }
        }
    }
    cout << best_dist << endl; // Output: 0
    return 0;
}
```
* **Complexity**: Time Complexity: $O(N^2)$, Space Complexity: $O(1)$.
