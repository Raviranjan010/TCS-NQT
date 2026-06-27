# Average — Previous Year Questions (PYQs)

*   **TCS NQT PYQ Bank:** Actual exam variations from 2021-2025.
*   **Assessment Goal:** Familiarity with TCS NQT language, data types, and scaling.

---

### PYQ1 — Average Age Exclusion
The average age of 24 students and their class teacher is 16 years. If the teacher's age is excluded, the average age decreases by 1 year. Find the age of the teacher.
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Initial: 25 people, average = 16. Sum = $25 \times 16 = 400$.
    *   New: 24 people, average = 15. Sum = $24 \times 15 = 360$.
    *   Teacher's Age = $400 - 360 = 40$ years.
*   **Faster Method:**
    *   Teacher's Age = $\text{Old Average} + (N - 1) \times (\text{Average Decrease}) = 16 + 24 \times 1 = 40$ years.

---

### PYQ2 — Equal Segment Speeds
A car travels a certain distance at 40 km/h and returns at 60 km/h. Find the average speed for the round trip.
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$v_{\text{avg}} = \frac{2 \times 40 \times 60}{40 + 60} = \frac{4800}{100} = 48 \text{ km/h}$$.
*   **Faster Method:**
    *   Using Harmonic Mean directly: $48$ km/h.

---

### PYQ3 — Corrected Average Error
The average marks of 50 students in an exam was 64. It was later found that the marks of two students were misread as 38 and 42 instead of 83 and 27. Find the correct average.
*   **Difficulty:** Medium | **Expected Time:** 90s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Original Sum = $50 \times 64 = 3200$.
    *   Difference = $(\text{Correct sum}) - (\text{Incorrect sum}) = (83 + 27) - (38 + 42) = 110 - 80 = 30$.
    *   Correct Sum = $3200 + 30 = 3230$.
    *   Correct Average = $3230 / 50 = 64.6$.
*   **Faster Method:**
    *   Net addition to sum $= +30$.
    *   Change in average $= +30 / 50 = +0.6$.
    *   Correct average $= 64 + 0.6 = 64.6$.

---

### PYQ4 — Consecutive Numbers Middle
The average of 9 consecutive numbers is 25. Find the largest of these numbers.
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Let the numbers be $x, x+1, \dots, x+8$.
    *   Average = $\frac{9x + 36}{9} = x + 4 = 25 \implies x = 21$.
    *   Largest number = $x + 8 = 29$.
*   **Faster Method:**
    *   Since there are 9 terms, the middle term is the 5th term $= 25$.
    *   Largest term (9th) $= 25 + 4 = 29$.

---

### PYQ5 — Weighted Student Average
The average score of 20 boys in a test is 80 and that of 30 girls is 90. Find the combined average.
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$\text{Combined Average} = \frac{20 \times 80 + 30 \times 90}{20 + 30} = \frac{1600 + 2700}{50} = \frac{4300}{50} = 86$$.
*   **Faster Method:**
    *   Ratio of counts is $2 : 3$.
    *   Weighted Average = $\frac{2 \times 80 + 3 \times 90}{5} = \frac{160 + 270}{5} = \frac{430}{5} = 86$.

---

### PYQ6 — Average Income Partition
The average income of A, B, and C is 12,000 Rupees, and the average income of B, C, and D is 15,000 Rupees. If D's income is 18,000 Rupees, find A's income.
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $A + B + C = 3 \times 12,000 = 36,000$.
    *   $B + C + D = 3 \times 15,000 = 45,000$.
    *   Since $D = 18,000 \implies B + C = 45,000 - 18,000 = 27,000$.
    *   $A = 36,000 - 27,000 = 9,000$ Rupees.
*   **Faster Method:**
    *   $D - A = 3 \times (15,000 - 12,000) = 9,000$.
    *   Since $D = 18,000 \implies A = 18,000 - 9,000 = 9,000$.

---

### PYQ7 — Replace Value Weights
The average weight of 10 students is 40 kg. If a new student weighing 50 kg replaces an old student, the new average becomes 41 kg. Find the weight of the replaced student.
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   Original Sum = 400. New Sum = 410.
    *   Weight increase = 10 kg.
    *   Since the new student weighs 50 kg, the replaced student must weigh $50 - 10 = 40$ kg.
