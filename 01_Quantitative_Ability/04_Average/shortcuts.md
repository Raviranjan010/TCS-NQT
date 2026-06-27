# Average — Exam Shortcuts & Hacks

These shortcuts are designed to save calculation time during the TCS NQT exam by replacing large multiplications with simple additions and subtractions.

---

## 1. The Deviation Method (For Change in Group Averages)

Instead of recalculating the sum of all elements when a group changes, track the **net deviation** from the original average. The sum of deviations of all elements from their actual mean is always $0$.

### Addition Shortcut
When a new person of weight $W$ joins a group of $N$ people, causing the average to change by $\Delta A$:
$$W = \text{New Average} + N \times \Delta A$$
*   If the average increases, $\Delta A$ is positive.
*   If the average decreases, $\Delta A$ is negative.

### Substitution Shortcut
When one person of weight $W_{\text{old}}$ is replaced by a new person of weight $W_{\text{new}}$ in a group of $N$ people, causing the average to change by $\Delta A$:
$$W_{\text{new}} = W_{\text{old}} + N \times \Delta A$$
*   *Time saved:* No need to calculate the sum of the other $N-1$ elements.

---

## 2. Consecutive Series Averages (AP Series)

If a set of numbers forms an Arithmetic Progression (consecutive numbers, consecutive evens, consecutive odds, or any series with a common difference):

*   **Shortcut Rule:** The average is the exact middle term.
*   **Shortcut Rule:** The average is $\frac{\text{First Term} + \text{Last Term}}{2}$.

### Examples
*   **Average of consecutive numbers from 1 to 99:**
    *   $\text{Average} = \frac{1 + 99}{2} = 50$.
*   **Average of first 50 even numbers (2 to 100):**
    *   $\text{Average} = \frac{2 + 100}{2} = 51$.
*   **Average of first 50 odd numbers (1 to 99):**
    *   $\text{Average} = \frac{1 + 99}{2} = 50$.
