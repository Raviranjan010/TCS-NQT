# Concept Guide: Directions & Distance

This guide covers cardinal directions, Pythagoras theorem applications, solved path-tracing questions, and common shadow/rotation traps in the TCS NQT exam.

---

## 🖼️ 1. The Compass Rose (ASCII Art)

Always refer to this basic mapping before starting any distance or direction calculations:

```
                  NORTH (N)
                      ^
                      |
    WEST (W) <--------+--------> EAST (E)
                      |
                      v
                  SOUTH (S)
```

### Sub-Cardinal Directions:
*   **North-East (NE):** Between North and East.
*   **North-West (NW):** Between North and West.
*   **South-East (SE):** Between South and East.
*   **South-West (SW):** Between South and West.

---

## 📐 2. The Pythagoras Theorem & Triplets

For diagonal distance calculations, treat the path as a right-angled triangle:

$$d^2 = x^2 + y^2 \\implies d = \\sqrt{x^2 + y^2}$$

### Common NQT Pythagorean Triplets (Save Calculation Time):
*   $3, 4 \\rightarrow 5$
*   $5, 12 \\rightarrow 13$
*   $8, 15 \\rightarrow 17$
*   $6, 8 \\rightarrow 10$

---

## 🛠️ 3. Step-by-Step Method: Start $\rightarrow$ Trace $\rightarrow$ Calculate

1.  **Mark Starting Point:** Place an `S` on your paper as the origin $(0, 0)$.
2.  **Trace Segment-by-Segment:** Draw lines matching scale (e.g. draw a 10m line twice as long as a 5m line).
3.  **Note Turn Handedness:** Be careful with Left/Right turns relative to the direction the person is currently facing (e.g. turning Left while walking South means heading East).
4.  **Connect Start to End:** Find the shortest distance using coordinate math or Pythagorean theorem.

---

## ✏️ 4. Solved TCS NQT Questions

### Question 1: Basic Path Tracing
*   **Question:** A man walks 10m North, turns Right and walks 6m, then turns Left and walks 5m, and finally turns Right and walks 2m. How far and in which direction is he from his starting point?
*   **Path Trace:**
```
                     [End]
                       ^
                       | (5m)
     [Start] --(10m)-->+--(6m)--> [Turn] --(2m)--> [End]
     (X, Y) Coordinates:
     - Start: (0,0)
     - North 10: (0,10)
     - Right (East) 6: (6,10)
     - Left (North) 5: (6,15)
     - Right (East) 2: (8,15)
```
*   **Solution:**
    *   Horizontal distance $x = 6 + 2 = 8$m.
    *   Vertical distance $y = 10 + 5 = 15$m.
    *   Shortest distance $d = \\sqrt{8^2 + 15^2} = \\sqrt{64 + 225} = \\sqrt{289} = 17$m.
    *   Position relative to start is North and East $\implies$ North-East.
*   **Answer:** 17m North-East

---

### Question 2: Degree Rotations
*   **Question:** A person is facing West. He turns $45^\\circ$ in the clockwise direction and then another $180^\\circ$ in the same direction, and then $270^\\circ$ in the counter-clockwise direction. Which direction is he facing now?
*   **Rotation calculation:**
    *   Clockwise (CW) $= +45^\\circ + 180^\\circ = +225^\\circ$.
    *   Counter-Clockwise (CCW) $= -270^\\circ$.
    *   Net Rotation $= +225^\\circ - 270^\\circ = -45^\\circ$ (meaning $45^\\circ$ CCW).
    *   Initial direction: West.
    *   $45^\\circ$ CCW from West shifts to South-West.
*   **Answer:** South-West

---

## 🚨 5. Common Traps: Shadow & Clockwise Turns

### Trap 1: Sunrise & Sunset Shadows
*   **Sunrise (Sun in East):** Shadows are cast directly **West**.
    *   If a person's shadow falls to their left, they must be facing **South**.
*   **Sunset (Sun in West):** Shadows are cast directly **East**.
    *   If a person's shadow falls to their right, they must be facing **South**.

### Trap 2: Left vs. Right under Reverse Orientation
*   Walking **North** $\implies$ Right is East, Left is West.
*   Walking **South** $\implies$ Right is West, Left is East.
*   Walking **East** $\implies$ Right is South, Left is North.
*   Walking **West** $\implies$ Right is North, Left is South.
