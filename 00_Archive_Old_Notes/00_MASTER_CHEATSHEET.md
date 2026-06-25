# TCS NQT 2026 — Master Cheatsheet
### 3-Minute Revision Dashboard · Exam Date: June 28, 2026

Welcome to the Master Cheatsheet. This file compiles all core formulas (with derivations), shortcuts (demonstrated on real numbers), coding templates, and visual solving paths.

---

## 🗺️ Master Decision Tree: Method Selection

```
                        Is it a Quantitative Question?
                                    |
                  +-----------------+-----------------+
                  | Yes                               | No (Reasoning)
                  v                                   v
        What is the primary topic?              What is the topic?
                  |                                   |
    +-------+-----+-----+-------+               +-----+-----+
    | %/PL  | SI/CI     | TSD   | Work          | Series    | Syllogism
    v       v           v       v               v           v
    Use     Use Diff    Use     Use LCM         Draw Diff   Use Venn
    Mult.   Formula     Rel.    Method          Table       Diagram
    Factors             Speed
```

---

## 🔢 Numerical Ability Cheatsheet

### 1. Percentages & Successive Changes
* **What is this?** Comparing fractions out of 100 where multiple changes occur in sequence.
* **Why does TCS ask this?** Tests compound effects and base confusion.
* **How do I recognize it?** Trigger words: "successive discount", "population growth", "value depreciates".
* **Formula & Derivation**:
  $$\text{Net Change} = x + y + \frac{xy}{100}\%$$
  * *Derivation*: Let initial value be $100$. After first change $x$, new value $= 100 \left(1 + \frac{x}{100}\right) = 100 + x$. After second change $y$, final value $= (100 + x) \left(1 + \frac{y}{100}\right) = 100 + x + y + \frac{xy}{100}$. Net change $= \text{Final} - \text{Initial} = x + y + \frac{xy}{100}\%$.
* **Immediate Worked Example**: A salary is increased by 20% and then decreased by 10%. Find the net change.
  * *Solution*: $x = 20, y = -10$. Net $= 20 + (-10) + \frac{20 \times (-10)}{100} = 10 - 2 = 8\%$.
* **Shortcut Demonstration**: Use Multiplying Factors.
  * *Demo*: $1.20 \times 0.90 = 1.08 \implies 8\%$ net increase.
* **Common Trap**: Adding percentages directly ($20\% - 10\% = 10\%$). **Avoid this!**
* **Difficulty Escalation**: If three successive changes are applied, group the first two using the formula, then apply the result with the third.
  * *Example*: 10%, 20%, 30% increases $\implies$ First two $= 10 + 20 + 2 = 32\%$. Combined with third $= 32 + 30 + \frac{32 \times 30}{100} = 62 + 9.6 = 71.6\%$.

### 2. Simple & Compound Interest
* **What is this?** Linear growth (SI) vs. exponential growth (CI) of capital over time.
* **Why does TCS ask this?** Tests calculation speed and multi-year differences.
* **How do I recognize it?** Trigger words: "compounded annually", "difference between CI and SI".
* **Formula & Derivation**:
  $$\text{CI}_2 - \text{SI}_2 = P \left(\frac{R}{100}\right)^2$$
  * *Derivation*: $SI_2 = \frac{2PR}{100}$. $CI_2 = P\left(1 + \frac{R}{100}\right)^2 - P = \frac{2PR}{100} + P\left(\frac{R}{100}\right)^2$. Subtracting $SI_2$ from $CI_2$ leaves $P\left(\frac{R}{100}\right)^2$.
* **Immediate Worked Example**: Find the difference between CI and SI on ₹10,000 at 10% rate for 2 years.
  * *Solution*: $\text{Diff} = 10000 \times \left(\frac{10}{100}\right)^2 = 10000 \times 0.01 = 100$.
* **Shortcut Demonstration**: $R = 10\% \implies$ Multiplier for Difference is $(0.1)^2 = 0.01$. $\text{Diff} = 10000 \times 0.01 = 100$.
* **Common Trap**: Forgetting that for 3 years, the formula has an additional factor: $\text{Diff}_3 = P\left(\frac{R}{100}\right)^2 \left(3 + \frac{R}{100}\right)$.
* **Difficulty Escalation**: If compounding is half-yearly, halve the rate and double the time periods.

### 3. Time, Speed & Distance (TSD)
* **What is this?** Finding motion variables under constant or changing speeds.
* **Why does TCS ask this?** Tests relative speed scenarios (trains, boats).
* **How do I recognize it?** Trigger words: "crosses a pole", "upstream", "downstream", "average speed".
* **Formula & Derivation**:
  $$\text{Average Speed} = \frac{2S_1 S_2}{S_1 + S_2} \quad \text{(for equal distances)}$$
  * *Derivation*: Let distance be $D$. Total time $T = \frac{D}{S_1} + \frac{D}{S_2} = D \frac{S_1 + S_2}{S_1 S_2}$. $\text{Average Speed} = \frac{2D}{T} = \frac{2D}{D \frac{S_1 + S_2}{S_1 S_2}} = \frac{2 S_1 S_2}{S_1 + S_2}$.
* **Immediate Worked Example**: A car travels from A to B at 40 km/h and returns at 60 km/h. Find average speed.
  * *Solution*: $\text{Avg Speed} = \frac{2 \times 40 \times 60}{40 + 60} = \frac{4800}{100} = 48\text{ km/h}$.
