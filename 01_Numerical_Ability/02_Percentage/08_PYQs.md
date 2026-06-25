# Percentage PYQ-Style Questions (TCS NQT Pattern)

---

### Question 1: Successive Depreciation Chain
**The Problem**: The value of a machine depreciates by $10\%$ in the first year, $20\%$ in the second year, and $15\%$ in the third year. If the initial cost of the machine was ₹2,00,000, what is its value at the end of 3 years?

*   **Pattern ID**: `Perc-Deprec-Chain-01`
*   **Approach**: Since the rates of change are successive and occur on the depreciated values, we apply successive multiplying factors (MFs) directly to the initial value:
    $$V_{\text{final}} = V_{\text{initial}} \times MF_1 \times MF_2 \times MF_3$$
*   **Solution**:
    1.  Year 1 depreciation is $10\% \implies MF_1 = 1 - 0.10 = 0.90 = \frac{9}{10}$.
    2.  Year 2 depreciation is $20\% \implies MF_2 = 1 - 0.20 = 0.80 = \frac{8}{10}$.
    3.  Year 3 depreciation is $15\% \implies MF_3 = 1 - 0.15 = 0.85 = \frac{17}{20}$.
    4.  Set up the calculation:
        $$V_{\text{final}} = 200,000 \times \frac{9}{10} \times \frac{8}{10} \times \frac{17}{20}$$
        $$V_{\text{final}} = 200,000 \times \frac{9 \times 8 \times 17}{2000} = 100 \times 72 \times 17 = 72 \times 1700 = 1,22,400$$
*   **Shortcut**: Instead of decimal multiplication, group terms:
    $$200,000 \times 0.9 = 1,80,000$$
    $$1,80,000 - 20\%(1,80,000) = 1,80,000 - 36,000 = 1,44,000$$
    $$1,44,000 - 15\%(1,44,000) = 1,44,000 - 21,600 = 1,22,400$$
*   **Variation & Trap**: The trap is adding the depreciation rates directly: $10\% + 20\% + 15\% = 45\%$, leading to a wrong valuation of $200,000 \times 0.55 = 1,10,000$.

---

### Question 2: Election with Invalid/Declined Votes
**The Problem**: In an election, $10\%$ of the voters did not cast their votes, and $10\%$ of the votes polled were found to be invalid. The winning candidate got $54\%$ of the valid votes and won by a majority of 1,620 votes. Find the total number of registered voters.

*   **Pattern ID**: `Perc-Election-Invalid-02`
*   **Approach**: Work backwards from the vote margin or set up a variable $V$ for total registered voters:
    $$\text{Polled} = 0.90 \times V$$
    $$\text{Valid} = 0.90 \times \text{Polled} = 0.81 \times V$$
*   **Solution**:
    1.  Winning candidate got $54\%$ of valid votes.
    2.  Losing candidate got $100\% - 54\% = 46\%$ of valid votes.
    3.  Margin of victory $= 54\% - 46\% = 8\%$ of valid votes.
    4.  Set up the equation:
        $$8\% \text{ of } \text{Valid Votes} = 1620$$
        $$0.08 \times (0.81 \times V) = 1620$$
        $$\frac{8}{100} \times \frac{81}{100} \times V = 1620$$
        $$\frac{648}{10000} \times V = 1620 \implies V = \frac{1620 \times 10000}{648}$$
        $$\text{Since } \frac{1620}{81} = 20, \text{ and } 648 = 81 \times 8:$$
        $$V = \frac{20 \times 10000}{8} = 2.5 \times 10000 = 25,000$$
*   **Shortcut**: Write the entire chain in one line and solve:
    $$V \times \frac{9}{10} \times \frac{9}{10} \times \frac{8}{100} = 1620 \implies V = \frac{1620 \times 10000}{648} = 25,000$$
*   **Variation & Trap**: The trap is applying the winner's $54\%$ directly to the total registered voters instead of valid votes, or subtracting the $10\%$ rates additively.

---

### Question 3: Constrained Price-Consumption Expenditure
**The Problem**: The price of rice increases by $30\%$. A family decides to increase its expenditure on rice by only $10\%$. If the family originally consumed $39\text{ kg}$ of rice per month, what is their new monthly consumption?

