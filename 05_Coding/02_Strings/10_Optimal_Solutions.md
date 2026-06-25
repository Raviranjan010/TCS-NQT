# Optimal C++14 Solutions: Strings

This booklet contains optimized C++14 implementations for the 5 core string patterns, achieving $O(N)$ runtime.

---

## ⚡ 1. Palindrome Check in-place (Two Pointer)
- **Insight**: Compare characters from both ends moving inward, avoiding memory allocations.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  bool isPalindromeOptimal(const std::string& s) {
      int l = 0, r = s.length() - 1;
      while (l < r) {
          if (s[l] != s[r]) return false;
          l++; r--;
      }
      return true;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

## ⚡ 2. Substring Search (KMP Algorithm)
- **Insight**: Pre-calculate prefix matching sizes to avoid back-tracking index scans.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <vector>
  
  int strStrOptimal(const std::string& haystack, const std::string& needle) {
      if (needle.empty()) return 0;
      int n = haystack.length(), m = needle.length();
      std::vector<int> lps(m, 0);
      for (int i = 1; i < m; i++) {
          int j = lps[i - 1];
          while (j > 0 && needle[i] != needle[j]) j = lps[j - 1];
          if (needle[i] == needle[j]) j++;
          lps[i] = j;
      }
      int i = 0, j = 0;
      while (i < n) {
          if (haystack[i] == needle[j]) {
              i++; j++;
          }
          if (j == m) return i - m;
          else if (i < n && haystack[i] != needle[j]) {
              if (j != 0) j = lps[j - 1];
              else i++;
          }
      }
      return -1;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(M)$.

---

## ⚡ 3. Anagram Check (Frequency Hashing)
- **Insight**: Use a fixed-size integer array of size 26 to count character occurrences.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  bool isAnagramOptimal(const std::string& s, const std::string& t) {
      if (s.length() != t.length()) return false;
      int freq[26] = {0};
      for (char c : s) freq[c - 'a']++;
      for (char c : t) {
          freq[c - 'a']--;
          if (freq[c - 'a'] < 0) return false;
      }
      return true;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

## ⚡ 4. Longest Substring of distinct characters (Sliding Window)
- **Insight**: Maintain a sliding window and slide the left boundary past the duplicate index using a visited position array.
- **C++14 Code**:
  ```cpp
  #include <string>
  #include <vector>
  #include <algorithm>
  
  int longestDistinctOptimal(const std::string& s) {
      std::vector<int> last_pos(256, -1);
      int max_len = 0, start = 0;
      for (int i = 0; i < (int)s.length(); i++) {
          start = std::max(start, last_pos[(unsigned char)s[i]] + 1);
          max_len = std::max(max_len, i - start + 1);
          last_pos[(unsigned char)s[i]] = i;
      }
      return max_len;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$ auxiliary.

---

## ⚡ 5. Circular Shift check via Doubled Match
- **Insight**: Concatenating $S$ with itself contains all possible circular rotations.
- **C++14 Code**:
  ```cpp
  #include <string>
  
  bool isRotationOptimal(const std::string& s, const std::string& t) {
      if (s.length() != t.length()) return false;
      std::string doubled = s + s;
      return (doubled.find(t) != std::string::npos);
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(N)$ for doubled string.
