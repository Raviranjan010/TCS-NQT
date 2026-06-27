# Time & Work — Coding Applications & Challenges

In programming, rate calculations apply to task scheduling queues, network throttling (token bucket algorithms), and thread pool execution time estimates.

---

## 1. Token Bucket Rate Limiter Algorithm

### The Problem
Implement a rate limiter that allows a maximum of $B$ requests (bucket capacity) and regenerates tokens at a constant rate of $R$ tokens per second (work rate).

### The Solution
Use the elapsed time to calculate the number of tokens to add to the bucket, avoiding active polling loops.

#### C++
```cpp
#include <iostream>
#include <algorithm>
#include <chrono>
#include <thread>
using namespace std;

class TokenBucket {
private:
    double capacity;
    double tokens;
    double fill_rate; // tokens per second
    chrono::steady_clock::time_point last_check;

public:
    TokenBucket(double cap, double rate) : capacity(cap), tokens(cap), fill_rate(rate) {
        last_check = chrono::steady_clock::now();
    }

    bool allowRequest(double tokens_requested) {
        auto now = chrono::steady_clock::now();
        double elapsed = chrono::duration_cast<chrono::duration<double>>(now - last_check).count();
        last_check = now;

        // Add tokens generated in elapsed time
        tokens = min(capacity, tokens + elapsed * fill_rate);

        if (tokens >= tokens_requested) {
            tokens -= tokens_requested;
            return true;
        }
        return false;
    }
};

int main() {
    TokenBucket rate_limiter(10.0, 2.0); // Capacity 10, regenerates 2 per second
    cout << boolalpha;
    cout << "Allow 5: " << rate_limiter.allowRequest(5.0) << endl; // Output: true
    cout << "Allow 6: " << rate_limiter.allowRequest(6.0) << endl; // Output: false
    return 0;
}
```

---

## 2. LeetCode References

These platform problems test your ability to apply rate scheduling and task completion timers:

1.  **LeetCode 621 — Task Scheduler:** Finding the minimum time to complete all CPU tasks with cooling periods.
    *   *Reference:* [LeetCode 621](https://leetcode.com/problems/task-scheduler/)
2.  **LeetCode 875 — Koko Eating Bananas:** Finding the minimum rate $K$ to eat all bananas within $H$ hours (Binary Search on rates).
    *   *Reference:* [LeetCode 875](https://leetcode.com/problems/koko-eating-bananas/)\n