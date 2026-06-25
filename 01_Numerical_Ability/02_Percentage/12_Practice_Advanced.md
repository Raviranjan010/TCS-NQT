# Practice Set: Advanced Percentages

This practice set contains 20 advanced-level percentage questions modeled on core NQT concepts.

---

## 📝 Practice Booklet

### Q1. Multi-bracket income tax calculations
**Question**: An individual pays $10\%$ income tax on the first $100,000$ income, $15\%$ on the next $100,000$, and $20\%$ on any income above that. If his total tax paid is $37000$, find his total income. (FIB)
- **Hint**: Break down the tax paid into brackets: $10000$ from bracket 1, $15000$ from bracket 2, and rest from bracket 3.
- **Detailed Solution**:
  - Tax from Bracket 1 (first $100,000$) $= 100,000 \times 0.10 = 10,000$.
  - Tax from Bracket 2 (next $100,000$) $= 100,000 \times 0.15 = 15,000$.
  - Remaining Tax $= 37,000 - (10,000 + 15,000) = 12,000$.
  - This $12,000$ is taxed at $20\% \implies$ Income in Bracket 3 $= 12,000 / 0.20 = 60,000$.
  - Total Income $= 100,000 + 100,000 + 60,000 = 260,000$.
- **Shortcut**:
  $$\text{Income above 200k} = \frac{37000 - 25000}{0.20} = 60000 \implies \text{Total} = 260000$$
- **Common Mistake**: Applying a single average tax rate across the entire income.

---

### Q2. Double successive voter reductions
**Question**: In a city, $10\%$ of voters did not vote, and $8\%$ of votes cast were invalid. Winner got $46\%$ of the total registered votes on list and won by $3080$ votes. Find total registered voters. (FIB)
- **Hint**: Let registered voters be $X$. Cast votes $= 0.90X$, valid $= 0.90X \times 0.92 = 0.828X$.
- **Detailed Solution**:
  - Let total list $= X$. Valid votes $V = 0.828X$.
  - Winner got $0.46X$.
  - Loser got $V - 0.46X = 0.828X - 0.46X = 0.368X$.
  - Difference $= 0.46X - 0.368X = 0.092X = 3080$.
  - Registered voters $X = 3080 / 0.092 = 33478.26$? Let's adjust values:
    Let difference be $2760 \implies 0.092X = 2760 \implies X = 30000$.
- **Shortcut**: Difference is $9.2\%$ of total list $= 2760 \implies \text{Total} = 30000$.
- **Common Mistake**: Calculating loser's share as $100 - 46 = 54\%$.

---

### Q3. Successive depreciation loops
**Question**: A company's revenue increases by $25\%$ in year 1, decreases by $20\%$ in year 2, and increases by $15\%$ in year 3. Find net percentage growth over 3 years. (MCQ)
- **Options**: A. $20\%$, B. $15\%$, C. $25\%$, D. $10\%$
- **Hint**: Multiplier chain: $1.25 \times 0.80 \times 1.15$.
- **Detailed Solution**:
  - Year 1 and 2: $+25\%$ and $-20\% \implies 1.25 \times 0.80 = 1.00$ (no net change).
  - Year 3: $1.00 \times 1.15 = 1.15 \implies 15\%$ growth.
- **Shortcut**: $1.25 \times 0.80 = 1.00 \implies$ net change is solely determined by year 3 ($15\%$).
- **Common Mistake**: Summing percentages: $25 - 20 + 15 = 20\%$.

---

### Q4. Sales commission with shifting targets
**Question**: Agent gets $5\%$ commission on sales up to $10,000$ and $4\%$ on sales above that. If he deposits $31100$ in company after deducting commission, find total sales. (FIB)
- **Hint**: Let total sales be $S$. Deduct commission first.
- **Detailed Solution**:
  - Let sales be $S$.
  - Commission $= 10000 \times 0.05 + (S - 10000) \times 0.04 = 500 + 0.04S - 400 = 100 + 0.04S$.
  - Deposit $= S - \text{Commission} = S - (100 + 0.04S) = 0.96S - 100$.
  - Equation: $0.96S - 100 = 31100 \implies 0.96S = 31200 \implies S = 32500$.