* **Shortcut Demonstration**: Ratio method. Speeds $40:60 = 2:3 \implies$ Time ratio $= 3:2$. If distance is LCM(40, 60) $= 120$ km, total distance $= 240$ km. Total time $= 3 + 2 = 5$ hours. $\text{Avg Speed} = 240 / 5 = 48$ km/h.
* **Common Trap**: Averaging speeds directly: $\frac{40 + 60}{2} = 50$ km/h. **Incorrect!**
* **Difficulty Escalation**: If distances are unequal, calculate total distance divided by total time: $\text{Avg Speed} = \frac{D_1 + D_2 + \dots}{T_1 + T_2 + \dots}$.

---

## 🧩 Reasoning Ability Cheatsheet

### 1. Syllogisms (Venn Diagrams)
* **What is this?** Evaluating logical conclusions based on statements about set relations.
* **Why does TCS ask this?** Tests rigorous deduction under time constraints.
* **How do I recognize it?** Trigger words: "All A are B", "Some B are C", "No C is D".
* **Solving Flowchart**:
  ```
  Is there a "Some A are not B" or "No A is B" statement?
                         |
           +-------------+-------------+
           | Yes                       | No
           v                           v
     Draw both Minimum and        Draw standard overlapping Venn.
     Maximum overlap cases.       Validate simple intersections.
     Verify if conclusion holds.
  ```
* **Immediate Worked Example**:
  * *Statements*: All Cats are Dogs. No Dog is a Cow.
  * *Venn Diagram*: `[ Cats ]` inside `[ Dogs ]`. `[ Cows ]` is completely separate.
  * *Conclusions*: 
    1. No Cat is a Cow (Valid $\to$ since Cats are inside Dogs, and Dogs can't overlap with Cows).
    2. Some Dogs are Cats (Valid $\to$ intersection of Cats and Dogs).
* **Shortcut Demonstration**: If the statements are all affirmative ("All", "Some"), negative conclusions ("No", "Some not") cannot be definitely true.
* **Common Trap**: Assuming "Some A are B" implies "Some A are NOT B" is always true. It is not logically guaranteed.
* **Difficulty Escalation**: "Only a few A are B" means "Some A are B" AND "Some A are not B" simultaneously.

### 2. Clocks
* **What is this?** Finding angles between hour and minute hands.
* **Why does TCS ask this?** Analytical question type with a clean formula.
* **How do I recognize it?** Trigger words: "angle between hands", "hands coincide".
* **Formula & Derivation**:
  $$\text{Angle} = \left|30H - \frac{11}{2}M\right|^\circ$$
  * *Derivation*: The hour hand moves at $0.5^\circ$ per minute and $30^\circ$ per hour. Position $= 30H + 0.5M$. The minute hand moves at $6^\circ$ per minute. Position $= 6M$. Difference $= |(30H + 0.5M) - 6M| = |30H - 5.5M|$.
* **Immediate Worked Example**: Find the angle between clock hands at 3:30.
  * *Solution*: $H = 3, M = 30$. $\text{Angle} = |30(3) - 5.5(30)| = |90 - 165| = 75^\circ$.
* **Shortcut Demonstration**: Coinciding hands formula: $T = \frac{60}{11} H$. At 3 o'clock, hands coincide at $3 \times \frac{60}{11} = 16\frac{4}{11}$ minutes past 3.
* **Common Trap**: Neglecting the hour hand movement when calculating minute hand positions.
* **Difficulty Escalation**: A clock gains 5 seconds every 3 minutes. If set correct at 8 AM, what is the true time when it shows 6 PM on the same day?

---

## 💻 Coding & DSA Patterns

### 1. Circular Array / House Robber DP
* **What is this?** Maximizing selected sum from an array where index 0 and index $N-1$ are adjacent, and no two adjacent items can be picked.
* **Edge Cases**: $N = 1$ (return `nums[0]`), empty input, negative numbers.
* **Complexity**: Time Complexity: $O(N)$, Space Complexity: $O(1)$.
* **C++ Solution Template**:
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

long long solveLinear(vector<int>& nums, int start, int end) {
    long long prev2 = 0, prev1 = 0;
    for (int i = start; i <= end; i++) {
        long long temp = max(prev1, prev2 + nums[i]);
        prev2 = prev1;
        prev1 = temp;
    }
    return prev1;
}

long long robCircular(vector<int>& nums) {
    int n = nums.size();
    if (n == 0) return 0;
    if (n == 1) return nums[0];
    return max(solveLinear(nums, 0, n - 2), solveLinear(nums, 1, n - 1));
}

int main() {
    vector<int> houses = {2, 3, 2};
    cout << robCircular(houses) << endl; // Output: 3
    return 0;
}
```
* **Dry Run Trace Table**: For input array `[2, 3, 2]`.
  * **Run 1** (`solveLinear` from index 0 to 1, i.e., `[2, 3]`):
    * Initial: `prev2 = 0`, `prev1 = 0`
    * $i = 0$ (val = 2): `temp = max(0, 0 + 2) = 2` $\implies$ `prev2 = 0`, `prev1 = 2`
    * $i = 1$ (val = 3): `temp = max(2, 0 + 3) = 3` $\implies$ `prev2 = 2`, `prev1 = 3`
    * Return 3.
  * **Run 2** (`solveLinear` from index 1 to 2, i.e., `[3, 2]`):
    * Initial: `prev2 = 0`, `prev1 = 0`
    * $i = 1$ (val = 3): `temp = max(0, 0 + 3) = 3` $\implies$ `prev2 = 0`, `prev1 = 3`
    * $i = 2$ (val = 2): `temp = max(3, 0 + 2) = 3` $\implies$ `prev2 = 3`, `prev1 = 3`
    * Return 3.
  * **Max result**: `max(3, 3) = 3`. Correct!
