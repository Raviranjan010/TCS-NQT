# Hard-Level Problems: Strings

This practice booklet contains 5 advanced-level string problems with detailed C++14 solutions.

---

## 📌 Problems List

### Problem 1: Minimum Window Substring
- **Problem Statement**: Given strings $S$ and $T$, find the minimum window in $S$ which contains all characters of $T$ in $O(N)$ time.
- **Constraints**: $1 \le \text{Lengths} \le 10^5$.
- **Example**: Input: $S = \text{"ADOBECODEBANC"}, T = \text{"ABC"}$, Output: `"BANC"`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  #include <climits>
  
  std::string minWindow(const std::string& s, const std::string& t) {
      int t_freq[256] = {0}, window_freq[256] = {0};
      for (char c : t) t_freq[(unsigned char)c]++;
      int required = 0;
      for (int i = 0; i < 256; i++) {
          if (t_freq[i] > 0) required++;
      }
      int formed = 0;
      int l = 0, r = 0;
      int min_len = INT_MAX, best_l = -1;
      while (r < (int)s.length()) {
          char c = s[r];
          window_freq[(unsigned char)c]++;
          if (t_freq[(unsigned char)c] > 0 && window_freq[(unsigned char)c] == t_freq[(unsigned char)c]) {
              formed++;
          }
          while (l <= r && formed == required) {
              c = s[l];
              if (r - l + 1 < min_len) {
                  min_len = r - l + 1;
                  best_l = l;
              }
              window_freq[(unsigned char)c]--;
              if (t_freq[(unsigned char)c] > 0 && window_freq[(unsigned char)c] < t_freq[(unsigned char)c]) {
                  formed--;
              }
              l++;
          }
          r++;
      }
      return (best_l == -1) ? "" : s.substr(best_l, min_len);
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(1)$ auxiliary.

---

### Problem 2: Longest Valid Parentheses
- **Problem Statement**: Find the length of the longest valid (well-formed) parentheses substring.
- **Example**: Input: `")()())"`, Output: `4` (substring `"()()"`).
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  #include <algorithm>
  
  int longestValidParentheses(const std::string& s) {
      int n = s.length(), max_len = 0;
      std::vector<int> dp(n, 0);
      for (int i = 1; i < n; i++) {
          if (s[i] == ')') {
              if (s[i - 1] == '(') {
                  dp[i] = (i >= 2 ? dp[i - 2] : 0) + 2;
              } else if (i - dp[i - 1] > 0 && s[i - dp[i - 1] - 1] == '(') {
                  dp[i] = dp[i - 1] + ((i - dp[i - 1] >= 2) ? dp[i - dp[i - 1] - 2] : 0) + 2;
              }
              max_len = std::max(max_len, dp[i]);
          }
      }
      return max_len;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(N)$.

---

### Problem 3: Wildcard Matching
- **Problem Statement**: Implement wildcard pattern matching with support for `?` (matches single char) and `*` (matches zero or more chars).
- **Example**: Input: $S = \text{"cb"}, P = \text{"?a"}$, Output: `false`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  
  bool isMatch(const std::string& s, const std::string& p) {
      int n = s.length(), m = p.length();
      int i = 0, j = 0, starIdx = -1, match = 0;
      while (i < n) {
          if (j < m && (p[j] == '?' || p[j] == s[i])) {
              i++; j++;
          } else if (j < m && p[j] == '*') {
              starIdx = j;
              match = i;
              j++;
          } else if (starIdx != -1) {
              j = starIdx + 1;
              match++;
              i = match;
          } else {
              return false;
          }
      }
      while (j < m && p[j] == '*') j++;
      return j == m;
  }
  ```
- **Complexity**: Time: $O(N \cdot M)$ worst case, $O(N)$ average; Space: $O(1)$.

---

### Problem 4: Substring with Concatenation of All Words
- **Problem Statement**: Find all starting indices of substring(s) in $S$ that are a concatenation of each word in a list of equal-length words.
- **Example**: Input: $S = \text{"barfoothefoobarman"}, Words = \text{["foo","bar"]}$, Output: `[0, 9]`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  #include <unordered_map>
  
  std::vector<int> findSubstring(const std::string& s, const std::vector<std::string>& words) {
      std::vector<int> res;
      if (s.empty() || words.empty()) return res;
      int word_len = words[0].length();
      int num_words = words.size();
      int total_len = word_len * num_words;
      if (s.length() < (size_t)total_len) return res;
      std::unordered_map<std::string, int> word_counts;
      for (const std::string& word : words) word_counts[word]++;
      for (int i = 0; i <= (int)s.length() - total_len; i++) {
          std::unordered_map<std::string, int> seen;
          int j = 0;
          for (; j < num_words; j++) {
              std::string w = s.substr(i + j * word_len, word_len);
              if (word_counts.count(w)) {
                  seen[w]++;
                  if (seen[w] > word_counts[w]) break;
              } else {
                  break;
              }
          }
          if (j == num_words) res.push_back(i);
      }
      return res;
  }
  ```
- **Complexity**: Time: $O(N \cdot K)$ where $K$ is total length of words list, Space: $O(K)$.

---

### Problem 5: Shortest Palindrome
- **Problem Statement**: Find the shortest palindrome by adding characters in front of a string.
- **Example**: Input: `"aacecaaa"`, Output: `"aaacecaaa"`.
- **Optimal C++14 Solution**:
  ```cpp
  #include <string>
  #include <vector>
  #include <algorithm>
  
  std::string shortestPalindrome(const std::string& s) {
      int n = s.length();
      std::string rev_s = s;
      std::reverse(rev_s.begin(), rev_s.end());
      std::string temp = s + "#" + rev_s;
      int t_len = temp.length();
      std::vector<int> lps(t_len, 0);
      for (int i = 1; i < t_len; i++) {
          int j = lps[i - 1];
          while (j > 0 && temp[i] != temp[j]) j = lps[j - 1];
          if (temp[i] == temp[j]) j++;
          lps[i] = j;
      }
      std::string suffix = s.substr(lps.back());
      std::reverse(suffix.begin(), suffix.end());
      return suffix + s;
  }
  ```
- **Complexity**: Time: $O(N)$, Space: $O(N)$.