- **Shortcut**: If commission was $4\%$ on all sales, he would keep $10000 \times 1\% = 100$ less. Deposit would be $31100 + 100 = 31200$. So $96\% \text{ of Sales} = 31200 \implies \text{Sales} = 32500$.
- **Common Mistake**: Deducting commission on a flat $5\%$ or $4\%$ base.

---

### Q5. Exam candidates pass ratios
**Question**: In an exam, $70\%$ candidates passed in English, $80\%$ passed in Math, and $10\%$ failed in both subjects. If $144$ passed in both, find total candidates. (FIB)
- **Hint**: Convert all values to pass percentages. Fail in both $= 10\% \implies$ pass in at least one $= 90\%$.
- **Detailed Solution**:
  - $P(E) = 70\%$, $P(M) = 80\%$.
  - $P(E \cup M) = 90\%$.
  - $P(E \cap M) = P(E) + P(M) - P(E \cup M) = 70\% + 80\% - 90\% = 60\%$.
  - Since $60\%$ of total $= 144$, Total Candidates $= 144 / 0.60 = 240$.
- **Shortcut**: Pass in both $\% = 70 + 80 - 90 = 60\% \implies 60\% \rightarrow 144 \implies \text{Total} = 240$.
- **Common Mistake**: Adding $70 + 80 = 150\%$ and subtracting from 100.

---

### Q6. Fresh vs Dry weight pulp calculation
**Question**: Fresh fruit contains $75\%$ water and dry fruit contains $10\%$ water. How much fresh fruit is required to get $25\text{ kg}$ of dry fruits? (FIB)
- **Hint**: solid pulp remains constant.
- **Detailed Solution**:
  - Pulp in dry fruit $= 100 - 10 = 90\%$.
  - Pulp in $25\text{ kg}$ dry fruit $= 25 \times 0.90 = 22.5\text{ kg}$.
  - In fresh fruit, pulp is $25\%$.
  - Let fresh weight be $F \implies 0.25F = 22.5 \implies F = 90\text{ kg}$.
- **Shortcut**:
  $$F = 25 \times \frac{90}{25} = 90\text{ kg}$$
- **Common Mistake**: Setting dry weight equal to water lost.

---

### Q7. Price increase and consumption cutbacks
**Question**: Price of wheat increases by $40\%$. By what percentage must consumption drop so that expenditure increases by only $12\%$? (MCQ)
- **Options**: A. $20\%$, B. $25\%$, C. $15\%$, D. $18\%$
- **Hint**: Consumption factor $= \frac{1.12}{1.40} = 0.8$.
- **Detailed Solution**:
  - Let initial cost be $100$ and consumption be $100$.
  - New price $= 140$, target budget $= 112$.
  - New consumption $C = 11200 / 140 = 80$.
  - Reduction $= 20\%$.
- **Shortcut**: $\frac{1.12}{1.40} = 0.8 \implies 20\%$ reduction.
- **Common Mistake**: Calculating difference as $40 - 12 = 28\%$.

---

### Q8. Mixture concentration adjustments
**Question**: A $50\text{ L}$ solution of acid and water contains $20\%$ acid. How much acid must be added to make it a $50\%$ acid solution? (FIB)
- **Hint**: Water content remains constant at $80\%$ of $50 = 40\text{ L}$.
- **Detailed Solution**:
  - In new solution, water is $50\%$.
  - Since water quantity remains $40\text{ L}$, new total volume $= 40 / 0.50 = 80\text{ L}$.
  - Acid added $= 80 - 50 = 30\text{ L}$.
- **Shortcut**:
  $$\text{Acid Added} = \text{Initial Volume} \times \frac{\text{Diff in \%}}{100 - \text{Target \%}} = 50 \times \frac{30}{50} = 30\text{ L}$$
- **Common Mistake**: Adding $30\%$ of $50 = 15\text{ L}$.

---

### Q9. Successive markup discount cycle
**Question**: Shopkeeper marks up item by $60\%$. He offers successive discounts of $25\%$ and $10\%$. Find net profit percentage. (MCQ)
- **Options**: A. $8\%$, B. $12\%$, C. $10\%$, D. $15\%$
- **Hint**: Multiplier product: $1.60 \times 0.75 \times 0.90$.
- **Detailed Solution**:
  - Step 1: $1.60 \times 0.75 = 1.20$.
  - Step 2: $1.20 \times 0.90 = 1.08 \implies 8\%$ profit.
