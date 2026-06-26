# Permutation & Combination - Expected Questions

### Question 1. Grid Path shortcuts
*   **Question:** Find the number of shortest paths from top-left $(0,0)$ to bottom-right $(4,3)$ in a grid.
*   **Solution:** Total horizontal steps $H = 4$, vertical steps $V = 3$.
    Total steps $= 7$.
    $$\text{Paths} = \frac{(H+V)!}{H! V!} = ^7C_3 = \frac{7 \times 6 \times 5}{3 \times 2 \times 1} = 35\text{ paths}$$
