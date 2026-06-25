# Medium-Level Problems: Strings

This practice booklet contains 10 medium-level string problems with optimizations and complete C++14 implementations.

---

## 📌 Problems List

### Problem 1: Longest Substring Without Repeating Characters
- **Problem Statement**: Find the length of the longest substring without repeating characters.
- **Constraints**: $1 \le \text{Length} \le 10^5$.
- **Example**: Input: `"abcabcbb"`, Output: `3` (substring `"abc"`).
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  #include <algorithm>
  
  int lengthOfLongestSubstring(const std::string& s) {
      std::vector<int> last_seen(256, -1);
      int max_len = 0, start = 0;
      for (int i = 0; i < (int)s.length(); i++) {
          if (last_seen[(unsigned char)s[i]] >= start) {
              start = last_seen[(unsigned char)s[i]] + 1;
          }
          last_seen[(unsigned char)s[i]] = i;
          max_len = std::max(max_len, i - start + 1);
      }
      return max_len;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$ auxiliary (since alphabet size is constant).

---

### Problem 2: String to Integer (atoi)
- **Problem Statement**: Implement the `myAtoi` function to convert a string to a 32-bit signed integer.
- **Example**: Input: `"   -42"`, Output: `-42`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <climits>
  
  int myAtoi(const std::string& s) {
      int i = 0, n = s.length();
      while (i < n && s[i] == ' ') i++;
      int sign = 1;
      if (i < n && (s[i] == '+' || s[i] == '-')) {
          sign = (s[i] == '-') ? -1 : 1;
          i++;
      }
      long long res = 0;
      while (i < n && std::isdigit(s[i])) {
          res = res * 10 + (s[i] - '0');
          if (sign * res > INT_MAX) return INT_MAX;
          if (sign * res < INT_MIN) return INT_MIN;
          i++;
      }
      return sign * res;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 3: Group Anagrams
- **Problem Statement**: Group an array of strings together if they are anagrams.
- **Example**: Input: `["eat", "tea", "tan", "ate", "nat", "bat"]`, Output: `[["bat"],["nat","tan"],["ate","eat","tea"]]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  #include <unordered_map>
  #include <algorithm>
  
  std::vector<std::vector<std::string>> groupAnagrams(const std::vector<std::string>& strs) {
      std::unordered_map<std::string, std::vector<std::string>> groups;
      for (const std::string& s : strs) {
          std::string sorted_s = s;
          std::sort(sorted_s.begin(), sorted_s.end());
          groups[sorted_s].push_back(s);
      }
      std::vector<std::vector<std::string>> res;
      for (auto& pair : groups) {
          res.push_back(pair.second);
      }
      return res;
  }
  ```
- **Complexity**: Time: $O(N \cdot L \log L)$ where $L$ is max word length, Space: $O(N \cdot L)$.

---

### Problem 4: Reverse Words in a String
- **Problem Statement**: Reverse the order of words in a string. Remove excess spacing.
- **Example**: Input: `"the sky is blue"`, Output: `"blue is sky the"`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <algorithm>
  
  std::string reverseWords(std::string s) {
      std::reverse(s.begin(), s.end());
      int n = s.length();
      int idx = 0;
      for (int i = 0; i < n; i++) {
          if (s[i] != ' ') {
              if (idx != 0) s[idx++] = ' ';
              int j = i;
              while (j < n && s[j] != ' ') s[idx++] = s[j++];
              std::reverse(s.begin() + idx - (j - i), s.begin() + idx);
              i = j;
          }
      }
      s.erase(s.begin() + idx, s.end());
      return s;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$ auxiliary.

---

### Problem 5: String Compression
- **Problem Statement**: Compress an array of characters in-place using count representation. Return new length.
- **Example**: Input: `['a','a','b','b','c','c','c']`, Output: returns `6`, array starts with `['a','2','b','2','c','3']`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <vector>
  #include <string>
  
  int compress(std::vector<char>& chars) {
      int write_idx = 0, i = 0, n = chars.size();
      while (i < n) {
          int count = 0;
          char current_char = chars[i];
          while (i < n && chars[i] == current_char) {
              count++;
              i++;
          }
          chars[write_idx++] = current_char;
          if (count > 1) {
              for (char digit : std::to_string(count)) {
                  chars[write_idx++] = digit;
              }
          }
      }
      return write_idx;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$ auxiliary.

---

### Problem 6: Find All Anagrams in a String
- **Problem Statement**: Given string $S$ and non-empty string $P$, find all start indices of $P$'s anagrams in $S$.
- **Example**: Input: $S = \text{"cbaebabacd"}, P = \text{"abc"}$, Output: `[0, 6]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  
  std::vector<int> findAnagrams(const std::string& s, const std::string& p) {
      std::vector<int> res;
      if (s.length() < p.length()) return res;
      int p_freq[26] = {0}, s_freq[26] = {0};
      for (char c : p) p_freq[c - 'a']++;
      int len = p.length();
      for (int i = 0; i < (int)s.length(); i++) {
          s_freq[s[i] - 'a']++;
          if (i >= len) {
              s_freq[s[i - len] - 'a']--;
          }
          bool match = true;
          for (int j = 0; j < 26; j++) {
              if (p_freq[j] != s_freq[j]) {
                  match = false;
                  break;
              }
          }
          if (match) res.push_back(i - len + 1);
      }
      return res;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$ auxiliary.

---

### Problem 7: Multiply Strings
- **Problem Statement**: Multiply two non-negative integers represented as strings.
- **Example**: Input: `"12"`, `"10"`, Output: `"120"`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  
  std::string multiply(const std::string& num1, const std::string& num2) {
      if (num1 == "0" || num2 == "0") return "0";
      int n1 = num1.length(), n2 = num2.length();
      std::vector<int> result(n1 + n2, 0);
      for (int i = n1 - 1; i >= 0; i--) {
          for (int j = n2 - 1; j >= 0; j--) {
              int mult = (num1[i] - '0') * (num2[j] - '0');
              int sum = mult + result[i + j + 1];
              result[i + j + 1] = sum % 10;
              result[i + j] += sum / 10;
          }
      }
      std::string res = "";
      for (int digit : result) {
          if (!(res.empty() && digit == 0)) {
              res += std::to_string(digit);
          }
      }
      return res.empty() ? "0" : res;
  }
  ```
- **Complexity**: Time: $O(N_1 \cdot N_2)$, Space: $O(N_1 + N_2)$.

---

### Problem 8: Compare Version Numbers
- **Problem Statement**: Compare two version numbers represented as strings. Return 1, -1, or 0.
- **Example**: Input: `"1.01"`, `"1.001"`, Output: `0`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <algorithm>
  
  int compareVersion(const std::string& version1, const std::string& version2) {
      int i = 0, j = 0;
      int n1 = version1.length(), n2 = version2.length();
      while (i < n1 || j < n2) {
          int num1 = 0, num2 = 0;
          while (i < n1 && version1[i] != '.') {
              num1 = num1 * 10 + (version1[i] - '0');
              i++;
          }
          while (j < n2 && version2[j] != '.') {
              num2 = num2 * 10 + (version2[j] - '0');
              j++;
          }
          if (num1 < num2) return -1;
          if (num1 > num2) return 1;
          i++; j++;
      }
      return 0;
  }
  ```
- **Complexity**: Time: $O(N_1 + N_2)$, Space: $O(1)$.

---

### Problem 9: Print Duplicate Characters in String
- **Problem Statement**: Return all duplicate characters alongside their counts from a string.
- **Example**: Input: `"test string"`, Output: `t:3, s:2`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  #include <iostream>
  
  void printDuplicates(const std::string& s) {
      int freq[256] = {0};
      for (char c : s) {
          freq[(unsigned char)c]++;
      }
      for (int i = 0; i < 256; i++) {
          if (freq[i] > 1 && i != ' ') {
              std::cout << (char)i << ":" << freq[i] << " ";
          }
      }
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 10: Valid Palindrome II
- **Problem Statement**: Determine if a string can be a palindrome after deleting at most one character.
- **Example**: Input: `"abca"`, Output: `true` (delete 'b' or 'c').
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  
  bool isPalindromeRange(const std::string& s, int i, int j) {
      while (i < j) {
          if (s[i] != s[j]) return false;
          i++; j--;
      }
      return true;
  }
  
  bool validPalindrome(const std::string& s) {
      int i = 0, j = s.length() - 1;
      while (i < j) {
          if (s[i] != s[j]) {
              return isPalindromeRange(s, i + 1, j) || isPalindromeRange(s, i, j - 1);
          }
          i++; j--;
      }
      return true;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.
