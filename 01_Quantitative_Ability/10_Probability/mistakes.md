# Probability — Common Mistakes

## 1. Adding Probabilities for Independent AND events
- **Mistake:** P(A AND B) = P(A) + P(B)
- **Fix:** P(A AND B) = P(A) × P(B) for independent events

## 2. Not Adjusting Denominator for Without Replacement
- **Mistake:** P(both red) = 5/8 × 5/8
- **Fix:** After removing 1 red, only 7 balls remain: P = 5/8 × 4/7

## 3. Confusing Mutually Exclusive vs Independent
- **Mutually exclusive:** P(A∩B) = 0 → can't happen together
- **Independent:** P(A∩B) = P(A)×P(B) → one doesn't affect other
- These are DIFFERENT properties!

## 4. Heart vs Red Card Confusion
- Hearts = 13, Diamonds = 13, total Red = 26
- "Red card" ≠ "Heart card"

## 5. Face Card Count
- Face cards = J, Q, K = 3 per suit × 4 suits = 12 (NOT 16)
- Aces are NOT face cards

## 6. "At Least" Manual Count Error
- Trap: Trying to add P(exactly 1) + P(exactly 2) + ... 
- Better: 1 - P(none) — much faster

## 7. Sample Space for Ordered vs Unordered Draws
- If drawing 2 cards and ORDER matters: use 52P2 = 2652
- If ORDER doesn't matter: use 52C2 = 1326
