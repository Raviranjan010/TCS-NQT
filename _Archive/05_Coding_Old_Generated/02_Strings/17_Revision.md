# Revision Guide: Strings

Use these checklists to quickly review string-based coding concepts before the exam.

---

## 🗺️ String Algorithm Decision Flow

Use this flowchart to immediately identify which string pattern to apply:

```
                            [Read String Problem]
                                      |
         +----------------------------+----------------------------+
         |                            |                            |
   [Substring Sum?]             [Anagram/Unique?]            [Reverse/Check?]
         |                            |                            |
   Sliding Window             Frequency Array / Map           Two Pointers
   - Max distinct chars       - freq[26] = {0}               - Swap s[l], s[r]
```

---

## ⚡ The 1-Minute Checklist

- [ ] **String Reversal**: Two-pointer swap loop is $O(N)$ time and $O(1)$ space.
- [ ] **Fast I/O Syntax**: Ensure `cin.tie(NULL)` is added inside `main()`.
- [ ] **Case Conversion**: Lowercase is `c + 32`, uppercase is `c - 32`.

---

## ⏱️ The 5-Minute Checklist

- [ ] **Anagram Frequency**: Use flat `int freq[26]` array instead of `unordered_map` to reduce overhead.
- [ ] **Substring Extraction**: Remember that `s.substr` takes `(position, length)`.
- [ ] **Whitespace Removal**: Use two-pointer write index shift to compress spaces in $O(N)$ time and $O(1)$ space.

---

## ⌛ The 15-Minute Checklist

Scan this checklist to debug common test case failures:

1. **Empty String**: Add check `if (s.empty()) return 0;`.
2. **String Size Return**: Cast string length to `int` in loop comparisons: `(int)s.length()`.
3. **Substring Search**: KMP is preferred over nested loops when $N \ge 10^5$.
4. **FIB answer formatting**: Enter numbers only; do not add text, decimals, or symbols.
5. **Char vs String**: Check character literals using single quotes (`'a'`).
