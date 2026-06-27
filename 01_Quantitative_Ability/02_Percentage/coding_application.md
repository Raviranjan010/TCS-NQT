# Percentage — Coding Applications & Challenges

In technical assessments and coding rounds (such as the TCS NQT Advanced Coding section), percentage calculations frequently appear in business logic, data analysis, and optimization problems.

---

## 1. Floating-Point Precision & Rounding Traps

### The Problem
In languages like C++ and Java, division of two integers yields another integer, truncating any fractional remainder (e.g., `5 / 100` equals `0`, not `0.05`). 

### The Solution
*   Cast variables to floating-point types (`float` or `double`) before performing percentage operations.
*   In Python, `/` performs float division by default, but you must watch out for floating-point inaccuracies (e.g., `0.1 + 0.2` is not exactly `0.3`).

### Rounding to N Decimals
When the exam platform requests output rounded to exactly two decimal places, use standard formatting operations:

#### C++
```cpp
#include <iostream>
#include <iomanip>
using namespace std;

double calculatePercentage(double part, double total) {
    return (part / total) * 100.0;
}

int main() {
    double part = 45.0, total = 300.0;
    cout << fixed << setprecision(2) << calculatePercentage(part, total) << "%" << endl;
    return 0;
}
```

#### Python
```python
def calculate_percentage(part: float, total: float) -> str:
    ans = (part / total) * 100.0
    return f"{ans:.2f}%"

print(calculate_percentage(45, 300))
```

---

## 2. LeetCode References

These platform problems test your ability to apply percentage and scaling calculations correctly in code structures:

1.  **LeetCode 2283 — Check if Number Has Equal Digit Count and Miscellaneous Match:** Involves indexing counts and frequencies.
    *   *Reference:* [LeetCode 2283](https://leetcode.com/problems/check-if-number-has-equal-digit-count-and-digit-value/)
2.  **LeetCode 1360 — Number of Days Between Two Dates:** Often used in compound interest/depreciation calculations where the time interval $n$ must be computed from dates.
    *   *Reference:* [LeetCode 1360](https://leetcode.com/problems/number-of-days-between-two-dates/)
3.  **LeetCode 908 — Smallest Range I:** Requires applying percentage margins and ranges to arrays.
    *   *Reference:* [LeetCode 908](https://leetcode.com/problems/smallest-range-i/)
