# Time & Work — Tricks & Traps

This guide focuses on option estimation, bounds check, and avoiding common traps in time-and-work problems.

---

## 1. Option Bounding & Estimation

### The "Combined Time Bound" Rule
When two people work together, the time taken to complete the task *must* be strictly less than half of the time taken by the slower worker, and less than the time taken by the faster worker:
$$T_{AB} < 	ext{Time taken by faster worker}$$
*   **The Trick:** If A takes 10 days and B takes 30 days, the combined time *must* be less than 10 days.
*   **Application:** Eliminate any options that are $\ge 10$ days.

### The "Equal Contribution" Midpoint
*   If A and B have equal efficiency, they would take exactly half of A's time.
*   If B is slower, they will take more than half of A's time but less than A's time.
*   **Application:** If A takes 10 days and B is slower, the combined time is between 5 and 10 days.

---

## 2. Pipes & Cisterns Traps

### Trap 1: Forgetting the Negative Rate of Leaks
*   **The Trap:** Adding leak rates to inlet rates arithmetically ($R_{	ext{in}} + R_{	ext{leak}}$).
*   **The Fix:** Leak rate is negative. Net Rate $= R_{	ext{in}} - R_{	ext{leak}}$.

### Trap 2: Alternating Inlet and Outlet
*   **The Trap:** Calculating alternate hours for inlet and outlet by just dividing the 2-hour net work.
*   **The Fix:** Near the top of the tank, the inlet will fill the tank *before* the outlet can empty it. Calculate the net fill until (Total Capacity - Inlet Capacity) first.\n