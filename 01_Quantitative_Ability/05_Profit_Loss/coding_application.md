# Profit & Loss — Coding Applications & Challenges

In technical assessments, Profit & Loss principles appear in optimization algorithms, price calculation scripts, and array transactions (like stock trading).

---

## 1. Stock Trading Profit Maximization

### The Problem
Given an array `prices` where `prices[i]` is the price of a given stock on the $i$-th day. Find the maximum profit you can achieve by buying and selling that stock.

### The Solution (Kadane's Algorithm variation)
Instead of comparing every pair of days ($O(N^2)$), maintain a running minimum price and compare it to the current day's price to track maximum profit ($O(N)$ time, $O(1)$ space).

#### C++
```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int maxProfit(vector<int>& prices) {
    int min_price = 1e9;
    int max_profit = 0;
    for (int price : prices) {
        min_price = min(min_price, price);
        max_profit = max(max_profit, price - min_price);
    }
    return max_profit;
}

int main() {
    vector<int> prices = {7, 1, 5, 3, 6, 4};
    cout << "Max Profit: " << maxProfit(prices) << endl; // Output: 5 (buy at 1, sell at 6)
    return 0;
}
```

---

## 2. LeetCode References

These platform problems test your ability to apply profit-loss boundaries and optimizations in code:

1.  **LeetCode 121 — Best Time to Buy and Sell Stock:** Finding maximum profit from a single transaction.
    *   *Reference:* [LeetCode 121](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
2.  **LeetCode 122 — Best Time to Buy and Sell Stock II:** Finding maximum profit from multiple transactions (Greedy approach).
    *   *Reference:* [LeetCode 122](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)
3.  **LeetCode 309 — Best Time to Buy and Sell Stock with Cooldown:** Stock trading with state machine transitions.
    *   *Reference:* [LeetCode 309](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/)\n