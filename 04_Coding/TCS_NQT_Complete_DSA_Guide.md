# 🚀 TCS NQT Complete DSA Preparation Guide
### C++ Solutions | Deep Explanations | Tricks & Mnemonics

> **How to use this guide:** Each problem has → Problem understanding → Approach → Optimized C++ code → Line-by-line explanation → Time/Space complexity → Tricks & shortcuts → Memory aids

> **C++ note:** The snippets use standard library types and algorithms. Compile them with
> `#include <bits/stdc++.h>` and `using namespace std;` (GCC/Clang), or include the
> individual standard headers on other compilers. Platform-provided declarations such as
> `ListNode` and `isBadVersion` are intentionally not repeated.

---

# 📅 DAY 1 — Number System & Math

## 🔑 Topic Tricks (Day 1 Master Sheet)
| Trick | Formula |
|---|---|
| GCD via Euclidean | `gcd(a,b) = gcd(b, a%b)` until b=0 |
| LCM | `lcm(a,b) = (a/gcd(a,b)) * b` (divide first to avoid overflow) |
| Check Prime | Loop i from 2 to √n only |
| Count digits | `floor(log10(n)) + 1` |
| Sum of digits | Keep doing `n % 10` and `n /= 10` |
| Fast Power | `pow(x,n) = pow(x*x, n/2)` if n is even |
| Fibonacci (fast) | Matrix exponentiation or memoization |

> 🧠 **Mnemonic for GCD:** "**B**ig **A**lways **R**eplaces **A**rea" → `gcd(a,b)` → keep taking `(b, a%b)` → **B**ig becomes **R**emainder

---

## Hour 1 — Number System Basics

---

### Problem 1: Count Primes
**📌 Task:** Count all prime numbers strictly less than `n`.

**🧠 Approach — Sieve of Eratosthenes:**
- Mark all numbers as prime initially
- For every prime `p`, mark all multiples of `p` as not prime
- Start from `p*p` (everything before that already marked)

```cpp
class Solution {
public:
    int countPrimes(int n) {
        if (n < 2) return 0;
        
        // Step 1: Create boolean array, true = "is prime"
        vector<bool> isPrime(n, true);
        isPrime[0] = isPrime[1] = false; // 0 and 1 are not prime
        
        // Step 2: Sieve — only go up to sqrt(n)
        for (int i = 2; (long long)i * i < n; i++) {
            if (isPrime[i]) {
                // Mark all multiples of i starting from i*i
                for (int j = i * i; j < n; j += i) {
                    isPrime[j] = false;
                }
            }
        }
        
        // Step 3: Count remaining true values
        return count(isPrime.begin(), isPrime.end(), true);
    }
};
```

**📖 Explanation:**
- We don't start j from `2*i` because those were already marked by smaller primes
- Starting `j` from `i*i` saves ~50% of inner loop work
- `(long long)i*i` avoids integer overflow for large n

**⚡ Complexity:** Time: O(n log log n) | Space: O(n)

**🎯 Trick:** "Start marking from `p²`, not `2p`" — everything before `p²` was already caught by a smaller prime.

---

### Problem 2: Power of Two
**📌 Task:** Return true if n is a power of 2.

**🧠 Approach — Bit Trick:**
- Powers of 2 in binary: `1, 10, 100, 1000...` — exactly ONE bit set
- `n & (n-1)` clears the lowest set bit
- If n is power of 2: `n & (n-1) == 0`

```cpp
class Solution {
public:
    bool isPowerOfTwo(int n) {
        // n must be positive AND have exactly one bit set
        return n > 0 && (n & (n - 1)) == 0;
    }
};
```

**📖 Explanation:**
- `n = 8`  → binary `1000`, `n-1 = 7` → `0111`, AND = `0000` ✅
- `n = 6`  → binary `0110`, `n-1 = 5` → `0101`, AND = `0100` ❌
- `n <= 0` → not a power of 2 (handles negative and zero)

**⚡ Complexity:** Time: O(1) | Space: O(1)

**🎯 Trick:** "**AND with neighbor kills the bit**" — if only one bit exists, the number becomes 0.

---

### Problem 3: Ugly Number
**📌 Task:** Return true if n is an ugly number (prime factors only 2, 3, 5).

**🧠 Approach — Divide repeatedly:**
- Keep dividing by 2, 3, 5 as long as divisible
- If final result is 1 → ugly number

```cpp
class Solution {
public:
    bool isUgly(int n) {
        if (n <= 0) return false; // Ugly numbers are positive
        
        // Divide out all factors of 2, 3, 5
        for (int factor : {2, 3, 5}) {
            while (n % factor == 0) {
                n /= factor;
            }
        }
        
        // If only 2,3,5 factors existed, n becomes 1
        return n == 1;
    }
};
```

**📖 Explanation:**
- After removing all 2s, 3s, 5s → if anything remains (like 7, 11...) → NOT ugly
- Example: `12 = 2*2*3` → divide by 2 twice → 3, divide by 3 → 1 ✅
- Example: `14 = 2*7` → divide by 2 → 7, can't divide by 3 or 5 → 7 ≠ 1 ❌

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**Peel the onion**" — strip away 2s, 3s, 5s layer by layer. Core should be empty (=1).

---

## Hour 2 — Digit Manipulation

---

### Problem 4: Palindrome Number
**📌 Task:** Check if an integer reads the same forward and backward.

```cpp
class Solution {
public:
    bool isPalindrome(int x) {
        // Negative numbers and numbers ending in 0 (except 0) can't be palindromes
        if (x < 0 || (x % 10 == 0 && x != 0)) return false;
        
        int reversed = 0;
        // Only reverse HALF the number — compare with other half
        while (x > reversed) {
            reversed = reversed * 10 + x % 10;
            x /= 10;
        }
        
        // Even digits: x == reversed
        // Odd digits: x == reversed/10 (middle digit doesn't matter)
        return x == reversed || x == reversed / 10;
    }
};
```

**📖 Explanation:**
- Reversing only half avoids overflow and is faster
- `121`: reversed builds to `12`, x becomes `1` → `1 == 12/10` ✅
- `1221`: reversed builds to `12`, x becomes `12` → `12 == 12` ✅

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**Meet in the middle**" — no need to reverse fully, just meet halfway.

---

### Problem 5: Reverse Integer
**📌 Task:** Reverse digits of a 32-bit integer. Return 0 if overflow.

