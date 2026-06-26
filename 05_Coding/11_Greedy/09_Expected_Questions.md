# Greedy - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Greedy Algorithms.

---

## 1. GR-01: Activity Selection Problem

*   **Problem Statement**: You are given $N$ activities with their start and end times. Select the maximum number of activities that can be performed by a single person, assuming that a person can only work on a single activity at a time.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $1 \le \text{start}[i] < \text{end}[i] \le 10^9$
    *   *Sample Input*: `start = [1, 3, 0, 5, 8, 5]`, `end = [2, 4, 6, 7, 9, 9]` $\implies$ *Sample Output*: `4` (activities: `(1, 2)`, `(3, 4)`, `(5, 7)`, `(8, 9)`)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sort by Start Time** | Sort activities by start time. Choose next non-overlapping activity. | $O(N \log N)$ | $O(N)$ | **Incorrect**. Greedy choice fails (e.g., an activity starting early could run for a very long time, blocking all others). |
| **Optimal Sort by End Time** | Sort activities by end time. Choose next activity whose start time is $\ge$ end time of previously selected activity. | $O(N \log N)$ | $O(N)$ | Correct. Maximizes remaining free time slot. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

struct Activity {
    int start;
    int end;
};

int maxActivities(const std::vector<int>& start, const std::vector<int>& end) {
    int n = start.size();
    std::vector<Activity> arr(n);
    for (int i = 0; i < n; i++) {
        arr[i] = {start[i], end[i]};
    }
    
    // Sort activities by end time ascending
    std::sort(arr.begin(), arr.end(), [](const Activity& a, const Activity& b) {
        return a.end < b.end;
    });
    
    int count = 0;
    int last_end_time = -1;
    
    for (int i = 0; i < n; i++) {
        if (arr[i].start >= last_end_time) {
            count++;
            last_end_time = arr[i].end; // Move pointer boundary
        }
    }
    return count;
}
```

### Dry Run Table
Input: `start = [1, 3, 0, 5, 8, 5]`, `end = [2, 4, 6, 7, 9, 9]`
Sorted by end times: `(1, 2)`, `(3, 4)`, `(0, 6)`, `(5, 7)`, `(8, 9)`, `(5, 9)`

| Step | Activity (Start, End) | `last_end_time` | Check: `start >= last_end_time` | Action | Count |
| :---: | :--- | :---: | :---: | :--- | :---: |
| 1 | `(1, 2)` | -1 | $1 \ge -1$ (True) | Select, update `last_end_time` = 2 | 1 |
| 2 | `(3, 4)` | 2 | $3 \ge 2$ (True) | Select, update `last_end_time` = 4 | 2 |
| 3 | `(0, 6)` | 4 | $0 \ge 4$ (False) | Reject (overlap) | 2 |
| 4 | `(5, 7)` | 4 | $5 \ge 4$ (True) | Select, update `last_end_time` = 7 | 3 |
| 5 | `(8, 9)` | 7 | $8 \ge 7$ (True) | Select, update `last_end_time` = 9 | 4 |
| 6 | `(5, 9)` | 9 | $5 \ge 9$ (False) | Reject (overlap) | 4 |

### Complexity Analysis
*   **Time Complexity**: $O(N \log N)$ — Dominated by the sorting operation. The scan is linear $O(N)$.
*   **Space Complexity**: $O(N)$ — To store the struct array.

### Shortcut & Math Derivation
*   **Derivation**: Why sort by end time? The greedy choice is to always pick the activity that finishes as early as possible. By choosing the activity with the minimal finish time, we maximize the remaining time left for other activities.
*   **Real Number Demo**: With `(1, 10)` and `(2, 3), (4, 5)`.
    *   If we sort by start: select `(1, 10)` $\implies$ count = 1.
    *   If we sort by end: select `(2, 3)` then `(4, 5)` $\implies$ count = 2.

### Variation & Trap
*   **Trap**: Not storing original activity indices when required by the output. Use a struct containing start, end, and original index.
*   **Variation**: N-Meetings in one room. Same problem, outputting 1-based indices of meetings selected.

---

## 2. GR-02: Fractional Knapsack Problem

*   **Problem Statement**: Given weights and values of $N$ items, we need to put these items in a knapsack of capacity $W$ to get the maximum total value in the knapsack. We can break items for maximizing the total value.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $1 \le W \le 10^9$
    *   $1 \le \text{weights}[i], \text{values}[i] \le 10^6$
    *   *Sample Input*: `values = [60, 100, 120]`, `weights = [10, 20, 30]`, capacity $W = 50$ $\implies$ *Sample Output*: `240.00` (Take item 1 completely, item 2 completely, and 2/3 of item 3. Total value $= 60 + 100 + (2/3) \times 120 = 240$)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sort by Weight** | Take lightest items first. | $O(N \log N)$ | $O(N)$ | **Incorrect**. Light items might have very low value. |
| **Optimal Ratio Sorting** | Sort items by value/weight ratio descending. Take full items until full; take fraction of next item to fill. | $O(N \log N)$ | $O(N)$ | Correct. Yields maximum value density per unit capacity. |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <algorithm>
#include <iomanip>

struct Item {
    int value;
    int weight;
    double ratio;
};

double fractionalKnapsack(int W, const std::vector<int>& values, const std::vector<int>& weights) {
    int n = values.size();
    std::vector<Item> arr(n);
    for (int i = 0; i < n; i++) {
        arr[i] = {values[i], weights[i], (double)values[i] / weights[i]};
    }
    
    // Sort by ratio in descending order
    std::sort(arr.begin(), arr.end(), [](const Item& a, const Item& b) {
        return a.ratio > b.ratio;
    });
    
    double total_value = 0.0;
    int remaining_capacity = W;
    
    for (int i = 0; i < n; i++) {
        if (remaining_capacity >= arr[i].weight) {
            total_value += arr[i].value;
            remaining_capacity -= arr[i].weight;
        } else {
            // Take fraction of item
            total_value += arr[i].ratio * remaining_capacity;
            break; // Knapsack is full
        }
    }
    return total_value;
}
```

