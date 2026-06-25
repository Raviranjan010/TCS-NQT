# TCS NQT 2026 — Advanced Quant & Reasoning Complete Guide
**Exam Date: June 28, 2026 | Prepared for: Ravi Ranjan**

---

## 🎯 Section Strategy & Priority Table

The Advanced section contains **14 Questions** with a **25-minute limit** (~107 seconds per question). Because there is no negative marking, and the questions are complex, you should prioritize the high-yield, faster-to-solve topics first to lock in 8 marks immediately, then tackle the rest.

### 📊 Question Priority Table
| Priority | Topic | Expected Time | Why Attempt First? |
| :--- | :--- | :--- | :--- |
| **01** | 5. Number Theory (LCM/HCF, zeros) | 60 sec | Direct formula application. |
| **02** | 6. Permutation/Combination Traps | 75 sec | Binary choices, letters arrangement. |
| **03** | 3. Complex Interest (CI-SI difference) | 80 sec | Straightforward algebraic calculation. |
| **04** | 10. Critical Reasoning | 80 sec | Reading comprehension, no calculation. |
| **05** | 11. Data Sufficiency (Hard) | 90 sec | You only need to verify solvency. |
| **06** | 1. Mixtures & Alligations | 90 sec | Standard alligation cross method. |
| **07** | 2. Work & Wages | 100 sec | Efficiency ratio matching. |
| **08** | 4. Geometry & Mensuration | 100 sec | Formula-based parameter changes. |
| **09** | 14. Visual Reasoning | 45 sec | Quick visual pattern elimination. |
| **10** | 12. Quantitative Reasoning (Passage) | 120 sec | Requires reading and building equations. |
| **11** | 9. Logical Puzzles (Constraints) | 150 sec | High time cost, attempt in last minutes. |
| **12** | 7. Complex Seating | 150 sec | High variable count, double-row traps. |
| **13** | 8. Input-Output Machine | 180 sec | Multiple step-tracing cycles. |
| **14** | 13. Case-based DI | 180 sec | Multi-step graph calculations. |

---

## 📊 BLOCK A — ADVANCED QUANTITATIVE

### 1. Mixtures & Alligations
* **Advanced Concept**: Moving beyond simple mixtures to $3$-container mixing (e.g. ratios $A:B:C$) and successive dilution.
  $$\text{Final Conc.} = \text{Initial Conc.} \times \left(1 - \frac{y}{x}\right)^n$$
  where $y$ is the quantity replaced, $x$ is total capacity, and $n$ is cycles.
* **Solving Template (Rough Paper)**:
  * Draw two columns for Container 1 and Container 2.
  * Write the ratio fractions.
  * Draw the cross diagram with the target mean in the center.
* **Time Allocation**: 90 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: A container contains 80L of milk. 8L of milk is replaced by water. This process is repeated 2 more times. Find the final quantity of milk.  
     *Sol*: $M_f = 80 \times (1 - 8/80)^3 = 80 \times (0.9)^3 = 80 \times 0.729 = 58.32$L. **Ans: 58.32**
  2. *Q*: In what ratio should two mixtures of milk and water with ratios $5:2$ and $7:6$ be mixed to get a final ratio of $8:5$?  
     *Sol*: Fractional part of milk: $M_1 = 5/7$, $M_2 = 7/13$, Mean $M_m = 8/13$.  
     Alligation: $(7/13 - 8/13) : (8/13 - 5/7) = 1/13 : |56/91 - 65/91| = 1/13 : 9/91 = 7:9$. **Ans: 7:9**
  3. *Q*: Three vessels of equal capacity contain milk and water in ratios $2:1$, $3:1$, and $3:2$. If they are mixed, find the ratio of milk to water.  
     *Sol*: Total parts: $3$, $4$, $5$. LCM $= 60$. Scale capacities to 60:  
     V1: $40$M, $20$W. V2: $45$M, $15$W. V3: $36$M, $24$W.  
     Total Milk $= 40+45+36 = 121$. Total Water $= 20+15+24 = 59$. Ratio $= 121:59$. **Ans: 121:59**
  4. *Q*: A merchant has 100 kg of sugar, part of which he sells at $8\%$ profit and the rest at $18\%$ profit. He gains $14\%$ on the whole. Find the quantity sold at $18\%$.  
     *Sol*: $(18 - 14) : (14 - 8) = 4:6 = 2:3$. Quantity at $18\% = \frac{3}{5} \times 100 = 60$ kg. **Ans: 60**
  5. *Q*: A jar is filled with 1 part water and 3 parts juice. What fraction of the mixture must be drawn off and replaced with water so that the mixture contains half juice and half water?  
     *Sol*: Let total capacity $= 4$. Original: $1$W, $3$J. Let $x$ be drawn off. Remaining: $1 - x/4$ W, $3 - 3x/4$ J.  
     Add $x$ water: $(1 - x/4 + x) = 3 - 3x/4 \implies 1 + 3x/4 = 3 - 3x/4 \implies 6x/4 = 2 \implies x = 4/3$.  
     Fraction drawn off $= x/4 = 1/3$. **Ans: 1/3**
