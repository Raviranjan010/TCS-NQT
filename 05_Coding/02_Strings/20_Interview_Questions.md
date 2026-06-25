# Technical Interview Questions: Strings

This module contains the top 10 conceptual interview questions for TCS NQT (Digital & Prime tiers) and product company interviews. 

---

## 🗺️ Substring Search Algorithm Comparison

Before diving into the questions, review the comparative matrix of major string search algorithms:

| Algorithm | Best-Case Time | Worst-Case Time | Auxiliary Space | Best Suited For |
| :--- | :--- | :--- | :--- | :--- |
| **Naive Search** | $O(N)$ | $O(N \cdot M)$ | $O(1)$ | Short text, simple patterns |
| **Rabin-Karp** | $O(N + M)$ | $O(N \cdot M)$ | $O(1)$ | Multiple pattern search, numeric data |
| **KMP (Knuth-Morris-Pratt)** | $O(N + M)$ | $O(M)$ | $O(M)$ | Repetitive alphabetic patterns |
| **Boyer-Moore** | $O(N / M)$ | $O(N \cdot M)$ | $O(\Sigma)$ | Large texts, English dictionary patterns |

---

## 🙋 Q1: C-Style Character Arrays vs. C++ `std::string`

### Question
What is the structural difference in memory between a C-style character array (`char arr[]`) and a C++ STL `std::string`? 

### Answer
A C-style string is a contiguous array of characters ending with a null terminator `'\0'`. In contrast, `std::string` is a class wrapper managing its memory dynamically.

#### Memory Layout Visualization
```text
C-Style Array: "NQT"
[ 'N' ] [ 'Q' ] [ 'T' ] [ '\0' ]  <-- Explicit terminator (takes 1 extra byte)

std::string: "NQT"
[ Pointer to Heap ] ---> [ 'N' ] [ 'Q' ] [ 'T' ]
[ Capacity: 15    ]
[ Length: 3       ]  <-- Kept as member variable (allows O(1) length checks)
```

#### Comparison Table
| Feature | `char[]` (C-Style) | `std::string` (C++ STL) |
| :--- | :--- | :--- |
| **Size Checking** | $O(N)$ via `strlen()` | $O(1)$ via `.length()` |
| **Memory Allocation** | Static or manual (stack/heap) | Automated dynamic resizing |
| **Safety** | High risk of buffer overflow | Bound-checked, safe expansion |

#### Worked Example
```cpp
#include <iostream>
#include <cstring>
#include <string>

int main() {
    // C-Style: strlen scans until '\0'
    char c_str[] = "TCS";
    std::cout << "C-Style size: " << std::strlen(c_str) << "\n"; // O(N) scan

    // C++ Style: size is stored inside object
    std::string cpp_str = "TCS";
    std::cout << "C++ Style size: " << cpp_str.size() << "\n";   // O(1) lookup
    return 0;
}
```

---

## 🙋 Q2: String Mutability: C++ vs. Java/Python

### Question
Why are `std::string` objects mutable in C++ while string objects in Java and Python are immutable? What is the impact on performance?

### Answer
C++ values efficiency and gives direct access to memory. In C++, strings can be modified in-place because the programmer manages the lifecycle and thread safety. Java and Python enforce immutability to enable String Pooling (memory saving) and secure multi-threading.

#### Memory Mutation Flow
```text
C++ String: "CAT" -> "BAT" (In-place modification)
Address 0x100: [ 'C' ] [ 'A' ] [ 'T' ] ---> [ 'B' ] [ 'A' ] [ 'T' ] (No new memory allocated)

Java String: "CAT" -> "BAT" (New allocation)
Address 0x200: [ 'C' ] [ 'A' ] [ 'T' ] (Remains unchanged in string pool)
Address 0x300: [ 'B' ] [ 'A' ] [ 'T' ] (New object reference created)
```

#### Code Demonstration
```cpp
#include <iostream>
#include <string>

int main() {
    std::string s = "hello";
    std::cout << "Original address: " << (void*)&s[0] << " Value: " << s << "\n";
    
    s[0] = 'y'; // In-place change
    std::cout << "Modified address: " << (void*)&s[0] << " Value: " << s << "\n";
    return 0;
}
```
**Output Details:** The memory address of the first character remains identical, proving no new memory allocation occurred during mutation.

---

## 🙋 Q3: Understanding the KMP Longest Prefix Suffix (LPS) Table

### Question
In the KMP substring search algorithm, how is the $\pi$ table (LPS array) constructed, and how does it prevent backtracking on the main string?

