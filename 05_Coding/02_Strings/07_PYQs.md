# Past Year Questions (PYQs): Strings

This file contains 10 solved string coding questions from past TCS NQT drives, complete with C++14 code blocks.

---

## ✏️ Past Year Questions

### PYQ 1: Reverse Only Vowels
- **Question**: Given a string, reverse only the vowels in it.
- **Example**: Input: `"hello"`, Output: `"holle"`.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <algorithm>
  
  bool isVowel(char c) {
      char low = std::tolower(c);
      return (low == 'a' || low == 'e' || low == 'i' || low == 'o' || low == 'u');
  }
  
  std::string reverseVowels(std::string s) {
      int l = 0, r = s.length() - 1;
      while (l < r) {
          while (l < r && !isVowel(s[l])) l++;
          while (l < r && !isVowel(s[r])) r--;
          std::swap(s[l], s[r]);
          l++; r--;
      }
      return s;
  }
  ```

---

### PYQ 2: Compress string by counts
- **Question**: Perform run-length encoding. For `"aabcccccaaa"` return `"a2b1c5a3"`. If not smaller, return original.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  std::string compressString(const std::string& s) {
      int n = s.length();
      if (n <= 1) return s;
      std::string res = "";
      int count = 1;
      for (int i = 1; i < n; i++) {
          if (s[i] == s[i - 1]) {
              count++;
          } else {
              res += s[i - 1] + std::to_string(count);
              count = 1;
          }
      }
      res += s[n - 1] + std::to_string(count);
      return (res.length() < s.length()) ? res : s;
  }
  ```

---

### PYQ 3: Remove duplicate characters
- **Question**: Remove all duplicate characters from a string, keeping only the first occurrence.
- **Example**: Input: `"geeksforgeeks"`, Output: `"geksfor"`.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  std::string removeDuplicates(const std::string& s) {
      bool seen[256] = {false};
      std::string res = "";
      for (char c : s) {
          if (!seen[(unsigned char)c]) {
              seen[(unsigned char)c] = true;
              res += c;
          }
      }
      return res;
  }
  ```

---

### PYQ 4: Find maximum occurring character
- **Question**: Find the character that appears the maximum number of times in a string.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <vector>
  
  char maxOccurringChar(const std::string& s) {
      int count[256] = {0};
      for (char c : s) count[(unsigned char)c]++;
      char max_char = s[0];
      int max_val = 0;
      for (char c : s) {
          if (count[(unsigned char)c] > max_val) {
              max_val = count[(unsigned char)c];
              max_char = c;
          }
      }
      return max_char;
  }
  ```

---

### PYQ 5: Longest Substring of distinct chars
- **Question**: Find the length of the longest substring with all distinct characters.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <vector>
  #include <algorithm>
  
  int longestDistinctSubstr(const std::string& s) {
      std::vector<int> last(256, -1);
      int max_len = 0, start = 0;
      for (int i = 0; i < (int)s.length(); i++) {
          start = std::max(start, last[(unsigned char)s[i]] + 1);
          max_len = std::max(max_len, i - start + 1);
          last[(unsigned char)s[i]] = i;
      }
      return max_len;
  }
  ```

---

### PYQ 6: Check for rotation of another string
- **Question**: Check if string $T$ is a rotation of $S$.
- **Example**: Input: $S = \text{"amazon"}, T = \text{"azonam"}$, Output: `true`.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  bool isRotation(const std::string& s, const std::string& t) {
      if (s.length() != t.length()) return false;
      std::string temp = s + s;
      return (temp.find(t) != std::string::npos);
  }
  ```

---

### PYQ 7: Check if string matches numeric value (Regex-like)
- **Question**: Check if a string represents a valid decimal number.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <cctype>
  
  bool isValidNumber(const std::string& s) {
      if (s.empty()) return false;
      int i = 0, n = s.length();
      while (i < n && std::isspace(s[i])) i++;
      if (i < n && (s[i] == '+' || s[i] == '-')) i++;
      bool has_digit = false, has_dot = false;
      while (i < n && (std::isdigit(s[i]) || s[i] == '.')) {
          if (s[i] == '.') {
              if (has_dot) return false;
              has_dot = true;
          } else {
              has_digit = true;
          }
          i++;
      }
      while (i < n && std::isspace(s[i])) i++;
      return has_digit && i == n;
  }
  ```

---

### PYQ 8: Anagram substring search
- **Question**: Find if a substring of $S$ is an anagram of $P$.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  bool hasAnagramSubstr(const std::string& s, const std::string& p) {
      if (s.length() < p.length()) return false;
      int p_freq[26] = {0}, s_freq[26] = {0};
      for (char c : p) p_freq[c - 'a']++;
      int len = p.length();
      for (int i = 0; i < (int)s.length(); i++) {
          s_freq[s[i] - 'a']++;
          if (i >= len) s_freq[s[i - len] - 'a']--;
          bool match = true;
          for (int j = 0; j < 26; j++) {
              if (p_freq[j] != s_freq[j]) {
                  match = false;
                  break;
              }
          }
          if (match) return true;
      }
      return false;
  }
  ```

---

### PYQ 9: Longest palindromic substring
- **Question**: Find the length of the longest palindromic substring.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <algorithm>
  
  int expandAroundCenter(const std::string& s, int l, int r) {
      while (l >= 0 && r < (int)s.length() && s[l] == s[r]) {
          l--; r++;
      }
      return r - l - 1;
  }
  
  int longestPalindromeSubstr(const std::string& s) {
      int max_len = 0;
      for (int i = 0; i < (int)s.length(); i++) {
          int len1 = expandAroundCenter(s, i, i);
          int len2 = expandAroundCenter(s, i, i + 1);
          max_len = std::max({max_len, len1, len2});
      }
      return max_len;
  }
  ```

---

### PYQ 10: Print non-repeating characters
- **Question**: Print all characters that appear only once in a string in order of appearance.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <iostream>
  
  void printNonRepeating(const std::string& s) {
      int freq[256] = {0};
      for (char c : s) freq[(unsigned char)c]++;
      for (char c : s) {
          if (freq[(unsigned char)c] == 1) {
              std::cout << c;
          }
      }
      std::cout << "\n";
  }
  ```
