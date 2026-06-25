# Expected Questions: Percentages (2026 Exam Cycle)

This file contains 10 predicted practice questions modeled after recent TCS NQT trend shifts, focusing on successive changes, product constancy, and election ratios.

---

## 📋 Expected Questions Booklet

### Q1. Price-Consumption balance with budget shift
**Question**: The price of cooking oil increases by $30\%$. By what percentage should a family reduce their consumption so that their overall expenditure increases by only $4\%$? (FIB)
- **Hint**: Let initial price be $100$ and consumption be $100$. New price is $130$, target expenditure is $104$.
- **Detailed Solution**:
  - Initial state: Price $= 100$, Consumption $= 100 \implies$ Expenditure $= 10000$.
  - New state: Price $= 130$. Let new consumption be $C$.
  - Target Expenditure $= 10000 \times 1.04 = 10400$.
  - Equation: $130 \times C = 10400 \implies C = \frac{10400}{130} = 80$.
  - Decrease in consumption $= 100 - 80 = 20\%$.
- **Shortcut**:
  $$\text{Consumption Factor} = \frac{1 + \text{Exp Increase}}{1 + \text{Price Increase}} = \frac{1.04}{1.30} = 0.8 \implies 20\% \text{ reduction}$$
- **Common Mistake**: Subtracting percentages directly ($30\% - 4\% = 26\%$, which is incorrect).

---

### Q2. Successive increases on multi-factor value
**Question**: The length of a rectangle increases by $20\%$ and its width increases by $15\%$. Find the percentage increase in its area. (MCQ)
- **Options**: A. $35\%$, B. $38\%$, C. $40\%$, D. $32\%$
- **Hint**: Use the successive percentage change formula.
- **Detailed Solution**:
  - Area $A = L \times W$.
  - Let $x = 20\%$ and $y = 15\%$.
  - Net increase $= x + y + \frac{xy}{100} = 20 + 15 + \frac{300}{100} = 38\%$.
- **Shortcut**: Multiplier product: $1.20 \times 1.15 = 1.38 \implies 38\%$ increase.
- **Common Mistake**: Adding the percentages directly ($20 + 15 = 35\%$).

---

### Q3. Election with invalid votes and winner ratios
**Question**: In an election between two candidates, $10\%$ of voters did not cast their votes, and $10\%$ of the votes cast were declared invalid. The winning candidate got $54\%$ of the valid votes and won by a majority of $1620$ votes. Find the total number of registered voters. (FIB)
- **Hint**: Trace the vote division: Registered $\rightarrow$ Cast $\rightarrow$ Valid $\rightarrow$ Winner/Loser gap.
- **Detailed Solution**:
  - Let total registered voters be $X$.
  - Votes cast $= 0.90X$.
  - Valid votes $V = 0.90 \times 0.90X = 0.81X$.
  - Winner got $54\% \implies$ Loser got $46\%$ of valid votes.
  - Difference $= 54\% - 46\% = 8\%$ of valid votes.
  - Equation: $0.08 \times 0.81X = 1620 \implies 0.0648X = 1620 \implies X = \frac{1620}{0.0648} = 25000$.
- **Shortcut**:
  $$X = \frac{1620}{0.9 \times 0.9 \times 0.08} = \frac{1620}{0.0648} = 25000$$
- **Common Mistake**: Calculating the winner's percentage directly from registered voters instead of valid votes.

---

### Q4. Sales Commission brackets
**Question**: A salesman is allowed a $9\%$ commission on total sales, plus a bonus of $1\%$ on sales over $20,000$. If his total earnings are $6800$, find his total sales. (FIB)
- **Hint**: Let total sales be $S$. Bonus applies only to $(S - 20000)$.
- **Detailed Solution**:
  - Earnings $= 9\%$ of $S$ + $1\%$ of $(S - 20000)$.
  - Equation: $0.09S + 0.01(S - 20000) = 6800$.
  - $0.10S - 200 = 6800 \implies 0.10S = 7000 \implies S = 70000$.
- **Shortcut**: If he got $10\%$ on all sales, his earnings would increase by $1\%$ of $20000 = 200$. So $10\% \text{ of Sales} = 6800 + 200 = 7000 \implies \text{Sales} = 70000$.
- **Common Mistake**: Applying the bonus percentage directly to total sales instead of the excess sales.

---

### Q5. Successive price cycle
**Question**: A manufacturer sells a car to a dealer at $10\%$ profit. The dealer sells it to a customer at $20\%$ profit. If the customer paid $330,000$, find the cost of production for the manufacturer. (FIB)
- **Hint**: Chain multiplication of multiplying factors.
- **Detailed Solution**:
  - Let cost of production be $X$.
  - Equation: $X \times 1.10 \times 1.20 = 330000$.
  - $1.32X = 330000 \implies X = 250000$.
- **Shortcut**:
  $$X = \frac{330000}{1.32} = 250000$$
