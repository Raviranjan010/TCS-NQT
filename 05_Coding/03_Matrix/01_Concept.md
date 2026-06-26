# Matrix & Grid Operations - Concept Guide

## 1. One-Line Intuition
> **Matrix = represent and navigate tabular data using row and column coordinates, often using nested loops or directional vectors.**

---

## 2. ASCII Trace: Spiral Matrix Traversal Boundary Shrinking
Consider a $3 \times 3$ matrix:
```text
[ 1, 2, 3 ]
[ 4, 5, 6 ]
[ 7, 8, 9 ]
```
We define four boundaries: `top = 0`, `bottom = 2`, `left = 0`, `right = 2`.

```text
Step 1: Traverse from left to right along the top boundary (top = 0).
        Elements: 1, 2, 3.
        Action: top++ (top becomes 1).
        Path: [1 -> 2 -> 3]

Step 2: Traverse from top to bottom along the right boundary (right = 2).
        Elements: 6, 9.
        Action: right-- (right becomes 1).
        Path: [1 -> 2 -> 3 -> 6 -> 9]

Step 3: Traverse from right to left along the bottom boundary (bottom = 2).
        Elements: 8, 7.
        Action: bottom-- (bottom becomes 1).
        Path: [1 -> 2 -> 3 -> 6 -> 9 -> 8 -> 7]

Step 4: Traverse from bottom to top along the left boundary (left = 0).
        Elements: 4.
        Action: left++ (left becomes 1).
        Path: [1 -> 2 -> 3 -> 6 -> 9 -> 8 -> 7 -> 4]

Step 5: Traverse from left to right along the top boundary (top = 1, bottom = 1, left = 1, right = 1).
        Elements: 5.
        Action: top++ (top becomes 2, breaking loop since top > bottom).
        Path: [1 -> 2 -> 3 -> 6 -> 9 -> 8 -> 7 -> 4 -> 5]
```

---

## 3. C++14 Templates

### Template A: 2D Grid DFS / BFS Neighbor Search
```cpp
#include <vector>

void dfs(int r, int c, const std::vector<std::vector<int>>& grid, 
         std::vector<std::vector<bool>>& visited, int rows, int cols) {
    visited[r][c] = true;
    
    // Direction offsets for 4-directional movement (Up, Down, Left, Right)
    int row_offsets[] = {-1, 1, 0, 0};
    int col_offsets[] = {0, 0, -1, 1};
    
    for (int i = 0; i < 4; i++) {
        int next_row = r + row_offsets[i];
        int next_col = c + col_offsets[i];
        
        // Boundary and visited check
        if (next_row >= 0 && next_row < rows && next_col >= 0 && next_col < cols 
            && !visited[next_row][next_col]) {
            dfs(next_row, next_col, grid, visited, rows, cols);
        }
    }
}

void traverseGridNeighbors(const std::vector<std::vector<int>>& grid) {
    int rows = grid.size();
    if (rows == 0) return;
    int cols = grid[0].size();
    std::vector<std::vector<bool>> visited(rows, std::vector<bool>(cols, false));
    
    for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
            if (!visited[r][c]) {
                dfs(r, c, grid, visited, rows, cols);
            }
        }
    }
}
```

### Template B: In-place Matrix Transpose (for Square Matrices)
```cpp
#include <vector>
#include <utility>

void transposeInPlace(std::vector<std::vector<int>>& matrix) {
    int n = matrix.size();
    for (int row = 0; row < n; row++) {
        for (int col = row + 1; col < n; col++) {
            std::swap(matrix[row][col], matrix[col][row]);
        }
    }
}
```

### Template C: Spiral Matrix Traversal
```cpp
#include <vector>

std::vector<int> spiralOrder(const std::vector<std::vector<int>>& matrix) {
    std::vector<int> result;
    if (matrix.empty() || matrix[0].empty()) return result;
    
    int top = 0;
    int bottom = matrix.size() - 1;
    int left = 0;
    int right = matrix[0].size() - 1;
    
    while (top <= bottom && left <= right) {
        // 1. Traverse left to right along top boundary
        for (int col = left; col <= right; col++) {
            result.push_back(matrix[top][col]);
        }
        top++;
        
        // 2. Traverse top to bottom along right boundary
        for (int row = top; row <= bottom; row++) {
            result.push_back(matrix[row][right]);
        }
        right--;
        
        // 3. Traverse right to left along bottom boundary
        if (top <= bottom) {
            for (int col = right; col >= left; col--) {
                result.push_back(matrix[bottom][col]);
            }
            bottom--;
        }
        
        // 4. Traverse bottom to top along left boundary
        if (left <= right) {
            for (int row = bottom; row >= top; row--) {
                result.push_back(matrix[row][left]);
            }
            left++;
        }
    }
    return result;
}
```


---

## 4. Recognition Patterns
**Use Matrix structures when you see:**
*   **Coordinate Space:** "Given a 2D grid...", "Given an $M \times N$ board...".
*   **Directional Movement:** "Move up, down, left, or right", "Rotate the image by 90 degrees", "Spiral traversal".
*   **Geographical/Connected Components:** "Islands", "Lakes", "Boundaries", "Flood fill".
*   **Adjacency Grids:** Elements having spatial constraints with their adjacent elements.

---

## 5. When Matrix Models Fail vs When They Work

### ❌ When Matrix Models Fail (Counter-Example: High Sparsity / Infinite Grids)
*   **Context:** Design a system to represent a grid of size $10^9 \times 10^9$ containing only $10^5$ active cells.
*   **Why Dense Matrix Fails:**
    *   Creating a dense 2D array `matrix[1000000000][1000000000]` requires $10^{18}$ bytes of memory, causing an immediate **OutOfMemoryError**.
