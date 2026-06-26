---
title: "Arrays - PYQs"
section: "Coding"
---

# Array Previous Year Questions (PYQs)

> [!NOTE]
> These are **high-probability practice patterns** based on observed TCS NQT exam coding questions. They are fully self-contained and compile-ready.

---

## 📊 Pattern Recognition Chart
Use this table to map typical NQT question keywords to the correct array technique:

| If question says... | ...then immediately use | Pattern ID | Time Complexity |
| :--- | :--- | :--- | :---: |
| "elements greater than all on the right" | Scan from right (Suffix tracking) | `PYQ-ARR-01` | $O(N)$ |
| "missing number in consecutive range [1, N]" | Arithmetic Sum / XOR | `PYQ-ARR-02` | $O(N)$ |
| "rotate elements to left or right by K" | Triple Reversal technique | `PYQ-ARR-03` | $O(N)$ |
| "partition even first, then odd" | Two Pointers partitioning | `PYQ-ARR-04` | $O(N)$ |
| "count occurrences of each element" | Hashing / Frequency Map | `PYQ-ARR-05` | $O(N)$ |
| "first element that does not repeat" | Two-pass Frequency Hashing | `PYQ-ARR-06` | $O(N)$ |
| "common unique elements in two lists" | Hash Set Intersection | `PYQ-ARR-07` | $O(N+M)$ |
| "max profit with single buy and sell" | Greedy running minimum | `PYQ-ARR-08` | $O(N)$ |
| "move all negative elements to left" | Two Pointers partitioning | `PYQ-ARR-09` | $O(N)$ |
| "second smallest and largest in single pass" | Dual variable tracking | `PYQ-ARR-10` | $O(N)$ |

---

## 1. PYQ-ARR-01: Leaders in an Array

*   **Problem Statement**: Write a program to print all the "Leaders" in an array. An element is a leader if it is strictly greater than all elements to its right. The rightmost element is always a leader.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^9 \le arr[i] \le 10^9$
    *   *Sample Input*: `[16, 17, 4, 3, 5, 2]` $\implies$ *Sample Output*: `17 5 2`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Brute Force** | For each element, scan all elements to its right. | $O(N^2)$ | $O(1)$ | Easy to write but triggers TLE. |
| **Optimal** | Scan from right to left, keeping track of the maximum element seen so far. | $O(N)$ | $O(1)$ | Passes all constraints. |

### C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

std::vector<int> findLeaders(const std::vector<int>& arr) {
    int n = arr.size();
    std::vector<int> leaders;
    if (n == 0) return leaders;
    
    int max_from_right = arr[n - 1];
    leaders.push_back(max_from_right);
    
    for (int i = n - 2; i >= 0; i--) {
        if (arr[i] > max_from_right) {
            max_from_right = arr[i];
            leaders.push_back(max_from_right);
        }
    }
    std::reverse(leaders.begin(), leaders.end());
    return leaders;
}
```

### Java Solution
```java
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Solution {
    public static List<Integer> findLeaders(int[] arr) {
        List<Integer> leaders = new ArrayList<>();
        if (arr == null || arr.length == 0) return leaders;
        
        int n = arr.length;
        int maxFromRight = arr[n - 1];
        leaders.add(maxFromRight);
        
        for (int i = n - 2; i >= 0; i--) {
            if (arr[i] > maxFromRight) {
                maxFromRight = arr[i];
                leaders.add(maxFromRight);
            }
        }
        Collections.reverse(leaders);
        return leaders;
    }
}
```

### Python 3 Solution
```python
def find_leaders(arr):
    if not arr:
        return []
    n = len(arr)
    leaders = []
    max_from_right = arr[-1]
    leaders.append(max_from_right)
    
    for i in range(n - 2, -1, -1):
        if arr[i] > max_from_right:
            max_from_right = arr[i]
            leaders.append(max_from_right)
            
    return leaders[::-1]