* **Trap Questions**:
  * ⚠️ *Trap*: Mixing three liquids without converting to a common denominator (adding ratios directly like $(2+3+3):(1+1+2) = 8:4 = 2:1$). This is wrong because capacities must be normalized. Correct ratio is $121:59$.

---

### 2. Work & Wages
* **Advanced Concept**: Distribution of wages based on work done, not time taken. Efficiency determines wage share: $\text{Wage Ratio} = \text{Work done by A} : \text{Work done by B}$.
* **Solving Template (Rough Paper)**:
  * List workers horizontally.
  * Calculate efficiencies using LCM.
  * Multiply efficiencies by the days worked to get the **work done shares**.
* **Time Allocation**: 100 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: A, B, and C can do a work in 6, 8, and 12 days respectively. They complete the work together and receive ₹1350. Find B's share.  
     *Sol*: LCM of 6, 8, 12 is 24 (Work). Efficiencies: A $= 4$, B $= 3$, C $= 2$. Since they worked for same time, wage is in ratio of efficiency $4:3:2$.  
     B's share $= \frac{3}{9} \times 1350 = 450$. **Ans: 450**
  2. *Q*: A can do a work in 10 days and B in 15 days. They work together for 3 days and the remaining work is done by C in 2 days. If the total wage is ₹3000, find C's wage.  
     *Sol*: Total work $= 30$. Efficiency: A $= 3$, B $= 2$. In 3 days, A and B do $(3+2) \times 3 = 15$ units.  
     Remaining work (15 units) is done by C. C's work share $= 15/30 = 1/2$. C's wage $= 3000 \times (1/2) = ₹1500$. **Ans: 1500**
  3. *Q*: 3 men and 4 women can earn ₹3780 in 7 days. 11 men and 13 women can earn ₹15040 in 8 days. How much will 7 men and 9 women earn in 10 days?  
     *Sol*: 
     * $(3M + 4W)$ daily wage $= 3780/7 = 540$.
     * $(11M + 13W)$ daily wage $= 15040/8 = 1880$.
     * Solve equations: $M = 100, W = 60$.
     * $(7M + 9W)$ daily wage $= 7(100) + 9(60) = 1240$. In 10 days $= 1240 \times 10 = ₹12400$. **Ans: 12400**
  4. *Q*: A, B, and C contract a work for ₹550. A and B do $7/11$ of the work. What is C's share?  
     *Sol*: Work done by C $= 1 - 7/11 = 4/11$. C's share $= \frac{4}{11} \times 550 = 200$. **Ans: 200**
  5. *Q*: A can do a work in 12 days, B in 15 days. With help of C they finish it in 5 days. Total wage is ₹960. Find C's share.  
     *Sol*: Total work $= 60$. Efficiency: A $= 5$, B $= 4$. Combined efficiency $= 60/5 = 12$.  
     C's efficiency $= 12 - 5 - 4 = 3$. C's wage share $= 3/12 = 1/4$. C's wage $= 960 \times (1/4) = ₹240$. **Ans: 240**
