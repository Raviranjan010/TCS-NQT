# Top Tricks and Traps for TCS NQT

## 1. Number System Traps (🔴 High)
## Trap 1 — Neglecting Modulo Cycle boundary
**The trap:** In cyclicity problems, when power is exactly divisible by 4 (i.e. $Y \bmod 4 == 0$), substituting power as 0 gives $X^0 = 1$, which is incorrect.

**Fix:** If $Y \bmod 4 == 0$, treat the power exponent as **4** instead of 0.
- *Example:* Find unit digit of $2^8$.
  - $8 \bmod 4 = 0 \rightarrow$ use power 4.
  - $2^4 = 16 \rightarrow$ unit digit is **6**. (Using power 0 would give $2^0 = 1$, which is wrong).

---

## Trap 2 — Factor Count for Perfect Squares
**The trap:** A perfect square has an odd number of factors. If a question asks to write $N$ as a product of two factors, the formula is:
- If $N$ is not a perfect square: $\frac{F(N)}{2}$
- If $N$ is a perfect square: $\frac{F(N) + 1}{2}$ (if factors can be identical) or $\frac{F(N) - 1}{2}$ (if distinct).

---

## Trap 3 — Trailing Zeros count base
**The trap:** Assuming trailing zeros is just $N/5$. For large factorials, powers like $5^2$ (25) contribute an extra factor of 5, which must be added.

**Fix:** Always use Legendre's summation: $\lfloor N/5 \rfloor + \lfloor N/25 \rfloor + \lfloor N/125 \rfloor \dots$


## Coding - Arrays Traps (🔴 High)
#**The trap:** When sliding a window of size `k`, the new element enters at index `i` and the old one exits at index `i - k`. Getting this wrong by 1 gives wrong answers on every window.

**Fix:** Always verify: if `i` is the rightmost index of the current window, left boundary is `i - k + 1` and the element leaving is at `i - k`.

```cpp
// RIGHT: windowSum += nums[i] - nums[i - k];
// WRONG: windowSum += nums[i] - nums[i - k + 1];
```

---

#**The trap:** Initializing `maxSum = 0` gives wrong answer when all elements are negative (answer should be the least-negative element, not 0).

**Fix:** Initialize `maxSum = nums[0]` and `currentSum = nums[0]`, then start the loop from index 1.

```cpp
// WRONG (fails all-negative input):
int maxSum = 0;
// RIGHT:
int maxSum = nums[0], currentSum = nums[0];
for (size_t i = 1; i < nums.size(); ++i) { ... }
```

---

#**The trap:** Applying two-pointer to find a pair with given sum on an **unsorted** array. This gives wrong answers.

**Fix:** Either sort first (and note that sorting changes indices — if indices are needed, use hash table instead), or use `std::unordered_map` for O(n) unsorted solution.

---

#**The trap:** Array values can be large (e.g., up to 10⁹), and sum of 10⁵ such values exceeds `INT_MAX` (2.14 × 10⁹).

**Fix:** Use `long long` for prefix sums whenever values × count could exceed 2 × 10⁹.

```cpp
std::vector<long long> prefix(n + 1, 0); // not std::vector<int>
```

---

#**The trap:** Rotating by `k` when `k >= n` causes index out of bounds or incorrect result.

**Fix:** Always apply `k = k % n` before any rotation logic.

```cpp
k = k % nums.size(); // if k == 0, no rotation needed
if (k == 0) return;
```

---

#**The trap:** The in-place marking trick (negating `nums[idx]` to mark visited) breaks if you read `nums[idx]` after marking without taking `std::abs()`.

**Fix:** Always use `int idx = std::abs(num) - 1;` — take abs of the value before using it as an index, because a previously marked element will be negative.

```cpp
for (int num : nums) {
    int idx = std::abs(num) - 1;  // ← std::abs is critical here
    if (nums[idx] > 0) nums[idx] = -nums[idx];
}
```

