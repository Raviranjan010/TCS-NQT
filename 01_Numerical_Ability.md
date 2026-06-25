# TCS NQT 2026 — Numerical Ability Complete Preparation Guide
**Exam Date: June 28, 2026 | Prepared for: Ravi Ranjan**

---

## 📊 BLOCK A — ARITHMETIC

### 1. Percentages (⭐)
* **Concept Summary**: Percentages represent a fraction out of 100. In TCS NQT, this topic focuses on percentage increase/decrease, successive percentage changes (e.g. salary hikes, tax additions), and population/depreciation problems. A critical concept is that a change of $x\%$ followed by a change of $y\%$ results in a net change of $x + y + \frac{xy}{100}\%$.
* **Real-world analogy**: A tax markup followed by a discount at a supermarket checkout.
* **Key Formulas**:
  $$\text{Percentage Increase} = \frac{\text{Increase}}{\text{Original Value}} \times 100$$
  $$\text{Net Successive \% Change} = x + y + \frac{xy}{100}\%$$
  $$\text{Population After } n \text{ Years} = P(1 \pm \frac{R}{100})^n$$
* **Shortcut Tricks**:
  1. **Fraction Equivalents**: Use fraction equivalents (like $12.5\% = 1/8$, $16.67\% = 1/6$) to convert multiplication into simple division.
  2. **Product Constancy**: If price increases by $R\%$, consumption must decrease by $\frac{R}{100+R} \times 100\%$ to keep expenditure constant.
  3. **Digital Sum Verification**: Sum the digits of your final percentage calculation to match the correct option.
* **30-Second Trick**: When compounding population growth or successive discounts, use multiplying factors (e.g., $20\%$ increase $= 1.2$, $10\%$ decrease $= 0.9$). Net change $= 1.2 \times 0.9 = 1.08 \implies 8\%$ increase.
* **Common Errors**: Mistaking the base value. If $A$ is $25\%$ more than $B$, students wrongly assume $B$ is $25\%$ less than $A$ (it is actually $\frac{25}{125} \times 100 = 20\%$ less).
* **PYQ-style Questions**:
  1. *Q*: The population of a town increases by $10\%$ in the first year and decreases by $10\%$ in the second year. If the current population is 9900, what was it two years ago?  
     *Sol*: Let original population be $P$. $P \times 1.1 \times 0.9 = 9900 \implies P \times 0.99 = 9900 \implies P = 10000$. **Ans: 10000**
  2. *Q*: A's salary is $20\%$ lower than B's salary. By what percentage is B's salary higher than A's?  
     *Sol*: $\text{Percentage higher} = \frac{20}{100-20} \times 100 = \frac{20}{80} \times 100 = 25\%$. **Ans: 25**
  3. *Q*: In an exam, $35\%$ of candidates failed in English and $40\%$ failed in Hindi. If $15\%$ failed in both, find the percentage of candidates who passed in both.  
     *Sol*: Failed in at least one $= 35 + 40 - 15 = 60\%$. Passed in both $= 100\% - 60\% = 40\%$. **Ans: 40**
  4. *Q*: If the radius of a circle is increased by $20\%$, what is the percentage increase in its area?  
     *Sol*: Successive change: $20 + 20 + \frac{20 \times 20}{100} = 40 + 4 = 44\%$. **Ans: 44**
  5. *Q*: A number is first increased by $10\%$ and then decreased by $10\%$. Find the net increase or decrease percent.  
     *Sol*: $10 - 10 - \frac{100}{100} = -1\%$. **Ans: 1 (decrease)**
* **Expected June 2026 Questions**:
  1. *Q*: The price of oil increases by $25\%$. By how much should a family reduce consumption to keep budget unchanged? **Ans: 20**
  2. *Q*: A candidate must secure $33\%$ marks to pass. He gets 125 marks and fails by 40 marks. Max marks? **Ans: 500**
  3. *Q*: If $80\%$ of A $= 50\%$ of B and B $= x\%$ of A, find $x$. **Ans: 160**

---

### 2. Profit & Loss (⭐)
* **Concept Summary**: Profit & Loss deals with transactions involving Cost Price (CP), Selling Price (SP), and Marked Price (MP). Discounts are always calculated on MP, whereas Profit or Loss percentages are calculated on CP. TCS NQT frequently features "faulty weights" where a merchant cheats both while buying and selling, or uses a weight that is less than the true weight.
* **Real-world analogy**: A retail store buying products wholesale, marking them up, and then offering promotional discounts.
* **Key Formulas**:
  $$\text{Profit \%} = \frac{\text{SP} - \text{CP}}{\text{CP}} \times 100$$
  $$\text{Discount \%} = \frac{\text{MP} - \text{SP}}{\text{MP}} \times 100$$
  $$\text{Faulty Weight Profit \%} = \frac{\text{Error}}{\text{True Weight} - \text{Error}} \times 100$$
* **Shortcut Tricks**:
  1. **SP Equating**: If cost price of $X$ articles equals selling price of $Y$ articles, $\text{Profit/Loss \%} = \frac{X - Y}{Y} \times 100$.
  2. **Faulty Weights Shortcut**: $\text{Effective Ratio} = \frac{\text{True Weight}}{\text{False Weight}}$. Profit % $= (\text{Ratio} - 1) \times 100\%$.
  3. **No Profit No Loss Mix**: When two items are sold at same price (one at $x\%$ profit, other at $x\%$ loss), there is always a loss of $\frac{x^2}{100}\%$.
* **30-Second Trick**: For discount chains (e.g., $10\%$ and $20\%$), find the single equivalent discount using $x + y - \frac{xy}{100} \implies 10 + 20 - 2 = 28\%$ discount.
* **Common Errors**: Calculating discount on Cost Price instead of Marked Price. Always anchor discounts to the Marked Price (MP).
* **PYQ-style Questions**:
  1. *Q*: A dealer sells goods using a weight of 900g instead of 1kg. Find his profit percentage.  
     *Sol*: $\text{Profit \%} = \frac{100}{900} \times 100 = 11.11\%$. **Ans: 11.11**
  2. *Q*: An article is sold at a loss of $10\%$. If it had been sold for ₹90 more, there would have been a profit of $5\%$. Find CP.  
     *Sol*: Difference in percentages $= 5\% - (-10\%) = 15\%$. $15\%$ of CP $= 90 \implies \text{CP} = 600$. **Ans: 600**
  3. *Q*: A shopkeeper marks his goods $20\%$ above CP and gives a discount of $10\%$. Find his profit percentage.  
     *Sol*: Let CP $= 100 \implies \text{MP} = 120$. $\text{SP} = 120 \times 0.9 = 108 \implies \text{Profit} = 8\%$. **Ans: 8**
  4. *Q*: A man sells two articles for ₹990 each, gaining $10\%$ on one and losing $10\%$ on the other. Net profit/loss?  
     *Sol*: Loss of $\frac{10^2}{100} = 1\%$. **Ans: 1 (loss)**
  5. *Q*: By selling 33 meters of cloth, a merchant gains the cost price of 11 meters. Find the profit percent.  
     *Sol*: $\text{Profit \%} = \frac{11}{33} \times 100 = 33.33\%$. **Ans: 33.33**
