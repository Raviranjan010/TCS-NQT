# TCS NQT 2026 — Numerical Ability
### Complete Preparation Guide · Exam: June 28, 2026

> **Section Stats:** 20 Questions · 25 Minutes · ~75 sec/question · No Negative Marking
> 
> **Non-MCQ Rule:** Type whole numbers only — no `%`, `₹`, `km`, or any symbols.

---

## Quick Navigation

| Block | Topics | Weight |
|-------|--------|--------|
| [A — Arithmetic](#block-a--arithmetic) | Percentages, P&L, SI/CI, Ratio, Work, Speed, Averages | ~12Q |
| [B — Number System](#block-b--number-system) | Divisibility, HCF/LCM, Remainders, Powers, Surds | ~4Q |
| [C — Miscellaneous](#block-c--miscellaneous) | P&C, Probability, Data Interpretation | ~4Q |
| [Cheat Sheet](#top-10-formulas-to-memorize-tonight) | 10 Must-Know Formulas | — |

---

# BLOCK A — Arithmetic

---

## 1. Percentages ⭐

### Concept
Percentages express a fraction out of 100. TCS NQT tests three scenarios heavily:
- **Successive % changes** (salary hike + tax, two discounts applied in series)
- **Population growth/decay** over multiple years
- **Base confusion** — the most common trap in this topic

### Real-World Anchor
> A supermarket adds a 10% tax, then offers a 10% loyalty discount. You do NOT break even — you actually lose 1%.

### Key Formulas

| Formula | Expression |
|---------|------------|
| Percentage Increase | `Increase / Original × 100` |
| Net Successive Change | `x + y + (xy/100) %` |
| Population after n years | `P × (1 ± R/100)ⁿ` |
| If A is x% more than B → B is less than A by | `x / (100+x) × 100 %` |
| Product Constancy (keep expenditure fixed) | Reduce consumption by `R / (100+R) × 100 %` |

### ⚡ Shortcut Tricks

1. **Multiplying Factors** — Convert % to decimals and multiply:  
   20% increase × 10% decrease = 1.2 × 0.9 = 1.08 → **net 8% increase**

2. **Fraction Equivalents** (faster than calculating):  
   `12.5% = 1/8`, `16.67% = 1/6`, `33.33% = 1/3`, `25% = 1/4`, `37.5% = 3/8`

3. **Same % increase then decrease** always gives a **net decrease** of `(x²/100)%`

### ⚠️ Common Error
> If A is 25% more than B, students assume B is 25% less than A.  
> **Correct:** B is `25/125 × 100 = 20%` less than A. The base changes!

### 30-Second Exam Trick
For successive discounts/hikes — **never add percentages**. Always use multiplying factors.  
Example: 20% discount + 10% discount = `0.8 × 0.9 = 0.72` → single equivalent discount = **28%**

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** A town's population increases by 10% in Year 1 and decreases by 10% in Year 2. If current population is 9,900, what was it 2 years ago?

<details>
<summary>Solution</summary>

Let original = P  
`P × 1.1 × 0.9 = 9900`  
`P × 0.99 = 9900`  
**P = 10,000** ✓

*Key insight: +10% then −10% is NOT zero. Net = −1%*
</details>

---

**Q2.** A's salary is 20% lower than B's salary. By what percentage is B's salary higher than A's?

<details>
<summary>Solution</summary>

`% higher = 20 / (100 − 20) × 100 = 20/80 × 100 =` **25%** ✓
</details>

---

**Q3.** In an exam, 35% failed in English, 40% failed in Hindi, 15% failed in both. Find % who passed in both.

<details>
<summary>Solution</summary>

Failed in at least one = `35 + 40 − 15 = 60%`  
Passed in both = `100 − 60 =` **40%** ✓
</details>

---

**Q4.** If the radius of a circle is increased by 20%, what is the % increase in area?

<details>
<summary>Solution</summary>

Area ∝ r² → use successive formula twice (same % applied to both dimensions):  
`20 + 20 + (20×20)/100 = 40 + 4 =` **44%** ✓
</details>

---

**Q5.** A number is increased by 10% then decreased by 10%. Net change?

<details>
<summary>Solution</summary>

`10 − 10 − (10×10)/100 = −1%` → **1% decrease** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Price of oil rises 25%. By how much % must consumption fall to keep budget fixed? | **20** |
| 2 | A candidate needs 33% to pass. Gets 125 marks, fails by 40. Find max marks. | **500** |
| 3 | 80% of A = 50% of B. B = x% of A. Find x. | **160** |

---

## 2. Profit & Loss ⭐

### Concept
TCS NQT tests three scenarios most frequently:
- **Faulty weights** — seller uses a wrong weight to cheat
- **Same SP, equal % profit and loss** — always results in a loss
- **Discount chains** — two or more discounts applied on Marked Price

> **Rule:** Discount % is ALWAYS on Marked Price (MP). Profit/Loss % is ALWAYS on Cost Price (CP).

### Key Formulas

| Formula | Expression |
|---------|------------|
| Profit % | `(SP − CP) / CP × 100` |
| Discount % | `(MP − SP) / MP × 100` |
| Faulty Weight Profit % | `Error / (True Weight − Error) × 100` |
| CP of X articles = SP of Y articles → Profit % | `(X−Y) / Y × 100` |
| Both sold at same SP, one at x% profit, other at x% loss | Always a loss of `x²/100 %` |

### ⚡ Shortcut Tricks

1. **Discount Chain Formula:**  
   Two successive discounts of `x%` and `y%` → single equivalent discount = `x + y − (xy/100)%`  
   *Example: 10% + 20% = 28% (not 30%)*

2. **Faulty Weight Shortcut:**  
   True weight = 1000g, false weight = 900g  
   Profit % = `100/900 × 100 = 11.11%`

3. **"Buy X get Y free" → Discount % = `Y/(X+Y) × 100`**  
   Buy 3 get 1 free = `1/4 × 100 = 25%`

### ⚠️ Common Error
> Students calculate discount on CP instead of MP.  
> **Always anchor discounts to Marked Price (MP).**

### 30-Second Exam Trick
For discount chains, use multiplying factors:  
`10% + 20% off = 0.9 × 0.8 = 0.72` → customer pays 72% → **28% discount**

---

### PYQ-Style Questions

**Q1.** A dealer sells goods using a 900g weight instead of 1 kg. Find his profit %.

<details>
<summary>Solution</summary>

`Profit % = Error / (True − Error) × 100 = 100/900 × 100 =` **11.11%** ✓
</details>

---

**Q2.** An article sold at 10% loss. If sold for ₹90 more, there would be 5% profit. Find CP.

<details>
<summary>Solution</summary>

Difference in % = `5 − (−10) = 15%`  
15% of CP = 90 → **CP = ₹600** ✓
</details>

---

**Q3.** Shopkeeper marks 20% above CP, gives 10% discount. Find profit %.

<details>
<summary>Solution</summary>

Let CP = 100 → MP = 120  
SP = `120 × 0.9 = 108` → Profit = **8%** ✓
</details>

---

**Q4.** Two articles sold at ₹990 each: 10% profit on one, 10% loss on other. Net result?

<details>
<summary>Solution</summary>

Always a loss when same SP, equal ±% → Loss = `x²/100 = 100/100 =` **1% loss** ✓
</details>

---

**Q5.** By selling 33m of cloth, a merchant gains the CP of 11m. Find profit %.

<details>
<summary>Solution</summary>

Profit = CP of 11m, Sales = 33m  
`Profit % = 11/33 × 100 =` **33.33%** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Dishonest shopkeeper uses 800g instead of 1kg, sells at CP. Profit %? | **25** |
| 2 | CP of 20 articles = SP of 15 articles. Profit %? | **33.33** |
| 3 | "Buy 3 get 1 free" represents what % discount? | **25** |

---

## 3. Simple & Compound Interest ⭐

### Concept
- **SI** grows linearly — interest only on principal
- **CI** grows exponentially — interest on principal + accumulated interest
- TCS NQT loves: the CI−SI difference formula, non-annual compounding, and "doubles in n years" problems

### Key Formulas

| Formula | Expression |
|---------|------------|
| Simple Interest | `SI = P × R × T / 100` |
| Compound Interest (annual) | `CI = P(1 + R/100)ᵀ − P` |
| Half-yearly compounding | Use `R/2` and `T×2` |
| Quarterly compounding | Use `R/4` and `T×4` |
| CI − SI for 2 years | `P × (R/100)²` |
| CI − SI for 3 years | `P × (R/100)² × (3 + R/100)` |

### ⚡ Shortcut Tricks

1. **Doubling Trick (CI):**  
   If a sum doubles in `n` years at CI → it becomes `2ᵏ` times in `k×n` years  
   *Doubles in 4 years → becomes 8× in 12 years (since 8 = 2³)*

2. **Rule of 72:**  
   Years to double = `72 / Rate%`  
   *At 9% per annum → doubles in ≈8 years*

3. **Effective Rate (2 years):**  
   CI equivalent single rate = `2R + R²/100`

### ⚠️ Common Error
> Using `A = P(1+R/100)ᵀ` and reporting A as CI.  
> **CI = A − P.** Always subtract the principal!

### 30-Second Exam Trick
For the CI−SI difference in 2 years: use `P(R/100)²` directly — no need to calculate both separately.

---

### PYQ-Style Questions

**Q1.** Find CI − SI on ₹10,000 for 2 years at 8% per annum.

<details>
<summary>Solution</summary>

`P × (R/100)² = 10000 × (8/100)² = 10000 × 64/10000 =` **₹64** ✓
</details>

---

**Q2.** A sum triples itself in 15 years at SI. Find the annual rate.

<details>
<summary>Solution</summary>

Triple → SI = 2P  
`2P = P × R × 15/100` → `R = 200/15 =` **13.33%** ✓
</details>

---

**Q3.** A sum doubles itself at CI in 5 years. In how many years does it become 8 times?

<details>
<summary>Solution</summary>

`8 = 2³` → Time = `3 × 5 =` **15 years** ✓
</details>

---

**Q4.** ₹8000 amounts to ₹9261 in 3 years at CI. Find the annual rate.

<details>
<summary>Solution</summary>

`9261/8000 = (21/20)³` → `1 + R/100 = 21/20` → **R = 5%** ✓
</details>

---

**Q5.** CI on ₹10,000 for 1 year at 10% per annum, compounded half-yearly?

<details>
<summary>Solution</summary>

New rate = 5%, New cycles = 2  
`CI = 10000 × (1.05)² − 10000 = 10000 × 1.1025 − 10000 =` **₹1,025** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | CI − SI on ₹5000 for 2 years = ₹72. Find annual rate. | **12** |
| 2 | In how many years does a sum double at 12.5% SI? | **8** |
| 3 | CI on ₹16,000 for 9 months at 20% p.a. compounded quarterly. | **2522** |

---

## 4. Ratio & Proportion ⭐

### Concept
Ratios compare quantities; proportions equate two ratios. Key TCS applications:
- **Partnership problems** — profit split by `Capital × Time`
- **Alligation** — finding the ratio to mix two solutions to get a target concentration
- **Combining ratios** — chaining A:B and B:C into A:B:C

### Key Formulas

| Formula | Expression |
|---------|------------|
| Proportion | If `a:b = c:d` then `ad = bc` |
| Mean Proportional of a and b | `√(ab)` |
| Third Proportional to a, b | `b²/a` |
| Partnership Profit Ratio | `C₁×T₁ : C₂×T₂` |
| Alligation Rule | `(Dearer − Mean) : (Mean − Cheaper)` |

### ⚡ Shortcut Tricks

1. **Combining A:B and B:C:**  
   Write stacked: `2:3` and `4:5` → Cross-multiply middle term:  
   `A:B:C = 2×4 : 3×4 : 3×5 = 8:12:15`

2. **Mean Proportional** of 9 and 16 = `√(9×16) = √144 = 12`

3. **Alligation** — draw a cross:
   ```
   Dearer (d)       Cheaper (c)
         \         /
          Mean (m)
         /         \
      (m−c)       (d−m)
   ```
   Ratio = `(m−c) : (d−m)`

### ⚠️ Common Error
> In partnership, forgetting to multiply capital by time period.  
> **Always use C × T**, not just capital alone.

### 30-Second Exam Trick
When the question asks "add x to all four terms to maintain proportion":  
Set up `(a+x)(d+x) = (b+x)(c+x)` and solve for x.

---

### PYQ-Style Questions

**Q1.** A and B invest in ratio 3:2. After 5% goes to charity, A's share is ₹855. Total profit?

<details>
<summary>Solution</summary>

Net distributable = `0.95P`  
A's share = `3/5 × 0.95P = 855` → `0.57P = 855` → **P = ₹1,500** ✓
</details>

---

**Q2.** Find the third proportional to 9 and 12.

<details>
<summary>Solution</summary>

`9:12 = 12:x` → `9x = 144` → **x = 16** ✓
</details>

---

**Q3.** Mixture of 60L, milk:water = 2:1. How much water to add to make 1:2?

<details>
<summary>Solution</summary>

Original: Milk = 40L, Water = 20L  
For 1:2 ratio with Milk = 40L → Water needed = 80L  
Water to add = `80 − 20 =` **60L** ✓
</details>

---

**Q4.** What number added to 6, 7, 15, 17 makes them proportional?

<details>
<summary>Solution</summary>

`(6+x)(17+x) = (7+x)(15+x)`  
`102 + 23x + x² = 105 + 22x + x²`  
`x =` **3** ✓
</details>

---

**Q5.** Bag has 50p, 25p, 10p coins in ratio 5:9:4, totalling ₹206. Find number of 50p coins.

<details>
<summary>Solution</summary>

Value contributed: `5×0.5 : 9×0.25 : 4×0.1 = 2.5 : 2.25 : 0.4 = 50:45:8`  
Total parts = 103. Value of 50p coins = `50/103 × 206 = ₹100`  
Number of 50p coins = `100 × 2 =` **200** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | A:B = 3:4, B:C = 8:9. Find A:C. | **2:3** |
| 2 | Numbers in ratio 3:5. Subtract 9 from each → ratio 12:23. Find smaller number. | **33** |
| 3 | Split ₹1200 among A, B, C in ratio 2:3:5. Find B's share. | **360** |

---

## 5. Time & Work ⭐

### Concept
Two methods exist — the **LCM method** (preferred for TCS NQT) and the **fraction method**.  
For Pipes & Cisterns: inlet pipes have **positive** efficiency, outlet pipes have **negative** efficiency.

### Key Formulas

| Formula | Expression |
|---------|------------|
| LCM Method | Total Work = LCM(all individual times) |
| Efficiency | `Total Work / Time taken individually` |
| A + B together | `xy / (x+y)` days |
| Work equivalence | `M₁D₁H₁/W₁ = M₂D₂H₂/W₂` |
| If A is k× faster than B | They work in time ratio `1:k` |

### ⚡ Shortcut Tricks

1. **LCM Method (Step-by-Step):**
   - Find LCM of all given times → that's "Total Work"
   - Divide Total Work by each person's time → their daily "efficiency"
   - Add efficiencies for combined work; Time = Total Work ÷ Combined Efficiency

2. **Alternate Days Pattern:**  
   Group 2 consecutive days as one unit. Cycle through until work finishes.

3. **Pipe Filling:**  
   If an inlet fills in `x` hours and outlet drains in `y` hours:  
   Net rate = `1/x − 1/y`. Time to fill = `xy/(y−x)` hours.

### ⚠️ Common Error
> **Never add the days directly.**  
> A takes 5 days, B takes 10 days → Together NOT 15 days.  
> Add their *efficiencies*: `1/5 + 1/10 = 3/10` → Together = **3.33 days**

### 30-Second Exam Trick
If A is twice as efficient as B → together their efficiency is **3 units**.  
If combined time = T, total work = 3T. A alone = `3T/2`, B alone = `3T`.

---

### PYQ-Style Questions

**Q1.** A does work in 10 days, B in 15 days. Together?

<details>
<summary>Solution</summary>

LCM(10,15) = 30 (Total Work)  
Efficiency: A = 3, B = 2, Together = 5  
Time = `30/5 =` **6 days** ✓
</details>

---

**Q2.** 12 men complete work in 8 days. How long for 16 men?

<details>
<summary>Solution</summary>

`12 × 8 = 16 × D₂` → **D₂ = 6 days** ✓
</details>

---

**Q3.** Pipe A fills tank in 20 hrs, Pipe B empties in 30 hrs. Both open — when is tank full?

<details>
<summary>Solution</summary>

LCM(20,30) = 60 (capacity)  
A's rate = +3, B's rate = −2, Net = +1  
Time = `60/1 =` **60 hours** ✓
</details>

---

**Q4.** A is twice as fast as B. Together they finish in 14 days. A alone?

<details>
<summary>Solution</summary>

A:B efficiency = 2:1, combined = 3  
Total work = `3 × 14 = 42`  
A alone = `42/2 =` **21 days** ✓
</details>

---

**Q5.** A, B, C can do work in 8, 12, 15 days respectively. Together?

<details>
<summary>Solution</summary>

LCM(8,12,15) = 120  
A = 15, B = 10, C = 8 → Combined = 33  
Time = `120/33 ≈` **3.64 days** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | A builds wall in 9 days, B in 12. Alternate days (A starts). Total days? | **10.25** |
| 2 | 10 men = 20 women (for same work in same time). 10 men + 10 women take how long to finish what 10 men do in 15 days? | **10** |
| 3 | 3 pipes together fill tank in 6 hrs. After 2 hrs, one is closed; remaining two fill it in 8 hrs. Closed pipe alone takes? | **12** |

---

## 6. Time, Speed & Distance ⭐

### Concept
Covers relative speed, train problems, boats & streams, and average speed over journeys.  
The **unit conversion** is the #1 source of errors under exam pressure.

### Key Formulas

| Formula | Expression |
|---------|------------|
| Basic | `Speed = Distance / Time` |
| km/h → m/s | Multiply by `5/18` |
| m/s → km/h | Multiply by `18/5` |
| Average Speed (equal distances) | `2xy / (x+y)` |
| Relative Speed (same direction) | `S₁ − S₂` |
| Relative Speed (opposite direction) | `S₁ + S₂` |
| Boat downstream | `U + V` (U = boat in still water, V = stream speed) |
| Boat upstream | `U − V` |
| Train crossing a pole | Distance = Train length |
| Train crossing a platform | Distance = Train length + Platform length |

### ⚡ Shortcut Tricks

1. **Speed Ratio ↔ Time Ratio:**  
   If distance is constant, Speed ∝ 1/Time → `S₁/S₂ = T₂/T₁`

2. **Walk Slower → Late:**  
   If a person walks at `3/4` of usual speed → takes `4/3` of usual time → **1/3 extra time**  
   If late by 20 min → usual time = `3 × 20 = 60 min`

3. **Stream Speed from Up/Downstream:**  
   `U = (Downstream + Upstream)/2`, `V = (Downstream − Upstream)/2`

### ⚠️ Common Error
> Mixing units — speed in km/h but distance in metres, or time in minutes.  
> **Always convert to consistent units before applying any formula.**

### 30-Second Exam Trick
For average speed with equal distances: use `2xy/(x+y)` (harmonic mean) — **never** the arithmetic mean.  
`(60+40)/2 = 50` is WRONG. `2×60×40/(60+40) = 48` is CORRECT.

---

### PYQ-Style Questions

**Q1.** A 120m train passes a 180m platform in 15 seconds. Speed in km/h?

<details>
<summary>Solution</summary>

Total distance = `120 + 180 = 300m`  
Speed = `300/15 = 20 m/s = 20 × 18/5 =` **72 km/h** ✓
</details>

---

**Q2.** Man rows at 6 km/h in still water; stream speed 2 km/h. Goes to a place and back in 3 hours. Distance?

<details>
<summary>Solution</summary>

Downstream = 8 km/h, Upstream = 4 km/h  
`d/8 + d/4 = 3` → `3d/8 = 3` → **d = 8 km** ✓
</details>

---

**Q3.** Walking at 3/4 of usual speed, a man is 20 min late. Usual time?

<details>
<summary>Solution</summary>

Speed ratio = 3:4 → Time ratio = 4:3  
Extra time (1 part) = 20 min → Usual time (3 parts) = **60 minutes** ✓
</details>

---

**Q4.** Thief 200m ahead. Thief runs 10 km/h, cop runs 11 km/h. Gap after 6 minutes?

<details>
<summary>Solution</summary>

Relative speed = 1 km/h = `1000/60 m/min`  
Covered in 6 min = 100m  
Remaining gap = `200 − 100 =` **100m** ✓
</details>

---

**Q5.** Two trains from A and B travel toward each other at 50 and 60 km/h. At meeting, second train traveled 120 km more. Distance A to B?

<details>
<summary>Solution</summary>

Let time to meet = t hours  
`60t − 50t = 120` → `t = 12 hrs`  
Total distance = `(50+60) × 12 =` **1,320 km** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | A man travels 24 km at 6 km/h, then 24 km at 8 km/h. Average speed? | **6.86 km/h** |
| 2 | Boat covers 24 km upstream and 36 km downstream in 6 hours. Upstream speed = 8 km/h. Find stream speed. | **2 km/h** |
| 3 | Train crosses a pole in 12 sec and a 150m platform in 18 sec. Find train length. | **300m** |

---

## 7. Averages & Weighted Averages

### Concept
Average = Sum ÷ Count. TCS NQT tests **replacement problems** (one value is swapped, affecting the average) and **weighted averages** (groups of different sizes).

### Key Formulas

| Formula | Expression |
|---------|------------|
| Simple Average | `Sum / Count` |
| Weighted Average | `(w₁x₁ + w₂x₂ + …) / (w₁ + w₂ + …)` |
| New value (replacement increases avg by k) | `Old value + (n × k)` where n = count |
| AP Average | `(First + Last) / 2` |
| Adding one new member to a group | New avg = `(Old sum + new value) / (n+1)` |

### ⚡ Shortcut Tricks

1. **Replacement Shortcut:**  
   New member's weight = Replaced weight + (Group size × Change in average)

2. **Deviation Method:**  
   Assume an average, find each element's deviation from it, average the deviations, add to assumed average.

3. **5 Consecutive Numbers:**  
   Their average is always the **middle (3rd) number**.

### ⚠️ Common Error
> When a NEW person is added to the group, the denominator increases by 1.  
> When a person is REPLACED, the denominator stays the same.

---

### PYQ-Style Questions

**Q1.** Average age of 30 students = 15. Teacher's age added → average rises by 1. Teacher's age?

<details>
<summary>Solution</summary>

Teacher's age = `Old avg + New count × Rise = 15 + 31 × 1 =` **46 years** ✓
</details>

---

**Q2.** Average weight of 8 men increases by 1.5 kg when 60 kg man is replaced. New man's weight?

<details>
<summary>Solution</summary>

`60 + 8 × 1.5 =` **72 kg** ✓
</details>

---

**Q3.** Average of first 50 natural numbers?

<details>
<summary>Solution</summary>

`(1 + 50) / 2 =` **25.5** ✓
</details>

---

**Q4.** Average of 5 consecutive odd numbers is 61. Highest number?

<details>
<summary>Solution</summary>

Middle term = 61 → Numbers: 57, 59, 61, 63, 65 → Highest = **65** ✓
</details>

---

**Q5.** Student's average in 10 tests = 80. Excluding highest (98) and lowest, average = 82. Lowest score?

<details>
<summary>Solution</summary>

Sum of 10 = 800. Sum of 8 = `82 × 8 = 656`  
Highest + Lowest = `800 − 656 = 144`  
Lowest = `144 − 98 =` **46** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Average of 11 results = 50. First 6 avg = 49, last 6 avg = 52. Find 6th result. | **56** |
| 2 | Average of all prime numbers between 20 and 40? | **30** |
| 3 | Cricketer averages 58 in 9 innings. Runs needed in 10th to raise avg to 61? | **88** |

---

# BLOCK B — Number System

---

## 8. Divisibility Rules & HCF/LCM ⭐

### Divisibility Quick Reference

| Divisible by | Rule |
|---|---|
| 2 | Last digit even |
| 3 | Sum of digits divisible by 3 |
| 4 | Last 2 digits divisible by 4 |
| 5 | Ends in 0 or 5 |
| 6 | Divisible by both 2 and 3 |
| 7 | Double last digit, subtract from rest — divisible by 7 |
| 8 | **Last 3 digits** divisible by 8 |
| 9 | **Sum of digits** divisible by 9 |
| 11 | (Sum of odd-place digits) − (Sum of even-place digits) = 0 or multiple of 11 |
| 72 | Divisible by both 8 and 9 |

### Key Formulas

| Formula | Expression |
|---------|------------|
| Product relation | `HCF × LCM = Product of two numbers` |
| HCF of fractions | `HCF(numerators) / LCM(denominators)` |
| LCM of fractions | `LCM(numerators) / HCF(denominators)` |

### 30-Second Exam Trick
For divisibility by **72**: check last 3 digits for ÷8 first (narrows options fast), then sum all digits for ÷9.

---

### PYQ-Style Questions

**Q1.** If `5432a7` is divisible by 9, find digit `a`.

<details>
<summary>Solution</summary>

Sum = `5+4+3+2+a+7 = 21+a`  
For multiple of 9: `21+a = 27` → **a = 6** ✓
</details>

---

**Q2.** Largest 4-digit number divisible by 15, 25, 40, and 75.

<details>
<summary>Solution</summary>

LCM(15,25,40,75) = 600  
`9999 ÷ 600` → remainder 399  
Answer = `9999 − 399 =` **9600** ✓
</details>

---

**Q3.** HCF = 11, LCM = 693. One number = 77. Find other.

<details>
<summary>Solution</summary>

Other = `(HCF × LCM) / 77 = 7623/77 =` **99** ✓
</details>

---

**Q4.** `985x3678y` is divisible by 72. Find `4x − 3y`.

<details>
<summary>Solution</summary>

÷8: `78y` → `784 ÷ 8 = 98` → **y = 4**  
÷9: Sum = `50+x` → `50+x = 54` → **x = 4**  
`4(4) − 3(4) =` **4** ✓
</details>

---

**Q5.** Find HCF of 2/3, 8/9, and 16/81.

<details>
<summary>Solution</summary>

HCF of fractions = `HCF(2,8,16) / LCM(3,9,81) = 2/81` → **2/81** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Smallest number divisible by 20,25,35,40 leaving remainders 14,19,29,34 resp. | **1394** |
| 2 | HCF of 108, 288, 360. | **36** |
| 3 | `8A514B` divisible by 88. Find A+B. | **8** |

---

## 9. Remainders

### Concept
For large powers, we use **cyclicity**, **Fermat's Little Theorem**, and the **negative remainder trick** to avoid lengthy calculations.

### Key Formulas

| Formula | Condition |
|---------|-----------|
| Fermat's Little Theorem: `aᵖ⁻¹ ≡ 1 (mod p)` | p is prime, gcd(a,p)=1 |
| Remainder of (A×B)/C | `[R(A/C) × R(B/C)] mod C` |
| Negative Remainder | `17 mod 18 = 17 ≡ −1` → use −1 for exponent calculations |

### ⚡ Shortcut Tricks

1. **Cyclicity of remainders** — write out first few powers to find repeating cycle
2. **Negative Remainder Trick** — `8 mod 9 = −1`. So `8¹¹ mod 9 = (−1)¹¹ = −1 ≡ 8`
3. **Pattern:** `2⁴ ≡ 1 (mod 5)` → find `2^n mod 5` using `n mod 4`

---

### PYQ-Style Questions

**Q1.** Remainder when `2³¹` is divided by 5.

<details>
<summary>Solution</summary>

`2⁴ ≡ 1 (mod 5)`. `31 = 4×7 + 3`. So `2³¹ ≡ 2³ = 8 ≡` **3** ✓
</details>

---

**Q2.** Remainder when `7⁸⁴` is divided by 342.

<details>
<summary>Solution</summary>

`7³ = 343 ≡ 1 (mod 342)`. `84 = 3×28`. So `7⁸⁴ ≡ 1²⁸ ≡` **1** ✓
</details>

---

**Q3.** Number leaves remainder 5 when divided by 6, and 4 when divided by 5. Smallest such number?

<details>
<summary>Solution</summary>

`N = 6k+5 = 5m+4`. Try k=1: 11 ÷ 5 = rem 1. k=4: 29 ÷ 5 = rem 4 ✓ → **29** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Remainder when `37¹⁰⁰` is divided by 7. | **2** |
| 2 | Remainder of `19¹⁰⁰ ÷ 20`. | **1** |

---

## 10. Powers & Indices

### Unit Digit Cyclicity Table

| Base digit | Cycle | Pattern (powers 1,2,3,4 repeat) |
|---|---|---|
| 0, 1, 5, 6 | 1 | Always same unit digit |
| 4 | 2 | 4, 6, 4, 6, … |
| 9 | 2 | 9, 1, 9, 1, … |
| 2, 3, 7, 8 | 4 | Full 4-step cycle |

### 30-Second Exam Trick
1. Find unit digit of base
2. Divide exponent by 4 → get remainder `r`
3. If `r = 0`, use power 4. Else use power `r`
4. Calculate unit digit of `base^r`

---

### PYQ-Style Questions

**Q1.** Unit digit of `3⁶⁵ × 6⁵⁹ × 7⁷¹`?

<details>
<summary>Solution</summary>

- `3⁶⁵`: `65 mod 4 = 1` → `3¹ = 3`  
- `6⁵⁹`: Always 6
- `7⁷¹`: `71 mod 4 = 3` → `7³ = 343` → 3  
- `3 × 6 × 3 = 54` → **4** ✓
</details>

---

**Q2.** Find `n` if `2ⁿ⁻¹ + 2ⁿ⁺¹ = 320`.

<details>
<summary>Solution</summary>

`2ⁿ⁻¹(1 + 4) = 320` → `2ⁿ⁻¹ = 64 = 2⁶` → **n = 7** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Unit digit of `7¹⁰⁵`. | **7** |
| 2 | `3^(x−y) = 27` and `3^(x+y) = 243`. Find x. | **4** |
| 3 | Unit digit of `2⁵⁰ × 3⁵⁰`. | **6** |

---

## 11. Surds & Indices

### Key Formulas

| Formula | Use Case |
|---------|----------|
| `1/(√a+√b) = (√a−√b)/(a−b)` | Rationalization |
| `√(x+2√y) = √a+√b` where `a+b=x, ab=y` | Nested surd simplification |
| Infinite nested `√(x+√(x+…))` with `+` sign | Answer = larger factor when `x = n(n+1)` |
| Infinite nested `√(x−√(x−…))` with `−` sign | Answer = smaller factor |

### 30-Second Exam Trick
Infinite nested surds: factor x into two consecutive integers `n(n+1)`.  
- Addition nested → answer is `n+1` (larger)  
- Subtraction nested → answer is `n` (smaller)

Example: `√(12 + √(12+…))` → `12 = 3×4` → answer = **4**

---

### PYQ-Style Questions

**Q1.** Simplify `1/(√3 + √2)`.

<details>
<summary>Solution</summary>

Multiply by `(√3−√2)/(√3−√2)` = `(√3−√2)/(3−2) =` **√3 − √2** ✓
</details>

---

**Q2.** Value of `√(6+√(6+√(6+…∞)))`?

<details>
<summary>Solution</summary>

`6 = 2×3` → addition nested → answer = larger factor = **3** ✓
</details>

---

**Q3.** Which is larger: ∛3 or ∜4?

<details>
<summary>Solution</summary>

`∛3 = 3^(4/12) = 81^(1/12)`  
`∜4 = 4^(3/12) = 64^(1/12)`  
`81 > 64` → **∛3 is larger** ✓
</details>

---

**Q4.** Simplify `√(7 + 2√10)`.

<details>
<summary>Solution</summary>

Need `a+b=7, ab=10` → `a=5, b=2`  
Answer = **√5 + √2** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Simplify `2/(√5 − √3)`. | **√5 + √3** |
| 2 | Find x if `5^√x + 12^√x = 13^√x`. | **4** |
| 3 | Ascending order: `√2`, `∛3`, `⁶√6`. | `⁶√6 < √2 < ∛3` |

---

# BLOCK C — Miscellaneous

---

## 12. Permutations & Combinations ⭐

### Concept
**Permutation:** Order matters → use `P(n,r)`  
**Combination:** Order doesn't matter → use `C(n,r)`  

> **Quick test:** Would swapping two selections give a different outcome? Yes → Permutation. No → Combination.

### Key Formulas

| Formula | Expression |
|---------|------------|
| Permutation | `P(n,r) = n! / (n−r)!` |
| Combination | `C(n,r) = n! / [r!(n−r)!]` |
| Circular Permutation | `(n−1)!` |
| Repeated letters in word | `n! / (a! × b! × c!)` |
| Handshakes among n people | `C(n,2) = n(n−1)/2` |
| Diagonals of n-sided polygon | `n(n−3)/2` |

### ⚡ Shortcut Tricks

1. **Vowels Together** → treat all vowels as one "super-letter" → arrange (group + consonants)! × (vowels internally)!

2. **Vowels at Odd Positions** → fill odd slots with vowels, even slots with consonants separately, then multiply

3. **At Least One Condition** → Total − (None selected)

---

### PYQ-Style Questions

**Q1.** Arrangements of the word **LEADER**?

<details>
<summary>Solution</summary>

Length = 6, E repeated twice → `6!/2! = 720/2 =` **360** ✓
</details>

---

**Q2.** Committee of 3 from 5 men and 4 women with at least 2 men?

<details>
<summary>Solution</summary>

2M+1W: `C(5,2)×C(4,1) = 10×4 = 40`  
3M+0W: `C(5,3)×C(4,0) = 10×1 = 10`  
Total = **50** ✓
</details>

---

**Q3.** Diagonals of a decagon (10 sides)?

<details>
<summary>Solution</summary>

`n(n−3)/2 = 10×7/2 =` **35** ✓
</details>

---

**Q4.** 6 people seated around a circular table — how many ways?

<details>
<summary>Solution</summary>

`(6−1)! = 5! =` **120** ✓
</details>

---

**Q5.** Arrangements of **DETAIL** with vowels at odd positions only?

<details>
<summary>Solution</summary>

Vowels: E, A, I (3). Odd positions: 1, 3, 5 (3 slots).  
Vowels arrangements = `3! = 6`. Consonants (D,T,L) = `3! = 6`  
Total = `6 × 6 =` **36** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Arrangements of word **MATHEMATICS**? | **4,989,600** |
| 2 | 15 people, everyone shakes hands once. Total handshakes? | **105** |
| 3 | From 7 consonants and 4 vowels, words with 3 consonants and 2 vowels? | **25,200** |

---

## 13. Probability ⭐

### Concept
`P(Event) = Favorable Outcomes / Total Outcomes`  
Core TCS NQT topics: dice sums, card draws, bag problems, "at least one" scenarios.

### Key Formulas

| Formula | Expression |
|---------|------------|
| Addition Rule | `P(A∪B) = P(A) + P(B) − P(A∩B)` |
| Independent Events | `P(A∩B) = P(A) × P(B)` |
| Conditional Probability | `P(A\|B) = P(A∩B) / P(B)` |
| At Least One | `1 − P(none)` |
| Complementary | `P(A') = 1 − P(A)` |

### ⚡ Shortcut Tricks

1. **Two Dice Sum = 7** → most common (6 ways out of 36). Sum = 2 or 12 → rarest (1 way each)
2. **"At Least One" problems** → always use `1 − P(none)` instead of adding all cases
3. **Leap Year Sundays:** `366 days = 52 weeks + 2 extra days`. 7 possible pairs, 2 contain Sunday → `P = 2/7`

### ⚠️ Common Error
> Adding probabilities of independent events.  
> For independent events A and B: `P(both) = P(A) × P(B)`, NOT `P(A) + P(B)`.

---

### PYQ-Style Questions

**Q1.** Two dice thrown simultaneously. P(sum = 7)?

<details>
<summary>Solution</summary>

Favorable: (1,6),(2,5),(3,4),(4,3),(5,2),(6,1) = 6 outcomes  
`P = 6/36 =` **1/6** ✓
</details>

---

**Q2.** P(Queen of Clubs OR King of Hearts) from 52-card deck?

<details>
<summary>Solution</summary>

Both are unique cards → 2 favorable  
`P = 2/52 =` **1/26** ✓
</details>

---

**Q3.** A solves problem with P=1/2, B with P=1/3. P(problem is solved)?

<details>
<summary>Solution</summary>

`P(neither) = 1/2 × 2/3 = 1/3`  
`P(at least one) = 1 − 1/3 =` **2/3** ✓
</details>

---

**Q4.** Bag: 4 red, 5 green, 6 blue balls. Draw 3 of different colors. P?

<details>
<summary>Solution</summary>

Total ways = `C(15,3) = 455`  
Favorable = `4×5×6 = 120`  
`P = 120/455 =` **24/91** ✓
</details>

---

**Q5.** P(53 Sundays in a leap year)?

<details>
<summary>Solution</summary>

366 days = 52 complete weeks + 2 days  
7 possible pairs, 2 contain Sunday: (Sat,Sun), (Sun,Mon)  
`P =` **2/7** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | 3 coins tossed. P(at least 2 heads)? | **1/2** |
| 2 | Card drawn from deck. P(spade or ace)? | **4/13** |
| 3 | P(rain Mon) = 0.6, P(rain Tue) = 0.3. P(rain on at least one day)? | **0.72** |

---

## 14. Data Interpretation

### Concept
Under exam time pressure, DI is about **speed of reading + estimation accuracy**, not precise calculation.

### ⚡ Shortcut Tricks

1. **Read the QUESTION first**, then look at the chart/table for only the relevant data
2. **Unit digit check** — for multiple-choice, calculate only the unit digit of large additions to eliminate wrong options
3. **Round and Estimate** — `247 → 250`, `193 → 190`. Speeds up division by 3-5x
4. **Visual comparison** in bar charts — spot the tallest/shortest bar before reading exact values

### ⚠️ Common Error
> Reading the wrong row/column, or misreading the scale (millions vs thousands).  
> **Always re-read the axis labels before calculating.**

---

### PYQ-Style Questions

**Q1.** Company A sales: Year 1 = 100, Year 2 = 120, Year 3 = 150. Growth from Y1 to Y3?

<details>
<summary>Solution</summary>

`(150−100)/100 × 100 =` **50%** ✓
</details>

---

**Q2.** Total A sales = 370, Total B sales = 630 (over same period). Ratio?

<details>
<summary>Solution</summary>

`370:630 = 37:63` ✓
</details>

---

**Q3.** Pie chart: Rent = 25% of total income ₹50,000. Rent expenditure?

<details>
<summary>Solution</summary>

`25% × 50000 =` **₹12,500** ✓
</details>

---

### 🎯 Expected June 2026 Questions

| # | Question | Answer |
|---|----------|--------|
| 1 | Import:Export = 4:5, Exports = ₹200 crore. Find Imports. | **160 crore** |
| 2 | Pie chart sector angle = 72°. What % of total? | **20%** |
| 3 | Sales over 5 months: 6400,6900,6800,7200,6500. Average? | **6760** |

---

# Top 10 Formulas to Memorize Tonight

> Study these right before sleeping. Your brain consolidates memory during sleep.

| # | Formula | Topic |
|---|---------|-------|
| 1 | Net Successive % Change = `x + y + xy/100` | Percentages |
| 2 | CI − SI (2 years) = `P(R/100)²` | Interest |
| 3 | CI − SI (3 years) = `P(R/100)² × (3 + R/100)` | Interest |
| 4 | Average Speed (equal distances) = `2xy/(x+y)` | Speed |
| 5 | Man-Work-Days: `M₁D₁H₁/W₁ = M₂D₂H₂/W₂` | Work |
| 6 | Faulty Weight Profit % = `Error/(True−Error) × 100` | P&L |
| 7 | AP Sum = `n/2 × [2a + (n−1)d]` | Series |
| 8 | GP Infinite Sum = `a/(1−r)` where `\|r\| < 1` | Series |
| 9 | Polygon Diagonals = `n(n−3)/2` | P&C |
| 10 | Fermat: `aᵖ⁻¹ ≡ 1 (mod p)` where p is prime | Remainders |

---

*Prepared by Claude · TCS NQT 2026 · All the best, Ravi! 🎯*