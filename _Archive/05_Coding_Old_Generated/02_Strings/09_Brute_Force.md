# Naive Approaches & TLE Limits: Strings

This file details the brute-force implementations for five common string patterns, showing why they fail online assessments due to Time Limit Exceeded (TLE) errors.

---

## 🛑 The 5 Core Brute-Force Profiles

### A. Palindrome check via reversal copy
- **Approach**: Copy the string, reverse the copy, and compare the two strings.
- **Code**:
  ```cpp
  #include <string>
  #include <algorithm>
  
  bool isPalindromeNaive(std::string s) {
      std::string temp = s;
      std::reverse(temp.begin(), temp.end());
      return s == temp;
  }
  ```
- **Why it fails**: Requires allocating $O(N)$ auxiliary memory and performing full character copies. For $N = 10^5$, this is highly inefficient.

---

### B. Substring Search via nested loops
- **Approach**: Check all start index positions in $S$ and match against target $P$.
- **Code**:
  ```cpp
  #include <string>
  
  int findSubstringNaive(const std::string& s, const std::string& p) {
      int n = s.length(), m = p.length();
      for (int i = 0; i <= n - m; i++) {
          int j = 0;
          for (; j < m; j++) {
              if (s[i + j] != p[j]) break;
          }
          if (j == m) return i;
      }
      return -1;
  }
  ```
- **Why it fails**: Time complexity is $O(N \cdot M)$. For $N = 10^5$ and $M = 10^4$, total operations $= 10^9$, triggering a TLE error.

---

### C. Anagram Check via sorting
- **Approach**: Sort both strings and compare them.
- **Code**:
  ```cpp
  #include <string>
  #include <algorithm>
  
  bool isAnagramNaive(std::string s, std::string t) {
      std::sort(s.begin(), s.end());
      std::sort(t.begin(), t.end());
      return s == t;
  }
  ```
- **Why it fails**: Take $O(N \log N)$ time. Frequency hashing checks solve this in $O(N)$ time.

---

### D. Longest Substring of distinct chars checking all combinations
- **Approach**: Extract every possible substring, check if it contains duplicates.
- **Code**:
  ```cpp
  #include <string>
  #include <unordered_set>
  #include <algorithm>
  
  int longestDistinctNaive(const std::string& s) {
      int n = s.length(), max_len = 0;
      for (int i = 0; i < n; i++) {
          for (int j = i; j < n; j++) {
              std::unordered_set<char> seen;
              bool distinct = true;
              for (int k = i; k <= j; k++) {
                  if (seen.count(s[k])) distinct = false;
                  seen.insert(s[k]);
              }
              if (distinct) max_len = std::max(max_len, j - i + 1);
          }
      }
      return max_len;
  }
  ```
- **Why it fails**: Time complexity is $O(N^3)$. For $N = 10^3$, operations count is $10^9 \implies$ TLE.

---

### E. Checking for circular shifts check via rotations
- **Approach**: Generate all cyclic shifts and compare.
- **Code**:
  ```cpp
  #include <string>
  
  bool isRotationNaive(std::string s, std::string t) {
      if (s.length() != t.length()) return false;
      int n = s.length();
      for (int i = 0; i < n; i++) {
          char temp = s[0];
          s = s.substr(1) + temp;
          if (s == t) return true;
      }
      return false;
  }
  ```
- **Why it fails**: Takes $O(N^2)$ time due to string copies and substring slicing.
