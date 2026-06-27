# Sorting - Expected Questions (TCS NQT)

This file contains topic-specific TCS NQT coding questions on Sorting Algorithms.

---

## 1. SORT-01: Bubble Sort and Selection Sort Comparisons

*   **Problem Statement**: Implement Bubble Sort and Selection Sort, and compare their swap mechanics and algorithm stability.
*   **Constraints**:
    *   $1 \le N \le 10^3$
    *   $-10^4 \le \text{arr}[i] \le 10^4$
    *   *Sample Input*: `[64, 25, 12, 22]` $\implies$ *Sample Output (Sorted)*: `12 22 25 64`

### Approach Comparison
| Algorithm | Swaps | Best Time | Worst Time | Space | Stability |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **Bubble Sort** | Adjacent Swaps (Many) | $O(N)$ (optimized) | $O(N^2)$ | $O(1)$ | **Stable** (preserves equal keys order) |
| **Selection Sort** | One Swap per Pass (Few) | $O(N^2)$ | $O(N^2)$ | $O(1)$ | **Unstable** (can swap elements out of order) |

### Optimal C++14 Solution
```cpp
#include <iostream>
#include <vector>
#include <utility>

void bubbleSort(std::vector<int>& arr) {
    int n = arr.size();
    bool swapped;
    for (int i = 0; i < n - 1; i++) {
        swapped = false;
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                std::swap(arr[j], arr[j + 1]);
                swapped = true;
            }
        }
        if (!swapped) break; // Optimized: stop if pass had no swaps
    }
}

void selectionSort(std::vector<int>& arr) {
    int n = arr.size();
    for (int i = 0; i < n - 1; i++) {
        int min_idx = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
            }
        }
        if (min_idx != i) {
            std::swap(arr[i], arr[min_idx]);
        }
    }
}
```

### Dry Run Table (Selection Sort)
Input: `[64, 25, 12, 22]`

| Pass $i$ | Search Range | Min found (Value, Index) | Swap Action | Array State |
| :---: | :---: | :---: | :---: | :--- |
| 0 | `[64, 25, 12, 22]` | `12` (idx 2) | Swap `arr[0]` & `arr[2]` | `[12, 25, 64, 22]` |
| 1 | `[25, 64, 22]` | `22` (idx 3) | Swap `arr[1]` & `arr[3]` | `[12, 22, 64, 25]` |
| 2 | `[64, 25]` | `25` (idx 3) | Swap `arr[2]` & `arr[3]` | `[12, 22, 25, 64]` |

### Complexity Analysis
*   **Time Complexity**: 
    *   Bubble Sort: $O(N)$ best case (sorted input), $O(N^2)$ worst case.
    *   Selection Sort: Always $O(N^2)$ comparisons.
*   **Space Complexity**: $O(1)$ for both as they are in-place sorting algorithms.

### Shortcut & Math Derivation
*   **Derivation**: In Bubble Sort, the maximum number of comparisons is:
    $$\sum_{i=1}^{N-1} i = \frac{N(N-1)}{2} \approx O(N^2)$$
*   **Real Number Demo (Stability)**: Consider sorting `[(2, 'A'), (2, 'B'), (1, 'C')]` by values.
    *   Bubble Sort moves `1` to front via adjacent swaps, preserving order: `[(1, 'C'), (2, 'A'), (2, 'B')]`. (Stable)
    *   Selection Sort swaps `(2, 'A')` directly with `(1, 'C')`: `[(1, 'C'), (2, 'B'), (2, 'A')]`. Order of equal keys is swapped. (Unstable)

### Variation & Trap
*   **Trap**: Implementing bubble sort without the `swapped` flag. This will run in $O(N^2)$ even on fully sorted arrays.
*   **Variation**: Bidirectional Bubble Sort (Cocktail shaker sort), which sweeps back and forth.

---

## 2. SORT-02: Insertion Sort

*   **Problem Statement**: Implement Insertion Sort and trace the insertions on an unsorted list.
*   **Constraints**:
    *   $1 \le N \le 10^4$
    *   $-10^4 \le \text{arr}[i] \le 10^4$
    *   *Sample Input*: `[12, 11, 13, 5, 6]` $\implies$ *Sample Output*: `5 6 11 12 13`

### Approach Comparison
| Approach | Logic | Best Time | Worst Time | Space | Stability |
| :--- | :--- | :---: | :---: | :---: | :--- |
| **Insertion Sort** | Shift elements of sorted sub-array to insert current element into its correct slot. | $O(N)$ | $O(N^2)$ | $O(1)$ | **Stable** |

