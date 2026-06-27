# Permutation & Combination — Practice Medium (15 Questions)

**Target:** 85%+ | **Time:** 30 minutes

### Q1
In how many ways can the letters of EXAMINATION be arranged?
#### Solution
- Total letters = 11; A=2, I=2, N=2, rest unique.
- Arrangements = 11!/(2!2!2!) = 39916800/8 = **4,989,600**

### Q2
From 5 men and 3 women, select a team of 4 with at least 2 women.
#### Solution
- Exactly 2 women: 3C2 × 5C2 = 3 × 10 = 30
- Exactly 3 women: 3C3 × 5C1 = 1 × 5 = 5
- Total = **35**

### Q3
How many 4-letter words can be formed from TRICK?
#### Solution
- 5P4 = 5!/(5-4)! = 5!/1! = **120**

### Q4
In how many ways can 5 people be arranged in a row if 2 particular people must be together?
#### Solution
- Tie the 2 together: 4 units → 4! arrangements × 2! internal = 24 × 2 = **48**

### Q5
A class has 10 students. How many ways to select a president, VP, and secretary?
#### Solution
- This is ordered (roles are different) → 10P3 = 10×9×8 = **720**

### Q6
How many words can be formed from PENCIL with P always first?
#### Solution
- P fixed, arrange remaining 5: 5! = **120**

### Q7
From 8 points on a line and 5 on another parallel line, how many triangles can be formed?
#### Solution
- Triangle needs 2 points from one line + 1 from the other (or vice versa)
- 8C2 × 5C1 + 8C1 × 5C2 = 28×5 + 8×10 = 140+80 = **220**

### Q8
How many 5-card hands with exactly 2 aces (from standard 52-card deck)?
#### Solution
- Select 2 aces from 4: 4C2 = 6
- Select 3 non-aces from 48: 48C3 = 17296
- Total = 6 × 17296 = **103,776**

### Q9
A password of 6 characters (letters A-Z, no repetition). Count = ?
#### Solution
- 26P6 = 26!/(26-6)! = 26×25×24×23×22×21 = **165,765,600**

### Q10
In how many ways can 4 boys and 3 girls sit in a row if all girls must sit together?
#### Solution
- Girls bundle = 1 unit: 5 units arranged = 5! = 120
- Girls internal: 3! = 6
- Total = 120 × 6 = **720**

### Q11
How many ways to distribute 5 identical balls into 3 distinct boxes?
#### Solution
- Stars and bars: C(5+3-1, 3-1) = C(7,2) = **21**

### Q12
A team of 11 players from 15. How many selections?
#### Solution
- 15C11 = 15C4 = **1365**

### Q13
How many 3-digit even numbers can be formed from {1,2,3,4,5} without repetition?
#### Solution
- Even units digit: 2 or 4 (2 choices)
- For each, arrange remaining 4 digits in first 2 positions: 4P2 = 12
- Total = 2 × 12 = **24**

### Q14
10 people in a circle: how many arrangements?
#### Solution
- (10-1)! = 9! = **362880**

### Q15
In how many ways can VOWELS of EQUATION appear in alphabetical order (relative)?
#### Solution
- EQUATION vowels: E,U,A,I,O = 5 vowels in 5 vowel positions
- Only 1 way to arrange them alphabetically: A,E,I,O,U
- Consonants Q,T,N can be arranged in 3! = 6 ways among their positions
- Total = **6**