```

### Dry Run
Input: `[16, 17, 4, 3, 5, 2]`. $N = 6$.

| Step | Index $i$ | Element `arr[i]` | `max_from_right` | Condition: `arr[i] > max_from_right` | Action | Leaders List (reversed order) |
| :---: | :---: | :---: | :---: | :---: | :--- | :--- |
| Init | 5 | 2 | 2 | — | Add `2` to list | `[2]` |
| 1 | 4 | 5 | 2 | $5 > 2$ (True) | Update max = 5, Add `5` | `[2, 5]` |
| 2 | 3 | 3 | 5 | $3 > 5$ (False) | Skip | `[2, 5]` |
| 3 | 2 | 4 | 5 | $4 > 5$ (False) | Skip | `[2, 5]` |
| 4 | 1 | 17 | 5 | $17 > 5$ (True) | Update max = 17, Add `17` | `[2, 5, 17]` |
| 5 | 0 | 16 | 17 | $16 > 17$ (False) | Skip | `[2, 5, 17]` |

Reversing the final list gives `[17, 5, 2]`.

### Shortcut & Math Derivation
*   **Derivation**: By scanning from right to left, we build a suffix maximum on the fly. Let $S[i] = \max(arr[i \dots n-1])$. An element $arr[i]$ is a leader if and only if $arr[i] > S[i+1]$. We compute $S[i+1]$ in $O(1)$ space using a running integer `max_from_right`.
*   **Demonstration**: For array `[10, 3, 2, 5, 1]`, rightmost suffix maximums starting from the right are `[5, 5, 5, 5, 1]`. Only elements greater than their right suffix max qualify: `1` (rightmost), `5` ($5 > 1$), and `10` ($10 > 5$). Output is `[10, 5, 1]`.

### Variation & Trap
*   **Trap**: Elements can be equal. If the problem states "greater than or equal to", change `arr[i] > max_from_right` to `arr[i] >= max_from_right`.
*   **Variation**: Find the count of leaders. Instead of saving elements, keep a count variable.

---

## 2. PYQ-ARR-02: Find the Missing Number

*   **Problem Statement**: Given an array containing $N-1$ unique numbers in the range $[1, N]$, find the missing number.
*   **Constraints**:
    *   $2 \le N \le 10^6$
    *   *Sample Input*: `[3, 1, 4, 5]`, $N = 5$ $\implies$ *Sample Output*: `2`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sum Formula** | Calculate sum of first $N$ numbers and subtract array elements. | $O(N)$ | $O(1)$ | Fast, but watch for integer overflow. |
| **XOR Method** | XOR all indices from $1$ to $N$ and all array values. | $O(N)$ | $O(1)$ | Prevents overflow completely. |

### C++14 Solution
```cpp
#include <vector>

int findMissing(const std::vector<int>& arr, int n) {
    int x1 = 0;
    int x2 = 0;
    
    // XOR all elements in the array
    for (int num : arr) {
        x1 ^= num;
    }
    // XOR all elements from 1 to N
    for (int i = 1; i <= n; i++) {
        x2 ^= i;
    }
    return x1 ^ x2;
}
```

### Java Solution
```java
public class Solution {
    public static int findMissing(int[] arr, int n) {
        int x1 = 0;
        int x2 = 0;
        
        for (int num : arr) {
            x1 ^= num;
        }
        for (int i = 1; i <= n; i++) {
            x2 ^= i;
        }
        return x1 ^ x2;
    }
}
```

### Python 3 Solution
```python
def find_missing(arr, n):
    x1 = 0
    x2 = 0
    for num in arr:
        x1 ^= num
    for i in range(1, n + 1):
        x2 ^= i
    return x1 ^ x2
```

### Dry Run
Input: `[3, 1, 4, 5]`, $N = 5$.
*   `x1 = 3 ^ 1 ^ 4 ^ 5`
*   `x2 = 1 ^ 2 ^ 3 ^ 4 ^ 5`
*   `x1 ^ x2 = (3 ^ 1 ^ 4 ^ 5) ^ (1 ^ 2 ^ 3 ^ 4 ^ 5) = 2` (since duplicate XOR pairs cancel to 0).

### Shortcut & Math Derivation
*   **Formula Derivation**: The sum of first $N$ natural numbers is given by:
    $$S_N = \sum_{i=1}^N i = \frac{N(N+1)}{2}$$
    *Derivation*: Let $S_N = 1 + 2 + \dots + N$. Reversing gives $S_N = N + (N-1) + \dots + 1$. Adding both equations: $2S_N = (N+1) + (N+1) + \dots + (N+1)$ ($N$ times) $\implies 2S_N = N(N+1) \implies S_N = \frac{N(N+1)}{2}$.
*   **Worked Example**: For $N=5$, $S_5 = \frac{5 \times 6}{2} = 15$. If array is `[3, 1, 4, 5]`, sum is $3+1+4+5=13$. Missing $= 15 - 13 = 2$.
*   **XOR Property**: $A \oplus A = 0$ and $A \oplus 0 = A$. Therefore, $(1 \oplus 2 \oplus \dots \oplus N) \oplus (\text{array elements}) = \text{missing number}$.

### Variation & Trap
*   **Trap**: Sum method can overflow a 32-bit integer for $N > 65535$. Always use `long long` in C++ / `long` in Java or use the XOR method.

---

## 3. PYQ-ARR-03: Rotate Array Left by K Steps

*   **Problem Statement**: Rotate an array of size $N$ to the left by $K$ positions.
*   **Constraints**:
    *   $1 \le N \le 10^5$, $0 \le K \le 10^6$
    *   *Sample Input*: `[1, 2, 3, 4, 5]`, $K = 2$ $\implies$ *Sample Output*: `[3, 4, 5, 1, 2]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Temp Array** | Copy first $K$ elements to temp, shift rest, and copy back. | $O(N)$ | $O(K)$ | Requires extra memory. |
