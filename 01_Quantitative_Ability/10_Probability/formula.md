# Probability — Formulas

## Core Formulas

| Formula | Expression |
|---------|-----------|
| Basic Probability | P(E) = Favorable/Total |
| Complement | P(E') = 1 - P(E) |
| Addition (general) | P(A∪B) = P(A)+P(B)-P(A∩B) |
| Addition (exclusive) | P(A∪B) = P(A)+P(B) |
| Multiplication (independent) | P(A∩B) = P(A)×P(B) |
| Conditional | P(B\|A) = P(A∩B)/P(A) |
| Binomial | P(k) = nCk × p^k × (1-p)^(n-k) |

## Sample Space Sizes

| Experiment | Total Outcomes |
|-----------|---------------|
| 1 coin | 2 |
| n coins | 2^n |
| 1 die | 6 |
| n dice | 6^n |
| Standard deck | 52 |
| 2 cards drawn | 52C2 = 1326 |

## Derivations

### Addition Rule (Inclusion-Exclusion)
P(A∪B) = P(A) + P(B) - P(A∩B)
- Derivation: When we add P(A)+P(B), the intersection A∩B is counted twice. Subtract once.

### Complement Rule
Since sample space is exhaustive: P(E) + P(E') = 1 → P(E') = 1 - P(E)