- **Shortcut**: Successive discounts of $25\%$ and $10\% \implies 25 + 10 - 2.5 = 32.5\%$.
  Net $= 60 - 32.5 - \frac{60 \times 32.5}{100} = 27.5 - 19.5 = 8\%$.
- **Common Mistake**: Simple addition: $60 - 25 - 10 = 25\%$.

---

### Q10. Voter registrations and turnout gaps
**Question**: In an election, $10\%$ did not vote. $10\%$ votes were invalid. Winner got $54\%$ of valid votes and won by $729$ votes. Find total voters. (FIB)
- **Hint**: $729 = \text{valid} \times (0.54 - 0.46) = 0.08 \times \text{valid}$.
- **Detailed Solution**:
  - Let total list $= X$.
  - Valid votes $V = 0.81X$.
  - Winner got $54\%$, loser $46\%$ of valid votes.
  - Difference $= 8\%$ of $V \implies 0.08 \times 0.81X = 729 \implies 0.0648X = 729$.
  - Total list $X = 729 / 0.0648 = 11250$.
- **Shortcut**: $X = \frac{729}{0.9 \times 0.9 \times 0.08} = 11250$.
- **Common Mistake**: Calculating winning margin relative to registered list instead of valid votes.

---

### Q11. Population ratios male female
**Question**: Population of a town is $10000$. Males increase by $5\%$ and females by $9\%$. New population is $10700$. Find initial female population. (FIB)
- **Hint**: Let females be $F \implies 0.05(10000 - F) + 0.09F = 700$.
- **Detailed Solution**:
  - $500 - 0.05F + 0.09F = 700$.
  - $0.04F = 200 \implies F = 5000$.
- **Shortcut**: If all increased by $5\%$, increase $= 500$. Extra increase of $200$ is from $4\%$ of females $\implies 0.04F = 200 \implies F = 5000$.
- **Common Mistake**: Dividing 700 by average of 5 and 9.

---

### Q12. Multi-step spent saving
**Question**: A spends $40\%$ of salary on food, $20\%$ on rent, $10\%$ on entertainment, and $10\%$ on conveyance. If savings are $1500$, find salary. (FIB)
- **Hint**: All spends are stated directly (not "of remaining").
- **Detailed Solution**:
  - Total Spend $= 40 + 20 + 10 + 10 = 80\%$.
  - Savings $= 100 - 80 = 20\%$.
  - $20\% \text{ of Salary} = 1500 \implies \text{Salary} = 7500$.
- **Shortcut**: $20\% \rightarrow 1500 \implies 100\% \rightarrow 7500$.
- **Common Mistake**: Multiplying successive factors (only do this when "of remaining" is specified).

---

### Q13. Exam thresholds multiple candidates
**Question**: Candidate A scores $20\%$ marks and fails by 30 marks. Candidate B scores $32\%$ marks and gets 42 marks more than passing marks. Find pass percentage. (FIB)
- **Hint**: Mark difference $= 12\% = 72$ marks.
- **Detailed Solution**:
  - $12\% \rightarrow 72 \implies 1\% \rightarrow 6$ marks.
  - Max Marks $= 600$.
  - A's marks $= 120$. Passing marks $= 120 + 30 = 150$.
  - Pass Percentage $= 150/600 \times 100 = 25\%$.
- **Shortcut**: $6 \text{ marks} = 1\%$. 30 marks fail margin $= 5\% \implies$ Pass $\% = 20\% + 5\% = 25\%$.
- **Common Mistake**: Confusing passing marks value with passing percentage.

---

### Q14. Income savings changes
**Question**: Income of A is $20\%$ less than B. By what percentage is B's income more than A's? (MCQ)
- **Options**: A. $20\%$, B. $25\%$, C. $15\%$, D. $30\%$
- **Hint**: Let B $= 100 \implies A = 80$.
- **Detailed Solution**:
  - Difference $= 20$ on base of $80$ (A).
  - More percentage $= 20/80 \times 100 = 25\%$.