* **Trap Questions**:
  * ⚠️ *Trap*: Distributing wages in ratio of time taken (e.g. $12:15:20$). This assumes slower workers do more work, which is incorrect. Wage must be distributed in ratio of efficiency (or work done).

---

### 3. Complex Interest
* **Advanced Concept**: Deriving principal or rate when interest compounding cycles shift mid-term, or solving complex annual rate variations.
* **Solving Template (Rough Paper)**:
  * Identify compounding type (SI vs CI).
  * Write the multi-year difference formula.
* **Time Allocation**: 80 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: The difference between CI and SI on a sum of money for 3 years at $10\%$ is ₹620. Find the principal.  
     *Sol*: $CI - SI = P(R/100)^2 (3 + R/100) \implies 620 = P(10/100)^2 (3.1) \implies 620 = P(1/100)(3.1) \implies P = 20,000$. **Ans: 20000**
  2. *Q*: A sum of money becomes ₹13,380 after 3 years and ₹20,070 after 6 years at CI. Find the principal.  
     *Sol*: $P(1 + R/100)^3 = 13380$ and $P(1 + R/100)^6 = 20070$.  
     Divide the second by the first: $(1 + R/100)^3 = \frac{20070}{13380} = 1.5$.  
     Substitute back: $P(1.5) = 13380 \implies P = 8920$. **Ans: 8920**
  3. *Q*: If the difference between CI compounded half-yearly and SI on a sum of money for 1 year at $10\%$ is ₹25, find the sum.  
     *Sol*: Compounded half-yearly: $CI = P(1.05)^2 - P = 0.1025P$. Simple Interest: $SI = 0.10P$.  
     Difference $= 0.0025P = 25 \implies P = 10,000$. **Ans: 10000**
  4. *Q*: A man borrowed ₹20,000 at $10\%$ CI. He pays ₹10,000 at the end of each year. Find the amount he needs to pay at the end of the 2nd year to clear his debt.  
     *Sol*: 
     * Year 1 end: Amount $= 20000 \times 1.1 = 22000$. Paid ₹10,000. Balance $= 12000$.
     * Year 2 end: Amount $= 12000 \times 1.1 = 13200$. **Ans: 13200**
  5. *Q*: Find the effective annual rate of interest equivalent to a nominal rate of $6\%$ per annum compounded half-yearly.  
     *Sol*: Half-yearly rate $= 3\%$. Effective rate $= 3 + 3 + (3 \times 3)/100 = 6.09\%$. **Ans: 6.09**
* **Trap Questions**:
  * ⚠️ *Trap*: Forgetting that half-yearly compounding changes the interest cycles. In 1 year, there are 2 cycles at $5\%$, not 1 cycle at $10\%$.

---

### 4. Geometry & Mensuration
* **Advanced Concept**: 3D conversion problems (e.g. melting cylinders to make spheres) and fractional volume variations.
* **Solving Template (Rough Paper)**:
  * Equalize volumes when melting or reshaping objects: $V_1 = V_2$.
