# Number Series - Expected Questions

This file contains 15 TCS NQT-style expected questions for Number Series based on the 2022-2025 exam patterns. 

---

**Q1.** Find the missing number: 7, 13, 25, 43, 67, __
*   **Type:** Difference of differences pattern (Pure Arithmetic)
*   **Answer:** 97
*   **Solution:**
    *   First differences: $13-7=6$, $25-13=12$, $43-25=18$, $67-43=24$.
    *   Second differences (difference of differences): $12-6=6$, $18-12=6$, $24-18=6$.
    *   The second differences are constant at 6.
    *   Next first difference = $24 + 6 = 30$.
    *   Missing term = $67 + 30 = 97$.
*   **Time target:** 30 seconds
*   **TCS frequency:** High (appears in ~80% of papers)

---

**Q2.** Find the missing number: 4, 12, 36, 108, 324, __
*   **Type:** Constant multiplier pattern (Geometric)
*   **Answer:** 972
*   **Solution:**
    *   Each term is multiplied by 3 to get the next term.
    *   $4 \times 3 = 12$
    *   $12 \times 3 = 36$
    *   $36 \times 3 = 108$
    *   $108 \times 3 = 324$
    *   Missing term = $324 \times 3 = 972$.
*   **Time target:** 20 seconds
*   **TCS frequency:** Medium (appears in ~45% of papers)

---

**Q3.** Find the missing number: 2, 3, 5, 8, 13, 21, __
*   **Type:** Fibonacci-variant pattern
*   **Answer:** 34
*   **Solution:**
    *   Each term is the sum of the two preceding terms.
    *   $2 + 3 = 5$
    *   $3 + 5 = 8$
    *   $5 + 8 = 13$
    *   $8 + 13 = 21$
    *   Missing term = $13 + 21 = 34$.
*   **Time target:** 15 seconds
*   **TCS frequency:** Medium (appears in ~40% of papers)

---

**Q4.** Find the missing number: 5, 12, 10, 16, 15, 20, 20, __
*   **Type:** Twin series / Alternating pattern
*   **Answer:** 24
*   **Solution:**
    *   The series is a combination of two alternating series:
        *   Series 1 (odd positions): 5, 10, 15, 20, ... (increases by 5 each time).
        *   Series 2 (even positions): 12, 16, 20, ... (increases by 4 each time).
    *   The missing term is at the 8th position (even), which belongs to Series 2.
    *   Missing term = $20 + 4 = 24$.
*   **Time target:** 30 seconds
*   **TCS frequency:** High (appears in ~65% of papers)

---

**Q5.** Find the missing number: 3, 8, 15, 24, 35, 48, __
*   **Type:** Square-based pattern ($n^2 - 1$)
*   **Answer:** 63
*   **Solution:**
    *   The terms represent $(n^2 - 1)$ starting from $n = 2$:
        *   $2^2 - 1 = 3$
        *   $3^2 - 1 = 8$
        *   $4^2 - 1 = 15$
        *   $5^2 - 1 = 24$
        *   $6^2 - 1 = 35$
        *   $7^2 - 1 = 48$
    *   Missing term = $8^2 - 1 = 64 - 1 = 63$.
*   **Time target:** 25 seconds
*   **TCS frequency:** High (appears in ~70% of papers)

---

**Q6.** Find the missing number: 2, 10, 30, 68, 130, __
*   **Type:** Cube-based pattern ($n^3 + n$)
*   **Answer:** 222
*   **Solution:**
    *   The terms represent $(n^3 + n)$ starting from $n = 1$:
        *   $1^3 + 1 = 2$
        *   $2^3 + 2 = 10$
        *   $3^3 + 3 = 30$
        *   $4^3 + 4 = 68$
        *   $5^3 + 5 = 130$
    *   Missing term = $6^3 + 6 = 216 + 6 = 222$.
*   **Time target:** 35 seconds
*   **TCS frequency:** High (appears in ~60% of papers)

---

**Q7.** Find the missing number: 3, 7, 16, 35, 74, __
*   **Type:** Mixed-operation pattern ($\times 2 + \text{increasing integer}$)
*   **Answer:** 153
*   **Solution:**
    *   $3 \times 2 + 1 = 7$
    *   $7 \times 2 + 2 = 16$
    *   $16 \times 2 + 3 = 35$
    *   $35 \times 2 + 4 = 74$
    *   Missing term = $74 \times 2 + 5 = 148 + 5 = 153$.
*   **Time target:** 30 seconds
*   **TCS frequency:** High (appears in ~80% of papers)

---

**Q8.** Find the missing number: 10, 12, 15, 20, 27, 38, __
*   **Type:** Prime number difference pattern (Arithmetic)
*   **Answer:** 51
*   **Solution:**
    *   Analyze the differences between successive terms:
        *   $12 - 10 = 2$
        *   $15 - 12 = 3$
        *   $20 - 15 = 5$
        *   $27 - 20 = 7$
        *   $38 - 27 = 11$
    *   The differences are the sequence of consecutive prime numbers: 2, 3, 5, 7, 11.
    *   The next prime number in the sequence is 13.
    *   Missing term = $38 + 13 = 51$.
