# Permutation & Combination - Visual Guide & Models

```
                          P&C Selection Flow
                                  |
            +---------------------+---------------------+
            |                                           |
      Does Order Matter?                      Does Order NOT Matter?
       (Permutations)                              (Combinations)
            |                                           |
     Words, Number codes                      Teams, Cards, Handshakes
     Formula: n! / (n-r)!                     Formula: n! / (r! * (n-r)!)
```

### Comparison Table:
| Scenario | Permutation ($^nP_r$) | Combination ($^nC_r$) |
| :--- | :--- | :--- |
| **Order Relevance** | Order is critical | Order is ignored |
| **Example** | Arranging letters of "CAT" | Choosing 2 letters from "CAT" |
| **Values** | Always higher ($^nP_r = ^nC_r \times r!$) | Lower than permutations |
