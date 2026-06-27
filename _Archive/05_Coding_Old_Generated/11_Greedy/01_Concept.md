# Greedy Algorithms - Concept Guide

## 1. One-Line Intuition
> **Greedy = at each step, pick the locally best option; never go back.**

---

## 2. ASCII Trace: Activity Selection Problem
Consider 4 activities with start and end times: 
*   $A_1 (1, 3)$
*   $A_2 (2, 5)$
*   $A_3 (3, 8)$
*   $A_4 (6, 9)$

To maximize the number of non-overlapping activities, we sort them by **end times**:
1.  $A_1 (1, 3)$ — Ends at 3
2.  $A_2 (2, 5)$ — Ends at 5
3.  $A_4 (6, 9)$ — Ends at 9
4.  $A_3 (3, 8)$ — Ends at 8 (after sorting: $A_1 \rightarrow A_2 \rightarrow A_3 \rightarrow A_4$)

### Timeline and Step-by-Step Selection Trace:
```text
Time:      1   2   3   4   5   6   7   8   9
Timeline:  |---|---|---|---|---|---|---|---|
A1:        [=======]
A2:            [===========]
A3:                [===================]
A4:                            [===========]

--------------------------------------------------------------------------------
Step 1: Sort by end times:
        A1 (1,3), A2 (2,5), A3 (3,8), A4 (6,9)

Step 2: Inspect A1 (1, 3):
        - Current time limit = 0.
        - Start time (1) >= Current time limit (0).
        - Action: SELECT A1. Update Current time limit = 3 (end time of A1).
        - Selection: [A1]

Step 3: Inspect A2 (2, 5):
        - Start time (2) < Current time limit (3). (Overlap!)
        - Action: REJECT A2.
        - Selection: [A1]

Step 4: Inspect A3 (3, 8):
        - Start time (3) >= Current time limit (3).
        - Action: SELECT A3. Update Current time limit = 8.
        - Selection: [A1, A3]

Step 5: Inspect A4 (6, 9):
        - Start time (6) < Current time limit (8). (Overlap!)
        - Action: REJECT A4.
        - Selection: [A1, A3]

Final Selected Activities: A1 and A3 (Total = 2)
--------------------------------------------------------------------------------
```

---

## 3. C++14 Templates

### Template A: Interval Scheduling (Activity Selection)
```cpp
#include <vector>
#include <algorithm>
#include <utility>

std::vector<std::pair<int, int>> selectMaxActivities(const std::vector<int>& start_times, 
                                                     const std::vector<int>& end_times) {
    std::vector<std::pair<int, int>> activities;
    for (size_t i = 0; i < start_times.size(); i++) {
        activities.push_back({start_times[i], end_times[i]});
    }
    
    // Sort by end times
    std::sort(activities.begin(), activities.end(), [](const std::pair<int, int>& a, const std::pair<int, int>& b) {
        return a.second < b.second;
    });
    
    std::vector<std::pair<int, int>> selected_activities;
    int last_end_time = -1;
    
    for (const auto& act : activities) {
        if (act.first >= last_end_time) {
            selected_activities.push_back(act);
            last_end_time = act.second;
        }
    }
    return selected_activities;
}
```

### Template B: Fractional Knapsack
```cpp
#include <vector>
#include <algorithm>

struct Item {
    double ratio;
    int weight;
    int value;
};

double fractionalKnapsack(const std::vector<int>& weights, const std::vector<int>& values, int capacity) {
    std::vector<Item> items;
    for (size_t i = 0; i < weights.size(); i++) {
        items.push_back({(double)values[i] / weights[i], weights[i], values[i]});
    }
    
    // Sort by ratio in descending order
    std::sort(items.begin(), items.end(), [](const Item& a, const Item& b) {
        return a.ratio > b.ratio;
    });
    
    double total_value = 0.0;
    int remaining_capacity = capacity;
    
    for (const auto& item : items) {
        if (remaining_capacity >= item.weight) {
            total_value += item.value;
            remaining_capacity -= item.weight;
        } else {
            total_value += item.ratio * remaining_capacity;
            break; // Knapsack is full
        }
    }
    return total_value;
}
```

