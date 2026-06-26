# Probability - Pattern Recognition Guide

## 1. Card Drawing Pattern
*   **Trigger Phrasing:** *"A card is drawn from a pack of 52 cards. Find the probability of getting X or Y."*
*   **Strategy:** Apply $^nC_r$ to find sample space ($^{52}C_1 = 52$ for 1 card, $^{52}C_2 = 1326$ for 2 cards) and sum distinct outcomes.

### Immediate Worked Example:
Two cards are drawn from a deck. Find the probability that both are aces.
*   **Favorable:** Select 2 aces from 4: $^4C_2 = 6$.
*   **Total:** Select 2 cards from 52: $^{52}C_2 = 1326$.
*   **Probability:** $\frac{6}{1326} = \frac{1}{221}$.
