# Theory Guide: Strings

This guide explains how strings are stored and processed in C++, covering ASCII encoding and memory allocations.

---

## 💾 Memory Representation: Char Array vs. std::string

In C++, strings can be represented as null-terminated character arrays or dynamic objects:

```
Char Array:  ['H', 'e', 'l', 'l', 'o', '\0']  --> Contiguous stack memory
std::string: [ Pointer -> Heap Memory ]       --> Dynamic sizing and safety
```

- **Null Terminator (`\0`)**: C-style strings use a trailing zero byte to mark the end of the character sequence.
- **Dynamic Growth**: `std::string` manages its capacity automatically, doubling heap allocations when size exceeds capacity.

---

## 📊 ASCII Character Table (Key Ranges)

Understanding character decimal offsets is critical for case conversions and numeric translations:

| Character Range | ASCII Decimal Range | Offset Conversion Trick |
| :--- | :---: | :--- |
| **'A' – 'Z'** | 65 – 90 | Convert to lowercase: `c = c + 32` |
| **'a' – 'z'** | 97 – 122 | Convert to uppercase: `c = c - 32` |
| **'0' – '9'** | 48 – 57 | Convert to integer: `val = c - '0'` |

---

## 🗃️ Time Complexity of Core String Operations

Refer to this table to check the efficiency of common string actions:

| Operation | C++ Code | Time Complexity | Auxiliary Space |
| :--- | :--- | :---: | :---: |
| **Length Check** | `s.length()` or `s.size()` | $O(1)$ | $O(1)$ |
| **Concatenation** | `s1 + s2` | $O(N_1 + N_2)$ | $O(N_1 + N_2)$ |
| **Substring** | `s.substr(pos, len)` | $O(\text{len})$ | $O(\text{len})$ |
| **Comparison** | `s1 == s2` | $O(\min(N_1, N_2))$ | $O(1)$ |
| **Character Lookup** | `s[i]` | $O(1)$ | $O(1)$ |