- **Common Mistake**: Using simple addition of profits ($10 + 20 = 30\%$).

---

### Q6. Population ratio shifts
**Question**: The population of a town is $15000$. If male population increases by $8\%$ and female population by $10\%$, the population becomes $16300$. Find the number of females in the town. (FIB)
- **Hint**: Set up a linear equation system or use allegation.
- **Detailed Solution**:
  - Let males be $M$, females be $F \implies M + F = 15000$.
  - Net increase $= 16300 - 15000 = 1300$.
  - Equation: $0.08M + 0.10F = 1300$.
  - Multiply first equation by $8 \implies 8M + 8F = 120000$.
  - Multiply second equation by $100 \implies 8M + 10F = 130000$.
  - Subtracting equations: $2F = 10000 \implies F = 5000$.
- **Shortcut**: If all increased by $8\%$, growth would be $15000 \times 0.08 = 1200$. The extra $100$ increase is due to the extra $2\%$ of females $\implies 0.02F = 100 \implies F = 5000$.
- **Common Mistake**: Swapping the male and female percentages during calculation.

---

### Q7. Passing mark thresholds
**Question**: A student has to score $40\%$ marks to pass. He gets $178$ marks and fails by $22$ marks. Find the maximum marks. (FIB)
- **Hint**: Passing marks must equal obtained marks $+$ failing margin.
- **Detailed Solution**:
  - Passing Marks $= 178 + 22 = 200$.
  - Since $40\%$ of max marks $= 200$, Max Marks $= 200 / 0.40 = 500$.
- **Shortcut**: $40\% \rightarrow 200 \implies 1\% \rightarrow 5 \implies 100\% \rightarrow 500$.
- **Common Mistake**: Subtracting 22 from 178 instead of adding.

---

### Q8. Mixture water evaporation
**Question**: A $40\text{ L}$ solution contains $10\%$ water. How much water must be evaporated to make it a $5\%$ water solution? (FIB)
- **Hint**: The quantity of non-water solute remains constant.
- **Detailed Solution**:
  - Initial solute quantity $= 90\%$ of $40 = 36\text{ L}$.
  - Let new solution volume be $V$. In new solution, solute is $95\%$.
  - Equation: $0.95V = 36 \implies V = \frac{36}{0.95} = 37.89\text{ L}$.
  - Water evaporated $= 40 - 37.89 = 2.11\text{ L}$.
- **Shortcut**:
  $$\text{New Volume} = \text{Old Volume} \times \frac{\text{Initial Solute \%}}{\text{Final Solute \%}} = 40 \times \frac{90}{95} = 37.89$$
- **Common Mistake**: Subtracting percentage values directly ($10\% - 5\% = 5\%$) and calculating $5\%$ of $40$.

---

### Q9. Income-Savings brackets
**Question**: A man spends $75\%$ of his income. His income increases by $20\%$ and his expenditure increases by $10\%$. Find the percentage increase in his savings. (MCQ)
- **Options**: A. $50\%$, B. $30\%$, C. $25\%$, D. $40\%$
- **Hint**: Let initial income be $100$. Spend $= 75$, Savings $= 25$.
- **Detailed Solution**:
  - Initial: Income $= 100$, Spend $= 75$, Savings $= 25$.
  - New: Income $= 120$, Spend $= 75 \times 1.1 = 82.5$.
  - New Savings $= 120 - 82.5 = 37.5$.
  - Increase in savings $= 37.5 - 25 = 12.5 \implies$ percentage increase $= \frac{12.5}{25} \times 100 = 50\%$.
- **Shortcut**: Use weighted averages of changes:
  $$1 \times 20\% = 0.75 \times 10\% + 0.25 \times x \implies 20 = 7.5 + 0.25x \implies 0.25x = 12.5 \implies x = 50\%$$
- **Common Mistake**: Assuming savings increase by the difference in percentage shifts.

---

### Q10. Fresh vs Dry fruits water ratios
**Question**: Fresh fruit contains $68\%$ water and dry fruit contains $20\%$ water. How much dry fruit can be obtained from $100\text{ kg}$ of fresh fruits? (FIB)
- **Hint**: The solid pulp weight remains constant.
- **Detailed Solution**:
  - Pulp in fresh fruit $= 100 - 68 = 32\%$.
  - In $100\text{ kg}$ fresh fruit, pulp weight $= 32\text{ kg}$.
  - Let dry fruit weight obtained be $D$. Dry fruit contains $20\%$ water $\implies 80\%$ pulp.
  - Equation: $0.80D = 32 \implies D = 40\text{ kg}$.
- **Shortcut**:
  $$\text{Dry Fruit} = \text{Fresh Fruit} \times \frac{\text{Fresh Pulp \%}}{\text{Dry Pulp \%}} = 100 \times \frac{32}{80} = 40\text{ kg}$$
- **Common Mistake**: Calculating water loss directly without anchoring to the constant pulp weight.
