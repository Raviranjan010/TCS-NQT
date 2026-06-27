# Arrays — Tricks, Traps, and TCS-Specific Patterns

## Trap 1 — Off-By-One in Sliding Window

**The trap:** When sliding a window of size `k`, the new element enters at index `i` and the old one exits at index `i - k`. Getting this wrong by 1 gives wrong answers on every window.

**Fix:** Always verify: if `i` is the rightmost index of the current window, left boundary is `i - k + 1` and the element leaving is at `i - k`.

```java
// RIGHT: windowSum += nums[i] - nums[i - k];
// WRONG: windowSum += nums[i] - nums[i - k + 1];
```

---

## Trap 2 — Kadane's With All-Negative Arrays

**The trap:** Initializing `maxSum = 0` gives wrong answer when all elements are negative (answer should be the least-negative element, not 0).

**Fix:** Initialize `maxSum = nums[0]` and `currentSum = nums[0]`, then start the loop from index 1.

```java
// WRONG (fails all-negative input):
int maxSum = 0;
// RIGHT:
int maxSum = nums[0], currentSum = nums[0];
for (int i = 1; i < nums.length; i++) { ... }
```

---

## Trap 3 — Two Pointer Requires Sorted Array

**The trap:** Applying two-pointer to find a pair with given sum on an **unsorted** array. This gives wrong answers.

**Fix:** Either sort first (and note that sorting changes indices — if indices are needed, use HashMap instead), or use a HashMap for O(n) unsorted solution.

---

## Trap 4 — Integer Overflow in Prefix Sum

**The trap:** Array values can be large (e.g., up to 10⁹), and sum of 10⁵ such values exceeds `Integer.MAX_VALUE` (≈2.1 × 10⁹).

**Fix:** Use `long` for prefix sums whenever values × count could exceed 2 × 10⁹.

```java
long[] prefix = new long[n + 1]; // not int[]
```

---

## Trap 5 — Rotation Modulo

**The trap:** Rotating by `k` when `k ≥ n` causes index out of bounds or incorrect result.

**Fix:** Always apply `k = k % n` before any rotation logic.

```java
k = k % nums.length; // if k == 0, no rotation needed
if (k == 0) return;
```

---

## Trap 6 — In-Place Sign-Marking Corrupts Input

**The trap:** The in-place marking trick (negating `nums[idx]` to mark visited) breaks if you read `nums[idx]` after marking without taking `Math.abs()`.

**Fix:** Always use `int idx = Math.abs(num) - 1;` — take abs of the value before using it as an index, because a previously marked element will be negative.

```java
for (int num : nums) {
    int idx = Math.abs(num) - 1;  // ← Math.abs is critical here
    if (nums[idx] > 0) nums[idx] = -nums[idx];
}
```

---

## Trap 7 — Dutch National Flag: mid Stops, high Moves

**The trap:** When `nums[mid] == 2`, you swap with `high` and decrement `high` — but do NOT increment `mid`. The swapped-in element at `mid` is not yet examined.

**Fix:** Only increment `mid` for cases 0 and 1, not for case 2.

```java
if      (nums[mid] == 0) { swap(low, mid); low++; mid++; }
else if (nums[mid] == 1) { mid++; }                         // mid moves
else                     { swap(mid, high); high--; }       // mid stays!
```

---

## Trap 8 — Subarray Sum = k Fails with Sorting

**The trap:** If you sort the array before solving "subarray sum = k", you destroy the ordering, which is required for subarrays to be contiguous.

**Fix:** Never sort for subarray problems. Use prefix sum + HashMap (works for negative numbers too).

---

## Trap 9 — Product Except Self: Don't Use Division

**The trap:** The intuitive solution divides total product by each element — but fails when the array contains zeros (division by zero).

**Fix:** Use left-pass × right-pass without any division.

---

## Trap 10 — Third Maximum: Long Not Int

**The trap:** If the array contains `Integer.MIN_VALUE`, using `int` for the "not seen" sentinel fails because `Integer.MIN_VALUE` could be a valid array element.

**Fix:** Use `long` initialized to `Long.MIN_VALUE` as the sentinel:

```java
long first = Long.MIN_VALUE, second = Long.MIN_VALUE, third = Long.MIN_VALUE;
```

---

## TCS-Specific Pattern Spotting

| Keyword in Problem | Pattern to Use |
|-------------------|---------------|
| "contiguous subarray with maximum sum" | Kadane's |
| "subarray with sum equal to k" | Prefix Sum + HashMap |
| "maximum sum of subarray of size k" | Sliding Window (fixed) |
| "smallest subarray with sum ≥ k" | Sliding Window (variable) |
| "pair with sum" (sorted) | Two Pointer |
| "two numbers that add to target" (unsorted) | HashMap |
| "missing number in 1 to n" | Sum formula or XOR |
| "0s, 1s, 2s sort" | Dutch National Flag |
| "rotate array" | Reverse method |
| "product except self" | Left × Right pass |
