# Reasoning Ability - Revision Guide

This guide contains the essential models and rules for Reasoning Ability.

---

## 1. Syllogisms Venn Diagrams

Understanding relations between sets is critical for solving Syllogisms:

```text
1. "All A are B"
   +-----------------+
   | B               |
   |   +---------+   |
   |   | A       |   |
   |   +---------+   |
   +-----------------+

2. "Some A are B"
     +-------+    +-------+
     | A   +-+----+--+   B |
     |     | |Overlap|     |
     +-----+--+---+--+-----+
           +------+

3. "No A is B"
     +-------+         +-------+
     | A     |         | B     |
     |       |         |       |
     +-------+         +-------+
```

### Conclusions Rules Table
| Statement | Valid Conclusions |
| :--- | :--- |
| **All A are B** | Some A are B, Some B are A. |
| **Some A are B** | Some B are A. *(All A are B is invalid)* |
| **No A is B** | No B is A, Some A are not B, Some B are not A. |

---

## 2. Direction Rotational Tests

Direction tests involve rotation angles on a 2D compass:

```text
             North (90 deg)
                   |
     West-North    |    North-East
         \         |         /
           \       |       /
             \     |     /
West (180) --------+-------- East (0 deg)
             /     |     \
           /       |       \
         /         |         \
     West-South    |    South-East
                   |
             South (270 deg)
```

*   **Clockwise (CW) Rotation**: Decreases angle (moves towards right).
*   **Anti-Clockwise (CCW) Rotation**: Increases angle (moves towards left).
*   **Net direction formula**:
    $$\text{Net Angle} = \sum \text{CCW Angles} - \sum \text{CW Angles}$$
    *   If positive: rotate CCW from start direction.
    *   If negative: rotate CW from start direction.

---

## 3. Circular Seating Arrangements

When placing entities in a circle, left and right definitions depend strictly on the direction they are facing:

```text
               [Center]
                  o
  
1. Facing CENTER:
   * Clockwise (CW) = LEFT
   * Counter-Clockwise (CCW) = RIGHT

2. Facing OUTWARDS:
   * Clockwise (CW) = RIGHT
   * Counter-Clockwise (CCW) = LEFT
```

*   **Strategy**: Always draw a circle with ticks (e.g. 6 or 8 spots) first. Start placing elements with fixed conditions (e.g., "A is opposite B"), then fill in the relative positions.
