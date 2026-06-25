# Expected Questions: Strings (2026 Exam Cycle)

This file contains 10 predicted string coding problems with complete C++14 solutions.

---

## 📌 Expected Questions

### Q1: Remove all adjacent duplicates in string
- **Problem Statement**: Recursively remove adjacent duplicates. For `"abbaca"` return `"ca"`.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  std::string removeDuplicates(const std::string& s) {
      std::string res = "";
      for (char c : s) {
          if (!res.empty() && res.back() == c) {
              res.pop_back();
          } else {
              res.push_back(c);
          }
      }
      return res;
  }
  ```

---

### Q2: Compare strings containing backspaces
- **Problem Statement**: Compare two strings containing backspace character `#`.
- **Example**: Input: $S = \text{"ab#c"}, T = \text{"ad#c"}$, Output: `true` (both yield `"ac"`).
- **C++14 Code**:
  ```cpp
  #include <string>
  
  std::string buildString(const std::string& s) {
      std::string res = "";
      for (char c : s) {
          if (c == '#') {
              if (!res.empty()) res.pop_back();
          } else {
              res.push_back(c);
          }
      }
      return res;
  }
  
  bool backspaceCompare(const std::string& s, const std::string& t) {
      return buildString(s) == buildString(t);
  }
  ```

---

### Q3: Determine if string is a valid parenthesis sequence
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <vector>
  
  bool isValid(const std::string& s) {
      std::vector<char> stack;
      for (char c : s) {
          if (c == '(' || c == '{' || c == '[') {
              stack.push_back(c);
          } else {
              if (stack.empty()) return false;
              char top = stack.back();
              if ((c == ')' && top == '(') || (c == '}' && top == '{') || (c == ']' && top == '[')) {
                  stack.pop_back();
              } else {
                  return false;
              }
          }
      }
      return stack.empty();
  }
  ```

---

### Q4: Longest substring containing only vowels
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <algorithm>
  
  bool isVowel(char c) {
      char low = std::tolower(c);
      return (low == 'a' || low == 'e' || low == 'i' || low == 'o' || low == 'u');
  }
  
  int longestVowelSubstr(const std::string& s) {
      int max_len = 0, current_len = 0;
      for (char c : s) {
          if (isVowel(c)) {
              current_len++;
              max_len = std::max(max_len, current_len);
          } else {
              current_len = 0;
          }
      }
      return max_len;
  }
  ```

---

### Q5: Check if string is a circular shift of another
- **C++14 Code**:
  ```cpp
  #include <string>
  
  bool isCircularShift(const std::string& s, const std::string& t) {
      if (s.length() != t.length()) return false;
      std::string doubled = s + s;
      return (doubled.find(t) != std::string::npos);
  }
  ```

---

### Q6: Decode String (Run Length Decode)
- **Problem Statement**: Decompress `"a3b2"` to `"aaabb"`.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <cctype>
  
  std::string decodeString(const std::string& s) {
      std::string res = "";
      int i = 0, n = s.length();
      while (i < n) {
          if (std::isalpha(s[i])) {
              char char_to_repeat = s[i];
              i++;
              int count = 0;
              while (i < n && std::isdigit(s[i])) {
                  count = count * 10 + (s[i] - '0');
                  i++;
              }
              res.append(count == 0 ? 1 : count, char_to_repeat);
          }
      }
      return res;
  }
  ```

---

### Q7: Check if string can represent valid time
- **Problem Statement**: Check if string represents `"HH:MM"`.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <cctype>
  
  bool isValidTime(const std::string& s) {
      if (s.length() != 5) return false;
      if (s[2] != ':') return false;
      if (!std::isdigit(s[0]) || !std::isdigit(s[1]) || !std::isdigit(s[3]) || !std::isdigit(s[4])) return false;
      int hours = (s[0] - '0') * 10 + (s[1] - '0');
      int minutes = (s[3] - '0') * 10 + (s[4] - '0');
      return (hours >= 0 && hours < 24 && minutes >= 0 && minutes < 60);
  }
  ```

---

### Q8: Find the minimum edit distance insertions only
- **Problem Statement**: Find minimum insertions to make $S$ a subsequence of $T$.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  int minInsertions(const std::string& s, const std::string& t) {
      int i = 0, j = 0;
      int n1 = s.length(), n2 = t.length();
      while (i < n1 && j < n2) {
          if (s[i] == t[j]) i++;
          j++;
      }
      return n1 - i;
  }
  ```

---

### Q9: Find first repeating character
- **C++14 Code**:
  ```cpp
  #include <string>
  
  char firstRepeating(const std::string& s) {
      bool seen[256] = {false};
      for (char c : s) {
          if (seen[(unsigned char)c]) return c;
          seen[(unsigned char)c] = true;
      }
      return '\0';
  }
  ```

---

### Q10: Find length of the longest repeating substring
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <vector>
  #include <algorithm>
  
  int longestRepeatingSubstring(const std::string& s) {
      int n = s.length(), max_len = 0;
      std::vector<std::vector<int>> dp(n + 1, std::vector<int>(n + 1, 0));
      for (int i = 1; i <= n; i++) {
          for (int j = i + 1; j <= n; j++) {
              if (s[i - 1] == s[j - 1] && dp[i - 1][j - 1] < (j - i)) {
                  dp[i][j] = dp[i - 1][j - 1] + 1;
                  max_len = std::max(max_len, dp[i][j]);
              }
          }
      }
      return max_len;
  }
  ```
