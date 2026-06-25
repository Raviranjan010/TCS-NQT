# TCS NQT 2026 — Night Revision & Exam Day Strategy
**Exam Date: June 28, 2026 | Location: LPU Testing Lab | Prepared for: Ravi Ranjan**

---

## 🌙 1. LAST-NIGHT REVISION SHEET (June 27, 10:00 PM)

Spend exactly **90 minutes** reviewing these tables and templates before sleeping. Do not try to solve new problems.

### 🔢 Numerical Quick Recall
| Topic | Key Formula / Method | Core Shortcut |
| :--- | :--- | :--- |
| **Percentages** | Net change $= x + y + \frac{xy}{100}$ | Price increases $R\% \implies$ reduce consumption by $\frac{R}{100+R} \times 100\%$ |
| **Simple Interest** | $SI = \frac{P \cdot R \cdot T}{100}$ | Principal doubles in $N$ years $\implies R = 100/N$ |
| **Compound Interest** | $CI_2 - SI_2 = P\left(\frac{R}{100}\right)^2$ | $CI_3 - SI_3 = P\left(\frac{R}{100}\right)^2 \left(3 + \frac{R}{100}\right)$ |
| **Time & Work** | $\text{Work} = \text{Efficiency} \times \text{Time}$ | Efficiencies are additive: $\text{Combined E} = E_A + E_B$ |
| **Pipes & Cisterns** | $\text{Capacity} = \text{LCM of times}$ | Outlet pipe efficiency is **negative** |
| **Time, Speed & Dist.**| $\text{Relative Speed (Opposite)} = S_1 + S_2$ | $\text{Relative Speed (Same)} = S_1 - S_2$; $1\text{ km/h} = 5/18\text{ m/s}$ |
| **Boats & Streams** | Downstream $= U + V$ \| Upstream $= U - V$ | Boat in still water $U = \frac{D + U_p}{2}$; stream speed $V = \frac{D - U_p}{2}$ |
| **P & C** | $P(n, r) = \frac{n!}{(n-r)!}$ \| $C(n, r) = \frac{n!}{r!(n-r)!}$ | Repeating letters: $\frac{L!}{a! \cdot b!}$; Circular arrangement: $(n-1)!$ |

### 🧩 Reasoning Quick Recall
* **Number Series (Difference Table)**: Draw rows $D_1 \to D_2 \to D_3$ immediately. If alternating, split indices odd vs. even.
* **Directions (Shadows & Compass)**: 
  * Sunrise shadow is **West**; Sunset shadow is **East**. 
  * Clockwise turn: North $\to$ East $\to$ South $\to$ West.
* **Seating (30-Sec Circular)**: Draw a circle with intersecting straight lines for even people so opposites are visible immediately. Start only with the **definite clue**.
* **Syllogisms (6-Line Venn Rules)**:
  1. "Some A are B" $\implies$ overlap circles.
  2. "All A are B" $\implies$ A is inside B.
  3. "No A is B" $\implies$ disjoint circles.
  4. "Some A are not B" $\implies$ part of A cannot enter B.
  5. Check minimum and maximum overlap possibility cases.
  6. A conclusion is valid only if it holds true in all setups.

### 📝 Verbal Quick Recall
* **Top 10 Vocabulary Triggers**:
  * *Mitigate / Alleviate*: reduce severity (load/risk).
  * *Exacerbate*: worsen a problem.
  * *Facilitate*: make an action easy.
  * *Obsolete*: outdated libraries/protocols.
  * *Ambiguous*: unclear requirements.
  * *Redundant*: backup servers or code duplication.
  * *Thereby*: followed by a verb ending in "-ing".
  * *Notwithstanding*: in spite of.
  * *Feasible*: practical project paths.
  * *Pragmatic*: realistic budget choices.
* **Email Structure Checklist**: Separate Subject Line $\to$ Salutation (Dear Name) $\to$ 3 distinct paragraphs $\to$ Professional Sign-off (Best regards) $\to$ Name and Title.
* **Passage Recall (5-Point Skeleton)**: Mentally extract: **Subject** $\to$ **Trend** $\to$ **Cause** $\to$ **Impact** $\to$ **Metric** ($40\%$, $2030$).

### 💻 Coding Quick Recall
* **Circular Array DP**: Run linear DP twice: `max(solve(arr, 0, n - 2), solve(arr, 1, n - 1))`.
* **Max XOR with K Set Bits**: Count zeros at each bit position $b \in [0, 30]$, sort by gain $\text{zeros} \times 2^b$ descending, set top $K$ bits.
* **Perfect Square Digit Sum**: small $N$: greedy prefix of "1"s followed by sorted square-sum combinations of remaining digits.
* **Task Scheduler Priority Queue**:
  ```cpp
  // Use std::priority_queue (default max-heap) to track frequencies
  priority_queue<pair<int, int>> max_heap; // stores {frequency, element}
  ```