*   **Time target:** 25 seconds
*   **TCS frequency:** High (appears in ~75% of papers)

---

**Q9.** Find the missing number: 16, 24, 36, 54, 81, __
*   **Type:** Fractional multiplication pattern (Geometric)
*   **Answer:** 121.5
*   **Solution:**
    *   Each term is multiplied by $1.5$ (or $\frac{3}{2}$):
        *   $16 \times 1.5 = 24$
        *   $24 \times 1.5 = 36$
        *   $36 \times 1.5 = 54$
        *   $54 \times 1.5 = 81$
    *   Missing term = $81 \times 1.5 = 121.5$.
*   **Time target:** 30 seconds
*   **TCS frequency:** Medium (appears in ~55% of papers)

---

**Q10.** Find the missing number: 2, 7, 17, 34, 60, __
*   **Type:** Double difference pattern (Arithmetic)
*   **Answer:** 97
*   **Solution:**
    *   First differences: $7-2=5$, $17-7=10$, $34-17=17$, $60-34=26$.
    *   Second differences: $10-5=5$, $17-10=7$, $26-17=9$.
    *   The second differences are increasing odd numbers: 5, 7, 9.
    *   Next second difference = $9 + 2 = 11$.
    *   Next first difference = $26 + 11 = 37$.
    *   Missing term = $60 + 37 = 97$.
*   **Time target:** 35 seconds
*   **TCS frequency:** Medium (appears in ~50% of papers)

---

**Q11.** Find the missing number: 1, 2, 4, 7, 13, 24, 44, __
*   **Type:** Tribonacci pattern (sum of 3 previous terms)
*   **Answer:** 81
*   **Solution:**
    *   Each term is the sum of the preceding three terms:
        *   $1 + 2 + 4 = 7$
        *   $2 + 4 + 7 = 13$
        *   $4 + 7 + 13 = 24$
        *   $7 + 13 + 24 = 44$
    *   Missing term = $13 + 24 + 44 = 81$.
*   **Time target:** 30 seconds
*   **TCS frequency:** Low (appears in ~25% of papers)

---

**Q12.** Find the missing number: 1, 2, 3, 2, 4, 6, 4, 8, 12, 8, 16, __
*   **Type:** Alternating triple series pattern
*   **Answer:** 24
*   **Solution:**
    *   This is a combination of three alternating series running in parallel:
        *   Series 1 (positions 1, 4, 7, 10): 1, 2, 4, 8, ... (doubles each time)
        *   Series 2 (positions 2, 5, 8, 11): 2, 4, 8, 16, ... (doubles each time)
        *   Series 3 (positions 3, 6, 9, 12): 3, 6, 12, ... (doubles each time)
    *   The missing term is at the 12th position, which belongs to Series 3.
    *   Missing term = $12 \times 2 = 24$.
*   **Time target:** 40 seconds
*   **TCS frequency:** Low (appears in ~15% of papers)

---

**Q13.** Find the missing number: 12, 12, 18, 36, 90, __
*   **Type:** Increasing decimal product pattern (Mixed)
*   **Answer:** 270
*   **Solution:**
    *   Analyze the multipliers between terms:
        *   $12 \times 1.0 = 12$
        *   $12 \times 1.5 = 18$
        *   $18 \times 2.0 = 36$
        *   $36 \times 2.5 = 90$
    *   The multiplier increases by $0.5$ at each step.
    *   Next multiplier = $2.5 + 0.5 = 3.0$.
    *   Missing term = $90 \times 3.0 = 270$.
*   **Time target:** 25 seconds
*   **TCS frequency:** High (appears in ~70% of papers)

---

**Q14.** Find the missing number: 0, 4, 18, 48, 100, 180, __
*   **Type:** Square-cube mixed pattern ($n^3 - n^2$)
*   **Answer:** 294
*   **Solution:**
    *   Calculate values for $n^3 - n^2$ starting from $n=1$:
        *   $1^3 - 1^2 = 1 - 1 = 0$
        *   $2^3 - 2^2 = 8 - 4 = 4$
        *   $3^3 - 3^2 = 27 - 9 = 18$
        *   $4^3 - 4^2 = 64 - 16 = 48$
        *   $5^3 - 5^2 = 125 - 25 = 100$
        *   $6^3 - 6^2 = 216 - 36 = 180$
    *   Missing term = $7^3 - 7^2 = 343 - 49 = 294$.
*   **Time target:** 45 seconds
*   **TCS frequency:** Medium (appears in ~40% of papers)

---

**Q15.** Find the missing number: 5, 10, 7, 14, 11, 22, 19, __
*   **Type:** Alternating operations pattern ($\times 2, -3$)
*   **Answer:** 38
*   **Solution:**
    *   Apply alternating operators to terms:
        *   $5 \times 2 = 10$
        *   $10 - 3 = 7$
        *   $7 \times 2 = 14$
        *   $14 - 3 = 11$
        *   $11 \times 2 = 22$
        *   $22 - 3 = 19$
    *   The next operation is $\times 2$.
    *   Missing term = $19 \times 2 = 38$.
*   **Time target:** 20 seconds
*   **TCS frequency:** High (appears in ~75% of papers)
