# COMPLETE_NUMERICAL_PYQS: 50 High-Probability NQT Practice Patterns

This file contains 50 practice questions modeled after recent TCS NQT exam patterns. They are organized by topic and follow the NQT analysis format.

---

## 📌 Topic Jump Links

- [Number System (Q1-Q5)](#number-system)
- [Percentages (Q6-Q10)](#percentages)
- [Profit & Loss (Q11-Q15)](#profit--loss)
- [SI & CI (Q16-Q20)](#si--ci)
- [Ratio & Proportion (Q21-Q25)](#ratio--proportion)
- [Time & Work (Q26-Q30)](#time--work)
- [Time Speed Distance (Q31-Q35)](#time-speed-distance)
- [Averages (Q36-Q40)](#averages)
- [Permutations & Combinations (Q41-Q45)](#permutations--combinations)
- [Probability (Q46-Q50)](#probability)
- [Pattern Frequency Chart](#pattern-frequency-chart)

---

## Number System

### Q1. Divisibility check
**Question**: Find the value of $X$ if the 9-digit number $785X36782$ is divisible by 72.
- **Pattern ID**: NS_DIV_72
- **Approach**: $72 = 8 \times 9$. The last three digits $782 + \text{offset}$ must divide by 8, and the sum of all digits must divide by 9.
- **Solution**:
  - Divisibility by 8: $782$ is not divisible. Let last 3 digits be $78Y$. $784$ divides by 8. So last digit is 4. (Wait, the number is $785X36782$. The last digits are fixed as $782$. Wait, if the number is fixed as $785X36782$, let's adjust the digits so it's a valid question. Let's make it $785X3678Y$ where we need to find $X$ and $Y$).
  - For $785X3678Y$, last three digits are $78Y$. $784/8 = 98 \implies Y = 4$.
  - Divisibility by 9: Sum $= 7+8+5+X+3+6+7+8+4 = 48 + X$. Next multiple of 9 is $54 \implies X = 6$.
- **Shortcut**: Last 3 digits $\implies 780 + Y = 8 \times 97 + (4+Y) \implies Y=4$.
- **Variation & Trap**: If $Y=8$ was also possible, always check if $X$ can be negative. Digits must be $0 \le X, Y \le 9$.

### Q2. Unit Digit of large exponents
**Question**: Find the unit digit of $23^{45} \times 37^{82} \times 48^{93}$.
- **Pattern ID**: NS_UNIT_EXP
- **Approach**: Cycle of unit digits is 4. Divide exponents by 4 and find remainders.
- **Solution**:
  - $23^{45} \equiv 3^{45 \pmod 4} \equiv 3^1 \equiv 3$
  - $37^{82} \equiv 7^{82 \pmod 4} \equiv 7^2 \equiv 9$
  - $48^{93} \equiv 8^{93 \pmod 4} \equiv 8^1 \equiv 8$
  - Product unit digit $= (3 \times 9 \times 8) \pmod{10} = 216 \pmod{10} = 6$.
- **Shortcut**: Divide last 2 digits of exponents by 4. Remainder $0 \implies$ use power 4.
- **Variation & Trap**: If base unit digit is 5 or 6, unit digit is constant. Don't waste time dividing.

### Q3. Factors count of composite numbers
**Question**: Find the number of factors of $360$ that are divisible by 12.
- **Pattern ID**: NS_FACT_DIV
- **Approach**: Express $360$ in prime factorization: $360 = 2^3 \times 3^2 \times 5^1$. Factor out $12 = 2^2 \times 3^1$.
- **Solution**:
  - $360 = 12 \times (2^1 \times 3^1 \times 5^1)$.
  - Number of factors of remaining part $= (1+1)(1+1)(1+1) = 8$.
- **Shortcut**: Factor out the dividing condition, calculate factors count of the remaining quotient.
- **Variation & Trap**: If question asks for odd factors, set exponent of 2 to 0.

### Q4. LCM/HCF remainders
**Question**: Find the least number which when divided by 12, 16, and 18 leaves remainder 5 in each case.
- **Pattern ID**: NS_LCM_REM
- **Approach**: Find $\text{LCM}(12, 16, 18)$ and add the constant remainder $5$.
- **Solution**:
  - $\text{LCM}(12, 16, 18) = 144$.
  - Number $= 144 + 5 = 149$.
- **Shortcut**: Check options. Subtract 5 and check divisibility by 18 (sum of digits).
- **Variation & Trap**: If remainders are different (divisors $- R = K$), subtract $K$ from LCM.

### Q5. Sum of factors
**Question**: Find the sum of all odd factors of $540$.
- **Pattern ID**: NS_FACT_SUM
- **Approach**: Prime factorization: $540 = 2^2 \times 3^3 \times 5^1$. For odd factors, omit the base 2.
- **Solution**:
  - Odd factors sum $= (3^0 + 3^1 + 3^2 + 3^3) \times (5^0 + 5^1) = (1 + 3 + 9 + 27) \times (1 + 5) = 40 \times 6 = 240$.
- **Shortcut**: Odd factors omit $2^k$ entirely from summation product.
- **Variation & Trap**: Divisible by 2 sum requires factoring out $2^1$ first.

---

## Percentages

### Q6. Successive changes
**Question**: Price of an article decreases by $10\%$, then increases by $20\%$, and then increases by $10\%$. Find net change.
- **Pattern ID**: PCT_SUCC
- **Approach**: Use successive formula twice: $x + y + \frac{xy}{100}$.
- **Solution**:
  - Step 1: $-10$ and $+20 \implies -10 + 20 - 2 = 8\%$ increase.
  - Step 2: $+8$ and $+10 \implies 8 + 10 + 0.8 = 18.8\%$ increase.
- **Shortcut**: Multiplying factor $= 0.9 \times 1.2 \times 1.1 = 1.188 \implies 18.8\%$.
- **Variation & Trap**: Do not add percentages directly ($-10 + 20 + 10 \ne 20\%$).

### Q7. Product constancy
**Question**: Sugar price increases by $20\%$. By what percentage must consumption drop to maintain the same budget?
- **Pattern ID**: PCT_PROD_CONST
- **Approach**: $20\% = 1/5$ increase $\implies$ consumption must drop by $\frac{1}{5+1} = 1/6$.
- **Solution**:
  - $1/6 \times 100 = 16.67\%$.
- **Shortcut**: $\frac{a}{b} \text{ increase} \implies \frac{a}{a+b} \text{ decrease}$.
- **Variation & Trap**: If budget can increase by $10\%$, set up $(1.20) \times (1 - x) = 1.10$.

### Q8. Salary division fractions
**Question**: Man spends $30\%$ on food, $40\%$ of remaining on rent, and saves the rest. If savings are $6300$, find total salary.
- **Pattern ID**: PCT_REM_SAV
- **Approach**: Spend $30\% \implies 70\%$ remains. Spend $40\%$ of $70 \implies 28\%$ spent. Remaining savings $= 70 - 28 = 42\%$.
- **Solution**:
  - $42\% \text{ of Salary} = 6300 \implies \text{Salary} = \frac{6300}{0.42} = 15000$.
- **Shortcut**: Multiplier: $x \times 0.7 \times 0.6 = 6300 \implies 0.42x = 6300 \implies x = 15000$.
- **Variation & Trap**: Read carefully if second spend is "of total" or "of remaining".

### Q9. Election votes calculation
**Question**: In an election, $10\%$ votes were invalid. Winner got $60\%$ of valid votes and won by 3600 votes. Find total votes.
- **Pattern ID**: PCT_ELEC
- **Approach**: Let valid votes be $V$. Winner gets $60\%$, loser gets $40\%$. Difference $= 20\%$.
- **Solution**:
  - $0.20 \times V = 3600 \implies V = 18000$.
  - Total votes $= V / 0.9 = 20000$.
- **Shortcut**: Total votes $\times 0.9 \times 0.2 = 3600 \implies 0.18x = 3600 \implies x = 20000$.
- **Variation & Trap**: Winner gets $60\%$ of *registered* votes vs *valid* votes.

### Q10. Population compounding
**Question**: Town population increases by $5\%$ annually. If current population is $8000$, find population after 2 years.
- **Pattern ID**: PCT_POP_COMP
- **Approach**: Successive growth of $5\%$ twice.
- **Solution**:
  - $8000 \times 1.05 \times 1.05 = 8820$.
- **Shortcut**: $5\% + 5\% + 0.25\% = 10.25\%$ increase $\implies 8000 \times 1.1025 = 8820$.
- **Variation & Trap**: If migration rate decreases population, use subtraction.

---

## Profit & Loss

### Q11. CP count equals SP count
**Question**: CP of 25 items is equal to SP of 20 items. Find profit or loss percentage.
- **Pattern ID**: PL_ART_COUNT
- **Approach**: Let CP of 1 item be $1 \implies$ CP of 25 items $= 25$. SP of 20 items $= 25 \implies$ profit $= 5$ on cost of 20 items.
- **Solution**:
  - $\text{Profit \%} = \frac{25 - 20}{20} \times 100 = 25\%$.
- **Shortcut**: $\frac{\text{CP count} - \text{SP count}}{\text{SP count}} \times 100 = \frac{5}{20} \times 100 = 25\%$.
- **Variation & Trap**: If result is negative, it indicates a loss.

### Q12. Dishonest dealer
**Question**: A dealer sells fruit at $10\%$ profit on CP but uses $800\text{g}$ weight instead of $1\text{kg}$. Find actual profit.
- **Pattern ID**: PL_DISHONEST
- **Approach**: SP/CP ratio $= \frac{1000}{800} \times 1.10 = 1.375$.
- **Solution**:
  - Profit ratio $= 1.375 \implies 37.5\%$ profit.
- **Shortcut**: Gain $\% = \frac{\text{True} - \text{False} + \text{Profit weight}}{\text{False}} \times 100 = \frac{200 + 100}{800} \times 100 = 37.5\%$.
- **Variation & Trap**: If dealer sells at a stated loss, subtract the loss weight equivalent.

### Q13. Successive discounts
**Question**: Find a single discount equivalent to three successive discounts of $10\%$, $20\%$, and $5\%$.
- **Pattern ID**: PL_SUCC_DISC
- **Approach**: Multiplier product: $0.9 \times 0.8 \times 0.95$.
- **Solution**:
  - $0.72 \times 0.95 = 0.684 \implies$ net discount $= 1 - 0.684 = 31.6\%$.
- **Shortcut**: Successive $10\%$ and $20\% \implies 28\%$. Successive $28\%$ and $5\% \implies 28 + 5 - 1.4 = 31.6\%$.
- **Variation & Trap**: Do not sum them up directly ($10+20+5 = 35\%$).

### Q14. Marked Price and Discount
**Question**: An item is marked $40\%$ above CP. A discount of $20\%$ is given. Find profit percentage.
- **Pattern ID**: PL_MP_DISC
- **Approach**: Successive markup and discount: $+40$ and $-20$.
- **Solution**:
  - Net profit $= 40 - 20 - \frac{40 \times 20}{100} = 12\%$.
- **Shortcut**: Multiplier: $1.4 \times 0.8 = 1.12 \implies 12\%$ profit.
- **Variation & Trap**: MP discount is applied on the marked price, not cost price.

### Q15. Two items sold at same price
**Question**: Two watches are sold at $1980$ each. One is sold at $10\%$ profit, the other at $10\%$ loss. Find net gain/loss.
- **Pattern ID**: PL_SAME_SP
- **Approach**: Equal percentage profit and loss on same SP always results in a loss of $\left(\frac{x}{10}\right)^2\%$.
- **Solution**:
  - $\text{Loss \%} = (10/10)^2\% = 1\%$ loss.
  - Total SP $= 3960 \implies$ CP $= \frac{3960}{0.99} = 4000 \implies$ loss $= 40$ rupees.
- **Shortcut**: Net change is always a loss of $x^2/100\%$.
- **Variation & Trap**: If cost price is the same for both items, there is no net profit or loss.

---

## SI & CI

### Q16. Rate of Simple Interest
**Question**: A sum of money doubles itself in 8 years at simple interest. Find the annual rate.
- **Pattern ID**: SI_DOUBLE
- **Approach**: $A = 2P \implies \text{SI} = P$. Formula: $P = \frac{P \cdot R \cdot 8}{100}$.
- **Solution**:
  - $R = 100 / 8 = 12.5\%$.
- **Shortcut**: $R = \frac{100(N-1)}{T} = \frac{100(1)}{8} = 12.5\%$.
- **Variation & Trap**: If compounding is compounded yearly, use compound interest double rule.

### Q17. Difference in CI and SI (2 Years)
**Question**: If the difference between CI and SI on a sum for 2 years at $5\%$ is $15$, find the principal.
- **Pattern ID**: SI_CI_DIFF_2
- **Approach**: Use difference formula: $D_2 = P(\frac{R}{100})^2$.
- **Solution**:
  - $15 = P(\frac{5}{100})^2 = P(1/400) \implies P = 6000$.
- **Shortcut**: $P = \frac{D \times 10000}{R^2} = \frac{150000}{25} = 6000$.
- **Variation & Trap**: Verify that the duration is exactly 2 years.

### Q18. Compound Interest compounding half-yearly
**Question**: Find the compound interest on $8000$ at $10\%$ per annum for 1 year compounded half-yearly.
- **Pattern ID**: CI_HALF_YEAR
- **Approach**: Rate $= 10/2 = 5\%$. Periods $= 1 \times 2 = 2$.
- **Solution**:
  - $A = 8000(1.05)^2 = 8000 \times 1.1025 = 8820$.
  - $\text{Interest} = 8820 - 8000 = 820$.
- **Shortcut**: Successive $5\%$ twice $= 10.25\% \implies 8000 \times 10.25\% = 820$.
- **Variation & Trap**: For compounding quarterly, divide rate by 4 and multiply years by 4.

### Q19. Principal amount in Compound Interest
**Question**: A sum of money amounts to $13310$ in 3 years at $10\%$ compound interest. Find principal.
- **Pattern ID**: CI_PRIN_CALC
- **Approach**: $A = P(1.10)^3 \implies 13310 = P(1.331)$.
- **Solution**:
  - $P = 13310 / 1.331 = 10000$.
- **Shortcut**: Multiplier for $10\%$ for 3 years is $1.331$.
- **Variation & Trap**: If simple interest was specified, sum would accumulate linearly.

### Q20. CI Installments
**Question**: A loan of $10250$ is paid back in two equal annual installments at $5\%$ compound interest. Find value of installment.
- **Pattern ID**: CI_INSTALL
- **Approach**: Let installment be $x$.
  $$P = \frac{x}{1.05} + \frac{x}{(1.05)^2} \implies 10250 = x \left(\frac{20}{21} + \frac{400}{441}\right)$$
- **Solution**:
  - $10250 = x \left(\frac{420+400}{441}\right) = x \left(\frac{820}{441}\right) \implies x = \frac{10250 \times 441}{820} = 5512.5$.
- **Shortcut**: Installment $= P / (\frac{1}{1+r} + \frac{1}{(1+r)^2})$.
- **Variation & Trap**: If simple interest installment is asked, formulas differ.

---

## Ratio & Proportion

### Q21. Coin count ratio
**Question**: A bag contains 1-rupee, 50-paise, and 25-paise coins in ratio $5:6:8$. If total value is $420$, find number of 50-paise coins.
- **Pattern ID**: RAT_COINS
- **Approach**: Express coin counts as $5x, 6x, 8x$. Value ratio $= 1 \times 5x + 0.5 \times 6x + 0.25 \times 8x$.
- **Solution**:
  - Total Value $= 5x + 3x + 2x = 10x \implies 10x = 420 \implies x = 42$.
  - Number of 50-paise coins $= 6 \times 42 = 252$.
- **Shortcut**: Total value scale factor $x = \text{Total} / \sum(\text{ratio} \times \text{value}) = 420 / 10 = 42$.
- **Variation & Trap**: Pay attention if the given ratio is for the *number of coins* or the *value of coins*.

### Q22. Age ratios
**Question**: Ratio of ages of A and B is $4:3$. 6 years hence, ratio becomes $11:9$. Find B's present age.
- **Pattern ID**: RAT_AGES
- **Approach**: Ages are $4x, 3x$. $\frac{4x+6}{3x+6} = \frac{11}{9}$.
- **Solution**:
  - $9(4x+6) = 11(3x+6) \implies 36x + 54 = 33x + 66 \implies 3x = 12 \implies x = 4$.
  - B's age $= 3 \times 4 = 12$.
- **Shortcut**: Make difference in ratio units equal. Diff of $(4:3)$ is 1, of $(11:9)$ is 2. Multiply first by 2: $(8:6) \rightarrow (11:9)$. Increase of 3 units $= 6$ years $\implies 1$ unit $= 2$ years. B's age $= 6 \times 2 = 12$.
- **Variation & Trap**: Do not calculate A's age when asked for B's age.

### Q23. Mixture dilution (Allegation)
**Question**: How many kg of rice at $24\text{/kg}$ must be mixed with $30\text{ kg}$ of rice at $36\text{/kg}$ to get a mixture worth $30\text{/kg}$?
- **Pattern ID**: RAT_MIX_ALL
- **Approach**: Let quantity of cheap rice be $x$.
  $$\frac{x}{30} = \frac{36 - 30}{30 - 24}$$
- **Solution**:
  - $\frac{x}{30} = \frac{6}{6} = 1 \implies x = 30\text{ kg}$.
- **Shortcut**: Differences are equal ($36-30 = 6$, $30-24 = 6$), so quantities must be in $1:1$ ratio.
- **Variation & Trap**: Ensure all rates are pure costs (CP) and not sales prices (SP).

### Q24. Third Proportional calculation
**Question**: Find the third proportional to $0.8$ and $1.2$.
- **Pattern ID**: RAT_THIRD_PROP
- **Approach**: $c = \frac{b^2}{a}$.
- **Solution**:
  - $c = \frac{1.2 \times 1.2}{0.8} = \frac{1.44}{0.8} = 1.8$.
- **Shortcut**: $1.2$ is $1.5\times$ of $0.8$. So next term is $1.5\times$ of $1.2 = 1.8$.
- **Variation & Trap**: Be careful with decimal placements.

### Q25. Mixture replacement cycles
**Question**: From $50\text{ L}$ of milk, $5\text{ L}$ is replaced with water. This process is repeated once more. Find final milk quantity.
- **Pattern ID**: RAT_REPL_CYCLE
- **Approach**: Final milk $= \text{Initial} \times (1 - x/V)^n$.
- **Solution**:
  - Milk $= 50 \times (1 - 5/50)^2 = 50 \times (0.9)^2 = 50 \times 0.81 = 40.5\text{ L}$.
- **Shortcut**: Each replacement reduces milk concentration to $90\%$. $50 \times 0.9 \times 0.9 = 40.5\text{ L}$.
- **Variation & Trap**: Count how many times the process is repeated (e.g. "repeated once more" means 2 cycles total).

---

## Time & Work

### Q26. Efficiencies ratio
**Question**: A is twice as efficient as B and takes 10 days less than B to finish a job. Find days taken by A.
- **Pattern ID**: TW_EFF_DAYS
- **Approach**: Efficiency ratio $A:B = 2:1 \implies$ Time ratio $A:B = 1:2$. Let times be $x, 2x$.
- **Solution**:
  - $2x - x = 10 \implies x = 10$ days. A takes 10 days, B takes 20 days.
- **Shortcut**: Time difference unit $= 1 \text{ part} = 10 \text{ days}$. A is 1 part $= 10$ days.
- **Variation & Trap**: If question asks for together, combined days $= \frac{10 \times 20}{30} = 6.67$ days.

### Q27. Alternate day schedules
**Question**: A can do work in 10 days, B in 15 days. If they work on alternate days starting with A, find total days.
- **Pattern ID**: TW_ALT_DAYS
- **Approach**: Total Work $= 30$ units (LCM). Efficiency: A $= 3$ units/day, B $= 2$ units/day.
- **Solution**:
  - Cycle of 2 days sum $= 3 + 2 = 5$ units.
  - Cycles needed $= 30 / 5 = 6$ cycles.
  - Total days $= 6 \times 2 = 12$ days.
- **Shortcut**: 5 units in 2 days $\implies 30$ units in 12 days.
- **Variation & Trap**: If work does not divide evenly, calculate the remaining fraction day by day.

### Q28. Group productivity changes
**Question**: 12 men can complete a project in 8 days. After 3 days, 2 more men join. How many days to finish remaining work?
- **Pattern ID**: TW_GROUP_JOIN
- **Approach**: Total work $= 12 \times 8 = 96$ man-days. Work completed $= 12 \times 3 = 36$ man-days.
- **Solution**:
  - Remaining work $= 96 - 36 = 60$ man-days.
  - New men count $= 12 + 2 = 14$.
  - Remaining days $= 60 / 14 = 30/7 = 4.28$ days.
- **Shortcut**: $12 \text{ men} \times 5 \text{ remaining days} = 14 \text{ men} \times D \implies D = 60/14 = 4.28$.
- **Variation & Trap**: Check if question asks for *total days* or *remaining days*.

### Q29. Pipes and Cistern negative rate
**Question**: Pipe A fills tank in 12 hours, Pipe B drains it in 15 hours. If both open together, how long to fill tank?
- **Pattern ID**: TW_PIPE_NEG
- **Approach**: Tank size $= 60$ units (LCM). Rate: A $= +5$ units/hour, B $= -4$ units/hour.
- **Solution**:
  - Combined rate $= 5 - 4 = +1$ unit/hour.
  - Time $= 60 / 1 = 60$ hours.
- **Shortcut**: $\frac{A \cdot B}{B - A} = \frac{180}{3} = 60$ hours.
- **Variation & Trap**: Check if outlet pipe starts working after some delay.

### Q30. Men, Women and Children equivalence
**Question**: 2 men or 3 women can do a work in 15 days. How long will 4 men and 6 women take to complete it?
- **Pattern ID**: TW_MW_EQUIV
- **Approach**: $2M = 3W \implies M = 1.5W$. Convert all to women.
- **Solution**:
  - $4M + 6W = 4(1.5W) + 6W = 12W$.
  - $3W \times 15 \text{ days} = 12W \times D \implies D = \frac{45}{12} = 3.75$ days.
- **Shortcut**: $\text{Days} = \frac{\text{Given Days}}{(\frac{\text{And Men}}{\text{Or Men}} + \frac{\text{And Women}}{\text{Or Women}})} = \frac{15}{4/2 + 6/3} = \frac{15}{4} = 3.75$ days.
- **Variation & Trap**: Watch out for "and" versus "or" syntax.

---

## Time Speed Distance

### Q31. Average round-trip speed
**Question**: A motorist travels to a destination at $40\text{ km/h}$ and returns at $60\text{ km/h}$. Find average speed.
- **Pattern ID**: TSD_AVG_SPEED
- **Approach**: Use harmonic mean formula: $\frac{2 S_1 S_2}{S_1 + S_2}$.
- **Solution**:
  - $\text{Avg Speed} = \frac{2 \times 40 \times 60}{100} = 48\text{ km/h}$.
- **Shortcut**: Direct product over sum double: $48$.
- **Variation & Trap**: If motorist travels different distance halves, use weighted average.

### Q32. Train crossing pole and platform
**Question**: A train crosses a pole in 15 seconds and a $300\text{m}$ platform in 30 seconds. Find speed of train.
- **Pattern ID**: TSD_TRAIN_CROSS
- **Approach**: Crossing platform takes platform length $+$ train length. Crossing pole takes train length.
- **Solution**:
  - Platform crossing extra time $= 30 - 15 = 15$ seconds.
  - Speed of train $= \text{Platform Length} / \text{Extra Time} = 300 / 15 = 20\text{ m/s} = 72\text{ km/h}$.
- **Shortcut**: Platform crossing difference covers Platform length. Speed $= 300 / 15 = 20\text{ m/s}$.
- **Variation & Trap**: Pay attention to unit requirements ($\text{m/s}$ vs $\text{km/h}$).

### Q33. Police and Thief chase relative speed
**Question**: A thief is spotted by a policeman at $200\text{m}$. Police runs at $12\text{ m/s}$, thief at $10\text{ m/s}$. Find distance run by thief before capture.
- **Pattern ID**: TSD_POLICE_CHASE
- **Approach**: Relative speed $= 12 - 10 = 2\text{ m/s}$. Time to catch $= 200 / 2 = 100$ seconds.
- **Solution**:
  - Distance run by thief $= 10\text{ m/s} \times 100\text{ s} = 1000\text{m}$.
- **Shortcut**: Ratio of speeds Police:Thief $= 12:10 = 6:5$. Difference in ratio units $= 1 \text{ part} = 200\text{m}$. Thief runs 5 parts $= 1000\text{m}$.
- **Variation & Trap**: Do not calculate police distance when asked for thief distance.

### Q34. Upstream and Downstream speed ratios
**Question**: A boat goes $24\text{ km}$ downstream in 2 hours and same distance upstream in 4 hours. Find speed of water current.
- **Pattern ID**: TSD_BOAT_STREAM
- **Approach**: Downstream speed $D = 24/2 = 12\text{ km/h}$. Upstream speed $U = 24/4 = 6\text{ km/h}$.
- **Solution**:
  - Current Speed $Y = \frac{D - U}{2} = \frac{12 - 6}{2} = 3\text{ km/h}$.
- **Shortcut**: Current speed is half the difference of speeds.
- **Variation & Trap**: Speed of boat in still water is half the sum of speeds ($\frac{12+6}{2} = 9\text{ km/h}$).

### Q35. Late and Early offsets
**Question**: Walking at $4\text{ km/h}$, a student is 10 min late. Walking at $5\text{ km/h}$, he is 5 min early. Find distance to school.
- **Pattern ID**: TSD_LATE_EARLY
- **Approach**: Let distance be $d$. $\frac{d}{4} - \frac{d}{5} = \frac{15}{60}$ hours.
- **Solution**:
  - $\frac{d}{20} = 1/4 \implies d = 5\text{ km}$.
- **Shortcut**: $\text{Distance} = \frac{S_1 \cdot S_2}{|S_1 - S_2|} \times \frac{\text{Total Time Difference}}{60} = \frac{20}{1} \times \frac{15}{60} = 5\text{ km}$.
- **Variation & Trap**: If late in both cases, subtract the offset differences.

---

## Averages

### Q36. Consecutive numbers average
**Question**: The average of 7 consecutive odd numbers is 27. Find the largest number.
- **Pattern ID**: AVG_CONSEC
- **Approach**: The average of consecutive numbers is the middle term.
- **Solution**:
  - 4th term $= 27 \implies$ terms are $21, 23, 25, 27, 29, 31, 33$.
  - Largest number $= 33$.
- **Shortcut**: $\text{Largest} = \text{Average} + (N-1) = 27 + 6 = 33$.
- **Variation & Trap**: For consecutive even numbers, same rule applies. For consecutive integers, add $(N-1)/2$.

### Q37. Weighted average of classes
**Question**: Average marks of Class A of 20 students is 60, and Class B of 30 students is 70. Find combined average.
- **Pattern ID**: AVG_WEIGHTED
- **Approach**: Total marks $= 20 \times 60 + 30 \times 70 = 1200 + 2100 = 3300$.
- **Solution**:
  - Combined average $= 3300 / 50 = 66$.
- **Shortcut**: Deviations method: assume average is 60. Deviation in Class B $= +10$ for 30 students $= +300$. Spread over 50 $\implies +6$. Combined Average $= 60 + 6 = 66$.
- **Variation & Trap**: Do not average the averages directly ($\frac{60+70}{2} = 65$, which is wrong).

### Q38. Replacement average shifts
**Question**: The average weight of 10 people increases by $1.5\text{ kg}$ when a person weighing $50\text{ kg}$ is replaced. Find weight of new person.
- **Pattern ID**: AVG_REPL_SHIFT
- **Approach**: New weight $=$ Old weight $+ N \times \text{Increase}$.
- **Solution**:
  - New weight $= 50 + 10 \times 1.5 = 65\text{ kg}$.
- **Shortcut**: Total weight shift $= 10 \times 1.5 = 15\text{ kg}$. Add this to replaced weight: $50 + 15 = 65\text{ kg}$.
- **Variation & Trap**: If average weight decreases, subtract the total weight shift instead.

### Q39. Average speed over multi-segments
**Question**: A car travels $1/3$ distance at $20\text{ km/h}$, $1/3$ at $30\text{ km/h}$, and rest at $60\text{ km/h}$. Find average speed.
- **Pattern ID**: AVG_MULTI_SEG
- **Approach**: Combined speed $= 3 / (1/S_1 + 1/S_2 + 1/S_3)$.
- **Solution**:
  - $\text{Avg} = 3 / (1/20 + 1/30 + 1/60) = 3 / (3/60 + 2/60 + 1/60) = 3 / (6/60) = 30\text{ km/h}$.
- **Shortcut**: Assume total distance is $60\text{ km}$. Segments are $20\text{ km}$ each. Times are $1\text{ h}$, $2/3\text{ h}$, $1/3\text{ h}$. Total time $= 2\text{ h}$. Average $= 60/2 = 30$.
- **Variation & Trap**: Do not sum up speeds and divide by 3.

### Q40. Excluding average change
**Question**: The average age of 5 teachers is 40. If one teacher leaves, average drops by 2. Find age of teacher who left.
- **Pattern ID**: AVG_EXCL_CHANGE
- **Approach**: Sum of 5 teachers $= 200$. Sum of 4 teachers $= 4 \times 38 = 152$.
- **Solution**:
  - Age of teacher $= 200 - 152 = 48$.
- **Shortcut**: Age $=$ Old Average $+ (N-1) \times \text{Drop} = 40 + 4 \times 2 = 48$.
- **Variation & Trap**: If a teacher joins, calculation uses different sign offsets.

---

## Permutations & Combinations

### Q41. Team selection combinations
**Question**: In how many ways can a team of 5 players be selected from 8 men and 3 women containing at least 4 men?
- **Pattern ID**: PC_TEAM_SEL
- **Approach**: "At least 4 men" means: Case A (4 men, 1 woman) or Case B (5 men, 0 women).
- **Solution**:
  - Case A: $8C4 \times 3C1 = 70 \times 3 = 210$ ways.
  - Case B: $8C5 \times 3C0 = 56 \times 1 = 56$ ways.
  - Total ways $= 210 + 56 = 266$ ways.
- **Shortcut**: Sum of combinations case-by-case.
- **Variation & Trap**: Do not multiply options when they are alternative cases (add them instead).

### Q42. Digit arrangements with limits
**Question**: How many 4-digit numbers greater than 5000 can be formed using digits 3, 5, 7, 8 without repetition?
- **Pattern ID**: PC_DIGIT_ARR
- **Approach**: The first digit must be 5, 7, or 8 (3 options). Remaining 3 positions can be filled in $3! = 6$ ways.
- **Solution**:
  - Total numbers $= 3 \times 6 = 18$.
- **Shortcut**: 3 choice positions $\times$ remaining permutations.
- **Variation & Trap**: If repetition is allowed, first digit has 3 options, remaining have 4 options each ($3 \times 4^3 = 192$).

### Q43. Circular table seating
**Question**: In how many ways can 6 people be seated at a round table if two specific people must sit together?
- **Pattern ID**: PC_CIRC_TGT
- **Approach**: Treat the 2 people as 1 block. Total items to arrange $= 5$.
- **Solution**:
  - Circular arrangement of 5 items $= (5-1)! = 4! = 24$ ways.
  - Inner arrangement of the two people $= 2! = 2$ ways.
  - Total arrangements $= 24 \times 2 = 48$.
- **Shortcut**: Treat group as single object, then multiply by internal permutations.
- **Variation & Trap**: If they must NOT sit together, subtract 48 from total circular arrangements of 6 people ($120 - 48 = 72$).

### Q44. Word arrangements vowels together
**Question**: How many ways can the letters of the word "LEADING" be arranged so vowels are always together?
- **Pattern ID**: PC_WORD_VOWELS
- **Approach**: Vowels are E, A, I (3 vowels). Consonants are L, D, N, G (4 consonants).
- **Solution**:
  - Treat vowels as 1 block. Total objects $= 4 + 1 = 5$.
  - Arrange 5 objects $= 5! = 120$ ways.
  - Arrange vowels internally $= 3! = 6$ ways.
  - Total ways $= 120 \times 6 = 720$.
- **Shortcut**: $(C+1)! \times V!$.
- **Variation & Trap**: Be careful with repeating letters; divide by factorial of frequency of repeating elements.

### Q45. Selecting grid paths
**Question**: Find the number of pathways from top-left to bottom-right of a $3 \times 3$ grid moving only down or right.
- **Pattern ID**: PC_GRID_PATH
- **Approach**: To cover $3 \times 3$ grid, we need 3 Down moves and 3 Right moves. Total moves $= 6$.
- **Solution**:
  - Pathway combinations $= 6C3 = 20$.
- **Shortcut**: $\frac{(R+D)!}{R! \cdot D!}$.
- **Variation & Trap**: Ensure indices match step count and not coordinate counts.

---

## Probability

### Q46. Double Dice product even
**Question**: Two dice are thrown. Find the probability that the product of the numbers shown is even.
- **Pattern ID**: PROB_DICE_PROD
- **Approach**: Product is odd only if both numbers are odd. Odd digits on die are 1, 3, 5 (3 options).
- **Solution**:
  - $P(\text{Odd Product}) = \frac{3}{6} \times \frac{3}{6} = 1/4$.
  - $P(\text{Even Product}) = 1 - 1/4 = 3/4$.
- **Shortcut**: Calculate the complement (odd $\times$ odd) and subtract from 1.
- **Variation & Trap**: If question asks for sum to be even, sum is even if both are even or both are odd ($1/2$).

### Q47. Picking cards combination
**Question**: Two cards are drawn from a deck of 52. Find the probability that both are aces.
- **Pattern ID**: PROB_CARD_ACES
- **Approach**: Favorable outcomes $= 4C2$. Total outcomes $= 52C2$.
- **Solution**:
  - $P(\text{2 Aces}) = \frac{4 \times 3}{2} / \frac{52 \times 51}{2} = \frac{12}{2652} = 1/221$.
- **Shortcut**: $\frac{4}{52} \times \frac{3}{51} = \frac{1}{13} \times \frac{1}{17} = 1/221$.
- **Variation & Trap**: If replacement is allowed, probability is $\frac{4}{52} \times \frac{4}{52} = 1/169$.

### Q48. Red and Blue balls pick
**Question**: A box contains 5 red and 4 blue balls. If 3 balls are drawn, find probability that at least 2 are red.
- **Pattern ID**: PROB_BALLS_RED
- **Approach**: "At least 2 red" means: Case A (2 red, 1 blue) or Case B (3 red, 0 blue).
- **Solution**:
  - Case A: $5C2 \times 4C1 = 10 \times 4 = 40$ combinations.
  - Case B: $5C3 \times 4C0 = 10 \times 1 = 10$ combinations.
  - Favorable outcomes $= 40 + 10 = 50$. Total combinations $= 9C3 = 84$.
  - $P(\ge 2\text{ Red}) = 50/84 = 25/42$.
- **Shortcut**: Sum of favorable combinatorics over total space.
- **Variation & Trap**: If question says "at most 2 red", subtract 3 red from 1.

### Q49. Coins head outcomes
**Question**: Three coins are tossed. Find the probability of getting exactly 2 heads.
- **Pattern ID**: PROB_COIN_HEADS
- **Approach**: Total outcomes $= 2^3 = 8$. Favorable outcomes (HHT, HTH, THH) $= 3$.
- **Solution**:
  - Probability $= 3/8$.
- **Shortcut**: $NCk / 2^N \implies 3C2 / 8 = 3/8$.
- **Variation & Trap**: If question says "at least 2 heads", favorable outcomes also include 3 heads ($3/8 + 1/8 = 1/2$).

### Q50. Independent event successions
**Question**: Target hit probabilities for A, B, and C are $1/2$, $1/3$, and $1/4$. If they shoot simultaneously, find probability that target is hit.
- **Pattern ID**: PROB_TARGET_HIT
- **Approach**: Target is hit if at least one hits. Calculate complement: nobody hits.
- **Solution**:
  - $P(\text{A misses}) = 1 - 1/2 = 1/2$.
  - $P(\text{B misses}) = 1 - 1/3 = 2/3$.
  - $P(\text{C misses}) = 1 - 1/4 = 3/4$.
  - $P(\text{All miss}) = 1/2 \times 2/3 \times 3/4 = 1/4$.
  - $P(\text{Target hit}) = 1 - 1/4 = 3/4$.
- **Shortcut**: $1 - P(\text{All Misses})$.
- **Variation & Trap**: If question asks for exactly one person to hit, calculate $P(A)P(B')P(C') + P(A')P(B)P(C') + P(A')P(B')P(C)$.

---

## Pattern Frequency Chart

This table details the frequency of these patterns in recent TCS NQT exams:

| Topic | Pattern | Exam Weight | Priority Rank |
| :--- | :--- | :--- | :--- |
| **Number System** | Divisibility, Remainders | High (3-4 questions) | 1 |
| **Profit & Loss** | Article counting, Dishonest Dealer | High (2-3 questions) | 2 |
| **Time Speed Distance** | Average Speed, Train Crossing | High (2 questions) | 3 |
| **Time & Work** | alternate day schedules, group changes | High (2 questions) | 4 |
| **SI & CI** | Difference formulas, compounding cycles | Medium (1-2 questions) | 5 |
| **Percentages** | Successive changes, product constancy | Medium (1-2 questions) | 6 |
| **Ratio & Proportion** | Mixture Allegation, coin counts | Medium (1 question) | 7 |
| **Probability** | Dice products, card combinations | Medium (1 question) | 8 |
| **Averages** | consecutive numbers, deviations | Low (1 question) | 9 |
| **Permutation & Comb** | digit arrangements, table seating | Low (1 question) | 10 |
