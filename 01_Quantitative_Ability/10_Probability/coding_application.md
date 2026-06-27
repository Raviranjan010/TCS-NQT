# Probability — Coding Applications

## 1. Monte Carlo Simulation

```python
import random

def monte_carlo_probability(trials=100000):
    """Estimate P(sum of 2 dice = 7) by simulation."""
    favorable = 0
    for _ in range(trials):
        die1 = random.randint(1, 6)
        die2 = random.randint(1, 6)
        if die1 + die2 == 7:
            favorable += 1
    return favorable / trials

print(f"Estimated P(sum=7): {monte_carlo_probability():.4f}")
# Should be close to 0.1667 (1/6)
```

## 2. Combinatorial Probability

```python
from math import comb

def prob_both_aces():
    """P(drawing 2 aces from 52-card deck)."""
    favorable = comb(4, 2)   # Ways to choose 2 aces from 4
    total = comb(52, 2)      # Ways to choose any 2 cards
    return favorable / total

print(f"P(2 aces) = {prob_both_aces():.6f}")  # ~0.004525
```

## 3. Naive Bayes Classifier — Applied Probability

```python
class NaiveBayes:
    def fit(self, X, y):
        """Learn P(class) and P(feature|class)."""
        self.classes = set(y)
        self.priors = {}
        n = len(y)
        for c in self.classes:
            self.priors[c] = y.count(c) / n
    
    def predict(self, x):
        """Return most likely class using Bayes theorem."""
        scores = {}
        for c in self.classes:
            scores[c] = self.priors[c]
            # Multiply P(feature|class) for each feature
        return max(scores, key=scores.get)
```

## 4. LeetCode / Coding Problems
- **LeetCode 688 — Knight Probability in Chessboard:** Recursive probability
- **LeetCode 837 — New 21 Game:** DP with probability
