---
title: "Permutations & Combinations - Cheatsheet"
section: "Numerical Ability"
---

# Permutation & Combination 3-Min Cheatsheet

**Exam Weight**: 2–3 Questions | **Target Time**: < 70s | **OS Tip**: Enter numbers only in FIBs.

---

## 📐 Formulas & Memory Tricks

| Concept | Mathematical Formula | Memory Trick |
| :--- | :--- | :--- |
| **Permutation** | $$^nP_r = \frac{n!}{(n-r)!}$$ | **P** = **P**osition (Order matters) |
| **Combination** | $$^nC_r = \frac{n!}{r!(n-r)!}$$ | **C** = **C**hoose (Order does NOT matter) |
| **Circular (Table)**| $$(n-1)!$$ | Lock 1 person, arrange the rest |
| **Circular (Loop)** | $$\frac{(n-1)!}{2}$$ | Flipped circles cut options in half |
| **Beggar's ($0+$)** | $$^{N+R-1}C_{R-1}$$ | **N** stars + **R-1** bars |
| **Beggar's ($1+$)** | $$^{N-1}C_{R-1}$$ | **R-1** bars placed in **N-1** gaps |
| **Grid Paths** | $$^{R+C}C_R$$ | Right-Up coordinates are coordinates of choices |
| **Diagonals** | $$\frac{n(n-3)}{2}$$ | Vertices choose 2 minus boundary sides |

---

## ⚡ Speed Shortcuts
*   **nCr count down**: $^{10}C_3 = \frac{10 \times 9 \times 8}{3 \times 2 \times 1} = 120$. (No factorials needed).
*   **Dictionary Rank**: Assign descending factorials leftwards. For each letter, count smaller unused letters to its right, multiply, sum, and add 1. Divide by duplicate factorials if letters repeat.
*   **Alternate seating**: seating $M$ men and $W$ women alternately in a circle $= (M-1)! \times W!$.
*   **String Method**: Together constraint $\implies$ group as 1 block $\implies (n - k + 1)! \times k!$.
*   **Gap Method**: Separated constraint $\implies$ place others first $\implies \text{ways}_{\text{others}} \times ^{\text{gaps}}P_{\text{items}}$.

---

## ⚠️ Warning Box: Top 3 Traps
> [!WARNING]
> 1. **The Leading Zero**: When forming digits with $\{0, 1, 2, 3\}$, the first digit cannot be `0`. Calculate `ends-in-0` and `ends-in-other` separately for even numbers.
> 2. **Necklace Division**: Always divide circular necklaces, garlands, and key rings by 2. Do not divide people seated at round tables.
> 3. **Lines vs Triangles**: Collinear points subtract from triangles as $- ^mC_3$. For straight lines, subtract as $- ^mC_2$ but **add 1 back** ($+1$).

---

## 🌳 Decision Support Map
```
                         Are elements ordered?
                                   |
                +------------------+------------------+
                | (Yes)                               | (No)
           Permutations                          Combinations
                |                                     |
         Is it circular?                       Is it a geometry problem?
          +-----+-----+                         +-----+-----+
          |           |                         |           |
       Yes: (n-1)!   No: n!                  Lines:      Triangles:
      (Beads: /2)                            nC2-mC2+1   nC3-mC3
```
