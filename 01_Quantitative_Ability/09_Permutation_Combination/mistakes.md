# Permutation & Combination — Common Mistakes

## 1. Using Permutation When Combination Needed
- **Mistake:** "Select a team of 3 from 10" → 10P3 = 720
- **Fix:** Selection = order doesn't matter → **10C3 = 120**

## 2. Forgetting Factorial Division for Identical Letters
- **Mistake:** BANANA = 6! = 720
- **Fix:** B=1, A=3, N=2 → 6!/(3!2!) = **60**

## 3. Including Zero in Leading Position
- **Mistake:** 3-digit numbers from {0,1,2,3} = 4P3 = 24
- **Fix:** First digit can't be 0: 3 choices × 3P2 = 3 × 6 = **18**

## 4. Circular vs Linear Confusion
- **Mistake:** 5 people at round table = 5! = 120
- **Fix:** Circular = fix one seat → (5-1)! = **24**

## 5. Double-Counting in "At Least" Problems
- **Mistake:** Manually adding P(1)+P(2)+... and missing cases
- **Fix:** Use complement: At least 1 = Total - None

## 6. Vowels Together — Wrong Grouping
- **Mistake:** Only counting vowel arrangements, forgetting the whole-word arrangement
- **Fix:** (n-k+1)! × k! where k = number of vowels
