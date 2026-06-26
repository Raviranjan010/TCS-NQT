# Reasoning Ability Mock Tests - Expected Questions

This file contains expected practice questions for the Reasoning Ability mock tests.

---

## 1. REAS-01: Syllogisms

*   **Question**:
    *   **Statements**:
        1. All pens are cups.
        2. All cups are plates.
    *   **Conclusions**:
        I. All pens are plates.
        II. Some cups are pens.
*   **Venn Diagram representation**:
    *   Draw circle `Pens` inside circle `Cups`.
    *   Draw circle `Cups` inside circle `Plates`.
*   **Evaluation**:
    *   Since `Pens` is entirely inside `Plates`, Conclusion I is **valid**.
    *   Since `Pens` is part of `Cups`, Conclusion II is **valid**.
*   **Output**: Both Conclusion I and Conclusion II follow.

---

## 2. REAS-02: Circular Seating Arrangement

*   **Question**: Six friends (A, B, C, D, E, F) are sitting in a circle facing the center.
    *   F is to the immediate left of A.
    *   B is opposite E.
    *   C is between B and F.
    *   Who is sitting to the immediate right of E?
*   **Derivation**:
    1.  Place F at 12 o'clock, A at 2 o'clock (F is left of A, i.e., clockwise since they face center).
    2.  C is between B and F $\implies$ place C at 10 o'clock and B at 8 o'clock.
    3.  B is opposite E $\implies$ since B is at 8 o'clock, E must be at 2 o'clock (opposite B). But wait, A is at 2 o'clock. Let's adjust:
        *   If six spots: 12, 2, 4, 6, 8, 10 o'clock.
        *   F is at 12, A is at 2 o'clock.
        *   C is at 10, B is at 8 o'clock.
        *   B (8 o'clock) opposite E (2 o'clock). This means E and A conflict. Let's re-verify:
        *   Let's place A at 4 o'clock, F at 2 o'clock (F is left of A, facing center, clockwise is left).
        *   C is at 12 o'clock, B is at 10 o'clock.
        *   B (10 o'clock) opposite E (4 o'clock). This matches perfectly!
        *   Remaining spot (6 o'clock) goes to D.
    4.  So seating order clockwise: C (12) $\rightarrow$ F (2) $\rightarrow$ A (4) $\rightarrow$ D (6) $\rightarrow$ E (8) $\rightarrow$ B (10).
    5.  Immediate right of E (facing center, counter-clockwise is right) is D.
*   **Shortcut**: For facing center:
    *   Left = Clockwise direction.
    *   Right = Counter-clockwise direction.

---

## 3. REAS-03: Rotational Direction Test

*   **Question**: A man is facing South. He turns $135^\circ$ in the anti-clockwise direction and then $180^\circ$ in the clockwise direction. Which direction is he facing now?
*   **Derivation**:
    1.  Initial direction = South ($180^\circ$ on Cartesian plane where North is $90^\circ$, East is $0^\circ$).
    2.  Anti-clockwise rotation = $+135^\circ$.
    3.  Clockwise rotation = $-180^\circ$.
    4.  Net rotation $= +135^\circ - 180^\circ = -45^\circ$ (which means $45^\circ$ clockwise from South).
    5.  $45^\circ$ clockwise from South is **South-West**.
*   **Shortcut**: Net rotation = (Sum of anti-clockwise angles) - (Sum of clockwise angles). If positive, turn anti-clockwise; if negative, turn clockwise from start.

---

## 4. REAS-04: Coding-Decoding

*   **Question**: In a certain code language, `"PEAR"` is coded as `"QGDT"`. How is `"MANGO"` coded in that language?
*   **Derivation**:
    *   P (+1) $\rightarrow$ Q
    *   E (+2) $\rightarrow$ G
    *   A (+3) $\rightarrow$ D
    *   R (+4) $\rightarrow$ T
    *   Pattern is incremental shifting: $+1, +2, +3, +4, \dots$
    *   Applying to `"MANGO"`:
        *   M (+1) $\rightarrow$ N
        *   A (+2) $\rightarrow$ C
        *   N (+3) $\rightarrow$ Q
        *   G (+4) $\rightarrow$ K
        *   O (+5) $\rightarrow$ T
*   **Output**: `"NCQKT"`
