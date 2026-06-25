# TCS NQT 2026 — Easy Coding Guide (C++)
### Compile-Ready C++11 Solutions · Exam: June 28, 2026

> **Section Stats:** 1 Question · 35 Minutes · No Negative Marking
> 
> **TCS Compiler Rule:** Compile and Save before submitting. Use `long long` for large inputs.

---

## 🗺️ Array Rotation ASCII Visualization

```
    Original Array indices: [0] [1] [2] [3]
    Rotate Right by 1:     [3] [0] [1] [2]
    Lookup Formula:        OriginalIndex = (TargetIndex - K + N) % N
```

---

# PART A: Core Templates

---

## 1. Prime Number Checking

* **What is this?** Verifying whether an integer $N > 1$ has no positive divisors other than $1$ and itself.
* **Why does TCS ask this?** Tests basic modulo arithmetic and loop boundary conditions.
* **Complexity**: Time Complexity: $O(\sqrt{N})$, Space Complexity: $O(1)$.
* **Edge Cases**: $N \le 1$ (return `false`), $N = 2, 3$ (return `true`), large inputs.
* **C++ Solution Template**:
```cpp
#include <iostream>

using namespace std;

bool isPrime(long long n) {
    if (n <= 1) return false;
    if (n <= 3) return true;
    if (n % 2 == 0 || n % 3 == 0) return false;
    for (long long i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) return false;
    }
    return true;
}

int main() {
    long long val = 17;
    cout << (isPrime(val) ? "Prime" : "Not Prime") << endl; // Output: Prime
    return 0;
}
```

* **Dry Run Trace Table**: For input $N = 25$.
  * $N \le 1 \to$ False.
  * $N \le 3 \to$ False.
  * $N \% 2 == 0 \to 25 \% 2 \neq 0$ (Pass).
  * $N \% 3 == 0 \to 25 \% 3 \neq 0$ (Pass).
  * Loop: $i = 5$, condition $i \times i \le 25 \implies 25 \le 25$ (True).
    * Check $N \% i \implies 25 \% 5 == 0 \implies$ return `false`. (Correct!).

---

## 2. String Anagram Check

* **What is this?** Determining if two strings are rearrangements of each other.
* **Why does TCS ask this?** Tests string traversal and frequency counting.
* **Complexity**: Time Complexity: $O(N)$, Space Complexity: $O(1)$ (using size-26 vector).
* **Edge Cases**: Empty strings, mixed cases, special symbols.
* **C++ Solution Template**:
```cpp
#include <iostream>
#include <string>
#include <vector>

using namespace std;

bool isAnagram(string s1, string s2) {
    vector<int> freq(26, 0);
    for (char c : s1) freq[c - 'a']++;
    for (char c : s2) freq[c - 'a']--;
    for (int count : freq) {
        if (count != 0) return false;
    }
    return true;
}

int main() {
    string a = "listen", b = "silent";
    cout << (isAnagram(a, b) ? "Anagram" : "Not Anagram") << endl; // Output: Anagram
    return 0;
}
```

---

# PART B: Practice Questions

---

## 3. Guided Practice Questions

**Q1.** Given an array, rotate it right by $K$ positions and return the element at index $I$.
* **Hint**: Instead of shifting the entire array, calculate the original index: `(I - K % N + N) % N`.
* **C++ Code**:
```cpp
#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n = 5, k = 2, target_idx = 1;
    vector<int> arr = {10, 20, 30, 40, 50}; // Rotated array: {40, 50, 10, 20, 30}
    int orig_idx = (target_idx - k % n + n) % n; // (1 - 2 + 5) % 5 = 4
    cout << arr[orig_idx] << endl; // Output: 50
    return 0;
}
```
* **Complexity**: Time Complexity: $O(1)$, Space Complexity: $O(1)$.