```cpp
class Solution {
public:
    int reverse(int x) {
        int result = 0;
        
        while (x != 0) {
            int digit = x % 10;  // Extract last digit
            x /= 10;             // Remove last digit
            
            // Overflow check BEFORE multiplying
            // INT_MAX = 2147483647, INT_MIN = -2147483648
            if (result > INT_MAX / 10 || (result == INT_MAX / 10 && digit > 7)) return 0;
            if (result < INT_MIN / 10 || (result == INT_MIN / 10 && digit < -8)) return 0;
            
            result = result * 10 + digit;
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- Check overflow BEFORE the multiplication (too late after)
- `INT_MAX = 2147483647` → last digit is 7, `INT_MIN` last digit is -8
- `x % 10` in C++ preserves the sign (negative x gives negative digit)

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**Check before you wreck**" — always check overflow before `result * 10`.

---

### Problem 6: Add Digits
**📌 Task:** Repeatedly add digits until single digit. (Digital Root)

```cpp
class Solution {
public:
    int addDigits(int num) {
        // Mathematical formula using Digital Root
        // Digital root = 1 + (num - 1) % 9
        if (num == 0) return 0;
        return 1 + (num - 1) % 9;
    }
};
```

**📖 Explanation:**
- Pattern: 1→1, 9→9, 10→1, 18→9, 19→1, 99→9, 100→1
- The answer cycles with period 9
- Formula: `1 + (n-1) % 9`
- Special case: 0 → 0

**⚡ Complexity:** Time: O(1) | Space: O(1)

**🎯 Trick:** "**The 9-cycle trick**" — digital root always follows mod 9 pattern. Memorize: `num == 0 ? 0 : 1 + (num-1)%9`

---

## Hour 3 — Fibonacci & Factorial

---

### Problem 7: Fibonacci Number
**📌 Task:** Return F(n) where F(0)=0, F(1)=1, F(n)=F(n-1)+F(n-2).

```cpp
class Solution {
public:
    int fib(int n) {
        if (n <= 1) return n;
        
        // Iterative: O(1) space, O(n) time
        int prev2 = 0, prev1 = 1;
        
        for (int i = 2; i <= n; i++) {
            int curr = prev1 + prev2;  // F(n) = F(n-1) + F(n-2)
            prev2 = prev1;
            prev1 = curr;
        }
        
        return prev1;
    }
};
```

**📖 Explanation:**
- We only need the last 2 values → use two variables (not an array)
- `prev2` = F(i-2), `prev1` = F(i-1), `curr` = F(i)
- After loop, `prev1` holds F(n)

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Two-pointer Fibonacci**" — like a sliding window of size 2.

---

### Problem 8: Climbing Stairs
**📌 Task:** n steps, can climb 1 or 2 at a time. How many distinct ways to reach top?

```cpp
class Solution {
public:
    int climbStairs(int n) {
        // KEY INSIGHT: This IS Fibonacci!
        // ways(n) = ways(n-1) + ways(n-2)
        // (last step was 1-step OR last step was 2-step)
        
        if (n <= 2) return n;
        
        int a = 1, b = 2;  // ways(1)=1, ways(2)=2
        
        for (int i = 3; i <= n; i++) {
            int c = a + b;
            a = b;
            b = c;
        }
        
        return b;
    }
};
```

**📖 Explanation:**
- `ways(1)=1` (only {1}), `ways(2)=2` ({1,1} or {2}), `ways(3)=3` ({1,1,1},{1,2},{2,1})
- Pattern is exactly Fibonacci offset by 1
- Recognize this pattern in interviews instantly!

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Climbing = Fibonacci**" — the most famous disguised Fibonacci problem. If you see "1 or 2 steps", it's always Fibonacci.

---

### Problem 9: Pow(x, n)
**📌 Task:** Implement `pow(x, n)` — fast exponentiation.

```cpp
class Solution {
public:
    double myPow(double x, int n) {
        // Handle negative exponent: x^(-n) = (1/x)^n
        long long N = n;  // Use long long: INT_MIN negated overflows int
        if (N < 0) {
            x = 1.0 / x;
            N = -N;
        }
        
        double result = 1.0;
        
        // Fast Power (Binary Exponentiation)
        while (N > 0) {
            if (N % 2 == 1) {   // If current bit is set
                result *= x;    // Multiply current x into result
            }
            x *= x;             // Square x for next bit
            N /= 2;             // Move to next bit
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- `x^8` = `(x^4)^2` = `((x^2)^2)^2` — only 3 multiplications instead of 7
- At each step: if n is odd, grab current x; then square x and halve n
- `long long N` prevents overflow when negating `INT_MIN`

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**Think in binary**" — `x^13 = x^(1101)` = x¹ × x⁴ × x⁸. Fast power reads the binary bits.

---

## Hour 4 — Modular Arithmetic

---

### Problem 10: Happy Number
**📌 Task:** Replace n with sum of squares of its digits, repeat. If reaches 1 → happy. If loops forever → not happy.

```cpp
class Solution {
public:
    int sumOfSquares(int n) {
        int sum = 0;
        while (n > 0) {
            int d = n % 10;
            sum += d * d;
            n /= 10;
        }
        return sum;
    }
    
    bool isHappy(int n) {
        // Floyd's Cycle Detection (slow/fast pointers)
        int slow = n;
        int fast = sumOfSquares(n);
        
        while (fast != 1 && slow != fast) {
            slow = sumOfSquares(slow);           // Move 1 step
            fast = sumOfSquares(sumOfSquares(fast)); // Move 2 steps
        }
        
        return fast == 1;
    }
};
```

**📖 Explanation:**
- Unhappy numbers eventually enter a cycle (never reach 1)
- Use Floyd's cycle detection: if slow meets fast → cycle found → not happy
- If fast reaches 1 → happy

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**Happy = no cycle**" — use the same tortoise & hare trick from linked list cycle detection!

---

### Problem 11: Missing Number
**📌 Task:** Array has n distinct numbers from [0,n]. Find the missing one.

```cpp
class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int n = nums.size();
        
        // Method 1: Math formula — Expected sum minus actual sum
        int expectedSum = n * (n + 1) / 2;
        int actualSum = accumulate(nums.begin(), nums.end(), 0);
        return expectedSum - actualSum;
        
        // Method 2 (XOR): Even faster, no overflow risk
        // int result = n;
        // for (int i = 0; i < n; i++) result ^= i ^ nums[i];
        // return result;
    }
};
```

**📖 Explanation:**
- Sum of 0..n = n*(n+1)/2 (Gauss formula)
- Missing = Expected - Actual
- XOR method: a^a=0, so XOR-ing indices with values cancels pairs, leaving the missing number

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Gauss saves the day**" — expected sum minus actual sum. Always remember: sum 1..n = n(n+1)/2, sum 0..n = n(n+1)/2.

---

### Problem 12: Perfect Number
**📌 Task:** A perfect number equals the sum of its proper divisors. (e.g., 28 = 1+2+4+7+14)

```cpp
class Solution {
public:
    bool checkPerfectNumber(int num) {
        if (num <= 1) return false;
        
        int sum = 1;  // 1 is always a divisor (for num > 1)
        
        // Check divisors up to sqrt(num)
        for (int i = 2; (long long)i * i <= num; i++) {
            if (num % i == 0) {
                sum += i;
                if (i != num / i) {  // Add paired divisor (avoid duplicates for perfect squares)
                    sum += num / i;
                }
            }
        }
        
        return sum == num;
    }
};
```

**📖 Explanation:**
- Divisors come in pairs: if i divides num, so does num/i
- Only need to check up to √num — saves O(√n) vs O(n)
- Add both i and num/i, but handle perfect squares (i == num/i) separately

**⚡ Complexity:** Time: O(√n) | Space: O(1)

**🎯 Trick:** "**Divisors come in pairs**" — for every divisor ≤ √n, there's one ≥ √n. Check half, get both.

---

## Hour 5 — Pattern Problems

---

### Problem 13: Pascal's Triangle
**📌 Task:** Return the first numRows of Pascal's triangle.

```cpp
class Solution {
public:
    vector<vector<int>> generate(int numRows) {
        vector<vector<int>> triangle;
        
        for (int i = 0; i < numRows; i++) {
            // Each row starts and ends with 1
            vector<int> row(i + 1, 1);
            
            // Fill middle elements: triangle[i][j] = triangle[i-1][j-1] + triangle[i-1][j]
            for (int j = 1; j < i; j++) {
                row[j] = triangle[i-1][j-1] + triangle[i-1][j];
            }
            
            triangle.push_back(row);
        }
        
        return triangle;
    }
};
```

**📖 Explanation:**
- Row 0: [1], Row 1: [1,1], Row 2: [1,2,1], Row 3: [1,3,3,1]
- Each interior element = sum of two elements above it
- Initialize entire row to 1, then fill middle

**⚡ Complexity:** Time: O(n²) | Space: O(n²)

**🎯 Trick:** "**Each element = C(row, col)**" — Pascal's triangle is actually binomial coefficients!

---

### Problem 14: Pascal's Triangle II
**📌 Task:** Return the kth (0-indexed) row of Pascal's triangle using O(k) space.

```cpp
class Solution {
public:
    vector<int> getRow(int rowIndex) {
        vector<int> row(rowIndex + 1, 1);
        
        // Build in-place: go right to left to avoid overwriting needed values
        for (int i = 1; i < rowIndex; i++) {
            for (int j = i; j >= 1; j--) {  // RIGHT TO LEFT is key!
                row[j] += row[j-1];
            }
        }
        
        return row;
    }
};
```

**📖 Explanation:**
- Building left-to-right would corrupt values needed for current iteration
- Going right-to-left: `row[j] = row[j] + row[j-1]` — row[j-1] hasn't been updated yet
- Like the 1D DP trick in knapsack!

**⚡ Complexity:** Time: O(n²) | Space: O(n)

**🎯 Trick:** "**Right-to-left saves space**" — same trick used in 0/1 knapsack. When updating in-place using previous values, go backwards.

---

### Problem 15: Count Odd Numbers in Range
**📌 Task:** Count odd numbers in [low, high].

```cpp
class Solution {
public:
    int countOdds(int low, int high) {
        // Count odds in [1, n] = ceil(n/2) = (n+1)/2
        // Count odds in [low, high] = odds(high) - odds(low-1)
        
        auto countOddsUpTo = [](int n) {
            return (n + 1) / 2;
        };
        
        return countOddsUpTo(high) - countOddsUpTo(low - 1);
    }
};
```

**📖 Explanation:**
- Odds in [1..n]: 1,3,5... → `ceil(n/2)` = `(n+1)/2`
- Use prefix counting: odds in [low, high] = odds in [0, high] - odds in [0, low-1]
- Handle edge: if low is even, low-1 is odd — formula handles automatically

**⚡ Complexity:** Time: O(1) | Space: O(1)

**🎯 Trick:** "**Prefix count technique**" — count [low,high] = count[0,high] - count[0,low-1]. Works for evens, odds, primes (with sieve), etc.

---

# 📅 DAY 2 — Arrays

## 🔑 Topic Tricks (Day 2 Master Sheet)
| Pattern | When to use |
|---|---|
| Two pointers | Sorted array, find pair with target sum |
| Sliding window | Subarray of fixed/variable size |
| Prefix sum | Subarray sums, range queries |
| Kadane's algorithm | Maximum subarray sum |
| Dutch flag | Sort 0s, 1s, 2s |
| Binary search | Sorted array, find element or boundary |

> 🧠 **Mnemonic:** "**TSPKDB**" → **T**wo-pointer **S**liding-window **P**refix **K**adane's **D**utch-flag **B**inary-search

---

## Hour 1 — Array Basics

---

### Problem 16: Third Maximum Number
**📌 Task:** Find the 3rd distinct maximum. If no 3rd, return the maximum.

```cpp
class Solution {
public:
    int thirdMax(vector<int>& nums) {
        // Use set: auto-sorted, auto-deduplicated
        set<int> top3;
        
        for (int num : nums) {
            top3.insert(num);
            if (top3.size() > 3) {
                top3.erase(top3.begin()); // Remove smallest
            }
        }
        
        // If 3 distinct exist: return smallest of top3 (= 3rd max)
        // Else: return max (last element in set)
        return top3.size() == 3 ? *top3.begin() : *top3.rbegin();
    }
};
```

**📖 Explanation:**
- `set<int>` keeps elements sorted in ascending order
- Keep only top 3 by removing smallest whenever size > 3
- `top3.begin()` = minimum of the set (3rd max if size==3)
- `top3.rbegin()` = maximum of the set

**⚡ Complexity:** Time: O(n) | Space: O(1) — set never grows beyond 3

**🎯 Trick:** "**Top-K using set of size K**" — universal pattern. For Kth largest, maintain a set of size K, always remove smallest.

---

### Problem 17: Majority Element
**📌 Task:** Find element appearing more than n/2 times (guaranteed to exist).

```cpp
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        // Boyer-Moore Voting Algorithm
        int candidate = nums[0];
        int count = 1;
        
        for (int i = 1; i < nums.size(); i++) {
            if (count == 0) {
                candidate = nums[i];  // Pick new candidate
                count = 1;
            } else if (nums[i] == candidate) {
                count++;              // Support current candidate
            } else {
                count--;              // Cancel out one vote
            }
        }
        
        return candidate;  // Majority always survives
    }
};
```

**📖 Explanation:**
- Imagine pairing up different elements and canceling them
- Majority element (>n/2) can't be fully canceled — it always survives
- Count drops to 0 → pick new candidate → previous canceled out equally

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Vote canceling**" — different elements cancel each other. The one with majority always has votes left. Like an election!

---

### Problem 18: Find All Numbers Disappeared in Array
**📌 Task:** Array of n integers in [1,n]. Find all missing numbers.

```cpp
class Solution {
public:
    vector<int> findDisappearedNumbers(vector<int>& nums) {
        int n = nums.size();
        
        // TRICK: Use the array itself as a hash map!
        // For each value v, negate nums[v-1] to mark v as "seen"
        for (int i = 0; i < n; i++) {
            int idx = abs(nums[i]) - 1;  // abs() because it might already be negated
            if (nums[idx] > 0) {
                nums[idx] = -nums[idx];  // Mark as seen
            }
        }
        
        // Indices that are still positive → those numbers are missing
        vector<int> result;
        for (int i = 0; i < n; i++) {
            if (nums[i] > 0) {
                result.push_back(i + 1);  // i+1 was never seen
            }
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- Values in [1,n] → use them as indices into the same array
- Negate `nums[v-1]` to mark value v as seen
- After processing, positive indices (i+1) are the missing numbers
- `abs()` needed because a value might already be negated from a previous step

**⚡ Complexity:** Time: O(n) | Space: O(1) — no extra space!

**🎯 Trick:** "**Array as its own hash map**" — when values are in range [1,n] and array length is n, use index-as-value trick with negation.

---

## Hour 2 — Sorting

---

### Problem 19: Sort Colors (Dutch National Flag)
**📌 Task:** Sort array of 0s, 1s, 2s in-place without counting sort.

```cpp
class Solution {
public:
    void sortColors(vector<int>& nums) {
        int low = 0, mid = 0, high = nums.size() - 1;
        
        // Dutch National Flag Algorithm (3-way partition)
        while (mid <= high) {
            if (nums[mid] == 0) {
                swap(nums[low], nums[mid]);
                low++;
                mid++;
            } else if (nums[mid] == 1) {
                mid++;  // 1 is in correct zone, just advance
            } else {    // nums[mid] == 2
                swap(nums[mid], nums[high]);
                high--;
                // Don't increment mid! Swapped element needs to be checked
            }
        }
    }
};
```

**📖 Explanation:**
- 3 pointers: `low` (boundary of 0s), `mid` (current), `high` (boundary of 2s)
- 0 found: swap with low zone, advance both low and mid
- 1 found: it's in the right place, just advance mid
- 2 found: swap with high zone, shrink high (don't advance mid — check swapped element)

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**DNF: lo-mi-hi**" — three pointers, one pass. When you find 0, expand left zone. When you find 2, expand right zone. 1s naturally stay in middle.

---

### Problem 20: Sort Array by Parity
**📌 Task:** Move all even numbers before odd numbers.

```cpp
class Solution {
public:
    vector<int> sortArrayByParity(vector<int>& nums) {
        int left = 0, right = nums.size() - 1;
        
        // Two-pointer: push evens left, odds right
        while (left < right) {
            if (nums[left] % 2 != 0 && nums[right] % 2 == 0) {
                swap(nums[left], nums[right]);
            }
            if (nums[left] % 2 == 0) left++;   // Even is in right place
            if (nums[right] % 2 != 0) right--;  // Odd is in right place
        }
        
        return nums;
    }
};
```

**📖 Explanation:**
- Two pointers from both ends
- Left pointer: skip evens (they're already in correct zone)
- Right pointer: skip odds (already correct)
- When left=odd and right=even: swap them

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Two-pointer partition**" — exactly like the partition step of QuickSort! Apply whenever you need to separate elements into two categories.

---

### Problem 21: Minimum Absolute Difference
**📌 Task:** Find all pairs with minimum absolute difference.

```cpp
class Solution {
public:
    vector<vector<int>> minimumAbsDifference(vector<int>& arr) {
        sort(arr.begin(), arr.end());  // Sort first!
        
        // Find minimum difference (only adjacent in sorted array)
        int minDiff = INT_MAX;
        for (int i = 1; i < arr.size(); i++) {
            minDiff = min(minDiff, arr[i] - arr[i-1]);
        }
        
        // Collect all pairs with that difference
        vector<vector<int>> result;
        for (int i = 1; i < arr.size(); i++) {
            if (arr[i] - arr[i-1] == minDiff) {
                result.push_back({arr[i-1], arr[i]});
            }
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- KEY INSIGHT: Minimum absolute difference must be between adjacent elements in sorted order
- No need to check all pairs O(n²) — just adjacent pairs O(n) after sorting
- Two-pass: first find minDiff, then collect pairs

**⚡ Complexity:** Time: O(n log n) | Space: O(1)

**🎯 Trick:** "**Minimum diff = adjacent in sorted array**" — always sort first for min/max difference problems. Adjacent pairs in sorted order have the smallest gaps.

---

## Hour 3 — Searching

---

### Problem 22: Binary Search
**📌 Task:** Find target in sorted array. Return index or -1.

```cpp
class Solution {
public:
    int search(vector<int>& nums, int target) {
        int left = 0, right = nums.size() - 1;
        
        while (left <= right) {
            int mid = left + (right - left) / 2;  // Avoid overflow vs (left+right)/2
            
            if (nums[mid] == target) return mid;
            else if (nums[mid] < target) left = mid + 1;   // Target in right half
            else right = mid - 1;                           // Target in left half
        }
        
        return -1;
    }
};
```

**📖 Explanation:**
- `mid = left + (right-left)/2` prevents integer overflow for large indices
- Each iteration halves the search space
- `left <= right` (not `<`): handles single element arrays

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**left + (right-left)/2**" — never write `(left+right)/2` to avoid overflow. This is a classic interview gotcha.

---

### Problem 23: First Bad Version
**📌 Task:** Find first bad version using an API `isBadVersion(n)`.

```cpp
class Solution {
public:
    int firstBadVersion(int n) {
        int left = 1, right = n;
        
        while (left < right) {  // NOTE: strictly < (not <=)
            int mid = left + (right - left) / 2;
            
            if (isBadVersion(mid)) {
                right = mid;    // Could be the first bad — don't exclude it
            } else {
                left = mid + 1; // Definitely not first bad
            }
        }
        
        return left;  // left == right == first bad version
    }
};
```

**📖 Explanation:**
- Finding the FIRST occurrence → use `right = mid` (not `mid-1`) to preserve candidate
- Loop ends when left==right → that's our answer
- Template: "find leftmost satisfying condition" → `right = mid`, loop while `left < right`

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**left < right + right=mid**" template for "find first true". The other template is "find last true": use `left = mid`, `while left < right`, `mid = left + (right-left+1)/2`.

---

### Problem 24: Find Peak Element
**📌 Task:** Find any peak element (greater than neighbors). Array has no equal adjacent elements.

```cpp
class Solution {
public:
    int findPeakElement(vector<int>& nums) {
        int left = 0, right = nums.size() - 1;
        
        while (left < right) {
            int mid = left + (right - left) / 2;
            
            if (nums[mid] > nums[mid + 1]) {
                right = mid;    // Peak exists in left half (including mid)
            } else {
                left = mid + 1; // Peak exists in right half
            }
        }
        
        return left;
    }
};
```

**📖 Explanation:**
- If `nums[mid] > nums[mid+1]` → going downhill right → peak is to the left (or at mid)
- If `nums[mid] < nums[mid+1]` → going uphill right → peak is to the right
- We're guaranteed to find a peak (mountain must have a top)

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**Follow the uphill**" — binary search works here because you can always follow the ascending slope to find a peak.

---

## Hour 4 — Array Manipulation

---

### Problem 25: Move Zeroes
**📌 Task:** Move all 0s to end, maintain relative order of non-zeros.

```cpp
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int insertPos = 0;  // Position to insert next non-zero
        
        // Phase 1: Compact all non-zeros to the front
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] != 0) {
                nums[insertPos++] = nums[i];
            }
        }
        
        // Phase 2: Fill rest with zeros
        while (insertPos < nums.size()) {
            nums[insertPos++] = 0;
        }
    }
};
```

**📖 Explanation:**
- Two-phase approach: collect non-zeros, then pad zeros
- `insertPos` tracks where the next non-zero should go
- Relative order preserved because we scan left-to-right

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Write pointer pattern**" — one read pointer (i), one write pointer (insertPos). Read scans everything; write only moves when condition met.

---

### Problem 26: Rotate Array
**📌 Task:** Rotate array right by k steps.

```cpp
class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        int n = nums.size();
        k %= n;  // Handle k > n (full rotations are no-ops)
        
        // THREE REVERSAL TRICK:
        // [1,2,3,4,5,6,7], k=3
        // Step 1: Reverse all     → [7,6,5,4,3,2,1]
        // Step 2: Reverse first k  → [5,6,7,4,3,2,1]
        // Step 3: Reverse last n-k → [5,6,7,1,2,3,4] ✓
        
        reverse(nums.begin(), nums.end());
        reverse(nums.begin(), nums.begin() + k);
        reverse(nums.begin() + k, nums.end());
    }
};
```

**📖 Explanation:**
- Think of it as: last k elements go to front, first n-k go to back
- Reversing achieves this rearrangement without extra space
- Always do `k %= n` first to avoid unnecessary full rotations

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Reverse-Reverse-Reverse**" — the 3-reversal trick works for all rotation problems. Memorize this!

---

### Problem 27: Contains Duplicate
**📌 Task:** Return true if any value appears at least twice.

```cpp
class Solution {
public:
    bool containsDuplicate(vector<int>& nums) {
        unordered_set<int> seen;
        
        for (int num : nums) {
            if (seen.count(num)) return true;  // Already seen → duplicate!
            seen.insert(num);
        }
        
        return false;
    }
};
```

**📖 Explanation:**
- `unordered_set` gives O(1) average lookup
- As we scan, if current element already in set → duplicate found
- `seen.count(x)` returns 0 or 1 for sets

**⚡ Complexity:** Time: O(n) | Space: O(n)

**🎯 Trick:** "**Set = memory of seen elements**" — unordered_set is your go-to for "have I seen this before?" questions.

---

## Hour 5 — Subarray Problems

---

### Problem 28: Maximum Subarray (Kadane's Algorithm)
**📌 Task:** Find contiguous subarray with largest sum.

```cpp
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int currentSum = nums[0];  // Current subarray sum
        int maxSum = nums[0];      // Best sum found so far
        
        for (int i = 1; i < nums.size(); i++) {
            // Either extend current subarray OR start fresh from nums[i]
            currentSum = max(nums[i], currentSum + nums[i]);
            maxSum = max(maxSum, currentSum);
        }
        
        return maxSum;
    }
};
```

**📖 Explanation:**
- KEY: If `currentSum` becomes negative, starting fresh from `nums[i]` is better
- `max(nums[i], currentSum + nums[i])` = "extend or restart"
- This is Kadane's Algorithm — must memorize for any interview

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Extend or restart**" — if running sum goes negative, restart from current element. That's ALL of Kadane's in one line.

---

### Problem 29: Subarray Sum Equals K
**📌 Task:** Count subarrays with sum equal to k.

```cpp
class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        // prefix_count[s] = how many times prefix sum s has occurred
        unordered_map<int, int> prefixCount;
        prefixCount[0] = 1;  // Empty prefix (sum=0) occurs once
        
        int prefixSum = 0, count = 0;
        
        for (int num : nums) {
            prefixSum += num;
            
            // If prefixSum - k exists as a previous prefix sum,
            // then the subarray between them has sum = k
            count += prefixCount[prefixSum - k];
            
            prefixCount[prefixSum]++;
        }
        
        return count;
    }
};
```

**📖 Explanation:**
- Prefix sum: `sum[i..j] = prefixSum[j] - prefixSum[i-1]`
- We want `prefixSum[j] - prefixSum[i-1] = k` → `prefixSum[i-1] = prefixSum[j] - k`
- For each j, count how many previous prefix sums equal `currentPrefixSum - k`
- `prefixCount[0] = 1` handles subarrays starting from index 0

**⚡ Complexity:** Time: O(n) | Space: O(n)

**🎯 Trick:** "**Prefix sum + HashMap = O(n) subarray sum**" — this pattern solves dozens of subarray problems. Memorize: `count += map[prefix - target]`.

---

### Problem 30: Two Sum
**📌 Task:** Find two indices that add up to target.

```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int> seen;  // value → index
        
        for (int i = 0; i < nums.size(); i++) {
            int complement = target - nums[i];
            
            if (seen.count(complement)) {
                return {seen[complement], i};  // Found the pair!
            }
            
            seen[nums[i]] = i;  // Store current element
        }
        
        return {};  // No solution (problem guarantees one exists)
    }
};
```

**📖 Explanation:**
- For each number, check if its `complement = target - num` was seen before
- HashMap stores `{value: index}` for O(1) lookup
- One-pass: store and lookup simultaneously

**⚡ Complexity:** Time: O(n) | Space: O(n)

**🎯 Trick:** "**Look for the complement**" — two sum is always `complement = target - current`. HashMap gives O(1) lookup. This pattern extends to 3Sum (fix one, two-sum the rest).

---

# 📅 DAY 3 — Strings

## 🔑 Topic Tricks (Day 3 Master Sheet)
| Pattern | Key Idea |
|---|---|
| Sliding window | Track character frequencies in a window |
| Two pointers | Palindrome check, reverse |
| Frequency map | `unordered_map<char,int>` |
| Sorting for anagram | Sort both strings, compare |
| KMP / indexOf | Find substring efficiently |

> 🧠 **Mnemonic:** "**STAFF**" → **S**liding-window **T**wo-pointer **A**nagram-sort **F**requency-map **F**ind-pattern

---

## Hour 1 — String Basics

---

### Problem 31: Reverse String
**📌 Task:** Reverse a character array in-place.

```cpp
class Solution {
public:
    void reverseString(vector<char>& s) {
        int left = 0, right = s.size() - 1;
        
        while (left < right) {
            swap(s[left], s[right]);
            left++;
            right--;
        }
    }
};
```

**📖 Explanation:**
- Classic two-pointer approach
- Swap characters from both ends, moving inward
- Stop when pointers meet (left >= right)

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Mirror swap**" — two pointers from both ends, swap and converge. Universal for any reversal.

---

### Problem 32: Valid Palindrome
**📌 Task:** Check if string is palindrome (ignore non-alphanumeric, case-insensitive).

```cpp
class Solution {
public:
    bool isPalindrome(string s) {
        int left = 0, right = s.size() - 1;
        
        while (left < right) {
            // Skip non-alphanumeric characters
            while (left < right && !isalnum(s[left])) left++;
            while (left < right && !isalnum(s[right])) right--;
            
            // Compare case-insensitively
            if (tolower(s[left]) != tolower(s[right])) return false;
            
            left++;
            right--;
        }
        
        return true;
    }
};
```

**📖 Explanation:**
- `isalnum(c)` returns true for letters and digits
- `tolower(c)` normalizes case
- Two-pointer converges from both ends, skipping invalid chars

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**isalnum + tolower**" — two magic functions for valid palindrome. Always use them together.

---

### Problem 33: Reverse Vowels of a String
**📌 Task:** Reverse only the vowels in a string.

```cpp
class Solution {
public:
    string reverseVowels(string s) {
        string vowels = "aeiouAEIOU";
        int left = 0, right = s.size() - 1;
        
        while (left < right) {
            // Move left to next vowel
            while (left < right && vowels.find(s[left]) == string::npos) left++;
            // Move right to previous vowel
            while (left < right && vowels.find(s[right]) == string::npos) right--;
            
            if (left < right) {
                swap(s[left], s[right]);
                left++;
                right--;
            }
        }
        
        return s;
    }
};
```

**📖 Explanation:**
- Two pointers, but skip consonants
- Only swap when both pointers point to vowels
- `vowels.find(c) == string::npos` checks if c is NOT a vowel

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Selective two-pointer**" — skip unwanted characters, act only on target characters. Pattern: advance pointer until condition met, then swap.

---

## Hour 2 — Character Frequency

---

### Problem 34: First Unique Character in a String
**📌 Task:** Find index of first non-repeating character.

```cpp
class Solution {
public:
    int firstUniqChar(string s) {
        // Build frequency map
        int freq[26] = {0};
        for (char c : s) freq[c - 'a']++;
        
        // Find first character with frequency 1
        for (int i = 0; i < s.size(); i++) {
            if (freq[s[i] - 'a'] == 1) return i;
        }
        
        return -1;
    }
};
```

**📖 Explanation:**
- Two-pass: count frequencies, then find first with freq=1
- Array of size 26 (faster than hashmap for lowercase letters)
- `c - 'a'` maps 'a'→0, 'b'→1, ..., 'z'→25

**⚡ Complexity:** Time: O(n) | Space: O(1) — fixed size array of 26

**🎯 Trick:** "**int[26] beats unordered_map**" — for lowercase English letters only, a fixed int array is faster than a hash map.

---

### Problem 35: Detect Capital
**📌 Task:** Return true if capitalization is valid (all caps, all lower, or only first cap).

```cpp
class Solution {
public:
    bool detectCapitalUse(string word) {
        int caps = 0;
        for (char c : word) if (isupper(c)) caps++;
        
        // Valid: all caps, all lower, or only first is cap
        return caps == 0 || caps == word.size() || 
               (caps == 1 && isupper(word[0]));
    }
};
```

**📖 Explanation:**
- Count uppercase letters
- Three valid cases: 0 caps (all lower), all caps, or exactly 1 cap and it's the first letter
- Simple and elegant

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Count and check conditions**" — when there are multiple valid states, count a property and check each valid state separately.

---

### Problem 36: Find the Difference
**📌 Task:** String t is string s with one extra character. Find it.

```cpp
class Solution {
public:
    char findTheDifference(string s, string t) {
        // XOR trick: a^a=0, so XOR all chars in both strings
        // Only the extra character remains
        char result = 0;
        for (char c : s) result ^= c;
        for (char c : t) result ^= c;
        return result;
    }
};
```

**📖 Explanation:**
- XOR of all characters in s and t cancels matching pairs
- The extra character in t appears once with no pair to cancel it
- Same trick as "Missing Number" but for characters

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**XOR cancels pairs**" — `a ^ a = 0`, so XOR-ing all elements twice leaves only the unpaired one. Works for finding any single extra/missing element.

---

## Hour 3 — Anagram & Comparison

---

### Problem 37: Valid Anagram
**📌 Task:** Check if t is an anagram of s.

```cpp
class Solution {
public:
    bool isAnagram(string s, string t) {
        if (s.size() != t.size()) return false;
        
        int freq[26] = {0};
        
        for (int i = 0; i < s.size(); i++) {
            freq[s[i] - 'a']++;  // Increment for s
            freq[t[i] - 'a']--;  // Decrement for t
        }
        
        // All zeros → same frequencies → anagram
        for (int f : freq) if (f != 0) return false;
        return true;
    }
};
```

**📖 Explanation:**
- One-pass: increment for s, decrement for t simultaneously
- If anagrams: every increment is matched by a decrement → all zeros
- Check length first (quick rejection)

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**+1/-1 balance check**" — instead of two passes, do both in one. Increment for one string, decrement for the other. Check if all zeros at end.

---

### Problem 38: Isomorphic Strings
**📌 Task:** Check if characters in s can be consistently replaced to get t.

```cpp
class Solution {
public:
    bool isIsomorphic(string s, string t) {
        int mapST[256] = {0}; // s char → t char mapping
        int mapTS[256] = {0}; // t char → s char mapping (reverse check)
        
        for (int i = 0; i < s.size(); i++) {
            char cs = s[i], ct = t[i];
            
            if (mapST[cs] && mapST[cs] != ct) return false; // Conflicting mapping
            if (mapTS[ct] && mapTS[ct] != cs) return false; // Two chars map to same
            
            mapST[cs] = ct;
            mapTS[ct] = cs;
        }
        
        return true;
    }
};
```

**📖 Explanation:**
- Need BOTH directions: s→t and t→s mappings
- Without t→s: "ab"→"cc" would pass (both a,b map to c) but shouldn't
- `int[256]` handles all ASCII characters

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Two-way mapping**" — for isomorphic/bijection problems, always maintain BOTH direction maps. One map = many-to-one allowed (wrong). Two maps = true bijection.

---

### Problem 39: Longest Common Prefix
**📌 Task:** Find longest common prefix among array of strings.

```cpp
class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        if (strs.empty()) return "";
        
        string prefix = strs[0];  // Start with first string as prefix
        
        for (int i = 1; i < strs.size(); i++) {
            // Trim prefix until it matches start of strs[i]
            while (strs[i].find(prefix) != 0) {
                prefix = prefix.substr(0, prefix.size() - 1);  // Remove last char
                if (prefix.empty()) return "";
            }
        }
        
        return prefix;
    }
};
```

**📖 Explanation:**
- Start with first string as candidate prefix
- For each subsequent string, shorten prefix until it's a prefix of that string
- `strs[i].find(prefix) != 0` → prefix is not at position 0

**⚡ Complexity:** Time: O(S) where S = total chars | Space: O(1)

**🎯 Trick:** "**Shrink the candidate**" — start with the whole first string and keep trimming. Guaranteed to find the answer.

---

## Hour 4 — String Conversion

---

### Problem 40: String to Integer (atoi)
**📌 Task:** Implement atoi — convert string to integer, handling whitespace, sign, overflow.

```cpp
class Solution {
public:
    int myAtoi(string s) {
        int i = 0, n = s.size();
        
        // Step 1: Skip leading whitespace
        while (i < n && s[i] == ' ') i++;
        
        // Step 2: Determine sign
        int sign = 1;
        if (i < n && (s[i] == '+' || s[i] == '-')) {
            sign = (s[i] == '-') ? -1 : 1;
            i++;
        }
        
        // Step 3: Read digits, check overflow before each step
        long result = 0;
        while (i < n && isdigit(s[i])) {
            result = result * 10 + (s[i] - '0');
            if (result * sign > INT_MAX) return INT_MAX;
            if (result * sign < INT_MIN) return INT_MIN;
            i++;
        }
        
        return (int)(result * sign);
    }
};
```

**📖 Explanation:**
- 4 steps: skip spaces → read sign → read digits → handle overflow
- Stop at first non-digit character
- Check overflow at each digit to avoid long overflow too

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**SSDO: Skip-Sign-Digits-Overflow**" — the 4-step atoi checklist. Any atoi question follows this exact order.

---

### Problem 41: Count Binary Substrings
**📌 Task:** Count substrings with equal consecutive 0s and 1s (like "0011", "1100", "01").

```cpp
class Solution {
public:
    int countBinarySubstrings(string s) {
        int count = 0;
        int prev = 0, curr = 1; // Count of previous group and current group
        
        for (int i = 1; i < s.size(); i++) {
            if (s[i] == s[i-1]) {
                curr++;  // Extend current group
            } else {
                prev = curr;  // Current becomes previous
                curr = 1;     // Start new group
            }
            
            // Valid substring exists when prev >= curr
            if (prev >= curr) count++;
        }
        
        return count;
    }
};
```

**📖 Explanation:**
- Group consecutive identical characters: "00110011" → [2,2,2,2]
- At each group boundary, min(prev_group, curr_group) valid substrings can be formed
- Track prev and curr group sizes, add 1 to count whenever prev >= curr

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Group run lengths**" — "0011001" → runs [2,2,2,1]. Between adjacent runs, `min(run1, run2)` valid pairs exist.

---

### Problem 42: Fizz Buzz
**📌 Task:** Return strings 1..n with Fizz(÷3), Buzz(÷5), FizzBuzz(÷15).

```cpp
class Solution {
public:
    vector<string> fizzBuzz(int n) {
        vector<string> result;
        
        for (int i = 1; i <= n; i++) {
            string s = "";
            if (i % 3 == 0) s += "Fizz";
            if (i % 5 == 0) s += "Buzz";
            if (s.empty()) s = to_string(i);
            result.push_back(s);
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- KEY TRICK: Don't check divisibility by 15 separately — build string by appending
- Divisible by both 3 and 5 → appends "Fizz" then "Buzz" = "FizzBuzz" automatically
- `s.empty()` handles the plain number case

**⚡ Complexity:** Time: O(n) | Space: O(n)

**🎯 Trick:** "**Append, don't branch**" — avoid if-else chains for FizzBuzz. Check 3 and 5 independently and concatenate. Scales to any number of conditions.

---

## Hour 5 — Advanced Strings

---

### Problem 43: Longest Substring Without Repeating Characters
**📌 Task:** Find length of longest substring with all unique characters.

```cpp
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        unordered_map<char, int> lastSeen; // char → last seen index
        int maxLen = 0, left = 0;
        
        for (int right = 0; right < s.size(); right++) {
            char c = s[right];
            
            // If char seen and its last position is within our window
            if (lastSeen.count(c) && lastSeen[c] >= left) {
                left = lastSeen[c] + 1;  // Shrink window from left
            }
            
            lastSeen[c] = right;  // Update last seen position
            maxLen = max(maxLen, right - left + 1);
        }
        
        return maxLen;
    }
};
```

**📖 Explanation:**
- Sliding window: `left` to `right`, expand right, shrink left when duplicate found
- Store last seen INDEX (not just bool) — allows jumping left pointer directly
- `lastSeen[c] >= left` — only relevant if duplicate is within current window

**⚡ Complexity:** Time: O(n) | Space: O(min(n,alphabet))

**🎯 Trick:** "**Jump left to duplicate+1**" — instead of crawling left one-by-one, jump directly past the duplicate. This is what makes it O(n) not O(n²).

---

### Problem 44: Word Pattern
**📌 Task:** Check if string s follows the same pattern as `pattern`.

```cpp
class Solution {
public:
    bool wordPattern(string pattern, string s) {
        vector<string> words;
        stringstream ss(s);
        string word;
        while (ss >> word) words.push_back(word);
        
        if (pattern.size() != words.size()) return false;
        
        unordered_map<char, string> charToWord;
        unordered_map<string, char> wordToChar;
        
        for (int i = 0; i < pattern.size(); i++) {
            char c = pattern[i];
            string w = words[i];
            
            if (charToWord.count(c) && charToWord[c] != w) return false;
            if (wordToChar.count(w) && wordToChar[w] != c) return false;
            
            charToWord[c] = w;
            wordToChar[w] = c;
        }
        
        return true;
    }
};
```

**📖 Explanation:**
- Same as isomorphic strings but between chars and words
- Two maps needed: char→word and word→char (bijection)
- `stringstream` for easy word splitting

**⚡ Complexity:** Time: O(n) | Space: O(n)

**🎯 Trick:** "**Isomorphic = two maps**" — word pattern is isomorphic strings with words. Always two bidirectional maps.

---

### Problem 45: Valid Word Abbreviation
**📌 Task:** Check if `abbr` is a valid abbreviation of `word` (digits represent skipped chars).

```cpp
class Solution {
public:
    bool validWordAbbreviation(string word, string abbr) {
        int i = 0, j = 0; // i → word, j → abbr
        
        while (i < word.size() && j < abbr.size()) {
            if (isdigit(abbr[j])) {
                if (abbr[j] == '0') return false;  // Leading zero invalid
                
                int skip = 0;
                while (j < abbr.size() && isdigit(abbr[j])) {
                    skip = skip * 10 + (abbr[j] - '0');
                    j++;
                }
                i += skip;  // Skip characters in word
            } else {
                if (word[i] != abbr[j]) return false;  // Chars must match
                i++;
                j++;
            }
        }
        
        return i == word.size() && j == abbr.size();
    }
};
```

**📖 Explanation:**
- Two pointers: one on word, one on abbr
- When abbr has a digit: parse the full number, skip that many chars in word
- When abbr has a letter: must match exactly
- Both must exhaust at the same time

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Two-pointer with number parsing**" — when mixing letters and numbers in matching problems, parse multi-digit numbers in a while loop.

---

# 📅 DAY 4 — Sorting, Searching & Hashing

## 🔑 Topic Tricks (Day 4 Master Sheet)
| Algorithm | Key | Time |
|---|---|---|
| Merge Sort | Divide and conquer, stable | O(n log n) |
| Quick Sort | Partition around pivot | O(n log n) avg |
| Binary Search | Halve search space each step | O(log n) |
| HashMap | O(1) insert/lookup (amortized) | O(n) total |

> 🧠 **Mnemonic for sort stability:** "**Merge Stays, Quick Jumps**" — Merge sort is stable (equal elements keep order), Quick sort is unstable.

---

## Hour 1 — Advanced Sorting

---

### Problem 46: Sort Colors — Why Merge Sort Is Not Optimal Here
**📌 Task:** Sort an array containing only `0`, `1`, and `2`.

The optimal Dutch National Flag solution, including complete code, is given in
**Problem 19**. The important comparison is:

- **Merge sort:** Correct, but takes O(n log n) time and O(n) auxiliary space.
- **Counting:** Count the three values and overwrite the array in O(n) time and O(1) space,
  but it usually needs two passes.
- **Dutch National Flag:** Partitions all three values in one pass, O(n) time and O(1) space.

**📖 Why the one-pass algorithm works:**
- `[0, low)` contains only zeroes.
- `[low, mid)` contains only ones.
- `[mid, high]` is still unclassified.
- `(high, n)` contains only twos.
- Seeing `0` grows the zero region, seeing `1` advances the scan, and seeing `2` grows
  the two region. After swapping with `high`, `mid` must stay in place because the incoming
  value has not been examined yet.

**⚡ Complexity:** Dutch National Flag: Time O(n) | Space O(1)

**🎯 Interview answer:** Mention merge sort as a general solution, then exploit the
three-value constraint and use Problem 19's one-pass solution.

### Problem 47: Kth Largest Element in Array
**📌 Task:** Find kth largest element without full sorting.

```cpp
class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        // Min-heap of size k: top is the kth largest
        priority_queue<int, vector<int>, greater<int>> minHeap;
        
        for (int num : nums) {
            minHeap.push(num);
            if (minHeap.size() > k) {
                minHeap.pop();  // Remove smallest → only top-k remain
            }
        }
        
        return minHeap.top();  // Smallest of top-k = kth largest
    }
};
```

**📖 Explanation:**
- Maintain a min-heap of size k
- When heap exceeds k, pop minimum → only k largest elements remain
- Top of heap (minimum of those k) is the kth largest overall

**⚡ Complexity:** Time: O(n log k) | Space: O(k)

**🎯 Trick:** "**Min-heap for Kth LARGEST, Max-heap for Kth SMALLEST**" — counterintuitive but correct. To keep top-k largest, you need to easily remove the minimum.

---

### Problem 48: Merge Intervals
**📌 Task:** Merge all overlapping intervals.

```cpp
class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        // Sort by start time
        sort(intervals.begin(), intervals.end());
        
        vector<vector<int>> result;
        result.push_back(intervals[0]);
        
        for (int i = 1; i < intervals.size(); i++) {
            auto& last = result.back();
            
            if (intervals[i][0] <= last[1]) {
                // Overlapping: extend the end if needed
                last[1] = max(last[1], intervals[i][1]);
            } else {
                // Non-overlapping: add as new interval
                result.push_back(intervals[i]);
            }
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- Sort by start: ensures overlapping intervals are adjacent
- Merge condition: `current.start <= last.end`
- Merge by: `last.end = max(last.end, current.end)`

**⚡ Complexity:** Time: O(n log n) | Space: O(n)

**🎯 Trick:** "**Sort → scan → extend or add**" — universal merge intervals template. If new interval starts before or at current end, extend. Otherwise, add new.

---

## Hour 2 — Binary Search Variants

---

### Problem 49: Search in Rotated Sorted Array
**📌 Task:** Binary search in a rotated sorted array.

```cpp
class Solution {
public:
    int search(vector<int>& nums, int target) {
        int left = 0, right = nums.size() - 1;
        
        while (left <= right) {
            int mid = left + (right - left) / 2;
            
            if (nums[mid] == target) return mid;
            
            // Determine which half is sorted
            if (nums[left] <= nums[mid]) {
                // Left half is sorted
                if (nums[left] <= target && target < nums[mid]) {
                    right = mid - 1;  // Target in sorted left half
                } else {
                    left = mid + 1;   // Target in right half
                }
            } else {
                // Right half is sorted
                if (nums[mid] < target && target <= nums[right]) {
                    left = mid + 1;   // Target in sorted right half
                } else {
                    right = mid - 1;  // Target in left half
                }
            }
        }
        
        return -1;
    }
};
```

**📖 Explanation:**
- In a rotated array, at least one half is always sorted
- Identify which half is sorted, then check if target falls in it
- If yes: search that half. If no: search the other half.

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**One half is always sorted**" — the key insight. Check `nums[left] <= nums[mid]` to identify sorted half. Then binary search that half normally.

---

### Problem 50: Find Minimum in Rotated Sorted Array
**📌 Task:** Find minimum element in rotated sorted array.

```cpp
class Solution {
public:
    int findMin(vector<int>& nums) {
        int left = 0, right = nums.size() - 1;
        
        while (left < right) {
            int mid = left + (right - left) / 2;
            
            if (nums[mid] > nums[right]) {
                left = mid + 1;  // Min is in right half
            } else {
                right = mid;     // Min could be mid itself
            }
        }
        
        return nums[left];  // left == right == position of minimum
    }
};
```

**📖 Explanation:**
- If `nums[mid] > nums[right]`: rotation point (minimum) is in right half
- If `nums[mid] <= nums[right]`: minimum is in left half (including mid)
- End condition: `left == right` → pointing to minimum

**⚡ Complexity:** Time: O(log n) | Space: O(1)

**🎯 Trick:** "**Compare with right, not left**" — for finding min in rotated array, compare mid with right (not left). If mid > right: min is right of mid.

---

### Problem 51: Search a 2D Matrix
**📌 Task:** Matrix where each row is sorted and first element > last of previous row. Search for target.

```cpp
class Solution {
public:
    bool searchMatrix(vector<vector<int>>& matrix, int target) {
        int m = matrix.size(), n = matrix[0].size();
        int left = 0, right = m * n - 1;
        
        // Treat 2D matrix as 1D sorted array
        while (left <= right) {
            int mid = left + (right - left) / 2;
            int midVal = matrix[mid / n][mid % n];  // Convert 1D index to 2D
            
            if (midVal == target) return true;
            else if (midVal < target) left = mid + 1;
            else right = mid - 1;
        }
        
        return false;
    }
};
```

**📖 Explanation:**
- Key insight: the entire matrix is effectively a sorted 1D array
- Map 1D index to 2D: `row = mid / n`, `col = mid % n`
- Standard binary search on the virtual 1D array

**⚡ Complexity:** Time: O(log(m*n)) | Space: O(1)

**🎯 Trick:** "**2D → 1D mapping: row=idx/n, col=idx%n**" — flatten the matrix conceptually. Integer division gives row, modulo gives column.

---

## Hour 3 — HashMap

---

*(Two Sum = Problem 30, already covered)*

### Problem 52: Intersection of Two Arrays
**📌 Task:** Return the intersection (unique elements present in both).

```cpp
class Solution {
public:
    vector<int> intersection(vector<int>& nums1, vector<int>& nums2) {
        unordered_set<int> set1(nums1.begin(), nums1.end());
        vector<int> result;
        
        for (int num : nums2) {
            if (set1.count(num)) {
                result.push_back(num);
                set1.erase(num);  // Remove to avoid duplicates in result
            }
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- Convert nums1 to set for O(1) lookup
- For each element in nums2, check if it's in set1
- Erase from set1 after adding to result (handles duplicates in nums2)

**⚡ Complexity:** Time: O(n+m) | Space: O(min(n,m))

**🎯 Trick:** "**Set lookup = O(1) membership test**" — convert the smaller array to a set, then scan the other.

---

### Problem 53: Top K Frequent Elements
**📌 Task:** Return k most frequent elements.

```cpp
class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        // Step 1: Count frequencies
        unordered_map<int, int> freq;
        for (int num : nums) freq[num]++;
        
        // Step 2: Min-heap of size k (stores {frequency, value})
        priority_queue<pair<int,int>, vector<pair<int,int>>, greater<>> minHeap;
        
        for (auto& [val, count] : freq) {
            minHeap.push({count, val});
            if (minHeap.size() > k) minHeap.pop();
        }
        
        // Step 3: Extract results
        vector<int> result;
        while (!minHeap.empty()) {
            result.push_back(minHeap.top().second);
            minHeap.pop();
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- Count frequencies with hashmap
- Use min-heap of size k: keeps top-k largest frequencies
- `pair<int,int>` = {frequency, value} for heap comparison

**⚡ Complexity:** Time: O(n log k) | Space: O(n)

**🎯 Trick:** "**Frequency map + K-heap**" — two-step pattern: count frequencies, then use heap/sort to get top-k. Very common interview pattern.

---

## Hour 4 — HashSet & Matrix

---

### Problem 54: Set Matrix Zeroes
**📌 Task:** If element is 0, set its entire row and column to 0. In-place.

```cpp
class Solution {
public:
    void setZeroes(vector<vector<int>>& matrix) {
        int m = matrix.size(), n = matrix[0].size();
        bool firstRowZero = false, firstColZero = false;
        
        // Check if first row/col have zeros
        for (int j = 0; j < n; j++) if (matrix[0][j] == 0) firstRowZero = true;
        for (int i = 0; i < m; i++) if (matrix[i][0] == 0) firstColZero = true;
        
        // Use first row and column as markers
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                if (matrix[i][j] == 0) {
                    matrix[i][0] = 0;  // Mark row
                    matrix[0][j] = 0;  // Mark column
                }
            }
        }
        
        // Zero out marked rows and columns
        for (int i = 1; i < m; i++)
            if (matrix[i][0] == 0)
                for (int j = 1; j < n; j++) matrix[i][j] = 0;
        
        for (int j = 1; j < n; j++)
            if (matrix[0][j] == 0)
                for (int i = 1; i < m; i++) matrix[i][j] = 0;
        
        // Handle first row and column
        if (firstRowZero) for (int j = 0; j < n; j++) matrix[0][j] = 0;
        if (firstColZero) for (int i = 0; i < m; i++) matrix[i][0] = 0;
    }
};
```

**📖 Explanation:**
- Trick: Use first row and first column as "flag arrays" to mark which rows/cols to zero
- First save whether row 0 and col 0 themselves need zeroing
- Process interior, then apply flags, then handle row 0 and col 0

**⚡ Complexity:** Time: O(m*n) | Space: O(1)

**🎯 Trick:** "**Use borders as flags**" — O(1) space trick: repurpose the first row/column as markers. Common matrix trick.

---

### Problem 55: Group Anagrams
**📌 Task:** Group strings that are anagrams of each other.

```cpp
class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        unordered_map<string, vector<string>> groups;
        
        for (const string& s : strs) {
            string key = s;
            sort(key.begin(), key.end());  // Sorted string = canonical key
            groups[key].push_back(s);
        }
        
        vector<vector<string>> result;
        for (auto& [key, group] : groups) {
            result.push_back(group);
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- Anagrams have the same sorted form: "eat"→"aet", "tea"→"aet", "tan"→"ant"
- Use sorted string as hashmap key
- Group all strings with the same key together

**⚡ Complexity:** Time: O(n·k·log k) where k=max string length | Space: O(n·k)

**🎯 Trick:** "**Sort = canonical form**" — sorted string is a perfect anagram key. All anagrams share the same canonical form.

---

### Problem 56: Top K Frequent Words
*(Similar to Top K Frequent Elements — see Problem 53, but sort by frequency then lexicographically)*

```cpp
class Solution {
public:
    vector<string> topKFrequent(vector<string>& words, int k) {
        unordered_map<string, int> freq;
        for (const string& w : words) freq[w]++;
        
        // Custom comparator: higher freq first, alphabetical for ties
        auto cmp = [&](const string& a, const string& b) {
            return freq[a] != freq[b] ? freq[a] > freq[b] : a < b;
        };
        
        vector<string> candidates;
        for (auto& [word, _] : freq) candidates.push_back(word);
        
        sort(candidates.begin(), candidates.end(), cmp);
        candidates.resize(k);
        
        return candidates;
    }
};
```

**⚡ Complexity:** Time: O(n log n) | Space: O(n)

**🎯 Trick:** "**Custom comparator = multi-criteria sort**" — lambda comparator handles complex ordering (freq descending, then alpha ascending) cleanly.

---

## Hour 5 — Intervals & Practice

---

*(Merge Intervals = Problem 48, Find Duplicate below)*

### Problem 57: Find the Duplicate Number
**📌 Task:** Array of n+1 integers in [1,n], exactly one duplicate. O(1) space, no modification.

```cpp
class Solution {
public:
    int findDuplicate(vector<int>& nums) {
        // Floyd's Cycle Detection on array treated as linked list
        // Value at index i is the "next pointer" (nums[i] → index nums[i])
        
        int slow = nums[0];
        int fast = nums[0];
        
        // Phase 1: Find intersection point in cycle
        do {
            slow = nums[slow];
            fast = nums[nums[fast]];
        } while (slow != fast);
        
        // Phase 2: Find entry point of cycle = duplicate number
        slow = nums[0];
        while (slow != fast) {
            slow = nums[slow];
            fast = nums[fast];
        }
        
        return slow;
    }
};
```

**📖 Explanation:**
- Treat array as linked list: value at index = next node
- Duplicate creates a cycle (two indices point to same next)
- Floyd's algorithm finds both the cycle AND its entry point (the duplicate)

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Array as implicit linked list**" — when values are valid indices, the array defines a graph. Cycles = duplicates. Floyd's finds them.

---

### Problem 58: Contiguous Array
**📌 Task:** Find longest subarray with equal 0s and 1s.

```cpp
class Solution {
public:
    int findMaxLength(vector<int>& nums) {
        // Replace 0 with -1. Now find longest subarray with sum = 0.
        unordered_map<int, int> firstSeen;  // prefixSum → earliest index
        firstSeen[0] = -1;  // Empty prefix at index -1
        
        int prefixSum = 0, maxLen = 0;
        
        for (int i = 0; i < nums.size(); i++) {
            prefixSum += (nums[i] == 1) ? 1 : -1;  // +1 for 1, -1 for 0
            
            if (firstSeen.count(prefixSum)) {
                maxLen = max(maxLen, i - firstSeen[prefixSum]);
            } else {
                firstSeen[prefixSum] = i;  // Store earliest occurrence
            }
        }
        
        return maxLen;
    }
};
```

**📖 Explanation:**
- Transform: replace 0→-1. Equal 0s and 1s → subarray sums to 0
- Use prefix sum: if same prefix sum appears twice, middle subarray sums to 0
- Store FIRST occurrence of each prefix sum to maximize length

**⚡ Complexity:** Time: O(n) | Space: O(n)

**🎯 Trick:** "**0→-1 transform**" — equal-count 0s and 1s problems become sum=0 problems. Then use prefix sum + hashmap.

---

# 📅 DAY 5 — Recursion, Matrix, Stack & Mock Test

## 🔑 Topic Tricks (Day 5 Master Sheet)
| Structure | Key Operation | Use Case |
|---|---|---|
| Stack | LIFO, push/pop O(1) | Matching brackets, next greater element |
| Queue | FIFO, enqueue/dequeue | BFS, sliding window |
| Recursion | Break into smaller subproblem | Tree traversal, divide-conquer |
| Matrix | Row=i, Col=j, careful bounds | Spiral, rotate, diagonal |

> 🧠 **Mnemonic:** "**Stack = LIFO, Queue = FIFO**" — Stack is like a pile of plates (last in, first out). Queue is like a line at a counter (first in, first out).

---

## Hour 1 — Recursion

---

### Problem 59: Power of Three
**📌 Task:** Check if n is a power of 3 without loops.

```cpp
class Solution {
public:
    bool isPowerOfThree(int n) {
        // Method 1: Math - Largest power of 3 in int range
        // 3^19 = 1162261467 (largest power of 3 ≤ INT_MAX)
        // All powers of 3 divide 3^19 evenly
        return n > 0 && 1162261467 % n == 0;
        
        // Method 2: Recursive
        // if (n == 1) return true;
        // if (n <= 0 || n % 3 != 0) return false;
        // return isPowerOfThree(n / 3);
    }
};
```

**📖 Explanation:**
- Every power of 3 is a divisor of 3^19 (the largest 3-power in 32-bit range)
- `3^19 % n == 0` iff n is a power of 3 (and n > 0)
- Elegant O(1) solution — no loops, no recursion needed

**⚡ Complexity:** Time: O(1) | Space: O(1)

**🎯 Trick:** "**Largest power divisibility trick**" — works for any prime base! 2: use 2^31, 3: use 3^19. If base is not prime, this trick doesn't work.

---

### Problem 60: Reverse String (Recursive)
*(Covered in Problem 31 — for recursive version:)*

```cpp
void reverseHelper(vector<char>& s, int left, int right) {
    if (left >= right) return;          // Base case
    swap(s[left], s[right]);            // Swap
    reverseHelper(s, left + 1, right - 1); // Recurse inward
}
```

**🎯 Trick:** "**Recursion = base case + smaller subproblem**" — always define: (1) when to stop, (2) what to do, (3) how to make it smaller.

---

### Problem 61: Unique Paths
**📌 Task:** Count paths from top-left to bottom-right in m×n grid (only right/down moves).

```cpp
class Solution {
public:
    int uniquePaths(int m, int n) {
        // Mathematical: C(m+n-2, m-1) = (m+n-2)! / ((m-1)! * (n-1)!)
        // But DP is cleaner and avoids overflow:
        
        vector<vector<int>> dp(m, vector<int>(n, 1));
        
        // First row and column are all 1 (only one way to reach them)
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                dp[i][j] = dp[i-1][j] + dp[i][j-1];  // From above + from left
            }
        }
        
        return dp[m-1][n-1];
    }
};
```

**📖 Explanation:**
- `dp[i][j]` = number of ways to reach cell (i,j)
- Can only come from above (i-1,j) or left (i,j-1)
- First row/col = 1 (only one path: all right or all down)

**⚡ Complexity:** Time: O(m*n) | Space: O(m*n), optimizable to O(n)

**🎯 Trick:** "**Grid DP: from = above + left**" — if you can only move right and down, paths to (i,j) = paths to (i-1,j) + paths to (i,j-1). Pascal's triangle in 2D!

---

## Hour 2 — Stack & Queue

---

### Problem 62: Valid Parentheses
**📌 Task:** Check if brackets are correctly matched and nested.

```cpp
class Solution {
public:
    bool isValid(string s) {
        stack<char> st;
        
        for (char c : s) {
            if (c == '(' || c == '[' || c == '{') {
                st.push(c);  // Push open brackets
            } else {
                if (st.empty()) return false;  // No matching opener
                
                char top = st.top();
                st.pop();
                
                // Check if closing matches most recent opening
                if ((c == ')' && top != '(') ||
                    (c == ']' && top != '[') ||
                    (c == '}' && top != '{')) {
                    return false;
                }
            }
        }
        
        return st.empty();  // All openers must have been matched
    }
};
```

**📖 Explanation:**
- Stack stores unmatched opening brackets
- On closing bracket: peek stack top, must match
- At end: stack must be empty (all opened were closed)

**⚡ Complexity:** Time: O(n) | Space: O(n)

**🎯 Trick:** "**Stack for matching pairs**" — whenever you need to match the most recent opener, use a stack. Works for brackets, HTML tags, nested structures.

---

### Problem 63: Next Greater Element I
**📌 Task:** For each element in nums1, find the next greater element in nums2.

```cpp
class Solution {
public:
    vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {
        // Monotonic stack: find next greater for all elements in nums2
        unordered_map<int, int> nextGreater;
        stack<int> st;  // Decreasing stack
        
        for (int num : nums2) {
            // While stack top is smaller than current: current is next greater for top
            while (!st.empty() && st.top() < num) {
                nextGreater[st.top()] = num;
                st.pop();
            }
            st.push(num);
        }
        
        // Elements remaining in stack have no next greater
        while (!st.empty()) {
            nextGreater[st.top()] = -1;
            st.pop();
        }
        
        // Answer queries for nums1
        vector<int> result;
        for (int num : nums1) result.push_back(nextGreater[num]);
        return result;
    }
};
```

**📖 Explanation:**
- Monotonic decreasing stack: elements stay in decreasing order
- When we see a larger element, it's the "next greater" for all smaller elements in stack
- Pre-compute all next-greaters, then answer queries in O(1)

**⚡ Complexity:** Time: O(n+m) | Space: O(n)

**🎯 Trick:** "**Monotonic stack for next greater**" — maintain a stack where if a new element is larger than top, pop and record the answer. The new element IS the next greater.

---

### Problem 64: Implement Queue Using Stacks
**📌 Task:** Implement FIFO queue using only two stacks.

```cpp
class MyQueue {
    stack<int> inbox, outbox;
    
public:
    void push(int x) {
        inbox.push(x);  // Always push to inbox
    }
    
    int pop() {
        if (outbox.empty()) {
            // Transfer all from inbox to outbox (reverses order → FIFO!)
            while (!inbox.empty()) {
                outbox.push(inbox.top());
                inbox.pop();
            }
        }
        int front = outbox.top();
        outbox.pop();
        return front;
    }
    
    int peek() {
        if (outbox.empty()) {
            while (!inbox.empty()) {
                outbox.push(inbox.top());
                inbox.pop();
            }
        }
        return outbox.top();
    }
    
    bool empty() {
        return inbox.empty() && outbox.empty();
    }
};
```

**📖 Explanation:**
- Inbox: receives new elements (push always goes here)
- Outbox: serves pop/peek (reversed order = FIFO)
- Transfer only when outbox is empty → amortized O(1) per operation

**⚡ Complexity:** Push O(1), Pop O(1) amortized | Space: O(n)

**🎯 Trick:** "**Two stacks = one queue**" — inbox and outbox. Transfer inbox→outbox only when outbox is empty. Each element transferred exactly once = amortized O(1).

---

## Hour 3 — Matrix Problems

---

### Problem 65: Spiral Matrix
**📌 Task:** Return all elements in spiral order.

```cpp
class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        vector<int> result;
        int top = 0, bottom = matrix.size()-1;
        int left = 0, right = matrix[0].size()-1;
        
        while (top <= bottom && left <= right) {
            // Go Right along top row
            for (int j = left; j <= right; j++) result.push_back(matrix[top][j]);
            top++;
            
            // Go Down along right column
            for (int i = top; i <= bottom; i++) result.push_back(matrix[i][right]);
            right--;
            
            // Go Left along bottom row (if still valid)
            if (top <= bottom) {
                for (int j = right; j >= left; j--) result.push_back(matrix[bottom][j]);
                bottom--;
            }
            
            // Go Up along left column (if still valid)
            if (left <= right) {
                for (int i = bottom; i >= top; i--) result.push_back(matrix[i][left]);
                left++;
            }
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- 4 boundaries: top, bottom, left, right
- Each spiral layer: go right → down → left → up, then shrink boundaries
- Check boundaries before left/up traversals (layer might have been consumed)

**⚡ Complexity:** Time: O(m*n) | Space: O(1)

**🎯 Trick:** "**RDLU + 4 boundaries**" — Right, Down, Left, Up. Shrink the boundary after each direction. Always check boundary before reverse directions.

---

### Problem 66: Rotate Image
**📌 Task:** Rotate n×n matrix 90° clockwise in-place.

```cpp
class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int n = matrix.size();
        
        // Step 1: Transpose (swap matrix[i][j] with matrix[j][i])
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                swap(matrix[i][j], matrix[j][i]);
            }
        }
        
        // Step 2: Reverse each row
        for (int i = 0; i < n; i++) {
            reverse(matrix[i].begin(), matrix[i].end());
        }
    }
};
```

**📖 Explanation:**
- 90° clockwise = Transpose + Reverse rows
- 90° counter-clockwise = Reverse rows + Transpose (or Transpose + Reverse columns)
- Transpose: `j` starts from `i+1` to avoid swapping back

**⚡ Complexity:** Time: O(n²) | Space: O(1)

**🎯 Trick:** "**Rotate 90° CW = Transpose + Flip Rows**" — memorize this formula. CCW = Transpose + Flip Columns. 180° = Flip both.

---

### Problem 67: Diagonal Traverse
**📌 Task:** Traverse matrix diagonally, alternating up and down.

```cpp
class Solution {
public:
    vector<int> findDiagonalOrder(vector<vector<int>>& mat) {
        int m = mat.size(), n = mat[0].size();
        vector<int> result;
        int r = 0, c = 0;
        
        for (int i = 0; i < m * n; i++) {
            result.push_back(mat[r][c]);
            
            if ((r + c) % 2 == 0) {  // Moving UP-RIGHT
                if (c == n - 1) { r++; }           // Hit right wall: go down
                else if (r == 0) { c++; }           // Hit top wall: go right
                else { r--; c++; }                  // Normal: go up-right
            } else {                  // Moving DOWN-LEFT
                if (r == m - 1) { c++; }            // Hit bottom wall: go right
                else if (c == 0) { r++; }           // Hit left wall: go down
                else { r++; c--; }                  // Normal: go down-left
            }
        }
        
        return result;
    }
};
```

**📖 Explanation:**
- Even diagonal sum (r+c) → moving up-right
- Odd diagonal sum → moving down-left
- Handle wall bounces: check walls before normal movement

**⚡ Complexity:** Time: O(m*n) | Space: O(1)

**🎯 Trick:** "**r+c parity determines direction**" — even=up-right, odd=down-left. Wall bounce priority: corner→wall→normal movement.

---

## Hour 4 — Linked List Basics

---

### Problem 68: Reverse Linked List
**📌 Task:** Reverse a singly linked list.

```cpp
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode* prev = nullptr;
        ListNode* curr = head;
        
        while (curr != nullptr) {
            ListNode* next = curr->next;  // Save next before overwriting
            curr->next = prev;            // Reverse the pointer
            prev = curr;                  // Move prev forward
            curr = next;                  // Move curr forward
        }
        
        return prev;  // prev is now the new head
    }
};
```

**📖 Explanation:**
- Three pointers: prev (reversed part), curr (current node), next (saved next)
- Reverse `curr->next` from pointing forward to pointing backward
- At end, curr=null, prev=last node=new head

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**prev-curr-next dance**" — three pointer reversal. Visualize: `← ← ← curr → → →` where you're extending the arrow section one node at a time.

---

### Problem 69: Linked List Cycle
**📌 Task:** Detect if linked list has a cycle.

```cpp
class Solution {
public:
    bool hasCycle(ListNode* head) {
        ListNode* slow = head;
        ListNode* fast = head;
        
        while (fast != nullptr && fast->next != nullptr) {
            slow = slow->next;        // Move 1 step
            fast = fast->next->next;  // Move 2 steps
            
            if (slow == fast) return true;  // Cycle detected!
        }
        
        return false;  // fast reached end → no cycle
    }
};
```

**📖 Explanation:**
- Floyd's tortoise and hare: if cycle exists, fast will lap slow
- No cycle: fast reaches null
- They meet INSIDE the cycle (not necessarily at start)

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Tortoise & Hare**" — if there's a cycle, the fast pointer WILL catch the slow pointer. Think of runners on a circular track: faster runner will lap the slower one.

---

### Problem 70: Middle of the Linked List
**📌 Task:** Return middle node of linked list.

```cpp
class Solution {
public:
    ListNode* middleNode(ListNode* head) {
        ListNode* slow = head;
        ListNode* fast = head;
        
        // When fast reaches end, slow is at middle
        while (fast != nullptr && fast->next != nullptr) {
            slow = slow->next;
            fast = fast->next->next;
        }
        
        return slow;  // For even length: returns SECOND middle
    }
};
```

**📖 Explanation:**
- Fast moves 2x speed of slow
- When fast reaches end: slow is at middle
- Even length [1,2,3,4]: fast reaches null after 2 iterations, slow at node 3 (second middle)

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Fast=2×slow → middle**" — the most elegant linked list trick. The same slow/fast pointer idea that detects cycles also finds the middle.

---

## Hour 5 — Mock Exam (3 Classic Problems)

---

### Problem 71: Climbing Stairs
*(Solved in Problem 8 — see Day 1 Hour 3)*
**Key reminder:** Climbing stairs = Fibonacci. `ways(n) = ways(n-1) + ways(n-2)`.

---

### Problem 72: Single Number
**📌 Task:** Every element appears twice except one. Find it. O(n) time, O(1) space.

```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int result = 0;
        for (int num : nums) {
            result ^= num;  // XOR: pairs cancel out, single remains
        }
        return result;
    }
};
```

**📖 Explanation:**
- XOR properties: `a ^ a = 0`, `a ^ 0 = a`, XOR is commutative and associative
- XOR all elements: pairs become 0, only the single number remains
- Example: [4,1,2,1,2] → 4^1^2^1^2 = 4^(1^1)^(2^2) = 4^0^0 = 4

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**XOR all = single survivor**" — THE most elegant bit trick. Always remember: `a^a=0`. Pairs annihilate, single survives.

---

### Problem 73: Best Time to Buy and Sell Stock
**📌 Task:** Find max profit from one buy and one sell.

```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int minPrice = INT_MAX;
        int maxProfit = 0;
        
        for (int price : prices) {
            minPrice = min(minPrice, price);           // Track lowest buy price
            maxProfit = max(maxProfit, price - minPrice); // Max profit if sell today
        }
        
        return maxProfit;
    }
};
```

**📖 Explanation:**
- For each day: assume we sell today. Best profit = today's price - lowest price seen so far
- Track both minimum price and maximum profit in single pass
- Can't sell before buying (minPrice updates before profit check? No — both use same `price`)

**⚡ Complexity:** Time: O(n) | Space: O(1)

**🎯 Trick:** "**Track minimum seen so far**" — stock problem always reduces to: for each sell price, what's the best buy price? Answer: minimum before it.

---

# 📊 Complete Summary: Algorithms & Complexity

| Algorithm | Time | Space | Use When |
|---|---|---|---|
| Sieve of Eratosthenes | O(n log log n) | O(n) | Count/list primes up to n |
| Binary Search | O(log n) | O(1) | Sorted array, find target |
| Kadane's Algorithm | O(n) | O(1) | Maximum subarray sum |
| Floyd's Cycle Detection | O(n) | O(1) | Cycle in linked list/array |
| Boyer-Moore Voting | O(n) | O(1) | Majority element |
| Prefix Sum + HashMap | O(n) | O(n) | Subarray sum = k |
| Two Pointers | O(n) | O(1) | Sorted array operations |
| Sliding Window | O(n) | O(n) | Substring/subarray problems |
| Monotonic Stack | O(n) | O(n) | Next greater/smaller element |
| Dutch National Flag | O(n) | O(1) | 3-way partition |

---

# 🧠 Master Mnemonics Sheet

| Topic | Mnemonic |
|---|---|
| Fibonacci = Climbing Stairs | "**1 or 2 steps? → Fibonacci!**" |
| Power of 2 | "**n & (n-1) == 0**" |
| XOR pairs cancel | "**a ^ a = 0, lone survivor wins**" |
| Reverse array: 3 reversals | "**RRR: Reverse-Reverse-Reverse**" |
| Rotate 90° CW | "**Transpose + Flip Rows**" |
| Subarray sum = k | "**prefixSum - k in the map**" |
| Majority element | "**Vote canceling: different = cancel**" |
| Missing number | "**Gauss: n(n+1)/2 - actual**" |
| Linked list middle | "**Fast=2×slow**" |
| Stock problem | "**Track running minimum**" |
| Valid Palindrome | "**isalnum + tolower**" |
| Anagram | "**Sort → same key**" |
| Spiral matrix | "**RDLU + 4 boundaries**" |
| 2D Binary Search | "**row=idx/n, col=idx%n**" |
| Stack use case | "**Matching, NGE, balanced**" |
| Group by property | "**Sort/hash the canonical form**" |

---

# ⚡ Quick Reference: C++ STL Cheat Sheet

```cpp
// Containers
vector<int> v;              // Dynamic array
stack<int> st;              // LIFO
queue<int> q;               // FIFO
priority_queue<int> maxpq;  // Max heap (default)
priority_queue<int, vector<int>, greater<int>> minpq;  // Min heap
unordered_map<int,int> mp;  // Hash map O(1) avg
unordered_set<int> s;       // Hash set O(1) avg
set<int> ordered_s;         // BST set O(log n)

// Useful functions
sort(v.begin(), v.end());                    // Sort ascending
sort(v.begin(), v.end(), greater<int>());    // Sort descending
reverse(v.begin(), v.end());                 // Reverse
accumulate(v.begin(), v.end(), 0);           // Sum
count(v.begin(), v.end(), x);               // Count occurrences
*max_element(v.begin(), v.end());            // Max value
*min_element(v.begin(), v.end());            // Min value
lower_bound(v.begin(), v.end(), x);          // First >= x (sorted)
upper_bound(v.begin(), v.end(), x);          // First > x (sorted)
__gcd(a, b);                                 // GCD
__builtin_popcount(n);                       // Count set bits
```

---

*📌 This guide covers all 73 numbered problems supplied in the TCS NQT 5-Day Plan.
Practice each problem actively after studying the solution.*
