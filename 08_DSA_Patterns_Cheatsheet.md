# TCS NQT 2026 — DSA Patterns Cheatsheet
**Prep Focus: Reusable Code Templates & Quick Syntax Ref**

This cheatsheet provides highly optimized, copy-pasteable code templates in **Python 3.8** and **C++ 4.9.2** for common DSA patterns. It also includes quick library syntax guides.

---

## 🚀 Reusable Code Templates

### 1. Sliding Window (Fixed Size)
* **Use case**: Max sum subarray of size $K$.

#### 🐍 Python
```python
def sliding_window_fixed(arr, k):
    n = len(arr)
    if n < k:
        return 0
    
    current_sum = sum(arr[:k])
    max_sum = current_sum
    
    for i in range(k, n):
        current_sum += arr[i] - arr[i - k]
        max_sum = max(max_sum, current_sum)
        
    return max_sum
```

#### 💻 C++
```cpp
int slidingWindowFixed(vector<int>& arr, int k) {
    int n = arr.size();
    if (n < k) return 0;
    
    int current_sum = 0;
    for (int i = 0; i < k; i++) current_sum += arr[i];
    
    int max_sum = current_sum;
    for (int i = k; i < n; i++) {
        current_sum += arr[i] - arr[i - k];
        max_sum = max(max_sum, current_sum);
    }
    return max_sum;
}
```

---

### 2. Two Pointers
* **Use case**: Finding a pair with a target sum in a sorted array.

#### 🐍 Python
```python
def two_pointers_sum(arr, target):
    left = 0
    right = len(arr) - 1
    
    while left < right:
        curr_sum = arr[left] + arr[right]
        if curr_sum == target:
            return left, right
        elif curr_sum < target:
            left += 1
        else:
            right -= 1
    return -1, -1
```

#### 💻 C++
```cpp
pair<int, int> twoPointersSum(vector<int>& arr, int target) {
    int left = 0;
    int right = arr.size() - 1;
    
    while (left < right) {
        int curr_sum = arr[left] + arr[right];
        if (curr_sum == target) return {left, right};
        else if (curr_sum < target) left++;
        else right--;
    }
    return {-1, -1};
}
```

---

### 3. Binary Search
* **Use case**: Target search in sorted array, or finding lower bound.

#### 🐍 Python
```python
def binary_search(arr, target):
    low = 0
    high = len(arr) - 1
    
    while low <= high:
        mid = low + (high - low) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1
```

#### 💻 C++
```cpp
int binarySearch(vector<int>& arr, int target) {
    int low = 0;
    int high = arr.size() - 1;
    
    while (low <= high) {
        int mid = low + (high - low) / 2;
        if (arr[mid] == target) return mid;
        else if (arr[mid] < target) low = mid + 1;
        else high = mid - 1;
    }
    return -1;
}
```

---

### 4. BFS on 2D Grid / Matrix
* **Use case**: Finding shortest path in a binary maze.

#### 🐍 Python
```python
from collections import deque

def bfs_grid(grid):
    if not grid or not grid[0]:
        return 0
    
    rows, cols = len(grid), len(grid[0])
    queue = deque([(0, 0, 1)])  # row, col, distance
    visited = {(0, 0)}
    
    # 4 cardinal directions (Up, Down, Left, Right)
    directions = [(-1,0), (1,0), (0,-1), (0,1)]
    
    while queue:
        r, c, dist = queue.popleft()
        
        # Base case: reached bottom-right cell
        if r == rows - 1 and c == cols - 1:
            return dist
            
        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if 0 <= nr < rows and 0 <= nc < cols and grid[nr][nc] == 1 and (nr, nc) not in visited:
                visited.add((nr, nc))
                queue.append((nr, nc, dist + 1))
                
    return -1
```

#### 💻 C++
```cpp
#include <queue>
#include <set>

struct Cell {
    int r, c, dist;
};

int bfsGrid(vector<vector<int>>& grid) {
    int rows = grid.size();
    int cols = grid[0].size();
    if (grid[0][0] == 0) return -1;
    
    queue<Cell> q;
    q.push({0, 0, 1});
    
    vector<vector<bool>> visited(rows, vector<bool>(cols, false));
    visited[0][0] = true;
    
    int dr[] = {-1, 1, 0, 0};
    int dc[] = {0, 0, -1, 1};
    
    while (!q.empty()) {
        Cell curr = q.front();
        q.pop();
        
        if (curr.r == rows - 1 && curr.c == cols - 1) return curr.dist;
        
        for (int i = 0; i < 4; i++) {
            int nr = curr.r + dr[i];
            int nc = curr.c + dc[i];
            
            if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 1 && !visited[nr][nc]) {
                visited[nr][nc] = true;
                q.push({nr, nc, curr.dist + 1});
            }
        }
    }
    return -1;
}
```

---

## ⚡ Fast Syntax Cheat Sheet

### 🐍 Python 3.8 Libraries & Methods

* **Read Standard Input**:
  ```python
  import sys
  # Reads all tokens (words) separated by whitespace
  input_data = sys.stdin.read().split()
  # Reads line by line
  lines = sys.stdin.read().splitlines()
  ```
* **Lists / Arrays**:
  ```python
  arr.append(x)     # Insert at end
  arr.pop()         # Remove from end
  arr.sort()        # Sort in-place O(N log N)
  arr.sort(reverse=True) # Sort descending
  ```
* **Dictionaries (Hash Maps) & Sets**:
  ```python
  d = {}
  d.get(key, default) # Safe fetch
  s = set()
  s.add(x)
  s.remove(x) # Raises KeyError if missing
  s.discard(x) # Safe remove
  ```
* **Useful Collections**:
  ```python
  from collections import Counter, defaultdict, deque
  counts = Counter(arr) # Multi-set mapping element -> count
  dq = deque() # Double-ended queue (dq.append, dq.appendleft, dq.pop, dq.popleft)
  ```

---

### 💻 C++ 4.9.2 STL (Standard Template Library)

* **Vectors (Dynamic Arrays)**:
  ```cpp
  vector<int> v;
  v.push_back(val);
  v.pop_back();
  sort(v.begin(), v.end()); // Ascending
  sort(v.rbegin(), v.rend()); // Descending
  ```
* **Map & Unordered Map (Hash Maps)**:
  ```cpp
  #include <map>
  #include <unordered_map>
  unordered_map<string, int> umap; // O(1) average lookup
  umap["key"] = 42;
  if (umap.find("key") != umap.end()) { /* key exists */ }
  ```
* **Set & Unordered Set**:
  ```cpp
  #include <set>
  #include <unordered_set>
  unordered_set<int> uset;
  uset.insert(10);
  uset.erase(10);
  if (uset.count(10)) { /* 10 exists */ }
  ```
* **String Manipulation**:
  ```cpp
  string s = "hello";
  s.length();
  s.substr(start_idx, length);
  s.find("ell"); // Returns index, or string::npos if not found
  ```