### Answer
The LPS table stores the length of the longest proper prefix of the pattern that is also a suffix of that substring. When a character mismatch occurs, instead of backtracking the text index $i$, we retrieve the next index to match from the LPS table using the pattern index $j$.

#### Formula & LPS Concept
For a pattern substring $P[0 \dots j]$:
$$\text{LPS}[j] = \max \{ k : P[0 \dots k-1] = P[j-k+1 \dots j] \text{ where } k < j + 1 \}$$

#### Worked Example: Pattern = `"ABAB"`
1. **Substring `"A"`**: Proper prefixes = $\{\}$, Suffixes = $\{\}$. $\text{LPS}[0] = 0$.
2. **Substring `"AB"`**: Prefixes = `{"A"}`, Suffixes = `{"B"}`. No match. $\text{LPS}[1] = 0$.
3. **Substring `"ABA"`**: Prefixes = `{"A", "AB"}`, Suffixes = `{"A", "BA"}`. Match = `"A"`. Length = $1$. $\text{LPS}[2] = 1$.
4. **Substring `"ABAB"`**: Prefixes = `{"A", "AB", "ABA"}`, Suffixes = `{"B", "AB", "BAB"}`. Match = `"AB"`. Length = $2$. $\text{LPS}[3] = 2$.

$$\text{Resulting LPS Table for } "ABAB" = [0, 0, 1, 2]$$

#### C++14 LPS Code Implementation
```cpp
#include <iostream>
#include <vector>
#include <string>

std::vector<int> buildLPS(const std::string& pat) {
    int m = pat.length();
    std::vector<int> lps(m, 0);
    int len = 0; // Length of previous longest prefix suffix
    int i = 1;

    while (i < m) {
        if (pat[i] == pat[len]) {
            len++;
            lps[i] = len;
            i++;
        } else {
            if (len != 0) {
                len = lps[len - 1]; // Fallback to previous best
            } else {
                lps[i] = 0;
                i++;
            }
        }
    }
    return lps;
}

int main() {
    std::string pattern = "ABAB";
    std::vector<int> lps = buildLPS(pattern);
    std::cout << "LPS Table for ABAB: ";
    for (int val : lps) std::cout << val << " ";
    std::cout << "\n";
    return 0;
}
```

---

## 🙋 Q4: Sentence Tokenization with `std::stringstream`

### Question
How does `std::stringstream` work in C++? Explain with a complete solution how you would extract space-separated words from a string.

### Answer
`std::stringstream` is a stream class from `<sstream>` that allows a string to be treated as a stream, similar to standard input stream `cin`. The extractor operator `>>` skips whitespace characters automatically and reads formatted data.

#### Extraction Mechanism
```text
Input String: "TCS  NQT  Prep"
              |    |    |
           Word 1 Word 2 Word 3 (Double spaces are ignored automatically by '>>')
```

#### Tokenization Code
```cpp
#include <iostream>
#include <string>
#include <sstream>
#include <vector>

std::vector<std::string> tokenize(const std::string& str) {
    std::stringstream ss(str);
    std::string word;
    std::vector<std::string> words;
    
    // Extractor operator '>>' splits by space
    while (ss >> word) {
        words.push_back(word);
    }
    return words;
}

int main() {
    std::string text = "TCS  Coding  Strings   Tutorial";
    std::vector<std::string> tokens = tokenize(text);
    for (const auto& w : tokens) {
        std::cout << "[" << w << "] ";
    }
    std::cout << "\n";
    return 0;
}
```

- **Time Complexity:** $O(N)$ where $N$ is the length of the string.
- **Space Complexity:** $O(N)$ to store the tokens.

---

## 🙋 Q5: Rabin-Karp Rolling Hash Math and Congruence

### Question
Describe how the rolling hash function in the Rabin-Karp algorithm works. Show a worked example with numbers.

### Answer
Instead of comparing characters one-by-one, Rabin-Karp computes a hash value for the pattern of length $M$ and compares it to sliding window hashes of length $M$ in the text.

#### Rolling Hash Formula
Let base prime be $d$ and modulo prime be $q$. The hash value of string $S[0 \dots M-1]$ is:
$$H(S) = \left( \sum_{i=0}^{M-1} S[i] \cdot d^{M-1-i} \right) \bmod q$$

To roll the window from index $i$ to $i+1$:
$$H_{i+1} = \left( d \cdot (H_i - S[i] \cdot d^{M-1}) + S[i+M] \right) \bmod q$$