### Optimal C++14 Solution
```cpp
#include <vector>

void insertionSort(std::vector<int>& arr) {
    int n = arr.size();
    for (int i = 1; i < n; i++) {
        int key = arr[i];
        int j = i - 1;
        
        // Shift elements of arr[0..i-1] that are greater than key
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}
```

### Dry Run Table
Input: `[12, 11, 13, 5]`

| Step $i$ | Key | Index $j$ | Comparisons & Shifts | Insertion Result | Array State |
| :---: | :---: | :---: | :--- | :--- | :--- |
| 1 | 11 | 0 | $12 > 11 \implies$ shift 12 | Insert 11 at index 0 | `[11, 12, 13, 5]` |
| 2 | 13 | 1 | $12 \le 13 \implies$ no shift | Insert 13 at index 2 | `[11, 12, 13, 5]` |
| 3 | 5 | 2 | $13 > 5, 12 > 5, 11 > 5 \implies$ shift all | Insert 5 at index 0 | `[5, 11, 12, 13]` |

### Complexity Analysis
*   **Time Complexity**: $O(N^2)$ worst case (reversed sorted input), $O(N)$ best case (already sorted input).
*   **Space Complexity**: $O(1)$ — Auxiliary variables only.

### Shortcut & Math Derivation
*   **Derivation**: Best case occurs when array is already sorted. The inner `while` condition `arr[j] > key` fails immediately on the first comparison for every element. Thus, total comparisons are $N-1$, yielding $O(N)$ time.
*   **Real Number Demo**: With `[2, 3, 4, 1]`, only when `1` is processed do we perform shifts. The previous elements `2, 3, 4` each required only 1 check, proving fast execution for partially sorted lists.

### Variation & Trap
*   **Trap**: Off-by-one errors in `while (j >= 0)` condition. Neglecting index 0 will leave the smallest element out of its correct final position.
*   **Variation**: Binary Insertion Sort. Uses binary search to find the correct slot for insertion, reducing comparisons to $O(N \log N)$ (though shifts remain $O(N^2)$).

---

## 3. SORT-03: Merge Sort

*   **Problem Statement**: Implement Merge Sort and trace the split and merge operations.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^9 \le \text{arr}[i] \le 10^9$
    *   *Sample Input*: `[38, 27, 43, 3]` $\implies$ *Sample Output*: `3 27 38 43`

### Approach Comparison
| Approach | Logic | Time | Space | Pros/Cons |
| :--- | :--- | :---: | :---: | :--- |
| **Quick Sort** | Partition around pivot. | $O(N \log N)$ avg | $O(\log N)$ | Unstable; $O(N^2)$ worst case. |
| **Merge Sort** | Recursively split in halves, sort, and merge. | $O(N \log N)$ | $O(N)$ | Guaranteed $O(N \log N)$, stable, but uses extra memory. |

### Optimal C++14 Solution
```cpp
#include <vector>

void merge(std::vector<int>& arr, int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;
    std::vector<int> L(n1), R(n2);
    
    for (int i = 0; i < n1; i++) L[i] = arr[left + i];
    for (int j = 0; j < n2; j++) R[j] = arr[mid + 1 + j];
    
    int i = 0, j = 0, k = left;
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) {
            arr[k++] = L[i++];
        } else {
            arr[k++] = R[j++];
        }
    }
    while (i < n1) arr[k++] = L[i++];
    while (j < n2) arr[k++] = R[j++];
}

void mergeSort(std::vector<int>& arr, int left, int right) {
    if (left >= right) return;
    int mid = left + (right - left) / 2;
    mergeSort(arr, left, mid);
    mergeSort(arr, mid + 1, right);
    merge(arr, left, mid, right);
}
```

### Dry Run Table
Input segment: Merging `L = [27, 38]` and `R = [3, 43]`. `arr` starting at `k = 0`.

| Step | `i` | `j` | Comparison | Winner | `arr` state | `k` |
| :---: | :---: | :---: | :---: | :---: | :--- | :---: |
| 1 | 0 | 0 | $27 > 3$ | `R[0]` (3) | `[3, ...]` | 1 |
| 2 | 0 | 1 | $27 < 43$ | `L[0]` (27) | `[3, 27, ...]` | 2 |
| 3 | 1 | 1 | $38 < 43$ | `L[1]` (38) | `[3, 27, 38, ...]` | 3 |
| 4 | 2 | 1 | `L` exhausted | `R[1]` (43) | `[3, 27, 38, 43]` | 4 |

