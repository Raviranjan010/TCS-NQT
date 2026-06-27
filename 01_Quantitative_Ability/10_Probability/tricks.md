# Probability — Tricks & Traps

## 1. The "At Least" Complement Trick
**Trap:** Manually calculating P(1) + P(2) + P(3) + ...
**Better:** P(at least 1) = 1 - P(0), far fewer calculations.

## 2. With vs Without Replacement
**Trap:** Using same denominator for sequential draws
**Fix:**
- With replacement: each draw has same denominator (52 for cards)
- Without replacement: denominator decreases by 1 after each draw

## 3. Independent Events Multiplication
**Trap:** Adding probabilities of independent events
**Fix:** For independent events: P(A AND B) = P(A) × P(B)
**Also:** P(A OR B) for mutually exclusive = P(A) + P(B)

## 4. Dice Sum Calculation
**Trap:** Guessing sum = 7 has probability 6/36 × 6/36
**Fix:** For 2 dice, count favorable pairs: sum of 7 has 6 pairs → 6/36

## 5. Suit vs Color Confusion
- Red suits: Hearts and Diamonds (13+13 = 26)
- Black suits: Spades and Clubs (13+13 = 26)
- Don't confuse "red" (26) with "hearts" (13)

## 6. Option Elimination for Probabilities
- All probabilities must be between 0 and 1
- Eliminate any option > 1 or < 0 immediately
- For "two events AND": answer must be ≤ both individual probabilities
