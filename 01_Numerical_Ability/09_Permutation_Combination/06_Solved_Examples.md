# Permutation & Combination - Solved Examples

## 🟢 Easy-Level Examples
### Example 1. Basic factorial arrangement
*   **Question:** In how many ways can 5 books be arranged on a shelf?
*   **Solution:**
    $$\text{Ways} = 5! = 120\text{ ways}$$

## 🟡 Medium-Level Examples
### Example 2. Combinations with conditions
*   **Question:** A committee of 4 is to be chosen from 5 men and 4 women. In how many ways can this be done if there must be exactly 2 men?
*   **Solution:**
    *   Choose 2 men out of 5: $^5C_2 = 10$.
    *   Choose 2 women out of 4: $^4C_2 = 6$.
    *   Total ways $= 10 \times 6 = 60$.

## 🔴 Hard-Level Examples
### Example 3. Numbers formed with repeats
*   **Question:** How many 4-digit numbers greater than 5000 can be formed using digits 3, 5, 7, 8, 9 (repetition of digits is not allowed)?
*   **Solution:**
    *   Thousands place must be 5, 7, 8, or 9 (4 choices).
    *   Remaining 3 places chosen from remaining 4 digits: $^4P_3 = 4 \times 3 \times 2 = 24$.
    *   Total numbers $= 4 \times 24 = 96$.