### Complexity Analysis
*   **Time Complexity**: $O(N \log N)$ in all cases (best, average, worst) because the recurrence relation is always $T(N) = 2T(N/2) + \theta(N)$.
*   **Space Complexity**: $O(N)$ — Temporary subarrays are allocated during the merge step.

### Shortcut & Math Derivation
*   **Derivation**: By Master Theorem:
    $$T(N) = 2T\left(\frac{N}{2}\right) + O(N)$$
    Comparing with $T(N) = aT(N/b) + f(N)$, we have $a=2, b=2, c=1$. Since $a = b^c$ ($2 = 2^1$), we fall into Case 2:
    $$T(N) = \Theta(N^c \log N) = \Theta(N \log N)$$
*   **Real Number Demo**: An array of size 8 will split down 3 levels ($\log_2 8 = 3$), doing linear work at each level to merge. Total work $= 8 \times 3 = 24$ operations.

### Variation & Trap
*   **Trap**: Defining `mid = (left + right) / 2` which can cause integer overflow if indices are huge. Use `mid = left + (right - left) / 2`.
*   **Variation**: In-place Merge Sort (block sort) which eliminates the $O(N)$ space overhead at the expense of higher time complexity constants.

---

## 4. SORT-04: Quick Sort

*   **Problem Statement**: Implement Quick Sort using Lomuto or Hoare partition and discuss pivot choice strategies.
*   **Constraints**:
    *   $1 \le N \le 10^5$
    *   $-10^9 \le \text{arr}[i] \le 10^9$
    *   *Sample Input*: `[10, 80, 30, 90, 40]` $\implies$ *Sample Output*: `10 30 40 80 90`

### Approach Comparison
| Partition Scheme | Mechanics | Swaps | Pros/Cons |
| :--- | :--- | :---: | :--- |
| **Lomuto Partition** | Pivot is last element. Scan left-to-right using single pointer. | More | Simple, but slow on equal elements. |
| **Hoare Partition** | Two pointers from both ends, swap out-of-order items. | Fewer | Fast in practice; yields better average execution. |

### Optimal C++14 Solution
```cpp
#include <vector>
#include <utility>

int partition(std::vector<int>& arr, int low, int high) {
    int pivot = arr[high]; // Lomuto pivot
    int i = low - 1;
    
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            std::swap(arr[i], arr[j]);
        }
    }
    std::swap(arr[i + 1], arr[high]);
    return i + 1;
}

void quickSort(std::vector<int>& arr, int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}
```

### Dry Run Table (Partition Step)
Segment: `[10, 80, 30, 90, 40]`. `low = 0, high = 4`. Pivot $= 40$. `i = -1`.

| `j` | `arr[j]` | `arr[j] < 40` | Action | `i` value | Array State |
| :---: | :---: | :---: | :--- | :---: | :--- |
| 0 | 10 | True | Swap `arr[0]` & `arr[0]` | 0 | `[10, 80, 30, 90, 40]` |
| 1 | 80 | False | Skip | 0 | `[10, 80, 30, 90, 40]` |
| 2 | 30 | True | Swap `arr[1]` & `arr[2]` | 1 | `[10, 30, 80, 90, 40]` |
| 3 | 90 | False | Skip | 1 | `[10, 30, 80, 90, 40]` |
| — | swap pivot | — | Swap `arr[2]` & `arr[4]` | 2 | `[10, 30, 40, 90, 80]` |

Pivot 40 is placed at index 2 (correct position).

### Complexity Analysis
*   **Time Complexity**: $O(N \log N)$ average case. $O(N^2)$ worst case (when pivot is consistently the smallest or largest element, e.g. sorted input).
*   **Space Complexity**: $O(\log N)$ average for stack space, $O(N)$ worst case.

### Shortcut & Math Derivation
*   **Derivation (Worst Case recurrence)**: If partition is highly skewed (0 and $N-1$ elements):
    $$T(N) = T(N-1) + \theta(N)$$
    By expansion:
    $$T(N) = T(N-2) + (N-1) + N = \sum_{i=1}^N i = \Theta(N^2)$$
*   **Real Number Demo (Randomized Pivot)**: Choosing a random element as pivot and swapping it with the last element before partitioning guarantees $O(N \log N)$ average time, preventing worst-case triggers on sorted lists.

### Variation & Trap
*   **Trap**: Choosing the last element as pivot on a pre-sorted array causes the worst-case stack overflow. Always use randomized pivot selection for production.
*   **Variation**: QuickSelect algorithm, which finds the K-th smallest element in $O(N)$ average time by only recursing into one partition.
