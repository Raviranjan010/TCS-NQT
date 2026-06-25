# TCS NQT 2026 — DSA Patterns Cheatsheet (Quick Reference)
**Exam Focus: Quick Ref & Code Snippets for last-minute prep**

---

## 🔍 SECTION 1: Pattern Recognition Quick Guide

| If the problem mentions... | Use this pattern |
| :--- | :--- |
| "maximum sum, non-adjacent elements" | House Robber DP |
| "circular array, pick elements" | Circular House Robber DP (2 runs) |
| "minimum operations to transform" | BFS / Edit Distance DP |
| "all subsets / all combinations" | Recursion + backtracking |
| "K-th largest / smallest" | Min-heap of size K |
| "sliding window maximum" | Deque monotonic |
| "count paths in grid" | 2D DP |
| "GCD of pair across two arrays" | Factor enumeration |
| "maximize XOR" | Bit-by-bit greedy |
| "task scheduler cooldown" | Max-heap + counter |
| "palindrome substring" | Expand around center |
| "minimum swaps to sort" | Cycle detection or BFS |
| "subarray sum equals K" | Prefix sum + Hash map |
| "shortest path in unweighted grid" | BFS with queue |
| "detect cycle in undirected graph" | Union-Find (DSU) |
| "prime numbers count / check" | Sieve of Eratosthenes |
| "modular inverse / large exponents" | Modular exponentiation |
| "longest increasing subsequence" | DP with binary search |
| "merge overlapping intervals" | Sort by start time |
| "check if loop exists in list" | Fast & Slow pointers |
| "minimum path sum in grid" | 2D Grid DP |
| "digit sum perfect square" | BFS / Digit DP |
| "minimum swaps to center" | Manhattan distance |
| "find duplicate in array" | Hashing / Floyd's Cycle |
| "count set bits in number" | Bit manipulation |
| "rotate array by K positions" | Array reversal template |
| "equilibrium index in array" | Prefix sum tracking |
| "subset sum equal to target" | Subset sum DP |
| "job scheduling with deadlines" | Greedy with priority slots |
| "caesar cipher decryption" | Modular character shifts |

---

## 💻 SECTION 2: Python Templates (Copy-Paste Ready)

### 1. Binary Search
```python
def binary_search(arr, target):
    low, high = 0, len(arr) - 1
    while low <= high:
        mid = low + (high - low) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1

def find_first_occurrence(arr, target):
    low, high, ans = 0, len(arr) - 1, -1
    while low <= high:
        mid = low + (high - low) // 2
        if arr[mid] == target:
            ans = mid
            high = mid - 1  # search left
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return ans
```

### 2. BFS on 2D Grid
```python
from collections import deque

def bfs_grid(grid):
    m, n = len(grid), len(grid[0])
    queue = deque([(0, 0, 1)])  # r, c, dist
    visited = {(0, 0)}
    while queue:
        r, c, dist = queue.popleft()
        if r == m - 1 and c == n - 1:
            return dist
        for dr, dc in [(-1,0), (1,0), (0,-1), (0,1)]:
            nr, nc = r + dr, c + dc
            if 0 <= nr < m and 0 <= nc < n and grid[nr][nc] == 1 and (nr, nc) not in visited:
                visited.add((nr, nc))
                queue.append((nr, nc, dist + 1))
    return -1
```

### 3. DFS (Recursive & Iterative)
```python
def dfs_recursive(graph, node, visited=None):
    if visited is None: visited = set()
    visited.add(node)
    for neighbor in graph[node]:
        if neighbor not in visited:
            dfs_recursive(graph, neighbor, visited)
    return visited

def dfs_iterative(graph, start):
    visited, stack = set(), [start]
    while stack:
        node = stack.pop()
        if node not in visited:
            visited.add(node)
            for neighbor in graph[node]:
                if neighbor not in visited:
                    stack.append(neighbor)
    return visited
```

