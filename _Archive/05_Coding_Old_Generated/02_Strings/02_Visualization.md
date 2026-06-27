# Visual Guide: Strings

This file visualizes common string operations, memory shifts, and anagram matches.

---

## 💾 Memory Layout: Null-Terminated Array

Visualizing the C-style string `"TCS"` stored in memory:

```
Index:    0    1    2    3
Value:   'T'  'C'  'S'  '\0'
Address: 100  101  102  103
```

- Each character occupies 1 byte of contiguous memory.
- The `\0` character marks the termination of the string boundary, allowing functions like `strlen` to identify the size.

---

## 🔄 Anagram Match Visualization

Two strings are anagrams if their character frequency maps are identical. Let's compare `"silent"` and `"listen"`:

```
 silent:  s:1, i:1, l:1, e:1, n:1, t:1
 listen:  l:1, i:1, s:1, t:1, e:1, n:1
          -----------------------------
          Matches exactly! (Anagram)
```

- We count character occurrences using a frequency array of size 26.
- Increment counts for the first string, and decrement for the second. A final array of all zeros confirms an anagram.

---

## 🔍 Substring Search (Sliding Window)

Finding substring `"cat"` in `"thecat"`:

```
 Step 1: [t h e] c a t  --> Match fail
 Step 2: t [h e c] a t  --> Match fail
 Step 3: t h [e c a] t  --> Match fail
 Step 4: t h e [c a t]  --> Match! (Index 3)
```

- The window slides character-by-character from left to right.
- At each step, characters inside the window are compared to the target.
