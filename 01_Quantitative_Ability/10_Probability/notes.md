# Probability — Complete Notes

## 1. Basic Definition

$$P(E) = \frac{\text{Number of Favorable Outcomes}}{\text{Total Number of Outcomes}}$$

**Properties:**
- 0 ≤ P(E) ≤ 1
- P(Impossible event) = 0
- P(Certain event) = 1
- P(E) + P(E') = 1

---

## 2. Standard Sample Spaces

### Coin Toss
- 1 coin: {H, T} — Total = 2
- 2 coins: {HH, HT, TH, TT} — Total = 4 = 2²
- n coins: Total = 2^n

### Dice Roll
- 1 die: {1,2,3,4,5,6} — Total = 6
- 2 dice: Total = 36 = 6²
- n dice: Total = 6^n

### Cards (Standard Deck — 52 cards)
- 4 suits: Spades, Hearts, Diamonds, Clubs
- Each suit has 13 cards: A, 2-10, J, Q, K
- Red cards: Hearts + Diamonds = 26
- Black cards: Spades + Clubs = 26
- Face cards (J, Q, K): 3 per suit × 4 = 12
- Aces: 4

---

## 3. Complementary Events

$$P(E') = 1 - P(E)$$

**When to use:** "At least one", "not", "none" problems.

Example: P(at least one head in 3 tosses) = 1 - P(all tails) = 1 - 1/8 = 7/8

---

## 4. Addition Rule

For any two events A and B:
$$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$

**Mutually Exclusive** (A and B can't both happen):
$$P(A \cup B) = P(A) + P(B)$$

---

## 5. Multiplication Rule

For **Independent Events** (one doesn't affect the other):
$$P(A \cap B) = P(A) \times P(B)$$

For **Dependent Events:**
$$P(A \cap B) = P(A) \times P(B|A)$$

---

## 6. Common TCS Question Types

| Type | Key Formula |
|------|------------|
| Dice sum | Count favorable in 36 total |
| Card drawing | Card count / 52 |
| Coin at-least | 1 - P(none) |
| Ball from bag | Color count / Total |
| Two events together | P(A) × P(B) if independent |

---

## 7. Conditional Probability (Basic)

$$P(B|A) = \frac{P(A \cap B)}{P(A)}$$

**TCS application:** Drawing without replacement — after first draw, sample space changes.

---

## 8. Geometric Distribution Basics

If P(success) = p, P(failure) = q = 1-p:
- P(exactly k successes in n trials) = nCk × p^k × q^(n-k)
- This is Binomial Probability — tested occasionally in TCS NQT.