#### Derivation of Rolling Step
$$\text{If } H_i = s_0 d^{M-1} + s_1 d^{M-2} + \dots + s_{M-1} d^0$$
$$\text{Subtract leading term: } H_i - s_0 d^{M-1} = s_1 d^{M-2} + \dots + s_{M-1} d^0$$
$$\text{Multiply by base } d: d \cdot (H_i - s_0 d^{M-1}) = s_1 d^{M-1} + s_2 d^{M-2} + \dots + s_{M-1} d^1$$
$$\text{Add new trailing character: } H_{i+1} = d \cdot (H_i - s_0 d^{M-1}) + s_M$$

#### Worked Example
- Let Pattern = `"12"`, Text = `"812"`, Base $d = 10$, Modulo $q = 13$.
- Pattern Hash: $H(P) = (1 \cdot 10^1 + 2 \cdot 10^0) \bmod 13 = 12 \bmod 13 = 12$.
- Initial Text Window (`"81"`): $H_0 = (8 \cdot 10^1 + 1 \cdot 10^0) \bmod 13 = 81 \bmod 13 = 3$.
- Roll to next window (`"12"`):
  $$H_1 = \left( 10 \cdot (3 - 8 \cdot 10^{2-1}) + 2 \right) \bmod 13$$
  $$H_1 = \left( 10 \cdot (3 - 80) + 2 \right) \bmod 13$$
  $$H_1 = \left( 10 \cdot (-77) + 2 \right) \bmod 13 = (-770 + 2) \bmod 13 = -768 \bmod 13$$
  $$-768 \equiv 12 \pmod{13} \quad (\text{Since } -768 = -60 \times 13 + 12)$$
- $H_1 == H(P)$ ($12 == 12$). A match is found.

---

## 🙋 Q6: Small String Optimization (SSO) in C++

### Question
What is Small String Optimization (SSO) in C++? Why does `sizeof(std::string)` return a fixed value like 24 or 32 regardless of the string's length?

### Answer
`sizeof` returns the static footprint of the string header control object, not the size of its dynamic contents. SSO is an optimization where small strings are stored directly inside the string object's stack memory instead of making a slow heap allocation.

#### Memory allocation strategy
```text
Case 1: Small String (Length <= 15)
std::string buffer (on stack):
[ Size: 5 ] [ Capacity: 15 ] [ Inline Buffer: 'h', 'e', 'l', 'l', 'o', '\0', ... ]

Case 2: Large String (Length > 15)
std::string buffer (on stack):
[ Size: 25 ] [ Capacity: 32 ] [ Pointer to Heap: 0x5000 ] ---> Heap: [ "a very long string here..." ]
```

#### Performance Advantage
- **Stack Allocation:** $O(1)$ fast stack pointer movement.
- **Heap Allocation:** Slow OS system calls, memory fragmentation.
- SSO triggers automatically for strings typically under 15 characters (implementation dependent).

---

## 🙋 Q7: Isomorphic Strings Validation

### Question
Write a complete, compilable C++14 function to determine if two strings `s` and `t` are isomorphic. Explain the algorithm and complexities.

### Answer
Two strings are isomorphic if the characters in `s` can be replaced to get `t` while preserving character order. Every unique character in `s` must map to exactly one character in `t`, and vice versa.

#### Mapping Rule Chart
```text
String s: "egg"  --> String t: "add"
'e' -> 'a' (Unique)
'g' -> 'd' (Unique)
'g' -> 'd' (Valid, matches existing map)
Result: ISOMORPHIC

String s: "foo"  --> String t: "bar"
'f' -> 'b'
'o' -> 'a'
'o' -> 'r' (Invalid! 'o' cannot map to both 'a' and 'r')
Result: NOT ISOMORPHIC
```

#### Compilable C++14 Solution
```cpp
#include <iostream>
#include <string>
#include <vector>

bool isIsomorphic(std::string s, std::string t) {
    if (s.length() != t.length()) return false;
    
    // Arrays to store last seen positions (initialized to 0)
    int map_s[256] = {0};
    int map_t[256] = {0};
    
    for (int i = 0; i < (int)s.length(); i++) {
        unsigned char cs = s[i];
        unsigned char ct = t[i];
        
        // If their previous mapping positions do not match
        if (map_s[cs] != map_t[ct]) {
            return false;
        }
        
        // Update positions (using i + 1 because 0 is our default unmapped marker)
        map_s[cs] = i + 1;
        map_t[ct] = i + 1;
    }
    return true;
}

int main() {
    std::cout << std::boolalpha;
    std::cout << "Is 'egg' and 'add' isomorphic? " << isIsomorphic("egg", "add") << "\n";
    std::cout << "Is 'foo' and 'bar' isomorphic? " << isIsomorphic("foo", "bar") << "\n";
    return 0;
}
```

