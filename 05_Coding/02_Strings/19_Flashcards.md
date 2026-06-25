# Flashcards: Strings

Use these 20 active-recall flashcards to test your knowledge of string manipulation and C++14 optimization tricks.

---

## 📇 Flashcard Deck

### Card 1: C-style string terminator
What character marks the end of a C-style character array string?
<details>
<summary>Reveal Answer</summary>

The null terminator: **`'\0'`** (ASCII value 0).
- It marks the boundary for functions like `strlen` and `printf`.
</details>

---

### Card 2: std::string length check complexity
What is the time complexity of `s.length()` or `s.size()` in C++ STL?
<details>
<summary>Reveal Answer</summary>

**$O(1)$**
- The length is stored as a member variable inside the `std::string` class, avoiding the need to scan characters.
</details>

---

### Card 3: String concatenation copy cost
Why is `s = s + c` slower than `s += c` inside a loop?
<details>
<summary>Reveal Answer</summary>

- `s = s + c` creates a temporary copy of `s`, appends `c`, and assigns it back, taking $O(N)$ time per step.
- `s += c` modifies `s` in-place, taking $O(1)$ amortized time.
</details>

---

### Card 4: Substring method arguments
What are the two arguments passed to the `s.substr()` method in C++?
<details>
<summary>Reveal Answer</summary>

$$\text{s.substr(pos, len)}$$
- **pos**: Starting position (0-indexed).
- **len**: Number of characters to extract (not the end index).
</details>

---

### Card 5: Anagram lookup optimization
Why is an `int freq[26]` array preferred over `std::unordered_map<char, int>` for anagram checks?
<details>
<summary>Reveal Answer</summary>

- A flat array has no hashing overhead, collision resolution, or heap allocation.
- It provides faster $O(1)$ access and uses less memory.
</details>

---

### Card 6: Char conversion to integer
How do you convert a numeric character `c` (e.g. `'5'`) to its integer value?
<details>
<summary>Reveal Answer</summary>

Subtract the character `'0'`:
```cpp
int val = c - '0';
```
</details>

---

### Card 7: Uppercase conversion offset
How do you convert a lowercase character `c` to uppercase using ASCII math?
<details>
<summary>Reveal Answer</summary>

Subtract 32:
```cpp
c = c - 32;
```
</details>

---

### Card 8: String reverse in-place complexity
What is the time and space complexity of in-place string reversal using two pointers?
<details>
<summary>Reveal Answer</summary>

- Time: **$O(N)$**
- Space: **$O(1)$**
</details>

---

### Card 9: Substring search worst-case naive
What is the worst-case time complexity of the naive substring search algorithm?
<details>
<summary>Reveal Answer</summary>

**$O(N \cdot M)$**
- occurs when matching target `"aaaa"` in string `"aaaaaaaaab"`.
</details>

---

### Card 10: KMP Algorithm time complexity
What is the time complexity of the Knuth-Morris-Pratt (KMP) substring search algorithm?
<details>
<summary>Reveal Answer</summary>

**$O(N + M)$**
- **N**: Length of main string.
- **M**: Length of pattern string.
</details>

---

### Card 11: std::string to integer conversion function
What C++ STL function converts a string to an integer?
<details>
<summary>Reveal Answer</summary>

**`std::stoi()`**
- For long long values, use `std::stoll()`.
</details>

---

### Card 12: Check if character is alphanumeric
What standard function from `<cctype>` checks if a character is a letter or a digit?
<details>
<summary>Reveal Answer</summary>

**`std::isalnum()`**
</details>

---

### Card 13: String sorting complexity
What is the time complexity of sorting a string of length $N$?
<details>
<summary>Reveal Answer</summary>

**$O(N \log N)$**
- Uses `std::sort(s.begin(), s.end())`.
</details>

---

### Card 14: String comparison complexity
What is the time complexity of comparing two strings `s1 == s2`?
<details>
<summary>Reveal Answer</summary>

**$O(\min(N_1, N_2))$**
- Characters are compared one-by-one until a mismatch or the end of a string is reached.
</details>

---

### Card 15: String find return value on mismatch
What does `s.find()` return if the target substring is not found?
<details>
<summary>Reveal Answer</summary>

**`std::string::npos`**
- It represents the maximum value of the `size_t` type.
</details>

---

### Card 16: Check for circular shift
How do you check if string $T$ is a rotation of $S$ in a single line?
<details>
<summary>Reveal Answer</summary>

```cpp
return (s + s).find(t) != string::npos;
```
</details>

---

### Card 17: String tokenization tool
What C++ STL class is commonly used to split strings by spaces?
<details>
<summary>Reveal Answer</summary>

**`std::stringstream`**
</details>

---

### Card 18: String dynamic resizing factor
How does `std::string` allocate memory when expanding?
<details>
<summary>Reveal Answer</summary>

- It allocates a new contiguous block of memory (typically doubling in capacity).
- It copies the existing characters over, then deletes the old block.
</details>

---

### Card 19: Check for vowel character
What is the most efficient way to check if character `c` is a vowel?
<details>
<summary>Reveal Answer</summary>

Convert to lowercase and compare against the set $\{a, e, i, o, u\}$ using a switch case or direct boolean match.
</details>

---

### Card 20: String index unsigned warning
Why does `for (int i = 0; i < s.length(); i++)` trigger compiler warnings?
<details>
<summary>Reveal Answer</summary>

- `s.length()` returns an unsigned integer type (`size_t`), while `i` is a signed `int`.
- **Solution**: Cast the length: `(int)s.length()`.
</details>
