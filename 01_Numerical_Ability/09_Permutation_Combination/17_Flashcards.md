---
title: "Permutations & Combinations - Flashcards"
section: "Numerical Ability"
---

# Permutation & Combination Flashcards

Use these cards for active recall and spaced repetition practice.

| # | Front (Question) | Back (Answer) | Memory Trick |
|---|-----------------|---------------|--------------|
| 1 | Does order matter in Permutations or Combinations? | Permutations (Order matters); Combinations (Order does not matter). | **P** = Position; **C** = Choice. |
| 2 | What is the formula for arranging $N$ items where $p$ and $q$ are identical duplicates? | $$\frac{N!}{p! q!}$$ | Divide out the duplicates to eliminate identical swaps. |
| 3 | What is the seating arrangement formula for $N$ people around a circular table? | $$(N-1)!$$ | Lock one person in place to break rotation symmetry. |
| 4 | What is the circular arrangement formula for $N$ beads on a necklace? | $$\frac{(N-1)!}{2}$$ | Necklaces can be flipped over, which matches CW and CCW. |
| 5 | What is the formula for the number of handshakes among $N$ people? | $$^NC_2 = \frac{N(N-1)}{2}$$ | Every handshake requires selecting 2 unique people. |
| 6 | What is the formula for the number of diagonals in an $N$-sided polygon? | $$\frac{N(N-3)}{2}$$ | Select any 2 vertices ($^NC_2$) and subtract boundary edges ($N$). |
| 7 | Distribute $N$ identical chocolates to $R$ children where children can get 0 chocolates. Formula? | $$^{N+R-1}C_{R-1}$$ | Arranging $N$ stars and $R-1$ divider bars. |
| 8 | Distribute $N$ identical chocolates to $R$ children where each child gets at least 1 chocolate. Formula? | $$^{N-1}C_{R-1}$$ | Placing $R-1$ divider bars into $N-1$ available gaps. |
| 9 | What is the quickest way to compute $^{15}C_{13}$? | Compute it as $^{15}C_2 = \frac{15 \times 14}{2} = 105$. | Use $^nC_r = ^nC_{n-r}$ to keep numbers small. |
| 10| What is the formula for straight lines from $N$ points where $M$ points are collinear? | $$^NC_2 - ^MC_2 + 1$$ | Subtract the lines lost within collinear group, add 1 back. |
