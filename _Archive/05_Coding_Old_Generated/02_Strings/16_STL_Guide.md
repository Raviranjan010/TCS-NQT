# C++ STL Guide: Strings

This guide covers the standard C++ `std::string` class methods, their parameters, and complexity characteristics.

---

## 🛠️ STL Method Mappings

| Method | Syntax | What it does | Complexity |
| :--- | :--- | :--- | :---: |
| **`substr`** | `s.substr(pos, len)` | Extracts substring of length `len` starting at `pos` | $O(\text{len})$ |
| **`find`** | `s.find(target)` | Returns first occurrence index of `target`, or `string::npos` if not found | $O(N \cdot M)$ |
| **`push_back`**| `s.push_back(c)` | Appends character `c` to the end of string | $O(1)$ amortized |
| **`pop_back`** | `s.pop_back()` | Removes the last character | $O(1)$ |
| **`erase`** | `s.erase(pos, len)`| Removes characters from the string | $O(N)$ |
| **`insert`** | `s.insert(pos, str)`| Inserts string `str` at index `pos` | $O(N)$ |

---

## ⚡ Key C++ STL string conversions

### 1. Number to String
Convert integers or floats to strings using `to_string`:
```cpp
int val = 123;
string s = to_string(val); // s becomes "123"
```

### 2. String to Number
Convert strings to numbers using `stoi` or `stoll`:
```cpp
string s = "456";
int val = stoi(s); // val becomes 456
```

### 3. Check character properties
Use standard functions from `<cctype>`:
```cpp
isalpha(c); // Check if c is alphabetic
isdigit(c); // Check if c is a digit (0-9)
isalnum(c); // Check if c is alphanumeric
tolower(c); // Convert to lowercase
```
