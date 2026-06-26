# Permutation & Combination - Pattern Recognition Guide

## 1. Word Arrangement with Restrictions
*   **Trigger Phrasing:** *"Find ways to arrange letters of word X such that vowels are always together."*
*   **Strategy:** Group all vowels into a single "super-letter". Find arrangements of the remaining letters + the group, then multiply by internal vowel arrangements.

### Immediate Worked Example:
Arrange the letters of the word "LEADER" so vowels are always together.
*   **Vowels:** E, A, E. (Note: 'E' repeats twice).
*   **Consonants:** L, D, R.
*   **Grouping:** {E, A, E}, L, D, R $\implies 4$ objects.
*   **Arrangement of objects:** $4! = 24$.
*   **Internal arrangement of vowels:** $\frac{3!}{2!} = 3$.
*   **Total ways:** $24 \times 3 = 72$.
