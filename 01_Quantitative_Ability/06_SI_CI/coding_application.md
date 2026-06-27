# Simple & Compound Interest — Coding Applications & Challenges

In software engineering assessments, compounding formulas are used in amortization schedules, bank ledger algorithms, and cryptocurrency staking computations.

---

## 1. Interest Compounding Precision Algorithm

### The Problem
When calculating compound interest over a large number of periods, using standard `float` or `double` data types can introduce floating-point rounding errors due to binary representation limits.

### The Solution (Scaled Integer Arithmetic)
In financial ledgers, store currency values as integers representing the smallest unit (e.g., Cents/Paise) to prevent precision loss.

#### Python
```python
def calculate_compound_interest(principal_cents: int, annual_rate: float, periods: int) -> int:
    # rate is compounding per period
    rate_factor = 1.0 + annual_rate
    amount = principal_cents
    for _ in range(periods):
        amount = int(amount * rate_factor) # round to nearest cent per period
    return amount - principal_cents

# Example: 10,000.00 Rupees (1,000,000 Paise) at 5% for 3 years
interest_paise = calculate_compound_interest(1000000, 0.05, 3)
print(f"Interest: {interest_paise / 100:.2f} Rupees") # Output: 1576.25 Rupees
```

---

## 2. LeetCode References

These platform problems test your ability to apply compounding math and interest calculations:

1.  **LeetCode 372 — Super Pow:** Requires modular exponentiation, which is mathematically related to compounding rates over large values.
    *   *Reference:* [LeetCode 372](https://leetcode.com/problems/super-pow/)
2.  **LeetCode 172 — Factorial Trailing Zeroes:** Uses prime division bases similar to period analysis.
    *   *Reference:* [LeetCode 172](https://leetcode.com/problems/factorial-trailing-zeroes/)\n