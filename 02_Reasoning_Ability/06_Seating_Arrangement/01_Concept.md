# Concept Guide: Seating Arrangement

This guide covers linear and circular seating frameworks, left-right orientation templates, solved arrangement puzzles, and relative pronoun traps in the TCS NQT exam.

---

## 🖼️ 1. Seating Frameworks & Left-Right Orientations

To avoid direction mistakes, always reference these orientations:

### A. Linear Seating (Facing North)
```
          Left End                                       Right End
          [  A  ] ----> [  B  ] ----> [  C  ] ----> [  D  ]
          (Your Left is their Left | Your Right is their Right)
```

*   **If facing South:** The directions reverse. Their Left is your Right; their Right is your Left.

---

### B. Circular Seating (Inward vs. Outward)

```
        Facing INWARD (Center)                     Facing OUTWARD (Away)
               [ 1 ]                                      [ 1 ]
             /       \\                                  /       \\
    [ 4 ] <---(Right)--> [ 2 ]                  [ 4 ] <---(Left)---> [ 2 ]
             \\       /                                  \\       /
               [ 3 ]                                      [ 3 ]
   - Clockwise = Left                         - Clockwise = Right
   - Counter-Clockwise = Right                - Counter-Clockwise = Left
```

---

## 🛠️ 2. Step-by-Step Method: Type $\rightarrow$ Backbone $\rightarrow$ Fix $\rightarrow$ Solve

1.  **Draw the Template:** Create the circle with slots (e.g. 8 tick marks) or a line of boxes.
2.  **Start with Fixed Info:** Look for clauses specifying absolute placements (e.g., *"A sits third to the right of B"*). Fix B at the bottom of the circle for easy visualization.
3.  **Place Connected Elements:** Look for clues containing variables already placed in the diagram.
4.  **Handle Possibilities:** Draw parallel cases if a placement has multiple options.

---

## ✏️ 3. Solved TCS NQT Questions

### Question 1: Circular Seating (Inward)
*   **Question:** Six people (A, B, C, D, E, F) are sitting in a circle facing the center. B is between F and C. A is second to the left of D. E is second to the left of F. Who is sitting opposite to A?
*   **Resolution:**
    1.  Draw a circle with 6 slots.
    2.  Place F at the bottom. E is second to the left of F $\implies$ E sits at position 2 (clockwise from F).
    3.  B is between F and C $\implies$ B must sit next to F. Since position 2 is occupied by E, B must sit to the right of F, and C sits next to B.
    4.  A is second to the left of D $\implies$ Place D and A in the remaining slots. Since only two slots are open, A must sit between E and C, and D sits opposite to F.
*   **Arrangement (Clockwise):** F $\rightarrow$ E $\rightarrow$ A $\rightarrow$ D $\rightarrow$ C $\rightarrow$ B.
*   **Opposite of A:** B.
*   **Answer:** B

---

### Question 2: Linear Seating (Facing North)
*   **Question:** Five students (P, Q, R, S, T) are sitting in a row facing North. S is between T and Q. Q is to the immediate left of R. P is to the immediate left of T. Who is sitting in the middle?
*   **Resolution:**
    1.  Q is immediately left of R $\implies$ QR block.
    2.  S is between T and Q $\implies$ T - S - Q.
    3.  Combine them: T - S - Q - R.
    4.  P is immediately left of T $\implies$ P - T - S - Q - R.
*   **Answer:** S (in the middle).

---

## 🚨 4. Relative Pronoun Traps ("Who" vs. "And")

### Trap 1: The "Who / Whom" Clause
*   *"A is second to the right of B, **who** is third to the left of C."*
    *   **The Trap:** Students apply the second clause to A.
    *   **Correct Rule:** The word **"who"** always refers to the *immediate preceding person* (B). Thus, B is third to the left of C.

### Trap 2: The "And / But" Clause
*   *"A is second to the right of B, **and** is third to the left of C."*
    *   **Correct Rule:** The word **"and"** refers to the *first subject* (A). Thus, A is third to the left of C.
