---
title: "Percentage - PYQs"
section: "Numerical Ability"
weight: "2-3 Questions"
---

# Percentage Previous Year Questions (PYQs)

---

**PYQ Pattern #1: Successive Depreciation Chain**

**Recognition Trigger:** When the question says "value of a machine depreciates by X% in Y year... find final value" → this is a successive depreciation chain problem

**Question:** The value of a machine depreciates by $10\%$ in the first year, $20\%$ in the second year, and $15\%$ in the third year. If the initial cost of the machine was ₹2,00,000, what is its value at the end of 3 years?

**Step 1 — Identify:** This is a successive percentage decrease problem where the base changes after each period.
**Step 2 — Set up:** Use the successive multiplying factor chain:
$$V_{\text{final}} = V_{\text{initial}} \times (1 - d_1) \times (1 - d_2) \times (1 - d_3)$$
**Step 3 — Calculate:**
$$V_{\text{final}} = 200,000 \times (1 - 0.10) \times (1 - 0.20) \times (1 - 0.15)$$
$$V_{\text{final}} = 200,000 \times \frac{9}{10} \times \frac{8}{10} \times \frac{17}{20}$$
$$V_{\text{final}} = 200,000 \times \frac{1224}{2000}$$
$$V_{\text{final}} = 100 \times 1224 = 122,400$$
**Step 4 — Verify:** Check with a rough simple interest subtraction: $200k - 10\% - 20\% - 15\% = 110,000$. Since successive depreciation is calculated on reduced bases, the final value must be higher than $110,000$. $122,400$ is correct.

**Answer:** **122400**

**The Shortcut Version:**
Calculate running balances:
$200,000 - 10\% = 180,000 \rightarrow 180,000 - 20\% = 144,000 \rightarrow 144,000 - 15\% = 122,400$

**If this question appeared harder:**
Rates could be fractional (e.g., $16.67\%$, $12.5\%$). You would convert them directly to fractions ($\frac{1}{6}$, $\frac{1}{8}$) and multiply the remaining fractional balances ($R \times \frac{5}{6} \times \frac{7}{8}$).

**Exam Trap:**
TCS might include the linear subtraction sum ($10\%+20\%+15\% = 45\%$ decrease $\implies$ ₹1,10,000) as option A to trap students.

---

**PYQ Pattern #2: Election with Invalid and Declined Votes**

**Recognition Trigger:** When the question says "voters did not cast their votes... votes were found to be invalid" → this is an election with invalid/declined votes problem

**Question:** In an election, $10\%$ of the voters did not cast their votes, and $10\%$ of the votes polled were found to be invalid. The winning candidate got $54\%$ of the valid votes and won by a majority of 1,620 votes. Find the total number of registered voters.

**Step 1 — Identify:** This is a base partition problem where registered voters are reduced successively to get valid votes.
**Step 2 — Set up:** Let registered voters be $V$.
$$\text{Polled} = 0.90V, \quad \text{Valid} = 0.90 \times \text{Polled} = 0.81V$$
$$\text{Margin} = (54\% - 46\%) \text{ of Valid Votes} = 8\% \text{ of Valid Votes}$$
**Step 3 — Calculate:**
$$0.08 \times (0.81V) = 1620$$
$$\frac{648}{10000}V = 1620$$
$$V = \frac{1620 \times 10000}{648} = 25,000$$
**Step 4 — Verify:** If $V = 25,000$, polled $= 22,500$, valid $= 20,250$. Winners votes $= 10,935$, losers votes $= 9,315$. Margin $= 10,935 - 9,315 = 1,620$. Matches question.

**Answer:** **25000**

**The Shortcut Version:**
$$V \times 0.9 \times 0.9 \times 0.08 = 1620 \implies V = \frac{1620}{0.0648} = 25,000$$

**If this question appeared harder:**
The winner's percentage could be stated relative to the *total registered votes* instead of valid votes. In that case, set $\text{Winner} = 0.54V$, and $\text{Loser} = \text{Valid} - \text{Winner} = 0.81V - 0.54V = 0.27V$.

**Exam Trap:**
Setting $\text{Winner} + \text{Loser} = 100\%$ directly without deducting the $10\%$ non-voters and $10\%$ invalid votes, leading to an incorrect result of $20,250$.

---

**PYQ Pattern #3: Constrained Price-Consumption Expenditure**

**Recognition Trigger:** When the question says "price increases by X%... increase expenditure by only Y%... find new consumption" → this is a constrained price-consumption expenditure problem

**Question:** The price of rice increases by $30\%$. A family decides to increase its expenditure on rice by only $10\%$. If the family originally consumed $39\text{ kg}$ of rice per month, what is their new monthly consumption?

**Step 1 — Identify:** This is a three-variable product change problem where $\text{Expenditure} = \text{Price} \times \text{Consumption}$.
**Step 2 — Set up:** Use the ratio multiplier:
$$\frac{C_{\text{new}}}{C_{\text{old}}} = \frac{MF_E}{MF_P} = \frac{1 + \%E}{1 + \%P}$$
**Step 3 — Calculate:**
$$MF_E = 1.10 = \frac{11}{10}, \quad MF_P = 1.30 = \frac{13}{10}$$
$$MF_C = \frac{11}{13}$$
$$\text{New Consumption} = 39 \times \frac{11}{13} = 33\text{ kg}$$
**Step 4 — Verify:** Since price rose much faster ($30\%$) than expenditure ($10\%$), consumption must drop. $33\text{ kg}$ is less than $39\text{ kg}$. Correct.

**Answer:** **33**

**The Shortcut Version:**
$$\text{New Consumption} = 39 \times \frac{100+10}{100+30} = 39 \times \frac{11}{13} = 33$$

**If this question appeared harder:**
Instead of raw consumption, the question could ask for the percentage change in consumption. That would be $(MF_C - 1) \times 100\% = (\frac{11}{13} - 1) \times 100\% = -15.38\%$.

**Exam Trap:**
Assuming consumption decreases by the net difference of percentages ($30\% - 10\% = 20\%$ decrease $\implies 39 \times 0.8 = 31.2\text{ kg}$). TCS often includes this as a distractor.
