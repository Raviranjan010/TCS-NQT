# TCS NQT 2026 — Medium Coding Section
**Prep Focus: DP, Greedy, Matrices, & Bits (1 Question, 55 Minutes)**

The Medium Coding section tests your ability to design efficient algorithms for complex constraints. You are allocated **55 minutes** for this single question, which has higher weightage than the Easy Coding section.

---

## 📘 Top 4 Solved Medium PYQs

### 1. Longest Common Subsequence (LCS)
* **Problem**: Given two strings $S_1$ and $S_2$, find the length of their longest common subsequence.
* **Complexity**: Time $O(M \times N)$, Space $O(M \times N)$ (or optimized to $O(N)$).

#### 🐍 Python 3.8 Solution
```python
import sys

def get_lcs_length(s1, s2):
    m, n = len(s1), len(s2)
    # DP table: (m+1) x (n+1) initialized to 0
    dp = [[0] * (n + 1) for _ in range(m + 1)]
    
    # Build DP table in bottom-up manner
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if s1[i-1] == s2[j-1]:
                dp[i][j] = dp[i-1][j-1] + 1
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                
    return dp[m][n]

def main():
    lines = sys.stdin.read().splitlines()
    if len(lines) < 2:
        return
    s1 = lines[0]
    s2 = lines[1]
    print(get_lcs_length(s1, s2))

if __name__ == "__main__":
    main()
```

#### 💻 C++ 4.9.2 Solution
```cpp
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

using namespace std;

int getLCS(string s1, string s2) {
    int m = s1.length();
    int n = s2.length();
    
    // dp table initialized to 0
    vector<vector<int>> dp(m + 1, vector<int>(n + 1, 0));
    
    for (int i = 1; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
            if (s1[i-1] == s2[j-1]) {
                dp[i][j] = dp[i-1][j-1] + 1;
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
            }
        }
    }
    return dp[m][n];
}

int main() {
    string s1, s2;
    if (getline(cin, s1) && getline(cin, s2)) {
        cout << getLCS(s1, s2) << endl;
    }
    return 0;
}
```

---

### 2. Coin Change (Min Coins)
* **Problem**: Given coins of different denominations and a total `amount`, find the minimum number of coins needed to make up that amount. If it cannot be made up, return `-1`.
* **Complexity**: Time $O(\text{amount} \times N)$, Space $O(\text{amount})$.

#### 🐍 Python 3.8 Solution
```python
import sys

def coin_change(coins, amount):
    # dp[i] will store the min coins to make change for value i
    dp = [float('inf')] * (amount + 1)
    dp[0] = 0
    
    for i in range(1, amount + 1):
        for coin in coins:
            if i - coin >= 0:
                dp[i] = min(dp[i], dp[i - coin] + 1)
                
    return dp[amount] if dp[amount] != float('inf') else -1

def main():
    input_data = sys.stdin.read().split()
    if not input_data:
        return
    amount = int(input_data[0])
    n = int(input_data[1])
    coins = [int(x) for x in input_data[2:n+2]]
    
    print(coin_change(coins, amount))

if __name__ == "__main__":
    main()
```

#### 💻 C++ 4.9.2 Solution
```cpp
#include <iostream>
#include <vector>
#include <algorithm>
#include <climits>

using namespace std;

int coinChange(vector<int>& coins, int amount) {
    vector<int> dp(amount + 1, amount + 1);
    dp[0] = 0;
    
    for (int i = 1; i <= amount; i++) {
        for (int c : coins) {
            if (i - c >= 0) {
                dp[i] = min(dp[i], dp[i - c] + 1);
            }
        }
    }
    return dp[amount] > amount ? -1 : dp[amount];
}

int main() {
    int amount, n;
    if (!(cin >> amount >> n)) return 0;
    vector<int> coins(n);
    for (int i = 0; i < n; i++) {
        cin >> coins[i];
    }
    cout << coinChange(coins, amount) << endl;
    return 0;
}
```

---

### 3. Spiral Matrix Traversal
* **Problem**: Print the elements of an $M \times N$ matrix in spiral order.
* **Complexity**: Time $O(M \times N)$, Space $O(1)$ (excluding output).

#### 🐍 Python 3.8 Solution
```python
import sys

def spiral_order(matrix):
    if not matrix:
        return []
    
    result = []
    top = 0
    bottom = len(matrix) - 1
    left = 0
    right = len(matrix[0]) - 1
    
    while top <= bottom and left <= right:
        # Traverse right
        for i in range(left, right + 1):
            result.append(matrix[top][i])
        top += 1
        
        # Traverse down
        for i in range(top, bottom + 1):
            result.append(matrix[i][right])
        right -= 1
        
        if top <= bottom:
            # Traverse left
            for i in range(right, left - 1, -1):
                result.append(matrix[bottom][i])
            bottom -= 1
            
        if left <= right:
            # Traverse up
            for i in range(bottom, top - 1, -1):
                result.append(matrix[i][left])
            left += 1
            
    return result

def main():
    input_data = sys.stdin.read().split()
    if not input_data:
        return
    rows = int(input_data[0])
    cols = int(input_data[1])
    
    matrix = []
    idx = 2
    for r in range(rows):
        matrix.append([int(x) for x in input_data[idx : idx + cols]])
        idx += cols
        
    res = spiral_order(matrix)
    print(*(res))

if __name__ == "__main__":
    main()
```

---

### 4. Fractional Knapsack
* **Problem**: Maximize the value in a knapsack of capacity $W$ by taking fractions of items.
* **Complexity**: Time $O(N \log N)$ (due to sorting), Space $O(1)$.

#### 🐍 Python 3.8 Solution
```python
import sys

class Item:
    def __init__(self, value, weight):
        self.value = value
        self.weight = weight
        self.ratio = value / weight

def get_max_value(capacity, items):
    # Sort items based on value-to-weight ratio in descending order
    items.sort(key=lambda x: x.ratio, reverse=True)
    
    total_val = 0.0
    for item in items:
        if capacity - item.weight >= 0:
            capacity -= item.weight
            total_val += item.value
        else:
            # Take fraction
            total_val += item.value * (capacity / item.weight)
            break
    return total_val

def main():
    input_data = sys.stdin.read().split()
    if not input_data:
        return
    capacity = int(input_data[0])
    n = int(input_data[1])
    
    items = []
    idx = 2
    for _ in range(n):
        val = int(input_data[idx])
        wt = int(input_data[idx+1])
        items.append(Item(val, wt))
        idx += 2
        
    max_val = get_max_value(capacity, items)
    # Output formatted to 2 decimal places
    print(f"{max_val:.2f}")

if __name__ == "__main__":
    main()
```