### Template C: Minimum Coins (Greedy Change)
```cpp
#include <vector>
#include <algorithm>

int minCoinsGreedy(std::vector<int>& coins, int target_amount) {
    // Sort in descending order
    std::sort(coins.rbegin(), coins.rend());
    
    int coin_count = 0;
    int remaining_amount = target_amount;
    
    for (int coin_value : coins) {
        if (remaining_amount == 0) break;
        
        int count = remaining_amount / coin_value;
        coin_count += count;
        remaining_amount -= count * coin_value;
    }
    return remaining_amount == 0 ? coin_count : -1;
}
```

---

## 4. Recognition Patterns
**Use Greedy when you see:**
*   **Optimization Keywords:** "minimize", "maximize", "at least", "at most".
*   **Selection Context:** "pick elements", "select non-overlapping intervals", "find the largest possible value".
*   **Subsegments/Time:** Intervals, deadlines, start/end schedules, meeting rooms.
*   **Independent Subproblems:** The local optimal choice directly contributes to the global optimal without needing downstream values.

---

## 5. When Greedy Fails vs When it Works

### ❌ When Greedy Fails (Counter-Example: Coin Change System)
*   **Context:** Coins = `[1, 3, 4]`, Target Amount = `6`.
*   **Greedy Choice:** 
    *   Pick largest denomination first: `4`. Remaining amount $= 6 - 4 = 2$.
    *   Pick `1` (since `3` is too large). Remaining $= 1$.
    *   Pick `1`. Remaining $= 0$.
    *   Total coins used: `3` (using `4, 1, 1`).
*   **Optimal Choice (Dynamic Programming / Brute Force):** 
    *   Pick two `3` coins: `3, 3` ($3 + 3 = 6$).
    *   Total coins used: `2`.
*   **Reason for Failure:** The choice of `4` at the first step limits our options for subsequent steps. There is no optimal substructure where local choices sum to the global optimum.

### Algorithm Comparison Table:
| Feature | Greedy Approach | Dynamic Programming / Brute Force |
| :--- | :--- | :--- |
| **Locally Best Choice** | Yes (Fast, never backtracks) | No (Checks all subproblems) |
| **Optimality Guarantee** | Only under specific constraints | Always guaranteed |
| **Time Complexity** | $O(N \log N)$ (due to sorting) | $O(N \times S)$ or $O(2^N)$ |

---

## 6. TCS NQT-Style Problems

### Problem 1: Job Sequencing with Deadlines
**Problem Statement:** You are given $N$ jobs, where each job has a deadline and associated profit. Each job takes 1 unit of time. Only one job can be scheduled at any time. Find the maximum profit and the number of jobs completed.

#### 1. Brute Force Approach
*   **Concept:** Generate all permutations of job schedules, filter out invalid schedules where jobs exceed their deadlines, and find the schedule with maximum profit.
*   **Complexity:** Time: $O(N!)$, Space: $O(N)$ for recursion stack.

#### 2. Greedy Optimization
*   **Concept:** Sort all jobs in descending order of profit. Find the latest available slot for each job before its deadline and schedule it there.
*   **C++ & Python Code Solutions:**

```python
# Python: Job Sequencing with Deadlines
def solve_job_sequencing(jobs: list[dict]) -> tuple[int, int]:
    # jobs is a list of dicts: [{'id': 1, 'deadline': 4, 'profit': 70}, ...]
    # Sort by profit descending
    jobs.sort(key=lambda x: x['profit'], reverse=True)
    
    max_deadline = max(job['deadline'] for job in jobs)
    time_slots = [-1] * (max_deadline + 1)  # 1-based indexing
    
    total_profit = 0
    jobs_count = 0
    
    for job in jobs:
        # Try to schedule this job at the latest possible slot before deadline
        for slot in range(job['deadline'], 0, -1):
            if time_slots[slot] == -1:
                time_slots[slot] = job['id']
                total_profit += job['profit']
                jobs_count += 1
                break
                
    return jobs_count, total_profit
```

