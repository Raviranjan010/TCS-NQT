# Probability - Concept Guide

## 1. Classical Probability Definition
Probability is the mathematical measure of the likelihood of an event occurring.
$$P(E) = \frac{n(E)}{n(S)}$$
where $n(E)$ is the number of favorable outcomes, and $n(S)$ is the total number of outcomes in the sample space.

### Derivation of Bounds:
Since $0 \le n(E) \le n(S)$, dividing all terms by $n(S)$ yields:
$$0 \le P(E) \le 1$$

### Immediate Worked Example:
What is the probability of rolling an even number on a standard 6-sided die?
*   **Step 1:** Sample space $S = \{1, 2, 3, 4, 5, 6\} \implies n(S) = 6$.
*   **Step 2:** Favorable event $E = \{2, 4, 6\} \implies n(E) = 3$.
*   **Step 3:** Apply formula:
    $$P(E) = 3/6 = 0.5$$

---

## 2. Addition & Multiplication Rules
*   **Addition (OR gate):**
    $$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$
*   **Multiplication (AND gate):**
    *   For Independent Events: $P(A \cap B) = P(A) \times P(B)$.

### Immediate Worked Example:
Two independent coins are tossed. Find the probability of getting two Heads.
*   **Apply Multiplication Rule:**
    $$P(H_1 \cap H_2) = P(H_1) \times P(H_2) = \frac{1}{2} \times \frac{1}{2} = \frac{1}{4}$$