### Dry Run Table
Input: `values = [60, 100, 120]`, `weights = [10, 20, 30]`, $W = 50$.
Ratios: Item 1: 6.0, Item 2: 5.0, Item 3: 4.0 (already sorted descending).

| Step | Item index | Weight | Value | `remaining_capacity` | Taken | Total Value |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| 1 | 0 (ratio 6) | 10 | 60 | $50 - 10 = 40$ | 100% | 60.0 |
| 2 | 1 (ratio 5) | 20 | 100 | $40 - 20 = 20$ | 100% | $60 + 100 = 160.0$ |
| 3 | 2 (ratio 4) | 30 | 120 | 20 | Fraction: 20/30 (2/3) | $160 + (2/3) \times 120 = 240.0$ |

### Complexity Analysis
*   **Time Complexity**: $O(N \log N)$ — Sorting step. Loop runs in $O(N)$ time.
*   **Space Complexity**: $O(N)$ — Array of structs.

### Shortcut & Math Derivation
*   **Derivation**: By sorting items by value-to-weight ratio $V_i / W_i$, we prioritize items that give the maximum value density. Let $X_i \in [0, 1]$ be fraction of item $i$ taken. We want to maximize $\sum X_i V_i$ subject to $\sum X_i W_i \le W$. Picking by density guarantees optimal fractional fill.
*   **Real Number Demo**: If Knapsack has space for 10 kg. Item A: 10 kg, value $100$ (density 10). Item B: 5 kg, value $80$ (density 16).
    *   If we take A: value $= 100$.
    *   If we take B, and half of A: value $= 80 + (5/10) \times 100 = 130$. (Optimal)

### Variation & Trap
*   **Trap**: Attempting this for 0-1 Knapsack (where items cannot be broken). 0-1 Knapsack is solved using Dynamic Programming, not Greedy.
*   **Variation**: Fractional Knapsack with profit-minimizing penalty costs.
