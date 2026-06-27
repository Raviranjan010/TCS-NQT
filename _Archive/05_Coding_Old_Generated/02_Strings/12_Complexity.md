# Big-O Complexity Reference: Strings

Review this reference table for time and space complexities of standard C++ string operations and common algorithms.

---

## 📊 Operations Complexity Matrix

| Operation | C++ Method | Average Case | Worst Case | Auxiliary Space |
| :--- | :--- | :---: | :---: | :---: |
| **Access by index** | `s[i]` | $O(1)$ | $O(1)$ | $O(1)$ |
| **Length Check** | `s.length()` | $O(1)$ | $O(1)$ | $O(1)$ |
| **Concatenation** | `s1 + s2` | $O(N_1 + N_2)$ | $O(N_1 + N_2)$ | $O(N_1 + N_2)$ |
| **Extraction (Substring)** | `s.substr(pos, len)` | $O(\text{len})$ | $O(\text{len})$ | $O(\text{len})$ |
| **Comparison** | `s1 == s2` | $O(\min(N_1, N_2))$ | $O(\min(N_1, N_2))$ | $O(1)$ |
| **Search Substring (KMP)** | `s.find(pat)` (average) | $O(N)$ | $O(N)$ | $O(M)$ |

---

## 📈 String Algorithms Complexity

| Algorithm | Pattern | Time Complexity | Space Complexity |
| :--- | :--- | :---: | :---: |
| **Two Pointer** | Palindrome check, reversing string | $O(N)$ | $O(1)$ |
| **Sliding Window** | Longest distinct substring | $O(N)$ | $O(1)$ |
| **Frequency Hashing** | Anagram check, character count | $O(N)$ | $O(1)$ auxiliary |
| **Sort-based Check** | Anagram check via sorting | $O(N \log N)$ | $O(1)$ or $O(N)$ |
| **KMP Search** | Substring pattern matching | $O(N + M)$ | $O(M)$ |
