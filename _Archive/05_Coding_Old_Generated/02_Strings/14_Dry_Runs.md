# Variable Dry Runs: Strings

This file traces key index and string state updates step-by-step for core string patterns.

---

## 📊 Dry Run: In-place string reversal
Input string: `"tcs"` (length 3)

- Left pointer: `l = 0`
- Right pointer: `r = 2`

| Iteration | `l` | `r` | elements checked | Action | Array State |
| :--- | :---: | :---: | :---: | :---: | :--- |
| Init | 0 | 2 | `s[0] == 't', s[2] == 's'` | - | `"tcs"` |
| 1 | 0 | 2 | `s[0] <-> s[2]` | Swap | `"sct"` |
| 2 | 1 | 1 | `l == r` | Loop Terminate | `"sct"` |

---

## 📊 Dry Run: Sliding Window (Longest Distinct Substring)
Input string: `"abca"` (length 4)

- start pointer: `start`
- visited tracker: `last_seen` array

| Step | Index `i` | Char `s[i]` | `last_seen[s[i]]` | Start index update | Max length formula | Current Max |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| Init | - | - | All -1 | `start = 0` | - | 0 |
| 1 | 0 | 'a' | -1 | `start = 0` | $0 - 0 + 1 = 1$ | 1 |
| 2 | 1 | 'b' | -1 | `start = 0` | $1 - 0 + 1 = 2$ | 2 |
| 3 | 2 | 'c' | -1 | `start = 0` | $2 - 0 + 1 = 3$ | 3 |
| 4 | 3 | 'a' | 0 | $\max(0, 0+1) = 1$ | $3 - 1 + 1 = 3$ | 3 |