---

#**The trap:** When `nums[mid] == 2`, you swap with `high` and decrement `high` — but do NOT increment `mid`. The swapped-in element at `mid` is not yet examined.

**Fix:** Only increment `mid` for cases 0 and 1, not for case 2.

```cpp
if      (nums[mid] == 0) { std::swap(nums[low], nums[mid]); low++; mid++; }
else if (nums[mid] == 1) { mid++; }                         // mid moves
else                     { std::swap(nums[mid], nums[high]); high--; }       // mid stays!
```

---

#**The trap:** If you sort the array before solving "subarray sum = k", you destroy the ordering, which is required for subarrays to be contiguous.

**Fix:** Never sort for subarray problems. Use prefix sum + `std::unordered_map` (works for negative numbers too).

---

#**The trap:** The intuitive solution divides total product by each element — but fails when the array contains zeros (division by zero).

**Fix:** Use left-pass × right-pass without any division.

---

#**The trap:** If the array contains `INT_MIN`, using `int` for the "not seen" sentinel fails because `INT_MIN` could be a valid array element.

**Fix:** Use `long long` initialized to `LLONG_MIN` as the sentinel:

```cpp
long long first = LLONG_MIN, second = LLONG_MIN, third = LLONG_MIN;
```

---

#| Keyword in Problem | Pattern to Use |
|-------------------|---------------|
| "contiguous subarray with maximum sum" | Kadane's |
| "subarray with sum equal to k" | Prefix Sum + std::unordered_map |
| "maximum sum of subarray of size k" | Sliding Window (fixed) |
| "smallest subarray with sum ≥ k" | Sliding Window (variable) |
| "pair with sum" (sorted) | Two Pointer |
| "two numbers that add to target" (unsorted) | std::unordered_map |
| "missing number in 1 to n" | Sum formula or XOR |
| "0s, 1s, 2s sort" | Dutch National Flag |
| "rotate array" | Reverse method |
| "product except self" | Left × Right pass |

## Coding - Strings Traps (🔴 High)
#**The trap:** Writing `s = s + c;` inside a loop of size N. In C++, `s + c` creates a brand new string copy of size `s.length()`, copying all characters over. This makes the loop run in O(N²) time instead of O(N), which results in a Time Limit Exceeded (TLE).

**Fix:** Use `s += c;` or `s.push_back(c);`. These append in-place in O(1) amortized time, keeping the loop O(N).

```cpp
// SLOW O(N²):
s = s + c;

// FAST O(N):
s += c;
```

---

#**The trap:** Passing a large string to a helper function as `void solve(std::string s)`. C++ copies the entire string, which takes O(N) time and memory per function call.

**Fix:** Pass by reference or const reference: `void solve(const std::string& s)`.

---

#**The trap:** Hardcoding ASCII offsets like `c - 32` or `c + 32` for case conversion. If you get the sign wrong, or apply it to a non-alphabetic character, it produces corrupt characters.

**Fix:** Use standard library functions `tolower(c)` and `toupper(c)`. Or use bitwise operations on letters:
- Convert to lower: `c | 32`
- Convert to upper: `c & ~32` (or `c & 95`)

---

#**The trap:** Doing `s.find(sub)` repeatedly. In worst case (e.g. `s="aaaaaaaaab"`, `sub="aaab"`), it runs in O(N * M) time.

**Fix:** Use a single-pass KMP algorithm if N and M are large (rare in TCS), or avoid nested searches.

---

#**The trap:** Using `std::stoi` on a string representing a number that exceeds integer limits (e.g. "99999999999"). It throws a `std::out_of_range` exception and crashes the program.

**Fix:** Use `long long` with `std::stoll()`, or write custom parse loops (like atoi) that check for overflows manually.

---

#**The trap:** Using `s.erase(i, 1)` inside a loop to remove characters. Erase shifts all remaining elements, taking O(N) time. In a loop, this leads to O(N²) overall time complexity.