```cpp
// C++: Job Sequencing with Deadlines
#include <iostream>
#include <vector>
#include <algorithm>

struct Job {
    char id;
    int deadline;
    int profit;
};

bool compareJobs(Job a, Job b) {
    return (a.profit > b.profit);
}

std::pair<int, int> solveJobSequencing(std::vector<Job>& jobs) {
    std::sort(jobs.begin(), jobs.end(), compareJobs);
    
    int maxDeadline = 0;
    for (const auto& job : jobs) {
        maxDeadline = std::max(maxDeadline, job.deadline);
    }
    
    std::vector<int> timeSlots(maxDeadline + 1, -1);
    int totalProfit = 0;
    int jobsCount = 0;
    
    for (const auto& job : jobs) {
        for (int slot = job.deadline; slot > 0; --slot) {
            if (timeSlots[slot] == -1) {
                timeSlots[slot] = job.id;
                totalProfit += job.profit;
                jobs_count++;
                break;
            }
        }
    }
    return {jobsCount, totalProfit};
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N \log N + N \times M)$ where $M$ is the maximum deadline.
    *   **Space Complexity:** $O(M)$ to keep track of filled slots.

---

### Problem 2: Minimum Platforms Required
**Problem Statement:** Given arrival and departure times of all trains that reach a railway station, find the minimum number of platforms required for the railway station so that no train waits.

#### 1. Brute Force Approach
*   **Concept:** For each train interval, find the number of other trains whose intervals overlap with it. The maximum overlap count represents the platform requirement.
*   **Complexity:** Time: $O(N^2)$, Space: $O(1)$.

#### 2. Greedy Optimization
*   **Concept:** Sort arrival and departure times independently. Use two pointers to simulate train arrival and departures chronologically. Maintain a count of active platforms.
*   **C++ & Python Code Solutions:**

```python
# Python: Minimum Platforms
def find_minimum_platforms(arrival: list[int], departure: list[int]) -> int:
    arrival.sort()
    departure.sort()
    
    arr_ptr = 0
    dep_ptr = 0
    
    active_platforms = 0
    max_platforms = 0
    
    while arr_ptr < len(arrival):
        # If train arrives before the previous train departs, we need another platform
        if arrival[arr_ptr] <= departure[dep_ptr]:
            active_platforms += 1
            arr_ptr += 1
            max_platforms = max(max_platforms, active_platforms)
        else:
            # A train has departed, free up a platform
            active_platforms -= 1
            dep_ptr += 1
            
    return max_platforms
```

```cpp
// C++: Minimum Platforms
#include <iostream>
#include <vector>
#include <algorithm>

int findMinimumPlatforms(std::vector<int>& arrival, std::vector<int>& departure) {
    std::sort(arrival.begin(), arrival.end());
    std::sort(departure.begin(), departure.end());
    
    int n = arrival.size();
    int arrPtr = 0, depPtr = 0;
    int activePlatforms = 0, maxPlatforms = 0;
    
    while (arrPtr < n) {
        if (arrival[arrPtr] <= departure[depPtr]) {
            activePlatforms++;
            arrPtr++;
            maxPlatforms = std::max(maxPlatforms, activePlatforms);
        } else {
            activePlatforms--;
            depPtr++;
        }
    }
    return maxPlatforms;
}
```

*   **Complexity Analysis:**
    *   **Time Complexity:** $O(N \log N)$ due to sorting.
    *   **Space Complexity:** $O(1)$ auxiliary space.