| **Triple Reversal**| Reverse prefix of size $K$, reverse suffix of size $N-K$, then reverse entire array. | $O(N)$ | $O(1)$ | Optimal, updates in-place. |

### C++14 Solution
```cpp
#include <vector>
#include <algorithm>

void rotateLeft(std::vector<int>& arr, int k) {
    int n = arr.size();
    if (n == 0) return;
    k = k % n; // Handle k >= n
    
    std::reverse(arr.begin(), arr.begin() + k);
    std::reverse(arr.begin() + k, arr.end());
    std::reverse(arr.begin(), arr.end());
}
```

### Java Solution
```java
public class Solution {
    private static void reverse(int[] arr, int start, int end) {
        while (start < end) {
            int temp = arr[start];
            arr[start] = arr[end];
            arr[end] = temp;
            start++;
            end--;
        }
    }
    
    public static void rotateLeft(int[] arr, int k) {
        if (arr == null || arr.length == 0) return;
        int n = arr.length;
        k = k % n;
        
        reverse(arr, 0, k - 1);
        reverse(arr, k, n - 1);
        reverse(arr, 0, n - 1);
    }
}
```

### Python 3 Solution
```python
def rotate_left(arr, k):
    n = len(arr)
    if n == 0:
        return
    k = k % n
    
    def reverse(l, r):
        while l < r:
            arr[l], arr[r] = arr[r], arr[l]
            l += 1
            r -= 1
            
    reverse(0, k - 1)
    reverse(k, n - 1)
    reverse(0, n - 1)
```

### Dry Run
Input: `[1, 2, 3, 4, 5]`, $K = 2$.
1.  Reverse first $K=2$ elements: `[1, 2]` $\implies$ `[2, 1, 3, 4, 5]`
2.  Reverse remaining $N-K=3$ elements: `[3, 4, 5]` $\implies$ `[2, 1, 5, 4, 3]`
3.  Reverse the whole array: `[2, 1, 5, 4, 3]` $\implies$ `[3, 4, 5, 1, 2]`

### Shortcut & Math Derivation
*   **Derivation**: By reversing parts of the array, we change the relative blocks. Let array be split into two blocks $A$ (size $K$) and $B$ (size $N-K$). Original = $AB$. Left rotation by $K$ should result in $BA$.
    1.  Reverse $A$: $A^R B$
    2.  Reverse $B$: $A^R B^R$
    3.  Reverse entire: $(A^R B^R)^R = (B^R)^R (A^R)^R = BA$.
*   **Demonstration**: For $K=2$, $A=[1, 2] \implies A^R=[2, 1]$ and $B=[3, 4, 5] \implies B^R=[5, 4, 3]$. Combining gives `[2, 1, 5, 4, 3]`. Reversing this whole array results in `[3, 4, 5, 1, 2]`.

### Variation & Trap
*   **Trap**: Rotation factor $K$ can be larger than $N$. Always normalize with $K = K \pmod N$.
*   **Variation**: Right rotation by $K$ is equivalent to left rotation by $N - K$.

---

## 4. PYQ-ARR-04: Segregate Even and Odd Numbers