**Fix:** Use a Two-Pointer write approach. Read elements from left to right, write valid ones to `insertPos`, then truncate the string at the end.

---

#| Keyword in Problem | Pattern to Use |
|-------------------|---------------|
| "check anagram" | Frequency array of size 26 |
| "words in sentence" | `std::stringstream` |
| "longest prefix" | Vertical scanning or sorting first |
| "numeric value" | custom `atoi` loop checking `INT_MAX/INT_MIN` |
| "balanced parenthesis" | `std::stack<char>` |
| "distinct character substring" | Sliding Window + last-seen map |

## Coding - HashMap Traps (🔴 High)
#**The trap:** Accessing `map[key]` to check if a key exists. If the key is not in the map, the `[]` operator **implicitly inserts** the key with a default value (e.g. 0 for `int`), increasing the map's size.

**Fix:** Use `map.count(key)` or `map.find(key)` to check existence without inserting.

```cpp
// INCORRECT (inserts key with value 0 if absent):
if (map[key] == 0) { ... }

// CORRECT:
if (map.count(key) == 0) { ... }
```

---

#**The trap:** Attempting to use `std::pair<int, int>` or `std::vector<int>` as a key in `std::unordered_map`. C++ standard library does **not** provide a default hash function for pairs or vectors, resulting in a compilation error.

**Fix:** 
- **Option 1:** Use `std::map` instead, which only requires the `<` operator (which is defined for pairs/vectors).
- **Option 2:** Define a custom hash structure for `std::unordered_map`. (Option 1 is faster to write in an exam).

```cpp
// COMPILES: std::map supports pairs
std::map<std::pair<int, int>, int> coordinatesMap;

// DOES NOT COMPILE (without custom hash):
std::unordered_map<std::pair<int, int>, int> coordinatesMap;
```

---

#**The trap:** In competitive environments, standard hash maps can be attacked or hit worst-case scenarios where all elements collide into the same bucket, turning insertion/lookup into O(N) time.

**Fix:** If you experience TLE with `std::unordered_map`, switch to `std::map` (guaranteed O(log N)) or reserve capacity using `map.reserve(1024)`.

---

#**The trap:** Writing `if (map.count(key)) return map[key];`. This performs the hash function calculation twice: once to check, and once to access.

**Fix:** Use `map.find()` to do a single lookup, and save the iterator:
```cpp
auto it = map.find(key);
if (it != map.end()) {
    return it->second; // single hash calculation
}
```

---

#| Question Pattern | HashMap Strategy |
|------------------|------------------|
| "Find elements appearing once" | Frequency Map |
| "Intersection of two arrays" | Set (for unique elements) or Map (with count tracking) |
| "Subarray sum equals K" | Prefix Sum + `std::unordered_map` mapping sum to count |
| "Longest subarray sum equals K" | Prefix Sum + `std::unordered_map` mapping sum to leftmost index |
| "Group Anagrams" | Sort string as key, group string list in map |

## Coding - Searching Traps (🔴 High)
#**The trap:** `int mid = (lo + hi) / 2;` — if both lo and hi are near `INT_MAX`, their sum overflows to a negative number, giving a wrong (or negative) mid.

**Fix:** Always use `int mid = lo + (hi - lo) / 2;`

---

#**The trap:** Using `while (lo <= hi)` for lower/upper bound returns wrong results; using `while (lo < hi)` for exact-match search causes missed final element.

**Fix:** 
- Exact match → `lo <= hi`, `hi = n-1`
- Bounds / Peak / Answer Space → `lo < hi`, `hi = n` (or `n-1` for peak)

---

#**The trap:** Candidate sees a search question and applies binary search without checking if the array is sorted. Gets wrong answers.

**Fix:** Binary search's correctness guarantee requires the **monotone property** — either sorted order or a condition that is strictly false then true (or vice versa).

---

