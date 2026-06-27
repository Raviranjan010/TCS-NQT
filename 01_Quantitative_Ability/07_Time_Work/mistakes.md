# Time & Work — Common Candidate Mistakes

This document details the most common traps candidates fall into during time, work, and rate calculations in the TCS NQT exam and how to avoid them.

---

## 1. Adding Days Directly
*   **The Mistake:** Adding the number of days taken by individuals to find the combined time (e.g., $10 	ext{ days} + 15 	ext{ days} = 25 	ext{ days}$).
*   **The Scenario:** A takes 10 days and B takes 15 days. Candidates write that they will take 25 days together.
*   **The Fix:** Days cannot be added directly because rate is inversely proportional to time. Add efficiencies (rates) instead: $rac{1}{10} + rac{1}{15} = rac{1}{6} ightarrow 6$ days.

## 2. Miscalculating Alternate Days Work Progress
*   **The Mistake:** Dividing total work by 2-day cycles directly without checking the remainder.
*   **The Scenario:** Work is 36 units. Cycle is 5 units. Candidates write total time $= 36 / 2.5 = 14.4$ days.
*   **The Fix:** Calculate complete cycles first ($7 	imes 5 = 35$ units in 14 days) and allocate the remaining 1 unit specifically to the next active worker.

## 3. Ignoring Negative Rate of Leaks (Pipes & Cisterns)
*   **The Mistake:** Adding the emptying rate of a leak to the inlet rate.
*   **The Scenario:** Inlet fills in 6 hours, outlet empties in 12 hours. Candidates calculate combined time using $rac{1}{6} + rac{1}{12}$.
*   **The Fix:** Leak rates perform negative work. Net rate is $rac{1}{6} - rac{1}{12} = rac{1}{12} ightarrow 12$ hours.

## 4. Alternate Hour Cistern Filling Peak Trap
*   **The Mistake:** Over-counting cycles in alternating inlet-outlet operations.
*   **The Scenario:** Inlet fills +3 units, outlet empties -2 units. Total capacity is 30 units.
*   **The Fix:** On the final minute, the inlet will fill the remaining units and finish the job *before* the outlet can empty it. Always calculate the cycles up to (Capacity - Inlet rate) first.

## 5. Sharing Wages by Days Instead of Total Work done
*   **The Mistake:** Sharing wages strictly by days worked when efficiencies are different.
*   **The Scenario:** A (efficient) works 2 days and B (slow) works 3 days. Candidates share wages in ratio $2:3$.
*   **The Fix:** Wages must be shared in the ratio of **actual work completed** (Efficiency $	imes$ Days), not days alone.\n