#### Complexity Analysis
- **Time Complexity:** $O(N)$ — we loop through the string of length $N$ exactly once.
- **Space Complexity:** $O(1)$ — the arrays are fixed-size (256 elements for ASCII).

---

## 🙋 Q8: Boyer-Moore Bad Character Heuristic

### Question
How does the bad character heuristic in the Boyer-Moore algorithm determine shift distance? Provide a numerical example.

### Answer
Boyer-Moore matches characters from right to left. When a mismatch occurs at $T[i] = \text{'x'}$ and $P[j] = \text{'y'}$, the bad character heuristic shifts the pattern to align the occurrences.

#### Shift Rules
Let the mismatched character in text be $c$.
1. **If $c$ is not in the pattern**: Shift the pattern past the mismatch point.
2. **If $c$ is in the pattern**: Shift the pattern to align the rightmost occurrence of $c$ in the pattern with the mismatch index in the text.

$$\text{Shift Distance} = \max(1, j - \text{rightmost\_occurrence}(c))$$

#### Worked Example
- Text: `"ABAACBA"`
- Pattern: `"AAC"`
- Scan right-to-left:
```text
Text:    A B A A C B A
Pattern: A A C
             ^ Mismatch at index 2 (Text has 'A', Pattern has 'C')
```
- Rightmost occurrence of `'A'` in pattern `"AAC"` is at index 1.
- Shift distance = $j - \text{occurrence} = 2 - 1 = 1$.
- Pattern shifts by 1 position:
```text
Text:    A B A A C B A
Pattern:   A A C
               ^ Match!
```

---

## 🙋 Q9: Returning Dangling References from Functions

### Question
What is the danger of returning a `const std::string&` from a C++ function? Illustrate with a code sample showing a common developer bug.

### Answer
If a function returns a reference to a local variable created on the stack, that local variable is destroyed when the function returns. The returned reference becomes a dangling reference, leading to undefined behavior when accessed.

#### Local Stack Lifespan Diagram
```text
1. Call getGreeting() ----> Local variable string 'local_str' created on Stack.
2. Return Reference  ----> Retuns address pointing to Stack space.
3. Function Exit     ----> Stack frame popped. 'local_str' is destroyed.
4. Main reads Ref   ----> Accesses invalid memory (Dangling pointer/crash!).
```

#### Buggy Code Example
```cpp
#include <iostream>
#include <string>

// BUG: Returns reference to a temporary variable
const std::string& getGreeting() {
    std::string local_str = "Welcome to TCS NQT Prep!";
    return local_str; // WARNING: local_str is destroyed here
}

int main() {
    const std::string& val = getGreeting();
    // std::cout << val << "\n"; // UNDEFINED BEHAVIOR: Reading deallocated memory!
    return 0;
}
```

- **Fix:** Return the string by value (`std::string`), allowing modern compilers to perform Copy Elision (Return Value Optimization - RVO) to avoid copying overhead.

---

## 🙋 Q10: Conversion Performance: `stoi` vs. `stringstream` vs. `sscanf`

### Question
Compare `std::stoi`, `std::stringstream`, and C-style `sscanf` for parsing integers from a string in C++14. Which is the fastest, and why?

### Answer
- **`std::stoi`**: Direct wrapper around C string conversions. Fast, throws runtime exceptions on failure.
- **`std::stringstream`**: Object-oriented stream wrapper. Slowest because of stream state overhead and formatted I/O virtual tables.
- **`sscanf` / `strtol`**: C-style low-level functions. The fastest because they lack exception overhead and class state variables.

#### Benchmark Comparison Table
| Method | Exception Handling | Performance | Type Safety |
| :--- | :--- | :--- | :--- |
| **`strtol` / `sscanf`** | Manual via error codes | ⭐⭐⭐ (Fastest) | Low |
| **`std::stoi`** | Standard C++ Exceptions | ⭐⭐ (Good) | Medium |
| **`std::stringstream`** | State flags (`fail()`) | ⭐ (Slowest) | High |

#### C++ Code Sample
```cpp
#include <iostream>
#include <string>
#include <sstream>
#include <cstdlib>

int main() {
    std::string text = "2026";

    // 1. std::stoi (Recommended for general C++)
    int val1 = std::stoi(text);

    // 2. std::stringstream (Slowest)
    std::stringstream ss(text);
    int val2;
    ss >> val2;

    // 3. strtol (Fastest, C-style pointer parsing)
    int val3 = std::strtol(text.c_str(), nullptr, 10);

    std::cout << "Values parsed: " << val1 << ", " << val2 << ", " << val3 << "\n";
    return 0;
}
```
