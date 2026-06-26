# Permutation & Combination - Past Year Questions (PYQs)

### PYQ 1. Handshake networks
*   **Question:** In a party, everyone shakes hands with everyone else. If the total number of handshakes is 66, find the number of people.
*   **Pattern ID:** PC_HANDSHAKE_PYQ
*   **Approach:** Solve $^nC_2 = 66$.
*   **Solution:**
    $$\frac{n(n-1)}{2} = 66 \implies n(n-1) = 132 \implies n^2 - n - 132 = 0$$
    $$(n-12)(n+11) = 0 \implies n = 12$$
*   **Shortcut:** $12 \times 11 / 2 = 66$. Confirmed.
*   **Variation & Trap:** If the question states "couples do not shake hands with each other", subtract the number of couple pairs.
