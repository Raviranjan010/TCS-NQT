# TCS NQT 2026 — Advanced Quant & Reasoning
### Complete Preparation Guide · Exam: June 28, 2026

> **Section Stats:** 14 Questions · 25 Minutes · ~107 sec/question · No Negative Marking
> 
> **FIB Strategy:** Type exact values only. No `%` or `₹` or symbols. E.g. for ₹240, type `240`.

---

## Quick Navigation

| Block | Topics | Weight |
|-------|--------|--------|
| [A — Advanced Quantitative](#block-a--advanced-quantitative) | Mixtures, Work & Wages, Complex Interest, Geometry, Number Theory, P&C Traps | ~6Q |
| [B — Advanced Reasoning](#block-b--advanced-reasoning) | Complex Seating, Input-Output, Logical Puzzles, Critical Reasoning, DS | ~5Q |
| [C — Mixed Application](#block-c--mixed-application) | Quant Passages, Case-based DI, Visual Reasoning | ~3Q |
| [Cheat Sheet](#💡-10-advanced-concepts-every-student-misses) | 10 Crucial Advanced Tips | — |

---

# BLOCK A — Advanced Quantitative

---

## 1. Mixtures & Alligations ⭐⭐⭐

### Concept
This topic moves beyond simple mixtures to 3-container mixing and successive dilution.

### Real-World Anchor
> A pharmaceutical lab where a chemical concentration is successively diluted by drawing off a fraction and replacing it with water.

### Key Formulas

| Scenario | Formula |
|----------|---------|
| Successive Dilution | $\text{Final Conc.} = \text{Initial Conc.} \times \left(1 - \frac{y}{x}\right)^n$ <br> (where $y$ is quantity replaced, $x$ is total capacity, $n$ is cycles) |
| Alligation Formula | $\frac{\text{Cheaper Quantity}}{\text{Dearer Quantity}} = \frac{d - m}{m - c}$ |

### ⚡ Shortcut Tricks
1. **Ratio Scaling**: When mixing three vessels of different ratios, always normalize their capacities using the LCM of their ratio sums before adding the parts.
2. **Alligation Cross**: Draw a cross immediately: cheaper on top-left, dearer on top-right, mean in the center. Subtract diagonally.

### ⚠️ Common Error
> Adding ratios directly (e.g., $2:1 + 3:1 = 5:2$) without scaling. Capacities must be equalized first.

### 30-Second Exam Trick
For dilution problems, use the decimal fraction remaining. If 10% is replaced each time, the remaining factor after 3 cycles is $0.9^3 = 0.729$.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** A container contains 80L of milk. 8L of milk is replaced by water. This process is repeated 2 more times. Find the final quantity of milk.
<details>
<summary>Solution</summary>
* $y = 8\text{L}, x = 80\text{L}, n = 3$.
* $\text{Remaining Milk} = 80 \times \left(1 - \frac{8}{80}\right)^3$
* $\text{Remaining Milk} = 80 \times (0.9)^3 = 80 \times 0.729 = $ **58.32 L** ✓
</details>

**Q2.** In what ratio should two mixtures of milk and water with ratios $5:2$ and $7:6$ be mixed to get a final ratio of $8:5$?
<details>
<summary>Solution</summary>
* Fraction of milk in Mixture 1 ($M_1$) $= 5/7$.
* Fraction of milk in Mixture 2 ($M_2$) $= 7/13$.
* Fraction of milk in Mean ($M_m$) $= 8/13$.
* Alligation:
  $$\text{Ratio} = \left(\frac{8}{13} - \frac{7}{13}\right) : \left(\frac{5}{7} - \frac{8}{13}\right)$$
  $$\text{Ratio} = \frac{1}{13} : \frac{65 - 56}{91} = \frac{1}{13} : \frac{9}{91} = 7 : 9$$
* **7:9** ✓
</details>

---

## 2. Work & Wages ⭐⭐⭐

### Concept
Work & Wages distributes payouts based on the relative work done by each individual.

### Key Formulas
$$\text{Wage Share} \propto \text{Work Done} = \text{Efficiency} \times \text{Days Worked}$$

### ⚡ Shortcut Tricks
1. **LCM for Efficiency**: Use LCM of time taken to find the relative efficiencies of workers.
2. **Equal Time Rule**: If all workers work for the same number of days, wages can be divided directly in the ratio of their efficiencies.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** A, B, and C can do a work in 6, 8, and 12 days respectively. They complete the work together and receive ₹1350. Find B's share.
<details>
<summary>Solution</summary>
* LCM of 6, 8, 12 is 24 (Total Work units).
* Efficiencies: A $= 4$, B $= 3$, C $= 2$.
* Since they work for the same duration, divide wages in ratio $4:3:2$.
* B's share $= \frac{3}{9} \times 1350 = $ **₹450** ✓
</details>

**Q2.** A can do a work in 10 days and B in 15 days. They work together for 3 days and the remaining work is completed by C in 2 days. If total wage is ₹3000, find C's wage.
<details>
<summary>Solution</summary>
* Total work $= 30$ units (LCM of 10, 15).
* Efficiencies: A $= 3$, B $= 2$.
* In 3 days, A and B do $(3+2) \times 3 = 15$ units.
* Remaining work $= 30 - 15 = 15$ units, which is done by C.
* C's work share $= 15/30 = 1/2$.
* C's wage $= 3000 \times \frac{1}{2} = $ **₹1500** ✓
</details>

---

## 3. Complex Interest ⭐⭐⭐

### Concept
Advanced interest problems test varying compounding cycles and difference formulas between compound and simple interest.

### Key Formulas
$$\text{Compounded Half-Yearly: } A = P\left(1 + \frac{R}{200}\right)^{2T}$$
$$CI_2 - SI_2 = P\left(\frac{R}{100}\right)^2$$
$$CI_3 - SI_3 = P\left(\frac{R}{100}\right)^2 \left(3 + \frac{R}{100}\right)$$

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** A sum of money becomes ₹13,380 after 3 years and ₹20,070 after 6 years at Compound Interest. Find the principal.
<details>
<summary>Solution</summary>
* $P(1 + R/100)^3 = 13380$
* $P(1 + R/100)^6 = 20070$
* Divide equations:
  $$(1 + R/100)^3 = \frac{20070}{13380} = 1.5$$
* Substitute back:
  $$P(1.5) = 13380 \implies P = \text{\textbf{8920}}$$ ✓
</details>

**Q2.** If the difference between CI compounded half-yearly and SI on a sum of money for 1 year at 10% is ₹25, find the principal.
<details>
<summary>Solution</summary>
* Compounded half-yearly: $CI = P(1.05)^2 - P = 0.1025P$.
* Simple Interest: $SI = 0.10P$.
* Difference $= 0.0025P = 25 \implies P = $ **10000** ✓
</details>

---

## 4. Geometry & Mensuration ⭐⭐⭐

### Concept
TCS NQT advanced geometry focuses on volume conversions (melting/casting shapes) and percentage parameter modifications.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** A sphere of radius 6 cm is melted and cast into a wire of radius 0.2 cm. Find the length of the wire in cm.
<details>
<summary>Solution</summary>
$$\text{Volume of Sphere} = \frac{4}{3} \pi r^3 = \frac{4}{3} \pi (6)^3 = 288\pi$$
$$\text{Volume of Wire (Cylinder)} = \pi R^2 L = \pi (0.2)^2 L = 0.04\pi L$$
$$288\pi = 0.04\pi L \implies L = \frac{288}{0.04} = \text{\textbf{7200}}\text{ cm}$$ ✓
</details>

**Q2.** The radius of a cylinder is increased by 50% and its height is decreased by 40%. Find the percentage change in its volume.
<details>
<summary>Solution</summary>
* $V = \pi r^2 h$.
* Radius multiplier $= 1.5 \implies r^2$ multiplier $= 2.25$.
* Height multiplier $= 0.6$.
* New volume multiplier $= 2.25 \times 0.6 = 1.35$.
* Volume increases by **35%** ✓
</details>

---

## 5. Number Theory ⭐⭐⭐

### Concept
This topic tests prime factors, trailing zeros in factorials, and Fermat's Little Theorem exponents.

### ⚡ Shortcut Tricks
1. **Trailing Zeros**: Count powers of 5. Trailing zeros in $N! = \lfloor N/5 \rfloor + \lfloor N/25 \rfloor + \dots$
2. **Modulo Powers**: If dividing by prime $P$, use Fermat's $a^{P-1} \equiv 1 \pmod P$ to reduce the exponent.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** Find the number of trailing zeros in $100!$.
<details>
<summary>Solution</summary>
$$\text{Zeros} = \lfloor 100/5 \rfloor + \lfloor 100/25 \rfloor = 20 + 4 = \text{\textbf{24}}$$ ✓
</details>

**Q2.** Find the remainder when $2^{1000}$ is divided by 13.
<details>
<summary>Solution</summary>
* Divisor 13 is prime. By Fermat's: $2^{12} \equiv 1 \pmod{13}$.
* Divide exponent by 12: $1000 = 12 \times 83 + 4$.
* $2^{1000} \equiv 2^4 \pmod{13} \equiv 16 \pmod{13} = $ **3** ✓
</details>

---

## 6. Permutation & Combination Traps ⭐⭐⭐

### Concept
Advanced P&C tests derangements (no item in its correct position) and words with repeating characters.

### Key Formulas
$$\text{Derangements of } n \text{ items: } !n = n! \sum_{i=0}^{n} \frac{(-1)^i}{i!}$$
$$!3 = 2, \quad !4 = 9, \quad !5 = 44$$

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** In how many ways can the letters of the word **ASSASSIN** be arranged?
<details>
<summary>Solution</summary>
* Word length $= 8$. S is repeated 4 times, A is repeated 2 times.
$$\text{Ways} = \frac{8!}{4! \cdot 2!} = \frac{40320}{24 \times 2} = \text{\textbf{840}}$$ ✓
</details>

**Q2.** In how many ways can 4 letters be placed into 4 addressed envelopes such that none of the letters goes into the correct envelope?
<details>
<summary>Solution</summary>
This is a derangement of 4 items:
$$!4 = 24 \left(\frac{1}{2} - \frac{1}{6} + \frac{1}{24}\right) = 12 - 4 + 1 = \text{\textbf{9}}$$ ✓
</details>

---

# BLOCK B — Advanced Reasoning

---

## 7. Complex Seating ⭐⭐⭐

### Concept
This covers mixed facing directions in circular layouts and parallel row seating.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** 8 people A, B, C, D, P, Q, R, S sit in parallel rows facing each other. Row 1 (A,B,C,D) faces South. Row 2 (P,Q,R,S) faces North. A sits opposite Q, who is next to P. D sits at the extreme end. S sits opposite C. Find who sits opposite B.
<details>
<summary>Solution</summary>
* Row 1 (South): D - B - C - A
* Row 2 (North): P - Q - S - R
* Match layouts to satisfy constraints: A is opposite Q. S is opposite C. D is at extreme left.
* B is seated opposite **P**. ✓
</details>

---

## 8. Input-Output Machine ⭐⭐⭐

### Concept
Word and number rearrangement steps based on alternating rules (alphabetical vs. numeric).

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** Find the number of steps required to sort: **cat 40 dog 10 apple 90** using the logic: highest number first, then alphabetical word in alternating steps.
<details>
<summary>Solution</summary>
* Step 1: **90** cat 40 dog 10 apple (Bring highest number 90)
* Step 2: 90 **apple** cat 40 dog 10 (Bring first word alphabetically)
* Step 3: 90 apple **40** cat dog 10 (Next highest number)
* Step 4: 90 apple 40 **cat** 10 dog (Next word alphabetical)
* Step 5: 90 apple 40 cat **10** dog (Sorted!)
* Total steps = **4** ✓
</details>

---

## 9. Logical Puzzles ⭐⭐⭐

### Concept
Grid logic involving multiple attributes per candidate.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** 6 people live on floors 1 to 6. A lives on an even floor. B lives immediately above C. D lives on floor 1. E lives below A. F lives on which floor if E is on floor 5?
<details>
<summary>Solution</summary>
* Floor 1 = D.
* Floor 5 = E.
* Since E (5) is below A, A must be on Floor 6.
* B lives immediately above C $\implies$ B and C must occupy floors 3 and 2.
* This leaves floor 4 for F.
* **4** ✓
</details>

---

## 10. Critical Reasoning ⭐⭐⭐

### Concept
Assessing arguments for strengthening, weakening, assumptions, or inferences.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** **Argument**: "Introducing hybrid classes will reduce student attendance because students will prefer staying home." Which of the following weakens this?  
(A) Engagement rises 15% in hybrid classes.  
(B) Attendance in hybrid systems is higher than offline classes.
<details>
<summary>Solution</summary>
* The argument claims hybrid classes *reduce* attendance.
* Option B states attendance is actually *higher*, which directly contradicts and weakens the premise.
* **B** ✓
</details>

---

## 11. Data Sufficiency (Hard) ⭐⭐⭐

### Concept
Evaluating equation systems or logical relations for solvency.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** **Question**: What is the value of $x$?  
**Statement I**: $x^2 - 5x + 6 = 0$.  
**Statement II**: $x > 2$.
<details>
<summary>Solution</summary>
* Statement I: Solving gives $x = 2$ or $x = 3$. Not sufficient (two possible values).
* Statement II: $x > 2$. Not sufficient.
* Combined: $x$ must be 3. Sufficient.
* **Both statements together are sufficient** ✓
</details>

---

# BLOCK C — Mixed Application

---

## 12. Quantitative Reasoning (Passage) ⭐⭐⭐

### Concept
Translating dense text passages into algebraic equations or Venn diagrams.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** In a group of 50 people, 30 like tea, 25 like coffee, and 10 like both. How many like neither?
<details>
<summary>Solution</summary>
* $N(T \cup C) = N(T) + N(C) - N(T \cap C) = 30 + 25 - 10 = 45$.
* $\text{Neither} = 50 - 45 = $ **5** ✓
</details>

---

## 13. Case-based DI ⭐⭐⭐

### Concept
Multi-chart analysis (e.g. pie chart distributions split by gender ratios in tables).

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** A pie chart shows total employees $= 2000$. IT sector represents 20%. The table shows IT Male:Female $= 3:2$. Find number of Female IT employees.
<details>
<summary>Solution</summary>
* $\text{IT employees} = 20\% \text{ of } 2000 = 400$.
* $\text{Females in IT} = 400 \times \frac{2}{5} = $ **160** ✓
</details>

---

## 14. Visual Reasoning ⭐⭐⭐

### Concept
Visual matrix completions, mirroring, and rotational progression.

---

### PYQ-Style Questions (TCS NQT Pattern)

**Q1.** A square has a dot at top-left. In successive figures, it is top-right, then bottom-right. What is the next position of the dot?
<details>
<summary>Solution</summary>
* The dot rotates $90^\circ$ clockwise along the corners.
* After bottom-right, the dot shifts to the **bottom-left** corner. ✓
</details>

---

## 💡 10 Advanced Concepts Every Student Misses

| # | Concept | Application |
|---|---------|-------------|
| 1 | **Derangement Formula** | Use $!n$ when no item can be in its correct folder. |
| 2 | **Successive Dilution** | Remaining active liquid $= V_0(1 - y/x)^n$. |
| 3 | **Fermat's Theorem** | $a^{P-1} \equiv 1 \pmod{P}$ reduces large modulo exponent powers. |
| 4 | **Mixture Normalization** | Always equalize capacities using LCM of ratio sums before adding parts. |
| 5 | **Circular Left/Right** | Clockwise is Left when facing center; Clockwise is Right when facing outside. |
| 6 | **Data Sufficiency Goal** | Stop solving once you reach a unique solvable equation system. |
| 7 | **Work Done Wage Share** | Split wages by $E \times T$ share, not raw efficiency, if working times differ. |
| 8 | **Shadow Rule** | Sunrise shadow is West; Sunset shadow is East. |
| 9 | **Leap Year Centuries** | Years ending in 00 must be divisible by 400 to count as leap years. |
| 10 | **Axis Scales in DI** | Watch out for units on graph axes (thousands vs. millions). |
