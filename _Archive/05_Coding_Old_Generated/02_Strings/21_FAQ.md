# Frequently Asked Questions (FAQ): Strings

This module answers the most common compilation and runtime issues students face when coding strings in C++14 on online compilers like TCS iON, HackerRank, or LeetCode.

---

## 🛠️ Online Judge Error Lookup Table

| Error Code | Meaning | Primary Cause | Typical Fix |
| :--- | :--- | :--- | :--- |
| **SIGSEGV** | Segmentation Fault | Accessing out-of-bounds string index (e.g. `s[i]` where $i \ge \text{len}$). | Check boundaries: `if (i < s.length())`. |
| **SIGABRT** | Abort Signal | Out-of-bounds access with `s.at(i)`, or stack overflow due to infinite recursion. | Avoid `.at()` or verify boundaries. |
| **TLE** | Time Limit Exceeded | $O(N^2)$ algorithm (e.g. string copying in loop) on input size $N = 10^5$. | Use `+=` instead of `+`, or optimize logic to $O(N)$. |
| **WA** | Wrong Answer | Not handling space inputs, empty strings, or case-sensitive edge cases. | Read input using `getline()`; convert to lowercase. |

---

## ❓ FAQ 1: How do I fix a `SIGSEGV` (Segmentation Fault) on string indexes?

### Problem
Your code crashes with a `SIGSEGV` error when processing test cases on the online platform.

### Cause
A segmentation fault occurs when your program tries to access memory that it doesn't own. In strings, this usually happens when you access `s[i]` or `s[i+1]` where the index is equal to or exceeds the string length.

#### Out-of-Bounds Visual
```text
String s = "NQT" (Length = 3)
Index:    0    1    2    3
Value:  [ N ][ Q ][ T ] [ ? ]  <-- Accessing index 3 (s[3]) is out-of-bounds!
                                    (Triggers SIGSEGV or returns garbage)
```

### Solution & Code Example
Always verify that the index is strictly less than `s.length()` before checking adjacent characters.

```cpp
#include <iostream>
#include <string>

int main() {
    std::string s = "NQT";
    
    // BAD: Can access out-of-bounds index when i = 2
    // for (int i = 0; i < s.length(); i++) {
    //     if (s[i] == 'T' && s[i + 1] == 'S') { ... } 
    // }

    // GOOD: Explicit boundary check
    for (int i = 0; i < (int)s.length() - 1; i++) {
        if (s[i] == 'T' && s[i + 1] == 'S') {
            std::cout << "Match found!\n";
        }
    }
    return 0;
}
```

---

## ❓ FAQ 2: Why does my code run fine locally but get TLE on the online compiler?

### Problem
The code works on your laptop with small inputs, but fails with `Time Limit Exceeded` (TLE) on the platform.

### Cause
TCS NQT coding rounds have a strict 1.0-second time limit. If your code runs in $O(N^2)$ time and the test case has $N = 10^5$ characters, your program performs $10^{10}$ operations, exceeding the $10^8$ operations/sec limit. A common culprit is repeating string concatenation `s = s + c` in a loop.

#### Concatenation Performance Comparison
```text
Loop iteration with s = s + c:
s = "A"        -> Copy "A", append 'B' -> "AB"
s = "AB"       -> Copy "AB", append 'C' -> "ABC"
s = "ABC"      -> Copy "ABC", append 'D' -> "ABCD"
Operations: 1 + 2 + 3 + ... + N = O(N^2)

Loop iteration with s += c:
s = "A"        -> Append 'B' in-place -> "AB" (no copy)
s = "AB"       -> Append 'C' in-place -> "ABC" (no copy)
Operations: 1 + 1 + 1 + ... + 1 = O(N) amortized
```

### Solution
Always use `+=` or `.push_back()` to append characters, and pass strings by reference `const string&` in functions to avoid copying.

```cpp
#include <iostream>
#include <string>

// BAD: Takes O(N^2) because s is copied by value, and s = s + c copies s
std::string buildStringBad(std::string s, int n) {
    std::string res = "";
    for (int i = 0; i < n; i++) {
        res = res + 'a'; 
    }
    return res;
}

// GOOD: Takes O(N) because of in-place appending
std::string buildStringGood(int n) {
    std::string res = "";
    for (int i = 0; i < n; i++) {
        res += 'a'; 
    }
    return res;
}

int main() {
    std::string output = buildStringGood(100000);
    std::cout << "Done! Output size: " << output.size() << "\n";
    return 0;
}
```