### 4. Dynamic Programming — 1D
```python
def fib_optimized(n):
    if n <= 1: return n
    prev2, prev1 = 0, 1
    for _ in range(2, n + 1):
        curr = prev2 + prev1
        prev2 = prev1
        prev1 = curr
    return prev1
```

### 5. Dynamic Programming — 2D Grid
```python
def min_path_sum(grid):
    m, n = len(grid), len(grid[0])
    dp = [[float('inf')] * n for _ in range(m)]
    dp[0][0] = grid[0][0]
    for i in range(m):
        for j in range(n):
            if i > 0: dp[i][j] = min(dp[i][j], dp[i-1][j] + grid[i][j])
            if j > 0: dp[i][j] = min(dp[i][j], dp[i][j-1] + grid[i][j])
    return dp[m-1][n-1]
```

### 6. Sliding Window — Fixed Size
```python
def max_sum_subarray(arr, k):
    curr_sum = sum(arr[:k])
    max_sum = curr_sum
    for i in range(k, len(arr)):
        curr_sum += arr[i] - arr[i-k]
        max_sum = max(max_sum, curr_sum)
    return max_sum
```

### 7. Sliding Window — Variable Size
```python
def length_of_longest_substring(s):
    char_map = {}
    left = max_len = 0
    for right, char in enumerate(s):
        if char in char_map:
            left = max(left, char_map[char] + 1)
        char_map[char] = right
        max_len = max(max_len, right - left + 1)
    return max_len
```

### 8. Two Pointer
```python
def target_sum(arr, target):
    left, right = 0, len(arr) - 1
    while left < right:
        s = arr[left] + arr[right]
        if s == target: return left, right
        elif s < target: left += 1
        else: right -= 1
    return -1, -1
```

### 9. Max Heap / Min Heap
```python
import heapq
from collections import Counter

def top_k_frequent(nums, k):
    counts = Counter(nums)
    # min-heap of size k
    heap = []
    for num, cnt in counts.items():
        heapq.heappush(heap, (cnt, num))
        if len(heap) > k:
            heapq.heappop(heap)
    return [x[1] for x in heap]
```

### 10. Union-Find (DSU)
```python
class DSU:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [0] * n

    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # path compression
        return self.parent[x]

    def union(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)
        if root_x != root_y:
            if self.rank[root_x] > self.rank[root_y]:
                self.parent[root_y] = root_x
            elif self.rank[root_x] < self.rank[root_y]:
                self.parent[root_x] = root_y
            else:
                self.parent[root_y] = root_x
                self.rank[root_x] += 1
            return True
        return False
```

### 11. GCD & LCM
```python
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

def lcm(a, b):
    return (a * b) // gcd(a, b) if a and b else 0
```

### 12. Bit Manipulation
```python
# Check if k-th bit is set
is_set = lambda n, k: (n >> k) & 1

# Set k-th bit
set_bit = lambda n, k: n | (1 << k)

# Clear k-th bit
clear_bit = lambda n, k: n & ~(1 << k)

# Toggle k-th bit
toggle_bit = lambda n, k: n ^ (1 << k)

# Count set bits
count_set_bits = lambda n: bin(n).count('1')
```

### 13. Circular Array DP (House Robber II)
```python
def rob_linear(nums):
    p2, p1 = 0, 0
    for x in nums:
        p2, p1 = p1, max(p1, p2 + x)
    return p1

def rob_circular(nums):
    if not nums: return 0
    if len(nums) == 1: return nums[0]
    return max(rob_linear(nums[:-1]), rob_linear(nums[1:]))
```

### 14. String Palindrome Expand (Expand Around Center)
```python
def expand(s, l, r):
    while l >= 0 and r < len(s) and s[l] == s[r]:
        l, r = l - 1, r + 1
    return s[l + 1 : r]
```

### 15. Prefix Sum (1D & 2D)
```python
def get_prefix_sum(arr):
    prefix = [0] * (len(arr) + 1)
    for i, x in enumerate(arr):
        prefix[i+1] = prefix[i] + x
    return prefix  # query sum(i to j) = prefix[j+1] - prefix[i]
```