#**The trap:** On finding `arr[mid] == target`, returning `mid` immediately. This gives any occurrence, not necessarily first or last.

**Fix:**
- First occurrence: save `result = mid`, then `hi = mid - 1` (keep searching left)
- Last occurrence: save `result = mid`, then `lo = mid + 1` (keep searching right)

```cpp
// WRONG (first occurrence):
if (arr[mid] == target) return mid; // stops at any match
// RIGHT:
if (arr[mid] == target) { result = mid; hi = mid - 1; } // continue left
```

---

#**The trap:** Using `hi = arr.size() - 1` for lower/upper bound when the answer might be `arr.size()` (i.e., all elements are less than target → insert at the end). The loop terminates with `lo = hi = n-1` and misses returning `n`.

**Fix:** For lower bound and upper bound, use `hi = arr.size()` (not `arr.size() - 1`).

---

#**The trap:** `std::lower_bound` returns an iterator, not an integer index. Dereferencing it directly when target is not present might lead to reading next elements or undefined behavior if it equals `.end()`.

**Fix:** Always subtract `arr.begin()` to get the index, and check if it is within bounds before dereferencing:
```cpp
auto it = std::lower_bound(arr.begin(), arr.end(), target);
if (it != arr.end()) {
    int val = *it;
    int idx = it - arr.begin();
}
```

---

#**The trap:** Checking `arr[mid] > arr[mid-1] && arr[mid] > arr[mid+1]` can throw out-of-bounds errors at boundaries (mid=0 or mid=n-1).

**Fix:** The slope-following approach (`if (nums[mid] < nums[mid+1]) lo = mid + 1; else hi = mid;`) never accesses `mid-1` and handles boundaries naturally.

---

#| If the problem says... | Think... |
|-----------------------|---------|
| "array is sorted, find element" | Binary search |
| "find first/last position of x in sorted array" | First/Last occurrence |
| "how many times does x appear in sorted array" | `std::upper_bound` - `std::lower_bound` |
| "find peak element" | Peak binary search |
| "first version that is bad" | Answer-space binary search (minimize first True) |
| "minimum X such that condition holds" | Binary search on answer |
| "search in rotated sorted array" | Modified binary search (detect which half is sorted) |
| "unsorted array, find x" | Linear search or `std::unordered_map` |

## Coding - Sorting Traps (🔴 High)
#**The trap:** Writing a comparator using `≤` or `≥` instead of `<` or `>`. C++ STL algorithms require the comparator to define a **strict weak ordering**. If you use `≤` (e.g. `a <= b`), when comparing `a` and `b` where `a == b`, both `a <= b` and `b <= a` return true. This violates the strict weak ordering requirement, resulting in undefined behavior, which can cause a runtime crash (segmentation fault) or infinite loop in `std::sort`.

**Fix:** Always use `<` or `>` in your comparators. Never use `<=` or `>=`.

```cpp
// CRASH RISK (contains <=):
std::sort(arr.begin(), arr.end(), [](int a, int b) { return a <= b; });

// SAFE (strict <):
std::sort(arr.begin(), arr.end(), [](int a, int b) { return a < b; });
```

---

#**The trap:** Fully sorting an array when you only need the top k elements or the kth element (e.g., Kth Largest Element). Sorting takes O(N log N) time, which might TLE (Time Limit Exceeded) if N is large.

**Fix:** Use `std::nth_element` (QuickSelect) which runs in O(N) average time, or use a min-heap / max-heap (`std::priority_queue`) of size K which runs in O(N log K).

```cpp
// O(N) instead of O(N log N)
std::nth_element(arr.begin(), arr.begin() + k, arr.end());
```

---

#**The trap:** Using `std::sort` when the problem requires relative order preservation. `std::sort` uses IntroSort which is not stable.

**Fix:** Use `std::stable_sort` (which uses Merge Sort internally) to preserve original relative order of equal elements.

---

