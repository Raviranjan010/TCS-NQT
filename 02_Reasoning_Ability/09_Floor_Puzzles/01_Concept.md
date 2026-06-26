# Concept Guide: Floor Puzzles

This guide covers grid allocation structures, step-by-step solving sequences, solved puzzle examples, and word traps for Floor Puzzles in the TCS NQT exam.

---

## 🖼️ 1. Floor Grid Allocation Structure

When solving floor puzzles, always set up a vertical grid starting with the highest floor at the top and the ground floor (Floor 1) at the bottom:

```
+-------+---------+------------------+
| Floor | Person  | Attribute (e.g.  |
|       |         | Color, City)     |
+-------+---------+------------------+
|   5   |  [ C ]  |    Red           |
|   4   |  [ A ]  |    Blue          |
|   3   |  [ E ]  |    Green         |
|   2   |  [ B ]  |    Yellow        |
|   1   |  [ D ]  |    Black         |
+-------+---------+------------------+
```

---

## 🛠️ 2. Step-by-Step Method: Grid $\rightarrow$ Direct $\rightarrow$ Cases $\rightarrow$ Solve

1.  **Set up the Grid:** Write down floor numbers vertically on the left.
2.  **Fill Direct Clues:** Look for absolute conditions (e.g., *"A lives on Floor 3"* or *"B lives on the topmost floor"*).
3.  **Map Relative Clues (Side-notes):** Note down constraints on the side (e.g. `C` is 2 floors above `D` $\implies C - \text{gap} - D$).
4.  **Create Case Splitting:** If a clue has two possible locations, draw two parallel columns (Case 1 and Case 2) and eliminate the invalid one as new constraints are applied.

---

## ✏️ 3. Solved TCS NQT Questions

### Question 1: 5-Floor Single Variable Puzzle
*   **Premises:**
    1.  Five friends (A, B, C, D, E) live on a 5-story building (Floors 1 to 5).
    2.  A lives on an odd-numbered floor.
    3.  B lives immediately above D.
    4.  C lives on Floor 2.
    5.  E lives above A.
*   **Step-by-Step Resolution:**
    *   *Step 1:* Place C on Floor 2.
    *   *Step 2:* A must be on an odd floor $\implies$ Floor 1, 3, or 5.
    *   *Step 3:* B lives immediately above D $\implies$ BD must be a block of 2 empty adjacent floors.
        *   The only available adjacent floors are Floor 3 and 4 (since C is on Floor 2).
        *   Thus, D is on Floor 3 and B is on Floor 4.
    *   *Step 4:* The remaining floors are 1 and 5. A must be on an odd floor. Since Floor 3 is occupied by D, A must be on Floor 1.
    *   *Step 5:* Place E on Floor 5. (Satisfies E lives above A).
*   **Grid Output:**
```
+-------+--------+
| Floor | Person |
+-------+--------+
|   5   |   E    |
|   4   |   B    |
|   3   |   D    |
|   2   |   C    |
|   1   |   A    |
+-------+--------+
```
*   **Answer:** E lives on the top floor.

---

## 🚨 4. Common Word Traps in Puzzles

### Trap 1: "Immediately Above" vs. "Above"
*   **"B lives immediately above A"** $\implies$ No floor exists between B and A. They form a locked block:
```
  [ B ]
  [ A ]
```
*   **"B lives above A"** $\implies$ B is on any floor higher than A. There could be 0, 1, or multiple floors between them:
```
  [ B ]
  [ ? ]
  [ A ]
```

### Trap 2: "Gap" vs. "Floor Difference"
*   *"There is a gap of 2 floors between A and B"* $\implies$ There are exactly two floors between them (e.g., A on Floor 5, B on Floor 2).
*   *"A lives 2 floors above B"* $\implies$ A's floor number minus B's floor number is 2 (means exactly **1** floor gap: A on Floor 4, B on Floor 2).
