# Common Mistakes: Strings

Avoid these 15 common coding bugs when working with strings during online assessments.

---

## 🚫 The 15 Main String Bugs

### 1. Index Out of Bounds in loops
- *Mistake*: Accessing `s[s.length()]` (which contains `\0` in C-style, but can cause undefined behavior in `std::string`).
- *Correction*: Loop bounds must end at `s.length() - 1`.

### 2. Char vs. String Literal comparison
- *Mistake*: Writing `if (s[i] == "a")` instead of `if (s[i] == 'a')`.
- *Correction*: Use single quotes for individual characters. Double quotes are for string literals (`const char*`).

### 3. Case sensitivity in Anagram checks
- *Mistake*: Incrementing `freq[s[i] - 'a']` directly without converting characters to lowercase first.
- *Correction*: Check cases: `c = std::tolower(c)`.

### 4. Direct int to string conversions
- *Mistake*: Thinking `char c = 5;` makes the character '5'.
- *Correction*: Add ASCII offset: `char c = 5 + '0'`.

### 5. String concatenation inside loops
- *Mistake*: Building strings by doing `s = s + char` in a loop.
- *Correction*: This takes $O(N)$ time per step. Use `s += char` or `s.push_back(char)` which runs in $O(1)$ amortized time.

### 6. Substring bounds mismatch
- *Mistake*: Thinking `s.substr(start, end)` takes start and end indices.
- *Correction*: In C++, `s.substr` takes `start_index` and `length` of the substring: `s.substr(pos, len)`.

### 7. String size return type signed warnings
- *Mistake*: Comparing `for (int i = 0; i < s.length(); i++)` when `s.length()` returns an unsigned type (`size_t`), causing compilation warnings or underflow errors when size is 0.
- *Correction*: Cast size: `(int)s.length()`.

### 8. Null-pointer assignment crash
- *Mistake*: Accessing `s[0]` on an empty string.
- *Correction*: Check `if (s.empty())` at the start of your function.

### 9. Comparing string numbers directly
- *Mistake*: Using `s1 > s2` to compare numeric values stored as strings.
- *Correction*: String comparison is lexicographical, so `"12"` is less than `"2"`. Convert to integers first.

### 10. Modifying string constants
- *Mistake*: Trying to modify a string literal passed as a pointer.
- *Correction*: Use `std::string` objects to modify character values.

### 11. Ignoring leading spaces in atoi
- *Mistake*: Converting a numeric string without skipping spaces.
- *Correction*: Skip whitespace using `while (s[i] == ' ') i++;`.

### 12. Using standard map for frequency counts
- *Mistake*: Using `std::map<char, int>` for simple character frequency arrays.
- *Correction*: `std::map` adds $O(\log N)$ lookup overhead. Use a flat `int freq[256]` or `freq[26]` array for $O(1)$ access.

### 13. Off-by-one error during string reversals
- *Mistake*: Reversing string using loop limit `i < n/2` with incorrect indices.
- *Correction*: Use the two-pointer swap template `swap(s[l], s[r])`.

### 14. Clearing stringstream incorrectly
- *Mistake*: Reusing `stringstream` objects without clearing the internal buffer.
- *Correction*: Use `ss.str("")` and `ss.clear()`.

### 15. Division by zero in string hashes
- *Mistake*: Computing string hash values using division mod rules without checking divisor boundaries.
- *Correction*: Add checks to ensure the divisor is never 0.
