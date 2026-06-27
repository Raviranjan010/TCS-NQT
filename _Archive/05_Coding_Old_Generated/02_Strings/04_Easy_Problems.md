# Easy-Level Problems: Strings

This file contains 10 easy-level string problems with approaches, optimal C++14 code, and dry runs.

---

## 📌 Problems List

### Problem 1: Reverse String in Place
- **Problem Statement**: Reverse a string in-place.
- **Constraints**: $1 \le \text{Length} \le 10^5$.
- **Example**: Input: `"hello"`, Output: `"olleh"`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <utility>
  
  void reverseString(std::string& s) {
      int l = 0, r = s.length() - 1;
      while (l < r) {
          std::swap(s[l], s[r]);
          l++; r--;
      }
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 2: Check Palindrome
- **Problem Statement**: Check if a string is a palindrome (ignores non-alphanumeric characters and case).
- **Constraints**: $1 \le \text{Length} \le 10^5$.
- **Example**: Input: `"A man, a plan, a canal: Panama"`, Output: `true`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <cctype>
  
  bool isPalindrome(const std::string& s) {
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
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 3: Valid Anagram
- **Problem Statement**: Check if string $T$ is an anagram of $S$.
- **Constraints**: $1 \le \text{Length} \le 10^5$.
- **Example**: Input: $S = \text{"anagram"}, T = \text{"nagaram"}$, Output: `true`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  
  bool isAnagram(const std::string& s, const std::string& t) {
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
- **Complexity**: Time: $O(N)$, Space: $O(1)$ auxiliary (since alphabet size is constant).

---

### Problem 4: First Unique Character
- **Problem Statement**: Find the index of the first non-repeating character in a string. Return $-1$ if not found.
- **Constraints**: $1 \le \text{Length} \le 10^5$.
- **Example**: Input: `"leetcode"`, Output: `0` (character 'l').
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  
  int firstUniqChar(const std::string& s) {
      int freq[26] = {0};
      for (char c : s) freq[c - 'a']++;
      for (int i = 0; i < (int)s.length(); i++) {
          if (freq[s[i] - 'a'] == 1) return i;
      }
      return -1;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 5: Length of Last Word
- **Problem Statement**: Return the length of the last word in a string containing spaces.
- **Constraints**: $1 \le \text{Length} \le 10^5$.
- **Example**: Input: `"Hello World "`, Output: `5`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  
  int lengthOfLastWord(const std::string& s) {
      int len = 0;
      int i = s.length() - 1;
      while (i >= 0 && s[i] == ' ') i--;
      while (i >= 0 && s[i] != ' ') {
          len++;
          i--;
      }
      return len;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 6: Count Vowels and Consonants
- **Problem Statement**: Count total vowels and consonants in a string.
- **Example**: Input: `"TCS NQT"`, Output: Vowels: 0, Consonants: 6.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <cctype>
  
  std::pair<int, int> countLetters(const std::string& s) {
      int vowels = 0, consonants = 0;
      for (char c : s) {
          if (std::isalpha(c)) {
              char low = std::tolower(c);
              if (low == 'a' || low == 'e' || low == 'i' || low == 'o' || low == 'u') {
                  vowels++;
              } else {
                  consonants++;
              }
          }
      }
      return {vowels, consonants};
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 7: Longest Common Prefix
- **Problem Statement**: Find the longest common prefix among an array of strings.
- **Example**: Input: `["flower", "flow", "flight"]`, Output: `"fl"`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  
  std::string longestCommonPrefix(const std::vector<std::string>& strs) {
      if (strs.empty()) return "";
      std::string prefix = strs[0];
      for (size_t i = 1; i < strs.size(); i++) {
          while (strs[i].find(prefix) != 0) {
              prefix = prefix.substr(0, prefix.length() - 1);
              if (prefix.empty()) return "";
          }
      }
      return prefix;
  }
  ```
- **Complexity**: Time: $O(S)$ where $S$ is sum of all characters, Space: $O(1)$.

---

### Problem 8: Defanging an IP Address
- **Problem Statement**: Replace every period `.` in an IP address with `[.]`.
- **Example**: Input: `"1.1.1.1"`, Output: `"1[.]1[.]1[.]1"`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  
  std::string defangIPaddr(const std::string& address) {
      std::string res = "";
      for (char c : address) {
          if (c == '.') res += "[.]";
          else res += c;
      }
      return res;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(N)$ for output.

---

### Problem 9: Check Isomorphic Strings
- **Problem Statement**: Determine if two strings are isomorphic (characters in $S$ can be replaced to get $T$).
- **Example**: Input: $S = \text{"egg"}, T = \text{"add"}$, Output: `true`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  
  bool isIsomorphic(const std::string& s, const std::string& t) {
      if (s.length() != t.length()) return false;
      int m1[256] = {0}, m2[256] = {0};
      for (int i = 0; i < (int)s.length(); i++) {
          if (m1[(unsigned char)s[i]] != m2[(unsigned char)t[i]]) return false;
          m1[(unsigned char)s[i]] = i + 1;
          m2[(unsigned char)t[i]] = i + 1;
      }
      return true;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.

---

### Problem 10: Toggle Case of Characters
- **Problem Statement**: Toggle the case of each character in a string.
- **Example**: Input: `"aBc"`, Output: `"AbC"`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <cctype>
  
  void toggleCase(std::string& s) {
      for (char& c : s) {
          if (std::isupper(c)) c = std::tolower(c);
          else if (std::islower(c)) c = std::toupper(c);
      }
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$.
