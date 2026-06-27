# Permutation & Combination — Coding Applications

## 1. Generate All Permutations (Backtracking)

```python
def permutations(arr, current=[], result=[]):
    if not arr:
        result.append(current[:])
        return
    for i in range(len(arr)):
        current.append(arr[i])
        permutations(arr[:i] + arr[i+1:], current, result)
        current.pop()
    return result

print(permutations([1, 2, 3]))  # All 6 permutations of 3 elements
```

## 2. Combinations (Itertools or Manual)

```python
from itertools import combinations, permutations

items = ['A', 'B', 'C', 'D']
# All combinations of size 2
print(list(combinations(items, 2)))  # 6 pairs

# All permutations of size 2
print(list(permutations(items, 2)))  # 12 ordered pairs
```

## 3. LeetCode Applications

- **LeetCode 46 — Permutations:** Generate all distinct permutations
- **LeetCode 77 — Combinations:** Generate all C(n,k) combinations
- **LeetCode 39 — Combination Sum:** Combinations with repetition

## 4. Counting Subsets

```python
def count_subsets(n):
    """Total subsets of n elements = 2^n"""
    return 2 ** n

def count_subsets_of_size_k(n, k):
    """nCk using multiplicative formula"""
    if k > n:
        return 0
    result = 1
    for i in range(k):
        result = result * (n - i) // (i + 1)
    return result
```