#**The trap:** Applying counting sort directly when values include negative numbers. Since array indices cannot be negative, accessing `count[arr[i]]` will crash.

**Fix:** Find the minimum element in the array (`minVal`). Offset all indices by `abs(minVal)` during counting, and shift them back when reconstructing the array.

```cpp
int minVal = *std::min_element(arr.begin(), arr.end());
// offset = -minVal
// count[arr[i] + offset]++;
```

---

#**The trap:** Writing a comparator using `a - b` (e.g., `return a - b < 0;` or similar Java style translated to C++). If `a` is a large positive number and `b` is a large negative number, `a - b` will overflow, producing incorrect results.

**Fix:** Always use explicit comparison operators (`a < b`).

```cpp
// WRONG (overflow risk):
bool compare(int a, int b) { return (a - b) < 0; }

// RIGHT:
bool compare(int a, int b) { return a < b; }
```

---

#| Keyword in Problem | Sorting Technique |
|-------------------|------------------|
| "sort elements in range [0, 1, 2]" | Dutch National Flag (O(n) time, O(1) space) |
| "merge intervals" | Sort by start time + linear traversal |
| "minimum platforms / train arrival" | Sort arrival and departure separately |
| "kth largest element" | `std::nth_element` or Heap |
| "relative sorting" | Custom comparator using index map |
| "count inversions" | Modified Merge Sort |
| "minimum swaps to sort" | Cycle decomposition using graph concept |

## Coding - Math Traps (🔴 High)
## Trap 1 — Reversal Integer Overflow
**The trap:** Reversing `1234567899` results in `9987654321`, which exceeds the maximum limit of a 32-bit signed integer (`2147483647`). This causes undefined behavior/wraparound in C++ if using simple `int`.

**Fix:** Use `long long` for storage during reversal, or pre-check limits before multiplying.
```cpp
if (rev > INT_MAX / 10 || (rev == INT_MAX / 10 && pop > 7)) return 0;
```

---

## Trap 2 — Negative Numbers in Modulo
**The trap:** In C++, `-5 % 3` returns `-2` instead of `1`.

**Fix:** Add divisor before modulo operation:
```cpp
int rem = (a % m + m) % m;
```

---

## Trap 3 — Floating Point Division Rounding Errors
**The trap:** Using `double` division `x / y` and casting to `int` can round down incorrectly due to precision issues (e.g. `29.999999` becoming `29` instead of `30`).

**Fix:** Perform integer calculations whenever possible. For rounding up division:
```cpp
int ceilDiv = (a + b - 1) / b; // works for a >= 0, b > 0
```

---

## Trap 4 — Armstrong Count Digits
**The trap:** Hardcoding digit count to 3. Armstrong numbers can have any number of digits (e.g., 1634 is Armstrong because $1^4 + 6^4 + 3^4 + 4^4 = 1634$).

**Fix:** Count digits first, and use that as the power exponent.

## Coding - Recursion Traps (🔴 High)
## Trap 1 — Missing Base Case (Stack Overflow)
**The trap:** Writing a recursive function without a proper base case, or a base case that cannot be reached. This fills up the call stack space and crashes the program with a Stack Overflow.

**Fix:** Ensure every branch of execution has a clear path to a base case.
```cpp
// WRONG:
int factorial(int n) {
    return n * factorial(n - 1); // no base case!
}
```

---

## Trap 2 — Global Variable Side-Effects
**The trap:** Using global variables within recursive calls. In multi-test-case environments like the TCS compiler, global variables do not auto-reset between runs, leading to cumulative calculation errors.

**Fix:** Pass variables as reference parameters, or reset global state before each run.

---

## Trap 3 — Exponential Call Trees
**The trap:** Solving overlapping subproblems using plain recursion (e.g. `fib(n - 1) + fib(n - 2)`). For $n \geq 45$, this will exceed standard execution limits (TLE).

**Fix:** Transition to Dynamic Programming / Memoization when subproblems overlap.