---

## ❓ FAQ 3: Why does `s.length() - 1` crash my code when the string is empty?

### Problem
Checking `i < s.length() - 1` on an empty string `""` causes an infinite loop or index crash.

### Cause
`s.length()` returns an unsigned integer type (`size_t`). When the string is empty, `s.length()` is `0`. Subtracting `1` from `0` on an unsigned type causes **integer underflow**, wrapping around to the maximum possible unsigned value ($2^{64}-1$ or $18,446,744,073,709,551,615$).

#### Underflow Value Transition
$$0_{\text{unsigned}} - 1 = 18446744073709551615$$

### Solution
Cast `s.length()` to a signed integer `int` before performing arithmetic:

```cpp
#include <iostream>
#include <string>

int main() {
    std::string s = "";
    
    // BAD: Underflow triggers condition (0 - 1 becomes 18446744073709551615)
    // for (int i = 0; i < (int)s.length() - 1; i++) { ... }

    // GOOD: Safe casting
    int len = (int)s.length();
    for (int i = 0; i < len - 1; i++) {
        std::cout << "This will not run for empty strings.\n";
    }
    return 0;
}
```

---

## ❓ FAQ 4: How do I read an entire line of text including spaces?

### Problem
`cin >> s` only reads the first word of a sentence, ignoring the rest.

### Cause
The standard extractor operator `>>` splits input by whitespace characters (spaces, tabs, newlines). If the input is `"TCS NQT Prep"`, `cin >> s` only captures `"TCS"`.

```text
Input: "TCS NQT Prep"
cin >> s:    Captured: "TCS" | Discarded/Left in stream: "NQT Prep"
getline:     Captured: "TCS NQT Prep"
```

### Solution
Use `std::getline(cin, s)` to read the entire line until a newline character `'\n'` is encountered.

```cpp
#include <iostream>
#include <string>

int main() {
    std::string s;
    std::cout << "Enter text: ";
    std::getline(std::cin, s);
    std::cout << "You entered: " << s << "\n";
    return 0;
}
```

---

## ❓ FAQ 5: Why is my `getline()` statement skipped after reading a number?

### Problem
When reading a number first, then reading a string, the `getline()` statement is skipped entirely.

```cpp
int age;
cin >> age;
string name;
getline(cin, name); // SKIPPED!
```

### Cause
`cin >> age` reads the integer but leaves the trailing newline character `'\n'` in the input buffer. When `getline()` runs, it immediately reads the leftover `'\n'` and thinks the user entered an empty line.

#### Input Buffer Trace
```text
User Types: [ 2 ][ 2 ][ \n ][ J ][ o ][ h ][ n ][ \n ]
cin >> age:  Reads "22", stops at '\n'.
             Buffer remaining: [ \n ][ J ][ o ][ h ][ n ][ \n ]
getline():   Reads up to '\n', gets empty string "".
             Buffer remaining: [ J ][ o ][ h ][ n ][ \n ]
```

### Solution
Insert `cin.ignore()` or `cin >> ws` (whitespace extractor) to clear the buffer before calling `getline()`.

```cpp
#include <iostream>
#include <string>

int main() {
    int age;
    std::cin >> age;
    
    // Clear the leftover newline character from buffer
    std::cin.ignore(); 
    
    std::string name;
    std::getline(std::cin, name);
    
    std::cout << "Age: " << age << ", Name: " << name << "\n";
    return 0;
}
```

---

## ❓ FAQ 6: What is Fast I/O, and should I use it in NQT Coding?

### Problem
Large input cases fail with Time Limit Exceeded, even though the algorithm complexity is optimal ($O(N)$).

### Cause
By default, C++ standard streams (`std::cin`/`std::cout`) synchronize their buffers with C standard streams (`scanf`/`printf`) to allow mixing both input styles. This synchronization causes significant overhead.

### Solution
Add the following boilerplate snippet at the beginning of your `main()` function to unsynchronize the streams, speeding up performance by up to 10x.

```cpp
#include <iostream>

int main() {
    // Speed up standard C++ streams
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(NULL);
    
    // Your code here
    return 0;
}
```
> [!WARNING]
> After using `sync_with_stdio(false)`, never mix C-style I/O (`printf`/`scanf`) with C++ style I/O (`cout`/`cin`) in the same file as it will lead to undefined output ordering.

