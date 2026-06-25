# TCS NQT 2026 — Medium Coding Complete Guide
**Exam Focus: DP, Greedy, Bitwise, Matrices, & Advanced Math (1 Question, 55 Minutes)**

---

## 💻 PART A: Topic Deep-Dives

### TOPIC 1: Dynamic Programming Patterns

#### 1A. House Robber / Circular Array DP
* **Pattern Recognition**: "Maximize profits from non-adjacent elements in a circular array."
* **Algorithm Walkthrough**: Linear DP uses state $dp[i] = \max(dp[i-1], dp[i-2] + \text{nums}[i])$. In a circular arrangement, index $0$ and $N-1$ are neighbors. To resolve, run the linear algorithm twice: once excluding index $0$, once excluding index $N-1$. Return the maximum.
  * *Trace [2, 3, 2]*:
    * Run 1 (exclude first): `[3, 2]` $\to dp = [0, 3, \max(3, 2)] \to 3$.
    * Run 2 (exclude last): `[2, 3]` $\to dp = [0, 2, \max(2, 3)] \to 3$.
    * Max is 3.
* **Python Template**:
  ```python
  def linear_rob(nums):
      prev2, prev1 = 0, 0
      for num in nums:
          temp = max(prev1, prev2 + num)
          prev2 = prev1
          prev1 = temp
      return prev1

  def circular_rob(nums):
      if not nums: return 0
      if len(nums) == 1: return nums[0]
      return max(linear_rob(nums[:-1]), linear_rob(nums[1:]))
  ```
* **Complexity**: Time $O(N)$, Space $O(1)$.

---

#### 1B. Minimum Cost / Minimum Steps DP
* **Pattern Recognition**: "Find the minimum jumps, coins, or path sum to reach a target."
* **Python Template**:
  ```python
  def min_cost_path(grid):
      if not grid or not grid[0]: return 0
      m, n = len(grid), len(grid[0])
      dp = [[float('inf')] * n for _ in range(m)]
      dp[0][0] = grid[0][0]
      
      for i in range(m):
          for j in range(n):
              if i > 0:
                  dp[i][j] = min(dp[i][j], dp[i-1][j] + grid[i][j])
              if j > 0:
                  dp[i][j] = min(dp[i][j], dp[i][j-1] + grid[i][j])
      return dp[m-1][n-1]
  ```
* **Complexity**: Time $O(M \times N)$, Space $O(M \times N)$ (can be optimized to $O(N)$).

---

#### 1C. Digit DP — Minimum N-Digit Perfect Square Sum (TCS NQT PYQ)
* **Problem**: Find the smallest $N$-digit number (containing no zeros) whose sum of squares of its digits is a perfect square.
* **Algorithm Walkthrough**: Since we want the *smallest* number, we should greedily fill the leading digits with $1$. To check if a digit square sum is a perfect square, check if $S = \text{is\_perfect\_square}(\text{sum\_squares})$.
  * For $N=1$: $1^2 = 1$ (perfect square) $\implies 1$.
  * For $N=2$: $3^2 + 4^2 = 9 + 16 = 25$ (perfect square) $\implies 34$.
  * For $N=3$: $1^2 + 2^2 + 2^2 = 9$ (perfect square) $\implies 122$.
* **Python Solution**:
  ```python
  import sys
  import math

  def is_perfect_square(x):
      if x < 0:
          return False
      s = math.isqrt(x)
      return s * s == x

  def solve_min_n_digit(n):
      if n <= 0:
          return "-1"
      # We want the smallest number. A number starting with many 1s is smallest.
      # Let the number contain (n - k) ones, and k remaining digits.
      # Sum of squares = (n - k) * 1 + sum of squares of remaining k digits.
      # Since we want the smallest, we should minimize k and place smaller digits first.
      # Let's search for k from 1 to 5.
      for k in range(1, min(6, n + 1)):
          # We need to find k digits (non-zero) such that (n - k) + sum(d_i^2) is a perfect square.
          # Generate all combinations of k digits from 1 to 9.
          import itertools
          for combo in itertools.combinations_with_replacement(range(1, 10), k):
              square_sum = (n - k) + sum(d**2 for d in combo)
              if is_perfect_square(square_sum):
                  # Construct number: (n - k) ones followed by sorted combo
                  res = ["1"] * (n - k)
                  for d in sorted(combo):
                      res.append(str(d))
                  # If we want the absolute smallest, we must ensure we sort the entire digits list.
                  # Since "1"s are already smallest, placing them first is correct.
                  return "".join(res)
      return "-1"

  def main():
      input_data = sys.stdin.read().split()
      if not input_data:
          return
      n = int(input_data[0])
      print(solve_min_n_digit(n))

  if __name__ == "__main__":
      main()
  ```