* **Time Allocation**: 100 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: A sphere of radius 6 cm is melted and cast into a wire of radius 0.2 cm. Find the length of the wire.  
     *Sol*: Volume of sphere $= \frac{4}{3} \pi r^3 = \frac{4}{3} \pi (6)^3 = 288\pi$.  
     Volume of wire (cylinder) $= \pi R^2 L = \pi (0.2)^2 L = 0.04\pi L$.  
     $288\pi = 0.04\pi L \implies L = 288 / 0.04 = 7200$ cm $= 72$m. **Ans: 7200** (or 72 depending on unit requested)
  2. *Q*: The radius of a cylinder is increased by $50\%$ and its height is decreased by $40\%$. Find the percentage change in its volume.  
     *Sol*: $V = \pi r^2 h$. Radius factors: $1.5 \times 1.5 = 2.25$. Height factor: $0.6$.  
     New volume factor $= 2.25 \times 0.6 = 1.35 \implies 35\%$ increase. **Ans: 35**
  3. *Q*: A metallic sheet of size $22\text{cm} \times 10\text{cm}$ is rolled along its length to form a cylinder. Find the volume of the cylinder.  
     *Sol*: Circumference of base $= 2\pi r = 22 \implies r = 3.5$ cm. Height $h = 10$ cm.  
     Volume $= \pi r^2 h = (22/7) \times 3.5 \times 3.5 \times 10 = 385$ cubic cm. **Ans: 385**
  4. *Q*: A cone and a cylinder have equal bases and equal heights. Find the ratio of their volumes.  
     *Sol*: $V_{\text{cone}} = \frac{1}{3} \pi r^2 h$, $V_{\text{cylinder}} = \pi r^2 h$. Ratio $= 1:3$. **Ans: 1:3**
  5. *Q*: If the surface area of a sphere is increased by $44\%$, find the percentage increase in its volume.  
     *Sol*: Surface Area $= 4\pi r^2$. $44\%$ increase $\implies r^2$ becomes $1.44 \implies r$ increases by $20\%$ (factor 1.2).  
     Volume $\propto r^3 \implies (1.2)^3 = 1.728 \implies 72.8\%$ increase. **Ans: 72.8**
* **Trap Questions**:
  * ⚠️ *Trap*: Forgetting that radius is squared in cylinder/cone volume. An increase of $50\%$ in radius changes volume by $1.5^2 = 2.25$ factor, not $1.5$.

---

### 5. Number Theory
* **Advanced Concept**: Divisibility, trailing zeros in $N!$, and finding the last two digits of exponential values.
* **Solving Template (Rough Paper)**:
  * Trailing zeros: divide $N$ by 5, then 25, 125, etc., and sum quotients.