* **Expected June 2026 Questions**:
  1. *Q*: A dishonest shopkeeper claims to sell at CP but uses an 800g weight instead of 1kg. Profit %? **Ans: 25**
  2. *Q*: CP of 20 articles is equal to SP of 15 articles. Find profit %. **Ans: 33.33**
  3. *Q*: Buy 3 get 1 free represents what percentage discount? **Ans: 25**

---

### 3. Simple & Compound Interest (⭐)
* **Concept Summary**: Simple Interest (SI) is calculated only on the principal amount, growing linearly. Compound Interest (CI) is calculated on the principal plus accumulated interest, growing exponentially. TCS NQT commonly tests non-annual compounding (half-yearly, quarterly) and the difference between CI and SI over 2 or 3 years.
* **Real-world analogy**: A savings account where interest is credited monthly versus a flat government bond.
* **Key Formulas**:
  $$SI = \frac{P \times R \times T}{100}$$
  $$CI = P(1 + \frac{R}{100 \times k})^{k \cdot T} - P \quad (k = 2 \text{ for half-yearly, } 4 \text{ for quarterly})$$
  $$CI_2 - SI_2 = P(\frac{R}{100})^2 \quad \text{and} \quad CI_3 - SI_3 = P(\frac{R}{100})^2 (3 + \frac{R}{100})$$
* **Shortcut Tricks**:
  1. **CI Multiplication**: For 2 years at rate $R\%$, the effective compound rate is $2R + \frac{R^2}{100}\%$.
  2. **Rule of 72**: To find how long it takes for money to double under CI, divide 72 by the annual interest rate.
  3. **Quarterly Rate Adjustment**: If compounded quarterly, divide rate by 4 and multiply time by 4.
* **30-Second Trick**: If a sum at CI doubles in $n$ years, it will become $2^k$ times in $k \times n$ years. E.g., doubles in 4 years $\implies$ becomes 8 times ($2^3$) in $3 \times 4 = 12$ years.
* **Common Errors**: Using the compound amount formula $A = P(1+R/100)^T$ and forgetting to subtract $P$ to find the actual compound interest.
* **PYQ-style Questions**:
  1. *Q*: Find the difference between CI and SI on a sum of ₹10,000 for 2 years at $8\%$ per annum.  
     *Sol*: $\text{Difference} = P(R/100)^2 = 10000 \times (8/100)^2 = 10000 \times \frac{64}{10000} = 64$. **Ans: 64**
  2. *Q*: A sum of money triples itself in 15 years at Simple Interest. Find the rate of interest per annum.  
     *Sol*: Triple means SI $= 2P$. $2P = \frac{P \times R \times 15}{100} \implies R = \frac{200}{15} = 13.33\%$. **Ans: 13.33**
  3. *Q*: A sum of money at CI doubles itself in 5 years. In how many years will it become 8 times itself?  
     *Sol*: $8 = 2^3 \implies \text{Time} = 3 \times 5 = 15$ years. **Ans: 15**
  4. *Q*: If ₹8000 amounts to ₹9261 in 3 years at compound interest, find the rate of interest per annum.  
     *Sol*: $\frac{A}{P} = \frac{9261}{8000} = (\frac{21}{20})^3$. Since time is 3 years, $1 + R/100 = 21/20 \implies R = 5\%$. **Ans: 5**
  5. *Q*: What will be the compound interest on ₹10,000 for 1 year at $10\%$ per annum, compounded half-yearly?  
     *Sol*: New rate $= 10/2 = 5\%$; New cycles $= 2$. $CI = 10000(1.05)^2 - 10000 = 1025$. **Ans: 1025**
* **Expected June 2026 Questions**:
  1. *Q*: If the difference between CI and SI on ₹5000 for 2 years is ₹72, find the annual interest rate. **Ans: 12**
  2. *Q*: In how many years will a sum of money double at $12.5\%$ simple interest? **Ans: 8**
  3. *Q*: Find CI on ₹16000 for 9 months at $20\%$ per annum compounded quarterly. **Ans: 2522**

---

### 4. Ratio & Proportion (⭐)
* **Concept Summary**: Ratios compare quantities, while proportions show equality between ratios. In TCS NQT, this includes direct/inverse variation, dividing a sum into parts, mixture problems (alligation), and partnerships. In partnership, profits are distributed in the ratio of the product of capital invested and the time duration of investment.
* **Real-world analogy**: A recipe where changing the number of servings requires scaling all ingredients proportionally.
* **Key Formulas**:
  $$\text{If } a:b = c:d \implies ad = bc$$
  $$\text{Mean Proportional of } a \text{ and } b = \sqrt{ab}$$
  $$\text{Profit Ratio in Partnership} = (C_1 \times T_1) : (C_2 \times T_2)$$
* **Shortcut Tricks**:
  1. **Combining Ratios**: To combine $A:B$ and $B:C$, multiply the ratios to match the middle term $B$.
  2. **Mean Proportional Shortcut**: If asked for the mean proportional of 9 and 16, it is $\sqrt{9 \times 16} = 3 \times 4 = 12$.
  3. **Alligation Rule**: $\frac{\text{Quantity of Cheaper}}{\text{Quantity of Dearer}} = \frac{d - m}{m - c}$ where $d$ is dearer cost, $c$ is cheaper cost, $m$ is mean cost.
