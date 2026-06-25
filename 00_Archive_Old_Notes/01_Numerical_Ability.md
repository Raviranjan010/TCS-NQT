# TCS NQT 2026 — Numerical Ability
### Complete Preparation Guide · Exam: June 28, 2026

> **Section Stats:** 20 Questions · 25 Minutes · ~75 sec/question · No Negative Marking
> 
> **Non-MCQ Rule:** Type whole numbers only — no `%`, `₹`, `km`, or any symbols.

---

## 🗺️ Arithmetic Formula Decision Tree

```
                          Select Arithmetic Topic
                                     |
         +-------------+-------------+-------------+-------------+
         |             |                           |             |
         v             v                           v             v
    Percentages   Profit & Loss                  Interest    Time & Work
         |             |                           |             |
    Successive?     Faulty weight?             CI vs SI?     Combined?
     x+y+xy/100     Error/(True-Err)          P(R/100)^2       Use LCM
```

---

# BLOCK A — Arithmetic

---

## 1. Percentages ⭐

### What is this?
Percentages express a value as a fraction of 100. TCS NQT tests successive changes, population growth, and base changes.

### Why does TCS ask this?
It tests your ability to handle composite interest-like growth rates and compound base shifts.

### How do I recognize it?
Look for terms like "successive changes", "increase then decrease", or "net change".

### Key Formulas & Derivations

* **Formula 1: Net Successive Change**
  $$\text{Net Change} = x + y + \frac{xy}{100}\%$$
  * *Derivation*: Let initial value be 100. First change $x\%$ gives $100(1 + x/100) = 100 + x$. Second change $y\%$ gives $(100 + x)(1 + y/100) = 100 + x + y + xy/100$. Subtracting initial 100 leaves $x + y + xy/100\%$.
  * *Worked Example*: A price rises 10% and then falls 10%. Find net change.
    * *Solution*: $x=10, y=-10$. Net $= 10 - 10 + \frac{10 \times (-10)}{100} = -1\% \implies 1\%$ decrease.
  * *Shortcut Demo*: Multiplying Factors: $1.10 \times 0.90 = 0.99 \implies 1\%$ net decrease.

* **Formula 2: Base Adjustment**
  $$\text{If A is } x\% \text{ more than B, B is less than A by } \frac{x}{100+x} \times 100\%$$
  * *Derivation*: Let $B = 100$. Then $A = 100 + x$. The difference is $x$. Percentage less relative to $A$ is $\frac{x}{A} \times 100\% = \frac{x}{100+x} \times 100\%$.
  * *Worked Example*: If A is 25% more than B, find by how much percent B is less than A.
    * *Solution*: $\frac{25}{125} \times 100\% = 20\%$.
  * *Shortcut Demo*: Using fractions: $25\% = \frac{1}{4}$ increase $\implies$ decrease is $\frac{1}{4+1} = \frac{1}{5} = 20\%$.

### ⚠️ Common Trap
Adding percentages directly ($10\% - 10\% = 0\%$). **Avoid this!** Always use successive change formulas or multipliers.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** A town's population increases by 10% in Year 1 and decreases by 10% in Year 2. If the current population is 9,900, what was it 2 years ago?
* **Pattern ID**: Perc-Successive-01
* **Approach**: Let original population be $P$. Apply successive multiplying factors: $P \times 1.1 \times 0.9 = 9,900$. Solve for $P$.
* **Solution**: 
  $$P \times 0.99 = 9,900 \implies P = \frac{9,900}{0.99} = 10,000$$
* **Shortcut**: Successive change of $+10\%$ and $-10\%$ is a net $1\%$ decrease. Thus $99\%$ of $P = 9,900 \implies P = 10,000$.
* **Variation & Trap**: The trap is assuming $+10\%$ and $-10\%$ cancel out to give no change, leading to incorrect answer $9,900$.

---

## 2. Profit & Loss ⭐

### What is this?
Calculating financial gain or loss relative to the cost price of goods.

### Why does TCS ask this?
Tests compound profit calculations and understanding of fractional cheating methods (faulty weights).

### How do I recognize it?
Trigger words: "faulty weight", "marked price", "successive discounts".

### Key Formulas & Derivations

* **Formula 1: Faulty Weight Profit**
  $$\text{Profit \%} = \frac{\text{Error}}{\text{True Weight} - \text{Error}} \times 100\%$$
  * *Derivation*: If a dealer gives $W_f$ instead of $W_t$, the cost incurred is only for $W_f$ grams, while selling price corresponds to $W_t$ grams. Profit $= W_t - W_f$. Profit $\%$ relative to CP (which corresponds to $W_f$) is $\frac{W_t - W_f}{W_f} \times 100\% = \frac{\text{Error}}{\text{True} - \text{Error}} \times 100\%$.
  * *Worked Example*: A merchant uses 800g instead of 1kg. Find profit %.
    * *Solution*: Error $= 200$, True $= 1000$. Profit $\% = \frac{200}{800} \times 100\% = 25\%$.
  * *Shortcut Demo*: Profit Ratio $= \frac{1000}{800} = \frac{5}{4} \implies 25\%$ profit.