### 16. Modular Arithmetic
```python
# Fast Modulo Exponentiation (a^b % mod)
mod_pow = lambda a, b, mod: pow(a, b, mod)

# Modulo Inverse (for prime mod)
mod_inv = lambda a, mod: pow(a, mod - 2, mod)
```

### 17. Sieve of Eratosthenes
```python
def sieve(n):
    primes = [True] * (n + 1)
    primes[0] = primes[1] = False
    for p in range(2, int(n**0.5) + 1):
        if primes[p]:
            for i in range(p*p, n + 1, p):
                primes[i] = False
    return [i for i, x in enumerate(primes) if x]
```

### 18. Fast Input Reading
```python
import sys

def fast_read():
    # Fetch all whitespace-separated tokens at once
    input_data = sys.stdin.read().split()
    if not input_data: return []
    return input_data
```

---

## ⏱️ SECTION 3: Complexity Quick Reference

| Algorithm / Pattern | Time Complexity | Space Complexity | Max Safe $N$ in 1 Second |
| :--- | :--- | :--- | :--- |
| **Brute Force $O(N^2)$** | $O(N^2)$ | $O(1)$ | $N \le 10,000$ |
| **Sort-based $O(N \log N)$** | $O(N \log N)$ | $O(N)$ or $O(1)$ | $N \le 10^6$ |
| **Binary Search** | $O(\log N)$ | $O(1)$ | Any $N$ (up to $10^{18}$) |
| **BFS/DFS Traversal** | $O(V + E)$ | $O(V)$ | $10^5$ nodes / edges |
| **1D Dynamic Programming** | $O(N)$ | $O(N) \to O(1)$ | $N \le 10^7$ |
| **2D Dynamic Programming** | $O(N^2)$ | $O(N^2)$ | $N \le 1,000$ |
| **Sliding Window** | $O(N)$ | $O(1)$ | $N \le 10^7$ |
| **Heap-based $O(N \log K)$** | $O(N \log K)$ | $O(K)$ | $N \le 10^6$ |
| **Sieve of Eratosthenes** | $O(N \log \log N)$ | $O(N)$ | $N \le 10^6$ |
| **Union-Find (DSU)** | $O(N \cdot \alpha(N)) \approx O(N)$ | $O(N)$ | $N \le 10^6$ |

---

## ⚠️ SECTION 4: Edge Cases — Private Test Case Killers

1. **Array Problems**:
   * *N = 0 / Empty Array*: Ensure loops do not execute on empty slices.
   * *N = 1*: Check if first-index accesses are out of bounds.
   * *All Identical Elements*: Check if second largest/smallest filters duplicates.
   * *Negative Numbers*: Initialize maximum trackers to `float('-inf')` (NOT `0`).
2. **String Problems**:
   * *Empty String*: Return empty results immediately.
   * *Case Sensitivity*: Normalize letters using `.lower()` or `.upper()` if needed.
   * *Whitespace Handling*: Ensure string splits strip correct white spaces.
3. **Number Problems**:
   * *N = 0 / N = 1*: Verify basic properties (such as prime status or Fibonacci terms).
   * *Large Numbers ($N \ge 10^9$)*: Avoid running $O(N)$ loops; use constant mathematical formulas.
4. **Circular Problems**:
   * *Small Arrays ($N < 3$)*: Handle explicitly before invoking circular index splits.
5. **GCD Problems**:
   * *Division by Zero*: Never calculate GCD/LCM of zero elements.
6. **Matrix Problems**:
   * *1×1 Matrix*: Center is at $(0,0)$; ensure distance computations handle this correctly.
   * *Multiple Maxima*: Locate all and compute minimum Manhattan distance.
7. **DP Problems**:
   * *Base Cases*: Set `dp[0]` and `dp[1]` manually before entering the loop.

---