* **30-Second Trick**: When combining $A:B = 2:3$ and $B:C = 4:5$, write them stacked: $2:3$ and $4:5$. Cross-multiply: $2 \times 4 : 3 \times 4 : 3 \times 5 \implies 8 : 12 : 15$.
* **Common Errors**: In partnerships, forgetting to multiply the capital by the time period of investment. Always use $C \times T$.
* **PYQ-style Questions**:
  1. *Q*: A and B invest in a business in the ratio $3:2$. If $5\%$ of total profit goes to charity and A's share is ₹855, find the total profit.  
     *Sol*: Let total profit be $P$. Net profit for distribution $= 0.95P$. A's share $= \frac{3}{5} \times 0.95P = 855 \implies 0.57P = 855 \implies P = 1500$. **Ans: 1500**
  2. *Q*: Find the third proportional to 9 and 12.  
     *Sol*: Let it be $x$. $9:12 = 12:x \implies 9x = 144 \implies x = 16$. **Ans: 16**
  3. *Q*: A bag contains coins of 50p, 25p, and 10p in the ratio $5:9:4$ amounting to ₹206. Find the number of 50p coins.  
     *Sol*: Value ratio $= (5 \times 0.5) : (9 \times 0.25) : (4 \times 0.1) = 2.5 : 2.25 : 0.4 = 10 : 9 : 1.6 \implies 50 : 45 : 8$.  
     Value of 50p coins $= \frac{50}{103} \times 206 = ₹100$. Number of 50p coins $= 100 \times 2 = 200$. **Ans: 200**
  4. *Q*: In a mixture of 60 liters, the ratio of milk and water is $2:1$. What quantity of water should be added to make it $1:2$?  
     *Sol*: Original: Milk $= 40$L, Water $= 20$L. To make ratio $1:2$, Milk (40) must be 1 part, so Water must be 80L. Water to add $= 80 - 20 = 60$L. **Ans: 60**
  5. *Q*: What number should be added to each of 6, 7, 15, and 17 so that the resulting numbers are in proportion?  
     *Sol*: Let $x$ be added. $\frac{6+x}{7+x} = \frac{15+x}{17+x} \implies (6+x)(17+x) = (7+x)(15+x) \implies 102 + 23x + x^2 = 105 + 22x + x^2 \implies x = 3$. **Ans: 3**
* **Expected June 2026 Questions**:
  1. *Q*: If $A:B = 3:4$ and $B:C = 8:9$, find $A:C$. **Ans: 2/3**
  2. *Q*: Two numbers are in the ratio $3:5$. If 9 is subtracted from each, they are in the ratio $12:23$. Find the smaller number. **Ans: 33**
  3. *Q*: Split ₹1200 among A, B, and C in ratio $2:3:5$. Find B's share. **Ans: 360**

---

### 5. Time & Work (⭐)
* **Concept Summary**: Time & Work revolves around calculating how long individuals or groups take to complete a task. In TCS NQT, this is solved using the **LCM method** (representing total work as the LCM of individual times to find efficiencies) and Pipes & Cisterns (where inlet pipes have positive efficiency and outlet pipes have negative efficiency).
* **Real-world analogy**: A team of builders constructing a wall, where some lay bricks and others accidentally knock them down.
* **Key Formulas**:
  $$\text{Total Work} = \text{Efficiency} \times \text{Time}$$
  $$\text{If A takes } x \text{ days and B takes } y \text{ days, together they take } \frac{xy}{x+y} \text{ days}$$
  $$\frac{M_1 D_1 H_1}{W_1} = \frac{M_2 D_2 H_2}{W_2}$$
* **Shortcut Tricks**:
  1. **LCM Method**: Total Work = LCM(times). Efficiency = Total Work / Time.
  2. **Alternate Days**: Group two days of work together as a single unit to easily cycle through the scheduling.
  3. **Man-Days Formula**: Use the work equivalence formula $\frac{M \cdot D}{W}$ to solve group workforce shifts.
* **30-Second Trick**: If A is twice as efficient as B, they take time in the ratio $1:2$. If they work together, their combined efficiency is 3 parts.
* **Common Errors**: Directly adding the days taken by individuals (e.g. A takes 5 days, B takes 10 days $\implies$ together they take 15 days). You must add their efficiencies (work rates), not their times.
* **PYQ-style Questions**:
  1. *Q*: A can do a work in 10 days and B in 15 days. How many days will they take to complete it together?  
     *Sol*: LCM of 10 and 15 is 30 (Total Work). Efficiency of A $= 3$, B $= 2$. Together $= 5$. Time $= 30/5 = 6$ days. **Ans: 6**
  2. *Q*: 12 men can complete a work in 8 days. In how many days can 16 men complete it?  
     *Sol*: $M_1 D_1 = M_2 D_2 \implies 12 \times 8 = 16 \times D_2 \implies D_2 = 6$. **Ans: 6**
  3. *Q*: Pipe A can fill a tank in 20 hours and Pipe B can empty it in 30 hours. If both run together, when will the tank be full?  
     *Sol*: Total capacity $= 60$ (LCM of 20, 30). Efficiency of A $= +3$, B $= -2$. Combined efficiency $= 3 - 2 = +1$. Time $= 60/1 = 60$ hours. **Ans: 60**
  4. *Q*: A is twice as fast as B. If together they finish a work in 14 days, in how many days can A alone finish it?  
     *Sol*: Efficiency ratio A:B $= 2:1$. Together efficiency $= 3$. Total work $= 3 \times 14 = 42$. A's time $= 42/2 = 21$ days. **Ans: 21**
  5. *Q*: A can do a piece of work in 8 days, B in 12 days, and C in 15 days. How long will they take working together?  
     *Sol*: LCM of 8, 12, 15 is 120. Efficiencies: A $= 15$, B $= 10$, C $= 8$. Total $= 33$. Time $= 120/33 = 3.64$ days. **Ans: 3.64**
* **Expected June 2026 Questions**:
  1. *Q*: A can build a wall in 9 days, B in 12 days. If they work on alternate days starting with A, how many days to finish? **Ans: 10.25**
  2. *Q*: 10 men or 20 women can do a work in 15 days. 10 men and 10 women will take how long? **Ans: 10**
  3. *Q*: If 3 pipes fill a tank in 6 hours, and after 2 hours one is closed, remaining two fill it in 8 hours. Time for the closed one alone? **Ans: 12**

---

### 6. Time, Speed & Distance (⭐)
* **Concept Summary**: This topic covers the relation between speed, distance, and time. Standard components include relative speed (opposite direction: add speeds; same direction: subtract), average speed over journeys, train crossing problems, and boats & streams (downstream: $U+V$; upstream: $U-V$).
* **Real-world analogy**: Two trains passing each other, or a kayak paddling with and against a river current.
* **Key Formulas**:
  $$\text{Speed} = \frac{\text{Distance}}{\text{Time}}$$
  $$\text{Average Speed (Equal Distances)} = \frac{2xy}{x+y}$$
  $$\text{Relative Speed (Same Dir)} = S_1 - S_2 \quad | \quad \text{Relative Speed (Opposite Dir)} = S_1 + S_2$$
  $$\text{Downstream Speed } (D) = U + V \quad | \quad \text{Upstream Speed } (U_p) = U - V$$
* **Shortcut Tricks**:
  1. **km/h to m/s conversion**: Multiply by $\frac{5}{18}$. To go from m/s to km/h, multiply by $\frac{18}{5}$.
  2. **Train Passing Objects**: When crossing a pole, distance is train length. When crossing a platform, distance is train length + platform length.
  3. **Constant Distance Rule**: If distance is constant, speed is inversely proportional to time: $S_1/S_2 = T_2/T_1$.