*   **Pattern ID**: `Perc-Price-Cons-Constrained-03`
*   **Approach**: Use the product relationship: $\text{Expenditure} = \text{Price} \times \text{Consumption}$.
    $$\text{New Exp} = \text{New Price} \times \text{New Cons}$$
    $$MF_E = MF_P \times MF_C$$
*   **Solution**:
    1.  Price increases by $30\% \implies MF_P = 1.3 = \frac{13}{10}$.
    2.  Expenditure increases by $10\% \implies MF_E = 1.1 = \frac{11}{10}$.
    3.  Find the consumption multiplying factor:
        $$MF_C = \frac{MF_E}{MF_P} = \frac{11/10}{13/10} = \frac{11}{13}$$
    4.  Apply to original consumption ($39\text{ kg}$):
        $$\text{New Consumption} = 39 \times \frac{11}{13} = 3 \times 11 = 33\text{ kg}$$
*   **Shortcut**: Setting up ratios:
    $$\frac{C_{\text{new}}}{C_{\text{old}}} = \frac{100 + \%E}{100 + \%P} \implies C_{\text{new}} = 39 \times \frac{110}{130} = 33\text{ kg}$$
*   **Variation & Trap**: Assuming consumption decreases by the difference of percentages ($30\% - 10\% = 20\%$ reduction $\implies 39 - 7.8 = 31.2\text{ kg}$). Always use ratios.

---

### Question 4: Examination Pass marks & Margins
**The Problem**: A student has to secure $40\%$ marks to pass an examination. If he gets 178 marks and fails by 22 marks, what are the maximum marks of the examination?

*   **Pattern ID**: `Perc-Exam-Pass-04`
*   **Approach**: The passing score is the sum of the student's actual score and the margin by which they failed:
    $$\text{Pass Marks} = \text{Actual Score} + \text{Fail Margin}$$
*   **Solution**:
    1.  Calculate pass marks: $178 + 22 = 200$.
    2.  Since $40\%$ of maximum marks is passing:
        $$40\% \text{ of } \text{Max Marks} = 200$$
        $$\frac{2}{5} \times \text{Max} = 200 \implies \text{Max} = \frac{200 \times 5}{2} = 500\text{ marks}$$
*   **Shortcut**:
    $$40\% = 200 \implies 10\% = 50 \implies 100\% = 500\text{ marks}$$
*   **Variation & Trap**: Subtracting the fail margin instead of adding it ($178 - 22 = 156$ passing score), which yields incorrect fractional marks.

---

### Question 5: Multi-Stage Transfer Chain
**The Problem**: A starts a business with a certain capital. He makes a profit of $20\%$ in Year 1 and donates $10\%$ of his total amount at the end of the year. He makes a profit of $25\%$ in Year 2 and donates $20\%$ of his total amount at the end of Year 2. If he is left with ₹1,50,000 at the end of Year 2, find his initial capital.

*   **Pattern ID**: `Perc-Transfer-Chain-05`
*   **Approach**: Track the compounding multiplier after each profit and donation stage:
    $$V_1 = C \times 1.20 \times 0.90 = C \times 1.08$$
    $$V_2 = V_1 \times 1.25 \times 0.80 = V_1 \times 1.00$$
*   **Solution**:
    1.  Year 1 profit is $+20\%$ and donation is $-10\%$:
        $$MF_{\text{Year1}} = \frac{6}{5} \times \frac{9}{10} = \frac{27}{25}$$
    2.  Year 2 profit is $+25\%$ and donation is $-20\%$:
        $$MF_{\text{Year2}} = \frac{5}{4} \times \frac{4}{5} = 1$$
    3.  Set up the full equation:
        $$C \times \frac{27}{25} \times 1 = 1,50,000 \implies C = \frac{1,50,000 \times 25}{27}$$
        $$C = 1,38,888.89$$
*   **Shortcut**: Recognize that Year 2 multipliers cancel out to exactly 1 ($1.25 \times 0.80 = 1.0$). Thus the Year 1 ending capital is equal to the Year 2 ending capital:
    $$C \times 1.08 = 1,50,000 \implies C = \frac{1,50,000}{1.08} = 1,38,888.89$$
*   **Variation & Trap**: Mixing up the donation basis by calculating donations on original capital instead of the current running balance.
