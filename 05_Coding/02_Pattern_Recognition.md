# Pattern Recognition

This is the most important skill for TCS NQT coding.

## 1. Frequency Pattern

Use when the problem says:

- Count occurrence
- Duplicate
- Unique
- Anagram
- First non-repeating
- Maximum frequency

Template:

```cpp
unordered_map<int, int> freq;
for (int x : a) freq[x]++;
```

String frequency:

```cpp
vector<int> freq(26, 0);
for (char ch : s) freq[ch - 'a']++;
```

## 2. Sorting Pattern

Use when:

- Need kth smallest/largest
- Need pair/group after arranging
- Need minimum difference
- Need intervals/meetings/platforms

Template:

```cpp
sort(a.begin(), a.end());
```

Trick: After sorting, many O(N^2) pair problems become O(N).

## 3. Two Pointers

Use when:

- Array is sorted
- Need pair sum
- Need remove duplicates
- Need reverse-like movement

Template:

```cpp
int l = 0, r = n - 1;
while (l < r) {
    int sum = a[l] + a[r];
    if (sum == target) {
        // found
        break;
    } else if (sum < target) {
        l++;
    } else {
        r--;
    }
}
```

## 4. Sliding Window

Use when:

- Problem asks for subarray or substring
- Window size is fixed
- Need longest/shortest continuous segment

Fixed window:

```cpp
long long window = 0;
for (int i = 0; i < k; i++) window += a[i];
long long ans = window;

for (int i = k; i < n; i++) {
    window += a[i] - a[i - k];
    ans = max(ans, window);
}
```

Variable window:

```cpp
int l = 0;
for (int r = 0; r < n; r++) {
    // add a[r]
    while (/* invalid */) {
        // remove a[l]
        l++;
    }
    // update answer
}
```

## 5. Prefix Sum

Use when:

- Need repeated range sum
- Need equilibrium index
- Need subarray sum
- Need left sum/right sum

Template:

```cpp
vector<long long> pref(n + 1, 0);
for (int i = 0; i < n; i++) {
    pref[i + 1] = pref[i] + a[i];
}

// sum from l to r, 0-indexed
long long rangeSum = pref[r + 1] - pref[l];
```

## 6. Math Pattern

Use when:

- Prime
- GCD/LCM
- Factorial
- Digits
- Palindrome number
- Armstrong number

Important formulas:

```cpp
gcd(a, b)
lcm(a, b) = a / gcd(a, b) * b
```

Prime check:

```cpp
bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}
```

## 7. Matrix Pattern

Use when:

- Rotate matrix
- Spiral order
- Diagonal sum
- Transpose
- Boundary traversal

Remember:

- Rows: `0` to `r - 1`
- Columns: `0` to `c - 1`
- Primary diagonal: `i == j`
- Secondary diagonal: `i + j == n - 1`

## Quick Decision Table

| Problem Clue | Pattern |
|---|---|
| "frequency", "occurs", "duplicate" | Hashing |
| "sorted array", "pair sum" | Two pointers |
| "continuous subarray", "substring" | Sliding window |
| "range sum", "left equals right" | Prefix sum |
| "kth largest", "minimum difference" | Sorting |
| "digits", "prime", "gcd" | Math |
| "grid", "diagonal", "spiral" | Matrix |