* **30-Second Trick**: For average speed with equal distance intervals, use the harmonic mean of the speeds.
* **Common Errors**: Forgetting to convert units. Ensure all speeds are in m/s if distance is in meters and time is in seconds.
* **PYQ-style Questions**:
  1. *Q*: A train 120m long passes a platform 180m long in 15 seconds. Find the speed of the train in km/h.  
     *Sol*: Total distance $= 120 + 180 = 300$m. Speed $= 300 / 15 = 20$ m/s. In km/h $= 20 \times (18/5) = 72$ km/h. **Ans: 72**
  2. *Q*: A man can row 6 km/h in still water. If the speed of the stream is 2 km/h, it takes him 3 hours to row to a place and back. Find the distance.  
     *Sol*: Downstream speed $= 6+2 = 8$ km/h. Upstream speed $= 6-2 = 4$ km/h. Let distance be $d$. $\frac{d}{8} + \frac{d}{4} = 3 \implies \frac{3d}{8} = 3 \implies d = 8$ km. **Ans: 8**
  3. *Q*: Walking at $3/4$ of his usual speed, a man is 20 minutes late to his office. Find his usual time.  
     *Sol*: Speed ratio $= 3:4 \implies$ Time ratio $= 4:3$. Difference of 1 part $= 20$ minutes. Usual time (3 parts) $= 3 \times 20 = 60$ minutes. **Ans: 60**
  4. *Q*: A thief is spotted by a policeman from 200m. The thief runs at 10 km/h and the policeman runs at 11 km/h. Distance between them after 6 minutes?  
     *Sol*: Relative speed $= 11 - 10 = 1$ km/h $= 5/18$ m/s. Distance covered in 6 min ($360$s) $= (5/18) \times 360 = 100$m. Remaining distance $= 200 - 100 = 100$m. **Ans: 100**
  5. *Q*: Two trains start from A and B and travel towards each other at 50 km/h and 60 km/h. At meeting, the second train has traveled 120 km more. Distance between A and B?  
     *Sol*: Let time to meet be $t$ hours. Difference in distance $= 60t - 50t = 10t = 120 \implies t = 12$ hours. Total distance $= (50 + 60) \times 12 = 110 \times 12 = 1320$ km. **Ans: 1320**
* **Expected June 2026 Questions**:
  1. *Q*: A man travels a distance of 24 km at 6 km/h and another 24 km at 8 km/h. Average speed? **Ans: 6.86**
  2. *Q*: A boat covers 24 km upstream and 36 km downstream in 6 hours. If upstream speed is 8 km/h, find stream speed. **Ans: 2**
  3. *Q*: A train crosses a pole in 12 seconds and a 150m platform in 18 seconds. Find train length. **Ans: 300**

---

### 7. Averages & Weighted Averages
* **Concept Summary**: An average is the sum of observations divided by the total count. Weighted averages consider the relative importance (weights) of each group. TCS NQT often features "replacement" problems where an element is added or removed, causing the average to change.
* **Real-world analogy**: A grade point average where final exams count for more than weekly quizzes.
* **Key Formulas**:
  $$\text{Average} = \frac{\text{Sum of All Observations}}{\text{Total Number of Observations}}$$
  $$\text{Weighted Average} = \frac{w_1 x_1 + w_2 x_2 + \dots + w_n x_n}{w_1 + w_2 + \dots + w_n}$$
  $$\text{New Value} = \text{Old Value} + (\text{New Count} \times \text{Change in Average})$$
* **Shortcut Tricks**:
  1. **Deviation Method**: Choose an arbitrary assumed average and calculate positive/negative deviations of all values.
  2. **AP Average Shortcut**: The average of any Arithmetic Progression is simply $\frac{\text{First Term} + \text{Last Term}}{2}$.
  3. **Replacement Formula**: $\text{New Weight} = \text{Replaced Weight} + \text{Total Count} \times \text{Increase in Average}$.
