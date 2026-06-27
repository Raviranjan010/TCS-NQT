# Time & Work — Worked Examples

This document contains 5 detailed worked examples representing common time-and-work questions in the TCS NQT.

---

## Example 1 — Alternate Days Work

### Problem Statement
A and B can complete a work in 12 days and 18 days respectively. If they work on alternate days starting with A, in how many days will the work be completed?

### Step-by-Step Solution

1.  **Find Total Work and Efficiencies:**
    *   Assume Total Work = LCM of 12 and 18 = 36 units.
    *   A's Efficiency = $36 / 12 = 3$ units per day.
    *   B's Efficiency = $36 / 18 = 2$ units per day.

2.  **Define the 2-Day Cycle:**
    *   Day 1 (A) = 3 units.
    *   Day 2 (B) = 2 units.
    *   Total work in a 2-day cycle = $3 + 2 = 5$ units.

3.  **Determine the Number of Complete Cycles:**
    *   We want to reach close to 36 units.
    *   Number of 5-unit cycles = $36 / 5 = 7$ cycles.
    *   Work completed in 7 cycles (14 days) = $7 	imes 5 = 35$ units.
    *   Remaining work = $36 - 35 = 1$ unit.

4.  **Allocate Remaining Work:**
    *   On the 15th day, A's turn arrives.
    *   A's efficiency is 3 units/day, and remaining work is 1 unit.
    *   Time taken by A = $1/3$ day.

5.  **Calculate Total Time:**
    *   Total Time = $14 + 1/3 = 14rac{1}{3}$ days.

### Final Answer
The work will be completed in **14 1/3 days**.

---

## Example 2 — Efficiency Changes

### Problem Statement
A is twice as efficient as B and can complete a job in 15 days less than B. In how many days can they complete the job together?

### Step-by-Step Solution

1.  **Define Efficiency and Time Ratios:**
    *   Efficiency ratio ($E_A : E_B$) = $2 : 1$.
    *   Since time and efficiency are inversely proportional, time ratio ($T_A : T_B$) = $1 : 2$.

2.  **Set up the Time Equation:**
    *   Let A take $x$ days and B take $2x$ days.
    *   Difference in time = $2x - x = x = 15$ days.
    *   Therefore, A takes 15 days and B takes 30 days.

3.  **Calculate Combined Time:**
    *   Total Work = LCM of 15 and 30 = 30 units.
    *   A's efficiency = 2 units/day, B's efficiency = 1 unit/day.
    *   Combined efficiency = 3 units/day.
    *   Combined Time = $30 / 3 = 10$ days.

### Final Answer
They can complete the job together in **10 days**.

---

## Example 3 — Cistern with a Leak

### Problem Statement
An inlet pipe can fill a tank in 8 hours. Due to a leak at the bottom, it takes 10 hours to fill the tank. In how many hours can the leak empty the full tank?

### Step-by-Step Solution

1.  **Define Rates using LCM:**
    *   Assume Tank Capacity = LCM of 8 and 10 = 40 units.
    *   Inlet rate = $40 / 8 = 5$ units/hour.
    *   Net rate (Inlet + Leak) = $40 / 10 = 4$ units/hour.

2.  **Calculate Leak Rate:**
    $$	ext{Net Rate} = 	ext{Inlet Rate} + 	ext{Leak Rate}$$
    $$4 = 5 + 	ext{Leak Rate} \implies 	ext{Leak Rate} = -1 	ext{ unit/hour}$$

3.  **Determine Emptying Time:**
    *   Time to empty full tank = $rac{	ext{Capacity}}{	ext{Leak Rate}} = rac{40}{1} = 40$ hours.

### Final Answer
The leak can empty the full tank in **40 hours**.

---

## Example 4 — Work and Wages Division

### Problem Statement
A, B, and C can do a work in 6, 8, and 12 days respectively. They complete the work together and receive a wage of 1,800 Rupees. Find B's share.

### Step-by-Step Solution

1.  **Find Total Work and Efficiencies:**
    *   Assume Total Work = LCM of 6, 8, and 12 = 24 units.
    *   A's Efficiency = $24 / 6 = 4$.
    *   B's Efficiency = $24 / 8 = 3$.
    *   C's Efficiency = $24 / 12 = 2$.

2.  **Define Wage Sharing Ratio:**
    *   Since they work for the same duration, wages are divided in the ratio of their efficiencies:
        $$A : B : C = 4 : 3 : 2$$
    *   Sum of ratio parts = $4 + 3 + 2 = 9$.

3.  **Calculate B's Share:**
    *   B's share = $rac{3}{9} 	imes 1800 = rac{1}{3} 	imes 1800 = 600$ Rupees.

### Final Answer
B's share of the wages is **600 Rupees**.

---

## Example 5 — Manpower Chain Rule

### Problem Statement
If 12 men can build a 120-meter wall in 6 days, how many men are needed to build a 200-meter wall in 5 days?

### Step-by-Step Solution

1.  **Apply the Chain Rule Formula:**
    $$rac{M_1 D_1}{W_1} = rac{M_2 D_2}{W_2}$$

2.  **Substitute the Variables:**
    *   $M_1 = 12$, $D_1 = 6$, $W_1 = 120$.
    *   $D_2 = 5$, $W_2 = 200$, $M_2$ is unknown.
    $$rac{12 	imes 6}{120} = rac{M_2 	imes 5}{200}$$

3.  **Simplify and Solve:**
    $$rac{72}{120} = rac{5 M_2}{200}$$
    $$rac{3}{5} = rac{M_2}{40}$$
    $$M_2 = rac{3 	imes 40}{5} = 3 	imes 8 = 24 	ext{ men}$$

### Final Answer
**24 men** are needed to complete the wall.\n