* **Swaps to Center**: Manhattan Distance $= |r - \text{center}| + |c - \text{center}|$. Find the minimum among all maximum values.

---

## ⏱️ 2. EXAM DAY TIMELINE (June 28, 2026)

* **T-90 min**: Wake up. Eat a light, high-glucose breakfast (e.g. fruits, toast, tea). Avoid heavy oily foods.
* **T-60 min**: Review this Quick Recall sheet. Do not check your phone for social media updates.
* **T-30 min**: Reach your assigned LPU lab. Check your Admit Card, government ID, water bottle, and pen.
* **T-15 min**: Sit down at your station, log in, adjust your keyboard/mouse, and write the CI-SI and Speed equations on your rough sheet.
* **T-0**: Test begins.

### 🎮 Section-by-Section Game Plan

#### 1. Numerical Ability (20Q | 25 min)
* **Goal**: Solve 12–14 questions.
* **Tactic**: Do easy number properties and percentages first. If you spend $>90$ seconds on one question, **skip it** immediately. Enter numbers directly for Non-MCQs (no `%` or `₹` symbols).

#### 2. Reasoning Ability (20Q | 25 min)
* **Goal**: Solve 15+ questions.
* **Tactic**: Solve series, clocks, and syllogisms first. Save the complex seating arrangement puzzle for the final 5 minutes.

#### 3. Advanced Quant & Reasoning (14Q | 25 min)
* **Goal**: Solve 8–10 questions.
* **Tactic**: Focus on Number Theory, CI-SI formulas, and Critical Reasoning first. **Do not attempt all 14 questions** under pressure; accuracy is highly weighted here.

#### 4. Verbal Ability (25Q | 26 min)
* **Sentence Completion**: Select/type your first instinct. Do not overthink; you only have 25 seconds per question.
* **Passage Recall**: Spend the 30-second reading time identifying the core nouns. Paraphrase using different words to avoid plagiarism detection.
* **Email Writing (9 min)**: Start typing immediately. You **must write at least 100 words**. Check your word count and spelling at the 7-minute mark.

#### 5. Coding (Easy: 35 min | Medium: 55 min)
* **Strategy**: Read logic (2 min) $\to$ draft code (15 min) $\to$ check edge cases (10 min) $\to$ **Compile** and **Save** (5 min).

---

## 🛡️ 3. CONTINGENCY PLANS — IF THINGS GO WRONG

* **"I cannot solve the coding logic"**: Do not panic. Write a brute-force solution to pass 2 out of the 5 private test cases. **Partial marks are awarded** and are vital for clearing the cutoff.
* **"I am running out of time in Verbal"**: Do not leave any blank fields. Since there is no negative marking, type any fitting synonym immediately.
* **"My code has a compilation error I can't resolve"**: If a secondary feature causes the crash, comment it out. Submit a simpler, working version of the code that handles basic cases.
* **"I forgot the formula during Aptitude"**: Use approximation. For example, if you forgot the CI formula, estimate the interest linearly using SI, then add a small offset. Eliminate obviously incorrect options.

---

## ❌ 4. CRITICAL DO-NOTS ON EXAM DAY

* ❌ **Do NOT hard-code inputs** in your code (always use `sys.stdin.read` or `input()`).
* ❌ **Do NOT forget to click both "Compile Code" AND "Save Code"** (or Submit). If you miss this, your code is recorded as empty.
* ❌ **Do NOT include symbols** (like `%`, `₹`, `km`, or spaces) in the Non-MCQ fill-in-the-blank boxes.
* ❌ **Do NOT use contractions** (e.g., *don't*, *can't*) in your Email Writing. Write *do not* and *cannot*.
* ❌ **Do NOT copy the Passage Recall text word-for-word**. The similarity checker will penalize exact copies.
* ❌ **Do NOT refresh the browser window** under any circumstances. If the system freezes, call the invigilator immediately.

---

## 🏆 5. CONFIDENCE AFFIRMATION

As an LPU student who has completed this preparation pack:
* **Expected Aptitude Score**: You should expect to solve **$32+$ out of $54$ questions** correctly across the Aptitude sections.
* **Expected Coding Score**: You are fully equipped to pass the Easy Coding question and secure partial credit on the Medium Coding question.
* **Placement Cutoffs**:
  * **Ninja Profile (₹3.3 - ₹3.6 LPA)**: Requires $\approx 60\%$ in Aptitude and passing the Easy coding test cases.
  * **Digital / Prime Profile (₹7 - ₹9 LPA)**: Requires $\approx 75\%$ in Aptitude and passing both Easy and Medium coding test cases.

> **Final Affirmation**: "I have trained on actual PYQs, reviewed all shortcuts, and verified my coding hygiene. I will stay calm, manage my time, and execute my game plan. Success is mine."