* **30-Second Trick**: If average of 10 values increases by 2 when a new number replaces an old one, the new number is $10 \times 2 = 20$ larger than the replaced one.
* **Common Errors**: Forgetting that when a new person is added, the denominator (count of people) increases by 1.
* **PYQ-style Questions**:
  1. *Q*: The average age of a class of 30 students is 15 years. If the teacher's age is included, the average age increases by 1 year. Find the teacher's age.  
     *Sol*: $\text{Teacher's age} = \text{Old Average} + \text{New Count} \times \text{Increase} = 15 + 31 \times 1 = 46$ years. **Ans: 46**
  2. *Q*: The average weight of 8 men is increased by 1.5 kg when one of them who weighs 60 kg is replaced by a new man. Find the weight of the new man.  
     *Sol*: $\text{New Weight} = 60 + 8 \times 1.5 = 60 + 12 = 72$ kg. **Ans: 72**
  3. *Q*: Find the average of the first 50 natural numbers.  
     *Sol*: $(1 + 50) / 2 = 25.5$. **Ans: 25.5**
  4. *Q*: The average of 5 consecutive odd numbers is 61. Find the highest number.  
     *Sol*: The average of 5 consecutive numbers is the middle term. Middle term $= 61$. The numbers are $57, 59, 61, 63, 65$. Highest is 65. **Ans: 65**
  5. *Q*: A student's average score in 10 tests was 80. If the highest and lowest scores are excluded, the average is 82. If the highest score is 98, find the lowest score.  
     *Sol*: Total of 10 tests $= 800$. Total of 8 tests $= 82 \times 8 = 656$. Sum of Highest + Lowest $= 800 - 656 = 144$. If Highest $= 98 \implies$ Lowest $= 144 - 98 = 46$. **Ans: 46**
* **Expected June 2026 Questions**:
  1. *Q*: The average of 11 results is 50. If the average of the first six is 49 and the last six is 52, find the sixth result. **Ans: 56**
  2. *Q*: What is the average of all prime numbers between 20 and 40? **Ans: 30**
  3. *Q*: A cricketer has a mean score of 58 runs in 9 innings. How many runs must he score in the 10th inning to raise the mean to 61? **Ans: 88**

---

## 🔢 BLOCK B — NUMBER SYSTEM

### 8. Divisibility Rules & HCF/LCM (⭐)
* **Concept Summary**: Divisibility rules determine if a number can be divided by another without a remainder. TCS NQT heavily tests composite rules (e.g., divisibility by 72 requires divisibility by both 8 and 9). HCF & LCM problems often involve finding the largest or smallest number that leaves specific remainders when divided by given numbers.
* **Real-world analogy**: A clock system where gears of different tooth counts align at periodic intervals.
* **Key Formulas**:
  $$\text{Product of } 2 \text{ Numbers} = \text{HCF} \times \text{LCM}$$
  $$\text{HCF of Fractions} = \frac{\text{HCF of Numerators}}{\text{LCM of Denominators}}$$
  $$\text{LCM of Fractions} = \frac{\text{LCM of Numerators}}{\text{HCF of Denominators}}$$
* **Shortcut Tricks**:
  1. **Divisibility by 8**: Check only the last three digits. If they are divisible by 8, the entire number is.
  2. **Divisibility by 9**: Sum of digits must be divisible by 9.
  3. **Divisibility by 11**: Odd place sum minus even place sum must be 0 or a multiple of 11.
* **30-Second Trick**: When solving divisibility of large numbers (e.g., $72 = 8 \times 9$), always check divisibility of 8 first to narrow down the unit/tens digits, then apply 9.
* **Common Errors**: Calculating the LCM of fractions as LCM(numerators)/LCM(denominators). Remember to divide by HCF of denominators.
* **PYQ-style Questions**:
  1. *Q*: If the number $5432a7$ is divisible by 9, find the digit $a$.  
     *Sol*: Sum of digits $= 5 + 4 + 3 + 2 + a + 7 = 21 + a$. For $21 + a$ to be a multiple of 9, $a$ must be 6. **Ans: 6**
  2. *Q*: Find the largest 4-digit number divisible by 15, 25, 40, and 75.  
     *Sol*: LCM of 15, 25, 40, 75 is 600. Largest 4-digit number is 9999. $9999 / 600 \implies$ Remainder $= 399$. $9999 - 399 = 9600$. **Ans: 9600**
  3. *Q*: The HCF of two numbers is 11 and their LCM is 693. If one of the numbers is 77, find the other.  
     *Sol*: Other number $= (11 \times 693) / 77 = 693 / 7 = 99$. **Ans: 99**
  4. *Q*: If a number $985x3678y$ is divisible by 72, find the value of $4x - 3y$.  
     *Sol*: Since it is divisible by 72, it must be divisible by 8 and 9. Divisibility by 8: $78y$ must be divisible by 8. $784 / 8 = 98$, so $y = 4$.  
     Divisibility by 9: Sum of digits $= 9+8+5+x+3+6+7+8+4 = 50 + x$. For $50 + x$ to be divisible by 9, $x = 4$.  
     Value of $4x - 3y = 4(4) - 3(4) = 4$. **Ans: 4**
  5. *Q*: Find the HCF of $2/3$, $8/9$, and $16/81$.  
     *Sol*: $\text{HCF} = \frac{\text{HCF of } 2, 8, 16}{\text{LCM of } 3, 9, 81} = \frac{2}{81}$. **Ans: 2/81**
* **Expected June 2026 Questions**:
  1. *Q*: What is the smallest number which when divided by 20, 25, 35, 40 leaves remainders 14, 19, 29, 34 respectively? **Ans: 1394**
  2. *Q*: Find HCF of 108, 288, 360. **Ans: 36**
  3. *Q*: If $8A514B$ is divisible by 88, find $A + B$. **Ans: 8**

---

### 9. Remainders
* **Concept Summary**: Remainder calculations involve finding what is left over after division. For large exponential powers, cyclicity of unit digits, Fermat's Little Theorem ($a^{p-1} \equiv 1 \pmod p$), and the Chinese Remainder Theorem (CRT) are used.
* **Real-world analogy**: A security guard making rounds every 45 minutes and calculating his exact minute offset.
* **Key Formulas**:
  $$\text{Fermat's Little Theorem: } a^{p-1} \pmod p = 1 \quad (\text{where } p \text{ is prime and } \gcd(a,p)=1)$$
  $$\text{Remainder of } (A \times B) / C = [(\text{Remainder of } A/C) \times (\text{Remainder of } B/C)] / C$$
* **Shortcut Tricks**:
  1. **Negative Remainders**: Instead of dividing 17 by 18 to get a remainder of 17, use $-1$ to simplify exponent calculations: $(-1)^{odd} = -1 \equiv 17$.
  2. **Euler's Totient Theorem**: For any coprimes $a$ and $n$, $a^{\phi(n)} \equiv 1 \pmod n$.
  3. **Pattern Finding (Cyclicity)**: Write out remainders of small powers to find the repeating pattern (periodicity).
* **30-Second Trick**: To find $2^{33} \pmod 9$: write as $(2^3)^{11} = 8^{11}$. Under mod 9, $8 \equiv -1$. So $(-1)^{11} = -1 \equiv 8$.
* **Common Errors**: Forgetting to convert a negative remainder back to a positive remainder by adding the divisor.
* **PYQ-style Questions**:
  1. *Q*: Find the remainder when $2^{31}$ is divided by 5.  
     *Sol*: By Fermat's theorem, $2^4 \equiv 1 \pmod 5$. $2^{31} = (2^4)^7 \times 2^3 \equiv 1^7 \times 8 \equiv 3 \pmod 5$. **Ans: 3**
  2. *Q*: Find the remainder when $7^{84}$ is divided by 342.  
     *Sol*: Note that $7^3 = 343 \equiv 1 \pmod{342}$. $7^{84} = (7^3)^{28} \equiv 1^{28} \equiv 1 \pmod{342}$. **Ans: 1**
  3. *Q*: Find the remainder when $3^{21}$ is divided by 5.  
     *Sol*: $3^4 \equiv 1 \pmod 5$. $3^{21} = (3^4)^5 \times 3^1 \equiv 1^5 \times 3 = 3$. **Ans: 3**
  4. *Q*: A number when divided by 5 leaves a remainder of 3. What is the remainder when the square of this number is divided by 5?  
     *Sol*: Let number be $5k + 3$. Square $= (5k+3)^2 = 25k^2 + 30k + 9$. Dividing by 5 leaves remainder of $9 \pmod 5 = 4$. **Ans: 4**
  5. *Q*: Find the remainder when $25^{102}$ is divided by 17.  
     *Sol*: $25 \equiv 8 \pmod{17}$. $8^2 = 64 \equiv -4 \pmod{17} \implies 8^4 \equiv 16 \equiv -1 \pmod{17} \implies 8^8 \equiv 1 \pmod{17}$.  
     Wait! By Fermat's theorem: $25^{16} \equiv 1 \pmod{17}$. $102 = 16 \times 6 + 6$. So $25^{102} \equiv 25^6 \pmod{17} \equiv 8^6 \pmod{17}$.  
     Since $8^2 \equiv 13 \equiv -4 \pmod{17}$, $8^6 \equiv (-4)^3 = -64 \pmod{17}$. $-64 \pmod{17} \implies -64 + 68 = 4$. **Ans: 4**
* **Expected June 2026 Questions**:
  1. *Q*: Find the remainder when $37^{100}$ is divided by 7. **Ans: 2**
  2. *Q*: Find the remainder of $19^{100} / 20$. **Ans: 1**
  3. *Q*: A number leaves a remainder of 5 when divided by 6, and 4 when divided by 5. Find the smallest such number. **Ans: 29**

---

### 10. Powers & Indices
* **Concept Summary**: This topic covers exponential expressions, base values, and finding the unit digit of large exponential expressions. The unit digit of any number raised to a power has a cyclic pattern of length 4.
* **Real-world analogy**: A digital counter that resets to zero after reaching its maximum capacity.
* **Key Formulas**:
  $$a^m \times a^n = a^{m+n} \quad | \quad (a^m)^n = a^{m \cdot n}$$
  $$\text{Cyclicity of } 2, 3, 7, 8 = 4 \quad | \quad \text{Cyclicity of } 4, 9 = 2 \quad | \quad \text{Cyclicity of } 0, 1, 5, 6 = 1$$
* **Shortcut Tricks**:
  1. **Unit Digit Shortcut**: Divide the exponent by 4. If remainder is $r$ (non-zero), unit digit is $\text{base}^r$. If remainder is 0, unit digit is $\text{base}^4$.
  2. **Comparing Exponents**: To compare $2^{300}$ and $3^{200}$, write as $(2^3)^{100} = 8^{100}$ and $(3^2)^{100} = 9^{100}$. Since $9 > 8$, $3^{200} > 2^{300}$.
  3. **Zero Exponent Rule**: Any non-zero base raised to the power of 0 is always 1.
* **30-Second Trick**: Finding the unit digit of $7^{98}$: Exponent $98 \pmod 4 = 2$. Unit digit is $7^2 = 49 \to 9$.
* **Common Errors**: When the exponent is a multiple of 4, incorrectly using an exponent of 0. If exponent $\pmod 4 = 0$, you must use the power 4.
* **PYQ-style Questions**:
  1. *Q*: Find the unit digit of $3^{65} \times 6^{59} \times 7^{71}$.  
     *Sol*: 
     * Exponent $65 \pmod 4 = 1 \implies 3^1 = 3$.
     * Exponent $59$ (base 6 has cyclicity 1) $\implies 6$.
     * Exponent $71 \pmod 4 = 3 \implies 7^3 = 343 \to 3$.
     * Product of unit digits $= 3 \times 6 \times 3 = 54 \to 4$. **Ans: 4**
  2. *Q*: Which is larger: $2^{400}$ or $5^{200}$?  
     *Sol*: $2^{400} = (2^2)^{200} = 4^{200}$. Since $5^{200} > 4^{200}$, $5^{200}$ is larger. **Ans: 5^200**
  3. *Q*: Find the unit digit of $23^{34} \times 28^{38}$.  
     *Sol*: For $3$, exponent $34 \pmod 4 = 2 \implies 3^2 = 9$. For $8$, exponent $38 \pmod 4 = 2 \implies 8^2 = 64 \to 4$. Product $= 9 \times 4 = 36 \to 6$. **Ans: 6**
  4. *Q*: Find the value of $n$ if $2^{n-1} + 2^{n+1} = 320$.  
     *Sol*: $2^{n-1}(1 + 2^2) = 320 \implies 2^{n-1}(5) = 320 \implies 2^{n-1} = 64 = 2^6 \implies n - 1 = 6 \implies n = 7$. **Ans: 7**
  5. *Q*: Find the unit digit of $(122)^{122} + (133)^{133}$.  
     *Sol*: For $2$, exponent $122 \pmod 4 = 2 \implies 2^2 = 4$. For $3$, exponent $133 \pmod 4 = 1 \implies 3^1 = 3$. Sum $= 4 + 3 = 7$. **Ans: 7**
* **Expected June 2026 Questions**:
  1. *Q*: Find the unit digit of $7^{105}$. **Ans: 7**
  2. *Q*: If $3^{x-y} = 27$ and $3^{x+y} = 243$, find $x$. **Ans: 4**
  3. *Q*: Find the unit digit of $2^{50} \times 3^{50}$. **Ans: 6**

---

### 11. Surds & Indices
* **Concept Summary**: Surds are irrational roots, and indices are power representations. TCS NQT tests the simplification of nested square roots, rationalization of denominators, and ordering of surds.
* **Real-world analogy**: Nesting dolls, where you must unpack terms layer by layer from the inside out.
* **Key Formulas**:
  $$\frac{1}{\sqrt{a} + \sqrt{b}} = \frac{\sqrt{a} - \sqrt{b}}{a - b} \quad (\text{Rationalization})$$
  $$\sqrt{x + 2\sqrt{y}} = \sqrt{a} + \sqrt{b} \quad (\text{where } a+b = x, a \cdot b = y)$$
* **Shortcut Tricks**:
  1. **Rationalization Trick**: Change the sign of the denominator and multiply it by the numerator, then divide by the difference of the squares of the terms.
  2. **Infinite Nested Surds**: $\sqrt{x + \sqrt{x + \sqrt{x \dots}}} = n+1$ where $x = n(n+1)$. If negative, it is $n$.
  3. **Ordering Surds**: Convert different root powers (e.g. square root, cube root) to fractional powers and make their denominators equal using LCM.
* **30-Second Trick**: To solve $\sqrt{12 + \sqrt{12 + \dots}}$, factor 12 into consecutive integers: $3 \times 4$. Since the sign is $+$, the answer is the larger factor, 4.
* **Common Errors**: Forgetting to apply the difference of squares $(a^2 - b^2)$ in the denominator during rationalization.
* **PYQ-style Questions**:
  1. *Q*: Simplify the expression: $\frac{1}{\sqrt{3} + \sqrt{2}}$.  
     *Sol*: Multiply numerator and denominator by $\sqrt{3} - \sqrt{2}$. $\frac{\sqrt{3} - \sqrt{2}}{3 - 2} = \sqrt{3} - \sqrt{2}$. **Ans: \sqrt{3} - \sqrt{2}**
  2. *Q*: Solve the value of $\sqrt{6 + \sqrt{6 + \sqrt{6 + \dots \infty}}}$.  
     *Sol*: $6 = 2 \times 3$. Since it is addition, the answer is the larger factor, 3. **Ans: 3**
  3. *Q*: Which is larger: $\sqrt[3]{3}$ or $\sqrt[4]{4}$?  
     *Sol*: $\sqrt[3]{3} = 3^{1/3} = 3^{4/12} = 81^{1/12}$. $\sqrt[4]{4} = 4^{1/4} = 4^{3/12} = 64^{1/12}$. Since $81 > 64$, $\sqrt[3]{3}$ is larger. **Ans: \sqrt[3]{3}**
  4. *Q*: Simplify $\sqrt{7 + 2\sqrt{10}}$.  
     *Sol*: We need two numbers whose sum is 7 and product is 10. They are 5 and 2. So the expression is $\sqrt{5} + \sqrt{2}$. **Ans: \sqrt{5} + \sqrt{2}**
  5. *Q*: Find the value of $\sqrt{20 - \sqrt{20 - \sqrt{20 \dots \infty}}}$.  
     *Sol*: $20 = 4 \times 5$. Since it is subtraction, the answer is the smaller factor, 4. **Ans: 4**
* **Expected June 2026 Questions**:
  1. *Q*: Simplify $\frac{2}{\sqrt{5} - \sqrt{3}}$. **Ans: \sqrt{5} + \sqrt{3}**
  2. *Q*: Find the value of $x$ if $5^{\sqrt{x}} + 12^{\sqrt{x}} = 13^{\sqrt{x}}$. **Ans: 4**
  3. *Q*: Arrange in ascending order: $\sqrt{2}, \sqrt[3]{3}, \sqrt[6]{6}$. **Ans: \sqrt[6]{6} < \sqrt{2} < \sqrt[3]{3}**

---

## 🎲 BLOCK C — MISCELLANEOUS

### 12. Permutations & Combinations (⭐)
* **Concept Summary**: Permutation represents the arrangement of items where order matters. Combination represents selection where order does not matter. TCS NQT frequently tests circular arrangements (e.g. seating around a table), letter arrangement with repeated characters (like the word *SUCCESS*), and selecting committees with gender constraints.
* **Real-world analogy**: Selecting lottery numbers (combination) versus assigning PIN codes (permutation).
* **Key Formulas**:
  $$P(n, r) = \frac{n!}{(n-r)!}$$
  $$C(n, r) = \frac{n!}{r!(n-r)!}$$
  $$\text{Circular Permutation} = (n-1)!$$
* **Shortcut Tricks**:
  1. **Repeating Letters**: Total arrangements of a word with length $L$ and repeating letter counts $a, b, c$ is $\frac{L!}{a! \cdot b! \cdot c!}$.
  2. **Vowels Together**: Treat all vowels as a single "mega-letter" to find arrangements, then multiply by the internal arrangements of the vowels.
  3. **Handshake Problem**: If $n$ people shake hands with each other, total handshakes $= C(n, 2) = \frac{n(n-1)}{2}$.
* **30-Second Trick**: Permutation is used when positions are distinct (e.g. President, Secretary). Combination is used when slots are identical (e.g. 3 committee members).
* **Common Errors**: Confusing Permutations and Combinations. If order of selection changes the outcome, use Permutations.
* **PYQ-style Questions**:
  1. *Q*: In how many ways can the letters of the word **LEADER** be arranged?  
     *Sol*: Word length $= 6$. E is repeated twice. Total ways $= 6! / 2! = 720 / 2 = 360$. **Ans: 360**
  2. *Q*: In how many ways can a committee of 3 members be selected from 5 men and 4 women such that it contains at least 2 men?  
     *Sol*: Case 1: 2 Men and 1 Woman $= C(5,2) \times C(4,1) = 10 \times 4 = 40$.  
     Case 2: 3 Men and 0 Women $= C(5,3) \times C(4,0) = 10 \times 1 = 10$.  
     Total ways $= 40 + 10 = 50$. **Ans: 50**
  3. *Q*: How many diagonals can be drawn in a decagon (10-sided polygon)?  
     *Sol*: Number of diagonals $= C(n, 2) - n = C(10, 2) - 10 = 45 - 10 = 35$. **Ans: 35**
  4. *Q*: In how many ways can 6 people be seated around a circular table?  
     *Sol*: Circular permutation $= (6-1)! = 5! = 120$. **Ans: 120**
  5. *Q*: In how many ways can the letters of the word **DETAIL** be arranged such that vowels occupy only odd positions?  
     *Sol*: Vowels: E, A, I (3). Consonants: D, T, L (3). Positions: 1, 2, 3, 4, 5, 6. Odd positions: 1, 3, 5 (3 slots).  
     Ways to place vowels in 3 odd slots $= 3! = 6$. Ways to place consonants in remaining slots $= 3! = 6$. Total $= 6 \times 6 = 36$. **Ans: 36**
* **Expected June 2026 Questions**:
  1. *Q*: How many words can be formed from the letters of **MATHEMATICS**? **Ans: 4989600**
  2. *Q*: In a group of 15 people, everyone shakes hands with everyone else once. How many handshakes? **Ans: 105**
  3. *Q*: Out of 7 consonants and 4 vowels, how many words of 3 consonants and 2 vowels can be formed? **Ans: 25200**

---

### 13. Probability (⭐)
* **Concept Summary**: Probability is the measure of the likelihood of an event occurring. In TCS NQT, this includes basic coin/dice/card probability, conditional probability (e.g. probability of $A$ given $B$), and independent events (e.g. shooting targets).
* **Real-world analogy**: A weather forecast predicting rain based on humidity levels.
* **Key Formulas**:
  $$P(A) = \frac{\text{Favorable Outcomes}}{\text{Total Outcomes}}$$
  $$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$
  $$P(A|B) = \frac{P(A \cap B)}{P(B)} \quad (\text{Conditional Probability})$$
* **Shortcut Tricks**:
  1. **At Least One Shortcut**: $P(\text{at least one event}) = 1 - P(\text{none of the events})$.
  2. **Two Dice Sum**: Memorize the frequency of sums: Sum of 7 is most common (6 ways), Sum of 2 or 12 is least common (1 way).
  3. **Complementary Probability**: If $P(A)$ is the probability of success, $1 - P(A)$ is the probability of failure.
* **30-Second Trick**: When drawing multiple items without replacement, multiply individual probabilities step-by-step. E.g., draw 2 red from 5 red and 5 blue: $\frac{5}{10} \times \frac{4}{9} = \frac{2}{9}$.
* **Common Errors**: Adding probabilities of independent events instead of multiplying them. If events $A$ and $B$ are independent, $P(A \cap B) = P(A) \times P(B)$.
* **PYQ-style Questions**:
  1. *Q*: Two dice are thrown simultaneously. What is the probability that the sum of numbers is 7?  
     *Sol*: Total outcomes $= 36$. Favorable outcomes (sum=7): $(1,6), (2,5), (3,4), (4,3), (5,2), (6,1) \implies 6$ outcomes. Probability $= 6/36 = 1/6$. **Ans: 1/6**
  2. *Q*: A card is drawn from a well-shuffled pack of 52 cards. What is the probability of getting a queen of club or king of heart?  
     *Sol*: Total queens of clubs $= 1$. Total kings of hearts $= 1$. Total favorable $= 2$. Probability $= 2/52 = 1/26$. **Ans: 1/26**
  3. *Q*: A and B solve a problem independently. The probability that A solves it is $1/2$ and B solves it is $1/3$. Find the probability that the problem is solved.  
     *Sol*: Probability that neither solves it $= (1 - 1/2) \times (1 - 1/3) = 1/2 \times 2/3 = 1/3$. Probability that it is solved $= 1 - 1/3 = 2/3$. **Ans: 2/3**
  4. *Q*: A bag contains 4 red, 5 green, and 6 blue balls. Three balls are drawn at random. What is the probability that they are of different colors?  
     *Sol*: Total balls $= 15$. Total ways to draw 3 balls $= C(15, 3) = \frac{15 \times 14 \times 13}{6} = 455$. Favorable ways $= 4 \times 5 \times 6 = 120$. Probability $= 120/455 = 24/91$. **Ans: 24/91**
  5. *Q*: What is the probability that a leap year selected at random contains 53 Sundays?  
     *Sol*: Leap year has 366 days $= 52$ weeks $+ 2$ days. The remaining 2 days can be: (Mon, Tue), (Tue, Wed), (Wed, Thu), (Thu, Fri), (Fri, Sat), (Sat, Sun), (Sun, Mon). Out of 7 combinations, 2 contain Sunday. Probability $= 2/7$. **Ans: 2/7**
* **Expected June 2026 Questions**:
  1. *Q*: Three coins are tossed. Find the probability of getting at least two heads. **Ans: 1/2**
  2. *Q*: A card is drawn from a deck. Find the probability that it is a spade or an ace. **Ans: 4/13**
  3. *Q*: The probability of rain on Monday is 0.6, and on Tuesday is 0.3. Find the probability that it rains on at least one day. **Ans: 0.72**

---

### 14. Data Interpretation
* **Concept Summary**: Data Interpretation (DI) involves reading data presented in Tables, Bar Charts, Line Graphs, or Pie Charts, and answering questions based on averages, percentages, and ratios. Under the tight time constraints of the TCS NQT, speed is crucial.
* **Real-world analogy**: A business manager reviewing quarterly performance charts to identify sales growth trends.
* **Key Formulas**:
  $$\text{Percentage Growth} = \frac{\text{Value}_{\text{New}} - \text{Value}_{\text{Old}}}{\text{Value}_{\text{Old}}} \times 100$$
  $$\text{Ratio of Category A to B} = \frac{\text{Value}_A}{\text{Value}_B}$$
* **Shortcut Tricks**:
  1. **Visual Approximations**: Use visual estimation to eliminate options without doing precise arithmetic calculations.
  2. **Unit Digit Calculations**: In complex summations, sum the unit digits to match with the correct option.
  3. **Rounding Off**: Round numbers to the nearest tens or hundreds (e.g. convert 247 to 250) to make divisions faster.
* **30-Second Trick**: Read the question *first* before analyzing the chart, so you know exactly which data rows/columns to extract.
* **Common Errors**: Reading the wrong row, column, or scale (e.g. confusing millions with thousands, or reading 2021 data instead of 2022).
* **PYQ-style Questions**:
  1. *Q*: (Based on a Table showing Sales of 4 Companies over 3 Years):
     ```
     Company | Year 1 | Year 2 | Year 3
     A       |  100   |  120   |  150
     B       |  200   |  220   |  210
     ```
     Find the percentage growth of Company A from Year 1 to Year 3.  
     *Sol*: Growth $= \frac{150 - 100}{100} \times 100 = 50\%$. **Ans: 50**
  2. *Q*: (Based on the same Table): What is the ratio of total sales of Company A to Company B over the three years?  
     *Sol*: Total A $= 100 + 120 + 150 = 370$. Total B $= 200 + 220 + 210 = 630$. Ratio $= 370:630 = 37:63$. **Ans: 37:63**
  3. *Q*: A pie chart shows expenditures of a family on Food ($30\%$), Rent ($25\%$), Education ($20\%$), and Savings ($25\%$). If total income is ₹50,000, find the expenditure on Rent.  
     *Sol*: Rent $= 25\%$ of $50,000 = ₹12,500$. **Ans: 12500**
  4. *Q*: A bar graph shows the production of cars in thousands over 3 years: 2021 (45), 2022 (55), 2023 (65). Find the average production over these 3 years.  
     *Sol*: Average $= (45 + 55 + 65) / 3 = 165 / 3 = 55$ thousand. **Ans: 55000**
  5. *Q*: A line graph shows the export values of a company: 2021 (150 crore) and 2022 (180 crore). Find the percentage increase.  
     *Sol*: Increase $= \frac{180 - 150}{150} \times 100 = \frac{30}{150} \times 100 = 20\%$. **Ans: 20**
* **Expected June 2026 Questions**:
  1. *Q*: If the ratio of imports to exports in 2024 is $4:5$ and exports are ₹200 crore, find imports. **Ans: 160**
  2. *Q*: A pie chart shows a sector of angle $72^\circ$. What percentage of the total does this sector represent? **Ans: 20**
  3. *Q*: Total sales of a store in five months are 6400, 6900, 6800, 7200, 6500. Find the average sales. **Ans: 6760**

---

## 💤 Top 10 Formulas to Memorize Before Sleep

1. **Successive Percentage Change**:
   $$\text{Net Change} = x + y + \frac{xy}{100}$$
2. **Compound Interest Difference (2 Years)**:
   $$CI - SI = P\left(\frac{R}{100}\right)^2$$
3. **Compound Interest Difference (3 Years)**:
   $$CI - SI = P\left(\frac{R}{100}\right)^2 \left(3 + \frac{R}{100}\right)$$
4. **Average Speed (Equal Distance)**:
   $$\text{Average Speed} = \frac{2xy}{x+y}$$
5. **Time & Work Work equivalence**:
   $$\frac{M_1 D_1 H_1}{W_1} = \frac{M_2 D_2 H_2}{W_2}$$
6. **Faulty Weight Profit Percentage**:
   $$\text{Profit \%} = \frac{\text{Error}}{\text{True Weight} - \text{Error}} \times 100$$
7. **Arithmetic Progression Sum**:
   $$S_n = \frac{n}{2}[2a + (n-1)d]$$
8. **Geometric Progression Sum (Infinite)**:
   $$S_\infty = \frac{a}{1 - r} \quad (|r| < 1)$$
9. **Polygon Diagonals**:
   $$\text{Number of Diagonals} = \frac{n(n-3)}{2}$$
10. **Fermat's Little Theorem**:
    $$a^{p-1} \equiv 1 \pmod p \quad (\text{if } p \text{ is prime})$$
