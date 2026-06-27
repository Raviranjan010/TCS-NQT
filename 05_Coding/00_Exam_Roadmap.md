# TCS NQT Coding Roadmap

## Coding Section Mindset

TCS NQT coding is not about memorizing 300 problems. It is about recognizing the correct pattern quickly and writing bug-free code.

Your target:

| Level | Target Ability |
|---|---|
| Ninja | Solve easy array, string, math, sorting questions |
| Digital | Solve medium questions using hashing, prefix sum, two pointers, sliding window |
| Prime | Solve optimized medium questions and explain complexity clearly |

## Most Common Problem Types

| Type | Examples | Pattern |
|---|---|---|
| Number logic | Prime, palindrome, Armstrong, GCD, LCM | Loop/math |
| Array processing | Max/min, rotate, missing number, second largest | Traversal |
| Frequency | Duplicates, anagram, non-repeating character | Hash map/count array |
| Sorting | Kth largest, merge intervals, sort by frequency | Sort + scan |
| Two pointers | Pair sum, reverse array, remove duplicates | Left/right movement |
| Sliding window | Max sum subarray of size k, longest unique substring | Expand/shrink window |
| Prefix sum | Range sum, equilibrium index, subarray sum | Reuse previous sums |
| String logic | Vowels, compression, reverse words, palindrome | Character traversal |
| Matrix | Spiral print, transpose, diagonal sum | Row/column simulation |
| Greedy | Minimum coins, activity selection, train platform | Sort + local best |

## Time Strategy

1. Read the problem twice.
2. Write 2 sample tests manually.
3. Choose the pattern.
4. Code the simplest correct solution first.
5. Optimize only if constraints demand it.
6. Test edge cases before submitting.

## Constraint-Based Decision

| Constraint | Acceptable Complexity |
|---|---|
| N <= 100 | O(N^3) may pass |
| N <= 1000 | O(N^2) may pass |
| N <= 100000 | Need O(N) or O(N log N) |
| N >= 1000000 | Usually O(N), careful memory |

## Edge Cases Checklist

- Empty or size 1 input
- All elements same
- Negative numbers
- Duplicates
- Already sorted input
- Reverse sorted input
- Very large values, use `long long`
- Spaces in strings, use `getline`
- Case sensitivity in strings

## Scoring Strategy

For TCS-style coding, partial correctness is not enough. Focus on:

- Exact input/output format
- No extra text in output
- Proper newline handling
- Integer overflow prevention
- Simple variable names and readable logic