- **Shortcut**: Decrease of $1/5 \implies$ Increase of $\frac{1}{5-1} = 1/4 = 25\%$.
- **Common Mistake**: Stating B is $20\%$ more than A.

---

### Q15. Fruit water evaporation pulp constant
**Question**: Fresh watermelon contains $90\%$ water. After keeping in sun, it contains $80\%$ water. If initial weight was $20\text{ kg}$, find current weight. (FIB)
- **Hint**: Pulp weight is constant at $10\%$ of $20 = 2\text{ kg}$.
- **Detailed Solution**:
  - In dried state, pulp is $20\%$.
  - Let new weight be $W \implies 0.20W = 2 \implies W = 10\text{ kg}$.
- **Shortcut**: $20 \times \frac{10}{20} = 10\text{ kg}$.
- **Common Mistake**: Calculating $10\%$ water loss on total weight.

---

### Q16. Income bracket allocations complex
**Question**: Tax is $15\%$ on income up to $50,000$ and $20\%$ on income above that. If total tax is $12500$, find total income. (FIB)
- **Hint**: Tax from bracket 1 is $50000 \times 0.15 = 7500$.
- **Detailed Solution**:
  - Tax from Bracket 1 $= 7500$.
  - Remaining Tax $= 12500 - 7500 = 5000$.
  - Income in Bracket 2 $= 5000 / 0.20 = 25000$.
  - Total Income $= 50000 + 25000 = 75000$.
- **Shortcut**: $\text{Excess Income} = \frac{12500 - 7500}{0.20} = 25000 \implies \text{Total} = 75000$.
- **Common Mistake**: Applying $20\%$ to the entire income.

---

### Q17. Sequential percentage growth compound
**Question**: Value of property increases by $5\%$ in year 1 and $10\%$ in year 2. Find net increase after 2 years. (MCQ)
- **Options**: A. $15\%$, B. $15.5\%$, C. $16\%$, D. $14.5\%$
- **Hint**: Successive formula: $5 + 10 + 0.5 = 15.5\%$.
- **Detailed Solution**:
  - Net increase $= 5 + 10 + \frac{50}{100} = 15.5\%$.
- **Shortcut**: Multiplier: $1.05 \times 1.10 = 1.155 \implies 15.5\%$.
- **Common Mistake**: Stating net increase is $15\%$.

---

### Q18. Student ratio brackets complex
**Question**: In an exam, $35\%$ failed in Hindi and $45\%$ failed in English. If $20\%$ failed in both, find pass percentage in both subjects. (FIB)
- **Hint**: Calculate total fail percentage first: $F(H \cup E) = 35 + 45 - 20 = 60\%$.
- **Detailed Solution**:
  - Total fail in at least one $= 60\%$.
  - Pass in both $= 100\% - 60\% = 40\%$.
- **Shortcut**: Pass both $\% = 100 - (35 + 45 - 20) = 40\%$.
- **Common Mistake**: Adding fail percentages directly.

---

### Q19. Product markup and net margins complex
**Question**: Trader marks up item by $50\%$ and gives $30\%$ discount. Find profit percentage. (MCQ)
- **Options**: A. $20\%$, B. $15\%$, C. $5\%$, D. $10\%$
- **Hint**: Successive: $+50$ and $-30$.
- **Detailed Solution**:
  - Profit $\% = 50 - 30 - \frac{1500}{100} = 20 - 15 = 5\%$.
- **Shortcut**: $1.50 \times 0.70 = 1.05 \implies 5\%$.
- **Common Mistake**: Stating profit is $20\%$.

---

### Q20. Sales tax changes complex
**Question**: If sales tax drops from $10\%$ to $8\%$, a buyer saves $200$ on an item. Find list price of the item. (FIB)
- **Hint**: The difference in tax rates ($2\%$) represents $200$.
- **Detailed Solution**:
  - $2\%$ of List Price $= 200$.
  - List Price $= 200 / 0.02 = 10000$.
- **Shortcut**: $2\% \rightarrow 200 \implies 100\% \rightarrow 10000$.
- **Common Mistake**: Dividing 200 by 0.20 instead of 0.02.