*   **Problem Statement**: Rearrange an array such that all even numbers appear first, followed by odd numbers. Original relative order must be maintained (stable segregation).
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   *Sample Input*: `[1, 2, 4, 3, 5, 6]` $\implies$ *Sample Output*: `[2, 4, 6, 1, 3, 5]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Two Pointers** | Swap odd and evens in-place. | $O(N)$ | $O(1)$ | Simple but does **not** maintain stable order. |
| **Auxiliary Lists**| Copy evens first, then odds to a new list. | $O(N)$ | $O(N)$ | Maintains stability. Optimal for NQT stability constraints. |

### C++14 Solution
```cpp
#include <vector>

std::vector<int> segregateEvenOdd(const std::vector<int>& arr) {
    std::vector<int> result;
    result.reserve(arr.size());
    
    // First pass for even numbers
    for (int x : arr) {
        if (x % 2 == 0) result.push_back(x);
    }
    // Second pass for odd numbers
    for (int x : arr) {
        if (x % 2 != 0) result.push_back(x);
    }
    return result;
}
```

### Java Solution
```java
import java.util.ArrayList;

public class Solution {
    public static int[] segregateEvenOdd(int[] arr) {
        int[] result = new int[arr.length];
        int index = 0;
        
        for (int x : arr) {
            if (x % 2 == 0) {
                result[index++] = x;
            }
        }
        for (int x : arr) {
            if (x % 2 != 0) {
                result[index++] = x;
            }
        }
        return result;
    }
}
```

### Python 3 Solution
```python
def segregate_even_odd(arr):
    evens = [x for x in arr if x % 2 == 0]
    odds = [x for x in arr if x % 2 != 0]
    return evens + odds
```

### Dry Run
Input: `[1, 2, 4, 3, 5, 6]`.
*   Even pass finds: `2, 4, 6`. List is `[2, 4, 6]`.
*   Odd pass finds: `1, 3, 5`. List is updated to `[2, 4, 6, 1, 3, 5]`.

### Shortcut & Math Derivation
*   **Concept**: Parity check is done using modulo operator `x % 2`. Since this is a stable sorting variation (elements sorted by parity keys), a two-pass linear scan is mathematically minimal in complexity ($2N$ operations) to guarantee stability.

### Variation & Trap
*   **Trap**: Using dynamic insertions like `std::vector::insert` or array copying inside loops can degrade time complexity to $O(N^2)$. Always pre-allocate or push back linearly.

---

## 5. PYQ-ARR-05: Frequency of Each Element

*   **Problem Statement**: Count the occurrences of each element in an array and print them in sorted order of elements.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   *Sample Input*: `[4, 2, 2, 8]` $\implies$ *Sample Output*: `2: 2, 4: 1, 8: 1`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sorting** | Sort the array first, then count adjacent duplicates. | $O(N \log N)$ | $O(1)$ | Minimal auxiliary space. |
| **Map/Hashing** | Insert into standard sorted map `std::map`. | $O(N \log N)$ | $O(N)$ | Simplifies sorting requirements. |

### C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <map>

void printFrequency(const std::vector<int>& arr) {
    std::map<int, int> freq;
    for (int x : arr) {
        freq[x]++;
    }
    for (const auto& pair : freq) {
        std::cout << pair.first << ": " << pair.second << std::endl;
    }
}
```

### Java Solution
```java
import java.util.TreeMap;
import java.util.Map;

public class Solution {
    public static void printFrequency(int[] arr) {
        Map<Integer, Integer> freq = new TreeMap<>(); // Sorted map
        for (int x : arr) {
            freq.put(x, freq.getOrDefault(x, 0) + 1);
        }
        for (Map.Entry<Integer, Integer> entry : freq.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }
}
```

### Python 3 Solution
```python
def print_frequency(arr):
    freq = {}
    for x in arr:
        freq[x] = freq.get(x, 0) + 1
    # Sorted by keys
    for key in sorted(freq.keys()):
        print(f"{key}: {freq[key]}")
```

### Dry Run
Input: `[4, 2, 2, 8]`.
*   Iterate `4`: Map $= \{4: 1\}$
*   Iterate `2`: Map $= \{4: 1, 2: 1\}$
*   Iterate `2`: Map $= \{4: 1, 2: 2\}$
*   Iterate `8`: Map $= \{4: 1, 2: 2, 8: 1\}$
*   Sorted printing output: `2: 2`, `4: 1`, `8: 1`.

