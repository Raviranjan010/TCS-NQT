# Ratio & Proportion — Coding Applications & Challenges

In advanced coding rounds (like the TCS NQT Advanced Coding section), ratio and proportion calculations are used for fraction simplification, scaling algorithms, and array partitioning.

---

## 1. Fraction Simplification & Greatest Common Divisor (GCD)

### The Problem
When calculating ratios in code, keeping numbers in raw form can lead to integer overflow or floating-point inaccuracies. Ratios should always be stored in their simplest integer form:
$$a : b = \frac{a}{\text{gcd}(a,b)} : \frac{b}{\text{gcd}(a,b)}$$

### The Solution
Use the Euclidean algorithm to find the GCD of two numbers and divide both by it.

#### C++
```cpp
#include <iostream>
#include <numeric> // For std::gcd in C++17
using namespace std;

void simplifyRatio(int &a, int &b) {
    int divisor = std::gcd(a, b);
    a /= divisor;
    b /= divisor;
}

int main() {
    int a = 24, b = 36;
    simplifyRatio(a, b);
    cout << "Simplified Ratio: " << a << ":" << b << endl; // Output: 2:3
    return 0;
}
```

#### Python
```python
import math

def simplify_ratio(a: int, b: int) -> tuple:
    divisor = math.gcd(a, b)
    return a // divisor, b // divisor

print(f"Simplified Ratio: {simplify_ratio(24, 36)}") # Output: (2, 3)
```

---

## 2. LeetCode References

These platform problems test your ability to apply ratios and proportion scaling correctly:

1.  **LeetCode 914 — X of a Kind in a Deck of Cards:** Requires finding if the counts of cards share a common divisor $> 1$, which is a direct application of simplified ratios.
    *   *Reference:* [LeetCode 914](https://leetcode.com/problems/x-of-a-kind-in-a-deck-of-cards/)
2.  **LeetCode 149 — Max Points on a Line:** Requires comparing slopes of lines. Slopes are calculated as ratios of $(y_2 - y_1) : (x_2 - x_1)$. To avoid precision issues with float slopes, store the slopes as simplified fraction pairs using GCD.
    *   *Reference:* [LeetCode 149](https://leetcode.com/problems/max-points-on-a-line/)
3.  **LeetCode 581 — Shortest Unsorted Continuous Subarray:** Often analyzed using proportions and bounds.
    *   *Reference:* [LeetCode 581](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/)
