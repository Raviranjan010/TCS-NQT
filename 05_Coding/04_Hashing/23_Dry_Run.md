# Hashing Techniques - Dry Run Trace Guide

This guide demonstrates how to construct a dry run trace table for a complex hashing algorithm. Use this technique on paper during exams or whiteboards in interviews.

---

## 📋 Case Study: Subarray Sum Equals K

*   **Problem**: Count contiguous subarrays that sum to $K$.
*   **Input**: `arr = [3, 4, -2, 5, 3]`, $K = 5$.
*   **Algorithm**: Prefix Sum + Hashing.

### Initial Setup
1.  Initialize a variable `current_sum = 0` to track the running sum.
2.  Initialize a variable `count = 0` to track the number of matching subarrays.
3.  Initialize a hash map `prefix_counts` with the base case `{0: 1}` (meaning sum `0` occurred once before index 0).

---

## 📊 Dry Run Trace Table

| Index $i$ | Element `arr[i]` | `current_sum` | Complement `current_sum - K` | In Map? (Frequency) | Count Update | Map State (Sum $\to$ Count) |
| :---: | :---: | :---: | :---: | :---: | :--- | :--- |
| **Start** | — | 0 | — | — | 0 | `{0: 1}` |
| **0** | 3 | 3 | $3 - 5 = -2$ | No | 0 | `{0: 1, 3: 1}` |
| **1** | 4 | 7 | $7 - 5 = 2$ | No | 0 | `{0: 1, 3: 1, 7: 1}` |
| **2** | -2 | 5 | $5 - 5 = 0$ | **Yes** (freq 1) | $0 + 1 = 1$ | `{0: 1, 3: 1, 7: 1, 5: 1}` |
| **3** | 5 | 10 | $10 - 5 = 5$ | **Yes** (freq 1) | $1 + 1 = 2$ | `{0: 1, 3: 1, 7: 1, 5: 1, 10: 1}` |
| **4** | 3 | 13 | $13 - 5 = 8$ | No | 2 | `{..., 13: 1}` |

---

## 🔍 Matching Subarray Verification

Let's locate the 2 matching subarrays found during the trace:

1.  **Match 1 (at index 2)**:
    *   Complement $0$ was matched, which was recorded at virtual index $-1$ (before start of array).
    *   Subarray: `arr[0 ... 2]` $\implies$ `[3, 4, -2]`.
    *   Sum: $3 + 4 - 2 = 5$ (Divisible! Matches $K = 5$).
2.  **Match 2 (at index 3)**:
    *   Complement $5$ was matched, which occurred at index 2 (prefix sum up to index 2 was 5).
    *   Subarray: `arr[3 ... 3]` $\implies$ `[5]`.
    *   Sum: $5$ (Matches $K = 5$).

---

## 💡 How to Build a Trace Table in an Interview
*   **Columns**: Always include:
    - Loop Index.
    - Current element value.
    - Key state variables (`current_sum`, `complement`).
    - Hashing state check (e.g. Set/Map lookups).
    - Output accumulator (`count`, `max_len`).
*   **Step-by-step**: Write each row slowly. Do not skip rows or write states from memory; always update the variables strictly based on the code's execution flow. This prevents simple arithmetic slip-ups.
