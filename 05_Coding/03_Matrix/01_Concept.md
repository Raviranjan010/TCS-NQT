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

## 3. Python Templates

### Template A: 2D Grid DFS / BFS Neighbor Search
```python
def traverse_grid_neighbors(grid: list[list[int]]) -> None:
    rows = len(grid)
    cols = len(grid[0]) if rows > 0 else 0
    visited = [[False] * cols for _ in range(rows)]
    
    # Directional vectors for 4-directional search (Up, Down, Left, Right)
    row_offsets = [-1, 1, 0, 0]
    col_offsets = [0, 0, -1, 1]
    
    def is_valid(r: int, c: int) -> bool:
        return 0 <= r < rows and 0 <= c < cols and not visited[r][c]
        
    def dfs(r: int, c: int) -> None:
        visited[r][c] = True
        # Visit all valid neighbors
        for i in range(4):
            next_row = r + row_offsets[i]
            next_col = c + col_offsets[i]
            if is_valid(next_row, next_col):
                dfs(next_row, next_col)
```

### Template B: In-place Matrix Transpose (for Square Matrices)
```python
def transpose_in_place(matrix: list[list[int]]) -> None:
    n = len(matrix)
    # Swap element at (r, c) with (c, r) for elements above the main diagonal
    for row in range(n):
        for col in range(row + 1, n):
            matrix[row][col], matrix[col][row] = matrix[col][row], matrix[row][col]
```

### Template C: Spiral Matrix Traversal
```python
def spiral_order(matrix: list[list[int]]) -> list[int]:
    if not matrix or not matrix[0]:
        return []
        
    top_boundary = 0
    bottom_boundary = len(matrix) - 1
    left_boundary = 0
    right_boundary = len(matrix[0]) - 1
    
    result = []
    
    while top_boundary <= bottom_boundary and left_boundary <= right_boundary:
        # 1. Left to Right
        for col in range(left_boundary, right_boundary + 1):
            result.append(matrix[top_boundary][col])
        top_boundary += 1
        
        # 2. Top to Bottom
        for row in range(top_boundary, bottom_boundary + 1):
            result.append(matrix[row][right_boundary])
        right_boundary -= 1
        
        # 3. Right to Left (only if boundaries haven't crossed)
        if top_boundary <= bottom_boundary:
            for col in range(right_boundary, left_boundary - 1, -1):
                result.append(matrix[bottom_boundary][col])
            bottom_boundary -= 1
            
        # 4. Bottom to Top (only if boundaries haven't crossed)
        if left_boundary <= right_boundary:
            for row in range(bottom_boundary, top_boundary - 1, -1):
                result.append(matrix[row][left_boundary])
            left_boundary += 1
            
    return result
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
