# String Edge Cases: Checklist & Fixes

Ensure your string code accounts for these boundary inputs to pass all hidden test cases.

---

## 🛠️ Edge Case Catalog & Code Fixes

| Input Profile | Potential Failure | C++14 Safety Pattern |
| :--- | :--- | :--- |
| **Empty Input** (`s == ""`) | Out-of-bounds access (`s[0]` or `s.length()-1` when size is 0) | `if (s.empty()) return 0;` |
| **Single Character** (`s == "a"`) | Incorrect index loops where indices start at 1 | `if (s.length() == 1) return s;` |
| **Trailing/Leading Spaces** | Incorrect token boundaries or words count | `while (i < n && s[i] == ' ') i++;` |
| **Case Sensitivity** | Anagram or palindrome failures due to matching 'A' vs 'a' | Convert to lowercase first using `tolower` |
| **Special Symbols** | String validation fails due to punctuation marks | Skip non-alphanumeric chars: `isalnum(c)` |

---

## ⚡ Examples of Edge-Case Fixes

### A. Case Insensitivity & Special Chars in Palindrome Checks
```cpp
#include <string>
#include <cctype>

bool isPalindromeSafe(const std::string& s) {
    if (s.empty()) return true;
    int l = 0, r = s.length() - 1;
    while (l < r) {
        while (l < r && !std::isalnum(s[l])) l++;
        while (l < r && !std::isalnum(s[r])) r--;
        if (std::tolower(s[l]) != std::tolower(s[r])) return false;
        l++; r--;
    }
    return true;
}
```

### B. Handling Whitespace in Word Counting
```cpp
#include <string>

int countWordsSafe(const std::string& s) {
    int count = 0;
    int i = 0, n = s.length();
    while (i < n) {
        while (i < n && s[i] == ' ') i++; // Skip spaces
        if (i < n) {
            count++;
            while (i < n && s[i] != ' ') i++; // Skip word
        }
    }
    return count;
}
```
