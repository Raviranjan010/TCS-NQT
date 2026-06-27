# Permutation & Combination — Tricks & Traps

## 1. The "Vowels Together" Grouping
To keep vowels together: bundle them as 1 unit. Multiply by vowels' internal arrangements.
- EDUCATION (9 letters, 5 vowels): treat 5 vowels as 1 unit → (9-5+1)! × 5! = 5! × 120 = 14400

## 2. Identical Elements Trap
"How many ways to arrange MISSISSIPPI?"
- 11 letters: M=1, I=4, S=4, P=2 → 11!/(1!4!4!2!) = 34650

## 3. Necklace vs Seating
- Seating around circular table (facing matters): (n-1)!
- Necklace (flip = same): (n-1)!/2

## 4. At Least vs Exactly
"At least 2 girls" = C(total, 2, 3, ...) sum vs "Exactly 2 girls" = one combination term.
- Use complement for "at least 1": Total - None

## 5. Restricted Positions (Starts with A, ends with B)
- Fix the restricted positions first, arrange the rest.
- "5-digit number starting with 5": Fix first digit (1 way), arrange remaining 4 digits.

## 6. Option Elimination
For small n values, answer must satisfy:
- nCr ≤ nPr always
- nCr is always a whole number
- Answer for "arrangements" >> answer for "selections" with same n,r
