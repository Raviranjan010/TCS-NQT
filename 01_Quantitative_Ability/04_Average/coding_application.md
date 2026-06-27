# Average — Coding Applications & Challenges

In coding rounds (such as the TCS NQT Advanced Coding section), calculating averages appears in time-series data analysis (moving averages), statistics, and array partitioning.

---

## 1. Sliding Window Moving Average

### The Problem
In financial analysis or sensor stream processing, we often need to compute the average of the last $K$ elements in a continuous stream of data. Re-summing all $K$ elements at each step is inefficient ($O(K)$ time complexity).

### The Solution (Sliding Window)
To compute the moving average in $O(1)$ time, maintain a running sum. When the window slides, add the new element and subtract the oldest element from the sum.

#### C++
```cpp
#include <iostream>
#include <vector>
#include <numeric>
using namespace std;

class MovingAverage {
private:
    vector<int> stream;
    int size;
    double running_sum;
    int head;

public:
    MovingAverage(int k) : size(k), running_sum(0.0), head(0) {}

    double next(int val) {
        stream.push_back(val);
        running_sum += val;
        if (stream.size() > size) {
            running_sum -= stream[head];
            head++;
        }
        return running_sum / min((int)stream.size(), size);
    }
};

int main() {
    MovingAverage m(3);
    cout << m.next(1) << endl; // Output: 1.0
    cout << m.next(10) << endl; // Output: 5.5
    cout << m.next(3) << endl; // Output: 4.67
    cout << m.next(5) << endl; // Output: 6.0
    return 0;
}
```

---

## 2. LeetCode References

These platform problems test your ability to apply sliding window averages and mean-based partitions in code:

1.  **LeetCode 346 — Moving Average from Data Stream:** Implementing a sliding window moving average.
    *   *Reference:* [LeetCode 346](https://leetcode.com/problems/moving-average-from-data-stream/)
2.  **LeetCode 643 — Maximum Average Subarray I:** Finding a contiguous subarray of size $k$ with the maximum average value.
    *   *Reference:* [LeetCode 643](https://leetcode.com/problems/maximum-average-subarray-i/)
3.  **LeetCode 813 — Largest Sum of Averages:** Partitioning an array into at most $K$ adjacent groups to maximize the sum of group averages (Dynamic Programming).
    *   *Reference:* [LeetCode 813](https://leetcode.com/problems/largest-sum-of-averages/)