## 💡 SECTION 5: Common Python Bugs in TCS NQT

1. **Type Mismatch on Input**: `input()` returns a string. Convert to integer using `int(input())` when parsing values.
2. **Trailing Newlines**: `print(ans)` outputs a trailing newline. For strict whitespace verification, use `print(ans, end="")`.
3. **Loop Range Boundaries**: `range(a, b)` does not include `b`. Use `range(a, b + 1)` for inclusive loops.
4. **List Mutations**: Never add/remove elements from a list while iterating over it. Iterate over a copy: `for x in arr[:]`.
5. **Division Types**: `/` returns a float. Always use `//` for integer floor division (e.g. index calculations).
6. **Square Root Precision**: `math.sqrt()` is prone to floating-point errors. Use `math.isqrt(n)` for integer perfect square checks.
7. **Recursion Limit**: Python's default limit is 1000. Write `sys.setrecursionlimit(10**6)` at the top of your code for recursive scripts.
8. **Hash Map Key Errors**: Accessing keys that do not exist raises `KeyError`. Use `d.get(key, default)` or `defaultdict`.
9. **Heap Q Order**: `heapq` in Python creates a MIN-heap. To build a MAX-heap, push negative values: `heapq.heappush(heap, -val)`.

---

## 📅 SECTION 6: 5-Day Study Integration

### Study Focus mapping
* **Day 1: Number Properties & Math** $\to$ Prepares for Numerical Ability divisibility, primes, HCF/LCM, and coding easy properties.
* **Day 2: Array Manipulation** $\to$ Core bread-and-butter patterns (Equilibrium point, sliding windows, rotations).
* **Day 3: String Parsing** $\to$ Decryption, anagrams, palindromic checks.
* **Day 4: Sorting & Hashing** $\to$ GCD pairs, heap priorities, duplicate checks.
* **Day 5: Dynamic Programming & Matrices** $\to$ Advanced paths, house robber variants, swaps to center.

---

### 🔗 LeetCode $\to$ TCS NQT Mapping

| LeetCode Problem | TCS NQT Focus Pattern |
| :--- | :--- |
| **LC 198. House Robber** | Linear non-adjacent element selection DP. |
| **LC 213. House Robber II** | Circular non-adjacent element selection DP. |
| **LC 70. Climbing Stairs** | 1D Dynamic Programming. |
| **LC 322. Coin Change** | Minimum steps / coins DP. |
| **LC 5. Longest Palindromic Substring** | Expand Around Center string operations. |
| **LC 242. Valid Anagram** | Frequency count / sorting comparison. |
| **LC 189. Rotate Array** | Circular shift / array reversal. |
| **LC 64. Minimum Path Sum** | 2D Grid DP. |
| **LC 54. Spiral Matrix** | 2D Matrix traversal simulation. |
| **LC 621. Task Scheduler** | Max-heap task scheduling with cooldown. |
| **LC 191. Number of 1 Bits** | Bit counting. |
| **LC 268. Missing Number** | Mathematical sum tracking. |
| **LC 48. Rotate Image** | Matrix transposition + reverse. |
| **LC 1. Two Sum** | Two-pointer / Hash map check. |
| **LC 204. Count Primes** | Sieve of Eratosthenes. |
| **LC 72. Edit Distance** | 2D DP string transformations. |
| **LC 200. Number of Islands** | Grid DFS/BFS. |
| **LC 442. Find All Duplicates** | Cyclic sort / array indexing. |
| **LC 56. Merge Intervals** | Sort-based greedy intervals. |
| **LC 347. Top K Frequent** | Min-heap frequency tracking. |
| **LC 238. Product of Array Except Self** | Prefix & Suffix product arrays. |
| **LC 724. Find Pivot Index** | Equilibrium index lookup. |
| **LC 136. Single Number** | XOR bit manipulation properties. |
| **LC 9. Palindrome Number** | Digit modular reversal. |
| **LC 1097. DSU / Relations** | Union-Find components tracking. |
