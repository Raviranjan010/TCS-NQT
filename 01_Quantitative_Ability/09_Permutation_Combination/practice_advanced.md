# Permutation & Combination — Practice Advanced (10 Questions)

**Target:** 70%+ | **Time:** 25 minutes

### Q1
How many 6-digit numbers can be formed using digits 0-9 (no repetition) where the number is divisible by 5?

#### Standard Method
- Divisible by 5: last digit is 0 or 5
- **Case 1:** Last digit = 0
  - First digit: 1-9 (9 choices), remaining 4 positions from remaining 8 digits: 8P4
  - = 9 × 8 × 7 × 6 × 5 = 15120
- **Case 2:** Last digit = 5
  - First digit: 1-9 excluding 5 = 8 choices
  - Remaining 4 from remaining 8: 8P4/... = 8 × 8P4/... 
  - First digit: 8 options (1-9, not 5), next 4 from remaining 8: = 8 × 8 × 7 × 6 × 5 = 13440
- Total = 15120 + 13440 = **28560**

#### Alternate Method
- Total last-digit-5-or-0 numbers ÷ restriction for leading zero...

---

### Q2
In how many ways can 10 examination papers be arranged if the best and worst papers never come together?

#### Standard Method
- Total = 10! = 3628800
- Together = 9! × 2! = 725760
- Never together = 3628800 - 725760 = **2,903,040**

---

### Q3
How many words can be made from letters of MATHEMATICS with M first and S last?

#### Standard Method
- Fix M first, S last: 9 remaining letters to arrange in middle.
- ATHEMATIC has: A=2, T=2, remaining E,H,I,C unique.
- Arrangements = 9!/(2!×2!) = 362880/4 = **90,720**

---

### Q4
From 5 red, 4 blue, 3 green balls, select 3 balls with exactly 1 of each color.

#### Standard Method
- 1 red × 1 blue × 1 green = 5C1 × 4C1 × 3C1 = 5×4×3 = **60**

---

### Q5
A committee of 5 is to be chosen from 6 men and 4 women such that at least 2 women are included.

#### Standard Method
- At least 2 women: 2W+3M, 3W+2M, 4W+1M
- 4C2×6C3 + 4C3×6C2 + 4C4×6C1
- = 6×20 + 4×15 + 1×6 = 120+60+6 = **186**

---

### Q6
Find the number of ways 5 boys and 5 girls can sit in a row such that no two girls sit together.

#### Standard Method
- Arrange 5 boys first: 5! = 120 ways
- 6 gaps (including ends) for 5 girls: 6P5 = 720
- Total = 120 × 720 = **86,400**

---

### Q7
How many numbers between 100 and 1000 have exactly one zero?

#### Standard Method
- 3-digit numbers with exactly one zero
- Zero can be in 2nd or 3rd position only (not 1st — leading zero invalid)
- Case 1: Zero in 2nd position: 1st from 1-9 (9), 3rd from 1-9 (9) = 81
- Case 2: Zero in 3rd position: 1st from 1-9 (9), 2nd from 1-9 (9) = 81
- Total = **162**

---

### Q8
From 7 consonants and 4 vowels, how many words of 3 consonants and 2 vowels can be formed?

#### Standard Method
- Select: 7C3 × 4C2 = 35 × 6 = 210
- Arrange 5 letters: 5! = 120
- Total = 210 × 120 = **25,200**

---

### Q9
In how many ways can a person invite 1 or more of 4 friends to a party?

#### Standard Method
- Subsets excluding empty set = 2^4 - 1 = **15**

---

### Q10
Using digits 1-7 (no repetition), how many 4-digit numbers > 3000 can be formed?

#### Standard Method
- First digit must be 3,4,5,6, or 7 (5 choices ≥ 3)
- Remaining 3 positions from remaining 6 digits: 6P3 = 120
- Total = 5 × 120 = **600**

#### Alternate
- 4-digit numbers starting with 3: 6P3 = 120
- Starting with 4,5,6,7: each = 120 → 4×120 = 480
- Total = 120+480 = 600 ✓