---

### PYQ-Style Questions

**Q1.** A shopkeeper marks his goods 20% above the cost price and then allows a discount of 10%. Find his net profit percentage.
* **Pattern ID**: PL-Markup-01
* **Approach**: Let CP $= 100$. Mark price MP $= 120$. SP $= 120 \times 0.9 = 108$. Calculate profit $\%$.
* **Solution**: 
  $$\text{SP} = 108 \implies \text{Profit} = 8\%$$
* **Shortcut**: Use successive changes: $+20$ and $-10 \implies 20 - 10 - \frac{20 \times 10}{100} = 8\%$.
* **Variation & Trap**: Forgetting that discount is applied to MP, not CP.

---

## 3. Simple & Compound Interest ⭐

### What is this?
Linear vs. exponential compounding of financial balances over time.

### Why does TCS ask this?
Requires rapid calculation of multi-year compound interest differences.

### Key Formulas & Derivations

* **Formula 1: CI − SI Difference (2 Years)**
  $$\text{Diff}_2 = P \left(\frac{R}{100}\right)^2$$
  * *Derivation*: $SI_2 = \frac{2PR}{100}$. $CI_2 = P\left(1 + \frac{R}{100}\right)^2 - P = \frac{2PR}{100} + P\left(\frac{R}{100}\right)^2$. Subtracting $SI$ from $CI$ gives $P\left(\frac{R}{100}\right)^2$.
  * *Worked Example*: Difference on ₹10,000 for 2 years at 10% rate?
    * *Solution*: $10000 \times (0.1)^2 = 100$.
  * *Shortcut Demo*: $R = 10\% \implies (0.1)^2 = 0.01$. Diff $= 10000 \times 0.01 = 100$.

---

### PYQ-Style Questions

**Q1.** Find the compound interest on ₹16,000 for 9 months at 20% per annum compounded quarterly.
* **Pattern ID**: Interest-Quarterly-01
* **Approach**: Quarterly rate $= 20/4 = 5\%$. Number of quarters in 9 months $= 3$. Calculate $CI = P(1+R)^3 - P$.
* **Solution**: 
  $$A = 16,000 \times (1.05)^3 = 16,000 \times 1.157625 = 18,522 \implies CI = 18,522 - 16,000 = 2,522$$
* **Shortcut**: Effective rate for 3 periods of 5% $= 3 \times 5 + 3 \times 0.25 + 0.0125 = 15.7625\%$. $16,000 \times 15.7625\% = 2,522$.
* **Variation & Trap**: Using the annual rate of 20% directly and setting $T = 3/4$ years will yield wrong answers.

---

## 4. Time & Work ⭐

### What is this?
Solving work completion rates when individuals contribute efficiency additively.

### Why does TCS ask this?
Tests efficiency modeling and system rates (Pipes & Cisterns).

### Key Formulas & Derivations

* **Formula 1: Time to complete together**
  $$\text{Time} = \frac{xy}{x+y} \text{ days}$$
  * *Derivation*: A completes $\frac{1}{x}$ work per day, B completes $\frac{1}{y}$ work per day. Combined daily rate $= \frac{1}{x} + \frac{1}{y} = \frac{x+y}{xy}$. Time taken $= \frac{xy}{x+y}$.
  * *Worked Example*: A takes 10 days, B takes 15 days. Together?
    * *Solution*: $\frac{10 \times 15}{25} = 6\text{ days}$.

---

### PYQ-Style Questions

**Q1.** Pipe A can fill a tank in 20 hours and Pipe B can empty it in 30 hours. If both are opened together, how long does it take to fill the tank?
* **Pattern ID**: Work-Pipes-01
* **Approach**: Use LCM method. LCM(20, 30) = 60 (Tank capacity).
* **Solution**: 
  * Rate of A $= +3$ units/hr. Rate of B $= -2$ units/hr.
  * Combined rate $= +1$ unit/hr.
  * Time to fill $= \frac{60}{1} = 60\text{ hours}$.
* **Shortcut**: $\frac{xy}{y-x} = \frac{20 \times 30}{30-20} = 60$.
* **Variation & Trap**: Adding empty rate as positive value ($3+2=5 \implies 12\text{ hours}$). Inlet is $+$, outlet is $-$.

---

## 5. Guided Practice Questions

**Q1.** Price of sugar increases by 25%. By how much percent must a family reduce its consumption to keep the expenditure same?
* **Hint**: Use the product constancy formula $\frac{R}{100+R} \times 100\%$.
* **Solution**: 
  $$\text{Reduction} = \frac{25}{125} \times 100\% = 20\%$$

**Q2.** A work can be completed by 12 men in 8 days. How many days will 16 men take to finish it?
* **Hint**: Use the work equation $M_1 D_1 = M_2 D_2$.
* **Solution**: 
  $$12 \times 8 = 16 \times D_2 \implies D_2 = 6\text{ days}$$