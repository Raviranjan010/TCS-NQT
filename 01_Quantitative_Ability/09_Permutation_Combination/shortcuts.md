# Permutation & Combination — Shortcuts

## 1. The P vs C Decision in 3 Seconds
Read the question. If you see:
- "arrange", "order", "rank", "password", "code" → **Permutation**
- "select", "choose", "committee", "team", "group" → **Combination**

## 2. nCr Calculator Shortcut
For small r, expand manually:
$$nC2 = \frac{n(n-1)}{2}$$
$$nC3 = \frac{n(n-1)(n-2)}{6}$$

## 3. Vowels Together Trick
For vowels together in a word: tie all vowels into one "super-letter" and arrange.
- n letters, k vowels → arrange (n-k+1) objects × k! internal vowel arrangements

## 4. Circular vs Linear
- Linear: n!
- Circular: (n-1)! — just divide by n (or equivalently fix one seat)

## 5. Complementary Counting
"At least one" problems = Total - None:
P(at least one) = Total arrangements - Arrangements with zero of that item

## 6. Quick nPr expansion
- nP1 = n
- nP2 = n(n-1)
- nP3 = n(n-1)(n-2)