---

## ❓ FAQ 7: Why does `s1 == "abc"` work but comparing `char*` fails?

### Problem
Comparing two C-style character arrays using `==` always evaluates to false, even when they contain the exact same characters.

### Cause
When comparing character pointers (`char*` or `char arr[]`) using `==`, you are comparing their memory addresses, not the characters they point to.

```text
char s1[] = "abc"; // Address 0x100
char s2[] = "abc"; // Address 0x200
s1 == s2 compares:  0x100 == 0x200 -> Evaluates to FALSE!
```

### Solution
Use `std::strcmp()` for C-style strings or wrap them in C++ `std::string` objects which overload the `==` operator to compare content:

```cpp
#include <iostream>
#include <cstring>
#include <string>

int main() {
    char s1[] = "abc";
    char s2[] = "abc";

    // BAD: Address comparison
    bool bad_compare = (s1 == s2); 

    // GOOD (C-Style): strcmp returns 0 on match
    bool good_c_compare = (std::strcmp(s1, s2) == 0); 

    // GOOD (C++ Style): Casts to std::string automatically
    bool good_cpp_compare = (std::string(s1) == std::string(s2));

    std::cout << std::boolalpha;
    std::cout << "Address compare: " << bad_compare << "\n";
    std::cout << "strcmp compare: " << good_c_compare << "\n";
    std::cout << "std::string compare: " << good_cpp_compare << "\n";
    return 0;
}
```

---

## ❓ FAQ 8: How do I check if a character is uppercase or lowercase?

### Problem
You need to filter alphabetical characters by case but cannot remember the ASCII numbers for `'A'` and `'a'`.

### Cause
Relying on hardcoded ASCII values (like `65` for `'A'`) is prone to errors. C++ provides clean utility functions in the `<cctype>` library.

### Solution
Use `std::isupper()` and `std::islower()`. Alternatively, perform direct comparison against character literals.

```cpp
#include <iostream>
#include <cctype>

int main() {
    char c = 'G';

    // Method 1: Using character literals (Recommended for readability)
    if (c >= 'A' && c <= 'Z') {
        std::cout << c << " is Uppercase (Method 1)\n";
    }

    // Method 2: Using <cctype> library functions
    if (std::isupper(c)) {
        std::cout << c << " is Uppercase (Method 2)\n";
    }
    return 0;
}
```

---

## ❓ FAQ 9: Why does `s.find()` return a massive number when the substring is not found?

### Problem
Using `s.find(target)` returns a value like `18446744073709551615` instead of `-1`.

### Cause
If the search fails, `s.find()` returns a special constant `std::string::npos`. Because `npos` is defined as `static const size_t npos = -1`, and `size_t` is unsigned, it casts to the maximum value of `size_t`.

### Solution
Always compare the result of `.find()` directly against `std::string::npos` instead of checking if it is greater than or equal to `0`.

```cpp
#include <iostream>
#include <string>

int main() {
    std::string s = "TCS NQT";
    
    // Check if substring "Java" is not found
    if (s.find("Java") == std::string::npos) {
        std::cout << "Substring not found!\n";
    }
    return 0;
}
```

---

## ❓ FAQ 10: Can I use `std::regex` in TCS NQT coding?

### Problem
You want to use regular expressions (`std::regex`) to validate or parse strings during the exam.

### Cause
While `std::regex` is standard in C++11, many online judge compilers have outdated standard library implementations that throw runtime errors or cause slow compilation speeds, often leading to TLE.

### Solution
Avoid `std::regex` in coding exams. Instead, write custom parser loops using standard methods like `std::isalnum`, `std::isdigit`, or pointers, which compile faster and use less memory.

#### Fast Custom Parsing vs Regex
```cpp
#include <iostream>
#include <string>
#include <cctype>

// GOOD: Fast index-based numeric validation
bool isNumeric(const std::string& s) {
    if (s.empty()) return false;
    for (char c : s) {
        if (!std::isdigit(c)) return false;
    }
    return true;
}

int main() {
    std::string s = "2026";
    std::cout << std::boolalpha << "Is numeric? " << isNumeric(s) << "\n";
    return 0;
}
```
