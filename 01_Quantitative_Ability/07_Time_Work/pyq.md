# Time & Work — Previous Year Questions (PYQs)

*   **TCS NQT PYQ Bank:** Actual exam variations from 2021-2025.
*   **Assessment Goal:** Familiarity with TCS NQT language, data types, and scaling.

---

### PYQ1 — Alternating Assistance
A can do a work in 20 days, B in 30 days, and C in 60 days. If A is assisted by B and C on every third day, find the total time taken to complete the work.
*   **Difficulty:** Hard | **Expected Time:** 120s | **TCS Frequency:** High
*   **Standard Solution:**
    *   LCM $= 60$. Efficiencies: A = 3, B = 2, C = 1.
    *   Day 1: A works $= 3$ units.
    *   Day 2: A works $= 3$ units.
    *   Day 3: A+B+C work $= 6$ units.
    *   Total work in a 3-day cycle $= 3 + 3 + 6 = 12$ units.
    *   Number of cycles $= 60 / 12 = 5$ cycles.
    *   Total Time $= 5 	imes 3 = 15$ days.
*   **Faster Method:**
    *   Since 12 units in 3 days, $12 	imes 5 = 60$ in $3 	imes 5 = 15$ days.

---

### PYQ2 — Cistern Inlet Outlet
An inlet pipe can fill a tank in 15 hours and a leak can empty it in 20 hours. Find the net time to fill.
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$	ext{Time} = rac{15 	imes 20}{20 - 15} = rac{300}{5} = 60 	ext{ hours}$$.
*   **Faster Method:**
    *   Using LCM $= 60$: Inlet $= +4$, Leak $= -3 \implies$ Net $= +1 \implies 60$ hours.

---

### PYQ3 — Efficiency differences
A is $20\%$ less efficient than B. If B can complete a work in 24 days, in how many days can A do it?
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $E_A : E_B = 80 : 100 = 4 : 5 \implies T_A : T_B = 5 : 4$.
    *   Since $T_B = 24 \implies T_A = rac{5}{4} 	imes 24 = 30$ days.
*   **Faster Method:**
    *   $24 / 0.80 = 30$ days.

---

### PYQ4 — Alternating Days Time
A can do a work in 10 days and B in 20 days. If they work on alternate days starting with A, find total days.
*   **Difficulty:** Medium | **Expected Time:** 90s | **TCS Frequency:** High
*   **Standard Solution:**
    *   LCM $= 20$. A = 2, B = 1.
    *   2-day cycle $= 3$ units. In 12 days $= 18$ units.
    *   Remaining $= 2$ units. Day 13 (A turn) completes $= 2$ units $\implies 13$ days.
*   **Faster Method:**
    *   6 cycles $= 12$ days (18 units). Day 13 (A turn) does remaining 2 units $\implies 13$ days.

---

### PYQ5 — Chain Rule Man days
If 30 men can complete a project in 24 days working 8 hours a day, in how many days can 18 men do it working 10 hours a day?
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$30 	imes 24 	imes 8 = 18 	imes D_2 	imes 10 \implies 5760 = 180 D_2 \implies D_2 = 32 	ext{ days}$$.
*   **Faster Method:**
    *   $rac{30 	imes 24 	imes 8}{180} = 32$ days.

---

### PYQ6 — Wages distribution
A and B do a work for 1,200 Rupees. A alone can do it in 8 days, B in 12 days. Find B's share if they work together.
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Ratio of rates $= A:B = 1/8 : 1/12 = 3 : 2$.
    *   B's share $= rac{2}{5} 	imes 1200 = 480$ Rupees.
*   **Faster Method:**
    *   $1200 	imes 0.40 = 480$.

---

### PYQ7 — Leak emptied
A pipe fills a tank in 10 hours. Due to a leak, it fills in 12 hours. How long for the leak to empty it?
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$	ext{Time} = rac{10 	imes 12}{12 - 10} = 60 	ext{ hours}$$.
*   **Faster Method:**
    *   $120 / 2 = 60$.

---