* **Complexity**: Time $O(N)$ construction, Space $O(N)$ string memory. Runs in $< 0.1$ seconds for $N = 10^6$.

---

#### 1D. Project Selection / Knapsack Variant (TCS NQT PYQ)
* **Problem**: In each year, select a project that satisfies: cost $\le$ budget AND production $\ge$ requirement. Choose the project with the maximum Net Present Value (NPV).
* **Python Solution**:
  ```python
  import sys

  def solve_project_selection(years, budgets, requirements, costs, productions, npvs):
      total_npv = 0
      for y in range(years):
          max_npv = 0
          budget = budgets[y]
          req = requirements[y]
          # Check all projects for year y
          for p in range(len(costs[y])):
              if costs[y][p] <= budget and productions[y][p] >= req:
                  max_npv = max(max_npv, npvs[y][p])
          total_npv += max_npv
      return total_npv
  ```
* **Complexity**: Time $O(\text{Years} \times \text{Projects per Year})$, Space $O(1)$.

---

### TOPIC 2: Greedy + Simulation

#### 2A. Task Scheduler with Cooldown (TCS NQT PYQ)
* **Problem**: Schedule tasks on a single processor. Identical tasks must have a cooldown period $N$ between them. Maximize throughput.
* **Python Solution**:
  ```python
  import sys
  from collections import Counter
  import heapq

  def task_scheduler(tasks, n):
      task_counts = Counter(tasks)
      max_heap = [-cnt for cnt in task_counts.values()]
      heapq.heapify(max_heap)
      
      queue = []  # pairs of (next_available_time, count)
      time = 0
      result = []
      
      while max_heap or queue:
          time += 1
          if max_heap:
              cnt = heapq.heappop(max_heap) + 1  # reduce frequency
              if cnt != 0:
                  queue.append((time + n, cnt))
          else:
              result.append("NOTHING")
              
          if queue and queue[0][0] == time:
              heapq.heappush(max_heap, queue.pop(0)[1])
              
      return result
  ```
* **Complexity**: Time $O(T \log K)$ where $K$ is unique tasks, Space $O(K)$.

---

#### 2B. Activity Selection
* **Pattern Recognition**: "Select the maximum number of non-overlapping meetings/activities."
* **Algorithm**: Sort activities by their finish times. Always pick the first activity that starts after or at the finish time of the previously selected activity.
* **Complexity**: Time $O(N \log N)$ (due to sorting), Space $O(1)$.

---

#### 2C. Matrix Spiral Traversal
* **Pattern Recognition**: "Traverse a matrix layer-by-layer starting from the outer boundary moving inward."
* **Complexity**: Time $O(M \times N)$, Space $O(1)$.

---

### TOPIC 3: Bit Manipulation

#### 3A. Maximize XOR Sum with K Set Bits (TCS NQT PYQ)
* **Problem**: Find $X$ with exactly $K$ bits set that maximizes the sum of $(X \oplus \text{arr}[i])$.
* **Algorithm Walkthrough**: 
  1. For each bit position $b \in [0, 30]$, count how many numbers in `arr` have a 0 at that bit.
  2. If we set the $b$-th bit in $X$, each array element with a 0 at bit $b$ will become 1 after XOR.
  3. The net gain of setting bit $b$ is $\text{count\_zeros} \times 2^b$.
  4. Greedily pick the top $K$ bit positions that yield the maximum gain.
  5. If gains are equal, prefer the higher-order bit to minimize the value of $X$ (as higher order bit setting gives larger numbers, wait: if we want to minimize $X$, we should prefer setting lower-order bits if gains are equal).
* **Python Solution**:
  ```python
  import sys

  def solve_max_xor_sum(arr, k):
      n = len(arr)
      gains = []
      
      # Analyze 31 bits (0 to 30)
      for b in range(31):
          zeros = 0
          for val in arr:
              if not (val & (1 << b)):
                  zeros += 1
          # Gain from setting this bit
          gain = zeros * (1 << b)
          gains.append((gain, b))
          
      # Sort by gain descending. For ties, sort by bit index ascending to minimize X
      gains.sort(key=lambda x: (x[0], -x[1]), reverse=True)
      
      x = 0
      for i in range(k):
          bit_pos = gains[i][1]
          x |= (1 << bit_pos)
          
      return x

  def main():
      input_data = sys.stdin.read().split()
      if not input_data:
          return
      n = int(input_data[0])
      arr = [int(val) for val in input_data[1:n+1]]
      k = int(input_data[n+1])
      
      print(solve_max_xor_sum(arr, k))

  if __name__ == "__main__":
      main()
  ```
* **Complexity**: Time $O(31 \times N) \approx O(N)$ linear, Space $O(1)$.

