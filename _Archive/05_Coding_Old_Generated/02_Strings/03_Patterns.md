# Coding Patterns: Strings

This file details the five core algorithmic patterns for string-based coding problems.

---

## 🌳 String Pattern Decision Tree

Use this tree to match the problem description to the correct coding pattern:

```
                            Read the Coding Problem
                                      |
         +----------------------------+----------------------------+
         |                            |                            |
    [Substrings]                 [Comparison]                [In-Place Shift]
         |                            |                            |
  Sliding Window              Frequency Hash / Sorting        Two Pointers
  - Longest distinct char     - Anagram checks                - Palindrome check
  - Substring matching        - Duplicate checks              - In-place reversal
```

---

## ⚡ Core Patterns Detailed

### A. Two-Pointer Swaps & Checks
- **When to Use**: Palindrome checks, reversing words, or moving string boundaries.
- **Template Code**:
  ```cpp
  int l = 0, r = s.length() - 1;
  while (l < r) {
      if (s[l] != s[r]) return false;
      l++; r--;
  }
  ```

### B. Sliding Window (Substrings)
- **When to Use**: Finding substrings containing distinct characters or matching target character set.
- **Template Code**:
  ```cpp
  int left = 0;
  for (int right = 0; right < s.length(); right++) {
      // expand window by adding s[right]
      // shrink window by moving left pointer if condition breaks
  }
  ```

### C. Frequency Hash Mapping
- **When to Use**: Checking for anagrams, counting character occurrences, finding first unique character.
- **Template Code**:
  ```cpp
  int freq[26] = {0};
  for (char c : s) {
      freq[c - 'a']++;
  }
  ```