### PYQ8 — Three workers combined
A, B, and C do a work in 8, 12, and 16 days. If they work together, how many days will they take?
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   LCM $= 48$. Rates: A = 6, B = 4, C = 3. Sum $= 13$.
    *   Time $= 48 / 13 pprox 3.69$ days.
*   **Faster Method:**
    *   $48 / 13 = 3rac{9}{13}$ days.

---

### PYQ9 — Left early days
A can do a work in 14 days, B in 21 days. They work together but A leaves 3 days before completion. Find total days.
*   **Difficulty:** Hard | **Expected Time:** 120s | **TCS Frequency:** High
*   **Standard Solution:**
    *   LCM $= 42$. A = 3, B = 2.
    *   $3(x-3) + 2x = 42$ ? Wait, A leaves 3 days before, so A works $x-3$ days, B works $x$ days.
    *   $$3(x-3) + 2x = 42 \implies 5x - 9 = 42 \implies 5x = 51 \implies x = 10.2 	ext{ days}$$.
*   **Faster Method:**
    *   $51 / 5 = 10.2$ days.

---

### PYQ10 — Alternate inlet outlet cisterns
An inlet fills in 10 mins, outlet empties in 15 mins. If opened on alternate minutes, how long to fill?
*   **Difficulty:** Hard | **Expected Time:** 120s | **TCS Frequency:** Low
*   **Standard Solution:**
    *   LCM $= 30$. Inlet $= +3$, Outlet $= -2$.
    *   2-min cycle $= +1$ unit.
    *   We want to reach close to $30 - 3 = 27$ units.
    *   In 27 cycles (54 mins) $= 27$ units.
    *   Min 55 (Inlet turn): fills remaining 3 units $\implies 55$ minutes.
*   **Faster Method:**
    *   $2 	imes 27 + 1 = 55$ mins.

---

### PYQ11 — Labor efficiency ratio
If 8 men can reap a field in 12 days, in how many days can 6 women do it if $2M = 3W$?
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $2M = 3W \implies 8M = 12W$.
    *   $12W$ in 12 days $ightarrow 6W$ in 24 days.
*   **Faster Method:**
    *   Half manpower takes double time $ightarrow 12 	imes 2 = 24$ days.

---

### PYQ12 — Combined worker days
A and B together can do a work in 9 days. If A alone takes 18 days, find B alone.
*   **Difficulty:** Easy | **Expected Time:** 20s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$B = rac{9 	imes 18}{18 - 9} = 18 	ext{ days}$$.
*   **Faster Method:**
    *   Since A takes double the combined time, B must be equal in efficiency $ightarrow 18$ days.

---

### PYQ13 — Remaining work fraction
A does a work in 8 days, B in 12 days. They work together for 3 days. What fraction remains?
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   LCM $= 24$. A = 3, B = 2. Work in 3 days $= 3 	imes 5 = 15$.
    *   Remaining $= 9$ units $ightarrow$ Fraction $= 9 / 24 = 3/8$.
*   **Faster Method:**
    *   $15/24 = 5/8$ done $ightarrow 3/8$ left.

---

### PYQ14 — Alternate hours fill
An inlet A fills in 12 hours, B fills in 18 hours. If opened in alternate hours starting with A, find total hours.
*   **Difficulty:** Medium | **Expected Time:** 90s | **TCS Frequency:** High
*   **Standard Solution:**
    *   LCM $= 36$. A = 3, B = 2.
    *   2-hour cycle $= 5$ units. In 14 hours $= 35$ units. Remaining $= 1$ unit.
    *   Hour 15 (A turn) takes $1/3$ hour $ightarrow 14rac{1}{3}$ hours.
*   **Faster Method:**
    *   7 cycles $= 14$ hours. Day 15 (A) $= 1/3 ightarrow 14.33$ hours.

---

### PYQ15 — Simple worker rate
If 5 men can complete a project in 20 days, how many men are needed to do it in 4 days?
*   **Difficulty:** Easy | **Expected Time:** 20s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $5 	imes 20 = M_2 	imes 4 \implies M_2 = 25$ men.
*   **Faster Method:**
    *   $100 / 4 = 25$.\n