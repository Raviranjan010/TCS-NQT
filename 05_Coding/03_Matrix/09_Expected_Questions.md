# Matrix - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Matrix Operations.

---

## 1. MAT-01: Spiral Matrix Traversal

*   **Problem Statement**: Given an $M \times N$ matrix, return all elements of the matrix in spiral order (outer boundary to inner).
*   **Constraints**:
    *   $1 \le M, N \le 200$
    *   $-100 \le \text{matrix}[i][j] \le 100$
    *   *Sample Input*: `[[1, 2, 3], [4, 5, 6], [7, 8, 9]]` $\implies$ *Sample Output*: `1 2 3 6 9 8 7 4 5`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force / Simulation** | Track visited cells and rotate direction when hitting boundaries or visited cells. | $O(M \times N)$ | $O(M \times N)$ | Extra space for visited grid. |
| **Optimal Boundary Shrinking** | Maintain 4 pointers (`top`, `bottom`, `left`, `right`) and shrink them after each side traversal. | $O(M \times N)$ | $O(1)$ | No extra memory, highly optimal. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>

std::vector<int> spiralOrder(const std::vector<std::vector<int>>& matrix) {
    std::vector<int> result;
    if (matrix.empty() || matrix[0].empty()) return result;
    
    int top = 0;
    int bottom = matrix.size() - 1;
    int left = 0;
    int right = matrix[0].size() - 1;
    
    while (top <= bottom && left <= right) {
        // Left to Right
        for (int col = left; col <= right; col++) {
            result.push_back(matrix[top][col]);
        }
        top++;
        
        // Top to Bottom
        for (int row = top; row <= bottom; row++) {
            result.push_back(matrix[row][right]);
        }
        right--;
        
        // Right to Left
        if (top <= bottom) {
            for (int col = right; col >= left; col--) {
                result.push_back(matrix[bottom][col]);
            }
            bottom--;
        }
        
        // Bottom to Top
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

### Dry Run Table
Input: `[[1, 2, 3], [4, 5, 6], [7, 8, 9]]` (top=0, bottom=2, left=0, right=2)

| Iteration | Boundary Action | Elements Visited | Updated Boundaries |
| :---: | :--- | :--- | :--- |
| 1 | Left to Right | `1, 2, 3` | `top` becomes 1 |
| 2 | Top to Bottom | `6, 9` | `right` becomes 1 |
| 3 | Right to Left | `8, 7` | `bottom` becomes 1 |
| 4 | Bottom to Top | `4` | `left` becomes 1 |
| 5 | Left to Right | `5` | `top` becomes 2 (Loop breaks since top > bottom) |

### Complexity Analysis
*   **Time Complexity**: $O(M \times N)$ — Each cell in the matrix is visited exactly once.
*   **Space Complexity**: $O(1)$ — No auxiliary storage is used except for the output vector.

### Shortcut & Math Derivation
*   **Derivation**: By maintaining four pointers, we systematically partition the matrix into concentric rectangular rings. Each ring traversal reduces the coordinate boundaries: `top++` after scanning row `top`, `right--` after scanning col `right`, `bottom--` after scanning row `bottom`, and `left++` after scanning col `left`.
*   **Real Number Demo**: With a $3 \times 3$ grid, the outermost boundaries are $[0, 2] \times [0, 2]$. Traversing row 0 changes the boundary to $[1, 2] \times [0, 2]$. This prevents revisits without any storage overhead.

### Variation & Trap
*   **Trap**: For non-square matrices (e.g. $1 \times 5$), the inner loops for scanning right-to-left and bottom-to-top must be guarded with conditions `top <= bottom` and `left <= right` to avoid duplicate prints.
*   **Variation**: Printing in anti-spiral order. This can be solved by storing the spiral result and reversing it.

---

## 2. MAT-02: Rotate Matrix 90 Degrees In-Place

*   **Problem Statement**: Rotate an $N \times N$ 2D matrix 90 degrees clockwise in-place.
*   **Constraints**:
    *   $1 \le N \le 500$
    *   $-1000 \le \text{matrix}[i][j] \le 1000$
    *   *Sample Input*: `[[1, 2], [3, 4]]` $\implies$ *Sample Output*: `[[3, 1], [4, 2]]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Auxiliary Grid** | Copy cell $(r, c)$ to $(c, N - 1 - r)$ of a new matrix. | $O(N^2)$ | $O(N^2)$ | Simple, but uses extra memory. |
| **Optimal Transpose & Reverse** | Transpose in-place, then reverse each row. | $O(N^2)$ | $O(1)$ | Standard in-place rotation method. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

void rotate90Clockwise(std::vector<std::vector<int>>& matrix) {
    int n = matrix.size();
    
    // Step 1: Transpose the matrix (swap matrix[i][j] with matrix[j][i])
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            std::swap(matrix[i][j], matrix[j][i]);
        }
    }
    
    // Step 2: Reverse each row
    for (int i = 0; i < n; i++) {
        std::reverse(matrix[i].begin(), matrix[i].end());
    }
}
```

### Dry Run Table
Input: `[[1, 2], [3, 4]]`

| Phase | Matrix State | Description |
| :--- | :--- | :--- |
| Initial | `[[1, 2], [3, 4]]` | Given matrix. |
| Transpose | `[[1, 3], [2, 4]]` | Swapped (0, 1) and (1, 0). |
| Reverse Row 0 | `[[3, 1], [2, 4]]` | Row 0 reversed. |
| Reverse Row 1 | `[[3, 1], [4, 2]]` | Row 1 reversed. Final state. |

### Complexity Analysis
*   **Time Complexity**: $O(N^2)$ — Transpose takes $O(N^2/2)$ operations and row reversal takes $O(N^2/2)$ operations.
*   **Space Complexity**: $O(1)$ — In-place swap requires only local variables.

### Shortcut & Math Derivation
*   **Derivation**: Rotating 90 degrees clockwise maps $(r, c) \rightarrow (c, N - 1 - r)$.
    *   Transpose maps: $(r, c) \rightarrow (c, r)$.
    *   Reversing columns (row-wise) maps: $(c, r) \rightarrow (c, N - 1 - r)$.
    *   Combining these two actions yields the exact transformation mapping: $(r, c) \rightarrow (c, N - 1 - r)$.
*   **Real Number Demo**: Item `2` at index `(0, 1)` should go to `(1, 1)` for $N=2$. Transpose maps it to `(1, 0)`. Reversing row `1` maps it to `(1, 1)`.

### Variation & Trap
*   **Trap**: Attempting transpose with full loops `for (int j = 0; j < n; j++)` which swaps items back to their original position. Ensure inner loop starts at `j = i + 1`.
*   **Variation**: Rotate 90 degrees anti-clockwise. Solution: Transpose then reverse columns (row-wise) *vertically* (reverse rows themselves, or reverse each column). Alternatively: Reverse each row first, then transpose.

---

## 3. MAT-03: Search in a 2D Matrix (Sorted Grid)

*   **Problem Statement**: Write an efficient algorithm to search for a target value in an $M \times N$ matrix where integers in each row are sorted from left to right, and the first integer of each row is greater than the last integer of the previous row.
*   **Constraints**:
    *   $1 \le M, N \le 1000$
    *   $-10^4 \le \text{target}, \text{matrix}[i][j] \le 10^4$
    *   *Sample Input*: `[[1, 3, 5], [10, 11, 16], [23, 30, 34]]`, target = `3` $\implies$ *Sample Output*: `true`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Search** | Scan all cells row by row. | $O(M \times N)$ | $O(1)$ | Slowest, ignores sorted properties. |
| **Optimal Binary Search** | Treat matrix as a 1D array of size $M \times N$ and perform Binary Search. | $O(\log(M \times N))$ | $O(1)$ | Fastest, leverages sorting completely. |

### Optimal C++14 Solution
```cpp
#include <vector>

bool searchMatrix(const std::vector<std::vector<int>>& matrix, int target) {
    if (matrix.empty() || matrix[0].empty()) return false;
    
    int m = matrix.size();
    int n = matrix[0].size();
    int low = 0;
    int high = m * n - 1;
    
    while (low <= high) {
        int mid = low + (high - low) / 2;
        // Map 1D index back to 2D coordinates
        int mid_val = matrix[mid / n][mid % n];
        
        if (mid_val == target) {
            return true;
        } else if (mid_val < target) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return false;
}
```

### Dry Run Table
Input: Matrix `[[1, 3, 5], [10, 11, 16]]`, Target = `11`. $M=2, N=3$. `low = 0`, `high = 5`.

| Step | `low` | `high` | `mid` | `mid / n` (row) | `mid % n` (col) | `matrix[row][col]` | Action |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| 1 | 0 | 5 | 2 | 0 | 2 | 5 | $5 < 11 \implies \text{low} = 3$ |
| 2 | 3 | 5 | 4 | 1 | 1 | 11 | $11 == 11 \implies \text{return true}$ |

### Complexity Analysis
*   **Time Complexity**: $O(\log(M \times N))$ — Standard binary search over a range of size $M \times N$.
*   **Space Complexity**: $O(1)$ — Only a few index pointers are maintained.

### Shortcut & Math Derivation
*   **Derivation**: A cell with 1D index $I$ in an $M \times N$ matrix maps to 2D indices:
    *   $\text{row} = I \div N$ (integer division)
    *   $\text{col} = I \pmod N$
*   **Real Number Demo**: In a grid with $N = 3$, index $4$ gives $\text{row} = 4 \div 3 = 1$ and $\text{col} = 4 \pmod 3 = 1$. The cell is at index `(1, 1)`.

### Variation & Trap
*   **Trap**: Using $M$ instead of $N$ in divisions. Always divide/modulo by the number of columns ($N$).
*   **Variation**: Search in a step-sorted matrix (where both rows and columns are sorted independently, but first element of next row isn't necessarily larger). Solution: Start from top-right corner `(0, N-1)` and move down/left. Time complexity is $O(M + N)$.

---

## 4. MAT-04: Median of Row-Sorted Matrix

*   **Problem Statement**: Find the median of an $R \times C$ matrix where each row is sorted. $R$ and $C$ are always odd numbers, and the total elements count is odd.
*   **Constraints**:
    *   $1 \le R, C \le 1000$
    *   $1 \le \text{matrix}[i][j] \le 2000$
    *   *Sample Input*: `[[1, 3, 5], [2, 6, 9], [3, 6, 9]]` $\implies$ *Sample Output*: `5`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Linear Flatten & Sort** | Extract all elements into a 1D vector and sort them. | $O(R \cdot C \log(R \cdot C))$ | $O(R \cdot C)$ | Uses significant extra space. |
| **Optimal Binary Search on Range** | Use binary search on the range of elements `[min_val, max_val]` and count elements less than or equal to `mid` using `std::upper_bound`. | $O(32 \cdot R \log C)$ | $O(1)$ | Highly efficient, fits within tight time limits. |

### Optimal C++14 Solution
```cpp
#include <vector>
#include <algorithm>

int countLessEqual(const std::vector<std::vector<int>>& matrix, int mid) {
    int count = 0;
    for (int i = 0; i < matrix.size(); i++) {
        // Count elements <= mid in row i using binary search
        count += std::upper_bound(matrix[i].begin(), matrix[i].end(), mid) - matrix[i].begin();
    }
    return count;
}

int findMedian(const std::vector<std::vector<int>>& matrix) {
    int r = matrix.size();
    int c = matrix[0].size();
    
    int min_val = matrix[0][0];
    int max_val = matrix[0][c - 1];
    
    for (int i = 1; i < r; i++) {
        min_val = std::min(min_val, matrix[i][0]);
        max_val = std::max(max_val, matrix[i][c - 1]);
    }
    
    int desired_count = (r * c + 1) / 2;
    int low = min_val, high = max_val;
    
    while (low < high) {
        int mid = low + (high - low) / 2;
        int count = countLessEqual(matrix, mid);
        
        if (count < desired_count) {
            low = mid + 1;
        } else {
            high = mid;
        }
    }
    return low;
}
```

### Dry Run Table
Input Matrix: `[[1, 3, 5], [2, 6, 9], [3, 6, 9]]`. Desired count of elements $\le$ Median $= (9+1)/2 = 5$.
Initial Range: `[1, 9]`.

| Step | `low` | `high` | `mid` | Counts per row | Total Count $\le$ `mid` | Condition |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| 1 | 1 | 9 | 5 | Row 0: 3, Row 1: 1, Row 2: 1 | 5 | $5 \ge 5 \implies \text{high} = 5$ |
| 2 | 1 | 5 | 3 | Row 0: 2, Row 1: 1, Row 2: 1 | 4 | $4 < 5 \implies \text{low} = 4$ |
| 3 | 4 | 5 | 4 | Row 0: 2, Row 1: 1, Row 2: 1 | 4 | $4 < 5 \implies \text{low} = 5$ |
| Loop Ends | `low = 5` matches median |

### Complexity Analysis
*   **Time Complexity**: $O(32 \cdot R \log C)$ — Binary search range runs for about 32 iterations (since numbers are bounded). Inside, we call `upper_bound` which is $O(\log C)$ for each of the $R$ rows.
*   **Space Complexity**: $O(1)$ — No extra arrays are used.

### Shortcut & Math Derivation
*   **Derivation**: The median is the element where exactly half the total elements are smaller or equal to it. By binary searching the range $[min, max]$, for any candidate $X$, we can count how many numbers in the matrix are $\le X$. If count is less than $(R \times C + 1)/2$, the median must be larger than $X$. Otherwise, the median is $\le X$.
*   **Real Number Demo**: In `[[1, 3], [2, 4]]` (desired count = 2). If we try `3`, count is $2 + 1 = 3 \ge 2$, so search moves left. If we try `2`, count is $2 + 1 = 3 \ge 2$, search moves left.

### Variation & Trap
*   **Trap**: Initializing `min_val` and `max_val` to `matrix[0][0]` and `matrix[r-1][c-1]` directly. Rows are sorted, but columns are not, so `matrix[r-1][c-1]` is not necessarily the maximum element of the entire matrix. Scan first column for min and last column for max.
*   **Variation**: Finding the K-th smallest element. Same binary search approach, just replace `desired_count` with $K$.
