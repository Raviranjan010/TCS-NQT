# Cheat Sheet: Strings

A single-page reference for string operations, conversion syntax, and complexities.

---

## ⚡ Pattern Recognition Matrix

| If the problem asks for... | ...Immediately select this algorithm/technique |
| :--- | :--- |
| "check if string is palindrome..." | **Two-pointer boundary contraction** ($O(N)$ time, $O(1)$ space) |
| "find longest substring without duplicates..." | **Sliding window + visited index array** ($O(N)$ time) |
| "determine if two strings are anagrams..." | **Frequency array size 26** ($O(N)$ time, $O(1)$ space) |
| "check if string is a rotation..." | **Find substring in doubled string** ($S+S$) ($O(N)$ time) |
| "convert string to integer..." | **Skip spaces, parse digits with sign check** ($O(N)$ time) |

---

## 💾 Core C++14 Quick-Code Snippets

### 1. In-place String Reversal
```cpp
void reverseString(string& s) {
    int l = 0, r = s.length() - 1;
    while (l < r) swap(s[l++], s[r--]);
}
```

### 2. Frequency Hash Anagram Check
```cpp
bool isAnagram(const string& s, const string& t) {
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

### 3. Sliding Window distinct characters substring
```cpp
int distinctSubstr(const string& s) {
    vector<int> last(256, -1);
    int max_len = 0, start = 0;
    for (int i = 0; i < (int)s.length(); i++) {
        start = max(start, last[(unsigned char)s[i]] + 1);
        max_len = max(max_len, i - start + 1);
        last[(unsigned char)s[i]] = i;
    }
    return max_len;
}
```
---

## 🗃️ Time & Space Complexity Reference

- Access: $O(1)$
- Search (Unsorted): $O(N)$
- Comparison: $O(\min(N_1, N_2))$
- Concatenation: $O(N_1 + N_2)$
- Substring: $O(\text{len})$