*   **Reason for Failure:** Grids are highly inefficient when sparse. Storing rows/columns of zeros wastes memory.
*   **Correct Alternative:** Represent the grid using a **Hash Map** with tuples as keys: `active_cells = {(row, col): value}` or use a sparse coordinate format (list of triplets).

### Algorithm Comparison Table:
| Grid Representation | Dense 2D Array | Coordinate Map (Hashing) |
| :--- | :--- | :--- |
| **Lookup Time** | $O(1)$ | $O(1)$ average |
| **Memory Footprint** | $O(R \times C)$ | $O(\text{Active Cells})$ |
| **Iterating Neighbors** | $O(1)$ | $O(\text{Active Neighbors})$ |

---

## 6. TCS NQT-Style Problems

### Problem 1: Rotate Image 90 Degrees Clockwise
**Problem Statement:** Given an $N \times N$ 2D matrix representing an image, rotate the image by 90 degrees clockwise in-place.

#### 1. Brute Force Approach
*   **Concept:** Create a new matrix of the same size. Copy elements from row $i$, column $j$ of the original matrix to row $j$, column $N - 1 - i$ of the new matrix. Copy back.
*   **Complexity:** Time: $O(N^2)$, Space: $O(N^2)$ auxiliary space.

#### 2. In-Place Transpose & Reverse Optimization
*   **Concept:** First, transpose the matrix (swap `matrix[r][c]` with `matrix[c][r]` for $c > r$). Second, reverse each row. This achieves a 90-degree clockwise rotation in-place without extra space.
*   **C++ & Python Code Solutions:**

```python
# Python: Rotate Matrix 90 Degrees Clockwise
def rotate_matrix(matrix: list[list[int]]) -> None:
    n = len(matrix)
    
    # Step 1: Transpose the matrix
    for row in range(n):
        for col in range(row + 1, n):
            matrix[row][col], matrix[col][row] = matrix[col][row], matrix[row][col]
            
    # Step 2: Reverse each row
    for row in range(n):
        matrix[row].reverse()
```

```cpp
// C++: Rotate Matrix 90 Degrees Clockwise
#include <iostream>
#include <vector>
#include <algorithm>

void rotateMatrix(std::vector<std::vector<int>>& matrix) {
    int n = matrix.size();
    
    // Step 1: Transpose
    for (int r = 0; r < n; ++r) {
        for (int c = r + 1; c < n; ++c) {
            std::swap(matrix[r][c], matrix[c][r]);
        }
    }
    
    // Step 2: Reverse each row
    for (int r = 0; r < n; ++r) {
        std::reverse(matrix[r].begin(), matrix[r].end());
    }
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N^2)$ (each element is touched twice).
    *   **Space Complexity:** $O(1)$ auxiliary space.

---

### Problem 2: Island Count (Flood Fill / Connected Components)
**Problem Statement:** Given an $M \times N$ 2D binary grid representing a map of '1's (land) and '0's (water), return the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.

#### 1. Brute Force Approach
*   **Concept:** For each land square, run a search to trace the island, but save coordinates of visited land squares in a list. Check uniqueness by scanning the list.
*   **Complexity:** Time: $O((M \times N)^2)$ due to linear searches in the visited list.

#### 2. DFS / BFS Search Optimization
*   **Concept:** Iterate through all grid cells. When we hit an unvisited '1', increment the island count and trigger a DFS/BFS to sink the entire island (turn all connected '1's to '0's or mark them as visited).
*   **C++ & Python Code Solutions:**

```python
# Python: Island Count
def num_islands(grid: list[list[str]]) -> int:
    if not grid:
        return 0
        
    rows = len(grid)
    cols = len(grid[0])
    island_count = 0
    
    def dfs(r: int, c: int) -> None:
        # Base check: index out of bounds or water/visited cell
        if r < 0 or r >= rows or c < 0 or c >= cols or grid[r][c] == '0':
            return
            
        grid[r][c] = '0'  # Sink the land cell (marks as visited)
        
        # Recurse in 4 directions
        dfs(r - 1, c)
        dfs(r + 1, c)
        dfs(r, c - 1)
        dfs(r, c + 1)
        
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == '1':
                island_count += 1
                dfs(r, c)
                
    return island_count
```

```cpp
// C++: Island Count
#include <iostream>
#include <vector>

class IslandCounter {
private:
    void dfs(std::vector<std::vector<char>>& grid, int r, int c, int rows, int cols) {
        if (r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] == '0') {
            return;
        }
        
        grid[r][c] = '0'; // Mark as visited
        
        dfs(grid, r - 1, c, rows, cols);
        dfs(grid, r + 1, c, rows, cols);
        dfs(grid, r, c - 1, rows, cols);
        dfs(grid, r, c + 1, rows, cols);
    }

public:
    int numIslands(std::vector<std::vector<char>>& grid) {
        if (grid.empty()) return 0;
        int rows = grid.size();
        int cols = grid[0].size();
        int islandCount = 0;
        
        for (int r = 0; r < rows; ++r) {
            for (int c = 0; c < cols; ++c) {
                if (grid[r][c] == '1') {
                    islandCount++;
                    dfs(grid, r, c, rows, cols);
                }
            }
        }
        return islandCount;
    }
};
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(M \times N)$ (each grid square is visited at most constant times).
    *   **Space Complexity:** $O(M \times N)$ worst case recursion stack depth if the grid is all land.