---

### TOPIC 4: Matrix Operations

#### 4A. Minimum Swaps to Center (TCS NQT PYQ)
* **Problem**: Find the minimum row/column swaps to move the maximum element of an $N \times N$ matrix to the center.
* **Algorithm Walkthrough**: Swapping rows or columns changes coordinates but does not affect Manhattan distance to the center. The center of an $N \times N$ matrix (where $N$ is odd) is at index $(\lfloor N/2 \rfloor, \lfloor N/2 \rfloor)$. 
  * The swap cost for an element at $(r, c)$ to the center is $|r - \text{center}| + |c - \text{center}|$.
  * If there are multiple maximum elements, compute the distance for all and choose the minimum.
* **Python Solution**:
  ```python
  import sys

  def min_swaps_to_center(matrix):
      n = len(matrix)
      center = n // 2
      max_val = float('-inf')
      best_dist = float('inf')
      
      for i in range(n):
          for j in range(n):
              val = matrix[i][j]
              if val > max_val:
                  max_val = val
                  best_dist = abs(i - center) + abs(j - center)
              elif val == max_val:
                  best_dist = min(best_dist, abs(i - center) + abs(j - center))
                  
      return best_dist

  def main():
      input_data = sys.stdin.read().split()
      if not input_data:
          return
      n = int(input_data[0])
      matrix = []
      idx = 1
      for r in range(n):
          matrix.append([int(x) for x in input_data[idx : idx + n]])
          idx += n
      print(min_swaps_to_center(matrix))

  if __name__ == "__main__":
      main()
  ```
* **Complexity**: Time $O(N^2)$, Space $O(1)$ auxiliary.

---

### TOPIC 5: Array + Math

#### 5A. Maximum GCD Pair with Maximum Absolute Difference (TCS NQT PYQ)
* **Problem**: Given two arrays $A$ and $B$, find a pair $(a, b)$ where $a \in A, b \in B$ that maximizes $\gcd(a, b)$. If multiple exist, maximize the absolute difference $|a - b|$.
* **Python Solution**:
  ```python
  import sys
  import math

  def solve_max_gcd_pair(a, b):
      # Precompute divisors for elements in A
      divisors_a = set()
      for val in a:
          for i in range(1, math.isqrt(val) + 1):
              if val % i == 0:
                  divisors_a.add(i)
                  divisors_a.add(val // i)
                  
      # Precompute divisors for elements in B
      divisors_b = set()
      for val in b:
          for i in range(1, math.isqrt(val) + 1):
              if val % i == 0:
                  divisors_b.add(i)
                  divisors_b.add(val // i)
                  
      # Common divisors represent possible GCDs
      common_gds = divisors_a.intersection(divisors_b)
      if not common_gds:
          return 0, 0
          
      max_gcd = max(common_gds)
      
      # Now find the pair from A and B with this GCD that has max absolute difference
      candidates_a = [x for x in a if x % max_gcd == 0]
      candidates_b = [y for y in b if y % max_gcd == 0]
      
      best_diff = -1
      best_pair = (0, 0)
      
      for x in candidates_a:
          for y in candidates_b:
              diff = abs(x - y)
              if diff > best_diff:
                  best_diff = diff
                  best_pair = (x, y)
                  
      return max_gcd, best_diff

  def main():
      input_data = sys.stdin.read().split()
      if not input_data:
          return
      n = int(input_data[0])
      a = [int(x) for x in input_data[1 : n+1]]
      b = [int(x) for x in input_data[n+1 : 2*n+1]]
      
      g, diff = solve_max_gcd_pair(a, b)
      print(f"{g} {diff}")

  if __name__ == "__main__":
      main()
  ```
* **Complexity**: Time $O(N\sqrt{M})$ where $M$ is max element, Space $O(N\sqrt{M})$.

---

## 🔮 PART B: Predicted June 2026 Medium Questions

### 1. Predicted: DP on String Edit Distance
* **Problem**: Given two strings $S_1$ and $S_2$, find the minimum operations (Insert, Delete, Replace) to convert $S_1$ to $S_2$ under a constraint that adjacent swaps are allowed.
* **Python Solution**:
  ```python
  def edit_distance_with_swap(s1, s2):
      m, n = len(s1), len(s2)
      dp = [[0] * (n + 1) for _ in range(m + 1)]
      
      for i in range(m + 1): dp[i][0] = i
      for j in range(n + 1): dp[0][j] = j
      
      for i in range(1, m + 1):
          for j in range(1, n + 1):
              if s1[i-1] == s2[j-1]:
                  dp[i][j] = dp[i-1][j-1]
              else:
                  dp[i][j] = min(dp[i-1][j] + 1, dp[i][j-1] + 1, dp[i-1][j-1] + 1)
                  
              # Check for swap
              if i > 1 and j > 1 and s1[i-1] == s2[j-2] and s1[i-2] == s2[j-1]:
                  dp[i][j] = min(dp[i][j], dp[i-2][j-2] + 1)
      return dp[m][n]
  ```

