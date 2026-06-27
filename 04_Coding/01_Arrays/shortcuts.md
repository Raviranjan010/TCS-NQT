# Arrays — Coding Shortcuts

These are genuine time-savers in a 45-minute coding exam — language built-ins and idioms that replace 5–10 lines of code with 1.

---

## Java Shortcuts

### Sort an array
```java
Arrays.sort(arr);                          // ascending, O(n log n)
Arrays.sort(arr, Collections.reverseOrder()); // descending — only works on Integer[], not int[]
// For int[] descending: sort then reverse, or use stream
```

### Convert int[] to Integer[] (needed for reverseOrder / List operations)
```java
Integer[] boxed = Arrays.stream(arr).boxed().toArray(Integer[]::new);
```

### Copy an array
```java
int[] copy = Arrays.copyOf(arr, arr.length);
int[] partial = Arrays.copyOfRange(arr, l, r); // [l, r) exclusive
```

### Fill an array
```java
Arrays.fill(arr, 0);         // fill all with 0
Arrays.fill(arr, l, r, -1); // fill [l, r) with -1
```

### Max / Min of an array (stream)
```java
int max = Arrays.stream(arr).max().getAsInt();
int min = Arrays.stream(arr).min().getAsInt();
int sum = Arrays.stream(arr).sum();
```

### Convert array to ArrayList
```java
List<Integer> list = new ArrayList<>(Arrays.asList(boxedArr));
```

### Frequency counting with HashMap
```java
Map<Integer, Integer> freq = new HashMap<>();
for (int num : arr) freq.merge(num, 1, Integer::sum); // cleaner than getOrDefault
```

### Swap two elements
```java
// No temp variable using XOR (only for ints, and only when i != j)
arr[i] ^= arr[j]; arr[j] ^= arr[i]; arr[i] ^= arr[j];
// Safer: always use temp variable
int temp = arr[i]; arr[i] = arr[j]; arr[j] = temp;
```

---

## Python Shortcuts

### Sort
```python
arr.sort()                        # in-place ascending
arr.sort(reverse=True)            # in-place descending
sorted_arr = sorted(arr)          # returns new sorted list
sorted_arr = sorted(arr, key=lambda x: -x)  # descending via key
```

### Max/Min/Sum
```python
max(arr), min(arr), sum(arr)      # O(n) each
```

### Count occurrences
```python
from collections import Counter
freq = Counter(arr)               # dict of {element: count}
freq.most_common(k)               # top k most frequent
```

### List slicing
```python
arr[l:r]    # elements from index l to r-1
arr[::-1]   # reversed copy
arr[::2]    # every second element
```

### Rotate right by k
```python
k %= len(arr)
arr = arr[-k:] + arr[:-k]        # O(n) but creates new list
```

### Check if all elements satisfy condition
```python
all(x > 0 for x in arr)
any(x == 0 for x in arr)
```

### List comprehension for filtering/mapping
```python
evens = [x for x in arr if x % 2 == 0]
doubled = [x * 2 for x in arr]
```

### Prefix sum
```python
from itertools import accumulate
prefix = [0] + list(accumulate(arr))
# prefix[i+1] = arr[0]+...+arr[i]
# sum(l, r) = prefix[r+1] - prefix[l]
```

### Two-pointer pattern (Pythonic)
```python
left, right = 0, len(arr) - 1
while left < right:
    # process arr[left] and arr[right]
    left += 1   # or right -= 1 based on condition
```

---

## Pattern Recognition Shortcuts (30-Second Decision Tree)

```
Question involves contiguous subarray?
├── Fixed size k          → Sliding Window (fixed)
├── Variable size         → Sliding Window (variable) or Prefix Sum
├── Maximum/minimum sum   → Kadane's
└── Count subarrays = k   → Prefix Sum + HashMap

Question asks for a pair/triplet?
├── Array is sorted       → Two Pointer (opposite ends)
└── Array unsorted        → HashMap O(n) or Sort first then Two Pointer

Question involves all elements in range [1..n]?
├── Find missing          → Expected sum − actual sum, OR frequency array
├── Find duplicate        → Frequency array, OR in-place sign marking
└── Both missing & dup    → In-place sign marking

Question needs partition?
├── 2 groups (even/odd)   → Two Pointer (same direction)
└── 3 groups (0,1,2)      → Dutch National Flag
```