### Shortcut & Math Derivation
*   **Complexity Tradeoff**:
    *   Inserting $N$ elements into a self-balancing BST (like C++ `std::map` or Java `TreeMap`) takes $\sum_{i=1}^N \log i = \log(N!) \approx N \log N - N$ (by Stirling's Approximation).
    *   Unordered hash map takes $O(N)$ average but requires sorting keys later which takes $K \log K$ where $K$ is unique count.

### Variation & Trap
*   **Trap**: Using basic array hash indexes (like `freq[arr[i]]++` where value is index) fails if elements are negative or exceed $10^7$. Always use a standard Map object.

---

## 6. PYQ-ARR-06: First Non-Repeating Element

*   **Problem Statement**: Find the first element in an array that does not repeat. If all elements repeat, return -1.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   *Sample Input*: `[9, 4, 9, 6, 7, 4]` $\implies$ *Sample Output*: `6`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Nested Loops** | For each element, scan entire array to check for duplicate. | $O(N^2)$ | $O(1)$ | Extremely slow (TLE). |
| **Hash Frequency** | Build frequency map first, scan array again to find first count of 1. | $O(N)$ | $O(N)$ | Optimal, fast. |

### C++14 Solution
```cpp
#include <vector>
#include <unordered_map>

int firstNonRepeating(const std::vector<int>& arr) {
    std::unordered_map<int, int> freq;
    for (int x : arr) {
        freq[x]++;
    }
    // Second scan in original array order
    for (int x : arr) {
        if (freq[x] == 1) return x;
    }
    return -1;
}
```

### Java Solution
```java
import java.util.HashMap;
import java.util.Map;

public class Solution {
    public static int firstNonRepeating(int[] arr) {
        Map<Integer, Integer> freq = new HashMap<>();
        for (int x : arr) {
            freq.put(x, freq.getOrDefault(x, 0) + 1);
        }
        for (int x : arr) {
            if (freq.get(x) == 1) return x;
        }
        return -1;
    }
}
```

### Python 3 Solution
```python
def first_non_repeating(arr):
    freq = {}
    for x in arr:
        freq[x] = freq.get(x, 0) + 1
    for x in arr:
        if freq[x] == 1:
            return x
    return -1
```

### Dry Run
Input: `[9, 4, 9, 6, 7, 4]`.
*   Pass 1 Map result: $\{9:2, 4:2, 6:1, 7:1\}$
*   Pass 2 Scan:
    *   `arr[0] = 9` $\implies$ freq = 2 (Skip)
    *   `arr[1] = 4` $\implies$ freq = 2 (Skip)
    *   `arr[2] = 9` $\implies$ freq = 2 (Skip)
    *   `arr[3] = 6` $\implies$ freq = 1 $\implies$ Found! Return `6`.

### Shortcut & Math Derivation
*   **Derivation**: We need to preserve the temporal insertion order. A simple frequency hashing destroys order. Thus, we perform **two passes** (2N steps):
    $$\text{Pass 1}: \text{count}(x) \quad \forall x \in \text{arr}$$
    $$\text{Pass 2}: \text{Find first } x \text{ where } \text{count}(x) = 1$$
    This is mathematically the minimal traversal needed when elements are unsorted.

### Variation & Trap
*   **Trap**: Returning first non-repeating key directly from a standard hash map is wrong because hash maps do not maintain the original array index order. Always scan the original array in the second pass.

---

## 7. PYQ-ARR-07: Intersection of Two Arrays

*   **Problem Statement**: Find the intersection of two unsorted arrays. Return only unique common elements.
*   **Constraints**:
    *   $1 \le N, M \le 10^5$
    *   *Sample Input*: `[1, 2, 2, 1]`, `[2, 2]` $\implies$ *Sample Output*: `[2]`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Two Hash Sets** | Place both in sets, check common elements. | $O(N + M)$ | $O(N)$ | Optimal performance. |
| **Sorting** | Sort both, use Two Pointers to find matches. | $O(N \log N + M \log M)$ | $O(1)$ | Best if memory is strictly limited. |

### C++14 Solution
```cpp
#include <vector>
#include <unordered_set>

std::vector<int> intersection(const std::vector<int>& arr1, const std::vector<int>& arr2) {
    std::unordered_set<int> set1(arr1.begin(), arr1.end());
    std::vector<int> result;
    for (int x : arr2) {
        if (set1.erase(x)) { // erase returns 1 if element was deleted
            result.push_back(x);
        }
    }
    return result;
}
```

### Java Solution
```java
import java.util.HashSet;
import java.util.ArrayList;
import java.util.List;

public class Solution {
    public static int[] intersection(int[] arr1, int[] arr2) {
        HashSet<Integer> set1 = new HashSet<>();
        for (int x : arr1) set1.add(x);
        
        List<Integer> list = new ArrayList<>();
        for (int x : arr2) {
            if (set1.remove(x)) {
                list.add(x);
            }
        }
        
        int[] result = new int[list.size()];
        for (int i = 0; i < list.size(); i++) {
            result[i] = list.get(i);
        }
        return result;
    }
}
```

### Python 3 Solution
```python
def intersection(arr1, arr2):
    return list(set(arr1).intersection(set(arr2)))
```

### Dry Run
Input: `arr1 = [1, 2, 2, 1]`, `arr2 = [2, 2]`.
*   Set 1 initialized: `{1, 2}`
*   Scan `arr2[0] = 2`: Found in Set 1. Delete `2` from Set 1, add to result `[2]`.
*   Scan `arr2[1] = 2`: Not found in Set 1 (since it was deleted). Skip.
*   Final intersection: `[2]`.

### Shortcut & Math Derivation
*   **Set Theory**: By using a set lookup, matching checking is done in $O(1)$ amortized time. Erasure upon finding prevents duplicates in the output result, satisfying the uniqueness constraint.

### Variation & Trap
*   **Trap**: If duplicate intersection elements are needed (e.g. input `[1, 2, 2, 1]`, `[2, 2]` output `[2, 2]`), use a frequency hash map instead of a set, reducing counts as matches are found.

---

## 8. PYQ-ARR-08: Maximum Difference (Stock Buy-Sell 1)

*   **Problem Statement**: Given an array representing daily stock prices, find the maximum profit you can achieve by buying on one day and selling on a future day.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $0 \le arr[i] \le 10^6$
    *   *Sample Input*: `[7, 1, 5, 3, 6, 4]` $\implies$ *Sample Output*: `5` (Buy at 1, sell at 6)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Nested Loops** | Compare all price pairs $(i, j)$ with $j > i$. | $O(N^2)$ | $O(1)$ | Simple but causes TLE. |
| **Greedy Single Pass**| Track minimum price seen so far, check profit for current price. | $O(N)$ | $O(1)$ | Optimal, fast. |

### C++14 Solution
```cpp
#include <vector>
#include <algorithm>
#include <climits>

int maxProfit(const std::vector<int>& prices) {
    int min_price = INT_MAX;
    int max_profit = 0;
    for (int price : prices) {
        min_price = std::min(min_price, price);
        max_profit = std::max(max_profit, price - min_price);
    }
    return max_profit;
}
```

### Java Solution
```java
public class Solution {
    public static int maxProfit(int[] prices) {
        int minPrice = Integer.MAX_VALUE;
        int maxProfit = 0;
        for (int price : prices) {
            if (price < minPrice) {
                minPrice = price;
            } else if (price - minPrice > maxProfit) {
                maxProfit = price - minPrice;
            }
        }
        return maxProfit;
    }
}
```

### Python 3 Solution
```python
def max_profit(prices):
    min_price = float('inf')
    max_profit = 0
    for price in prices:
        min_price = min(min_price, price)
        max_profit = max(max_profit, price - min_price)
    return max_profit
```

### Dry Run
Input: `[7, 1, 5, 3, 6, 4]`.

| Iteration | Price | `min_price` | `price - min_price` | `max_profit` |
| :---: | :---: | :---: | :---: | :---: |
| 1 | 7 | 7 | 0 | 0 |
| 2 | 1 | 1 | 0 | 0 |
| 3 | 5 | 1 | 4 | 4 |
| 4 | 3 | 1 | 2 | 4 |
| 5 | 6 | 1 | 5 | 5 (Max) |
| 6 | 4 | 1 | 3 | 5 |

### Shortcut & Math Derivation
*   **Derivation**: Let $P[i]$ be the price on day $i$. We want to maximize $P[j] - P[i]$ where $j \ge i$.
    $$P[j] - P[i] \le P[j] - \min_{0 \le k \le j} P[k]$$
    By tracking $\min(P[0 \dots j])$ as a single running variable, we compute the maximum profit for every potential selling day $j$ in $O(1)$ operations per element.

### Variation & Trap
*   **Trap**: If prices are in descending order (e.g. `[7, 6, 4, 3, 1]`), max profit is `0` (no transaction should be made). Do not return negative values.

---

## 9. PYQ-ARR-09: Move Negatives to Left

*   **Problem Statement**: Rearrange an array such that all negative numbers appear on the left, and positive numbers (including zero) on the right, in-place. Order of elements does not need to be preserved.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   *Sample Input*: `[1, -1, 3, -2, 7]` $\implies$ *Sample Output*: `[-1, -2, 3, 1, 7]` (order of positives/negatives can vary)

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sorting** | Sort the entire array. Negatives naturally move left. | $O(N \log N)$ | $O(1)$ | Slow; unnecessary sorting overhead. |
| **Two Pointers** | Move `left` pointer until positive, `right` until negative; swap. | $O(N)$ | $O(1)$ | In-place, highly optimal. |

### C++14 Solution
```cpp
#include <vector>
#include <algorithm>

void moveNegatives(std::vector<int>& arr) {
    int left = 0, right = arr.size() - 1;
    while (left < right) {
        if (arr[left] < 0) {
            left++;
        } else if (arr[right] >= 0) {
            right--;
        } else {
            std::swap(arr[left], arr[right]);
            left++;
            right--;
        }
    }
}
```

### Java Solution
```java
public class Solution {
    public static void moveNegatives(int[] arr) {
        int left = 0, right = arr.length - 1;
        while (left < right) {
            if (arr[left] < 0) {
                left++;
            } else if (arr[right] >= 0) {
                right--;
            } else {
                int temp = arr[left];
                arr[left] = arr[right];
                arr[right] = temp;
                left++;
                right--;
            }
        }
    }
}
```

### Python 3 Solution
```python
def move_negatives(arr):
    left = 0
    right = len(arr) - 1
    while left < right:
        if arr[left] < 0:
            left += 1
        elif arr[right] >= 0:
            right -= 1
        else:
            arr[left], arr[right] = arr[right], arr[left]
            left += 1
            right -= 1
```

### Dry Run
Input: `[1, -1, 3, -2, 7]`.
*   Init: `left = 0 (1)`, `right = 4 (7)`.
    *   `arr[left] >= 0` and `arr[right] >= 0` $\implies$ decrement `right`. `right = 3 (-2)`.
*   Iteration 2: `left = 0 (1)`, `right = 3 (-2)`.
    *   `arr[left]` is positive, `arr[right]` is negative. Swap!
    *   Array becomes: `[-2, -1, 3, 1, 7]`.
    *   `left = 1 (-1)`, `right = 2 (3)`.
*   Iteration 3: `left = 1 (-1)`, `right = 2 (3)`.
    *   `arr[left] < 0` $\implies$ increment `left`. `left = 2 (3)`.
*   Loop ends because `left == right`. Final array: `[-2, -1, 3, 1, 7]`.

### Shortcut & Math Derivation
*   **Two-Pointer Convergence**:
    We divide the array into partition states:
    $$\text{arr}[0 \dots \text{left}-1] < 0 \quad \text{and} \quad \text{arr}[\text{right}+1 \dots N-1] \ge 0$$
    Pointers move closer to each other on each step, ensuring convergence in at most $N$ iterations.

### Variation & Trap
*   **Trap**: Swapping without incrementing pointers can cause an infinite loop if values are equal to boundary thresholds. Always increment/decrement pointers after swapping.

---

## 10. PYQ-ARR-10: Second Smallest and Second Largest

*   **Problem Statement**: Find both the second smallest and second largest elements in an array of $N$ integers. If either does not exist, return -1.
*   **Constraints**:
    *   $2 \le N \le 10^5$, $-10^9 \le arr[i] \le 10^9$
    *   *Sample Input*: `[1, 2, 4, 6, 7]` $\implies$ *Sample Output*: `Second Smallest: 2, Second Largest: 6`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Sorting** | Sort array, return elements at 1 and $N-2$ indexes. | $O(N \log N)$ | $O(1)$ | Fails if duplicates exist (e.g., `[1, 1, 2]`). |
| **Two Passes** | First pass finds min/max. Second pass finds second min/max. | $O(N)$ | $O(1)$ | Standard, but uses two full iterations. |
| **Optimal** | Track both sets in a single pass. | $O(N)$ | $O(1)$ | Most optimal; executes in a single pass. |

### C++14 Solution
```cpp
#include <vector>
#include <utility>
#include <climits>

std::pair<int, int> findSecondMinMax(const std::vector<int>& arr) {
    int smallest = INT_MAX, secondSmallest = INT_MAX;
    int largest = INT_MIN, secondLargest = INT_MIN;
    
    for (int num : arr) {
        // Track Smallest
        if (num < smallest) {
            secondSmallest = smallest;
            smallest = num;
        } else if (num < secondSmallest && num != smallest) {
            secondSmallest = num;
        }
        
        // Track Largest
        if (num > largest) {
            secondLargest = largest;
            largest = num;
        } else if (num > secondLargest && num != largest) {
            secondLargest = num;
        }
    }
    
    int finalSecSmallest = (secondSmallest == INT_MAX) ? -1 : secondSmallest;
    int finalSecLargest = (secondLargest == INT_MIN) ? -1 : secondLargest;
    return {finalSecSmallest, finalSecLargest};
}
```

### Java Solution
```java
public class Solution {
    public static class Result {
        public int secondSmallest;
        public int secondLargest;
        public Result(int ss, int sl) {
            this.secondSmallest = ss;
            this.secondLargest = sl;
        }
    }
    
    public static Result findSecondMinMax(int[] arr) {
        int smallest = Integer.MAX_VALUE;
        int secondSmallest = Integer.MAX_VALUE;
        int largest = Integer.MIN_VALUE;
        int secondLargest = Integer.MIN_VALUE;
        
        for (int num : arr) {
            if (num < smallest) {
                secondSmallest = smallest;
                smallest = num;
            } else if (num < secondSmallest && num != smallest) {
                secondSmallest = num;
            }
            
            if (num > largest) {
                secondLargest = largest;
                largest = num;
            } else if (num > secondLargest && num != largest) {
                secondLargest = num;
            }
        }
        
        int finalSS = (secondSmallest == Integer.MAX_VALUE) ? -1 : secondSmallest;
        int finalSL = (secondLargest == Integer.MIN_VALUE) ? -1 : secondLargest;
        return new Result(finalSS, finalSL);
    }
}
```

### Python 3 Solution
```python
def find_second_min_max(arr):
    smallest = float('inf')
    second_smallest = float('inf')
    largest = float('-inf')
    second_largest = float('-inf')
    
    for num in arr:
        if num < smallest:
            second_smallest = smallest
            smallest = num
        elif num < second_smallest and num != smallest:
            second_smallest = num
            
        if num > largest:
            second_largest = largest
            largest = num
        elif num > second_largest and num != largest:
            second_largest = num
            
    final_ss = -1 if second_smallest == float('inf') else second_smallest
    final_sl = -1 if second_largest == float('-inf') else second_largest
    return final_ss, final_sl
```

### Dry Run
Input: `[1, 2, 4, 6, 7]`.
*   Iterate `1`: `smallest = 1`, `largest = 1`.
*   Iterate `2`:
    *   `2 < smallest` (False). `2 < secondSmallest` $\implies$ `secondSmallest = 2`.
    *   `2 > largest` $\implies$ `secondLargest = largest = 1`, `largest = 2`.
*   Iterate `4`:
    *   `secondSmallest` remains `2` (since $4 \not< 2$).
    *   `4 > largest` $\implies$ `secondLargest = 2`, `largest = 4`.
*   Iterate `6`:
    *   `secondSmallest` remains `2`.
    *   `6 > largest` $\implies$ `secondLargest = 4`, `largest = 6`.
*   Iterate `7`:
    *   `secondSmallest` remains `2`.
    *   `7 > largest` $\implies$ `secondLargest = 6`, `largest = 7`.
*   Result: Second Smallest $= 2$, Second Largest $= 6$.

### Shortcut & Math Derivation
*   **Optimal Tracking Logic**:
    When a new minimum `num` is discovered, the previous minimum must logically shift to become the *second* minimum. If `num` is not smaller than `smallest` but is smaller than `secondSmallest`, it updates `secondSmallest` directly (excluding duplicates where `num == smallest`). This holds true for tracking the maximums as well.

### Variation & Trap
*   **Trap**: Elements can all be identical (e.g. `[5, 5, 5]`). Here, `smallest = 5` and `secondSmallest` remains `Integer.MAX_VALUE`, which maps to `-1` correctly. Ensure you handle this check.