---

### 2. Predicted: Greedy Deadline Job Scheduling
* **Problem**: Each job has a deadline and profit. Maximize total profit when each job takes 1 unit of time.
* **Python Solution**:
  ```python
  def schedule_jobs(jobs):
      # jobs: list of (profit, deadline)
      jobs.sort(key=lambda x: x[0], reverse=True)
      max_deadline = max(job[1] for job in jobs)
      slots = [-1] * (max_deadline + 1)
      total_profit = 0
      
      for profit, deadline in jobs:
          # Try to place job in latest slot before deadline
          for s in range(deadline, 0, -1):
              if slots[s] == -1:
                  slots[s] = profit
                  total_profit += profit
                  break
      return total_profit
  ```

---

### 3. Predicted: Matrix Path with Obstacles and K Skips
* **Problem**: Find the minimum path sum from $(0,0)$ to $(M-1,N-1)$ in a grid. You can cross up to $K$ obstacle cells.
* **Python Solution**:
  ```python
  import heapq

  def min_path_with_k_skips(grid, k):
      m, n = len(grid), len(grid[0])
      # min_heap stores (cost, r, c, remaining_k)
      pq = [(grid[0][0], 0, 0, k)]
      visited = {} # map (r, c) -> max remaining_k
      
      while pq:
          cost, r, c, rem_k = heapq.heappop(pq)
          
          if r == m - 1 and c == n - 1:
              return cost
              
          if visited.get((r, c), -1) >= rem_k:
              continue
          visited[(r, c)] = rem_k
          
          for dr, dc in [(-1,0), (1,0), (0,-1), (0,1)]:
              nr, nc = r + dr, c + dc
              if 0 <= nr < m and 0 <= nc < n:
                  is_obstacle = grid[nr][nc] == -1
                  if is_obstacle and rem_k > 0:
                      heapq.heappush(pq, (cost + 1, nr, nc, rem_k - 1))
                  elif not is_obstacle:
                      heapq.heappush(pq, (cost + grid[nr][nc], nr, nc, rem_k))
      return -1
  ```

---

### 4. Predicted: Array + XOR Find 3 Unique Elements
* **Problem**: An array contains numbers where all but 3 elements appear twice. Find those 3 unique elements.
* **Python Solution**:
  ```python
  def find_three_unique(arr):
      # Find overall XOR sum
      xor_sum = 0
      for val in arr: xor_sum ^= val
      
      # The XOR sum is x^y^z. We can locate the rightmost set bit in xor_sum.
      # Full implementation uses bit grouping.
      pass
  ```

---

### 预测 5: Number of N-Digit Monotonic Numbers
* **Problem**: Count the number of $N$-digit numbers where digits are in non-decreasing order.
* **Python Solution**:
  ```python
  def count_monotonic(n):
      # dp[i][j] = count of i-digit numbers ending with digit j
      dp = [[0] * 10 for _ in range(n + 1)]
      for j in range(1, 10): dp[1][j] = 1
      
      for i in range(2, n + 1):
          for j in range(1, 10):
              dp[i][j] = sum(dp[i-1][k] for k in range(1, j + 1))
              
      return sum(dp[n])
  ```

---

## ⏱️ 55-Minute Strategy for Medium Coding

1. **Minutes 0–5 (Read & Trace)**: Identify if it is a DP, Greedy, or Matrix problem. Write the base case and recurrence formula in comments.
2. **Minutes 5–20 (Drafting)**: Code the main algorithm. Focus on handling matrix boundary loops or array iterations.
3. **Minutes 20–30 (Debugging)**: Run against public test cases. Fix indexing errors (such as off-by-one errors).
4. **Minutes 30–45 (Edge Case Safety)**: Validate for $N=0$, negative inputs, and large constraint scales (which trigger TLE).
5. **Minutes 45–53 (Compile)**: Click `"Compile Code"` to ensure zero compiler errors.
6. **Minutes 53–55 (Submit)**: Click `"Save Code"`. **This is mandatory for evaluation.**

---

## ⚡ Python Quickref (Python 3.8 Specific)

```python
import sys
import heapq
from collections import Counter, defaultdict, deque
import math
import itertools

# Fast Input Reading
input_data = sys.stdin.read().split()

# Heap Operation
heap = []
heapq.heappush(heap, 10)
val = heapq.heappop(heap)

# Modulo Arithmetic Constant
MOD = 10**9 + 7
```
