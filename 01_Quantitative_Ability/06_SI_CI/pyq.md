# Simple & Compound Interest — Previous Year Questions (PYQs)

*   **TCS NQT PYQ Bank:** Actual exam variations from 2021-2025.
*   **Assessment Goal:** Familiarity with TCS NQT language, data types, and scaling.

---

### PYQ1 — Compounding Periods
Find the compound interest on 10,000 Rupees for 1 year at $10\%$ per annum compounded half-yearly.
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Adjusted rate $= 5\%$. Periods $= 2$.
    *   $$A = 10000 	imes (1.05)^2 = 10000 	imes 1.1025 = 11025 	ext{ Rupees}$$.
    *   $CI = 1025$ Rupees.
*   **Faster Method:**
    *   Effective rate $= 5 + 5 + 0.25 = 10.25\%$.
    *   $CI = 10.25\% 	ext{ of } 10,000 = 1,025$ Rupees.

---

### PYQ2 — Installment repays
A loan of 16,400 Rupees is to be repaid in two equal annual installments at $5\%$ compound interest. Find the annual installment.
*   **Difficulty:** Hard | **Expected Time:** 120s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Compounding factor $= 1.05 = rac{21}{20}$.
    *   $$16400 = x \left(rac{20}{21} + rac{400}{441}ight) = x \left(rac{820}{441}ight) \implies x = rac{16400 	imes 441}{820} = 20 	imes 441 = 8820 	ext{ Rupees}$$.
*   **Faster Method:**
    *   Since $16400 = 820 	imes 20$, the installment is $20 	imes 441 = 8820$ Rupees.

---

### PYQ3 — Sum doubling speed
A sum of money invested at simple interest triples itself in 12 years. In how many years will it become 5 times itself?
*   **Difficulty:** Easy | **Expected Time:** 45s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Sum $= 3P ightarrow SI = 2P$ in 12 years $\implies$ Interest of $P$ takes 6 years.
    *   We want sum to become $5P ightarrow SI = 4P$.
    *   Time required $= 4 	imes 6 = 24$ years.
*   **Faster Method:**
    *   Linear scaling: double interest takes double time $ightarrow 12 	imes 2 = 24$ years.

---

### PYQ4 — SI-CI Difference 2 Years
The difference between the simple interest and compound interest on a sum for 2 years at $10\%$ per annum is 50 Rupees. Find the sum.
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$50 = P \left(rac{10}{100}ight)^2 = 0.01P \implies P = 5000$ Rupees.
*   **Faster Method:**
    *   Since difference is $1\%$ of principal, Principal $= 50 	imes 100 = 5000$ Rupees.

---

### PYQ5 — Compounding double rate
A sum compounded annually grows to 1.21 times itself in 2 years. Find the rate of interest.
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$(1 + R/100)^2 = 1.21 \implies 1 + R/100 = 1.10 \implies R = 10\%$$.
*   **Faster Method:**
    *   $\sqrt{1.21} = 1.10 ightarrow 10\%$ rate.

---

### PYQ6 — Compound double sum period
If a sum compounded annually doubles in 4 years, in how many years will it become 4 times itself?
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $P ightarrow 2P$ in 4 years.
    *   $2P ightarrow 4P$ in another 4 years (total 8 years).
*   **Faster Method:**
    *   $2^2 = 4 ightarrow 2 	imes 4 = 8$ years.

---

### PYQ7 — Simple interest rate finding
At what simple interest rate per annum will 400 Rupees yield 120 Rupees interest in 5 years?
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$120 = rac{400 	imes R 	imes 5}{100} = 20R \implies R = 6\%$$.
*   **Faster Method:**
    *   Interest $= 30\%$ of principal in 5 years $ightarrow 6\%$ per year.

---

