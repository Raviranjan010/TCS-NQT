# Probability - Interview Questions

**Q1.** How is conditional probability used in spam filters (Naive Bayes classifier)?
*   **Answer:** A spam filter calculates the probability that an email is spam given the presence of certain keywords ($W$). Using Bayes' Theorem, $P(\text{Spam} | W) = \frac{P(W | \text{Spam}) \cdot P(\text{Spam})}{P(W)}$. If this probability exceeds a threshold, the email is classified as spam.
