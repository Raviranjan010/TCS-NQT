# Tricks And Shortcuts

## Fast Pattern Memory

| If You See | Think |
|---|---|
| "count frequency" | `unordered_map` |
| "lowercase letters only" | `vector<int> freq(26)` |
| "sorted array pair" | Two pointers |
| "subarray of size k" | Fixed sliding window |
| "longest substring/subarray" | Variable sliding window |
| "range sum" | Prefix sum |
| "missing number 1 to n" | Sum formula or XOR |
| "maximum contiguous sum" | Kadane |
| "kth largest" | Sort or priority queue |
| "balanced brackets" | Stack |

## Complexity Shortcuts

- One loop: O(N)
- Nested loop over same array: O(N^2)
- Sorting: O(N log N)
- Binary search: O(log N)
- Hash map average insert/search: O(1)
- Matrix full traversal: O(R*C)

## Number Tricks

### Digit Extraction

```cpp
digit = n % 10;
n = n / 10;
```

### Last Digit

```cpp
n % 10
```

### Remove Last Digit

```cpp
n / 10
```

### Even/Odd

```cpp
n % 2 == 0
```

### GCD/LCM

```cpp
long long g = gcd(a, b);
long long l = a / g * b;
```

## Array Tricks

### Reverse Without Extra Array

```cpp
reverse(a.begin(), a.end());
```

### Sum Safely

```cpp
long long sum = accumulate(a.begin(), a.end(), 0LL);
```

### Second Largest

Track two variables: `first` and `second`.

### Move Zeroes

Keep a `write` pointer. Copy non-zero elements first, then fill zeroes.

## String Tricks

### Digit Character To Number

```cpp
int d = ch - '0';
```

### Lowercase Character Index

```cpp
int index = ch - 'a';
```

### Check Alphabet

```cpp
isalpha(ch)
```

### Convert Case

```cpp
tolower(ch)
toupper(ch)
```

## Debugging Shortcuts

When output is wrong, check in this order:

1. Input reading
2. Loop boundary
3. Index starting from 0 or 1
4. Negative numbers
5. Duplicate values
6. Overflow
7. Extra spaces/newlines

## Common Mistakes In TCS Coding

| Mistake | Fix |
|---|---|
| Printing explanation text | Print only required output |
| Using `int` for large sum | Use `long long` |
| Forgetting `k %= n` in rotation | Normalize k |
| Not handling all-negative array in Kadane | Start with `a[0]` |
| Using `cin` before `getline` without ignore | Use `cin.ignore()` |
| Assuming array has second largest | Handle no distinct second largest |
| Recomputing subarray sum repeatedly | Use sliding window/prefix sum |

## Last-Minute Revision List

Revise these before exam:

- Prime check till `sqrt(n)`
- GCD and LCM
- Kadane algorithm
- Two pointer pair sum
- Sliding window max sum of size k
- Prefix sum range sum
- Frequency count using map
- Anagram check
- First non-repeating character
- Matrix diagonal and spiral
- Balanced parentheses
- Sorting custom comparator