### PYQ8 — Three Year Difference Tag
The difference between SI and CI on a sum for 3 years at $5\%$ per annum is 12.20 Rupees. Find the principal.
*   **Difficulty:** Medium | **Expected Time:** 90s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$D_3 = P \left(rac{5}{100}ight)^2 \left(rac{305}{100}ight) = 12.20 \implies P 	imes rac{25}{10000} 	imes 3.05 = 12.20$$.
    *   $$P 	imes 0.007625 = 12.20 \implies P = rac{12.20}{0.007625} = 1600 	ext{ Rupees}$$.
*   **Faster Method:**
    *   Since $D_2 = P 	imes 0.0025$, for $P=1600 ightarrow D_2 = 4 ightarrow D_3 = 4 	imes 3.05 = 12.20$. Marks 1600 directly.

---

### PYQ9 — Nominal half yearly rate
Find the effective rate of interest corresponding to a nominal rate of $12\%$ per annum compounded half-yearly.
*   **Difficulty:** Easy | **Expected Time:** 30s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$	ext{Effective Rate} = 6 + 6 + rac{36}{100} = 12.36\%$$.
*   **Faster Method:**
    *   Successive change of $6\%$ twice is $12.36\%$.

---

### PYQ10 — Interest sum divide
A sum of money amounts to 900 Rupees in 3 years and to 1050 Rupees in 6 years at simple interest. Find the principal.
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** High
*   **Standard Solution:**
    *   Interest for 3 years $= 1050 - 900 = 150 \implies 50$ per year.
    *   Principal $= 900 - 3(50) = 750$ Rupees.
*   **Faster Method:**
    *   Principal $= 900 - 150 = 750$.

---

### PYQ11 — Double compound sum
In how many years will a sum of 800 Rupees become 926.10 Rupees at $10\%$ per annum compounded half-yearly?
*   **Difficulty:** Medium | **Expected Time:** 90s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   Rate $= 5\%$.
    *   $$rac{926.10}{800} = 1.157625 = (1.05)^3 \implies 3 	ext{ half-years} = 1.5 	ext{ years}$$.
*   **Faster Method:**
    *   $1.05^3 ightarrow 3$ compounding periods $= 1.5$ years.

---

### PYQ12 — Simple interest period
In how many years will a sum of money double at $5\%$ per annum simple interest?
*   **Difficulty:** Easy | **Expected Time:** 20s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$T = 100 / 5 = 20 	ext{ years}$$.
*   **Faster Method:**
    *   $100\% / 5\% = 20$.

---

### PYQ13 — CI rate find double
A sum of money amounts to 6,000 Rupees in 2 years and to 7,986 Rupees in 5 years at compound interest. Find the rate of interest.
*   **Difficulty:** Hard | **Expected Time:** 120s | **TCS Frequency:** Low
*   **Standard Solution:**
    *   $$rac{7986}{6000} = 1.331 = (1.10)^3 \implies R = 10\%$$.
*   **Faster Method:**
    *   $1.331$ ratio indicates $10\%$ rate over 3 years.

---

### PYQ14 — Quarter compound rate
Find the compound interest on 20,000 Rupees for 6 months at $20\%$ per annum compounded quarterly.
*   **Difficulty:** Medium | **Expected Time:** 60s | **TCS Frequency:** Medium
*   **Standard Solution:**
    *   Rate per quarter $= 5\%$. Periods $= 2$.
    *   $$CI = 20000 	imes 0.1025 = 2050 	ext{ Rupees}$$.
*   **Faster Method:**
    *   Effective rate $= 10.25\%$. $20000 	imes 0.1025 = 2050$.

---

### PYQ15 — Simple principal sum
What sum of money will yield 500 Rupees simple interest in 2 years at $5\%$ per annum?
*   **Difficulty:** Easy | **Expected Time:** 20s | **TCS Frequency:** High
*   **Standard Solution:**
    *   $$500 = rac{P 	imes 10}{100} \implies P = 5000$ Rupees.
*   **Faster Method:**
    *   $10\% ightarrow 500 \implies 100\% ightarrow 5000$.\n