*   **Faster Method:**
    *   $$\text{Weight Increase} = N \times (\Delta A) = 10 \times 1 = 10 \text{ kg}$$.
    *   Replaced weight = $50 - 10 = 40$ kg.

---

### PYQ8 — Temperature Bounds
The average temperature of Monday, Tuesday, and Wednesday was 37 °C, and that of Tuesday, Wednesday, and Thursday was 34 °C. If Thursday's temperature was 4/5 of Monday's, find Thursday's temperature.
*   **Difficulty:** Hard | **Expected Time:** 120s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $M + T + W = 111$.
    *   $T + W + Th = 102$.
    *   $M - Th = 9$.
    *   Since $Th = \frac{4}{5}M \implies M - \frac{4}{5}M = 9 \implies \frac{1}{5}M = 9 \implies M = 45$.
    *   $Th = \frac{4}{5} \times 45 = 36 \text{ °C}$.
*   **Faster Method:**
    *   Difference of 1 part in ratio $5:4$ corresponds to 9 °C. Therefore, 4 parts $= 36$ °C.

---

### PYQ9 — Arithmetic Series Averages
What is the average of consecutive numbers from 51 to 100?
*   **Difficulty:** Easy | **Expected Time:** 20s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   $$\text{Average} = \frac{51 + 100}{2} = 75.5$$.
*   **Faster Method:**
    *   Immediate midpoint check: 75.5.

---

### PYQ10 — Exclusion average drops
The average age of 12 employees is 32 years. If the manager leaves, the average drops by 2 years. Find the manager's age.
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Initial Sum = $12 \times 32 = 384$.
    *   New Sum = $11 \times 30 = 330$.
    *   Manager's Age = $384 - 330 = 54$ years.
*   **Faster Method:**
    *   $$\text{Manager's Age} = \text{Old Average} + (N - 1) \times (\text{Average Drop}) = 32 + 11 \times 2 = 54 \text{ years}$$.

---

### PYQ11 — Speed in equal time
A runner runs at 12 km/h for 1 hour and at 18 km/h for the next hour. Find the average speed.
*   **Difficulty:** Easy | **Expected Time:** 20s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   $$\text{Average Speed} = \frac{\text{Total Distance}}{\text{Total Time}} = \frac{12 + 18}{2} = 15 \text{ km/h}$$.
*   **Faster Method:**
    *   Since time intervals are equal, average speed is the arithmetic mean: $(12 + 18) / 2 = 15$.

---

### PYQ12 — Combined Class Weights
A class of 40 students has an average weight of 50 kg, and another class of 60 students has an average weight of 55 kg. Find the combined average.
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$\text{Combined Average} = \frac{40 \times 50 + 60 \times 55}{40 + 60} = \frac{2000 + 3300}{100} = 53 \text{ kg}$$.
*   **Faster Method:**
    *   Ratio of students is $2:3$.
    *   Average = $\frac{2(50) + 3(55)}{5} = \frac{100 + 165}{5} = 53$.

---

### PYQ13 — Out of 5 numbers average
The average of 5 numbers is 20. The average of the first two is 15 and that of the last two is 22. Find the third number.
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Total Sum = 100.
    *   Sum of first two = 30. Sum of last two = 44.
    *   Third number = $100 - (30 + 44) = 26$.
*   **Faster Method:**
    *   $100 - 74 = 26$.

---

### PYQ14 — Excluded element sum
The average of 8 numbers is 20. If one number is excluded, the average becomes 18. Find the excluded number.
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Initial Sum = 160. New Sum = 126.
    *   Excluded = $160 - 126 = 34$.
*   **Faster Method:**
    *   $\text{Excluded} = 20 + 7 \times 2 = 34$.

---

### PYQ15 — Ten consecutive evens
Find the average of the first 10 consecutive even numbers.
*   **Difficulty:** Easy | **Expected Time:** 15s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   $$\text{Average} = n + 1 = 10 + 1 = 11$$.
*   **Faster Method:**
    *   Middle of 2, 4, 6, 8, 10, 12, 14, 16, 18, 20 is 11.