* **Time Allocation**: 60 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: Find the number of trailing zeros in $100!$.  
     *Sol*: $\lfloor 100/5 \rfloor + \lfloor 100/25 \rfloor = 20 + 4 = 24$. **Ans: 24**
  2. *Q*: Find the highest power of 3 that divides $80!$ completely.  
     *Sol*: $\lfloor 80/3 \rfloor + \lfloor 80/9 \rfloor + \lfloor 80/27 \rfloor + \lfloor 80/81 \rfloor = 26 + 8 + 2 + 0 = 36$. **Ans: 36**
  3. *Q*: Find the remainder when $2^{1000}$ is divided by 13.  
     *Sol*: $2^{12} \equiv 1 \pmod{13}$ (Fermat's). $1000 = 12 \times 83 + 4$.  
     $2^{1000} \equiv 2^4 \pmod{13} \equiv 16 \pmod{13} \equiv 3$. **Ans: 3**
  4. *Q*: Find the HCF of $2^3 \times 3^2 \times 5$ and $2^2 \times 3^3 \times 7$.  
     *Sol*: Take minimum power of common bases: $2^2 \times 3^2 = 4 \times 9 = 36$. **Ans: 36**
  5. *Q*: A number $N$ when divided by 6 leaves remainder 4. What is remainder of $3N$ divided by 6?  
     *Sol*: $N = 6k + 4 \implies 3N = 18k + 12$. Dividing by 6 leaves 0 remainder. **Ans: 0**
* **Trap Questions**:
  * ⚠️ *Trap*: Writing down $100/5 = 20$ as the number of zeros in $100!$, forgetting to add the 4 zeros contributed by multiples of 25.

---

### 6. Permutation/Combination Traps
* **Advanced Concept**: Derangements (no item in its correct position) and alike-letter permutations.
  $$\text{Derangement formula: } !n = n! \left(1 - \frac{1}{1!} + \frac{1}{2!} - \frac{1}{3!} + \dots + (-1)^n \frac{1}{n!}\right)$$
* **Solving Template (Rough Paper)**:
  * Match repeating items first and divide total permutations by their factorials.
* **Time Allocation**: 75 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: In how many ways can the letters of the word **ASSASSIN** be arranged?  
     *Sol*: Length $= 8$. S repeated 4 times, A repeated 2 times.  
     Ways $= \frac{8!}{4! \cdot 2!} = \frac{40320}{24 \times 2} = 840$. **Ans: 840**
  2. *Q*: In how many ways can 4 letters be placed into 4 addressed envelopes such that none of the letters goes into the correct envelope?  
     *Sol*: Derangement $!4 = 4!(1 - 1 + 1/2 - 1/6 + 1/24) = 24(12/24 - 4/24 + 1/24) = 9$. **Ans: 9**
  3. *Q*: How many odd numbers of 4 digits can be formed using digits $0, 1, 2, 3$ without repetition?  
     *Sol*: Let slots be _ _ _ _. Unit digit must be odd (1 or 3) $\implies 2$ choices.  
     Thousand digit cannot be 0, and 1 choice is used at unit place $\implies 2$ choices.  
     Remaining digits for middle slots $= 2! = 2$. Total $= 2 \times 2 \times 2 = 8$. **Ans: 8**
  4. *Q*: In how many ways can 5 boys and 5 girls sit in a row such that no two girls sit together?  
     *Sol*: Place boys first: $5! = 120$. This creates 6 gaps. Select 5 gaps for girls: $C(6,5) \times 5! = 6 \times 120 = 720$.  
     Total ways $= 120 \times 720 = 86400$. **Ans: 86400**
  5. *Q*: A box contains 2 white balls, 3 black balls, and 4 red balls. In how many ways can 3 balls be drawn if at least 1 black ball is to be included?  
     *Sol*: Total ways $- \text{ways with no black} = C(9,3) - C(6,3) = 84 - 20 = 64$. **Ans: 64**
* **Trap Questions**:
  * ⚠️ *Trap*: Forgetting to divide by repeating letters. Arranging ASSASSIN as simply $8! = 40,320$ is a common trap.

---

## 📊 BLOCK B — ADVANCED REASONING

### 7. Complex Seating
* **Advanced Concept**: Seating arrangements involving double parallel rows or circular seating with mixed facing directions.
* **Solving Template (Constraint Table)**:
  * Draw the two parallel rows. Match them with arrows ($\uparrow$ and $\downarrow$) indicating facing direction.
* **Time Allocation**: 150 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: 8 people A, B, C, D, P, Q, R, S sit in two parallel rows facing each other. Row 1 (A, B, C, D) faces South. Row 2 (P, Q, R, S) faces North. A sits opposite Q, who is next to P. D sits at extreme end. S sits opposite C. Find who sits opposite B.  
     *Sol*: Setup grid. Placing A-Q. D is at end. Since S is opposite C, and C is in Row 1, S must be in Row 2. Resolving all gives B opposite P. **Ans: P**
  2. *Q*: 8 people sit around a circular table. 4 face center, 4 face outside. A faces center and sits opposite B. C sits to immediate left of A. Find facing direction of C.  
     *Sol*: Since A faces center, left of A is clockwise. C is adjacent to A. By constraints, C must face outside. **Ans: Outside**
* **Trap Questions**:
  * ⚠️ *Trap*: Reversing left and right for the row facing South. For South-facing people, their Left is your Right.

---

### 8. Input-Output Machine
* **Advanced Concept**: Tracking multi-step word and number rearrangement machines.
* **Solving Template (Rough Paper)**:
  * Write only the first letter of words and trace step numbers vertically.
* **Time Allocation**: 180 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: Input: **go 12 for 35 home 88 now 19**.  
     *Step 1*: **88 go 12 for 35 home now 19**.  
     *Step 2*: **88 for go 12 35 home now 19**.  
     Identify the logic.  
     *Sol*: Numbers are sorted descending, words are sorted alphabetically in alternating steps. **Ans: Descending numbers, Alphabetical words alternating**
  2. *Q*: For the above logic, find the number of steps required for input: **cat 40 dog 10 apple 90**.  
     *Sol*: 
     * Step 1: 90 cat 40 dog 10 apple
     * Step 2: 90 apple cat 40 dog 10
     * Step 3: 90 apple 40 cat dog 10
     * Step 4: 90 apple 40 cat 10 dog
     * Step 5: 90 apple 40 cat 10 dog (Sorted!). Total 4 steps. **Ans: 4**
* **Trap Questions**:
  * ⚠️ *Trap*: Counting an auto-arranged element as an active step. If an element falls into its correct position naturally, it does not increase the step count.

---

### 9. Logical Puzzles
* **Advanced Concept**: Grid puzzles involving 5–6 variables (e.g. Person, Floor, Color, Car, City).
* **Solving Template (Constraint Table)**:
  * Draw a matrix table with the fixed variable (e.g., Floor 1 to 6) as the left-most column.
* **Time Allocation**: 150 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: 6 people live on floors 1 to 6. A lives on an even floor. B lives immediately above C. D lives on floor 1. E lives below A. Find the floor of F.  
     *Sol*: Set D = 1. Floors 2-6 remaining. A must be 2, 4, or 6. If A = 6, E can be 5, B-C can be 3-2. This leaves F at 4. **Ans: 4**
  2. *Q*: 5 friends own different cars (A, B, C, D, E) of different colors (Red, Blue, Green, Yellow, Black). A owns a Red car. D does not own Blue or Green. Find color of D's car.  
     *Sol*: Match using elimination matrix. D must own Black or Yellow. **Ans: Black or Yellow**
* **Trap Questions**:
  * ⚠️ *Trap*: Forgetting to verify negative constraints (e.g. "D does not own Blue").

---

### 10. Critical Reasoning
* **Advanced Concept**: Evaluating arguments for Strengthening or Weakening.
* **Solving Template (Rough Paper)**:
  * Identify Premise $\to$ Conclusion. Choose the option that attacks or supports the assumption linking them.
* **Time Allocation**: 80 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: **Argument**: "Introducing hybrid classes will reduce student attendance because students will prefer staying home." Which of the following weakens this?  
     *Options*: (A) Hybrid classes show a $15\%$ increase in engagement. (B) Attendance in hybrid systems is higher than offline.  
     *Sol*: Option B directly attacks the core assumption about reduced attendance. **Ans: B**
  2. *Q*: **Argument**: "The company should ban social media during work hours to improve productivity." Which strengthens this?  
     *Options*: (A) Employees spend 2 hours daily on social media. (B) Banning social media causes employees to resign.  
     *Sol*: Option A provides proof of the distraction, strengthening the need for a ban. **Ans: A**
* **Trap Questions**:
  * ⚠️ *Trap*: Selecting an option that is related to the topic but does not affect the logical link between premise and conclusion.

---

### 11. Data Sufficiency (Hard)
* **Advanced Concept**: Checking sufficiency under complex variables.
* **Solving Template (Rough Paper)**:
  * Check Statement I $\to$ Check Statement II $\to$ Combine.
* **Time Allocation**: 90 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: **Question**: What is the value of $x$?  
     **Statement I**: $x^2 - 5x + 6 = 0$.  
     **Statement II**: $x > 2$.  
     *Sol*: I gives $x = 2$ or $3$ (not sufficient). II alone is not sufficient. Combined: $x = 3$. Sufficient. **Ans: Both statements together are sufficient**
  2. *Q*: **Question**: Is $A$ taller than $B$?  
     **Statement I**: $A$ is taller than $C$.  
     **Statement II**: $C$ is taller than $B$.  
     *Sol*: Combined: $A > C > B \implies A > B$. **Ans: Both statements together are sufficient**
* **Trap Questions**:
  * ⚠️ *Trap*: Assuming statement I is sufficient because it gives an equation, forgetting that a quadratic equation yields two different values.

---

## 📊 BLOCK C — MIXED APPLICATION

### 12. Quantitative Reasoning (Passage)
* **Advanced Concept**: Extracts numeric relations from a text block.
* **Solving Template (Rough Paper)**:
  * Read line-by-line and translate to algebra equations immediately.
* **Time Allocation**: 120 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: In a group of 50 people, 30 like tea, 25 like coffee, and 10 like both. How many like neither?  
     *Sol*: $N(T \cup C) = 30 + 25 - 10 = 45$. Neither $= 50 - 45 = 5$. **Ans: 5**
  2. *Q*: A class has boys and girls. If 15 boys leave, there are 2 girls for every boy. If 45 girls leave, there are 5 boys for every girl. Find the number of boys originally.  
     *Sol*: $G = 2(B-15)$ and $B = 5(G-45)$. Solve: $B = 40, G = 50$. **Ans: 40**
* **Trap Questions**:
  * ⚠️ *Trap*: In Venn diagrams, adding the "both" category twice. Always subtract the intersection.

---

### 13. Case-based DI
* **Advanced Concept**: Combined charts (e.g. Pie chart showing distribution + Table showing ratios of genders).
* **Solving Template (Rough Paper)**:
  * Extract absolute values for the relevant category first before applying ratio splits.
* **Time Allocation**: 180 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: A pie chart shows total employees $= 2000$. IT sector represents $20\%$. The table shows IT Male:Female $= 3:2$. Find number of Female IT employees.  
     *Sol*: IT employees $= 20\%$ of $2000 = 400$. Female IT $= \frac{2}{5} \times 400 = 160$. **Ans: 160**
  2. *Q*: For the above data, if Marketing is $15\%$ and Male:Female $= 1:2$, find total females in IT and Marketing.  
     *Sol*: Marketing $= 300$. Female Marketing $= 200$. Total females $= 160 + 200 = 360$. **Ans: 360**
* **Trap Questions**:
  * ⚠️ *Trap*: Applying the ratio to the wrong sector percentage.

---

### 14. Visual Reasoning
* **What it tests**: Non-verbal matrix completion and rotation patterns.
* **Step-by-step method**:
  1. Identify rotation angles ($45^\circ, 90^\circ$ clockwise/counter-clockwise).
  2. Count elements (e.g. number of lines, dots).
* **Time Allocation**: 45 seconds max.
* **Hard PYQ-style Questions**:
  1. *Q*: A square has a dot at top-left. In next figure, it is top-right, then bottom-right. Where is it next?  
     *Sol*: Rotating $90^\circ$ clockwise. Next position is bottom-left. **Ans: Bottom-left**
  2. *Q*: A series of figures has lines: 3, 5, 7, 9. Find number of lines in next figure.  
     *Sol*: $+2$ lines sequence $\implies 11$. **Ans: 11**
* **Trap Questions**:
  * ⚠️ *Trap*: Confusing a mirroring pattern with a $180^\circ$ rotation.

---

## 💡 10 Advanced Concepts Every Student Misses

1. **Derangements Formula**: $!n$ is used when no item should be in its designated spot.
2. **Successive Dilution**: The remaining quantity formula $V_n = V_0(1 - y/x)^n$.
3. **Fermat's Modulo Primality**: Using $a^{p-1} \equiv 1 \pmod p$ to solve huge powers like $3^{2000} \pmod 7$.
4. **Alligation scaling**: You must normalize mixture capacities before combining ratios.
5. **Seating facing directions**: Circular seats facing outside have reversed left/right rules.
6. **Data Sufficiency limit**: Do not waste time calculating the final number; stop once you confirm the equations are solvable.
7. **Wages share**: Wages are distributed based on the work done ($E \times T$), not efficiency alone, if times are different.
8. **Shadow angles**: Shadow at sunrise is West, sunset is East. Facing directions determine relative left/right.
9. **Leap year centurials**: Century years are leap only if divisible by 400.
10. **DI scale factors**: Pay close attention to graph axis labels (e.g., values in lakhs vs. crores).
